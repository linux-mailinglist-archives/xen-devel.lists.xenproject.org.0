Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B3B947E34
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 17:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772244.1182688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sazjC-0005oi-U7; Mon, 05 Aug 2024 15:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772244.1182688; Mon, 05 Aug 2024 15:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sazjC-0005mB-Qt; Mon, 05 Aug 2024 15:34:30 +0000
Received: by outflank-mailman (input) for mailman id 772244;
 Mon, 05 Aug 2024 15:34:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=006L=PE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sazjC-0005m5-0o
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 15:34:30 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 336fa4f3-5340-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 17:34:27 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52efa9500e0so12462284e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 08:34:27 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba29fefsm1164111e87.179.2024.08.05.08.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 08:34:26 -0700 (PDT)
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
X-Inumbo-ID: 336fa4f3-5340-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722872067; x=1723476867; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LD20EJ+qCgeHjbro+8+iDkgyD+LlruaDhC7VGm1lfR0=;
        b=PwrMTBU0Mju8SKikpzPzoap4HWmTOMarKrfZACe/IHWcX1c5vKowURhEwV1vXzC0Cu
         ZwuahQEEzdPEktFmla2bF3TyofUiYcRw+o/2dC3Z4IwYxDE96XzU4RXBu5A4IphUYTRT
         RP0z49cNGlhn3AxWTVbnUN/39L2Y+QktTzkRwpOPoJclmrWyCcUEqfiyfo/el+1LzK6p
         55D96ukMonL/oBnxOtdZm+1d3Qq9h0fzyJjwWFzr8hp15JfVan3azV+b08rnefH5PAWo
         HYqeWZ5Q1Vri5+DgoNhAo6XhROPT7sPXMoYyYOGYadWQcoEkiZQSr0HRj+LoXZNRNSq/
         jx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722872067; x=1723476867;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LD20EJ+qCgeHjbro+8+iDkgyD+LlruaDhC7VGm1lfR0=;
        b=GuG6UyYRzYGct7U8dYLJv/mjl7/3/Pkq+tT35zMzy4dtm0qlnDr7SN0W+WfPzHOaUh
         Ln1eA2CRGSGoPeOtrli1cK6lMu9yrOMKvH87Vm25ojpfPDzrm7W6N83IzKSqwLE79wq1
         qOWefLP+w/vV8X2qEI0agI14WI3Ko8RqQhkDjEDqokJAB3yfa1xVkVwV5yIPbnIWs0sb
         Cp6GR6juTVfFOZ6331QFSV6fiwbcn2jaQt639RrmrHiBfltAD26TycOvUWyZaG8vsgCz
         6W4inoKuZtuUgAc15HEiOOzZD/aZKbdcDD6Peduc7gvgYLWVMGCDt+39JmQuI/UElStm
         iHFA==
X-Forwarded-Encrypted: i=1; AJvYcCVWS0YBJMq3VWtbKgxZlc6nZzqqlD+Pt0P9KD51cHeBB6ZRFdvqxHGuGliQAJ1+V5Gu50s2ydXHHeLUun7ZuigC8PSkFpSeZq0ZH0D15uw=
X-Gm-Message-State: AOJu0Yyn2GP5YkLr3XpTDK6U/9BRCWfQaDG13febeR8B65/6GJNIUTzu
	XtnkWPCJlIqQkLA66T33cR2G2yTn84AwDyWHQSyJeVuh1z8TXbQn
X-Google-Smtp-Source: AGHT+IHJZs2TDIUGCJCSi4FpUBddaDXYZO6rAGJYpLJUVfVzoUNL33yUCEO8zFolVsSmADKqfXL+ig==
X-Received: by 2002:a05:6512:401d:b0:530:ac6e:ea2f with SMTP id 2adb3069b0e04-530bb39d218mr8442502e87.37.1722872067052;
        Mon, 05 Aug 2024 08:34:27 -0700 (PDT)
Message-ID: <fba675f7256aec1492f8446b0a0716e05bc91c54.camel@gmail.com>
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>
Date: Mon, 05 Aug 2024 17:34:25 +0200
In-Reply-To: <afbbf9ed7c575e3b2c3f9a668db0b27258822ee0.camel@gmail.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
	 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
	 <afbbf9ed7c575e3b2c3f9a668db0b27258822ee0.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-08-05 at 17:13 +0200, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> > > +=C2=A0=C2=A0=C2=A0 BUG_ON(pte_is_valid(*pte));
> > > +
> > > +=C2=A0=C2=A0=C2=A0 tmp =3D paddr_to_pte(LINK_TO_LOAD((unsigned long)=
&xen_fixmap),
> > > PTE_TABLE);
> >=20
> > I'm a little puzzled by the use of LINK_TO_LOAD() (and
> > LOAD_TO_LINK()
> > a
> > little further up) here. Don't you have functioning __pa() and
> > __va()?
> Can __pa() and __va() be used in this case?
>=20
> According to comments for other architectures, these macros are used
> for converting between Xen heap virtual addresses (VA) and machine
> addresses (MA). I may have misunderstood what is meant by the Xen
> heap
> in this context, but I'm not sure if xen_fixmap[] and page tables are
> considered part of the Xen heap.

One more thing: can we use __pa() and __va() in setup_fixmap()?

As I understand it, to define __pa() and __va(), the DIRECTMAP mapping
should be mapped first. However, this requires information about RAM
banks, which is provided in the device tree file. But we can't map
device tree without fixmap. Am I missing something?

~ Oleksii

