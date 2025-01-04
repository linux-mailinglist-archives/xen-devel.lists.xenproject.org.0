Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCBDA01249
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 05:44:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865340.1276641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTw1S-0003C1-UF; Sat, 04 Jan 2025 04:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865340.1276641; Sat, 04 Jan 2025 04:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTw1S-00039v-RS; Sat, 04 Jan 2025 04:44:26 +0000
Received: by outflank-mailman (input) for mailman id 865340;
 Sat, 04 Jan 2025 04:44:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTw1R-00039p-ND
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 04:44:25 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91c2bf67-ca56-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 05:44:23 +0100 (CET)
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
X-Inumbo-ID: 91c2bf67-ca56-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735965862; x=1736225062;
	bh=UZkMmFCa5yyf/U7eDUX/GoWclC//EYYi0LViPvL9q7g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=VwMJTFx7qnvYwmEjoaKRXLrA/Rp0r/XWG4KzQQKcUAgHGfk38yMJy2ggmaEC9Z26s
	 ibJPjrlHHNJvt5OjT8DFYRwETfMXp1eLBgHr7xe1Tap2AoBDAb5MF1+3gNPbQJvZ8q
	 arcukhQu8qFhGWI4fkfUjW90vBtntv876ldIa6bJ2K8B4nK+cRQ8m5GImvuOTDEUze
	 ODpJhcAxBL1Jignllz3Yc8xlGO/1D7VIW8CCB30I9NdKa+uJ1Mxy5sjV/LCAAhqivA
	 tsEHsT8q+m6ePhbtK2SN5vAhZ0Q3fhuxy535kol8rT0Hs1+5w7Ydvy+xstGTQVNjRM
	 NcTPFRms68lMw==
Date: Sat, 04 Jan 2025 04:44:16 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 10/35] xen/domain: add get_initial_domain_id()
Message-ID: <H6Vup7H-_2Ni5ibGAsMGk8MQ_XSxov20lw5KMSjKZ0WKdHNucw6QcpqE2a_nDY1rscZ2SGNf-bdpVnn54bQW7eR4dyhL4eTq-U7YLyX9y4E=@proton.me>
In-Reply-To: <Z1nCyXhCErGBCozN@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-10-e9aa923127eb@ford.com> <Z1nCyXhCErGBCozN@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 5da3f4c7ac3ee346c994cd87f4849c6ce6d2d1ea
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Wednesday, December 11th, 2024 at 8:50 AM, Roger Pau Monn=C3=A9 <roger.p=
au@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:40PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Move get_initial_domain_id() to a public API and enable for all archite=
ctures.
> > That is pre-requisite change for console focus switch logic cleanup.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/arch/x86/include/asm/pv/shim.h | 4 ++--
> > xen/arch/x86/pv/shim.c | 4 ++--
> > xen/common/domain.c | 10 ++++++++++
> > xen/include/xen/domain.h | 2 ++
> > 4 files changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/arch/x86/include/asm/pv/shim.h b/xen/arch/x86/include/=
asm/pv/shim.h
> > index 6153e27005986881ad87e9db0b555b30edc59fc0..1515ad1b0680aa11ab91a15=
2a1944fc1bb477a79 100644
> > --- a/xen/arch/x86/include/asm/pv/shim.h
> > +++ b/xen/arch/x86/include/asm/pv/shim.h
> > @@ -31,7 +31,7 @@ long cf_check pv_shim_cpu_up(void *data);
> > long cf_check pv_shim_cpu_down(void *data);
> > void pv_shim_online_memory(unsigned int nr, unsigned int order);
> > void pv_shim_offline_memory(unsigned int nr, unsigned int order);
> > -domid_t get_initial_domain_id(void);
> > +domid_t pv_shim_initial_domain_id(void);
> > uint64_t pv_shim_mem(uint64_t avail);
> > void pv_shim_fixup_e820(void);
> > const struct platform_bad_page *pv_shim_reserved_pages(unsigned int *si=
ze);
> > @@ -76,7 +76,7 @@ static inline void pv_shim_offline_memory(unsigned in=
t nr, unsigned int order)
> > {
> > ASSERT_UNREACHABLE();
> > }
> > -static inline domid_t get_initial_domain_id(void)
> > +static inline domid_t pv_shim_initial_domain_id(void)
> > {
> > return 0;
> > }
> > diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
> > index 81e4a0516d18b359561f471f1d96e38977661ca7..17cb30620290c76cf42251f=
70cfa4199c0e165d1 100644
> > --- a/xen/arch/x86/pv/shim.c
> > +++ b/xen/arch/x86/pv/shim.c
> > @@ -328,7 +328,7 @@ int pv_shim_shutdown(uint8_t reason)
> > }
> >
> > /* Update domain id. */
> > - d->domain_id =3D get_initial_domain_id();
> > + d->domain_id =3D pv_shim_initial_domain_id();
>
>
> Can't you leave this instance using get_initial_domain_id(), it should
> DTRT when running in pv-shim mode.

Reverted.

>
> > /* Clean the iomem range. */
> > BUG_ON(iomem_deny_access(d, 0, ~0UL));
> > @@ -1016,7 +1016,7 @@ void pv_shim_offline_memory(unsigned int nr, unsi=
gned int order)
> > }
> > }
> >
> > -domid_t get_initial_domain_id(void)
> > +domid_t pv_shim_initial_domain_id(void)
> > {
> > uint32_t eax, ebx, ecx, edx;
> >
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 92263a4fbdc57159b4a32d9d4ee038f9f37804ed..2f67aa06ed50e69c27cedc8=
d7f6eb0b469fe81cd 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -45,6 +45,7 @@
> >
> > #ifdef CONFIG_X86
> > #include <asm/guest.h>
> > +#include <asm/pv/shim.h>
> > #endif
> >
> > /* Linux config option: propageted to domain0 */
> > @@ -2229,6 +2230,15 @@ int continue_hypercall_on_cpu(
> > return 0;
> > }
> >
> > +domid_t get_initial_domain_id(void)
> > +{
> > +#ifdef CONFIG_X86
> > + return pv_shim_initial_domain_id();
> > +#else
> > + return 0;
> > +#endif
> > +}
>
>
> Maybe there are further changes that make this a not suitable option,
> but won't it be better to maybe do something like:
>
> #ifndef HAS_ARCH_INITIAL_DOMID
> static inline domid_t get_initial_domain_id(void) { return 0; }
> #else
> domid_t get_initial_domain_id(void);
> #endif
>
> In a generic header, and then in an x86 header you just
>
> #define HAS_ARCH_INITIAL_DOMID
>
> The ifdefary in get_initial_domain_id() if other arches need different
> implementations seems undesirable.

IMO, existing implementation of get_initial_domain_id() looks like
a layering violation: global get_initial_domain_id() does not belong to PV
shim layer.

The current equivalent of HAS_ARCH_INITIAL_DOMID is CONFIG_PV_SHIM, so I th=
ink
there's no need to define another config flag.

After addressing Jan's feedback and then moving the code around,
I kept pv_shim_get_initial_domain_id() in PV shim and #ifdefs
in common/domain.c (similar to domain_shutdown()).

Also, I switched to using hardware_domid instead of open-coded 0.

>
> Thanks, Roger.



