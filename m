Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ALetHKNFNWpkqwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:35:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C51426A620A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:35:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=QbPnYJmf;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1342336.1602568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waZNE-0006Id-Cw; Fri, 19 Jun 2026 13:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342336.1602568; Fri, 19 Jun 2026 13:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waZNE-0006Gs-AL; Fri, 19 Jun 2026 13:35:08 +0000
Received: by outflank-mailman (input) for mailman id 1342336;
 Fri, 19 Jun 2026 13:35:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ee01787db000701b@swg.vates.tech>)
 id 1waZNB-0006Gm-QS
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:35:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waZNB-002w5C-3E
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:35:05 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ee01787db000701b@swg.vates.tech>)
 id 6a354581-e002-0a2a0a5209dd-0a2a45029812-28
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:35:04 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ee01787db000701b@swg.vates.tech>)
 id 6a354588-fdf1-0a2a45020019-b9ff1c12b571-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:35:04 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ee01787db000701b.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 19 Jun 2026 13:34:59 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 508B98607F;
 Fri, 19 Jun 2026 15:34:58 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=NPhSHPWZjW1pMC4iH3e0ur8vBOjVx+837mvYoCHj4EU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=QbPnYJmfGZ4FNo5vXClEbADvoskSU5iTcqHi6a4QGTLuR79uMXpMiCUqVkA9tHVjC/Vbmpg/N
 5LfoDwlg0idWevFMgciGKzAdQR7NT7vUTF2Y3bjD9xNUwxCJ82uDsIww5qPs6wyTQ24n8NzSnlU
 aqWOGd92x8EC2pdouuVm2nOg3hx3DlsAZcpTCOJRSdy+hDCFeekz9ffECqdgax+7xHrCroFSd4B
 wHHxM8jCi98UJOwtwVkN+IY0Jx+bYXed/t27a0cJqogmORMmjtCQ63kMD2gLKgwkGNq+uh/NQmo
 FVCTAfl7UJg3DCDsXrR1Pid2V3/lGFIcuIV0jkbuLAMQ==
X-Zone-Loop: f112c002c8be2142dae769208e74fdf4a2fdabe05cfc
x-campaign-type: default
x-transaction-id: a8d13983-c03f-411a-b0d2-ef0e3b548ac1
x-swg-uid: 01-8c06583d-0347-4eb4-b609-8bf25465d002
X-Mailer: Sweego
Message-ID:
 <1781876099.8631fc262581453bbf619ec5b2062170.19ee01787db000701b@vates.tech>
x-swg-bid: 1781876099.8631fc262581453bbf619ec5b2062170.19ee01787db000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 19 Jun 2026 15:34:58 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Alexey Gerasimenko <x1917x@gmail.com>
Subject: Re: [PATCH 12/17] libxl: Q35 support (new option
 device_model_machine)
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-13-thierry.escande@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313163455.790692-13-thierry.escande@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.77e.e40f7946aacc6f47.19ee0178576.982acf75126d056d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781876098422
X-purgate-ID: tlsNG-720697/1781876104-4D8683F3-68E26E64/0/0
X-purgate-type: clean
X-purgate-size: 5964
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:x1917x@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C51426A620A

---=Part.77e.e40f7946aacc6f47.19ee0178576.982acf75126d056d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 04:35:04PM +0000, Thierry Escande wrote:
> Provide a new domain config option to select the emulated machine type,
> device_model_machine=2E It has following possible values:
> - "i440" - i440 emulation (default)
> - "q35" - emulate a Q35 machine=2E By default, the storage interface is
> AHCI=2E
>=20
> Note that omitting device_model_machine parameter means i440 system
> by default, so the default behavior doesn't change for existing domain
> config files=2E
>=20
> Setting device_model_machine to "q35" sends '-machine q35,accel=3Dxen'
> argument to QEMU=2E

That new configuration is going to do more than adding this argument to
the to the QEMU command line=2E

"accel=3Dxen" isn't new, it's already used=2E It just happen that the
machine "xenfv" in QEMU sets it by default=2E

> Unlike i440, there is no separated machine type to
> enable/disable Xen platform device, it is controlled via a machine
> property only=2E

As it should be=2E We don't use a separated machine type to control the
presence or not of the xen-platform-pci device, we use it because
historically that was the only way to enable Xen support in QEMU=2E Before
`accel=3Dxen` was introduced=2E

We could also add the xen-platform-pci device separately with the i440
chipset, but switching from `xenfv` to `pc` would break migration=2E

Speaking of migration, we might want to force users to select a
particular version of a q35 machine, something like "pc-q35-10=2E0", as
this would make it possible to migrate between two different versions of
QEMU without too much trouble=2E

We could have them run something like
    /usr/lib/xen/bin/qemu-system-i386 -machine '?'
to have the list of machine, or have libxl list all the possible machine
or just the machine name that would be the alias of "q35"=2E
(in -machine '?' output, that looks like:
    q35    Standard PC (Q35 + ICH9, 2009) (alias of pc-q35-10=2E2)
)

That would be necessary, until the toolstack would be capable of using
the same machine version on both end of a migration=2E

> See 'libxl: Add xen-platform device for Q35 machine'
> patch for a detailed description=2E
>=20
> Signed-off-by: Alexey Gerasimenko <x1917x@gmail=2Ecom>
> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
> ---
>  tools/libs/light/libxl_dm=2Ec      | 16 ++++++++++------
>  tools/libs/light/libxl_types=2Eidl |  7 +++++++
>  tools/xl/xl_parse=2Ec              | 14 ++++++++++++++
>  3 files changed, 31 insertions(+), 6 deletions(-)
>=20
> diff --git a/tools/libs/light/libxl_dm=2Ec b/tools/libs/light/libxl_dm=
=2Ec
> index 511ec76a65=2E=2E36f2813cde 100644
> --- a/tools/libs/light/libxl_dm=2Ec
> +++ b/tools/libs/light/libxl_dm=2Ec
> @@ -1562,13 +1562,17 @@ static int libxl__build_device_model_args_new(li=
bxl__gc *gc,
>              flexarray_append(dm_args, b_info->extra_pv[i]);
>          break;
>      case LIBXL_DOMAIN_TYPE_HVM:
> -        if (!libxl_defbool_val(b_info->u=2Ehvm=2Exen_platform_pci)) {
> -            /* Switching here to the machine "pc" which does not add
> -             * the xen-platform device instead of the default "xenfv" m=
achine=2E
> -             */
> -            machinearg =3D libxl__strdup(gc, "pc,accel=3Dxen,suppress-v=
mdesc=3Don");
> +        if (b_info->device_model_machine =3D=3D LIBXL_DEVICE_MODEL_MACH=
INE_Q35) {
> +            machinearg =3D libxl__sprintf(gc, "q35,accel=3Dxen");

I have to check, but I think we still want "suppress-vmdesc=3Don", here=2E

>          } else {
> -            machinearg =3D libxl__strdup(gc, "xenfv,suppress-vmdesc=3Do=
n");
> +            if (!libxl_defbool_val(b_info->u=2Ehvm=2Exen_platform_pci))=
 {
> +                /* Switching here to the machine "pc" which does not ad=
d
> +                 * the xen-platform device instead of the default "xenf=
v" machine=2E
> +                 */
> +                machinearg =3D libxl__strdup(gc, "pc,accel=3Dxen,suppre=
ss-vmdesc=3Don");
> +            } else {
> +                machinearg =3D libxl__strdup(gc, "xenfv,suppress-vmdesc=
=3Don");
> +            }
>          }
>          if (b_info->u=2Ehvm=2Emmio_hole_memkb) {
>              uint64_t max_ram_below_4g =3D (1ULL << 32) -
> diff --git a/tools/libs/light/libxl_types=2Eidl b/tools/libs/light/libxl=
_types=2Eidl
> index d64a573ff3=2E=2Ef9cd881b66 100644
> --- a/tools/libs/light/libxl_types=2Eidl
> +++ b/tools/libs/light/libxl_types=2Eidl
> @@ -109,6 +109,12 @@ libxl_device_model_version =3D Enumeration("device_=
model_version", [
>      (2, "QEMU_XEN"),             # Upstream based qemu-xen device model
>      ])
> =20
> +libxl_device_model_machine =3D Enumeration("device_model_machine", [
> +    (0, "UNKNOWN"),
> +    (1, "I440"),
> +    (2, "Q35"),
> +    ])
> +
>  libxl_console_type =3D Enumeration("console_type", [
>      (0, "UNKNOWN"),
>      (1, "SERIAL"),
> @@ -613,6 +619,7 @@ libxl_domain_build_info =3D Struct("domain_build_inf=
o",[
>      ("device_model_ssidref", uint32),
>      ("device_model_ssid_label", string),
>      ("device_model_user", string),
> +    ("device_model_machine", libxl_device_model_machine),

libxl is going to have to check this new field=2E When it's set to
unknown, we have to change it to the default value before starting to
create the new domain=2E This is done in
libxl__domain_build_info_setdefault()=2E

Also, as it's a change to the API, could you add a "LIBXL_HAVE_*" macro
in "libxl=2Eh"? LIBXL_HAVE_DEVICE_MODEL_MACHINE would sound like a good
name=2E

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.77e.e40f7946aacc6f47.19ee0178576.982acf75126d056d=---

