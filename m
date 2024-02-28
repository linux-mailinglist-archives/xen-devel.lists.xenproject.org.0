Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2482486B261
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 15:53:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686688.1069002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLIk-0003c2-Rc; Wed, 28 Feb 2024 14:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686688.1069002; Wed, 28 Feb 2024 14:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLIk-0003ZK-Oc; Wed, 28 Feb 2024 14:52:54 +0000
Received: by outflank-mailman (input) for mailman id 686688;
 Wed, 28 Feb 2024 14:52:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfLIi-0003ZE-Ko
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 14:52:52 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b58672b-d649-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 15:52:50 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a440b1c445eso101594066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 06:52:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p4-20020a170906614400b00a3f4bafa6fbsm1903065ejl.168.2024.02.28.06.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 06:52:50 -0800 (PST)
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
X-Inumbo-ID: 0b58672b-d649-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709131970; x=1709736770; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0cAx2wtEdscxtqJw6koZOCpPdjA45RO8nsZSMPNeIa4=;
        b=Y4JDYgWjghHr8NPR0z+9GHFBo2I5wcNNLJUk9LnJQ4dSCzQZPC55h4Mdkpe0lReEC8
         utvO5GKrXoLPSwcgdLMPQ85h4E/Xhd7tBerD3N+2EvSlyIxlZmOUYKSa+LJ89sYaPpjH
         ECGSL1218xVli8NNaH3yAnudoMj9kvdgFMfkIEw4jitcDOyTHVLcn8kLScMl4WCOvf9P
         DFlqHb8O0f5iLFJnMpXDkE4MfD297OETaCp2uTNz6BDFASSpVaFWKLc+jOi1+71eGFQO
         iLW+Im683FoWw17Axmd04fwWo5PXoz+Jxbk2NTxvomsAMjPsK5lNClMXhOyqd0hyPkcH
         3LaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709131970; x=1709736770;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cAx2wtEdscxtqJw6koZOCpPdjA45RO8nsZSMPNeIa4=;
        b=YGX8zvm3VW34GPhc9MLCRJjj5noJLQckGrYPCjWYhWfPbVF/IUA6g7QJa/zFsJLB+5
         uvYHn+jpoYdd3S7wLKCr8y5LoHCrVW35jXnf/0tvkjDkokXpjl2gGdHApocTae1/nrya
         hIEd15dE0595ztgRFeb/8KCoZ0SBIzM8YGqdCfDiHQAxCW+HMSwz/VzLbTwFREG5Si1L
         3ziTY2gNPt0Rw07XacjqwlvETGuFvrcRO1EuCO4HSO8s0uvRhzNLz21DedYT+6IKBM9O
         om9LFMqYfs/ML06T9laFzGybuxKXngFktOfOG2MGbmyEIkaC/PBsw5kZZTUlUGnX5o7y
         OhrA==
X-Forwarded-Encrypted: i=1; AJvYcCXmCPK9D7EmcY1FQk+NH9RGroIXcN9zYItBmUoXK2bjerw+Xb5AwA+eNDeQkzbMzcKk9tZqyuwoN8vyFgx6Z6UvGB/D/aGaGkcAzkeJsd0=
X-Gm-Message-State: AOJu0YxyfTdyoZUImbnRG4DTWnHihMYRE0+VatIxktDcBLX/sY4tnEK8
	krvNjeuTkDSpGF0i0ewxm5PriNQ+JeWyQsHIMc1owoNqS4H7oaqy5Jio9TrdDFemD0mt/8luZxg
	=
X-Google-Smtp-Source: AGHT+IHUQXZ+VeT9gde4R5AX9cm3TiU/uXgIrEDpepJ8GUJ86S29iSHWw8Xj7K8C6jydPVSgcgKxZg==
X-Received: by 2002:a17:906:792:b0:a43:fec3:b648 with SMTP id l18-20020a170906079200b00a43fec3b648mr1736086ejc.24.1709131970236;
        Wed, 28 Feb 2024 06:52:50 -0800 (PST)
Message-ID: <271ae402-7400-4dc5-9222-88523b9a2922@suse.com>
Date: Wed, 28 Feb 2024 15:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH v2] Argo: don't obtain excess page references
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <79ed633d-b0bd-4a7d-a0c6-37a034e1ee96@suse.com>
 <0374516c-b5fa-4880-a07a-0b788f491e9a@xen.org>
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
In-Reply-To: <0374516c-b5fa-4880-a07a-0b788f491e9a@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2024 19:01, Julien Grall wrote:
> On 14/02/2024 10:12, Jan Beulich wrote:
>> find_ring_mfn() already holds a page reference when trying to obtain a
>> writable type reference. We shouldn't make assumptions on the general
>> reference count limit being effectively "infinity". Obtain merely a type
>> ref, re-using the general ref by only dropping the previously acquired
>> one in the case of an error.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

I'll give it till the end of the week for an ack to arrive (or a substantial
objection), and commit some time next week in the absence of any response.

Jan


