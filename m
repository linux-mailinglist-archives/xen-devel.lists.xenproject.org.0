Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EFFB2B9D5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 08:49:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086350.1444534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoG9k-0005ha-H2; Tue, 19 Aug 2025 06:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086350.1444534; Tue, 19 Aug 2025 06:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoG9k-0005g4-Dq; Tue, 19 Aug 2025 06:49:16 +0000
Received: by outflank-mailman (input) for mailman id 1086350;
 Tue, 19 Aug 2025 06:49:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoG9j-0005fy-N8
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 06:49:15 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dd75710-7cc8-11f0-b898-0df219b8e170;
 Tue, 19 Aug 2025 08:49:13 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb78c77ebso797153166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 23:49:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdd016c61sm933938966b.96.2025.08.18.23.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 23:49:12 -0700 (PDT)
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
X-Inumbo-ID: 9dd75710-7cc8-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755586153; x=1756190953; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wBarrgEMrR/IqomEAJ4wp9bD4p+lvnS/sY/pWdD/wpQ=;
        b=Tbc3AbBKXE2Kv8obFaPwldAEyFIFgAbvfJ4ayWNX+pAA2xEXu0W4jwFrPs5h+WridC
         th7Q9xioOkVTOF0wEE9/dbO+SWKt/jXfUHyoNSBD4zsag0i1HDJr30P0l1pqsB0G16dq
         tBDQ9oU1Xhx1Uo7u5kh6qHNKYVkGqW9xZ7GeNqJFVtqsDCbdVJ2Jy2bDRVI5sYCNc2GW
         PIfdrSKw6/OkQtRrD2uFDKLACZG8zjGz3J5v5YsVFPZPNCWmxv6gI2boNx/KJ/3+naXv
         CbVpv90fW64iXZYkw1okYU+btP5tRLGhIAJYi13MoKE6XgvsWMTwBcu6FMdiCmMYZnq3
         kQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755586153; x=1756190953;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBarrgEMrR/IqomEAJ4wp9bD4p+lvnS/sY/pWdD/wpQ=;
        b=tfHdf2eMhCdvAZmIfSTDwwMAxNL/UmHM+twHuiaSyYc8soIqQz/VnE/3Sue8AsPZcg
         tis+9+WlYazgnddsP9D9fwnWvFdU5fhnovp1Lb9TKcZrRoTtf3AH4IXSSUdl3bIbYBie
         AZwZiskkQric8kA5hPnV84rgm/Fk2/jnxmpr00b2FzV1+oyyOR1VCuu7PBe8L2TkLXwH
         1Qf5g+rCQ84QbsRmEJLYaHGi0G7iqslkwQ2WX1JV5BuOAfWIcL444EcrMqYOrRW3GkvE
         ShYqKr9ML9nHcSreAWbfhh0t/UYyAhrAaK4IZUhizkaYGuJiYIwXpZQD5eUAtC6yN0JI
         c3hw==
X-Forwarded-Encrypted: i=1; AJvYcCXyISIH5VOdRK7gWDmT1fkqcydycBAncc1WnSgAQ20VTNCJoJexPq0POH1ctLr7zOEreI1zVTeiklQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdFsdGCY+6FOt0HQv3s1B7g7ivdrdNRFm256toHaWZpTJluFxe
	1tNp/PwrNusx/YjTXHw6yBuDaQi9NrpDixOHKavvp7Ovpd15RVjDvswPVoTdvM/Upg==
X-Gm-Gg: ASbGncv6JnorD1PLnA2LpWkZq91YztkpRXPhE2RQwTK6WhHRKeOPGLwq5MKbRc+rsWQ
	rGLuatHcIKYLLdC5ACCptwFd5m1DuyCCvdr4frs0lPNC/4QzOcd/SMnf+9NO53oYU5nyocTExl8
	KfAjN9MdpswPNiEZulH6LAB912LIx7JUWmZ9GOWv/qFCkEcsNzp659Q0RYnGFBYQxhRbctXpACs
	u19VNAwbezmFCJHh3AiA08kpl2vMit0ixT+YYwYxzuM4isE/P4nKz6IRWxrj6IyLWVIzqf1VVSA
	YI1xOS8oKzFMbLIAb3k36BakhfLUPmagTbxelwUBTbeMOH7BTYV19Bf7RnJ0Pl0KbAdeak1Zo1W
	TerMY6AqQySqI4nFHiT2p2TE68dPY0Fj28NVsiw+ditvvqcHVaO4cys7c8zBuxSFKOHWqZJF2T9
	Lw6WHl+NIQdz/dqjVbvw==
X-Google-Smtp-Source: AGHT+IHg5PmFJlc10kRTD1WrGwXnd5LdCRlW0m4E0i2E20B1MhOcBe6xzqFE9Qa7Xtso7egOuqb61A==
X-Received: by 2002:a17:906:c113:b0:af1:d32f:3e89 with SMTP id a640c23a62f3a-afddd0d276emr122218966b.31.1755586152891;
        Mon, 18 Aug 2025 23:49:12 -0700 (PDT)
Message-ID: <9a267d90-496c-496a-ab61-6b775204b594@suse.com>
Date: Tue, 19 Aug 2025 08:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Next steps for MISRA C Rule 17.7 in XEN
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
References: <6d622813-1617-4af3-876e-52a551518f68@epam.com>
 <9d71cc11-884d-4924-9de9-e3396801158a@suse.com>
 <c3bb91c6-ca74-4fab-8ca8-cd5ffed3f954@epam.com>
 <alpine.DEB.2.22.394.2508181642140.923618@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2508181642140.923618@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.08.2025 01:45, Stefano Stabellini wrote:
> On Mon, 18 Aug 2025, Dmytro Prokopchuk1 wrote:
>> On 8/4/25 11:02, Jan Beulich wrote:
>>> On 02.08.2025 19:48, Dmytro Prokopchuk1 wrote:
>>>> There are a lot of MISRA C R17.7 violations in the XEN.
>>>> This rule states: "The value returned by a function having non-void
>>>> return type shall be used".
>>>>
>>>> Actually, need to decide how to deal with these violations.
>>>> Quick analyze shown that there are different cases in XEN code base.
>>>
>>> Long ago, when we discussed the rules in a mainly abstract way, there already
>>> was quite a bit of discussion around this. Stefano - I wonder if you had
>>> taken (and have kept) notes back at the time?
>>>
>>> Jan
>>
>> Hi Stefano.
>>
>> This is a kind reminder.
> 
> Yes, I am appending below the unmodified notes which I took when we
> discussed R17.7. It looks like the decision was to accept the rule and
> use a mix of deviations and void casts to reach compliance.
> 
> 
> MISRA 17.7 Use expressions' results
> -----------------------------------
> 
> ACCEPT 17.7
> 
> Returning void when appropriate
> 
> When function results are used on some of the times. Use a comment to
> explain why the return value is ignored and a void cast so that the
> warning doesn't trigger (there is also a gcc warning).
> 
> Some functions are returning a value just for convenience (e.g. memcpy).
> They need to be deviated.
> 
> Add must_check to all functions by default somehow? So that developers
> will get automatic feedback when they do develpment without having to
> wait for ECLAIR

Isn't doing this "by default" equivalent to enabling the compiler warning?
If doing this by default (one way or another), it'll need to be clear how
to mark functions as "exceptions" (like memcpy() that you mention).

Jan

