Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE907107BB
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 10:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539395.840211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26Va-0007UI-9F; Thu, 25 May 2023 08:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539395.840211; Thu, 25 May 2023 08:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26Va-0007RH-5I; Thu, 25 May 2023 08:39:42 +0000
Received: by outflank-mailman (input) for mailman id 539395;
 Thu, 25 May 2023 08:39:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+adF=BO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1q26VY-0007RB-7a
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 08:39:40 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac5a6183-fad7-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 10:39:34 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 461C73200A48;
 Thu, 25 May 2023 04:39:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 25 May 2023 04:39:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 May 2023 04:39:29 -0400 (EDT)
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
X-Inumbo-ID: ac5a6183-fad7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1685003972; x=1685090372; bh=fJPOoxz9d4rewdetMuVslRJGP7SrQ2uzfRc
	G+ZHKW7E=; b=Di57kEOJH9BF5Zyu87ZaXM8VpHjXtYMzpROV/L89VssjWOxOY81
	7cxzUC3Pqx+VmJhtQMqK+RNs0lTkpxjwwf0N8/E6qb/xSt21/uRIi0h6NAduprSD
	+MfXWON3G8zd4I7SHDKMZcqe0YicR0FE7VM5vSIVyFPc6Z+SZ26+XiXP3wWQk+qg
	CdZYRY0zg+tj5E926LRWzMIoAB5CiiXbqUrcgpFeTZogVgAd7CKqVzpY0wXLm2WA
	PiH+lkKhFmshnQkjbSC5F7Q7dcxorc1NtUOrOxZ6xT764lpwycWgwvS41k+hc5RA
	kQ5UWyCfABXNAPhPP0Zo+vyI28loS+/OxZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685003972; x=1685090372; bh=fJPOoxz9d4rew
	detMuVslRJGP7SrQ2uzfRcG+ZHKW7E=; b=U7ZLi7XvP35O24LCoycAGNE3ou5YH
	vb6rGxPIaQzyGz3KUFGjbsz3+qJ64pKG2uTcxAwt+vpr74rZsLNRn0KX9EM04M5p
	2QY5yBb+9zCLYrY/shc4lytz3AnL335JAVO4VQQQKHKDWsl/EFCsm2mjGxZl6bJE
	6kQ6D808GVNLmMp0HQlB4okmiZYv8O/XMdIpnMmDxfxiHetiudmQoz8lRsJJhizF
	W4Lf1+6dT/sQNhuV12gNhYHC+MT7anbZDv4bK2c7w+52KaKz3Zm4FfetMMzLgN+Q
	sKIvUEkBJgSroqmMOqPJ7phuKKZ0Wd4JU4idv5q+1TQ8AEhKPHflOyARw==
X-ME-Sender: <xms:xB5vZBZQjoHsShmONSMFlTNTKHnRO72KvjF-JQP6-sgQ7H_BJs_u_Q>
    <xme:xB5vZIb5yTUXVpkWSyQSddbRd25t7DmTbPniLNiErZggBZavA2KcL1qw220QW8HSA
    -7pvDLRM9DUwQ>
X-ME-Received: <xmr:xB5vZD_6FZCemiDBj-AnFvYLONygrSHNlmWxgDuEWoCNlzmg_xGo7PQAzZh_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejjedgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:xB5vZPqSJ7EHDubZ9Ey86c8ANFXkTaYmDuG1A0qy_CXJLQOuv407ew>
    <xmx:xB5vZMr0oYKt7PUCzgvMDmFwvahKMpIpABs-nUG2uys3uI2C5FUErA>
    <xmx:xB5vZFRSAXhL1HHnrkErv9yAXUpKa9-FH6WXZTCL8aLcm03lemxROA>
    <xmx:xB5vZD1mj8BTLzwIMTiSPxLiHkf3IWcVxTH8LEdsUvc3M7ZOa1MaUQ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 25 May 2023 10:39:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
	wei.chen@arm.com, George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: Re: [PATCH v7 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Message-ID: <ZG8evxN0mF8NDTPS@mail-itl>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-10-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5vUbqozINaCJ3g6D"
Content-Disposition: inline
In-Reply-To: <20230523074326.3035745-10-luca.fancellu@arm.com>


--5vUbqozINaCJ3g6D
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 May 2023 10:39:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
	wei.chen@arm.com, George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: Re: [PATCH v7 09/12] tools: add physinfo arch_capabilities handling
 for Arm

On Tue, May 23, 2023 at 08:43:23AM +0100, Luca Fancellu wrote:
> On Arm, the SVE vector length is encoded in arch_capabilities field
> of struct xen_sysctl_physinfo, make use of this field in the tools
> when building for arm.
>=20
> Create header arm-arch-capabilities.h to handle the arch_capabilities
> field of physinfo for Arm.
>=20
> Removed include for xen-tools/common-macros.h in
> python/xen/lowlevel/xc/xc.c because it is already included by the
> arm-arch-capabilities.h header.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Acked-by: George Dunlap <george.dunlap@citrix.com>
> Acked-by: Christian Lindig <christian.lindig@cloud.com>
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> Changes from v6:
>  - Fix licence header in arm-atch-capabilities.h, add R-by (Anthony)
> Changes from v5:
>  - no changes
> Changes from v4:
>  - Move arm-arch-capabilities.h into xen-tools/, add LIBXL_HAVE_,
>    fixed python return type to I instead of i. (Anthony)
> Changes from v3:
>  - add Ack-by for the Golang bits (George)
>  - add Ack-by for the OCaml tools (Christian)
>  - now xen-tools/libs.h is named xen-tools/common-macros.h
>  - changed commit message to explain why the header modification
>    in python/xen/lowlevel/xc/xc.c
> Changes from v2:
>  - rename arm_arch_capabilities.h in arm-arch-capabilities.h, use
>    MASK_EXTR.
>  - Now arm-arch-capabilities.h needs MASK_EXTR macro, but it is
>    defined in libxl_internal.h, it doesn't feel right to include
>    that header so move MASK_EXTR into xen-tools/libs.h that is also
>    included in libxl_internal.h
> Changes from v1:
>  - now SVE VL is encoded in arch_capabilities on Arm
> Changes from RFC:
>  - new patch
> ---
>  tools/golang/xenlight/helpers.gen.go          |  2 ++
>  tools/golang/xenlight/types.gen.go            |  1 +
>  tools/include/libxl.h                         |  6 ++++
>  .../include/xen-tools/arm-arch-capabilities.h | 28 +++++++++++++++++++
>  tools/include/xen-tools/common-macros.h       |  2 ++
>  tools/libs/light/libxl.c                      |  1 +
>  tools/libs/light/libxl_internal.h             |  1 -
>  tools/libs/light/libxl_types.idl              |  1 +
>  tools/ocaml/libs/xc/xenctrl.ml                |  4 +--
>  tools/ocaml/libs/xc/xenctrl.mli               |  4 +--
>  tools/ocaml/libs/xc/xenctrl_stubs.c           |  8 ++++--
>  tools/python/xen/lowlevel/xc/xc.c             |  8 ++++--
>  tools/xl/xl_info.c                            |  8 ++++++
>  13 files changed, 62 insertions(+), 12 deletions(-)
>  create mode 100644 tools/include/xen-tools/arm-arch-capabilities.h
>=20

(...)

> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index 9728b34185ac..b3699fdac58e 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -22,6 +22,7 @@
>  #include <xen/hvm/hvm_info_table.h>
>  #include <xen/hvm/params.h>
> =20
> +#include <xen-tools/arm-arch-capabilities.h>
>  #include <xen-tools/common-macros.h>
> =20
>  /* Needed for Python versions earlier than 2.3. */
> @@ -897,7 +898,7 @@ static PyObject *pyxc_physinfo(XcObject *self)
>      if ( p !=3D virt_caps )
>        *(p-1) =3D '\0';
> =20
> -    return Py_BuildValue("{s:i,s:i,s:i,s:i,s:l,s:l,s:l,s:i,s:s,s:s}",
> +    return Py_BuildValue("{s:i,s:i,s:i,s:i,s:l,s:l,s:l,s:i,s:s,s:s,s:I}",
>                              "nr_nodes",         pinfo.nr_nodes,
>                              "threads_per_core", pinfo.threads_per_core,
>                              "cores_per_socket", pinfo.cores_per_socket,
> @@ -907,7 +908,10 @@ static PyObject *pyxc_physinfo(XcObject *self)
>                              "scrub_memory",     pages_to_kib(pinfo.scrub=
_pages),
>                              "cpu_khz",          pinfo.cpu_khz,
>                              "hw_caps",          cpu_cap,
> -                            "virt_caps",        virt_caps);
> +                            "virt_caps",        virt_caps,
> +                            "arm_sve_vl",
> +                              arch_capabilities_arm_sve(pinfo.arch_capab=
ilities)
> +                        );

This should be added only when building for ARM, similar as for other
bindings.

>  }
> =20
>  static PyObject *pyxc_getcpuinfo(XcObject *self, PyObject *args, PyObjec=
t *kwds)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--5vUbqozINaCJ3g6D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRvHr8ACgkQ24/THMrX
1yw72QgAi3Ytlx2NiTs7zaLyrl/JEgTJbX7368gg/O/lS1Dv0lwFY7dH9D6Hbu7o
5BjOlIi/KTR1EWu02IvkJmEEt0yWJPQ4ypOmZNO6KP+z5fJaqSNfB/1im9KkS9T9
zuzreX13JCoJEnHXfc6CiP1TY3VEmZA8HjKAwJ+apuU6I3XBVautTAqLw6gTjW8V
9KMYFWXnng2OSUKTI5ILf0ktMRG2jiIDJSH/yHLAsIXrlchk+jxYcqyRnO5lePRx
FzvClVP7pj8RunkjwkcHvLP9q7FtjyEyaKasLC5InRVm2P6U/gVxpyiFNwxvdCeJ
td3gLSpKwIYLtUNAJvjXh8CvVKNQOw==
=SgUV
-----END PGP SIGNATURE-----

--5vUbqozINaCJ3g6D--

