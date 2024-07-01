Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C06C91DDA0
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 13:14:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751493.1159479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOEyg-0004Rv-Bf; Mon, 01 Jul 2024 11:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751493.1159479; Mon, 01 Jul 2024 11:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOEyg-0004QS-92; Mon, 01 Jul 2024 11:13:46 +0000
Received: by outflank-mailman (input) for mailman id 751493;
 Mon, 01 Jul 2024 11:13:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFf9=OB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sOEye-0004QM-3s
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 11:13:44 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8e19d5b-379a-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 13:13:41 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-44639872fd4so22747581cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 04:13:41 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4465149beafsm30108801cf.74.2024.07.01.04.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 04:13:40 -0700 (PDT)
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
X-Inumbo-ID: f8e19d5b-379a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719832420; x=1720437220; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zfh0Vje5EhtXUwiUR0sYJwb4Nms0c5JIBo7Os/ZHbpQ=;
        b=AtCebFMzz1YBiel2ygceiS+UZCzXIQMxaRuU54ioxkim63vE9bBNYXck1ZtcrmyTnK
         thMMsfZEJnhxqhM8mKvEk4bm+9Z+PHIjig388TP1ypQIlgCvXf9Mgll3ImbYHE9t3hvi
         QUh4w79oIfWtsodG8AoJuiNlHHVhD11uldB84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719832420; x=1720437220;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zfh0Vje5EhtXUwiUR0sYJwb4Nms0c5JIBo7Os/ZHbpQ=;
        b=Bk+KF8bsggWcjrsqMi525I1jgMzG+URMkM9IzspCIVkLyZZ171YbPUxWsLDIhw2An+
         2JeR306FfInFZJk8jJdFyK661FtLTszyvc/P3WCPLj3ACK2pN3AGYC58ApyI1MTVWXu7
         1GHMsZHtyuvTlY4cY3zIUfI0YFuqx/ZGnY/9Pr5uqrs94lmK0DFBHYmIcdAoQlXUvy7r
         Eqt0pnieNPS4bakkAEb2jM5s22xZIVN97VHwiXxaXu/plgvkaWspqaFUV0dFADTTFQV/
         omm1Q1se0eOrLERdugod85tNlUVNZe8Us1WW3YzXrCOS9NSuop9mYgnUhw7JH6H5qiix
         FuyA==
X-Gm-Message-State: AOJu0YzC5/cFkRdowEibxtlRgU4cjrts3h5Np1Z7zxTjdHjeUaVho8rv
	vRYiTeL3XZwP7Cg0Fb6Kj67yWIWE+MZAJvT9iB3AAXSPkadjSdNq3NkpAw3wF0E=
X-Google-Smtp-Source: AGHT+IEZEVIzlx87eEmP6qKbxEFZuZB1a4bgWTYXD5ukTRwGldCkpSfZiigidpjlj32UOwmYo2RG6A==
X-Received: by 2002:a05:622a:1a86:b0:445:32b:df03 with SMTP id d75a77b69052e-44662e03e50mr56752561cf.33.1719832420533;
        Mon, 01 Jul 2024 04:13:40 -0700 (PDT)
Date: Mon, 1 Jul 2024 13:13:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/3] pirq_cleanup_check() leaks
Message-ID: <ZoKPUotSg4HOlRzJ@macbook>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
 <5641f8eb-5736-8ccc-122b-b3b47c1bac28@suse.com>
 <ZoJu3jcsiCWwOhBl@macbook>
 <7d51b6b7-affb-46fd-98dc-b54d3842f6c2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d51b6b7-affb-46fd-98dc-b54d3842f6c2@suse.com>

On Mon, Jul 01, 2024 at 11:47:34AM +0200, Jan Beulich wrote:
> On 01.07.2024 10:55, Roger Pau Monné wrote:
> > On Thu, Jul 27, 2023 at 09:38:29AM +0200, Jan Beulich wrote:
> >> Its original introduction had two issues: For one the "common" part of
> >> the checks (carried out in the macro) was inverted.
> > 
> > Is the current logic in evtchn_close() really malfunctioning?
> 
> First: I'm getting the impression that this entire comment doesn't relate
> to the part of the description above, but to the 2nd paragraph further
> down. Otherwise I'm afraid I may not properly understand your question,
> and hence my response below may not make any sense at all.
> 
> > pirq->evtchn = 0;
> > pirq_cleanup_check(pirq, d1); <- cleanup for PV domains
> > if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) > 0 )
> >     unmap_domain_pirq_emuirq(d1, pirq->pirq); <- cleanup for HVM domains
> > 
> > It would seem to me the pirq_cleanup_check() call just after setting
> > evtchn = 0 was done to account for PV domains, while the second
> > (hidden) pirq_cleanup_check() call in unmap_domain_pirq_emuirq() would
> > do the cleanup for HVM domains.
> > 
> > Maybe there's something that I'm missing, I have to admit the PIRQ
> > logic is awfully complicated, even more when we mix the HVM PIRQ
> > stuff.
> 
> If you look at pirq_cleanup_check() you'll notice that it takes care
> of one HVM case as well (the not emuirq one, i.e. particularly PVH,
> but note also how physdev_hvm_map_pirq() calls map_domain_emuirq_pirq()
> only conditionally). Plus the crucial aspect of the 2nd paragraph of
> the description is that past calling pirq_cleanup_check() it is not
> really valid anymore to (blindly) de-reference the struct pirq pointer
> we hold in hands. The is_hvm_domain() qualification wasn't enough,
> since - as said - it's only one of the possibilities that would allow
> the pirq to remain legal to use past the call, when having taken the
> function's
> 
>         if ( pirq->arch.hvm.emuirq != IRQ_UNBOUND )
>             return;
> 
> path. A 2nd would be taking the
> 
>         if ( !pt_pirq_cleanup_check(&pirq->arch.hvm.dpci) )
>             return;
> 
> path (i.e. a still in use pass-through IRQ), but the 3rd would still
> end in the struct pirq being purged even for HVM.

Right, I was missing that if pirq is properly freed then further
usages of it after the pirq_cleanup_check() would be use after free.

> >> And then after
> >> removal from the radix tree the structure wasn't scheduled for freeing.
> >> (All structures still left in the radix tree would be freed upon domain
> >> destruction, though.)
> > 
> > So if my understanding is correct, we didn't have a leak due to the
> > missing free_pirq_struct() because the inverted check in
> > pirq_cleanup_check() macro prevented the removal from the radix tree,
> > and so stale entries would be left there and freed at domain
> > destruction?
> 
> That's the understanding I had come to, yes. What I wasn't entirely
> sure about (see the 2nd post-commit-message remark) is why the entry
> being left in the radix tree never caused any problems. Presumably
> that's a result of pirq_get_info() first checking whether an entry is
> already there, allocating a new one only for previously empty slots.

Yes, I came to the same conclusion, that not freeing wasn't an issue
as Xen would re-use the old entry.  Hopefully it's clean enough to not
cause issues when re-using.

> >> --- a/xen/common/event_channel.c
> >> +++ b/xen/common/event_channel.c
> >> @@ -711,9 +711,10 @@ int evtchn_close(struct domain *d1, int
> >>              if ( !is_hvm_domain(d1) )
> >>                  pirq_guest_unbind(d1, pirq);
> >>              pirq->evtchn = 0;
> >> -            pirq_cleanup_check(pirq, d1);
> >> -            if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) > 0 )
> >> -                unmap_domain_pirq_emuirq(d1, pirq->pirq);
> >> +            if ( !is_hvm_domain(d1) ||
> >> +                 domain_pirq_to_irq(d1, pirq->pirq) <= 0 ||
> >> +                 unmap_domain_pirq_emuirq(d1, pirq->pirq) < 0 )
> > 
> > pirq_cleanup_check() already calls pirq_cleanup_check() itself.  Could
> > you please add a comment to note that unmap_domain_pirq_emuirq()
> > succeeding implies the call to pirq_cleanup_check() has already been
> > done?
> > 
> > Otherwise the logic here looks unbalanced by skipping the
> > pirq_cleanup_check() when unmap_domain_pirq_emuirq() succeeds.
> 
> Sure, added:
> 
>                 /*
>                  * The successful path of unmap_domain_pirq_emuirq() will have
>                  * called pirq_cleanup_check() already.
>                  */

With that added:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> >> --- a/xen/include/xen/irq.h
> >> +++ b/xen/include/xen/irq.h
> >> @@ -158,7 +158,7 @@ extern struct pirq *pirq_get_info(struct
> >>  void pirq_cleanup_check(struct pirq *, struct domain *);
> >>  
> >>  #define pirq_cleanup_check(pirq, d) \
> >> -    ((pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
> >> +    (!(pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
> > 
> > Not that you need to fix it here, but why not place this check in
> > pirq_cleanup_check() itself?
> 
> See the first of the post-commit-message remarks: The goal was to not
> require every arch to replicate that check. At the time it wasn't
> clear (to me at least) that the entire concept of pIRQ would likely
> remain an x86 special thing anyway.

Anyway, such change would better be done in a separate commit anyway.

Thanks, Roger.

