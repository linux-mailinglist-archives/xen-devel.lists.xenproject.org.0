Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3880AD6E3A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 12:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012829.1391336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfVY-0006oN-An; Thu, 12 Jun 2025 10:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012829.1391336; Thu, 12 Jun 2025 10:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfVY-0006mT-7l; Thu, 12 Jun 2025 10:50:08 +0000
Received: by outflank-mailman (input) for mailman id 1012829;
 Thu, 12 Jun 2025 10:50:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDy9=Y3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPfVW-0006gJ-DQ
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 10:50:06 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fef90128-477a-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 12:50:03 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so487744f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 03:50:03 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a56199b23bsm1637219f8f.39.2025.06.12.03.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 03:50:02 -0700 (PDT)
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
X-Inumbo-ID: fef90128-477a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749725403; x=1750330203; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dn/4vU6e0a7VCrORAuqi9+VNzy6T/ohj4+QcDrDzcSc=;
        b=v25W3dP4SCljlIk/UicnvgmaUA+hvk6cIkqYu0c/K/tKWQ/PaaF3zIIq9b2exShtBO
         mwIDpTKEheUp3gneTi7iOQMTG9L5wgMPULlvGcXUJ72Zliqp6QW0CtpcFV1nF/e0GqEG
         +UOB7L4oq2hKLB8/yUmgkeNi0C4nFf/GtZvtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749725403; x=1750330203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dn/4vU6e0a7VCrORAuqi9+VNzy6T/ohj4+QcDrDzcSc=;
        b=aFoYP+S5v9FBcm112aKCXrsZbxlXlB3N/Zh6yFEnoc1EoCSN19JWb5eL++VHBoJP2H
         ys2yBLmI0saxERJzX77/WLT8fjokGpY7NY6MDvFi5NNbXkAvpTNjkfet2ug7G3ro5Ndm
         PzlvsVCDPDGBa97HlzP6lt5mFztTnQYqO3Ubmq30nDqIItlLHQdcDxNh2jB/XqrSIxUw
         5JsxGUFuud/5OX73k5Vi/r3jgvxN0Vx6kinG1cDMwHaVs9/X4zqGK/SHey6SpTlwmyT0
         vBVVoT3PGdIeSJEtIGIbzPIZFMUc9RuaIDXSDJt3NtoH8YWmFEMCBbu7HcG5xUKc1If2
         86ww==
X-Forwarded-Encrypted: i=1; AJvYcCV3v8vK22BL0xb3pgs/g9Lwk8+g4RNk/usOBXrgaXS1xPxt+xxu+QFGIQvqU0uSDAgf6bZT7PNxVow=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGHJNFtF2kmdjrkA1mqDJ/a2EwMLrmUYELvz3BKdrWDUHxRUfD
	E6P3RX4slRMHIqV28IISCHYbBMd1FLP7lZRnpfJ0JBgUML18wJ50sxcq+1mgLWiSRZg=
X-Gm-Gg: ASbGncvQPb1Rb6oIWBr94prmLOwp706ZxS6Z3a8cIg7CFVawL2oEX9eXr3BxU+l8Rij
	O9AUzAfOzchPb90UAx8hO25oVq/EV7midE4oS7mY4eYdJV0a7iNhV4OW0C0ikp9rWPQf0tTeM/D
	iNZoMlnp/G8//g81D7X767GWav+jS8AbizuvTm0ZGY8F2tRESvjOGgVJ5PzKNSH6epXHd9fpwjK
	iAfxjMv/sc3kl/F7dkwn0IoI+bH5S6Pc18SKNxTOwft+xI4UAqe/OY7ZMHBF9ycKlNUxqePzkgz
	yCYovVYQUIkUTtwW1kGAxa78XfZMF2lG1jJQyq83h5+HG8kjZSQf0WJKzQpFd8AiRwPEgDq5wI+
	0NsEOmSp6/u9dWnvl5JIMAkdIe4Cq2A==
X-Google-Smtp-Source: AGHT+IE52o78Y2Irnx5FuPYQjfxDTExsSKUTRK0j6o83vJaYMQxm73xWIejQSXahvtxhkiWfos8QMA==
X-Received: by 2002:a05:6000:290e:b0:3a3:7117:1bba with SMTP id ffacd0b85a97d-3a5608ca301mr2695082f8f.24.1749725403299;
        Thu, 12 Jun 2025 03:50:03 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:50:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 4/8] pdx: provide a unified set of unit functions
Message-ID: <aEqw2jvAeVoXxJHQ@macbook.local>
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-5-roger.pau@citrix.com>
 <46fb8be4-2562-45b5-a2da-0c7c741f227f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <46fb8be4-2562-45b5-a2da-0c7c741f227f@suse.com>

On Thu, Jun 12, 2025 at 10:32:17AM +0200, Jan Beulich wrote:
> On 11.06.2025 19:16, Roger Pau Monne wrote:
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -255,6 +255,10 @@ void __init init_pdx(void)
> >  {
> >      const struct membanks *mem = bootinfo_get_mem();
> >      paddr_t bank_start, bank_size, bank_end;
> > +    unsigned int bank;
> > +
> > +    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
> > +        pfn_pdx_add_region(mem->bank[bank].start, mem->bank[bank].size);
> 
> In patch 6 you touch all these call sites again - why not add the 3rd
> parameter / argument in this patch right away?

It's not consumed for the PDX mask compression, but I can indeed add
the extra parameter here.

