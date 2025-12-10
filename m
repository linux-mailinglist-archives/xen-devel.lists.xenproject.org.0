Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E16CB2B93
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 11:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182827.1505666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTHaW-0001nb-Nh; Wed, 10 Dec 2025 10:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182827.1505666; Wed, 10 Dec 2025 10:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTHaW-0001kI-K6; Wed, 10 Dec 2025 10:38:28 +0000
Received: by outflank-mailman (input) for mailman id 1182827;
 Wed, 10 Dec 2025 10:38:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTHaU-00016V-KY
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 10:38:26 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b00d041-d5b4-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 11:38:24 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso57381705e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 02:38:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a82d26f5asm36161215e9.5.2025.12.10.02.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 02:38:23 -0800 (PST)
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
X-Inumbo-ID: 5b00d041-d5b4-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765363104; x=1765967904; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kv8yAEtoYBUj3LXIG+vIYtihmgvVLpaCTCmQXUt1YgQ=;
        b=fAut1ZYiTU82VimMOG5HtsBZsP96Bj62k0hCkQ5mqFD1B9yStZy6RZBChrTLGFUFlQ
         IuqTsV0wipD5J7/QmLjeALXKK2hQAZFNY2p4P4j9zz3WHiXvMHNGjtmR97LHsAX5OpOB
         h2+lak7khwVGEZcTIrKbzhCsEsRfu8Ob+j/BASKEU1qI3GmHxNOtJYfiMWP6hYu0cmLh
         z9sH/aNw+dU2nTrlinOY7v3MrqZD5bPqWMQ9Ud192TFafB0/+Rdpy6NuknhjOVtpozX2
         8OQD/Nbf9JXrLMqBta6OiOhrNZZLxlwDE03ZsB+DgpkcREx06VNOiRhCvAegOYqLXvUR
         nj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765363104; x=1765967904;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kv8yAEtoYBUj3LXIG+vIYtihmgvVLpaCTCmQXUt1YgQ=;
        b=pUGeSWV7+aNfUHwELq2jFJlvaLv6ctPCeOK4VG99q/Ybu0aqdSgIjvWo01cgctBPoQ
         +xwQi30LTyWnAOKltF8eJuBeWw3SPfEq//jPXtMuHKNwZg91grDz8kU2Ms5MPodzoMxx
         8ox539MFs/FZBjL0W5UKghOrIZftNjN35RElwQyTqo2E6QBZXEJeYZ0JgAXH3uFNx/9N
         u1q4aWqx2qfVAPBftAamGiIV/RHnfH2v6698amoKZqTiVynntyICYnox6234IObBy3li
         FpdRReKAUleXz1Zy3SACQ/XSev8oGWkykPouXCo4iZVWSWORWfr1Qy4YgOvaNlYl8cnn
         Yspw==
X-Forwarded-Encrypted: i=1; AJvYcCXhClx2tP9WPlzk0wPQSGTlxifQ71WIo9WUIgvbHv9VTBvXY8TOgDqqQYYDrMfXKdDEC2J7MLevJZ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbiXJ0ED9JNXz8syZ8kaYUYly2FPgBi5Kc6u6TeJ8QbtyEA6in
	5SZHn1X1/XyfFnjru86pDutL4Trj+fdYeyOlIsVDRpoQUT6fnnzFSxtxbZ80E/alew==
X-Gm-Gg: ASbGncuqfOim7Bm0txnILcyMZ02CB+MCuwtzdjduPUJW14+fTonaCEcCL4yuoD+/DDg
	8rAMTSUGR7/Ha/qFVN9fzTNFNj/KwkYc44C/vAW2Rgocp4Ptg0jmoyCMggrueC4Sv251MJRvWV6
	vGGj7G/+Trhm1K0rXAiV9NHcN/DBWrZQKuHw34+2x/jXom71gbWpQjOaFCuBTUX3IIDzoxjwi0k
	IFPIqD0RdqbnP7tsYNFWj5kHMyGAyGlXW2yR4PHzx8ApuLormfd91Hs9E5xq6995TApRV1Ptu2g
	Z4rViu5Nm0CoXibZx44MeLuguFy07afuLZ7LYGt9PRWkkk2hCAsaO+HcLGmNsd87CjnzJ1smc9K
	byxzCVQzb+PFg/dh0rNnV/38iyw3F4UegRpQAnY22GyiyBC1dlB0vGK4kUM7Dr90ctR4pG2au4Y
	xfSdsqOVr58GaK3VVIacVpnzW3WHQnCCiyZclVRVjQZ0hDi8NrqefFtI4LfaXYctJWAygb8rO3K
	KI=
X-Google-Smtp-Source: AGHT+IFUWPZNgwbCMhZeOPlDpfr3ctXfS/t0KL2tAlklL2Tv46khb6/eV5DjbZnxhGs6Hz3A2j2HNA==
X-Received: by 2002:a05:600c:8a1b:20b0:479:3a86:dc1f with SMTP id 5b1f17b1804b1-47a84b6f64amr8212805e9.37.1765363104097;
        Wed, 10 Dec 2025 02:38:24 -0800 (PST)
Message-ID: <fa89f081-eecc-4c43-9e70-ff632bf1e412@suse.com>
Date: Wed, 10 Dec 2025 11:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pod: fix decrease_reservation() clearing of M2P
 entries
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251210093513.59534-1-roger.pau@citrix.com>
 <d6830fb8-ea86-45c5-95dd-d76a1d39b162@suse.com> <aTlHMSN1R1uRh0iz@Mac.lan>
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
In-Reply-To: <aTlHMSN1R1uRh0iz@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 11:10, Roger Pau Monné wrote:
> On Wed, Dec 10, 2025 at 11:07:00AM +0100, Jan Beulich wrote:
>> On 10.12.2025 10:35, Roger Pau Monne wrote:
>>> Add the missing index increase in the M2P clearing loop, otherwise the loop
>>> keeps pointlessly setting the same MFN entry repeatedly.  This seems to be
>>> an oversight from the change that introduced support to process high order
>>> pages in one go.
>>
>> Ouch.
>>
>>> Fixes: 3c352011c0d3 ("x86/PoD: shorten certain operations on higher order ranges")
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> I'd like to note that things were broken in the same way before that commit,
>> too, simply because the order wasn't taken into account all. (This is not a
>> request to change the Fixes: tag, though. It's just an observation.)
> 
> Are you sure?  Previous to that commit the order is not taken into
> account, and each 4K page is processed independently: the `i` index is
> strictly increased with +1 for each loop.

Indeed. No idea what I was thinking I was seeing.

Jan

