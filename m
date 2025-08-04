Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF0EB19FBB
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 12:29:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069059.1432899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uisRO-0007zF-90; Mon, 04 Aug 2025 10:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069059.1432899; Mon, 04 Aug 2025 10:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uisRO-0007xG-5d; Mon, 04 Aug 2025 10:29:14 +0000
Received: by outflank-mailman (input) for mailman id 1069059;
 Mon, 04 Aug 2025 10:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEzl=2Q=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uisRM-0007wy-MN
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 10:29:12 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbfb706c-711d-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 12:29:10 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-458b2d9dba5so15265935e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 03:29:10 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459db13fc9fsm30856485e9.7.2025.08.04.03.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 03:29:09 -0700 (PDT)
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
X-Inumbo-ID: dbfb706c-711d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754303350; x=1754908150; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8vClUXJhUpuoh7CnHcfaCZgW4SzxzXpIo0zCxVTo3fg=;
        b=URBuPBdy6nvEmEqH/5ZrdMiH+9WvxgYvRPEIUdlpfFLbi7GmUsl0KIgcGHoIcBMwX/
         LmpNq2XX7qQO9Pk8I/CFD4P0MwYJOmoHj9Y81p7FRNKF3qOh0nfd6uE9HT090dfjVcqW
         IUiD7MCffGbFkCgJ0DhnZAK8oBjfr021thXQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754303350; x=1754908150;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8vClUXJhUpuoh7CnHcfaCZgW4SzxzXpIo0zCxVTo3fg=;
        b=hbWnLq2rtJIh49sKki6TswgixIIM40WEED5KO42Nq9EgLwMO86XMYyNm8BdtBoOcCt
         xSE6Uk+wgB8fIyAiU4KH89S9BWkrDKWxW8nuLv+Eo9vibL2U6cE70+M54AAZTwiNvJAQ
         mKDZFIHe8FgWpGHRT4R8u59Jj0RIBQOXb58OccGUN76LBUnDbydZaf0t0zt4JHdCMCDQ
         D+4kWifF6GccXAe8Ro2tFq9EkaApgXfya+b0WXx37VlD8BeIh5EJ9ghf1NhntUekLLpU
         7iad/W2A6/781R2SO4ldfbollnGSwzyieksQJd9V5XKEGloKlQkLLjPjuyEyoL5+Pu5G
         n61Q==
X-Gm-Message-State: AOJu0YyS2JxBNQqholZJW5ypqOPEEC2Oop5l2viU7TKKV4YGPIS8NDl6
	F+zOjD0TqdHEro7R3S7Fclwt+uoMUPOGGlD/pnpNTY1fsssezdiAnvJrQfifkqyw5Hw=
X-Gm-Gg: ASbGnctpOXwciyFtIHJIdJxG/vuFeVZDqcfD9s91+duCdt76L3RNZCIc7JgExzPBcWV
	8cfGCWg+xlDSOf9FrkSFC2+fFV/zKHpzSc0nQ9NEaw3WczpC6Xdl41+Fkb8PY0t2afgX9P9OWfb
	7osh5DnBV2SLQrLYUyqrNT3oQgDlC0bqh/3EzD5/066Fjc1kxv5nG8jYEkqI6HpY9gc3FF6+u6X
	so5qGhkuGla16scqApmBTcrYLfock+MeSe3ysQwkq66/ulTk3bU4Njl1SLX1dWf1I6yZr+NM2kb
	t82lvC7rIKNZyeBQERFVaDGeXdus1TP9nfdp6MLpwacX/trrbsfTyxm1oo0VGW1msRxHpOAKVp1
	Je0Mwpa5Wd20GrbYE+w94IcTd5sBUZso+IXt2r0QjXi2kcnArYOkKkyMQ2+unQTrKfg==
X-Google-Smtp-Source: AGHT+IEgLLRi277VF7PhGUVEIscnnyYelwd8YqyTSKre0u1CCFwQRh+iN671coCn7Yh5ObFJY6PaZQ==
X-Received: by 2002:a05:600c:1e87:b0:456:1121:3ad8 with SMTP id 5b1f17b1804b1-458b69de1e5mr72175415e9.10.1754303350190;
        Mon, 04 Aug 2025 03:29:10 -0700 (PDT)
Date: Mon, 4 Aug 2025 12:29:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 4/8] pdx: allow per-arch optimization of PDX
 conversion helpers
Message-ID: <aJCLdAF21yTc6_yZ@macbook.local>
References: <20250724110416.2081-1-roger.pau@citrix.com>
 <20250724110416.2081-5-roger.pau@citrix.com>
 <4a051d46-d2f9-4dd7-9927-146834054579@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a051d46-d2f9-4dd7-9927-146834054579@citrix.com>

On Tue, Jul 29, 2025 at 03:54:24PM +0100, Andrew Cooper wrote:
> On 24/07/2025 12:04 pm, Roger Pau Monne wrote:
> > diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
> > index 4565baca6a4d..cec13c889dab 100644
> > --- a/xen/arch/arm/include/asm/Makefile
> > +++ b/xen/arch/arm/include/asm/Makefile
> > @@ -5,6 +5,7 @@ generic-y += hardirq.h
> >  generic-y += iocap.h
> >  generic-y += irq-dt.h
> >  generic-y += paging.h
> > +generic-y += pdx.h
> >  generic-y += percpu.h
> >  generic-y += random.h
> >  generic-y += softirq.h
> 
> Please could I talk you into using __has_include__, as I'm slowly trying
> to purge asm-generic.
> 
> > diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
> > index 10153da98bf1..91fc32370f21 100644
> > --- a/xen/include/xen/pdx.h
> > +++ b/xen/include/xen/pdx.h
> > @@ -159,6 +159,14 @@ static inline paddr_t directmapoff_to_maddr(unsigned long offset)
> >  
> >  #endif /* CONFIG_PDX_MASK_COMPRESSION */
> >  
> > +/*
> > + * Allow each architecture to define it's (possibly optimized) versions of the
> > + * translation functions.
> > + *
> > + * Do not use _xlate suffixed functions, always use the non _xlate variants.
> > + */
> > +#include <asm/pdx.h>
> > +
> 
> You want:
> 
> #if __has_include__(<asm/pdx.h>)
> # include <asm/pdx.h>
> #else
> 
> // common defaults.
> 
> #endif
> 
> here.  This lets you implement the x86 special case only, and keeps all
> the common logic in one file.

Sure, I wasn't aware of this functionality.

Thanks, Roger.

