Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FFC2F0165
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 17:15:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64217.113604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyGsn-0007yq-0a; Sat, 09 Jan 2021 16:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64217.113604; Sat, 09 Jan 2021 16:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyGsm-0007yR-Te; Sat, 09 Jan 2021 16:14:28 +0000
Received: by outflank-mailman (input) for mailman id 64217;
 Sat, 09 Jan 2021 16:14:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kyGsk-0007yM-Uy
 for xen-devel@lists.xenproject.org; Sat, 09 Jan 2021 16:14:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyGsi-0003an-1p; Sat, 09 Jan 2021 16:14:24 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyGsh-00034v-Q2; Sat, 09 Jan 2021 16:14:23 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=IX9Pe2BpO2UIH7ROxRTJg9jgfarD2AZjsugNC6Q7OxU=; b=xCaPz43/QESGkqWO645OeOEJ2m
	1ZLqRqdLHsVVoGdXEcxo52u5sn9+kK1Zzg9OQaD+6ZO0mEgDPgaNTtgqrGOfxrEwL0sKyb/1WKuI2
	X+lXfyzItBVgEnNDiv0EUQu1jHYDpFElidZfdrzc4zPRMtMTGQmNc6No+VeQ7YZC0LJ0=;
Subject: Re: [PATCH v4 02/10] evtchn: bind-interdomain doesn't need to hold
 both domains' event locks
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
 <8b21ff13-d6ea-3fa5-8d87-c05157112e4b@suse.com>
 <ab03e9a4-5c5f-347f-f084-f587b95794e5@xen.org>
Message-ID: <00f5f88e-5fa5-495a-520d-ba2221b8276b@xen.org>
Date: Sat, 9 Jan 2021 16:14:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ab03e9a4-5c5f-347f-f084-f587b95794e5@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 09/01/2021 15:41, Julien Grall wrote:
> Hi Jan,
> 
> On 05/01/2021 13:09, Jan Beulich wrote:
>> The local domain's lock is needed for the port allocation, but for the
>> remote side the per-channel lock is sufficient. The per-channel locks
>> then need to be acquired slightly earlier, though.
> 
> I was expecting is little bit more information in the commit message 
> because there are a few changes in behavior with this change:
> 
>   1) AFAICT, evtchn_allocate_port() rely on rchn->state to be protected 
> by the rd->event_lock. Now that you dropped the rd->event_lock, 
> rchn->state may be accessed while it is updated in 
> evtchn_bind_interdomain(). The port cannot go back to ECS_FREE here, but 
> I think the access needs to be switched to {read, write}_atomic() or 
> ACCESS_ONCE.
> 
>    2) xsm_evtchn_interdomain() is now going to be called without the 
> rd->event_lock. Can you confirm that the lock is not needed by XSM?

Actually, I think there is a bigger issue. evtchn_close() will check 
chn1->state with just d1->event_lock held (IOW, there chn1->lock is not 
held).

If the remote domain happen to close the unbound port at the same time 
the local domain bound it, then you may end up in the following situation:


evtchn_bind_interdomain()        | evtchn_close()
                                  |
                                  |  switch ( chn1->state )
                                  |  case ECS_UNBOUND:
                                  |      /* nothing to do */
    double_evtchn_lock()          |
    rchn->state = ECS_INTERDOMAIN |
    double_evtchn_unlock()        |
                                  |  evtchn_write_lock(chn1)
                                  |  evtchn_free(d1, chn1)
                                  |  evtchn_write_unlock(chn1)

When the local domain will try to close the port, it will hit the 
BUG_ON(chn2->state != ECS_INTERDOMAIN) because the remote port were 
already freed.

I think this can be solved by acquiring the event lock earlier on in 
evtchn_close(). Although, this may become a can of worms as it would be 
more complex to prevent lock inversion because chn1->lock and chn2->lock.

Cheers,

-- 
Julien Grall

