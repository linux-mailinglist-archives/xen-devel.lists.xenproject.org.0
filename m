Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED939A25A4
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 16:55:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820688.1234261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Ru8-0005y9-Qv; Thu, 17 Oct 2024 14:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820688.1234261; Thu, 17 Oct 2024 14:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Ru8-0005uv-MZ; Thu, 17 Oct 2024 14:55:08 +0000
Received: by outflank-mailman (input) for mailman id 820688;
 Thu, 17 Oct 2024 14:55:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rwie=RN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t1Ru7-0005gd-Ci
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 14:55:07 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbb3aa8f-8c97-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 16:55:05 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-430ee5c9570so14586925e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 07:55:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43158c404a5sm28928465e9.24.2024.10.17.07.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 07:55:04 -0700 (PDT)
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
X-Inumbo-ID: cbb3aa8f-8c97-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729176905; x=1729781705; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra4PJOF5dFa52c02/HS5qZC1o4o5NK91nl5ZJ+GhIqs=;
        b=FUT62LFbjqTIm4hCRKwZs84lAH6GnWhCyVNEnQK9swO6vugdpfw6+sT9tEFdjbihJG
         ermJOE1VQY5LaivFRKCz2nAvnOEk6iYqPW2rGQs2fGcpEv/Mp+PGD9EKUhgAXdGuGlpE
         ydVaSItDKrf9sbCKLjuHKozlCJaNehNpAXJ3v9dF+YTo0C0b9o11hw3H9+Tckwj/bblK
         CTyCEVgFHcR4E3/RMoCeEEa0aP9e5mXq7bkQxD5ycySb/gSsL1OKVniKKmzm+0Aq8+P2
         9qtTK62khG+SaCwQaS6SGRsEJng1oh4FyUjcoeZ0JsFIAWgJGYhAU1QIr6y73VGzV6+g
         ZQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729176905; x=1729781705;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra4PJOF5dFa52c02/HS5qZC1o4o5NK91nl5ZJ+GhIqs=;
        b=luuwwl8V40exrvqIT+UZlmfY1+boeSN8scrUV2CyZfN6TXkSlaY6h8rDcGeWbNf7g5
         dKKkykWxDbjm5y1nqLm6ELGkigOlVO9tBvKFkkGOzbBV4+6E0lryi+jrCGUzMPikRQ+4
         QJ1iXkQJk+rhb7wayDJHk5HE8weIZldtqFZOYy8nIF8m/CWf0QwvezeMYJqiOJPQWddB
         9fiIioAl4QDJ+n8tMQZ02//WkR16JD+1+looTCfdgGAxDUnpPsqVGcEoaWCkIiCgIikV
         x9dXVmuffsbLfbXbOGQTWR6VaAcNMGwQjGirCB0cfZTDkXDjdbQBVfLsnu0I0m83DRWS
         fFEg==
X-Forwarded-Encrypted: i=1; AJvYcCUXo9XfknMlYV3Wt1DHC+IEQ594v/oF75u8cw2QLBh5Wclf4Cz9WE0SaeRDQsNs0JF0uh5D/Vga+VE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzooxbCueCCYrEqqTixnH4ct6la1co3LUXDZKCOmYacR4If1siY
	nSKAYt27oUUknU+V8vXaxybRKH9V8tWPCbWpxmX/Lf2NULjJIkxhOqw4bgQvbA==
X-Google-Smtp-Source: AGHT+IHMMckdnBgHgKVhBCzfmqHnX7Bsgk3QD8L9T4a3JNRw7mrY2A9SqJD037mB4PGzYBN4PH+3rw==
X-Received: by 2002:a05:600c:5250:b0:431:4b88:d407 with SMTP id 5b1f17b1804b1-4314b89198amr82959055e9.5.1729176905301;
        Thu, 17 Oct 2024 07:55:05 -0700 (PDT)
Message-ID: <2565f369-96e3-4c28-b752-53b1b6a0d968@suse.com>
Date: Thu, 17 Oct 2024 16:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] xen/riscv: implement maddr_to_virt()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
 <ec04dca87144194f5b3ecb9a78d142d370c9193f.1729068334.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ec04dca87144194f5b3ecb9a78d142d370c9193f.1729068334.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.10.2024 11:15, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -25,8 +25,12 @@
>  
>  static inline void *maddr_to_virt(paddr_t ma)
>  {
> -    BUG_ON("unimplemented");
> -    return NULL;
> +    /* Offset in the direct map, accounting for pdx compression */
> +    unsigned long va_offset = maddr_to_directmapoff(ma);

Why the mentioning of PDX compression? At least right now it's unavailable
for RISC-V afaics. Are there plans to change that any time soon?

Jan

