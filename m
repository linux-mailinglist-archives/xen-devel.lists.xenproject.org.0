Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22A3D3C376
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 10:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208486.1520650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi82n-0007st-Rf; Tue, 20 Jan 2026 09:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208486.1520650; Tue, 20 Jan 2026 09:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi82n-0007rO-OR; Tue, 20 Jan 2026 09:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1208486;
 Tue, 20 Jan 2026 09:29:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vi82m-0007rI-Uz
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 09:29:00 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 728a3a81-f5e2-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 10:28:58 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so48348455e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 01:28:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4358e24cef3sm3250356f8f.0.2026.01.20.01.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 01:28:57 -0800 (PST)
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
X-Inumbo-ID: 728a3a81-f5e2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768901338; x=1769506138; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z8qtmLeEYJkg0E+FGU0YcIS6Kp7zsO5AEUqj66EA7/Y=;
        b=CIh83e62ta4p5xABIRLVLmiKEZkCiH4F5iSUxUhJZrlEtyKTCHZOMelRK+xqhw87Qi
         tjeb42PqrG8rs6lIYOqsyS9dhCJUqNcq43cNyIX5TkUcnvUhoGSMOie1SEymvcMGkouf
         2vW2jldKl0aPsT7gWZcZZZnw6L+EV7PMdRDf8+8seNb6wrsFMkEnAKosVflLzKzN84KL
         yRUPYq4psGI7HYWfB7+2733YhtHyMhDOp5Gmfm97nhGulSc8+bcmMERC2Y2c47sVkMbx
         AytT082yEteFuBKr2uT0qLqNUx2mhTA4pvjaTHQJTJt4ls/Vtwh2qYBjS0qBwMKJF9rq
         xhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768901338; x=1769506138;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8qtmLeEYJkg0E+FGU0YcIS6Kp7zsO5AEUqj66EA7/Y=;
        b=DPnaYSkXJV+HvDX0+i7Sv1UjSVclvOAHgGtsM4oboleizAyseJROzzrXYXlYIh1oGk
         XTlzGT803Uvm4vowNWIfSjgxGBITWx+73jmRSyIlasGz75zCbenVU1nmO4IhDICbBmyV
         cfeCjcg2G/2he3N5B7nq4bjc5m1kjBd6GNUb4qS/5vthMdHZenQ+eggBRxBHpeDpkB8E
         ZXcmtTdF/nqJJmJ1YDjs93rVTBb0mtLHb1LszUqT/ERPnlPcpHjchc+XvZDV6A3K6VW4
         8p/bhokjltUQ2FtiGQD8/JgKhj5+JL2jvIsmqWLsoZnQo/Wrr3kFA+h9cvvajLs8ELKg
         L6RA==
X-Gm-Message-State: AOJu0YwhKvgBZsEI7wiBOtOr+r4UIILZknMzjo/JwG3aFKA8xHyvT0Lr
	aOK4Fg/jU/JpQJcB+ku2k/KHLzzMlRd6NU69UmQ/QopnSr4yNCR56N/DdvBnx7jnHw==
X-Gm-Gg: AZuq6aI6dU1+TAHwXJz/9edZ87IjFMY1nblVERfFGzjLP9pTNntXuL0DRqHXAWDQ/1Y
	bush6vEx2qEvHLwAW1Zl77+XiXwO6k9qaDfJT9aIMrPBiCsmVWT5T7OB41qv1FB57xtQsNzowrk
	9USOl3Gude1NgRpANzfXfFpeTNqcCswelI7qyTExwLpiXpmlq0TgL4m3IBnDe/Neot5jqqMgpkh
	NvGTZlW7IOS5+hWhw6WNCTD1SdY/GJmGqju9XfTHxEDVGAuTAX167gR/8Z+i0aa6J1Z+pqvOzYI
	n4bban3Gam8UIFjCySracBhgesIeYgzc2YmHtKPUoiyFHWlkUBHcbU4um1oraFSJiTx+l9XqLWg
	RfDEHSPB6yrvNMl/nicyiTrnVrcyhoVQFyjKCSovue0GwQG0Jb+wuJ8C0calEVbjZYToC7yMJrt
	bMYRn3OzWlg3Dk2d0RoiaKqaQoB7Zi6RGLr+JgdbbhfUE+3R7AqqjlqBURPsO0cOU7LtVD4vYo2
	HPuWI7cwwd0Eg==
X-Received: by 2002:a05:6000:200b:b0:431:35a:4a7d with SMTP id ffacd0b85a97d-4358ff6f98bmr1831452f8f.58.1768901337694;
        Tue, 20 Jan 2026 01:28:57 -0800 (PST)
Message-ID: <069c49f7-5150-47bc-885a-593970ffc113@suse.com>
Date: Tue, 20 Jan 2026 10:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in
 get_s_time_fixed()
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?0JDQvdGC0L7QvSDQnNCw0YDQutC+0LI=?= <akmarkov45@gmail.com>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com> <aWfXJk90Sh7B-qi7@Mac.lan>
 <e9205e59-fb1d-429e-877d-28aa8cb950ca@suse.com>
 <380f4d96-4612-4369-8ade-8e9739929135@suse.com>
Content-Language: en-US
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
In-Reply-To: <380f4d96-4612-4369-8ade-8e9739929135@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.01.2026 09:50, Jan Beulich wrote:
> On 15.01.2026 09:00, Jan Beulich wrote:
>> On 14.01.2026 18:49, Roger Pau Monné wrote:
>>> On Tue, Jan 06, 2026 at 02:58:11PM +0100, Jan Beulich wrote:
>>>> stime2tsc() guards against negative deltas by using 0 instead; I'm not
>>>> quite sure that's correct either.
>>>
>>> Hm, we should likely do the same for stime2tsc() that you do for
>>> get_s_time_fixed().  Given the current callers I think we might be
>>> safe, but it's a risk.
>>
>> Will do then.
> 
> While doing so, I came to wonder if there isn't a reason for this "capping".
> In local_time_calibration() we also have
> 
>     /* Local time warps forward if it lags behind master time. */
>     if ( curr.local_stime < curr.master_stime )
>         curr.local_stime = curr.master_stime;
> 
> Which for the use of stime2tsc() in cstate_restore_tsc() might mean that
> indeed there is a worry of the delta being negative, and the desire to
> "warp forward" in that case.

Proposed new function implementation (easier to look at than the diff):

uint64_t stime2tsc(s_time_t stime)
{
    const struct cpu_time *t = &this_cpu(cpu_time);
    s_time_t stime_delta = stime - t->stamp.local_stime;
    int64_t delta = 0;

    /*
     * While for reprogram_timer() the capping at 0 isn't relevant (the returned
     * value is likely in the past anyway then, by the time it is used), for
     * cstate_restore_tsc() it is meaningful: We need to avoid moving the TSC
     * backwards (relative to when it may last have been read).
     */
    if ( stime_delta > 0 )
    {
        struct time_scale sys_to_tsc = scale_reciprocal(t->tsc_scale);

        delta = scale_delta(stime_delta, &sys_to_tsc);
    }

    return t->stamp.local_tsc + delta;
}

Jan

