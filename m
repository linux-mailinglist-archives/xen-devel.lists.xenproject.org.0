Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876D9A4762B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 07:59:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897807.1306433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnXrN-0002mU-Qh; Thu, 27 Feb 2025 06:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897807.1306433; Thu, 27 Feb 2025 06:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnXrN-0002jU-O0; Thu, 27 Feb 2025 06:59:05 +0000
Received: by outflank-mailman (input) for mailman id 897807;
 Thu, 27 Feb 2025 06:59:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MKxr=VS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnXrM-0002jO-7G
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 06:59:04 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f072fbe-f4d8-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 07:58:54 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-439a1e8ba83so5638685e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 22:58:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4844a22sm1040072f8f.74.2025.02.26.22.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 22:58:54 -0800 (PST)
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
X-Inumbo-ID: 4f072fbe-f4d8-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740639534; x=1741244334; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w03aK/NSJNBYITE6SP2zpyuNtVvR7NGpIkA3+njse4g=;
        b=Aj0sMv+MjDm0IBu7PAEiZI0dehgFUTda5pzxzIOOShlZpn8TUQqmHjCMWcffPG2m65
         FbxOK+XiTkFWC9rXmfIrzl4tmBHrj1cq1AJyvu7Zfq3qLka8vNKVG33GUEW8Y5NFCpqn
         4vm9KAkBmXS4Qilp+l+rRzlaZl/iHTGV20SAy1COljRjo0gmD3XoxwzM/EAlHchezDgL
         GxfdP2bJjZoT80FGdd9yqfy2BQsd9SYvhrZyufPoay6NtxgExpthQyZUwDeqUOT1PRUa
         m7hgaEyjwoNMQKUijxC2kcW7bFDcRlYIWXiF2Ef7Dn2bfmNKX1Y9wFwvsNs0XJSei4ZV
         nATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740639534; x=1741244334;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w03aK/NSJNBYITE6SP2zpyuNtVvR7NGpIkA3+njse4g=;
        b=QdjAPKtOLPDRCh0TmfhmaUbCsmQlnfdxltEad0s+mTNTfWn1hyXjIl3Lb/JBLasNp0
         x8N8YUcmj2GwremePlh06rxZyGwX5jTaHzB+iN9+rri6OdwVQU45ucvDeon+dTdYJKWr
         RtojCF1wAenRagttYdtyd7eFUI3ZXa1+i6WqxHBy2QhvzarUj6fKhiyX1wRELNC7NTCb
         FB17YLeNWygTeNVqvS2kIDFjhdJYwpq7tLfK1y4ZpPgnHNx6Zx2ArsnVaZqlHMrKd4zA
         7uDVPBsFqmOm/HsbB2Xlwm4BJ6vI1hj6p7SqX5QQpnO5xRYAvx5aHgcoDP2NJm2JNK6a
         +UMw==
X-Forwarded-Encrypted: i=1; AJvYcCUa/GNp3MxI6erE8ibQOCt6oEt7P6/BtohleUO42HcdCayeiBbrIx1vies4YEF5KLc64iTCHnUdic0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yydmsqvt/p4m058QfKfLQ6cPXROoubpRsLlGbzfFSGa6sHkSAOX
	8hOH0GCyRW3htx1eExlmlhrFO45LlNAFQM4z8izqypiNHfdJzNYobEkga21+YA==
X-Gm-Gg: ASbGncvdCHrcZ2wORJGzG9+Lt5DRq9WRRVj8ZRXy9Rj0HT8tpVfKbAlBMfj3jxadQbM
	e5o+K9WDBsB5T2Sf8kgtnWlQTqTNDklb9gq6eOCh8Sgx6+yJhMl7mNRDJd3y+T/4L9bOJdMP9BJ
	1vspFiwm7m+OnTCCebkrKjzqEERkkBsxXsAvAeqUA0Tv9KS/8KgWko0nJrQAPj91D55zfSEkvSF
	kmvvDELz8OFH6R4YD0Xr9MKTvWs777qGGFST7xXW5KjLU6GCmA7S8jqggky7OfV4ZbBlUrq0qRX
	D+sj78ZQRmftQc15Q2DnogOcncqOAlbcRoyS9FywEOIfU36EfKVfUvvn+oRoiaKdDisBfn4VADL
	78+6+xEB4aEY=
X-Google-Smtp-Source: AGHT+IFtx4yJ3rjuM5Y/flb4NPlR6M8mox3KyXLZn/l7ewEnzQiQJOSo4fGbIsop8VbV1PP9u4HFAw==
X-Received: by 2002:adf:e309:0:b0:38f:2b59:b550 with SMTP id ffacd0b85a97d-38f70857b6bmr16176912f8f.50.1740639534316;
        Wed, 26 Feb 2025 22:58:54 -0800 (PST)
Message-ID: <68fe94fa-21ab-45a9-8664-d8c2638635dc@suse.com>
Date: Thu, 27 Feb 2025 07:58:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: drop pci_segments_init()
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4ada4343-c65b-456d-b0c2-9ae59937aaff@suse.com>
 <bcfad8f5-fa69-46b9-9ded-a6ca41949ff1@amd.com>
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
In-Reply-To: <bcfad8f5-fa69-46b9-9ded-a6ca41949ff1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2025 20:57, Stewart Hildebrand wrote:
> On 2/26/25 06:38, Jan Beulich wrote:
>> Have callers invoke pci_add_segment() directly instead: With radix tree
>> initialization moved out of the function, its name isn't quite
>> describing anymore what it actually does.
>>
>> On x86 move the logic into __start_xen() itself, to reduce the risk of
>> re-introducing ordering issues like the one which was addressed by
>> 26fe09e34566 ("radix-tree: introduce RADIX_TREE{,_INIT}()").
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This is entirely optional and up for discussion. There certainly also is
>> an argument towards keeping the function. Otoh on Arm there is the still
>> open question whether segment 0 really is kind of special there (as it
>> is on x86, largely for historical reasons), or whether the code can be
>> dropped there altogether.
> 
> Segment 0 is not special on Arm as far as I'm aware. You can have a
> perfectly functioning system with only, say, segment 1, for example:
> 
> (XEN) ==== PCI devices ====
> (XEN) ==== segment 0001 ====
> (XEN) 0001:00:01.0 - d0 - node -1
> (XEN) 0001:00:00.0 - d0 - node -1
> 
> Segment numbers can be arbitrarily chosen by specifying the
> linux,pci-domain device tree property.

Right, that was the vague understanding I had.

>> --- a/xen/arch/arm/pci/pci.c
>> +++ b/xen/arch/arm/pci/pci.c
>> @@ -88,7 +88,8 @@ static int __init pci_init(void)
>>      if ( !pci_passthrough_enabled )
>>          return 0;
>>  
>> -    pci_segments_init();
>> +    if ( pci_add_segment(0) )
>> +        panic("Could not initialize PCI segment 0\n");
> 
> IMO it's okay to remove the call here since there is already a call to
> pci_add_segment() in
> xen/arch/arm/pci/pci-host-common.c:pci_host_common_probe()

Is there? I can't see one, so maybe you're working from a tree with extra
patches applied?

Jan

