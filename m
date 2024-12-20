Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E387C9F892F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 02:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861574.1273540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tORV4-00020z-NA; Fri, 20 Dec 2024 01:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861574.1273540; Fri, 20 Dec 2024 01:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tORV4-0001y4-Jc; Fri, 20 Dec 2024 01:08:18 +0000
Received: by outflank-mailman (input) for mailman id 861574;
 Fri, 20 Dec 2024 01:08:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42Wo=TN=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1tORV3-0001xy-UP
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 01:08:17 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1d7e04c-be6e-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 02:08:13 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1734656889090276.85725902574586;
 Thu, 19 Dec 2024 17:08:09 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6ef81222aaaso11915847b3.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 17:08:08 -0800 (PST)
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
X-Inumbo-ID: e1d7e04c-be6e-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1734656890; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nUMoqtNrkLiY2fr723A/5ix9WqZLEEUT6yoqsGFdoR5RPMDCuB4rVEC6OAlBoHCPRyMIOw24wBbRMeQjVnxc58GrNV7dG8Djwlhy5DFGxU7AZwujMA3Psd24vfQXvJG4fJHcHrxY/C/eMzP53TqAaq85MAE1dKjwwCPO8fbRPi0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734656890; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mpYogTiX0TPPOuB1caBYMoaxkBiu2LrwlS8Vkn57nrs=; 
	b=GC5nCSuKrhzkpq7e+PSwyaN2r6E19AUPuSX043h5tJkfeXb+Z2KGfHTNLVLqGGmVP2HB8SpxgJ5BWq/K9N6vvC6KRKnxLqg7TvxJ4t/+EWzBkm/Yr7LB2Qy45kUPfbg67jAvrjeGWQ+vmDqe/26ntbNc6R3mfTwitm5TY4yy6JA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734656890;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mpYogTiX0TPPOuB1caBYMoaxkBiu2LrwlS8Vkn57nrs=;
	b=RWw1NPA4NZbZqRLnjpvJHc9w+EtkmC68+z3P3R5STPAGfv+TZHe+qX25FvIRlkyn
	xcfTIoxvA6O9r6PnMBvBfYt+GSLVRfxoaJRy5BEgyCJ/eTV1DPzOEYxMvj4tevRjJTZ
	ongcygHPnfj8+fubxOMjo3i9LsTKoMoWFAQvNE/E=
X-Gm-Message-State: AOJu0YygKkJxq5gLs7qbIVZ7mEYLNCy3vjnj7tN2erA5yNfG6k2PlvFK
	3nyEKBpT7ip5FmfL0lh5Rlnqu43iy5VcY3mvmGI1hB806pbBfMk50uffa+UlXNcWRZHMjY8XvIX
	ggHduYzhYx+8H/AhBhTVq0b4m5Yc=
X-Google-Smtp-Source: AGHT+IHeEHW5Oy4aQBUVHup6lEWaEpNSayL/xuto9lHnSwmAwBWJ6uSIJXLZ7tLSkV6HiuM48tkxxNbbGTzZCpCv18Q=
X-Received: by 2002:a05:690c:498b:b0:6f2:8dde:b66 with SMTP id
 00721157ae682-6f3f8114d8fmr7807387b3.12.1734656888075; Thu, 19 Dec 2024
 17:08:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1734631969.git.w1benny@gmail.com> <95580d02390056ea10eb80439f9d3ef9d2297ecc.1734631969.git.w1benny@gmail.com>
In-Reply-To: <95580d02390056ea10eb80439f9d3ef9d2297ecc.1734631969.git.w1benny@gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 19 Dec 2024 20:07:31 -0500
X-Gmail-Original-Message-ID: <CABfawhnuVzFof73bLa-TT1bk-sX7X=XCj6TJJGmWna3apMzhTA@mail.gmail.com>
Message-ID: <CABfawhnuVzFof73bLa-TT1bk-sX7X=XCj6TJJGmWna3apMzhTA@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86: Add Support for Paging-Write Feature
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 1:17=E2=80=AFPM Petr Bene=C5=A1 <w1benny@gmail.com>=
 wrote:
>
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
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
> Additionally, this feature simplifies the handling of race conditions in =
scenarios where an introspection tool:
>
> - Sets an "invisible breakpoint" in the altp2m view for a function F
> - Monitors guest page-table updates to track whether the page containing =
F is paged out
> - Encounters a cleared Access (A) bit on the page containing F while the =
guest is about to execute the breakpoint
>
> In the current implementation:
>
> - If xc_monitor_inguest_pagefault() is enabled, the introspection tool mu=
st emulate both the breakpoint and the setting of the Access bit.
> - If xc_monitor_inguest_pagefault() is disabled, Xen handles the EPT viol=
ation without notifying the introspection tool, setting the Access bit and =
emulating the instruction. However, Xen fetches the instruction from the de=
fault view instead of the altp2m view, potentially causing the breakpoint t=
o be missed.

I'm glad to see this mystery resolved! \o/

> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
> index 21728397f9..5ad78ae4b5 100644
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -176,6 +176,10 @@ static void ept_p2m_type_to_flags(const struct p2m_d=
omain *p2m,
>              break;
>          case p2m_access_rwx:
>              break;
> +        case p2m_access_r_pw:
> +            entry->w =3D entry->x =3D 0;
> +            entry->pw =3D !!cpu_has_vmx_ept_paging_write;

I don't see ept_entry_t having a pw field. What's the deal there?

Tamas

