Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010969B626D
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 13:00:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828145.1242992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t67NC-0005ue-Qh; Wed, 30 Oct 2024 12:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828145.1242992; Wed, 30 Oct 2024 12:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t67NC-0005qz-Nq; Wed, 30 Oct 2024 12:00:26 +0000
Received: by outflank-mailman (input) for mailman id 828145;
 Wed, 30 Oct 2024 12:00:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQZl=R2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t67NA-0005pM-I2
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 12:00:24 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85c4a7eb-96b6-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 13:00:14 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c9634c9160so7472662a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 05:00:14 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb631af0bsm4687810a12.68.2024.10.30.05.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 05:00:11 -0700 (PDT)
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
X-Inumbo-ID: 85c4a7eb-96b6-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg1YzRhN2ViLTk2YjYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjg5NjE0LjYzNTkxLCJzZW5kZXIiOiJhbGVqYW5kcm8udmFsbGVqb0BjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730289614; x=1730894414; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPhfECUEMJ8Ej/8wBuD7qnaBPr90R+ypNal+nPLuRoA=;
        b=LJqwyrYixELxdHaQLxSpsW3GEcnEdm3zY8v7wqO+7oO2ItWVhJHR0io64JW/lZUMp/
         /8F3v9qjI0BS/vbmnTzzfwkb6Ms2c6iNIivpqu8zGaE4LbINwRAcz5TlpH+4epS5qRZA
         LFwG/MoLeWx2NSnrWUeZDQ7iyQTv9lU56YLTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730289614; x=1730894414;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tPhfECUEMJ8Ej/8wBuD7qnaBPr90R+ypNal+nPLuRoA=;
        b=o4OVB0DKPyDEQAy9O2q0deKqqm6Z8qC2Kzy8nIqUKePcKg7ZjMFpP9JVXpjluYe+cp
         Cy8ITsg0Icoxfiiafvi7xT7B9TO86ovPnlew4it+XxFsriOQug1DE+OZ3uT7guV+zNoe
         Y/YVMPcJQbdsvG2jGdkMajPH5S3ag2RbUptIiB/ahVOS3ViNd55SLrdKprIlX9IVJUyh
         6ZLeXp7ipGC2NaMzMTT+1t8Y2WgvHSPs4PtVeLf6YqJ3e/NllZJu3oqtJ89Sy1rKa+o9
         jmf3e++NEgWzXIC+h0kp2WrUkxQRtlVYIGkgEyqcX/I/CnXHLdRiew+TL/5DIiHXOau8
         0CwA==
X-Forwarded-Encrypted: i=1; AJvYcCXMp5hqVYyHjslZYFDSvQlNVO8/6kGBt04oL5w8Ec1MZYOxDZR9wcXkq0PjKO6lsMJf9HojUSgzhGg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzvx6fktGAwg0FQfH4PIeESLslHl8xuUW/q1fpr4Js781KQyhyy
	XTUoLYKz+yrvN996D4EGjnIoZLRfquXvtw5AgwSzdWAJ2yAZwU24NYJYci4xRok=
X-Google-Smtp-Source: AGHT+IGTFAs/iE2r07pROYhxRCBECc7gNvyY45Nxg9QbpP1UB0akG0rcW2KCIIPHHIwMjUe676zlRw==
X-Received: by 2002:a05:6402:1cc8:b0:5c2:6311:8478 with SMTP id 4fb4d7f45d1cf-5cbbf9208c3mr12449216a12.25.1730289612210;
        Wed, 30 Oct 2024 05:00:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Oct 2024 12:00:09 +0000
Message-Id: <D594H5BKU18G.20YVS360FNF71@cloud.com>
Subject: Re: [PATCH v7 02/10] xen/x86: Add initial x2APIC ID to the
 per-vLAPIC save area
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
X-Mailer: aerc 0.18.2
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
 <20241021154600.11745-3-alejandro.vallejo@cloud.com>
 <974538f8-10b5-4fa3-9069-df6655a5d86d@citrix.com>
In-Reply-To: <974538f8-10b5-4fa3-9069-df6655a5d86d@citrix.com>

I'm fine with all suggestions, with one exception that needs a bit more
explanation...

On Tue Oct 29, 2024 at 8:30 PM GMT, Andrew Cooper wrote:
> On 21/10/2024 4:45 pm, Alejandro Vallejo wrote:
> > This allows the initial x2APIC ID to be sent on the migration stream.
> > This allows further changes to topology and APIC ID assignment without
> > breaking existing hosts. Given the vlapic data is zero-extended on
> > restore, fix up migrations from hosts without the field by setting it t=
o
> > the old convention if zero.
> >
> > The hardcoded mapping x2apic_id=3D2*vcpu_id is kept for the time being,
> > but it's meant to be overriden by toolstack on a later patch with
> > appropriate values.
> >
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
> I'm going to request some changes, but I think they're only comment
> changes. [edit, no sadly, one non-comment change.]
>
> It's unfortunate that Xen uses an instance of hvm_hw_lapic for it's
> internal state, but one swamp at a time.
>
>
> In the subject, there's no such thing as the "initial" x2APIC ID.=C2=A0
> There's just "the x2APIC ID" and it's not mutable state as far as the
> guest is concerned=C2=A0 (This is different to the xAPIC id, where there =
is
> an architectural concept of the initial xAPIC ID, from the days when
> OSes were permitted to edit it).=C2=A0 Also, it's x86/hvm, seeing as this=
 is
> an HVM specific change you're making.
>
> Next, while it's true that this allows the value to move in the
> migration stream, the more important point is that this allows the
> toolstack to configure the x2APIC ID for each vCPU.
>
> So, for the commit message, I recommend:
>
> ---%<---
> Today, Xen hard-codes x2APIC_ID =3D vcpu_id * 2, but this is unwise and
> interferes with providing accurate topology information to the guest.
>
> Introduce a new x2apic_id field into hvm_hw_lapic.=C2=A0 This is immutabl=
e
> state from the guest's point of view, but it allows the toolstack to
> configure the value, and for the value to move on migrate.
>
> For backwards compatibility, we treat incoming zeroes as if they were
> the old hardcoded scheme.
> ---%<---
>
> > diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> > index 2a777436ee27..e2489ff8e346 100644
> > --- a/xen/arch/x86/cpuid.c
> > +++ b/xen/arch/x86/cpuid.c
> > @@ -138,10 +138,9 @@ void guest_cpuid(const struct vcpu *v, uint32_t le=
af,
> >          const struct cpu_user_regs *regs;
> > =20
> >      case 0x1:
> > -        /* TODO: Rework topology logic. */
> >          res->b &=3D 0x00ffffffu;
> >          if ( is_hvm_domain(d) )
> > -            res->b |=3D (v->vcpu_id * 2) << 24;
> > +            res->b |=3D vlapic_x2apic_id(vcpu_vlapic(v)) << 24;
>
> There wants to be some kind of note here, especially as you're feeding
> vlapic_x2apic_id() into a field called xAPIC ID.=C2=A0 Perhaps
>
> /* Large systems do wrap around 255 in the xAPIC_ID field. */
>
> ?
>
>
> > =20
> >          /* TODO: Rework vPMU control in terms of toolstack choices. */
> >          if ( vpmu_available(v) &&
> > @@ -310,19 +309,16 @@ void guest_cpuid(const struct vcpu *v, uint32_t l=
eaf,
> >          break;
> > =20
> >      case 0xb:
> > -        /*
> > -         * In principle, this leaf is Intel-only.  In practice, it is =
tightly
> > -         * coupled with x2apic, and we offer an x2apic-capable APIC em=
ulation
> > -         * to guests on AMD hardware as well.
> > -         *
> > -         * TODO: Rework topology logic.
> > -         */
> >          if ( p->basic.x2apic )
> >          {
> >              *(uint8_t *)&res->c =3D subleaf;
> > =20
> > -            /* Fix the x2APIC identifier. */
> > -            res->d =3D v->vcpu_id * 2;
> > +            /*
> > +             * Fix the x2APIC identifier. The PV side is nonsensical, =
but
> > +             * we've always shown it like this so it's kept for compat=
.
> > +             */
>
> In hindsight I should changed "Fix the x2APIC identifier." when I
> reworked this logic, but oh well - better late than never.
>
> /* The x2APIC_ID is per-vCPU, and fixed irrespective of the requested
> subleaf. */
>
> I'd also put a little more context in the PV side:
>
> /* Xen 4.18 and earlier leaked x2APIC into PV guests.=C2=A0 The value sho=
wn
> is nonsensical but kept as-was for compatibility. */
>
> > diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> > index 3363926b487b..33b463925f4e 100644
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -1538,6 +1538,16 @@ static void lapic_load_fixup(struct vlapic *vlap=
ic)
> >      const struct vcpu *v =3D vlapic_vcpu(vlapic);
> >      uint32_t good_ldr =3D x2apic_ldr_from_id(vlapic->loaded.id);
> > =20
> > +    /*
> > +     * Loading record without hw.x2apic_id in the save stream, calcula=
te using
> > +     * the traditional "vcpu_id * 2" relation. There's an implicit ass=
umption
> > +     * that vCPU0 always has x2APIC0, which is true for the old relati=
on, and
> > +     * still holds under the new x2APIC generation algorithm. While th=
at case
> > +     * goes through the conditional it's benign because it still maps =
to zero.
> > +     */
>
> It's not an implicit assumption; it's very explicit.

It's implicit because it's not mentioned anywhere else and parts of the Xen
ecosystem live under the pretense that such a thing can indeed happen.

>
> /* Xen 4.19 and earlier had no x2APIC_ID in the migration stream, and
> hard-coded "vcpu_id * 2".=C2=A0 Default back to this if we have a
> zero-extended record.=C2=A0 */
>
> But, this will go malfunction if the toolstack tries to set v!0's
> x2APIC_ID to 0.

I assume you mean vcpuN with N !=3D 0. I maintain that allowing non-monoton=
ically
increasing APIC IDs on vCPUs is technical debt disguised as a misfeature. F=
or
one, it would prevent hvmloader from asserting some sanity on its own reads=
 of
APIC IDs, but it would be a mess to debug in general. I started making real
progress on the toolstack after asserting all APs had non-zero APIC IDs.

So, while...

>
> What you need to know is whether lapic_load_hidden() had to zero-extend
> the record or not (more specifically, over this field), so you want
> h->size <=3D offsetof(x2_apicid) as the gating condition.

... this is true and a more adequate gating condition (that I'm happy to
replace the current one with), I'd still like to keep the invariant that AP=
IC
IDs must be monotonically increasing with the vCPU id, which has the side
effect of banning zero outside the BSP.

>
> This should be safe for the toolstack, I think.=C2=A0 Hypercalls prior to
> this patch will get a shorter record, and hypercalls from this patch
> onwards will get a longer record with the default x2APIC_ID =3D vcpu_id *
> 2 filled in.
>
> > +    if ( !vlapic->hw.x2apic_id )
> > +        vlapic->hw.x2apic_id =3D v->vcpu_id * 2;
> > +
> >      /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already corr=
ect */
> >      if ( !vlapic_x2apic_mode(vlapic) ||
> >           (vlapic->loaded.ldr =3D=3D good_ldr) )
> > @@ -1606,6 +1616,13 @@ static int cf_check lapic_check_hidden(const str=
uct domain *d,
> >           APIC_BASE_EXTD )
> >          return -EINVAL;
> > =20
> > +    /*
> > +     * Fail migrations from newer versions of Xen where
> > +     * rsvd_zero is interpreted as something else.
> > +     */
>
> This comment isn't necessary.=C2=A0 We've got no shortage of reserved
> checks.=C2=A0 However ...
>
> > diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/publi=
c/arch-x86/hvm/save.h
> > index 7ecacadde165..1c2ec669ffc9 100644
> > --- a/xen/include/public/arch-x86/hvm/save.h
> > +++ b/xen/include/public/arch-x86/hvm/save.h
> > @@ -394,6 +394,8 @@ struct hvm_hw_lapic {
> >      uint32_t             disabled; /* VLAPIC_xx_DISABLED */
> >      uint32_t             timer_divisor;
> >      uint64_t             tdt_msr;
> > +    uint32_t             x2apic_id;
> > +    uint32_t             rsvd_zero;
>
> ... we do normally spell it _rsvd; to make it extra extra clear that
> people shouldn't be doing anything with it.
>
> ~Andrew


