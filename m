Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 289A5965C8A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 11:19:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786305.1195885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjxn0-00019N-86; Fri, 30 Aug 2024 09:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786305.1195885; Fri, 30 Aug 2024 09:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjxn0-000178-4m; Fri, 30 Aug 2024 09:19:30 +0000
Received: by outflank-mailman (input) for mailman id 786305;
 Fri, 30 Aug 2024 09:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oDj5=P5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sjxmz-000170-6L
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 09:19:29 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f47ec570-66b0-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 11:19:27 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42bac9469e8so13346875e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 02:19:27 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749efb1682sm3430744f8f.101.2024.08.30.02.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 02:19:26 -0700 (PDT)
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
X-Inumbo-ID: f47ec570-66b0-11ef-a0b1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725009567; x=1725614367; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ha5BRDxljk1GTSThvun3hVuf0A3qFlheOk9/zjHZDaY=;
        b=hZnVVZx3PnnH/aSnVa1zzGJO7p9O74AAAUdmE/DHqiuAH2OxpFWKfXd8pqXigzOF46
         h0VULfxXGe5NJR4oF68hlwZRlm0c/d5zQIacoiHmg4xQtho1+e+G7HiNg4i4vCCYTMLN
         pJdAUf7RtzZZyOFQYAYAqoOfPiTts6EgJ06lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725009567; x=1725614367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ha5BRDxljk1GTSThvun3hVuf0A3qFlheOk9/zjHZDaY=;
        b=oEI3SufJZWYhlW3E2g7m+TVGQq1ZgAKhGm4fApevK5f3BEy28g5BHvN5bHfysLGhNm
         118KX6lf4XFSg2G7VTkGGwaS7JElTVr/BBfz0SfGOsN1kt9sxF3vt5KkpBMIKozifNsj
         x8IVa4HxE0mCOgy5nYMW2rcDpKL1CxpT6auLiZ8VV6yu0UDsWEySULDM5yHc74FLrpjt
         FiTX3PVdjyKS2GSS7ONn4UcBFKkP4KbieLPLonX55HNbmOptAka1yvZwbOElAJBnSfix
         yffbxuSp9dW1EoOl8TjPX1RUGzFjXj/j6okrylX5d3yoYpS0iEs35VCaXtqD/RrKt+dv
         PWeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJQA0JuKRD9az0/em//EwVHxEm6/QMD56vcgtuD/yUcf80APwbNnPRH5bj8cHDs2axYY1HpBsNmLM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0eJNGnVsA5XdYnDHEzM8N4NtwFQEI2FkZebEL7cfh/HVg/WXQ
	rauQnRprXyTv00N2nfiHLiiJMb52787U5TLNIvTwXmGXjKnGa43YeIZ1D3MLIGw=
X-Google-Smtp-Source: AGHT+IFw0D5IVxgOTCm8NnoiaDYtJ6rmDLC5L4rVeEQ+pPLESJ3mHqg+8C5pz7qkvzOn/0YyjOLX5Q==
X-Received: by 2002:a05:600c:3b11:b0:426:5f8f:51a4 with SMTP id 5b1f17b1804b1-42bb0258ac3mr42854415e9.12.1725009566389;
        Fri, 30 Aug 2024 02:19:26 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:19:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/pv: Make cr4_pv32_mask be PV32-only
Message-ID: <ZtGOnQVY4SiEK63o@macbook.local>
References: <20240829183817.2807665-1-andrew.cooper3@citrix.com>
 <77e852b6-1336-4289-87f2-9cefe2e6fd04@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77e852b6-1336-4289-87f2-9cefe2e6fd04@suse.com>

On Fri, Aug 30, 2024 at 09:55:12AM +0200, Jan Beulich wrote:
> On 29.08.2024 20:38, Andrew Cooper wrote:
> > The user of cr4_pv32_mask (the cr4_pv32_restore() function) only exists in a
> > CONFIG_PV32 build, but right now the variable is unconditionally set up.
> > 
> > To start with, move the setup into set_in_cr4() and remove it from it's
> > somewhat ad-hoc position in __start_xen().  This means the variable will be
> > set up in two steps for a CONFIG_PV32=y build, but it's cleaner and more
> > robust logic overall.
> > 
> > With that, there's no good reason for the variable to stay in setup.c.  Move
> > it to x86/pv/traps.c (for want of any better place to live), and move the
> > declaration to beside set_in_cr4() and mmu_cr4_features which is a better
> > position than setup.h.
> > 
> > Guard the reference with CONFIG_PV32, and fix up a recent typo in an adjacent
> > comment while at it.
> > 
> > No functional change.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with a suggestion:
> 
> > --- a/xen/arch/x86/pv/traps.c
> > +++ b/xen/arch/x86/pv/traps.c
> > @@ -18,6 +18,10 @@
> >  #include <asm/traps.h>
> >  #include <irq_vectors.h>
> >  
> > +#ifdef CONFIG_PV32
> > +unsigned long __ro_after_init cr4_pv32_mask;
> > +#endif
> 
> To save on the number of such #ifdef-s, how about moving this into an existing
> one. pv/mm.c has one, albeit near the bottom of the file (which I'd be fine
> with, but I could imagine you or others not liking such placement), and
> pv/domain.c has one near the top which seems pretty well suited.

I'm fine either way:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

