Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91054A02773
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 15:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865733.1276999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUnka-0000v9-Rl; Mon, 06 Jan 2025 14:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865733.1276999; Mon, 06 Jan 2025 14:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUnka-0000t5-PA; Mon, 06 Jan 2025 14:06:36 +0000
Received: by outflank-mailman (input) for mailman id 865733;
 Mon, 06 Jan 2025 14:06:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EjtY=T6=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1tUnka-0000sz-0e
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 14:06:36 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e6dd7d4-cc37-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 15:06:33 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1736172385275416.690204826991;
 Mon, 6 Jan 2025 06:06:25 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e4930eca0d4so18545385276.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 06:06:25 -0800 (PST)
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
X-Inumbo-ID: 6e6dd7d4-cc37-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1736172387; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YPkFt/7PDx3cqA4v6bHgb/pfnBK29wGdQ8d2Jf+8dGpRZbW4HlT6Eo0f6Sl/dvasQ3pRp3xZvuhzG+Z6M0XtDQvGo8sFqjI9nE8JoKmmwHfvncxINNYEmSy+z9nd/NDgwT3a+fQKzcNyaYVWt6hrVQHPKZXvPl+VDjvummWs6bw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736172387; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iOAJ9XTmoSmFUoSI3CJNLNTF1VjywRN9i2HM85jxsQ0=; 
	b=kZJZVHkhAa/pmld1O/fPEMvTuhXGEdyA6JXhoxC7sFiS1TBdoxO3DqO9XzTAPI7us3F0NZIv53eZz4hHA+A4O+dIcLSIKMXxzFb7pf2ZXxr9Vik2cmBDQABfTNbziOB0jNCQxX67nQjG9UdR1Pgp4wFCmTibqxrAzyN1GItrSxM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736172387;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=iOAJ9XTmoSmFUoSI3CJNLNTF1VjywRN9i2HM85jxsQ0=;
	b=LzCUN/piEX1bErvaSVo8jTUtLWbg4/NKLxp/RIHz8AL30IV/og/ZA+IFlv6pqlFX
	rxUIYNUa5Qnry0h3spZEbEhPcgVOmxMQRut+gNuMUJw1Lr0Ztl+7HOoe/nyr7R08Tgk
	Wbn1hLuiFWk2qKoGrAPhTwE2EHpjVgwHivkCGHYc=
X-Forwarded-Encrypted: i=1; AJvYcCWLf4mnSFSxxu2PTv6NAUnoOwzykxDWEYmCmDKvCf9Vkos/d5emO5HZ+gGVcMuq/gpXIw2YBJ2FFp0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbAGL7Q1qNV2bxrUlqfvAPNtVVudqp0d2F8X62Zweaoh1amnMZ
	Flao+bZWJtcfZLjBs1Lk965odTy05X46S7nkkfftbeFck/G7CB7dI1wiIFtUsEXimQ1iIMlCRwG
	xxzlZhiULcZ0qS0Fr0fT2SpnGa1o=
X-Google-Smtp-Source: AGHT+IGpf7wXqQirs9MgAr3vMUBOYkIAUr4WCy9X5GIzDUHEHtiMQqtoKkdocTJSY6GinKpHtMW9ChFEW8GTJ2gAKBI=
X-Received: by 2002:a05:690c:680b:b0:6ee:5cf9:f898 with SMTP id
 00721157ae682-6f3f820bb3dmr391218307b3.33.1736172384437; Mon, 06 Jan 2025
 06:06:24 -0800 (PST)
MIME-Version: 1.0
References: <20241230063051.3332332-1-Sergiy_Kibrik@epam.com> <c8684340-33f9-41d3-94e4-77ee3bc18306@suse.com>
In-Reply-To: <c8684340-33f9-41d3-94e4-77ee3bc18306@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 6 Jan 2025 09:05:48 -0500
X-Gmail-Original-Message-ID: <CABfawhk4pzA9bSMzJDX7ZwaYC50dfn_ntCnk=bePmiKCpDnN3w@mail.gmail.com>
Message-ID: <CABfawhk4pzA9bSMzJDX7ZwaYC50dfn_ntCnk=bePmiKCpDnN3w@mail.gmail.com>
Subject: Re: [XEN PATCH v1] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
To: Jan Beulich <jbeulich@suse.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Stefano Stabellini <stefano.stabellini@amd.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 5:16=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 30.12.2024 07:30, Sergiy Kibrik wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> >
> > Extend coverage of CONFIG_MEM_ACCESS option and make the build of VM ev=
ents
> > and monitoring support optional.
>
> Yet doesn't this end up in things becoming misleading? Don't we rather ne=
ed a
> 2nd Kconfig option, with a dependency between the two? Or alternatively a
> rename of the existing option (to describe the higher-level feature rathe=
r
> than the lower level one)? Tamas, I'm particularly interested in knowing =
your
> view here as well.

Thanks Jan, I was thinking the same thing. The dependency of these
subsystems is mem_access -> monitor -> vm_event. If the goal here is
to disable all three levels the ideal way would be to have separate
kconfig options for each level. It may be a bit too fine-grained
though on ARM since there are only two types of events for monitor
(SMC & mem_access) and only the monitor uses the vm_event channel (no
mem-sharing/paging on ARM). So if doing separate kconfig for each
individual feature is an overkill I would suggest using
CONFIG_VM_EVENT that disables all three levels, including both
mem_access & smc monitor hooks.

Tamas

