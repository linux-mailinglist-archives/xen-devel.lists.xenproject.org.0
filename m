Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C4498564C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 11:25:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803676.1214391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOGV-0003oD-NC; Wed, 25 Sep 2024 09:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803676.1214391; Wed, 25 Sep 2024 09:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOGV-0003ll-K4; Wed, 25 Sep 2024 09:24:55 +0000
Received: by outflank-mailman (input) for mailman id 803676;
 Wed, 25 Sep 2024 09:24:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stOGT-0003dB-Th
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 09:24:53 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04dea42f-7b20-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 11:24:52 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c718bb04a3so1757787a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 02:24:52 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f5489dsm187908566b.75.2024.09.25.02.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 02:24:51 -0700 (PDT)
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
X-Inumbo-ID: 04dea42f-7b20-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727256292; x=1727861092; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uvVNLDz9LtPQBKA+S9DmOOgYyPJUbE71lugjZ2arM/M=;
        b=Ns0yh8Z5IMd2KBNQfC/9G41wgVRCKo8WdsyEkk70IK3WurkmPj/hjv6Bds2yIJAS/L
         5WaB8gm8H2gHqte2cxQcqig2XI3N9eUWpTJBurzKoOPF/vAoeAnoJiuPYL0b4kmjwFAP
         pnQgBI6NrSQOz7I2gfxM+dB/NwiFUM9aFPZYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727256292; x=1727861092;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uvVNLDz9LtPQBKA+S9DmOOgYyPJUbE71lugjZ2arM/M=;
        b=bsukd0rTI3FeqM4DtDFlH7HfMR7s6TQ6Oqophk/3bEMFssC/5geQJWmHrLi6Lq0ajI
         ZRhhElxChB+bCoEjX6t7wmR5bYmI3RfTKZeqNs1T4PXJe9pmLWMwXwEbdJsxyXCHIHZ3
         upxOu0KSW0JqWdHRPQbbbQ1149w/JdcUUcAHtKdJC3lXlaTB1OsiG5DuEYCdDtC1qz39
         Bs1Y8jb+PZqRstJhp70/pdaC5QxNmLyiyNZyRhFTlhxHlfrO+TNBtNHlednrds7rt4IF
         TVpF+us+lz97cNwr04Q9wD0GmZmoxqO8aiCA3QubovrHVbUU0YuaDU0qP8xP7R3tTZH4
         MUNQ==
X-Gm-Message-State: AOJu0YyTx+I+QcN2hEMtla/mvHZ2vcEV599Gvt2of3Lwp0w/sww0lobd
	8XTxSmhmFKCOQRHooo/ASWwlBClEyVP4KWGngvJGItLSJCzpu3wM51suvz5ct3M=
X-Google-Smtp-Source: AGHT+IEve8qtfzzE7kL2vkBVtcTeAiXYC30a+99bPnNmBrUu60W4pi7hqAm0eeoXKUWOc4q51CQH/A==
X-Received: by 2002:a17:907:7f88:b0:a90:41a5:bb58 with SMTP id a640c23a62f3a-a93a03744admr188761066b.16.1727256291709;
        Wed, 25 Sep 2024 02:24:51 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:24:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 6/6] x86/alternative: build time check feature is in
 range
Message-ID: <ZvPW4pNP5vlkA6du@macbook.local>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-7-roger.pau@citrix.com>
 <07b73cc7-2129-4ef8-8bc5-f85417f74ea7@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07b73cc7-2129-4ef8-8bc5-f85417f74ea7@citrix.com>

On Wed, Sep 25, 2024 at 09:51:36AM +0100, Andrew Cooper wrote:
> On 25/09/2024 9:42 am, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
> > index 69555d781ef9..b7f155994b2c 100644
> > --- a/xen/arch/x86/include/asm/alternative.h
> > +++ b/xen/arch/x86/include/asm/alternative.h
> > @@ -7,6 +7,7 @@
> >  #include <xen/lib.h>
> >  #include <xen/stringify.h>
> >  #include <asm/asm-macros.h>
> > +#include <asm/cpufeatureset.h>
> >  
> >  struct __packed alt_instr {
> >      int32_t  orig_offset;   /* original instruction */
> > @@ -59,6 +60,9 @@ extern void alternative_branches(void);
> >                      alt_repl_len(n2)) "-" alt_orig_len)
> >  
> >  #define ALTINSTR_ENTRY(feature, num)                                    \
> > +        " .if " __stringify(feature) " >= " __stringify(NCAPINTS * 32) "\n"\
> 
> Please use STR() from macros.h.  It's shorter, and we're trying to
> retire the use of __stringify().

Oh, yes, indeed.  I just copied from the surrounding context and
forgot about STR().

> Happy to fix on commit.  Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Sure, thanks.

Roger.

