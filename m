Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC99187F2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749373.1157447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVtH-0004nO-Ds; Wed, 26 Jun 2024 16:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749373.1157447; Wed, 26 Jun 2024 16:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVtH-0004lj-Ak; Wed, 26 Jun 2024 16:53:03 +0000
Received: by outflank-mailman (input) for mailman id 749373;
 Wed, 26 Jun 2024 16:53:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m54e=N4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sMVtF-0004la-VY
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:53:02 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bfb8b94-33dc-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 18:53:00 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a7245453319so151816866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 09:53:00 -0700 (PDT)
Received: from localhost ([160.101.139.1]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fdafe90b8sm543027766b.71.2024.06.26.09.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 09:52:59 -0700 (PDT)
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
X-Inumbo-ID: 8bfb8b94-33dc-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719420780; x=1720025580; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3OYo3MJqPqUKeOzpMmBaxpp/tkM9BYWYQF/CjwfAW0=;
        b=RaPMR5ZOUDXaNZlIkAXyb+OTcoJEQlxhhraBO5zo2XEweGOL0Kqeob26y7/iS+KHgl
         L5wpNbIfRESLqVgsiTrEmYOtxaayei6P+tk5NfzocUEOmDuMA7uMrGcgG4GGiVMb5Jwp
         XoF77Y//l0wFb9SMqI0AgW0/NXavxF3DJ3fcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719420780; x=1720025580;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n3OYo3MJqPqUKeOzpMmBaxpp/tkM9BYWYQF/CjwfAW0=;
        b=RzUOJIdHpQXt9AhGkEP//ELmITpaA1kviz8G4JJeVVkP6Va6GW2FBreNsguqtUxaBw
         Rmye/t2dTH1Uk6qSw2V+naLz7YWWk9LPsn/9yBd9XhrkqF2+yM4dhUQueQcviwt+Ew0u
         V/I/BV4ryuw+AYYIxbQORbrbMq0yWQ5vz4qxeqy7bm85VASILb5uaNNP2WsjGjX7mDup
         3fpZ68e/tk6lbDK01js5C3W7bzmECrR9biZBUgrSaiWp7qW/K+moJeqmBzYRXkrBcB8s
         mU/7FmVC0MqSWvroa8yZ82mxMTpBe67TTW8Yufvau/sqL6MGZAt0u41Ypkf1xc3wLuQn
         2Y5A==
X-Forwarded-Encrypted: i=1; AJvYcCVwqRNaXLyF1Bp6nvldkSfUNsNeHbRdbErwHEYjUajLeYP5OocuCPsKaJs2V+StWYL5sXy0d1afq+ZW6iLodtbCMvOIH+ay6TmpHeHrPJM=
X-Gm-Message-State: AOJu0YywPqqIspLnka4x65PgSC8FVutW5gXYJsYhqHHszdU3Jj9TrJuy
	jvdab/DOVQ+8KC9IwWZwlNuZj9/Tis4rK6HGlOTg9ka0dSbYY6A67/K/whTDeMU=
X-Google-Smtp-Source: AGHT+IErddExJuRl2lMb6QS5JWBOeaxRBsxRCCK1VzYes/DGjLfSSV29ggabO6mN3h6Bsa9fHrz1Ng==
X-Received: by 2002:a17:906:c2c5:b0:a6f:e069:3b06 with SMTP id a640c23a62f3a-a7296f742fbmr13224466b.21.1719420780149;
        Wed, 26 Jun 2024 09:53:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Jun 2024 17:52:59 +0100
Message-Id: <D2A3SPBBBYCT.CYFCF8WCBM10@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for 4.19 v4 01/10] tools/hvmloader: Fix
 non-deterministic cpuid()
X-Mailer: aerc 0.17.0
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
 <f8bfcfeca0a76f28703b164e1e65fb5919325b13.1719416329.git.alejandro.vallejo@cloud.com> <7ecf1b46-c1c2-42b5-b3cb-ab737ab67900@citrix.com>
In-Reply-To: <7ecf1b46-c1c2-42b5-b3cb-ab737ab67900@citrix.com>

On Wed Jun 26, 2024 at 5:43 PM BST, Andrew Cooper wrote:
> On 26/06/2024 5:28 pm, Alejandro Vallejo wrote:
> > hvmloader's cpuid() implementation deviates from Xen's in that the valu=
e passed
> > on ecx is unspecified. This means that when used on leaves that impleme=
nt
> > subleaves it's unspecified which one you get; though it's more than lik=
ely an
> > invalid one.
> >
> > Import Xen's implementation so there are no surprises.
>
> Fixes: 318ac791f9f9 ("Add utilities needed for SMBIOS generation to
> hvmloader")
>
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >
> >
> > diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader=
/util.h
> > index deb823a892ef..3ad7c4f6d6a2 100644
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
> > +    uint32_t op,
> > +    uint32_t count,
> > +    uint32_t *eax,
> > +    uint32_t *ebx,
> > +    uint32_t *ecx,
> > +    uint32_t *edx)
> > +{
> > +    asm volatile ( "cpuid"
> > +          : "=3Da" (*eax), "=3Db" (*ebx), "=3Dc" (*ecx), "=3Dd" (*edx)
> > +          : "0" (op), "c" (count) );
>
> "a" to be consistent with "c".
>
> Also it would be better to name the parameters as leaf and subleaf.
>
> Both can be fixed on commit.=C2=A0 However, there's no use in HVMLoader
> tickling this bug right now, so I'm not sure we want to rush this into
> 4.19 at this point.
>
> ~Andrew

All sound good to me. For the record, the static inlines are copied verbati=
m
from Xen so if you'd like these adjusted you probably also want to make a
postit to change Xen's too.

Cheers,
Alejandro

