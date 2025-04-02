Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A4BA78B86
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:48:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935462.1336866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuh3-0002wi-8R; Wed, 02 Apr 2025 09:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935462.1336866; Wed, 02 Apr 2025 09:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuh3-0002uo-50; Wed, 02 Apr 2025 09:47:33 +0000
Received: by outflank-mailman (input) for mailman id 935462;
 Wed, 02 Apr 2025 09:47:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzuh2-0002uf-7z
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:47:32 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e491439-0fa7-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 11:47:30 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso45232885e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 02:47:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb61369d9sm14988585e9.34.2025.04.02.02.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 02:47:29 -0700 (PDT)
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
X-Inumbo-ID: 7e491439-0fa7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743587249; x=1744192049; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NdKGFxVWSPRNWLC+7QUq0r7MZjDgcRM54pN02gxh+s0=;
        b=g3F2QavKItFC1oeKZwYAb31Vq/PLEK+wqi8HJ38s7XKsHFmOV56Z4hIg2GqmH41p0K
         nekEauD1xKDAImQ8D/rznTSH2wChkGHJqKs89lXipRv/OP06IBUmQB9sPpemGt+E0XIX
         tlr88iQrenxrFKKYsYfg85Ke7wTlLfKanvf1VgXSiIg4v14e+nWH2SnXqwfC+sTs4bi7
         T22rMn5ybU9/eIoUsGW1Hww8eSY2FQw3fejCLIPmU9wSKVYOZYjaHvLOogNo4mw9ysNX
         B0gVZgb8YbKNLNxECFtSD6Pgc2m9cZ+FUwWXgEnn8H2yU6UN8XqGC9hqPee2x/URMwaT
         JFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743587249; x=1744192049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdKGFxVWSPRNWLC+7QUq0r7MZjDgcRM54pN02gxh+s0=;
        b=SZ/5S+qpvx1hp5iYfmy2bUyPGmlGIiGevNhgp1WGUYG92PJKPaUA+KEJdHMNDAjEVN
         nirXp1fQpp2w+WAamgOkn7jWkR5q0bnHqtx5m0qwrP1tBSvos5BZ6ofZMCBJvkc1O/Vd
         ySQt6nmg15uSIimx7oK6Xvk/ZvEWLi3G06BePws0ppJ5ajVqkj5E3VLi4Xmhjx6m4M/r
         FOtpA/u+iLRJ9zy47svO+QsjuPWNppMiecPMB1vq7yzeaEfbE/pX2tqy9IB5vhuzNM5c
         ll+u2gyiG7mbMNW1E5es3t6xkDDrUW24vY1WBYbFvPIToleq3HYk1XdlfjtQLmSjnLNK
         gFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE+uAmmDoZ3mppexWEsTs7X5P+Q8TQodATQsL5oBGWa05IUIUNd3EyApZH1xNiKSIY7jiFvB02WPk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVvsPLRz6MRv7HAivbEExQyHUNnEcW1trriftAJfM1z1fJVPhu
	057LQaLA7f7yDyP93wbw1VTKtC7T2JzVlfSWMBcAZdI6pozst5P0qxBp9lz09A==
X-Gm-Gg: ASbGncugBdl/+cK61orkvEgALCZqwyhrijOykdCogev4O+oGf5m3+sA6kOn9CT3Zm0a
	XFF7Na7M6mMyFCBXyZ1GMJvqcYSnHZdyx18dxbdq3whZYgzduG6G3KhWMugeu7hIl3DAHlYZt2e
	z3CrhinVsm4RLnmquudiDiDYq75NGS9vN3cMiHU1kL/VVEMoVYfwck4Abqp40/bY3I01kscOtH7
	tlpCyqBNT0get0stLoNqMcvoyz5vHcG3qvGy+A8c7YvrYiAE0ZlM+SH7cxzxOGwkpSkPLrOcIaI
	qpiNxyGf/HpV3Q0/xh1axxZ37BDhfreg0xUntElg5sZnVXgRNjCZUEa5+wEARB4NSpl3SWjJddq
	ZbpwZkS3gNpJ2C84O8u2TynOVumdxQsvnCSYOFloQ
X-Google-Smtp-Source: AGHT+IHlyiSONRTyMWoLNXKOp9N/0n5BsuYqdUJL5ms+3rrxiFOXS9AsAMIbT+l121TCvOzAXxwZjA==
X-Received: by 2002:a05:600c:444d:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-43db6249f80mr134776985e9.17.1743587249646;
        Wed, 02 Apr 2025 02:47:29 -0700 (PDT)
Message-ID: <9de3107f-d6e2-49d8-bf9b-32ce75868514@suse.com>
Date: Wed, 2 Apr 2025 11:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] x86/boot: place trampoline code in a non-execute
 section
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-9-roger.pau@citrix.com>
 <3fd56964-918a-49f7-a0fe-a1c6b8633af6@citrix.com>
Content-Language: en-US
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
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
In-Reply-To: <3fd56964-918a-49f7-a0fe-a1c6b8633af6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.04.2025 15:49, Andrew Cooper wrote:
> On 01/04/2025 2:08 pm, Roger Pau Monne wrote:
>> The trampoline code is never executed in the position placed by the
>> loader.  It's first copied to the low 1MB, and always executed from
>> there.
>>
>> Move the trampoline code from being in .init.text section into
>> .init.data, so it's not in an executable section.  This allows applying
>> the relocations safely against a non-executable (and thus non-read only)
>> section, and then copy the relocated trampoline to the low 1MB.  Note
>> that the trampoline code is placed on an .init section, so zapped after
>> boot has finished.
>>
>> No functional change intended.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> An alternative approach is to apply the relocations after having copied the
>> trampoline to the low 1MB, but that still generates relocations in mkreloc,
>> which is not helpful for the goal of having no relocations applied to
>> read-execute code sections.  This approach however places code in a data
>> section, which might cause issues when debugging it.
> 
> I, probably most of all, spend a reasonable amount of time disassembling
> the trampoline. I really would prefer to keep it in an executable section.
> 
> What are the options with relocations?  Can't we simply drop any in the
> trampoline region?

That's perhaps an option with mkreloc, but would require zapping them after
linking if we have the linker produce relocations. Doable, but likely not
to end up being pretty.

Jan

