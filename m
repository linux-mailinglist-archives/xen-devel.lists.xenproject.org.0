Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6386AA2EAB2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 12:09:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884751.1294496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRfN-0006Qd-AU; Mon, 10 Feb 2025 11:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884751.1294496; Mon, 10 Feb 2025 11:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRfN-0006OW-7U; Mon, 10 Feb 2025 11:09:29 +0000
Received: by outflank-mailman (input) for mailman id 884751;
 Mon, 10 Feb 2025 11:09:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thRfL-0006O4-OD
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 11:09:27 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7de542a4-e79f-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 12:09:27 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ab795ebaa02so453182466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 03:09:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab786ece062sm722806566b.123.2025.02.10.03.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 03:09:26 -0800 (PST)
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
X-Inumbo-ID: 7de542a4-e79f-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739185766; x=1739790566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w8BdkLMLctaOCYXiCqu/UwCIuhH7Oos7NVqS4COtsnA=;
        b=FiF3CGLL5NRcXz+b+AjzYReVYJWu5qh3F8WHO8mKq7s0K2xyG10EEfndz/2APBb7Oa
         QWPNh70UFh9J8NOm8vTyuYrIi/g9D+7a9+J8C7xW9bTtLQ6dQWUWNbxpN1FynEOVXNqT
         DvvukjYL11xMyiThGsk9qSMZnzQC/atGC7MBtR3q4B/qZE5QAmU7QNz5AYof8AS+PEes
         dcWFq9NV4mnJ6ONvDKYefe2eH9TSGOuU3lwVwdsKoL7eFGfR8ztU4soTD7pFXqBfhc0q
         hKr3R+W6Op37QpWyi4/Jz4m5XTp70lxm9qolbBa9ErNyUUbV2O47LzVztAVp5/x6SiBq
         5ULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739185766; x=1739790566;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8BdkLMLctaOCYXiCqu/UwCIuhH7Oos7NVqS4COtsnA=;
        b=E8xn3kUAyxefb2rZWqT93OUY4Ju8f6fkIE+G8qCMocPrvmo49DKEnUu7TN+IX5YrLr
         zXvZjZZqGzTlTgLoJWgbS9B8968um7/EQLT8MkVOgMqlEggXtFhjuK1ZmBgXswFFSKlf
         of2tb7QDkP0K5UvFsKDwFv3u/A+XW7n6Ynu66r2a8tlXSlS6TkMD62aXaxqmv3FkePj+
         C/3z24wyah0Vfs6/BJAtFK1jrti3yoytLLZdFDAmiHVhbSQuT1gfjS8QPtKwLJkhlwdh
         x8C5+nOrbk9kjsYNsze/MhOGdgiIn4phHEu0LIuJgYBx5Ugw1ZV0N0I0oLiHoATB4Io7
         /JXg==
X-Forwarded-Encrypted: i=1; AJvYcCULqdsqG4fcj5yTfoJEI2OCoKh0SvZI/LhdZdr2tjo3NXUZHpGxIXZJ+OC50Gn/noP5a9b/5NE6gCY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYrqiehPmzT0HUbDa9C+3IRJ2/kyCsM9h1ibD1B2DNG2VTIea8
	IMjjOR7AJ1RFVNYvYwHcWkurI6lwzYc5wPkFoE3N3zHY/hqTxuqbfnfkJcipyA==
X-Gm-Gg: ASbGncuZWDOjnfHfg9q/mNYSwg5ViurzOBrARwZggINO620mqu9LU9lhahNg+UJBle5
	LQ9Y0U3gl1EkAExFmhJ17hETIHKa0FjhRDweDQEVHGOIVkbsKvf0XfNNqJ1su5OJgvhV6Zk7qXl
	d5rHYp1Bny82Jm3a1gGCqtyigUT/+dLKvTrUE677FRqsICBgAWRlRcy2IqTiGO0VKWBuBGHUeuL
	3PyPrB6plv2xCb320NmzM7GVZCwDTzzsP/Ly9SU0cz2uh0RV+Gg+xy2f0xcv+F5MNhyBDVbLDzC
	Kv81CeXVpC6+pFANwiCx6xNlLABAycOUPvwisVDiKUz0zeqgm8wacAG0zaWOV4y1jTgklCkGHrP
	+
X-Google-Smtp-Source: AGHT+IF4XJW9zp4lCfAE5+DE9NCmT0qP+AnO8VsOoTBIIB02l8spu0ZKpgC/Ns0CIIiYjKMWXTCaNg==
X-Received: by 2002:a17:907:7e9f:b0:aa6:9503:aa73 with SMTP id a640c23a62f3a-ab789c756demr1372456566b.51.1739185766550;
        Mon, 10 Feb 2025 03:09:26 -0800 (PST)
Message-ID: <c7e4c760-2a78-4f3e-bbb6-6de8ddb4f491@suse.com>
Date: Mon, 10 Feb 2025 12:09:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/shutdown: offline APs with interrupts disabled
 on all CPUs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250206150615.52052-1-roger.pau@citrix.com>
 <20250206150615.52052-2-roger.pau@citrix.com>
 <2fa4f84e-3773-4bab-9be1-ef068a1cce36@suse.com>
 <Z6nY6WqTstPpEKa9@macbook.local>
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
In-Reply-To: <Z6nY6WqTstPpEKa9@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.02.2025 11:46, Roger Pau Monné wrote:
> On Mon, Feb 10, 2025 at 11:20:20AM +0100, Jan Beulich wrote:
>> On 06.02.2025 16:06, Roger Pau Monne wrote:
>>> The current shutdown logic in smp_send_stop() will disable the APs while
>>> having interrupts enabled on the BSP or possibly other APs. On AMD systems
>>> this can lead to local APIC errors:
>>>
>>> APIC error on CPU0: 00(08), Receive accept error
>>>
>>> Such error message can be printed in a loop, thus blocking the system from
>>> rebooting.  I assume this loop is created by the error being triggered by
>>> the console interrupt, which is further stirred by the ESR handler
>>> printing to the console.
>>>
>>> Intel SDM states:
>>>
>>> "Receive Accept Error.
>>>
>>> Set when the local APIC detects that the message it received was not
>>> accepted by any APIC on the APIC bus, including itself. Used only on P6
>>> family and Pentium processors."
>>>
>>> So the error shouldn't trigger on any Intel CPU supported by Xen.
>>>
>>> However AMD doesn't make such claims, and indeed the error is broadcasted
>>> to all local APICs when an interrupt targets a CPU that's already offline.
>>>
>>> To prevent the error from stalling the shutdown process perform the
>>> disabling of APs and the BSP local APIC with interrupts disabled on all
>>> CPUs in the system, so that by the time interrupts are unmasked on the BSP
>>> the local APIC is already disabled.  This can still lead to a spurious:
>>>
>>> APIC error on CPU0: 00(00)
>>>
>>> As a result of an LVT Error getting injected while interrupts are masked on
>>> the CPU, and the vector only handled after the local APIC is already
>>> disabled.
>>
>> Isn't this bogus, too? As in: Error interrupt without any ESR bits set? Since
>> I can already see our QA folks report this as another issue, can we perhaps
>> somehow amend the log message in that case, indicating we think it's bogus?
> 
> Note that the disable_local_APIC() call in __stop_this_cpu() does also
> call clear_local_APIC(), which will attempt to clear ESR also.

Hmm, that's odd. I wonder whether we shouldn't suppress this when called
from disable_local_APIC().

> Further patches in the series prevent the error from triggering in the
> first place, since an attempt is made to disable or mask all possible
> external interrupt sources Xen knows about before doing AP shutdown.

Right.

Jan

