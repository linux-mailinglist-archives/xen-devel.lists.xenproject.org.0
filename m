Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF1B54313
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 08:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121441.1465734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwxSk-0000do-8L; Fri, 12 Sep 2025 06:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121441.1465734; Fri, 12 Sep 2025 06:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwxSk-0000b3-4O; Fri, 12 Sep 2025 06:40:50 +0000
Received: by outflank-mailman (input) for mailman id 1121441;
 Fri, 12 Sep 2025 06:40:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwxSi-0000ax-0i
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 06:40:48 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69328174-8fa3-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 08:40:45 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b07883a5feeso273527466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 23:40:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dd57csm296846066b.52.2025.09.11.23.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 23:40:44 -0700 (PDT)
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
X-Inumbo-ID: 69328174-8fa3-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757659245; x=1758264045; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AxReRsaxHQo5lXVw1qwqvb+OtsLDzjQVC3KLDyod23I=;
        b=JtOxG0Ng6WDKdONV0Q3imeIrlZHdjdcK5cYQcbIFuP73uWMCBd2O1yXbqp19Ykzu6b
         yhkU+qd8T5nPs/XSUXxzqoHEN0R/igWFKb12Qo776ZqfbwdjIs9f7ax75k9CNLXRF31a
         CZuN3p897Avl3ou51Ce//XMV6SI0FSM2mgmWfKS334ntkc+Q8rZnDrwKo7++npHQgB2E
         q3RrMJb78D346rBrcB1L0Kt26NlYRUv4rEF7cP8Jj6/MGVuk7IeISzA+8qRw/7CXuiXF
         f2/xTauhmxhO5keIMkPkkOG15MlgVV8/NR4LeWQQ88aOkpoqSrCvaPz9a/FUqndb+Gqs
         pLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757659245; x=1758264045;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxReRsaxHQo5lXVw1qwqvb+OtsLDzjQVC3KLDyod23I=;
        b=SLCJcLV/d35zdQzTXVudEJzWFIIvCtjU3JfCAiXJchppsSpLVzRWjcrH1O0EVs6NB4
         sMoFCziLNoY9lNJcO3HbO+0pF7DT6GL7Mgf0JCrRc5U4/WXHZN3b2M8zhZiNo8lzAfWd
         oBW89GpQTvh1CUJ4kvEjpsHyufvjNKrfIsZyC/pR3LgENQ3nLPaHO7yHmir2Zp+Cxlb+
         60tK47Uv0NdUULIWmepqRg7fV8lmG/YgpKrvlP9DtFgZljXrPa8ZIx9BBx8KUgS1wVVC
         rTWSWRQIlWm1lisE5hBrmG6KynxdLnvhs6+KMH/foJBYIHIT8V7Zto7UxLEbduM6R2EX
         CRSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIcN6JPz0SZS+ajBF0uwtjprInE350zn9UTs7c+5yvk9+CIIYDgIkEYcqyQS3lnwazR7UdbuOq3rk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx743aNd0IUVHVEBYpfZfTNoUy1N49OV6XuYRuU8x80kylI+Mj2
	zpaCYRrM1vPxHNtyaZm0g3sJRwc0od/Oq91eIcUQLw/sL2qwqqdEn6xn/R6VEVb5WQ==
X-Gm-Gg: ASbGnctI7S4SHUCskuXFDZbO6IHm12PbubBZ4+Wj2+Om2yNs3IvhaHclpWD3Z5Jrikq
	RD5q8PUu9S94Bn0H5atJ4KYBxcilskh1EeJAsIcWjlwM3rUN7kIQLR4j152PFuFhlleTD8oeeYT
	zsRjgktdIjq1MYx9PI4dSqqfU8l3k/eBopTcsPV6bQ6fRehVexA6l2MRCpijiqLMivF4F1wNy+5
	tOzmYIgqzwjBmBwHUEyx9HtDITcIOSogwdZaOxcjmzrKudMptPwL5a1nFQuPxeFhUMGNTkbFqtC
	k/u2hRMZFqDOfWe0w6HAnmhBInU/OuDOX+638DHXpVMjdMiJ5QiIo1COa2RNm1Y2mGilIeQfk1/
	HiU2FmyyJV4nNOE5OOFQtXcl874Jyz80wVU1RQq2MnO8suOCgS64kgWuivyONUy/lylPjL8LpSb
	EZE1iFesNWhEHsIbex0w==
X-Google-Smtp-Source: AGHT+IFslBo+bQ9HJClrVwPYvIRArnACAj0uz4plujZwJ3Joi/FyYVT3mA6Dc5p+HjIyCYN8/dnGhQ==
X-Received: by 2002:a17:907:d2a:b0:b04:79e1:a08e with SMTP id a640c23a62f3a-b07c3583f6dmr166249866b.24.1757659245016;
        Thu, 11 Sep 2025 23:40:45 -0700 (PDT)
Message-ID: <4b958afe-dfcd-4ac0-bc09-468e2b9b2710@suse.com>
Date: Fri, 12 Sep 2025 08:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] libacpi: Prevent CPU hotplug AML from corrupting
 memory
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250911162336.23887-1-alejandro.garciavallejo@amd.com>
 <20250911162336.23887-2-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20250911162336.23887-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2025 18:23, Alejandro Vallejo wrote:
> CPU hotplug relies on the online CPU bitmap being provided on PIO 0xaf00
> by the device model. The GPE handler checks this and compares it against
> the "online" flag on each MADT LAPIC entry, setting the flag to its
> related bit in the bitmap and adjusting the table's checksum.
> 
> The bytecode doesn't, however, stop at NCPUS. It keeps comparing until it
> reaches 128, even if that overflows the MADT into some other (hopefully
> mapped) memory. The reading isn't as problematic as the writing though.
> 
> If an "entry" outside the MADT is deemed to disagree with the CPU bitmap
> then the bit where the "online" flag would be is flipped, thus
> corrupting that memory. And the MADT checksum gets adjusted for a flip
> that happened outside its range. It's all terrible.
> 
> Note that this corruption happens regardless of the device-model being
> present or not, because even if the bitmap holds 0s, the overflowed
> memory might not at the bits corresponding to the "online" flag.
> 
> This patch adjusts the DSDT so entries >=NCPUS are skipped.
> 
> Fixes: 087543338924("hvmloader: limit CPUs exposed to guests")
> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

In principle:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, ...

> --- a/tools/libacpi/mk_dsdt.c
> +++ b/tools/libacpi/mk_dsdt.c
> @@ -231,6 +231,20 @@ int main(int argc, char **argv)
>      stmt("Store", "ToBuffer(PRS), Local0");
>      for ( cpu = 0; cpu < max_cpus; cpu++ )
>      {
> +        if ( cpu )
> +        {
> +            /*
> +             * Check if we're still within the MADT bounds
> +             *
> +             * LLess() takes one byte, but LLessEqual() takes two. Increase
> +             * `cpu` by 1, so we can avoid it. It does add up once you do it
> +             * 127 times!
> +             */
> +            push_block("If", "LLess(\\_SB.NCPU, %d)", 1 + cpu);
> +            stmt("Return", "One");

... if you already care about size bloat in the conditional, why are the two
bytes per instance that this extra return requires not relevant? They too
add up, and they can be avoided by wrapping the If around the rest of the
code. I didn't count it, but I expect the If encoding to grow by at most one
byte, perhaps none at all.

Jan

> +            pop_block();
> +        }
> +
>          /* Read a byte at a time from the PRST online-CPU bitmask. */
>          if ( (cpu & 7) == 0 )
>              stmt("Store", "DerefOf(Index(Local0, %u)), Local1", cpu/8);


