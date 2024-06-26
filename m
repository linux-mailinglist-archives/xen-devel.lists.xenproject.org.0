Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9A7917A33
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 09:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748439.1156149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNTn-0002CE-MK; Wed, 26 Jun 2024 07:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748439.1156149; Wed, 26 Jun 2024 07:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNTn-00029V-JL; Wed, 26 Jun 2024 07:54:11 +0000
Received: by outflank-mailman (input) for mailman id 748439;
 Wed, 26 Jun 2024 07:54:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMNTl-00029P-Ov
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 07:54:09 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43c0d223-3391-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 09:54:07 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3621ac606e1so168187f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 00:54:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fa80e6a2fasm14212795ad.141.2024.06.26.00.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 00:54:06 -0700 (PDT)
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
X-Inumbo-ID: 43c0d223-3391-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719388447; x=1719993247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jomk9YsOuUV+FnjOYJJ5i1WfRB3XYh3pFVPLO+/7om8=;
        b=HSowMFwnKdXdVUPSPq3dP+z8hhc4jpGI/zwtDIFQlcIziBmc7iK0jb6C6f0xFuFCUh
         mDOXOJVXDXlimWi/SIIJtIzGoQUlAO6TvUpqMWaNnaQq33dYH/EkLoqOyoOsEzb+9mDb
         yhCSlekYFFapri2FmKnmsSLKmF5ljOZZum7UqVxCnjKEPSJHCgzMMry4QZblTP+K15YU
         H6ClK7o1ygqNujapcFglcMdklIMul1PQWs77pkfe9N79QgfILPs2X1NcO4c419qs4uSO
         cZZW/zWeX2jPerq2+XwB2m3QzfQp0D2tMRxcGrDQ7M2Gnkva1eHddxy5MPlh/LkKDdlc
         2nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719388447; x=1719993247;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jomk9YsOuUV+FnjOYJJ5i1WfRB3XYh3pFVPLO+/7om8=;
        b=uw3XJ0Q0TmWuYHd6/niAHmxEdGSRuxTxC4Uaw0RL2nOpDTOGdgetYM9D2/K1Y2e47l
         hqK8wM6wHF56DCZaFvc7N8xMRAQ/hBgqh969j88/wzu9NyVds8RykaMddYhOA2nRnQ7q
         n3Ku2SVH9XbJZDErvUnMGmNhklBHWZ7QB+/vRF8tUQCyyBzavCqSQVAu0+IAj7jv/1Ec
         FV8LxM97Ma3BYNgZu6tDeLgPDAtng2mmKRibV8ZiFi1TczktxQZgLBkByNwWFwwFnu/V
         xj4baFWY5a32IdsVpDm3E5QxA0c9GPD+h1WK+d4k9UXBXJ8YaE0q/6coY8uLmQDKfIYE
         ckGA==
X-Forwarded-Encrypted: i=1; AJvYcCXqMk1nPXCMOr7cYhx9xWOLN0Ji+e1BK5lWC0Y+iF/zrYfV1MCKJ97G3ZKKVuAHPqEVpAWrOMJQqFwAN0AzdZf48txiq4QxOye5uobBcPE=
X-Gm-Message-State: AOJu0Yz+VELcr0J+ZpC5hEZQrNkM9E081BsHqcLTC4x+QLcP8WKmIKkp
	jBcZOeawmHVT8tc+If9/YJsMgA6NvpXdTjvzasczr60gY/rm438bKUw9uYsOqg==
X-Google-Smtp-Source: AGHT+IFtgipts1TEI6RELNe3B3NDSXoZv4cAG4PKhUtnqloh4z9b3LJWUUkOMFlL7YyCOiORT/q62Q==
X-Received: by 2002:adf:f990:0:b0:361:e909:60c3 with SMTP id ffacd0b85a97d-366e3267fb9mr8442270f8f.9.1719388446712;
        Wed, 26 Jun 2024 00:54:06 -0700 (PDT)
Message-ID: <6ed6d9bf-2e33-4294-974b-eb1924b011cc@suse.com>
Date: Wed, 26 Jun 2024 09:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/10] xen/riscv: introduce ANDN_INSN
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
 <b0d2ff2cecf6cb324e43b9c14c87f47f3f199613.1719319093.git.oleksii.kurochko@gmail.com>
 <95f64eba-13b9-404a-8318-7a3fc77ea560@suse.com>
 <b638c5f8-20e9-43bb-a47b-e24cb1b1b821@citrix.com>
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
In-Reply-To: <b638c5f8-20e9-43bb-a47b-e24cb1b1b821@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 23:10, Andrew Cooper wrote:
> On 25/06/2024 3:49 pm, Jan Beulich wrote:
>> On 25.06.2024 15:51, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/cmpxchg.h
>>> +++ b/xen/arch/riscv/include/asm/cmpxchg.h
>>> @@ -18,6 +18,20 @@
>>>          : "r" (new) \
>>>          : "memory" );
>>>  
>>> +/*
>>> + * Binutils < 2.37 doesn't understand ANDN.  If the toolchain is too
>>> +ld, form
>> Same question: Why's 2.37 suddenly of interest?
> 
> You deleted the commit message which explains why:

Not really. My whole point is that while the intention of the change looks
okay, description and comment describe things insufficiently, to say the
least.

>> RISC-V does a conditional toolchain test for the Zbb extension
>> (xen/arch/riscv/rules.mk), but unconditionally uses the ANDN
>> instruction in emulate_xchg_1_2().
> 
> Either Zbb needs to be mandatory (both in the toolchain and the board
> running Xen), or emulate_xchg_1_2() needs to not use the ANDN instruction.
> 
> I opted for the latter.

And I agree with that.

Jan

