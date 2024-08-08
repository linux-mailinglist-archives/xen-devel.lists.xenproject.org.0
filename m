Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834FB94C0C0
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 17:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774384.1184838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc4rB-00085U-87; Thu, 08 Aug 2024 15:15:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774384.1184838; Thu, 08 Aug 2024 15:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc4rB-00082u-4g; Thu, 08 Aug 2024 15:15:13 +0000
Received: by outflank-mailman (input) for mailman id 774384;
 Thu, 08 Aug 2024 15:15:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc4r9-00082Y-RU
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 15:15:11 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00b9c7bd-5599-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 17:15:10 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7aada2358fso344746266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 08:15:10 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d437b0sm748171566b.114.2024.08.08.08.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 08:15:09 -0700 (PDT)
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
X-Inumbo-ID: 00b9c7bd-5599-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723130110; x=1723734910; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQsfTtbm6wxPhceWK0RPxgOZV3+hy0lLrq8jTAX0k+E=;
        b=J/byrp+rVxt7RUnr4mrtXNB4EqtuuKoIR9DOPQb6KSUadKRhVtV32/ajZNyxwZr3Aa
         cDWjbtttj9w2lKrN8ByL64xMUCsFU3nLxqpMw4Ja1VmJIaUwcPmC0JrG5tOir3kByG+/
         dmZGgqOf4v+CFe78gDyg6q2KGSPEPOzzRRkqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723130110; x=1723734910;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nQsfTtbm6wxPhceWK0RPxgOZV3+hy0lLrq8jTAX0k+E=;
        b=QjoDLlsmtbSPRCPI3jMftA6tFTFSpOUMCeXKy6Xni0v03I5fVAvjIN5lTSATe8XMd3
         NulkxozfAuqVxnes0DUEMno+J144Aw+2X8YPJDZFjXJtR1WpcR2sqHmEo0uSLCjwdLuK
         nlgP9Ubva/I/bSkmWP8Sd2TcZPFjD56ehZPKZsH1g3RQBfII2EaGcSMJau5GafiLOJv5
         nzQYyo7hPM3GvgY+soS4/SixpC7UgFS5xq/qSxc3oEN5vFn1lfpAhjBgMNYv8HrAE0/T
         JyrRqqafeIxQexx+durdkEqXl9M4fd5i8UnJpwb9gPSawMmc5yx3OsQf5vJVq0Y2UrFt
         GFew==
X-Forwarded-Encrypted: i=1; AJvYcCXF5wCgGQFQzaKH8Ux1AfBZYROEcPdFv8PLds08yJnx38HFPq0VFyecL99LskfIqHco9evuejvJ2enDqWCGeHJ6jA9nr7GxS+6iLlzlqSM=
X-Gm-Message-State: AOJu0YypzdwMZqZ2opu7qFnkpfT82VLL76opdxKFwpl66DsM8vAhOur0
	ExW+z4QlIU7RM6klYIAVUDWG/dYFQhSSR+5pGP2yAHrzcItREgqAxroBxrQGzBQ=
X-Google-Smtp-Source: AGHT+IE2GdmWByIC6V69xcREOw8ahs4Lz7BtWkt0qtVO2whMx17qPqsrkapCOdL33Corg+hp2UCbbQ==
X-Received: by 2002:a17:907:a0c:b0:a72:66d5:892c with SMTP id a640c23a62f3a-a8091f5aba8mr213845966b.18.1723130109928;
        Thu, 08 Aug 2024 08:15:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Aug 2024 16:15:08 +0100
Message-Id: <D3AMN7MFF5ZZ.31YRGBE9ICW4G@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Xen-devel" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 01/10] tools/hvmloader: Fix non-deterministic cpuid()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.17.0
References: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
 <20240808134251.29995-2-alejandro.vallejo@cloud.com>
 <b1b7eaea-450c-44bd-b97a-491183a292ff@suse.com>
In-Reply-To: <b1b7eaea-450c-44bd-b97a-491183a292ff@suse.com>

On Thu Aug 8, 2024 at 3:10 PM BST, Jan Beulich wrote:
> On 08.08.2024 15:42, Alejandro Vallejo wrote:
> > hvmloader's cpuid() implementation deviates from Xen's in that the valu=
e
> > passed on ecx is unspecified. This means that when used on leaves that
> > implement subleaves it's unspecified which one you get; though it's mor=
e
> > than likely an invalid one.
> >=20
> > Import Xen's implementation so there are no surprises.
> >=20
> > Fixes: 318ac791f9f9 ("Add utilities needed for SMBIOS generation to
> > hvmloader")
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> Minor remark: A Fixes: tag wants to go all on a single line.

Noted for next time.

>
> > --- a/tools/firmware/hvmloader/util.c
> > +++ b/tools/firmware/hvmloader/util.c
> > @@ -267,15 +267,6 @@ memcmp(const void *s1, const void *s2, unsigned n)
> >      return 0;
> >  }
> > =20
> > -void
> > -cpuid(uint32_t idx, uint32_t *eax, uint32_t *ebx, uint32_t *ecx, uint3=
2_t *edx)
> > -{
> > -    asm volatile (
> > -        "cpuid"
> > -        : "=3Da" (*eax), "=3Db" (*ebx), "=3Dc" (*ecx), "=3Dd" (*edx)
> > -        : "0" (idx) );
>
> Compared to the original ...
>
> > --- a/tools/firmware/hvmloader/util.h
> > +++ b/tools/firmware/hvmloader/util.h
> > @@ -184,9 +184,30 @@ int uart_exists(uint16_t uart_base);
> >  int lpt_exists(uint16_t lpt_base);
> >  int hpet_exists(unsigned long hpet_base);
> > =20
> > -/* Do cpuid instruction, with operation 'idx' */
> > -void cpuid(uint32_t idx, uint32_t *eax, uint32_t *ebx,
> > -           uint32_t *ecx, uint32_t *edx);
> > +/* Some CPUID calls want 'count' to be placed in ecx */
> > +static inline void cpuid_count(
> > +    uint32_t leaf,
> > +    uint32_t subleaf,
> > +    uint32_t *eax,
> > +    uint32_t *ebx,
> > +    uint32_t *ecx,
> > +    uint32_t *edx)
> > +{
> > +    asm volatile ( "cpuid"
> > +          : "=3Da" (*eax), "=3Db" (*ebx), "=3Dc" (*ecx), "=3Dd" (*edx)
> > +          : "a" (leaf), "c" (subleaf) );
>
> ... you alter indentation, without it becoming clear why you do so. Imo
> there are only two ways of indenting this which are conforming to our
> style - either as it was (secondary lines indented by one more level,
> i.e. 4 more spaces) or
>
>     asm volatile ( "cpuid"
>                    : "=3Da" (*eax), "=3Db" (*ebx), "=3Dc" (*ecx), "=3Dd" =
(*edx)
>                    : "a" (leaf), "c" (subleaf) );
>
> I guess I'll take the liberty and adjust while committing.
>
> Jan

Sure, I don't mind about that.

As for the indentation difference, the inline assembly is taken quasi-verba=
tim
from arch/x86/include/asm/processor.h. That one happens to have this
indentation.

Cheers,
Alejandro

