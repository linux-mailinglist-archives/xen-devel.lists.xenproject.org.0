Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1F38546CA
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 11:03:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680340.1058453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raC6l-0000q1-0c; Wed, 14 Feb 2024 10:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680340.1058453; Wed, 14 Feb 2024 10:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raC6k-0000oV-U2; Wed, 14 Feb 2024 10:03:14 +0000
Received: by outflank-mailman (input) for mailman id 680340;
 Wed, 14 Feb 2024 10:03:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raC6j-0000mj-RK
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 10:03:13 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4376f6eb-cb20-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 11:03:12 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51147d0abd1so6144201e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 02:03:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b00410be9b8b96sm1462633wmq.37.2024.02.14.02.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 02:03:11 -0800 (PST)
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
X-Inumbo-ID: 4376f6eb-cb20-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707904992; x=1708509792; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rVYS5LtrkhFUYl8yNGaKUXrdEmZ4yJyiR3U8lVEBs9Q=;
        b=Gl8iUqWI3ZuFGbROC5sh3VB0UF54y9Z8rToxj7bvUZlmtHAcreMdsdC9xWu00X1Uvk
         xA4A7q/zRiJ0vJtyCox2tv/wXCCZfWNymvtZ8MtqkZFyC34M8Xl4WneGaVKr8DVF7Y0a
         ahbKfsCJhYX34VrMzErj45VYDHys5a9o1VKJS9GP6IjogpkboocfMOi5lFAuiboQuwiN
         GDKWYnnGr/tQQHUqU4ySgWh3bUcbzqrXDBb0Q4ZrHA6NaT2kxOA8PG0DV58/SXM9R9MW
         ujAky2PL6AXgHWtl/UKeuMvmXNL0Y00MEMa6lNIyuZGylpMcXwv6DMHA6MmN4DYoJ1Oy
         wUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707904992; x=1708509792;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVYS5LtrkhFUYl8yNGaKUXrdEmZ4yJyiR3U8lVEBs9Q=;
        b=bvZfqz+aPiiGEcG1PadBDJv8cgoSSpLeAPAIJoJL8mCyx88Wfmn7hLYVESOOta+oKk
         S3OZ/wlewf8ifGUJxvYNIY35HSLiiKMrR9VGq7choILVumnbIOUQ/jYPM261xbgXJq9T
         Isjkf1h2N7fEXTsXW3YXstx1qzJaHjfwI/Hp/QeU7V2hHqn06AEagQCDYyQeNYSsO9gz
         bMbuv4jyjtV/GpFl9WykQa+4so9NGoy9KAdokWElJxZoEsLeaXu1Tr+z2/kPNyvXgxoy
         hNfLdtr4vcNS/r6F+S5rEUyYz0OJVT24LkK/pT4PHOQYrNoq0r7emUzIa0/Un516NJxh
         3Ceg==
X-Forwarded-Encrypted: i=1; AJvYcCUBPK4HPQWtBZCBrTEJRS7NE5rKOgyeCn79yChcPHOkqeEcO/zr40AX+1J4Xrxg6c5JJATVznJBPfNvVDTY7Pk7v8YEiXQyvktyprrj8dU=
X-Gm-Message-State: AOJu0YwdzRQG4GPKa6E5uOOzYEBXGN6vgLfvqIYKBvw1YEQzKE6puZV+
	EkLRYpHmmjM0HobwKpBlqpujvRtGM/2Z/r/3r6WrV5Xx7/iPWqlbJvmzFdQWfg==
X-Google-Smtp-Source: AGHT+IERo3d2VJJspHfumjA76VZoVoo4KA7Tw7S+yO7+JRI7+/MNIfz+j7lMtrb+y6+p3kciW8nZDw==
X-Received: by 2002:a19:ee0e:0:b0:511:4e6a:12e7 with SMTP id g14-20020a19ee0e000000b005114e6a12e7mr1294700lfb.58.1707904992204;
        Wed, 14 Feb 2024 02:03:12 -0800 (PST)
Message-ID: <5b8d6ff3-508c-49aa-8b25-3624d165eae1@suse.com>
Date: Wed, 14 Feb 2024 11:03:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/30] xen/riscv: use some asm-generic headers
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <a721f0c092306b589fae5f44bdaafcd94c60ed14.1707146506.git.oleksii.kurochko@gmail.com>
 <16baca98-44fe-42ba-b61d-ff1945e0d2b5@suse.com>
 <d2cc798462de9e0d7a89777ea0743fe6dce4d061.camel@gmail.com>
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
In-Reply-To: <d2cc798462de9e0d7a89777ea0743fe6dce4d061.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2024 10:54, Oleksii wrote:
> On Mon, 2024-02-12 at 16:03 +0100, Jan Beulich wrote:
>> On 05.02.2024 16:32, Oleksii Kurochko wrote:
>>>  As [PATCH v6 0/9] Introduce generic headers
>>>  (
>>> https://lore.kernel.org/xen-devel/cover.1703072575.git.oleksii.kurochko@gmail.com
>>> /)
>>>  is not stable, the list in asm/Makefile can be changed, but the
>>> changes will
>>>  be easy.
>>
>> Or wait - doesn't this mean the change here can't be committed yet? I
>> know the cover letter specifies dependencies, yet I think we need to
>> come
>> to a point where this large series won't need re-posting again and
>> again.
> We can't committed it now because asm-generic version of device.h,
> which is not commited yet.
> 
> We can drop the change " generic-y += device.h ", and commit the
> current one patch, but it sill will require to create a new patch for
> using of asm-generic/device.h. Or as an option, I can merge "generic-y
> += device.h" into PATCH 29/30 xen/riscv: enable full Xen build.
> 
> I don't expect that the of asm-generic headers will changed in
> riscv/include/asm/Makefile, but it looks to me that it is better to
> wait until asm-generic/device.h will be in staging branch.
> 
> 
> If you have better ideas, please share it with me.

My main point was that the interdependencies here have grown too far,
imo. The more that while having dependencies stated in the cover letter
is useful, while committing (and also reviewing) I for one would
typically only look at the individual patches.

For this patch alone, maybe it would be more obvious that said
dependency exists if it was last on the asm-generic series, rather
than part of the series here (which depends on that other series
anyway). That series now looks to be making some progress, and it being
a prereq for here it may be prudent to focus on getting that one in,
before re-posting here.

Jan

