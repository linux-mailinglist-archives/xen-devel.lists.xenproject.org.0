Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFRnGHbArWnq6wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 08 Mar 2026 19:31:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B72231A9D
	for <lists+xen-devel@lfdr.de>; Sun, 08 Mar 2026 19:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1248954.1546513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzItL-0002r0-PN; Sun, 08 Mar 2026 18:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1248954.1546513; Sun, 08 Mar 2026 18:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzItL-0002ny-Iq; Sun, 08 Mar 2026 18:30:15 +0000
Received: by outflank-mailman (input) for mailman id 1248954;
 Sun, 08 Mar 2026 18:30:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdMp=BI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vzItJ-0002ns-TW
 for xen-devel@lists.xenproject.org; Sun, 08 Mar 2026 18:30:14 +0000
Received: from fhigh-a2-smtp.messagingengine.com
 (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5ec386c-1b1c-11f1-9ccf-f158ae23cfc8;
 Sun, 08 Mar 2026 19:30:10 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 31C44140019B;
 Sun,  8 Mar 2026 14:30:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Sun, 08 Mar 2026 14:30:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Mar 2026 14:30:06 -0400 (EDT)
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
X-Inumbo-ID: d5ec386c-1b1c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1772994608;
	 x=1773081008; bh=xdv9Dh7Jkliv5J+kXtIXlzuyxu1hU7sy77WHsvucif4=; b=
	UnWtiZeoD9cDAjt8LtKOXJOwW8zjr/bogpUQLNel/XlB+r6Cw2dL7uZ6zEVa07t4
	OEtiGiEqO9xbD5BfoWnWZkhK4HeX+hIB6lKB7XKPpeBhTOupTK/Pkm5CNzxiBhoy
	vKLvgarnQThdminbLHU4M9PKfOP07pZihrckqM003pxL7rlXvkbteA3EmubPD423
	RQk91KUxd9hCaOoucCKg+rLEPkj53hPei9pKs2j2N8g6OB/pxIlxaU/vW9p1mCdB
	1Po3ft4HKJ97vF4ywvBwHXmkpinOFFPSSF/jTUkhPW+YMsoNTJZLGhzUzlmHQShk
	sJN4a1ScJkQGumtiq04E9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772994608; x=1773081008; bh=xdv9Dh7Jkliv5J+kXtIXlzuyxu1hU7sy77W
	Hsvucif4=; b=u+tAy0AVUmX4aNRIOP5IENeOoGZh8GG23g5QR+OjLOHMYSI3pF8
	imWOpt65G6yh4Yot8V2eCtsGVwwXiiZx7aDrxX1xE6ntZxHRfz7flwPJKEQyMR6k
	78ao3M8Jcp7uPyJhgl6gjxp9CR0bSdwjBMwDcZow4SuoRfTffiUwmSG0dWM5AuGM
	vH3YMCHDdp4u0Thg6q1jk5dG4MSRZF4Ycdx2YgOGEhBdt6qE/+R6yfdanVOJhP5c
	wPJ+DYZFbSyx5B/hkI2S+FlKzBjlvfkeQrUlFbx40DPGh+hQ3Zp1qv1gV1coCf22
	Z6QZDiEqqwjV/e9P3EaMJK+VQ3NdG+q2uWw==
X-ME-Sender: <xms:L8CtaYrbY-eZ6TcPT6wSmUYX8GxRj5lYDAEnlguiq-bTsIRYKIiP_w>
    <xme:L8CtaQ56yEq3QsIZLG9stqyWOE6Q1vvR-AdJwI8A_ZADYo9eYkdr8U0vSOmSVl1j3
    DlI1YrXIHtiA-FjTEHifpeAKfrzPwHrV20uocCsrMzPW9SoE3k>
X-ME-Received: <xmr:L8CtafdnMIkuQTX-AvQrfSBHEch_zYnBU1aX6L1PP00zPNT8KYm_hho7VfwC11nYwopxo7T_i34yYingklTHLS6CxSFjZT8ck0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeehleduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephffffffg
    fedvheejvddtgefhgeffgefhjeevjeekiedvfedtgeelleduueeugedunecuffhomhgrih
    hnpegvfhhirdhithenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehs
    ohhumhihrghjhihothhishgrrhhkrghrvdefsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghp
    thhtohepshgrrhhkrghrshhouhhmhigrjhihohhtihdvfeesghhmrghilhdrtghomhdprh
    gtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepughpshhm
    ihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtoheprhhogh
    gvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohho
    phgvrhefsegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:L8CtaV6cZ38cjLD_Y6RiQOvSXHfRl3mwxD8PNpPsqcrCLnmCyQafKg>
    <xmx:L8CtaWvc9kfsj-IhgUH0E7XcmLMHfWxWxPd5IKudGEMfy9N9EiKX7Q>
    <xmx:L8CtaVhbFb1DF7hQIbwXMGvUTTpzjOdKAipwJRDn-uP-CKgDnVAFCw>
    <xmx:L8CtaRpQI6tbVxyTlj01N5ehYvR0TfVrnPRT1gxu5kFGIXK-mSYsVw>
    <xmx:MMCtaaHBdsD-sqte_XJjCyoYE8iBDxXho-VGxtugqUr0JDr8dwX7HtnC>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 8 Mar 2026 19:30:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/efi: Add BGRT image preservation during boot
Message-ID: <aa3AKoCFFhwD4-LX@mail-itl>
References: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
 <20260305191810.31033-2-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hk58erJFVw0zWvNQ"
Content-Disposition: inline
In-Reply-To: <20260305191810.31033-2-soumyajyotisarkar23@gmail.com>
X-Rspamd-Queue-Id: 74B72231A9D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:soumyajyotisarkar23@gmail.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,suse.com,apertussolutions.com,citrix.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action


--hk58erJFVw0zWvNQ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 8 Mar 2026 19:30:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/efi: Add BGRT image preservation during boot

On Fri, Mar 06, 2026 at 12:48:08AM +0530, Soumyajyotii Ssarkar wrote:
> The ACPI BGRT (Boot Graphics Resource Table) contains a pointer to a
> boot logo image stored in BootServicesData memory. When Xen reclaims
> this memory during boot, the image is lost and the BGRT table becomes
> invalid, causing Linux dom0 to report ACPI checksum errors.
>=20
> Add preservation logic similar to ESRT table handling:
> - Locate BGRT table via XSDT during EFI boot services phase
> - Validate BMP image signature and size (max 16 MB)
> - Copy image to EfiACPIReclaimMemory (safe from reclamation)
> - Update BGRT table with new image address
> - Recalculate ACPI table checksum
>=20
> The preservation runs automatically during efi_exit_boot() before
> Boot Services are terminated. This ensures the image remains
> accessible to dom0.
>=20
> Open coded ACPI parsing is used because Xen's ACPI subsystem is not
> available during the EFI boot phase. The RSDP is obtained from the
> EFI System Table, and the XSDT is walked manually to find BGRT.

Thanks, this overall looks good, and it works :) See few remarks below.

> Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
> ---
>  xen/arch/x86/efi/efi-boot.h |   2 +
>  xen/common/efi/boot.c       | 187 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 189 insertions(+)
>=20
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 42a2c46b5e..27792a56ff 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -910,6 +910,8 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle,
>=20
>      efi_relocate_esrt(SystemTable);
>=20
> +    efi_preserve_bgrt_img(SystemTable);
> +

This covers only multiboot path, but not xen.efi. It needs adding also
in efi_start().

>      efi_exit_boot(ImageHandle, SystemTable);
>  }
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 967094994d..1e3489e902 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -7,6 +7,7 @@
>  #include <xen/ctype.h>
>  #include <xen/dmi.h>
>  #include <xen/domain_page.h>
> +#include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/keyhandler.h>
>  #include <xen/lib.h>
> @@ -173,6 +174,14 @@ static struct file __initdata ramdisk;
>  static struct file __initdata xsm;
>  static const CHAR16 __initconst newline[] =3D L"\r\n";
>=20
> +static __initdata struct {
> +    bool preserved;
> +    uint64_t old_addr;
> +    uint64_t new_addr;
> +    uint32_t size;
> +    const char *failure_reason;
> +} bgrt_debug_info;
> +
>  static void __init PrintStr(const CHAR16 *s)
>  {
>      StdOut->OutputString(StdOut, (CHAR16 *)s );
> @@ -747,6 +756,171 @@ static void __init efi_relocate_esrt(EFI_SYSTEM_TAB=
LE *SystemTable)
>      efi_bs->FreePool(memory_map);
>  }
>=20
> +struct bmp_header {
> +    uint16_t signature;
> +    uint32_t file_size;
> +    uint16_t reserved_1;
> +    uint16_t reserved_2;
> +    uint32_t data_offset;
> +} __attribute__((packed));
> +
> +/*
> + * ACPI Structures - defined locally,
> + * since we cannot include acpi headers
> + * in EFI Context.
> + */
> +
> +struct acpi_rsdp {
> +    char signature[8];
> +    uint8_t checksum;
> +    char oem_id[6];
> +    uint8_t revision;
> +    uint32_t rsdt_physical_address;
> +    uint32_t length;
> +    uint64_t xsdt_physical_address;
> +    uint8_t extended_checksum;
> +    uint8_t reserved[3];
> +} __attribute__((packed));
> +
> +struct acpi_table_header {
> +    char signature[4];
> +    uint32_t length;
> +    uint8_t revision;
> +    uint8_t checksum;
> +    char oem_id[6];
> +    char oem_table_id[8];
> +    uint32_t oem_revision;
> +    uint32_t asl_compiler_id;
> +    uint32_t asl_compiler_revision;
> +} __attribute__((packed));
> +
> +struct acpi_xsdt {
> +    struct acpi_table_header header;
> +    uint64_t table_offset_entry[1]; /* Variable array length */

uint64_t table_offset_entry[];

BTW, do we have some canonical place with list of files imported (and
kept in sync) with other projects? xen/include/acpi/actbl.h doesn't
exactly follow Xen coding style, but it's unclear to me if it needs to
stay this way.

> +} __attribute__((packed));
> +
> +struct acpi_bgrt {
> +    struct acpi_table_header header;
> +    uint16_t version;
> +    uint8_t status;
> +    uint8_t image_type;
> +    uint64_t image_address;
> +    uint32_t image_offset_x;
> +    uint32_t image_offset_y;
> +} __attribute__((packed));
> +
> +static struct acpi_bgrt* __init find_bgrt_table(EFI_SYSTEM_TABLE *System=
Table)
> +{
> +    EFI_GUID acpi2_guid =3D ACPI_20_TABLE_GUID;
> +    struct acpi_rsdp *rsdp =3D NULL;
> +    struct acpi_xsdt *xsdt;
> +    struct acpi_bgrt *bgrt;
> +    uint32_t entry_count, actual_size;
> +    unsigned int i;
> +
> +    for ( i =3D 0; i < SystemTable->NumberOfTableEntries; i++ )
> +    {
> +        if ( match_guid(&acpi2_guid, &SystemTable->ConfigurationTable[i]=
=2EVendorGuid) )
> +        {
> +            rsdp =3D SystemTable->ConfigurationTable[i].VendorTable;
> +            break;
> +        }
> +    }
> +
> +    if ( !rsdp || !rsdp->xsdt_physical_address )
> +        return NULL;
> +
> +    xsdt =3D (struct acpi_xsdt *)rsdp->xsdt_physical_address;
> +    if ( !xsdt )
> +        return NULL;
> +
> +    actual_size =3D (xsdt->header.length - sizeof(struct acpi_table_head=
er));
> +    entry_count =3D (actual_size / sizeof(uint64_t));
> +
> +    for ( i =3D 0; i < entry_count; i++ )
> +    {
> +        struct acpi_table_header *header =3D (struct acpi_table_header *=
)xsdt->table_offset_entry[i];
> +
> +        if (   header->signature[0] =3D=3D 'B'
> +            && header->signature[1] =3D=3D 'G'
> +            && header->signature[2] =3D=3D 'R'
> +            && header->signature[3] =3D=3D 'T' )

strncmp?

> +        {
> +            bgrt =3D (struct acpi_bgrt *)header;

You can just return it here, avoiding the extra variable.

> +            return bgrt;
> +        }
> +    }
> +    return NULL;
> +}
> +
> +#define MAX_IMAGE_SIZE  (16 * 1024 * 1024)    /* Sanity check: reject if=
 bigger */
> +
> +static void __init efi_preserve_bgrt_img(EFI_SYSTEM_TABLE *SystemTable)
> +{
> +    struct acpi_bgrt *bgrt;
> +    struct bmp_header *bmp;
> +    void *old_image, *new_image;
> +    uint32_t image_size;
> +    EFI_STATUS status;
> +    uint8_t checksum;
> +    unsigned int i;
> +
> +    bgrt_debug_info.preserved =3D false;
> +    bgrt_debug_info.failure_reason =3D NULL;
> +
> +    bgrt =3D find_bgrt_table(SystemTable);
> +    if ( !bgrt )
> +    {
> +        bgrt_debug_info.failure_reason =3D "BGRT table not found in XSDT=
";
> +        return;
> +    }
> +
> +    if ( !bgrt->image_address )
> +    {
> +        bgrt_debug_info.failure_reason =3D "BGRT image_address is NULL";
> +        return;
> +    }
> +
> +    old_image =3D (void *)bgrt->image_address;
> +    bmp =3D (struct bmp_header *)old_image;
> +
> +    if ( bmp->signature !=3D 0x4D42 )
> +    {
> +        bgrt_debug_info.failure_reason =3D "Invalid BMP signature";
> +        return;
> +    }
> +
> +    image_size =3D bmp->file_size;
> +    if ( !image_size || image_size > MAX_IMAGE_SIZE )
> +    {
> +        bgrt_debug_info.failure_reason =3D "Invalid image size";
> +        return;
> +    }
> +
> +    status =3D efi_bs->AllocatePool(EfiACPIReclaimMemory, image_size, &n=
ew_image);
> +    if ( status !=3D EFI_SUCCESS || !new_image )
> +    {
> +        bgrt_debug_info.failure_reason =3D "Memory allocation failed";
> +        return;
> +    }
> +
> +    memcpy(new_image, old_image, image_size);
> +
> +    bgrt->image_address =3D (uint64_t)new_image;
> +    bgrt->status |=3D 0x01;

Why forcing the "displayed" bit here?

> +    bgrt->header.checksum =3D 0;
> +    checksum =3D 0;
> +    for ( i =3D 0; i < bgrt->header.length; i++ )
> +        checksum +=3D ((uint8_t *)bgrt)[i];
> +    bgrt->header.checksum =3D (uint8_t)(0 - checksum);
> +
> +    bgrt_debug_info.preserved =3D true;
> +    bgrt_debug_info.old_addr =3D (uint64_t)old_image;
> +    bgrt_debug_info.new_addr =3D (uint64_t)new_image;
> +    bgrt_debug_info.size =3D image_size;
> +}
> +

This is quite a bit of code, maybe move to a separate file? But I'd like
to hear what others think.

>  /*
>   * Include architecture specific implementation here, which references t=
he
>   * static globals defined above.
> @@ -1794,6 +1968,19 @@ void __init efi_init_memory(void)
>      if ( !efi_enabled(EFI_BOOT) )
>          return;
>=20
> +    if ( bgrt_debug_info.preserved )
> +    {
> +        printk(XENLOG_INFO "EFI: BGRT image preserved: %u KB\n",
> +               bgrt_debug_info.size / 1024);
> +        printk(XENLOG_INFO "EFI: BGRT relocated from %#" PRIx64 " to %#"=
 PRIx64 "\n",
> +               bgrt_debug_info.old_addr, bgrt_debug_info.new_addr);
> +    }
> +    else if ( bgrt_debug_info.failure_reason )
> +    {
> +        printk(XENLOG_WARNING "EFI: BGRT preservation failed: %s\n",
> +               bgrt_debug_info.failure_reason);
> +    }
> +

This is a bit unfortunate place to print this info, because it happens
_after_ possibly printing the "invalidating image" message.
Maybe you can wrap it in another function and call it next to the
invalidating code?

>      printk(XENLOG_DEBUG "EFI memory map:%s\n",
>             map_bs ? " (mapping BootServices)" : "");
>      for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
> --
> 2.53.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--hk58erJFVw0zWvNQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmtwCoACgkQ24/THMrX
1ywYQwgAjlzyOTusTIwqQ/+NTXJJ6T4UiAGHGlGwG3QcqnK030p1g2t/4DWNjCsF
546AtxPHLNdsV8aAW+ZXJy6ZXwET6OtOqoNUmnw3IWJt5P6Nxgy6Paib5fl2XvVw
x62GlKk3gD62C/gV6zS7Op45gWda++9fLmPNcVh6bY0i3DKKdC87l+QWvDaXXawH
jbhYmO2xFHQZDQwqQwf6R6fRvAFPxudae+8w7usdLLMdoLThxbzpGoWgPd52Nimo
x0K4T6ba5wAnxVAidQHSVHDxDH+sy6UhvFMPk/q/VHTL1PyVCGUMLyZHADNfWq9F
PDAqkl0yOp/AvIIlO8mbJKxJv8uC9Q==
=oIJv
-----END PGP SIGNATURE-----

--hk58erJFVw0zWvNQ--

