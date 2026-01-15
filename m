Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F94D22FA8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 09:00:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204236.1518962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgIH8-0005BP-A1; Thu, 15 Jan 2026 08:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204236.1518962; Thu, 15 Jan 2026 08:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgIH8-00059z-5c; Thu, 15 Jan 2026 08:00:14 +0000
Received: by outflank-mailman (input) for mailman id 1204236;
 Thu, 15 Jan 2026 08:00:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgIH6-00059s-BB
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 08:00:12 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36a8f0f2-f1e8-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 09:00:10 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43277900fb4so735553f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 00:00:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af6b296asm4202111f8f.24.2026.01.15.00.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 00:00:08 -0800 (PST)
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
X-Inumbo-ID: 36a8f0f2-f1e8-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768464009; x=1769068809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TiR68iTUJJECnVuKxLPU5y1gLJwzsBQYkPUS2tRwLPo=;
        b=RWrVLUB1qHS9S/HW+QmPKbz84sfIDyKSw9kxIHJ8Y33MGelpt1jW0yY698wiNrLs6+
         +goU5M9Z5YuHvl7aZ0JSxSZX7Y2qx7weLpF9FVb2WB/CTI1rbKw6dAORZ2IaulkOR7gB
         w369YPEpsxjq8Wy29v3sZtGveUQcuzy7N6U7oJTGBFTsgY/yCv6pDTD9uceD6MPgIxU2
         /0mjkmP8vTS/PJo2im8/3ydOUChB9RgUOy5MitfyBn0vJjozA/W5v0Ozh3+IfXD4xr/m
         I8pkifQgjHRuURbxDuRpc+NmLXOVBXKF7YIrSzXRZGhpPkMeB2p9cpS7RtacJkXFj+ic
         iX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768464009; x=1769068809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiR68iTUJJECnVuKxLPU5y1gLJwzsBQYkPUS2tRwLPo=;
        b=qpLaW32GHsknaC01gKdWoGngLcn84vBDh51GZyuF7ItpwAMHxVd1u5p4O8TQOecByE
         5mzvoJvGUXJ8u6JNDB/Q89+e50Ok86SXptEK2r+SER2wnkbIVHzXeufROwiGfnB8rEQA
         X6jSiKB2KAm1xx+7H80ABp/t6eFzw5qUILVHHPBrVS4AuTAnLDGJADiUa0X5jq7DjD/A
         6Xw4LuHvzicxtXtkMJWaI/2SSRmjUMqMXBBqaVqkPW5/JjVOBUaMiJ/WNLR1tu/JDdb+
         AiLD3jW8OQn+VCJdEpjhJq59HSxP/pMPuzrzPNXL1MFuTXtNKzpE8l9Itr1xwOMhgnQv
         anEg==
X-Gm-Message-State: AOJu0YwwSL+773ET0G+s7keSw/+tuDnHPKk1h5af/u4+BBET2wjcl3aB
	hd+q9uzh3I5Vc/ACTWLxF5sVJIHcA4noPpFArQV/kwIyUrzXX7dfRGQ3RbV05KdMaA==
X-Gm-Gg: AY/fxX7NCexnuiFxXjPjJaE2nt+B5a9XM3Bw7t8QamfyT3SjRUzsEXMoDgA/lgbrMpT
	YJT7kNBRc/EMFIhLMNoN7h2GaSTxe46JedoA+cdFajlbL48jSuEvQqlIy435nUfTXHMRyj8GxbR
	IHBS0omVPuG14O6B86xiZYkipcqrojxeed542cqpWCKmyBajhwZn3bTdLQbGQo1ln+gxO+RI6lD
	fAZGPB4d1oJIiPIHc0UtN4LPMB3e5GfTyWHiR9THihokOmQrJ9yDm0CehgeALmeAnu6uTdRq2Jk
	JihC86P0qTtFDqbfzkCoJ2ShEBhBTW5s6DAYbDnPAsq/Vw5n+6B89OE42PzSdk6lmGvfrLPY/+z
	U3bOA6/sWjh8lIUcUeE41Tmk2YrJ7teVLJm99DXEtXntznxThF3gzG5TK6LXNXkfewMtA6l6qsA
	h8q1+B3IZ1amjzyTryUleD3c+9MMLGE9oPnol65hwY5SI/uZe5HlDnYd7FnyNblTdBXufktWQf1
	b4=
X-Received: by 2002:a05:6000:1869:b0:431:397:4c2b with SMTP id ffacd0b85a97d-434d75629d7mr2804968f8f.11.1768464009252;
        Thu, 15 Jan 2026 00:00:09 -0800 (PST)
Message-ID: <e9205e59-fb1d-429e-877d-28aa8cb950ca@suse.com>
Date: Thu, 15 Jan 2026 09:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in
 get_s_time_fixed()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?0JDQvdGC0L7QvSDQnNCw0YDQutC+0LI=?= <akmarkov45@gmail.com>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com> <aWfXJk90Sh7B-qi7@Mac.lan>
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
In-Reply-To: <aWfXJk90Sh7B-qi7@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.01.2026 18:49, Roger Pau Monné wrote:
> On Tue, Jan 06, 2026 at 02:58:11PM +0100, Jan Beulich wrote:
>> A similar issue looks to exist in read_xen_timer() and its read_cycle()
>> helper, if we're scheduled out (and beck in) between reading of the TSC
>> and calculation of the delta (involving ->tsc_timestamp). Am I
>> overlooking anything there?
> 
> If we are scheduled out in the middle, and the ->tsc_timestamp is
> updated, ->version would also be bumped, and hence the loop will be
> restarted.  I don't think there's an issue there.

Oh, indeed - I was too focused on the read_cycle() alone. That may go
wrong, but as you say the result then simply won't be used.

>> stime2tsc() guards against negative deltas by using 0 instead; I'm not
>> quite sure that's correct either.
> 
> Hm, we should likely do the same for stime2tsc() that you do for
> get_s_time_fixed().  Given the current callers I think we might be
> safe, but it's a risk.

Will do then.

>> amd_check_erratum_1474() (next to its call to tsc_ticks2ns()) has a
>> comment towards the TSC being "sane", but is that correct? Due to
>> TSC_ADJUST, rdtsc() may well return a huge value (and the TSC would then
>> wrap through 0 at some point). Shouldn't we subtract boot_tsc_stamp before
>> calling tsc_ticks2ns()?
> 
> amd_check_erratum_1474() runs after early_time_init(), which would
> have cleared any TSC_ADJUST offset AFAICT.  There's a note in the
> initcall to that regard:
> 
> /*
>  * Must be executed after early_time_init() for tsc_ticks2ns() to have been
>  * calibrated.  That prevents us doing the check in init_amd().
>  */
> presmp_initcall(amd_check_erratum_1474);

Hmm, I should have written "Due to e.g. TSC_ADJUST". Firmware may also
have played other games with MSR_TSC.

>> A similar issue looks to exist in tsc_get_info(), again when rdtsc()
>> possibly returns a huge value due to TSC_ADJUST. Once again I wonder
>> whether we shouldn't subtract boot_tsc_stamp.
> 
> I would expect tsc_get_info() to also get called exclusively after
> early_time_init()?

Same here then (obviously).

>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -1649,8 +1649,13 @@ s_time_t get_s_time_fixed(u64 at_tsc)
>>          tsc = at_tsc;
>>      else
>>          tsc = rdtsc_ordered();
>> -    delta = tsc - t->stamp.local_tsc;
>> -    return t->stamp.local_stime + scale_delta(delta, &t->tsc_scale);
>> +
>> +    if ( tsc >= t->stamp.local_tsc )
> 
> Should we hint the compiler this is the likely path?

I was wondering too, but was erring on the side of "no" primarily because
of Andrew's general preference towards no likely(). I'd be happy to add it
here.

>> +        delta = scale_delta(tsc - t->stamp.local_tsc, &t->tsc_scale);
>> +    else
>> +        delta = -scale_delta(t->stamp.local_tsc - tsc, &t->tsc_scale);
>> +
>> +    return t->stamp.local_stime + delta;
> 
> LGTM:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> However I see Anton still has concerns that this patch doesn't fully
> fix the issue he reported, and I'm afraid I don't really understand
> what's going on.  I will have to take a more detailed look at the
> thread, or possibly attempt to reproduce myself.

Largely the same here.

Jan

