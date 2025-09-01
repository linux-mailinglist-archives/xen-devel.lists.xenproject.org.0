Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD99B3DC7E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 10:34:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104156.1455281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uszyr-0006sd-S6; Mon, 01 Sep 2025 08:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104156.1455281; Mon, 01 Sep 2025 08:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uszyr-0006r7-PI; Mon, 01 Sep 2025 08:33:37 +0000
Received: by outflank-mailman (input) for mailman id 1104156;
 Mon, 01 Sep 2025 08:33:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uszyq-0006r1-0S
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 08:33:36 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5966b956-870e-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 10:33:34 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-61e8fe26614so1753174a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 01:33:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbca5sm6705038a12.31.2025.09.01.01.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 01:33:27 -0700 (PDT)
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
X-Inumbo-ID: 5966b956-870e-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756715614; x=1757320414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iks5sK8Sh5KQ31mxOltV9v6WGyZAVIDFYE/aBLCLUlY=;
        b=Ac9kD6QO/TN3cLnw0TRsyaMkpjnPKY7pnOJ8reHGA4qFViqzoHax3/akoIMkK9SpM2
         lMFX51Ga5APYadbb90seToebFbO4lV0YVQrdwr2qHC7oBYxZLTpnMQN8cWyVAckhDSdz
         tOLdFP+DFd+X8XB0JAGJYcf8GvtBO3lzyiKZq9TSvIRJDvz93Eo6mgHCxJ/IMaICB17Q
         jYKYhFvkyF5nDHShONv7CFcc9eHchCqvbGM3+nFruWHlVdimWlHEKS8LQcwLK7JXqPOJ
         l+jQUDWPqWLUTl7dTQDZRsRcT9ZXmWMyPzVF9ByNY/4RAb7Gr5NDkK/AzumFFTXfqlXS
         LKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715614; x=1757320414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iks5sK8Sh5KQ31mxOltV9v6WGyZAVIDFYE/aBLCLUlY=;
        b=G49dHx9uqnZ9lHg39OQKE1J179liEpFHrBhobmp0EWW3gcroAVHjjOKn3wRW1MDeyI
         JGNidZyD61f/OGhiakBTu01t26tLktqxwkuZe+1zVwRw+yhdIoFOElIStWeQrKo15rhu
         9t6+RAImzhqeEyELj86Je67mLJJBvliQtQoPpjMHDDcaBIZ1nK6+E57adOJ5C26qBR1F
         RncT2XDGXNz4AtgfWPfV6Z8iEOxKmRzrxTOsQLo8FpgCT1pla8YgG0SdMW4/g1N6lYJn
         APrCDyCDIlZCgNR/74CMfNmgGJ3eg4FiDqH+QgXUiLdcQZV9ibzPierQMjqPy4vzm3AZ
         vpIw==
X-Forwarded-Encrypted: i=1; AJvYcCUvu0xk2P2POwFW+Wq5FDzxMW9+bOIIlG0QMSTpFCh1IgDwRiE9MSQFZd7xA+vh++n4plqw4a0y8DM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx201O9aSRNd2zQ+5RI6ki+n/grFrzXaEiCluAWGr+nmDqkxkVu
	TyfbzQZvu5NoUiNv3aUFGtS/oZf+wxcL4qb0P55Em2oGGgEreuCLsCKv9JnUOszOEDNQm6erAeq
	TPX4=
X-Gm-Gg: ASbGncvFa/tW1K3/gAHQ7eRb8FPn7sp52zHSsdWNOXQGnhYSWVvF5fQe2wwgU/7Xeil
	0f9vhuazMBweDKMOVql9sg7WaIw9YwFqb464/QHrluYZ07j6KU2nk7MCpmB9lm8wDe9wktbSH/Z
	P087xUdB9awtQCQbnYOKeF2fNMTNqf9iG4C0rOr/aD7IXixREUhZIPHyIXv6NIcVxslJzK3l9q1
	pImrDO2JYdlUFDY7rVDvaDbO9rfw0MhWZI9m7Mq8LcFuWnKZWXCD9msvdbEIUrsdkWgBQveRLJ5
	eMz/Jm+bCrg894bouvrckJ5GFlpMPiXnwXx4mERPP1Y42RELSIqoDAb9/cj+2W19Ws5IhXqq4M8
	pm1LKgeHVKi0NVcGtEfyc+1Vf1j1Ps+qESIHFFpQ/BPdcite3SzMWFeFWS277+R9kOUNR44tx/u
	j7kbFNDB7Sf+pNmO7bQtYHNXQpQaTb
X-Google-Smtp-Source: AGHT+IGtRp0J/f83iu3DxWcmmrZZkXNCmkN0WTGCpW+/6ntjkB+PNLkJ3SBH4z5m3u6b3pRIgTXK/A==
X-Received: by 2002:a17:906:c102:b0:b04:3e15:7289 with SMTP id a640c23a62f3a-b043e1579b0mr64572366b.33.1756715608328;
        Mon, 01 Sep 2025 01:33:28 -0700 (PDT)
Message-ID: <7d1bf3ca-b7fd-4c42-a9af-157120828d6c@suse.com>
Date: Mon, 1 Sep 2025 10:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/apic: Get rid of get_physical_broadcast()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250829161710.1056772-1-andrew.cooper3@citrix.com>
 <20250829161710.1056772-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250829161710.1056772-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2025 18:17, Andrew Cooper wrote:
> This is a port of Linux commit 517234446c1a ("x86/apic: Get rid of
> get_physical_broadcast()") to Xen.  Thomas Gleixner notes:
> 
>   There is no point for this function. The only case where this is used is
>   when there is no XAPIC available, which means the broadcast address is 0xF.
> 
> In Linux, users of get_physical_broadcast() have already been hidden behind
> CONFIG_X86_32 suggesting we can drop all of this, but that's a task for some
> other time.
> 
> In Xen as with Linux, setup_ioapic_ids_from_mpc() and io_apic_get_unique_id()
> are only called in pre-xAPIC cases, so can use a broadcast ID of 0xf.  The
> only other user is __print_IO_APIC() for diagnostics, which can simply drop
> the check.

For setup_ioapic_ids_from_mpc() in Linux that's partly because it gained an
Intel && !APIC_XAPIC() check which we don't have. Without that extra bit of
data it's not quite obvious, as the check right now is solely "!acpi_ioapic".
(Which iirc we said we would want to get rid of as well.)

The non-Intel pre-xAPIC case is left somewhat unclear there, though.

> No functional change.
> 
> Link: https://lore.kernel.org/r/20240212154639.057209154@linutronix.de
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Irrespective of the above:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

