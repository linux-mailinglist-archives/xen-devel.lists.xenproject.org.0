Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163A6D3A2B2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 10:20:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208043.1520266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhlQD-0001u8-0W; Mon, 19 Jan 2026 09:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208043.1520266; Mon, 19 Jan 2026 09:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhlQC-0001s2-TD; Mon, 19 Jan 2026 09:19:40 +0000
Received: by outflank-mailman (input) for mailman id 1208043;
 Mon, 19 Jan 2026 09:19:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhlQB-0001rt-Kk
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 09:19:39 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df865e16-f517-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 10:18:53 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-430f5ecaa08so1861784f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 01:18:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435696fbea8sm22044717f8f.0.2026.01.19.01.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 01:18:52 -0800 (PST)
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
X-Inumbo-ID: df865e16-f517-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768814333; x=1769419133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FzJUUhx0YFkyNyXnl48dPOe60KcyB1we55lVdUo7lsU=;
        b=GJb5PM7ubFxucxFYVHDOYa6KkdjBK52DJa1tm7N+9engG6MGlS8pZzZQEmfrD58+Rc
         H70uQZdGFg/Vcec3q5zleDPSo9vMqsfPCFogt9s4dOKSFpmIHnELp6KsUE0MX01KNoMa
         5qil65oL167QsFhUEuKWl8cUbjq5VngwJ0CkQU4W6tvmYamQYFEpWSXPPsIspn2idqyv
         B1KYL6a/whc/k3824UwEed5Uk+WGDH6tBhmWo2BQbjmxw/w6KPb501iE940y27PUn5lB
         QwOKn7xi5y7T0r9ZbgEjwYQKaRqFf1isGRVbSJq9U4wdFR1otqYfjhOP+SGtVE7m7Uwi
         QD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768814333; x=1769419133;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzJUUhx0YFkyNyXnl48dPOe60KcyB1we55lVdUo7lsU=;
        b=TQDunTzxc2F0DNQoFi76J3eLDJgOdILKt/WIVD9jn/o8UoC7bGIz9apI9WSx2fbE0V
         /iC9WLd39Och74jKqCFrshIw4RxLuDUsX2tgEG9Uno9Fql8zeXTgLlzs6VT2xqD+dAU+
         JBVBaC7g9cKdK0Bzukx0px3TYd9g1G/skpFj+9yXtOimvgDdH7esG099XF9xckTwxPcK
         EhF860SUHiZlZbL//nbeEVMonCcnJDdpvL8gxwVxDqPBRIypW8h319GrfM5pX1UaIgFM
         0v4/4/lcYOpF2vLfZFMdqul5T/lsbJgUsTptlRLUaZ4FmCJ1fxs3buw6efvRuWlcVX//
         MIZA==
X-Forwarded-Encrypted: i=1; AJvYcCUw3Ed/X4gj6GwIWMcGP21eL9XrBetwJFCj4LLlrLXFggtnh7OrQHV7+fEla3zQ7+NJBXP3GM+1rFc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyd2/fhqe9PUqIU4dXPzdiyE+CeUuWoZbh6FYvm8wLDsvOYCI/+
	OTDBbu4PJxbL1HDisxRXziaPI1amENYwFcXNiFsZgrMneQmmu4mKrijPy0HBkHmi0w==
X-Gm-Gg: AZuq6aIBbNE25a9g0QjV4FSQYGxRGhtiqMVdlXbqRrKQ6xvwf3t1rW4k6Ux5LcX8L6c
	GOD+x5SeyKrrLCAaQZsK67hFjtzs5PCh8fL38hWK7iBJSu678VvNb8gOWtzl13bQdhx61OXz0+G
	41coNe6dubujE77SITcRVox8tbrV3KT7A34BJjx7OHl7yPRiRV4eU/bZLCdWOaYeEGXXCsIOv4o
	xnwSqRPFMWM8DKLb6qx0TMdzutukgnxlRnOXSW6TwAtkrpwY2QFXRGxU3YEu44s1+qz2OwhTP8o
	jcF785MqpWq/Sfi+aLd7CUHUGgC9kezA5kY64dmNsmaLVRr2s9itgXx3/izkBe9mA1Q61HzTnJ2
	d5QNaWG5NcM6wCl6SL1NxI6hbr1uKvKoq58ZwLgBs8Wh6naDhVVo8OCICc0e/C0HJe4WnGUJNSv
	6wZzJrQN+PYo3imvzDk3cLMMraqmYktlrXzK4YcOiTJ9vAfspgLJ/CjS2Ev/24ufnuwCvrqsTxj
	L6Ma7YjADxgnw==
X-Received: by 2002:a05:6000:25c7:b0:432:5bf9:cf15 with SMTP id ffacd0b85a97d-4356a024907mr15592645f8f.5.1768814332648;
        Mon, 19 Jan 2026 01:18:52 -0800 (PST)
Message-ID: <e4d98436-1388-49f1-905f-13709e7d0165@suse.com>
Date: Mon, 19 Jan 2026 10:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altp2m: altp2m_get_effective_entry() should honor
 ap2m->default_access
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>,
 =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
References: <dbab519006501b3971fa913310a06755a14c4548.1767982955.git.w1benny@gmail.com>
 <ec57461b-dde6-413d-a825-3538f46a1209@suse.com>
 <1916d0a7-ff9a-49f1-8564-2767226fca9c@citrix.com>
 <f0dcc4e7-3053-4386-a162-579ecf68240f@suse.com>
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
In-Reply-To: <f0dcc4e7-3053-4386-a162-579ecf68240f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 12:24, Jan Beulich wrote:
> On 12.01.2026 12:18, Andrew Cooper wrote:
>> On 12/01/2026 11:09 am, Jan Beulich wrote:
>>> On 09.01.2026 19:28, Petr Beneš wrote:
>>>> From: Petr Beneš <w1benny@gmail.com>
>>>>
>>>> Commit 7e5b662 fixed p2m_altp2m_get_or_propagate() to use the altp2m's
>>>> default_access when propagating entries from the host p2m. However, the same
>>>> fix was not applied to altp2m_get_effective_entry(), which has the same issue.
>>>>
>>>> When altp2m_get_effective_entry() prepopulates a superpage from the host
>>>> p2m, it incorrectly uses the host p2m's access permissions instead of
>>>> the altp2m's default_access. This causes problems when the superpage is
>>>> later split (e.g., when setting mem_access on a specific 4K page): all
>>>> 512 entries inherit the host p2m's access rights instead of the altp2m's
>>>> default_access.
>>>>
>>>> This issue became apparent after commit 50baf2d, which causes the host p2m
>>>> to use superpages more frequently. Before that commit, the host p2m
>>>> typically had 4K entries after VM restore, so the prepopulate branch was
>>>> rarely taken.
>>>>
>>>> Symptoms include memory-access events firing for unexpected pages when
>>>> using VMI tools with altp2m, particularly after VM resume.
>>>> The issue can be worked around by booting with "hap_1gb=0 hap_2mb=0".
>>>>
>>>> Fixes: 7e5b662 ("x86/altp2m: p2m_altp2m_get_or_propagate() should honor ap2m->default_access")
>>> You didn't even Cc Tamas, who I think once again will need to ack this.
>>> Already with the referenced change I didn't quite understand the
>>> reasoning.
>>>
>>> However, two formal points: Please use 12-digit hashes, as demanded by
>>> sending-patches.pandoc. Plus I don't think Fixes: is quite right here.
>>> That earlier change of yours didn't mean to do more than it did, by its
>>> title and description. We relatively recently introduced Amends:, which
>>> may be a suitable fit here.
>>
>> I beg your pardon?  Fixes are and Amends are synonyms.
> 
> This is news to me. To me a "fix" addresses a bug in the referenced commit.
> Whereas making a related change which isn't strictly a bugfix to the
> referenced earlier change is what Amends: was introduced for. If both were
> synonyms, why would you not have objected to the introduction of Amends:?

Having thought about this some more, would Complements: or Supplements:
possibly better suit you?

Jan

