Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05939E9B02
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 16:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851578.1265626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKg98-00045R-AL; Mon, 09 Dec 2024 15:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851578.1265626; Mon, 09 Dec 2024 15:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKg98-00043Y-7S; Mon, 09 Dec 2024 15:58:06 +0000
Received: by outflank-mailman (input) for mailman id 851578;
 Mon, 09 Dec 2024 15:58:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKg96-00043P-Da
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 15:58:04 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5eaeeb6e-b646-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 16:58:02 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385e06af753so2008818f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 07:58:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216221db645sm51050685ad.46.2024.12.09.07.57.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 07:58:01 -0800 (PST)
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
X-Inumbo-ID: 5eaeeb6e-b646-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733759882; x=1734364682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hPFWur24oZ0+j3v8fcdhH42mXvRL1EKpzLETRZJFrWs=;
        b=gNLWQ/2b2I2SZw3PqTiTypL5axdhqo08WZww4hDo6Dxv8dosBcaOwhv6mOnqHcMXwi
         OivM57RypInpG5wv2TPBK/Sy6UE+r3ezYRhPYxuEygp5RyAqRyEZ+WG27bjKBcc9pPMR
         O37qpjfRbcyRzguSwarPJODRv4HmkIWhklBEpk27yd3W3roljNV3VuIoG8r0N7Lb52Be
         DhaVgzMqAt76JsPf2Y4c+L3qIJ54moHIHYvMYHFv4bxtK4pOI3FqgwBkj3CR+83zaZCi
         sPmTdC/JDgLk7ML8JeJaZH5kmHTXQFBRPDj1yq+V9XehCdS0cYyUGHeyfRBfS+9aOVcU
         PjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733759882; x=1734364682;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPFWur24oZ0+j3v8fcdhH42mXvRL1EKpzLETRZJFrWs=;
        b=IRmkHd9atApOG13hb45n/n9Hqoh8ctuliK/ZIJaPFAjPdDxEOmAN3ol6cVJEY+GNM4
         V16xCF+Nz/Z7EQMjkxdQET+wXT4PEGnlCYI4LgpRXLBLOycTjMixNs76hMOTTflcm7sD
         Ac4ZhfnboUrC7yRJNKl40bxXvjvkQtF7zvWm/5VrQzPvMEfX9KqRNbWEEFZZEfmYlOR2
         zvXcTFoZZhHN0geOpilk5IdBy3RZJsMQnSDkZP4Wslf94KZTX5dWK+HnlOuWARYhjUsN
         i5N+x+TGRsmIiKKXOYtQXa7LarZ5UWFSLnSZpoWtHGQSgrCF8s7Sz63gFqv0ux99RrPh
         tSbg==
X-Forwarded-Encrypted: i=1; AJvYcCWlmAF/0X408Iu040WgbVVIIEqMrOcXOM45WhvSxCnVjmWQR5VOpaZZQ7TQxzYwZqbHg8cKXAhk9QE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxci0HuxWSPPBE9ltchISg+UC+14rQvyqEFUxpkkUlaAfke13wN
	8AH6u04ibxkUP3ELgvI/a8Uu9Z02tE5OxKX1w73w6CG4bSBdkObcB/4Ab+SuKQ==
X-Gm-Gg: ASbGncv/XKq9HpoQTNoru24toI7lY7CXu1Ie9+1EkbAXbPI9i+VA76XhoPhxM47UV5O
	UARoRbmTMptUF7aQOAtMPcR1tpkWqSWi2cHCU0UWl8x+QtfXTNmLRsWk2JTvKs4NKPfyGfDkCtk
	k/4JeapV3YdNiGyGE/kS4zkkBIZ3CLt4KCfJlDFUgdLeYYe8Uyayy7ciA+nNAAkVwoKA7N45Kwf
	jNYUS9AFViRGHcakyoGVDe7dscnB5lZeq7hd/aHl+KL1JbLcq6k15AVV35QD0tBGYV48FRL6meo
	gWwrBtNKxyd/0q2+qqRu2VL0hGnf8xmedjA=
X-Google-Smtp-Source: AGHT+IGX4VXM/giAgAbWmaO5+dBhbJSUnPx++bO/X9g5YKVFH7twhK+oMUam3ZcAAMjQAvZB4PS6MQ==
X-Received: by 2002:a05:6000:1887:b0:385:e2c4:1f8d with SMTP id ffacd0b85a97d-386453dd6b4mr573833f8f.19.1733759882029;
        Mon, 09 Dec 2024 07:58:02 -0800 (PST)
Message-ID: <34fbc3bf-f740-47bd-90e4-2f8b9ce46cfd@suse.com>
Date: Mon, 9 Dec 2024 16:57:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] xen/riscv: relocating and unflattening host device
 tree
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <f2b1b8b4d80d6b2ccc846ae7171a316a9b46ac56.1732709650.git.oleksii.kurochko@gmail.com>
 <bcc38672-647c-4fd6-9f90-cf26641b83f7@suse.com>
Content-Language: en-US
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
In-Reply-To: <bcc38672-647c-4fd6-9f90-cf26641b83f7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.12.2024 16:56, Jan Beulich wrote:
> On 27.11.2024 13:50, Oleksii Kurochko wrote:
>> Relocate FDT to Xen heap instead of using early mapping as it is
>> expected that discard_initial_modules() ( is supposed to call in
>> the future ) discards the FDT boot module and remove_early_mappings()
>> destroys the early mapping.
>>
>> Unflatten a device tree, creating the tree of struct device_node.
>> It also fills the "name" and "type" pointers of the nodes so the normal
>> device-tree walking functions can be used.
>>
>> Set device_tree_flattened to NULL in the case when acpi_disabled is
>> equal to false.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Albeit ...
> 
>> @@ -71,6 +72,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>                                 paddr_t dtb_addr)
>>  {
>>      const char *cmdline;
>> +    size_t fdt_size;
>>  
>>      remove_identity_mapping();
>>  
>> @@ -95,7 +97,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>                            _end - _start, false) )
>>          panic("Failed to add BOOTMOD_XEN\n");
>>  
>> -    if ( !boot_fdt_info(device_tree_flattened, dtb_addr) )
>> +    if ( !(fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr)) )
>>          BUG();
> 
> ... perhaps better
> 
>     fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr);
>     BUG_ON(!fdt_size);
> 
> ?

And then I notice that Arm has no such check at all. Better stay in sync?

Jan

