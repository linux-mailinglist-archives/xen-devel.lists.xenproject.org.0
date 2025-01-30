Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7596A22D34
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 14:02:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879531.1289734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUBb-0003kr-EI; Thu, 30 Jan 2025 13:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879531.1289734; Thu, 30 Jan 2025 13:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUBb-0003ie-AX; Thu, 30 Jan 2025 13:02:23 +0000
Received: by outflank-mailman (input) for mailman id 879531;
 Thu, 30 Jan 2025 13:02:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdUBa-0003iY-Ee
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 13:02:22 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 713f2f72-df0a-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 14:02:21 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6274015so1244200a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 05:02:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc723d0021sm1050516a12.5.2025.01.30.05.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 05:02:20 -0800 (PST)
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
X-Inumbo-ID: 713f2f72-df0a-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738242141; x=1738846941; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dhBKkyMKFLQGFgRqtZx5QzBR67KbmMu+gZvn6LeSaQs=;
        b=ENGN6sINC3rkGcShThB/Z8R1i/tFTFRRzMv5bVDIlayZqKcD4Cr83YBAQOuo9daEe7
         Z8uLRRaxAt0tE+ADDUhJgtFYAV3UfeQdJbPXLh1W9XrTR0VlwcvqklHxdeSbIIEnkhf+
         DE76HPUSv7zvH5sk/G0BUXXzYxxpIcIhE5AYFJfPzz8DwDmcuU57JNEZDaCHmXQJH1rI
         Nhnc20+SQyqFOvEfKZmVkdZKzvOLpVik0nP67cpbGaO2k7jWqTbccXXYK8Hjn8qn+Nz+
         H6Cp5oP7wAPFVTNWbnarURTewbNOA30vsUCOTYXZe5BpMRemyOAyIURicr89jC6As1BL
         dfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738242141; x=1738846941;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhBKkyMKFLQGFgRqtZx5QzBR67KbmMu+gZvn6LeSaQs=;
        b=aFu93QvyugPe5STxaFPArT557sJCq4lGmSWZtsepmY7zNm7G/k8WLYW8XatyYloDu6
         9f7Y81FJtE2San9HPXauZ+M5n7GqQUyzNWyDGn+lZgUGaOc5XwYnXDk2qQa6i1guZn4W
         GPxGf+EFDleRoPAKGdZBSbsB69g/cKAxVNnHFFZ2Iz9+irGb1+u03xW4x/lCiUkv7REx
         q50rKYDbUqc0fJzEdYLEV0fxkMoNVQTBhX0hkwj1vv/+UWFNblQC23dxfDjgjCtg6LpS
         5E/sjghTu6nK/clX50a3HqbWr7DJaIDF9RYFd2jXEiEzPlQ1KSPeGiibRqHTjEQo0taY
         MRaw==
X-Forwarded-Encrypted: i=1; AJvYcCUJiZHTIE8AE0PtfnIR8E71UyAAWQL4QezdzfheH6D1Bsm8gBpVly8tgdyDVCiJ/ko5VfgBrGVmnIM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfljeARM7moluizhoUvQjloUyliNRG/SkfTLicJx8noNCdJeva
	xa+Y+YjtuM6IUbG5UsqLwp0mvZwI9XKNhyRUsKUFkbuREoJI4OBUyq5teRMuhg==
X-Gm-Gg: ASbGnct9TQ6wvCoUGwz03x35ubK59Csbm4+7h30QObqMhrUoVWe29xGDQDjAAYUbD2R
	1oy6zXh3gFChbLeXp4Hl65J+7vAXXf020wqCtuTK1r2OBgADQisJqKH80klY8ZhHGVuqy1/RsWD
	bZJ9xRceouXAmCyQrPuNhfMOac30lZWTRVh4oeud26wprlewbjRt+h3GSyH1a8k7UBaCYHf0Dpp
	QUGN9qdF4eQrqtm+JXQzezLbrKwhPtDpPIDNw3Fi+5MTm5Kvjl7r815wpWsWtFMVsFRIlXPMgIl
	0BSySRFONQ4RScleiLf2tPkSgb4/O1W8kPXGSPb8poYmgH4+bPF3tzAiswBsX6ln1aFTUbBKdSw
	N
X-Google-Smtp-Source: AGHT+IEjPEi8l0joPn9UY3tVYZvSwXubrQApCCPiEn93vgRY/Rf3MtHBT/hEmyok1pNhpOFcyLlYVg==
X-Received: by 2002:a05:6402:84c:b0:5d3:e9fd:9a15 with SMTP id 4fb4d7f45d1cf-5dc5f0084abmr6591395a12.32.1738242140968;
        Thu, 30 Jan 2025 05:02:20 -0800 (PST)
Message-ID: <e0ab6920-86bd-4a0c-a5ff-4129b314bfd6@suse.com>
Date: Thu, 30 Jan 2025 14:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tools/hvmloader: Skip writing MP tables if any CPU
 has an APIC ID >= 255
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
 <20250128163342.1491-4-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250128163342.1491-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.01.2025 17:33, Alejandro Vallejo wrote:
> MP Tables have no means of representing APIC IDs wider than 255. At the
> moment the effect is wrapping around which would give a corrupted table
> with duplicate APIC IDs (some of them possibly the broadcast 255).
> 
> Skip writing it altogether. While it would be possible to restrict the
> APs shown it's just not worth the work. Any OS that needs such
> adjustments should not have been booted with that many vCPUs to begin
> with.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Oh, here we go. Yet then indeed ...

> --- a/tools/firmware/hvmloader/config.h
> +++ b/tools/firmware/hvmloader/config.h
> @@ -49,6 +49,7 @@ extern uint8_t ioapic_version;
>  #define IOAPIC_ID           0x01
>  
>  extern uint32_t *cpu_to_apicid;
> +extern uint32_t max_apicid;

.. I don't think we need this, as ...

> --- a/tools/firmware/hvmloader/hvmloader.c
> +++ b/tools/firmware/hvmloader/hvmloader.c
> @@ -389,7 +389,11 @@ int main(void)
>  
>      if ( (hvm_info->nr_vcpus > 1) || hvm_info->apic_mode )
>      {
> -        if ( bios->create_mp_tables )
> +        /*
> +         * Legacy MP tables hold strictly xAPIC IDs. Skip writing
> +         * the tables altogether if we have IDs wider than 8bits.
> +         */
> +        if ( max_apicid < 0xFF && bios->create_mp_tables )
>              bios->create_mp_tables();

I think we ought to continue to write MP tables in this case, merely
omitting processor entries with APIC IDs that don't fit.

Jan

