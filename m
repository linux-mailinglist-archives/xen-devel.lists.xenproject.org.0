Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ1SMu4PGGrmbQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 11:50:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9CE5EFF30
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 11:50:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321049.1588077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSXNb-0000oN-Cw; Thu, 28 May 2026 09:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321049.1588077; Thu, 28 May 2026 09:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSXNb-0000mw-AC; Thu, 28 May 2026 09:50:19 +0000
Received: by outflank-mailman (input) for mailman id 1321049;
 Thu, 28 May 2026 09:50:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wSXNZ-0000mq-K7
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 09:50:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSXNZ-007Vde-0X
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 11:50:17 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a180fd8-e002-0a2a0a5209dd-0a2a4504a6d2-0
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 11:50:16 +0200
Received: from [103.168.172.148] (helo=fout-a5-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a180fd7-1dec-0a2a45040019-67a8ac949649-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 11:50:16 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 6B227EC0209;
 Thu, 28 May 2026 05:50:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 28 May 2026 05:50:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 May 2026 05:50:12 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1779961815;
	 x=1780048215; bh=C73dZ4oni3DpuJAFTI29agQWZYPWOc8CxmxBkhpKbLc=; b=
	T7Viz/dXKICs/HT6/I4iyhQ6gLS0shOHQJ6j4YJNuX2oWyKD6BlprfjoBcMZDPRm
	jOFzSpxtCvYZzRzvjcNa1kkEMTowtO/GdwoBGZG2lNkRJotQtbokcY8A4+LyQ3Uk
	jckFEg8yOOxYboqkAppJoRrH1s+aR+xem47+ZOkeeOAEnj6xXB4707fJOPQHBPo1
	r1Pdsx4lKgbCesli/9Iydv5+VPhqqn2Y3c4R6c0LYu7miGimR7VPtFJfB20EKbow
	RMh+uQspt4wTU23xr+9p1zrsEvqBZVaNpkIzK94V7RqioU1LUejFqHV1p0/UuZD0
	v8WiigTsNZR+OV40KICgKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779961815; x=1780048215; bh=C73dZ4oni3DpuJAFTI29agQWZYPWOc8Cxmx
	BkhpKbLc=; b=Dwlhy1FQIlYWarr41WtAYgyk7tTqSGDEnl5TJqCa3jT6BoFFwI5
	eNI53uvPqcJ89exw933vRRDsb9lFPgqAT7NREwCjDhOtRxvB5o91EEYNWSqyYaGK
	UP49BAq5yOWgdxWoCQS7+tuWpMXCO3vBJckPCeGCXaHd4BkLtjfnJaEJ5DFOqigy
	NqydGfkuMjJ8HWU6d4krAmUXg5SjZTZX8X8Hqiu76LHwfz0Qv5AbpbX3mGT8m+uB
	GU5EzYCxebX3fJN4/1UInPNHrK9DfFAmOKXyJo+7wHDwMRIqo0Uei2Rt3D0qn0MG
	DgYlow7M6aUeB3O3R2upoEV0P8lABRKpKoA==
X-ME-Sender: <xms:1g8Yau1S59xA4j1_3ymH4DgUL_HP6r05MStN6qXP4Y1HcIBbwbj9cw>
    <xme:1g8Yane75S18B3kITZT_E5wZyfXShkoxJnN2TORT8ss53cgYSW9KtOMmn8hcKGH1e
    ubUW4D5OEMW9X4kMXJiP5V6KMCs8K7VEwiEzbDb80T4raflzw>
X-ME-Received: <xmr:1g8YajLd4XGkTWyJk7JICkt-y2rEojYihNtbZb0M0hG9xgcH8CY6KKfV6rBB384PPcKm_dhU_gTUzR3JT6eRFW25waEuMavGnwI>
X-ME-Proxy-Cause: dmFkZTGFAsaPO9BZPACMh9k5z3nuK4s/4yEUfEHbDxVz6Di3PJzYP2vOMWRV/NFe6IPlOE
    OjbxChCOtxOJXafHM/GafqgLYxwKIVVsbSQ08sMYcjpQ1q0qVWUptaedJKh/0zQR8aAtch
    9KvuAt3GXSQhojoxkYpdAONTBUa7RyKAw5JRM1jbpLz4eM/K8jdqP6otmdlDjA75QS86pU
    o9c4WvxaPpb+EkM97S+biNOwDRhj5ZcAXgakpMaeRG92tAoYaTPFab5QHWQif70EL7qBrn
    BAP5StmZo3RutguUECTvnbyW/lfNRDax2RLBmZOqTQggRBo9oBN1CcMvoeti1d4Bl0JDWo
    kdmD01h09fSxP+bBiOXpjU1h9j0snC8xY39nQy24PtIVfJtzj8QGrDBUoHZxj2fqRltxXo
    FNoarmS6OG1lJvzlCKJ4lz74DKOJpPyEIamxwETrGc7Vc5S6RvXte0R9vxVG0NyOsWK8wP
    qo6clXqSi09XxmfHvzwtqBlh5Gq0ayKfvKzUE7xtLmosqC6VYe7u6Aq/ph3KHcDjpveEA6
    A3/e1i3wflSlTZZdeYjT6LZbKXduyHQrF3gg0T+Vhg+yZx5IUzV4gpVvgzzLb+2KpIm+nO
    fUbn2lGDh6isOs4W1XGp8MAVoROZyqhCOjv2IfFtMlfZ0GD6490tNFy5w6pQ
X-ME-Proxy: <xmx:1g8Yatq5axWHOb5gtxCQafKofiAHOuPyvLuoIKOkQbugzKAlZZkccw>
    <xmx:1g8YapsIuuGkEc0CqsywHRF6B_IIjDnMfmKcU4aQVn8s5SZVIgnU2g>
    <xmx:1g8YavI3f6brYS7-id1-aKoLXm4jjXg2HW4zAL7LyvT8UNVEIa1ifw>
    <xmx:1g8YagohdBkLcyYdcpINrJRyBQ1tcvFrtW_F5SRLogCiWVuKkgopjg>
    <xmx:1w8YamZtASRAvjpataCaZgl5pEV2wW34luj1If4yT0GndOKRPqY0wSbf>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 28 May 2026 11:50:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Szymon =?utf-8?Q?Aceda=C5=84ski?= <accek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 for-4.22] EFI: Fix boot from a device without a file
 system
Message-ID: <ahgP0107DSrstj8o@mail-itl>
References: <79d8684ede3bf1e9abe02a2e5ed966a0ecd5949d.1779726979.git.accek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GtheMo/zlbyUu650"
Content-Disposition: inline
In-Reply-To: <79d8684ede3bf1e9abe02a2e5ed966a0ecd5949d.1779726979.git.accek@invisiblethingslab.com>
X-purgate-ID: tlsNG-ebf023/1779961816-2BB6B3FF-E86A6C4E/0/0
X-purgate-type: clean
X-purgate-size: 13196
X-Spamd-Result: default: False [-1.28 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:accek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,citrix.com,kernel.org,xen.org,arm.com,amd.com,epam.com,apertussolutions.com,suse.com,vates.tech];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 1D9CE5EFF30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--GtheMo/zlbyUu650
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 11:50:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Szymon =?utf-8?Q?Aceda=C5=84ski?= <accek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 for-4.22] EFI: Fix boot from a device without a file
 system

On Mon, May 25, 2026 at 07:37:03PM +0200, Szymon Aceda=C5=84ski wrote:
> When netbooting a unified Xen kernel image (via GRUB chainloader),
> the resulting loaded_image->DeviceHandle does not support
> SIMPLE_FILE_SYSTEM_PROTOCOL.
>=20
> Instead of crashing via noreturn PrintErrMesg() in get_parent_handle(),
> we defer calling this function until filesystem access is needed.
> This way when booting UKI, get_parent_handle() is not called at all.
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Suggested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsla=
b.com>
> Signed-off-by: Szymon Aceda=C5=84ski <accek@invisiblethingslab.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> Changes in v3:
>  - read_file(): replaced unreachable `if ( !dir_handle )` branch with
>    BUG_ON(!dir_handle), per Marek's suggestion.
>=20
> Changes in v2:
>  - Restructured along the lines Andrew and Marek both suggested on v1:
>    defer get_parent_handle() until the first call site that actually
>    needs a file.
>=20
>    This mirrors the existing lazy pattern in ARM's
>    allocate_module_file() in xen/arch/arm/efi/efi-boot.h, which was also
>    changed to use the new ensure_dir_handle() helper.
>=20
> Tested (same as v2):
>  - PXE-loaded GRUB chainloading UKI - failure without patch, success
>    with patch
>  - QEMU boot from EFI partition, with config, kernel and initrd
>    on EFI partition too - success with and without patch
>  - Cross-compiling ARM64 - success
>=20
>  xen/arch/arm/efi/efi-boot.h | 12 ++++---
>  xen/arch/x86/efi/efi-boot.h |  9 +++--
>  xen/common/efi/boot.c       | 66 +++++++++++++++++++++++--------------
>  3 files changed, 54 insertions(+), 33 deletions(-)
>=20
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index ea59de47e7..069cc68b0a 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -403,7 +403,7 @@ static void __init noreturn efi_arch_post_exit_boot(v=
oid)
>  }
> =20
>  static void __init efi_arch_cfg_file_early(const EFI_LOADED_IMAGE *image,
> -                                           EFI_FILE_HANDLE dir_handle,
> +                                           EFI_FILE_HANDLE *dir_handle,
>                                             const char *section)
>  {
>      union string name;
> @@ -419,8 +419,11 @@ static void __init efi_arch_cfg_file_early(const EFI=
_LOADED_IMAGE *image,
>          name.s =3D get_value(&cfg, section, "dtb");
>          if ( name.s )
>          {
> +            CHAR16 *fname;
> +
>              split_string(name.s);
> -            read_file(dir_handle, s2w(&name), &dtbfile, NULL);
> +            ensure_dir_handle(image, dir_handle, &fname);
> +            read_file(*dir_handle, s2w(&name), &dtbfile, NULL);
>              efi_bs->FreePool(name.w);
>          }
>      }
> @@ -430,7 +433,7 @@ static void __init efi_arch_cfg_file_early(const EFI_=
LOADED_IMAGE *image,
>  }
> =20
>  static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
> -                                          EFI_FILE_HANDLE dir_handle,
> +                                          EFI_FILE_HANDLE *dir_handle,
>                                            const char *section)
>  {
>  }
> @@ -665,8 +668,7 @@ static int __init allocate_module_file(const EFI_LOAD=
ED_IMAGE *loaded_image,
>      file_info->name_len =3D name_len;
> =20
>      /* Get the file system interface. */
> -    if ( !*dir_handle )
> -        *dir_handle =3D get_parent_handle(loaded_image, &fname);
> +    ensure_dir_handle(loaded_image, dir_handle, &fname);
> =20
>      /* Load the binary in memory */
>      read_file(*dir_handle, s2w(&module_name), &module_binary, NULL);
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 42a2c46b5e..d738b839ee 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -284,13 +284,13 @@ static void __init noreturn efi_arch_post_exit_boot=
(void)
>  }
> =20
>  static void __init efi_arch_cfg_file_early(const EFI_LOADED_IMAGE *image,
> -                                           EFI_FILE_HANDLE dir_handle,
> +                                           EFI_FILE_HANDLE *dir_handle,
>                                             const char *section)
>  {
>  }
> =20
>  static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
> -                                          EFI_FILE_HANDLE dir_handle,
> +                                          EFI_FILE_HANDLE *dir_handle,
>                                            const char *section)
>  {
>      union string name;
> @@ -304,9 +304,12 @@ static void __init efi_arch_cfg_file_late(const EFI_=
LOADED_IMAGE *image,
>          name.s =3D get_value(&cfg, "global", "ucode");
>      if ( name.s )
>      {
> +        CHAR16 *fname;
> +
>          microcode_set_module(mbi.mods_count);
>          split_string(name.s);
> -        read_file(dir_handle, s2w(&name), &ucode, NULL);
> +        ensure_dir_handle(image, dir_handle, &fname);
> +        read_file(*dir_handle, s2w(&name), &ucode, NULL);
>          efi_bs->FreePool(name.w);
>      }
>  }
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 9ea2183c0b..2971ea8696 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -547,6 +547,17 @@ static EFI_FILE_HANDLE __init get_parent_handle(cons=
t EFI_LOADED_IMAGE *loaded_i
>      return dir_handle;
>  }
> =20
> +static void __init ensure_dir_handle(const EFI_LOADED_IMAGE *loaded_imag=
e,
> +                                     EFI_FILE_HANDLE *dir_handle,
> +                                     CHAR16 **file_name)
> +{
> +    if ( *dir_handle )
> +        return;
> +    *dir_handle =3D get_parent_handle(loaded_image, file_name);
> +    if ( !*dir_handle )
> +        blexit(L"Cannot load files without a usable file system");
> +}
> +
>  static CHAR16 *__init point_tail(CHAR16 *fn)
>  {
>      CHAR16 *tail =3D NULL;
> @@ -838,12 +849,11 @@ static bool __init read_file(EFI_FILE_HANDLE dir_ha=
ndle, CHAR16 *name,
>      if ( !name )
>          PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
> =20
> +    BUG_ON(!dir_handle);
> +
>      what =3D L"Open";
> -    if ( dir_handle )
> -        ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
> -                               EFI_FILE_MODE_READ, 0);
> -    else
> -        ret =3D EFI_NOT_FOUND;
> +    ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
> +                           EFI_FILE_MODE_READ, 0);
>      if ( file =3D=3D &cfg && ret =3D=3D EFI_NOT_FOUND )
>          return false;
>      if ( EFI_ERROR(ret) )
> @@ -1514,7 +1524,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
> =20
>      if ( use_cfg_file )
>      {
> -        EFI_FILE_HANDLE dir_handle;
> +        EFI_FILE_HANDLE dir_handle =3D NULL;
>          EFI_HANDLE gop_handle;
>          UINTN depth, cols, rows;
> =20
> @@ -1526,31 +1536,33 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE =
ImageHandle,
> =20
>          gop =3D efi_get_gop(&gop_handle);
> =20
> -        /* Get the file system interface. */
> -        dir_handle =3D get_parent_handle(loaded_image, &file_name);
> -
>          /* Read and parse the config file. */
>          if ( read_section(loaded_image, L"config", &cfg, NULL) )
>              PrintStr(L"Using builtin config file\r\n");
> -        else if ( !cfg_file_name && file_name )
> +        else
>          {
> -            CHAR16 *tail;
> +            ensure_dir_handle(loaded_image, &dir_handle, &file_name);
> =20
> -            while ( (tail =3D point_tail(file_name)) !=3D NULL )
> +            if ( !cfg_file_name )
>              {
> -                wstrcpy(tail, L".cfg");
> -                if ( read_file(dir_handle, file_name, &cfg, NULL) )
> -                    break;
> -                *tail =3D 0;
> +                CHAR16 *tail;
> +
> +                while ( (tail =3D point_tail(file_name)) !=3D NULL )
> +                {
> +                    wstrcpy(tail, L".cfg");
> +                    if ( read_file(dir_handle, file_name, &cfg, NULL) )
> +                        break;
> +                    *tail =3D 0;
> +                }
> +                if ( !tail )
> +                    blexit(L"No configuration file found.");
> +                PrintStr(L"Using configuration file '");
> +                PrintStr(file_name);
> +                PrintStr(L"'\r\n");
>              }
> -            if ( !tail )
> -                blexit(L"No configuration file found.");
> -            PrintStr(L"Using configuration file '");
> -            PrintStr(file_name);
> -            PrintStr(L"'\r\n");
> +            else if ( !read_file(dir_handle, cfg_file_name, &cfg, NULL) )
> +                blexit(L"Configuration file not found.");
>          }
> -        else if ( !read_file(dir_handle, cfg_file_name, &cfg, NULL) )
> -            blexit(L"Configuration file not found.");
>          pre_parse(&cfg);
> =20
>          if ( section.w )
> @@ -1567,6 +1579,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
>              if ( !name.s )
>                  break;
>              free_cfg();
> +            ensure_dir_handle(loaded_image, &dir_handle, &file_name);
>              if ( !read_file(dir_handle, s2w(&name), &cfg, NULL) )
>              {
>                  PrintStr(L"Chained configuration file '");
> @@ -1578,13 +1591,14 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE =
ImageHandle,
>              efi_bs->FreePool(name.w);
>          }
> =20
> -        efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
> +        efi_arch_cfg_file_early(loaded_image, &dir_handle, section.s);
> =20
>          option_str =3D name.s ? split_string(name.s) : NULL;
> =20
>          if ( !read_section(loaded_image, L"kernel", &kernel, option_str)=
 &&
>               name.s )
>          {
> +            ensure_dir_handle(loaded_image, &dir_handle, &file_name);
>              read_file(dir_handle, s2w(&name), &kernel, option_str);
>              efi_bs->FreePool(name.w);
>          }
> @@ -1599,6 +1613,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
>              name.s =3D get_value(&cfg, section.s, "ramdisk");
>              if ( name.s )
>              {
> +                ensure_dir_handle(loaded_image, &dir_handle, &file_name);
>                  read_file(dir_handle, s2w(&name), &ramdisk, NULL);
>                  efi_bs->FreePool(name.w);
>              }
> @@ -1609,6 +1624,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
>              name.s =3D get_value(&cfg, section.s, "xsm");
>              if ( name.s )
>              {
> +                ensure_dir_handle(loaded_image, &dir_handle, &file_name);
>                  read_file(dir_handle, s2w(&name), &xsm, NULL);
>                  efi_bs->FreePool(name.w);
>              }
> @@ -1634,7 +1650,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
>              }
>          }
> =20
> -        efi_arch_cfg_file_late(loaded_image, dir_handle, section.s);
> +        efi_arch_cfg_file_late(loaded_image, &dir_handle, section.s);
> =20
>          free_cfg();
> =20
> --=20
> 2.53.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--GtheMo/zlbyUu650
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoYD9MACgkQ24/THMrX
1yxJVwgAgq+6xbZcL/5OLfwO5x9PaOw0Wg6esPTSN+lHjCN+3JC9bELL9oTb4DMk
UqwO4gLk5IQ3I1FixrFZpyJpaNgvE9+6mT3Sd2AGajpd/Y24eWSyS6XYIMw+PWQ4
tbaPp9BOerdxZIhNZQ/TVXilPk9UobD2LRYtvJtha3Z5kW15z6r50Uud+TeWldxk
wA9Q0Gqu0SNTvzMbDkbS//yuHq+rFLQOo7MWGRUy4C6LUmu127MBGCsvpHbltUwI
tCP1WHPD5cVJHnDQE8ubZl0+UJdvin7tpX1tLpgWhZuWRoFoQa1UDpO48XS1w0BF
XiWMASTZOv/E05mB1tqwEVmdrbrNgw==
=UNcj
-----END PGP SIGNATURE-----

--GtheMo/zlbyUu650--

