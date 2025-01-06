Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4183A02352
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 11:44:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865664.1276922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUkaz-0006Em-Sn; Mon, 06 Jan 2025 10:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865664.1276922; Mon, 06 Jan 2025 10:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUkaz-0006Cv-Pp; Mon, 06 Jan 2025 10:44:29 +0000
Received: by outflank-mailman (input) for mailman id 865664;
 Mon, 06 Jan 2025 10:44:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUkay-0006Cp-0X
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 10:44:28 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32932585-cc1b-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 11:44:25 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385deda28b3so9392983f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 02:44:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a2311b3c8sm44686921f8f.25.2025.01.06.02.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 02:44:24 -0800 (PST)
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
X-Inumbo-ID: 32932585-cc1b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736160265; x=1736765065; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mswuAOaTptRJ1crxo+RlLbD7enNxKMhGQJYvvHeQevU=;
        b=ekPvVCxJPIKMJjswpRCHX1liupyZuS7EgpgTBVH+NSZTqURxd8m7dbBSnC/h8641Zq
         VpTsQSDHhpjNUa7haEGIWUjAn5F7hosuXI+uP75XOzeCGJBqxhEZAxgctpyrJD1hLzsP
         dGqJy1dnJkXBjU7tDZSULnJUKQ6e2AHWxVtM9K9Ob4zqZFyZLqjgzVHy1X53jIeuYYL+
         RrZ5c+yPkbmCLtAfCyAIzLy17QTTXRpCabe7wZAtGTdKro5fqQdHoqBx1SEI98E14mTh
         NApb2pAciG0vJjUmqwJKh/xJCdlokDStEqx0uMxd4t4FUbRAmwVjlREspqA+H3EdrC4f
         Ji7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736160265; x=1736765065;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mswuAOaTptRJ1crxo+RlLbD7enNxKMhGQJYvvHeQevU=;
        b=qgp3mkicqevgAChcgbkwaJYRrBLR/CpWm7sQMZhb7ipzL4Cnca8taL1vZywn+ow4EA
         /jvUp7JJNRoDqAR/+L3A8So8/hGu8p8M3IibR+A1dqsnIb9HXEQxTf0dKlLCYOLNLgNe
         sJXO+9zIdujs0eD8pyqvUfvPzT2ukKcNOgsf1VisYxKvJd7lkBmGNIwx/eibhXVuiTA+
         aTsodKDNm/H2NMebtzSwireA9mbFHJa0HQHei7D4wS0q73u/bu1d8VUkNpHakIt9BKSf
         P6A2MOZXQJjIwoDMjoXQIgoNj23LAf94wkX4tpplo9MatFdpuSn98ubaIZgEL9VFeZGj
         BN2A==
X-Gm-Message-State: AOJu0YxI4v+BJdjU9N/J/MBM0m60E3ZicLIzv8in1/oiGSGmh2nDOaRe
	PDGwo45vD2rsXBWMhFwDv4Y5ErVAdlma8U71J5bE7CjdmQ04uPgpnBZYZsTHyg==
X-Gm-Gg: ASbGncsaoMSiPMepozs99Gr7g4ce4kDV3IIp4MoZkOMKdSWr0b+mQgEhagS/921YWfw
	TZcjJyjkHwQnLd9cJ4tbKVcoUKv+iq2eanrwVnV8pM1wAsVlovil8FCAGEX87WBOK8vE8aj5+KI
	LFy/3K4kRIb3oQ0qULImzO1ARTfIVaWT0Gx25y0Lztw4Ujt3uhJFpTa076yDctExwDpavMvpNBB
	pWsIXXrxb/M8xIZcao0sKDBbVyzju6qn8YSOwQMxv5XEiBEsJhGJDejWZ9j/OzIAwucPjTzRudG
	DWAXX74E3CNfX4ze2ZT7KEIqCTKlyh2YEoGmgxdbcw==
X-Google-Smtp-Source: AGHT+IGFOVRCUhPBiC//lOHyvO4E1U/h3piY+Mjg/Jx5LPFCaAQVDId10M6zkGt8Pzi+ixD9+p0tDw==
X-Received: by 2002:a5d:5f56:0:b0:386:1cd3:8a00 with SMTP id ffacd0b85a97d-38a223f5b41mr55937069f8f.40.1736160265127;
        Mon, 06 Jan 2025 02:44:25 -0800 (PST)
Message-ID: <79b2a77c-a41b-4a10-90b5-ecdb35baba49@suse.com>
Date: Mon, 6 Jan 2025 11:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/traps: Rework LER initialisation and support
 Zen5/Diamond Rapids
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20241231192002.1753737-1-andrew.cooper3@citrix.com>
 <Z3RvWJvdB68sVhqZ@mail-itl>
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
In-Reply-To: <Z3RvWJvdB68sVhqZ@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.12.2024 23:25, Marek Marczykowski-Górecki wrote:
> On Tue, Dec 31, 2024 at 07:20:02PM +0000, Andrew Cooper wrote:
>> @@ -2201,6 +2155,42 @@ void __init init_idt_traps(void)
>>          this_cpu(compat_gdt) = boot_compat_gdt;
>>  }
>>  
>> +static void __init init_ler(void)
>> +{
>> +    unsigned int msr = 0;
>> +
>> +    if ( !opt_ler )
>> +        return;
>> +
>> +    /*
>> +     * Intel Pentium 4 is the only known CPU to not use the architectural MSR
>> +     * indicies.
>> +     */
>> +    switch ( boot_cpu_data.x86_vendor )
>> +    {
>> +    case X86_VENDOR_INTEL:
>> +        if ( boot_cpu_data.x86 == 0xf )
>> +        {
>> +            ler_msr = MSR_P4_LER_FROM_LIP;
> 
> msr = 
> 
> and ...
> 
>> +            break;
>> +        }
>> +        fallthrough;
>> +    case X86_VENDOR_AMD:
>> +    case X86_VENDOR_HYGON:
>> +        ler_msr = MSR_IA32_LASTINTFROMIP;
> 
> ... here?

And then
Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

>> +        break;
>> +    }
>> +
>> +    if ( msr == 0 )
>> +    {
>> +        printk(XENLOG_WARNING "LER disabled: failed to identy MSRs\n");

... (nit) s/identy/identify/ as well.

Jan

