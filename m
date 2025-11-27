Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3AC8D235
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 08:39:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173523.1498554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOWb8-0005VZ-RU; Thu, 27 Nov 2025 07:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173523.1498554; Thu, 27 Nov 2025 07:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOWb8-0005TH-Om; Thu, 27 Nov 2025 07:39:26 +0000
Received: by outflank-mailman (input) for mailman id 1173523;
 Thu, 27 Nov 2025 07:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOWb7-0005TB-NH
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 07:39:25 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30fe7e33-cb64-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 08:39:23 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-429c8632fcbso353672f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 23:39:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5168acsm1894341f8f.0.2025.11.26.23.39.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 23:39:21 -0800 (PST)
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
X-Inumbo-ID: 30fe7e33-cb64-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764229162; x=1764833962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8ACafBzmCu9nbCRl977gzD0nFRgFVoQMZhMwMbD1Kvs=;
        b=BOMNdIxTVNtGrKgHuHTSAB1tmzLriBF4tUdOANHy7pYGVZyLM1Sf77XE1JZ/nF5Wd6
         pJO2gE5WMjClO17SQ2A3uQWpxUZA9CVf1rRN/h6Qq2HZku427gLD1q0FNNlcRasRVRpp
         rbHSske3YnhbguoxlMV9v1KEEEHOZgqjIrOpzC8wsm7v6PbNqbTwMZ2nmjzEi5ssJlJq
         JZmUn+KXMnLPZSwsG8u5Nc+hS7vRDwOME/Dr9e20aXfd8yhE91y/NMR+Zlz17LPtomEd
         t3DQ+RfKxiAdLTcqju3Jl/nFbS/CO5eayf0wLJCv8U2e7jQtN4KRYhVCmLWt2pwzF/z+
         zDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764229162; x=1764833962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ACafBzmCu9nbCRl977gzD0nFRgFVoQMZhMwMbD1Kvs=;
        b=SmfBxxb9qjwkhJnaRQPR1jGBVmcmgyvbUGHg2lxd+N1wTykbg1lxrED+gJh5/ODQ9k
         2cnCPScWm4nDpFci15ncX5s1GNRL5gNbCtpuSC2vMasPe9ahWPDRuQk1I1bzmaEcMtKf
         jUW8mhSYQLswDgumrATVsvh3vHLl9VJ5R00PIRtXyC40pdN7Mzu1NN+1MrpqiymojRQk
         LCh2HSi0k+3xvHacfuXdfr/dbAmyAL1csU7V6BIRLKhTAGoL3xrwyKVCY1uzumlPYgnr
         ZdCOjN7q2ck0LdqGShT3a/OptF7SCEPDEgTLBDjlmGqbYoue8CQUyuIguSqlrwwxzLGy
         8Ljw==
X-Forwarded-Encrypted: i=1; AJvYcCUfIzOq36AM/TR3mbtI0qSo5QHINnZgUJ3KgbsATBCOKZ+3LZcdn/CoMIvk2ZFaU41cspeGHufojGs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUIE/VY2miGKgoORnJeNXIQCcrQdfK633/g/YbEIS0vaJBXE6H
	oZ8bcMRIHumVqNWmXsJlU507j5i9JrcJTiGWyJJphDbdsJroHxW8j/8fqNdyHJS3sA==
X-Gm-Gg: ASbGncuIuZyGrPBRvjCJLgwNUcUgpNAvY/XQygYqy666VDJ3knQ+RVYbc38RgzgXnu4
	XLA7PxOoTgFRwfSRkD6K4GJsHlsfQxAtf8y9a8XSbPlIWrAVhGWNIFR1rJrWJoBDVHg9m6H6sy9
	04JsYVSAtyNRcYZYisriRtKTjs15rlyjOu+r1QiPAdkYm3FUREhDPJvYfh2BqhrZAAs0MNodlF3
	JxVSCjAjUEhS3o2wqUCSl5/pK8DB76Cu1BHzdBq17zW/+n0olUxgACSwZW9ri0qf6Sw08bgn7G/
	9KB8+K5dUONjtPZM7Y5liqx8b8PyCkkZFD8FH8ax2zqBqCf1tZGxyyf9EM5k9B088mn8QuXGWxD
	lUW3d+eVa8CMhuTUZ9q7OROSxGU8jx7+tWTxjq6v5jwSZ4Lfcw/JBbHUo4c6zNPI8caBd9D6Jad
	k0PUw4M2tqTAz4T0ebh0vfhj9weN0qgDNnFbaars8R/W6MCocSmegAdh7xg3EqBlyVJC/v3BYi2
	b8=
X-Google-Smtp-Source: AGHT+IGMv9zN7mIBo+LJR8i7YWb7BSvjFAzkBHWcfKZQmiNxhCK5LpmYYGRyKOmS+aYGgGgZ7LLJhQ==
X-Received: by 2002:a05:6000:2303:b0:429:c14f:5f7d with SMTP id ffacd0b85a97d-42cc1cf3b24mr23519729f8f.29.1764229162127;
        Wed, 26 Nov 2025 23:39:22 -0800 (PST)
Message-ID: <dc20f31b-5f2c-47ae-b188-f72b34fdac47@suse.com>
Date: Thu, 27 Nov 2025 08:39:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/amd: Use setup_force_cpu_cap() for BTC_NO
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
 <20251126132220.881028-2-andrew.cooper3@citrix.com>
 <ab8dc060-7707-4ff3-a413-730555aefeee@suse.com>
 <fc9adc57-bb95-484a-9461-0751dc91cb1b@citrix.com>
 <9c72cfb3-ed12-4955-817b-84d7c33587af@suse.com>
 <b86968a2-0e61-4d35-a54f-71dc0ce3877c@citrix.com>
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
In-Reply-To: <b86968a2-0e61-4d35-a54f-71dc0ce3877c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2025 17:33, Andrew Cooper wrote:
> On 26/11/2025 3:25 pm, Jan Beulich wrote:
>> On 26.11.2025 16:12, Andrew Cooper wrote:
>>> On 26/11/2025 2:19 pm, Jan Beulich wrote:
>>>> On 26.11.2025 14:22, Andrew Cooper wrote:
>>>>> When re-scanning features,
>>>> What exactly do you mean with this, outside of XenServer (i.e. upstream)? The
>>>> only thing I can think of is recheck_cpu_features(), which calls identify_cpu()
>>>> and hence init_amd(). Thus ...
>>>>
>>>>> forced caps are taken into account but unforced
>>>>> such as this are not.  This causes BTC_NO to go missing, and for the system to
>>>>> appear to have lost features.
>>>> ... I don't really follow where features might be lost.
>>> Well - it's a feature that we started upstreaming and I still hope to
>>> finish in some copious free time.
>>>
>>> Already upstream, we rescan the Raw CPU policy after microcode load. 
>>> That has had fixes such as dis-engaging CPUID Masking/Overriding so the
>>> Raw policy comes out accurate.
>> Yet that doesn't take forced features into account afaics. So at the very
>> least this needs to come with a description which more accurately describes
>> what (if anything) is actually being fixed / altered upstream.
> 
> I don't know what more you want me to say.  It's not a problem per say
> in upstream, but it does come about because BTC_NO is handled
> inconsistently to the other FOO_NO bits.

First, it still is unclear to me how "When re-scanning features, forced caps
are taken into account" applies to upstream. As a a result, "This causes
BTC_NO to go missing" is unclear as well. Both aspects need to be clear from
the description alone.

Further, while indeed BTC_NO is the only *_NO one set by means of __set_bit(),
an (apparently) similar issue exists for SRSO_US_NO, in it being cleared by
__clear_bit(). How that goes together with the feature elsewhere being forced
on I can't immediately tell.

> recheck_cpu_features() papers over the issue by re-invoking
> identify_cpu().

This isn't papering over anything. We do the normal identification, to then
compare its results with the ones obtained during boot.

>  It's necessary for S3 resume because all of
> init_$VENDOR() really is needed, but it looks bogus in
> smp_store_cpu_info() because it's repeating work done immediately prior
> in start_secondary().

What is it that is done there "immediately prior"? I see smp_callin()
calling smp_store_cpu_info() alone, which in turn calls either
identify_cpu() or recheck_cpu_features(). Nothing being repeated afaics.
There is an earlier call to cpu_init(), but that doesn't collect any
feature info. (Perhaps we have a latent ordering problem there, as in
principle feature dependent setup would better come after determining what
features are available. The only feature dependent operations there look to
be PKRU clearing and skinit_enable_intr(), so hopefully not an active issue;
certainly not as long as the system is symmetric.)

Jan

