Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BB37EB373
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:23:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632805.987249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vGC-0000Yt-9J; Tue, 14 Nov 2023 15:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632805.987249; Tue, 14 Nov 2023 15:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vGC-0000Wq-5z; Tue, 14 Nov 2023 15:23:28 +0000
Received: by outflank-mailman (input) for mailman id 632805;
 Tue, 14 Nov 2023 15:23:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJWh=G3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r2vGA-0000UC-Fh
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:23:26 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1510174-8301-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 16:23:25 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50a6ff9881fso6958882e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 07:23:25 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a2e2c05000000b002bba2da7955sm1352810ljs.132.2023.11.14.07.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 07:23:24 -0800 (PST)
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
X-Inumbo-ID: c1510174-8301-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699975405; x=1700580205; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ivyYxDTDCVPuxxeXvNJZg50PeDSf7EnDd5tadZCRoM4=;
        b=jW/Zo4yw3UQ02ODs7fV6R5CfnDmMmIdY33kyLl0JjSVIxsYvmykNL//esyL4p87rtZ
         HeJUoijUmSn5AHEeaHy5PHBI41uU7fyDo+HKJlyUWj8YasYEDr12b9NSdx25PTnc4k37
         4RCMgCsjbKAl6cEjV+UFRnEtru5aL4bWRztYkryXYFiCFDpJ7dYhk+/KxoQGl31w0f50
         FgkGCOM+Eu2C2GTeBFTyu87IKRHOk1JDJcp7c96kGXUu3y/UOBVJ4sg7ClrAewcD5/v8
         iOo35PQPIoedxza4MSKmtXsF6ae/hKGb/HpQLlifU0oQbEWeXWwO4ld2wTBZVMkKBy+F
         tR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699975405; x=1700580205;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ivyYxDTDCVPuxxeXvNJZg50PeDSf7EnDd5tadZCRoM4=;
        b=tY822h8POupvXVSmeeXX6iVwacw6dxztNpHoI3FeV/aKk71EhLwi6h1ubLxo3Uo44+
         ZUy2yYnJ5fCRV4p/cPwednRX3L0b24uSL6al88nvHu/724XAAoGhI8TvkUrtznrqw1QL
         3ya/mDb0CmTx+EBWNew76nE5p+tDLNNhIXx3JxrFXBX+NcmvnzGI4lSR0nLy0G5gxLlq
         VOKRBVhN6pEchuwIbudg5GPS//EDmdaHSCuovSYl8kdB4Yb5lK+G4y5izOaRuwg0ZgvH
         F87uBuO27KPsjiselWkqN9p9h0aKQySIuknzyoTDBrb/qVPbWpMODU2qwL8362vUxIBM
         9u/g==
X-Gm-Message-State: AOJu0YzcvYKCSm/VKnXgnjnhP5AWI8M/LI5c6qb4GPHF7y5CczwHmZEW
	Q4hKr64lhfLbEY7KyicVxuQ=
X-Google-Smtp-Source: AGHT+IHbE4EMlozQ+9VLzSg5qJEwmhtP1l4lcsKai+th1LRUAPQO5vGqM6iR4wWYZPiS2CrmtSp7nw==
X-Received: by 2002:a2e:9e11:0:b0:2c6:ece6:5b65 with SMTP id e17-20020a2e9e11000000b002c6ece65b65mr1827412ljk.10.1699975405124;
        Tue, 14 Nov 2023 07:23:25 -0800 (PST)
Message-ID: <18afc0cf230cd248c194d7f839e70fd06b70d7f2.camel@gmail.com>
Subject: Re: [PATCH v2 02/15] xen/asm-generic: introduce generic device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 14 Nov 2023 17:23:24 +0200
In-Reply-To: <6a51f216-7dda-ed6d-b85e-f332cdba22a3@suse.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <f006e36726ecfefe5dad3c13401365c4f7276ccd.1699633310.git.oleksii.kurochko@gmail.com>
	 <6a51f216-7dda-ed6d-b85e-f332cdba22a3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-11-13 at 17:43 +0100, Jan Beulich wrote:
> On 10.11.2023 17:30, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/device.h
> > @@ -0,0 +1,140 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_DEVICE_H__
> > +#define __ASM_GENERIC_DEVICE_H__
> > +
> > +enum device_type
> > +{
> > +=C2=A0=C2=A0=C2=A0 DEV_DT,
> > +#ifdef HAS_PCI
> > +=C2=A0=C2=A0=C2=A0 DEV_PCI,
> > +#endif
> > +};
> > +
> > +struct dev_archdata {
> > +=C2=A0=C2=A0=C2=A0 void *iommu;=C2=A0=C2=A0=C2=A0 /* IOMMU private dat=
a */
> > +};
> > +
> > +/* struct device - The basic device structure */
> > +struct device
> > +{
> > +=C2=A0=C2=A0=C2=A0 enum device_type type;
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +=C2=A0=C2=A0=C2=A0 struct dt_device_node *of_node; /* Used by drivers =
imported
> > from Linux */
> > +#endif
>=20
> There's just this instance where HAS_DEVICE_TREE is checked. Why not
> elsewhere?
> Imo, if you really want this header in asm-generic/, then it wants to
> be truly
> generic (i.e. not implying DT just like you're not implying PCI or
> ACPI).
Mostly copied this file from Arm and only that one part was #ifdef-ed
with HAS_DEVICE_TREE.
But it makes sense to #ifdef DEV_DT, inclusion of <xen/device_tree.h>
and definiotn of dev_is_dt() macros.

I'll made the changes in next version of patch series.

Thanks for comments.

~ Oleksii

