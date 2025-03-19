Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB76AA699D4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 20:53:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921110.1325108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuzTw-0001EC-3v; Wed, 19 Mar 2025 19:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921110.1325108; Wed, 19 Mar 2025 19:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuzTw-0001C7-0d; Wed, 19 Mar 2025 19:53:40 +0000
Received: by outflank-mailman (input) for mailman id 921110;
 Wed, 19 Mar 2025 19:53:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mgHu=WG=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tuzTu-0001C1-Vc
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 19:53:38 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8c7a671-04fb-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 20:53:37 +0100 (CET)
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
X-Inumbo-ID: d8c7a671-04fb-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742414015; x=1742673215;
	bh=PFT8pXTOxJO/sHlDDc61wc+pKJ/WuLGsg+bJb5+LTlk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=LUIQ/AB9a07/b0nW63+D/P9+1NkPLCax789Qqq8Znrj64Wx/kTU1Qi9DvOcBFfWFX
	 1E4XJWWXEYs2THL+ewLiveV7JF1ZUekpfaXG2IhewZmR6UzAWfSh2XDXVdjmq7+P5U
	 Gi5hbFadCjXVXXLcki/Bd8C3SuctVszjKHENhCmIEYCn2ObCBWNfd9ujwmaOuCYv2Q
	 Kh0aqVkx85IYy9nKiwLwdDKhG5u/mofyeDU9IR/14nWn1T/UMC9UTDyd7UpRDy4cSA
	 +qMDQQKCPv6iGYth7fI8yuGsWCdnkZTZLEw+ic1VkUI9U2hP9V1pVOOrDh9HDxypTt
	 KgfgM2SqfJCfg==
Date: Wed, 19 Mar 2025 19:53:29 +0000
To: xen-devel@lists.xenproject.org
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v1 7/8] xen/console: introduce console_set_focus()
Message-ID: <ghk1LVqSlfRNlEVBf6gQ3AdtBxBBtVSHp_Q69C-vkC1y5wexc4AF-SYXzRIFOaIhnIFZsuAorjAWCRqDDsyb-x0mcVzn2fFS-KWzd3qaW-U=@proton.me>
In-Reply-To: <20250318233617.849903-8-dmukhin@ford.com>
References: <20250318233617.849903-1-dmukhin@ford.com> <20250318233617.849903-8-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 76d81558da395123b5065b01ce82aeb69592c4a8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, March 18th, 2025 at 4:37 PM, dmkhn@proton.me <dmkhn@proton.me> =
wrote:

>=20
>=20
> Switch console_focus address space from integers mapped to domain IDs to
> direct domain IDs, simplifying the console input switching code.
>=20
> Introduce console_set_focus() to set the console owner domain identifier.
>=20
> Signed-off-by: Denis Mukhin dmukhin@ford.com
>=20
> ---
> xen/drivers/char/console.c | 81 ++++++++++++++++----------------------
> 1 file changed, 34 insertions(+), 47 deletions(-)
>=20
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 3d538510f4..0e2349a868 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -462,14 +462,12 @@ static void cf_check dump_console_ring_key(unsigned=
 char key)
>=20
> /*
> * CTRL-<switch_char> changes input direction, rotating among Xen, Dom0,
>=20
> - * and the DomUs started from Xen at boot.
> + * and the DomUs.
> /
> #define switch_code (opt_conswitch[0]-'a'+1)
>=20
> / Console owner domain identifier. /
> -static unsigned int __read_mostly console_focus =3D 0;
> -
> -#define max_console_rx (domid_top + 1)
> +static domid_t __read_mostly console_focus =3D DOMID_XEN;
>=20
> static struct domain console_get_domain_by_id(domid_t domid)
> {
> @@ -488,9 +486,7 @@ static struct domain console_get_domain_by_id(domid_t=
 domid)
>=20
> struct domain console_get_domain(void)
> {
> - if ( console_focus =3D=3D 0 )
> - return NULL;
> - return console_get_domain_by_id(console_focus - 1);
> + return console_get_domain_by_id(console_focus);
> }
>=20
> void console_put_domain(struct domain d)
> @@ -508,42 +504,41 @@ static bool console_check_focus_by_id(domid_t domid=
)
> return !!d;
> }
>=20
> -static void console_switch_focus(void)
> +static int console_set_focus(domid_t domid)
> {
> - unsigned int next_rx =3D console_focus;
> + if ( domid =3D=3D DOMID_XEN )
> + printk(" Serial input to Xen");
> + else if ( console_check_focus_by_id(domid) )
> + printk("* Serial input to DOM%u", domid);
> + else
> + return -ENOENT;
>=20
> - /*
> - * Rotate among Xen, dom0 and boot-time created domUs while skipping
> - * switching serial input to non existing domains.
> - */
> - for ( ; ; )
> - {
> - domid_t domid;
> -
> - if ( next_rx++ >=3D max_console_rx )
>=20
> - {
> - console_focus =3D 0;
> - printk("*** Serial input to Xen");
> - break;
> - }
> -
> - if ( consoled_is_enabled() && next_rx =3D=3D 1 )
> - domid =3D get_initial_domain_id();
> - else
> - domid =3D next_rx - 1;
> -
> - if ( console_check_focus_by_id(domid) )
> - {
> - console_focus =3D next_rx;
> - printk("*** Serial input to DOM%u", domid);
> - break;
> - }
> - }
> + console_focus =3D domid;
>=20
> if ( switch_code )
> printk(" (type 'CTRL-%c' three times to switch input)",
> opt_conswitch[0]);
> printk("\n");
> +
> + return 0;
> +}
> +
> +/*
> + * Switch console focus.
> + * Rotates input focus among Xen, dom0 and boot-time created domUs while
> + * skipping switching serial input to non existing domains.
> + */
> +static void console_switch_focus(void)
> +{
> + const domid_t n =3D domid_top + 1;
> + domid_t i =3D ( console_focus =3D=3D DOMID_XEN )
> + ? get_initial_domain_id() : console_focus + 1;
> +
> + for ( ; i < n; i++ )
> + if ( !console_set_focus(i) )
> + return;
> +
> + console_set_focus(DOMID_XEN);
> }
>=20
> static void __serial_rx(char c)
> @@ -551,7 +546,7 @@ static void __serial_rx(char c)
> struct domain d;
> int rc =3D 0;
>=20
> - if ( console_focus =3D=3D 0 )
> + if ( console_focus =3D=3D DOMID_XEN )
> return handle_keypress(c, false);
>=20
> d =3D console_get_domain();
> @@ -1141,14 +1136,6 @@ void __init console_endboot(void)
>=20
> video_endboot();
>=20
> - /
> - * If user specifies so, we fool the switch routine to redirect input
> - * straight back to Xen. I use this convoluted method so we still print
> - * a useful 'how to switch' message.
> - /
> - if ( opt_conswitch[1] =3D=3D 'x' )
> - console_focus =3D max_console_rx;
> -
> register_keyhandler('w', dump_console_ring_key,
> "synchronously dump console ring buffer (dmesg)", 0);
> register_irq_keyhandler('+', &do_inc_thresh,
> @@ -1158,8 +1145,8 @@ void __init console_endboot(void)
> register_irq_keyhandler('G', &do_toggle_guest,
> "toggle host/guest log level adjustment", 0);
>=20
> - / Serial input is directed to DOM0 by default. */
> - console_switch_focus();
> + if ( opt_conswitch[1] !=3D 'x' )
> + console_set_focus( get_initial_domain_id() );

Forgot to drop extra spaces around the function parameter.

> }
>=20
> int __init console_has(const char *device)
> --
> 2.34.1

