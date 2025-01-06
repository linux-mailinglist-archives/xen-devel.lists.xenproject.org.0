Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D3A02F85
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 19:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865872.1277148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUrYY-00054d-10; Mon, 06 Jan 2025 18:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865872.1277148; Mon, 06 Jan 2025 18:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUrYX-000539-US; Mon, 06 Jan 2025 18:10:25 +0000
Received: by outflank-mailman (input) for mailman id 865872;
 Mon, 06 Jan 2025 18:10:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EjtY=T6=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1tUrYW-00052z-BP
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 18:10:24 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ca00015-cc59-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 19:10:20 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1736187015314858.5463644416154;
 Mon, 6 Jan 2025 10:10:15 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e3983426f80so20202503276.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 10:10:15 -0800 (PST)
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
X-Inumbo-ID: 7ca00015-cc59-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1736187016; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nKHh58UsdU5y3OU/9vi0k5sxiTChv/mU4KV/Emh13jiaaTA7bGT8YuA+oEcaMBvWGHudLYPc+f5LdS3brCAeX7xMN2+XhaRBLQog9doY0xdNf81wLa0CncihM0a/ZXcfANuMhTCvmsK9SEBGUxIqjhjKAGoHn4IysCq+gW+7WO0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736187016; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jpeCgrGjWlU8QiIed+qj0vczdYbXeFagU1jWDbDt79c=; 
	b=Mf05+dj5Ev4YShYAR/qui1hVVt80++0sCTAEYVxVSqB4eyh7FIwV3qOPXwu3DrsHQjTRbwYi18Mz5eeng7a9tGpt0Jx8ZlwE1RZFmzc4abFnvpHlDPFa8LwfPQ/uLqIaFxTDXKg+vkFCVYMfKj5l/hrphWeg7hnihDI5mDghy80=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736187016;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jpeCgrGjWlU8QiIed+qj0vczdYbXeFagU1jWDbDt79c=;
	b=SrQKs8lpgEyRiEjcxhXygYCOx2ZBkOH4jbra8vMBWR5YQ65neRyHCsBW718TMw8s
	Atg+n6rofvt+QgiqbmvcE63Yu+xHGxuovzRIywSfvdqIOAGNjzZm4jc+9oOL5+/r2Cz
	z7sefYcgitnmaMt55ZMhp8N0Fgy9F7INdE73Gm7w=
X-Forwarded-Encrypted: i=1; AJvYcCWHf7r1by6roU/sutrYluXEvcWQVUx2gQMQiWl77g8C3ilRGqB13JTTiVBs0PfFz/EwbbTJF9t+bHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsE9aD+zJWzw726bitHV3LnuzJcaaEeG4YIWF8MX9Rm5P4hBkF
	2nWNZXVsOKNy685ob+wXZ5cEsjjhnfULzhniggt093NvDM5p1kj/hlK8uj3Ka+5WqD6H9d33YmG
	kC1vRAQgcCR9cdNHG7U4LcXUSQ0k=
X-Google-Smtp-Source: AGHT+IFZOhuMxsQs3gfXimRXJ/LFsbQ6jkv+p4pvlLrFDS3kWWkQyU1TJy6cueJ6/k68uQrveewv/Q53eERsXMabtb0=
X-Received: by 2002:a05:690c:6408:b0:6ef:4fba:8142 with SMTP id
 00721157ae682-6f3f80d7ff6mr426640677b3.6.1736187014508; Mon, 06 Jan 2025
 10:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20241230063051.3332332-1-Sergiy_Kibrik@epam.com>
 <c8684340-33f9-41d3-94e4-77ee3bc18306@suse.com> <CABfawhk4pzA9bSMzJDX7ZwaYC50dfn_ntCnk=bePmiKCpDnN3w@mail.gmail.com>
 <8fc662a1-4c74-4f97-a116-3bc5a0b71cf1@suse.com>
In-Reply-To: <8fc662a1-4c74-4f97-a116-3bc5a0b71cf1@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 6 Jan 2025 13:09:38 -0500
X-Gmail-Original-Message-ID: <CABfawhkyg+TVB-uc04OefDhOXEfeQyQypW6gL4qsYO3ZrDxYfQ@mail.gmail.com>
Message-ID: <CABfawhkyg+TVB-uc04OefDhOXEfeQyQypW6gL4qsYO3ZrDxYfQ@mail.gmail.com>
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

On Mon, Jan 6, 2025 at 10:10=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 06.01.2025 15:05, Tamas K Lengyel wrote:
> > On Mon, Jan 6, 2025 at 5:16=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 30.12.2024 07:30, Sergiy Kibrik wrote:
> >>> From: Stefano Stabellini <stefano.stabellini@amd.com>
> >>>
> >>> Extend coverage of CONFIG_MEM_ACCESS option and make the build of VM =
events
> >>> and monitoring support optional.
> >>
> >> Yet doesn't this end up in things becoming misleading? Don't we rather=
 need a
> >> 2nd Kconfig option, with a dependency between the two? Or alternativel=
y a
> >> rename of the existing option (to describe the higher-level feature ra=
ther
> >> than the lower level one)? Tamas, I'm particularly interested in knowi=
ng your
> >> view here as well.
> >
> > Thanks Jan, I was thinking the same thing. The dependency of these
> > subsystems is mem_access -> monitor -> vm_event. If the goal here is
> > to disable all three levels the ideal way would be to have separate
> > kconfig options for each level. It may be a bit too fine-grained
> > though on ARM since there are only two types of events for monitor
> > (SMC & mem_access) and only the monitor uses the vm_event channel (no
> > mem-sharing/paging on ARM). So if doing separate kconfig for each
> > individual feature is an overkill I would suggest using
> > CONFIG_VM_EVENT that disables all three levels, including both
> > mem_access & smc monitor hooks.
>
> Except that "disables all three levels" doesn't work, unless the other
> option(s) are promptless (and selected). I'd have expected VM_EVENT to
> maybe have a "depends on MEM_ACCESS", whereas a "select MEM_ACCESS"
> wouldn't make much sense as long as MEM_ACCESS can be enabled
> individually (with it being unclear to me whether such a configuration
> is actually useful in any way).

Not sure I follow. None of these systems make sense to enable
individually. Without vm_event monitor/mem_access are useless, that's
why I would pick CONFIG_VM_EVENT as the option on ARM to disable all
three levels if we don't want to start splitting it into multiple
kconfig options (which I think may be an overkill here).

Tamas

