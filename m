Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328E0A2383B
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 01:28:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879796.1289998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdesQ-0006An-B3; Fri, 31 Jan 2025 00:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879796.1289998; Fri, 31 Jan 2025 00:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdesQ-00068Y-88; Fri, 31 Jan 2025 00:27:18 +0000
Received: by outflank-mailman (input) for mailman id 879796;
 Fri, 31 Jan 2025 00:27:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyPN=UX=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1tdesO-00068Q-LR
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 00:27:16 +0000
Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com
 [136.143.184.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d40b42d-df6a-11ef-a0e6-8be0dac302b0;
 Fri, 31 Jan 2025 01:27:13 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1738283224179155.63362297888295;
 Thu, 30 Jan 2025 16:27:04 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6efe4324f96so4503067b3.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 16:27:04 -0800 (PST)
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
X-Inumbo-ID: 1d40b42d-df6a-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1738283228; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TTdMD/kIzhNy6AKIEDWq8wa1PElp9X7OWA80Y4xQY1/B559E58YkquDlNMbGM4+3pARRkmmgaHbQyJpT03BjGfibSfKLpTDCOi7GWIL9CS8rS37ghQvr8E/11+SDA5RqExiLKMb81XySMKON5vxJHxYL+mygemsk6wEtyCsFDBk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738283228; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5FamLrRiItq5K95TJ90P8rmA78dEGWW0HVOj4wgqlmw=; 
	b=lGKQCRvvoet3ua1uzg6QV0H67ZI7YF9majuH4zyiVkg0eXPwNgrmov0Ppgt+dhM8bfmubngLzhj3hGnCQ0htAuG7AEJ+LoArU5vP30ygbQkURI/SGMlkNwu+WXRiv7RSwlz4fK3cL9es65fikzxB6qM/38/2ffJcBzbCZLTkN2I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738283228;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5FamLrRiItq5K95TJ90P8rmA78dEGWW0HVOj4wgqlmw=;
	b=NdVD+ALnKZtsd5dk6DZmzsnpW+26HoqAuI8s7cYskN302sauhkMkCMky9khs9xSk
	N/tIHgFlDBKwlzIUrJ08V68P0vYe5xFaKFjcfHO3ZTA8gh9/8UJhuJ98PkxL6FNXmsp
	7XNeC2kvcknfhH55Mu/Arb7y0jB7KkVqvx8xef64=
X-Forwarded-Encrypted: i=1; AJvYcCVoB/seDfHjqZjKv3Gw6rLuV2YrSxIuoB/3D1mK10NnuJuCdHEVlajaNPxFVaFhq0yBfg7B1mjKar8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHsLCXuVJW3WPTYWfyrc5HVNO7lPQo7+9NUvzLRG8wrF1u/Rxc
	FL299FPS5bhuOXNP8wDAPRVSYnYpHK6GlmEa13EaWErBuOC+gaUed7i0jf5DiwT0ritMI7Ow60Y
	zp+Go07q05lKu0mBFEZ203H2+sjk=
X-Google-Smtp-Source: AGHT+IFnvH3XL+lXqbE5VDGJ9t+h6u81NVebRWM8gaNZvzYlC9jFDJ/U+AHvyZmssNw3fSz6dENk2Fy3z2Z9G4S4Bqg=
X-Received: by 2002:a05:690c:360e:b0:6e5:9cb7:853c with SMTP id
 00721157ae682-6f7a8423317mr83440477b3.31.1738283223389; Thu, 30 Jan 2025
 16:27:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com> <ff22f35dafd04b16165e1caec038e5a5fcf2aeee.1737452864.git.Sergiy_Kibrik@epam.com>
 <c74d334e-6e33-4a58-bf94-936249244cb0@suse.com>
In-Reply-To: <c74d334e-6e33-4a58-bf94-936249244cb0@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 30 Jan 2025 19:26:27 -0500
X-Gmail-Original-Message-ID: <CABfawhm8Cb3xz8Fv=YhA1TSKtvA3ThWHMcqJCFDarwSuYKQ5ZA@mail.gmail.com>
X-Gm-Features: AWEUYZno4HdvG_T6sY44FsuyluQ9JfFu3x1waZbMD0R8Cwc37Uosd31qTc-SSh0
Message-ID: <CABfawhm8Cb3xz8Fv=YhA1TSKtvA3ThWHMcqJCFDarwSuYKQ5ZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] xen: kconfig: rename MEM_ACCESS -> VM_EVENT
To: Jan Beulich <jbeulich@suse.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 8:24=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 21.01.2025 11:19, Sergiy Kibrik wrote:
> > Use more generic CONFIG_VM_EVENT name throughout Xen code instead of
> > CONFIG_MEM_ACCESS. This reflects the fact that vm_event is a higher lev=
el
> > feature, with mem_access & monitor depending on it.
> >
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
>
> I don't think this is applicable; my suggestion went in a different direc=
tion.
>
> > Suggested-by: Tamas K Lengyel <tamas@tklengyel.com>
> > Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>
> Before considering to ack this, I'd like you, Tamas, to confirm this is r=
eally
> what you had thought of. In particular ...
>
> > --- a/xen/arch/arm/Makefile
> > +++ b/xen/arch/arm/Makefile
> > @@ -37,7 +37,7 @@ obj-y +=3D irq.o
> >  obj-y +=3D kernel.init.o
> >  obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o
> >  obj-$(CONFIG_LLC_COLORING) +=3D llc-coloring.o
> > -obj-$(CONFIG_MEM_ACCESS) +=3D mem_access.o
> > +obj-$(CONFIG_VM_EVENT) +=3D mem_access.o
>
> ... changes like this one look somewhat odd to me.
>
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -92,7 +92,7 @@ config HAS_VMAP
> >  config MEM_ACCESS_ALWAYS_ON
> >       bool
> >
> > -config MEM_ACCESS
> > +config VM_EVENT
> >       def_bool MEM_ACCESS_ALWAYS_ON
> >       prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
> >       depends on HVM
>
> What about MEM_ACCESS_ALWAYS_ON (visible in patch context)? Shouldn't tha=
t
> become VM_EVENT_ALWAYS_ON then, too?
>
> Further, what about MEM_PAGING and MEM_SHARING? Shouldn't those, at least
> documentation purposes, then also gain a dependency on VM_EVENT?

MEM_PAGING, yes. MEM_SHARING, definitely not. MEM_SHARING is perfectly
functional without vm_event.

Tamas

