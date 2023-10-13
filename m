Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19A87C8454
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 13:24:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616488.958536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrGGl-0008DX-5n; Fri, 13 Oct 2023 11:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616488.958536; Fri, 13 Oct 2023 11:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrGGl-0008Au-2Y; Fri, 13 Oct 2023 11:23:51 +0000
Received: by outflank-mailman (input) for mailman id 616488;
 Fri, 13 Oct 2023 11:23:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NVAw=F3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qrGGj-0008Ao-8u
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 11:23:49 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa7dfe66-69ba-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 13:23:48 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so326791066b.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 04:23:48 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ci24-20020a170906c35800b009a2235ed496sm12466014ejb.141.2023.10.13.04.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 04:23:47 -0700 (PDT)
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
X-Inumbo-ID: fa7dfe66-69ba-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697196228; x=1697801028; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wt6QnegSXWw4ubsZzSJKV6jXlHRSG9ZZqGnDL2enZGo=;
        b=i+sNMA03Hum/zMSwwzSkxOUjGEDaMIBvnJOVpclqT5KQDnwR708szkojxePGNtGxQ/
         lwrhI/PDJZDN41lYn3FqagTfMG2xrHovjiLxpi6Dcgxk2WjxFkvBIcGNTzgcmM9pN6CD
         wqGUOP4+ff2uWGsz/MxJwUulFkufZOMR9pFDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697196228; x=1697801028;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wt6QnegSXWw4ubsZzSJKV6jXlHRSG9ZZqGnDL2enZGo=;
        b=QeezxmqZ+3m99DOevKyHuETrfZJGrA17lrm0Xlz1o5uAOCHmsa4SXNFfdQrnEte1Rk
         wxlqP85x6Ehl0fXXHK4PvXqhaHxHiwdboXtODTjJ/JMY7tGImRXKFjFJ8hrB9RxXmfPY
         vYFzh1ABRWxCIGYZ4fHUWdx7/COKMpS1GF87jZgT+ux0dvpN6iLo2bCnevmGM4LDZFxr
         C0gsd9lnLEap0DHUETFmv70vsUv9nyJDaLMj2XmdYwQzhtxTxE2QSa88kDj9WFNXUfGT
         l8h2Gqwe9aHZY5XllozyUcR1DGVOBPb5B0fUrHHlsSpwk+b2N2LWiuuVCScqlLZMkc1u
         vEVw==
X-Gm-Message-State: AOJu0YwK6WMjZU5zKDcow9fKZFwufA6toPTFiS6PdXL6fR9k92iuf5z0
	/2P8qYfQ54io+gWAQFgM2folaA==
X-Google-Smtp-Source: AGHT+IEeICyPFzSxdPusEO79fUBTbxaN7ztu2z2T+NQIshAwZKS67vTBCq1GjPhDEhnnCykED9WbtQ==
X-Received: by 2002:a17:906:2250:b0:9ae:54ea:5b0f with SMTP id 16-20020a170906225000b009ae54ea5b0fmr25511439ejr.24.1697196227860;
        Fri, 13 Oct 2023 04:23:47 -0700 (PDT)
Message-ID: <652928c3.170a0220.37d5e.7636@mx.google.com>
X-Google-Original-Message-ID: <ZSkov4poR45Hun9S@EMEAENGAAD19049.>
Date: Fri, 13 Oct 2023 12:23:43 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [for-4.18][PATCH 1/2] xen/x86: Add family guards to the
 is_zen[12]_uarch() macros
References: <20231012172601.22600-1-alejandro.vallejo@cloud.com>
 <20231012172601.22600-2-alejandro.vallejo@cloud.com>
 <06c4df56-8118-4f11-843a-7e4ae81f2464@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06c4df56-8118-4f11-843a-7e4ae81f2464@citrix.com>

Hi,

I'll just remove this patch (and amend the next) in the interest of having
it committed early. That said...

On Fri, Oct 13, 2023 at 10:14:45AM +0800, Andrew Cooper wrote:
> On 13/10/2023 1:26 am, Alejandro Vallejo wrote:
> > It slightly simplifies the code that uses them at no real cost because the
> > code is very rarely executed. This makes it harder to confuse zen uarches
> > due to missing or mistaken family checks.
> 
> I'm afraid I disagree.
As it stands, it's a matter of time before a bug of this form creeps up. Particularly
because it reads very innocent.

   if (is_zen1_uarch())
      fun1();
   else if (is_zen2_uarch())
      fun2();
   else if (is_zen3_uarch())
      fun3();
   else if (is_zen4_uarch())
      fun4();

Particularly if the bodies of each conditional are big enough that you lose
track of the family you're dealing with.

> 
> It's bogus to do a family check without a vendor check.
I can get behind that. I didn't include the vendor check because by and
large these macros are used in vendor-specific areas. Would that appease
your concerns? Whenever the macros are used we're in glacially cold paths
anyway.

> By making this
> change, you're separating (spatially in code, and therefore cognitively)
> the two checks that it's important to be able to cross-check.
IMO, It's no different from separating the heuristic from the vendor/family
check. What causes definite cognitive load is (as a reader) having to
remember what particular fields must be read off boot_cpu_data in order to
discriminate zenN, which of them are co-familiar and so on.

> 
> > diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
> > index d862cb7972..5a40bcc2ba 100644
> > --- a/xen/arch/x86/include/asm/amd.h
> > +++ b/xen/arch/x86/include/asm/amd.h
> > @@ -145,11 +145,12 @@
> >   * Hygon (Fam18h) but without simple model number rules.  Instead, use STIBP
> >   * as a heuristic that distinguishes the two.
> >   *
> > - * The caller is required to perform the appropriate vendor/family checks
> > - * first.
> > + * The caller is required to perform the appropriate vendor check first.
> >   */
> > -#define is_zen1_uarch() (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
> > -#define is_zen2_uarch()   boot_cpu_has(X86_FEATURE_AMD_STIBP)
> > +#define is_zen1_uarch() ((boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) && \
> > +                         !boot_cpu_has(X86_FEATURE_AMD_STIBP))
> > +#define is_zen2_uarch() (boot_cpu_data.x86 == 0x17 && \
> > +                         boot_cpu_has(X86_FEATURE_AMD_STIBP))
> 
> What leads you to believe there aren't Hygon Zen2's ?
The same argument that a Hygon zen2 supports STIBP. Having seen neither HW
nor docs all that's left is divination skills :)

> 
> ~Andrew

As I said, let's move this discussion away from the errata fix (I'll remove
this patch and adapt the next one to remove the family check), as it's
unrelated and can be done later if I manage to convince you.

Thanks,
Alejandro

