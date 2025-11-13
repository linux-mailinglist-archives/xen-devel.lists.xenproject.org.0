Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FC4C57561
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161111.1489119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJW8O-0004Bh-27; Thu, 13 Nov 2025 12:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161111.1489119; Thu, 13 Nov 2025 12:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJW8N-00049s-VS; Thu, 13 Nov 2025 12:09:03 +0000
Received: by outflank-mailman (input) for mailman id 1161111;
 Thu, 13 Nov 2025 12:09:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJW8M-00049j-AC
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:09:02 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89b5af3f-c089-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:09:00 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-64088c6b309so1289895a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 04:09:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4b1dc1sm1366871a12.25.2025.11.13.04.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 04:08:59 -0800 (PST)
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
X-Inumbo-ID: 89b5af3f-c089-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763035740; x=1763640540; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fLrMAWs0s6+ymMs+8vjt6qBmgpso9jUTwbhGPgnA3hE=;
        b=at5kQceFwrf6/n/HRSPWhcHwcS/cJ4+0Vx/hDjB5ITMy5ZFHKFsJX6zZcsYTd6CYjf
         AA0R0aSpEJOscZ7SJVpNM+WkKsKVcbuOgfeEObI1o2YKw6TBTCksxi0uUQSHpkGyuJzg
         SL4tQuz4HZhDC/wdXdLBPJjlyM2crB0o9QTTffNzHqpgKZno97/x1Tkf99pcn+TRuUsP
         wna4TCkDetYTTsV2ODB8Xt99yU16vsYFQGlRRYYVaPgtUt67l96nxV2QJpmBALc6aN9i
         /t3lB8trg71Ndofynh/NmPl7k+82hngmvL5stAUfCNB/Nak03B8oWQLrO0Yv4kK7EXhr
         2w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763035740; x=1763640540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLrMAWs0s6+ymMs+8vjt6qBmgpso9jUTwbhGPgnA3hE=;
        b=FA19iIvaLgFPvpoEeDEwlKzMzQzZo+5O7tbvVdPVRnuuIbr3uSNcgN7zmzlLBJcXDH
         Q6luo7K1i+cVxff1x0nBXWdVIy9PwoYgJP2EI7Rn0BjjrC7FeBVeleWV60H2NZ5fZaX9
         3JNLnEOsVozMcnWDqcKB04k/LaQyer/8q+MGWi/V8JkbvQV5BhCuk3QFZY0vKJ0AIiLv
         uUB5eVmD3L1W/wgJQ6JhwyNlYiqeNSlQgpGmU8OQcxUgnw0NCrO/wd8/MS7tIkcUhrQT
         i4UKXIKuaM2gYyOZhg2nHuZAdbUQiE9MZsyPZMrZJ+mRP55kGd0pu3QNNmvH+ZEUBBth
         7DMg==
X-Forwarded-Encrypted: i=1; AJvYcCVa6euRfblFtM5xFg4kb8ovDnbnl0bQdfK4k1nigAJ86VlO4SpLszlefuvmV22vB5zhLdIh82AABLQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyU2wc6s8vbSYZRJ5GYKMJwum3hTEIbvgzbBfJaVFNgmvq0wlN
	UayvyzqnFnqc8fzFdUHZBmRJH9zEFm909HYHySGlL8sPLZ93NAnNyAGE7bP0uoAD8A==
X-Gm-Gg: ASbGncsPcjT2tjiW/e/wWAMqywwPOXuNjcUP43WWb9qE7CvH8maN+giCYLIjBymCGoU
	vfRMmUFDRydNMqtZvuY8qExXHvg1SyrAzsBWdq/alsuIJEk1L8u1v57vVRlw9dM4runUEvZW7bw
	uEnJ6/MEyOS+/9gjIqfT5xUUW7EQh2juJo3njLBWTqR8ycF/LWauq0gK53m9lxBxVCAJDeHm2A7
	PYM6HP1CfmAB4HYmSQZJoOMiYt4kZXanJ3ZMMU2ipZUdVqz91Wrkf9SznVdOOOYu//6o2LCgItN
	55mUo88yzTGkoAb1e3uRTsnw+znoLzjY3GllXGz8ZsLOiQtF2aqu386KAX4YS/RYzQqQFfObEoS
	YG0r27xkqJ0dFTfGa2Md/a7m//eWMX+PSm0Q67DC5frlbdqwCYmh1LxJj/fckJayRYmSXAhoWbo
	RsB9DXB5DqjVl2z55OTTGtWkEYuBomEoJBKzR+o0NW3cDojVv9BEOu5xQ69cmdmzuNpCYTcPne7
	Ls=
X-Google-Smtp-Source: AGHT+IHlWwmTfH8MFoqObQdrxMO1/VC3mQ+uEU3nhmrlXnz/Rx8hEM87ZuHvL4PayOpe54BaIM6vRw==
X-Received: by 2002:a05:6402:26c6:b0:639:d9f4:165e with SMTP id 4fb4d7f45d1cf-6431a5755f0mr5180651a12.29.1763035739600;
        Thu, 13 Nov 2025 04:08:59 -0800 (PST)
Message-ID: <75e6e27c-1d47-4689-a52d-e596de84db26@suse.com>
Date: Thu, 13 Nov 2025 13:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Expose time_offset in struct arch_shared_info
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20251112070815.545-1-ngoc-tu.dinh@vates.tech>
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
In-Reply-To: <20251112070815.545-1-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2025 08:08, Tu Dinh wrote:
> time_offset is currently always added to wc_sec. This means that without
> the actual value of time_offset, guests have no way of knowing what's
> the actual host clock. Once the guest clock drifts beyond 1 second,
> updates to the guest RTC would themselves change time_offset and make it
> impossible to resync guest time to host time.

I guess I don't understand what the problem is, or why it would need a
change in the hypervisor (interface). If the guest updates the vRTC, it is
(implicitly) asking for a change of time offset, isn't it? And whatever
adjustments it makes, it could track and accumulate them?

> Since there's no way to add more fields to struct shared_info, the
> addition has to be done through struct arch_shared_info instead. Add two
> fields in arch_shared_info representing time_offset's low and high
> 32-bit halves.

Any why in two halves? Without that, ...

> --- a/xen/common/time.c
> +++ b/xen/common/time.c
> @@ -118,6 +118,11 @@ void update_domain_wallclock_time(struct domain *d)
>      shared_info(d, wc_sec_hi) = sec >> 32;
>  #endif
>  
> +    shared_info(d, arch.time_offset) =
> +        (uint32_t)(uint64_t)d->time_offset.seconds;
> +    shared_info(d, arch.time_offset_hi) =
> +        (uint32_t)((uint64_t)d->time_offset.seconds >> 32);

... no casting at all would be needed here. (Even when there are two halves,
some of the casting can be dropped.)

Another question is - why unsigned? struct domain's time_offset.seconds is
signed for a reason, aiui.

Jan

