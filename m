Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30808968B1A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:33:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788165.1197625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl93L-0005Y1-Ck; Mon, 02 Sep 2024 15:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788165.1197625; Mon, 02 Sep 2024 15:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl93L-0005W2-A7; Mon, 02 Sep 2024 15:33:15 +0000
Received: by outflank-mailman (input) for mailman id 788165;
 Mon, 02 Sep 2024 15:33:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl93J-0005Vw-Fd
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:33:13 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa22f74d-6940-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 17:33:12 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so471865366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:33:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989221e15sm571181866b.193.2024.09.02.08.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 08:33:11 -0700 (PDT)
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
X-Inumbo-ID: aa22f74d-6940-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725291192; x=1725895992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cfhgt8YsaLeeVyaLLq/SNIJtbbvs45laOO2UuQFv5V0=;
        b=UiVAXLLx35feA1WkE6lXN1Q13q9owZYCfabF6GOhJVThcRvL/hxyyvXCRE9P8h5HGT
         HMGwVyv0jHnjyL2Z2lN3ooH7Gh89mZ6bgqn60M0UxROJmWfnm6pDhLsW8TLkwzGREd3g
         oYqFJCWFxjdwLkrPubP77U6erEzS8YV3QqbTv9qzgd4N6WX0YxjDRcgbBoUowWfqXIT4
         /tuU5/4RI5ertRiN2cLVnR7UbJdiQ8tm5d3zt2T3oEBk/+xvCIyekqoXimlx8sEoGlMU
         kg1YbJeMJBEtvYfKFkSvqstkZz58AUFWLKXc17GWziHTCOAFwNLhDCtOFq7wwB33K8iN
         EKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725291192; x=1725895992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfhgt8YsaLeeVyaLLq/SNIJtbbvs45laOO2UuQFv5V0=;
        b=I//6AkWmgAu1LM4SIBErPNkYDtUYxKcTLdgEQyw5eaU6+BXtnra4xRmvsB/DxpTENA
         pLcY8lXXQkEVZiCkB1s9QifbWkUlg9O1pJmRIVqQpPxTl71ySgi7hozrA3ErzT/5Rr6b
         0EBpMDK6uQgNFDchOGG6XcDLixLwuVOMajt53ALQWz8qHMCJtbgrCqUYmDtHnwO0rVbU
         q3iVnbEZZOsnuMv/KHrAFziWLi7+okT6don2U8QOyse26Hhv85j0XXRULdwEc+0H//tj
         YHP54MssVzSeDegAdB5tls9M05yHSVIbMXHJ655khLOEGpMMicp7rjJcCmu71kg+Ul08
         rK6A==
X-Forwarded-Encrypted: i=1; AJvYcCXVuaNYJuc895B0aL7h13TYP+atFI+X9GZPyIVvNeyEDu2VWspHqOcvjKV0eDCv4WsCl4JBuFBtDqo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxujsgW5mZ+qzOUal8P9KLbC8zai4CsG2y/O4nT9r3I1Tq0EjHb
	mvgQhAfjiChoVrScLH1YRzX2FKzw8LIrDTbR+4CXDUiEMn3Z/8CNqvW1N0U5RoJ9sMNldFFoUiA
	=
X-Google-Smtp-Source: AGHT+IGx9f0fTqjC9VGkeaIhDMAYkF72kSmI908v+5wEJsB/+b3YG/++G647zcKAKbibiHuFBMHX+w==
X-Received: by 2002:a17:907:72c9:b0:a7a:ab8a:38f with SMTP id a640c23a62f3a-a8a1d3356bcmr38734266b.41.1725291191896;
        Mon, 02 Sep 2024 08:33:11 -0700 (PDT)
Message-ID: <0954f9d0-2440-4615-bef4-d3d95bd0e2b5@suse.com>
Date: Mon, 2 Sep 2024 17:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu: revert opt_allow_unsafe from __ro_after_init to
 __read_mostly
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240902150016.63072-1-roger.pau@citrix.com>
 <2a43b16e-8894-45a7-86d0-e78f52f18f34@suse.com>
 <ZtXaM2ceAvKGrNqy@macbook.local>
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
In-Reply-To: <ZtXaM2ceAvKGrNqy@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.09.2024 17:30, Roger Pau Monné wrote:
> On Mon, Sep 02, 2024 at 05:16:05PM +0200, Jan Beulich wrote:
>> On 02.09.2024 17:00, Roger Pau Monne wrote:
>>> Making opt_allow_unsafe read only after init requires changes to the logic in
>>> init_amd(), otherwise the following #PF happens on CPU hotplug:
>>>
>>> ----[ Xen-4.20.0-1-d  x86_64  debug=y  Tainted:     H  ]----
>>> CPU:    1
>>> RIP:    e008:[<ffff82d040291081>] arch/x86/cpu/amd.c#init_amd+0x37f/0x993
>>> [...]
>>> Xen call trace:
>>>    [<ffff82d040291081>] R arch/x86/cpu/amd.c#init_amd+0x37f/0x993
>>>    [<ffff82d040291fbe>] F identify_cpu+0x2d4/0x4db
>>>    [<ffff82d04032eeaa>] F start_secondary+0x22e/0x3cf
>>>    [<ffff82d040203327>] F __high_start+0x87/0xa0
>>>
>>> Pagetable walk from ffff82d0404011ea:
>>>  L4[0x105] = 000000006fc2e063 ffffffffffffffff
>>>  L3[0x141] = 000000006fc2b063 ffffffffffffffff
>>>  L2[0x002] = 000000807c7ca063 ffffffffffffffff
>>>  L1[0x001] = 800000006f801121 ffffffffffffffff
>>>
>>> ****************************************
>>> Panic on CPU 1:
>>> FATAL PAGE FAULT
>>> [error_code=0003]
>>> Faulting linear address: ffff82d0404011ea
>>> ****************************************
>>
>> Hmm, I specifically looked at that code, but I can see how I screwed up.
>>
>>> For the time being revert opt_allow_unsafe to be __read_mostly.
>>
>> There's exactly one write that an AP can hit. Is it really worth moving
>> back, rather than just doing
>>
>> 	if (opt_allow_unsafe <= 0 && !cpu_has_amd_erratum(c, AMD_ERRATUM_121))
>> 		opt_allow_unsafe = 1;
>> 	else if ...
>>
>> ?
> 
> I would rather move this logic so it's only the BSP that can set
> opt_allow_unsafe, and the APs check they match the configuration set
> by the BSP.  I think the resulting logic would be cleaner, but I
> didn't want to do such a change as part of this fix.

Well, okay then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

And I guess I'll put it in right away.

Jan

