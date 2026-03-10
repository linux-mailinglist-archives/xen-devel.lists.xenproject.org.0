Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP4tCEInsGnOggIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 15:14:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBEC251923
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 15:14:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250167.1547639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzxqZ-0004iw-8J; Tue, 10 Mar 2026 14:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250167.1547639; Tue, 10 Mar 2026 14:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzxqZ-0004gX-5X; Tue, 10 Mar 2026 14:14:07 +0000
Received: by outflank-mailman (input) for mailman id 1250167;
 Tue, 10 Mar 2026 14:14:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzxqX-0004gQ-BZ
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 14:14:05 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63e658c5-1c8b-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 15:14:02 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-439b6d9c981so6420600f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 07:14:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dada9116sm33731436f8f.14.2026.03.10.07.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 07:14:01 -0700 (PDT)
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
X-Inumbo-ID: 63e658c5-1c8b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773152042; x=1773756842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IvFj7BAAy+OPVIRcv54K79IILH7WSbxHWhjWNJQS6SU=;
        b=ciSayuqOFE8H9HO87bw/gthQyLPLMgTHWuIya6yRysO7F1m1D4XRjIuW0mSg+JN2sE
         VCLWvuTElpsh+LYEdjVg9tNjMGr4R3T1sp33p7VUzFqXZZblhdMRxSQ02HunAmQuZOzN
         bcwZ8txPcE8gzOiOaT8yGGPngsdzSjHZcWJp8rZKr3nIDHS5vy7b+oH2pdBTSd0TOpUs
         5QpBw+jd/VJKy6B+EQThV1UjCEEP2OfcQb6QgN0aszsDOtctDRj3bpRaBXT8rvLYvQ4n
         wrq1xHijh/wacGN2yOzvosqaJ/BvtXO8N0slZGCplCs5dXLxDXV1anelBJUuwyeM+6gI
         GpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773152042; x=1773756842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvFj7BAAy+OPVIRcv54K79IILH7WSbxHWhjWNJQS6SU=;
        b=bvrR4o6DUVewZ1XRZ/nH/p69yuHZngo/iJRnF+okRA7Qi/XYoN0vY39LvDgAXLJC0+
         83Bv8xp41WhKlAMxYAEGIa6R7+gdjS/1u/NLbb/1bL9iVPnBGPQid+rTgJ6jEoPr+3Xc
         SpCrSpZrtedOtEHjy8C3G3aKRhsbh3pHxrtEwtH4NY1tdRR7vR8AwbgsHWfLmC1Jz7kp
         yNE6+6LxHxiAu/n01CRk6Rmo+gn5zOKCWqiy4lQf4IWQDjiE1dJM96EmUYO6f6z+PqZN
         DedZpPLsYFpDtLdCeBAW51Ou6FtVwuYzc/ghJOAvagHC/A3PRsdBnA3iLeEyiHaX1TyV
         WGTw==
X-Forwarded-Encrypted: i=1; AJvYcCUfJM7AtxY2eMaOgBIC2AKcXoIgTBtbgvcRCkazVnw/lZKQx6g3RA9V14tE1+bNYOHc4ToCXsIh5Cc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGKx9xpjzNmTXy+PbzW+RScYOMrdW+bkK2x2etb+e/IVtg3VhH
	0I2uVYYHYsan50q5ehtC5AmX6yvG9mpIEDGwajzptKf+8R6yPk4c5w2sE1dqKD5dyQ==
X-Gm-Gg: ATEYQzwgfcuvGPsTUoR/zJnwCwyTe8QvNgrjuApYHhZtxtaOV0QtFWVssW/3twF8UkE
	4GGH6S192As2UafyRki/gcCyB6p/+LdSSeIR+iBM9xcPMORC8HeAI304Y3kiv5zSZugSv/xWFyQ
	GQ2A9HPOvDXJ6vmhQazun6GFELcCmJjqh7d0ltr2dbLGU3sALX5ws+pY5N1AFpBGdL9qmTfpiLA
	UqfQgcK+68VYeAxsvGFXaH82DWzEQcOPhK56wQ8fMPlOAt/0vY/tBw1IwoOWjMzaYfOX7UiOsky
	fN9ctyRyjHxYiHjen1nvwH2sYYRZ3eY7QqJ91ZW1byQ+408rVeI9099dHg5unjvmsBPlBT3FXtE
	Gaw8kZ8K05fR4uy6GRkXD5A/yrOAuAWi2cIdAMRuq91Stni+9Lz7JvNd3M1Q4sgPemPUuVKIfrC
	JRktgqTqCFmMjvWNDnvkRN8PtkBgVv0IcK9KEQo+RXIJL+13JAU8Ljk+3O5Tllp4qC0BIB1cCk7
	W1i7JcWc4xbFM4=
X-Received: by 2002:a05:6000:1847:b0:439:b6b3:faa7 with SMTP id ffacd0b85a97d-439eff5cdb7mr6880582f8f.28.1773152041960;
        Tue, 10 Mar 2026 07:14:01 -0700 (PDT)
Message-ID: <7adc329e-6690-46ad-b706-74548dc7ccbc@suse.com>
Date: Tue, 10 Mar 2026 15:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/efi: Add BGRT image preservation during boot
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 sarkarsoumyajyoti23@gmail.com,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
 <20260305191810.31033-2-soumyajyotisarkar23@gmail.com>
 <aa3AKoCFFhwD4-LX@mail-itl> <609060f4-d94b-4b65-a10b-5126f10307db@suse.com>
 <CAGkZZ+sGLY==UxBJ=BGLjfKQTTMMZ7zRzaZ1MAjWT7Ak_gytyQ@mail.gmail.com>
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
In-Reply-To: <CAGkZZ+sGLY==UxBJ=BGLjfKQTTMMZ7zRzaZ1MAjWT7Ak_gytyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AFBEC251923
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[invisiblethingslab.com,lists.xenproject.org,gmail.com,apertussolutions.com,citrix.com];
	FORGED_RECIPIENTS(0.00)[m:soumyajyotisarkar23@gmail.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 10.03.2026 14:05, Soumyajyotii Ssarkar wrote:
> On Mon, Mar 9, 2026 at 1:01 PM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 08.03.2026 19:30, Marek Marczykowski-Górecki wrote:
>>> On Fri, Mar 06, 2026 at 12:48:08AM +0530, Soumyajyotii Ssarkar wrote:
>>>> --- a/xen/common/efi/boot.c
>>>> +++ b/xen/common/efi/boot.c
>>>> @@ -7,6 +7,7 @@
>>>>  #include <xen/ctype.h>
>>>>  #include <xen/dmi.h>
>>>>  #include <xen/domain_page.h>
>>>> +#include <xen/errno.h>
>>>>  #include <xen/init.h>
>>>>  #include <xen/keyhandler.h>
>>>>  #include <xen/lib.h>
>>>> @@ -173,6 +174,14 @@ static struct file __initdata ramdisk;
>>>>  static struct file __initdata xsm;
>>>>  static const CHAR16 __initconst newline[] = L"\r\n";
>>>>
>>>> +static __initdata struct {
>>>> +    bool preserved;
>>>> +    uint64_t old_addr;
>>>> +    uint64_t new_addr;
>>>> +    uint32_t size;
>>>> +    const char *failure_reason;
>>>> +} bgrt_debug_info;
>>>> +
>>>>  static void __init PrintStr(const CHAR16 *s)
>>>>  {
>>>>      StdOut->OutputString(StdOut, (CHAR16 *)s );
>>>> @@ -747,6 +756,171 @@ static void __init
>> efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
>>>>      efi_bs->FreePool(memory_map);
>>>>  }
>>>>
>>>> +struct bmp_header {
>>>> +    uint16_t signature;
>>>> +    uint32_t file_size;
>>>> +    uint16_t reserved_1;
>>>> +    uint16_t reserved_2;
>>>> +    uint32_t data_offset;
>>>> +} __attribute__((packed));
>>>> +
>>>> +/*
>>>> + * ACPI Structures - defined locally,
>>>> + * since we cannot include acpi headers
>>>> + * in EFI Context.
>>>> + */
>>>> +
>>>> +struct acpi_rsdp {
>>>> +    char signature[8];
>>>> +    uint8_t checksum;
>>>> +    char oem_id[6];
>>>> +    uint8_t revision;
>>>> +    uint32_t rsdt_physical_address;
>>>> +    uint32_t length;
>>>> +    uint64_t xsdt_physical_address;
>>>> +    uint8_t extended_checksum;
>>>> +    uint8_t reserved[3];
>>>> +} __attribute__((packed));
>>>> +
>>>> +struct acpi_table_header {
>>>> +    char signature[4];
>>>> +    uint32_t length;
>>>> +    uint8_t revision;
>>>> +    uint8_t checksum;
>>>> +    char oem_id[6];
>>>> +    char oem_table_id[8];
>>>> +    uint32_t oem_revision;
>>>> +    uint32_t asl_compiler_id;
>>>> +    uint32_t asl_compiler_revision;
>>>> +} __attribute__((packed));
>>>> +
>>>> +struct acpi_xsdt {
>>>> +    struct acpi_table_header header;
>>>> +    uint64_t table_offset_entry[1]; /* Variable array length */
>>>
>>> uint64_t table_offset_entry[];
>>>
>>> BTW, do we have some canonical place with list of files imported (and
>>> kept in sync) with other projects? xen/include/acpi/actbl.h doesn't
>>> exactly follow Xen coding style, but it's unclear to me if it needs to
>>> stay this way.
>>
>> I don't really understand why the headers we've got can't be used. Even
>> some of the library-like code under xen/acpi/ may be usable here.
>>
>> While we don't exactly keep xen/include/acpi/ in sync with Linux, when
>> things are added we preferably add them in the way Linux has them.
>>
>>
> I was trying to avoid including the headers from the xen/include/acpi/
> since it was specified in the comment. to not include them.
> Specific comment specified below this paragraph.
> Also since acpi was using datatypes like "u32" while boot.c had types of
> "uint32", so it felt a bit non-standardized.
> I checked the rest of the boot.c which followed the same manner. So I went
> with this choice.
> 
> /* * Keep this arch-specific modified include in the common file, as moving
>  * it to the arch specific include file would obscure that special care is
>  * taken to include it with __ASSEMBLER__ defined.
> */
> #define __ASSEMBLER__ /* avoid pulling in ACPI stuff (conflicts with EFI)
> */
> #include <asm/fixmap.h>
> #undef __ASSEMBLER__
> #endif
> 
> The ACPI headers in /xen/include/acpi uses defines such
> as ACPI_NAME_SIZE, ACPI_OEM_ID_SIZE
> and ACPI_OEM_TABLE_ID_SIZE these require adding additional
> <acpi/acconfig.h> header.
> Also since their is no acpi headers included in the boot.c file, so i
> thought to I avoid it.
> 
> Thus to get it fully working with ACPI headers from the xen/include/acpi I
> would require these three headers.
> #include <acpi/acconfig.h>
> #include <acpi/actbl.h>
> #include <acpi/actbl3.h>
> 
> I thought this would lead to cross contamination, and confusing to further
> modifications in future so weighing my options I thought best to redefine
> them,
> for code clarity.
> Can you suggest me best option to move forward, should I redefine them as
> is or include the headers?

First - see about re-using ACPI functions we already have. Then put new ACPI
code you need to add in a file different from the EFI one.

Jan

