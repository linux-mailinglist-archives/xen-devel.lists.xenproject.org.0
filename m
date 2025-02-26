Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FF0A46398
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896797.1305549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIis-0001a5-0U; Wed, 26 Feb 2025 14:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896797.1305549; Wed, 26 Feb 2025 14:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIir-0001XL-Tj; Wed, 26 Feb 2025 14:49:17 +0000
Received: by outflank-mailman (input) for mailman id 896797;
 Wed, 26 Feb 2025 14:49:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnIiq-0001XF-PF
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:49:16 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d87d01f6-f450-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 15:49:14 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4394a823036so66402995e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:49:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd867144sm5815315f8f.7.2025.02.26.06.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 06:49:13 -0800 (PST)
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
X-Inumbo-ID: d87d01f6-f450-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740581353; x=1741186153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0e1NZ2TBMlHlv7ZRAR+p4qa8+YM4RrkEwMLSG0Xs36c=;
        b=VUtnT8jO6BMpvma62VCvskw9gDXua1tvkrVi9Dh6SphL6dtw5XFscyohTsqqOAaP6E
         UESlDZFQrT/2XQHldSpiQwTaGwXPcXiQf+b/fIuoHjhUT6zPhfBfZrjjRp7kZVrJLmCz
         JvXzZnHI8nN7j2LpxJSHPrr47xF1f1d4iMab9wjeU5YErW020JpwmFOFMJ5KKqnV26TT
         e9zQy+jGqlgq7DKGGamxvFAJic0dMI6Dm6O/Fhcxoho5mZnWNSvbJa173jaOTzcFiAmw
         WXLsZvApkt5ICrJF5KNi1KpXactbhw8AOozzBLwptXB/Ch07BjlrQRCIPTpAMcGYoeXD
         +pwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740581353; x=1741186153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0e1NZ2TBMlHlv7ZRAR+p4qa8+YM4RrkEwMLSG0Xs36c=;
        b=RC9KvApykSHHlZ94brwnY73FAU5Z9QBRmQD6XdGNXJQurYTd0eB5JLkKVoBqyoBpGI
         gnQ8N5o1ypcPnnGTHzg4YcfbOATkpxygsOPOdqnFKziNr0BysLPI2Crbbx7+7VdIlz3w
         GsNAToIeh/hGTJlBO+qcJAdijvpDIJOJPUf+TN+Q6y+Z61c/Ss8w4liOAWCfx4fHmOPM
         T7ahyOw6eseZl/9zwLVpFFypJYaAjCcReOAjkei6QjUULpgiubQEkinV/QpHtR9l+06W
         Saui1kYPvkA99gj02NgYz6/U0rmwM3nuIFQagVzE2KKNQKkiSF5motCnM2tgHUZw0khu
         Hy3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8JE6A9IyzDUnUeJ+u2627BEOczTqD/ytAxwgfIYdmLvzNxSjGefvsr0xjsWDpboqFM1+0SYw9dvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/qLYLjU77EzExjFVk8RlhiJhEvx151EVxZFrCHyXeh6HDl1Ft
	KITukTxypo8OfTQdYK/B6w/m8MmhooYQmGNo0iiXmWa24+BhFGLDXrPUSI8Fyw==
X-Gm-Gg: ASbGncuOCbo50IW3b/K7OhjVpt2WL5101Nk+oV4bp0lXnFiqhgcyUhSOfVfY+kum6KF
	zZdkE8fN13oZMO1Iooqg77Mrot0Vuy5evHtw7gGMEx02PLvgNLGV0NPk4vYbdAmjUZa9sv4yc8Y
	p1O+WymIBquuL9xspg0RPZ//D33FJ33BTDRbpA4A9lz9PBH/NskKGuymrXYVurspab7rVahnDis
	PtMHMNjEO5+vF2vZ4CVN+ybm6hPtEDDiM9REMmPFKruuMkYG/FTJU7gY3PR25KYFn3USRkgBl7E
	bWohtgl/X+rcnCxMfd12AUYzAExY3Q8f6hBTRNcafE4W/XApF5s4m/+y3Hbh3RV3jvr0FeMhk1I
	acEcW0nAYvE4=
X-Google-Smtp-Source: AGHT+IHS2Aih6scmve198y8JFBTKo/ACoVJVU/RoYClA8l7EiiT1fh8YF4npeC7qD1Bya/Q95N+t3w==
X-Received: by 2002:a05:600c:3b91:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-43aa7a63c45mr103122675e9.2.1740581353453;
        Wed, 26 Feb 2025 06:49:13 -0800 (PST)
Message-ID: <e9f75fd0-4e65-4f06-a671-7f497354872d@suse.com>
Date: Wed, 26 Feb 2025 15:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v7 3/4] xen/riscv: make zbb as mandatory
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
 <611e289e357a26490b95b2aa93d7288c77787171.1740071755.git.oleksii.kurochko@gmail.com>
 <ef3972a5-825a-47de-b9a7-a3681fe70bcb@suse.com>
 <38834638-df7a-4631-99e1-5596bb65d136@gmail.com>
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
In-Reply-To: <38834638-df7a-4631-99e1-5596bb65d136@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 15:38, Oleksii Kurochko wrote:
> 
> On 2/26/25 1:58 PM, Jan Beulich wrote:
>> On 20.02.2025 18:44, Oleksii Kurochko wrote:
>>> According to riscv/booting.txt, it is expected that Zbb should be supported.
>>>
>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in v7:
>>>   - new patch.
>>> ---
>>>   xen/arch/riscv/arch.mk | 7 ++-----
>>>   1 file changed, 2 insertions(+), 5 deletions(-)
>> Please can you also tidy asm/cmpxchg.h of ANDN_INSN() then?
> 
> Sure, I can leave only:
> /*
>   * To not face an issue that gas doesn't understand ANDN instruction
>   * it is encoded using .insn directive.
>   */
> #define ANDN_INSN(rd, rs1, rs2)                 \
>      ".insn r OP, 0x7, 0x20, " rd ", " rs1 ", " rs2 "\n"

Wait, no - why would you? Patch 0.5 is supposed to be setting a baseline
where Zbb is known by the tool chain. With that proper "andn" can be used
wherever we like.

Jan

