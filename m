Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74469A07DC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 12:55:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819970.1233464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t11g5-000524-Ad; Wed, 16 Oct 2024 10:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819970.1233464; Wed, 16 Oct 2024 10:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t11g5-00050O-7f; Wed, 16 Oct 2024 10:54:53 +0000
Received: by outflank-mailman (input) for mailman id 819970;
 Wed, 16 Oct 2024 10:54:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sXg9=RM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t11g3-00050E-8y
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 10:54:51 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10dc6951-8bad-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 12:54:50 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37d4c1b1455so4948345f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 03:54:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7faa4085sm4019946f8f.65.2024.10.16.03.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 03:54:49 -0700 (PDT)
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
X-Inumbo-ID: 10dc6951-8bad-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729076089; x=1729680889; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=riiaPbwnDFcvrZpdYtHnCaIJdtGEYv4yuHp5nwNTfOo=;
        b=X8FZcX7NJleT1vZSUBL79dWzTnmMltlqVuj6BoFKrKJ9dpOwSlubelhxkb85wNOxZ3
         8w8Mgl48U8ocIF1lgZu1IkC3/ncqCY0tE0qPGaTektz6jivijYCyo175XpUsgA+Axv6c
         +vdiFTAT1/s43man2YwO7WuCYIRj+y9USqboQpGmvPxeN6ps2/RU5XgkP3/LchR69Gan
         c460tylUXQDy2LLc4PfKVGxguiFDBCvnyRU5dMkkZqqsYUq2cVWN0M0vT5vQw1dG64oB
         zaCthiF2fzicFQBXQRF9nHv7XBLf1hLIIsTw0CPXO92jfJqbG8770xDo3ZNowgn+dZjh
         nxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729076089; x=1729680889;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riiaPbwnDFcvrZpdYtHnCaIJdtGEYv4yuHp5nwNTfOo=;
        b=HKW9rjqqnfZUz1pY0GgUs2NdePktjEprWF3oIXCqFOue495Np6NgxbUAQ093mhlO0u
         D/4ts75LZDl/UHchE2AeSzQz8ophHkm38EiByfp9hMgKxduyClpIE0yhOI7A6yX9Dk+i
         lB7c0/1qURUdZWkYxQ1+eVIfLQehH26Ljq32P1ekyGTw9hF+qu9kfzfgCglfHXfm/QBe
         pV9CgsEGyaF39YPK+rPzylS+qBGzXJJcSkQBGB3WStPMn1HAvVxTFlxnRGZ7l684H1fU
         GkF8nj27t0pilJ1ed9py64y10xqA1NoL+QLvf8/UQTguSJ3CTweuxhaIuSftGxrLXtAi
         F0nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUloh8nviD/PeG3Pksau9vXyjz0Y9ydYe1w8/xlT3V79TO7UtDmCeUcJoe65LvonL6rVS44RoutwwQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzcj3yFQjk8Dwa3iXkPuWRHnCOuZO3VDDnvbjt2fypeV/kJ/Eoo
	Kn8vIFk27eye/GjPkG2BWbdTlpFhyChfyRgs5G/KBrBOs2f3F7IoxidrrbVC/Q==
X-Google-Smtp-Source: AGHT+IHsVk6bdq81/l66m8c9bgQsXPQzllXsEzZA4NwBqNJPkXpKtYFpVskaFfuVnycvpSEbRGtpZQ==
X-Received: by 2002:a5d:510d:0:b0:37c:f933:48a9 with SMTP id ffacd0b85a97d-37d55184f09mr11585725f8f.1.1729076089537;
        Wed, 16 Oct 2024 03:54:49 -0700 (PDT)
Message-ID: <0695d72d-7138-4d35-be5d-c0fb0589944b@suse.com>
Date: Wed, 16 Oct 2024 12:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul/test: drop Xeon Phi S/G prefetch special case
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a2dae57f-d166-4c99-8edd-11784abdecab@suse.com>
 <D4X5VZZWZJII.271VYW2L8Y0PG@cloud.com>
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
In-Reply-To: <D4X5VZZWZJII.271VYW2L8Y0PG@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.10.2024 12:34, Alejandro Vallejo wrote:
> On Wed Oct 16, 2024 at 8:46 AM BST, Jan Beulich wrote:
>> --- a/tools/tests/x86_emulator/evex-disp8.c
>> +++ b/tools/tests/x86_emulator/evex-disp8.c
>> @@ -911,10 +911,8 @@ static void test_one(const struct test *
>>      n = test->scale == SC_vl ? vsz : esz;
>>      if ( !sg )
>>          n += vsz;
>> -    else if ( !strstr(test->mnemonic, "pf") )
>> -        n += esz;
>>      else
>> -        ++n;
>> +        n += esz;
> 
> Just making sure. This is leftover from 85191cf32180("x86: drop Xeon Phi
> support"), right? Dead code after the removal of the avx512pf group.

Yes.

> If so, that sounds good. But (not having looking at the general logic), how
> come we go from ++n to "n += esz". It's all quite cryptic.

It's the (prior) if() portion we're keeping, and the "else" we're dropping.
The if() checks for _no_ "pf" in the mnemonic. "Going from ++n to n+= esz"
is merely an effect of how the change is being expressed as diff.

Jan

