Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51521510076
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 16:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313958.531783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njMBl-0008Sw-O5; Tue, 26 Apr 2022 14:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313958.531783; Tue, 26 Apr 2022 14:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njMBl-0008PT-KQ; Tue, 26 Apr 2022 14:29:13 +0000
Received: by outflank-mailman (input) for mailman id 313958;
 Tue, 26 Apr 2022 14:29:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njMBk-0008PN-DG
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 14:29:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njMBk-0006Gt-2o; Tue, 26 Apr 2022 14:29:12 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.15.135]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njMBj-00085q-T7; Tue, 26 Apr 2022 14:29:12 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:
	MIME-Version:Date:Message-ID; bh=jw5zm+ekx7e9OO3oJJ/BOJGfx66IPecbc828Mg2vnQw=
	; b=Fw75YzsWHiADtHGk1tvUPOhYTurm1Tv6RwBWby0FNsITLX9Q1Q1ulswRVT5y34KbIVYiym2MS
	B8xqwXO7W7EitL3ClPEhdulHEItV6s0f/IeGFdvxoUTb5iSI5f1FP4CowoabkOX00C8KFhv4JFDcX
	WjEO9Ccv7QfbSk0WURdqg=;
Message-ID: <e57eae94-6b25-0425-12f0-c09d1233e27a@xen.org>
Date: Tue, 26 Apr 2022 15:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul@xen.org>
From: Julien Grall <julien@xen.org>
Subject: Potential race between shutting down a domain and handling I/O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

While looking at the I/O handling code, I noticed that hvmemul_do_io() 
contains the following code:

  333             rc = ioreq_send(s, &p, 0);
  334             if ( rc != X86EMUL_RETRY || currd->is_shutting_down )
  335                 vio->req.state = STATE_IOREQ_NONE;

Looking at history [1], it looks like the second part was added to cover 
the case the I/O was not handled because the domain is shutdown down 
(i.e. vcpu_start_shutdown_deferral() returned false).

However, I think, it would be possible that the request to shutdown 
happens *after* vcpu_start_shutdown_deferral() returns true. In which 
case, we would set the state of the I/O to NONE. It is not clear to me 
what could go wrong, but from the commit message it looks like this 
wasn't the intended behavior as the I/O would have been sent to the IOREQ.

For completeness, I think a similar issue would happen in handle_pio(). 
We would end up to re-emulate the I/O which may have side-effect (?).

Note that the race is tiny and I haven't been able to reproduce it so 
far. Can someone confirm my understanding?

If there are a bug, then I am thinking to extend hvm_vcpu_io to indicate 
whether the I/O handling was deferred. Any other suggestion?

Cheers,

[1] 
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=0c0cbf72cf9f28070cc5d49955b0a00df5c1d114;hp=d1370961810d3b1630e0ad5e28e5cfc8dcfe2b9b

-- 
Julien Grall

