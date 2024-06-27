Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B0991A2F7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 11:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749903.1158146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMlkU-0007Fa-Be; Thu, 27 Jun 2024 09:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749903.1158146; Thu, 27 Jun 2024 09:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMlkU-0007Dg-8n; Thu, 27 Jun 2024 09:49:02 +0000
Received: by outflank-mailman (input) for mailman id 749903;
 Thu, 27 Jun 2024 09:49:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1631=N5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMlkS-0007Da-Kg
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 09:49:00 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a084538-346a-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 11:48:59 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6fd513f18bso769313066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 02:48:59 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d6fdc99sm43163166b.5.2024.06.27.02.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 02:48:57 -0700 (PDT)
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
X-Inumbo-ID: 7a084538-346a-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719481738; x=1720086538; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OX9r7P0P/VRbQRTIqhcoA/h1nIw98fEBgnkDs8Va5UA=;
        b=LprGG19YlVYnrqGTqWey8hOk69n/hGeIMxtntDZ90jDrBLHDbI/KugHHgpZjJC/LOq
         062Df9Gm8z3OFq9BcnS/656aNK+qFjN9dew8Q2y1datlQ9k9JAOLooLCi+NptAjJl1Px
         JCyHIT4BULUUibdBQOnf3UFH+6dDQ8xmchRVJSBkilZBR3Jd8l6v6Z3cEjusdHP6Mcyp
         vIBhID256PyZfAeu+ApYLtJW/RpRZSzZd33VO7qjW4jhaBAMk9ZWWGISscrT9/vaSLwp
         lXC6nPSsF5PhxsJMbG8QJBHdWMAntMGop1Ba5ssK2ZJCbJZH8CAolsXwohm+EcL+zPDZ
         Wcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719481738; x=1720086538;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OX9r7P0P/VRbQRTIqhcoA/h1nIw98fEBgnkDs8Va5UA=;
        b=rhxcVarH+9dbUDBKVpuCWAPztov1ofLrecUcoe68Si8hh6LaijzjbVhAKjRrORIuDw
         8wkoKGnaI4BvCQvBCk2BzqXYCaIOAe/zPWorQU//b6YcrRDbiKuDxl61OIRTReJd1DOt
         MOjM5LKGVOZmX+0k2yP1jeymIxIePfU3+d95MYi5iZc0mZvPak6PTwBBxDnmMSZ33hIX
         I/k+qh8CYEQQ52YuzV6lFOp3rndbRzbzPxtB9jVs6PF4MmCSbT/RLGgscKUIeUcXgUUO
         KJGyP+/rhcasSrQmsTxOqkZu1PTinWXPVIYnWrjmBtSASb8n8/UNFU60pMN/ZCy1sRGw
         Es6A==
X-Forwarded-Encrypted: i=1; AJvYcCV0AfCHMOVLHCdwDqc1WbO6nCOXhIc5HT6lpN9v/B8FjHcKch45tA2yOPHR2Ftpa4KA8fr3Z4VO7gYx7HkqaxSd9SXJtHQqh0dvFw9poEQ=
X-Gm-Message-State: AOJu0Yybuz3d+yqu3XGGLe7032C/KK8ddXRHRyywsQ5Qa6HYkU/3hFlG
	3Db9/GZR9qQDb3/VdtDvXNRA8w/a1d/x2+yQnz3mFjZbPv6trjqQ
X-Google-Smtp-Source: AGHT+IF3lCTz09NuVd+xr7DEQvXa98Qfnf93YXfMO4z1e4CN8RLHhqH+qV1ZwUgd0xRC/Tv62eD3wQ==
X-Received: by 2002:a17:906:1d03:b0:a6f:5fa8:1b7 with SMTP id a640c23a62f3a-a7245b45aa0mr826246066b.15.1719481737473;
        Thu, 27 Jun 2024 02:48:57 -0700 (PDT)
Message-ID: <1ac96e89b527c637bc32badd69c4812b6e1d7281.camel@gmail.com>
Subject: Re: [PATCH for 4.19 v4 01/10] tools/hvmloader: Fix
 non-deterministic cpuid()
From: oleksii.kurochko@gmail.com
To: Andrew Cooper <andrew.cooper3@citrix.com>, Alejandro Vallejo
	 <alejandro.vallejo@cloud.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>
Date: Thu, 27 Jun 2024 11:48:56 +0200
In-Reply-To: <7ecf1b46-c1c2-42b5-b3cb-ab737ab67900@citrix.com>
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
	 <f8bfcfeca0a76f28703b164e1e65fb5919325b13.1719416329.git.alejandro.vallejo@cloud.com>
	 <7ecf1b46-c1c2-42b5-b3cb-ab737ab67900@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-06-26 at 17:43 +0100, Andrew Cooper wrote:
> On 26/06/2024 5:28 pm, Alejandro Vallejo wrote:
> > hvmloader's cpuid() implementation deviates from Xen's in that the
> > value passed
> > on ecx is unspecified. This means that when used on leaves that
> > implement
> > subleaves it's unspecified which one you get; though it's more than
> > likely an
> > invalid one.
> >=20
> > Import Xen's implementation so there are no surprises.
>=20
> Fixes: 318ac791f9f9 ("Add utilities needed for SMBIOS generation to
> hvmloader")
>=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> >=20
> >=20
> > diff --git a/tools/firmware/hvmloader/util.h
> > b/tools/firmware/hvmloader/util.h
> > index deb823a892ef..3ad7c4f6d6a2 100644
> > --- a/tools/firmware/hvmloader/util.h
> > +++ b/tools/firmware/hvmloader/util.h
> > @@ -184,9 +184,30 @@ int uart_exists(uint16_t uart_base);
> > =C2=A0int lpt_exists(uint16_t lpt_base);
> > =C2=A0int hpet_exists(unsigned long hpet_base);
> > =C2=A0
> > -/* Do cpuid instruction, with operation 'idx' */
> > -void cpuid(uint32_t idx, uint32_t *eax, uint32_t *ebx,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t =
*ecx, uint32_t *edx);
> > +/* Some CPUID calls want 'count' to be placed in ecx */
> > +static inline void cpuid_count(
> > +=C2=A0=C2=A0=C2=A0 uint32_t op,
> > +=C2=A0=C2=A0=C2=A0 uint32_t count,
> > +=C2=A0=C2=A0=C2=A0 uint32_t *eax,
> > +=C2=A0=C2=A0=C2=A0 uint32_t *ebx,
> > +=C2=A0=C2=A0=C2=A0 uint32_t *ecx,
> > +=C2=A0=C2=A0=C2=A0 uint32_t *edx)
> > +{
> > +=C2=A0=C2=A0=C2=A0 asm volatile ( "cpuid"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Da" (*eax)=
, "=3Db" (*ebx), "=3Dc" (*ecx), "=3Dd" (*edx)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "0" (op), "c"=
 (count) );
>=20
> "a" to be consistent with "c".
>=20
> Also it would be better to name the parameters as leaf and subleaf.
>=20
> Both can be fixed on commit.=C2=A0 However, there's no use in HVMLoader
> tickling this bug right now, so I'm not sure we want to rush this
> into
> 4.19 at this point.
I agree, I think it would be better to postpone the patch until 4.20
branch.

~ Oleksii

