Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAE6978559
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 18:02:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798335.1208557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8kc-0006a6-Cr; Fri, 13 Sep 2024 16:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798335.1208557; Fri, 13 Sep 2024 16:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8kc-0006Yb-AI; Fri, 13 Sep 2024 16:02:26 +0000
Received: by outflank-mailman (input) for mailman id 798335;
 Fri, 13 Sep 2024 16:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSyI=QL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sp8ka-0006YR-Q3
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 16:02:24 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4552519d-71e9-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 18:00:17 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5365b71a6bdso1394907e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 09:00:17 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f903ba7sm2301791e87.201.2024.09.13.09.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 09:00:16 -0700 (PDT)
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
X-Inumbo-ID: 4552519d-71e9-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726243217; x=1726848017; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IXkpNg2epbZEVRUn1i297ONeuUbbrcjWpY63769zps=;
        b=DDLyeQCxMBYE+mJLEtE6rbdqj0l0TFsiTokPROJ96mgadbgGJjecK3W6RxGLnwTz91
         h7QLK60yOeJhyXg+B1Q5RxfhyAb4OtJ6qCWTlphYi5P6diW+lYirf0Hebx+KLdlqtgry
         zNLPif4kMMcZdMnMTEu0fF/+aaM88UfNWHCcxo44zPngWCgIOSo0z+wceHBfz6tNMW8h
         C9QGm9eb1ocu/iMWzrw5TIZfjRg5ZuIzKfeundI9zfdm6KIO+ZfQYd8uWqv7h/QjsHPH
         qJoXAC7USdQO1lDtGwR3QfH2HATrh+9z5pg3enVBEu2BZL3mabmoIU39Tn/FBBFjH4BQ
         86DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726243217; x=1726848017;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1IXkpNg2epbZEVRUn1i297ONeuUbbrcjWpY63769zps=;
        b=eSsVmCjlDYFLeyZJWVmPn7ppIZg/AeFYcpLpG6clpkJ5vMxS/CPTYppIWBlcWD3ld3
         E4sZsuUQNBt9sA0TWAsm2y2vwxAVnXvU8DLJpxwvvQv25hiRSaXa9lDJsrlFMJVV9/h1
         8xlfIG9MmRczwtJeDueEPcz0t8swCkoaAEsm2xfiEN+KVN7NK4RXJDHnEJ5Yij4ard6j
         nJXOM+kWF8AoMaPLQxw0q8J3GBCOps2YPSGp0PCV0VHccULuq+1grvC1fYYvc3rplSPm
         r4dg90LrEchWdthlQnVLyBVT7TShLTj1VJjsH+KQ+dvzgb8EGt8BN2S+K5U2Ym4Wb6j0
         lnIg==
X-Forwarded-Encrypted: i=1; AJvYcCVK36IBBqrPuqlmL/+QsYMRagHlyUMtvDt8oePaeGikCr3BA3SEeP+LgK8algxIKUipn1sc8a2d+Eg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxz1YSQQQhFTw8wx/a+v4+paU+SyrB1pt3wNVdaPbhk3qvuIMVj
	yoq/csvKfFgAxuefNDfXDa4WNKETorkFQQ417ypaJHlE2tzRouMkxBkVOw==
X-Google-Smtp-Source: AGHT+IGHZPL+qsMS4Z71IHQzn3mRim3RBTNvRLb6RjF/p5EXI487aeXIzzgRyVHTVgpg0yAJzdJxVw==
X-Received: by 2002:a05:6512:b08:b0:535:6935:7869 with SMTP id 2adb3069b0e04-5367ff3287dmr2344819e87.55.1726243216993;
        Fri, 13 Sep 2024 09:00:16 -0700 (PDT)
Message-ID: <a4f0b762da246754786be6d93a088ffdce14a1af.camel@gmail.com>
Subject: Re: [PATCH v1 1/3] xen/ppc: add section for device information in
 linker script
From: oleksii.kurochko@gmail.com
To: Shawn Anastasio <sanastasio@raptorengineering.com>, 
	xen-devel@lists.xenproject.org
Date: Fri, 13 Sep 2024 18:00:16 +0200
In-Reply-To: <1ae939b4-0d15-4406-8ac3-3e2735550b13@raptorengineering.com>
References: <cover.1726048521.git.oleksii.kurochko@gmail.com>
	 <395dd494ad09b315e5e383aa41f8dad4548ba613.1726048521.git.oleksii.kurochko@gmail.com>
	 <1ae939b4-0d15-4406-8ac3-3e2735550b13@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-09-13 at 09:35 -0500, Shawn Anastasio wrote:
> Hi Oleksii,
>=20
> On 9/11/24 5:04 AM, Oleksii Kurochko wrote:
> > Introduce a new `.dev.info` section in the PPC linker script to
> > handle device-specific information.
> > This section is aligned to `POINTER_ALIGN`, with `_sdevice` and
> > `_edevice`
> > marking the start and end of the section, respectively.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/arch/ppc/xen.lds.S | 7 +++++++
> > =C2=A01 file changed, 7 insertions(+)
> >=20
> > diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> > index 38cd857187..c087827d28 100644
> > --- a/xen/arch/ppc/xen.lds.S
> > +++ b/xen/arch/ppc/xen.lds.S
> > @@ -161,6 +161,13 @@ SECTIONS
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __bss_end =3D .;
> > =C2=A0=C2=A0=C2=A0=C2=A0 } :text
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_ALIGN);
> > +=C2=A0=C2=A0=C2=A0 .dev.info : {
>=20
> Sections in the PPC linker script must be declared with the
> DECL_SECTION
> macro to ensure that they are placed at the correct physical and
> virtual
> address (see all other sections in the file).
>=20
> Additionally, like Jan mentioned, placing the section section before
> .bss would probably be preferable. Right before .init.text would
> probably be a reasonable place to put it, like ARM's linker script
> does.
Thanks. I will apply your comments.

~ Oleksii

