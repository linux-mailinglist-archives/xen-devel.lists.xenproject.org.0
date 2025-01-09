Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A647A07BDF
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:26:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868792.1280293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuQI-0003D2-Nr; Thu, 09 Jan 2025 15:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868792.1280293; Thu, 09 Jan 2025 15:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuQI-0003An-LE; Thu, 09 Jan 2025 15:26:14 +0000
Received: by outflank-mailman (input) for mailman id 868792;
 Thu, 09 Jan 2025 15:26:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zyMf=UB=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1tVuQH-0003Ah-3Z
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:26:13 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c73b30a-ce9e-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 16:26:09 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1736436364776946.4546907594349;
 Thu, 9 Jan 2025 07:26:04 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e39779a268bso1553909276.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:26:04 -0800 (PST)
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
X-Inumbo-ID: 0c73b30a-ce9e-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1736436365; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E85Jrv86Y5aK+SD6b0tynCZisfGnGGI3bbdN4wTNDsTHdtopoqCnPBFoxM3/8a9h/FByDzySw26fqH3TZ1XY6RqIcHMVW2a3ctxUQ+9oi2g7KQCJidqW79wPMVhxpQmTDMHW0lgfh1/7x6fREm8F1C2g70nk2JZ+grxmlTKp4vQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736436365; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v9IpNl2iNQqt9WSyxFheSewMy8n03I5CieRpdGYFo6w=; 
	b=eBQtf+7JaKoEzrMcoAwNhIAGdxLARvkNpDOkc6t2iDGpRxJs6ZffKh9qIydvVhM+OJT+M0VLtUa0RboF14pBVg+QuIL780GtiX2399lMVacxKd9wqo8XgWetn1hmoyIjdLzbm6bo4YOA06JDvptqpwXvu76s+IAUp2WkcAlHFBI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736436365;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=v9IpNl2iNQqt9WSyxFheSewMy8n03I5CieRpdGYFo6w=;
	b=BiaTyODOueHyV35V79fmPKBGFUq/2EcmbmvQknIpafvhLivZt/DIivttRcJ5CA6Y
	IUM1qFmYHlKqwpjwVE25hgO0FSH1WBCfjTdMyNZNu4foNxz68yS2j9PkREkj7M4gVtx
	JJ36BJmGMMk6x0JjCxx3fGQCKoSrbqzCrYR+j+vI=
X-Forwarded-Encrypted: i=1; AJvYcCVFlxQri3y5TV8KM9FdA7sTX2pvXrepwotd6eHB1ueIjI1CIWap7uvhPipEFV6B6fFFSN+Xz0k7TyQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAGOy5Cm41TtWx48HvoTsb0/LhSc6wLHueG70yNN7THVcZPWHk
	lepk5QOe9/o7fGNIbo6stYWGMK59IonGbN22Dc5y16p6jiWfs6nwk9RWkkCjt3bgsnffJCmaXCN
	S23q7Bg7NDrvYMmUQpg9PMIHlqPg=
X-Google-Smtp-Source: AGHT+IGj1vTgkF+qZ3275XwZQgoP4KlB4h4vgcoHtaVtlPsaWc38lsYRzTcHjwRXn/tIqOnyxI5wo9Wf5Ha7lKGhZGI=
X-Received: by 2002:a05:6902:2708:b0:e54:d63a:911c with SMTP id
 3f1490d57ef6-e550141e9c2mr2733502276.10.1736436363826; Thu, 09 Jan 2025
 07:26:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1735837806.git.w1benny@gmail.com> <4eea61a2-cf56-4ff5-8c43-58f5a20c9cb1@gmail.com>
In-Reply-To: <4eea61a2-cf56-4ff5-8c43-58f5a20c9cb1@gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 9 Jan 2025 10:25:27 -0500
X-Gmail-Original-Message-ID: <CABfawhmHK_Lg8GuVr9yb1gw82YFs3e1gh76azzH8C98R552dSw@mail.gmail.com>
X-Gm-Features: AbW1kvbgU3QB5zRBc0i5XyoixetpS80JU6YW75tixuOlVts_yNiubtZG6tTwjnc
Message-ID: <CABfawhmHK_Lg8GuVr9yb1gw82YFs3e1gh76azzH8C98R552dSw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] x86: Add Support for Paging-Write Feature
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>, 
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 9:30=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
>
> On 1/2/25 6:13 PM, Petr Bene=C5=A1 wrote:
>
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> Changes since v2:
> - Reset entry->pw in all cases in p2m_set_entry, except for p2m_access_r_=
pw
>
> Changes since v1:
> - Added signed-off-by tags
>
> This patch introduces a new XENMEM_access_r_pw permission. Functionally, =
it is similar to XENMEM_access_r, but for processors with TERTIARY_EXEC_EPT=
_PAGING_WRITE support (Intel 12th Gen/Alder Lake and later), it also permit=
s the CPU to write to the page during guest page-table walks (e.g., updatin=
g A/D bits) without triggering an EPT violation.
>
> This behavior works by both enabling the EPT paging-write feature and set=
ting the EPT paging-write flag in the EPT leaf entry.
>
> This feature provides a significant performance boost for introspection t=
ools that monitor guest page-table updates. Previously, every page-table mo=
dification by the guest=E2=80=94including routine updates like setting A/D =
bits=E2=80=94triggered an EPT violation, adding unnecessary overhead. The n=
ew XENMEM_access_r_pw permission allows these "uninteresting" updates to oc=
cur without EPT violations, improving efficiency.
>
> Considering that this feature provides a significant performance boost fo=
r introspection tools probably we could consider to take it to current rele=
ase.
>
> I see that the patch series was acked-by "Acked-by: Tamas K Lengyel <tama=
s@tklengyel.com>" but based on the change log it is not clear when exactly
>
> before Feature freeze date or not. ( and I don't see any reply from Tamas=
 ).

I've acked the patch Thu, Dec 19, 2024.

Cheers,
Tamas

