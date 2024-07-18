Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDA8934C26
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 13:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760381.1170213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUOuj-0001dy-Nw; Thu, 18 Jul 2024 11:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760381.1170213; Thu, 18 Jul 2024 11:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUOuj-0001bj-LF; Thu, 18 Jul 2024 11:03:09 +0000
Received: by outflank-mailman (input) for mailman id 760381;
 Thu, 18 Jul 2024 11:03:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUOui-0001bd-F2
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 11:03:08 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fb3fe05-44f5-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 13:03:07 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a77c0b42a8fso299937366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 04:03:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cb7750674csm391966a91.43.2024.07.18.04.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 04:03:05 -0700 (PDT)
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
X-Inumbo-ID: 4fb3fe05-44f5-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721300586; x=1721905386; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+lfW6T5F+GyusfZueKEisOk7nFOz6THNX0AdXydSyH0=;
        b=GwguhWT7b7X/S1kxTzXZkr5BWUp715qPTS8cgu/KF3e0gvo2uXwiu7yzxHEoSQu9nU
         wSNQU+GRMfCH4zum/vGB64VvMr1o2WhCTykezVvp/y/8/Zh84Bu6YN5Lun1VKEHtaJJ7
         1aWcAsONScIQJPk+3A4k3xYd7O2YFS8XjI+bOjcjAZQo5KJEqrzEp7YVmEEJm40J6iLG
         rCiSje3pNGkPEP8AeYytX+gIlSeGL/098ChyPE0jGne3kbtjxqKyZjZn1WFi5oYqj/pn
         w2Ejwe5PPF7/+S8UWNYG+uz6PhjEIGaraFTW17/qT5JRRgffBaKPU/o4fOe+1778wGNC
         8wHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721300586; x=1721905386;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lfW6T5F+GyusfZueKEisOk7nFOz6THNX0AdXydSyH0=;
        b=rY/OalAMSgCxnJNNPvII/WDyZgUOqVMjs4gYP3kCHdEwZ2Hu831RUrZY+Yff6oUn6B
         YtjrB8uF1jdHX3Ez/uN+R3tHgELFZPrNTK4i0DMxiajeiw6jYMTRUueaZTTPRC8yaqP5
         C2nqsLdytKFjPsGhhVJSgt8OCQD5etAhihwGRyz9DKxQ6OOQyL7p+pD8SRCrYCDVnYKS
         ZEDAax2uvoOKxMKwfnsIX65vD1oO2jj0BGd5WiHg0GmYE8Xk0eFGhwwvXk+5Xs5avJ5s
         VhdOFvMPD/UbV7+VjIX2e8XN3umo3Gocn0Yk0Zg5V8bWVplrkCSO1HgQ3H7cb435RbxF
         wzRg==
X-Forwarded-Encrypted: i=1; AJvYcCXg2EAyxHpDuqTCXWIN+sujgP34muqAjycKWQygWBX5Uwls93HzPMHbAENDqpHzf+oRkvXWy+qLOBlzi3/GbWIEGhhrUVqZ3gs42sjWEBU=
X-Gm-Message-State: AOJu0YzzGoco+va/a8SKam9lhHBowADLpTHmgw2+HEWJToSwKo4fkzTD
	6kfrMcOjKmyw6WXKYkQkj7AeNv+6je8y0JYmdzHswTzM4BQEL2p/nRcS4OShCw==
X-Google-Smtp-Source: AGHT+IHgahk4UhuRtT119x4vbfjn4GnexYb6dBT7H+UToBtNVmX3H2h5g9/8TPyjXW1ovfg4tnKaYg==
X-Received: by 2002:a17:906:2a91:b0:a77:b349:ffd8 with SMTP id a640c23a62f3a-a7a0f79b834mr252711266b.32.1721300586191;
        Thu, 18 Jul 2024 04:03:06 -0700 (PDT)
Message-ID: <32302065-672c-480f-8491-d73982598e77@suse.com>
Date: Thu, 18 Jul 2024 13:02:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Add libfuzzer target to
 fuzz/x86_instruction_emulator
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
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
In-Reply-To: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 00:47, Tamas K Lengyel wrote:
> This target enables integration into oss-fuzz. Changing invalid input return
> to -1 as values other then 0/-1 are reserved by libfuzzer.

And existing behavior (for afl) is unaffected because there we (wrongly)
ignore the return value altogether.

> @@ -67,7 +70,8 @@ distclean: clean
>  
>  .PHONY: clean
>  clean:
> -	rm -f *.a *.o $(DEPS_RM) afl-harness afl-harness-cov *.gcda *.gcno *.gcov
> +	rm -f *.a *.o $(DEPS_RM) *.gcda *.gcno *.gcov \
> +        afl-harness afl-harness-cov libfuzzer-harness
>  	rm -rf x86_emulate x86-emulate.c x86-emulate.h wrappers.c cpuid.c

This is what I said for v1:

"I'm inclined to suggest it's time to split this line (e.g. keeping all the
 wildcard patterns together and moving the rest to a new rm invocation)."

Could this really be misunderstood to mean anything other than

clean:
	rm -f *.a *.o $(DEPS_RM) *.gcda *.gcno *.gcov
	rm -f afl-harness afl-harness-cov libfuzzer-harness
	rm -rf x86_emulate x86-emulate.c x86-emulate.h wrappers.c cpuid.c

? With that
Acked-by: Jan Beulich <jbeulich@suse.com>
and I'm kind of okay making that adjustment myself while committing.

Jan

