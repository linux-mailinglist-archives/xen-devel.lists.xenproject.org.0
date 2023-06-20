Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CDF737653
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 23:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552336.862359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiS1-0000Ve-Fz; Tue, 20 Jun 2023 20:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552336.862359; Tue, 20 Jun 2023 20:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiS1-0000Tx-Cf; Tue, 20 Jun 2023 20:59:45 +0000
Received: by outflank-mailman (input) for mailman id 552336;
 Tue, 20 Jun 2023 20:59:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJOa=CI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qBiRz-0000Tr-ET
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 20:59:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f57bf06-0fad-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 22:59:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8CEC560F1D;
 Tue, 20 Jun 2023 20:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E548C433C0;
 Tue, 20 Jun 2023 20:59:37 +0000 (UTC)
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
X-Inumbo-ID: 5f57bf06-0fad-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687294779;
	bh=onHTV6o5xCP8GwTIKTJiRzhAXEXmKAxnDB9lhtG1dYQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QcErpQeOmhD/bzVeLAFsNhPvKjkGBlImVP1DBtbe8u+bm/HnN/ZQDSIq6Ch4sDiO2
	 MqxETQ4mWaAwvCwGel5gorEDMVwRQ13UeEBDkziZoStOXWLu4TUl36zYjuTrL4Cl7i
	 fAIMxkNAmSlkcLB95jeunaYPpwIKlB2U2gIkhlZIRqBBw8UDqHLKsW120B8oXJZS0O
	 rIWYugcz3ieEnBYpFMOBTAvOdzAIfkVAubKNr+JroUwHCwUsHPoKXfkvWB9V08z2AH
	 +fZQr8sekr3d/zNUUQ68pj5o3JUxq7jzUQMRX13hFm519GKzqO4n4NG4yPw1WaTjAC
	 XwZO9bb8+qhZg==
Date: Tue, 20 Jun 2023 13:59:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH 06/13] xen/efi: fixed violations of MISRA C:2012 Rule
 7.2
In-Reply-To: <019b934cb1e96affd7429c1632fbfe3faacc663e.1687250177.git.gianluca.luparini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2306201358260.897208@ubuntu-linux-20-04-desktop>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com> <019b934cb1e96affd7429c1632fbfe3faacc663e.1687250177.git.gianluca.luparini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Jun 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
> "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
> 
> I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
> For homogeneity, I also added the "U" suffix in some cases that the tool didn't report as violations.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  xen/arch/x86/include/asm/x86_64/efibind.h | 10 +++++-----
>  xen/common/efi/boot.c                     |  8 ++++----
>  xen/common/efi/runtime.c                  |  2 +-
>  xen/include/efi/efiapi.h                  | 10 +++++-----
>  xen/include/efi/efidef.h                  |  2 +-
>  xen/include/efi/efiprot.h                 | 22 +++++++++++-----------
>  6 files changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/x86_64/efibind.h b/xen/arch/x86/include/asm/x86_64/efibind.h
> index e23cd16cb6..773ef9b063 100644
> --- a/xen/arch/x86/include/asm/x86_64/efibind.h
> +++ b/xen/arch/x86/include/asm/x86_64/efibind.h
> @@ -117,13 +117,13 @@ typedef uint64_t   UINTN;
>      #endif
>  #endif
>  
> -#define EFIERR(a)           (0x8000000000000000 | a)
> -#define EFI_ERROR_MASK      0x8000000000000000
> -#define EFIERR_OEM(a)       (0xc000000000000000 | a)
> +#define EFIERR(a)           (0x8000000000000000U | a)
> +#define EFI_ERROR_MASK      0x8000000000000000U
> +#define EFIERR_OEM(a)       (0xc000000000000000U | a)
  
I know that Jan asked not to change this file, but I wanted to point out
that this should have been ULL because U is not enough to hold a 64-bit
value on some architectures.

  
> -#define BAD_POINTER         0xFBFBFBFBFBFBFBFB
> -#define MAX_ADDRESS         0xFFFFFFFFFFFFFFFF
> +#define BAD_POINTER         0xFBFBFBFBFBFBFBFBU
> +#define MAX_ADDRESS         0xFFFFFFFFFFFFFFFFU
>  
>  #ifdef EFI_NT_EMULATOR
>      #define BREAKPOINT()        __asm { int 3 }
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index c5850c26af..28a57fe434 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -34,13 +34,13 @@
>  #define EFI_REVISION(major, minor) (((major) << 16) | (minor))
>  
>  #define SMBIOS3_TABLE_GUID \
> -  { 0xf2fd1544, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0xe3, 0x94} }
> +  { 0xf2fd1544U, 0x9794U, 0x4a2cU, {0x99U, 0x2eU, 0xe5U, 0xbbU, 0xcfU, 0x20U, 0xe3U, 0x94U} }
>  #define SHIM_LOCK_PROTOCOL_GUID \
> -  { 0x605dab50, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b, 0x23} }
> +  { 0x605dab50U, 0xe046U, 0x4300U, {0xabU, 0xb6U, 0x3dU, 0xd8U, 0x10U, 0xddU, 0x8bU, 0x23U} }
>  #define APPLE_PROPERTIES_PROTOCOL_GUID \
> -  { 0x91bd12fe, 0xf6c3, 0x44fb, { 0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0} }
> +  { 0x91bd12feU, 0xf6c3U, 0x44fbU, { 0xa5U, 0xb7U, 0x51U, 0x22U, 0xabU, 0x30U, 0x3aU, 0xe0U} }
>  #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
> -  { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21, 0x80} }
> +  { 0xb122a263U, 0x3661U, 0x4f68U, {0x99U, 0x29U, 0x78U, 0xf8U, 0xb0U, 0xd6U, 0x21U, 0x80U} }
>  #define EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION 1
>  
>  typedef struct {
> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
> index 13b0975866..5cb7504c96 100644
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -698,7 +698,7 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
>  #ifndef COMPAT
>      op->status = status;
>  #else
> -    op->status = (status & 0x3fffffff) | ((status >> 32) & 0xc0000000);
> +    op->status = (status & 0x3fffffffU) | ((status >> 32) & 0xc0000000U);
>  #endif
>  
>      return rc;
> diff --git a/xen/include/efi/efiapi.h b/xen/include/efi/efiapi.h
> index a616d1238a..8481e176ae 100644
> --- a/xen/include/efi/efiapi.h
> +++ b/xen/include/efi/efiapi.h
> @@ -868,19 +868,19 @@ typedef struct _EFI_BOOT_SERVICES {
>  //
>  
>  #define MPS_TABLE_GUID    \
> -    { 0xeb9d2d2f, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
> +    { 0xeb9d2d2fU, 0x2d88U, 0x11d3U, {0x9aU, 0x16U, 0x0U, 0x90U, 0x27U, 0x3fU, 0xc1U, 0x4dU} }
>  
>  #define ACPI_TABLE_GUID    \
> -    { 0xeb9d2d30, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
> +    { 0xeb9d2d30U, 0x2d88U, 0x11d3U, {0x9aU, 0x16U, 0x0U, 0x90U, 0x27U, 0x3fU, 0xc1U, 0x4dU} }
>  
>  #define ACPI_20_TABLE_GUID  \
> -    { 0x8868e871, 0xe4f1, 0x11d3, {0xbc, 0x22, 0x0, 0x80, 0xc7, 0x3c, 0x88, 0x81} }
> +    { 0x8868e871U, 0xe4f1U, 0x11d3U, {0xbcU, 0x22U, 0x0U, 0x80U, 0xc7U, 0x3cU, 0x88U, 0x81U} }
>  
>  #define SMBIOS_TABLE_GUID    \
> -    { 0xeb9d2d31, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
> +    { 0xeb9d2d31U, 0x2d88U, 0x11d3U, {0x9aU, 0x16U, 0x0U, 0x90U, 0x27U, 0x3fU, 0xc1U, 0x4dU} }
>  
>  #define SAL_SYSTEM_TABLE_GUID    \
> -    { 0xeb9d2d32, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
> +    { 0xeb9d2d32U, 0x2d88U, 0x11d3U, {0x9aU, 0x16U, 0x0U, 0x90U, 0x27U, 0x3fU, 0xc1U, 0x4dU} }
>  
>  
>  typedef struct _EFI_CONFIGURATION_TABLE {
> diff --git a/xen/include/efi/efidef.h b/xen/include/efi/efidef.h
> index 86a7e111bf..dab60882d2 100644
> --- a/xen/include/efi/efidef.h
> +++ b/xen/include/efi/efidef.h
> @@ -167,7 +167,7 @@ typedef enum {
>  #define EFI_MEMORY_MORE_RELIABLE 0x0000000000010000
>  
>  // range requires a runtime mapping
> -#define EFI_MEMORY_RUNTIME      0x8000000000000000
> +#define EFI_MEMORY_RUNTIME      0x8000000000000000U
>  
>  #define EFI_MEMORY_DESCRIPTOR_VERSION  1
>  typedef struct {
> diff --git a/xen/include/efi/efiprot.h b/xen/include/efi/efiprot.h
> index 56d7636b2b..d1a8063bde 100644
> --- a/xen/include/efi/efiprot.h
> +++ b/xen/include/efi/efiprot.h
> @@ -38,7 +38,7 @@ Revision History
>  //
>  
>  #define BLOCK_IO_PROTOCOL \
> -    { 0x964e5b21, 0x6459, 0x11d2, {0x8e, 0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b} }
> +    { 0x964e5b21U, 0x6459U, 0x11d2U, {0x8eU, 0x39U, 0x0U, 0xa0U, 0xc9U, 0x69U, 0x72U, 0x3bU} }
>  #define EFI_BLOCK_IO_INTERFACE_REVISION   0x00010000
>  
>  INTERFACE_DECL(_EFI_BLOCK_IO);
> @@ -114,7 +114,7 @@ typedef struct _EFI_BLOCK_IO {
>  //
>  
>  #define DISK_IO_PROTOCOL \
> -    { 0xce345171, 0xba0b, 0x11d2,  {0x8e, 0x4f, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b} }
> +    { 0xce345171U, 0xba0bU, 0x11d2U,  {0x8eU, 0x4fU, 0x0U, 0xa0U, 0xc9U, 0x69U, 0x72U, 0x3bU} }
>  #define EFI_DISK_IO_INTERFACE_REVISION   0x00010000
>  
>  INTERFACE_DECL(_EFI_DISK_IO);
> @@ -153,7 +153,7 @@ typedef struct _EFI_DISK_IO {
>  //
>  
>  #define SIMPLE_FILE_SYSTEM_PROTOCOL \
> -    { 0x964e5b22, 0x6459, 0x11d2, {0x8e, 0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b} }
> +    { 0x964e5b22U, 0x6459U, 0x11d2U, {0x8eU, 0x39U, 0x0U, 0xa0U, 0xc9U, 0x69U, 0x72U, 0x3bU} }
>  
>  INTERFACE_DECL(_EFI_FILE_IO_INTERFACE);
>  INTERFACE_DECL(_EFI_FILE_HANDLE);
> @@ -335,7 +335,7 @@ typedef struct {
>  #define SIZE_OF_EFI_FILE_SYSTEM_INFO EFI_FIELD_OFFSET(EFI_FILE_SYSTEM_INFO,VolumeLabel)
>  
>  #define EFI_FILE_SYSTEM_VOLUME_LABEL_INFO_ID    \
> -    { 0xDB47D7D3,0xFE81, 0x11d3, {0x9A, 0x35, 0x00, 0x90, 0x27, 0x3F, 0xC1, 0x4D} }
> +    { 0xDB47D7D3U,0xFE81U, 0x11d3U, {0x9AU, 0x35U, 0x00U, 0x90U, 0x27U, 0x3FU, 0xC1U, 0x4DU} }
>  
>  typedef struct {
>      CHAR16                  VolumeLabel[1];
> @@ -349,7 +349,7 @@ typedef struct {
>  
>  
>  #define LOAD_FILE_PROTOCOL \
> -    { 0x56EC3091, 0x954C, 0x11d2, {0x8E, 0x3F, 0x00, 0xA0, 0xC9, 0x69, 0x72, 0x3B} }
> +    { 0x56EC3091U, 0x954CU, 0x11d2U, {0x8EU, 0x3FU, 0x00U, 0xA0U, 0xC9U, 0x69U, 0x72U, 0x3BU} }
>  
>  INTERFACE_DECL(_EFI_LOAD_FILE_INTERFACE);
>  
> @@ -373,7 +373,7 @@ typedef struct _EFI_LOAD_FILE_INTERFACE {
>  //
>  
>  #define DEVICE_IO_PROTOCOL \
> -    { 0xaf6ac311, 0x84c3, 0x11d2, {0x8e, 0x3c, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b} }
> +    { 0xaf6ac311U, 0x84c3U, 0x11d2U, {0x8eU, 0x3cU, 0x00U, 0xa0U, 0xc9U, 0x69U, 0x72U, 0x3bU} }
>  
>  INTERFACE_DECL(_EFI_DEVICE_IO_INTERFACE);
>  
> @@ -484,7 +484,7 @@ typedef struct _EFI_DEVICE_IO_INTERFACE {
>  //
>  
>  #define UNICODE_COLLATION_PROTOCOL \
> -    { 0x1d85cd7f, 0xf43d, 0x11d2, {0x9a, 0xc,  0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
> +    { 0x1d85cd7fU, 0xf43dU, 0x11d2U, {0x9aU, 0xcU,  0x0U, 0x90U, 0x27U, 0x3fU, 0xc1U, 0x4dU} }
>  
>  #define UNICODE_BYTE_ORDER_MARK       (CHAR16)(0xfeff)
>  
> @@ -557,7 +557,7 @@ typedef struct _EFI_UNICODE_COLLATION_INTERFACE {
>  /* Graphics output protocol */
>  #define EFI_GRAPHICS_OUTPUT_PROTOCOL_GUID \
>    { \
> -    0x9042a9de, 0x23dc, 0x4a38, {0x96, 0xfb, 0x7a, 0xde, 0xd0, 0x80, 0x51, 0x6a } \
> +    0x9042a9deU, 0x23dcU, 0x4a38U, {0x96U, 0xfbU, 0x7aU, 0xdeU, 0xd0U, 0x80U, 0x51U, 0x6aU } \
>    }
>  
>  typedef struct _EFI_GRAPHICS_OUTPUT_PROTOCOL EFI_GRAPHICS_OUTPUT_PROTOCOL;
> @@ -730,7 +730,7 @@ struct _EFI_GRAPHICS_OUTPUT_PROTOCOL {
>   * UEFI Specification Version 2.5 Section 11.9
>   */
>  #define EFI_EDID_DISCOVERED_PROTOCOL_GUID \
> -    { 0x1C0C34F6, 0xD380, 0x41FA, { 0xA0, 0x49, 0x8a, 0xD0, 0x6C, 0x1A, 0x66, 0xAA} }
> +    { 0x1C0C34F6U, 0xD380U, 0x41FAU, { 0xA0U, 0x49U, 0x8aU, 0xD0U, 0x6CU, 0x1AU, 0x66U, 0xAAU} }
>  
>  typedef struct _EFI_EDID_DISCOVERED_PROTOCOL {
>      UINT32   SizeOfEdid;
> @@ -742,7 +742,7 @@ typedef struct _EFI_EDID_DISCOVERED_PROTOCOL {
>   * UEFI Specification Version 2.5 Section 11.9
>   */
>  #define EFI_EDID_ACTIVE_PROTOCOL_GUID \
> -    { 0xBD8C1056, 0x9F36, 0x44EC, { 0x92, 0xA8, 0xA6, 0x33, 0x7F, 0x81, 0x79, 0x86} }
> +    { 0xBD8C1056U, 0x9F36U, 0x44ECU, { 0x92U, 0xA8U, 0xA6U, 0x33U, 0x7FU, 0x81U, 0x79U, 0x86U} }
>  
>  typedef struct _EFI_EDID_ACTIVE_PROTOCOL {
>      UINT32   SizeOfEdid;
> @@ -754,7 +754,7 @@ typedef struct _EFI_EDID_ACTIVE_PROTOCOL {
>   * UEFI Specification Version 2.5 Section 11.9
>   */
>  #define EFI_EDID_OVERRIDE_PROTOCOL_GUID \
> -    { 0x48ECB431, 0xFB72, 0x45C0, { 0xA9, 0x22, 0xF4, 0x58, 0xFE, 0x04, 0x0B, 0xD5} }
> +    { 0x48ECB431U, 0xFB72U, 0x45C0U, { 0xA9U, 0x22U, 0xF4U, 0x58U, 0xFEU, 0x04U, 0x0BU, 0xD5U} }
>  
>  INTERFACE_DECL(_EFI_EDID_OVERRIDE_PROTOCOL);
>  
> -- 
> 2.41.0
> 

