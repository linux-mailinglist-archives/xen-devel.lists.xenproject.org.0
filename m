Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F997EB814
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 22:01:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633261.987904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r30XH-0008Bn-Aw; Tue, 14 Nov 2023 21:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633261.987904; Tue, 14 Nov 2023 21:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r30XH-0008A7-87; Tue, 14 Nov 2023 21:01:27 +0000
Received: by outflank-mailman (input) for mailman id 633261;
 Tue, 14 Nov 2023 21:01:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r30XG-0008A1-1Q
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 21:01:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r30XF-0007ae-9b; Tue, 14 Nov 2023 21:01:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r30XF-0004mB-3H; Tue, 14 Nov 2023 21:01:25 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=KVBcoGojyrDC/INoAngNArSjCuUc6kcnu33DKKRl+/A=; b=ORCQdOpP9nIpEwpyuLjiHI6rgT
	1+jg4YYcDdwq/BzANYCgh+wLG86CfnSeIRn8LX+5RHUES2R781f710zdBEEQ9kMhmA8lIwuoT+a7e
	+8JyqJtgV1rv9gyy6sCB0/jkQ3NKXzvrbVXA7sbhxN3EVw58AzcRjaksqtE0JMmRxKrg=;
Message-ID: <b0b4f6d8-75b4-4256-a9e2-0a9fdee81f33@xen.org>
Date: Tue, 14 Nov 2023 21:01:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] tools/xenstored: remove "-V" command line option
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231113124309.10862-1-jgross@suse.com>
 <20231113124309.10862-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231113124309.10862-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 13/11/2023 12:43, Juergen Gross wrote:
> The "-V" (verbose) command line option is nearly completely redundant
> with "io" tracing. Just the time of the printed data is a little bit
> different, while the tracing is more informative.

The current position of trace_io() is a bit annoying in write_messages() 
because it will only be called once the message has been fully written 
to the ring. Can we consider adding a trace_*() when we are about to 
write? (Or maybe queue the message?)


In any case, I think it is odd to enable verbose and tracing separately. 
So with or without:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

