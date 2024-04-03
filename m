Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB678897270
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 16:23:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700563.1093918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs1Wi-0008C0-8O; Wed, 03 Apr 2024 14:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700563.1093918; Wed, 03 Apr 2024 14:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs1Wi-00089Z-4I; Wed, 03 Apr 2024 14:23:44 +0000
Received: by outflank-mailman (input) for mailman id 700563;
 Wed, 03 Apr 2024 14:23:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rs1Wg-00089R-7e
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 14:23:42 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5146282-f1c5-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 16:23:41 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-34356f794a5so2112819f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 07:23:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bo15-20020a056000068f00b00341e2146b53sm2164901wrb.106.2024.04.03.07.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 07:23:40 -0700 (PDT)
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
X-Inumbo-ID: c5146282-f1c5-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712154221; x=1712759021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9uehgPpGQPk19Eupp94FVs6OxGDprZtpacrbPLEgYPc=;
        b=RYbqoKDK2AlHiczUUHLtw8goJFMmIf7XAa52qI2bzVr3YNpnGtrNrvZHN/gR8vR3uw
         SIqVCtWDC63hBWi+VTZF/Jqxo+eDGtxTBgF3E8afowuoZjSo2MlLPSVv/6Jp092Ye95b
         TMYSZbEoycygUFLoBjm59/UsvfxNOoNyYVkrAW3J8g8wQmdyigpRSGP/QoVuEZwZS6wb
         CF/6owUotTG+oXVd62cHIO/5drmBMXWmQHX5lsBAODtlHBUIysfSHOQlz1n3BkUtA1O7
         Z6VB2TmnBm+tk0wVLgy/T4OHtZlYnQzCwDPgxOKheqBuuRLfLb/mUX8zaJnATyVPdGBC
         PIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712154221; x=1712759021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9uehgPpGQPk19Eupp94FVs6OxGDprZtpacrbPLEgYPc=;
        b=B61CTeFQMc+ovLg02TP/irgAdX4IJXJnSYVtlwtLJtPpur8CP31a5cFCjXXR8hxmpd
         kl+i+i7VcBjiAZi3dqXlkdlGEndDqR+2zXnGYTdZMNQQ5YEF1YQtRGQfYbfRs1UPPG1l
         4XV4xSR0Y3ui22mDJ6nZUGKpkHR+SxM56X5gFZP1rIJM/H6/7BUAL383jAd22oyJ/uSc
         xEiU/fycROrB4mGby+7tgGy/PhI6HpMAnuTT5H6N1koaIbASGjzVmxykKkIEtaFfAYzw
         tDWzfdzhl5+S58AmIbAfLvUutI7tR4PP5OQ9Ns7HVg6Arf9rJdi9jnRD9UoaC4ebfDMQ
         jvdA==
X-Forwarded-Encrypted: i=1; AJvYcCWloQ5z4CLGQoBoVFQgSt2Wf5BxGkFioQp4u3Ejgta+a9hndcF81woiH22AZaSLGcFTlJ7M8XWbT1AZpNus0LLEUNlZFsGiTaA2pwnKwas=
X-Gm-Message-State: AOJu0YxZ9NdlVkpXW4Q/kRqejXapC4DZgLfmPPHJjkdFG3Oc9pvVNKOj
	Am5615w2XMRhnSwdUQdtP7Bxqz9osv96JPsW+CxZf98wu14NrYbLL7FHJiimzg==
X-Google-Smtp-Source: AGHT+IEJ2FtkQUHudUuaq8eCZYw61RDPSBaA9hdvwhoIuEwKrm2xOeDVdp/B1HDI499AXSj/uFNuHA==
X-Received: by 2002:adf:fe43:0:b0:33f:6ec1:56dd with SMTP id m3-20020adffe43000000b0033f6ec156ddmr4517201wrs.45.1712154220851;
        Wed, 03 Apr 2024 07:23:40 -0700 (PDT)
Message-ID: <8e164054-ed31-40ab-82e7-77c0497ab684@suse.com>
Date: Wed, 3 Apr 2024 16:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.17.4
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b726b105-9204-4a72-8fbc-ceaa8e74f3ec@suse.com>
 <6feb56fe-769d-4809-b16f-6fc4d5477747@citrix.com>
 <f3ef0c54-e3e0-416c-953d-00c4df0c5d82@suse.com>
 <c28a3b6d-cfef-4b4e-9ddf-641142f2ea9c@citrix.com>
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
In-Reply-To: <c28a3b6d-cfef-4b4e-9ddf-641142f2ea9c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.04.2024 16:08, Andrew Cooper wrote:
> On 02/04/2024 3:26 pm, Jan Beulich wrote:
>> On 27.03.2024 13:33, Andrew Cooper wrote:
>>> 5) Ucode scan stability  (For 4.18 only)
>>>
>>> Xen 4.18 had "x86/ucode: Refresh raw CPU policy after microcode load" in
>>> it's .0 release, so should also gain:
>>>
>>> cf7fe8b72dea - x86/ucode: Fix stability of the raw CPU Policy rescan
>> This already is in 4.18.1, ...
>>
>>> I've only noticed because I've got them both backported to 4.17 in
>>> XenServer, but I don't think upstream wants to take that route.
>> ... while, as you suggest, not (and not intended to be) in 4.17.
> 
> Oh, so it is.  Although comparing my backport to what you put into 4.18,
> you also want
> 
> 930605f155cc - x86/ucode: Remove accidentally introduced tabs
> 
> which I apparently folded into my 4.17 backport.  I have a feeling I
> noticed at the point of doing the backport.

Well, no, if need be that can be folded into a future backport touching
that area again.

Jan

