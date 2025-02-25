Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829BBA4360A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 08:24:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895431.1304031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmpIH-0007rF-Ke; Tue, 25 Feb 2025 07:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895431.1304031; Tue, 25 Feb 2025 07:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmpIH-0007o7-Hc; Tue, 25 Feb 2025 07:23:53 +0000
Received: by outflank-mailman (input) for mailman id 895431;
 Tue, 25 Feb 2025 07:23:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmpIG-0007o1-BC
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 07:23:52 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7537688b-f349-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 08:23:49 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4394a823036so49723135e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 23:23:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b0367533sm129314585e9.27.2025.02.24.23.23.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 23:23:48 -0800 (PST)
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
X-Inumbo-ID: 7537688b-f349-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740468229; x=1741073029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GMjz1C2G3F8Rt3otloSskbuIKDC0FXfyj0NPFudPzTw=;
        b=PJXPsFBJCy6z7gaX8POano8vACit/uRF8LzVdHHyKsGQvY5osE9aQJNJM9dgR8dDFt
         vl15u6iYnOFFNu+hVI9P9BkSug0zyqnqDWorKPg7ZIi6mh5LU2K07r1bymfJziSwdiUG
         xL5pNnvflBiXZl/uW5dgN/Ufx5oKXxZod9rZvooxrGThEOUSC/NoZOXsj2MxUWJjOxKE
         JVgTOuXJ0BQxV9lFsRtVASHAbOrSsLVDDH3nVi1oCXGu4I/qvuVbqlLaSOp4tVry/6cq
         TVOabAZg1hoZs9zdU0BCqMkmho9MemvTZiTlM3RftxBqQg8yBgF8bnC2vaVxFQj+9Zv7
         MCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740468229; x=1741073029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMjz1C2G3F8Rt3otloSskbuIKDC0FXfyj0NPFudPzTw=;
        b=Xqfve2rlz+PCXX7NyDkUnX2eODEHzigwvtGanO25eNvuF3/wVw7uvE6/U7AxXu1L9/
         YBLp7DcWqVAXBCwMydauiwOhK3vq+IEVZyRmYRJBDjkaqbzt2oT5wkunFTWVhIieilDb
         hruYIwBTrL/M00dwANlDhGltB0cDrV5s9S5TTpgqHnrvgNnGc4VNfLw/NFToEZFCOLVA
         hrbF7ps0sZuYxsnEKTNKT1UQUy5FJ0FUFPnvacH5fUcyY9Themgu6DzJf74LoCiPA/Ru
         TqrPyavQCo4EgwJj9tjgbpYH/0t4rfpdNWCuewbFlX0SFueoFkd8Y2BLD+BxqhvLZkvW
         Qhrg==
X-Forwarded-Encrypted: i=1; AJvYcCXY7O88UZWqQZ5+4T6CV8rZPQkhqcOLzsEMo0zFJ8Tq145eRfNIIQWuvVooaiR/ZCkYK8a390AXvIs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzK+GkW9PwfN/8SXyybwx9IR0HD9txnlheF8O2SJ1Oa+mciNu2K
	3aUYFfG7l+SlYT/4tRrRJHTGsxi81sIvbBYvP/RddzfdNSPKTUlHuzTJ+cMqTg==
X-Gm-Gg: ASbGncvrqqVD1Ca2FF2ym8GrjRngWQ99CyItF0hQ/tNOt+HGwq3x7SfaqKex6Hf/tXy
	H2B5HDhLu+omaE4JjXeNSepwdXLYpEslL52MmbzDiGN5Xw0KSJC9kRDsibvm+am9+Ka/Ibt2vip
	1dGm40rLkOibdvgc/Na2wRAwOIJtSDFuYi4Bv63UPl8PUdsKtdpu/DBtbla/hqmleq6JtOwLfJ3
	5ZxHk+j/1eG7Rl75yVyeTa0LTf2bwUFm7ri+z1yuIoUfXGilu/NCHpW3JiqSj3xymVkssAe0j4r
	L5sJD7TmQ3lKeRYn23twZ8TkkrxF+jbarmXyQrh+TXRRdOtv8Wzm84CpQgCar7kCtwRVqKgaX/j
	jlV0g4fS9VU0=
X-Google-Smtp-Source: AGHT+IEcLU2NyenDRALE8YVRZG0bqQ9CwO/NvKgcb7YSk/fjBTG2tw42BcAJu5AwcEEmk6Zw33FHow==
X-Received: by 2002:a05:600c:3c89:b0:439:9ba1:5f7e with SMTP id 5b1f17b1804b1-439aebb2b9dmr105605805e9.21.1740468229205;
        Mon, 24 Feb 2025 23:23:49 -0800 (PST)
Message-ID: <224c2c94-0835-4ba9-88d7-c57bb1cd4ee8@suse.com>
Date: Tue, 25 Feb 2025 08:23:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/console: make console buffer size configurable
To: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250212222157.2974150-1-dmukhin@ford.com>
 <4203576f-0b93-4647-9983-e36c15fa1d0c@suse.com>
 <o_C90Tb8fjLMkG-pSNmxycIsYytdAxHSTU7yrudH07-h6L9e4XGirmyyKKSRQsLuOyYwA6b-9jd8kOOnM21yC8I-6q5EzcX2lsLHcbgGqec=@proton.me>
 <3826b034-be99-4f43-ac55-d616e473ab40@suse.com>
 <OyVZrdA69HTSGgzR--Ww8VQODmbKn_9CUDbnqVClk7Mkep-tQdOluHw2ofeoLekSohbc28ZSabP4l6O3dIQwrO_7jk6L7RxQwYs-6QxpLuE=@proton.me>
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
In-Reply-To: <OyVZrdA69HTSGgzR--Ww8VQODmbKn_9CUDbnqVClk7Mkep-tQdOluHw2ofeoLekSohbc28ZSabP4l6O3dIQwrO_7jk6L7RxQwYs-6QxpLuE=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.02.2025 03:45, Denis Mukhin wrote:
> On Monday, February 24th, 2025 at 2:44 AM, Jan Beulich <jbeulich@suse.com> wrote:
> 
>>
>>
>> On 21.02.2025 21:52, Denis Mukhin wrote:
>>
>>> On Tuesday, February 18th, 2025 at 8:05 AM, Jan Beulich jbeulich@suse.com wrote:
>>>
>>>> On 12.02.2025 23:31, dmkhn@proton.me wrote:
>>>>
>>>>> --- a/xen/drivers/char/Kconfig
>>>>> +++ b/xen/drivers/char/Kconfig
>>>>> @@ -96,6 +96,18 @@ config SERIAL_TX_BUFSIZE
>>>>>
>>>>> Default value is 32768 (32KiB).
>>>>>
>>>>> +config CONRING_SIZE
>>>>> + int "Console buffer size"
>>>>> + default 32768
>>>>> + range 16384 134217728
>>>>> + help
>>>>> + Select the boot console buffer size (in bytes).
>>>>
>>>> Why in bytes when ...
>>>>
>>>>> + Note, the value provided will be rounded down to the nearest power of 2.
>>>>
>>>> ... this rounding is done anyway? Why have people type in complicated numbers?
>>>> A granularity of 1k would already be an improvement; yet better would be if
>>>> this was a power-of-two value altogether.
>>>
>>> My understanding that the semantics of new CONFIG_CONRING_SIZE build-time setting
>>> should be consistent with existing boot-time conring_size= behavior (string value
>>> converted to number of bytes).
>>>
>>> I can update both to round up to 1k boundary.
>>>
>>> I also agree that having power of 2s for both (e.g. similar to Linux'es CONFIG_LOG_BUF_SHIFT)
>>> will be the simplest (implementation) and non-ambigous.
>>> I had it done earlier:
>>> https://lore.kernel.org/xen-devel/20241205-vuart-ns8250-v1-26-e9aa923127eb@ford.com/
>>
>>
>> I'd prefer the power-of-2 approach, yet I could live with the Kb-based one as
>> was suggested by Roger.
> 
> Just to double check: I think it makes sense to switch both build-time and run-time
> settings to use the same size calculation algorithm (e.g. Kb-based) to avoid
> confusion during building hypervisor configuration.
> 
> Will that be OK to do such change?

No, you can't change existing command line options like this, at least not
without a very good reason. You'd break existing uses. Plus there is

size_param("conring_size", opt_conring_size);

already anyway, so the command line option can be used with Kb and other
granularities without any adjustments to the code.

>>> Also, since there's a build-time configuration parameter along with the boot-time
>>> configuration, perhaps it makes sense to retire boot-time setting in favor of
>>> build-time setting?
>>
>>
>> Why would that be? Build-time settings can only ever be defaults. We don't
>> know what people need in their configurations.
> 
> I was thinking about few reasons.
> In embedded setup run-time settings are unlikely to change, it is mostly
> built-time configuration.
> On a server setup, bumping the size of console buffer morelikely means some
> debugging, which to me means new xen binary can be re-generated and re-deployed.

That depends on who's doing the debugging and who's giving the instructions.
A developer telling a customer to increase the buffer size is certainly
easier when it simply means adding/changing a command line option, for
example.

Jan

