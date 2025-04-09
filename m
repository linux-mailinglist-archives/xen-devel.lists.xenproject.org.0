Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDACA832F6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 23:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944666.1343057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2cbz-0001ZH-Uv; Wed, 09 Apr 2025 21:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944666.1343057; Wed, 09 Apr 2025 21:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2cbz-0001Wd-SC; Wed, 09 Apr 2025 21:05:31 +0000
Received: by outflank-mailman (input) for mailman id 944666;
 Wed, 09 Apr 2025 21:05:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ywx6=W3=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u2cbx-0001WX-LR
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 21:05:30 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c153e5f-1586-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 23:05:26 +0200 (CEST)
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
X-Inumbo-ID: 5c153e5f-1586-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=nrswsrigffbi7chan7kkvvb4mq.protonmail; t=1744232723; x=1744491923;
	bh=WeyoovXlO53NrWyhdxrWlGfsKzupPYL0oBSVR88Gd58=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=F2pWj4auIo0nQpCWORCz1xXb2RWKpPIHNLg/OOCTSNXKmYFixyhSeZY+pMKUB+bM8
	 sHPTl7jt6HUFcoJkvei0D/VvQaV9vo39DkmmCUBoHbIsVZ4OEblB4uOmndeaXaeaBB
	 I0i3ysuk0xqB0sQp5vOrV1opkSgLtWcS76uFuFqKMXH155yypiXE/UvwQ6NUl6RcjW
	 4mPC6wIzA8TSuAuqz8z5Th4eFisnHUZrSk0dqyTHZ0Q3cRbktv85Y0jfGbo9xZG73M
	 Sc9SGxDJour3cwHv0v365Yvj82H7Myah22nSI47Kav1QiYvc36PUk5CU0m8J6xNEcx
	 E0Zift3v4giiQ==
Date: Wed, 09 Apr 2025 21:05:18 +0000
To: Alejandro Vallejo <agarciav@amd.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: xen-devel@lists.xenproject.org, "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 03/16] x86/boot: add cmdline to struct boot_domain
Message-ID: <ay75cmCDuxMtW2NROw3rcPNNhWU-QXAuk25j_isEbVoH7WmECfIC1xWw9hX-yvWKDXqamxx32tum4_3CRN46CGrgQKk1_loSZsExg4Ata1s=@proton.me>
In-Reply-To: <20250408160802.49870-4-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com> <20250408160802.49870-4-agarciav@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d13396960db427cbc733cdd4cf0ccdcf2aa6f0d3
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
> Add a container for the "cooked" command line for a domain. This
> provides for the backing memory to be directly associated with the
> domain being constructed. This is done in anticipation that the domain
> construction path may need to be invoked multiple times, thus ensuring
> each instance had a distinct memory allocation.
>=20
> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>=20
> Signed-off-by: Jason Andryuk jason.andryuk@amd.com
>=20
> Signed-off-by: Alejandro Vallejo agarciav@amd.com
>=20
> ---
> No changes on ACPI cmdline handling on PVH, as it's orthogonal to the
> purpose of this patch.
>=20
> v3:
> * s/xfree/XFREE/ on failed construct_dom0() to avoid a dangling
> cmdline ptr.
> * Re-flow hvm_copy_to_guest_phys() into a multi-line call.
> * s/bd->cmdline !=3D NULL/b->cmdline/ (to homogenise with the previous
>=20
> cmdline pointer check)
> ---
> xen/arch/x86/hvm/dom0_build.c | 12 +++----
> xen/arch/x86/include/asm/boot-domain.h | 1 +
> xen/arch/x86/pv/dom0_build.c | 4 +--
> xen/arch/x86/setup.c | 50 +++++++++++++++++++-------
> 4 files changed, 47 insertions(+), 20 deletions(-)
>=20
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.=
c
> index 2a094b3145..ebad5a49b8 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -653,7 +653,6 @@ static int __init pvh_load_kernel(
> void *image_start =3D image_base + image->headroom;
>=20
> unsigned long image_len =3D image->size;
>=20
> unsigned long initrd_len =3D initrd ? initrd->size : 0;
>=20
> - const char *cmdline =3D image->cmdline_pa ? __va(image->cmdline_pa) : N=
ULL;
>=20
> const char *initrd_cmdline =3D NULL;
> struct elf_binary elf;
> struct elf_dom_parms parms;
> @@ -736,8 +735,8 @@ static int __init pvh_load_kernel(
> initrd =3D NULL;
> }
>=20
> - if ( cmdline )
> - extra_space +=3D elf_round_up(&elf, strlen(cmdline) + 1);
> + if ( bd->cmdline )
>=20
> + extra_space +=3D elf_round_up(&elf, strlen(bd->cmdline) + 1);

I think it makes sense to use local variable to cache the results of=20

  strlen(bd->cmdline) + 1

since the construct is used multiple times within pvh_load_kernel()

E.g. cmdline_len similarly to {image,initrd}_len.

>=20
>=20
> last_addr =3D find_memory(d, &elf, extra_space);
> if ( last_addr =3D=3D INVALID_PADDR )
> @@ -778,9 +777,10 @@ static int __init pvh_load_kernel(
> /* Free temporary buffers. */
> free_boot_modules();
>=20
> - if ( cmdline !=3D NULL )
> + if ( bd->cmdline )
>=20
> {
> - rc =3D hvm_copy_to_guest_phys(last_addr, cmdline, strlen(cmdline) + 1, =
v);
> + rc =3D hvm_copy_to_guest_phys(last_addr, bd->cmdline,
>=20
> + strlen(bd->cmdline) + 1, v);
>=20
> if ( rc )
> {
> printk("Unable to copy guest command line\n");
> @@ -791,7 +791,7 @@ static int __init pvh_load_kernel(
> * Round up to 32/64 bits (depending on the guest kernel bitness) so
> * the modlist/start_info is aligned.
> */
> - last_addr +=3D elf_round_up(&elf, strlen(cmdline) + 1);
> + last_addr +=3D elf_round_up(&elf, strlen(bd->cmdline) + 1);
>=20
> }
> if ( initrd !=3D NULL )
> {
> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/includ=
e/asm/boot-domain.h
> index fcbedda0f0..d7c6042e25 100644
> --- a/xen/arch/x86/include/asm/boot-domain.h
> +++ b/xen/arch/x86/include/asm/boot-domain.h
> @@ -15,6 +15,7 @@ struct boot_domain {
>=20
> struct boot_module *kernel;
> struct boot_module *module;
> + const char *cmdline;
>=20
> struct domain *d;
> };
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index b485eea05f..e1b78d47c2 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -972,8 +972,8 @@ static int __init dom0_construct(const struct boot_do=
main *bd)
> }
>=20
> memset(si->cmd_line, 0, sizeof(si->cmd_line));
>=20
> - if ( image->cmdline_pa )
>=20
> - strlcpy((char *)si->cmd_line, __va(image->cmdline_pa), sizeof(si->cmd_l=
ine));
>=20
> + if ( bd->cmdline )
>=20
> + strlcpy((char *)si->cmd_line, bd->cmdline, sizeof(si->cmd_line));
>=20
>=20
> #ifdef CONFIG_VIDEO
> if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 585316f1ca..83cb66e309 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -978,10 +978,30 @@ static unsigned int __init copy_bios_e820(struct e8=
20entry *map, unsigned int li
> return n;
> }
>=20
> -static struct domain *__init create_dom0(struct boot_info *bi)
> +static size_t __init domain_cmdline_size(
> + struct boot_info *bi, struct boot_domain *bd)
> {
> - static char __initdata cmdline[MAX_GUEST_CMDLINE];
> + size_t s =3D bi->kextra ? strlen(bi->kextra) : 0;
>=20
> +
> + s +=3D bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : =
0;
>=20
>=20
> + if ( s =3D=3D 0 )
> + return s;
> +
> + /*
> + * Certain parameters from the Xen command line may be added to the dom0
> + * command line. Add additional space for the possible cases along with =
one
> + * extra char to hold \0.
> + */
> + s +=3D strlen(" noapic") + strlen(" acpi=3D") + sizeof(acpi_param) + 1;
> +
> + return s;
> +}
> +
> +static struct domain *__init create_dom0(struct boot_info *bi)
> +{
> + char *cmdline =3D NULL;
> + size_t cmdline_size;
> struct xen_domctl_createdomain dom0_cfg =3D {
> .flags =3D IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
> .max_evtchn_port =3D -1,
> @@ -1020,20 +1040,24 @@ static struct domain *__init create_dom0(struct b=
oot_info bi)
> if ( alloc_dom0_vcpu0(d) =3D=3D NULL )
> panic("Error creating %pd vcpu 0\n", d);
>=20
> - / Grab the DOM0 command line. */
> - if ( bd->kernel->cmdline_pa || bi->kextra )
>=20
> + cmdline_size =3D domain_cmdline_size(bi, bd);
> + if ( cmdline_size )
> {
> + if ( !(cmdline =3D xzalloc_array(char, cmdline_size)) )
> + panic("Error allocating cmdline buffer for %pd\n", d);
> +
> if ( bd->kernel->cmdline_pa )
>=20
> - safe_strcpy(cmdline,
> - cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader));
>=20
> + strlcpy(cmdline,
> + cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader),
>=20
> + cmdline_size);
>=20
> if ( bi->kextra )
>=20
> /* kextra always includes exactly one leading space. */
> - safe_strcat(cmdline, bi->kextra);
>=20
> + strlcat(cmdline, bi->kextra, cmdline_size);
>=20
>=20
> /* Append any extra parameters. */
> if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
> - safe_strcat(cmdline, " noapic");
> + strlcat(cmdline, " noapic", cmdline_size);
>=20
> if ( (strlen(acpi_param) =3D=3D 0) && acpi_disabled )
> {
> @@ -1043,17 +1067,19 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
>=20
> if ( (strlen(acpi_param) !=3D 0) && !strstr(cmdline, "acpi=3D") )
> {
> - safe_strcat(cmdline, " acpi=3D");
> - safe_strcat(cmdline, acpi_param);
> + strlcat(cmdline, " acpi=3D", cmdline_size);
> + strlcat(cmdline, acpi_param, cmdline_size);
> }
> -
> - bd->kernel->cmdline_pa =3D __pa(cmdline);
>=20
> + bd->kernel->cmdline_pa =3D 0;
>=20
> + bd->cmdline =3D cmdline;
>=20
> }
>=20
> bd->d =3D d;
>=20
> if ( construct_dom0(bd) !=3D 0 )
> panic("Could not construct domain 0\n");
>=20
> + XFREE(cmdline);
> +
> return d;
> }
>=20
> --
> 2.43.0

