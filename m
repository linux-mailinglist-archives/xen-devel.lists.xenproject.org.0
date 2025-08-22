Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E44FB32545
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 01:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090616.1447760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upaqN-00082h-DA; Fri, 22 Aug 2025 23:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090616.1447760; Fri, 22 Aug 2025 23:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upaqN-00080X-8A; Fri, 22 Aug 2025 23:06:47 +0000
Received: by outflank-mailman (input) for mailman id 1090616;
 Fri, 22 Aug 2025 23:06:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b3U+=3C=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1upaqM-00080R-2x
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 23:06:46 +0000
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab42d0d1-7fac-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 01:06:44 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1755903999077818.1726663685837;
 Fri, 22 Aug 2025 16:06:39 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-436011e8ed1so1115657b6e.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Aug 2025 16:06:38 -0700 (PDT)
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
X-Inumbo-ID: ab42d0d1-7fac-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; t=1755904000; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ixnjS06Bxtu1OpGBeCRjCJnIbAyS3aOCnYITgHjZe4Fcj4R0XN4x1nU2wJfu6GwbNZO795Yj72ZEt0gP+Hjgx/FVY3Am5xJQyDz7a9GHMgrbJsUxuEaevyeaN27c2LoqX/iuCCYoT2b1QzVued0S8CMrJp1PTaoZ2o+Xy7XiMhA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755904000; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=J2Ji5lGRAzUoK2OAwuMMtI9KxXLcyZx4cb8Jjcb3MhM=; 
	b=SUDyaoWPVISwtTP8p2Kaa9RZFu33oTZoesMa6PrSdd4dyF+zJIAjy2pPCNdBgHEXU2kkrkq5MCF164xJGP/Z/6Z1nFemRhfByvLssfRz6IDZ+UsDcVEtOhkifkahsAH00C4Fay7DhUF0JcLOA3KmWgL+unLpLAF5WJXvyRu3jPg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755904000;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=J2Ji5lGRAzUoK2OAwuMMtI9KxXLcyZx4cb8Jjcb3MhM=;
	b=fGXt8+d7FOENb8qj6HCQCoIysUXxSJBzWJ0AYCc8BmciqoRSZy/cPeNB5DYzL6Pb
	bFxaLyCZo1c7hMO751urDgOxTdbzvgpXaKiOY6/LyVqdAlKOi7hmjuQswT9SsefKZtP
	Po8EdmXMf5sIM+hSVRT3RlFqmyZXSyyG3CXDzGdk=
X-Gm-Message-State: AOJu0Ywgvm2p7NMW1HH2m3iL0DGbdW+lZ2EQehb7XqJCjnfeuFs8UWgS
	i4hgG7SwGhDxDFAeDscab3nrEIpaf3hloKDhX3eQuD/WWH+7XacnS9bt36H0dOEgeBH6wWKDUin
	hc+vWToqtzhuaouQ03FaU5V+LG1Orrn4=
X-Google-Smtp-Source: AGHT+IHvxb8IZ7sYFMcAm514eZl48NwfjJ2u4rlXwVl8AedzaliXlDWyTAlrhTttScPTi/285qa1YyrZSu7wBZh4gtU=
X-Received: by 2002:a05:6808:17a7:b0:435:6c2e:15fa with SMTP id
 5614622812f47-4378518e0e9mr2696062b6e.1.1755903998343; Fri, 22 Aug 2025
 16:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753953832.git.w1benny@gmail.com> <d8ce4bd614e240aebc2dd09930af0c2c474acf50.1753953832.git.w1benny@gmail.com>
In-Reply-To: <d8ce4bd614e240aebc2dd09930af0c2c474acf50.1753953832.git.w1benny@gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 22 Aug 2025 19:06:02 -0400
X-Gmail-Original-Message-ID: <CABfawhmyuwZp63EC5z-2a76BL7hvKr2bJre=gGJPe_271v=Eyw@mail.gmail.com>
X-Gm-Features: Ac12FXziltVR79H5cNo7GiR3JiZn0irfcFaFALk02AJk9hbTgt6-hGUmhAPxgIw
Message-ID: <CABfawhmyuwZp63EC5z-2a76BL7hvKr2bJre=gGJPe_271v=Eyw@mail.gmail.com>
Subject: Re: [PATCH v12 3/6] xen: Make the maximum number of altp2m views
 configurable for x86
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 5:28=E2=80=AFAM Petr Bene=C5=A1 <w1benny@gmail.com>=
 wrote:
>
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> This commit introduces the ability to configure the maximum number of alt=
p2m
> views for the domain during its creation. Previously, the limits were har=
dcoded
> to a maximum of 10. This change allows for greater flexibility in environ=
ments
> that require more or fewer altp2m views.
>
> The maximum configurable limit for nr_altp2m on x86 is now set to
> MAX_NR_ALTP2M (which currently holds the MAX_EPTP value - 512). This cap =
is
> linked to the architectural limit of the EPTP-switching VMFUNC, which sup=
ports
> up to 512 entries. Despite there being no inherent need for limiting nr_a=
ltp2m
> in scenarios not utilizing VMFUNC, decoupling these components would nece=
ssitate
> substantial code changes.
>
> xen_domctl_createdomain::altp2m is extended for a new field `nr`, that wi=
ll
> configure this limit for a domain. Additionally, previous altp2m.opts val=
ue
> has been reduced from uint32_t to uint16_t so that both of these fields o=
ccupy
> as little space as possible.
>
> Accesses to the altp2m_p2m array are modified to respect the new nr_altp2=
m
> value. Accesses to the altp2m_(visible_)eptp arrays are unmodified, since
> these arrays always have fixed size of MAX_EPTP.
>
> Additional sanitization is introduced in the x86/arch_sanitise_domain_con=
fig
> to fix the altp2m.nr value to 10 if it is previously set to 0. This behav=
ior
> is only temporary and immediately removed in the upcoming commit (which w=
ill
> disallow creating a domain with enabled altp2m with zero nr_altp2m).
>
> The reason for this temporary workaround is to retain the legacy behavior
> until the feature is fully activated in libxl.
>
> Also, arm/arch_sanitise_domain_config is extended to not allow requesting
> non-zero altp2ms.
>
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

For mem_access/mem_sharing bits:
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

