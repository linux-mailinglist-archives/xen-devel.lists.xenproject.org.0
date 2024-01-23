Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C9A83905B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 14:43:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670483.1043291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSH3h-000582-LV; Tue, 23 Jan 2024 13:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670483.1043291; Tue, 23 Jan 2024 13:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSH3h-00056S-Id; Tue, 23 Jan 2024 13:43:21 +0000
Received: by outflank-mailman (input) for mailman id 670483;
 Tue, 23 Jan 2024 13:43:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSH3g-00056M-8K
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 13:43:20 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5df5fdc4-b9f5-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 14:43:19 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cddb2c2b54so42744591fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 05:43:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cv3-20020a056e023b8300b00362865d8591sm940079ilb.6.2024.01.23.05.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 05:43:18 -0800 (PST)
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
X-Inumbo-ID: 5df5fdc4-b9f5-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706017398; x=1706622198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1tS0w6p9g3sL/5YssAm6miZo36N75fZuBsDHZipCPSU=;
        b=UDJK6Q4MlpOJqOLE+Nkz+nmeHOZAGnxdfpNmmkIRFROQh42vaItG0HaUHfUk9zibdS
         i1T/mKYgHdT+148gSf7tj1iRoVOdLPcrnWpj/hNCZrovYJ3Cuc8cSQvibbhes5fyjsE8
         fpM+FTw8uqbpgkkzXTKnAcWwC/btW3xiicUZmbGp5af2FKdujtSNHVVw9h/rJHe8LE3P
         HukxqhZoyMpI/jE2oQEFJkHBH981ceC6fVjtlepqxhZvoOVp0tZ32Qz5LYl3tY32NcOZ
         sKKj4COKV25ybd2tFWYJjFnxp+i2KDNyvysvdYYGrHlXPZnA6sLb9nEqu4e+Wxe228Py
         8Ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706017398; x=1706622198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1tS0w6p9g3sL/5YssAm6miZo36N75fZuBsDHZipCPSU=;
        b=aMjfM+fJBr20OIcqMuxsy5wBvdGVGNlfZc4rpdt4x58MphI6PvTS0XyrvrD9o+NTQs
         9LVWSWH8Hh2X0VhrHWFQyldhu9G4TxWB3Ej1ybbU+3K+k30MMytsb3SJsQaiOyvZBLNh
         hIKJGHgb71VPXlmfk0Eup2HsCPMFPKgyTGt8J+KvM6705KWEdaF5j83kp6sCoT/bcQYx
         LanzW6zEpIeR6JPikeejqEEk0kiBpOZ/u9qPdfPfN2gOgumvTTFSs78GQMZGM9An+7GI
         dInWW4PEuN2OKHQqafUQPE22WQmSYT0SV1dM+0gAZrAQ3b6CceOAiKT+RzuV90fzg/VY
         w3pw==
X-Gm-Message-State: AOJu0Yxay8TBnyIi5bw1lNSS7eyBAp76PTBb067YlTkiuU3MrBa4gNHH
	kx48RBZe1xPXFxTU7syMgPjMH33ndHNT1lbHbPxkjGO98d1UHSk860h2YQBshg==
X-Google-Smtp-Source: AGHT+IGUKhiYMvG72NQl1/Gi1j9N3vMEowDRCqUxZiTWrUVVlrtiA87n/ri8Qmenibx9uSSvFaMBxg==
X-Received: by 2002:a05:651c:c9a:b0:2cd:3731:9c2d with SMTP id bz26-20020a05651c0c9a00b002cd37319c2dmr4244268ljb.83.1706017398478;
        Tue, 23 Jan 2024 05:43:18 -0800 (PST)
Message-ID: <ebdfc495-b8bc-4468-8b41-d5fdb2a85adb@suse.com>
Date: Tue, 23 Jan 2024 14:43:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/entry: Make #PF/NMI/INT0x82 more amenable to
 livepatching
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240122181714.1543738-1-andrew.cooper3@citrix.com>
 <20240122181714.1543738-3-andrew.cooper3@citrix.com>
 <0edeb969-6fef-46f4-b216-0858edbaefa6@suse.com> <Za_BF_wr0qWH5eKC@macbook>
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
In-Reply-To: <Za_BF_wr0qWH5eKC@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2024 14:37, Roger Pau Monné wrote:
> On Tue, Jan 23, 2024 at 10:22:10AM +0100, Jan Beulich wrote:
>> On 22.01.2024 19:17, Andrew Cooper wrote:
>>> It is bad form to have inter-function fallthrough.  It only functions right
>>> now because alignment padding bytes are NOPs.
>>
>> But that's a requirement anyway in executable sections.
> 
> Really?  I was under the impression we wanted to replace the padding
> nops with rets maybe, or even poison the padding with int3 or ud2.

Well, that would be a decision of ours. Which then imo can't be described as
"only functions right now because ..." The assembler can't[1] use other than
NOPs by default, as it can't know whether fall-through is intended.

Jan

[1] minus bugs - see e.g. https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=d164359dbc14c8ae4c7a117d236f5b7de4af671a


