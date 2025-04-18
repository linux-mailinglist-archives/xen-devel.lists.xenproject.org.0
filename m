Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6CEA94044
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 01:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959618.1351935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5v1N-0006n0-0k; Fri, 18 Apr 2025 23:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959618.1351935; Fri, 18 Apr 2025 23:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5v1M-0006kC-UA; Fri, 18 Apr 2025 23:21:20 +0000
Received: by outflank-mailman (input) for mailman id 959618;
 Fri, 18 Apr 2025 23:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UscN=XE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5v1K-0006k3-Pq
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 23:21:19 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3a2b326-1cab-11f0-9eb0-5ba50f476ded;
 Sat, 19 Apr 2025 01:21:16 +0200 (CEST)
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
X-Inumbo-ID: d3a2b326-1cab-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745018475; x=1745277675;
	bh=ABLOqkPMsPWNWAB6FfLPsuI9qxZVMZ+kKR4Ag6WDRwc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=B39mp4ARyVq9W+t/r4Bn8LN4uh889pJXYNbd9tmMrf6hJRSS1N4z6xlRNlVrHWwlC
	 cOE4BQcN0BImRnP8Ua0urfI/BFradd91B0pJxmO/uStp69H0iawI+hs01177INgVhr
	 QE22zhgGOXMr2k/nN/qhu5QEy8hsMcm+02bA7eQZK1gkENC69SQdJVWeq2Ye2j0RZF
	 EmLzASGHTfcz9jWdhxL5qZWdrG7CyCK0GEGTdOz+kd5V3pamMEB7FRRiq175nM6/e8
	 YT/5bBN3oHJHgzwRej1KoJtoO/tpvsk3+rqtW9yw75/jHRUebvkpjIfpDY26+RC+rf
	 CdEcmNSdbbF2A==
Date: Fri, 18 Apr 2025 23:21:10 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 11/13] x86/hyperlaunch: add memory parsing to domain config
Message-ID: <aALeY6bt7lDCwXii@kraken>
In-Reply-To: <20250417124844.11143-12-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com> <20250417124844.11143-12-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8de3ece4b171ec363cf4fb366f245d5306e722d3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 01:48:33PM +0100, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>=20
> Add three properties, memory, mem-min, and mem-max, to the domain node de=
vice
> tree parsing to define the memory allocation for a domain. All three fiel=
ds are
> expressed in kb and written as a u64 in the device tree entries.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> Can't use KB() rather tha SZ_1K, as that's strictly for literals.

Oh, that's right! Thanks!

>=20
> v4:
>   * Don't override fdt_prop_as_u64() rc on error.
>   * Add separate printk statements for each memory prop error.
>   * Fix bug setting up dom0_size, dom0_min_size and dom0_max_size
>     * Was overriding dom0_size on all 3 paths.
>   * Pre-initialise max_pages of all boot_domains to be LONG_MAX, just as
>     dom0_max_size.
>     * Eventually dom0_max_size drops out in the bigger series, so we
>       need that logic to be correct.
> ---
>  xen/arch/x86/dom0_build.c              |  8 ++++++
>  xen/arch/x86/include/asm/boot-domain.h |  4 +++
>  xen/arch/x86/setup.c                   |  5 +++-
>  xen/common/domain-builder/fdt.c        | 36 ++++++++++++++++++++++++++
>  xen/include/xen/libfdt/libfdt-xen.h    | 10 +++++++
>  5 files changed, 62 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 0b467fd4a4..8db24dbc0a 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -627,6 +627,14 @@ int __init construct_dom0(const struct boot_domain *=
bd)
>=20
>      process_pending_softirqs();
>=20
> +    /* If param dom0_size was not set and HL config provided memory size=
 */
> +    if ( !get_memsize(&dom0_size, ULONG_MAX) && bd->mem_pages )
> +        dom0_size.nr_pages =3D bd->mem_pages;
> +    if ( !get_memsize(&dom0_min_size, ULONG_MAX) && bd->min_pages )
> +        dom0_min_size.nr_pages =3D bd->min_pages;
> +    if ( !get_memsize(&dom0_max_size, ULONG_MAX) && bd->max_pages )
> +        dom0_max_size.nr_pages =3D bd->max_pages;
> +
>      if ( is_hvm_domain(d) )
>          rc =3D dom0_construct_pvh(bd);
>      else if ( is_pv_domain(d) )
> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/includ=
e/asm/boot-domain.h
> index e316d4bcde..fa8ea1cc66 100644
> --- a/xen/arch/x86/include/asm/boot-domain.h
> +++ b/xen/arch/x86/include/asm/boot-domain.h
> @@ -18,6 +18,10 @@ struct boot_domain {
>  #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
>      uint32_t mode;
>=20
> +    unsigned long mem_pages;
> +    unsigned long min_pages;
> +    unsigned long max_pages;
> +
>      struct boot_module *kernel;
>      struct boot_module *module;
>      const char *cmdline;
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 05e3d2cf2a..455dad454c 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -296,7 +296,10 @@ static const char *cmdline_cook(const char *p, const=
 char *loader_name);
>  struct boot_info __initdata xen_boot_info =3D {
>      .loader =3D "unknown",
>      .cmdline =3D "",
> -    .domains =3D { [0 ... MAX_NR_BOOTDOMS - 1] =3D { .domid =3D DOMID_IN=
VALID } },
> +    .domains =3D { [0 ... MAX_NR_BOOTDOMS - 1] =3D {
> +        .domid =3D DOMID_INVALID,
> +        .max_pages =3D ULONG_MAX,
> +    }},
>  };
>=20
>  static struct boot_info *__init multiboot_fill_boot_info(
> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/=
fdt.c
> index 6809c7f917..90218d120a 100644
> --- a/xen/common/domain-builder/fdt.c
> +++ b/xen/common/domain-builder/fdt.c
> @@ -7,6 +7,7 @@
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/libfdt/libfdt.h>
> +#include <xen/sizes.h>
>=20
>  #include <asm/bootinfo.h>
>  #include <asm/page.h>
> @@ -246,6 +247,41 @@ static int __init process_domain_node(
>                     (bd->mode & BUILD_MODE_ENABLE_DM) ? "hvm" :
>                                                         "pvh");
>          }
> +        else if ( strncmp(prop_name, "memory", name_len) =3D=3D 0 )

Use !strncmp(...) like in the below code?

> +        {
> +            uint64_t kb;
> +            if ( (rc =3D fdt_prop_as_u64(prop, &kb)) )
> +            {
> +                printk(XENLOG_ERR "  bad \"memory\" prop on domain %s\n"=
, name);
> +                return rc;
> +            }
> +            bd->mem_pages =3D PFN_DOWN(kb * SZ_1K);
> +            printk(XENLOG_ERR "  memory: %lu KiB\n", kb);
> +        }
> +        else if ( !strncmp(prop_name, "mem-min", name_len) )
> +        {
> +            uint64_t kb;
> +            if ( (rc =3D fdt_prop_as_u64(prop, &kb)) )
> +            {
> +                printk(XENLOG_ERR
> +                       "  bad \"mem-min\" prop on domain %s\n", name);
> +                return rc;
> +            }
> +            bd->min_pages =3D PFN_DOWN(kb * SZ_1K);
> +            printk(XENLOG_INFO "  min memory: %lu kb\n", kb);
> +        }
> +        else if ( !strncmp(prop_name, "mem-max", name_len) )
> +        {
> +            uint64_t kb;
> +            if ( (rc =3D fdt_prop_as_u64(prop, &kb)) )
> +            {
> +                printk(XENLOG_ERR
> +                       "  bad \"mem-max\" prop on domain %s\n", name);
> +                return rc;
> +            }
> +            bd->max_pages =3D PFN_DOWN(kb * SZ_1K);
> +            printk(XENLOG_INFO "  max memory: %lu KiB\n", kb);
> +        }
>      }
>=20
>      fdt_for_each_subnode(node, fdt, dom_node)
> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt=
/libfdt-xen.h
> index afc76e7750..3054b48a83 100644
> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -24,6 +24,16 @@ static inline int __init fdt_prop_as_u32(
>      return 0;
>  }
>=20
> +static inline int __init fdt_prop_as_u64(
> +    const struct fdt_property *prop, uint64_t *val)
> +{
> +    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(uint64_t) )
> +        return -EINVAL;
> +
> +    *val =3D fdt64_to_cpu(*(const fdt64_t *)prop->data);
> +    return 0;
> +}

Perhaps move the call to common/domain-builder/fdt.c?

> +
>  static inline bool __init fdt_get_prop_offset(
>      const void *fdt, int node, const char *pname, unsigned long *poffset=
)
>  {
> --
> 2.43.0
>=20
>=20


