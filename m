Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE2B6F919A
	for <lists+xen-devel@lfdr.de>; Sat,  6 May 2023 13:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530838.826599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvGDG-0004ix-6E; Sat, 06 May 2023 11:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530838.826599; Sat, 06 May 2023 11:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvGDG-0004gx-3F; Sat, 06 May 2023 11:36:30 +0000
Received: by outflank-mailman (input) for mailman id 530838;
 Sat, 06 May 2023 11:36:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rQ1Y=A3=zedat.fu-berlin.de=glaubitz@srs-se1.protection.inumbo.net>)
 id 1pvGDE-0004go-KZ
 for xen-devel@lists.xenproject.org; Sat, 06 May 2023 11:36:28 +0000
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ba43fe7-ec02-11ed-b226-6b7b168915f2;
 Sat, 06 May 2023 13:36:25 +0200 (CEST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pvGCa-002hVY-AY; Sat, 06 May 2023 13:35:48 +0200
Received: from p57bd9cee.dip0.t-ipconnect.de ([87.189.156.238]
 helo=suse-laptop.fritz.box) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pvGCZ-000Sf9-Vs; Sat, 06 May 2023 13:35:48 +0200
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
X-Inumbo-ID: 3ba43fe7-ec02-11ed-b226-6b7b168915f2
Message-ID: <c0677d21a4b6caa2e5018af000294a974121d9e8.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v2 30/34] sh: Convert pte_free_tlb() to use ptdescs
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, Andrew Morton
	 <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>
Date: Sat, 06 May 2023 13:35:46 +0200
In-Reply-To: <20230501192829.17086-31-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
	 <20230501192829.17086-31-vishal.moola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.156.238
X-ZEDAT-Hint: PO

Hi Vishal!

On Mon, 2023-05-01 at 12:28 -0700, Vishal Moola (Oracle) wrote:
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents. Also cleans up some spacing issues.
>=20
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  arch/sh/include/asm/pgalloc.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.=
h
> index a9e98233c4d4..ce2ba99dbd84 100644
> --- a/arch/sh/include/asm/pgalloc.h
> +++ b/arch/sh/include/asm/pgalloc.h
> @@ -2,6 +2,7 @@
>  #ifndef __ASM_SH_PGALLOC_H
>  #define __ASM_SH_PGALLOC_H
> =20
> +#include <linux/mm.h>
>  #include <asm/page.h>
> =20
>  #define __HAVE_ARCH_PMD_ALLOC_ONE
> @@ -31,10 +32,10 @@ static inline void pmd_populate(struct mm_struct *mm,=
 pmd_t *pmd,
>  	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
>  }
> =20
> -#define __pte_free_tlb(tlb,pte,addr)			\
> -do {							\
> -	pgtable_pte_page_dtor(pte);			\
> -	tlb_remove_page((tlb), (pte));			\
> +#define __pte_free_tlb(tlb, pte, addr)				\
> +do {								\
> +	ptdesc_pte_dtor(page_ptdesc(pte));			\
> +	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
>  } while (0)
> =20
>  #endif /* __ASM_SH_PGALLOC_H */

Looking at the patch which introduces tlb_remove_page_ptdesc() [1], it seem=
s that
tlb_remove_page_ptdesc() already calls tlb_remove_page() with ptdesc_page(p=
t), so
I'm not sure whether the above tlb_remove_page_ptdesc((tlb), (page_ptdesc(p=
te)))
is correct.

Shouldn't it just be tlb_remove_page_ptdesc((tlb), (pte))?

Thanks,
Adrian

> [1] https://lore.kernel.org/linux-mm/20230417205048.15870-5-vishal.moola@=
gmail.com/

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

