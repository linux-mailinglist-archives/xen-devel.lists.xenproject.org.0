Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E4A97E899
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 11:27:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801758.1211754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfLJ-0004D1-8w; Mon, 23 Sep 2024 09:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801758.1211754; Mon, 23 Sep 2024 09:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfLJ-0004BP-5y; Mon, 23 Sep 2024 09:26:53 +0000
Received: by outflank-mailman (input) for mailman id 801758;
 Mon, 23 Sep 2024 09:26:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81ci=QV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ssfLI-0004BJ-Du
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 09:26:52 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f66c5c31-798d-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 11:26:50 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso565768466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 02:26:50 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3a25sm1180820866b.111.2024.09.23.02.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 02:26:49 -0700 (PDT)
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
X-Inumbo-ID: f66c5c31-798d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727083610; x=1727688410; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vcqces8kMmLdKAjNB2HiaeJjQDH8S7y6rmIAgqohgnM=;
        b=Auw61mXWOGNQZuZjyrAbz+4tm9FmGwUUGkSWBn7zgDvIYiWMW6xQDt8x5xjVWdrmAQ
         jBlJPjMzjuPUYOE1u5vwjhAPIyhyRkvt3uhR2yP+TZxsBjAdmwcF6RMGQ2lfqNgR3BQb
         d1FdGCkO5WoWE93ZDJfdijg9QqkcO0/zUbbdwxF9F8qXMLqZNRSOrv/8Zbnk+JpewnTb
         7+oHuDlbnd3F3DykZL7sZmfGAeJOUTMrTF9oz2oNiGO4DLIJEwKK61fQRj2jbIiA7GSZ
         GflDd/PDOTyilIFmrrcNAPfK2cuiascjSNqKxTMVCICImYdnmY3QtXee/h6/B2Rv1GPs
         DzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727083610; x=1727688410;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vcqces8kMmLdKAjNB2HiaeJjQDH8S7y6rmIAgqohgnM=;
        b=S+svOBk8W0i0s5gyi4nIRNiz0wvUQ94pH2bKtD5s1mKV6EZ8z3kea6iqH9nTLB2xQA
         5LjkVYsCOTsLp/RxgRHkHqShlcMaojUr7tzG9PBDqlCut8DsBYFweAROsylzcQ7dSou1
         AZo9Hd3JQr/v+TJkszedyFcsn7H8gUxrH2C1zWkNtYHYQAIrA6/axtX+RyAWS6l3A3J6
         8Lx6cP/NidxAUYA6K7U235y6Y6fKDjsIJvnMpaoiDsXTQyUK/XqsaGxIFEYxfW6KXl03
         1QVu31FVYnvraNxyMkJGzAcox8fjxaqGQdR9TUvnhSIvk/pDcY8baMJ4Bk7gKf9bSm7A
         UlyA==
X-Forwarded-Encrypted: i=1; AJvYcCWbTWv5AuqyS0rqbJb8qxmKrxCd8FZq7Goz8bOmAhZbBnnG61UeOxX+jlgltbjHk3LXl47nL5lIm6I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvpDF9PfPZ6rz2qyuJXyOmuWz1adzO57QIAvVRgmgdS4d56xeS
	++mrPu2kVYcFEsw0T8SjF4OPW098aXV1gvZ0xdZBBpmVhnOOoY7s
X-Google-Smtp-Source: AGHT+IHxAUgZUAH4V0UP1NJ7eN5um0i2HdJoHkQr5cOpjWNVDe9LLBlRXvm4ZeCyP6RArE0PjpBOpg==
X-Received: by 2002:a17:907:f74e:b0:a86:9c41:cfc1 with SMTP id a640c23a62f3a-a90d4fe01e1mr1064685466b.8.1727083609602;
        Mon, 23 Sep 2024 02:26:49 -0700 (PDT)
Message-ID: <a9a85484d05f7e2099a42e5007384aa85b705ea1.camel@gmail.com>
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
Date: Mon, 23 Sep 2024 11:26:48 +0200
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
> On 22/09/2024 10:23 am, Julien Grall wrote:
> > On 19/09/2024 17:59, Oleksii Kurochko wrote:
> > > diff --git a/xen/arch/x86/percpu.c b/xen/arch/x86/percpu.c
> > > index 3205eacea6..33bded8cac 100644
> > > --- a/xen/arch/x86/percpu.c
> > > +++ b/xen/arch/x86/percpu.c
> > > @@ -1,79 +1,19 @@
> > > -#include <xen/percpu.h>
> > > =C2=A0 #include <xen/cpu.h>
> > > -#include <xen/init.h>
> > > -#include <xen/mm.h>
> > > -#include <xen/rcupdate.h>
> > > -
> > > -unsigned long __per_cpu_offset[NR_CPUS];
> > > -
> > > -/*
> > > - * Force uses of per_cpu() with an invalid area to attempt to
> > > access
> > > the
> > > - * middle of the non-canonical address space resulting in a #GP,
> > > rather than a
> > > - * possible #PF at (NULL + a little) which has security
> > > implications
> > > in the
> > > - * context of PV guests.
> > > - */
> > > -#define INVALID_PERCPU_AREA (0x8000000000000000UL - (unsigned
> > > long)__per_cpu_start)
> > > -#define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end -
> > > __per_cpu_start)
> > > -
> > > -void __init percpu_init_areas(void)
> > > -{
> > > -=C2=A0=C2=A0=C2=A0 unsigned int cpu;
> > > -
> > > -=C2=A0=C2=A0=C2=A0 for ( cpu =3D 1; cpu < NR_CPUS; cpu++ )
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __per_cpu_offset[cpu] =3D=
 INVALID_PERCPU_AREA;
> > > -}
> > > +#include <xen/percpu.h>
> > > +#include <xen/smp.h>
> > > =C2=A0 -static int init_percpu_area(unsigned int cpu)
> > > +int arch_percpu_area_init_status(void)
> >=20
> > I understand that Arm and x86 are returning a different value
> > today.
> > But now that we are provising a common implementation, I think we
> > need
> > to explain the difference. This is probably a question for the x86
> > folks.
>=20
> The declarations for CPU Parking (variable, or compile time false)
> wants
> to be in the new common header, at which point
> arch_percpu_area_init_status() doesn't need to exist.
>=20
> That also makes it very clear that there's a difference in return
> value
> based on CPU Parking (and the comment beside the variable explains
> this
> is about not quite offlining CPUs), which is far clearer than some
> arch
> function.
Thanks for suggestion. It would be better, I had also concerns about
arch_percpu_area_init_status but couldn't come up with better thing.

Just to make sure I understand correctly=E2=80=94are you saying that I can =
use
park_offline_cpus instead of arch_percpu_area_init_status()?
   diff --git a/xen/common/percpu.c b/xen/common/percpu.c
   index 3837ef5714..f997418586 100644
   --- a/xen/common/percpu.c
   +++ b/xen/common/percpu.c
   @@ -51,7 +51,7 @@ static int init_percpu_area(unsigned int cpu)
        char *p;
   =20
        if ( __per_cpu_offset[cpu] !=3D INVALID_PERCPU_AREA )
   -        return arch_percpu_area_init_status();
   +        return park_offline_cpus ? 0 : -EBUSY;
   =20
        if ( (p =3D alloc_xenheap_pages(PERCPU_ORDER, 0)) =3D=3D NULL )
            return -ENOMEM;

~ Oleksii


