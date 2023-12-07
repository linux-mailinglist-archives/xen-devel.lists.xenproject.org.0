Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FD08081F8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 08:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649573.1014239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB8qz-00047n-Kx; Thu, 07 Dec 2023 07:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649573.1014239; Thu, 07 Dec 2023 07:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB8qz-00045p-IB; Thu, 07 Dec 2023 07:31:25 +0000
Received: by outflank-mailman (input) for mailman id 649573;
 Thu, 07 Dec 2023 07:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rB8qy-00045j-JJ
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 07:31:24 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f43ed35-94d2-11ee-98e6-6d05b1d4d9a1;
 Thu, 07 Dec 2023 08:31:23 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33330a5617fso615055f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 23:31:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c1-20020adfa301000000b0033335644478sm670642wrb.114.2023.12.06.23.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 23:31:22 -0800 (PST)
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
X-Inumbo-ID: 9f43ed35-94d2-11ee-98e6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701934283; x=1702539083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T1VyGmj5P7JfZF90w3019okHZPKzstvSTe3uogmAtrU=;
        b=BAoWkDXCVWltlo7eoE6b+LdoOV6lr0/7c/pL9lW6S+Kv/j/YZbWTw6d7/l6WqZFmKc
         eb1epMWgF2gaUp+pZQLhkloNubNmo2GYIX4iYtA5WAl7U+vFbNm5NrRVJRnnP5SJNTDP
         DL5NHm+4giaPzq4Pemaqymf0VjbQPunyXavSa5RBPGhbIMxGgNDcnNO9UCSS5PlL6Wv/
         QUVgDOsO1MF+Z18ajUbB59lRrL+eMiSTMZyz/XIXO8CpFoiq1sjUM3HhTxEw10erKGZp
         TgcOqsDiuKNpNc1eEVa3TZjYXtc8HloUm60Zf9/fqfV6wF5uCf3rSM0Qwub1C+XEibAi
         Jdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701934283; x=1702539083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1VyGmj5P7JfZF90w3019okHZPKzstvSTe3uogmAtrU=;
        b=dr004lfeXWO0fJgCKoUhw/30Lhu2ym7g/+bNu2f04z5B25D9oC6GNLHME1ufbH0FJL
         +Z+zpTFU+2128zq2lKq09iSNbyOcIVD7GQGQZJe7B7bEz99HTCeqokolgfItU6NHWbRO
         YxURvZBSqCP3tfb/b0Hnai2G/8WJwr1ROYdY2pycus88I136tvc7vhoxj2xzdFP7ehNh
         Lg6F4FjeV6xcVFAXeyUPGmRdK8nVmFHDXK+/LsjvyDEnQjLfMXv0RzWfDtXsy2C9UMZi
         JgyJ/Rb5EwePCXAQ37gijkGwrmPQ1msnwG4+KO5mRuk6V9cspIX9wYuH0ypROGJDY6Ld
         7TXA==
X-Gm-Message-State: AOJu0Yx8gSkCAMoeKD/hNSTgEP4tr3KgfNHfWPGGFAEHjxM6mISMioLy
	RN3mNYe2X9cEOPyrpOsz3dW9
X-Google-Smtp-Source: AGHT+IEUrioUlvehLfUAOcSJMwbOzDBovpcEKTajcfRZCkaHgJMT5aZXaTXVT7MeuVnCBciAJMCfeg==
X-Received: by 2002:a5d:538e:0:b0:333:2fd2:5d22 with SMTP id d14-20020a5d538e000000b003332fd25d22mr1476922wrv.84.1701934282703;
        Wed, 06 Dec 2023 23:31:22 -0800 (PST)
Message-ID: <4fc65483-4cc1-47ad-bfe9-71d50c0ccf06@suse.com>
Date: Thu, 7 Dec 2023 08:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/DMI: adjustments to comply with Misra C:2012 Rule
 9.3
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <1ca903e7-ed2c-435e-999d-2a8519957498@suse.com>
 <75a57d20-e2e2-47d3-8aa8-79b6ffb18f07@citrix.com>
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
In-Reply-To: <75a57d20-e2e2-47d3-8aa8-79b6ffb18f07@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.12.2023 21:45, Andrew Cooper wrote:
> On 05/12/2023 1:35 pm, Jan Beulich wrote:
>> The rule demands that all array elements be initialized (or dedicated
>> initializers be used). Introduce a small set of macros to allow doing so
>> without unduly affecting use sites (in particular in terms of how many
>> elements .matches[] actually has; right now there's no use of
>> DMI_MATCH4(), so we could even consider reducing the array size to 3).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of course a question is how many of these DMI table entries are in fact
>> no longer applicable (e.g. because of naming 32-bit-only systems).
>> Subsequently the table in dmi_scan.c itself may want cleaning up as
>> well, yet I guess the question of stale entries is even more relevant
>> there.
>> ---
>> v2: Make things also build with older gcc.
> 
> 
> This is broken with Ubuntu
> https://gitlab.com/xen-project/xen/-/jobs/5691138448  and you don't
> appear to have been online today.

And rightly so. I accidentally committed the v1 patch instead of the v2
one.

> Unless you have a clever idea for a very prompt fix, it's going to need
> reverting to cause GitlabCI to be usable for everyone else.

I'll revert and put in the right change. I was online till about 15
minutes before you messaging me on Matrix.

Jan

