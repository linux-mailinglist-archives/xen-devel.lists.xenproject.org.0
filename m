Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340CCB3DA15
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 08:39:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104070.1455231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usyBP-00074t-G1; Mon, 01 Sep 2025 06:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104070.1455231; Mon, 01 Sep 2025 06:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usyBP-00073L-Cd; Mon, 01 Sep 2025 06:38:27 +0000
Received: by outflank-mailman (input) for mailman id 1104070;
 Mon, 01 Sep 2025 06:38:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1usyBN-00073F-NU
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 06:38:25 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e00abc5-86fe-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 08:38:17 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-61e425434bbso1286990a12.2
 for <xen-devel@lists.xenproject.org>; Sun, 31 Aug 2025 23:38:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbca5sm6516001a12.31.2025.08.31.23.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Aug 2025 23:38:15 -0700 (PDT)
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
X-Inumbo-ID: 3e00abc5-86fe-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756708696; x=1757313496; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/bbYtzZZq1q4hIl2v+vqBxOpKtDezo41+4YySzDYONw=;
        b=Ovy4Sr3xX1AGzah/SiObI388xQtFjE+t9lFl9ukz9GJ4BStka8re2t4mlsq56pX+PM
         2fL3xDLqmEIWIMWyXBNAFoviDpJjp6FsEzRfWqOP0VWiIs8RrEu9foukXNLr3g4DIFZW
         4PvYnjxpbpzcltpudHh9YniTgNM/N+WRMAcA3tAwV71Mk3CoPTQbwLOiac/FO9fTeLLs
         H2kmEVQjYyVAPwiaVtEng+UhTEffmIJBZJP5EgCBd/cZ3rovpjNnORIsjFXrljgZp2Dm
         D4r3vL4Hd/HzxVEQfSTaM7ruIa1XcmxHPTFVqvdJZ6sViw6WEijmlWht1Sl+g6Ixb+G1
         aDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756708696; x=1757313496;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bbYtzZZq1q4hIl2v+vqBxOpKtDezo41+4YySzDYONw=;
        b=shuLzGVimPy087px5wTtwqLNzCY9eU071iOjtCpS9hTjlxGpOLD4PuTJB1HcfbjmpV
         6OQQWptA2Gv0quhAMAOJHiuliu0zW24U0hJqFoYa1St4Vq9Cwq9PQwfHaQhRlp5nBX5H
         R4SLTn8ic05pUrLxSwaDBc2L/AxN+4IRqDitbPP3KrMldqjVvUf6SRZMtqwtlMg13wTv
         39kEVYPCSvRvDiHK2RQOuWmv5Vh9HRt2zUdvzuSH9ivcn2y9mgjBrqvt/LG9UJL8erW4
         HjdbhK3ysiMapm0f5XOIvk9pEwDzKw0vx82yIm0yl3QDRUNb41pT1QYabyzxFacnPMN3
         iRnw==
X-Gm-Message-State: AOJu0YwOnQlrpLZfpC2qIOwLpssCOAORJ0ezNR4mlQ2VFQa1gE4pEVXq
	UwU/sCAXz7CQd0HjpoJJDxYn4qV1dHBEnCebSnUe7XqyTeyJgNP5xdzkCEzDKZavUA==
X-Gm-Gg: ASbGncu8rfPEFLNDBx3Hblc43ludQ56nUSF3pAs+k1148Ky/S3UyC36GKhFeyeSW3oQ
	DN6hd8+tYLU40dUP54wHSN7F3m5wj4HEfEZ1wW/xMWYNeYTJFVOc4ucs10vRJwbR24k6s4EbQub
	9yBljIau/gjNfZS4cjH2toE9HMtU2d23L+EowNMqJXmM3YVm6aRjlMhcjWJ73GYctk235AbX0GP
	J9IIq6XdmPyItpEAo6j+589bUhpOzCNVXy7H1ZZ1ggnrinpJ5p892e7HeqD5BLkVt9nSDd2/E6a
	uJh4t9FtM56cRO701bEye/WPQOionhbsv1jW/FVQYYniL1B/fRb1KjiVOZ6DqXcOXoTez1T1LPf
	tgMOGDGDBYH0ZCmjm3157rq77Z8yWjjdacupA1g3bhhm4o1W5Wiixn1Go46ViZy5ybqJ8EtA30S
	IqCJALrf4=
X-Google-Smtp-Source: AGHT+IGHPXTNOQ5+vamsmwnm/8nFONdlt1vv50kuKhqtut74Bf9G+yD4Dtse5BsqtQivNXOgz2M9Ow==
X-Received: by 2002:a05:6402:5207:b0:61c:5cac:293f with SMTP id 4fb4d7f45d1cf-61d26869f4fmr6458639a12.6.1756708696454;
        Sun, 31 Aug 2025 23:38:16 -0700 (PDT)
Message-ID: <4d39fe27-18ef-4e00-9c92-96bf6e76b8b3@suse.com>
Date: Mon, 1 Sep 2025 08:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] symbols: add minimal self-test
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
 <879646dd-b55e-4b42-b637-d3b14570b880@suse.com> <aLG4FdcHSLW6oaVA@Mac.lan>
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
In-Reply-To: <aLG4FdcHSLW6oaVA@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.08.2025 16:24, Roger Pau Monné wrote:
> On Wed, Apr 02, 2025 at 03:57:57PM +0200, Jan Beulich wrote:
>> ... before making changes to the involved logic.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> While Andrew validly suggests cf_check isn't a requirement for selecting
>> which function(s) to use (with the non-upstream gcc patch that we're
>> using in CI), that's only because of how the non-upstream patch works.
>> Going function-pointer -> unsigned long -> function-pointer without it
>> being diagnosed that the cf_check is missing is a shortcoming there, and
>> might conceivably be fixed at some point. (Imo any address-taking on a
>> function should require it to be cf_check.) Hence I'd like to stick to
>> using cf_check functions only for passing to test_lookup().
>>
>> With this FAST_SYMBOL_LOOKUP may make sense to permit enabling even
>> when LIVEPATCH=n. Thoughts? (In this case "symbols: centralize and re-
>> arrange $(all_symbols) calculation" would want pulling ahead.)
>>
>> --- a/xen/common/symbols.c
>> +++ b/xen/common/symbols.c
>> @@ -260,6 +260,41 @@ unsigned long symbols_lookup_by_name(con
>>      return 0;
>>  }
>>  
>> +#ifdef CONFIG_SELF_TESTS
>> +
>> +static void __init test_lookup(unsigned long addr, const char *expected)
>> +{
>> +    char buf[KSYM_NAME_LEN + 1];
>> +    const char *name, *symname;
>> +    unsigned long size, offs;
>> +
>> +    name = symbols_lookup(addr, &size, &offs, buf);
>> +    if ( !name )
>> +        panic("%s: address not found\n", expected);
>> +    if ( offs )
>> +        panic("%s: non-zero offset (%#lx) unexpected\n", expected, offs);
> 
> If there's a non-zero offset returned, could you also print the
> returned name? (so use %s+%#lx) there's a change the returned name
> doesn't match what we expect if there's a non-zero offset.

Hmm, perhaps we could, even if that's not the main goal of the test. Note
though that the patch has gone in already, with Jason's R-b.

> The rest LGTM:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Nevertheless, thanks.

Jan

