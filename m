Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09B099A8B6
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 18:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817286.1231350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szIKz-0005K0-Nk; Fri, 11 Oct 2024 16:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817286.1231350; Fri, 11 Oct 2024 16:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szIKz-0005IV-Kq; Fri, 11 Oct 2024 16:17:57 +0000
Received: by outflank-mailman (input) for mailman id 817286;
 Fri, 11 Oct 2024 16:17:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XZOt=RH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1szIKx-0005IP-Pf
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 16:17:55 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e4e8969-87ec-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 18:17:53 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a993f6916daso377576966b.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 09:17:53 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7f254bbsm226596166b.61.2024.10.11.09.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 09:17:52 -0700 (PDT)
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
X-Inumbo-ID: 5e4e8969-87ec-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728663473; x=1729268273; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FIXEbweqyg4hATjzE0kvO8beWAvGqzO6GaxZpPYmOE=;
        b=GLgrRIH905CR1U9wYcI1kAFKQ4AN5R6/4uNUd3KZtbjGAfi2YAv+YgZ0Pt3SwVHtU5
         /Zqb22CyTVS/2yWZKhIi/S5AYjazQo4zYv8uprCm0LpinQmidpTSu5la56ed7+YBhdDM
         BnWxryqyhnXbAQ6hkDpSFNbxsB5gNtSgEhoJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728663473; x=1729268273;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9FIXEbweqyg4hATjzE0kvO8beWAvGqzO6GaxZpPYmOE=;
        b=qeM1JuSY5k7Lc8qDO+ZJK0TKfjrbcbMN5N9WnoeerpAQIJrYoa9lYpNV4oDCRm6W1W
         KfnyO93PunAzmvUka6qLsnbrY0Mgz8tdG4KNIZwh8Comz7SB+aaj8VhT/zURiwErNNXb
         97mLIweqXoBvGIGcc8puj4Fk7EImaLPMQ+iFiPKdoFR3a8ax1bufMGQW91YOnB8asCsO
         +5wgYJNXKS8qJarRNyDkelY/1P7uX0voi9YjLAzSYCRd4E+4JVnv9XdR4PlcDHQmeXLt
         dVdUNlYuhTFEkmhMxfiq77m4GSoOSOLFnoklH7VMp2t4iMmp0bb1Irv3+uriOKLYrjjP
         m4dA==
X-Forwarded-Encrypted: i=1; AJvYcCV+rhcP3iGa6/wJrvdXwsRQLCvl++e3C6qByfpW+g/6+Ul+VNnz9WESKwczFL0FurwmI9oi/jdiBa4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxyn7qDsnFMUTrc3DgSYCwRtFDLX3TCV41WgUu3VbL7h+yiFlwK
	H/bF5LSXFh0U930pQkSelsDAhrxvXenfO3K0rfcwrk3h2ZHQhSdqA5+VC979GWU=
X-Google-Smtp-Source: AGHT+IEGtTAbEVCpjxd7cW6DGCwPxOYbFRzmEXs3pUFPKTQ9LVc74SSwkAu6cY9k+74tODDz8DzPcA==
X-Received: by 2002:a17:907:1b96:b0:a99:d3f4:ff3b with SMTP id a640c23a62f3a-a99d3f5095emr55880066b.27.1728663473092;
        Fri, 11 Oct 2024 09:17:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Oct 2024 17:17:51 +0100
Message-Id: <D4T423OR4IAU.D5ZUN0WIO0UK@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 06/11] tools/libacpi: Use LUT of APIC IDs rather than
 function pointer
X-Mailer: aerc 0.18.2
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-7-alejandro.vallejo@cloud.com>
 <28e07993-9463-49a5-ba75-e012056e5ab2@suse.com>
In-Reply-To: <28e07993-9463-49a5-ba75-e012056e5ab2@suse.com>

On Wed Oct 9, 2024 at 3:25 PM BST, Jan Beulich wrote:
> On 01.10.2024 14:38, Alejandro Vallejo wrote:
> > @@ -148,7 +148,7 @@ static struct acpi_20_madt *construct_madt(struct a=
cpi_ctxt *ctxt,
> >          lapic->length  =3D sizeof(*lapic);
> >          /* Processor ID must match processor-object IDs in the DSDT. *=
/
> >          lapic->acpi_processor_id =3D i;
> > -        lapic->apic_id =3D config->lapic_id(i);
> > +        lapic->apic_id =3D config->cpu_to_apicid[i];
>
> Perhaps assert (like you do in an earlier patch) that the ID is small
> enough?

Actually, I just remembered why I didn't. libacpi is pulled into libxl, whi=
ch
is integrated into libvirt. A failed assert here would kill the application=
,
which is not very nice.

HVM is already protected by the mp tables assert, so I'm not terribly worri=
ed
about it and, while PVH is not, it would crash pretty quickly due to the
corruption.

I'd rather have the domain crashing rather than virt-manager.

>
> > --- a/tools/libacpi/libacpi.h
> > +++ b/tools/libacpi/libacpi.h
> > @@ -84,7 +84,7 @@ struct acpi_config {
> >      unsigned long rsdp;
> > =20
> >      /* x86-specific parameters */
> > -    uint32_t (*lapic_id)(unsigned cpu);
> > +    uint32_t *cpu_to_apicid; /* LUT mapping cpu id to (x2)APIC ID */
>
> const uint32_t *?
>
> > --- a/tools/libs/light/libxl_dom.c
> > +++ b/tools/libs/light/libxl_dom.c
> > @@ -1082,6 +1082,11 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t dom=
id,
> > =20
> >      dom->container_type =3D XC_DOM_HVM_CONTAINER;
> > =20
> > +#if defined(__i386__) || defined(__x86_64__)
> > +    for ( uint32_t i =3D 0; i < info->max_vcpus; i++ )
>
> Plain unsigned int?
>
> Jan

Sigh... and this didn't have the libxl style either.

I really hate this style mix we have :/

Cheers,
Alejandro

