Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993E0A34B46
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 18:08:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887910.1297344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ticgw-0008JR-HO; Thu, 13 Feb 2025 17:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887910.1297344; Thu, 13 Feb 2025 17:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ticgw-0008HL-Ei; Thu, 13 Feb 2025 17:07:58 +0000
Received: by outflank-mailman (input) for mailman id 887910;
 Thu, 13 Feb 2025 17:07:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9G1G=VE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ticgv-0008HD-Mf
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 17:07:57 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 113cba31-ea2d-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 18:07:56 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-21f62cc4088so21005115ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 09:07:56 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73242761684sm1557501b3a.146.2025.02.13.09.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 09:07:54 -0800 (PST)
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
X-Inumbo-ID: 113cba31-ea2d-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739466475; x=1740071275; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oXi26TgcRs2Wpq4cWeN2PIQ3O1Z0pYMkJA8DnhYvcP0=;
        b=Um5GhGYDjJgfuJiblsNS8130I5qirJTxey1vngQcGg0vlLlqY6fST/s7p3zYV3+P5P
         nYjNKz+HV5TDCMZ4ZMYr3GZEGCwsFYMRIr7ei8jv5JAy70QjUAdXhxyPSu7ql/oTxm2B
         PhC5oDrmQNJdZbZD///Kzgm1kdIS9B0Zy7m+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739466475; x=1740071275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXi26TgcRs2Wpq4cWeN2PIQ3O1Z0pYMkJA8DnhYvcP0=;
        b=NO3fC4En51MNd3iJnOrWL7T2ljClQdubmVJo9L4/nIsYxMnqr77tQz+wYiYNXhkwcn
         6/e770o1eBO4w2oY3pcSuAey+A4jTU0BtY93Oqd2guVLc3B98/o2XshTkrF7L0693Uje
         yujK2S/6HMNmSBmiieF2B+5UVikTH1C3vjVbMA+qIGOW/gYUHVs8HJzqtlbcptQU4w8j
         X9GLivijzkg7mb1giODm2GZwPnKLYLagl1pzG3d3Gx5jqTZnqVRZb6ag9tJvmy1PCwOg
         AxVHZ12CzNLg5oYwpEKblSXZhkWBbyy1derSeU2BlWuDeOzcxjRDfCM/BiLxq6TOdLqw
         2usA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2XR5H7yt6jsYgizA1r7eTPRDysXYfXegirVJI4is6nafQQ94J9HnK1tAJK7kiss0wCIvYC4xZzs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBvGxIwiUWiqt+XIuPwjk789mpbwADAwnlOTkAq7dTnvPR/420
	R7Dhpie6WhajAnxVwLLGjqfowyDvQ/pZns6cI2tHva23tTmY5dIGaD47m3DjeU0=
X-Gm-Gg: ASbGncuKTZRToh6RI3Ai2JV6dW9LW94bxKq0BIjxCb2g5zs/itMwzI261txx2wRFt2K
	ydQjN97iUul/Pk/7Rh/BFAQqO6XgkC294y73zvWb6GB0rhW6UOrngVERqiodNU7Vf9wHr7Aeypm
	FZeC37SmzhVVsPd8A6xbWOko5yivMlKV68e+iNC3TcxF/6Lj4l33mAEB+gzLcCQVcax8PMtTqBW
	WbfSkLQGNYozzoLxFrWNCw1EjKpguVjty/m26beGocXO6dA2R2v+UUflXYy7iq2rmHE8JbD4+68
	T9m/L6XHy2ELItSA4IuD
X-Google-Smtp-Source: AGHT+IFDbJggCsgTC57E44zoUEWZqA9ftjkoJaSbUponGsCjh7hl2zbelslJNDTHgxSeeUH/BP77zw==
X-Received: by 2002:a05:6a21:99a5:b0:1e1:a716:3172 with SMTP id adf61e73a8af0-1ee6b2fb49cmr7006739637.12.1739466474895;
        Thu, 13 Feb 2025 09:07:54 -0800 (PST)
Date: Thu, 13 Feb 2025 18:07:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.20?] x86/dom0: be less restrictive with the
 Interrupt Address Range
Message-ID: <Z64m5Yzz388wi__B@macbook.local>
References: <20250212153800.5159-1-roger.pau@citrix.com>
 <50d81725-f039-444e-95f1-e77fcea731e5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <50d81725-f039-444e-95f1-e77fcea731e5@suse.com>

On Thu, Feb 13, 2025 at 10:06:26AM +0100, Jan Beulich wrote:
> On 12.02.2025 16:38, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/dom0_build.c
> > +++ b/xen/arch/x86/dom0_build.c
> > @@ -555,10 +555,6 @@ int __init dom0_setup_permissions(struct domain *d)
> >          if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn) )
> >              rc |= iomem_deny_access(d, mfn, mfn);
> >      }
> > -    /* MSI range. */
> > -    rc |= iomem_deny_access(d, paddr_to_pfn(MSI_ADDR_BASE_LO),
> > -                            paddr_to_pfn(MSI_ADDR_BASE_LO +
> > -                                         MSI_ADDR_DEST_ID_MASK));
> 
> For this one, yes, I can see the LAPIC counterpart a few lines up from here
> (as the description says). In arch_iommu_hwdom_init(), however, I can't.
> Where's that?

We crossed emails, as a bit before this reply from yours I sent:

https://lore.kernel.org/xen-devel/Z62xS26FBClpsol9@macbook.local/

> > --- a/xen/drivers/passthrough/x86/iommu.c
> > +++ b/xen/drivers/passthrough/x86/iommu.c
> > @@ -475,11 +475,6 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
> >      if ( rc )
> >          panic("IOMMU failed to remove Xen ranges: %d\n", rc);
> >  
> > -    /* Remove any overlap with the Interrupt Address Range. */
> > -    rc = rangeset_remove_range(map, 0xfee00, 0xfeeff);
> > -    if ( rc )
> > -        panic("IOMMU failed to remove Interrupt Address Range: %d\n", rc);
> 
> Besides being puzzled by the use of literal numbers here, why was this
> necessary in the first place? Or in other words, why do we not respect the
> domain's ->iomem_caps here (irrespective of iommu_hwdom_{inclusive,reserved}),
> thus making sure we don't allow access to anything dom0_setup_permissions()
> denies? There is iomem_access_permitted() checking in identity_map() for PV,
> but no equivalent for PVH that I could spot. If that was checked somewhere, my
> question on the earlier hunk would then also be addressed, of course.

Indeed, I wondered the same when adjusting this code, I think I might
go ahead and add a pre-patch that switches the code in
arch_iommu_hwdom_init() to use ->iomem_caps and remove all the
open-coded filtering if feasible.

> Further, with the expectation for the UCSI region to eventually be marked
> ACPI_NVS, how's that going to help here? The loop over the E820 map a few
> lines up from here doesn't make any mappings for E820_{ACPI,NVS}. (later) Oh,
> pvh_setup_acpi() does map them, and it running after iommu_hwdom_init() the
> mappings should be made in both page tables (if not shared).

That code is not very well laid out, we should do the mappings in a
single place preferably.

> Which gets me to
> a tangential question though: Am I failing to spot where we avoid, for the
> shared page tables case, doing all the work arch_iommu_hwdom_init() does?

Even in the shared page-table case Xen needs to perform the work done
by arch_iommu_hwdom_init(), as it maps reserved (E820_RESERVED)
regions into dom0 p2m.  PVH dom0 mandates strict mode, so
arch_iommu_hwdom_init() just maps E820_RESERVED for PVH.

Thanks, Roger.

