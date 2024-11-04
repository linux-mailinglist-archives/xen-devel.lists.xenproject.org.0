Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C10D9BAE55
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 09:42:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829874.1244782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7seD-0005nu-VI; Mon, 04 Nov 2024 08:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829874.1244782; Mon, 04 Nov 2024 08:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7seD-0005mQ-SH; Mon, 04 Nov 2024 08:41:17 +0000
Received: by outflank-mailman (input) for mailman id 829874;
 Mon, 04 Nov 2024 08:41:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t7seD-0005mK-5L
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 08:41:17 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a750692-9a88-11ef-99a3-01e77a169b0f;
 Mon, 04 Nov 2024 09:41:10 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37d6a2aa748so2215203f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2024 00:41:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e61f9sm12551165f8f.58.2024.11.04.00.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 00:41:09 -0800 (PST)
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
X-Inumbo-ID: 8a750692-9a88-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmYiLCJoZWxvIjoibWFpbC13cjEteDQyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhhNzUwNjkyLTlhODgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNzA5NjcwLjMyNDA3Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730709670; x=1731314470; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DMM9VuaIc4L1j8F1oSTa5gybu2ntSycJv3SP8sOPJDA=;
        b=Svr2SZvCwkOSsm2QJ8t1RiwlT0oyel+cT2Iruk6nqY92zKgHzAaYmY5hGViD0lBzeK
         ol9dZdRNyTQhO2pdJmeTw6YontUlgaXl6gEM1jv4OFjl3y3Rbkwb4th0eAdKvOuEwzx2
         vdOqQLn974lUT6qAgKCNmRpj5j2V1OCaYrIB1aXvOiDDyNi3wxlXuc/ZEdZEyZLXt5w5
         rcgbzXCvJDkImsyyMGGt/2biJ+G0xTBWI0Jf0OfK9cIcwHwydXd4VHsmH0oWfVDmoQEj
         wf8qqZ3Xw9d5elHCv7zSWb2VTsWaXTfiemUx5VtOrDi3Gf4UdeVtLLKRrn20GJGCFXaJ
         dDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730709670; x=1731314470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMM9VuaIc4L1j8F1oSTa5gybu2ntSycJv3SP8sOPJDA=;
        b=sydCce7jhZWeA2I1/Pc55jDmIFy65vkoObmzGR+tnUzbEvrvc+g9POpQKyAo6q7e48
         3vXglO7RRURuJVKsJLnDzeJEvJ64UBYFDHy21gnRCUddwoRQD/2pkldyBAeLaZbaufAS
         +CVRXTMr9CEMGHoFhVuEpI8DnqQLnE66MXuWMGL4mPkvFzqiOXFq1+DEagaN3BvQZ1FX
         VsOQYB8ekKPsHqIQBv1iH3xmrqrT+lGHl+48fpz7TAa9MKkERajr0YmMJAoDDngze0T4
         +yjF4/KvZR1XVeM6HRjSvy5fFSMbzOP6sHlL8fpLznt9djgX/OWTSAqWbPNPqMKvssvx
         UVbw==
X-Forwarded-Encrypted: i=1; AJvYcCUgl94UXgA0Ct5SAU39gSTXxKcNYiUa+uMZwi6Btopun9nBUxMf4SX9ykDRkzV4dV2p1PbUtg0zpto=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJfvS61T33/pLX+2PWp5yFGn2BKVkWBrWQ+eaFVyVXV7maXGz6
	seYU50NB4DZ1eHdFiIrgJKHjqeDFSh/GRiM0LmB10QnWfQjAGV+4csRBC67WVg==
X-Google-Smtp-Source: AGHT+IE78VC7BVDITQYaK2UzNsWGNwjau12vMfJ0zzQkqeCztfhh5vRMjfLh/3A7ucXCo7R3L13orA==
X-Received: by 2002:a05:6000:78a:b0:37c:d299:b5f0 with SMTP id ffacd0b85a97d-381c7ae0a06mr7305806f8f.59.1730709669668;
        Mon, 04 Nov 2024 00:41:09 -0800 (PST)
Message-ID: <b04fb1c2-7b62-49ec-93a0-452edd241d4a@suse.com>
Date: Mon, 4 Nov 2024 09:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] Boot modules for Hyperlaunch
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, xen-devel@lists.xenproject.org
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241102172551.17233-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.11.2024 18:25, Daniel P. Smith wrote:
> The Boot Modules for Hyperlaunch series is an effort to split out preliminary
> changes necessary for the introduction of the Hyperlaunch domain builder
> logic. These preliminary changes revolve around introducing the struct
> boot_module and struct boot_domain structures. This includes converting the
> dom0 construction path to use these structures. These abstractions lay the
> groundwork to transform and extend the dom0 construction logic into a limited,
> but general domain builder.
> 
> The splitting of Hyperlaunch into a set of series are twofold, to reduce the
> effort in reviewing a much larger series, and to reduce the effort in handling
> the knock-on effects to the construction logic from requested review changes.
> 
> Much thanks to AMD for supporting this work.
> 
> !!NOTE on v8!!
> For this version a complete re-organization of the changes were made with the
> concept that three tasks were being carried out that were intertwined in the past
> versions. These three tasks were 1. capturing the state tracking and
> enrichment, 2. removing the use of module_t to track where a boot module is
> located in memory, and 3. abstract the domain construction state. The first
> eight patches address task 1, task 2 is address with patch nine, and the
> remaining addresses task 3.

Just to mention it - a v8 tag would also have been nice in the mail thread
subjects.

Jan

