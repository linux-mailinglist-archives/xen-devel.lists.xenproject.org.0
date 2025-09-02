Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2DBB3F921
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 10:51:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105822.1456651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utMjT-0006HO-45; Tue, 02 Sep 2025 08:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105822.1456651; Tue, 02 Sep 2025 08:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utMjT-0006Ft-18; Tue, 02 Sep 2025 08:51:15 +0000
Received: by outflank-mailman (input) for mailman id 1105822;
 Tue, 02 Sep 2025 08:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VesH=3N=bounce.vates.tech=bounce-md_30504962.68b6affd.v1-44205d22c4ed434480dfe465bddf34e9@srs-se1.protection.inumbo.net>)
 id 1utMjR-0006Fl-G1
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 08:51:13 +0000
Received: from mail180-6.suw31.mandrillapp.com
 (mail180-6.suw31.mandrillapp.com [198.2.180.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f912f935-87d9-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 10:51:11 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-6.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4cGKGP60m5z2K1s51
 for <xen-devel@lists.xenproject.org>; Tue,  2 Sep 2025 08:51:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 44205d22c4ed434480dfe465bddf34e9; Tue, 02 Sep 2025 08:51:09 +0000
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
X-Inumbo-ID: f912f935-87d9-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756803069; x=1757073069;
	bh=IctssQzfxiWFreFW7P+405nqJQelkdXxf9bCeLRH1ZQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=daO40ZNzOuZPtkHBnQkPCo6QXpGq1aXL/SGBPPhwSTHvbBZ8YNYoE0plPaHrGD844
	 ovRDcN9J3wh4l+YGYa4khvRcMMN4X67EkY44/1IGkOlCDeelhY7swvtI+ArY12YGhq
	 kv5Julx/VIV1AxUInu9DBLHoUgN4AYHmQ/pgkdU2NsIYXqpNJNmgQugXqF2PxLc7ow
	 cgBe1UM4QJI9aywfINL8oNMBMQ+FVxMQ+ijIRwSeW67MEMaI2MhtsmR9nHsB41TSH4
	 Te/lfCWR/PPPJv0ncrzkNdcsxG3YYD40PjcZQuUfsgDCuw1fpXSfi99aPDJIws3fh+
	 ft28B6CjAdROQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756803069; x=1757063569; i=yann.sionneau@vates.tech;
	bh=IctssQzfxiWFreFW7P+405nqJQelkdXxf9bCeLRH1ZQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0yaijl7FuSX27jCiOTp/h9JTykhUxM5snjbz3agSRfYXuAX72Tv9IHr0ksLp/HP00
	 4zXCjfMU5mWQOoMWOc4xcuf3VGWJwHxrQDYeSSuK/kk3jxoDeH0iKKhvdEbgC1xfQf
	 O4W/1FPo/7LL9mxlG8JW4+tEfMkldgpZenyFgQp65HrwheyZAj3QtPJVbm89b/IN3M
	 nhqVa2t2aUV2OiDvGimr21ZWygq4FMfLw81jyb1x44EQjl27+Z+BrHwZJerYzjBYEu
	 StWaL2rmWm8mafJnFqtEuDWM7XNg2Gb6u8UsWe8GqS7Xj+NEY9jIW8gRCmsmCB8hk6
	 5iuDM6VbI0KLQ==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH]=20efi:=20Use=20Shim's=20LoadImage=20to=20verify=20the=20Dom0=20kernel?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756803067924
Message-Id: <9a19193e-39d6-4dce-81f5-f1c0e04bd480@vates.tech>
To: "Gerald Elder-Vass" <gerald.elder-vass@cloud.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Kevin Lampis" <kevin.lampis@cloud.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Jan Beulich" <jbeulich@suse.com>
References: <766be642204043b779cef688ec0ca2f1d64313ad.1756740104.git.gerald.elder-vass@cloud.com>
In-Reply-To: <766be642204043b779cef688ec0ca2f1d64313ad.1756740104.git.gerald.elder-vass@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.44205d22c4ed434480dfe465bddf34e9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250902:md
Date: Tue, 02 Sep 2025 08:51:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 9/1/25 17:37, Gerald Elder-Vass wrote:
> The existing Verify functionality of the Shim lock protocol is
> deprecated and will be removed, instead we must use the LoadImage
> interface to perform the verification.
> 
> When the loading is successful we won't be using the newly loaded image
> (as of yet) so we must then immediately unload the image to clean up.
> 
> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> ---
>   xen/common/efi/boot.c | 39 +++++++++++++++++++++++++++------------
>   1 file changed, 27 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 453b1ba099cd..67e7220d8fa3 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -36,8 +36,8 @@
>   
>   #define SMBIOS3_TABLE_GUID \
>     { 0xf2fd1544U, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0xe3, 0x94} }
> -#define SHIM_LOCK_PROTOCOL_GUID \
> -  { 0x605dab50U, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b, 0x23} }
> +#define SHIM_IMAGE_LOADER_GUID \
> +  { 0x1f492041U, 0xfadb, 0x4e59, {0x9e, 0x57, 0x7c, 0xaf, 0xe7, 0x3a, 0x55, 0xab} }
>   #define APPLE_PROPERTIES_PROTOCOL_GUID \
>     { 0x91bd12feU, 0xf6c3, 0x44fb, {0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0} }
>   #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
> @@ -66,9 +66,12 @@ typedef EFI_STATUS
>       IN const VOID *Buffer,
>       IN UINT32 Size);
>   
> -typedef struct {
> -    EFI_SHIM_LOCK_VERIFY Verify;
> -} EFI_SHIM_LOCK_PROTOCOL;
> +typedef struct _SHIM_IMAGE_LOADER {
> +    EFI_IMAGE_LOAD LoadImage;
> +    EFI_IMAGE_START StartImage;
> +    EFI_EXIT Exit;
> +    EFI_IMAGE_UNLOAD UnloadImage;
> +} SHIM_IMAGE_LOADER;
>   
>   struct _EFI_APPLE_PROPERTIES;
>   
> @@ -1333,13 +1336,13 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
>                                         EFI_SYSTEM_TABLE *SystemTable)
>   {
>       static EFI_GUID __initdata loaded_image_guid = LOADED_IMAGE_PROTOCOL;
> -    static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
>       EFI_LOADED_IMAGE *loaded_image;
>       EFI_STATUS status;
> +    EFI_HANDLE loaded_kernel;
>       unsigned int i;
>       CHAR16 *file_name, *cfg_file_name = NULL, *options = NULL;
>       UINTN gop_mode = ~0;
> -    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
> +    SHIM_IMAGE_LOADER *shim_loader;
>       EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
>       union string section = { NULL }, name;
>       bool base_video = false;
> @@ -1590,12 +1593,24 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
>        * device tree through the efi_check_dt_boot function, in this stage
>        * verify it.
>        */
> -    if ( kernel.ptr &&
> -         !kernel_verified &&
> -         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> -                                           (void **)&shim_lock)) &&
> -         (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
> +    if ( kernel.ptr && !kernel_verified )
> +    {
>           PrintErrMesg(L"Dom0 kernel image could not be verified", status);

I think this PrintErrMesg() should be removed. It will print a bogus 
message (indeed it has not been verified *Yet*, but maybe it's going to be).
Also, PrintErrMesg calls blexit() which never returns, so the kernel 
verification with LoadImage will never happen and Xen boot will stop.

> +    status = efi_bs->LocateProtocol(&((EFI_GUID) SHIM_IMAGE_LOADER_GUID),
> +                                     NULL, (void **)&shim_loader);
> +    if ( EFI_ERROR(status) )
> +        PrintErrMesg(L"Error LocateProtocol IMAGE_LOADER", status);
> +
> +    if ( kernel.ptr ) {
> +        status = shim_loader->LoadImage(false, ImageHandle, NULL, (void *)kernel.ptr, kernel.size, &loaded_kernel);
> +        if ( EFI_ERROR(status) )
> +            PrintErrMesg(L"LoadImage failed", status);
> +
> +        // LoadImage performs verification, now unload it to clean up
> +        status = shim_loader->UnloadImage(loaded_kernel);
> +        if ( EFI_ERROR(status) )
> +            PrintErrMesg(L"UnloadImage failed", status);
> +    }
>   
>       efi_arch_edd();
>   

Regards,

-- 


--
Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



