Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F638BE10A
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 13:32:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718022.1120525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4J3I-000888-LJ; Tue, 07 May 2024 11:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718022.1120525; Tue, 07 May 2024 11:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4J3I-00085W-IH; Tue, 07 May 2024 11:32:08 +0000
Received: by outflank-mailman (input) for mailman id 718022;
 Tue, 07 May 2024 11:32:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3sU=MK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s4J3G-00085Q-VP
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 11:32:07 +0000
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com
 [103.168.172.145]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d706293-0c65-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 13:32:04 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.nyi.internal (Postfix) with ESMTP id 701CA13808C4;
 Tue,  7 May 2024 07:32:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 07 May 2024 07:32:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 07:32:02 -0400 (EDT)
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
X-Inumbo-ID: 6d706293-0c65-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1715081523;
	 x=1715167923; bh=XH1RoyO3KTqa5pRCLmz9Yhq5hK7bnWr/v1fAmjKrMsE=; b=
	ZOgmjlD3wNLb+4qkNSfWOTEq+GhXslq8SDeF7lXBt4c4nkanu0HFjG+91xygpson
	nbz2vXR6mHC8a6MMkLefcOoWBuHnmfDFFozsFpOEcUID0x1AR+NX/DSj5Ap+KVat
	S/RK9mlt+Cf3BsbiWioTWoPBDItN2sME8EwxXpwJGNajYEvfyOTjMxcDK9PaASSh
	boTQ/Y5e7igL9ov3YOR7EHq4CfhVYUBeIl0uxwx8DRIP9f3HgUdDWOFGjoydltqF
	eGn/3XWPm/Nd4C8JbqFE+LQoOsYBBXpdVHmHjnm3HVu0SZ77PmaI5NzzT6GjRPiV
	+dVcx56+++dfxIO8ee45qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715081523; x=1715167923; bh=XH1RoyO3KTqa5pRCLmz9Yhq5hK7b
	nWr/v1fAmjKrMsE=; b=T6m3VsteyzqfMmaJGiXHX+R7/34Yjij2f1nvQJavU6Pr
	e/9xha130u/NYR0VHz5Hht95c5KQlVt8yo7fS5SBO6yjHs6I2hdwk4EuWduLzkjj
	SLD5mVhjhPStO6rnxurmdGdJCKhY0roUvR+nskkEmcETt3kvwgCKCMj+zzuNazjO
	Fo3SB6GwFu1f3WJSKf0tH59yoyI0RSsj8GslitLtKXIk0HF3ngkDlX8I5wyyUwt6
	YWmj4ymwJ2s5MIPeIEEQ/qxYtCs9/4Rgwh2XQxk0pApdEL+M8jdJleitPkF3UrRk
	QLWU2Vv6ZA9T0X4RrS0AtVfgahr9cX4sJL2cvyNU+g==
X-ME-Sender: <xms:MxE6ZhRhjSwe4jDeokO8-LbqkbL8VSeU-CGLCPAFtLSDknLYauzI5g>
    <xme:MxE6Zqxp0BspZ_zHQ4ze3b3qmeHh6VrigxDmqNfW2LOXpTAyf_eKJWhKgcB7h7g_r
    HL673fP_Lj8tQ>
X-ME-Received: <xmr:MxE6Zm3enaBQixlencohOrnPU8V7wZkScPqHlPdCXEeSLW6xSWIPlovPTEHDVtn1E4vSYRouSy1FqFyUDaocGLpL7CmE_5cEFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:MxE6ZpAObRDQP-PwKAsUY5EI28u8EF7NYTERGDTCLHrH-sL8psKUrg>
    <xmx:MxE6ZqhXiILHfySaG0GKBzIdVXl12Y8sfSR-ap9RfhMW0GbnkLHoRg>
    <xmx:MxE6ZtrelBLY03oFjtzIAaUo0ldjMkOoz3T_nRwTRUB88cb4zwfphg>
    <xmx:MxE6ZlhQMJlIgl16gY9Ciw-2I7g56tXD9MLP-5OXkQ2fet9jqWuDYg>
    <xmx:MxE6ZieSylpj26gLbkb18D7SOz8NnfCVszKQMSsFF6nEt6VV7MLtCaiB>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 7 May 2024 13:32:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xl: Open xldevd.log with O_CLOEXEC
Message-ID: <ZjoRMHmL8_K9_lsL@mail-itl>
References: <20240507110806.1692135-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vwnm9mLjO5513wFX"
Content-Disposition: inline
In-Reply-To: <20240507110806.1692135-1-andrew.cooper3@citrix.com>


--vwnm9mLjO5513wFX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 7 May 2024 13:32:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xl: Open xldevd.log with O_CLOEXEC

On Tue, May 07, 2024 at 12:08:06PM +0100, Andrew Cooper wrote:
> `xl devd` has been observed leaking /var/log/xldevd.log into children.
>=20
> Link: https://github.com/QubesOS/qubes-issues/issues/8292
> Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>=20
> Also entirely speculative based on the QubesOS ticket.
> ---
>  tools/xl/xl_utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
> index 17489d182954..060186db3a59 100644
> --- a/tools/xl/xl_utils.c
> +++ b/tools/xl/xl_utils.c
> @@ -270,7 +270,7 @@ int do_daemonize(const char *name, const char *pidfil=
e)
>          exit(-1);
>      }
> =20
> -    CHK_SYSCALL(logfile =3D open(fullname, O_WRONLY|O_CREAT|O_APPEND, 06=
44));
> +    CHK_SYSCALL(logfile =3D open(fullname, O_WRONLY | O_CREAT | O_APPEND=
 | O_CLOEXEC, 0644));

This one might be not enough, as the FD gets dup2()-ed to stdout/stderr
just outside of the context here, and then inherited by various hotplug
script. Just adding O_CLOEXEC here means the hotplug scripts will run
with stdout/stderr closed. The scripts shipped with Xen do redirect
stderr to a log quite early, but a) it doesn't do it for stdout, and b)
custom hotplug scripts are a valid use case.
Without that, I see at least few potential issues:
- some log messages may be lost (minor, but annoying)
- something might simply fail on writing to a closed FD, breaking the
  hotplug script
- FD 1 will be used as first free FD for any open() or similar call - if
  a tool later tries writing something to stdout, it will gets written
  to that FD - worse of all three

What should be the behavior of hotplug scripts logging? Should they
always take care of their own logging? If so, the hotplug calling part
should redirect stdout/stderr to /dev/null IMO. But if `xl` should
provide some default logging for them (like, the xldevd.log here?), then
the O_CLOEXEC should be set only after duplicating logfile over stdout/err.

>      free(fullname);
>      assert(logfile >=3D 3);
> =20
>=20
> base-commit: ebab808eb1bb8f24c7d0dd41b956e48cb1824b81
> prerequisite-patch-id: 212e50457e9b6bdfd06a97da545a5aa7155bb919

Which one is this? I don't see it in staging, nor in any of your
branches on xenbits. Lore finds "tools/libxs: Open /dev/xen/xenbus fds
as O_CLOEXEC" which I guess is correct, but I have no idea how it
correlates it, as this hash doesn't appear anywhere in the message, nor
its headers...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--vwnm9mLjO5513wFX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmY6ETAACgkQ24/THMrX
1yzRCwgAglPZYtGvsBtnApKrtka1bc81ZR7VRbolYJToBIGc0Mokx281fmyP4zwx
savkunZD/3tQK3cdxExdrsRV7fZvkzMMQDMYGmwlX7cJfukJe3RHsBzPzPWbk/j0
egNZhDfMCbq2fdLujxyPq+bCOBAa+IEVvxYIBmHZI+tq9XnHuzh/xGNBTfZl7+Wy
ZderiPNg7SoZEs8tXai5iausrjCr6AQS0TiwElAHVxTicXhmC3Gu3lw4P0UaWluM
6a3QENmwDTjuJiBXYQsjDtL22przyxS8fqMqVKQH59u/xlzuVXbHSyo9+TIuZ7i2
/diSgmMQHwmRr50TnAuQI7PxlqpdXA==
=D35V
-----END PGP SIGNATURE-----

--vwnm9mLjO5513wFX--

