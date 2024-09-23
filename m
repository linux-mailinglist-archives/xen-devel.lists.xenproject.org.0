Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F2E97ED51
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 16:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802102.1212238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskJw-00061Z-R5; Mon, 23 Sep 2024 14:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802102.1212238; Mon, 23 Sep 2024 14:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskJw-0005yQ-OP; Mon, 23 Sep 2024 14:45:48 +0000
Received: by outflank-mailman (input) for mailman id 802102;
 Mon, 23 Sep 2024 14:45:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81ci=QV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sskJv-0005Ta-Dg
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 14:45:47 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 840b39dd-79ba-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 16:45:45 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c24ebaa427so8321468a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 07:45:45 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90613304dasm1227085166b.197.2024.09.23.07.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 07:45:44 -0700 (PDT)
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
X-Inumbo-ID: 840b39dd-79ba-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727102745; x=1727707545; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3eNNTcdEn/K2P8AHCw9a/zLnrwScnKiMQ6o+kFPfFqg=;
        b=PpnH+ypfrc7edojpDrOrHnjmC4CS0rAs03z4W1d1vHjscBHahZBuznZtx23gFqZVln
         5/U+/VLF55QeMIVPjTJqU/T1ZjWr/FDjCdOihu/vlm+YeuSwRjPs4vGOXtTqEcq1n2eW
         D2Yb6tgKxtiaWGP2Y3SYJ+CNTZ4mndOuLS7dJtV5/ja+iFogFgaNh6/QAhZuplWHNn5B
         a0TAakJ84PlQ6ICsYLQ/f8dl8NaNWEA7O3DzpJxbFXYS9IH4aM9SXGX3whZZEap4ifAE
         0CJqH/N+iGTKwgi5ohzPj4bT2vVGcAzQ2SdDiphT4WZvgGqpU1kJgkb1ozNJw4aoSmFG
         dK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727102745; x=1727707545;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3eNNTcdEn/K2P8AHCw9a/zLnrwScnKiMQ6o+kFPfFqg=;
        b=lrz+Li7tBBJ0JzBGeeER/cx4Z9Cd+CREV/BVI5m+JLNMVoLxitwGm949i1d++UejgF
         QYSeq5z0tkbNtPKALRyPcjbygeTuOJ+duWFr1olyPU+1+FAJkqoS7/Hbj4/a7tjeajgX
         hsVOkWpj2/gzckoeHp1dSCWY6x1UPjPRYisTdvW8kqpNRdhU4nGwUrS1i6RRoDpFJWKm
         BrcVZWh3DJhxxE3UU+59K4IArxlUnMz+kyacmCCzSXDQwa+i63m9JdDPczfvWeYljv60
         QlOZpsrB5940ePz8JacUirkxAziF90rBvQKx8HI1AbMWBZbRNLICUaVOT9fkuYGoIw+H
         Bz4A==
X-Forwarded-Encrypted: i=1; AJvYcCVdScPOatjPJ4Z0230huM0esVultSOV8CyTDPRYusnXLQuw7uTwfZHtc3y/c+kBjq8Mp3eh250BvNE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwstmAITnp7A7lzztkbOHdqQC5clGgRXUr3wJHoHBGPi+ECQqM
	sUAvHIkz+Ons0XIwGFB9bh2lg46Qc/S8TLtQLH+dgn3lGB7/2sXWFLjWpg==
X-Google-Smtp-Source: AGHT+IF9+AAueetU0qNka3hsyNEr9cSsHuj9DbOzyFhpnvuAs4x39OlmZcjl8voqaLGc7jHcQ8Y3fA==
X-Received: by 2002:a17:907:7e85:b0:a86:9fac:6939 with SMTP id a640c23a62f3a-a90d3642f54mr1205746166b.30.1727102745030;
        Mon, 23 Sep 2024 07:45:45 -0700 (PDT)
Message-ID: <97d546710c358640a0f39b45f687b34c1a3d2940.camel@gmail.com>
Subject: Re: [PATCH v1 2/2] xen: move per-cpu area management into common
 code
From: oleksii.kurochko@gmail.com
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>,  xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Mon, 23 Sep 2024 16:45:43 +0200
In-Reply-To: <0a6e2cf5-e9f9-4685-880b-0ad5e29c8265@citrix.com>
References: <cover.1726746877.git.oleksii.kurochko@gmail.com>
	 <15b9b94e1acb70ba713391de5bae42a622c29747.1726746877.git.oleksii.kurochko@gmail.com>
	 <a5b7dbdf-886b-45d6-8402-db04c58423e8@xen.org>
	 <0a6e2cf5-e9f9-4685-880b-0ad5e29c8265@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Sun, 2024-09-22 at 10:43 +0200, Andrew Cooper wrote:
> > > diff --git a/xen/common/percpu.c b/xen/common/percpu.c
> > > new file mode 100644
> > > index 0000000000..3837ef5714
> > > --- /dev/null
> > > +++ b/xen/common/percpu.c
> > > @@ -0,0 +1,127 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#include <xen/percpu.h>
> > > +#include <xen/cpu.h>
> > > +#include <xen/init.h>
> > > +#include <xen/mm.h>
> > > +#include <xen/rcupdate.h>
> > > +
> > > +unsigned long __per_cpu_offset[NR_CPUS];
>=20
> unsigned long __per_cpu_offset[NR_CPUS] =3D {
> =C2=A0=C2=A0=C2=A0 [0 ... NR_CPUS - 1] =3D INVALID_PERCPU_AREA,
> };
>=20
> should work, removing the need for percpu_init_areas() and avoids a
> window during boot where all CPUs "share" a percpu area.
If to define in this way, it will compilation error:
   ./arch/x86/include/asm/percpu.h:14:29: error: initializer element is
   not constant
      14 | #define INVALID_PERCPU_AREA (0x8000000000000000UL -
   (unsigned long)__per_cpu_start)

I think it is the reason why separate function was introduced.

~ Oleksii


