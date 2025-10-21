Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73686BF7238
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 16:44:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147363.1479683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBDaY-0003RW-AL; Tue, 21 Oct 2025 14:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147363.1479683; Tue, 21 Oct 2025 14:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBDaY-0003OQ-6M; Tue, 21 Oct 2025 14:43:50 +0000
Received: by outflank-mailman (input) for mailman id 1147363;
 Tue, 21 Oct 2025 14:43:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBDaV-0003OK-Rd
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 14:43:47 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5700220d-ae8c-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 16:43:42 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47114a40161so14201715e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 07:43:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711c487dfesm281106825e9.17.2025.10.21.07.43.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 07:43:41 -0700 (PDT)
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
X-Inumbo-ID: 5700220d-ae8c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761057822; x=1761662622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NCiRVNIwSQKY4xt0nueDodWSjVCFFmNSTZCQgicPUZQ=;
        b=XaI886lWvQiZ7qF7b/1dHSoAZ6wyc91FaWp/sYC3YVb2WalWMKAmZfjegDrUP38Ckd
         4Mg8KNkoTTSczPifBEU/NtW4yBaejukd/piw0UZejzKwE2ek8cjxwQwEfSIePlpsRoBt
         BWNpQCAD2CQR94buWEhQLH6ZbHdf5TBIBHbED6wu4DuHdeFaSueg0Ua/p07PQ1X/Rh2w
         llLcUSF2aDPaFc4nyQAwtk+VFJKKF0LULF4N9tX4clRtxCWSaBfReBhy7tVem6FmOA+x
         LCwpxd3S/qHcbQjGdbmZpcyXv1yovzfHE3lrKru2r0bXI3wTuuyInQg8sLGwMJ8KArZZ
         u9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761057822; x=1761662622;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCiRVNIwSQKY4xt0nueDodWSjVCFFmNSTZCQgicPUZQ=;
        b=K9gFY+yE7ozjnw9019VkEIPIHXQhh9qT2xno7xSoWRTQpeajkQJ/Gu/385QFmkyJ6G
         /a5lmvF89xy9D1izPW9naJ5Stku5JmFG802/Ey6+4zKECvWKCBRW4gD1hRFzgBasQqYP
         P6OEzxhQVtPN1+a443pqtvHmRre1umZuw/BNmZbphXmwyahLsXwGoZMduyAGhv2tZknB
         5ymO5KCP/p7D4VosenRJ+zQLJbEp247FAaBySlk5tll+v2JYuukPdalarFjIweVXjcFT
         U5cOeErxqYkFziVcbEuyFd3pMB/iEsdtArXIJK5lJxCN5iZP8q8sF8gYBcCYytCNlcpm
         yMOg==
X-Gm-Message-State: AOJu0YwSPBbn6ASUykA+vRlY7anFLixIZNni/+JLbOSRhzz3xI0o25OF
	h0rSHTPlvl+ESMuwB7cdAf2xeAHpQCqzcxVNz6TWP+BbamujNyQGyef6p/0vSlMN9Q==
X-Gm-Gg: ASbGncu6ZkqeJWnjCMIi7BskQsjmbgN5i9LzuDK+/71CbHJaP1tiIWYL4/1+I/3z+Vm
	JYZsAB0YN4+4KS56UZvc6UUgNPGlIYBZiYDDRXyla9r/s6ZmhETTrE3wrRYO1kpOuZqVopCbaRp
	0VLxCg+T15vl2sTlHk8BDs6qhmMQqbAsBz+ES+cVpCVvHn1IYZcf4x5crlM8vAl0h7jKglmZbdz
	3cFJs7hJuMHInqEhj/pVokOlZZSQ5w22ecnGMbPP0eFJJMpBcbtMnoIML4jna2Bg3trEcBLYGnM
	12PGssA1+H3S2CVbsQlg1Fqe2U6kOq1ByKW+qZIlNkM0n32ZaUggVOOkxX/xGP/1oaXfRt58Kn5
	iL2cN+92teTiWTNkyolZLRTfwHlPVUZ4KGOkQcenZeiQIz2EuYjx9gOHq8RltOdjs2sCOzTz+fY
	+HcSo4djeul6SYQnbwEAh+VlFZSQDBD+4g3WKdaW4dSvO1dTsBWEhTbMcsp6ndJbgdgN/j8YM=
X-Google-Smtp-Source: AGHT+IGnA36etHLkNOjfRYhU58FFNFx0d+Bm7xAyUKWUB6sg+Nk3aBuc/h4kn32ov/AL+gj2R6+q4Q==
X-Received: by 2002:a05:600c:354a:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-47117903f24mr115967415e9.20.1761057822227;
        Tue, 21 Oct 2025 07:43:42 -0700 (PDT)
Message-ID: <e63e2953-27aa-43d7-93d5-6042fd12f8ac@suse.com>
Date: Tue, 21 Oct 2025 16:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 3/9] x86/HPET: replace
 handle_hpet_broadcast()'s on-stack cpumask_t
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <c357cb79-a10d-4d81-9695-9d16a4080595@suse.com> <aPeT0h-S7FVgk3TZ@Mac.lan>
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
In-Reply-To: <aPeT0h-S7FVgk3TZ@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.10.2025 16:08, Roger Pau Monné wrote:
> On Mon, Oct 20, 2025 at 01:19:20PM +0200, Jan Beulich wrote:
>> With large NR_CPUS on-stack cpumask_t variables are problematic. Now that
>> the IRQ handler can't be invoked in a nested manner anymore, we can
>> instead use a per-CPU variable. While we can't use scratch_cpumask in code
>> invoked from IRQ handlers, simply amend that one with a HPET-special form.
>> (Note that only one of the two IRQ handling functions can come into play
>> at any one time.)
>>
>> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/include/asm/smp.h
>> +++ b/xen/arch/x86/include/asm/smp.h
>> @@ -22,6 +22,7 @@
>>  DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
>>  DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>>  DECLARE_PER_CPU(cpumask_var_t, scratch_cpumask);
>> +DECLARE_PER_CPU(cpumask_var_t, hpet_scratch_cpumask);
> 
> Should this be declared in the hpet.h header?

Imo not without also ...

>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -55,6 +55,9 @@ DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t
>>  DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, scratch_cpumask);
>>  static cpumask_t scratch_cpu0mask;
>>  
>> +DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, hpet_scratch_cpumask);
>> +static cpumask_t hpet_scratch_cpu0mask;
> 
> And then this defined in hpet.c.

... moving this. Which in turn I specifically avoided putting in hpet.c,
as otherwise the change would further grow, as would the risk of things
going out of sync.

Jan

