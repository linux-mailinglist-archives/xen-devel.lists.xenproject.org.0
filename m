Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0F68C132
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 21:03:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxc0X-0004Ob-Jb; Tue, 13 Aug 2019 18:58:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PT/B=WJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hxc0V-0004OW-H7
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 18:58:55 +0000
X-Inumbo-ID: 6568dc8c-bdfc-11e9-bde8-b76657426377
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6568dc8c-bdfc-11e9-bde8-b76657426377;
 Tue, 13 Aug 2019 18:58:54 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id F3B6E220CB;
 Tue, 13 Aug 2019 14:58:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 13 Aug 2019 14:58:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HYhUsN
 Au0ppOF1Z3Fv/DVzIhhqepgsqiHSL2es9QvMY=; b=kAWNkxktgbc3oK1xbOD4UJ
 0O/BDLHjkR0vPtMz4znI4akt74uIGhuhh9dB0wFklxKkNebqbOjQaVd3AgHq5jfu
 vw+upbq5npkGV/ePWBnxDdvflN71NAqOeOVium1ZxwPlaaonAFdMEtLc4varKq62
 026jjieDWayvxw/wW0klJz2cRSJoYFFdyH+j7gUhMYABTQ7lKTaxh/GeNbJ//Lvb
 p5znF6ATHV4qgU+SQHIUz0zekGoVafx0OmXiEkg2E9O4B3W1UBzSbBJctf/TV8yV
 PcSulkrxLtiZhafwtjBoNd3JSvA9uzCsDAQ7cHcfWMrJk67B0gk6AquH4OKeB5GA
 ==
X-ME-Sender: <xms:bQhTXS9E7wN7l8J-VYgaENZoS3x2dnfuQ1UFGW358bYEvBM1Qh_6tQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddviedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculddqiedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
 cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
 ucfkphepudekhedruddtgedrudekgedrudekjeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucev
 lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:bQhTXezydD59bjeRsAZtIStWUZKEXlz9O1ohZVO1YRUbgHaIo1rssg>
 <xmx:bQhTXTVsCp1jzrj6YP2ac25kGden-5TjgRdg4iF_GVjHM0MmtBJYMw>
 <xmx:bQhTXZYN8PWOFhCpd4IfyJfgf_eKiJutps4pLz2KckaV7G-1cSZh3g>
 <xmx:bQhTXS2XYNNQVn1svQjcq_R_kDeFcHgkW0dSinA2-N97LuDjKlYH5g>
Received: from mail-itl (unknown [185.104.184.187])
 by mail.messagingengine.com (Postfix) with ESMTPA id 46A2780059;
 Tue, 13 Aug 2019 14:58:48 -0400 (EDT)
Date: Tue, 13 Aug 2019 13:58:45 -0500
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190813185845.GB1125@mail-itl>
References: <20190813105352.32412-1-andrew.cooper3@citrix.com>
 <20190813105352.32412-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
In-Reply-To: <20190813105352.32412-2-andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH 1/2] xen: Drop
 XEN_DOMCTL_suppress_spurious_page_faults
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============8831372063045071535=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8831372063045071535==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] xen: Drop XEN_DOMCTL_suppress_spurious_page_faults

On Tue, Aug 13, 2019 at 11:53:51AM +0100, Andrew Cooper wrote:
> This functionality is obsolete.  It was introduced by c/s 39407bed9c0 into
> Xend, but never exposed in libxl.
>=20
> While not explicitly limited to PV guests, this is PV-only by virtue of i=
ts
> position in the pagefault handler.
>=20
> Looking though the XenServer templates, this was used to work around bugs=
 in
> the 32bit RHEL/CentOS 4.{5..7} kernels (fixed in 4.8).  RHEL 4 as a major
> version when out if support in 2017.
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
> ---
>  tools/libxc/include/xenctrl.h       |  3 ---
>  tools/libxc/xc_domain.c             | 12 ------------
>  tools/python/xen/lowlevel/xc/xc.c   | 22 ----------------------
>  xen/arch/x86/domctl.c               |  4 ----
>  xen/arch/x86/traps.c                | 14 --------------
>  xen/include/asm-x86/domain.h        |  3 ---
>  xen/include/public/domctl.h         |  7 +------
>  xen/xsm/flask/hooks.c               |  1 -
>  xen/xsm/flask/policy/access_vectors |  3 +--
>  9 files changed, 2 insertions(+), 67 deletions(-)
>=20
> diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
> index 0ff6ed9e70..a36896034a 100644
> --- a/tools/libxc/include/xenctrl.h
> +++ b/tools/libxc/include/xenctrl.h
> @@ -1787,9 +1787,6 @@ int xc_domain_set_machine_address_size(xc_interface=
 *xch,
>  int xc_domain_get_machine_address_size(xc_interface *xch,
>  				       uint32_t domid);
> =20
> -int xc_domain_suppress_spurious_page_faults(xc_interface *xch,
> -					  uint32_t domid);
> -
>  /* Set the target domain */
>  int xc_domain_set_target(xc_interface *xch,
>                           uint32_t domid,
> diff --git a/tools/libxc/xc_domain.c b/tools/libxc/xc_domain.c
> index 05d771f2ce..64ca513aae 100644
> --- a/tools/libxc/xc_domain.c
> +++ b/tools/libxc/xc_domain.c
> @@ -2190,18 +2190,6 @@ int xc_domain_get_machine_address_size(xc_interfac=
e *xch, uint32_t domid)
>      return rc =3D=3D 0 ? domctl.u.address_size.size : rc;
>  }
> =20
> -int xc_domain_suppress_spurious_page_faults(xc_interface *xc, uint32_t d=
omid)
> -{
> -    DECLARE_DOMCTL;
> -
> -    memset(&domctl, 0, sizeof(domctl));
> -    domctl.domain =3D domid;
> -    domctl.cmd    =3D XEN_DOMCTL_suppress_spurious_page_faults;
> -
> -    return do_domctl(xc, &domctl);
> -
> -}
> -
>  int xc_domain_debug_control(xc_interface *xc, uint32_t domid, uint32_t s=
op, uint32_t vcpu)
>  {
>      DECLARE_DOMCTL;
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index 188bfa34da..7e831a26a7 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -786,22 +786,6 @@ static PyObject *pyxc_dom_set_machine_address_size(X=
cObject *self,
>      Py_INCREF(zero);
>      return zero;
>  }
> -
> -static PyObject *pyxc_dom_suppress_spurious_page_faults(XcObject *self,
> -						      PyObject *args,
> -						      PyObject *kwds)
> -{
> -    uint32_t dom;
> -
> -    if (!PyArg_ParseTuple(args, "i", &dom))
> -	return NULL;
> -
> -    if (xc_domain_suppress_spurious_page_faults(self->xc_handle, dom) !=
=3D 0)
> -	return pyxc_error_to_exception(self->xc_handle);
> -
> -    Py_INCREF(zero);
> -    return zero;
> -}
>  #endif /* __i386__ || __x86_64__ */
> =20
>  static PyObject *pyxc_gnttab_hvm_seed(XcObject *self,
> @@ -2436,12 +2420,6 @@ static PyMethodDef pyxc_methods[] =3D {
>        "Set maximum machine address size for this domain.\n"
>        " dom [int]: Identifier of domain.\n"
>        " width [int]: Maximum machine address width.\n" },
> -
> -    { "domain_suppress_spurious_page_faults",
> -      (PyCFunction)pyxc_dom_suppress_spurious_page_faults,
> -      METH_VARARGS, "\n"
> -      "Do not propagate spurious page faults to this guest.\n"
> -      " dom [int]: Identifier of domain.\n" },
>  #endif
> =20
>      { "dom_set_memshr",=20
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 2d45e5b8a8..34a6f88b8a 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -988,10 +988,6 @@ long arch_do_domctl(
>          }
>          break;
> =20
> -    case XEN_DOMCTL_suppress_spurious_page_faults:
> -        d->arch.suppress_spurious_page_faults =3D 1;
> -        break;
> -
>  #ifdef CONFIG_HVM
>      case XEN_DOMCTL_debug_op:
>      {
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 23069e25ec..350903add5 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1452,20 +1452,6 @@ void do_page_fault(struct cpu_user_regs *regs)
>                error_code, _p(addr));
>      }
> =20
> -    if ( unlikely(current->domain->arch.suppress_spurious_page_faults) )
> -    {
> -        pf_type =3D spurious_page_fault(addr, regs);
> -        if ( (pf_type =3D=3D smep_fault) || (pf_type =3D=3D smap_fault))
> -        {
> -            printk(XENLOG_G_ERR "%pv fatal SM%cP violation\n",
> -                   current, (pf_type =3D=3D smep_fault) ? 'E' : 'A');
> -
> -            domain_crash(current->domain);
> -        }
> -        if ( pf_type !=3D real_fault )
> -            return;
> -    }
> -
>      if ( unlikely(regs->error_code & PFEC_reserved_bit) )
>          reserved_bit_page_fault(addr, regs);
> =20
> diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
> index 933b85901f..8523c3f5e0 100644
> --- a/xen/include/asm-x86/domain.h
> +++ b/xen/include/asm-x86/domain.h
> @@ -339,9 +339,6 @@ struct arch_domain
>      /* Is shared-info page in 32-bit format? */
>      bool_t has_32bit_shinfo;
> =20
> -    /* Domain cannot handle spurious page faults? */
> -    bool_t suppress_spurious_page_faults;
> -
>      /* Is PHYSDEVOP_eoi to automatically unmask the event channel? */
>      bool_t auto_unmask;
> =20
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 19486d5e32..726ce675e8 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -698,11 +698,6 @@ struct xen_domctl_subscribe {
>  /* XEN_DOMCTL_set_machine_address_size */
>  /* XEN_DOMCTL_get_machine_address_size */
> =20
> -/*
> - * Do not inject spurious page faults into this domain.
> - */
> -/* XEN_DOMCTL_suppress_spurious_page_faults */
> -
>  /* XEN_DOMCTL_debug_op */
>  #define XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF         0
>  #define XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON          1
> @@ -1172,7 +1167,7 @@ struct xen_domctl {
>  #define XEN_DOMCTL_get_device_group              50
>  #define XEN_DOMCTL_set_machine_address_size      51
>  #define XEN_DOMCTL_get_machine_address_size      52
> -#define XEN_DOMCTL_suppress_spurious_page_faults 53
> +/* #define XEN_DOMCTL_suppress_spurious_page_faults 53 - Obsolete */
>  #define XEN_DOMCTL_debug_op                      54
>  #define XEN_DOMCTL_gethvmcontext_partial         55
>  #define XEN_DOMCTL_vm_event_op                   56
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 791c1f66af..fd5ec992cf 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -712,7 +712,6 @@ static int flask_domctl(struct domain *d, int cmd)
> =20
>      case XEN_DOMCTL_subscribe:
>      case XEN_DOMCTL_disable_migrate:
> -    case XEN_DOMCTL_suppress_spurious_page_faults:
>          return current_has_perm(d, SECCLASS_DOMAIN, DOMAIN__SET_MISC_INF=
O);
> =20
>      case XEN_DOMCTL_set_virq_handler:
> diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/a=
ccess_vectors
> index 194d743a71..c9ebd0f37e 100644
> --- a/xen/xsm/flask/policy/access_vectors
> +++ b/xen/xsm/flask/policy/access_vectors
> @@ -176,8 +176,7 @@ class domain
>      getpodtarget
>  # XENMEM_set_pod_target
>      setpodtarget
> -# XEN_DOMCTL_subscribe, XEN_DOMCTL_disable_migrate,
> -# XEN_DOMCTL_suppress_spurious_page_faults
> +# XEN_DOMCTL_subscribe, XEN_DOMCTL_disable_migrate
>      set_misc_info
>  # XEN_DOMCTL_set_virq_handler
>      set_virq_handler

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1TCGQACgkQ24/THMrX
1yyT5wf/fV6UhYI9ORO5j6XgmAMtjL0Fr5xSiIARZSI/OP+0uI0FwxZmkx1ayRZh
07SGqYPyL0d7E3H6tGLsnma/AsOhH2nyyxrgWcpuccxq0jOn7/XaD2buO712QyIi
LdCrxHbrni7QvYsnCC5cLyzg9HLRTg4UeSr5yOBGzJJjiwttrj1m1NTyI7bVFZ+a
QhGC6jYmInvkCmCpQOTDoaUwVbcRgLlSFBR2FB9AWZ8uafvWEUwKVQd2TuvEUYU0
b7OxIw2d3PbG5ZB/nqNbYxfIJvRxl/AjEBCA6vgS273KiDzKYmBi8GtT4m61zI1U
tAIlt1flGdqXlE5pvxK/o1AUB15Vqw==
=rrJb
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--


--===============8831372063045071535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8831372063045071535==--

