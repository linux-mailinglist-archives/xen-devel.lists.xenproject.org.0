Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644EB54D442
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 00:10:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350322.576625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1bCI-0004Cn-6W; Wed, 15 Jun 2022 22:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350322.576625; Wed, 15 Jun 2022 22:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1bCI-0004B0-3R; Wed, 15 Jun 2022 22:09:10 +0000
Received: by outflank-mailman (input) for mailman id 350322;
 Wed, 15 Jun 2022 22:09:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3iFn=WW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1o1bCG-0004Ar-Lp
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 22:09:08 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4edfcdf-ecf7-11ec-bd2c-47488cf2e6aa;
 Thu, 16 Jun 2022 00:09:06 +0200 (CEST)
Received: by mail-pl1-x62a.google.com with SMTP id k7so2188546plg.7
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jun 2022 15:09:05 -0700 (PDT)
Received: from jade ([192.77.111.2]) by smtp.gmail.com with ESMTPSA id
 r24-20020a638f58000000b00401a7b4f137sm79597pgn.41.2022.06.15.15.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 15:09:03 -0700 (PDT)
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
X-Inumbo-ID: c4edfcdf-ecf7-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KDHt8rTEQEteKpcLPR9BQ8oUD9BiuWpeuA5sV9+beto=;
        b=imJ3C4u3FxHRsnOWqTD91loLLoJp05M3FCuj9sl/YbV1binqdmaaotn4CBhMgYup4C
         wYl1IU33Gici/VwVeV3yG6QWzQkkHHoShsKf7ycbXaJE9mMJn9j/4jLwotKgGKf1DgXy
         Stc4pdgz5pnf8ZU6GUZyl71vPJ4ZtSlbOUx67yDSGp9ls2MjlAkFFRR8ulkGlHqV5hAy
         +h3lJjwcWGrDPI4FFPVTHaABgJlXisBlSaa70/ULdWtdRGmtEE41a8B/xYWF4Oi3teJo
         0wdxYpaqYUPWLD0SdRQFgqF7r2eer0xsXkTB9nKHIfbJqkfwgbSkGGd7cKwkNGfHqQ3+
         ScuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KDHt8rTEQEteKpcLPR9BQ8oUD9BiuWpeuA5sV9+beto=;
        b=6uaQ3wTvxj5mdGHse3Gxz0fwfEo+EymFRMgrBYJjR4LIfqFe9K6mzWY0qgZmyMmovt
         JZ1N3zCTV2A6Nsb68BJSLsAdZ6+MR8QT1wIQLtA25uEH1Chh4tieeekquZ3vm9S6O1ns
         GqDqsUrqxZM9cG7xpOL6MwoYE5ApzKDMd+3oekfbGTJb6ef2MeJDTWzDyVE9rOrZFVMy
         u38AAChClUsN7xcvr0N4wCicxwPQ5tgM1ZNg9aliOeTxq9BKpGZ8U+gIw+5f23dNMa8e
         DFCNpI/9SpUr5A6Jw5bIOEH3iGD9L+siUkpR7Hc+jOlNP++10hXEVpXN7Vt4IsOzGXPW
         mDwg==
X-Gm-Message-State: AJIora/MmD77p3YcrnB3uECcR3+GGwJzwoJN9YL7Wdgk3UyRr7MvyX/B
	Kys7mzDB/E/5KuLUreK/f47n/Q==
X-Google-Smtp-Source: AGRyM1sjNovknLmHovCVaS9QjQl8WpwA6fXxX0ajD9dNmRh1gL3YDFpxx/oVrw29dsWBBYATiX/Vlw==
X-Received: by 2002:a17:90b:380b:b0:1e6:67f6:f70c with SMTP id mq11-20020a17090b380b00b001e667f6f70cmr12332003pjb.120.1655330944008;
        Wed, 15 Jun 2022 15:09:04 -0700 (PDT)
Date: Wed, 15 Jun 2022 15:09:01 -0700
From: Jens Wiklander <jens.wiklander@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] xen/arm: smccc: add support for SMCCCv1.2
 extended input/output registers
Message-ID: <20220615220901.GA43803@jade>
References: <20220609061812.422130-1-jens.wiklander@linaro.org>
 <20220609061812.422130-2-jens.wiklander@linaro.org>
 <alpine.DEB.2.22.394.2206101733020.756493@ubuntu-linux-20-04-desktop>
 <20220615155825.GA30639@jade>
 <588f9903-2a0e-a546-912a-24d2a13c3c6f@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <588f9903-2a0e-a546-912a-24d2a13c3c6f@xen.org>

On Wed, Jun 15, 2022 at 08:01:28PM +0100, Julien Grall wrote:
> Hi,
> 
> On 15/06/2022 16:58, Jens Wiklander wrote:
> > On Fri, Jun 10, 2022 at 05:41:33PM -0700, Stefano Stabellini wrote:
> > > >   #endif /* __ASSEMBLY__ */
> > > >   /*
> > > > diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> > > > index 676740ef1520..6f90c08a6304 100644
> > > > --- a/xen/arch/arm/vsmc.c
> > > > +++ b/xen/arch/arm/vsmc.c
> > > > @@ -93,7 +93,7 @@ static bool handle_arch(struct cpu_user_regs *regs)
> > > >       switch ( fid )
> > > >       {
> > > >       case ARM_SMCCC_VERSION_FID:
> > > > -        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_1);
> > > > +        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_2);
> > > >           return true;
> > > This is going to be a problem for ARM32 given that ARM_SMCCC_VERSION_1_2
> > > is unimplemented on ARM32. If there is an ARM32 implementation in Linux
> > > for ARM_SMCCC_VERSION_1_2 you might as well import it too.
> > > 
> > > Otherwise we'll have to abstract it away, e.g.:
> > > 
> > > #ifdef CONFIG_ARM_64
> > > #define ARM_VSMCCC_VERSION ARM_SMCCC_VERSION_1_2
> > > #else
> > > #define ARM_VSMCCC_VERSION ARM_SMCCC_VERSION_1_1
> > > #endif
> > 
> > I couldn't find an ARM32 implementation for ARM_SMCCC_VERSION_1_2. But
> > I'm not sure it's needed at this point. From what I've understood r4-17
> > are either preserved or updated by the function ID in question. So
> > claiming ARM_SMCCC_VERSION_1_2 shouldn't break anything.
> 
> So in Xen, we always take a snapshot of the registers on entry to the
> hypervisor and only touch it when necessary. Therefore, it doesn't matter
> whether we claim to be complaient with 1.1 or 1.2 based on the argument
> passing convention.
> 
> However, the spec is not only about arguments. For instance, SMCCC v1.1 also
> added some mandatory functions (e.g. detection the version). I haven't
> looked closely on whether the SMCCC v1.2 introduced such thing. Can you
> confirm what mandatory feature comes with 1.2?

There's a nice summary in a table at the end of the C version of DEN0028
you linked below. For SMCCC v1.2:
Argument/Result register set:
Permits calls to use R4—R7 as return register (Section 4.1).
Permits calls to use X4—X17 as return registers(Section3.1).
Permits calls to use X8—X17 as argument registers (Section 3.1).
Introduces:
SMCCC_ARCH_SOC_ID (Section 7.4)
Deprecates:
UID, Revision Queries on Arm Architecture Service (Section 6.2)
Count Query on all services (Section 6.2)

As far a I can tell nothing mandatory is introduced with version 1.2.

> 
> Furthermore, your commit message explain why arm_smccc_1_2_smc() was
> introduced. But it seems to miss some words about exposing SMCCC v2.1 to the
> VM.
> 
> In general, I think it is better to split the host support from the VM
> support. The two are technically not independent (caller vs implementation)
> and there are different problematics for each (see above for an example). I
> don't think there are a lot to add here, so I would be OK to keep it in the
> same patch with a few words.
> 
> Lastly, can you provide a link to the spec in the commit message? This would
> help to find the pdf easily. I think in this case, you are using
> ARM DEN 0028C (this is not the latest but describe 1.2):
> 
> https://developer.arm.com/documentation/den0028/c/?lang=en

I'll update the commit message.

Thanks,
Jens

