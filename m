Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324C74E9ABB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 17:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295490.502847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYr2M-0004NZ-2g; Mon, 28 Mar 2022 15:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295490.502847; Mon, 28 Mar 2022 15:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYr2L-0004LI-Us; Mon, 28 Mar 2022 15:12:05 +0000
Received: by outflank-mailman (input) for mailman id 295490;
 Mon, 28 Mar 2022 15:12:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=adjj=UH=gmail.com=dpsmith.dev@srs-se1.protection.inumbo.net>)
 id 1nYr2K-0004LC-JI
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 15:12:04 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c01b9a7-aea9-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 17:12:03 +0200 (CEST)
Received: by mail-qt1-x82a.google.com with SMTP id a11so12566427qtb.12
 for <xen-devel@lists.xenproject.org>; Mon, 28 Mar 2022 08:12:03 -0700 (PDT)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2]) by smtp.gmail.com with ESMTPSA id
 s13-20020a05620a0bcd00b0067afe7dd3ffsm8453927qki.49.2022.03.28.08.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 08:12:01 -0700 (PDT)
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
X-Inumbo-ID: 6c01b9a7-aea9-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ajr0dYea+pYNR6w6Xu7EcT1vcVyRpE7uc3a2Zctr5bo=;
        b=oviQKcUAx7GAzf0fPE+lvDfxya4Hz/dQLNEM2BXUFNk4fhB4qBfcBpE0AuvICvQ8LK
         hQcgEsqwrEPngiCu8IPY6CVVCLpP7hL33EUSzVHHzhQp9ZM8k16b7nsKs0WrYR6KUguI
         pj/1hK2Z61GXfyY780Sz3QjlC2JJJ3L8he/ogubtjKACNJx/0Mnm+iOJ6vCjG3B6yhjA
         a28Cma0g95P6Kh1tLifjgMfJkABlPeAX/UMJI0Iyr5gYkZFpZt+w7uKnKh9FO9dbi0TK
         u3CDQ6WaT5ecafiJ1+mAnULBIHF25E4YG4kvzuRXRI6XktJbmZUd/2C8387SFRqabYbb
         HgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ajr0dYea+pYNR6w6Xu7EcT1vcVyRpE7uc3a2Zctr5bo=;
        b=RDx7tphuaOEL6vVqmkLbdcUK5Q0BB14JSll+F4jb3pSBoS2fBqpHsvQEtIHOekB14+
         HjE3yhUtcYXryoQgidrdUks73w2Ugr7Irv/kBT6Yswlgu6vAZ8ndtcPb5+PImnTxifT2
         xwe+AYWGH7rR5TWcFNcvUZcUP4IhtrlIpXX+/2qbLBlWbWt6DYcNyHfAfgi3+LcBaiMP
         Ali1CzU/eqIAp/uYkMJcB4at3V6u2cPj9dMZ6RC34DcKyuBjF7P87En+SzKtPJRHXzM8
         lXP3OfHKk092PVmvHIW+EVPj6IEhNl1E9kZ2620WTzfnqmUcmZ1FT2YbZ3I5j9qW3M0y
         xxfw==
X-Gm-Message-State: AOAM532x/DZxRB404xs6Kl5sD7oQqt6Ohv09/LEmvHnJwMc9qLoKLyDC
	jDppYZoboeked/JeRax364s=
X-Google-Smtp-Source: ABdhPJz/dvxy+KeAMn9l0PbQy0Qg1DDbmcXHyfr3M0fqf40+wb8T/JPkJWzAMmgreLFisNcwL3A9Ug==
X-Received: by 2002:a05:622a:513:b0:2eb:871f:cd66 with SMTP id l19-20020a05622a051300b002eb871fcd66mr244462qtx.434.1648480322009;
        Mon, 28 Mar 2022 08:12:02 -0700 (PDT)
Message-ID: <db05165f-1998-36bb-7b4d-a6a1e89d1bae@gmail.com>
Date: Mon, 28 Mar 2022 11:11:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-2-sstabellini@kernel.org>
 <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com>
 <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
 <c57dc9a9-e2ca-74c6-4fde-e2a6f1400de5@suse.com>
 <alpine.DEB.2.22.394.2203241522510.2910984@ubuntu-linux-20-04-desktop>
 <da700983-759b-2de6-9c36-0d09c6b06c0d@xen.org>
 <alpine.DEB.2.22.394.2203251313350.2910984@ubuntu-linux-20-04-desktop>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2203251313350.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/25/22 17:05, Stefano Stabellini wrote:
> On Fri, 25 Mar 2022, Julien Grall wrote:
>> So to me, the idea of switching to a "fake" domain or bypassing the check is
>> more appealing. I have a preference for the "fake" domain here.
> 
> As a maintainer, I am not opposed to the "fake"/"contructor" domain
> concept.  It all depends on how many instances of this issue we are
> going to have.  This is the only one on xen-devel so far. I don't think
> it is worth adding a constructor domain for one instance only.  But I
> agree with you and Daniel that if we end up with several instances, then
> the constructor domain approach is probably the best option overall.

The constructor domain still needs more discussion and would likely be
part of a larger approach that will require buy-in from several
maintainers and should be looking to solve a more general problem
internal access control of which domain construction within the
hypervisor is just one case. For this I would be glad to start a working
group, for which the start of can add to the next community call agenda.

> As a contributor, sadly I won't be able to spend a lot of time on this
> in the following months. If a significant rework is required, I don't
> think I'll be able to do it, at least not for this Xen release (and it
> would be nice to have dom0less PV drivers in the coming release.) If
> Daniel is willing, I could add his "idle_domain is_priv" patch to this
> series.  Not as clean as a proper constructor domain but it would work
> and it would be simple. It could be evolved into a nicer constructor
> domain later.
> 
> This is not my preference but I could do that if Julien and Jan prefer
> this approach and if Daniel is happy to share his patch.

I can look to spin out a general version of what I am doing, likely
exposed as an XSM call so it can be handled appropriately across policies.

>> AFAIU, your proposal is to duplicate code. This brings other risks such as
>> duplicated bug and more code to maintain.
> 
> Got it. I'll make one last attempt at a proposal that doesn't involve
> the fake constructor domain. The goal is to avoid code duplication while
> providing a safe way forward to make progress with only a small amount
> of changes. What if we:
> 
> - rename evtchn_alloc_unbound to _evtchn_alloc_unbound (still static)
> - add a skip_xsm parameter to _evtchn_alloc_unbound
> - introduce a wrapper evtchn_alloc_unbound that always set skip_xsm to
>   false (same interface as today's evtchn_alloc_unbound)
> - introduce an __init early_evtchn_alloc_unbound public function that
>   sets skip_xsm to true
> 
> This way:
> - we have a single implementation in _evtchn_alloc_unbound (no code
>   duplication)
> - the only function exposed that skips the XSM check is __init
> - evtchn_alloc_unbound continue to have the XSM check same as today
> 
> 
> E.g.:
> static int _evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool skip_xsm)
> {
>     ...
> }
> 
> static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> {
>     return _evtchn_alloc_unbound(alloc, false);    
> }
> 
> int __init early_evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> {
>     return _evtchn_alloc_unbound(alloc, true);
> }
> 
> 
> Would this be good enough for now?

I guest the question is if it is okay for this to exist until the new
XSM calls are found to be acceptable and then this is reverted/changed
to the XSM calls?

v/r
dps

