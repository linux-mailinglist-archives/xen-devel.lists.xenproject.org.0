Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115E4A3D3A4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 09:50:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893627.1302499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2G0-0000Bv-3u; Thu, 20 Feb 2025 08:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893627.1302499; Thu, 20 Feb 2025 08:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2G0-0000AQ-12; Thu, 20 Feb 2025 08:50:08 +0000
Received: by outflank-mailman (input) for mailman id 893627;
 Thu, 20 Feb 2025 08:50:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ie4y=VL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tl2Fy-0008W3-4Y
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 08:50:06 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad222247-ef67-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 09:50:04 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-22101839807so12801975ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 00:50:04 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73258b985c9sm10854055b3a.84.2025.02.20.00.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 00:50:02 -0800 (PST)
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
X-Inumbo-ID: ad222247-ef67-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740041403; x=1740646203; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D2fKesbjeCpfr/NPNTYtl0U7cCEIbxfeHTyejxrDrOY=;
        b=vr0ad/xhn1LRjtjTDLtVOh/GQwnCBT67BKiYRekUL+UAV1i1ajj04GFhZimzZcNTEE
         e/I7O+++mv8QFETQP27BpKfsax9HfD0KzYbK+SiZdW/4YO35uwe/dQQl2ExgUYR8Cl2V
         CHV7wegaOcABd53ON1Qd6UOU7Kd6jXm4ehN0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740041403; x=1740646203;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D2fKesbjeCpfr/NPNTYtl0U7cCEIbxfeHTyejxrDrOY=;
        b=DMkNRm8iaTuwITjYJOC6l2o2gLf4jrs02QxMKXgLDjPAneHkUbba0yvDiEJqDTN/Ae
         wpRvAYLBfZRM/GJkPTocmL123Ylxd9BNL/0j5v3EOpXGL1V7+Jcc51DhvJiK4p9Lldmg
         IDq9ASoxZT/CceFWz73y8Q6INg4OqHpQJ3kBxzKs1fqVbFIs81IY/IgjXtDvbyMmYe8f
         IEtCusSCmY3t1Ti/m1j0B4GuOWK7wnGeheTo8JTA+LiiJoNZYUzLkhTm9KVrtd2PEoSq
         Eqif2DFnZYFtJ7vNB9bMaPHrtR6Wl5YuntY2RhldZAIKnnQ+5ADE7A5uFvIwiP1V3H1l
         6jAg==
X-Forwarded-Encrypted: i=1; AJvYcCWTMq4Vye6slS3fcu+0AcXFECeGsdCHK/QknSPCocgFqHHfoy/WvJbmB0P6mZ1B1g3rzdP6miT/6Eo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlanmylCWklreiHFXPvy5ZhX1lyhclBfUmC4amOVc/bXYx9iwC
	EUaj4xiv/ofGx/rRaya2ZeQbC76yE0FnZC/MZANWKeR2o4fa5oCKkcuSj3HR99s=
X-Gm-Gg: ASbGncs/gcP425hzD2mtphtbIuYng8QONNXciHQ50R1JT4J3zmL9x0No5T4C/TbK8j3
	zcD1d7l80IFfZe7Ns/ZOmV9QXH2MqzVPOWOt7z0g+J+1i7OmDSkX3F+w2bSPJEWmwN2Evz0rQ3M
	MI0NSEAZ6OAGv3fYe7xjr5IvZ9X1te8J3mPq4/RyITuaG6dBWX6Oe0c/H9Tr2CjypI8s55t6O3Z
	yRJ1nM6a2Aygf5jj+VTtA830w2evywJNg9uCkEi9vtiOr1QCaPItgoQJXgvPhqKt84eH9H4tc37
	IrumGTWBc2wC18MfNwzkzJJw8A==
X-Google-Smtp-Source: AGHT+IHIA8Y3p3wnqwNsb4xQ06oRqsimLkg4ejaWbkejM6kIFg6TuePjSHqJKJSlWsQx8DaR80RbEg==
X-Received: by 2002:a05:6a00:4c9a:b0:732:2170:b696 with SMTP id d2e1a72fcca58-7329df5c832mr10274846b3a.22.1740041402971;
        Thu, 20 Feb 2025 00:50:02 -0800 (PST)
Date: Thu, 20 Feb 2025 09:49:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/3] x86/dom0: correctly set the maximum ->iomem_caps
 bound for PVH
Message-ID: <Z7bstaBXDP6gdnH-@macbook.local>
References: <20250219164840.94803-1-roger.pau@citrix.com>
 <20250219164840.94803-2-roger.pau@citrix.com>
 <6b0eb8ba-f42c-4a24-9dbd-3e6f78b818c1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b0eb8ba-f42c-4a24-9dbd-3e6f78b818c1@suse.com>

On Thu, Feb 20, 2025 at 09:22:40AM +0100, Jan Beulich wrote:
> On 19.02.2025 17:48, Roger Pau Monne wrote:
> > The logic in dom0_setup_permissions() sets the maximum bound in
> > ->iomem_caps unconditionally using paddr_bits, which is not correct for HVM
> > based domains.  Instead use domain_max_paddr_bits() to get the correct
> > maximum paddr bits for each possible domain type.
> > 
> > Switch to using PFN_DOWN() instead of PAGE_SHIFT, as that's shorter.
> > 
> > Fixes: 53de839fb409 ('x86: constrain MFN range Dom0 may access')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > The fixes tag might be dubious, IIRC at that time we had PVHv1 dom0, which
> > would likely also need such adjustment, but not the current PVHv2.
> 
> Probably better to omit it then. It would be one of the changes moving to
> PVHv2 that missed making the adjustment.

Well, PVHv1 would have needed such adjustment, as it was also limited
to hap_paddr_bits instead of paddr_bits.

> > --- a/xen/arch/x86/dom0_build.c
> > +++ b/xen/arch/x86/dom0_build.c
> > @@ -481,7 +481,8 @@ int __init dom0_setup_permissions(struct domain *d)
> >  
> >      /* The hardware domain is initially permitted full I/O capabilities. */
> >      rc = ioports_permit_access(d, 0, 0xFFFF);
> > -    rc |= iomem_permit_access(d, 0UL, (1UL << (paddr_bits - PAGE_SHIFT)) - 1);
> > +    rc |= iomem_permit_access(d, 0UL,
> > +                              PFN_DOWN(1UL << domain_max_paddr_bits(d)) - 1);
> 
> Why PFN_DOWN() rather than subtracting PAGE_SHIFT? That's two shifts rather
> than just one.

cosmetic: line length (it's mentioned in the commit message).  I can
switch back to PAGE_SHIFT, didn't think it was a big deal since it's
a one time only calculation.

> Personally I'd prefer if we continued using the subtraction,
> but either way:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, will switch back to PAGE_SHIFT if it doesn't turn out to be
too ugly.

