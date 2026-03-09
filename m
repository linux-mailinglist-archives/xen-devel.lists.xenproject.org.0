Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLXtFVd3rmliFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 08:31:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C49234CC9
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 08:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249127.1546631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzV50-0006KB-Hu; Mon, 09 Mar 2026 07:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249127.1546631; Mon, 09 Mar 2026 07:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzV50-0006Hg-FD; Mon, 09 Mar 2026 07:31:06 +0000
Received: by outflank-mailman (input) for mailman id 1249127;
 Mon, 09 Mar 2026 07:31:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TKtW=BJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzV4y-0006Ha-Mu
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 07:31:04 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebf63124-1b89-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 08:31:01 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-439c9bdc1eeso1839841f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 00:31:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dadb85b8sm24006574f8f.17.2026.03.09.00.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 00:30:59 -0700 (PDT)
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
X-Inumbo-ID: ebf63124-1b89-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773041460; x=1773646260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JY1YIqMpS+svr4GEl0wS4/8/T5I/0QlYvZB1MYhrF4c=;
        b=OOMbvUgWYhafmSagm+014NoWQJQyOjP6HVgwbBLwha5fFzSwTQENkRbFEc/39Uwma6
         PtsEqr+gnAJcNjwmsrJVz6x/F4SUXj2+YTebz1E/eSbp0MqkhcSTGzqWHrilHNorSYVf
         /c9HiFfmvcpBYQUgh7nCCftuedisnpS0UnVIZXOh5lRvZ7izR6pXqKfYRWvwCum96fi3
         Wp7dTBp8PDqXQgEjAmtW45vH7qO6ZSAKLPuQn/cHy4fzGy9vcRcfXFkHesQ6w7FYgurF
         VyLL4bDqH9JXcqfhlksyWJxU3at1HF0jnvKjKZdShRTkkS1iDR7nqfnUAHv4cSx5YXeH
         P+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773041460; x=1773646260;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JY1YIqMpS+svr4GEl0wS4/8/T5I/0QlYvZB1MYhrF4c=;
        b=okSp3juH7hrGKSuNM1fpkLVPN+0o1CzPihJCdK9n53lREp5Ry+5FNNyaXxIFmPwUQS
         rSQKYkgSrBjpcRDU+XR41BX1rwUFefRjT34mzYGxcIwUgAC27s9mxWfASEErchErDJRR
         qvoAY60Fs/yCX1e5viEs2sJhdUxFwWTD5+CEzmY/kj8smq6e2Ld6hir2hYXQLcH5z/U3
         7WXW/f3mswMO7tPt0n1qJAK1CupTpvroYq7ibkkd0bO2zytvRrda/FPNoFhhHNkO/Z6W
         eUH6C3s77gcQyhfuNSPP0oGMjLiVVDmkyGjPgX9mvlIHoTUCwU8Jgbg0M0hF5leFKeaH
         7Zzw==
X-Gm-Message-State: AOJu0YxOCn3B48HARuFpUGQ0GOyOOsk8cwfrOIlWBC/Oj5dZaD8UFsUT
	RZeTlZfvhOZkztVp+PCUADyFUE/pb94O7mtuSfw+iikUMCl3cqHP/Sy2jLz4U0oM2Q==
X-Gm-Gg: ATEYQzy5+2uVg0Ubq14Y/KiVFlxeJw3hTf7ZRSeC7SxUtuKb3V7fYkY+6IValLGhpLC
	TFjJ4n+eO8HBllCsn1GClB/+vg6pS+m9B/i6BDOj3goDi4Oi7BH1o3ND3IhUqKoLYEfO5EvMhDy
	nkD9GXiO0SzJkJGxwaiuWT1ZoJW9B7bsXKTrXO19PHasKCfaFyKRZ9v0CBQkJ7ZkmY3CVKgs/yE
	sISOng7jm95h7VLyIPzCSQ+Tjcx9ppt2sEF0u9NJHA63GamryHRDNRXkM2utwQTWC6GQZFzkWVU
	7ViLsAZR+gLcj5yPlbHEnFOCeZQvibjHSNzj1oKxO4O1jFpgNU70Q/bOb9BtLWJfmoabbulOibG
	MLxB7xsX6HLaiOn/ebuU90cXU3risEF+ZfC7b/f7vbDZabZ5ToCCsNA2fHN34qSuHDa3BxtNljs
	fMApryQ4GMS5j0vCtkvUUabOCsjfpAhDk6dlaDJylg3NEPXSQ1cm4Tu8HKe3AVL4cpSRXiHZU3I
	f2kab2KbI722Sc=
X-Received: by 2002:a05:6000:2dca:b0:439:b046:2044 with SMTP id ffacd0b85a97d-439da354a8emr19153955f8f.12.1773041460065;
        Mon, 09 Mar 2026 00:31:00 -0700 (PDT)
Message-ID: <609060f4-d94b-4b65-a10b-5126f10307db@suse.com>
Date: Mon, 9 Mar 2026 08:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/efi: Add BGRT image preservation during boot
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
References: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
 <20260305191810.31033-2-soumyajyotisarkar23@gmail.com>
 <aa3AKoCFFhwD4-LX@mail-itl>
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
In-Reply-To: <aa3AKoCFFhwD4-LX@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A8C49234CC9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,apertussolutions.com,citrix.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 08.03.2026 19:30, Marek Marczykowski-Górecki wrote:
> On Fri, Mar 06, 2026 at 12:48:08AM +0530, Soumyajyotii Ssarkar wrote:
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -7,6 +7,7 @@
>>  #include <xen/ctype.h>
>>  #include <xen/dmi.h>
>>  #include <xen/domain_page.h>
>> +#include <xen/errno.h>
>>  #include <xen/init.h>
>>  #include <xen/keyhandler.h>
>>  #include <xen/lib.h>
>> @@ -173,6 +174,14 @@ static struct file __initdata ramdisk;
>>  static struct file __initdata xsm;
>>  static const CHAR16 __initconst newline[] = L"\r\n";
>>
>> +static __initdata struct {
>> +    bool preserved;
>> +    uint64_t old_addr;
>> +    uint64_t new_addr;
>> +    uint32_t size;
>> +    const char *failure_reason;
>> +} bgrt_debug_info;
>> +
>>  static void __init PrintStr(const CHAR16 *s)
>>  {
>>      StdOut->OutputString(StdOut, (CHAR16 *)s );
>> @@ -747,6 +756,171 @@ static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
>>      efi_bs->FreePool(memory_map);
>>  }
>>
>> +struct bmp_header {
>> +    uint16_t signature;
>> +    uint32_t file_size;
>> +    uint16_t reserved_1;
>> +    uint16_t reserved_2;
>> +    uint32_t data_offset;
>> +} __attribute__((packed));
>> +
>> +/*
>> + * ACPI Structures - defined locally,
>> + * since we cannot include acpi headers
>> + * in EFI Context.
>> + */
>> +
>> +struct acpi_rsdp {
>> +    char signature[8];
>> +    uint8_t checksum;
>> +    char oem_id[6];
>> +    uint8_t revision;
>> +    uint32_t rsdt_physical_address;
>> +    uint32_t length;
>> +    uint64_t xsdt_physical_address;
>> +    uint8_t extended_checksum;
>> +    uint8_t reserved[3];
>> +} __attribute__((packed));
>> +
>> +struct acpi_table_header {
>> +    char signature[4];
>> +    uint32_t length;
>> +    uint8_t revision;
>> +    uint8_t checksum;
>> +    char oem_id[6];
>> +    char oem_table_id[8];
>> +    uint32_t oem_revision;
>> +    uint32_t asl_compiler_id;
>> +    uint32_t asl_compiler_revision;
>> +} __attribute__((packed));
>> +
>> +struct acpi_xsdt {
>> +    struct acpi_table_header header;
>> +    uint64_t table_offset_entry[1]; /* Variable array length */
> 
> uint64_t table_offset_entry[];
> 
> BTW, do we have some canonical place with list of files imported (and
> kept in sync) with other projects? xen/include/acpi/actbl.h doesn't
> exactly follow Xen coding style, but it's unclear to me if it needs to
> stay this way.

I don't really understand why the headers we've got can't be used. Even
some of the library-like code under xen/acpi/ may be usable here.

While we don't exactly keep xen/include/acpi/ in sync with Linux, when
things are added we preferably add them in the way Linux has them.

>> +} __attribute__((packed));
>> +
>> +struct acpi_bgrt {
>> +    struct acpi_table_header header;
>> +    uint16_t version;
>> +    uint8_t status;
>> +    uint8_t image_type;
>> +    uint64_t image_address;
>> +    uint32_t image_offset_x;
>> +    uint32_t image_offset_y;
>> +} __attribute__((packed));
>> +
>> +static struct acpi_bgrt* __init find_bgrt_table(EFI_SYSTEM_TABLE *SystemTable)

Nit (style): The first * is misplaced.

>> +{
>> +    EFI_GUID acpi2_guid = ACPI_20_TABLE_GUID;
>> +    struct acpi_rsdp *rsdp = NULL;
>> +    struct acpi_xsdt *xsdt;
>> +    struct acpi_bgrt *bgrt;

Here and ...

>> +    uint32_t entry_count, actual_size;
>> +    unsigned int i;
>> +
>> +    for ( i = 0; i < SystemTable->NumberOfTableEntries; i++ )
>> +    {
>> +        if ( match_guid(&acpi2_guid, &SystemTable->ConfigurationTable[i].VendorGuid) )
>> +        {
>> +            rsdp = SystemTable->ConfigurationTable[i].VendorTable;
>> +            break;
>> +        }
>> +    }
>> +
>> +    if ( !rsdp || !rsdp->xsdt_physical_address )
>> +        return NULL;
>> +
>> +    xsdt = (struct acpi_xsdt *)rsdp->xsdt_physical_address;
>> +    if ( !xsdt )
>> +        return NULL;
>> +
>> +    actual_size = (xsdt->header.length - sizeof(struct acpi_table_header));
>> +    entry_count = (actual_size / sizeof(uint64_t));
>> +
>> +    for ( i = 0; i < entry_count; i++ )
>> +    {
>> +        struct acpi_table_header *header = (struct acpi_table_header *)xsdt->table_offset_entry[i];

... here and elsewhere - please use pointer-to-const wherever possible.

>> +        if (   header->signature[0] == 'B'
>> +            && header->signature[1] == 'G'
>> +            && header->signature[2] == 'R'
>> +            && header->signature[3] == 'T' )
> 
> strncmp?

Or even memcmp() in this case. Plus there is ACPI_SIG_BGRT.

>> +        {
>> +            bgrt = (struct acpi_bgrt *)header;
> 
> You can just return it here, avoiding the extra variable.
> 
>> +            return bgrt;
>> +        }
>> +    }
>> +    return NULL;
>> +}
>> +
>> +#define MAX_IMAGE_SIZE  (16 * 1024 * 1024)    /* Sanity check: reject if bigger */
>> +
>> +static void __init efi_preserve_bgrt_img(EFI_SYSTEM_TABLE *SystemTable)
>> +{
>> +    struct acpi_bgrt *bgrt;
>> +    struct bmp_header *bmp;
>> +    void *old_image, *new_image;
>> +    uint32_t image_size;
>> +    EFI_STATUS status;
>> +    uint8_t checksum;
>> +    unsigned int i;
>> +
>> +    bgrt_debug_info.preserved = false;
>> +    bgrt_debug_info.failure_reason = NULL;
>> +
>> +    bgrt = find_bgrt_table(SystemTable);
>> +    if ( !bgrt )
>> +    {
>> +        bgrt_debug_info.failure_reason = "BGRT table not found in XSDT";
>> +        return;
>> +    }
>> +
>> +    if ( !bgrt->image_address )
>> +    {
>> +        bgrt_debug_info.failure_reason = "BGRT image_address is NULL";
>> +        return;
>> +    }
>> +
>> +    old_image = (void *)bgrt->image_address;
>> +    bmp = (struct bmp_header *)old_image;
>> +
>> +    if ( bmp->signature != 0x4D42 )
>> +    {
>> +        bgrt_debug_info.failure_reason = "Invalid BMP signature";
>> +        return;
>> +    }
>> +
>> +    image_size = bmp->file_size;
>> +    if ( !image_size || image_size > MAX_IMAGE_SIZE )
>> +    {
>> +        bgrt_debug_info.failure_reason = "Invalid image size";
>> +        return;
>> +    }
>> +
>> +    status = efi_bs->AllocatePool(EfiACPIReclaimMemory, image_size, &new_image);
>> +    if ( status != EFI_SUCCESS || !new_image )
>> +    {
>> +        bgrt_debug_info.failure_reason = "Memory allocation failed";
>> +        return;
>> +    }
>> +
>> +    memcpy(new_image, old_image, image_size);
>> +
>> +    bgrt->image_address = (uint64_t)new_image;
>> +    bgrt->status |= 0x01;
> 
> Why forcing the "displayed" bit here?

And if this is needed, why by way of a literal number rather than a suitable
#define?

>> +    bgrt->header.checksum = 0;
>> +    checksum = 0;
>> +    for ( i = 0; i < bgrt->header.length; i++ )
>> +        checksum += ((uint8_t *)bgrt)[i];
>> +    bgrt->header.checksum = (uint8_t)(0 - checksum);
>> +
>> +    bgrt_debug_info.preserved = true;
>> +    bgrt_debug_info.old_addr = (uint64_t)old_image;
>> +    bgrt_debug_info.new_addr = (uint64_t)new_image;
>> +    bgrt_debug_info.size = image_size;
>> +}
>> +
> 
> This is quite a bit of code, maybe move to a separate file? But I'd like
> to hear what others think.

Whether to put in a separate file is only the 2nd question imo. The first is
whether this much code is needed in the first place.

Jan

