Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1CEA40DB6
	for <lists+xen-devel@lfdr.de>; Sun, 23 Feb 2025 10:35:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894801.1303546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tm8Nw-0001qI-Mx; Sun, 23 Feb 2025 09:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894801.1303546; Sun, 23 Feb 2025 09:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tm8Nw-0001oq-Jb; Sun, 23 Feb 2025 09:34:52 +0000
Received: by outflank-mailman (input) for mailman id 894801;
 Sun, 23 Feb 2025 00:02:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pks=VO=protonmail.com=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tlzRn-0002Qz-4f
 for xen-devel@lists.xenproject.org; Sun, 23 Feb 2025 00:02:15 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 680dad14-f179-11ef-9896-31a8f345e629;
 Sun, 23 Feb 2025 01:02:01 +0100 (CET)
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
X-Inumbo-ID: 680dad14-f179-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1740268920; x=1740528120;
	bh=SXDurolkFiCdwHrRyAyUFDlkuQXjyy5Vp6hdr87aphE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=D/Xq9k89yHcDNEjxWXgrOcpXj/cpGQrFSw6TAziow8zyL3+GkLYExMwhjJ9zodsFb
	 uEcWBkCTgvDWlLhmH8CvOs88EVwVF2nWrXIProRsJGZbcNed9quwXInlNY3gLMnibz
	 Ul50QxMcp2YXq+7fYU/FaRzQ9TH8vTUcTwaJRMZ4UhPE6RCPVPrHmEzUwnpYp4zfXd
	 C5pFRaPIahh0G/KdfudrMLY4prskR5KR8NvSe5uT0KlonaD30a3f7VpMt+GKp3XDhd
	 ww4tqkFcvcDnRfYJ6u/3R4veXUgT4JSXBPGmTb4Wd64DKvRiJC7WO3LB70zNelbIVn
	 UoO9H9s3crPEA==
Date: Sun, 23 Feb 2025 00:01:57 +0000
To: dmukhin@ford.com
From: Denis Mukhin <dmkhn@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 05/24] xen/console: introduce consoled_is_enabled()
Message-ID: <fUSDJuA00Uc2Lm5_y7oK5broEvCmpYLAgOAqU3gcZxx3a3zc0FaxclY4CP6VPd69T3OvpbFCfy-yMrT4185T-Ylx2Kh_y0_zJWalzroNtLg=@protonmail.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-5-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com> <20250103-vuart-ns8250-v3-v1-5-c5d36b31d66c@ford.com>
Feedback-ID: 33633869:user:proton
X-Pm-Message-ID: 805a67f0d75f6e2277aab694da1b6ccbc55b417e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, January 3rd, 2025 at 5:58 PM, Denis Mukhin via B4 Relay <devnull=
+dmukhin.ford.com@kernel.org> wrote:
>=20
>=20
> From: Denis Mukhin dmukhin@ford.com
>=20
>=20
> There are few places which check pv_shim console under CONFIG_PV_SHIM in =
xen
> console driver. Instead of #ifdef-ing, use new consoled_is_enabled() to
> customize the logic.
>=20
> Header file now can be included w/o CONFIG_X86.
>=20
> Signature of consoled_guest_{rx,tx} has changed so the error can be logge=
d.
>=20
> Signed-off-by: Denis Mukhin dmukhin@ford.com

Moved to:
  https://lore.kernel.org/xen-devel/20250222235748.103599-1-dmkhn@proton.me=
/

>=20
> ---
> xen/drivers/char/console.c | 13 +++++--------
> xen/drivers/char/consoled.c | 17 +++++++++++++----
> xen/include/xen/consoled.h | 32 +++++++++++++++++++++++++++-----
> 3 files changed, 45 insertions(+), 17 deletions(-)
>=20
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 4785f0e93a17e3ecba79a7813d2928f946abab8f..2d20a9d7531e069803eaf30ce=
79354b998c4a52f 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -33,9 +33,9 @@
> #include <xen/pv_console.h>
>=20
> #include <asm/setup.h>
>=20
> #include <xen/sections.h>
>=20
> +#include <xen/consoled.h>
>=20
>=20
> #ifdef CONFIG_X86
> -#include <xen/consoled.h>
>=20
> #include <asm/guest.h>
>=20
> #endif
> #ifdef CONFIG_SBSA_VUART_CONSOLE
> @@ -508,11 +508,9 @@ static void switch_serial_input(void)
> break;
> }
>=20
> -#ifdef CONFIG_PV_SHIM
> - if ( next_rx =3D=3D 1 )
> + if ( consoled_is_enabled() && next_rx =3D=3D 1 )
> domid =3D get_initial_domain_id();
> else
> -#endif
> domid =3D next_rx - 1;
> d =3D rcu_lock_domain_by_id(domid);
> if ( d )
> @@ -563,10 +561,9 @@ static void __serial_rx(char c)
> rc =3D vpl011_rx_char_xen(d, c);
> #endif
>=20
> -#ifdef CONFIG_X86
> - if ( pv_shim && pv_console )
> - consoled_guest_tx(c);
> -#endif
> + if ( consoled_is_enabled() )
> + /* Deliver input to the PV shim console. */
> + rc =3D consoled_guest_tx(c);
>=20
> if ( rc )
> printk(KERN_ERR "d%pd: failed to process console input: %d\n", d, rc);
> diff --git a/xen/drivers/char/consoled.c b/xen/drivers/char/consoled.c
> index b415b632cecc0a80e161b701d7b70ba4f3cc5fb8..8704ec251eb19e9c1cdc5927f=
896aeb20cc5af1e 100644
> --- a/xen/drivers/char/consoled.c
> +++ b/xen/drivers/char/consoled.c
> @@ -43,13 +43,13 @@ struct xencons_interface consoled_get_ring_addr(void)
> static char buf[BUF_SZ + 1];
>=20
> / Receives characters from a domain's PV console /
> -void consoled_guest_rx(void)
> +int consoled_guest_rx(void)
> {
> size_t idx =3D 0;
> XENCONS_RING_IDX cons, prod;
>=20
> if ( !cons_ring )
> - return;
> + return -ENODEV;
>=20
> spin_lock(&rx_lock);
>=20
> @@ -91,15 +91,17 @@ void consoled_guest_rx(void)
>=20
> out:
> spin_unlock(&rx_lock);
> +
> + return 0;
> }
>=20
> / Sends a character into a domain's PV console */
> -void consoled_guest_tx(char c)
> +int consoled_guest_tx(char c)
> {
> XENCONS_RING_IDX cons, prod;
>=20
> if ( !cons_ring )
> - return;
> + return -ENODEV;
>=20
> cons =3D ACCESS_ONCE(cons_ring->in_cons);
>=20
> prod =3D cons_ring->in_prod;
>=20
> @@ -125,6 +127,13 @@ void consoled_guest_tx(char c)
> notify:
> /* Always notify the guest: prevents receive path from getting stuck. /
> pv_shim_inject_evtchn(pv_console_evtchn());
> +
> + return 0;
> +}
> +
> +bool consoled_is_enabled(void)
> +{
> + return pv_shim && pv_console;
> }
>=20
> /
> diff --git a/xen/include/xen/consoled.h b/xen/include/xen/consoled.h
> index bd7ab6329ee8a7c466484021247241ded8ed03c7..14e5e3284a86201919f0f70a8=
c2785609f35b15f 100644
> --- a/xen/include/xen/consoled.h
> +++ b/xen/include/xen/consoled.h
> @@ -1,14 +1,36 @@
> -#ifndef XEN_CONSOLED_H
> -#define XEN_CONSOLED_H
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN__CONSOLED_H
> +#define XEN__CONSOLED_H
>=20
> #include <public/io/console.h>
>=20
>=20
> +#ifdef CONFIG_PV_SHIM
> +
> void consoled_set_ring_addr(struct xencons_interface *ring);
> struct xencons_interface consoled_get_ring_addr(void);
> -void consoled_guest_rx(void);
> -void consoled_guest_tx(char c);
> +int consoled_guest_rx(void);
> +int consoled_guest_tx(char c);
> +bool consoled_is_enabled(void);
>=20
> -#endif / XEN_CONSOLED_H /
> +#else
> +
> +static inline int consoled_guest_rx(void)
> +{
> + ASSERT_UNREACHABLE();
> + return 0;
> +}
> +
> +static inline int consoled_guest_tx(char c)
> +{
> + ASSERT_UNREACHABLE();
> + return 0;
> +}
> +
> +#define consoled_is_enabled() ( false )
> +
> +#endif / CONFIG_PV_SHIM /
> +
> +#endif / XEN__CONSOLED_H /
> /
> * Local variables:
> * mode: C
>=20
> --
> 2.34.1
> 

