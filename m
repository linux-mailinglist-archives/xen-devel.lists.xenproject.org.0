Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A50FA05477
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 08:25:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866886.1278257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQR8-0002My-2C; Wed, 08 Jan 2025 07:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866886.1278257; Wed, 08 Jan 2025 07:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQR7-0002KQ-VV; Wed, 08 Jan 2025 07:25:05 +0000
Received: by outflank-mailman (input) for mailman id 866886;
 Wed, 08 Jan 2025 07:25:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVQR7-0002KK-1q
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 07:25:05 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad246169-cd91-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 08:25:03 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38a34e8410bso5585652f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 23:25:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8474b6sm52246534f8f.51.2025.01.07.23.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 23:25:02 -0800 (PST)
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
X-Inumbo-ID: ad246169-cd91-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736321102; x=1736925902; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e6c9Re305ngnHuLR+MfR+VGkPfepefdC520IxoryX0w=;
        b=NNq5J+w4Jx4RhrARy2Vw0RBvW8tIihddJw2tS0X/LNk5XyPJbuFTbZxQR3LmnpDHhX
         iT9/zLjL+g7Jb6DtrT4zYRU1YYWo5JqbpMhpEgNM+wmcqreTKQ0Vu0NSIuilrHfg93xp
         KNVfsOnVpRVRtlAlc+tV4HofWJfsXFlVu+6zKwgH51VcYN+KJ3Q0YSFZDGaUQfO8/V9G
         EzboK+GxKNMRr4kuJXIR+fWiRL2eGpbJMER+wTHFgcQBboiqCV8PSbwEiyilbjcPCTFR
         mbyR8E+EJOhH/GqaFBFm6KZHrGvaM2bImZj7zc49Mobhw4BaLOyyxikNBq9P+fdaosLU
         llWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736321102; x=1736925902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6c9Re305ngnHuLR+MfR+VGkPfepefdC520IxoryX0w=;
        b=Zr15ur0HYKKWnEPcxhtii9F40ZA1n6RgIkqmWGgAwuJM0XM7LyuYU1sQ0QK1xmyaQ0
         98QwXWA9k7cXi3ucpSCF21ir/y8qmtvg4XuKKgQKZStf+E3nNnn6quhxrfRCbF+zJX6P
         fhhDDWq+SW7tJXOvi51tBa0/bSefuUBoAWILfxRju/NpUqjRo/w7WdDAJDlV0uMrdlwP
         1HoZxDXtTrmjoON8wv5PTv7iF8viCBcd55fjPFPpQk1MQFqeVcQ1YpCtllHLShxb5fz2
         BKfWcSopHw3UtPZmcZynZ9KZTpzTJuQ3uOnif7jCKCRFgu+PIFQl4ANlVijCQ0piqzWT
         QvHg==
X-Forwarded-Encrypted: i=1; AJvYcCWTinKVlborDMrgQ2WxvnKLQ7XnnBjwsibM0snf0K9qIZAD2Baoroe/Y9EkMN+ZMb+86K+wkrP+SUI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzydVUKNCckd3s4Lx0627nAjFybNLRXHhuNYurou8IBgvaSn4N9
	MVdn48ASMac/BFSZi5rjq8KIPtlBGe3jYgQ0+pFZQ6qbYZP0OXB6zTpjapruGA==
X-Gm-Gg: ASbGncv82yB9wcjFIii16O4o3KIiYkal5/HVOx4EKL/wJjj3UuEy4yyg8iRa9sY3F1s
	bShae4cuE0gY0tyM55SxITC5eXXUNde1urWsTUCVl52yNqch5+D64O6kBfd0M6G+1X6FT3VZIY2
	uAgytDnm9dV7jwZ+JQkdpLZ53FrKGm4nbSe0g6/E8otOgo74bxTjzC4/EgE3jJ1Qw2DZHGgI1lX
	WTe5mNwTIHyWvhioaJlz0bbniIozAwtQOBgLLJAHSiH1W3KbdjLoNz1j2La00SswRn0uBQr8Jki
	wDIwKTwAp3XMInP4I5/AVuhAOV9YSYn9gf9mr4ih6Q==
X-Google-Smtp-Source: AGHT+IHI+zJaSYnUtnx3ffXj628DiGINoSX38eIgjlxJ1xAZap+LyjkhOZOyUcgglPp5R2J5fAYQsw==
X-Received: by 2002:a05:6000:1883:b0:385:e5d6:130c with SMTP id ffacd0b85a97d-38a87315989mr1143501f8f.51.1736321102519;
        Tue, 07 Jan 2025 23:25:02 -0800 (PST)
Message-ID: <ec92e932-e3b7-40ad-9ed3-2b3391cc63a7@suse.com>
Date: Wed, 8 Jan 2025 08:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: update pvcalls_front_accept prototype
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <alpine.DEB.2.22.394.2501061335161.133435@ubuntu-linux-20-04-desktop>
 <0f8fc348-14f5-40ac-912a-1785caedb675@suse.com>
 <alpine.DEB.2.22.394.2501071530180.133435@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2501071530180.133435@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2025 00:30, Stefano Stabellini wrote:
> On Tue, 7 Jan 2025, Jan Beulich wrote:
>> On 06.01.2025 22:36, Stefano Stabellini wrote:
>>> xen: update pvcalls_front_accept prototype
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>> ---
>>>
>>> Changes in v2:
>>> - also update pvcalls-front.c
>>
>> The patch still gives the impression of being incomplete: There's no
>> caller of the function that you update. However, there's no such caller
>> in the first place. Why don't you just delete the function then?
> 
> It is meant to be called from an out-of-tree module, which has not been
> upstreamed yet

And which then would require an EXPORT_SYMBOL() anyway. In Xen, as you're
well aware, such unreachable code would actually constitute a Misra
violation.

Without any in-tree caller, imo the change needs a non-empty description,
clarifying why the adjustment is wanted / needed.

Jan


