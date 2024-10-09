Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6E29972ED
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 19:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815019.1228739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaMF-0003KY-5z; Wed, 09 Oct 2024 17:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815019.1228739; Wed, 09 Oct 2024 17:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syaMF-0003IB-3H; Wed, 09 Oct 2024 17:20:19 +0000
Received: by outflank-mailman (input) for mailman id 815019;
 Wed, 09 Oct 2024 17:20:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyzk=RF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1syaMD-0003I3-Ll
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 17:20:17 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0740e68-8662-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 19:20:16 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a994cd82a3bso7240466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 10:20:16 -0700 (PDT)
Received: from localhost ([52.166.251.127]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9958923911sm421016066b.190.2024.10.09.10.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 10:20:15 -0700 (PDT)
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
X-Inumbo-ID: c0740e68-8662-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728494416; x=1729099216; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV3d3eHWAOEqLnUFABytV5IjcFNeksNf+CnCf/H33kQ=;
        b=SpbvhwCXYIFbN5dE46bH20ytkTqjoTiYoK9seHg6TxFFs+Kqr8Gxnm65oncmFpdvbO
         ZKEDTxTh7Rioet6eMT10sKGU/ZGcaW1tLc3HDy4o696mHniypGHVt4VVTca65I/kmcDl
         37mqB/hGeCd5q3RfHZVurjqtiggW5kWm61lXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728494416; x=1729099216;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WV3d3eHWAOEqLnUFABytV5IjcFNeksNf+CnCf/H33kQ=;
        b=rpLyRLh4VerAe10KGNWteAEStB/eS2SBoXBrJyUkPdmsJyZD1yOY4e0LbcNh4KfgMe
         GZbnSUAMqHZ4vA2YsUJxU1FO3S+qJ2DMmRH2Abp3W1GnriSnuH4bD3Ku2KZu8T++2Ex1
         KfPOyvg8CqGkZSWuGqSkxb8acnzQurHmk9Og+gSNP/Cy3zHG8RW39+bhemrSedPM+7AN
         rKLs1YgavZ4fJO8hg5vrTIPyoj+dWJbwBMZA7tiw/pAIMgs7XrPzGUO3BeOAVy3/j4SW
         kcx44W839ZL8AkwvU0J+k0R7POo/Rul1corUXUuJR9hyYrfIm+jHzMaI+GXPzAZLUL6o
         MUkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJF9Ky4DVbdVtXt1Lhnl6ymt6LC7R6eUW1XIdmEFw6WU31ETtEhAa8B/d5MyH1zFRGo6gb4Hk8PgI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEFZIjthETYOaYIjEBBJ9b4jDv5oqYjHBtwLB1Bh/ByzVBhy86
	zI8eQu+NO+sgYd3M6+qhPIegCGVVqxtX+2eF4En/lfAjdc0OPB3SWEZ1lVP2Jy8=
X-Google-Smtp-Source: AGHT+IEuI8ZLTLqXd6K2bcXjjGlNpEAV2bL37JAVJop3t71F9qXtnnURR30lI3U2Ebsb+M4B8a5X4A==
X-Received: by 2002:a17:907:72ca:b0:a99:5ad9:b68f with SMTP id a640c23a62f3a-a998d1193damr264517666b.7.1728494416072;
        Wed, 09 Oct 2024 10:20:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Oct 2024 18:20:15 +0100
Message-Id: <D4RG4S8T8U1N.1WI63T1ZSVQXA@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 06/11] tools/libacpi: Use LUT of APIC IDs rather than
 function pointer
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
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

Sure to all three.

Cheers,
Alejandro

