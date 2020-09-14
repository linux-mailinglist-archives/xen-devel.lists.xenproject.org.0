Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38B02687F8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:06:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkRR-000515-Po; Mon, 14 Sep 2020 09:06:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odsp=CX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kHkRP-00050x-Mz
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:06:27 +0000
X-Inumbo-ID: 6d57f019-4a61-4c00-8300-e99351902570
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d57f019-4a61-4c00-8300-e99351902570;
 Mon, 14 Sep 2020 09:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600074377;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ll1ZwddOIlJSTgzjqKsdhUzdcD806FeaBH87/ZyPZ0c=;
 b=UbE2ZxND22E7e5VQMDs9+DAYeJxJPw93mAIPTJEF8lJmjan0uIj1ftgR
 x3q9NxunEIt1wDzJIWamvGv9XezO/2eLIozaTXe/xCcUID7vBCCWNYrqg
 ec2ogT7MxwEeYR5tdl2DEh8dekMouKNeKqiVKS48mMO7fwfztlkocdjZc M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pW7eFd8cP1h/i+xLXosBB4vsnARATajwYNZ7hv5df8XxmMqEhruvVV3yd3+CUZSdbbMiFRTQUk
 3S+uVJCXJ2Fz0qIqXsu3G+C3IRuGHTbqaXsjhYuvXR2sLgqf6DXrYEpM5YEEcwSQNQoYn+kMQ+
 vjByz8pb0ziiu/pFbrxpzlpd4ratBdFu7H56ttPa4FbvCeDWV1En8zY/SqzYGc9IOwn+Mqo8Qx
 WSTqk8E6RtrfBVbDs+/qXVYCjfzA/kWYKl+SSztTlYEyV1BCqdpC0G+G098Y85BtOl4poSl97C
 OAI=
X-SBRS: 2.7
X-MesageID: 26591572
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,425,1592884800"; d="scan'208";a="26591572"
Date: Mon, 14 Sep 2020 11:05:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Trammell Hudson <hudson@trmm.net>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/4] efi/boot.c: add file.need_to_free and split
 display_file_info()
Message-ID: <20200914090557.GB753@Air-de-Roger>
References: <20200907190027.669086-1-hudson@trmm.net>
 <20200907190027.669086-3-hudson@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200907190027.669086-3-hudson@trmm.net>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

Thanks! Being picky you likely wan to split this into two separate
commits: one for adding need_to_free and the other for
display_file_info.  There's no relation between the two that would
require them to be on the same commit.

On Mon, Sep 07, 2020 at 03:00:25PM -0400, Trammell Hudson wrote:
> From: Trammell hudson <hudson@trmm.net>
> 
> Signed-off-by: Trammell hudson <hudson@trmm.net>
> ---
>  xen/common/efi/boot.c | 36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 4022a672c9..f5bdc4b1df 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -102,6 +102,7 @@ union string {
>  
>  struct file {
>      UINTN size;
> +    bool need_to_free;
>      union {
>          EFI_PHYSICAL_ADDRESS addr;
>          void *ptr;
> @@ -279,13 +280,13 @@ void __init noreturn blexit(const CHAR16 *str)
>      if ( !efi_bs )
>          efi_arch_halt();
>  
> -    if ( cfg.addr )
> +    if ( cfg.addr && cfg.need_to_free )
>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
> -    if ( kernel.addr )
> +    if ( kernel.addr && kernel.need_to_free )
>          efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
> -    if ( ramdisk.addr )
> +    if ( ramdisk.addr && ramdisk.need_to_free )
>          efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
> -    if ( xsm.addr )
> +    if ( xsm.addr && xsm.need_to_free )
>          efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));
>  
>      efi_arch_blexit();
> @@ -538,6 +539,21 @@ static char * __init split_string(char *s)
>      return NULL;
>  }
>  
> +static void __init display_file_info(CHAR16 *name, struct file *file, char *options)

I think name at least could be constified?

Also efi_arch_handle_module seem to do more than just printing file
info, hence I would likely rename this to handle_file_info to be more
representative of what it does.

Roger.

