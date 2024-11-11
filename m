Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAE29C3CFB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 12:21:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833585.1248759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASTJ-000735-50; Mon, 11 Nov 2024 11:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833585.1248759; Mon, 11 Nov 2024 11:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASTJ-00071S-2D; Mon, 11 Nov 2024 11:20:41 +0000
Received: by outflank-mailman (input) for mailman id 833585;
 Mon, 11 Nov 2024 11:20:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bt5q=SG=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tASTH-0006zz-Mh
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 11:20:39 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f409e7a8-a01e-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 12:20:27 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-539f84907caso4826521e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 03:20:27 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6b3069sm205544935e9.14.2024.11.11.03.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 03:20:26 -0800 (PST)
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
X-Inumbo-ID: f409e7a8-a01e-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzMiLCJoZWxvIjoibWFpbC1sZjEteDEzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY0MDllN2E4LWEwMWUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzI0MDI3LjcwNzczMiwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731324027; x=1731928827; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cLCnNZS6Bpxyv+irrui2Z+UG4rtfjjtYcD7+pZnjUk=;
        b=RQhzy+nzkuSgwLNk9QJJ75xCjjaVz45QnZrwI0yWZ2qRSvd/HaigcnkCGrarRtqYwB
         d5XxFV8prCGce+KvIrOiXgYYUrE11AyTosToFX8/lM51/YUY2DtALo9LfNF38lv1eKTT
         crV00YL5VEsZgqv6Hw//a4zF1t05/CthJGSlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731324027; x=1731928827;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7cLCnNZS6Bpxyv+irrui2Z+UG4rtfjjtYcD7+pZnjUk=;
        b=QgpeLXlx+SPPZm+q/SeijSkLPJwlO4CqTNS9/qcl8qzFmuwqHhbBEhuG6Xc+40fiJo
         UYPeqYf2u5s2eXrU/2zXSiXMTCw4mHsXqosSnmA0yI77aPZiBm3Cjbp2bUEN7xL13K9q
         HC3bF4vAxRTDF2j4xfKRfBqnijq6eVQTaRCXodRarGnmpvx6AURVhMEPAGCcZdPFHfco
         EOtaWdvsCptEDlP6FDJsTyzqnOYFY66vwOLQR8Q/ZME+vqg6KZhhfTnmq62vTq3f1Cri
         X7xTSYPx/CyDztmoqUn0E2Ma7/+XtBoQIlRXG61YqbczKfcLbuJFJbPNM7U2z5t9weQG
         76DA==
X-Forwarded-Encrypted: i=1; AJvYcCUHSxX7vF3+FUs6BuYpII6davFUfwt8hygkQz5xz+RNG/WA1k96mAmEwxGgn1oSpm9X9P6FFH1PEB0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlzQ5uEj5wxYwfWFA5V4Gt90kyju3AJsb37icNEvlR7M1ldpnb
	C/Enm6D4ros7KnREaJDs3ORDE4sRpjWoh9vxdyCY3zazqPwUvj/Vyz1mieKYXog=
X-Google-Smtp-Source: AGHT+IGm5PlLX5ER66zzzG927PptR0yPJG3wMkLpZPQBPiEE3dVaO+E0m2RIC6jjvULgaxUqEBasgQ==
X-Received: by 2002:a05:6512:1386:b0:53b:1526:3a48 with SMTP id 2adb3069b0e04-53d862c57cdmr4548188e87.14.1731324027043;
        Mon, 11 Nov 2024 03:20:27 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 Nov 2024 11:20:24 +0000
Message-Id: <D5JB58LVN4T6.1IUNQ15AHO1RV@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>
Subject: Re: [PATCH v7 04/10] tools/hvmloader: Retrieve (x2)APIC IDs from
 the APs themselves
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
 <20241021154600.11745-5-alejandro.vallejo@cloud.com>
 <e8e2385d-b575-4483-ba54-f80c669af9c3@citrix.com>
In-Reply-To: <e8e2385d-b575-4483-ba54-f80c669af9c3@citrix.com>

On Wed Oct 30, 2024 at 11:31 AM GMT, Andrew Cooper wrote:
> On 21/10/2024 4:45 pm, Alejandro Vallejo wrote:
> > diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmload=
er/config.h
> > index cd716bf39245..04cab1e59f08 100644
> > --- a/tools/firmware/hvmloader/config.h
> > +++ b/tools/firmware/hvmloader/config.h
> > @@ -4,6 +4,8 @@
> >  #include <stdint.h>
> >  #include <stdbool.h>
> > =20
> > +#include <xen/hvm/hvm_info_table.h>
> > +
> >  enum virtual_vga { VGA_none, VGA_std, VGA_cirrus, VGA_pt };
> >  extern enum virtual_vga virtual_vga;
> > =20
> > @@ -48,8 +50,9 @@ extern uint8_t ioapic_version;
> > =20
> >  #define IOAPIC_ID           0x01
> > =20
> > +extern uint32_t cpu_to_x2apicid[HVM_MAX_VCPUS];
>
> Just cpu_to_apic_id[] please.=C2=A0=C2=A0 The distinction between x or x2=
 isn't
> interesting here.

I disagree.

While "x" says nothing of interest "x2" does state the width. cpu_to_apic_i=
d is
ambiguous and I've seen no shortage of code in which it's impossible to ass=
ess
its correctness without going to check what the original author meant; and
guesswork is bad for robustness. cpu_to_x2apicid has an unambiguous width a=
t
the meager cost of 2 chars. If you have very strong feelings about it I can
change it, but my preference is to keep it as-is.

>
> HVM_MAX_VCPUS is a constant that should never have existed in the first
> place, *and* its the limit we're looking to finally break when this
> series is accepted.
>
> This array needs to be hvm_info->nr_vcpus entries long, and will want to
> be more than 128 entries very soon.=C2=A0 Just scratch_alloc() the array.=
=C2=A0
> Then you can avoid the include.

That's a major PITA in the libxl side. I'll have a go to see how long it ta=
kes
me before I weep :_)

>
> > diff --git a/tools/firmware/hvmloader/mp_tables.c b/tools/firmware/hvml=
oader/mp_tables.c
> > index 77d3010406d0..539260365e1e 100644
> > --- a/tools/firmware/hvmloader/mp_tables.c
> > +++ b/tools/firmware/hvmloader/mp_tables.c
> > @@ -198,8 +198,10 @@ static void fill_mp_config_table(struct mp_config_=
table *mpct, int length)
> >  /* fills in an MP processor entry for VCPU 'vcpu_id' */
> >  static void fill_mp_proc_entry(struct mp_proc_entry *mppe, int vcpu_id=
)
> >  {
> > +    ASSERT(cpu_to_x2apicid[vcpu_id] < 0xFF );
>
> This is just going to break when we hit 256 vCPUs in a VM.
>
> What do real systems do?
>
> They'll either wrap around 255 like the CPUID xAPIC_ID does, or they'll
> not write out MP tables at all.

Definitely not wrapping around, that makes no sense.

It could also show the first 255 APs only. The reality is that if we're
exposing 1000 vCPUs is because we expect the guest to use them. While it's
likely we want to avoid writing the MP tables, that's not a puddle I want t=
o
play with ATM.

Note that this is not a new breakage. It was already broken if we were to h=
it
such an APIC ID (which we can't because HVM_MAX_VCPUS is lower). I just mad=
e
sure we never write out corrupted tables.

>
> > diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/=
smp.c
> > index 1b940cefd071..d63536f14f00 100644
> > --- a/tools/firmware/hvmloader/smp.c
> > +++ b/tools/firmware/hvmloader/smp.c
> > @@ -90,10 +120,11 @@ static void boot_cpu(unsigned int cpu)
> >          BUG();
> > =20
> >      /*
> > -     * Wait for the secondary processor to complete initialisation.
> > +     * Wait for the secondary processor to complete initialisation,
> > +     * which is signaled by its x2APIC ID being written to the LUT.
>
> Technically all arrays are a lookup table, but I'm not sure LUT is a

No. A look-up table is a very specific implementation of a relation (in the
mathematical sense) between an unsigned integer and some other type,
implemented by means of an array indexed by said integer.

> common enough term to be used unqualified like this.

Happy to change the name if it's uncommon enough in this codebase, but it i=
s
fairly common outside of it, and it's common enough to have its own wikiped=
ia
page with that very acronym.

  https://en.wikipedia.org/wiki/Lookup_table

>
> Just say "... signalled by writing its APIC_ID out."=C2=A0 The where is v=
ery
> apparent by the code.
>
> > @@ -104,6 +135,12 @@ static void boot_cpu(unsigned int cpu)
> >  void smp_initialise(void)
> >  {
> >      unsigned int i, nr_cpus =3D hvm_info->nr_vcpus;
> > +    uint32_t ecx;
> > +
> > +    cpuid(1, NULL, NULL, &ecx, NULL);
> > +    has_x2apic =3D (ecx >> 21) & 1;
> > +    if ( has_x2apic )
> > +        printf("x2APIC supported\n");
>
> You need to check max_leaf >=3D 0xb too.=C2=A0 Remember Xen might not giv=
e you
> leave 0xb yet, and then you'll hit the assert for finding 0.

True.

>
> And has_x2apic wants to be a simple boolean.=C2=A0 Nothing good can come =
from
> confusing -1 with "x2apic available".

Sure

>
>
> I recommend splitting this patch into three.=C2=A0 Several aspects are qu=
ite
> subtle.
>
> 1) Collect the APIC_IDs on APs
> 2) Change how callin is signalled.
> 3) Replace LAPIC_ID() with the collected apic_id.
>
> but AFAICT, it can be done as a standalone series, independently of the
> other Xen/toolstack work.

Ack

>
> ~Andrew

Cheers,
Alejandro

