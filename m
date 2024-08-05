Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B409478AD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 11:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771931.1182369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sauGc-0001eo-Du; Mon, 05 Aug 2024 09:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771931.1182369; Mon, 05 Aug 2024 09:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sauGc-0001cR-B9; Mon, 05 Aug 2024 09:44:38 +0000
Received: by outflank-mailman (input) for mailman id 771931;
 Mon, 05 Aug 2024 09:44:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=006L=PE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sauGb-0001aQ-7x
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 09:44:37 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5336454a-530f-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 11:44:35 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5a1c49632deso12764238a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 02:44:35 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5babb4ec55csm2319308a12.47.2024.08.05.02.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 02:44:34 -0700 (PDT)
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
X-Inumbo-ID: 5336454a-530f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722851075; x=1723455875; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mzuxSTbL5Cxx/kk9TbbpNOLZT/vyDNKq19mBiAE1u34=;
        b=dK0KKzZPkQozkSjzbJJWYRHjYsZRAjTNQzAakmYG+okKulsGhFD8PThw+1i5OfsDzE
         1b0vK2NAQ0XMrrrMYjBKpAdg01VpEODAIoSSijDoTnGhhsmJuO5qI5Hxk0lWMZ0vkIrl
         Yz9/tMCUkU6ScodQ5GM9A0+StoPtJFfqHLrV6wye8pDrHkwKhnd+K/eCsEMog0hFo3ve
         K+UAwlDgIpRI4L7o6gIrBUfLZ0RuSb5g3rP2m1wbAIk2APx8fSxLFyv/NJMw1ksjWJDO
         LmSfoiSlSRi+W85dt0V0QFUeZJrjHtkmfR8h6iruTekfclcvt4AQLBX2qk6rRUqYoU0N
         7QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722851075; x=1723455875;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mzuxSTbL5Cxx/kk9TbbpNOLZT/vyDNKq19mBiAE1u34=;
        b=LT1u6MTVrAy5plX+cYeUnstRE9CWIjGtgLuxmK3CXEfawatGh/fC9a3jUJDnWYEmy+
         NNbj0XhsacP94bYT8rsTmvChj4bbEWInX68FCjPrZ2Z195g/jyBQ+kpcx9zftIpuV2p1
         +z8mr8xFf1m2GJ3LlbVwPYWMqWs3cxFhuMZR885DB2/l8bvR4JhEZC98mSL41/KHQ3SD
         5n3rehNLGax7Msa5YTLQfbN3MugIUl1RBbznVlyAAcJwza61UCwQ08gG9JdEqy8gTVH1
         1O3Z6dXppZQ+fpRfcW9FTrUMUZvRhpO49p1Q+e8Xc5e9HeF78FzoXDd+oJDzlq48WWYP
         G0kw==
X-Forwarded-Encrypted: i=1; AJvYcCXM/eANoPWWtXuI7UGCvG+zoPI37cJQMKgvxd3MWadVkq2pcuqDC7Xw8N8gCDC3+Phu+VuEdW86J5CI+R7ehUCy6hWDcyheq3BiS1Asrws=
X-Gm-Message-State: AOJu0Yw7qvt9kgHcmBGbAAQ6jstWSaBt542+NAmDBurrk5f64NXJAsce
	b5WYZQghg+zMCxd6rloTabplCO9QdWpjAtUhdEv4si6qWudK5j1T0jSmhg==
X-Google-Smtp-Source: AGHT+IFz7Q/QeZaa7/2D31He2kegrSgerncFwKVtSpE4CxAkxCn9OZmGjY4cEeiaLM7hWSKkFDBM7w==
X-Received: by 2002:a05:6402:14da:b0:5a1:aa6d:9469 with SMTP id 4fb4d7f45d1cf-5b7f5dc6bc2mr7208845a12.38.1722851074836;
        Mon, 05 Aug 2024 02:44:34 -0700 (PDT)
Message-ID: <3c03ff921b8c1950eb8376e94cdfb490ea28bf4b.camel@gmail.com>
Subject: Re: [PATCH v7 1/9] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
From: oleksii.kurochko@gmail.com
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,  "Daniel P. Smith"
 <dpsmith@apertussolutions.com>
Date: Mon, 05 Aug 2024 11:44:33 +0200
In-Reply-To: <309d42dc-e540-4fbe-a69e-2be6414deb70@xen.org>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <102f8b60c55cdf2db5890b9fb1c2fb66e61c4a67.1721834549.git.oleksii.kurochko@gmail.com>
	 <309d42dc-e540-4fbe-a69e-2be6414deb70@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

Hi Julien,

On Mon, 2024-08-05 at 10:08 +0100, Julien Grall wrote:
> Hi,
>=20
> On 24/07/2024 16:31, Oleksii Kurochko wrote:
> > Changes in V5:
> > =C2=A0 - add xen/include/xen/bootfdt.h to MAINTAINERS file.
> > =C2=A0 - drop message "Early device tree parsing and".
> > =C2=A0 - After rebase on top of the current staging the following
> > changes were done:
> > =C2=A0=C2=A0=C2=A0 - init bootinfo variable in <common/device-tree/boot=
info.c>
> > with BOOTINFO_INIT;
> > =C2=A0=C2=A0=C2=A0 - update the code of dt_unreserved_regions():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_STATIC_SHM related ch=
anges and getting of
> > reserved_mem
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bootinfo_get_shmem() ??
> > =C2=A0=C2=A0=C2=A0 - update the code of meminfo_overlap_check():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add check ( INVALID_PADDR =
=3D=3D bank_start ) to if case.
> > =C2=A0=C2=A0=C2=A0 - update the code of check_reserved_regions_overlap(=
):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_STATIC_SHM related ch=
anges.
> > =C2=A0=C2=A0=C2=A0 - struct bootinfo was updated ( CONFIG_STATIC_SHM ch=
anges )
> > =C2=A0=C2=A0=C2=A0 - add shared_meminfo ( because of CONFIG_STATIC_SHM =
)
> > =C2=A0=C2=A0=C2=A0 - struct struct membanks was update with __struct gr=
oup so
> > <xen/kernel> is
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 neeeded to be included in bootfdt.h
> > =C2=A0=C2=A0=C2=A0 - move BOOTINFO_ACPI_INIT, BOOTINFO_SHMEM_INIT, BOOT=
INFO_INIT
> > to generic bootfdt.h
> > =C2=A0=C2=A0=C2=A0 - bootinfo_get_reserved_mem(), bootinfo_get_mem(),
> > bootinfo_get_acpi(),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bootinfo_get_shmem() and bootinfo_get_sh=
mem_extra() were
> > moved to xen/bootfdt.h
> > =C2=A0 - s/arm32/CONFIG_SEPARATE_XENHEAP/
>=20
> I think this change deserve a comment in the commit message.
Sure, I will mention that ( IIUC only this
"s/arm32/CONFIG_SEPARATE_XENHEAP/" should be mentioned ).

>=20
> [...]
>=20
> > --- /dev/null
> > +++ b/xen/common/device-tree/bootinfo.c
> > @@ -0,0 +1,459 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Derived from $xen/arch/arm/setup.c.
>=20
> I would suggest to mention the version of Xen this is derived from.
Will it be enough only Xen version without commit hash?

>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
Thanks!

~ Oleksii

