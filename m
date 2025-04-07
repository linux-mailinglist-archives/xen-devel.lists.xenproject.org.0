Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36851A7E4C3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 17:39:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940474.1340238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1oYw-0000OK-FL; Mon, 07 Apr 2025 15:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940474.1340238; Mon, 07 Apr 2025 15:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1oYw-0000LE-Bu; Mon, 07 Apr 2025 15:39:02 +0000
Received: by outflank-mailman (input) for mailman id 940474;
 Mon, 07 Apr 2025 15:39:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1oYv-0000L8-1Z
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 15:39:01 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c77cd30-13c6-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 17:38:59 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3996af42857so3590024f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 08:38:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b69c4sm12305034f8f.43.2025.04.07.08.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 08:38:58 -0700 (PDT)
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
X-Inumbo-ID: 6c77cd30-13c6-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744040339; x=1744645139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I0W8WWwrY+vf5tXMYR2a8Qt5eK1upIB761X3DJBBsGI=;
        b=LDsRX64dKolEwX3NPJPaVLbAV1NuIPe9HthecFS4WgAaV1wwMMwc7dLszM+wCjWU3F
         c4ypsRJ4VPqNBqvqq16CiwMbQGveCOXI2eTZVqHP1xOhZCZFAGA0KbV2VxEBF/cT1CUj
         FRx0hgX7rkng009YlQoCikb/w/P3rrm5ecF3lg9YLxSyqUH/oP0TRxk2JTmMM3We/7dd
         sfE9L0KFBaS/r4GOBFcCsvIf3JnCQWzuO05rNN1UV5CLps9L+h0nKXHmC9RCCtX0kRwy
         cieDdQ9W5bObNP8sDSmOO3aY4jRKUU7IFaYsZNjT+Ccj93wrxalFA8C22XTMy2jLZmdp
         jn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744040339; x=1744645139;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0W8WWwrY+vf5tXMYR2a8Qt5eK1upIB761X3DJBBsGI=;
        b=GwWLs5X2MoxFG43mW92r3TA9JwiMl0WL9aGVNUjo+Fv5lBmbNbSnVCKaawGg3EEnb6
         HeSChlZhGTBX0BQ7mTr3DwM1czJQVcBnVAenhpSKl5YrPck6f2TWesmV/rgBwrXXuj4a
         +Q67oX27fmmQKWJEpX+PrjpI8acY+o63mNHcCLusESGVWapAEJHSvXo3gvi053LcuNb/
         6WndJcnQTsjCQnfnq7TxPpFfzwfEAorD19nwPxDc14Kk569/m6+Md6gCBnytN7SS1MgY
         NvWWdnAzNwVNso2meuRQVJibAB6b8ff6GurZP1yilobLZX35CTv7eBCIernHAKTHksWr
         w7VA==
X-Forwarded-Encrypted: i=1; AJvYcCUieeLr2b8+OrCpde6cUucupbsPG7iSufpFlltIxhMfBaG4OmJrSi17kdtKNcSfmSY9h5HoKp8VnN4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxaw7S8OndI2Beamq2aTRSjmbBTvrBTPwNlkK+MKC5mmsWNOZVS
	XGP6sgrbPfM9GyOIBeAEEK2YfSK95pYrkDgiF54VNC+z1Jc9DLG3MAxkkGRB7Q==
X-Gm-Gg: ASbGncsj43y6MpESwmhuDLCXCUHpcUdlvXscVW/0gy9dAZOfk32lxc2bwwSPLYGWxOA
	Bl2nRKocrmDfDe5MLtA1dcB0m52W2d3n9RNuy5PfKbgWahgyT6bvFKp/IsBGMez3LQZEf3ouSTh
	I2MbHyduSi7kkmnvimi3NPUm61EU3Oq/nFEPTOETjiIQ18iEofNRembUQtTbmJXMznYTFiWghTd
	C8LUdktSXm3KNGlyOYt9H7KG07ecs+lOobCShFg+5lMl80tui5uBDmSJ9UQ/MnFnVxEr4iM6DLT
	NaDr1gDcG9zi9PHtjfE2m4YeFssyHNGBC8Gep09AIA0Yf+1hV7nkt42AfEbBCpV7Vup/B3jKZ5Z
	jQtz60lQaAhpIPjegmTU70zGaBmRps1AovCq6V4Yj
X-Google-Smtp-Source: AGHT+IHf6dnjOA7EvNt3W/8Kpd7S2kFo8n2QgrF5TdOClHn6qGzpCU7sgTw6boUzfHGB+pQl5a9fMA==
X-Received: by 2002:a05:6000:18af:b0:38d:dc03:a3d6 with SMTP id ffacd0b85a97d-39c2e5f50a9mr15406046f8f.4.1744040338846;
        Mon, 07 Apr 2025 08:38:58 -0700 (PDT)
Message-ID: <8f29b0b3-dc57-417c-937a-50f5aac6f6f8@suse.com>
Date: Mon, 7 Apr 2025 17:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ping: [PATCH] libxc/PM: correct (not just) error handling in
 xc_get_cpufreq_para()
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com>
 <e0028d85-668a-464b-aac5-ac8a79ea9bf5@suse.com> <Z_PI2UNn2C4GKqYw@l14>
 <75d288ba-1006-46f4-8f51-6d49c5e8449d@suse.com> <Z_Pt6Pv8_RrV4J2U@l14>
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
In-Reply-To: <Z_Pt6Pv8_RrV4J2U@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.04.2025 17:23, Anthony PERARD wrote:
> On Mon, Apr 07, 2025 at 03:23:48PM +0200, Jan Beulich wrote:
>> On 07.04.2025 14:45, Anthony PERARD wrote:
>>> On Mon, Apr 07, 2025 at 01:38:24PM +0200, Jan Beulich wrote:
>>>> On 27.03.2025 14:32, Jan Beulich wrote:
>>>>> From their introduction all xc_hypercall_bounce_pre() uses, when they
>>>>> failed, would properly cause exit from the function including cleanup,
>>>>> yet without informing the caller of the failure. Purge the unlock_1
>>>>> label for being both pointless and mis-named.
>>>>>
>>>>> An earlier attempt to switch to the usual split between return value and
>>>>> errno wasn't quite complete.
>>>>>
>>>>> HWP work made the cleanup of the "available governors" array
>>>>> conditional, neglecting the fact that the condition used may not be the
>>>>> condition that was used to allocate the buffer (as the structure field
>>>>> is updated upon getting back EAGAIN). Throughout the function, use the
>>>>> local variable being introduced to address that.
>>>>>
>>>>> Fixes: 4513025a8790 ("libxc: convert sysctl interfaces over to hypercall buffers")
>>>>> Amends: 73367cf3b4b4 ("libxc: Fix xc_pm API calls to return negative error and stash error in errno")
>>>>> Fixes: 31e264c672bc ("pmstat&xenpm: Re-arrage for cpufreq union")
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> May I ask for an ack or comments towards what needs changing?
>>>
>>> Calling xc_get_cpufreq_para with:
>>>
>>>     user_para = {
>>>         .cpu_num = 0,
>>>         .freq_num = 0,
>>>         .gov_num = 9,
>>>     };
>>>
>>> seems broken. It's looks like the `scaling_available_governors` bounce
>>> buffer is going to be used without been allocated properly handled, with
>>> this patch.
>>
>> The local variable "in_gov_num" controls its allocation and use, together with
>> has_num. "Use" as in passing to set_xen_guest_handle(). The only further use
> 
> When has_num == 0, `in_gov_num` is only used to set `sys_para->gov_num`.
> It also make a conditional call to xc_hypercall_bounce_post() but
> there's nothing to do.
> 
> Why user_para.gov_num seems to control the size of a buffer, but then
> that buffer is just discarded under some condition with this patch?

That's nothing this patch changes. Previously has_num would also have been
false in the example you give.

> Is the proposed parameter (where only gov_num is set) a valid input? If
> not, why is it not rejected before making the hypercall? (with this
> patch)

Prior to the change adding the user_para->gov_num conditionals the interface
was all or nothing: You got actual data back only if you asked for all three
pieces. Said change then made obtaining the governors optional, yet only
quite. Once obtaining frequencies also becomes optional, I think we will be
in a better position to sanitize this function. Right now I'm only trying to
get some of the basic flaws sorted. The three modes we want/need to support
right now are
- caller wants just counts, but not actual data (would pass in all three
  *_num as zero),
- caller wants all data (would pass in all three *_num as non-zero),
- the HWP special case of wanting CPU and frequency data, but not the
  (meaningless there) governors.

Jan

