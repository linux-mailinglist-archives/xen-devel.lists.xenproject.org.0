Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0636A96264C
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 13:47:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784749.1194130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjH88-0000L5-MO; Wed, 28 Aug 2024 11:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784749.1194130; Wed, 28 Aug 2024 11:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjH88-0000Iw-Jg; Wed, 28 Aug 2024 11:46:28 +0000
Received: by outflank-mailman (input) for mailman id 784749;
 Wed, 28 Aug 2024 11:46:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjH86-0000Ip-IK
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 11:46:26 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2794f5c0-6533-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 13:46:25 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8696e9bd24so714642766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 04:46:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54875b8sm235152766b.1.2024.08.28.04.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 04:46:24 -0700 (PDT)
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
X-Inumbo-ID: 2794f5c0-6533-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724845585; x=1725450385; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mpdrHGXQc+FtDMvN3QJ8IPXtZ70AgcSCoXmjz/j9ZhA=;
        b=NMW+jdUVPoV37jo6PR9UhTClP9eDFzv35TDcHKUUCyXeFx1PNo3OHwDFa1q++uffcX
         BqjS0I92/kx8/qOpntImS9rq3+IgkNuhj8NfHUXNP92TBqIW2ZLWW3csUdabrwBEeTR2
         jGrKGxKBiU2st7SWkoRPl9f4KlpHCE72hjmTNA+nPxC5WQGOMSuuJCO/FDZ+lIvBmZb1
         6Luw4SMHKLKszopeYE9g4kxLv3Xej1/btPBR6Kz9h4XsYOKOhO56NOaMZRJdJrHb5vV9
         gFrh4Mtf4IlhrEq7gEhR3fQFwZke6cJreDuC6YghS6MS5SOVQ4fRYSF6rywZsPejC6Ke
         Tdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724845585; x=1725450385;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpdrHGXQc+FtDMvN3QJ8IPXtZ70AgcSCoXmjz/j9ZhA=;
        b=W2XJOU1PgOKL7/zYuy6cAbML5/lVzU1c16PxcabzF8sRZMiTYYZ4gQ1xRnPyDL34BH
         Ofqz6D11+D85N1cDHrQaQlmsvup0xGWv77V7SPGiFXXzcs1Awt2bU2SqTY5Nb86Y0Ft1
         JPI1qi4j0BrqWNCHuehg+W2/CGIUSxSEqWypOE6NSmHUTS6iN14AL16+xLeRVgklaJRC
         tmZ899gfPwVuKnpySbnl7vNV4sfARafagekTqmcBhHkM8p29dFmYBIOOGjyPxJpPAeCe
         Kotv7+DGdYI8MEnh1g2t8D8PELAzV09gQVsA22v5WxPxnjST5ZolH91nxkeBsgwjZt6O
         uYZw==
X-Forwarded-Encrypted: i=1; AJvYcCUkuvuOOVEy2eMpNygXT8XqZWLnb1Yylshubs43wYpW+vcG3AjbYZOrd2Uq+xaGTiJq5rujjVQ7feI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmeC/Yepy3HHhZN83x59z3PQeQw6LzWxtCMtlElqiZAqOPOS6Q
	LY7fvYgF0ONlC9Wb0j7/rO1jaUSK+aa1BcK99Vi1nenqnRmLcwEa02To/CuEog==
X-Google-Smtp-Source: AGHT+IGAMuPmHNROaq8Y/pjAje3JllW0LSLvjRBc1pLXqcnCqzpo4nJRmPVQnOqdlskk48h8Yx7oKw==
X-Received: by 2002:a17:907:1c27:b0:a77:b01b:f949 with SMTP id a640c23a62f3a-a870aa54808mr148528366b.35.1724845584691;
        Wed, 28 Aug 2024 04:46:24 -0700 (PDT)
Message-ID: <dac66b57-fba3-409c-83cb-6b33171f3949@suse.com>
Date: Wed, 28 Aug 2024 13:46:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: correct partial HPET_STATUS write emulation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <da785047-0bee-4d16-a6ae-d1727bd8317a@suse.com>
 <c508fcdf-d918-40cf-94d5-c56a191e53bc@citrix.com>
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
In-Reply-To: <c508fcdf-d918-40cf-94d5-c56a191e53bc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2024 13:06, Andrew Cooper wrote:
> On 28/08/2024 10:00 am, Jan Beulich wrote:
>> For partial writes the non-written parts of registers are folded into
>> the full 64-bit value from what they're presently set to. That's wrong
>> to do though when the behavior is write-1-to-clear: Writes not
>> including to low 3 bits would unconditionally clear all ISR bits which
>> are presently set. Re-calculate the value to use.
>>
>> Fixes: be07023be115 ("x86/vhpet: add support for level triggered interrupts")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Alternatively we could also suppress the folding in of read bits, but
>> that looked to me to end up in a more intrusive change.
>>
>> --- a/xen/arch/x86/hvm/hpet.c
>> +++ b/xen/arch/x86/hvm/hpet.c
>> @@ -404,7 +404,8 @@ static int cf_check hpet_write(
>>          break;
>>  
>>      case HPET_STATUS:
>> -        /* write 1 to clear. */
>> +        /* Write 1 to clear. Therefore don't use new_val directly here. */
>> +        new_val = val << ((addr & 7) * 8);
>>          while ( new_val )
>>          {
>>              bool active;
> 
> It's sad that we allow any sub-word accesses.  The spec makes it pretty
> clear that only aligned 32-bit and 64-bit accesses are acceptable, and
> it would simplify the merging logic substantially.

While that's true, the bug here would still have been there if we limited
emulation to 32- and 64-bit accesses.

> Nevertheless, this is the simplest bugfix for now.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

