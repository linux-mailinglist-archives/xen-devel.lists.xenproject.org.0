Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E64D952F3A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 15:30:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778108.1188158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seaXh-0005tC-RI; Thu, 15 Aug 2024 13:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778108.1188158; Thu, 15 Aug 2024 13:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seaXh-0005ri-OZ; Thu, 15 Aug 2024 13:29:29 +0000
Received: by outflank-mailman (input) for mailman id 778108;
 Thu, 15 Aug 2024 13:29:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQtD=PO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1seaXg-0005rc-0Z
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 13:29:28 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 649e131e-5b0a-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 15:29:26 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f3b8eb3df5so6737841fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 06:29:26 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f3b748dd43sm2129311fa.49.2024.08.15.06.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 06:29:25 -0700 (PDT)
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
X-Inumbo-ID: 649e131e-5b0a-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723728566; x=1724333366; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=39rUEMRstKgiiC8AlPUO2jOdoWsSYSHLR/AbgfCLZqg=;
        b=QRx54s1tw5biF63CMLnCvFzmsX7o3FCbkmR7GSMpOq2ah0W12cyk3paeTXi6TXDhjy
         6Y0I8jKh+SuAfl7nrBYkO6uvnMndOCo2DSlBRKNrRtavehi2FLV+b8CKC8iR7OreSUBk
         y95SgMIHw/hK/r4M5cHnKg0eDpnywkmAwe5mozaqRMHxtNcNbqn6vJoN5mj4K/xw/M+j
         +8kOtzKLIvbv6JDF7iIRvr4saGuxhzcxNm7UakXM/BzUDTp0UXLG2xC0kD0thUd4WyPP
         ZFFfTAQedzE6+SkKf9Bh5QtMHuK/4hUfOoJU2eB2jHlzJoNCw8QbF81E248ZZOFPZRve
         VjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723728566; x=1724333366;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=39rUEMRstKgiiC8AlPUO2jOdoWsSYSHLR/AbgfCLZqg=;
        b=Zd7qneBOOVrNsO8XsELQ+pfOkPixwtcmSkjZrtxzE0vbqur99T8h0rsByQONbvSBi5
         lbyVrN2cz/g26sH3LwXp1T90FqZLUA0mN2fm8Bt/Wcq2h6gec6mtyZ6pTrkhj4giBSEL
         axKboIunUO80h7K5ZUYOWOCaiDuayAkZ94ShLVNCpph9J353sJ4pRlyKJbutVGPeLTpj
         3XG2yoOi3LpLm6m/zJSc6/xGssxnRZa2MUe0ohzh9hWOXwA+2rnpTwuwfBwdKl0DlQXs
         u33ObdB/hDR0DWPwhGxxPTcZIfpJ9zvb9vA5aQFlH7pMB2DRiROZaCMuZvHjCHF895Qd
         qtHg==
X-Forwarded-Encrypted: i=1; AJvYcCWC/OtkkFbFbHfj2hae+Prwdcb0jfn4eivSQju+aZYdw8l9K80NkVtnr/rACkTiYa6pbRTSLy1IIYQvsBwAK3PQwyQghWFWyEEooJp8jsU=
X-Gm-Message-State: AOJu0YzQSt6J3a2TjzppO4bRheNzxtFoAFsBqAQRXnewgUpl0BDd9EwX
	jEwwKAguSwLmWZDCcy7HWYO2mBSD2u8jYVGGoUccCsocDhrNZMy6
X-Google-Smtp-Source: AGHT+IGhiAw2mqEYGQRqpWHxiVmtT9OvjmPpWtRLaV+/LQxzYuZM9V6Sdmz2wAYnZZ52uZNVV5P4nw==
X-Received: by 2002:a2e:4c11:0:b0:2ef:2e6b:4102 with SMTP id 38308e7fff4ca-2f3aa2fcc00mr34889611fa.43.1723728565762;
        Thu, 15 Aug 2024 06:29:25 -0700 (PDT)
Message-ID: <a3c60570bfe4a29e2b3cfa5ab572fb505038a6d3.camel@gmail.com>
Subject: Re: [PATCH v4 4/7] xen/riscv: introduce functionality to work with
 CPU info
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2024 15:29:24 +0200
In-Reply-To: <94a72d20-07c8-4fd6-9759-5bf31d56c860@suse.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
	 <452e2960d1f064a2e3abcaae1ac354f48aafd24c.1723214540.git.oleksii.kurochko@gmail.com>
	 <e0285026-40c5-4316-8129-d07801a9c233@suse.com>
	 <ee3a2e61435e860f1ddb6022fbb712a8d890ae3e.camel@gmail.com>
	 <dfb4678f-0b2d-4d1c-be02-10c4720e57b2@suse.com>
	 <2184097c00f84f707fabadff240f977827a3c927.camel@gmail.com>
	 <94a72d20-07c8-4fd6-9759-5bf31d56c860@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-08-15 at 11:02 +0200, Jan Beulich wrote:
> On 15.08.2024 10:55, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Wed, 2024-08-14 at 17:22 +0200, Jan Beulich wrote:
> > > On 14.08.2024 16:45, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > On Tue, 2024-08-13 at 10:54 +0200, Jan Beulich wrote:
> > > > > On 09.08.2024 18:19, Oleksii Kurochko wrote:
> > > > > > --- /dev/null
> > > > > > +++ b/xen/arch/riscv/smp.c
> > > > > > @@ -0,0 +1,4 @@
> > > > > > +#include <xen/smp.h>
> > > > > > +
> > > > > > +/* tp points to one of these per cpu */
> > > > > > +struct pcpu_info pcpu_info[NR_CPUS];
> > > > >=20
> > > > > And they all need setting up statically? Is there a plan to
> > > > > make
> > > > > this
> > > > > dynamic (which could be recorded in a "fixme" in the
> > > > > comment)?
> > > > I didn't plan to make allocation of this array dynamic. I don't
> > > > expect
> > > > that NR_CPUS will be big.
> > >=20
> > > What is this expectation of yours based on? Other architectures
> > > permit
> > > systems with hundreds or even thousands of CPUs; why would RISC-V
> > > be
> > > different there?
> > Based on available dev boards. ( what isn't really strong argument
> > )
> >=20
> > I checked other architectures and they are using static allocation
> > too:
> > =C2=A0=C2=A0 struct cpuinfo_x86 cpu_data[NR_CPUS];
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 u32 x86_cpu_to_apicid[NR_CPUS] __read_mostly =3D
> > =C2=A0=C2=A0=C2=A0	{ [0 ... NR_CPUS-1] =3D BAD_APICID };
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 ... /* Arm */
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 struct cpuinfo_arm cpu_data[NR_CPUS];
> >=20
> > I wanted to check to understand which one API should be used to
> > allocate this array dynamically. xmalloc?
>=20
> As of a few days ago xvmalloc() (or friends thereof), as long as ...
>=20
> > And I am curious how I can use xmalloc() at this stage if page
> > allocator (?) should be initialized what isn't true now.
>=20
> ... this happens late enough in the boot process. Indeed ...
>=20
> > Or just to allocate pcpu_info only for boot cpu and for other then
> > use
> > xmalloc()?
>=20
> ... statically allocating space for the boot CPU only is another
> option.
>=20
> > > > I can add "fixme" but I am not really
> > > > understand what will be advantages if pcpu_info[] will be
> > > > allocated
> > > > dynamically.
> > >=20
> > > Where possible it's better to avoid static allocations, of which
> > > on
> > > some systems only a very small part may be used. Even if you put
> > > yourself
> > > on the position that many take - memory being cheap - you then
> > > still
> > > waste cache and TLB bandwidth. Furthermore as long as struct
> > > pcpu_info
> > > isn't big enough (and properly aligned) for two successive array
> > > entries
> > > to not share cache lines, you may end up playing cacheline ping-
> > > pong
> > > when a CPU writes to its own array slot.
> > Why the mentioned issues aren't work for dynamic memory? We still
> > allocating memory for sizeof(pcpu_info) * NR_CPUS
>=20
> Why NR_CPUS? At runtime you know how may CPUs the system has you're
> running on. You only need to allocate as much then. Just like e.g.
> dynamically allocated CPU mask variables (cpumask_var_t) deliberately
> use less than NR_CPUS bits unless on really big iron.
I thought that NR_CPUS tells me how many CPU the system has.

The other option is to read that from DTB but then pcpu_info[] can be
allocated only after DTB will be mapped.

~ Oleksii

>=20
> > and when this
> > allocated memory access it will go to cache, CPU/MMU still will use
> > TLB
> > for address translation for this region and without a proper
> > alignment
> > of pcpu_info size it still could be an issue with cache line
> > sharing.
> >=20
> > ~ Oleksii
> >=20
>=20


