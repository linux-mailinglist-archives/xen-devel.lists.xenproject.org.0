Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9088C134
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 21:03:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxc1Y-0004Ss-VM; Tue, 13 Aug 2019 19:00:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PT/B=WJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hxc1X-0004Sk-I0
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 18:59:59 +0000
X-Inumbo-ID: 8b84a748-bdfc-11e9-b823-0b8c02d7da31
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b84a748-bdfc-11e9-b823-0b8c02d7da31;
 Tue, 13 Aug 2019 18:59:58 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 07AE021FBC;
 Tue, 13 Aug 2019 14:59:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 13 Aug 2019 14:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=P43JHB
 akaaao/mKNA6dBcQRyM3NG/rAm2SM92B276Sw=; b=SayMdyGC2myBRN7QSkBJ3Q
 Dn5n4mVXHmET8F/qQ9odkuyQb4Ln5c+FWYCxHQMRmn3D/KZo5R3IeYbDfVBoA9BO
 9RjfjVLyQDXDbeuRZf0m4fxqqSpPJ/BnmpgEFbyGKaK4gmc0DphA/x0giePRpm10
 rX/MrPm4SeI/JkdFw+DtWy1g6hAQNEb/ull28KnZcRG9HfQ1k6VhoLTls24KLa15
 TSFu2ZZ4Omrx498CkjOfaSyTm9t/cAwKNCT7TzTU88snEvP2hIH0UweWNsoCWVFw
 Ay+P/QzIClhTXmWg5Gf2FAqqbbT4/ilBHW+5dI3xQiNa60b9CUtJggAZzaj2J3+Q
 ==
X-ME-Sender: <xms:rQhTXa7pTFV3TvKNE5XhVT1ca2VYfUbxD6FZ0wxl5nPbOaHDmPajCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddviedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculddqiedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
 cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
 ucffohhmrghinhepfhhirhhsthdrqddqqdhtohholhhspdigvghntghtrhhlrdhmlhgsne
 cukfhppedukeehrddutdegrddukeegrddukeejnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmnecuve
 hluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:rQhTXWezze6r40wyFGbZImEmanAdYsARODcZPlKT-ZEElZM0ZgHPrg>
 <xmx:rQhTXdHB1bh4XwsjmUVMgCog3Ow4eto7bHr1OBeEPS94JK6qywl8vQ>
 <xmx:rQhTXXQBXreRxLTF2Y6xzwl8WE3UPZ8I-P9soJng9bNBnWgqxaIghA>
 <xmx:rQhTXYWTrxwy5wSTnpF2fb88FNUQ5NzpnOuRYbYkqyrowdzRdG-FCA>
Received: from mail-itl (unknown [185.104.184.187])
 by mail.messagingengine.com (Postfix) with ESMTPA id D56CE380085;
 Tue, 13 Aug 2019 14:59:53 -0400 (EDT)
Date: Tue, 13 Aug 2019 13:59:50 -0500
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190813185950.GC1125@mail-itl>
References: <20190813105352.32412-1-andrew.cooper3@citrix.com>
 <20190813105352.32412-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
In-Reply-To: <20190813105352.32412-3-andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH 2/2] xen: Drop XEN_DOMCTL_{get,
 set}_machine_address_size
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Rob Hoes <Rob.Hoes@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============6953161386366895762=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6953161386366895762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] xen: Drop XEN_DOMCTL_{get,set}_machine_address_size

On Tue, Aug 13, 2019 at 11:53:52AM +0100, Andrew Cooper wrote:
> This functionality is obsolete.  It was introduced by c/s 41296317a31 into
> Xend, but was never exposed in libxl.
>=20
> Nothing limits this to PV guests, but it makes no sense for HVM guests.
>=20
> Looking through the XenServer templates, this was used to work around bug=
s in
> the 32bit RHEL/CentOS 4.7 and 4.8 kernels (fixed in 4.9) and RHEL/CentOS/=
OEL
> 5.2 and 5.3 kernels (fixed in 5.4).  RHEL 4 as a major version went out of
> support in 2017, whereas the 5.2/5.3 kernels went out of support when 5.4=
 was
> released in 2009.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Python part:
Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

Also, I confirm it isn't used in Qubes OS.

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Ian Jackson <Ian.Jackson@citrix.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
>=20
> There may be some resulting simplifications which can be made to the heap
> allocator, but that involves untangling the other address clamping logic
> first.
> ---
>  tools/libxc/include/xenctrl.h       |  6 ------
>  tools/libxc/xc_domain.c             | 29 -----------------------------
>  tools/ocaml/libs/xc/xenctrl.ml      |  5 -----
>  tools/ocaml/libs/xc/xenctrl.mli     |  5 -----
>  tools/ocaml/libs/xc/xenctrl_stubs.c | 26 --------------------------
>  tools/python/xen/lowlevel/xc/xc.c   | 23 -----------------------
>  xen/arch/x86/domctl.c               | 12 ------------
>  xen/include/public/domctl.h         | 11 ++---------
>  xen/xsm/flask/hooks.c               |  2 --
>  xen/xsm/flask/policy/access_vectors |  4 ++--
>  10 files changed, 4 insertions(+), 119 deletions(-)
>=20
> diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
> index a36896034a..c92386aab8 100644
> --- a/tools/libxc/include/xenctrl.h
> +++ b/tools/libxc/include/xenctrl.h
> @@ -1781,12 +1781,6 @@ int xc_domain_unbind_pt_spi_irq(xc_interface *xch,
>                                  uint16_t vspi,
>                                  uint16_t spi);
> =20
> -int xc_domain_set_machine_address_size(xc_interface *xch,
> -				       uint32_t domid,
> -				       unsigned int width);
> -int xc_domain_get_machine_address_size(xc_interface *xch,
> -				       uint32_t domid);
> -
>  /* Set the target domain */
>  int xc_domain_set_target(xc_interface *xch,
>                           uint32_t domid,
> diff --git a/tools/libxc/xc_domain.c b/tools/libxc/xc_domain.c
> index 64ca513aae..e544218d2e 100644
> --- a/tools/libxc/xc_domain.c
> +++ b/tools/libxc/xc_domain.c
> @@ -2161,35 +2161,6 @@ int xc_domain_subscribe_for_suspend(
>      return do_domctl(xch, &domctl);
>  }
> =20
> -int xc_domain_set_machine_address_size(xc_interface *xch,
> -                                       uint32_t domid,
> -                                       unsigned int width)
> -{
> -    DECLARE_DOMCTL;
> -
> -    memset(&domctl, 0, sizeof(domctl));
> -    domctl.domain =3D domid;
> -    domctl.cmd    =3D XEN_DOMCTL_set_machine_address_size;
> -    domctl.u.address_size.size =3D width;
> -
> -    return do_domctl(xch, &domctl);
> -}
> -
> -
> -int xc_domain_get_machine_address_size(xc_interface *xch, uint32_t domid)
> -{
> -    DECLARE_DOMCTL;
> -    int rc;
> -
> -    memset(&domctl, 0, sizeof(domctl));
> -    domctl.domain =3D domid;
> -    domctl.cmd    =3D XEN_DOMCTL_get_machine_address_size;
> -
> -    rc =3D do_domctl(xch, &domctl);
> -
> -    return rc =3D=3D 0 ? domctl.u.address_size.size : rc;
> -}
> -
>  int xc_domain_debug_control(xc_interface *xc, uint32_t domid, uint32_t s=
op, uint32_t vcpu)
>  {
>      DECLARE_DOMCTL;
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl=
=2Eml
> index a57130a3c3..35958b94d5 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -241,11 +241,6 @@ external domain_set_memmap_limit: handle -> domid ->=
 int64 -> unit
>  external domain_memory_increase_reservation: handle -> domid -> int64 ->=
 unit
>         =3D "stub_xc_domain_memory_increase_reservation"
> =20
> -external domain_set_machine_address_size: handle -> domid -> int -> unit
> -       =3D "stub_xc_domain_set_machine_address_size"
> -external domain_get_machine_address_size: handle -> domid -> int
> -       =3D "stub_xc_domain_get_machine_address_size"
> -
>  external domain_cpuid_set: handle -> domid -> (int64 * (int64 option))
>                          -> string option array
>                          -> string option array
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctr=
l.mli
> index 476bbecb90..6c4268d453 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -202,11 +202,6 @@ val pages_to_mib : int64 -> int64
>  external watchdog : handle -> int -> int32 -> int
>    =3D "stub_xc_watchdog"
> =20
> -external domain_set_machine_address_size: handle -> domid -> int -> unit
> -  =3D "stub_xc_domain_set_machine_address_size"
> -external domain_get_machine_address_size: handle -> domid -> int
> -       =3D "stub_xc_domain_get_machine_address_size"
> -
>  external domain_cpuid_set: handle -> domid -> (int64 * (int64 option))
>                          -> string option array
>                          -> string option array
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xe=
nctrl_stubs.c
> index c4fdc58b2d..2e1b29ce33 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -759,32 +759,6 @@ CAMLprim value stub_xc_domain_memory_increase_reserv=
ation(value xch,
>  	CAMLreturn(Val_unit);
>  }
> =20
> -CAMLprim value stub_xc_domain_set_machine_address_size(value xch,
> -						       value domid,
> -						       value width)
> -{
> -	CAMLparam3(xch, domid, width);
> -	uint32_t c_domid =3D _D(domid);
> -	int c_width =3D Int_val(width);
> -
> -	int retval =3D xc_domain_set_machine_address_size(_H(xch), c_domid, c_w=
idth);
> -	if (retval)
> -		failwith_xc(_H(xch));
> -	CAMLreturn(Val_unit);
> -}
> -
> -CAMLprim value stub_xc_domain_get_machine_address_size(value xch,
> -                                                       value domid)
> -{
> -	CAMLparam2(xch, domid);
> -	int retval;
> -
> -	retval =3D xc_domain_get_machine_address_size(_H(xch), _D(domid));
> -	if (retval < 0)
> -		failwith_xc(_H(xch));
> -	CAMLreturn(Val_int(retval));
> -}
> -
>  CAMLprim value stub_xc_domain_cpuid_set(value xch, value domid,
>                                          value input,
>                                          value config)
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index 7e831a26a7..f0430ca85e 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -770,22 +770,6 @@ static PyObject *pyxc_dom_set_cpuid(XcObject *self,
> =20
>      return pyxc_create_cpuid_dict(regs_transform);
>  }
> -
> -static PyObject *pyxc_dom_set_machine_address_size(XcObject *self,
> -						   PyObject *args,
> -						   PyObject *kwds)
> -{
> -    uint32_t dom, width;
> -
> -    if (!PyArg_ParseTuple(args, "ii", &dom, &width))
> -	return NULL;
> -
> -    if (xc_domain_set_machine_address_size(self->xc_handle, dom, width) =
!=3D 0)
> -	return pyxc_error_to_exception(self->xc_handle);
> -
> -    Py_INCREF(zero);
> -    return zero;
> -}
>  #endif /* __i386__ || __x86_64__ */
> =20
>  static PyObject *pyxc_gnttab_hvm_seed(XcObject *self,
> @@ -2413,13 +2397,6 @@ static PyMethodDef pyxc_methods[] =3D {
>        "Set the default cpuid policy for a domain.\n"
>        " dom [int]: Identifier of domain.\n\n"
>        "Returns: [int] 0 on success; exception on error.\n" },
> -
> -    { "domain_set_machine_address_size",
> -      (PyCFunction)pyxc_dom_set_machine_address_size,
> -      METH_VARARGS, "\n"
> -      "Set maximum machine address size for this domain.\n"
> -      " dom [int]: Identifier of domain.\n"
> -      " width [int]: Maximum machine address width.\n" },
>  #endif
> =20
>      { "dom_set_memshr",=20
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 34a6f88b8a..1e98fc8009 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -643,18 +643,6 @@ long arch_do_domctl(
>              ASSERT_UNREACHABLE();
>          break;
> =20
> -    case XEN_DOMCTL_set_machine_address_size:
> -        if ( d->tot_pages > 0 )
> -            ret =3D -EBUSY;
> -        else
> -            d->arch.physaddr_bitsize =3D domctl->u.address_size.size;
> -        break;
> -
> -    case XEN_DOMCTL_get_machine_address_size:
> -        domctl->u.address_size.size =3D d->arch.physaddr_bitsize;
> -        copyback =3D true;
> -        break;
> -
>      case XEN_DOMCTL_sendtrigger:
>      {
>          struct vcpu *v;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 726ce675e8..72d5133cba 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -691,13 +691,6 @@ struct xen_domctl_subscribe {
>      uint32_t port; /* IN */
>  };
> =20
> -/*
> - * Define the maximum machine address size which should be allocated
> - * to a guest.
> - */
> -/* XEN_DOMCTL_set_machine_address_size */
> -/* XEN_DOMCTL_get_machine_address_size */
> -
>  /* XEN_DOMCTL_debug_op */
>  #define XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF         0
>  #define XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON          1
> @@ -1165,8 +1158,8 @@ struct xen_domctl {
>  #define XEN_DOMCTL_unbind_pt_irq                 48
>  #define XEN_DOMCTL_set_cpuid                     49
>  #define XEN_DOMCTL_get_device_group              50
> -#define XEN_DOMCTL_set_machine_address_size      51
> -#define XEN_DOMCTL_get_machine_address_size      52
> +/* #define XEN_DOMCTL_set_machine_address_size   51 - Obsolete */
> +/* #define XEN_DOMCTL_get_machine_address_size   52 - Obsolete */
>  /* #define XEN_DOMCTL_suppress_spurious_page_faults 53 - Obsolete */
>  #define XEN_DOMCTL_debug_op                      54
>  #define XEN_DOMCTL_gethvmcontext_partial         55
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index fd5ec992cf..6800f2d9a0 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -684,11 +684,9 @@ static int flask_domctl(struct domain *d, int cmd)
>          return current_has_perm(d, SECCLASS_HVM, HVM__GETHVMC);
> =20
>      case XEN_DOMCTL_set_address_size:
> -    case XEN_DOMCTL_set_machine_address_size:
>          return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__SETADDRSIZE);
> =20
>      case XEN_DOMCTL_get_address_size:
> -    case XEN_DOMCTL_get_machine_address_size:
>          return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__GETADDRSIZE);
> =20
>      case XEN_DOMCTL_mem_sharing_op:
> diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/a=
ccess_vectors
> index c9ebd0f37e..76f3d60ddd 100644
> --- a/xen/xsm/flask/policy/access_vectors
> +++ b/xen/xsm/flask/policy/access_vectors
> @@ -166,9 +166,9 @@ class domain
>      set_target
>  # SCHEDOP_remote_shutdown
>      shutdown
> -# XEN_DOMCTL_set{,_machine}_address_size
> +# XEN_DOMCTL_set_address_size
>      setaddrsize
> -# XEN_DOMCTL_get{,_machine}_address_size
> +# XEN_DOMCTL_get_address_size
>      getaddrsize
>  # XEN_DOMCTL_sendtrigger
>      trigger

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1TCKUACgkQ24/THMrX
1ywn2Qf/Yndpi4GkLlkhwVIrrrqfX5NpIlCtSjqVP9QI49JIzI7YN7TxcXaUCER9
3FwnR7y8dNbIwKO5y6YPVq6mnEkhES8sQzN4sf67lxQkKyRxLLbLrobVuHuPBDPc
C9hOqL3w5T6kjLzichCNTRtO+eDxHZmPkNMie2S4FxH/N49zfVASHue7ru9AbjHe
cKqFJwNj5MdPMJVK/OLMUkJTBEeeH9pZiro+WLLQAuRTDS7wyIEfU1wEq1tbU2cF
4r8m5ATE3Sir6OGTE3RQMN8W6QAk3Q/BuPVSBT1glucMNFj7uciR5QnyjyC/zwAs
An0ba0puY2fdjvzoK2wTZVDL8LueYw==
=LOp2
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--


--===============6953161386366895762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6953161386366895762==--

