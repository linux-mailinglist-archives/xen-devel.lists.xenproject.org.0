Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26611B005E2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 17:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039632.1411402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZsm6-0000S0-7t; Thu, 10 Jul 2025 15:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039632.1411402; Thu, 10 Jul 2025 15:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZsm6-0000Pb-4d; Thu, 10 Jul 2025 15:01:26 +0000
Received: by outflank-mailman (input) for mailman id 1039632;
 Thu, 10 Jul 2025 15:01:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZsm4-0000PV-Fn
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 15:01:24 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be8fefeb-5d9e-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 17:01:23 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so971665f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 08:01:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de435f371sm21850455ad.237.2025.07.10.08.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 08:01:20 -0700 (PDT)
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
X-Inumbo-ID: be8fefeb-5d9e-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752159683; x=1752764483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TIhcj0rlClGxh1VH2IMUEUmhfZyi84IamDyVInevaf8=;
        b=DHE8XnDjND8KS4OTuUb9UHE0e+xw6KFYiMWw8/FWHHQtLox1oyy+anJIpJqdU77I87
         Vr9tle7v6h3f28YKdqJy81Of3imA6tXSgOI6wnLvqNv2josjYoCWDkoHYXGJLhF0P0Yw
         656RKN6HgJsPgs07DJXvig8muWPF7ogL12GxAqpjodS5JArdHzKaYwWI/VoAIVJyQO1V
         GfIZmwo9xgvPLibe7IKVfpY4BUQFFw3OCpXbDmU5Kt1AluWiTJn0F8Hqky96l09hxVPu
         jzFsc8M7jA7U4lscVZbQurYdaEAyYoBE8zDR85BcufksBlAlAbBrvKZDtj+43abLkUB7
         NuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752159683; x=1752764483;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIhcj0rlClGxh1VH2IMUEUmhfZyi84IamDyVInevaf8=;
        b=mbYdj4JXE4JKRqzK8EuYcYXBbtFzvH3rUFB+dzvhcC6tT3bG3OITHaWpbBfU0LYsCr
         mYLHChRIaDL9TPK5u2ozJqjyxEhc8dNTMYtdncdyHVK+lZrjPEFLqbPu/5AdAaF27JAd
         /x5YVM1PrC3cbuTNGpVAm+dl0ZklpfFsqWkKI506uUsIVW+7uYAiAZ4748zGP5HrrsWY
         VfiwHI5PrhPh+LRkjQ/sxLcvxmYX5mqETn4qElRLpUf2wGobo4N+hzq+4zJO1zfkwInv
         FsDOXnFuPHtU/Mq680lkYLsT6SmoWZdMs5/sq1beuvPhP2zDFNn41yS5PHbPmN2ElVvw
         A/Cg==
X-Gm-Message-State: AOJu0YxhJSi47eXuMTieIINfQE/wSTd/OYCZ+N0ZNdaTxqenb20xu5vE
	5IeUMlsriNTVbGDykn6IXreHvzHIl59wYfLqrX6qW9SDE9QWiyaupHgMKszmiwnawg==
X-Gm-Gg: ASbGncvsoAQf8XIODvNBN3y8fm4mgGBqw/3Xy73xZglB/SneY3ephLaRDGdiNEN8dzG
	RYDyBH8Ynm7WskvaIdtcZzszv8LikprwsBmNELIsRZ6TVpHkqHNSbRMkIbWTlaiEIEQXTHDjBBs
	PVHbdNjS7+9M6JO9aFoehdJUz1XfFNXgExqdOPIkX9r2csAMGqFxkLzyF6URu0F8FwGgnp/xa3W
	S4ykc1WEIS3L/UrGhEkKQYf7FNFiU1+yJKHEdjVkntfgvvA67uQr3oc/qrCaWjcilqtHuoQ2jCT
	zXHKTK1vO1IYyEYjoQBzWElK5Nzp06uFJlNSqKOzJHXS7MiIbY0haWQcpbE1o8O7boRm6YFt5jr
	cqSV3zBL41xDsUrhHKEaeU41QqmzRjIF30xZzS70z/1w9ECTrNPEjwB9ixg==
X-Google-Smtp-Source: AGHT+IF8DshaUl63jGrpPJCG1BOwJ2GVu8miKAnstVCgdZOoZnewmeY6iRFlD+r4NpJjftJ4epeA5A==
X-Received: by 2002:adf:b60f:0:b0:3a4:f379:65bc with SMTP id ffacd0b85a97d-3b5e86c2fcamr2136257f8f.40.1752159681016;
        Thu, 10 Jul 2025 08:01:21 -0700 (PDT)
Message-ID: <bb619712-a16e-4aef-ac28-9ccdc5673282@suse.com>
Date: Thu, 10 Jul 2025 17:01:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] build: detect compiler change to rerun kconfig
From: Jan Beulich <jbeulich@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20230320152836.43205-1-anthony.perard@citrix.com>
 <a07f94d8-85cd-a73f-704c-761a04ec3b3b@suse.com>
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
In-Reply-To: <a07f94d8-85cd-a73f-704c-761a04ec3b3b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2023 15:13, Jan Beulich wrote:
> On 20.03.2023 16:28, Anthony PERARD wrote:
>> This simple comment allows to detect when $(CC) changes version.
>> Kconfig will be rerun in this case. (Rerun is forced by
>> include/config/auto.conf.cmd which detects changes of CC_VERSION_TEXT
>> value).
>>
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>> ---
>>
>> Technically, it was acked by Andrew:
>>     https://lore.kernel.org/xen-devel/20200326135621.687685-1-anthony.perard@citrix.com/t/#ma1171775b9938bcdffc80b2fcb8d2a883cd3e32a
> 
> And technically - comment visible under the same link - this still
> isn't what we would need to address one of the arguments around not
> storing tool chain capabilities in .config: The version string may
> not change, but an update may still have brought a new option the
> compiler understands (or a downgrade may have taken away one). In
> fact this change is working against the proposed direction of not
> making .config contents dependent upon tool chain properties. But
> of course that proposal wasn't adopted yet, so for the time being
> this still looks to be an improvement.

Coming back to this, seeing that there's unlikely to be any better
approach any time soon, can we perhaps get this in then, ideally with
$(LD) and the assembler backing the compiler (we don't use $(AS)
anywhere, so we'd need to use e.g. "$$($(CC) -print-prog-name as)
--version") also checked?

Jan

