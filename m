Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A40FA5F833
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 15:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912344.1318637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsjZs-0002iW-Mm; Thu, 13 Mar 2025 14:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912344.1318637; Thu, 13 Mar 2025 14:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsjZs-0002fa-JX; Thu, 13 Mar 2025 14:30:28 +0000
Received: by outflank-mailman (input) for mailman id 912344;
 Thu, 13 Mar 2025 14:30:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEXk=WA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tsjZr-0002fT-NV
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 14:30:27 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3edd064-0017-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 15:30:25 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-391342fc148so704021f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 07:30:25 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8c5cb4sm55399365e9.25.2025.03.13.07.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 07:30:24 -0700 (PDT)
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
X-Inumbo-ID: b3edd064-0017-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741876225; x=1742481025; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXSApbjLp3QNkPljizJu/1RGQFb8N9taXbswCyJvqz4=;
        b=Job5cm3/Uw2vQcldc7nKxPnezIFje0UNv1etwrSF9zNUEaX4gK9h5ATOgSFAjvj0SP
         4ewN+X8N9Zyc2mAIh3Wd0yZQpzPyETA/63g/eTP8jCPcZqlNnWlwrkohKXYLIlS/Unux
         O5zdRCtbk7weda3Rnz5p0AKJJ28gm/pbbmC68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876225; x=1742481025;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FXSApbjLp3QNkPljizJu/1RGQFb8N9taXbswCyJvqz4=;
        b=E8lxSH9GYouRZMSMQtcgtjK4UQWWIxuvK2C2Hc6OGFnmeGT5fxVBmRfDZ0Cb7X2pGF
         XvjJvwL1V8zrUxLn1iWKwi2l+Ip35i4eCmogOakESIl3zWOeJ+Y4mXHkUwJjiXRV+esr
         xNqDaCD7VYvYCdBfXD3CmlU4vKRuqzJy8eg8P6JiLqYkdOLYBRs8Z96YvJVxI27bVUiW
         KLw3wwz8TprmDRiLwXzfFz7djx5oBtELoznSBpLEGabl5Sn14991Xh11iSgLm1/q04oy
         DmKIHzIAgwnyK1UITvt7QT8/rQNk8/my9ElG2fjL1HaU1KkbPk2K4z3R99EalTcLzWai
         rQIw==
X-Forwarded-Encrypted: i=1; AJvYcCWgA6YeLf6a63DsaAvOGWIc4Fx/7k2+Ah6NJhdc2uUd3IQIro5v60BspRGo7PcLgAB1KYGYP0htf54=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKznyYgdrfZruV6ti+Y7m11Zj6CkVpsnoovmbThR8dBPPbqyr0
	1+dphVqAIM9sLcZUZ3/D8Nt1ztXVvjGeSICLQAu/Qc4ZBB6suUGH9pRFdPVwbpI=
X-Gm-Gg: ASbGnctE0CMgLUB1QdZYEjF/IMAi0VzhjOVJMVnmQI11XXG00Red39q8kf+hWtuALQU
	a7J4KCabfV4Z2rDYDsRvioBwxhPz3U2Gt5F8pnJ3BgbPOz7N9L1yqrw7gn7s4bDvYaZqqdF3IUZ
	6da8S7xu4EcMxo+9QKI/EQYMrNXgs11YQTgLIRtZ1HayvamIE5/1dRO4fslsOEs4iF88+yqqZob
	Ex3F4SVYCpYDET7C9YjGc1ME67aw+0ITcXvVmb0CPq2Dy33b8xMEg//eRv+R2MgVDg33no/T6d7
	EtQlw+xZ+JdAzqRpt3HV3Mk+SYBBfD+74c6Jy41g/5iTBXoJVtU=
X-Google-Smtp-Source: AGHT+IEb2BXJg1uiv8HTP2L4ob3neC2j0aLfk8RluFn49kiXd3v0+Rw1krIiHAhLys4KNu1kDhmrbw==
X-Received: by 2002:a5d:6d06:0:b0:391:47d8:de3a with SMTP id ffacd0b85a97d-3926c69b307mr12108597f8f.53.1741876224637;
        Thu, 13 Mar 2025 07:30:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 14:30:19 +0000
Message-Id: <D8F7L45LN2IQ.1X616YGM6C4DJ@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] tools: Mark ACPI SDTs as NVS in the PVH build path
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250311092905.991-1-alejandro.vallejo@cloud.com>
 <9cb526f9-fd2c-424c-82b1-7db57e0db50c@suse.com>
In-Reply-To: <9cb526f9-fd2c-424c-82b1-7db57e0db50c@suse.com>

On Thu Mar 13, 2025 at 1:14 PM GMT, Jan Beulich wrote:
> On 11.03.2025 10:29, Alejandro Vallejo wrote:
> > Commit cefeffc7e583 marked ACPI tables as NVS in the hvmloader path
> > because SeaBIOS may otherwise just mark it as RAM. There is, however,
> > yet another reason to do it even in the PVH path. Xen's incarnation of
> > AML relies on having access to some ACPI tables (e.g: _STA of Processor
> > objects relies on reading the processor online bit in its MADT entry)
> >=20
> > This is problematic if the OS tries to reclaim ACPI memory for page
> > tables as it's needed for runtime and can't be reclaimed after the OSPM
> > is up and running.
> >=20
> > Fixes: de6d188a519f("hvmloader: flip "ACPI data" to "ACPI NVS" type for=
 ACPI table region)"
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> > v1->v2:
> >   * Copy explanatory comment in hvmloader/e820.c to its libxl_x86.c cou=
nterpart
> >=20
> > ---
> >  tools/firmware/hvmloader/e820.c |  4 ++++
> >  tools/libs/light/libxl_x86.c    | 17 ++++++++++++++++-
> >  2 files changed, 20 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/tools/firmware/hvmloader/e820.c b/tools/firmware/hvmloader=
/e820.c
> > index c490a0bc790c..86d39544e887 100644
> > --- a/tools/firmware/hvmloader/e820.c
> > +++ b/tools/firmware/hvmloader/e820.c
> > @@ -210,6 +210,10 @@ int build_e820_table(struct e820entry *e820,
> >       * space reuse by an ACPI unaware / buggy bootloader, option ROM, =
etc.
> >       * before an ACPI OS takes control. This is possible due to the fa=
ct that
> >       * ACPI NVS memory is explicitly described as non-reclaimable in A=
CPI spec.
> > +     *
> > +     * Furthermore, Xen relies on accessing ACPI tables from within th=
e AML
> > +     * code exposed to guests. So Xen's ACPI tables are not, in genera=
l,
> > +     * reclaimable.
> >       */
> > =20
> >      if ( acpi_enabled )
> > diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.=
c
> > index a3164a3077fe..2ba96d12e595 100644
> > --- a/tools/libs/light/libxl_x86.c
> > +++ b/tools/libs/light/libxl_x86.c
> > @@ -737,12 +737,27 @@ static int domain_construct_memmap(libxl__gc *gc,
> >          nr++;
> >      }
> > =20
> > +    /*
> > +     * Mark populated reserved memory that contains ACPI tables as ACP=
I NVS.
> > +     * That should help the guest to treat it correctly later: e.g. pa=
ss to
> > +     * the next kernel on kexec.
> > +     *
> > +     * Using NVS type instead of a regular one helps to prevent potent=
ial
> > +     * space reuse by an ACPI unaware / buggy bootloader, option ROM, =
etc.
> > +     * before an ACPI OS takes control. This is possible due to the fa=
ct that
> > +     * ACPI NVS memory is explicitly described as non-reclaimable in A=
CPI spec.
> > +     *
> > +     * Furthermore, Xen relies on accessing ACPI tables from within th=
e AML
> > +     * code exposed to guests. So Xen's ACPI tables are not, in genera=
l,
> > +     * reclaimable.
> > +     */
>
> When asking for a comment here I really only was after what the last para=
graph says.
> Especially the middle paragraph seems questionable to me: It would not on=
ly be ACPI-
> unawareness, but also E820-unawareness, for the range to be prematurely r=
e-used. And
> buggy bootloaders really would need fixing, I think - they'd put OSes int=
o trouble on
> real hardware as well.
>
> In short - I'd like to ask that the middle paragraph be dropped from here=
 (which
> surely could be done while committing).

I feel the rationale is the same on both paths, so the comment blocks ought=
 to
be aligned (whichever way). But I have no strong motivations and would be f=
ine
dropping the middle paragraph here.

If that's your only remark, I'm happy for it to be dropped on commit.

>
> However, there's a second concern: You say "PVH" in the title, yet this f=
unction is
> in use also for HVM, and ...
>
> >      for (i =3D 0; i < MAX_ACPI_MODULES; i++) {
> >          if (dom->acpi_modules[i].length) {
> >              e820[nr].addr =3D dom->acpi_modules[i].guest_addr_out & ~(=
page_size - 1);
> >              e820[nr].size =3D dom->acpi_modules[i].length +
> >                  (dom->acpi_modules[i].guest_addr_out & (page_size - 1)=
);
> > -            e820[nr].type =3D E820_ACPI;
> > +            e820[nr].type =3D E820_NVS;
> >              nr++;
> >          }
> >      }
>
> ... this code is outside of any conditionals. This imo needs sorting one =
way or
> another.
>
> Jan

ACPI tables are populated by hvmloader, while libxl generates those of PVH.

dom->acpi_modules are populated by libxl__dom_load_acpi(), which is gated o=
n
the type being PVH (see the caller of this function). So this loop should b=
e
effectively skipped.

I called it the PVH path because it happens to be at the moment. Nothing
prevents this path from being the HVM path too, but that involves rewiring
hvmloader.

Cheers,
Alejandro

