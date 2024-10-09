Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB72C9972E1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 19:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815010.1228729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaL2-0001kc-OY; Wed, 09 Oct 2024 17:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815010.1228729; Wed, 09 Oct 2024 17:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaL2-0001iW-L4; Wed, 09 Oct 2024 17:19:04 +0000
Received: by outflank-mailman (input) for mailman id 815010;
 Wed, 09 Oct 2024 17:19:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyzk=RF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1syaL1-0001iN-MX
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 17:19:03 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93d20202-8662-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 19:19:01 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9968114422so5420966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 10:19:01 -0700 (PDT)
Received: from localhost ([52.166.251.127]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993f939550sm609941366b.42.2024.10.09.10.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 10:19:00 -0700 (PDT)
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
X-Inumbo-ID: 93d20202-8662-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728494341; x=1729099141; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzNei6yEFrda8QNnS+53tHT98SilBIGbHwNTXJvHOsA=;
        b=ErrEt70B/quxYzkF3QwB0939Eg+n8DG9MnBAGOtJXOcSyd33kbop/cqIn26eU7d6vf
         p9fimpU9RlT3hraRjvUgKDkHs6552X4PGCN+wVMjOOBWF4vZrh5GFjow4n69+HrDuLi8
         2YXlZAH5k+7nxcVpsKof3XqYR1jCK4R6RbKkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728494341; x=1729099141;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JzNei6yEFrda8QNnS+53tHT98SilBIGbHwNTXJvHOsA=;
        b=HMy1czhoOZUE+LDkfWGNfh1jJwsj6AHtwctd5XJbzNM5XcHy6JAVJZzOBkXs5iuwGS
         7bO5gA+bQ0IiCIFaSEwNy7mSQXorE3uGMZNGH5efHhvd44diIA1EZIy4oIBeD4/iJWi3
         P7FGGCDu6T8jTDrnK6UcutB/A1KQUclXkHB95sa2KvS8cH82gJsty21ek/rZosyFHKRt
         edzFj57euBPPoBYbu83WcjSADGguJQv0DQ2ofWlExWFgVc3cKyIBpC3OFZmM+XlLJYwI
         TnSmZpyVAidMLTQg2AQ0HKk5HUWfJLROJ/nYttMIgCLAszPR5xepiM4J+3HsdzA7wmX+
         APHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXsiFAMmOFnHsd3WmcDY61mYFqsDsL3XtTRuIRAx3Xfd5anXSA+Av4gEYXyNcfqk0RkRet7TUP7Eo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwARtd9Ndtn7VA7eicDCe3xqsmJijItyiyWus7TrMdVTUNQdYpY
	E8+u/e6ZTy7jcjNgTQLv6MpRIQHCeSj4fg+B3Vs2vqchUQGfBAV+efG5rKv4t+NS/4m9RDiEHDt
	17nM=
X-Google-Smtp-Source: AGHT+IHI3DExGsls5r7wS/IfePaFyn546mvHDtEA3FH8OdZ24aPPawP6iGKW05Qzi6Yd8RDV6iFKvw==
X-Received: by 2002:a17:907:3e08:b0:a86:9c41:cfc1 with SMTP id a640c23a62f3a-a999e628743mr105748166b.8.1728494341146;
        Wed, 09 Oct 2024 10:19:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Oct 2024 18:19:00 +0100
Message-Id: <D4RG3TTHTS1E.23ZAJIW3H4VC4@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Xen-devel" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 05/11] tools/hvmloader: Retrieve (x2)APIC IDs from
 the APs themselves
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-6-alejandro.vallejo@cloud.com>
 <f75dde2d-9c39-4be0-8465-6496a56cc658@suse.com>
In-Reply-To: <f75dde2d-9c39-4be0-8465-6496a56cc658@suse.com>

Hi,

On Wed Oct 9, 2024 at 3:03 PM BST, Jan Beulich wrote:
> On 01.10.2024 14:38, Alejandro Vallejo wrote:
> > Make it so the APs expose their own APIC IDs in a LUT. We can use that
> > LUT to populate the MADT, decoupling the algorithm that relates CPU IDs
> > and APIC IDs from hvmloader.
> >=20
> > While at this also remove ap_callin, as writing the APIC ID may serve
> > the same purpose.
>
> ... on the assumption that no AP will have an APIC ID of zero.
>
> > @@ -341,11 +341,11 @@ int main(void)
> > =20
> >      printf("CPU speed is %u MHz\n", get_cpu_mhz());
> > =20
> > +    smp_initialise();
> > +
> >      apic_setup();
> >      pci_setup();
> > =20
> > -    smp_initialise();
>
> I can see that you may want cpu_setup(0) to run ahead of apic_setup().

Not only that. This hunk ensures CPU_TO_X2APICID is populated ASAP for ever=
y
CPU. Reading zeroes where a non-zero APIC ID should be is fatal and tricky =
to
debug later. I tripped on enough "used the LUT before being set up" bugs to
really prefer initialising it before anyone has a chance to misuse it.

> Yet is it really appropriate to run boot_cpu() ahead of apic_setup() as w=
ell?

I would've agreed before the patches that went in to replace INIT-SIPI-SIPI
with hypercalls, but now that hvmloader is enlightened it has no real need =
for
the APIC to be configured. If feels weird because you wouldn't use this ord=
er
on bare metal. But it's fine under virt.

> At the very least it feels logically wrong, even if at the moment there
> may not be any direct dependency (which might change, however, down the
> road).

I suspect it feels wrong because you can't boot CPUs ahead of configuring y=
our
APIC in real hardware. But hvmloader is always virtualized so that point is
moot. If anything, I'd be scared of adding code ahead of smp_initialise() t=
hat
relies on CPU_TO_X2APICID being set when it hasn't yet.

If you have a strong view on the matter I can remove this hunk and call
read_apic_id() from apic_setup(). But it wouldn't be my preference to do so=
.

>
> > --- a/tools/firmware/hvmloader/mp_tables.c
> > +++ b/tools/firmware/hvmloader/mp_tables.c
> > @@ -198,8 +198,10 @@ static void fill_mp_config_table(struct mp_config_=
table *mpct, int length)
> >  /* fills in an MP processor entry for VCPU 'vcpu_id' */
> >  static void fill_mp_proc_entry(struct mp_proc_entry *mppe, int vcpu_id=
)
> >  {
> > +    ASSERT(CPU_TO_X2APICID[vcpu_id] < 0xFF );
>
> Nit: Excess blank before closing paren.

Oops, right.

>
> And of course this will need doing differently anyway once we get to
> support for more than 128 vCPU-s.

This is just a paranoia-driven assert to give quick feedback on the overflo=
w of
the APIC ID later on. The entry in the MP-Table is a single octet long, so =
in
those cases we'd want to skip the table to begin with.

>
> > --- a/tools/firmware/hvmloader/smp.c
> > +++ b/tools/firmware/hvmloader/smp.c
> > @@ -29,7 +29,34 @@
> > =20
> >  #include <xen/vcpu.h>
> > =20
> > -static int ap_callin;
> > +/**
> > + * Lookup table of x2APIC IDs.
> > + *
> > + * Each entry is populated its respective CPU as they come online. Thi=
s is required
> > + * for generating the MADT with minimal assumptions about ID relations=
hips.
> > + */
> > +uint32_t CPU_TO_X2APICID[HVM_MAX_VCPUS];
>
> I can kind of accept keeping it simple in the name (albeit - why all caps=
?),
> but at least the comment should mention that it may also be an xAPIC ID
> that's stored here.

I'll add that in the comment. I do want it to be x2apic in name though, so =
as
to make it obvious that it's LUT of 32bit items.

As for the caps, bad reasons. It used to be a macro and over time I kept
interpreting it as an indexed constant. Should be lowercase.

>
> > @@ -104,6 +132,12 @@ static void boot_cpu(unsigned int cpu)
> >  void smp_initialise(void)
> >  {
> >      unsigned int i, nr_cpus =3D hvm_info->nr_vcpus;
> > +    uint32_t ecx;
> > +
> > +    cpuid(1, NULL, NULL, &ecx, NULL);
> > +    has_x2apic =3D (ecx >> 21) & 1;
>
> Would be really nice to avoid the literal 21 here by including
> xen/arch-x86/cpufeatureset.h. Can this be arranged for?

I'll give that a go. hvmloader has given no shortage of headaches with its
quirky environment, so we'll see...

>
> Jan

Cheers,
Alejandro

