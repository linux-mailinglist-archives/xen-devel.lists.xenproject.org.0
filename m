Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00ECB12C8A
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 23:08:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1059620.1426410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufm7v-00043m-IO; Sat, 26 Jul 2025 21:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1059620.1426410; Sat, 26 Jul 2025 21:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufm7v-000422-Fi; Sat, 26 Jul 2025 21:08:19 +0000
Received: by outflank-mailman (input) for mailman id 1059620;
 Sat, 26 Jul 2025 21:08:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+vUE=2H=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ufm7t-00041t-Em
 for xen-devel@lists.xenproject.org; Sat, 26 Jul 2025 21:08:17 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5ef0c41-6a64-11f0-a31e-13f23c93f187;
 Sat, 26 Jul 2025 23:08:16 +0200 (CEST)
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
X-Inumbo-ID: a5ef0c41-6a64-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753564095; x=1753823295;
	bh=68WOn9DmkALBzJu4yAXr0bX4lBq9iI2OSE6qs2HqXH8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IAtopr9XlxMagwRvGqoPRHN1AJouUCXZ+otlBsPGiOzeWolR2TWinsHWJM6/hdEOn
	 fg05qE7MEl/XI8EJPC/d7fCJLXt9DvvkJx42Co6BFodTOX6FYOOYP4L6TdHGAp7eA9
	 Ky+0Z9b3Kk24f8UNDDJbdHWUYP+kNE5Dja5rZJPYEJH4V8LxCu4hn+sOH0kTWiv5/w
	 o0Oxx4ZO8EkZZT8H6/586E6gK9NTGyvL8CDyHYKSGCM8a2mzUSiEJsQs+t4vhdM3fr
	 pEkjuG5Gbw+8+EmlcSxtjoQEbZPfsDOujUx6D6xHSf+OAMInv+0Dd+HF3mvx5VJFxg
	 GRLxbHObvbP5A==
Date: Sat, 26 Jul 2025 21:08:11 +0000
To: Julien Grall <julien@xen.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] P2M: Don't try to free the existing PTE if we can't allocate a new table
Message-ID: <aIVDt5hNXPBo4hUN@kraken>
In-Reply-To: <20250726122607.75950-1-julien@xen.org>
References: <20250726122607.75950-1-julien@xen.org>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7d9f442487bc7b463179c98e5c734dbf18560de3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 01:26:07PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>=20
> When we can't split a superpage (on Arm p2m_split_superpage() returns fal=
se,
> on x86 ept_split_superpage() returns 0), the caller is expected to clean
> any PTE that may have been allocated. However, when we can't allocate
> the page-tables 'entry' (arm) / 'ept_entry' still points to a live PTE.
> So we will end up to free a PTE that is still used.
>=20
> In practice for:
>   * x86: We don't do any refcounting for 2MB/1GB mappings. So this is
>     harmless
>   * arm: We do refcounting for 2MB mapping (not for 1GB ones). This is
>     only used for static memory.
>=20
> So there is a security issue on Arm but this doesn't meet the criteria
> for an XSA (static memory is not security supported).
>=20
> Solve the issue by clearing the PTE if we can't allocate the table.
>=20
> Reported-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> ----
>=20
> I decided to not split the patch in two as the issue for x86 and
> arm is the same. But I am happy to split if this is preferred.
> ---
>  xen/arch/arm/mmu/p2m.c    | 8 ++++++++
>  xen/arch/x86/mm/p2m-ept.c | 9 +++++++++
>  2 files changed, 17 insertions(+)
>=20
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 51abf3504fcf..9a1fb44a0204 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -888,7 +888,15 @@ static bool p2m_split_superpage(struct p2m_domain *p=
2m, lpae_t *entry,
>=20
>      page =3D p2m_alloc_page(p2m->domain);
>      if ( !page )
> +    {
> +        /*
> +         * The caller is in charge to free the sub-tree. So tell the

                                                            ^^^
Looks like the "So tell the" can be dropped from the commentary.
Same comment for the p2m-ept.c below.

> +         * As we didn't manage to allocate anything, just tell the
> +         * caller there is nothing to free by invalidating the PTE.
> +         */
> +        memset(entry, 0, sizeof(*entry));
>          return false;
> +    }
>=20
>      page_list_add(page, &p2m->pages);
>      table =3D __map_domain_page(page);
> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
> index 62fc8e50689f..1efac27835d2 100644
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -261,7 +261,16 @@ static bool ept_split_super_page(
>=20
>      table =3D ept_set_middle_entry(p2m, &new_ept);
>      if ( !table )
> +    {
> +        /*
> +         * The caller is in charge to free the sub-tree. So tell the
> +         * As we didn't manage to allocate anything, just tell the
> +         * caller there is nothing to free by invalidating the PTE.
> +         */
> +        memset(ept_entry, 0, sizeof(*ept_entry));
> +
>          return 0;
> +    }
>=20
>      trunk =3D 1UL << ((level - 1) * EPT_TABLE_ORDER);
>=20
> --
> 2.47.3
>=20
>=20


