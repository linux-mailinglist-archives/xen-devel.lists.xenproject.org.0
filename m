Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F83A5BBE4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907468.1314705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvkN-0003lX-Sy; Tue, 11 Mar 2025 09:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907468.1314705; Tue, 11 Mar 2025 09:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvkN-0003k2-QF; Tue, 11 Mar 2025 09:17:59 +0000
Received: by outflank-mailman (input) for mailman id 907468;
 Tue, 11 Mar 2025 09:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QaIb=V6=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1trvkN-0003jv-0r
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:17:59 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6c06ff7-fe59-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 10:17:54 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso14340985e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 02:17:54 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf27f8ef3sm78672445e9.11.2025.03.11.02.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 02:17:53 -0700 (PDT)
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
X-Inumbo-ID: b6c06ff7-fe59-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741684674; x=1742289474; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dzrzcyd8GjsfaBoKtl9Wiw+PcOdfc4AoYsq7TuoxVg=;
        b=EMvt49TXYNOPTbxvXEpNlgmLKyBm5V/HW8sXPWRm6BEoU43lZDO2KwwJ+BNajG8YMa
         3fDSiBfZUTvRtqmFyKnE14JHOt4iL3UStlF2reemtxDvIfw5XGZ7RbxQH4gAVuLiJb5c
         sVNHkueNbxl+MSE817/E7sy8auimRjw7plg/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741684674; x=1742289474;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0dzrzcyd8GjsfaBoKtl9Wiw+PcOdfc4AoYsq7TuoxVg=;
        b=NkJ9kaU+2+iwoTcZmAxTQqxBWh+MlzrOjLJREONjsGC2p0Z/3oi+w5JfzgmrBCy+dq
         X3MFZGoMuK2s5Csz+nojYO8CpNN/GE8t0SXfaqfjjqon5wk9ru4cqQnGkO4SnjUzQxxn
         H202S2SKeZWLOVlWMd1dMbH3UEAPnhHO2WW/84Q7U9fS5N2N++NyPnibTZHysq7ol3KM
         bTyISXafpDafLKnaObmlOwM1q2SRXzmLiKD8EoV+RQTVU7Wfs/50hBgzEWxPyF/jwsS2
         vYQ9JD39mT8BIFmvl8L/eWj4J8wOmEKYBUFgKWeRbXTy37GI6fFAnSUppRwBhZsZU1Su
         yELA==
X-Forwarded-Encrypted: i=1; AJvYcCXjG61WfV0+Qz06qvuXnpijxLGe7zkLOOIjh/utrPIwDyTRIgRPjAH7WPTw8DmYxc4aD3JtX88g1TU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyvAEzx77R/CBaJbehkjKh54cQPl8kQX+00G4Xwyp24g0nHHtz
	NsSaA/xrGfoyGgM0gW/rHt6ZNGcw8+iBTfbeEo+He3UISUJ1V4eryd4YJUvGOof9hpwIBuRMswD
	6X0k=
X-Gm-Gg: ASbGncsPWqRXQs8qFK6hsDLpZ+owywIpG+Edj3l/bRtSh2SvZKlDpH8sBgQQ6S7yWjj
	32djRAGAaBR32Wb/oldtFEiK70YgStX4vqx724px3SJIC6/wPD+haOUaRuIKm+GA7U8v3+4/CFR
	M6SwtHpY/ok5p+B1eQx+SIgIBNEwPB3Kw/mEmcb/fOl57goJTcM2frqHf/YtB1gAkvT/iqUAdDK
	7hVfgXLK1oEdLVfGjoUe2bgBXi2ORJrNtBgnPB8n2fK5gHUcc9PUaw5fEhy9TfH3GM1RWBBEXZf
	GYVqpLkxLcp1/PDLhm5hBV+HPeuYhbDkbhCe2q4Tkl8T8X+gVF8=
X-Google-Smtp-Source: AGHT+IG2adtEzPJsUBOh3ZFuOSLZfOKqlIR2xFoxwrtMpZSO3oFAgkcovhJZOzgowr/MtDwzRgKI9w==
X-Received: by 2002:a05:600c:470c:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-43cf051022dmr92439915e9.11.1741684673845;
        Tue, 11 Mar 2025 02:17:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Mar 2025 09:17:52 +0000
Message-Id: <D8DBOSSN37VY.1VN43MHCQ5AGR@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools: Mark ACPI SDTs as NVS in the PVH build path
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250310152523.81181-1-alejandro.vallejo@cloud.com>
 <5f207284-d206-417a-b963-c922119abe33@suse.com>
In-Reply-To: <5f207284-d206-417a-b963-c922119abe33@suse.com>

On Tue Mar 11, 2025 at 8:30 AM GMT, Jan Beulich wrote:
> On 10.03.2025 16:25, Alejandro Vallejo wrote:
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
> > I really, really, really dislike this idea of accessing the MADT from
> > AML.
>
> I think this isn't Xen's invention, but something I've seen in various
> systems' AML.
>

Do you mean ACPI hotplug? I don't think I've ever seen a real system with
support for it. I don't suppose you remember any specifically? I'd be quite
interested to have a look at their ACPI dumps.

> > In time I'll try to implement something to stop doing it, but for
> > the time being I find it preferable to align libxl to hvmloader rather
> > than trying to restrict what's reclaimable and what isn't.
> > ---
> >  tools/firmware/hvmloader/e820.c | 4 ++++
> >  tools/libs/light/libxl_x86.c    | 2 +-
> >  2 files changed, 5 insertions(+), 1 deletion(-)
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
> > index a3164a3077fe..265da8072a59 100644
> > --- a/tools/libs/light/libxl_x86.c
> > +++ b/tools/libs/light/libxl_x86.c
> > @@ -742,7 +742,7 @@ static int domain_construct_memmap(libxl__gc *gc,
> >              e820[nr].addr =3D dom->acpi_modules[i].guest_addr_out & ~(=
page_size - 1);
> >              e820[nr].size =3D dom->acpi_modules[i].length +
> >                  (dom->acpi_modules[i].guest_addr_out & (page_size - 1)=
);
> > -            e820[nr].type =3D E820_ACPI;
> > +            e820[nr].type =3D E820_NVS;
>
> This likely needs a comment then, too.

Fair enough. Let me send a v2 with that.

>
> Jan

Cheers,
Alejandro

