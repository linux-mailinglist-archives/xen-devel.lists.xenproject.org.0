Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFECAA5DCAC
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 13:31:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910294.1317013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsLEA-0007zf-Ju; Wed, 12 Mar 2025 12:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910294.1317013; Wed, 12 Mar 2025 12:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsLEA-0007xb-HI; Wed, 12 Mar 2025 12:30:26 +0000
Received: by outflank-mailman (input) for mailman id 910294;
 Wed, 12 Mar 2025 12:30:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y3Ag=V7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tsLE9-0007xV-Kb
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 12:30:25 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c56adb7e-ff3d-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 13:30:24 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5e56b229d60so1627404a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 05:30:24 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac239485d55sm1079511866b.67.2025.03.12.05.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 05:30:23 -0700 (PDT)
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
X-Inumbo-ID: c56adb7e-ff3d-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741782624; x=1742387424; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=inrQ29XK2OWPqrbOj+WDMkr0HY/vh9OX4zHz4C2cDdA=;
        b=O+4jbpCegOacsebyZMNKwfuigLvAI0b7PNh+N8Ul51kO3zTR1q5YubaiP4loxHkDm+
         uRRY4gq5vP+RplXg7ZV8EgBivyN8TTsH1FMsXY8Sy85/WtL436Nu3LCYUC5nUEfXa26D
         bxzS3IJoTUQMMmTKLqJNdAmv5jqJDv1dZPlZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741782624; x=1742387424;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inrQ29XK2OWPqrbOj+WDMkr0HY/vh9OX4zHz4C2cDdA=;
        b=p2x73NoKR8RTB+/ogiFpE0bu4OOeJBf3kPtO6gn6vCEkPCQPvH6KeDEL9puT3qlZ5r
         xBRZcllR7OQTNAsTFtgO0X1K2siSAUnQk2zeYvr9SDRvIQ9WtuSvez43oc65zl5QjG+0
         nCRDIwiqhtkaWbeheLw3u3qs94R2uqMfj1NJ6CWi6bWy6eElZv4toj9fHFGHuByOMThV
         TeBGiXOq6LhojFHW3eELOxBP54ZPeB4ZHTVIjhup1jju18YF8AUhptx+khpBJU13seGe
         q/X56GPKx69Vtm2iK9wBwvJDb1mJ9z0Xo9MVwWwh4iJB6cmyRIk9OkaqstHtp7rODMXs
         BqIg==
X-Gm-Message-State: AOJu0YzNB5yTMCXDMvFCtAQUu6Snoq7e/hYaEKjtJMO1Rhh7YuFl2G3D
	Bel9kz9Rtpar5XWLkCxx4uxLNCnxNU25/Pcz9rayFuv3PRpGEePJVZMeIMqAV+vyhNHDuF5S30E
	x
X-Gm-Gg: ASbGncswmHWQL66SRve/RkM1H3ybmbMRaiqqQV+bKedRJdHtzEYUDb+z9N583kYbx03
	IPQ//twEVMDmUylYDF60aRsS+ja3k0YMXlSwlkCY2yG70/2A41kvbAPHpCMz8ppJMFOKlUqzQJE
	WoyNHLt9WcG+3hqj1pAwd/m/x1ojlErln1xeu5JQeqI6g3FaJDGIQZkA35ZBmTL/b2l5aA6Mqy1
	qnZwu3o38V79MlAcxVgWBfx5m7dQhQeHCmmHCiGmuiH2MhUk+itXIFrM6ZEupMUf1sh6HhQV9D5
	RfO4gHV68UMbJEXLVKzAUyRmo9STvGhEl+8vY346UFdWrZCUS7Gx1AgH7w7jog+ADA==
X-Google-Smtp-Source: AGHT+IFG/0eKmklRc2XxaeCGfK5Z+zCt5mRvdpL65sT+x3L7wYSTuCAGSlBl6LhiTmq0HjDtWSW2QQ==
X-Received: by 2002:a17:907:a70a:b0:abf:6e9:3732 with SMTP id a640c23a62f3a-ac2ba47365dmr969405566b.3.1741782623721;
        Wed, 12 Mar 2025 05:30:23 -0700 (PDT)
Date: Wed, 12 Mar 2025 13:30:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH] x86/shadow: replace p2m_is_valid() uses
Message-ID: <Z9F-Xul18_96ok1N@macbook.local>
References: <6a7391fc-4abf-4e65-8159-30f4eae8fec5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a7391fc-4abf-4e65-8159-30f4eae8fec5@suse.com>

On Wed, Mar 12, 2025 at 12:30:40PM +0100, Jan Beulich wrote:
> The justification for dropping p2m_mmio_dm from p2m_is_valid() was wrong
> for two of the shadow mode uses.
> 
> In _sh_propagate() we want to create special L1 entries for p2m_mmio_dm
> pages. Hence we need to make sure we don't bail early for that type.
> 
> In _sh_page_fault() we want to handle p2m_mmio_dm by forwarding to
> (internal or external) emulation. Pull the !p2m_is_mmio() check out of
> the || expression (as otherwise it would need adding to the lhs as
> well).
> 
> In both cases, p2m_is_valid() in combination with p2m_is_grant() still
> doesn't cover foreign mappings. Hence use p2m_is_any_ram() plus (as
> necessary) p2m_mmio_* instead.
> 
> Fixes: be59cceb2dbb ("x86/P2M: don't include MMIO_DM in p2m_is_valid()")
> Reported-by: Luca Fancellu <Luca.Fancellu@arm.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One suggestion below.

> ---
> This still leaves the p2m_mmio_dm vs p2m_invalid unaddressed.
> 
> While propagating #PF to the guest based on P2M type isn't quite right,
> not doing so in sh_page_fault() would lead to no forward progress in the
> guest anymore: If we put in place a non-present shadow PTE, another #PF
> will occur right after exiting to the guest. Doing so is only okay as a
> transient measure, e.g. while paging back in a paged-out page (where the
> respective type is included in P2M_RAM_TYPES).
> 
> There could likely be at least one more Fixes: tag (to cover the lack of
> handling foreign mappings); the one supplied is merely to indicate the
> connection to the recent regression.
> 
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -471,9 +471,7 @@ _sh_propagate(struct vcpu *v,
>      /* We don't shadow PAE l3s */
>      ASSERT(GUEST_PAGING_LEVELS > 3 || level != 3);
>  
> -    /* Check there's something for the shadows to map to */
> -    if ( (!p2m_is_valid(p2mt) && !p2m_is_grant(p2mt))
> -         || !gfn_valid(d, target_gfn) )
> +    if ( !gfn_valid(d, target_gfn) )
>      {
>          *sp = shadow_l1e_empty();
>          goto done;
> @@ -503,6 +501,13 @@ _sh_propagate(struct vcpu *v,
>          goto done;
>      }
>  
> +    /* Check there's something for the shadows to map to */
> +    if ( !p2m_is_any_ram(p2mt) && p2mt != p2m_mmio_direct )
> +    {
> +        *sp = shadow_l1e_empty();
> +        goto done;
> +    }
> +
>      // Must have a valid target_mfn unless this is a prefetch or an l1
>      // pointing at MMIO space.  In the case of a prefetch, an invalid
>      // mfn means that we can not usefully shadow anything, and so we
> @@ -2366,8 +2371,8 @@ static int cf_check sh_page_fault(
>      gmfn = get_gfn(d, gfn, &p2mt);
>  
>      if ( shadow_mode_refcounts(d) &&
> -         ((!p2m_is_valid(p2mt) && !p2m_is_grant(p2mt)) ||
> -          (!p2m_is_mmio(p2mt) && !mfn_valid(gmfn))) )
> +         !p2m_is_mmio(p2mt) &&
> +         (!p2m_is_any_ram(p2mt) || !mfn_valid(gmfn)) )

Would you mind adding some comment here about the need to forward
p2m_mmio_dm to the emulation, and hence not possible to short-circuit
here?

Thanks, Roger.

