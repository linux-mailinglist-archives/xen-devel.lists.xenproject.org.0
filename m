Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D771B0425F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 17:00:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042933.1413012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubKfC-0007Ch-Mi; Mon, 14 Jul 2025 15:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042933.1413012; Mon, 14 Jul 2025 15:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubKfC-00079e-Je; Mon, 14 Jul 2025 15:00:18 +0000
Received: by outflank-mailman (input) for mailman id 1042933;
 Mon, 14 Jul 2025 15:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vqzr=Z3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ubKfB-00079Y-0j
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 15:00:17 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d8fd22c-60c3-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 17:00:11 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so2539618f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 08:00:11 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8e26f3asm12843299f8f.98.2025.07.14.08.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 08:00:10 -0700 (PDT)
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
X-Inumbo-ID: 3d8fd22c-60c3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752505211; x=1753110011; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h+JDt+3IuQZiDzh9v0X/z8Kp02A4t3XfzQvGRNmnmOg=;
        b=H3vj/RWCl/F4oTkG7WeHsP2XqoinO1vsziMZJRL7lvE4mIKsykg+/i63yxtJFPJoUY
         bWplzQHQRvBfDRI03r+e2tkvXYbbLMnxy7FWy4Y5rhKI+IdqSgUYe+4kbob8xjSaNJh/
         80Ob6+9vx+A6GHxqQsao+dbvOKLCXQFhKVByI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505211; x=1753110011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+JDt+3IuQZiDzh9v0X/z8Kp02A4t3XfzQvGRNmnmOg=;
        b=rNx7Fn8EFg2pFgGF8gUzxxC5ryEV6tyuMjxrB3kQQfB0Iv3VzPT5oXqlgqoRpWGkm+
         PuNdmnjZ/oRE1MuypiCwC2D/3RG2ARKZF1ftt5V0mSFUzQsZvIIIZaa+I9n/YGlR2SiA
         s7ctQ4N1MlHYTXXBRLpV2m7N9DDlahSHmNRoE0Y+JcXgnb0L84h7JAGGiePiQhS0hDEM
         btMapwJgWtE43/gHe0Dy5WydVgJR7HBXGNnrMksoyWZ++LuxngHVKieafNwIA/agM+yn
         jc7FtXVnPJvr0ihlYyTQEnqbxgrYoj1nU4vjZDgaqEFB0lKLa78iqVOGVcHTc4jT/dR1
         GcWQ==
X-Gm-Message-State: AOJu0Yw03FDDYe9ZPaobtmvLNVoA9YvS5dk/EOiPz/WSJHsBDIh0WTqR
	Yk5SH3FoTgAtLQMQxxdCxEAMgjyWuhR79Vi0+NaOo9JNJelT2JHtGMp7Dy6UdKKloT4=
X-Gm-Gg: ASbGncsky2DTCVuXw9NiJ8TYtrPd3i1lqTLz0jfLTi2g98J5lMX5MUUqatb4N/aSI4C
	mLEEb0MzAdCJxxp4gR/ckVidGuOdM/vBEVy3J04faIuftT/vK9fNgKOXmFRkmZsPrc+jxkKpjlY
	3ZWt4zA4YVJFoyMDrUNaiP9D8mR6/BHWzbQL1YzqLlz8D09W+PdrKIbqPcnKmGbLqtP6vCluQ85
	SGLs5Y+ESFDQP/j6euoEwcbqrnsapWVIoRf8u+dMSvrDkZ28gYVHUrvT7zsj/j2wjyjWuLklpn8
	RbrO46wSy2nXRUTp7oavb2ndaQ0ae54ejyJf2kCJNoqwqRJR4n+2yauOeDPopGzy9zx/chiWcC4
	iZcXeWshtDnyTNbZEpOTqRJRXCM4xh4E1uACNwEmVBSLdv/slCmWUM+oEgla25nu0yg==
X-Google-Smtp-Source: AGHT+IH102aSNKgD5xULsJ9GOguZTglx8p42dozBgd5xQOAv+Ag+3T+Ryo7Grt50xex4YRUT2ZEErg==
X-Received: by 2002:a5d:6a49:0:b0:3a5:2848:2e78 with SMTP id ffacd0b85a97d-3b5f18ceba8mr10134554f8f.28.1752505211114;
        Mon, 14 Jul 2025 08:00:11 -0700 (PDT)
Date: Mon, 14 Jul 2025 17:00:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PVH: extend checking in hwdom_fixup_p2m()
Message-ID: <aHUbeTzCLbYdHvXQ@macbook.local>
References: <664472bb-b375-46eb-999e-34f983275d92@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <664472bb-b375-46eb-999e-34f983275d92@suse.com>

On Mon, Jul 07, 2025 at 04:44:25PM +0200, Jan Beulich wrote:
> We're generally striving to minimize behavioral differences between PV
> and PVH Dom0. Using (just?) is_memory_hole() in the PVH case looks quite
> a bit weaker to me, compared to the page ownership check done in the PV
> case. Extend checking accordingly.

The PV code path is also used by non-priviledged domains, while
pf-fixup is strictly limited to the hardware domain.  But I agree that
the page ownership check is possibly better, and more in-line with the
PV counterpart.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

LGTM, I would just request that you also remove the is_memory_hole()
check at the same time.

> ---
> The addition may actually be suitable to replace the use of
> is_memory_hole() here. While dropping that would in particular extend
> coverage to E820_RESERVED regions, those are identity-mapped anyway
> (albeit oddly enough still by IOMMU code).

You could avoid getting E820_RESERVED regions identity mapped if
dom0-iommu=map-reserved=0 is specified on the command line, at which
point your suggestion to use the page ownership check seems better
because it would also allow for pf-fixup to deal with E820_RESERVED
regions.

I think it would be better to remove the is_memory_hole() check if we
introduce the page ownership checking.  Otherwise it's kind of
redundant and possibly confusing.

> 
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -184,6 +184,22 @@ static int hwdom_fixup_p2m(paddr_t addr)
>           !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
>          return -EPERM;
>  
> +    /*
> +     * Much like get_page_from_l1e() for PV Dom0 does, check that the page
> +     * accessed is actually an MMIO one: Either its MFN is out of range, or
> +     * it's owned by DOM_IO.
> +     */
> +    if ( mfn_valid(_mfn(gfn)) )
> +    {
> +        struct page_info *pg = mfn_to_page(_mfn(gfn));

We should consider introducing a mfn_t mfn = _mfn(gfn) local variable,
as there's a non-trivial amount of _mfn(gfn) instances.  Not that you
need to do it here, just noticed the amount of instances we have of
it.

Thanks, Roger.

