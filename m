Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACpcLnDEwmlflgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 18:05:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCD4319AB4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 18:05:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261176.1554283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w55Bq-0001Gs-GZ; Tue, 24 Mar 2026 17:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261176.1554283; Tue, 24 Mar 2026 17:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w55Bq-0001Eo-Do; Tue, 24 Mar 2026 17:05:14 +0000
Received: by outflank-mailman (input) for mailman id 1261176;
 Tue, 24 Mar 2026 17:05:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w55Bo-0001Eh-LM
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:05:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w55Bn-002wzG-HB
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 18:05:11 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2c442-bab6-0a2a0a5309dd-0a2a450b8f66-16
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 18:05:11 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2c447-ef63-0a2a450b0019-d1558032b40d-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 18:05:11 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4852c9b4158so42519025e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 10:05:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b85082842sm4748658f8f.20.2026.03.24.10.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 10:05:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774371910; x=1774976710; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eCOVSUINbr3qzFl702prxHTOtaujcdyX+FM++DzfP/M=;
        b=Y4fDjA63Y66n8ne/nrbxIV8uMP1/kpK/6F5rxO+WjPVi8utynasgDJKhXMMTprcXyY
         RmcUPjYiXm3t7RUXEUCFfsb6UIJd8FPagpHMLIN+MnLuX0zxA7631mEgJUoPnbu23Zi6
         pogzq+69A/SFfK3QGgSR0SE9iPbTR+sNgyTznym1J8c/a+ntw1VJYzflXIa5AIFKMBJj
         ebSo1bGehI7spCBCl9H7PcUXIh0eyB9iy1PSwZzQ+GRMjNEHuU3nLazKoLIRwZG0Lswx
         sEsC/Bx3YRhwIzXCIgQGv3eR4oy2OqGe/EyXFJAhkw6EZhRpw0gQtLDPJTBaUPu9czcW
         94WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774371911; x=1774976711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCOVSUINbr3qzFl702prxHTOtaujcdyX+FM++DzfP/M=;
        b=iCb1vkOhDkys7qbcb1TwzkCWv/q+8Ha0V3VDaO1zUb8aSXyjhv58PK1jwZjaQiEoEY
         WnYezO9nfGyhHVHuSpYej9MiQAnZEQW+OSoNvpxH0ORwfd+ExDdJat1+YDGA4ba5zRHm
         /9QsJ3su6cVgbpy5cS6zzcvU8W3KboKenurwrG/Er+XBlbnessofBXGDPpAOmnbCuYka
         krQ3SSOCA99fLwEuNNDHsoRGCJOkhaVDR2gXA7LDbU6dNsavPtgtOl8iiki5eJ5KsCx8
         lvYqxMSbie93nGvjLPFcHEKyZrYPicBLfOYJQEVsUYtnRYuftUmKwn7Z8hROlnJH/SKf
         nR2g==
X-Forwarded-Encrypted: i=1; AJvYcCUQYZLMCVW6uHJZJLA3+V4sH22FWq2VE/KP2baTmvTaiv+9/MsIhO1p812L7hB+xpSZ4CcHxrpRHwQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzSSIlYG+ZKHXTAMwlZMy27XsSonGueXGN0XqTeL+wk2AX+liL
	E3luwYZ4tWIHXlwrOABa3Z+wM41SHGMLUs/SSX5Tp74NL+9usMBsPGmiHGO1Ho7xrA==
X-Gm-Gg: ATEYQzzPLOEmCt8lqdQSFB1HGhf6hPzemu8QoGyKSFbIjZ7dmWuxL1fhfRK4Ce3/1ge
	0xCiBoehfnCLIAMbDg02Yo4SsgacEPZzaum7QmWr7LMmRg62bRepdh7D0i3jxjaGK9INXanpW14
	V3C1a8qofy6yAt+jsGfGDjyJazfanaXe81qAhWtx93DkT4ScSIwDgdeW91Fy6WPzAXsSIvW5uJE
	YN1/GDV/Wl4TG1Eb36IXoX5WS0vQa/mhQP9Vh4ZtrPxB1GAf2SvFQXu+5FYZmFLS7Ue+Gz4QXe1
	UYGSD2bMMEccAIlw28V0W2GqjeyvcQLUEIpn8i3MDpLBj8vM73XnQWy5+26VP9771TLyl+0+ftI
	13E5+7gzLKDsOET98UizwJM04bOolIB132yPDllrl872DMbvhTg/Wm20+Kz0ZkTxFC1t8Q9BK2f
	BjltEwZCh49P0wWzhuAewQRoov/S+Qqay1WKlTdAqQAd9OzsXmS0jqgafSuWWwvP/NYTXH8Ao1I
	2xCiaS/AgQXYGk=
X-Received: by 2002:a05:600c:350f:b0:485:40c6:f528 with SMTP id 5b1f17b1804b1-487160a213bmr6751605e9.30.1774371910556;
        Tue, 24 Mar 2026 10:05:10 -0700 (PDT)
Message-ID: <2c601553-504c-405f-be5e-8ed24f21796d@suse.com>
Date: Tue, 24 Mar 2026 18:05:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] x86/efi: Add BGRT image preservation
 infrastructure
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, sarkarsoumyajyoti23@gmail.com,
 xen-devel@lists.xenproject.org
References: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
 <20260324123312.11076-2-soumyajyotisarkar23@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20260324123312.11076-2-soumyajyotisarkar23@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1774371911-9AAAC112-35B0D6D1/0/0
X-purgate-type: clean
X-purgate-size: 5805
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,apertussolutions.com,invisiblethingslab.com,gmail.com,lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:soumyajyotisarkar23@gmail.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:sarkarsoumyajyoti23@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1CCD4319AB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 13:33, Soumyajyotii Ssarkar wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1,12 +1,16 @@
>  #include "efi.h"
>  #include <efi/efiprot.h>
>  #include <efi/efipciio.h>
> +#include <acpi/acconfig.h>
> +#include <acpi/actbl.h>
> +#include <acpi/actbl3.h>

I fear this is pretty fragile. acpi/acpi.h is what is supposed to be included
from outside of (the little bit of) ACPICA code that we have got. Which in
turn may conflict with efi/*.h, which is why previously I had suggested to put
the ACPI parsing code elsewhere (if indeed nothing we already have can be
reused).

>  #include <public/xen.h>
>  #include <xen/bitops.h>
>  #include <xen/compile.h>
>  #include <xen/ctype.h>
>  #include <xen/dmi.h>
>  #include <xen/domain_page.h>
> +#include <xen/errno.h>

Is this really needed? Afaict it's included implicitly already.

> @@ -747,6 +751,133 @@ static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
>      efi_bs->FreePool(memory_map);
>  }
> 
> +typedef struct {
> +    UINT16 signature;
> +    UINT32 file_size;
> +    UINT16 reserved[2];
> +    UINT32 data_offset;
> +} __attribute__((packed)) BMP_HEADER;

All capitals identifiers are by convention #define-s. bmp_header_t perhaps?

> +static __initdata struct {
> +    bool preserved;
> +    const void *old_addr;
> +    const void *new_addr;
> +    UINTN size;
> +    const char *failure_reason;
> +} bgrt_info = {
> +    /* We would prefer the failure_reason to print */
> +    .failure_reason = "",
> +};

I don't understand what the comment is supposed to be telling the reader.
Clearly it's not about the relocation subtlety which (imo) absolutely
needs commenting on.

> +static struct acpi_table_bgrt *__init efi_get_bgrt(void)
> +{
> +    const struct acpi_table_rsdp *rsdp;
> +    const struct acpi_table_xsdt *xsdt;
> +    UINTN entry_count;
> +    unsigned int i;
> +
> +    if ( efi.acpi20 == EFI_INVALID_TABLE_ADDR )
> +        return NULL;
> +
> +    rsdp = (const void *)(UINTN)efi.acpi20;

Why the intermediate cast to UINTN?

> +    if ( !rsdp || !rsdp->xsdt_physical_address )
> +        return NULL;
> +
> +    xsdt = (const void *)rsdp->xsdt_physical_address;

What if only an RSDT is supplied?

> +    if ( memcmp(xsdt->header.signature, ACPI_SIG_XSDT, 4) != 0 )
> +        return NULL;
> +
> +    if ( xsdt->header.length < sizeof(xsdt->header) )
> +        return NULL;
> +    entry_count = (xsdt->header.length - sizeof(xsdt->header)) /
> +                  sizeof(xsdt->table_offset_entry[0]);
> +
> +    for ( i = 0; i < entry_count; i++ )

This calls for i and entry_count to have the same type.

> +    {
> +        const struct acpi_table_header *hdr;
> +
> +        hdr = (const void *)xsdt->table_offset_entry[i];
> +        if ( !hdr )
> +            continue;
> +
> +        if ( memcmp(hdr->signature, ACPI_SIG_BGRT, 4) == 0 &&
> +             hdr->length >= sizeof(struct acpi_table_bgrt) )
> +            return (struct acpi_table_bgrt *)hdr;

Please use container_of() in favor of casts.

> +    }
> +
> +    return NULL;
> +}
> +
> +#define BMP_SIGNATURE 0x4D42
> +#define MAX_BGRT_IMAGE_SIZE (16 * 1024 * 1024)

Still an uncommented arbitrary constant.

> +static void __init efi_preserve_bgrt_img(void)
> +{
> +    struct acpi_table_bgrt *bgrt;
> +    const BMP_HEADER *bmp;
> +    const void *old_image;
> +    void *new_image;
> +    UINTN image_size;
> +    EFI_STATUS status;
> +    UINT8 checksum;
> +    unsigned int i;
> +
> +    bgrt_info.preserved = false;
> +
> +    bgrt = efi_get_bgrt();
> +    if ( !bgrt )
> +    {
> +        bgrt_info.failure_reason = "BGRT table not found";
> +        return;
> +    }
> +
> +    if ( !bgrt->image_address )
> +        return;
> +
> +    old_image = (const void *)bgrt->image_address;
> +    bmp = old_image;
> +
> +    if ( bmp->signature != BMP_SIGNATURE )
> +    {
> +        bgrt_info.failure_reason = "Invalid BMP signature";
> +        return;
> +    }
> +
> +    image_size = bmp->file_size;
> +    if ( !image_size || image_size > MAX_BGRT_IMAGE_SIZE )
> +    {
> +        bgrt_info.failure_reason = "Image size exceeds limit";

Does it, when it's zero?

> +        return;
> +    }
> +
> +    /*
> +     * Allocate memory of type EfiACPIReclaimMemory so that the image
> +     * will remain available for the OS after ExitBootServices().
> +     */
> +    status = efi_bs->AllocatePool(EfiACPIReclaimMemory, image_size, &new_image);
> +    if ( EFI_ERROR(status) )
> +    {
> +        bgrt_info.failure_reason = "Memory allocation failed";
> +        return;
> +    }
> +    memcpy(new_image, old_image, image_size);
> +    bgrt->image_address = (UINTN)new_image;

This looks like the wrong cast to me, even if in practice this likely is
going to be fine even on 32-bit EFI.

> +    bgrt->header.checksum = 0;
> +    checksum = 0;
> +
> +    for ( i = 0; i < bgrt->header.length; i++ )
> +        checksum += ((const UINT8 *)bgrt)[i];
> +
> +    bgrt->header.checksum = -checksum;
> +
> +    /* Filling the debug struct for printing later */
> +    bgrt_info.preserved = true;
> +    bgrt_info.old_addr = old_image;
> +    bgrt_info.new_addr = new_image;
> +    bgrt_info.size = image_size;

I'd suggest to drop "debug" from the comment.

> --- a/xen/common/efi/common-stub.c
> +++ b/xen/common/efi/common-stub.c
> @@ -19,6 +19,7 @@ unsigned long efi_get_time(void)
>  }
> 
>  void efi_reset_system(bool warm) { }
> +void __init efi_bgrt_status_info(void) { }

What is this? Does this belong into a later patch? And did you pay
attention to Marek's earlier comment (as to the use of __init)?

Jan

