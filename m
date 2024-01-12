Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9FF82BBEF
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 08:43:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666672.1037456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOCBX-0001FX-7M; Fri, 12 Jan 2024 07:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666672.1037456; Fri, 12 Jan 2024 07:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOCBX-0001De-3y; Fri, 12 Jan 2024 07:42:35 +0000
Received: by outflank-mailman (input) for mailman id 666672;
 Fri, 12 Jan 2024 07:42:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnUc=IW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rOCBV-0001DW-Gb
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 07:42:33 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22d844b0-b11e-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 08:42:28 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-336c8ab0b20so5278496f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 23:42:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m7-20020a5d4a07000000b003365fc41bcasm3072184wrq.51.2024.01.11.23.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 23:42:28 -0800 (PST)
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
X-Inumbo-ID: 22d844b0-b11e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705045348; x=1705650148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QT1C3FSHhpricvIXjSOLqDvVjkwYhGsA2Lvue9KpjtE=;
        b=aK7p8QTyzjDgpTceEScEu6CuDpZickdIui1olR/NrefpjNtNG/ambaC7wNusNvmj1m
         1GRj8SWy4f/7w0Fm9134GT29WXNVDzT2dnMRBAi6nZMboaqYgvVLclwXx6bCRaQmgsi8
         nUcfdypb+EithBKepDb486QEJOwouzkRlwoLLrJPGaYhNly8W9KjEIO3axjwfCc6ZImg
         yP731moeFPGqLnvz4S7FwUV7cDex0NIrDGVsb3n5NQ6OjRphlDqK+ARBubRIaENpyjuU
         E4ar2MGvDsUEmAmbAIg/WSrN4JGPF6RA17WICiCW8MAlbQ6VM28dwBSJUbEQAaCfxc/n
         hE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705045348; x=1705650148;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QT1C3FSHhpricvIXjSOLqDvVjkwYhGsA2Lvue9KpjtE=;
        b=FtlZq38RF0gC4ApgtrJmgvymyUEgM3QwhffEs8h+yaL+QO9jTuvZJDtL2FBq+xm/A+
         Am34/mKTHzNEM+69DK1z4d0QIoHEcqfT8fVobMwNJEfLDZt6HlXohIrh2VEgsGBg5uVz
         GQHajjaie6bNDMsxIre1rAiOl2u5Y4YEbF7OdMiywt1YFRbJ6UTjrLyC9m7psshcc6lh
         9SQmrOzMSEZ+pl7ZupVWOzNyBT9iZ5fh9KQV0zE6kkgFFV4+1gIT6IfD6Nc/LyMlhGxG
         P/eAAqKARxP+TZyrdVy5VarUz8DFgJVhennv8HHcTI24kfKl6BkEI3bxyzdnhmP6jmy2
         J+pQ==
X-Gm-Message-State: AOJu0YwnXqJfJWA67/ehDbI2v8sVEPZ9gMLi/auXrHRlLzoKGCHjx6JG
	NwXBGPbnE12HkaS457ONDSjdQr80jeMF
X-Google-Smtp-Source: AGHT+IF9RKB1JJGMykkGp3gseV4nZ5D3UvLKRjAJ+oDAj6drkh53PjsNjllv9mOjGz4jpkR5MZvT+g==
X-Received: by 2002:a05:6000:10c8:b0:337:7bde:f03e with SMTP id b8-20020a05600010c800b003377bdef03emr550310wrx.16.1705045348359;
        Thu, 11 Jan 2024 23:42:28 -0800 (PST)
Message-ID: <b2412d90-e368-405f-813f-20a95f99ff21@suse.com>
Date: Fri, 12 Jan 2024 08:42:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/intel: ensure Global Performance Counter Control
 is setup correctly
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240111090821.67594-1-roger.pau@citrix.com>
 <3428928a-42d0-4e4b-9607-c184968c309d@suse.com> <ZZ_FjFa9mILtDZgv@macbook>
 <645e0c95-5a12-4202-8da6-3cc789a9e5c7@suse.com> <ZZ_di8pZB8bWtBuX@macbook>
 <b1e76a5f-297b-4030-a69e-33cdf179c0ce@suse.com> <ZZ_4HSvdg0R9Dv1Y@macbook>
 <4574c9d6-eb6d-4b73-a9e1-20b5635b32db@suse.com> <ZaAdEqHzbD8L_mRo@macbook>
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
In-Reply-To: <ZaAdEqHzbD8L_mRo@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.01.2024 17:53, Roger Pau Monné wrote:
> On Thu, Jan 11, 2024 at 04:52:04PM +0100, Jan Beulich wrote:
>> On 11.01.2024 15:15, Roger Pau Monné wrote:
>>> On Thu, Jan 11, 2024 at 03:01:01PM +0100, Jan Beulich wrote:
>>>> On 11.01.2024 13:22, Roger Pau Monné wrote:
>>>>> Oh, indeed, can adjust on this same patch if that's OK (seeing as the
>>>>> issue was already there previous to my change).
>>>>
>>>> Well, I'm getting the impression that it was deliberate there, i.e. set
>>>> setting of the feature flag may want to remain thus constrained.
>>>
>>> Hm, I find it weird, but the original commit message doesn't help at
>>> all.  Xen itself only uses PMC0, and I don't find any other
>>> justification in the current code to require at least 2 counters in
>>> order to expose arch performance monitoring to be present.
>>>
>>> Looking at the SDM vol3, the figures there only contain PMC0 and PMC1,
>>> so someone only reading that manual might assume there must always be
>>> 2 global PMCs?
>>
>> That may have been the impression at the time. It may have been wrong
>> already back then, or ...
>>
>>> (vol4 clarifies the that the number of global PMCs is variable).
>>
>> ... it may have been clarified in the SDM later on. My vague guess is
>> that the > 1 check was to skip what may have been "obviously buggy"
>> back at the time.
> 
> Let me know if you are OK with the adjustment in v3, or whether you
> would rather leave the > 1 check as-is (or maybe adjust in a different
> patch).

Well, I haven't been able to make up my mind as to whether the original
check was wrong. Without clear indication, I think we should retain the
original behavior by having the __set_bit() gated by an additional if().
Then, since the line needs touching anyway, a further question would be
whether to properly switch to setup_force_cpu_cap() at the same time.

Jan

