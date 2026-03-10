Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CMCFmMBsGm0eQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 12:32:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF2A24AF40
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 12:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250010.1547414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzvJV-00061E-U2; Tue, 10 Mar 2026 11:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250010.1547414; Tue, 10 Mar 2026 11:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzvJV-0005zi-R7; Tue, 10 Mar 2026 11:31:49 +0000
Received: by outflank-mailman (input) for mailman id 1250010;
 Tue, 10 Mar 2026 11:31:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzvJU-0005za-8T
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 11:31:48 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7b7a833-1c74-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 12:31:45 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48538c5956bso23029415e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 04:31:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852378de92sm176118465e9.0.2026.03.10.04.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 04:31:43 -0700 (PDT)
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
X-Inumbo-ID: b7b7a833-1c74-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773142304; x=1773747104; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m/m5As2KkE3vFRnY7bzO3q+1AL0PAuceDrUlhe1039g=;
        b=OaxJmuvRVVNZAS9VFTLyKEM9lWNzZDfGlq0j7TC5gjuEaqrm/c/bmoO8ZR+rJOarOF
         xHhm5GgY90u8G8ItxCSS1amNgQuQtgcO+CZA1t1KVmWe5FOw7+P9D24mOLCvt1Cd41BV
         4MajdWf5UWiBFogIRCqA0+isy6aJNIOvh/px3zvgR11WS8crnlRtprdvH8leljYAmUlv
         m88EqijI/lw3jXdcvMfgvn/uzpmO+NXkNpdT9ZOZeV76w0Re1UqotZ+uZSfh9w0eHMTW
         sWJaYGq78gD4DF7mB3FKiD1SI50nF9Dfk2smUzZU29C3V2brsjmfgJAb/puWyuHPHsQc
         3GkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773142304; x=1773747104;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/m5As2KkE3vFRnY7bzO3q+1AL0PAuceDrUlhe1039g=;
        b=jS9CM3vcaxu6ourpjC1u5KqeTlPqvgangztiYZw2O/u7cExRt6PxjoQmQ49xtURvZh
         yvGWOXz/HOBZiA9GHH2v2v0g8ptswrG+/altEjqEB6E1603I+yeVA51bC19jveWZunQO
         t5viBTvaUi4seAVeKO5vLcLAKUktzPevGGJBpKoDDxnEHhuLwV6LYqWTKDX523OOM3pr
         +l6aFzd14/mTHr8kb5QkH90iSukcgMo+4fKKvvpX1SY8aWDj0NsObIqk/OH6dfv4C76E
         OIF4UK8sAhyiFTKOLcK7tOjR42scF5C2svI1BFiJq+Gl6y2c2+W2vSD/SkrwIQwfksyv
         FCTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+jQIM7eX8SPRXB93Mch1p5iThY8+DGUB3U+odMAEZ4+kJnTIqfW/euzmXeROde9+qNZAae5i4ha8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxKMMoaOfvt/j71Z5dA8l3rJgAc3qL7cQy916j1ElB+xpQvk37
	X40zI2Ts3/J4DJszbFcy1mVHL2BH/T7q87kyvF8cP4Yfvv6EkU3/9uSifO29jPXoDQ==
X-Gm-Gg: ATEYQzzawb2LItQWbUa/x631/WGMkCAVojI396VkbyXFKnkm06cgHy2fGzQhd9uH5KV
	N6LWC8I2ck7RmGr3ceskw41aPaYLUegvU+sDXvFvTs0UlJJUp44It5ggQJy8bt4diqLs5VTZT1e
	JQ6EkP4af0xUeK37UB0m5CazmVFjDBvWTLglh9vEFcgS/9zTFPhc/rt6e0NV2ekBSDj9HL0h4yZ
	tl40DbqiG8ODCYRE/3eY7KqjEYppRv+LHqXXf6xHebljVhou8fnY4VqROxfw2qxuwHORpmrniix
	B2ElF9wMNF9JMiPRAQh7Ce0JhILrJeE+xLr2W2k2i/4HtioYTJCa65S8QjkODOQ4K+u4DofV+Qr
	F3tVziX9JkZ8pq5lyhyKUPYMo6EZ8FNPn7dTDA7dz+35bVyPli0bN9f2VNFzRK+w18acQUfl/pm
	3OzI1pvPAXm57vcYOoylxXyOWxElM/+kXAibxPUyE4eXsgyWGAEOiqNk6fJhL1SxvSwLpHdqkVj
	dYf0zPzbfIbmks=
X-Received: by 2002:a05:600c:138e:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-485419d759amr50541695e9.9.1773142304057;
        Tue, 10 Mar 2026 04:31:44 -0700 (PDT)
Message-ID: <7fe8339f-5bec-46d2-88d3-ca7d2d45006b@suse.com>
Date: Tue, 10 Mar 2026 12:31:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/efi: Add BGRT image preservation during boot
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 sarkarsoumyajyoti23@gmail.com
References: <20260306132935.13727-1-soumyajyotisarkar23@gmail.com>
 <20260306132935.13727-2-soumyajyotisarkar23@gmail.com>
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
In-Reply-To: <20260306132935.13727-2-soumyajyotisarkar23@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: ACF2A24AF40
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:soumyajyotisarkar23@gmail.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[apertussolutions.com,citrix.com,invisiblethingslab.com,lists.xenproject.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 06.03.2026 14:29, Soumyajyotii Ssarkar wrote:
> @@ -747,6 +756,171 @@ static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
>      efi_bs->FreePool(memory_map);
>  }
> 
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
> +static struct acpi_bgrt* __init find_bgrt_table(EFI_SYSTEM_TABLE *SystemTable)
> +{
> +    EFI_GUID acpi2_guid = ACPI_20_TABLE_GUID;
> +    struct acpi_rsdp *rsdp = NULL;
> +    struct acpi_xsdt *xsdt;
> +    struct acpi_bgrt *bgrt;
> +    uint32_t entry_count, actual_size;

No need for fixed-width types here, I expect (see ./CODING_STYLE).

> +    unsigned int i;
> +
> +    for ( i = 0; i < SystemTable->NumberOfTableEntries; i++ )
> +    {
> +        if ( match_guid(&acpi2_guid, &SystemTable->ConfigurationTable[i].VendorGuid) )
> +        {
> +            rsdp = SystemTable->ConfigurationTable[i].VendorTable;
> +            break;
> +        }
> +    }

Why would this be needed, when efi_tables() has already run?

> +    if ( !rsdp || !rsdp->xsdt_physical_address )
> +        return NULL;
> +
> +    xsdt = (struct acpi_xsdt *)rsdp->xsdt_physical_address;
> +    if ( !xsdt )
> +        return NULL;
> +
> +    actual_size = (xsdt->header.length - sizeof(struct acpi_table_header));
> +    entry_count = (actual_size / sizeof(uint64_t));

Pleas prefer sizeof(<expression>) over sizeof(<type>), such that as a reader
one can know what is actually meant.

> +    for ( i = 0; i < entry_count; i++ )
> +    {
> +        struct acpi_table_header *header = (struct acpi_table_header *)xsdt->table_offset_entry[i];
> +
> +        if (   header->signature[0] == 'B'
> +            && header->signature[1] == 'G'
> +            && header->signature[2] == 'R'
> +            && header->signature[3] == 'T' )

Nit (style): If this was to not be replaced by a suitable function call, the
operators belong at the end of the earlier line (again see ./CODING_STYLE).

> +        {
> +            bgrt = (struct acpi_bgrt *)header;
> +            return bgrt;
> +        }
> +    }
> +    return NULL;
> +}

Nit (style): Blank line please ahead of the main return statement of a
function.

> +#define MAX_IMAGE_SIZE  (16 * 1024 * 1024)    /* Sanity check: reject if bigger */
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
> +    bgrt_debug_info.preserved = false;
> +    bgrt_debug_info.failure_reason = NULL;
> +
> +    bgrt = find_bgrt_table(SystemTable);
> +    if ( !bgrt )
> +    {
> +        bgrt_debug_info.failure_reason = "BGRT table not found in XSDT";
> +        return;
> +    }
> +
> +    if ( !bgrt->image_address )
> +    {
> +        bgrt_debug_info.failure_reason = "BGRT image_address is NULL";
> +        return;
> +    }
> +
> +    old_image = (void *)bgrt->image_address;
> +    bmp = (struct bmp_header *)old_image;
> +
> +    if ( bmp->signature != 0x4D42 )
> +    {
> +        bgrt_debug_info.failure_reason = "Invalid BMP signature";
> +        return;
> +    }
> +
> +    image_size = bmp->file_size;
> +    if ( !image_size || image_size > MAX_IMAGE_SIZE )
> +    {
> +        bgrt_debug_info.failure_reason = "Invalid image size";

Why "invalid"? The cap is arbitrary, isn't it?

> +        return;
> +    }
> +
> +    status = efi_bs->AllocatePool(EfiACPIReclaimMemory, image_size, &new_image);
> +    if ( status != EFI_SUCCESS || !new_image )
> +    {
> +        bgrt_debug_info.failure_reason = "Memory allocation failed";
> +        return;
> +    }
> +
> +    memcpy(new_image, old_image, image_size);
> +
> +    bgrt->image_address = (uint64_t)new_image;
> +    bgrt->status |= 0x01;
> +
> +    bgrt->header.checksum = 0;
> +    checksum = 0;
> +    for ( i = 0; i < bgrt->header.length; i++ )
> +        checksum += ((uint8_t *)bgrt)[i];
> +    bgrt->header.checksum = (uint8_t)(0 - checksum);
> +
> +    bgrt_debug_info.preserved = true;
> +    bgrt_debug_info.old_addr = (uint64_t)old_image;
> +    bgrt_debug_info.new_addr = (uint64_t)new_image;

Seeing how you need to cast here, imo using pointer type fields and ...

> +    bgrt_debug_info.size = image_size;
> +}
> +
>  /*
>   * Include architecture specific implementation here, which references the
>   * static globals defined above.
> @@ -1794,6 +1968,19 @@ void __init efi_init_memory(void)
>      if ( !efi_enabled(EFI_BOOT) )
>          return;
> 
> +    if ( bgrt_debug_info.preserved )
> +    {
> +        printk(XENLOG_INFO "EFI: BGRT image preserved: %u KB\n",
> +               bgrt_debug_info.size / 1024);
> +        printk(XENLOG_INFO "EFI: BGRT relocated from %#" PRIx64 " to %#" PRIx64 "\n",

... %p here would be preferable. With any casts between uint64_t / UINT64 and
pointer types you need to be aware that these will cause issues the moment we
gain a 32-bit use of this EFI interfacing code. Hence the fewer such casts,
the better.

> +               bgrt_debug_info.old_addr, bgrt_debug_info.new_addr);
> +    }
> +    else if ( bgrt_debug_info.failure_reason )
> +    {
> +        printk(XENLOG_WARNING "EFI: BGRT preservation failed: %s\n",
> +               bgrt_debug_info.failure_reason);

Did you verify this actually works? efi_preserve_bgrt_img() runs when we're
still in physical mode, and hence the pointers stored will be physical
addresses. Whereas here you need virtual ones. A trick to use may be to
initialize the field with a pointer to a string literal (perhaps simply an
empty string). That'll cause a relocation to be emitted for the field, and
hence the pointer will then be relocated together with the rest of the Xen
image.

Jan

