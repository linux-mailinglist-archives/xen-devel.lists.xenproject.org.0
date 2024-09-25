Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E10986788
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 22:20:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804573.1215599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stYUm-0001cC-OH; Wed, 25 Sep 2024 20:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804573.1215599; Wed, 25 Sep 2024 20:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stYUm-0001Zk-Ki; Wed, 25 Sep 2024 20:20:20 +0000
Received: by outflank-mailman (input) for mailman id 804573;
 Wed, 25 Sep 2024 20:20:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFoA=QX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stYUl-0001Ze-Sl
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 20:20:19 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94519f1c-7b7b-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 22:20:17 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f8ca33ef19so3238161fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 13:20:17 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f8440sm255566166b.182.2024.09.25.13.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 13:20:15 -0700 (PDT)
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
X-Inumbo-ID: 94519f1c-7b7b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727295616; x=1727900416; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0BHbxr+YSdBgI4jZXm172b7gbjEtLnnB96ty5aGZw6M=;
        b=S5i3c4LxmSRMmjdCFyLhBPZcN6RCBByS/sUPSYdzb4HzligVQvsJHPTjWNRIqug/wS
         tg8/uL5g0NT7tYeO+3wYoQnx5jNWCY3/Cm2HfLNaPhdPxogxqdtFWz5hTPXPaGGOq/04
         AF8TiuSNlCWoIgwSKfV+RXnJ5U8IsmCcPvC7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727295616; x=1727900416;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BHbxr+YSdBgI4jZXm172b7gbjEtLnnB96ty5aGZw6M=;
        b=mc+3RT2E8G+fqdugwytu/ioQ1POpOaVkWxt3iteQf28CyjBXAM7xRHAE6uUtDcvjdy
         k4vIYmq6QPFjPr0vmGOqhvWI5j8vVH8KzRCegAj7BhWd1Nmzx5+HPBMKtbabROaSn4in
         DQauJ05GIiHg0kJBEH1pnZtBIreuYNIoVego6vRQ++SQZxbI+HFjAdVufivIG2tKWkSg
         StOA2m2+Ppvl1KaCiEJpN5Jn/ROZ74IE76kDdrEuF604hr6NDxv8Xxkfe+SgbIOTLbCY
         jFen8UHNC/U7nVQqNlOrLfjV7JgsxmEo/FHh9DEb/fgPPHbV+BrITjGkNH44kYisgGv6
         NyWw==
X-Forwarded-Encrypted: i=1; AJvYcCWTUzJwpzToqG95nAjFJrah1JIUE3vFwlGWZUWyd1q/iOAVF3HVo2H9EeA6bYoF9uW+hUbjE9+ihBE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykfrUhfeboG/drA5fcQvDR5z2arb2j+EaxpwRCUiGqUVbX1dnm
	c3/orL1cCciWH4+ypkL4s3pPxVbevkzFOijDOvKGokRsB/nKwPelEwksdWPzI6g=
X-Google-Smtp-Source: AGHT+IE42tk6zqAPzHQidveeZZUP2vJQTFVoiEO5cNkkjEgYnpGu64V0pDhjVo7zaOFUzziKIHg54Q==
X-Received: by 2002:a2e:6111:0:b0:2f7:4c9d:7a8c with SMTP id 38308e7fff4ca-2f91604dd08mr28211831fa.29.1727295616474;
        Wed, 25 Sep 2024 13:20:16 -0700 (PDT)
Message-ID: <70416976-c18a-425d-95f0-ab218e101113@citrix.com>
Date: Wed, 25 Sep 2024 21:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20240925060101.259244-1-frediano.ziglio@cloud.com>
 <20240925060101.259244-4-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240925060101.259244-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2024 7:01 am, Frediano Ziglio wrote:
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 2d2f56ad22..859f7055dc 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -252,36 +243,30 @@ __efi64_mb2_start:
> <snip>
>  
>          /* We are on EFI platform and EFI boot services are available. */
>          incb    efi_platform(%rip)
> @@ -291,77 +276,6 @@ __efi64_mb2_start:
>           * be run on EFI platforms.
>           */
>          incb    skip_realmode(%rip)

Well, these are two unfounded assumptions about the compile-time
defaults of certain variables.

Lets fix it afterwards, to save interfering with this series.

> diff --git a/xen/arch/x86/efi/parse-mbi2.c b/xen/arch/x86/efi/parse-mbi2.c
> new file mode 100644
> index 0000000000..89c562cf6a
> --- /dev/null
> +++ b/xen/arch/x86/efi/parse-mbi2.c
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

GPL-2.0-only.  The unsuffixed form is deprecated now.

> +
> +#include <xen/efi.h>
> +#include <xen/init.h>
> +#include <xen/multiboot2.h>
> +#include <asm/asm_defns.h>
> +#include <asm/efi.h>
> +
> +const char * asmlinkage __init
> +efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
> +{
> +    const multiboot2_tag_t *tag;
> +    EFI_HANDLE ImageHandle = NULL;
> +    EFI_SYSTEM_TABLE *SystemTable = NULL;
> +    const char *cmdline = NULL;
> +    bool have_bs = false;
> +
> +    if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
> +        return "ERR: Not a Multiboot2 bootloader!";
> +
> +    /* Skip Multiboot2 information fixed part. */
> +    tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));
> +
> +    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size
> +            && tag->type != MULTIBOOT2_TAG_TYPE_END;

&& on previous line.

But, this can move into the switch statement and reduce the for()
expression somewhat.

> +          tag = _p(ROUNDUP((unsigned long)((const void *)tag + tag->size),
> +                   MULTIBOOT2_TAG_ALIGN)) )

No need to cast through (const void *) I don't think.  It's
byte-granular when unsigned long too.  This should do:

    _p(ROUNDUP(((unsigned long)tag + tag->size), MULTIBOOT2_TAG_ALIGN))

> +    {
> +        switch ( tag->type )
> +        {
> +        case MULTIBOOT2_TAG_TYPE_EFI_BS:
> +            have_bs = true;
> +            break;

Newlines after break's please.

> +        case MULTIBOOT2_TAG_TYPE_EFI64:
> +            SystemTable = _p(((const multiboot2_tag_efi64_t *)tag)->pointer);
> +            break;
> +        case MULTIBOOT2_TAG_TYPE_EFI64_IH:
> +            ImageHandle = _p(((const multiboot2_tag_efi64_ih_t *)tag)->pointer);
> +            break;
> +        case MULTIBOOT2_TAG_TYPE_CMDLINE:
> +            cmdline = ((const multiboot2_tag_string_t *)tag)->string;
> +            break;

default:
    /* This comment is here because MISRA thinks you can't read the code
without it. */
    break;

Probably not that wording, but it reflects what I think of this
particular rule.

I can fix all on commit, but this needs an EFI ack.

~Andrew

