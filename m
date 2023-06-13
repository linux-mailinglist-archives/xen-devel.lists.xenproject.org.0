Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 291EF72E39C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 15:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548157.855949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q93eE-0005PE-D5; Tue, 13 Jun 2023 13:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548157.855949; Tue, 13 Jun 2023 13:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q93eE-0005Mm-A1; Tue, 13 Jun 2023 13:01:22 +0000
Received: by outflank-mailman (input) for mailman id 548157;
 Tue, 13 Jun 2023 13:01:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lBMi=CB=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q93eC-0005Mg-CM
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 13:01:20 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6214112a-09ea-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 15:01:16 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f8d2bfed53so3536305e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jun 2023 06:01:16 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c0b5400b003f4266965fbsm14481457wmr.5.2023.06.13.06.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 06:01:13 -0700 (PDT)
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
X-Inumbo-ID: 6214112a-09ea-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686661276; x=1689253276;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fGjYYFzsQDTAkC895W9t9aL/cnv4ByOG6QGyUGinFNQ=;
        b=gUZIRGvTdIdgMEyYokHeG1YHmAxsuuFzRtBDDnyDYdxtnAvHwKY5i1LuzymrUm+phX
         IOymocwbS/EEa7ULUmfH7BCzej6SK16fPWsa5dZvpZBSxBTeWOIfmFGFBPrHMYx1RMBV
         E+rQvosVkIHuJ/7PeJjYvqeYeNj3iSgCF6k5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686661276; x=1689253276;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGjYYFzsQDTAkC895W9t9aL/cnv4ByOG6QGyUGinFNQ=;
        b=W5zIQc/HMwKzAxZ2lZF+xdn9qZLsDFQlprB31KaZKbWwIzS/XI9nT+9xgR7T7Sm4c5
         1niNZgHpKpW9NipyZZ92eQIH/rffc5JH1B8y1x3zTy48X0KOFJuzcYAc4jfFWeGnLILp
         xHBKlYCGLfW4aevx8HlyrZQJah109QgKpLKoAqucOr7UDthg6QlKmH3M1im4qWkK2y4O
         beHcLSEM99EsJAmhv2LVET2Pc95jCFsFo/ckXuC2xDwwB7KvMQgqCHtEjhkD2QsqG4V4
         9y9g5NwTrFez8BCVAwKIabattOIuJA9dOxl4Qw0BxdM0Wv2P1PZlTIrzVQwmMXSDxz8M
         lCYQ==
X-Gm-Message-State: AC+VfDxnW9PA5RN1/fxhR6+sUIaRZT8Zw4nwG8j6K3cUblSdbBeeLuU7
	7HCiLFl1f/FSHvYEdbtkrD2CtQ==
X-Google-Smtp-Source: ACHHUZ6ZaPSOAHNkJwq8jbMmEjCT4LuUCtMtWsaK++xVpgmMiL+qIbRmwF2z5ZIt8jMlK8+MOSDYIA==
X-Received: by 2002:a05:600c:138d:b0:3f8:c9a4:4991 with SMTP id u13-20020a05600c138d00b003f8c9a44991mr1632113wmf.10.1686661276337;
        Tue, 13 Jun 2023 06:01:16 -0700 (PDT)
Message-ID: <64886899.050a0220.c0e98.77c8@mx.google.com>
X-Google-Original-Message-ID: <ZIholxxk8Ty59ZC2@EMEAENGAAD19049.>
Date: Tue, 13 Jun 2023 14:01:11 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 4/4] x86/microcode: Prevent attempting updates if
 DIS_MCU_LOAD is set
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
 <20230605170817.9913-5-alejandro.vallejo@cloud.com>
 <adbd3826-dd34-a386-ef3f-e964ebb2e270@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adbd3826-dd34-a386-ef3f-e964ebb2e270@citrix.com>

On Mon, Jun 12, 2023 at 07:54:00PM +0100, Andrew Cooper wrote:
> On 05/06/2023 6:08 pm, Alejandro Vallejo wrote:
> > diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> > index 4f60d96d98..a4c123118b 100644
> > --- a/xen/arch/x86/cpu/microcode/core.c
> > +++ b/xen/arch/x86/cpu/microcode/core.c
> > @@ -871,6 +885,15 @@ int __init early_microcode_init(unsigned long *module_map,
> >           * present.
> >           */
> >          ucode_ops = intel_ucode_ops;
> > +
> > +        /*
> > +         * In the case where microcode updates are blocked by the
> > +         * DIS_MCU_LOAD bit we can still read the microcode version even if
> > +         * we can't change it.
> > +         */
> > +        if ( !this_cpu_can_install_update() )
> > +            ucode_ops = (struct microcode_ops){ .collect_cpu_info =
> > +                                    intel_ucode_ops.collect_cpu_info };
> 
> I don't see how this (the logic in this_cpu_can_install_update()) can
> work, as ...
> 
> >          break;
> >      }
> >  
> > @@ -900,6 +923,10 @@ int __init early_microcode_init(unsigned long *module_map,
> >      if ( ucode_mod.mod_end || ucode_blob.size )
> >          rc = early_microcode_update_cpu();
> >  
> > +    /*
> > +     * We just updated microcode so we must reload the boot_cpu_data bits
> > +     * we read before because they might be stale after the updata.
> > +     */
> >      early_read_cpuid_7d0();
> >  
> >      /*
> 
> ... MSR_ARCH_CAPS is read out-of-context down here.
Seeing how the minimal CPU state is read in early_cpu_init() I'll stash the
read to MSR_ARCH_CAPS there too. Then it's a matter of reloading
potentially changing leafs/MSRs after the update, which is a lot clearer
rather than adding reads/writes ad-hoc elsewhere.

Alejandro

