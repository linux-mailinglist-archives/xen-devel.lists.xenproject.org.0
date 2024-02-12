Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C36850EDB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 09:27:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679318.1056743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZReO-0005Lx-9Y; Mon, 12 Feb 2024 08:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679318.1056743; Mon, 12 Feb 2024 08:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZReO-0005JK-6U; Mon, 12 Feb 2024 08:26:52 +0000
Received: by outflank-mailman (input) for mailman id 679318;
 Mon, 12 Feb 2024 08:26:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZReN-0005JE-1E
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 08:26:51 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 773211d3-c980-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 09:26:49 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33b18099411so1667912f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 00:26:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e27-20020a5d595b000000b0033b80a0d002sm2718176wri.57.2024.02.12.00.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 00:26:48 -0800 (PST)
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
X-Inumbo-ID: 773211d3-c980-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707726408; x=1708331208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=od8jxRrRiKzPFlw+nYsHZiXd4nL03CPY77R8l36qlnM=;
        b=f2UwtqaIOspn4q0/sYdGbNCtnD05Vz4laB2SeQu3UeXBSrLAcyyRgN9Me4QsEvmC+7
         c/pT8/h6oPlHEJ8KIiRZPZRFd0EXk4/QZrtw+LFvNkmIgxSlSNFOAwpLNXLedrUC8+li
         q8ruW99diFdyG7UbXWyhq4lqjvp/wySgKLq4ev8IiVVsBjVNiHi22QJ86ykfTkurMHse
         wxYR+8//Xy0PIU5HwBs0cN0yWHzNj/hjs6cB65I0p1HnLE6V9OLXRBNrHCAvgeJe9nPf
         bMH8tGbhS5vHpexvBx0GAnsBD2KY0yeqUclDJXAx4gOqWg/pc1CyBtjuhM095c7i7jJU
         z9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707726408; x=1708331208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=od8jxRrRiKzPFlw+nYsHZiXd4nL03CPY77R8l36qlnM=;
        b=DCpDqXdiRi3iQYJsR4ouDhnNEaBllPrZ2qnCppvtebdnJrlNOhuRbTRoQyLEftff1N
         MSkE7/ksud3LvN2f4D4NWM61RbVHq8rleaOQbWICx/R1pS0AM0QmlE0NEXSMKw1ISycO
         6WtBM7eUfD1k8m/idi7x0HCi6DlMG0rE0CTU4HWK/QKaffl0oWEUZ44izM2X+enY2p9f
         cZxCRwdp5YPmYgLff5SasKd1H4glsajc8TWmTmLhD+0XSargOS7PjhwD8CKGlY3A4mfk
         cYw/LRLLnONdUZY0NCThKU0u3Q1qzbUPBR0P2bc4vzvgZw88NugfF6JXZOkkT2ylLvTD
         XmPQ==
X-Gm-Message-State: AOJu0YwsK+XzgQBi8Rr/YdUabRpGSy/nKdYEJ9XodRwZDgmFKjaGK+c2
	+hEOJscCQtWuw8Gshvi99RrHQgQ612LBpDgB5FklpEEKqblRo40Oj+xFjZIx4g==
X-Google-Smtp-Source: AGHT+IF3yJxQ1J/0ELE+vneMMG4VTpysjk6zLpvtcmFNo7kZ5SfDsAIvntxPehFeu3eBU9ns9niXmA==
X-Received: by 2002:a5d:43cc:0:b0:33b:43d7:14 with SMTP id v12-20020a5d43cc000000b0033b43d70014mr4280629wrr.61.1707726408231;
        Mon, 12 Feb 2024 00:26:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWt3TCUre5foUEvMAxJuqGUJiLN8XhBKjOtWUVGbafAsrlSLv8veySYZkSFV2rzeOXYrZi/lG+j3vkBFyOj9ILGlheyGOJHj8hzSdoTKSHbR9Hdsfe6paf+wB1mS1jyYfeow5ZIlc1xnBTZKz7E/LfK+emfnT84HTZfOsKhr/PSpPaZrcI5OpYi2UJDHweQXxcnz4hd636AwgjKOGdhIpuVmlXi4Rgcq7TGPnnf8TgOMBk9xJ+/uVdhqSX8z4HJiIWfizO7IktltiYriqeHzNWm0XUUqtHQ7ZOw7qTcP2/6FBYasxx1Bbe7N6i5lJqEQvg7YHCdorgcCYqwYRBRtnonHw==
Message-ID: <02446758-a5a9-4a8a-8ce6-15abdc9ede65@suse.com>
Date: Mon, 12 Feb 2024 09:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Return type of clean_and_invalidate_dcache_va_range
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen Devel <xen-devel@lists.xenproject.org>,
 Consulting <consulting@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper3 <andrew.cooper3@citrix.com>, Roger Pau
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <e050b096ff39aa857f9c267a8dbb4ef6@bugseng.com>
 <alpine.DEB.2.22.394.2402091402080.1925432@ubuntu-linux-20-04-desktop>
 <f86baad0-f113-4156-9c10-6910e8c63492@xen.org>
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
In-Reply-To: <f86baad0-f113-4156-9c10-6910e8c63492@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.02.2024 11:17, Julien Grall wrote:
> Hi,
> 
> On 09/02/2024 22:02, Stefano Stabellini wrote:
>> On Fri, 9 Feb 2024, Nicola Vetrini wrote:
>>> Hi all,
>>>
>>> In the context of violations of MISRA C:2012 Rule 17.7: "The value returned by
>>> a function having non-void return type shall be used", I was looking at the
>>> function "clean_and_invalidate_dcache_va_range". It has the following
>>> signature on both arm and x86:
>>>
>>> static inline int clean_and_invalidate_dcache_va_range
>>>      (const void *p, unsigned long size)
>>>
>>> The commit that introduced it for Arm ~9 years ago (71d64afe3e12: "arm: return
>>> int from *_dcache_va_range") [1] mentions that on Arm it can't fail, but
>>> supposedly it can on x86.
>>>
>>> However, as far as I can tell, for both arch-es the implementation now always
>>> returns 0 [2][3], so perhaps the mention of -EOPNOTSUPP for x86 is no longer
>>> true (I wasn't able to reconstruct if there was a time at which this was true,
>>> even in the same commit that changed the return type to int).
>>>
>>> The question is: should the return type be void, since it appears that every
>>> user is ignoring the returned value (violating the rule), except the one in
>>> common/grant_table.c [4]?
>>
>> Looking at the implementation on both ARM and x86, I am in favor of
>> changing the return type to void
> I think we need some consistency between all the cache flush helpers 
> (clean_and_invalidate_dcache_va_range, invalidate_dcache_va_range() and 
> clean_dcache_va_range()). They should all return a values or not return any.

+1

> That said, we have two other architectures in development. Are we saying 
> this helpers will not need to (initially) return -EOPNOTSUPP?

For "(initially)" that's not an issue - such a stub can as well be filled
for BUG_ON("unimplemented"). The question there is what the ultimate
implementations are going to look like.

Jan

