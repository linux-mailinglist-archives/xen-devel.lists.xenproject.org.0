Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41470A68C80
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920468.1324629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusGr-0002XU-LL; Wed, 19 Mar 2025 12:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920468.1324629; Wed, 19 Mar 2025 12:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusGr-0002Uv-IO; Wed, 19 Mar 2025 12:11:41 +0000
Received: by outflank-mailman (input) for mailman id 920468;
 Wed, 19 Mar 2025 12:11:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eFby=WG=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tus7I-0004qj-6l
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:01:48 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef3613fd-04b9-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 13:01:47 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-54963160818so8067935e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:01:47 -0700 (PDT)
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
X-Inumbo-ID: ef3613fd-04b9-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742385707; x=1742990507; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVmeo6Y0RDkn1EjaWXin4s++GEMsr3bFGu5VWGkSJV0=;
        b=CfA6g7qAMjCeD5enGJ6Lia4MnDZL/z6AheE36goFsS2trfqZ4J1LkaRGM4qc50SFq+
         I2p/gwi/YLwaCy3zKkcBtrUN78gMbTdJ7VsxMotq/Ao6gdEndH7WzKC60pJUhuwmPH1u
         QncgKpqbj/Fy9gNAfFa1sHwKJz8w9qPgGhtyZhq67zBc6tDX0f6jEWzM+abjBvbboEIt
         HUE4JokfiKbDHJCACWRHi5r7B40RxP8dwhWqRQDpK+azNW94/ybQp9/88+Cv8cdTDzp8
         VWpSEGP7bXUFcXw+q9LpxC75txbBZ5sfW2ITH/lWkRXSwt6yoGeex1/x4J3LKV7YythO
         ne+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742385707; x=1742990507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVmeo6Y0RDkn1EjaWXin4s++GEMsr3bFGu5VWGkSJV0=;
        b=TMvTaW2qnbY+97RsqAfFjBtnIpRKkcWghosClp5/B6IZDDOkB/Lqc5GnxhtkbQ1Hpa
         yMvLuMXK7leoSmGoMtVNpH5ieLe3AerLBouL417y2oOVEtzBmNhCIDYvIPp1cTWQmOlC
         fSlqJ4vu0BmnKa43zeDHC070mYdc83gxCNqq3j5x6mGz/0nQgpqW7KcWuoddOr90CAW5
         FIyEJPduqeVOzA4MIn7hKE20ZfVMV+62Qsh35/XVgYrkd4k//lWXU9DKNd5SGKXVJht1
         vg220Qu8AtbDeuQDMqOyHhPP2O5d8ur0uKMMc2tgB3dlXPNKCIEEf+0LImLTZzJwul/X
         Gf7A==
X-Forwarded-Encrypted: i=1; AJvYcCUz3VL6Lkv6n0RIxwZzCZh6tsusm2arrPmKDDuKenjAxdEBVgyBQbTUjoJI4hqX1nH0oI2sEa4jOpM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeK9K4JWGFJhq2rhW/2G09taFYfoU1quHjJzTNJ2eCu45GjpEd
	K7W+HaukoyoCe48x0gXyx2/5853z7ngZ21LcBK23sbFE82t3vtx+9NOODITgq1UxHg1WLKgLyuT
	6zqGcj03Hh9iLbGrb5GQvBNE0Jjw=
X-Gm-Gg: ASbGnctlxOVkyNRF9HlrLB3ZrhpZzrRQWl1654LwtjVo2bWjidwLEjEYk8yGEpAv3Pj
	0ZB+2vrdgnDlXRgNO0Ev4stp6/aJxDGkCYp6MXSRn9FHjsH/pth88E1A7BIZas7mYMCdAYOFfO2
	XJy9xpQhfxgHvkv6OrbfQ4Fm3s
X-Google-Smtp-Source: AGHT+IFCJoAYVIL+bf3id137lhB7Kyr3FgOLAUdCRwi6SN0rrw4yd9nFp4R38SAFTjIxeHPeNGC+gwdBhIxo2S9OJ/k=
X-Received: by 2002:a05:6512:1246:b0:549:b1c1:4d76 with SMTP id
 2adb3069b0e04-54acb19d0eemr825937e87.5.1742385706753; Wed, 19 Mar 2025
 05:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <5694f2b73e808ebdc5d5b60a31cfad2b24f0e9d8.1741164138.git.xakep.amatop@gmail.com>
 <2caf2bc0-d915-413e-ac76-cc70f9010ebe@suse.com>
In-Reply-To: <2caf2bc0-d915-413e-ac76-cc70f9010ebe@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 19 Mar 2025 14:01:35 +0200
X-Gm-Features: AQ5f1JoQDUSsdTP8oue3-Ptopnn2D-xmiHXoo30rrDI_IZeL8TfQkOLBEMQd2wc
Message-ID: <CAGeoDV8=F1suS+0DJAV4uOh1vtMWwV41wwqDx9115t004BWvRw@mail.gmail.com>
Subject: Re: [PATCH 01/16] iommu: Add checks before calling iommu suspend/resume
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykyta Poturai <mykyta_poturai@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 5, 2025 at 6:45=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 05.03.2025 10:11, Mykola Kvach wrote:
> > --- a/xen/drivers/passthrough/iommu.c
> > +++ b/xen/drivers/passthrough/iommu.c
> > @@ -613,7 +613,7 @@ int __init iommu_setup(void)
> >
> >  int iommu_suspend(void)
> >  {
> > -    if ( iommu_enabled )
> > +    if ( iommu_enabled && iommu_get_ops() && iommu_get_ops()->suspend =
)
> >          return iommu_call(iommu_get_ops(), suspend);
> >
> >      return 0;
> > @@ -621,7 +621,7 @@ int iommu_suspend(void)
> >
> >  void iommu_resume(void)
> >  {
> > -    if ( iommu_enabled )
> > +    if ( iommu_enabled && iommu_get_ops() && iommu_get_ops()->resume )
> >          iommu_vcall(iommu_get_ops(), resume);
> >  }
>
> When iommu_enabled is true, surely iommu_get_ops() is required to return
> non-NULL?

As far as I can see, in some cases, the handler is still checked even
if iommu_enabled
is true, such as in the case of the iommu_quiesce call. However, it
might be better to drop
this patch from the current patch series or add a patch that
introduces the handlers.

>
> Jan

Best regards,
Mykola

