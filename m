Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F55CB58F6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 11:50:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183870.1506450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTeFZ-0006ea-Mr; Thu, 11 Dec 2025 10:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183870.1506450; Thu, 11 Dec 2025 10:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTeFZ-0006cz-K3; Thu, 11 Dec 2025 10:50:21 +0000
Received: by outflank-mailman (input) for mailman id 1183870;
 Thu, 11 Dec 2025 10:50:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTeFY-0006cr-EN
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 10:50:20 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eb516aa-d67f-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 11:50:18 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4779d47be12so7524995e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 02:50:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b8a851sm5207531f8f.29.2025.12.11.02.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 02:50:17 -0800 (PST)
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
X-Inumbo-ID: 2eb516aa-d67f-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765450218; x=1766055018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hZj0RITDx4r82StgH/0g+X+fv0iCmUnFptUDp5VTpN4=;
        b=YMyV9ZKJTr5BBYLNF/f/JHWwg0dxs5b/TLN30DkQqZWekNIoYwciP5S7JfcM+W0syC
         PVm99wGrTNP3duESLASLEJ43ns/k26apeIhc8cY7uqn8fC+KC2k7xLmPa/6mEffWJJ4z
         I9hwNtgLmvSzB6yvuscby8n1yitYTDhJG7UD95i94rYnYzRVhhXD8/KFJDE7rZtTQBnv
         kYjpdA8WtNOUUMfLR5++qCPeJAihLQXzHZpGfM9vsOPkpykA1omFqb/I5uYtuR7B7cqZ
         qcLpSfxLtsqM3uGhlvIJZM3Y1sh+SFv3EgNXD9ZxIvX90bTOEZyRbuZ/WGoq5KHZ3gTo
         58og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450218; x=1766055018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZj0RITDx4r82StgH/0g+X+fv0iCmUnFptUDp5VTpN4=;
        b=UnS/8pjgyJZnMWpLttGeWfvrDU1z/GCd3zimhD477mqUNlODfQHGxaz+zoEpqXVtjM
         QQ4m8RUbudMnGga46hBtxQk/HYJrB9Ei68Xf5rK4fYfzZWojDi1wwTOSLvhyUalaYdtX
         1SEtjzzmDJo+OMCocZhENiR5aa+Mx8mp3RsKxmeGhFSWbT6saQ71veAAluFb05E8O26G
         Jikv2fG1efos1VFPpg2JuU/bx9B9V08xpukJAf7RpR6WhHEEqQymvVWKcmZFTuYULHqO
         OkLFEvi8fGBkiPsSrUdhDYpSsvqJSxYhjKBgKrIbjBlOf9jW+avDmr9r5xWotCHZjp3b
         HYiw==
X-Gm-Message-State: AOJu0YxDSdh/H0g+qvtWCZuVW/CzfhGBzfQtANUB9BaGTQTlyrA8tEjA
	fasmFXt5nraINaML2crhw7lfDWRV9ij3Xlp3lp25o29U/sJYu33bIyjhYXaq970VLQ==
X-Gm-Gg: AY/fxX5i7TiJgn9/EC3iXZA0IaxWCAGJW45KZ9SnjcVlKy4Z+ucHha9vfcm0zx+mF82
	XMqItlKWO4yt+OifLDaEx/Ux/bedIFg3lnJfYUFwveeWxvxADgO9y5kkoHnRPKWPh7G8kkjO/GS
	V8cqD7yYn2sRonQxvkGqEcFVrifpjFrIS88tlghjw+JPpOfZeKA5QXJtmojBbXRli2wx3EhDt6Y
	lyoahHNiy05jSweMcJSFUV9RA8MIy5ta5moXuScfcQGOFAXIANJdasP/EaKW1o0Zbp4Rlba1GTq
	5lh4HA1kM/cMaS4nyzrI8gWfj8eJwA3I521W9zJjUKfhytrzsJE9PWKniqqJ42F9QZqmK2M6n1Q
	55IwjtE7NqyGf/XmXsh8Pajap8NXIBISNJTD2jWWfqNMrg+p1vB+IduLkmbe9KibMisz36FYjpv
	IzX52iK85yw5BVn97NjaWPYkhLypjJSK+Ib1haCzuT2eKhu8h4YWyDgZLYONtS8VEWi6mnnZHLh
	ccFiapKjme54w==
X-Google-Smtp-Source: AGHT+IEKIMTElX7KJAQqLhdb6vhLVglED2tCrt5CH/eubbsi+72iNDzig7F2cx56rJR5h8jSjkyqnA==
X-Received: by 2002:a05:600c:6098:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-47a8384c0e6mr54629115e9.21.1765450217690;
        Thu, 11 Dec 2025 02:50:17 -0800 (PST)
Message-ID: <67d26857-6b7a-4b5d-8bdb-c973885926a0@suse.com>
Date: Thu, 11 Dec 2025 11:50:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Eclair analysis
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <7744f9e7-17da-4f48-837d-8fc087899af5@citrix.com>
 <c0d5cf8c-cb57-47a5-a989-f65677e565aa@suse.com>
 <dab08dfc1de25d7573c401ecad8a1f21@bugseng.com>
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
In-Reply-To: <dab08dfc1de25d7573c401ecad8a1f21@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2025 11:08, Nicola Vetrini wrote:
> On 2025-12-11 11:00, Jan Beulich wrote:
>> On 10.12.2025 19:14, Andrew Cooper wrote:
>>> The Eclair step is now the dominating aspect of wallclock time.  While
>>> the recent changes were a step in the right direction, we need some
>>> adjustments.
>>
>> One other question, related to the "dominating" aspect, but not to any
>> of the points raised so far. Can scan results possibly be recorded
>> somehow, somewhere, such that upon re-scanning the same tree (pre-push
>> test followed by post-push test) the identical re-scan can be avoided?
>> And perhaps even incrementally - if only .c files change within a (set
>> of) commit(s), only re-scan those, rather than everything? Could be
>> extended to .h files if dependencies were properly taken into account.
> 
> We support incremental analysis, but it requires non-trivial changes to 
> the current Xen integration. If someone wants to invest time and/or 
> resources in it, I can support the effort, but it requires a fair deal 
> of rearrangements of scripting in order to avoid losing information

What about the initial part of the question, scanning the exact same tree
a 2nd time? Is that merely a special case of "incremental", and hence would
require the same amount of effort?

Jan

