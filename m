Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B60B51BAA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 17:32:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118500.1464265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwMnH-0004GA-3J; Wed, 10 Sep 2025 15:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118500.1464265; Wed, 10 Sep 2025 15:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwMnH-0004D2-03; Wed, 10 Sep 2025 15:31:35 +0000
Received: by outflank-mailman (input) for mailman id 1118500;
 Wed, 10 Sep 2025 15:31:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwMnG-0004Cw-B2
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 15:31:34 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ac2b891-8e5b-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 17:31:32 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b0787fa12e2so155111066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 08:31:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07830aa78bsm186915566b.29.2025.09.10.08.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 08:31:31 -0700 (PDT)
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
X-Inumbo-ID: 3ac2b891-8e5b-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757518292; x=1758123092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kB/ZzoS93GS1qbaxrpjY6gLcgDq2wa5Z+qCvub59zO4=;
        b=gB9Z0yd9SZnYt2vXY8RHQAq8hI1eAqNTkuaGo9ddduOB1tDlcbQGqGr5LQI5pYEzm2
         z+IkUVlE+XlbBSBPdvjhudaWU/lJ/nZQgQgErXjUByKZ7hAR/J/4BdgrH3UQjno9iPEX
         0tKLXx2ZofAP71bCs/088zxk1FJ0osWE/ChDn4IUzBgmdYrFPXZTiX6Tq6AFH3LRZD5M
         4Fkj6Ib2oSLqVHZT4d+hJDfo2CAQc2haT8unGa7qIJCktmLpPXQJVh6YvFRkHsaAtCbk
         N4kwnq4jAzuoFpstp4yY6wYPvqwUM76UMndfbMddeqzudAo1FXei9GZCBKPeZV0WtGNk
         GmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757518292; x=1758123092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kB/ZzoS93GS1qbaxrpjY6gLcgDq2wa5Z+qCvub59zO4=;
        b=wR/0KQa628d/Rlp1vHVjZ+3hc20Q4nyNOBW/jZd4GSVKlavUrVL+rZv50Of6UiPTZq
         4winR1Sti9azdiehbzvEQ3YPO1KR5eTtHoYmqbk2Hyzd3ZXExgrAfiS02l3kN7MiqZ1e
         IuLFfZPcXvs473jd7MyRg700fifivl921HNgXDANAUY97GLz4JViETV8IOftw9iVqzc0
         7AZbIDnud5FBV0ShntMNU0QFZ4qumx+vi2YsCtggLoeIEPi9EzGupEoq4C1Dt1wwKQ5Z
         l0wVK/54y3uf+6dEPxRKqnQxn4IytSU+U77rO8v7EdbXf06xzZrzka+JHU8N4JcQsCVx
         gl3w==
X-Forwarded-Encrypted: i=1; AJvYcCXeegAn+v3OBeCChYyhN/87sTCivqMHZfwWnXPTTsef/TPQPVmjo4WRdJhegySQMd0HUGX5J5AQ02g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtuWzHGoPKU7Rxfft89yNO92FiRODHVWMB7tFwbcDJ9UghWzLb
	nZVeZg44QvHs1kQUqdZWlo/4CY0g5Cviu7ln32bZjRMuVYKMViHSj36gFRFAubN6WQ==
X-Gm-Gg: ASbGncs14/5VMD4W/nMuKCFmj7XR180w1itQAzkOE8tfewhlUUx48HTl5EDCiVNBrWN
	CdjVOB+V8n5nsW068OIY9OUrAa6x50nyAvj3MQjo5FtkP2ItWW2mb4SMHD9JXm8y4DLP1kDRu3u
	kpYSx/JFLjfRt1g2xn9msnGfPGRZYILyxkOdOohCEKQWQzOoIn1uv4+gFFLmjmxQpYrBvkkQsqI
	z6ZGwQUAuo2spCc41kMR2AqJOTJIvyXrnPJwc65jEr/ooq23FhEBY+rosTPAPYBrPXaJx8qS5Fn
	cJVVIN+XWVvu/czKc7Bd9ZDF05MOz9dkS/t2qevhiOQzqh+3a4oICGu33x+0Q1srezZLQrsF7rL
	h9oTXXLgCkMHCKnKtR9GjxDE4xYAMsDyv6iiiQOJFPyYk/vphJyJYZvu5gl2xOLfSlV55mGMDN6
	wWx7ymb2g=
X-Google-Smtp-Source: AGHT+IHleCDQL4+GPqsaYOFlop7ds0l8gQkKYiMNKwKZ2xROGiSLuQCl+hrKFkf/m1oR2UDciRTPhg==
X-Received: by 2002:a17:907:6090:b0:b04:1457:99 with SMTP id a640c23a62f3a-b04b1451f8amr1546138766b.14.1757518292204;
        Wed, 10 Sep 2025 08:31:32 -0700 (PDT)
Message-ID: <d753bbad-eb2d-4902-bdf5-ad77542ac28f@suse.com>
Date: Wed, 10 Sep 2025 17:31:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libacpi: Remove CPU hotplug and GPE handling from PVH
 DSDTs
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250910144921.29048-1-alejandro.garciavallejo@amd.com>
 <2c559b3a-9991-4aab-ad65-645ac0cca5ab@suse.com>
 <DCP7XE3F1J8P.3HEG1CKHZW39U@amd.com>
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
In-Reply-To: <DCP7XE3F1J8P.3HEG1CKHZW39U@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 17:16, Alejandro Vallejo wrote:
> On Wed Sep 10, 2025 at 5:02 PM CEST, Jan Beulich wrote:
>> On 10.09.2025 16:49, Alejandro Vallejo wrote:
>>> CPU hotplug relies on the guest having access to the legacy online CPU
>>> bitmap that QEMU provides at PIO 0xAF00. But PVH guests have no DM, so
>>> this causes the MADT to get corrupted due to spurious modifications of
>>> the "online" flag in MADT entries and the table checksum during the
>>> initial acpica passes.
>>
>> I don't understand this MADT corruption aspect, which - aiui - is why
>> there's a Fixes: tag here. The code change itself looks plausible.
> 
> When there's no DM to provide a real and honest online CPU bitmap on PIO 0xAF00
> then we get all 1s (because there's no IOREQ server). Which confuses the GPE
> handler.
> 
> Somehow, the GPE handler is being triggered. Whether this is due to a real SCI
> or just it being spuriously executed as part of the initial acpica pass, I don't
> know.
> 
> Both statements combined means the checksum and online flags in the MADT get
> changed after initial parsing making it appear as-if all 128 CPUs were plugged.

I can follow this part (the online flags one, that is).

> This patch makes the checksums be correct after acpica init.

I'm still in trouble with this one. If MADT is modified in the process, there's
only one of two possible options:
1) It's expected for the checksum to no longer be correct.
2) The checksum is being fixed up in the process.
That's independent of being HVM or PVH and independent of guest boot or later.
(Of course there's a sub-variant of 2, where the adjusting of the checksum
would be broken, but that wouldn't be covered by your change.)

Jan

