Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7840D23F93
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 11:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204749.1519331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgKk3-0003Yp-1A; Thu, 15 Jan 2026 10:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204749.1519331; Thu, 15 Jan 2026 10:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgKk2-0003Vt-Ub; Thu, 15 Jan 2026 10:38:14 +0000
Received: by outflank-mailman (input) for mailman id 1204749;
 Thu, 15 Jan 2026 10:38:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgKk1-0003Vn-SI
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 10:38:13 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a8626a4-f1fe-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 11:38:12 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so5238945e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 02:38:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f4b26764fsm39979865e9.12.2026.01.15.02.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 02:38:11 -0800 (PST)
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
X-Inumbo-ID: 4a8626a4-f1fe-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768473492; x=1769078292; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+aCDT4mV4mNDqWKbUUKkjVLJcR2an8L/53Ch3xJ+6o4=;
        b=X0Xr8+NuW3kTsZuC6hd01EEnU6u2LR1kPa8z7Hhm8JYWF921tekCxUFTOAteny5ihg
         vD9HxYz81lkef+qxfOszMJ2N1Kc/Z54Kh8hrf0dRMefWCit0Sa/zmXHcL2vgls3T6VMk
         ZN0gk3BI/JsUEP9wjagWlh8ABGlwqC2iYnqpIxFz9Pf7A06lm7mgBDT4Vhs/yf17gGyq
         YjzqtptdPfcqLaxfhtrECvQN+PmdxEmh5oXhRqykuOGe6w5hBeH+B7BpHBQDr9NP9/eQ
         JRRchOg7oCbNJt/GgMXuLSt0ARI+IfNmkmkM7lDZCamJy2xqkxuKJ9f/UOtHIH5NOVNJ
         7dWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768473492; x=1769078292;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aCDT4mV4mNDqWKbUUKkjVLJcR2an8L/53Ch3xJ+6o4=;
        b=bFdvFdl0uYaG2sDD/q+EUvL4BDqlj/vumcnfTJkyBkQ6+fWgsI9vM/vljC5vWAB3Aq
         xDdEHEC+0GmRtWCJ2UtIcDlalqw8meOuvW/w6mfhCr8TIOxjrw/SpvxMdgaCU+3mJWA+
         AlBUZ0cTxAQBZxbqPNTCKCdyq58ACVdgZCM4CAkaw4r+oNM4D9p/BlgelFSwOcBExks7
         fLw3MEVTipeJPqEKF9iNCHGeF3qEkvmWk8zvazUIbqJn4W/XhmK7BZ9KefvxgtqpYLuY
         qYSrr+wyMLiknlpDyq5xuFhhELC8XOPZVPJI0ddWHJv8uQemJ33NV6XSBl6w5HE9WUaB
         08WQ==
X-Gm-Message-State: AOJu0Yyr7tXSSqGMwArbZF7ejap6VE72ZZw6wnNRWIXV/CzZBtu4DhbI
	NeUpaveU5NN3NtTxdnPoqZTedXsUwHGfJMtOMPjhngWi3qG2fJvvI8kesgFm3x8iVhqom2/l/rY
	tZYI=
X-Gm-Gg: AY/fxX4Kmv3MW5ZtnwFuu9b9BWpoLGh97+5Q9SnQ69KzdbVN6lV6K7dSISCakM7fV6R
	q6wB1YOKu2Xor429iOHjQARhnNXRKb/5G3T49nvbaigh+OlYp7bOSS4WCigiIaf060aWUjg2aP+
	MU6zJcHVkDA04t5ApFRdLaa4+X2joPfAIhBT6GVwGvYaq9VJJG1jJ5AuxGh1b689xxy60SS2qm1
	FJwn4MkJbQnt/aETN3EQh3Dn3MH1ZTRXxcdCKg5b9/1kdI+IC0dYbT1yA8AXfiyhnzL6FU0nfIQ
	run4N2fYradAK+IyDOJmTMgYx0lRBo/62F6LQ9GpysDrpKy87F65HoLVCtyTVT29ud+3oNNegOi
	Ry4uL7FJPJiUZCjma+HVLnu8uLA2GsfJ33qiIuFEPeCTQlPbJ7SZSXuMw3eIRhbQyjQDlcjZFc7
	GFbpvpTPxRcARTlN5V+C7CcZDXHRG/nIMaC/t4NdVQwyotGfnabJN3AQ0ogeNTIZR2PWVzqjsgB
	vc=
X-Received: by 2002:a05:600c:46d5:b0:479:3a89:121d with SMTP id 5b1f17b1804b1-47ee33b2f95mr67097845e9.36.1768473491850;
        Thu, 15 Jan 2026 02:38:11 -0800 (PST)
Message-ID: <49507100-faa9-4480-a534-e4bab6cecc5b@suse.com>
Date: Thu, 15 Jan 2026 11:38:10 +0100
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
 <e9205e59-fb1d-429e-877d-28aa8cb950ca@suse.com> <aWikMGJKa3VPQQzi@Mac.lan>
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
In-Reply-To: <aWikMGJKa3VPQQzi@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.01.2026 09:24, Roger Pau Monné wrote:
> On Thu, Jan 15, 2026 at 09:00:07AM +0100, Jan Beulich wrote:
>> On 14.01.2026 18:49, Roger Pau Monné wrote:
>>> On Tue, Jan 06, 2026 at 02:58:11PM +0100, Jan Beulich wrote:
>>>> amd_check_erratum_1474() (next to its call to tsc_ticks2ns()) has a
>>>> comment towards the TSC being "sane", but is that correct? Due to
>>>> TSC_ADJUST, rdtsc() may well return a huge value (and the TSC would then
>>>> wrap through 0 at some point). Shouldn't we subtract boot_tsc_stamp before
>>>> calling tsc_ticks2ns()?
>>>
>>> amd_check_erratum_1474() runs after early_time_init(), which would
>>> have cleared any TSC_ADJUST offset AFAICT.  There's a note in the
>>> initcall to that regard:
>>>
>>> /*
>>>  * Must be executed after early_time_init() for tsc_ticks2ns() to have been
>>>  * calibrated.  That prevents us doing the check in init_amd().
>>>  */
>>> presmp_initcall(amd_check_erratum_1474);
>>
>> Hmm, I should have written "Due to e.g. TSC_ADJUST". Firmware may also
>> have played other games with MSR_TSC.
> 
> For amd_check_erratum_1474() we don't want to subtract boot_tsc_stamp,
> otherwise when kexec'ed we won't be accounting properly for the time
> since host startup, as subtracting boot_tsc_stamp would remove any
> time consumed by a previously run OS.

For both this and ...

>>>> A similar issue looks to exist in tsc_get_info(), again when rdtsc()
>>>> possibly returns a huge value due to TSC_ADJUST. Once again I wonder
>>>> whether we shouldn't subtract boot_tsc_stamp.
>>>
>>> I would expect tsc_get_info() to also get called exclusively after
>>> early_time_init()?
>>
>> Same here then (obviously).
> 
> For tsc_get_info() I think you are worried that the TSC might
> overflow, and hence the calculation in scale_delta() would then be
> skewed.  We must have other instances of this pattern however, what
> about get_s_time_fixed(), I think it would also be affected?
> 
> Or maybe I'm not understanding the concern.  Given the proposed
> scale_delta() logic, it won't be possible to distinguish rdtsc
> overflowing from a value in the past.

... this, my main point really is that scale_delta() (as its name says),
and hence also tsc_ticks2ns(), shouldn't be used on absolute counts, but
only deltas. (Yes, an absolute count can be viewed as delta from 0, but
that's correct only if we know the TSC started counting from 0 and was
never adjusted by some bias.)

Jan

