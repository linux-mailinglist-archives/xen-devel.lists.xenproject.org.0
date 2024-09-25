Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C719857D9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 13:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803866.1214706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stPzt-0001OA-D6; Wed, 25 Sep 2024 11:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803866.1214706; Wed, 25 Sep 2024 11:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stPzt-0001Lh-A4; Wed, 25 Sep 2024 11:15:53 +0000
Received: by outflank-mailman (input) for mailman id 803866;
 Wed, 25 Sep 2024 11:15:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw3j=QX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1stPzr-0001Lb-08
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 11:15:51 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84858590-7b2f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 13:15:49 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so964910266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 04:15:49 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f46e5sm199272766b.148.2024.09.25.04.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 04:15:47 -0700 (PDT)
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
X-Inumbo-ID: 84858590-7b2f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727262948; x=1727867748; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gsJ/I+eB+72qK5hixNPExPDHJkmpqmzKPmBBpMET0mQ=;
        b=dBqFQB5NEucjvaf7dQF6a53fBEHQrnaC9uLzlwMoW4Z1tnz+IrXRORAybxdp5/qoek
         obr97ShzELzmy1C8pgEhRvYV33/aje9S5MZzNUxNg9FLZ1YeW52wlGPQBcE5YfFcoP3y
         9IDj3Uw9DRuFU3j6Sb8FPVCpV3yfIVICg7sM2V+vUtmuEyxZ2+8tnTpRHdqkbvVDx4u4
         dSroLBs0Ydxld7jw++II3onVnAg6oH0hl15gpeP/g7xNqvF8i4gy8MTwCu/qAQAYurtX
         r6tKfpd81KFrb+WbB41CR9nLw4tNLkgTjFqmMT8n6G10GZIFRtB4eZzMvU1QMUqZiUjt
         dEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727262948; x=1727867748;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gsJ/I+eB+72qK5hixNPExPDHJkmpqmzKPmBBpMET0mQ=;
        b=rC5XV66aBdEh5JFoFL17viYmDCS9kZ27Q6nNQxJubKgr2eBp9bSTxyzhRdudRAlsBI
         /XYOiAliMOKLgqtvSpskD3mXeedimTV9jWF6qnJe6ewkHaPstg2GOb5FZD14bzL9HosV
         CoZi5dAhdrmJutvZBearWyO5XlLV9x25pmPtrgWmV//B29XAGKMv6OVdh1u5hIz8QF+o
         Wg8Yfopyk6W8B4q89ryr0OlfuFviSBJKmmC7BAihBpYHq14FRAAHohuibaHP7Tcu/EqI
         Q58GECAGFt7KEYf3mRMIaXloSrSADTwTXOcf02SVq15V1hwSVIYCUI9e/rG6k/GcMtbf
         OdjA==
X-Forwarded-Encrypted: i=1; AJvYcCUYd7uul7ASFN+y7YMgaBoVEft7FLNp0SNWIsiD2lZNjVfVbrh/IM51Eckey49U3VtBBg7b38+bRyY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJBzkWNLm4EZbggllDkV1WQ0TWgR2vWYjc07tzzidGwbgdXcWW
	y3RKIn5hbJSyjpiBBRkSmedMkpEWKPmz3HjkPD2x5JjHRJn/K5+6
X-Google-Smtp-Source: AGHT+IGMDoBi3Lvwo24B63VklYGdFGduFnB8vK+OcsQ6klUT/6p5ZDa6NAUGHKZbq10DyeevCS5UVQ==
X-Received: by 2002:a17:907:e92:b0:a91:158b:122c with SMTP id a640c23a62f3a-a93a040b6c5mr212583266b.38.1727262948217;
        Wed, 25 Sep 2024 04:15:48 -0700 (PDT)
Message-ID: <aeb6ba1a7cbeb935f2752df93436ea8a874b649d.camel@gmail.com>
Subject: Re: [PATCH v3 2/5] xen/arm: use {DT,ACPI}_DEV_INFO for device info
 sections
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2024 13:15:47 +0200
In-Reply-To: <2f140321-a897-40df-b9dc-0a4ce6243809@suse.com>
References: <cover.1727193766.git.oleksii.kurochko@gmail.com>
	 <1533aa9fe0a4464bd97a44fc1f68cac0a670640c.1727193766.git.oleksii.kurochko@gmail.com>
	 <2f140321-a897-40df-b9dc-0a4ce6243809@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-09-25 at 10:37 +0200, Jan Beulich wrote:
> On 24.09.2024 18:42, Oleksii Kurochko wrote:
> > --- a/xen/arch/arm/xen.lds.S
> > +++ b/xen/arch/arm/xen.lds.S
> > @@ -126,19 +126,13 @@ SECTIONS
> > =C2=A0
> > =C2=A0=C2=A0 . =3D ALIGN(8);
> > =C2=A0=C2=A0 .dev.info : {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _sdevice =3D .;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.dev.info)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _edevice =3D .;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 DT_DEV_INFO
> > =C2=A0=C2=A0 } :text
> > =C2=A0
> > -#ifdef CONFIG_ACPI
> > =C2=A0=C2=A0 . =3D ALIGN(8);
> > =C2=A0=C2=A0 .adev.info : {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _asdevice =3D .;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.adev.info)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _aedevice =3D .;
> > +=C2=A0=C2=A0=C2=A0=C2=A0 ADEV_INFO
> > =C2=A0=C2=A0 } :text
> > -#endif
>=20
> Why's the #ifdef going away here?
It is incorrect as ADEV_INFO isn't covered by #ifdef anymore. Some
rebasing issue happens... I will fix that in the next patch version.
Thanks.

~ Oleksii

