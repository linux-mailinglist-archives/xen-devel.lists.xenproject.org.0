Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5F0CAFAFA
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 11:52:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181456.1504503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSvKB-0007fn-6z; Tue, 09 Dec 2025 10:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181456.1504503; Tue, 09 Dec 2025 10:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSvKB-0007d7-3z; Tue, 09 Dec 2025 10:52:07 +0000
Received: by outflank-mailman (input) for mailman id 1181456;
 Tue, 09 Dec 2025 10:52:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSvK9-0007d1-UT
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 10:52:05 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18870054-d4ed-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 11:52:03 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so39618885e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 02:52:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d353c9esm29914820f8f.40.2025.12.09.02.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 02:52:02 -0800 (PST)
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
X-Inumbo-ID: 18870054-d4ed-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765277523; x=1765882323; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k6HbfaLHKGHnedjKvYHaklBUTkpTR/lW9/O/uTXtBrI=;
        b=FGXGfGJJiL3CxoNW6xwvfY/fVHR8/gkV2LGldgCrZZ9owte0Yd5QK/pK0z7ZLdhBHI
         iwpDcbe8jwsVEp9d92aYRro3i/UyqSdBbSuKVrVABZnvcLDVa8LQeuC/xrwUwWNvLcXT
         KgHS9rQPIem+0rqDuQnBbgvbMLyYkfJof2sgggTqRp7INUnx4zfaxGTi4zbMYC2kZy9A
         /IlR4rQcZmBeKh55KzlDMvNCdQdQbhS3ysZF0x0AVs9ub9toFANhHKxbe1P6nDAL0E8u
         SthVH/pm8S952JY3HRU+af0uiWkdPI7rZYLimq2DMvfaVkQ8nhBoQNXr0A+oENOLVUlc
         4OPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765277523; x=1765882323;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6HbfaLHKGHnedjKvYHaklBUTkpTR/lW9/O/uTXtBrI=;
        b=CLiFYKpudUJBf2ARkc5Enowb5oXMQkPI1OH5UHKgWnXQbXT6yzfEc2lPosRQWjL6mp
         Eto2z39mqJAoYE/N0QEGacTIEHzQLEgTF5FGcS2YAihSXejBhwkkE1TZyvcsz0am6jDP
         +zagMF5R/1UaFfOXeR7FZMFtPetscEpOWrDu5LbO4ZufKJYsLN3ve0P40dWu45GCSJhC
         a3HslwOMjwuXN4rc2H5VRUoFcp/VNGXMkU7VP/bvido/EOwwb0F3griS6o3D+aj1rn84
         lDegiRlNZcI5vRItfPEPPWu/CjAGwdDY+7KPxl0gGEHL3loaDsL/0rOZraWP3aV6nVd1
         HbRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSv8NFCVvyjrYzK64xLgRtoqp89lpzAj85HanMHlMap+f0EDvbpFfjjH3Y5/atpPMVVLuPVvTTRy8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0Xl83JO3YnPZ1eXyYlCBC/kW78jEdjmW3VTE4EETMKhVj0qCX
	BsgVZ0imHzxN6FlboS4C8j3KF0Sb611Wy2mVcbLrMRW8J8+B7jR9JFicAjDiMmbZTw==
X-Gm-Gg: ASbGncunsoAwMEbsLbvk7PMl/SP7AtQjVv/k1mr2cTgpjB2Cjd6A5UeINf2MqmIp64e
	NcUgz6PJKRFHaoAwkaZ2ispCoXeKDcGwbR6/gCh3xe9iRtgGDhHy7NEt2/VKj3HKxNK/8LeG7k6
	o+Nz7StrXOBRNikndADrq19xkDz8Hd/jms7Hb4DEfJ4nH4f9dg+C6WYnUvngdQI/nvqATr5wIJL
	wTI9fUwhaKviDg97kc+rEwMcFEN0WSoN3xa62PUMpQPqZCFHfUWvU2A7uu7OeXjVG9AZ7Jk1TL6
	PxrvodXiqZX4vDMV+bxgPYhjjAvYgIWNBv8DGmsGTZY+WA1RsmxqYc1YqW4l6GeaTqmvPKwVTvb
	2cNUiG0UJgfxRSTyAZtAWcH0RgZyV08ysxJQMOrPzjUDUfmEA88zEJnTEzIcrlGE/sTuBojJRpl
	sW/cfty5tXeZwcE8OAg5DO3QnZf7cKE1xn0AkzwIgRQPfLXQBMdw00iX9oFCV4sevjewwvvbqNr
	ds=
X-Google-Smtp-Source: AGHT+IH6PtTbEnSb0kD3hGUF/UkAGqohpIjFl6+nWGXp9Je+5GIahpAOG7vRrvbdQeSetquFOIjrvw==
X-Received: by 2002:a05:600c:4585:b0:471:665:e688 with SMTP id 5b1f17b1804b1-47a7fa60ccdmr10530955e9.17.1765277522839;
        Tue, 09 Dec 2025 02:52:02 -0800 (PST)
Message-ID: <670acff3-9c98-43ed-a827-97d97d928d6b@suse.com>
Date: Tue, 9 Dec 2025 11:52:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/19] xen/riscv: introduce VMID allocation and
 manegement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <7805662d530eca29c5b0d0afa05a3cd0aac963bb.1763986955.git.oleksii.kurochko@gmail.com>
 <dc12d791-c76e-499c-9731-0163c95203da@suse.com>
 <369f14b0-8ed9-43ef-b5eb-7f5df9e2c642@gmail.com>
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
In-Reply-To: <369f14b0-8ed9-43ef-b5eb-7f5df9e2c642@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.12.2025 11:35, Oleksii Kurochko wrote:
> On 12/8/25 5:31 PM, Jan Beulich wrote:
>> On 24.11.2025 13:33, Oleksii Kurochko wrote:
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -3096,3 +3096,12 @@ the hypervisor was compiled with `CONFIG_XSM` enabled.
>>>   * `silo`: this will deny any unmediated communication channels between
>>>     unprivileged VMs.  To choose this, the separated option in kconfig must also
>>>     be enabled.
>>> +
>>> +### vmid (RISC-V)
>>> +> `= <boolean>`
>>> +
>>> +> Default: `true`
>>> +
>>> +Permit Xen to use Virtual Machine Identifiers. This is an optimisation which
>>> +tags the TLB entries with an ID per vcpu. This allows for guest TLB flushes
>>> +to be performed without the overhead of a complete TLB flush.
>> Please obey to the alphabetic sorting within this file.
> 
> Do we have a definition of alphabetical order? In xen-command-line.pandoc there is
> `### vm-notify-window (Intel)`, and I would expect `### vmid` to appear before it.
> Am I right? So the ordering should be: letters first, then numbers, then special
> characters?
This particular detail of sorting isn't well-defined, I don't think. If in doubt,
I'd use C locale sorting rules.

Jan

