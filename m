Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C29AA211CA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 19:46:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878754.1288948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcqaz-0005M1-IF; Tue, 28 Jan 2025 18:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878754.1288948; Tue, 28 Jan 2025 18:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcqaz-0005KA-FT; Tue, 28 Jan 2025 18:45:57 +0000
Received: by outflank-mailman (input) for mailman id 878754;
 Tue, 28 Jan 2025 18:45:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4cq=UU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tcqay-0005K4-Hc
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 18:45:56 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aede02a-dda8-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 19:45:54 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab2aea81cd8so1099021866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 10:45:54 -0800 (PST)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6914e56a2sm608223866b.94.2025.01.28.10.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 10:45:53 -0800 (PST)
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
X-Inumbo-ID: 1aede02a-dda8-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738089954; x=1738694754; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bD4eyHKxLm4mD8wo182CvRVC4pDKYF0hvlY36UdSX2E=;
        b=FYZFAZDof+usyAnelOoBCID6mhBLVE1MeZDgRRzw8WulSDF/NrXWFOQTTK/rgaBu/Z
         756iG4+CD2hwDlBrPnSqniRw0nuPNf0VwsdHoT+uk5MaL8G+brInkUf7KWt59cNagthl
         S4RpcmBUSX8uTNM030Cyg33dqSKrIBxHetfMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738089954; x=1738694754;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bD4eyHKxLm4mD8wo182CvRVC4pDKYF0hvlY36UdSX2E=;
        b=bYlfABK2YNcCiWJaYoNHQ+TA2vOpSrJwfVk5rs1/qp++q//MS0yGT2/tR/Xy6rh2x+
         MM1lOYOQdW2V6knAYIwaAWS+Za2YG0DDgNc8KVcROdz/CVfKyr83GoJdkwT5oQcKozcg
         Xu1mfuS4tOeFpGjqDGZgf5FzAiXhtWD56TPzYkDPs+Kq0qnodMA9ttI40/c6w0ErwqM6
         +bS0F7oU3aOTWBemdzzO4KaHnDnvVkKszTApaioABLsa6pThyieH5ZBTeUhDc9PhIBNS
         IDFqsVbC/SXLW/W8pcevwmJ+mP6uklh8+igD7ynXaAPjz8GNCJr3U8uhPZ65p8T3o6UU
         DZPQ==
X-Gm-Message-State: AOJu0YwohympYqX+DO0faqJuLVZmhd+O0aTQ5ocKuxvSPXcJOsqt5ErG
	CNsf1X9KpKI9y1/ZF2V5lRWSmfFAtec9iHnVwe8jM3hc0W7Q1vAmHZVgNDqbkQY=
X-Gm-Gg: ASbGncshEskDN6NoxlHtt/oZNKKoYvA9OYKEctHM+wNK+bex1pVcmc7h5iFf3YLqgHL
	8KLsFfP5V0UwQX9me2Tu0JYn38Uh+edsFWje8T1pqfDdzLQAcGbkoZbDsQs7FUrQNDRqoJg2C/6
	m2ul+opPPqKpdCuzCLiwBNGVwTQ/TbmEZ73Kn2/XmJL8amHad+2TmTa1rw8UkPYdVS3dEyW8D+C
	9ibgF/d6+axp1UWw/NbhecSPveJnqpP9CIEPXsFtXbEXtJSyAzBetWtC3CD5Ab0RjFzb3Aq+gGu
	zb1truzhZRfyYXWLVcK8jJRq
X-Google-Smtp-Source: AGHT+IGU5hQdzHGpzfaGJZ5weXmUKRNOT80dDpS4HUDTU1IFi4Isd9gHx9MNcveqxm+ZH6A6973MrQ==
X-Received: by 2002:a17:907:2cc5:b0:aaf:74d6:6467 with SMTP id a640c23a62f3a-ab6cfe11f0cmr19701066b.42.1738089954372;
        Tue, 28 Jan 2025 10:45:54 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jan 2025 18:45:53 +0000
Message-Id: <D7DXGTJ8OZYN.1W70NDFFJW4B@cloud.com>
Subject: Re: [PATCH 1/3] tools/hvmloader: Retrieve (x2)APIC IDs from the APs
 themselves
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, "Jan Beulich" <jbeulich@suse.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>
X-Mailer: aerc 0.18.2
References: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
 <20250128163342.1491-2-alejandro.vallejo@cloud.com>
 <Z5kbD08TFyH0hwwF@macbook.local>
In-Reply-To: <Z5kbD08TFyH0hwwF@macbook.local>

On Tue Jan 28, 2025 at 5:59 PM GMT, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jan 28, 2025 at 04:33:40PM +0000, Alejandro Vallejo wrote:
> > Make it so the APs expose their own APIC IDs in a lookup table (LUT). W=
e
> > can use that LUT to populate the MADT, decoupling the algorithm that
> > relates CPU IDs and APIC IDs from hvmloader.
> >=20
> > Modified the printf to also print the APIC ID of each CPU, as well as
> > fixing a (benign) wrong specifier being used for the vcpu id.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> > Changes from the v7 version of this patch in the longer topology series=
:
> >   * s/cpu_to_x2apicid/cpu_to_apicid/
> >     * Though, as I already stated, I don't think this is a good idea.
> >   * Dynamically size cpu_to_apicid rather than using HVM_MAX_VCPUS.
> >   * Got rid of the ap_callin removal. It's not as trivial if we don't
> >     want to assume cpu0 always has apicid=3D0. Part of the complaints o=
n
> >     the previous versions involved the inability to do that.
> >   * For debugging sanity, I've added the apicid to the CPU boot printf.
> >       * Later on, toolstack will choose the APIC IDs and it's helpful
> >         to know the relationship in the logs.
> >       * While at it, fix the vcpu specifier s/%d/%u/
> >   * Check for leaf 0xb while probing for x2apic support.
> > ---
> >  tools/firmware/hvmloader/smp.c | 43 +++++++++++++++++++++++++++++++++-
> >  1 file changed, 42 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/=
smp.c
> > index 1b940cefd071..c61ed524f947 100644
> > --- a/tools/firmware/hvmloader/smp.c
> > +++ b/tools/firmware/hvmloader/smp.c
> > @@ -31,9 +31,38 @@
> > =20
> >  static int ap_callin;
> > =20
> > +/** True if x2apic support is exposed to the guest. */
> > +static bool has_x2apic;
> > +
> > +/**
> > + * Lookup table of (x2)APIC IDs.
>
> Not sure you need to explicitly mention (x2) in the comment?  It will
> either be xAPIC or x2APIC IDs, but just using "APIC IDs" should cover
> both unambiguously?

Sure.

>
> > + *
> > + * Each entry is populated for its respective CPU as they come online.=
 This is
> > + * required for generating the MADT with minimal assumptions about ID
> > + * relationships.
> > + */
> > +uint32_t *cpu_to_apicid;
> > +
> > +static uint32_t read_apic_id(void)
> > +{
> > +    uint32_t apic_id;
> > +
> > +    if ( has_x2apic )
> > +        cpuid(0xb, NULL, NULL, NULL, &apic_id);
> > +    else
> > +    {
> > +        cpuid(1, NULL, &apic_id, NULL, NULL);
> > +        apic_id >>=3D 24;
> > +    }
> > +
> > +    return apic_id;
> > +}
> > +
> >  static void cpu_setup(unsigned int cpu)
> >  {
> > -    printf(" - CPU%d ... ", cpu);
> > +    uint32_t apicid =3D cpu_to_apicid[cpu] =3D read_apic_id();
> > +
> > +    printf(" - CPU%u[%u] ... ", cpu, apicid);
>
> I would explicitly name the field in the print:
>
> " - CPU%u APIC ID %u ... "
>
> As otherwise it's not obvious what the value in the braces is (and you
> have to go look at the code).

Sure.

>
> >      cacheattr_init();
> >      printf("done.\n");
> > =20
> > @@ -104,8 +133,20 @@ static void boot_cpu(unsigned int cpu)
> >  void smp_initialise(void)
> >  {
> >      unsigned int i, nr_cpus =3D hvm_info->nr_vcpus;
> > +    uint32_t ecx, max_leaf;
>
> Noticed you could narrow the scope of ecx, but at the price of
> introducing the definition line inside of the if condition.  I don't
> have a strong opinion, and I assume you prefer it this way, which is
> fine IMO.
>
> Thanks, Roger.

I marginally prefer it this way, but I don't particularly care. I wanted to
avoid one more line in a hunk that's already quite high for a single CPUID
check.=20

Cheers,
Alejandro

