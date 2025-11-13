Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A800C5779C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:46:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161282.1489265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWia-00011s-U6; Thu, 13 Nov 2025 12:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161282.1489265; Thu, 13 Nov 2025 12:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWia-0000zq-RO; Thu, 13 Nov 2025 12:46:28 +0000
Received: by outflank-mailman (input) for mailman id 1161282;
 Thu, 13 Nov 2025 12:46:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJWiZ-0000zf-L2
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:46:27 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c24e86f9-c08e-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:46:22 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b727f452fffso301417566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 04:46:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734ff36ac6sm155590266b.74.2025.11.13.04.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 04:46:21 -0800 (PST)
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
X-Inumbo-ID: c24e86f9-c08e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763037982; x=1763642782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CK4vBDbYY1HhUOmXQjOwdLsT30MolQko3xX7eVqoaHI=;
        b=Lf8Tn0FR8XehsXSyk5IwTdboo192xswz/+J09ovMgvPB8mBx/da1ba/3cppWI5aUAo
         HurVun99Mbp6PD/qed1aHVdUeNCfM2H4JrFiGQeESUw7vKBL3cKHJ0x87FMR4q0Zxmvf
         rNDYuFcVq9RDPSlLMXBNqdZnWND0awSVsuhglFMaW6XXRCWDWtdx7NIdT5bff2+ZPI1Y
         ltYC8L1iG90GmOsN9ft5gliKrnpbFg5Y5d8aB4x3sMX2JqLdSGehZ3/iWP4IrhMPQhxb
         WuAT7SohuhZOjLSPLnD4VQsIHzkySk3kqSA+NPC6zQ2maPkTPNDBc0J91e70VAj16wCJ
         QTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763037982; x=1763642782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CK4vBDbYY1HhUOmXQjOwdLsT30MolQko3xX7eVqoaHI=;
        b=MZbvvnXDIMIewyB5i1jxQhsqR2kCfaQwNsGcHzxV1zm6b2z/dk1c9+Re+tlikPco4P
         LbyhbjYp57PeHeUx5gh5WBIb1O3RQkkf0dN+CMUsJ5rkxpF1Ezd9BPGRcEWReTd/P0TS
         bKxQisPp+5MgUh/9ukKcNs8yNB1upOF6UF0oiALMAEzjjZDqDcYcyUul2g9wXzePkuq/
         Gs+jNqW2wIrJ5OP9CDR3MuUM6i+VCIId398mVaFlxlEW+vwN5eQKMs5+S37m9g70Sus6
         Nuy7J4L2LcsJ4awvmENBd4okn1qvCUh3LtuyeXcWoh9wZWgInjh+QUvzlCMp166n9oBe
         39cw==
X-Gm-Message-State: AOJu0YwxCRHu+ZxG1NDB19YsMIGY4atJVBEURHban9oDpCuwAY6F0O8g
	8O4aIbh8BG8GhKpOaBBKmqwogAsojhQcG+S7p21ey1xp6dOoADiFakIz94G9nYwczQ==
X-Gm-Gg: ASbGnctDCYeQNNqPcdPB3c//afWBvtb82YljkjW2p6qtqxdS5i2d4mEVrdIF8owVJxd
	6fN+bS/taT72bVWxVLbKGLNTfYplLsKE0fFt2U1yv8OcazLZnpul/UZx2WWlVHXupTr3YDJqAU3
	wjQjVY9IeF9V2oUopvIXEW6I6zgS9Eq5p3dT7hNSDjWsbaaomknfa+iHvVchSBDltOXhY74uyFZ
	kG6zyrZ+BJvJ3oFQBLSBU39p8os2eEr/GNSDexGCoEQCxeV18AwB3VVlnsF4gT3X9nEZgSzIJp5
	BSOD6ZBtZPZaj9VgX5ZoBocfzcRlvTXHMlSg6DMgpEOE9eXMVp/TwX527SaR1be0gwqx77eiX1N
	NIaR86prs8Bm68rGejtqxS2uFIka1AYaF6KYsXsFW5wL2J/N9qAo2MI9+88wXyn+t79vOAsVF2T
	6o+cBTdCpCs0icejaPYc+jJNmsOZoUFdm4f3nbBqVtUvKKRyXw9SF+vNu+kFh8fkMgGZh5trcwy
	48=
X-Google-Smtp-Source: AGHT+IEJflYAnSpm+N1j6YyDBmfUZ1LBl2/zRKzeTgWX6HFUHXUKFfuskMbnPM+lY3VCdQ3brq7Jjw==
X-Received: by 2002:a17:907:ec86:b0:b73:2ced:9af0 with SMTP id a640c23a62f3a-b73484f2271mr263293266b.27.1763037982156;
        Thu, 13 Nov 2025 04:46:22 -0800 (PST)
Message-ID: <4391d560-870e-4010-b3bb-dee2935f9732@suse.com>
Date: Thu, 13 Nov 2025 13:46:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/EFI: replace ebmalloc()
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
 <452fdf1f-646a-4bb1-83ea-ac4c998a096b@suse.com> <aRXRtY10cFN38d02@mail-itl>
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
In-Reply-To: <aRXRtY10cFN38d02@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 13:40, Marek Marczykowski wrote:
> On Thu, Nov 13, 2025 at 12:09:37PM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/include/asm/brk.h
>> +++ b/xen/arch/x86/include/asm/brk.h
>> @@ -2,6 +2,10 @@
>>  
>>  #include <xen/types.h>
>>  
>> +#define DEFINE_BRK(var, size) \
>> +    static char __section(".bss..brk.page_aligned") __aligned(PAGE_SIZE) \
>> +        __used var ## _brk_[size]
> 
> This chunk belongs to the previous patch I think.

It could, but it's not used there yet (i.e. would count as dead code).

Jan

