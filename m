Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4EC7FEF7C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 13:48:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644655.1005993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8gSg-00058R-JM; Thu, 30 Nov 2023 12:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644655.1005993; Thu, 30 Nov 2023 12:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8gSg-00056X-Eq; Thu, 30 Nov 2023 12:48:10 +0000
Received: by outflank-mailman (input) for mailman id 644655;
 Thu, 30 Nov 2023 12:48:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Efh=HL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r8gSe-00056P-VZ
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 12:48:09 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b635f1b6-8f7e-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 13:48:08 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bbb79f97cso889594e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 04:48:08 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a9-20020ac25e69000000b0050b9bcdefe0sm159089lfr.206.2023.11.30.04.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 04:48:06 -0800 (PST)
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
X-Inumbo-ID: b635f1b6-8f7e-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701348487; x=1701953287; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B+WSXWKOhFSYYQa+a1gHqOxKhgp4BV2vq4FjYmTuYFA=;
        b=VI5dUQ/8NULk7kBMxL3Y/148H8AZKeV09Bg8e29en0pOJ29dHG55jdqRWypa9ZKADy
         1orB0KvxKbY7BSoorBpU/EHT5maU10aqYEwQeSqTrBbS33qoIQGhT+AG7wvCLnrVvX7V
         gLqF56AWHG8JbT5n/jf1pRvG4e+Rt4bZwNM6o77RT79bkmCuOHWNSsLIoPNX3Ub87rqn
         RA7dB/Wp1jb8T9pXpQcPm+K/fPiwTskMpYNMQJffmD3VYQHXtI1WjMod+lc5GikqoRqb
         Z3VjR0KukBVMKK7w0rjtd0lDXemjn2AhncvIWUrUcnrmIV1Tlaokz60NWA2ia07WIZW3
         0j2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701348487; x=1701953287;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B+WSXWKOhFSYYQa+a1gHqOxKhgp4BV2vq4FjYmTuYFA=;
        b=XXMxLG+XTMm7wqkV6W2yBX0ZWMDoIQEP7h4+yqBxQvO/vsTQwhdmlnjdIFieNo1SUd
         UEc4F3qOngdDytRTrP49+qTG+TWNj4j6QdiOSY74KtyX4+fWVDAL7Fr0dvrpZVHJ9yt3
         syDKpRo4UtEVtBu+6srNdNQ6ZjJiJdFXJS96XDnPnQtsCy22R6My6UqMgEj14Ya1yiYv
         yM0JuB7Q6xgP01nPVpp3X19dlydd8nOiPmkukNTwWQsvLcxuQ3S5Oedozj4tKGzjw0X+
         CB4nBEZf7jY/1xRx4Y7BqmKYEqDGf9bxGVq9kVBKYq3gv1S1dGjHmaOknlZM8MMVEoAG
         vB4Q==
X-Gm-Message-State: AOJu0Yygv1AvRNT10GLE2A4/bhHD8A3j/ovGZYz6vtn68JJkoBeKl/yb
	sgvBoWqDJKV+8P6Hvd1vTJo=
X-Google-Smtp-Source: AGHT+IES6wbpAKs7ZZPH2qDM+9HlMTKFYfRx2tWjfnvdU29cWGqa32tbx82fDSQpOzvekKrRBxm2+w==
X-Received: by 2002:a05:6512:3b86:b0:503:7f6:ac20 with SMTP id g6-20020a0565123b8600b0050307f6ac20mr8597418lfv.5.1701348487322;
        Thu, 30 Nov 2023 04:48:07 -0800 (PST)
Message-ID: <cf2828e4f23000db5488fbf83cf72dc9d9d9dd83.camel@gmail.com>
Subject: Re: [PATCH v4 02/14] xen/asm-generic: introduce generic device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>, 
	xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Date: Thu, 30 Nov 2023 14:48:05 +0200
In-Reply-To: <4f67d4c0-d90a-4778-800b-87108cd1d3f8@raptorengineering.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
	 <67172a4fbf88833480203fcb1e2c640b6d39a556.1701093907.git.oleksii.kurochko@gmail.com>
	 <98023f51-5953-4384-918d-ae726d74ef7c@raptorengineering.com>
	 <e29665f849d23a768262c6d1a7436916a7ec887c.camel@gmail.com>
	 <4f67d4c0-d90a-4778-800b-87108cd1d3f8@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

Hi Shawn,

On Wed, 2023-11-29 at 13:18 -0600, Shawn Anastasio wrote:
> On 11/29/23 6:49 AM, Oleksii wrote:
> > On Tue, 2023-11-28 at 15:28 -0600, Shawn Anastasio wrote:
> > > Hi Oleksii,
> > >=20
> > > On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> > > > diff --git a/xen/arch/ppc/include/asm/irq.h
> > > > b/xen/arch/ppc/include/asm/irq.h
> > > > index 5c37d0cf25..49193fddff 100644
> > > > --- a/xen/arch/ppc/include/asm/irq.h
> > > > +++ b/xen/arch/ppc/include/asm/irq.h
> > > > @@ -3,7 +3,9 @@
> > > > =C2=A0#define __ASM_PPC_IRQ_H__
> > > > =C2=A0
> > > > =C2=A0#include <xen/lib.h>
> > > > +#ifdef CONFIG_HAS_DEVICE_TREE
> > >=20
> > > I realize that you were likely following PPC's device.h which
> > > also
> > > checks CONFIG_HAS_DEVICE_TREE, but I'm not sure that it makes
> > > sense
> > > to
> > > check this conditional in PPC code at all -- we will always have
> > > HAS_DEVICE_TREE (selected by PPC) and I can't imagine a scenario
> > > where
> > > this will ever not be the case.
> > What about case if ACPI is used? Does ACPI is supported by PPC?
> >=20
> > But if you are sure that CONFIG_HAS_DEVICE_TREE will be always
> > selected
> > then I am OK to remove this change.
> >=20
>=20
> ACPI isn't supported by any PPC platform, we always use device tree.
Thanks for clarification.

Then we can remove useless #ifdef. I'll do it it in next patch version.

>=20
> > >=20
> > > Unless Jan (or someone else) disagrees, I'd rather this
> > > conditional
> > > be
> > > dropped inside of PPC code.
> > I'll double check but I think I had a compilation issue if it isn't
> > defined.
> >=20
>=20
> I'm not encountering any issues locally with the conditional dropped,
> but if you are able to reproduce them then let me know.
Sure. I am going to do it tomorrow or today evening if I'll face an
issue will write you.

~ Oleksii

