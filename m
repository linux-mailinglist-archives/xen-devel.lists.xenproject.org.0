Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 541B2A93F62
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 23:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959454.1351808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5t4d-0007xk-Vp; Fri, 18 Apr 2025 21:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959454.1351808; Fri, 18 Apr 2025 21:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5t4d-0007vO-SK; Fri, 18 Apr 2025 21:16:35 +0000
Received: by outflank-mailman (input) for mailman id 959454;
 Fri, 18 Apr 2025 21:16:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UscN=XE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u5t4a-0007vI-U8
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 21:16:33 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65d839ee-1c9a-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 23:16:31 +0200 (CEST)
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
X-Inumbo-ID: 65d839ee-1c9a-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745010989; x=1745270189;
	bh=rVeoN0mIrN4UYSKfWzPhvFsR/ocqVehIIW+FIEqBhoU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Qfp/6KzNpC/dpskvAFfyiKE/1OAOxp7ZXo0EghcyojGUE5kF4lGEtQ3BzHNMgj8O0
	 OD9iWJM7Th8beVzVVS2/6ImCOpWNO4RXG28S0zz8qPmW0hdP9IGMwaMruKSMfWvCMS
	 T61ttOkLEkDClVLc8ce9kh2mYfkS1WTNjXu4rGa+ov3DmNEDJzWz1cck7bZbYyZ/u0
	 kiKx4hKCUf/pHabpqfDEfAaCK0Ba5U8pdqLbozGZ/ox+avTI7Ndyc0kbFgEEAJz4cz
	 uyFY3rcpcY46UbLui4JzVyZgdYPg5XfUEshR3SkCmGgNu7BcTfssnLVaCDjdvkChxV
	 vx4YtHbxH4eRg==
Date: Fri, 18 Apr 2025 21:16:27 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 01/13] x86/boot: add cmdline to struct boot_domain
Message-ID: <aALBJ/8YUwu4vl4k@kraken>
In-Reply-To: <20250417124844.11143-2-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com> <20250417124844.11143-2-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a947b224a22d72bf854d84031ced56ed0fa2ecad
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 01:48:23PM +0100, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>=20
> Add a container for the "cooked" command line for a domain. This
> provides for the backing memory to be directly associated with the
> domain being constructed.  This is done in anticipation that the domain
> construction path may need to be invoked multiple times, thus ensuring
> each instance had a distinct memory allocation.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>


Reviewed-by: Denis Mukhin <dmukhin@ford.com>

> ---
> v4:
>   * Manually nullify bd->cmdline before xfree()ing cmdline.
>   * const-ify arguments of domain_cmdline_size()
>   * Add cmdline_len to pvh_load_kernel()
> ---
>  xen/arch/x86/hvm/dom0_build.c          | 31 ++++++++--------
>  xen/arch/x86/include/asm/boot-domain.h |  1 +
>  xen/arch/x86/pv/dom0_build.c           |  4 +-
>  xen/arch/x86/setup.c                   | 51 ++++++++++++++++++++------
>  4 files changed, 57 insertions(+), 30 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.=
c
> index 2a094b3145..49832f921c 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -653,7 +653,7 @@ static int __init pvh_load_kernel(
>      void *image_start =3D image_base + image->headroom;
>      unsigned long image_len =3D image->size;
>      unsigned long initrd_len =3D initrd ? initrd->size : 0;
> -    const char *cmdline =3D image->cmdline_pa ? __va(image->cmdline_pa) =
: NULL;
> +    unsigned long cmdline_len =3D bd->cmdline ? strlen(bd->cmdline) + 1 =
: 0;
>      const char *initrd_cmdline =3D NULL;
>      struct elf_binary elf;
>      struct elf_dom_parms parms;
> @@ -736,8 +736,7 @@ static int __init pvh_load_kernel(
>              initrd =3D NULL;
>      }
>=20
> -    if ( cmdline )
> -        extra_space +=3D elf_round_up(&elf, strlen(cmdline) + 1);
> +    extra_space +=3D elf_round_up(&elf, cmdline_len);
>=20
>      last_addr =3D find_memory(d, &elf, extra_space);
>      if ( last_addr =3D=3D INVALID_PADDR )
> @@ -778,21 +777,21 @@ static int __init pvh_load_kernel(
>      /* Free temporary buffers. */
>      free_boot_modules();
>=20
> -    if ( cmdline !=3D NULL )
> +    rc =3D hvm_copy_to_guest_phys(last_addr, bd->cmdline, cmdline_len, v=
);
> +    if ( rc )
>      {
> -        rc =3D hvm_copy_to_guest_phys(last_addr, cmdline, strlen(cmdline=
) + 1, v);
> -        if ( rc )
> -        {
> -            printk("Unable to copy guest command line\n");
> -            return rc;
> -        }
> -        start_info.cmdline_paddr =3D last_addr;
> -        /*
> -         * Round up to 32/64 bits (depending on the guest kernel bitness=
) so
> -         * the modlist/start_info is aligned.
> -         */
> -        last_addr +=3D elf_round_up(&elf, strlen(cmdline) + 1);
> +        printk("Unable to copy guest command line\n");

Side note: I think it makes sense to add domain ID to all printouts in
pvh_load_kernel(). E.g. block under elf_xen_parse() logs domain ID.

> +        return rc;
>      }
> +
> +    start_info.cmdline_paddr =3D cmdline_len ? last_addr : 0;
> +
> +    /*
> +     * Round up to 32/64 bits (depending on the guest kernel bitness) so
> +     * the modlist/start_info is aligned.
> +     */
> +    last_addr +=3D elf_round_up(&elf, cmdline_len);
> +
>      if ( initrd !=3D NULL )
>      {
>          rc =3D hvm_copy_to_guest_phys(last_addr, &mod, sizeof(mod), v);
> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/includ=
e/asm/boot-domain.h
> index fcbedda0f0..d7c6042e25 100644
> --- a/xen/arch/x86/include/asm/boot-domain.h
> +++ b/xen/arch/x86/include/asm/boot-domain.h
> @@ -15,6 +15,7 @@ struct boot_domain {
>=20
>      struct boot_module *kernel;
>      struct boot_module *module;
> +    const char *cmdline;
>=20
>      struct domain *d;
>  };
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index b485eea05f..e1b78d47c2 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -972,8 +972,8 @@ static int __init dom0_construct(const struct boot_do=
main *bd)
>      }
>=20
>      memset(si->cmd_line, 0, sizeof(si->cmd_line));
> -    if ( image->cmdline_pa )
> -        strlcpy((char *)si->cmd_line, __va(image->cmdline_pa), sizeof(si=
->cmd_line));
> +    if ( bd->cmdline )
> +        strlcpy((char *)si->cmd_line, bd->cmdline, sizeof(si->cmd_line))=
;
>=20
>  #ifdef CONFIG_VIDEO
>      if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 3c257f0bad..4df012460d 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -978,10 +978,30 @@ static unsigned int __init copy_bios_e820(struct e8=
20entry *map, unsigned int li
>      return n;
>  }
>=20
> -static struct domain *__init create_dom0(struct boot_info *bi)
> +static size_t __init domain_cmdline_size(const struct boot_info *bi,
> +                                         const struct boot_domain *bd)
>  {
> -    static char __initdata cmdline[MAX_GUEST_CMDLINE];
> +    size_t s =3D bi->kextra ? strlen(bi->kextra) : 0;
> +
> +    s +=3D bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa))=
 : 0;
>=20
> +    if ( s =3D=3D 0 )
> +        return s;
> +
> +    /*
> +     * Certain parameters from the Xen command line may be added to the =
dom0
> +     * command line. Add additional space for the possible cases along w=
ith one
> +     * extra char to hold \0.
> +     */
> +    s +=3D strlen(" noapic") + strlen(" acpi=3D") + sizeof(acpi_param) +=
 1;
> +
> +    return s;
> +}
> +
> +static struct domain *__init create_dom0(struct boot_info *bi)
> +{
> +    char *cmdline =3D NULL;
> +    size_t cmdline_size;
>      struct xen_domctl_createdomain dom0_cfg =3D {
>          .flags =3D IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrit=
y : 0,
>          .max_evtchn_port =3D -1,
> @@ -1020,20 +1040,24 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
>      if ( alloc_dom0_vcpu0(d) =3D=3D NULL )
>          panic("Error creating %pdv0\n", d);
>=20
> -    /* Grab the DOM0 command line. */
> -    if ( bd->kernel->cmdline_pa || bi->kextra )
> +    cmdline_size =3D domain_cmdline_size(bi, bd);
> +    if ( cmdline_size )
>      {
> +        if ( !(cmdline =3D xzalloc_array(char, cmdline_size)) )
> +            panic("Error allocating cmdline buffer for %pd\n", d);
> +
>          if ( bd->kernel->cmdline_pa )
> -            safe_strcpy(cmdline,
> -                        cmdline_cook(__va(bd->kernel->cmdline_pa), bi->l=
oader));
> +            strlcpy(cmdline,
> +                    cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loade=
r),
> +                    cmdline_size);
>=20
>          if ( bi->kextra )
>              /* kextra always includes exactly one leading space. */
> -            safe_strcat(cmdline, bi->kextra);
> +            strlcat(cmdline, bi->kextra, cmdline_size);
>=20
>          /* Append any extra parameters. */
>          if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
> -            safe_strcat(cmdline, " noapic");
> +            strlcat(cmdline, " noapic", cmdline_size);
>=20
>          if ( (strlen(acpi_param) =3D=3D 0) && acpi_disabled )
>          {
> @@ -1043,17 +1067,20 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
>=20
>          if ( (strlen(acpi_param) !=3D 0) && !strstr(cmdline, "acpi=3D") =
)
>          {
> -            safe_strcat(cmdline, " acpi=3D");
> -            safe_strcat(cmdline, acpi_param);
> +            strlcat(cmdline, " acpi=3D", cmdline_size);
> +            strlcat(cmdline, acpi_param, cmdline_size);
>          }
> -
> -        bd->kernel->cmdline_pa =3D __pa(cmdline);
> +        bd->kernel->cmdline_pa =3D 0;
> +        bd->cmdline =3D cmdline;
>      }
>=20
>      bd->d =3D d;
>      if ( construct_dom0(bd) !=3D 0 )
>          panic("Could not construct domain 0\n");
>=20
> +    bd->cmdline =3D NULL;
> +    xfree(cmdline);
> +
>      return d;
>  }
>=20
> --
> 2.43.0
>=20
>=20


