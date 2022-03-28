Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A27D14E9C66
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 18:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295541.502991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYsNx-0002ti-KH; Mon, 28 Mar 2022 16:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295541.502991; Mon, 28 Mar 2022 16:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYsNx-0002qi-GD; Mon, 28 Mar 2022 16:38:29 +0000
Received: by outflank-mailman (input) for mailman id 295541;
 Mon, 28 Mar 2022 16:38:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=adjj=UH=gmail.com=dpsmith.dev@srs-se1.protection.inumbo.net>)
 id 1nYsNw-0002q9-0v
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 16:38:28 +0000
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dcd92d1-aeb5-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 18:38:27 +0200 (CEST)
Received: by mail-qt1-x82a.google.com with SMTP id s11so12859707qtc.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Mar 2022 09:38:27 -0700 (PDT)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2]) by smtp.gmail.com with ESMTPSA id
 x20-20020ac85f14000000b002e1ee1c56c3sm13234221qta.76.2022.03.28.09.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 09:38:25 -0700 (PDT)
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
X-Inumbo-ID: 7dcd92d1-aeb5-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lJLK+tB0ni0ja4j9Yr/gTepZKHNAR1orKeHG5e5VqQE=;
        b=NmisP1LW7TDrC+FAzA6UBpS5bC9hHSJusxGT1AEGDVA5NFeJuI631j58lDcZkXZpeo
         +8ZwNsLwlu00QKsoHslmTzI7l98IYuz/QkulkRbklbV50BOcKC5gpJA3T5mdTMC9P6X9
         ZhUCQRVeTvyjHLanVmUWZF4GQSnlXpZUA9DkB0aPAei9y9iAFQ0cyd2NaBq221hlGGXH
         JnJYuP/ffLXhj2bVI39e70aBXvaCI5wjHpOKc0diV99wR0+upxbPpKvHmY7J5UQcFUOe
         INnokG7Oe7ov/rtoyAFZKn6wWv92GSPszU/9DsplyW5/kyC/cztSMZJtwEtnar77R4QY
         lREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lJLK+tB0ni0ja4j9Yr/gTepZKHNAR1orKeHG5e5VqQE=;
        b=Ovu1z8v1xPOoNjA20RRlYutCbtuWAEqJiKHHTk/YdsxMwJDrzQDs9jfJ0ikfjn1D5t
         BsNK0OhWPt9mTJmzwSsoIRRrd7vwWtevTELPUdk/8n2uUAoAWWpbIr0rvyLr8jIb0d5y
         oaTpk8SIvVy/U+/7XqjqOheyUOehHTVFjKqC8ohPfY/fXrB+xVmy6TsVEUqiwIWH0o3y
         YpIRzg2jUQhM0WRcLcQxOQT0UzRKKJy//SfFFY/7ujbu+lYgm3GTenHUIANWjEMhZUFo
         cFjMn3lWCLH7BKz3UcQAyYwRJzZxNphhhGCZhwI7ymuHdy4hodha5r/1N6y1OpkIUg/t
         HK7Q==
X-Gm-Message-State: AOAM530H2tGPRUtLw0oM2D4Df0SuwYHh+9uHGznXjPSznSn1C8FBNI1u
	2e1bn+zO8JxCQYq09dKSUEA=
X-Google-Smtp-Source: ABdhPJwaNmbxe6gpW8UI9Zdbvc0WBXkyz1NoLUOzxYn6m6mr4JbeWsbcQLqqvvX3dinxCVQhA5Q/vQ==
X-Received: by 2002:ac8:5e4c:0:b0:2e2:2bbf:57fa with SMTP id i12-20020ac85e4c000000b002e22bbf57famr22146507qtx.278.1648485505902;
        Mon, 28 Mar 2022 09:38:25 -0700 (PDT)
Message-ID: <efb76b14-59a1-0e26-d0ae-2e3ba7bd29f3@gmail.com>
Date: Mon, 28 Mar 2022 12:38:10 -0400
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
> 
> 
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
> 
> 
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

Please see the RFC patch I just posted[1], IMHO I think this is a safer
approach for this specific instance.

[1]
https://lore.kernel.org/xen-devel/20220328203622.30961-1-dpsmith@apertussolutions.com/T/#t

v/r,
dps

