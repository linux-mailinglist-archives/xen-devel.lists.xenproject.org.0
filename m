Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A81275368
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 10:39:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL0If-00040Z-Ju; Wed, 23 Sep 2020 08:38:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VqP=DA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kL0Ie-00040U-UW
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 08:38:53 +0000
X-Inumbo-ID: 6a26682b-ae9d-480d-a8d9-37a862b9fea9
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a26682b-ae9d-480d-a8d9-37a862b9fea9;
 Wed, 23 Sep 2020 08:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=2AepeIAbEMVBZii6PdtWjQDO63oXX77siWUTN0gOgZw=; b=eN57NJKuvRm5qNB9K9XEDsAsbl
 qpKFxk4VxesGx3xo7weojAmaY/Rw0TvbPTCSw3/AzBAPveuAmYZd1JwEbhPEn5V1k5Ib2siXK6iRs
 bmPZg7bZPkR32g++H6CCcHvcMB/f/k1WvYzRPTe2RHR7bhfYdd1aTLG1iGo+31e4bMBo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL0Ia-0004zY-Nt; Wed, 23 Sep 2020 08:38:48 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL0Ia-0001O1-Fq; Wed, 23 Sep 2020 08:38:48 +0000
Subject: Re: [PATCH] EFI: some easy constification
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Trammell Hudson <hudson@trmm.net>
References: <c2995533-7a14-e83a-9a2a-7f0346c161b0@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <776fba42-aaca-389d-9cef-3de657bbffd1@xen.org>
Date: Wed, 23 Sep 2020 09:38:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c2995533-7a14-e83a-9a2a-7f0346c161b0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 17/09/2020 12:27, Jan Beulich wrote:
> Inspired by some of Trammell's suggestions, this harvests some low
> hanging fruit, without needing to be concerned about the definitions of
> the EFI interfaces themselves.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -420,7 +420,7 @@ static void __init efi_arch_memory_setup
>   
>   static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>                                              CHAR16 *cmdline_options,
> -                                           char *cfgfile_options)
> +                                           const char *cfgfile_options)
>   {
>       union string name;
>       char *buf;
> @@ -481,8 +481,9 @@ static void __init efi_arch_handle_cmdli
>       efi_bs->FreePool(buf);
>   }
>   
> -static void __init efi_arch_handle_module(struct file *file, const CHAR16 *name,
> -                                          char *options)
> +static void __init efi_arch_handle_module(const struct file *file,
> +                                          const CHAR16 *name,
> +                                          const char *options)
>   {
>       int node;
>       int chosen;
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -294,7 +294,7 @@ static void __init efi_arch_cfg_file_lat
>   
>   static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
>                                              CHAR16 *cmdline_options,
> -                                           char *cfgfile_options)
> +                                           const char *cfgfile_options)
>   {
>       union string name;
>   
> @@ -635,8 +635,9 @@ static void __init efi_arch_memory_setup
>   #undef l2_4G_offset
>   }
>   
> -static void __init efi_arch_handle_module(struct file *file, const CHAR16 *name,
> -                                          char *options)
> +static void __init efi_arch_handle_module(const struct file *file,
> +                                          const CHAR16 *name,
> +                                          const char *options)
>   {
>       union string local_name;
>       void *ptr;
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -119,7 +119,7 @@ static char *split_string(char *s);
>   static CHAR16 *s2w(union string *str);
>   static char *w2s(const union string *str);
>   static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
> -                      struct file *file, char *options);
> +                      struct file *file, const char *options);
>   static size_t wstrlen(const CHAR16 * s);
>   static int set_color(u32 mask, int bpp, u8 *pos, u8 *sz);
>   static bool match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2);
> @@ -539,7 +539,7 @@ static char * __init split_string(char *
>   }
>   
>   static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
> -                             struct file *file, char *options)
> +                             struct file *file, const char *options)
>   {
>       EFI_FILE_HANDLE FileHandle = NULL;
>       UINT64 size;
> @@ -1100,7 +1100,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
>       EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
>       union string section = { NULL }, name;
>       bool base_video = false;
> -    char *option_str;
> +    const char *option_str;
>       bool use_cfg_file;
>   
>       __set_bit(EFI_BOOT, &efi_flags);
> 

-- 
Julien Grall

