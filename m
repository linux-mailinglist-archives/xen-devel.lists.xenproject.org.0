Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17E0AD02B0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 15:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008526.1387802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNWgK-0007JC-Vl; Fri, 06 Jun 2025 13:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008526.1387802; Fri, 06 Jun 2025 13:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNWgK-0007Gx-Rh; Fri, 06 Jun 2025 13:00:24 +0000
Received: by outflank-mailman (input) for mailman id 1008526;
 Fri, 06 Jun 2025 13:00:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XpM5=YV=bounce.vates.tech=bounce-md_30504962.6842e663.v1-4cd0901772964c1a977820f463d04020@srs-se1.protection.inumbo.net>)
 id 1uNWgJ-0007Gr-2o
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 13:00:23 +0000
Received: from mail36.us4.mandrillapp.com (mail36.us4.mandrillapp.com
 [205.201.136.36]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33a53015-42d6-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 15:00:21 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail36.us4.mandrillapp.com (Mailchimp) with ESMTP id 4bDLyW5NjYzS646YZ
 for <xen-devel@lists.xenproject.org>; Fri,  6 Jun 2025 13:00:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4cd0901772964c1a977820f463d04020; Fri, 06 Jun 2025 13:00:19 +0000
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
X-Inumbo-ID: 33a53015-42d6-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749214819; x=1749484819;
	bh=kR4+96UQbS+FzQOrA4QYtX61B6OuEKqx78JOtEMdgtU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nVT5hmA2okz4FVkg6QKPaD71BuSljLpeoBbonqEkDDnsCYV8F3pipO3dStEAxP0Lw
	 BaEYXQS5kgbMtowi0U4dU7GSP3wJMu4tVqyL7LoZzRCkA+7T495EYbLApX7yEN6XS9
	 p2MzSE6jAep/fLgnaAe/FEfhrzbDrmBnZKKwKTq+HJ8h9EkJAi+MrJ3+Rf3AdKSuED
	 PvG0MAQO6bm9nfXnUtxVWgzgOJypp2CtkIG14oOZKiKAX1ktQ0m8NMtmUhcBpb5PY6
	 8++my48HiCZvySIpHtx8gfFmKHaRsOMOfR22CCp/kRBB0ar9r8Ke+4DvO+r6l5jUaI
	 TyinguAKwz/kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749214819; x=1749475319; i=ngoc-tu.dinh@vates.tech;
	bh=kR4+96UQbS+FzQOrA4QYtX61B6OuEKqx78JOtEMdgtU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fuqZadNO1w/svYOdkdYrdZtebox83A5alT5kDB60RxQ6efeCOs8tkkoOJY7qIzNRw
	 xTuNTfOSm8WZaUrcHHVw9nf3VgjMyosfo8o0U7gZ+hQBcmdAq3C6e8VR8U9ieoc7hW
	 xYZM5FTdOYk7Tk12nJlSi1XogLaw2Y0UZLEpGyVLIW7SOPWpzeIfAcBQ9LgY7rZT27
	 5XdYOqVYzXxyQtSv5amnFeHSPai150TZMTwfPmvVM7RlUFGw12UzQ1Pmk4+io1ImU4
	 gSwbp2CFpdT/dGsQ4bVX5iEkGhAyd+RDd5GrXS54PZAnGSZDtEUDmMw15O8xcR4Y5X
	 p7duh3FvOT0FA==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3]=20x86/hvmloader:=20select=20xenpci=20MMIO=20BAR=20UC=20or=20WB=20MTRR=20cache=20attribute?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749214817188
Message-Id: <1b290503-078e-491a-8552-b884df7ac747@vates.tech>
To: "Roger Pau Monne" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>
References: <20250605161659.18201-1-roger.pau@citrix.com>
In-Reply-To: <20250605161659.18201-1-roger.pau@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4cd0901772964c1a977820f463d04020?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250606:md
Date: Fri, 06 Jun 2025 13:00:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Roger,

On 05/06/2025 18:20, Roger Pau Monne wrote:
> The Xen PCI device (vendor ID 0x5853) exposed to x86 HVM guests doesn't
> have the functionality of a traditional PCI device.  The exposed MMIO BAR
> is used by some guests (including Linux) as a safe place to map foreign
> memory, including the grant table itself.
> 
> Traditionally BARs from devices have the uncacheable (UC) cache attribute
> from the MTRR, to ensure correct functionality of such devices.  hvmloade=
r
> mimics this behavior and sets the MTRR attributes of both the low and hig=
h
> PCI MMIO windows (where BARs of PCI devices reside) as UC in MTRR.
> 
> This however causes performance issues for users of the Xen PCI device BA=
R,
> as for the purposes of mapping remote memory there's no need to use the U=
C
> attribute.  On Intel systems this is worked around by using iPAT, that
> allows the hypervisor to force the effective cache attribute of a p2m ent=
ry
> regardless of the guest PAT value.  AMD however doesn't have an equivalen=
t
> of iPAT, and guest PAT values are always considered.
> 
> Linux commit:
> 
> 41925b105e34 xen: replace xen_remap() with memremap()
> 
> Attempted to mitigate this by forcing mappings of the grant-table to use
> the write-back (WB) cache attribute.  However Linux memremap() takes MTRR=
s
> into account to calculate which PAT type to use, and seeing the MTRR cach=
e
> attribute for the region being UC the PAT also ends up as UC, regardless =
of
> the caller having requested WB.
> 
> As a workaround to allow current Linux to map the grant-table as WB using
> memremap() introduce an xl.cfg option (xenpci_bar_uc=3D0) that can be use=
d to
> select whether the Xen PCI device BAR will have the UC attribute in MTRR.
> Such workaround in hvmloader should also be paired with a fix for Linux s=
o
> it attempts to change the MTRR of the Xen PCI device BAR to WB by itself.
> 
> Overall, the long term solution would be to provide the guest with a safe
> range in the guest physical address space where mappings to foreign pages
> can be created.
> 
> Some vif throughput performance figures provided by Anthoine from a 8
> vCPUs, 4GB of RAM HVM guest(s) running on AMD hardware:
> 
> Without this patch:
> vm -> dom0: 1.1Gb/s
> vm -> vm:   5.0Gb/s
> 
> With the patch:
> vm -> dom0: 4.5Gb/s
> vm -> vm:   7.0Gb/s
> 
> Reported-by: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v2:
>   - Add default value in xl.cfg.
>   - List xenstore path in the pandoc file.
>   - Adjust comment in hvmloader.
>   - Fix commit message MIO -> MMIO.
> 
> Changes since v1:
>   - Leave the xenpci BAR as UC by default.
>   - Introduce an option to not set it as UC.
> ---
>   docs/man/xl.cfg.5.pod.in                |  8 ++++
>   docs/misc/xenstore-paths.pandoc         |  5 +++
>   tools/firmware/hvmloader/config.h       |  2 +-
>   tools/firmware/hvmloader/pci.c          | 49 ++++++++++++++++++++++++-
>   tools/firmware/hvmloader/util.c         |  2 +-
>   tools/include/libxl.h                   |  9 +++++
>   tools/libs/light/libxl_create.c         |  1 +
>   tools/libs/light/libxl_dom.c            |  9 +++++
>   tools/libs/light/libxl_types.idl        |  1 +
>   tools/xl/xl_parse.c                     |  2 +
>   xen/include/public/hvm/hvm_xs_strings.h |  2 +
>   11 files changed, 86 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index c388899306c2..ddbff6fffc16 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2351,6 +2351,14 @@ Windows L<https://xenproject.org/windows-pv-driver=
s/>.
>   Setting B<xen_platform_pci=3D0> with the default device_model "qemu-xen=
"
>   requires at least QEMU 1.6.
>   
> +
> +=3Ditem B<xenpci_bar_uc=3DBOOLEAN>
> +
> +B<x86 only:> Select whether the memory BAR of the Xen PCI device should =
have
> +uncacheable (UC) cache attribute set in MTRR.
> +
> +Default is B<true>.
> +
>   =3Ditem B<viridian=3D[ "GROUP", "GROUP", ...]> or B<viridian=3DBOOLEAN>
>   
>   The groups of Microsoft Hyper-V (AKA viridian) compatible enlightenment=
s
> diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.p=
andoc
> index 01a340fafcbe..073bed91eec1 100644
> --- a/docs/misc/xenstore-paths.pandoc
> +++ b/docs/misc/xenstore-paths.pandoc
> @@ -234,6 +234,11 @@ These xenstore values are used to override some of t=
he default string
>   values in the SMBIOS table constructed in hvmloader. See the SMBIOS
>   table specification at http://www.dmtf.org/standards/smbios/
>   
> +#### ~/hvmloader/pci/xenpci-bar-uc =3D ("1"|"0") [HVM,INTERNAL]
> +
> +Select whether the Xen PCI device MMIO BAR will have the uncacheable cac=
he
> +attribute set in the MTRRs by hvmloader.
> +
>   #### ~/bios-strings/oem-* =3D STRING [HVM,INTERNAL]
>   
>   1 to 99 OEM strings can be set in xenstore using values of the form
> diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader=
/config.h
> index 6e1da137d779..c159db30eea9 100644
> --- a/tools/firmware/hvmloader/config.h
> +++ b/tools/firmware/hvmloader/config.h
> @@ -58,7 +58,7 @@ extern uint32_t *cpu_to_apicid;
>   #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
>   
>   extern uint32_t pci_mem_start;
> -extern const uint32_t pci_mem_end;
> +extern uint32_t pci_mem_end;
>   extern uint64_t pci_hi_mem_start, pci_hi_mem_end;
>   
>   extern bool acpi_enabled;
> diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pc=
i.c
> index cc67b18c0361..747f6cfb6794 100644
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -30,7 +30,7 @@
>   #include <xen/hvm/e820.h>
>   
>   uint32_t pci_mem_start =3D HVM_BELOW_4G_MMIO_START;
> -const uint32_t pci_mem_end =3D RESERVED_MEMBASE;
> +uint32_t pci_mem_end =3D RESERVED_MEMBASE;
>   uint64_t pci_hi_mem_start =3D 0, pci_hi_mem_end =3D 0;
>   
>   /*
> @@ -116,6 +116,8 @@ void pci_setup(void)
>        * experience the memory relocation bug described below.
>        */
>       bool allow_memory_relocate =3D 1;
> +    /* Select the MTRR cache attribute of the xenpci device BAR. */
> +    bool xenpci_bar_uc =3D false;

Since this is meant to be a workaround, I wonder if it makes more sense 
to flip the setting (`xenpci_bar_wb`) and make it 0 by default? It also 
simplifies the logic for both hvmloader and the consumer (no need for 
double negatives).

>   
>       BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO !=3D
>                    PCI_COMMAND_IO);
> @@ -130,6 +132,12 @@ void pci_setup(void)
>       printf("Relocating guest memory for lowmem MMIO space %s\n",
>              allow_memory_relocate?"enabled":"disabled");
>   
> +    s =3D xenstore_read(HVM_XS_XENPCI_BAR_UC, NULL);
> +    if ( s )
> +        xenpci_bar_uc =3D strtoll(s, NULL, 0);
> +    printf("XenPCI device BAR MTRR cache attribute set to %s\n",
> +           xenpci_bar_uc ? "UC" : "WB");
> +
>       s =3D xenstore_read("platform/mmio_hole_size", NULL);
>       if ( s )
>           mmio_hole_size =3D strtoll(s, NULL, 0);
> @@ -271,6 +279,43 @@ void pci_setup(void)
>               if ( bar_sz =3D=3D 0 )
>                   continue;
>   
> +            if ( !xenpci_bar_uc &&
> +                 ((bar_data & PCI_BASE_ADDRESS_SPACE) =3D=3D
> +                   PCI_BASE_ADDRESS_SPACE_MEMORY) &&
> +                 vendor_id =3D=3D 0x5853 &&
> +                 (device_id =3D=3D 0x0001 || device_id =3D=3D 0x0002) )
> +            {
> +                if ( is_64bar )
> +                {
> +                     printf("xenpci dev %02x:%x unexpected MMIO 64bit BA=
R%u\n",
> +                            devfn >> 3, devfn & 7, bar);
> +                     continue;
> +                }
> +
> +                if ( bar_sz > pci_mem_end ||
> +                     ((pci_mem_end - bar_sz) & ~(bar_sz - 1)) < pci_mem_=
start )
> +                {
> +                     printf("xenpci dev %02x:%x BAR%u size %llx overflow=
s low PCI hole\n",
> +                            devfn >> 3, devfn & 7, bar, bar_sz);
> +                     continue;
> +                }
> +
> +                /* Put unconditionally at the end of the low PCI MMIO ho=
le. */
> +                pci_mem_end -=3D bar_sz;
> +                pci_mem_end &=3D ~(bar_sz - 1);
> +                bar_data &=3D ~PCI_BASE_ADDRESS_MEM_MASK;
> +                bar_data |=3D pci_mem_end;
> +                pci_writel(devfn, bar_reg, bar_data);
> +                pci_devfn_decode_type[devfn] |=3D PCI_COMMAND_MEMORY;
> +
> +                /* Prefix BAR address with a 0 to match format used belo=
w. */
> +                printf("pci dev %02x:%x bar %02x size "PRIllx": 0%08x\n"=
,
> +                       devfn >> 3, devfn & 7, bar_reg,
> +                       PRIllx_arg(bar_sz), bar_data);
> +
> +                continue;
> +            }
> +
>               for ( i =3D 0; i < nr_bars; i++ )
>                   if ( bars[i].bar_sz < bar_sz )
>                       break;
> @@ -310,7 +355,7 @@ void pci_setup(void)
>           }
>   
>           /* Enable bus master for this function later */
> -        pci_devfn_decode_type[devfn] =3D PCI_COMMAND_MASTER;
> +        pci_devfn_decode_type[devfn] |=3D PCI_COMMAND_MASTER;
>       }
>   
>       if ( mmio_hole_size )
> diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/u=
til.c
> index 79c0e6bd4ad2..31b4411db7b4 100644
> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -867,7 +867,7 @@ void hvmloader_acpi_build_tables(struct acpi_config *=
config,
>           config->table_flags |=3D ACPI_HAS_HPET;
>   
>       config->pci_start =3D pci_mem_start;
> -    config->pci_len =3D pci_mem_end - pci_mem_start;
> +    config->pci_len =3D RESERVED_MEMBASE - pci_mem_start;
>       if ( pci_hi_mem_end > pci_hi_mem_start )
>       {
>           config->pci_hi_start =3D pci_hi_mem_start;
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index b7ad7735ca4c..7ce7678e6836 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -1503,6 +1503,15 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst=
, const libxl_mac *src);
>    */
>   #define LIBXL_HAVE_CREATEINFO_XEND_SUSPEND_EVTCHN_COMPAT
>   
> +/*
> + * LIBXL_HAVE_XENPCI_BAR_UC
> + *
> + * libxl_domain_build_info contains a boolean 'u.hvm.xenpci_bar_uc' fiel=
d to
> + * signal whether the XenPCI device BAR should have UC cache attribute s=
et in
> + * MTRR.
> + */
> +#define LIBXL_HAVE_XENPCI_BAR_UC
> +
>   typedef char **libxl_string_list;
>   void libxl_string_list_dispose(libxl_string_list *sl);
>   int libxl_string_list_length(const libxl_string_list *sl);
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_cre=
ate.c
> index 8bc768b5156c..962fa820faec 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -313,6 +313,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc=
,
>           libxl_defbool_setdefault(&b_info->u.hvm.usb,                fal=
se);
>           libxl_defbool_setdefault(&b_info->u.hvm.vkb_device,         tru=
e);
>           libxl_defbool_setdefault(&b_info->u.hvm.xen_platform_pci,   tru=
e);
> +        libxl_defbool_setdefault(&b_info->u.hvm.xenpci_bar_uc,      true=
);
>           libxl_defbool_setdefault(&b_info->u.hvm.pirq,               fal=
se);
>   
>           libxl_defbool_setdefault(&b_info->u.hvm.spice.enable, false);
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 4d67b0d28294..60ec0354d19a 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -819,6 +819,15 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
>               goto err;
>       }
>   
> +    if (info->type =3D=3D LIBXL_DOMAIN_TYPE_HVM &&
> +        libxl_defbool_val(info->u.hvm.xenpci_bar_uc)) {
> +        path =3D GCSPRINTF("/local/domain/%d/"HVM_XS_XENPCI_BAR_UC, domi=
d);
> +        ret =3D libxl__xs_printf(gc, XBT_NULL, path, "%d",
> +                               libxl_defbool_val(info->u.hvm.xenpci_bar_=
uc));
> +        if (ret)
> +            goto err;
> +    }
> +
>       return 0;
>   
>   err:
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index 198515383012..6054350b83c7 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -691,6 +691,7 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
>                                          ("vkb_device",       libxl_defbo=
ol),
>                                          ("soundhw",          string),
>                                          ("xen_platform_pci", libxl_defbo=
ol),
> +                                       ("xenpci_bar_uc",    libxl_defboo=
l),
>                                          ("usbdevice_list",   libxl_strin=
g_list),
>                                          ("vendor_device",    libxl_vendo=
r_device),
>                                          # See libxl_ms_vm_genid_generate=
()
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 219e924779ff..4da3bb9e91ab 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2917,6 +2917,8 @@ skip_usbdev:
>           xlu_cfg_replace_string (config, "soundhw", &b_info->u.hvm.sound=
hw, 0);
>           xlu_cfg_get_defbool(config, "xen_platform_pci",
>                               &b_info->u.hvm.xen_platform_pci, 0);
> +        xlu_cfg_get_defbool(config, "xenpci_bar_uc",
> +                            &b_info->u.hvm.xenpci_bar_uc, 0);
>   
>           if(b_info->u.hvm.vnc.listen
>              && b_info->u.hvm.vnc.display
> diff --git a/xen/include/public/hvm/hvm_xs_strings.h b/xen/include/public=
/hvm/hvm_xs_strings.h
> index e1ed078628a0..ebb07b9fba56 100644
> --- a/xen/include/public/hvm/hvm_xs_strings.h
> +++ b/xen/include/public/hvm/hvm_xs_strings.h
> @@ -14,6 +14,8 @@
>   #define HVM_XS_BIOS                    "hvmloader/bios"
>   #define HVM_XS_GENERATION_ID_ADDRESS   "hvmloader/generation-id-address=
"
>   #define HVM_XS_ALLOW_MEMORY_RELOCATE   "hvmloader/allow-memory-relocate=
"
> +/* Set xenpci device BAR as UC in MTRR */
> +#define HVM_XS_XENPCI_BAR_UC           "hvmloader/pci/xenpci-bar-uc"
>   
>   /* The following values allow additional ACPI tables to be added to the
>    * virtual ACPI BIOS that hvmloader constructs. The values specify the =
guest



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



