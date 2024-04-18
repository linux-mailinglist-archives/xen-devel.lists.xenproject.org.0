Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1907D8A9E17
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 17:15:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708469.1107410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxTTk-0000LC-9L; Thu, 18 Apr 2024 15:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708469.1107410; Thu, 18 Apr 2024 15:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxTTk-0000HZ-66; Thu, 18 Apr 2024 15:15:12 +0000
Received: by outflank-mailman (input) for mailman id 708469;
 Thu, 18 Apr 2024 15:15:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxTTj-0000HS-4v
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 15:15:11 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7261a7f1-fd96-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 17:15:10 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-418a02562b3so7938815e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 08:15:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z2-20020adff742000000b00343ca138924sm2059697wrp.39.2024.04.18.08.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 08:15:09 -0700 (PDT)
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
X-Inumbo-ID: 7261a7f1-fd96-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713453310; x=1714058110; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=taCjJHscq++mcJI9P17No4unTObZIj9tjRwq3nSNEEc=;
        b=BfeJsvK0U5J3lZGc+6EmhmnL7cPjrdwSMWZd6Fn8NVlJbY+OgXvxLQQalQwqI++jH8
         B1g7w6sHE48isRx08A3TFD2s1N26MNNYvqzaz6cw+8LdUkWeLrw/aZHM4f8e6KfRtkAs
         72O+Xu7b66puqXn9J1VHoPorf2qzIBvWSVO5ZrEAHmJYruaBCjyGk1qeag/jxoojtJLv
         RPpo8IquFLvl+5+C3tCOIQWTpNZp11rn4IFi9Ctf7VCSB3e5r/uNZN3ZqnzQxf5yibL0
         zHLnnNKjv6Z3D38ge8d2s5/fzh4LJgs0Syad76zPRUZFiqCibv4F7o4dUVbKuMt74st6
         kclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713453310; x=1714058110;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=taCjJHscq++mcJI9P17No4unTObZIj9tjRwq3nSNEEc=;
        b=RBhMiYk6GytQz57S3aSPsyfXcYfAoPkghXHvPtqLCqVQlZCgAHmWLJ0Rlaha7O/0ff
         L+S65VuSG8TzuPcmqxIrvGskGXZ8CPSB/5sUM1fcMTra1Xa4LU56xiAz3xSM+dQwNH5L
         9kjzFc3Tc1fEAOotra77M2C6fH6n9mVxoEOZJzxgC1XZE7OMRkZdHFj4YhCOTeZxgEE3
         hAzldgnheG2BcQ5czBOOc7NRtESS91hIOFmgBpSwoOztKXCh2g6VP4zA7vpaSyZ9TfYr
         YEQ53fGSg4X3QlP8lInHZYEw6h6P7718lTMjqhdDHCCUgHhYu5gwKOlM2hdWAUMMj+Lv
         A6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMnYNrOlEkAXlOXHTS/41f4hZK+YPn61QGD/LTIiqOC70in7C9aQoZEkCx8VDcODsD0wqe+HDykIEXtXt91pgpgdhkhFZZeGDVRNnczo4=
X-Gm-Message-State: AOJu0YwaHh9u9srLSnerTuQkiL48SO4zLvzBVTrrY/XfFa/2l7dWh7b7
	JrYTE98MjlJaeVLSkUw794Mn8gRe13b4UBFpiAcM/pEMLSf2x1xPLOVjcZMdKQ==
X-Google-Smtp-Source: AGHT+IH7Pvlo8X6QVKZzRuy1heASdbKI15Xuj7heW6/Cy9Nmn8GUOXEd2sCwMZK3Cjs4dXTuXIeXlQ==
X-Received: by 2002:a5d:5986:0:b0:34a:2da1:c556 with SMTP id n6-20020a5d5986000000b0034a2da1c556mr1218464wri.37.1713453309685;
        Thu, 18 Apr 2024 08:15:09 -0700 (PDT)
Message-ID: <eb04d2c3-5667-4f71-a2a2-ee8e108c2880@suse.com>
Date: Thu, 18 Apr 2024 17:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair_analysis: substitute deprecated
 service
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <4850cedd9680e521cfac350930b24af19cdf1ab8.1713338908.git.nicola.vetrini@bugseng.com>
 <2d890f61-6f51-4d64-844e-24207805a65c@suse.com>
 <d0896c61235cb9f071cb0586fe87ee46@bugseng.com>
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
In-Reply-To: <d0896c61235cb9f071cb0586fe87ee46@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.04.2024 17:00, Nicola Vetrini wrote:
> On 2024-04-18 09:22, Jan Beulich wrote:
>> On 17.04.2024 16:51, Nicola Vetrini wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
>>> @@ -44,8 +44,8 @@
>>>  -doc_end
>>>
>>>  -doc_begin="See Section \"6.19 Structures with No Members\" of 
>>> "GCC_MANUAL"."
>>> --config=STD.emptrecd,behavior+={c99,GCC_ARM64,specified}
>>> --config=STD.emptrecd,behavior+={c99,GCC_X86_64,specified}
>>> +-config=STD.anonstct,behavior+={c99,GCC_ARM64,specified}
>>> +-config=STD.anonstct,behavior+={c99,GCC_X86_64,specified}
>>>  -doc_end
>>
>> I'm irritated by this, which may be in part because of too terse a 
>> description.
>> "emptrecd" looks like an abbreviation of "empty record" to me, in line 
>> with
>> "Structures with No Members". "anonstct" otoh looks an abbreviation of
>> "anonymous structures" to me, which is something different (structures 
>> without
>> names).
> 
> I'm afraid I can't do much about this. From a functionality standpoint 
> there is no difference for Xen.

What I'm pretty sure you can do is provide a patch description that
allows readers to understand anything seemingly (or actually) anomalous.

Jan

