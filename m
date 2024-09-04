Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A14996B6F2
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 11:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789981.1199658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmSy-0007D5-SD; Wed, 04 Sep 2024 09:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789981.1199658; Wed, 04 Sep 2024 09:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmSy-0007Ab-PB; Wed, 04 Sep 2024 09:38:20 +0000
Received: by outflank-mailman (input) for mailman id 789981;
 Wed, 04 Sep 2024 09:38:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slmSx-0007AT-6V
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 09:38:19 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69d2c745-6aa1-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 11:38:17 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f4f2868783so64745431fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 02:38:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c24f762f8dsm4493487a12.61.2024.09.04.02.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 02:38:15 -0700 (PDT)
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
X-Inumbo-ID: 69d2c745-6aa1-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725442696; x=1726047496; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WASg7/iNZtWgPRlV7Rouas6BFRvfUBVTveRvSbB+JUE=;
        b=eiUOCIP2c5psVouqX1b1CwOXUz9XIOnuw0tpdPTQbM13MaENnxT9opviZt/YLeN5+b
         RwhajlMVjhBLHp/c5mBidVuFsTQwCTUuxuoxX58+1Z5PcOXLNXDCsy1Fa2j9Vth9rvPN
         MzoWAvP1tggE+1trD70VsRpJMTaRiIaSSWn4qDL3UrJxWahGtG9bOpZTSmwMrardx9fJ
         0hO4bKEcAS49Ctl4YjUX3zQqorKGKWZPLjvtQupLol1gndW9etfCsPA7u8Lz26679h7y
         U9RrSpWj2VzXDQkW/tlktlR7tf6afNi9lAOktVYv1J453aGqp6uaYsxYiu11qyzDLDUl
         BylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725442696; x=1726047496;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WASg7/iNZtWgPRlV7Rouas6BFRvfUBVTveRvSbB+JUE=;
        b=h8I6L6CwmtfS/iwGx10veGrBcQqKnTM2g4OI4PuYMBM/9Hp0rzzgIWT3C7vTCNCcF2
         flpdTP9PXKUIQx/vQCI7ieBqAE1qlRMW0HBoi/8LXxiH9NGamVCKtNDPht+O7xzwI59C
         z7F5tUhZN3LSs3c3ugEofVLLLcKmqAZ/fA7fPUbNSuPbT1Uro5x/aaM0yWuAjZVPK0Qd
         GnrKv/sNXP+bSQMNxWGMWkPr/g2nr69KAB/I8ayDw1Od5fCyK/QspCdKHygrVhUN17QE
         MYicFYXTp3g2KTCRM4csxkIAy/d6f+3RI+u6imPF4XCk0hSDzhkFn8QJ9j58WV5+Q6Dn
         LHrQ==
X-Gm-Message-State: AOJu0YzQk90/Wrnfoqq+lC5zd7hjW/xxvxmeZhAuKsSQXsGKjCXpLOqU
	wBESmHeZ7icNGT0chxg38necPV8vg++XACOOF7qXYdjkbzJrMSrDDGfV2O0neg==
X-Google-Smtp-Source: AGHT+IFTeYJn0c0zE3AY3WrRglgACvBeYQ+jNQxQScPPg0F/66tZIRzm5S4csMib3u+L5JXGS/6baw==
X-Received: by 2002:a2e:719:0:b0:2f6:1da6:1c64 with SMTP id 38308e7fff4ca-2f61e0ce899mr91786671fa.45.1725442696235;
        Wed, 04 Sep 2024 02:38:16 -0700 (PDT)
Message-ID: <1e3ee882-eb60-4828-9766-69b289740950@suse.com>
Date: Wed, 4 Sep 2024 11:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] SUPPORT.md: split XSM from Flask
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <c648bfe1-6ab0-4429-ab8a-b452ad2359ff@suse.com>
 <ZtgmgL1g_IW2JWUv@macbook.local>
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
In-Reply-To: <ZtgmgL1g_IW2JWUv@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2024 11:21, Roger Pau Monné wrote:
> On Wed, Aug 14, 2024 at 09:44:11AM +0200, Jan Beulich wrote:
>> XSM is a generic framework, which in particular is also used by SILO.
>> With this it can't really be experimental: Arm mandates SILO for having
>> a security supported configuration.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> @@ -788,6 +796,13 @@ Please see XSA-77 for more details.
>>  The default policy includes FLASK labels and roles for a "typical" Xen-based system
>>  with dom0, driver domains, stub domains, domUs, and so on.
>>  
>> +### SILO XSM Module
>> +
>> +SILO implements a policy whereby DomU-s can only communicate with Dom0, yet not
>> +with each other.
> 
> Might be good to clarify SILO is just like the dummy XSM
> implementation without allowing inter-domain communication, ie:
> 
> "SILO extends the dummy XSM policy by enforcing that DomU-s can only
> communicate with Dom0, yet not with each other."
> 
> Or similar.

Fine with me - adjusted.

Jan

