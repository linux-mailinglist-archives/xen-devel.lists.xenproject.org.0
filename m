Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AECE91DAA8
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 10:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751388.1159339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCp2-00085Z-39; Mon, 01 Jul 2024 08:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751388.1159339; Mon, 01 Jul 2024 08:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOCp1-000833-Vb; Mon, 01 Jul 2024 08:55:39 +0000
Received: by outflank-mailman (input) for mailman id 751388;
 Mon, 01 Jul 2024 08:55:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFf9=OB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sOCp1-00082w-F6
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 08:55:39 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aef368e8-3787-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 10:55:37 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-79c03abfb18so178597385a.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 01:55:37 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d69279476sm328246485a.34.2024.07.01.01.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 01:55:35 -0700 (PDT)
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
X-Inumbo-ID: aef368e8-3787-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719824136; x=1720428936; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W0pzrC4jdyTTHUHIKPwsWoUUKJhxKelE+9MLJTDWTgE=;
        b=WnTAE3ztv0JW7yZ5PF48KERslh9Lvss0VrP6VsBInDNJNqnyJH5ub8PO6sCt3zJNOu
         b+JyHPZICINwGZhv4OEOCALu0k+kryOowOxlD2Wnk0SZyuMpYPmhcAt+XtBIj62sZbH1
         N46HK3Y4tsa2DwpSZ8EGBrUAa8IqrglVewS+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719824136; x=1720428936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0pzrC4jdyTTHUHIKPwsWoUUKJhxKelE+9MLJTDWTgE=;
        b=jya35gKzhNycvTtZ7E46Q2yc44kGsov3IfcPt65zgWxQuEiLAeeswQkYpXGDxAlBOH
         xKzgb0t4EJIE+vCwT6XN+8O5vxVuSKO96UA6U6q0MdTC7i/65CmH0kArNyrar9Yj0/w+
         32pmfraOpo82BgNA+hJlgtZ9kqbicQMHRAhY5Lnj5NLWgUy5V5XHT6v0v2xXsHPW4Stf
         p+ozHV41xEVRgM32rxfy148nlfvTIoPaqocx/VnNQOwAMr+KR8zFRzsnBIKIRsXDg9b/
         14MUFlNrxp+PkhzMWhIGzr/RalhKXG+zjPdi/d8VqQDkWiC4ICA7hdO85JKx71hL6xE7
         0Ovw==
X-Gm-Message-State: AOJu0YyShSWVvwLWsbFn12I/x8At9MByLZCnl7W2m7MXGW75xM4mnwXQ
	A7SAKdd/kyrvNBvvSwG+UJEa4x4uO0Ix5LDGOkXV48x0hfCXiKk8CO/maHLI8I4=
X-Google-Smtp-Source: AGHT+IF8NWYjHjXsa2xUzVJV5aGQiwh8wD7sjAqUplJ+AeAiR7wDdXQc+My8AtPz5OIEfDNa+F9wxQ==
X-Received: by 2002:a05:620a:2688:b0:79d:5c9e:f7b9 with SMTP id af79cd13be357-79d7b9b0eefmr674971585a.14.1719824136012;
        Mon, 01 Jul 2024 01:55:36 -0700 (PDT)
Date: Mon, 1 Jul 2024 10:55:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/3] pirq_cleanup_check() leaks
Message-ID: <ZoJu3jcsiCWwOhBl@macbook>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
 <5641f8eb-5736-8ccc-122b-b3b47c1bac28@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5641f8eb-5736-8ccc-122b-b3b47c1bac28@suse.com>

On Thu, Jul 27, 2023 at 09:38:29AM +0200, Jan Beulich wrote:
> Its original introduction had two issues: For one the "common" part of
> the checks (carried out in the macro) was inverted.

Is the current logic in evtchn_close() really malfunctioning?

pirq->evtchn = 0;
pirq_cleanup_check(pirq, d1); <- cleanup for PV domains
if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) > 0 )
    unmap_domain_pirq_emuirq(d1, pirq->pirq); <- cleanup for HVM domains

It would seem to me the pirq_cleanup_check() call just after setting
evtchn = 0 was done to account for PV domains, while the second
(hidden) pirq_cleanup_check() call in unmap_domain_pirq_emuirq() would
do the cleanup for HVM domains.

Maybe there's something that I'm missing, I have to admit the PIRQ
logic is awfully complicated, even more when we mix the HVM PIRQ
stuff.

> And then after
> removal from the radix tree the structure wasn't scheduled for freeing.
> (All structures still left in the radix tree would be freed upon domain
> destruction, though.)

So if my understanding is correct, we didn't have a leak due to the
missing free_pirq_struct() because the inverted check in
pirq_cleanup_check() macro prevented the removal from the radix tree,
and so stale entries would be left there and freed at domain
destruction?

> For the freeing to be safe even if it didn't use RCU (i.e. to avoid use-
> after-free), re-arrange checks/operations in evtchn_close(), such that
> the pointer wouldn't be used anymore after calling pirq_cleanup_check()
> (noting that unmap_domain_pirq_emuirq() itself calls the function in the
> success case).
> 
> Fixes: c24536b636f2 ("replace d->nr_pirqs sized arrays with radix tree")
> Fixes: 79858fee307c ("xen: fix hvm_domain_use_pirq's behavior")

See the comment above about the call to pirq_cleanup_check() in
unmap_domain_pirq_emuirq(), which might imply 79858fee307c is not
wrong, just confusing.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is fallout from me looking into whether the function and macro of
> the same name could be suitably split, to please Misra rule 5.5. The
> idea was apparently that the check done in the macro is the "common"
> part, and the actual function would be per-architecture. Pretty clearly
> this, if need be, could also be achieved by naming the actual function
> e.g. arch_pirq_cleanup_check().
> 
> Despite my testing of this (to a certain degree), I'm wary of the
> change, since the code has been the way it was for about 12 years. It
> feels like I'm overlooking something crucial ...
> 
> The wrong check is also what explains why Arm got away without
> implementing the function (prior to "restrict concept of pIRQ to x86"):
> The compiler simply eliminated the two calls from event_channel.c.
> ---
> v3: New.
> 
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -1349,6 +1349,7 @@ void (pirq_cleanup_check)(struct pirq *p
>  
>      if ( radix_tree_delete(&d->pirq_tree, pirq->pirq) != pirq )
>          BUG();
> +    free_pirq_struct(pirq);
>  }
>  
>  /* Flush all ready EOIs from the top of this CPU's pending-EOI stack. */
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -711,9 +711,10 @@ int evtchn_close(struct domain *d1, int
>              if ( !is_hvm_domain(d1) )
>                  pirq_guest_unbind(d1, pirq);
>              pirq->evtchn = 0;
> -            pirq_cleanup_check(pirq, d1);
> -            if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) > 0 )
> -                unmap_domain_pirq_emuirq(d1, pirq->pirq);
> +            if ( !is_hvm_domain(d1) ||
> +                 domain_pirq_to_irq(d1, pirq->pirq) <= 0 ||
> +                 unmap_domain_pirq_emuirq(d1, pirq->pirq) < 0 )

pirq_cleanup_check() already calls pirq_cleanup_check() itself.  Could
you please add a comment to note that unmap_domain_pirq_emuirq()
succeeding implies the call to pirq_cleanup_check() has already been
done?

Otherwise the logic here looks unbalanced by skipping the
pirq_cleanup_check() when unmap_domain_pirq_emuirq() succeeds.

> +                pirq_cleanup_check(pirq, d1);
>          }
>          unlink_pirq_port(chn1, d1->vcpu[chn1->notify_vcpu_id]);
>          break;
> --- a/xen/include/xen/irq.h
> +++ b/xen/include/xen/irq.h
> @@ -158,7 +158,7 @@ extern struct pirq *pirq_get_info(struct
>  void pirq_cleanup_check(struct pirq *, struct domain *);
>  
>  #define pirq_cleanup_check(pirq, d) \
> -    ((pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
> +    (!(pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)

Not that you need to fix it here, but why not place this check in
pirq_cleanup_check() itself?

Thanks, Roger.

