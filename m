Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A5DA35910
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 09:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888600.1297953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tirEU-0001Rj-VD; Fri, 14 Feb 2025 08:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888600.1297953; Fri, 14 Feb 2025 08:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tirEU-0001QH-R0; Fri, 14 Feb 2025 08:39:34 +0000
Received: by outflank-mailman (input) for mailman id 888600;
 Fri, 14 Feb 2025 08:39:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zro/=VF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tirET-0001OY-9F
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 08:39:33 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3539f25d-eaaf-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 09:39:31 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-21f49bd087cso26788465ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 00:39:31 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7324273e3b5sm2533943b3a.110.2025.02.14.00.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 00:39:29 -0800 (PST)
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
X-Inumbo-ID: 3539f25d-eaaf-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739522370; x=1740127170; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wkrHjhssPr2lmLNQzw990yPIP2Y2qXtCBv8prFXK8AU=;
        b=DlmlEgT/qt5wDwLVl6THZuv/z5WCvjdBO0FK0KdGOReCAuqswrxRTqHG+3hCZ35n9B
         1kKQYNr9QbzpmuqrIqNqa6mQR0OE7mDWljFzyct/mFCpHyhJiCNXSYPXou9GxOy1i0nv
         viez3IKXkPnMaeyqBWEZBpMAyxNqNpG/dlAxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739522370; x=1740127170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkrHjhssPr2lmLNQzw990yPIP2Y2qXtCBv8prFXK8AU=;
        b=IsrQVDmraGnzbk276mj6/t632iaGrOXRqqyY9GSKd+Cs/G0MNAAOmLiI6+Sl94r17s
         +Qbq+WOOJVZpflqmitlMC51jwfBHjS5wtDMctARBJs/XIO65mxQNxhSStoD1LEZzyWTg
         W74mG+IzWtO4XRCJvHF56rkZyPKj6rwnqyuiEKe9/uTufDVGXL7thDAW400U8ZCIa217
         plwKeDa1j14r7SpY0D3ITLOBy8zx7DGqDSfyIoEGZv9W8XxRzdHxucb7SpUDkiDH4g+7
         VhD36x+5lWM3PwbOVporUp7BED0eA5fasvjIS/JqNN2N+qa9X6jxZaeBhCM7lQL0FMYw
         0tTg==
X-Forwarded-Encrypted: i=1; AJvYcCVUHDHCZncy7VXug/QrhGnEyjDoNhk+4eky+n95V7cDAFHe8AtqeHYsA+z/1e5llr3yIutCzYB0+4Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPGGaieVgrmcCR9u0lAJwbeQXpqlwhPx2tAlJQYjgi2aVsllum
	8dhVvARQgYU1gjccBXU2xlTfAThG/LJcKfpifSPAOL60QwkqRv1fOdT+984iqmc=
X-Gm-Gg: ASbGncvIGG7p0HpfgKB7lgCGtYtb9hL1/JIa0EcjH/WXJJBURYiSt7gjAy5ciTHOKlc
	XgrqkGFSnND6vlTWyRlkXAZ8gizhrniiWLD87i/KiAHJqExB/e+L6h6qbzJYqnOJIXBUcv5ZGk5
	rBY9JJrayfDcuKIVsC1q1X/8dMhS7yMx/WaTba6jzZX+n0BxaYIEAvarGRruOUQKt8FF9EHwi89
	E66O/CJwiyORJ6Hu+HPTsAXQNpEUxCHHGchPL25ezsHmPGxRQwhnVXru35Tfyot5XTV5Rzkg3x4
	/f8EkEZf7u6uGC74HhL7
X-Google-Smtp-Source: AGHT+IGtq6IlcHH3Ng6hA3Ned8hkSOF0RkBoQ5bskHBg+KLlRif8ryz2nG2Dmb/BHXCGuWzH2YYOQw==
X-Received: by 2002:aa7:8885:0:b0:730:8ad5:90c1 with SMTP id d2e1a72fcca58-7323c13af33mr9323129b3a.14.1739522369888;
        Fri, 14 Feb 2025 00:39:29 -0800 (PST)
Date: Fri, 14 Feb 2025 09:39:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Huang, Ray" <Ray.Huang@amd.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v8] vpci: Add resizable bar support
Message-ID: <Z68BPHUxW42KdJPs@macbook.local>
References: <20250211022257.1690366-1-Jiqian.Chen@amd.com>
 <Z6sWnK1BYxArBq--@macbook.local>
 <BL1PR12MB5849CF146DFA8BD2761D1F4EE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ba93bd05-4cf6-405a-9e07-29d681076bdd@suse.com>
 <2fcc37f5-20e5-4c52-9e8b-c24121c05e8b@gmail.com>
 <BL1PR12MB5849BDEC2A23731E9281A26FE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849BDEC2A23731E9281A26FE7FE2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Fri, Feb 14, 2025 at 08:22:39AM +0000, Chen, Jiqian wrote:
> On 2025/2/14 16:18, Oleksii Kurochko wrote:
> > 
> > On 2/14/25 8:35 AM, Jan Beulich wrote:
> >> On 14.02.2025 04:32, Chen, Jiqian wrote:
> >>> On 2025/2/11 17:21, Roger Pau Monné wrote:
> >>>> On Tue, Feb 11, 2025 at 10:22:57AM +0800, Jiqian Chen wrote:
> >>>>> Some devices, like AMDGPU, support resizable bar capability,
> >>>>> but vpci of Xen doesn't support this feature, so they fail
> >>>>> to resize bars and then cause probing failure.
> >>>>>
> >>>>> According to PCIe spec, each bar that supports resizing has
> >>>>> two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
> >>>>> handlers to support resizing the size of BARs.
> >>>>>
> >>>>> Note that Xen will only trap PCI_REBAR_CTRL, as PCI_REBAR_CAP
> >>>>> is read-only register and the hardware domain already gets
> >>>>> access to it without needing any setup.
> >>>>>
> >>>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> Thank you!
> >>> May I know whether this can be merged in Xen version 4.20?
> > 
> > It would be better to merge it after the Xen 4.20 release.
> > (It will happen in the next 2 weeks).
> Got it. Thank you for reply.

Could you also add an entry to the CHANGELOG.md file to note that
ReBAR is now supported on PVH dom0?

Thanks, Roger.

