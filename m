Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0898F9B4358
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 08:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827065.1241541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5grr-0003PM-Mr; Tue, 29 Oct 2024 07:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827065.1241541; Tue, 29 Oct 2024 07:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5grr-0003N6-Jn; Tue, 29 Oct 2024 07:42:19 +0000
Received: by outflank-mailman (input) for mailman id 827065;
 Tue, 29 Oct 2024 07:42:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5grq-0003My-Fh
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 07:42:18 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 525e5f14-95c9-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 08:42:17 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4315c1c7392so51821485e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 00:42:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b13251sm11706344f8f.6.2024.10.29.00.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 00:42:16 -0700 (PDT)
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
X-Inumbo-ID: 525e5f14-95c9-11ef-a0c3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730187737; x=1730792537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fBiCz3ZmYUs/otOFYLQ60oYUDGMNY69KCpjs7FzJ2IY=;
        b=YXhWky4B8tEPQJijGPrcs6xQNO2zIIj7jxU+STfQQl939uwfj9iFRFN4PcDwSZRoGQ
         5nJkx1t9FmY8Q9+Fqm5yS99UalKkMsNi/GF0k+298Fo3TnMozOgiHjtuzBZ4sCKP14/0
         0g1J2CRBcRaMMYs0UXSxjEKFF0yWEqyiALodwQulT9F8ikbTdkaX4svFNdncbCFMhFBR
         lvQHLRigLRszA/Np7aIYCpQe0gaiXrO96JEurm6pYCsMSDnvxcrzPiY0bdhjgswmS2uZ
         AJrQD+QnvjBj5TzDV3vglUn4jo95BkO8p38DWakEoovAjZhTo3gnjUzc8kCCHZQ9/1QQ
         x8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730187737; x=1730792537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBiCz3ZmYUs/otOFYLQ60oYUDGMNY69KCpjs7FzJ2IY=;
        b=hudAFkFrdsjr47Furx42dhZdjOfFesUQgfAlITWM4bLZbe4Po0LSIpkYS/m2fpxwqa
         h+R1JxWBsYD7ZXS6t3QdwOlr87IY4/EmnyGyhXEH00411jEMJj3xJ+xmazRTHXccihaV
         iVSAD8WknN2lT7U3nxRpCDs74iEtG5KT7J16OB++5Z1hBi9Tx4l3RnWRTeT2LKCP9EvD
         QFYAoLzId1VfZ2E+ByMdM2kNNfafd4/zJ1O8QuKkHxh6Ivv8prfP6gUwfHYboxxpXG6u
         j1OPOLgK5p+PnShC6v16aLavxEhPG2mbCXR1uHueDsBoArUpOQX8L+Sr6AflP+zr3A1b
         MZzA==
X-Forwarded-Encrypted: i=1; AJvYcCVz9d65aucYO4RxSFnKME/yY/MQhDE3uwBcVxCeWgqaSZcrntqN2K2VL13a7VyAfHCYAkeos8hP+gI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGZNJH6Nv3sduwRixlWlTkpQCpCqQnuCU1XOSnx/shBNt2Ti6e
	pu8Lh9XDtYeplKnF2QGwWSHRabdfDT72NdZc6wT1CRJageq6nGlV2RLvyvs9fA==
X-Google-Smtp-Source: AGHT+IHCtC+5itZK481vBEf8XF71+7bd+4HPg2SJUKCNC5ktqut6qSpsT24Fz+N5ryqteHG6kktG5g==
X-Received: by 2002:a05:600c:5126:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-4319acabb3fmr73765015e9.15.1730187736916;
        Tue, 29 Oct 2024 00:42:16 -0700 (PDT)
Message-ID: <4aa81797-9479-46e8-93c4-46b760b734fc@suse.com>
Date: Tue, 29 Oct 2024 08:42:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxl: remove usage of VLA arrays
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20241028114831.27487-1-roger.pau@citrix.com>
 <3828ba9f-9bc8-4b65-a42f-b67ef061be52@citrix.com>
 <51632c96-9a12-4656-b8f8-1631c11a3a19@suse.com>
 <CACHz=Zg4mFn5zn42f9dDFao0r7ePj=Owhc04OSW5LfW6cJoUaw@mail.gmail.com>
 <Zx_JRaViUiEF2IrH@macbook>
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
In-Reply-To: <Zx_JRaViUiEF2IrH@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.10.2024 18:26, Roger Pau Monné wrote:
> On Mon, Oct 28, 2024 at 12:57:30PM +0000, Frediano Ziglio wrote:
>> On Mon, Oct 28, 2024 at 12:48 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 28.10.2024 13:03, Andrew Cooper wrote:
>>>> On 28/10/2024 11:48 am, Roger Pau Monne wrote:
>>>>> Clang 19 complains with the following error when building libxl:
>>>>>
>>>>> libxl_utils.c:48:15: error: variable length array folded to constant array as an extension [-Werror,-Wgnu-folding-constant]
>>>>>    48 |     char path[strlen("/local/domain") + 12];
>>>>>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>
>>>>> Replace the usage of strlen() with ARRAY_SIZE(), which allows the literal
>>>>> string length to be known at build time.  Note ARRAY_SIZE() accounts for the
>>>>> NUL terminator while strlen() didn't, hence subtract 1 from the total size
>>>>> calculation.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>> ---
>>>>>  tools/libs/light/libxl_utils.c | 4 ++--
>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_utils.c
>>>>> index 10398a6c8611..b3f5e751cc3f 100644
>>>>> --- a/tools/libs/light/libxl_utils.c
>>>>> +++ b/tools/libs/light/libxl_utils.c
>>>>> @@ -45,7 +45,7 @@ unsigned long libxl_get_required_shadow_memory(unsigned long maxmem_kb, unsigned
>>>>>  char *libxl_domid_to_name(libxl_ctx *ctx, uint32_t domid)
>>>>>  {
>>>>>      unsigned int len;
>>>>> -    char path[strlen("/local/domain") + 12];
>>>>> +    char path[ARRAY_SIZE("/local/domain") + 11];
>>>>>      char *s;
>>>>>
>>>>>      snprintf(path, sizeof(path), "/local/domain/%d/name", domid);
>>>>> @@ -141,7 +141,7 @@ int libxl_cpupool_qualifier_to_cpupoolid(libxl_ctx *ctx, const char *p,
>>>>>  char *libxl_cpupoolid_to_name(libxl_ctx *ctx, uint32_t poolid)
>>>>>  {
>>>>>      unsigned int len;
>>>>> -    char path[strlen("/local/pool") + 12];
>>>>> +    char path[ARRAY_SIZE("/local/pool") + 11];
>>>>>      char *s;
>>>>>
>>>>>      snprintf(path, sizeof(path), "/local/pool/%d/name", poolid);
>>>>
>>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>
>>>> Although I have a minor preference for sizeof() as suggested by Frediano.
>>>>
>>>> Can fix on commit, if you're happy?
>>>
>>> Please can we stick to ARRAY_SIZE() when it comes to strings? It's the
>>> same as sizeof() when the base type is char, but the difference becomes
>>> relevant if the base type was e.g. wchar_t.
>>>
>>> Jan
>>>
>>
>> But "literal" is not a wide string, and the type is "char" which is
>> not wide too.
>>
>> BTW, both me and Andrew are not strong about.
> 
> No strong opinion either, I've assumed it was clearer to not make
> implicit assumptions about the size of the string literal array
> elements.  I would rather like to get this committed, and Jan seems to
> prefer to use ARRAY_SIZE(), so I suggest we get the patch committed
> as-is.

Well, ultimately it's Anthony's call, for still being the sole maintainer.

Jan

