Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A082CC61F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 20:04:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42977.77333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkXPZ-0005jl-1N; Wed, 02 Dec 2020 19:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42977.77333; Wed, 02 Dec 2020 19:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkXPY-0005jM-UM; Wed, 02 Dec 2020 19:03:32 +0000
Received: by outflank-mailman (input) for mailman id 42977;
 Wed, 02 Dec 2020 19:03:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kkXPX-0005jH-E2
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 19:03:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkXPU-0000zm-DC; Wed, 02 Dec 2020 19:03:28 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkXPU-0002Mw-3W; Wed, 02 Dec 2020 19:03:28 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=T432UGitHsRICyXBtYhUNS3QUhL8d5TafwM77KhXsGQ=; b=Z7GrOVkr3clPfUxXianyTNk/R/
	wUuVDDZ2ZcEYWxpGhFcYUOsJdLBY0XN+vRRyrdEu4nmDwn5cFKh30oiARuc7+cYagFxGPfI7NLZlD
	Pq/5WTbjitNbfMQo/i+pCYQDIhu4rRywhvbo9iLQ+iiZGWGfgiAMT3l+rW3xuHvow/J8=;
Subject: Re: [PATCH v3 1/5] evtchn: drop acquiring of per-channel lock from
 send_guest_{global,vcpu}_virq()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d709a9c3-dbe2-65c6-2c2f-6a12f486335d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <70170293-a9a7-282a-dde6-7ed73fc2da48@xen.org>
Date: Wed, 2 Dec 2020 19:03:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <d709a9c3-dbe2-65c6-2c2f-6a12f486335d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/11/2020 13:28, Jan Beulich wrote:
> The per-vCPU virq_lock, which is being held anyway, together with there
> not being any call to evtchn_port_set_pending() when v->virq_to_evtchn[]
> is zero, provide sufficient guarantees. 

I agree that the per-vCPU virq_lock is going to be sufficient, however 
dropping the lock also means the event channel locking is more complex 
to understand (the long comment that was added proves it).

In fact, the locking in the event channel code was already proven to be 
quite fragile, therefore I think this patch is not worth the risk.

Cheers,

-- 
Julien Grall

