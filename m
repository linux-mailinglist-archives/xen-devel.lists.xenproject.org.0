Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941F4A7DEF2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 15:24:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940111.1339987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1mS5-0003uY-Ed; Mon, 07 Apr 2025 13:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940111.1339987; Mon, 07 Apr 2025 13:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1mS5-0003sp-Bb; Mon, 07 Apr 2025 13:23:49 +0000
Received: by outflank-mailman (input) for mailman id 940111;
 Mon, 07 Apr 2025 13:23:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1mS4-0003sh-95
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 13:23:48 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 890a0267-13b3-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 15:23:46 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso3860663f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 06:23:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3009644dsm11901825f8f.6.2025.04.07.06.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 06:23:46 -0700 (PDT)
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
X-Inumbo-ID: 890a0267-13b3-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744032226; x=1744637026; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9USyALrpeP0OYfedjByv0DH4++pn62o9g8P7qYdlchU=;
        b=WANbhXCi3bBGaAsIsCrN+2ZxaJHip8PbRqvv+nyMdCVVKsPn/8mtTc71sShmvm6LU/
         2cc5KzGc/peaJBdfyh5ZT+YXjMZSUOnRJoWfpehxrY1DdGVRSB0Hpxj6mMxLF8tic4nh
         560MO7j8K4CaP0U27yHUEIP6cAa2Z/+MSSzMuHnNfpsiaoM3HOTypYu9AO9k8NHgBM+v
         NmMTrbDp7f4ubjX55snKE3BfvJYxqJlVZ60dkrc7/9BlAyiPYykuueSrd8dwE859vbVI
         NdGr8h0n3qh2lYs2e18XyizL1nOh/lSU2qPAqMLAqCviKVgmntx0MwtC7EJpiv3KNQN/
         yi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744032226; x=1744637026;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9USyALrpeP0OYfedjByv0DH4++pn62o9g8P7qYdlchU=;
        b=iNKKVzxrFQh47dUABLzZQgqMW7Qi7SadG4Epk3M/YGAP36NLsATj6gRtow3mlvMgX2
         LpZZssLKLo++LJDgKA5rvDqiujGAcxmAVdJluCS1zSTfuqBVIlN3Hqa9cyHgY6xwDBXM
         y2JHzFodOtULApXH7+McuFjtLLuJoCjaTSRNOtlUR0JhglCIecklc0dDX0mphxDuD2qf
         GVbwdRoK97ZZiJ8H8tHtwHL3gPnrSv1t2sR+gHC48Io/mbbkIMrInP9sBHp/uDjsDUmV
         /WMthXM0KhiUynhkvaLtzFdbS87VHPK1V4f3bpaUXk6gQX7fgN6X90iKPoN1JcU++bXm
         LRsA==
X-Forwarded-Encrypted: i=1; AJvYcCWQBvCt6EjyHVsGSG6OIXx+FPzfsDKfrBE5GfJdpWF5ZlXs12c42pLUzgM1gh9RzNwTAaAqDyv3h84=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTtbbzsxJE60dktO0OaqUDqtvzmhRqxB24Yoqyiq1Q6v9sxotQ
	d1Xqfysf0yAbJi2XhuL1V1ZymXblAyCCU+4mCaT4z7OPsiGpQSPV0Yx3CmeRww==
X-Gm-Gg: ASbGncuWtRxMTxuiAeMUYK/zc02/IbEe5Xm2ECy6N7hgw+QiS59l68lRfVkzmvwVk4j
	CoZLBSWUopxvAQK5apqkEYstWJROc+QvU5Bi0+rU3jCkzh6lrLt7jQPiJczeGKMdy5giUztG7sG
	hccCMHvGHPmLGCR95Mc3BOm0puCOAYiaENPkuiHspD88fNgvReOf5s21mbyW/ASbLEe0NqrJ9my
	qgAPtqDlq3d63jOF5OCf3K1ex0KDeg0Ptw819mr1YqdwRdUJ4ax9gsR9RFFk5l6pORpYWL3DaFW
	c+C4Fj6S5oTUWHfJJLrmaqfkVsDYO6GeNCLz+PIACIXsCOXD9znjBpZdiMKL/+h3dyDFS2pjb4n
	cBJwKC1x2worLcmPq8aqPl4YO2HmkJA==
X-Google-Smtp-Source: AGHT+IEniUsG8UFqru+L4SUu+0qnO6euSTiI2Rw0ZDcsY88hUgNy5uiLxHqF+9Q4kdrn0/5hUxZpxQ==
X-Received: by 2002:a5d:64a9:0:b0:391:4bcb:828f with SMTP id ffacd0b85a97d-39d0de1233emr10022140f8f.14.1744032226347;
        Mon, 07 Apr 2025 06:23:46 -0700 (PDT)
Message-ID: <75d288ba-1006-46f4-8f51-6d49c5e8449d@suse.com>
Date: Mon, 7 Apr 2025 15:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ping: [PATCH] libxc/PM: correct (not just) error handling in
 xc_get_cpufreq_para()
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com>
 <e0028d85-668a-464b-aac5-ac8a79ea9bf5@suse.com> <Z_PI2UNn2C4GKqYw@l14>
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
In-Reply-To: <Z_PI2UNn2C4GKqYw@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.04.2025 14:45, Anthony PERARD wrote:
> On Mon, Apr 07, 2025 at 01:38:24PM +0200, Jan Beulich wrote:
>> On 27.03.2025 14:32, Jan Beulich wrote:
>>> From their introduction all xc_hypercall_bounce_pre() uses, when they
>>> failed, would properly cause exit from the function including cleanup,
>>> yet without informing the caller of the failure. Purge the unlock_1
>>> label for being both pointless and mis-named.
>>>
>>> An earlier attempt to switch to the usual split between return value and
>>> errno wasn't quite complete.
>>>
>>> HWP work made the cleanup of the "available governors" array
>>> conditional, neglecting the fact that the condition used may not be the
>>> condition that was used to allocate the buffer (as the structure field
>>> is updated upon getting back EAGAIN). Throughout the function, use the
>>> local variable being introduced to address that.
>>>
>>> Fixes: 4513025a8790 ("libxc: convert sysctl interfaces over to hypercall buffers")
>>> Amends: 73367cf3b4b4 ("libxc: Fix xc_pm API calls to return negative error and stash error in errno")
>>> Fixes: 31e264c672bc ("pmstat&xenpm: Re-arrage for cpufreq union")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> May I ask for an ack or comments towards what needs changing?
> 
> Calling xc_get_cpufreq_para with:
> 
>     user_para = {
>         .cpu_num = 0,
>         .freq_num = 0,
>         .gov_num = 9,
>     };
> 
> seems broken. It's looks like the `scaling_available_governors` bounce
> buffer is going to be used without been allocated properly handled, with
> this patch.

The local variable "in_gov_num" controls its allocation and use, together with
has_num. "Use" as in passing to set_xen_guest_handle(). The only further use
of that bounce buffer is on the exit path, i.e. it being passed to
xc_hypercall_bounce_post(). The backing function xc__hypercall_bounce_post()
is dealing fine with the buffer being NULL. And that's what it would be left
at from DECLARE_NAMED_HYPERCALL_BOUNCE() if buffer allocation is skipped.

Jan

