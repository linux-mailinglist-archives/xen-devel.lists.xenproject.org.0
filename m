Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PBpDKnja8Gn7aQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 18:04:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958D4488735
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 18:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296497.1572900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHktx-0003gP-VN; Tue, 28 Apr 2026 16:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296497.1572900; Tue, 28 Apr 2026 16:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHktx-0003dr-Rs; Tue, 28 Apr 2026 16:03:09 +0000
Received: by outflank-mailman (input) for mailman id 1296497;
 Tue, 28 Apr 2026 16:03:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd4d45724000f373@swg.vates.tech>)
 id 1wHktv-0003dl-KT
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:03:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHktt-002Inr-T2
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 18:03:05 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd4d45724000f373@swg.vates.tech>)
 id 69f0da33-2eae-0a2a0a5409dd-0a2a45078128-12
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 18:03:05 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dd4d45724000f373@swg.vates.tech>)
 id 69f0da39-229c-0a2a45070019-b9ff1c22af95-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 18:03:05 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dd4d45724000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Apr 2026 16:02:58 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 325B1863A7;
 Tue, 28 Apr 2026 18:02:57 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=12w3LkEq+Kroj056n13Prx1D9hkZQ8hYxXOBZTHQMeo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=RLjcJA4lq3IXqJ2LQqCly7YKYWBphCKQLliTC16pW04/Gz3hhNZ0jRTHX3sNYBoe9z8kJqVjq
 cBBKMCiY5krUpfoTCPozYuBuy27+G2FB0uS9Fz6ZfJjER06yD2H53CP4iyy3oklToeJoM1N1FMb
 cWbqKSLpvr+HwEdO3+YLFeNPwqWatjMXnbYJw9HHaeyW6LLiXKbEyzLdRGlYOSeAYpRogT5Voap
 v5cg/Gy0hU54EGp1LJuSpjMavtGE2cfT9W4t7HMnNLieB4AwRLp1CpU9vV7HvXi2Lx1bMf1Xh7t
 Vvd9/vq8Eug9OraJyRZwkL3TCLMXKus5yez1FQ4rkz9Q==
X-Zone-Loop: ee6846bbdc250569945b10afad823a926ebe30cedc7d
x-campaign-type: default
x-transaction-id: b64b5276-2205-47be-809e-73bc80efa3a5
x-swg-uid: 01-ba4ee1b5-8084-4983-85aa-eb0b3d659da7
X-Mailer: Sweego
Message-ID:
 <1777392179.8631fc262581453bbf619ec5b2062170.19dd4d45724000f373@vates.tech>
x-swg-bid: 1777392179.8631fc262581453bbf619ec5b2062170.19dd4d45724000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 28 Apr 2026 18:02:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] x86/dmop: Add XEN_DMOP_{bind,unbind}_pt_msi_irq DM
 ops
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298081.8631fc262581453bbf619ec5b2062170.19dcf388597000f373@vates.tech>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <1777298081.8631fc262581453bbf619ec5b2062170.19dcf388597000f373@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.114.c353c9af6e1e11b1.19dd4d4510a.1ce65ceed8f475cd=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777392177418
X-purgate-ID: tlsNG-ef75cf/1777392185-AE772C48-5969ADAC/0/0
X-purgate-type: clean
X-purgate-size: 17834
X-Rspamd-Queue-Id: 958D4488735
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	MIME_TRACE(0.00)[0:+,1:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]

---=Part.114.c353c9af6e1e11b1.19dd4d4510a.1ce65ceed8f475cd=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 27/04/2026 =C3=A0 15:57, Julian Vetter a =C3=A9crit=C2=A0:
> Add two DM ops for MSI passthrough IRQs=2E These new DM ops take the raw
> MSI address and data fields rather than pre-decoded gflags values=2E Xen
> decodes the destination ID via msi_addr_to_gflags(), including any
> extended destination bits in address[11:5]=2E This means the device mode=
l
> does not need to understand the extended destination ID encoding, and
> simply forwards the MSI address it observes from the guest=2E
>=20
> With these DM ops in place, redirect xc_domain_update_msi_irq() and
> xc_domain_unbind_msi_irq() in libxenctrl to use
> xendevicemodel_bind_pt_msi_irq() / xendevicemodel_unbind_pt_msi_irq()
> via xch->dmod=2E The gflags/gvec arguments are translated to the raw MSI
> address and data words at the libxc level using the standard x86 MSI
> address format=2E
>=20
> Reject the PT_IRQ_TYPE_MSI sub-case in XEN_DOMCTL_bind_pt_irq and
> XEN_DOMCTL_unbind_pt_irq: all callers now go through the DM op path, so
> the domctl sub-case is fully obsolete=2E
>=20

We probably want to reflect that on XEN_DOMCTL_{un}bind_pt_irq interface=
=20
in domctl=2Eh (e=2Eg through a note saying that PT_IRQ_TYPE_MSI type is no=
w=20
deprecated and unsupported)=2E

> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
> ---
> Changes in v4:
> - Corresponds to v3 patch 5, but with feedback from Jan
> - Redirect xc_domain_{update,unbind}_msi_irq() in libxenctrl to call
>    xendevicemodel_{un}bind_pt_msi_irq() via xch->dmod, translating the
>    existing gflags/gvec arguments to raw MSI address and data in libxc
> - As suggested by Jan, reject the PT_IRQ_TYPE_MSI sub-case in
>    XEN_DOMCTL_{bind,unbind}_pt_irq with -EOPNOTSUPP -> All callers now g=
o
>    through the DM op path, making the domctl sub-case fully obsolete
> - Added the xlat=2Elst entry for dm_op_unbind_pt_msi_irq (v3 added only =
the
>    bind entry)
> ---
>   tools/include/xendevicemodel=2Eh    | 31 ++++++++++++++
>   tools/libs/ctrl/xc_domain=2Ec       | 52 +++++++++++------------
>   tools/libs/devicemodel/core=2Ec     | 38 +++++++++++++++++
>   xen/arch/x86/domctl=2Ec             | 10 ++++-
>   xen/arch/x86/hvm/dm=2Ec             | 68 +++++++++++++++++++++++++++++=
++
>   xen/drivers/passthrough/x86/hvm=2Ec |  1 -
>   xen/include/public/hvm/dm_op=2Eh    | 37 +++++++++++++++++
>   xen/include/xlat=2Elst              |  2 +
>   8 files changed, 208 insertions(+), 31 deletions(-)
>=20
> diff --git a/tools/include/xendevicemodel=2Eh b/tools/include/xendevicem=
odel=2Eh
> index 227e7fd810=2E=2Ef15b35fa33 100644
> --- a/tools/include/xendevicemodel=2Eh
> +++ b/tools/include/xendevicemodel=2Eh
> @@ -375,6 +375,37 @@ int xendevicemodel_nr_vcpus(
>    */
>   int xendevicemodel_restrict(xendevicemodel_handle *dmod, domid_t domid=
);
>  =20
> +/**
> + * This function binds a passthrough physical IRQ to a guest MSI vector
> + * using raw MSI address/data fields=2E Unlike XEN_DOMCTL_bind_pt_irq,
> + * this interface supports extended (15-bit) destination IDs by having
> + * Xen decode the MSI address internally=2E
> + *

"unlike XEN_DOMCTL_bind_pt_irq" feels a bit odd since that's not a=20
supported interface anymore for MSI=2E

> + * @parm dmod a handle to an open devicemodel interface=2E
> + * @parm domid the domain id to be serviced=2E
> + * @parm machine_irq the physical IRQ number (pirq)=2E
> + * @parm msi_addr the MSI address (includes ext=2E dest=2E ID bits [11:=
5])=2E
> + * @parm msi_data the MSI data word (bits [7:0] are the guest vector)=
=2E
> + * @parm gtable the MSI-X table base GFN, or 0 for plain MSI=2E
> + * @parm unmasked if non-zero, leave the IRQ unmasked after binding=2E
> + * @return 0 on success, -1 on failure=2E
> + */
> +int xendevicemodel_bind_pt_msi_irq(
> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq,
> +    uint64_t msi_addr, uint32_t msi_data, uint64_t gtable, int unmasked=
);
> +
> +/**
> + * This function unbinds a passthrough physical IRQ previously bound
> + * with xendevicemodel_bind_pt_msi_irq=2E
> + *
> + * @parm dmod a handle to an open devicemodel interface=2E
> + * @parm domid the domain id to be serviced=2E
> + * @parm machine_irq the physical IRQ number (pirq)=2E
> + * @return 0 on success, -1 on failure=2E
> + */
> +int xendevicemodel_unbind_pt_msi_irq(
> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq);
> +
>   #endif /* XENDEVICEMODEL_H */
>  =20
>   /*
> diff --git a/tools/libs/ctrl/xc_domain=2Ec b/tools/libs/ctrl/xc_domain=
=2Ec
> index 01c0669c88=2E=2E7e3b7a0dc6 100644
> --- a/tools/libs/ctrl/xc_domain=2Ec
> +++ b/tools/libs/ctrl/xc_domain=2Ec
> @@ -1677,6 +1677,21 @@ int xc_deassign_dt_device(
>  =20
>  =20
>  =20
> +static void xc_msi_gflags_to_addr_data(uint32_t gvec, uint32_t gflags,
> +                                        uint64_t *msi_addr, uint32_t *m=
si_data)
> +{
> +    *msi_addr =3D 0xfee00000U |
> +        ((uint64_t)((gflags & XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) << 12))=
 |
> +        (gflags & XEN_DOMCTL_VMSI_X86_RH_MASK ? (1U << 3) : 0) |
> +        (gflags & XEN_DOMCTL_VMSI_X86_DM_MASK ? (1U << 2) : 0);
> +
> +    *msi_data =3D (gvec & 0xff) |
> +        (uint32_t)(((gflags & XEN_DOMCTL_VMSI_X86_DELIV_MASK) >>
> +                    (/* shift of XEN_DOMCTL_VMSI_X86_DELIV_MASK */ 12 -
> +                     /* MSI data delivery shift */ 8))) |
> +        (gflags & XEN_DOMCTL_VMSI_X86_TRIG_MASK ? (1U << 15) : 0);
> +}
> +
>   int xc_domain_update_msi_irq(
>       xc_interface *xch,
>       uint32_t domid,
> @@ -1685,22 +1700,15 @@ int xc_domain_update_msi_irq(
>       uint32_t gflags,
>       uint64_t gtable)
>   {
> -    int rc;
> -    struct xen_domctl_bind_pt_irq *bind;
> -    struct xen_domctl domctl =3D {};
> -
> -    domctl=2Ecmd =3D XEN_DOMCTL_bind_pt_irq;
> -    domctl=2Edomain =3D domid;
> +    uint64_t msi_addr;
> +    uint32_t msi_data;
> +    int unmasked =3D !!(gflags & XEN_DOMCTL_VMSI_X86_UNMASKED);
>  =20
> -    bind =3D &(domctl=2Eu=2Ebind_pt_irq);
> -    bind->irq_type =3D PT_IRQ_TYPE_MSI;
> -    bind->machine_irq =3D pirq;
> -    bind->u=2Emsi=2Egvec =3D gvec;
> -    bind->u=2Emsi=2Egflags =3D gflags;
> -    bind->u=2Emsi=2Egtable =3D gtable;
> +    xc_msi_gflags_to_addr_data(gvec, gflags, &msi_addr, &msi_data);
>  =20
> -    rc =3D do_domctl(xch, &domctl);
> -    return rc;
> +    return xendevicemodel_bind_pt_msi_irq(xch->dmod, domid, pirq,
> +                                          msi_addr, msi_data, gtable,
> +                                          unmasked);
>   }
>  =20
>   int xc_domain_unbind_msi_irq(
> @@ -1710,21 +1718,7 @@ int xc_domain_unbind_msi_irq(
>       uint32_t pirq,
>       uint32_t gflags)
>   {
> -    int rc;
> -    struct xen_domctl_bind_pt_irq *bind;
> -    struct xen_domctl domctl =3D {};
> -
> -    domctl=2Ecmd =3D XEN_DOMCTL_unbind_pt_irq;
> -    domctl=2Edomain =3D domid;
> -
> -    bind =3D &(domctl=2Eu=2Ebind_pt_irq);
> -    bind->irq_type =3D PT_IRQ_TYPE_MSI;
> -    bind->machine_irq =3D pirq;
> -    bind->u=2Emsi=2Egvec =3D gvec;
> -    bind->u=2Emsi=2Egflags =3D gflags;
> -
> -    rc =3D do_domctl(xch, &domctl);
> -    return rc;
> +    return xendevicemodel_unbind_pt_msi_irq(xch->dmod, domid, pirq);
>   }
>  =20
>   /* Pass-through: binds machine irq to guests irq */
> diff --git a/tools/libs/devicemodel/core=2Ec b/tools/libs/devicemodel/co=
re=2Ec
> index 8e619eeb0a=2E=2Eadf2c41a96 100644
> --- a/tools/libs/devicemodel/core=2Ec
> +++ b/tools/libs/devicemodel/core=2Ec
> @@ -645,6 +645,44 @@ int xendevicemodel_nr_vcpus(
>       return 0;
>   }
>  =20
> +int xendevicemodel_bind_pt_msi_irq(
> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq,
> +    uint64_t msi_addr, uint32_t msi_data, uint64_t gtable, int unmasked=
)
> +{
> +    struct xen_dm_op op;
> +    struct xen_dm_op_bind_pt_msi_irq *data;
> +
> +    memset(&op, 0, sizeof(op));
> +
> +    op=2Eop =3D XEN_DMOP_bind_pt_msi_irq;
> +    data =3D &op=2Eu=2Ebind_pt_msi_irq;
> +
> +    data->machine_irq =3D machine_irq;
> +    data->data =3D msi_data;
> +    data->addr =3D msi_addr;
> +    data->gtable =3D gtable;
> +    if ( unmasked )
> +        data->flags |=3D XEN_DMOP_MSI_FLAG_UNMASKED;
> +
> +    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
> +}
> +
> +int xendevicemodel_unbind_pt_msi_irq(
> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq)
> +{
> +    struct xen_dm_op op;
> +    struct xen_dm_op_unbind_pt_msi_irq *data;
> +
> +    memset(&op, 0, sizeof(op));
> +
> +    op=2Eop =3D XEN_DMOP_unbind_pt_msi_irq;
> +    data =3D &op=2Eu=2Eunbind_pt_msi_irq;
> +
> +    data->machine_irq =3D machine_irq;
> +
> +    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
> +}
> +

I think we want to mark=20
xc_domain_update_msi_irq/xc_domain_unbind_msi_irq as deprecated since we=
=20
implemented a newer (better) version of it in xendevicemodel; and the=20
old one is now a wrapper=2E

>   int xendevicemodel_restrict(xendevicemodel_handle *dmod, domid_t domid=
)
>   {
>       return osdep_xendevicemodel_restrict(dmod, domid);
> diff --git a/xen/arch/x86/domctl=2Ec b/xen/arch/x86/domctl=2Ec
> index bfbc35c08b=2E=2Ed80a33fe40 100644
> --- a/xen/arch/x86/domctl=2Ec
> +++ b/xen/arch/x86/domctl=2Ec
> @@ -574,6 +574,14 @@ long arch_do_domctl(
>           if ( !is_hvm_domain(d) )
>               break;
>  =20
> +        /*
> +         * PT_IRQ_TYPE_MSI is obsoleted by XEN_DMOP_bind_pt_msi_irq, wh=
ich
> +         * passes raw MSI address/data so Xen can decode extended desti=
nation
> +         * ID bits=2E Device models must use the DM op path instead=2E
> +         */
> +        if ( bind->irq_type =3D=3D PT_IRQ_TYPE_MSI )
> +            break;
> +
>           ret =3D xsm_bind_pt_irq(XSM_HOOK, d, bind);
>           if ( ret )
>               break;
> @@ -602,7 +610,7 @@ long arch_do_domctl(
>           int irq =3D domain_pirq_to_irq(d, bind->machine_irq);
>  =20
>           ret =3D -EINVAL;
> -        if ( !is_hvm_domain(d) )
> +        if ( !is_hvm_domain(d) || bind->irq_type =3D=3D PT_IRQ_TYPE_MSI=
 )
>               break;
>  =20
>           ret =3D -EPERM;
> diff --git a/xen/arch/x86/hvm/dm=2Ec b/xen/arch/x86/hvm/dm=2Ec
> index 3b53471af0=2E=2Eac70cb6405 100644
> --- a/xen/arch/x86/hvm/dm=2Ec
> +++ b/xen/arch/x86/hvm/dm=2Ec
> @@ -7,6 +7,8 @@
>   #include <xen/guest_access=2Eh>
>   #include <xen/dm=2Eh>
>   #include <xen/hypercall=2Eh>
> +#include <xen/iocap=2Eh>
> +#include <xen/iommu=2Eh>
>   #include <xen/ioreq=2Eh>
>   #include <xen/nospec=2Eh>
>   #include <xen/sched=2Eh>
> @@ -350,6 +352,8 @@ int dm_op(const struct dmop_args *op_args)
>           [XEN_DMOP_relocate_memory]                  =3D sizeof(struct =
xen_dm_op_relocate_memory),
>           [XEN_DMOP_pin_memory_cacheattr]             =3D sizeof(struct =
xen_dm_op_pin_memory_cacheattr),
>           [XEN_DMOP_nr_vcpus]                         =3D sizeof(struct =
xen_dm_op_nr_vcpus),
> +        [XEN_DMOP_bind_pt_msi_irq]                  =3D sizeof(struct x=
en_dm_op_bind_pt_msi_irq),
> +        [XEN_DMOP_unbind_pt_msi_irq]                =3D sizeof(struct x=
en_dm_op_unbind_pt_msi_irq),
>       };
>  =20
>       rc =3D rcu_lock_remote_domain_by_id(op_args->domid, &d);
> @@ -607,6 +611,68 @@ int dm_op(const struct dmop_args *op_args)
>           break;
>       }
>  =20
> +    case XEN_DMOP_bind_pt_msi_irq:
> +    {
> +        const struct xen_dm_op_bind_pt_msi_irq *data =3D
> +            &op=2Eu=2Ebind_pt_msi_irq;
> +        int irq;
> +
> +        rc =3D -EINVAL;
> +        if ( data->pad || (data->flags & ~XEN_DMOP_MSI_FLAG_UNMASKED) )
> +            break;
> +
> +        irq =3D domain_pirq_to_irq(d, data->machine_irq);
> +
> +        rc =3D -EPERM;
> +        if ( irq <=3D 0 || !irq_access_permitted(current->domain, irq) =
)
> +            break;
> +
> +        rc =3D -ESRCH;
> +        if ( is_iommu_enabled(d) )
> +        {
> +            read_lock(&d->pci_lock);
> +            rc =3D pt_irq_bind_msi(d, data->machine_irq, data->addr, da=
ta->data,
> +                                 data->gtable,
> +                                 !!(data->flags & XEN_DMOP_MSI_FLAG_UNM=
ASKED));
> +            read_unlock(&d->pci_lock);
> +        }
> +        if ( rc < 0 )
> +            printk(XENLOG_G_ERR
> +                   "XEN_DMOP_bind_pt_msi_irq: pt_irq_bind_msi failed (%=
ld) for %pd\n",
> +                   rc, d);
> +        break;
> +    }
> +
> +    case XEN_DMOP_unbind_pt_msi_irq:
> +    {
> +        const struct xen_dm_op_unbind_pt_msi_irq *data =3D
> +            &op=2Eu=2Eunbind_pt_msi_irq;
> +        struct xen_domctl_bind_pt_irq bind =3D {
> +            =2Emachine_irq =3D data->machine_irq,
> +            =2Eirq_type =3D PT_IRQ_TYPE_MSI,
> +        };
> +        int irq;
> +
> +        irq =3D domain_pirq_to_irq(d, bind=2Emachine_irq);
> +
> +        rc =3D -EPERM;
> +        if ( irq <=3D 0 || !irq_access_permitted(current->domain, irq) =
)
> +            break;
> +
> +        rc =3D -ESRCH;
> +        if ( is_iommu_enabled(d) )
> +        {
> +            read_lock(&d->pci_lock);
> +            rc =3D pt_irq_destroy_bind(d, &bind);
> +            read_unlock(&d->pci_lock);
> +        }
> +        if ( rc < 0 )
> +            printk(XENLOG_G_ERR
> +                   "XEN_DMOP_unbind_pt_msi_irq: pt_irq_destroy_bind fai=
led (%ld) for %pd\n",
> +                   rc, d);
> +        break;
> +    }
> +
>       default:
>           rc =3D ioreq_server_dm_op(&op, d, &const_op);
>           break;
> @@ -643,6 +709,8 @@ CHECK_dm_op_remote_shutdown;
>   CHECK_dm_op_relocate_memory;
>   CHECK_dm_op_pin_memory_cacheattr;
>   CHECK_dm_op_nr_vcpus;
> +CHECK_dm_op_bind_pt_msi_irq;
> +CHECK_dm_op_unbind_pt_msi_irq;
>  =20
>   int compat_dm_op(
>       domid_t domid, unsigned int nr_bufs, XEN_GUEST_HANDLE_PARAM(void) =
bufs)
> diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrou=
gh/x86/hvm=2Ec
> index 026534530f=2E=2E6fb4f8b7dc 100644
> --- a/xen/drivers/passthrough/x86/hvm=2Ec
> +++ b/xen/drivers/passthrough/x86/hvm=2Ec
> @@ -21,7 +21,6 @@
>   #include <xen/event=2Eh>
>   #include <xen/iommu=2Eh>
>   #include <xen/cpu=2Eh>
> -#include <xen/ioreq=2Eh>
>   #include <xen/irq=2Eh>
>   #include <asm/hvm/irq=2Eh>
>   #include <asm/io_apic=2Eh>
> diff --git a/xen/include/public/hvm/dm_op=2Eh b/xen/include/public/hvm/d=
m_op=2Eh
> index 2bf0fdc1ae=2E=2E43571b7713 100644
> --- a/xen/include/public/hvm/dm_op=2Eh
> +++ b/xen/include/public/hvm/dm_op=2Eh
> @@ -444,6 +444,41 @@ struct xen_dm_op_nr_vcpus {
>   };
>   typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>  =20
> +#define XEN_DMOP_bind_pt_msi_irq   21
> +#define XEN_DMOP_unbind_pt_msi_irq 22
> +
> +struct xen_dm_op_bind_pt_msi_irq {
> +    /* IN - physical IRQ (pirq) */
> +    uint32_t machine_irq;
> +    /* IN - MSI data word (bits [7:0] are the guest vector) */
> +    uint32_t data;
> +    /* IN - flags */
> +    uint32_t flags;
> +#define XEN_DMOP_MSI_FLAG_UNMASKED (1u << 0)
> +    uint32_t pad;
> +    /* IN - MSI address (includes extended destination ID in bits [11:5=
]) */
> +    uint64_aligned_t addr;
> +    /* IN - MSI-X table base GFN, 0 for plain MSI */
> +    uint64_aligned_t gtable;
> +};
> +
> +typedef struct xen_dm_op_bind_pt_msi_irq xen_dm_op_bind_pt_msi_irq_t;
> +
> +struct xen_dm_op_unbind_pt_msi_irq {
> +    /* IN - physical IRQ (pirq) */
> +    uint32_t machine_irq;
> +};
> +typedef struct xen_dm_op_unbind_pt_msi_irq xen_dm_op_unbind_pt_msi_irq_=
t;
> +
> +/*
> + * XEN_DMOP_enable_ext_dest_id: Signal to Xen that this device model wi=
ll use
> + * XEN_DMOP_bind_pt_msi_irq for all passthrough MSI bindings, passing r=
aw MSI
> + * address/data fields=2E Once called, Xen will advertise
> + * XEN_HVM_CPUID_EXT_DEST_ID to the guest=2E Must be called before the =
guest
> + * starts=2E
> + */
> +#define XEN_DMOP_enable_ext_dest_id 23
> +
>   struct xen_dm_op {
>       uint32_t op;
>       uint32_t pad;
> @@ -468,6 +503,8 @@ struct xen_dm_op {
>           xen_dm_op_relocate_memory_t relocate_memory;
>           xen_dm_op_pin_memory_cacheattr_t pin_memory_cacheattr;
>           xen_dm_op_nr_vcpus_t nr_vcpus;
> +        xen_dm_op_bind_pt_msi_irq_t bind_pt_msi_irq;
> +        xen_dm_op_unbind_pt_msi_irq_t unbind_pt_msi_irq;
>       } u;
>   };
>  =20
> diff --git a/xen/include/xlat=2Elst b/xen/include/xlat=2Elst
> index 9d08dcc4bb=2E=2E6dc5f5796a 100644
> --- a/xen/include/xlat=2Elst
> +++ b/xen/include/xlat=2Elst
> @@ -98,6 +98,7 @@
>   ?	grant_entry_v2			grant_table=2Eh
>  =20
>   !	dm_op_buf			hvm/dm_op=2Eh
> +?	dm_op_bind_pt_msi_irq		hvm/dm_op=2Eh
>   ?	dm_op_create_ioreq_server	hvm/dm_op=2Eh
>   ?	dm_op_destroy_ioreq_server	hvm/dm_op=2Eh
>   ?	dm_op_get_ioreq_server_info	hvm/dm_op=2Eh
> @@ -116,6 +117,7 @@
>   ?	dm_op_set_pci_intx_level	hvm/dm_op=2Eh
>   ?	dm_op_set_pci_link_route	hvm/dm_op=2Eh
>   ?	dm_op_track_dirty_vram		hvm/dm_op=2Eh
> +?	dm_op_unbind_pt_msi_irq		hvm/dm_op=2Eh
>  =20
>   !	hvm_altp2m_set_mem_access_multi	hvm/hvm_op=2Eh
>  =20



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.114.c353c9af6e1e11b1.19dd4d4510a.1ce65ceed8f475cd=---

