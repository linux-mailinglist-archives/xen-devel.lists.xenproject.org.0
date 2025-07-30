Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA58B15BBC
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 11:34:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063617.1429336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3CI-0001ug-TN; Wed, 30 Jul 2025 09:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063617.1429336; Wed, 30 Jul 2025 09:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3CI-0001sS-Pa; Wed, 30 Jul 2025 09:34:06 +0000
Received: by outflank-mailman (input) for mailman id 1063617;
 Wed, 30 Jul 2025 09:34:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh3CH-0001sM-5y
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 09:34:05 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 545cf144-6d28-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 11:34:03 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b791736d12so1234466f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 02:34:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-240724ccd5fsm34453315ad.195.2025.07.30.02.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 02:34:01 -0700 (PDT)
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
X-Inumbo-ID: 545cf144-6d28-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753868042; x=1754472842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VAcIY4fYd27JybjlpMDc/qpLue1OLEu3uYaTc55NmAE=;
        b=O0w6CRqnNuWVZpyLdJPXLvyJbj2FDL7dZQZ5l9zwAjyjmvxLCsTxlyhlg9hoTwCu7v
         XN6S3OarOap0VpgffF4vJokY9AZHGxTin/Q5AWLdG2uwQNesf2qhPdeN2ItYnz6YyRqA
         3P+FWQJt2ED7W4kkrC5CB81WuhWwmYk7XkAcqmxXqBIyODUan+RRNk4ZxH9mW3E0s9nF
         +CJ2WaLtOQfv57C85WLYtr7j+7PUlGOhfcVVEhAh6QdMck3cbkFX//mwAQO8a/C877zw
         8UeWl/6kmmmFtYSLVnMlmqub/MBSROlmBdK9XhMfTitfzTIF20L2pRRZ3rKtX/Pzk0Jr
         481g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753868042; x=1754472842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAcIY4fYd27JybjlpMDc/qpLue1OLEu3uYaTc55NmAE=;
        b=nUYQVJ08ZAblnnetUgO/ZqpmO/HQQFAaapfpBroG3XYvpb9g9nWDkBOvMd2peuIeZJ
         6F0DxJvllgdPWZmsBS3aAGTNlJM5iGdqW17eEOfuhZDvk1oIqbx+bRWUThbQchm7Meek
         Y/0qaUSvYmV0L7TvQXM7pGHkc6N0GNLFI8u6cvoeQo3mPNAHAq7iVX4xmDTcRoPAATkb
         AbTdL8u0Y58eHhcFBJ/8sZCy+B/1VFoeAIh+1mj3t1R99ngRnVmf/BSo5yTCmM22+0B5
         0Rdd9+pVazNsYV9z4V64SFdqKQswBp9jh2bh32n9P/sn6qxTDqK7ofEJBjwkdi5XiBxt
         fqYA==
X-Forwarded-Encrypted: i=1; AJvYcCVEHcMaRkShnwUnEr8nsMQ/97dxbRtBiFp7uOPlHmTN1+h+CAiU+No6ufUOf9N2+b3h7yMHNQSea5c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwIyFP4zctZgFXdJ/fVlZnEH5ec4NQ0vbmzBYZ+bOq14LwNi/Cg
	f3ukQN2Ei6AsKewRLpxH4WJDY4hbkpuCtjqo5izy797wLnl/KE0eJkhFtl7H4QMNaA==
X-Gm-Gg: ASbGncv4uUYiqb2V2OGlHf5uHhERO2DqsYtG8Iy2qeIs5VdivLojzCkeP1XlODygwgD
	hG/R0LOXyvWhv0VOkgIO1hYRBcD5QPiWnC7uLWH8BwBKxQFJ+7irJ6jyCdM2wzPa8XWBDkcSOSU
	nFmbe+xZO0Yb9kFS9cVVsIVpI9gdm0usSqdYGLWeeG5zTT++yFTsyDQM5GFuHG+g1YPebWhBT2C
	7976ohlWdf6j8Tb0XdAL8BQJ8uw3G0Km8WP75TQDW/WcG9ezcNXyEL3UC166repBwzxbwkaGMzC
	xh4Ru4Up7BpXEy5O3PjnnvdelqOPEzysAVZA+V/7H+HaItfteGkPO5+Tkx3xmjPcWPDlm/G1eMQ
	FDVVRZ+kFC9NCrqeUUzaxxqIQy9LPaU9HNu2PKXdramv5EBfmBqk22720zm1uyqlh+8yFAf5hfa
	Q5yOJkrBM=
X-Google-Smtp-Source: AGHT+IFMhgazJAhXXGnEhDwiiw1jTsvDIaMawwWh9ndRxlOxUNdX5mShJDBZ1Cv8r1QouRaEFH2QTg==
X-Received: by 2002:a5d:5d8a:0:b0:3b7:8c98:2f4c with SMTP id ffacd0b85a97d-3b794ffe7d0mr2050311f8f.33.1753868042365;
        Wed, 30 Jul 2025 02:34:02 -0700 (PDT)
Message-ID: <36bc617e-bdc1-4e6e-8c86-2f8a0761a8ae@suse.com>
Date: Wed, 30 Jul 2025 11:33:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: drop size parameter from sort()'s swap callback
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fe3b486e-5122-4196-810b-38b3a58233bb@suse.com>
 <94ca0714-ee52-4d6c-ba4d-717594e83179@citrix.com>
 <d59dc52b-257c-4b41-a6e8-4f56955d6ed2@suse.com>
 <1586378c-1b48-4174-b9b2-3c3736c88921@citrix.com>
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
In-Reply-To: <1586378c-1b48-4174-b9b2-3c3736c88921@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2025 11:29, Andrew Cooper wrote:
> On 29/07/2025 3:44 pm, Jan Beulich wrote:
>> On 29.07.2025 16:29, Andrew Cooper wrote:
>>> On 29/07/2025 3:26 pm, Jan Beulich wrote:
>>>> This was needed only for generic_swap(), which disappeared in
>>>> 8cb0341a61fa ("xen/sort: Switch to an extern inline implementation").
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Oh, nice.
>>>
>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Thanks.
>>
>>> I'd expect there to be no change in generated code here, as everything
>>> gets inlined.
>> Not really, no. With the change in place, both gcc7 and gcc14 consider the
>> inlining of swap_ex() (in x86'es extable.c) as less beneficial, and hence
>> (like cmp_ex()) an out-of-line function appears, while overall code size
>> reduces. I expect that's because inlining decisions are taken based on
>> some intermediate internal representation rather than based on the code
>> that would ultimately be generated. And that intermediate internal
>> representation now changes, resulting in less of a win by doing the
>> inlining.
> 
> Hmm.  We might consider __always_inline,

I would actually expect a compiler to oppose to an always-inline function
to have its address taken.

> although it seems like gcc12
> does decide to inline them with this patch as-is.

Interesting how things can move back and forth between versions ...

Jan

