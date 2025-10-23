Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF85C022B1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149354.1481019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxNy-00019P-RS; Thu, 23 Oct 2025 15:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149354.1481019; Thu, 23 Oct 2025 15:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxNy-00017v-OP; Thu, 23 Oct 2025 15:37:54 +0000
Received: by outflank-mailman (input) for mailman id 1149354;
 Thu, 23 Oct 2025 15:37:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBxNx-00017p-8M
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:37:53 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c9736dc-b026-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 17:37:52 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-427015003eeso949290f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 08:37:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897e7622sm4568989f8f.8.2025.10.23.08.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 08:37:51 -0700 (PDT)
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
X-Inumbo-ID: 3c9736dc-b026-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761233871; x=1761838671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1dCvxMye9l7jXW04UbbLuCUVfTw9IP4T4rEWCeTm2P8=;
        b=VVN+4g0dnYuVoi0RgXcpIwCTCkA4d4LNKt/LPygU9CRKol8FATPrbWEmVwd3jIPdxF
         UXX5rV/mdh4aAs1WWy2yYalBDRKNDi7E93/GifeC6RD5/0M5+TFmh9gzh4LLeCuJ4nVC
         sb+LVChnVPp4u8+2xe643WFRHgZKnuH26dXtw4Hg6wJQkVYMgJ8fqxi48W7z71L+EOsY
         ctn8Lut9ToTiOsexIY6L77o+Q4doeJwIcSU4FLho8HLTt2qsB3JKHyKt9M9pJ5W0h4Cg
         lotsdXMawfUb1dQ9jhMLpFyH6Z09MB8ziGikkAmi5baLR40Lia04K/h73S+0D0rHKl7O
         BQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761233871; x=1761838671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dCvxMye9l7jXW04UbbLuCUVfTw9IP4T4rEWCeTm2P8=;
        b=usligzRW+WxN+QJ/Q8wglNe5EGfihKEMJemAA7vZ48TPJNzaYxDGeH1Nn3z8Yvf668
         +IhOTgQ2rt3jkhwxX5AgpTd8+Qt1B/WwmUWyD1Td0CXhty+dnNm+hTMnp2P1EPMTOCp2
         Ip/k6J/az9qjF7iprY22XoCitmoOzV64lZ4Jm4MeddrBnBv5QvPM9IN4oOMUP+JXSFDK
         vvEF5RhqH97Utfl2O1jkJW6SqsOgPirHtFvBGJAeBjByJxmC6SrJG/T7Sdh6DFK7+REk
         KM450sEr6pOQX8240xJXHTATfTdMMTx0mRVBapmaxO6OVxJwIjV+eWa/iRMMTYKBcDHE
         Vtqg==
X-Forwarded-Encrypted: i=1; AJvYcCXq48tqHcAWtFWIZjpxoDT6MMxj1yO32t/cC/6qvjqD2alxP75lO0yMw4+XBwOG3jldKG6SMoybUjo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6bFbV+Dg5DOleQMR19AQ0MLJGVfxcj2Z+QwDi6jYofzWrsjPP
	Gpz0r16u4jmGbg+HVEguaKLxfNHP/DBsmjXvbGpVpcpHOllPQom4oKpLEBgmXjB3Kg==
X-Gm-Gg: ASbGncs4LEKR3i/Oz/KwkDUDsxT2SlKwvo0rlaFiW6shSHcs/Nisit4Bh5urGjO5VDM
	L3PUxh+yTZlM9T90d+CErKRcaa9+q2Z5lEG27xmVYWYshw9Yv58D7zFKHK1D2ZMUch/KzljLLzg
	DjzgfacdRQ3GF46+4g2L3pRZShJrv9vrBzDDHHYNS/IO6k9nMPsvjXP1SEzbGYjJkztf4Z0CB/J
	QS/Np4cmq7g19zNka5CfoMJ5fA1vMVmysnVYRA5YaFkqFGgC/Hx9IUKNCfoQxn6lgN9UoGFg75H
	5zUNASfkqUWL7t+d0EgKrF13OBXnsY/OwGAvt6dWL6pBq8VvoqO8guc3uWllpwE8gNACjY7rqnU
	M2FoLEG5BryyukeKroIw0izn79YsDFb7l/hfh2QRxtZA94DSrr1bvizcmcGrjOQpYJfQUwEkLdE
	H9MT2SYutTD727NJwQCpxp7JHqEQdU8obYBCYUqUSvsiqpAt7uG7mSztkF0eidJc/2E24wu1PMl
	5vXRurAEg==
X-Google-Smtp-Source: AGHT+IEofRnIbvNYMbDjhqCpAhsuxFlxmzEZ2G9rRAmsXDqgzaYqXfB/PvMoVxcC/Q9Su8L+2ak3Jw==
X-Received: by 2002:a05:6000:612:b0:427:151:3d9c with SMTP id ffacd0b85a97d-42704d8df8cmr18250658f8f.16.1761233871554;
        Thu, 23 Oct 2025 08:37:51 -0700 (PDT)
Message-ID: <e45956c8-89de-4c5e-a5ef-12bc5daa0fe1@suse.com>
Date: Thu, 23 Oct 2025 17:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: vlapic: move vlapic_set_ppr/apicv_write()
 under CONFIG_INTEL_VMX
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251023152036.561109-1-grygorii_strashko@epam.com>
 <a6b61e9b-e1c2-472f-95d6-05b114b201d2@citrix.com>
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
In-Reply-To: <a6b61e9b-e1c2-472f-95d6-05b114b201d2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.10.2025 17:30, Andrew Cooper wrote:
> On 23/10/2025 4:20 pm, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Functions:
>>  - vlapic_apicv_write()
>>  - vlapic_set_ppr()
>> are used by Intel VMX code only, so move them under CONFIG_INTEL_VMX ifdef.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Yes and no.  Yes right now, but this is needed for AMD AVIC, which I
> understand is one one of the plans.
> 
> Throwing #ifdef's around like this in common files is fragile and will
> lead to a randconfig nightmare.
> 
> There is an alternative which ought to work.  Turning on
> -ffunction-sections (we already have this for livepatching), and
> implementing link time --gc-sections (new work).
> 
> That way, the compiler/linker simply drops functions that are not
> referenced in the final binary.
> 
> Personally I think it will be far nicer and more scalable than the
> #ifdefary, (not to mention far easier - it gets rid of everything
> unreferenced with one fell swoop).
> 
> Thoughts?

We'd need to have Misra buy-off on such an approach. I'm not sure if Eclair's
scanning would take --gc-sections effects into account.

Jan

