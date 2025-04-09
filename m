Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA8CA83400
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 00:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944731.1343097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2dhe-0002uj-CZ; Wed, 09 Apr 2025 22:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944731.1343097; Wed, 09 Apr 2025 22:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2dhe-0002rd-A4; Wed, 09 Apr 2025 22:15:26 +0000
Received: by outflank-mailman (input) for mailman id 944731;
 Wed, 09 Apr 2025 22:15:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ywx6=W3=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2dhd-0002rX-BO
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 22:15:25 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20b8d06b-1590-11f0-9eab-5ba50f476ded;
 Thu, 10 Apr 2025 00:15:21 +0200 (CEST)
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
X-Inumbo-ID: 20b8d06b-1590-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744236921; x=1744496121;
	bh=jeqCwqalJSPMaR0Xhvw51Ys30KIthxLHnNwjUYleNxA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=YftAORGUqR3Ech0ajTk2icv8X8lgVAunbtRgbeMc/F+0JHD7MBLPymoJalYekk+P/
	 AEpQTvNfFtYqGOGxFl00SKv05vy9f4HfqC3btTSmff2h1Sh/Pz33ZLUctDWpXlh/9M
	 cqSqUKHxBBO0FF+TkJDrUQPfDYnxF4QZGAnHbIh1v6UFc+pyI0Qu82zYjEfehW9/w6
	 QU4kRFypbZxIiAHlvSzYJ9U2i2veudIuWE4IWyBGAkcQA3kek/+uuIaSjeRLJGPt+7
	 4r2gvfpp7OnwH3QguU262UW/JbQdxzxmcMzPN9vEiyHiHsmV39GMunosc/DIgmVLmn
	 QQBxGvJw5JJ6w==
Date: Wed, 09 Apr 2025 22:15:18 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v3 12/16] x86/hyperlaunch: add domain id parsing to domain config
Message-ID: <tRYKTDKcoIBHId12LOD4EHCmAF-AN3V3PmkMqmyIjYCqQJ3TS_0ctt3WMCq1Ez3W7oIGxwU3UsAioyP9T9fMCO78_61AI01oYEknYF_h1_I=@proton.me>
In-Reply-To: <20250408160802.49870-13-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com> <20250408160802.49870-13-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b809612eb6f56e3c5894e96c1e9cd261539d1355
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.com=
> wrote:

>=20
>=20
> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>=20
>=20
> Introduce the ability to specify the desired domain id for the domain
> definition. The domain id will be populated in the domid property of the
> domain
> node in the device tree configuration.
>=20
> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>=20
> ---
> v3:
> * Remove ramdisk parsing
> * Add missing xen/errno.h include
> ---
> xen/arch/x86/domain-builder/fdt.c | 39 ++++++++++++++++++++++++++++-
> xen/arch/x86/setup.c | 5 ++--
> xen/include/xen/libfdt/libfdt-xen.h | 11 ++++++++
> 3 files changed, 52 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-buil=
der/fdt.c
> index 0f5fd01557..4c6aafe195 100644
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -8,6 +8,7 @@
> #include <xen/libfdt/libfdt.h>
>=20
>=20
> #include <asm/bootinfo.h>
>=20
> +#include <asm/guest.h>
>=20
> #include <asm/page.h>
>=20
> #include <asm/setup.h>
>=20
>=20
> @@ -158,12 +159,42 @@ int __init fdt_read_multiboot_module(const void *fd=
t, int node,
> static int __init process_domain_node(
> struct boot_info *bi, const void *fdt, int dom_node)
> {
> - int node;
> + int node, property;
> struct boot_domain *bd =3D &bi->domains[bi->nr_domains];
>=20
> const char *name =3D fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
> int address_cells =3D fdt_address_cells(fdt, dom_node);
> int size_cells =3D fdt_size_cells(fdt, dom_node);
>=20
> + fdt_for_each_property_offset(property, fdt, dom_node)
> + {
> + const struct fdt_property *prop;
> + const char prop_name;
> + int name_len;
> +
> + prop =3D fdt_get_property_by_offset(fdt, property, NULL);
> + if ( !prop )
> + continue; / silently skip */
> +
> + prop_name =3D fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), &name_le=
n);
>=20
> +
> + if ( strncmp(prop_name, "domid", name_len) =3D=3D 0 )
> + {
> + uint32_t val =3D DOMID_INVALID;
> + if ( fdt_prop_as_u32(prop, &val) !=3D 0 )
> + {
> + printk(" failed processing domain id for domain %s\n", name);

Add XENLOG_ERR ?

> + return -EINVAL;
> + }
> + if ( val >=3D DOMID_FIRST_RESERVED )
>=20
> + {
> + printk(" invalid domain id for domain %s\n", name);

Add XENLOG_ERR ?

> + return -EINVAL;
> + }
> + bd->domid =3D (domid_t)val;
>=20
> + printk(" domid: %d\n", bd->domid);
>=20
> + }
> + }
> +
> fdt_for_each_subnode(node, fdt, dom_node)
> {
> if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") =3D=3D 0 )
> @@ -233,6 +264,12 @@ static int __init process_domain_node(
> return -ENODATA;
> }
>=20
> + if ( bd->domid =3D=3D DOMID_INVALID )
>=20
> + bd->domid =3D get_initial_domain_id();
>=20
> + else if ( bd->domid !=3D get_initial_domain_id() )
>=20
> + printk(XENLOG_WARNING
> + "WARN: Booting without initial domid not supported.\n");

Drop WARN since the log message is XENLOG_WARNING level already?

> +
> return 0;
> }
>=20
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 3dfa81b48c..db7280225e 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1033,8 +1033,9 @@ static struct domain *__init create_dom0(struct boo=
t_info bi)
> if ( iommu_enabled )
> dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>=20
> - / Create initial domain. Not d0 for pvshim. */
> - bd->domid =3D get_initial_domain_id();
>=20
> + if ( bd->domid =3D=3D DOMID_INVALID )
>=20
> + /* Create initial domain. Not d0 for pvshim. */
> + bd->domid =3D get_initial_domain_id();
>=20
> d =3D domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
>=20
> if ( IS_ERR(d) )
> panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>=20
> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt=
/libfdt-xen.h
> index e473fbaf0c..3031bec90e 100644
> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -12,6 +12,7 @@
> #define LIBFDT_XEN_H
>=20
> #include <xen/libfdt/libfdt.h>
>=20
> +#include <xen/errno.h>
>=20
>=20
> static inline int __init fdt_cell_as_u32(const fdt32_t *cell)
> {
> @@ -23,6 +24,16 @@ static inline uint64_t __init fdt_cell_as_u64(const fd=
t32_t *cell)
> return ((uint64_t)fdt32_to_cpu(cell[0]) << 32) | fdt32_to_cpu(cell[1]);
> }
>=20
> +static inline int __init fdt_prop_as_u32(
> + const struct fdt_property *prop, uint32_t *val)
> +{
> + if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u32) )
>=20
> + return -EINVAL;
> +
> + *val =3D fdt_cell_as_u32((fdt32_t *)prop->data);
>=20
> + return 0;
> +}
> +
> static inline bool __init fdt_get_prop_offset(
> const void *fdt, int node, const char *name, unsigned long *offset)
> {
> --
> 2.43.0

