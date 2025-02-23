Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D44A40C4A
	for <lists+xen-devel@lfdr.de>; Sun, 23 Feb 2025 01:03:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894803.1303500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlzSs-0002Uq-O4; Sun, 23 Feb 2025 00:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894803.1303500; Sun, 23 Feb 2025 00:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlzSs-0002SZ-KI; Sun, 23 Feb 2025 00:03:22 +0000
Received: by outflank-mailman (input) for mailman id 894803;
 Sun, 23 Feb 2025 00:03:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4AKD=VO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tlzSq-0002SR-Lr
 for xen-devel@lists.xenproject.org; Sun, 23 Feb 2025 00:03:20 +0000
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96a92fbb-f179-11ef-9aac-95dc52dad729;
 Sun, 23 Feb 2025 01:03:19 +0100 (CET)
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
X-Inumbo-ID: 96a92fbb-f179-11ef-9aac-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1740268998; x=1740528198;
	bh=7Vz/p6JaLdgnJ7IxV7/Cl6zGMhdq4inDmzgfPAfcOCE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=h95hJRd/4RLBuZ2HAxBYVk9qb85+43iWc1OWh+qa7h44Ta9XniMwf8mz4djRawTc7
	 EzQmwVjzqglojb+URLkl5ST6y1x188X2rEz3WOUA21f7WtaTeJ57i+i8zxNaFRBtpQ
	 xSB/gpp186C/33Qio1RWr5/VwFhniSEjR/XAzAjUPxd4YwCPTCj2r010tM+K8JICkB
	 BSVNxuCjsFzth3Jv5t+LvIqTAyvSpdpY03ARlowutEvq/RDaUANEK5sj1WEXYYsoZf
	 rJ5BGJa8DThFYXNA8MD/ZrYrag10U9nN13v9bCwkwJWW4w2WIKyjL6KyCAtxS3+khG
	 TtBeBur28onIw==
Date: Sun, 23 Feb 2025 00:03:13 +0000
To: xen-devel@lists.xenproject.org
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH] xen/consoled: clean up console handling for pv_shim
Message-ID: <NEiqHwjG6PAC6Q3Q03hS5ns6rTY7NuZntRMhd7sWPqtvLfTvUVk3L0v3IdercdZ6qg5Tq27CJwTRQgPCVnASPrF_gN8v5zPTjDyaPrrawKI=@proton.me>
In-Reply-To: <20250222002520.2482334-1-dmukhin@ford.com>
References: <20250222002520.2482334-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 6ca60cf3d2cb1bad263572f4a47e27209b14b1a8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, February 21st, 2025 at 4:26 PM, dmkhn@proton.me <dmkhn@proton.me=
> wrote:

>=20
>=20
> There are few places which check pv_shim console under CONFIG_PV_SHIM or
> CONFIG_X86 in xen console driver.
>=20
> Instead of #ifdef-ing, use new consoled_is_enabled() in switch_serial_inp=
ut()
> and _serial_rx() (where pv_shim condition is now detected correctly).
>=20
> Signature of consoled_guest{rx,tx} has changed so the errors can be logge=
d
> on the callsites.
>=20
> Signed-off-by: Denis Mukhin dmukhin@ford.com

Sorry, I posted too early, there's missing dependency in this patch.
Posted v2 here:
  https://lore.kernel.org/xen-devel/20250222235748.103599-1-dmkhn@proton.me=
/

>=20
> ---
> xen/arch/x86/pv/shim.c | 3 +--
> xen/drivers/char/console.c | 15 ++++++---------
> xen/drivers/char/consoled.c | 17 +++++++++++++----
> xen/include/xen/consoled.h | 32 +++++++++++++++++++++++++++-----
> 4 files changed, 47 insertions(+), 20 deletions(-)
>=20
> diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
> index b9c034ccff..cbc2e3fced 100644
> --- a/xen/arch/x86/pv/shim.c
> +++ b/xen/arch/x86/pv/shim.c
> @@ -605,8 +605,7 @@ long pv_shim_event_channel_op(int cmd, XEN_GUEST_HAND=
LE_PARAM(void) arg)
>=20
> if ( pv_console && send.port =3D=3D pv_console_evtchn() )
> {
> - consoled_guest_rx();
> - rc =3D 0;
> + rc =3D consoled_guest_rx();
> }
> else
> rc =3D xen_hypercall_event_channel_op(EVTCHNOP_send, &send);
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 992b37962e..c207fd8704 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -32,9 +32,9 @@
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
> @@ -507,11 +507,9 @@ static void switch_serial_input(void)
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
> @@ -562,13 +560,12 @@ static void __serial_rx(char c)
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
> - guest_printk(d, XENLOG_G_WARNING
> + guest_printk(d, XENLOG_WARNING
> "failed to process console input: %d\n", rc);
>=20
> console_put_domain(d);
> diff --git a/xen/drivers/char/consoled.c b/xen/drivers/char/consoled.c
> index b415b632ce..8704ec251e 100644
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
> index bd7ab6329e..52a1358bea 100644
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
> + return -ENODEV;
> +}
> +
> +static inline int consoled_guest_tx(char c)
> +{
> + ASSERT_UNREACHABLE();
> + return -ENODEV;
> +}
> +
> +#define consoled_is_enabled() (false)
> +
> +#endif / CONFIG_PV_SHIM /
> +
> +#endif / XEN__CONSOLED_H /
> /
> * Local variables:
> * mode: C
> --
> 2.34.1

