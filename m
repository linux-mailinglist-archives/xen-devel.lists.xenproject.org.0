Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 303C8CF79DD
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 10:49:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195959.1513831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd3go-0004GY-I2; Tue, 06 Jan 2026 09:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195959.1513831; Tue, 06 Jan 2026 09:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd3go-0004E2-FP; Tue, 06 Jan 2026 09:49:22 +0000
Received: by outflank-mailman (input) for mailman id 1195959;
 Tue, 06 Jan 2026 09:49:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd3gn-0004Dw-0f
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 09:49:21 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f872b88f-eae4-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 10:49:19 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-432755545fcso416052f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 01:49:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df9c5sm3483453f8f.22.2026.01.06.01.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 01:49:18 -0800 (PST)
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
X-Inumbo-ID: f872b88f-eae4-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767692958; x=1768297758; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+vMmsVSuC+yn89Hk8vSUEwtja6nNc0uUwda/2UTby9w=;
        b=GWNwIp8V3WloyDNIRUpfn8zjWA81tICVx3OB0tH663TZwrHZUYIHP7MJC5F4cURApx
         4I62oseX357HJRdPZiEo9Y5LNYA7G8GPwaqlmgvrvJqpvs96o3CjnC1z9XlDJ/okWaPp
         nDhVnCkcpse8Q9IxNxPtKqvLbhDly12zMfCLj892FAF3rAKOBVqZqX4TWkBBvCAndxf1
         +odDErQtzhpyUFuYAwiQltiRnKE9bktSZUIH2ICZwHtfYJjTHTwy4qYdyjFRsFS/3XMT
         /obFZ9QEHJLl2HYbaddVGii27ScyXPjS7X9KuEouYDWl8XGEg6VxAqBn9dkfQFpcnWza
         21dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692958; x=1768297758;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vMmsVSuC+yn89Hk8vSUEwtja6nNc0uUwda/2UTby9w=;
        b=klDTt2YdgQ8nmeeqaOZS+hmWwD9tYwxWiAqbeYWPGItdu9D4T4rNMDoQ4vvtUB6/mz
         8TLOxTV+OIyCgqGk0dgvtnLEtiDEeCu9racpbYM8eJMBFG28XpSvld1Bui61TTWAG4GQ
         M0UYi3QYkRi1JSdKXRUpjoEivXvkO+05qGHdMotIHGv0gVQm1PSiD3gtEMG1H9DSWaVA
         Tn4fOqnBX2MQvnVrwBLtkxmj8uhbthEaBnpDCZuKnk+1zEu/g78iNOEoBi22VLNc6/Af
         tlf8LYCYP9igx99Jd4LP2SfGr2LbtbmyOp22llo85HIw8yHuJacqiUDpsEWDgPTEg7r5
         XnHw==
X-Forwarded-Encrypted: i=1; AJvYcCUwNRIXJ6+CVqjMkmDIs80Y1III5QB5K55iU8ytnURpPUEk3gO1VIFYrfjj4OBLfrKcLL2jL6d3MFw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxjv5FjUda3LQko1zX7HIurvBOjEBowpGbrSWuaZ5IWm0dPRXDK
	tSJGPc0bBaylH1e5Werr8NxQpFBjDx76cMXGd2SbIqh37dia9pUEiOHBQ2DHHYm36g==
X-Gm-Gg: AY/fxX4AMrmqkyEAMh9e/JupHSr2xHdJ729vLFPzJyroC6h091w+XHRu/dR9uUOufJg
	wPossrW1wfldTEb/r1AD0VaL2yf390p8MGLinfZ8+SBbgjDMk1BVeLnA0LZ5shhQknAqLNuSqQJ
	paI4+kibUmRK5nXvnyOGvdHFi4KEJcYKfqTH/aXQ9XkdA6xWqOCsok8NYFdYI+nuAI8+5uY5hzj
	kvncVba79dHC9IRa8u9iKkWvxuBsp4WKIDD6wp0RFVE421Xo764Umsp3TO+Zd9kuobyVRKbKJde
	1b8MksOQlHKpdMpIej+7ZtWwqG2y4yO88I761WK7ZWi3Dyv+NhTMYMWkwWZl2ZJBM0mpRBbafrC
	WD3mKenD/7eCn3lgx67TZ3DNkRAohqZkskmdKwglPadLfi6mY+TQrOPs8jkQOm0f5KNhnSzdEnH
	yVVyhrEiL/wjjigjAdCXYEbuqVe9Obl3wKTbeRSP+5ukrxZf88VjhKKjWC3UXRU1OWYkkpm43ef
	YwerJoWt8CdiQ==
X-Google-Smtp-Source: AGHT+IFC2tpwjRtu/k6J7abAHD2okAAossK0/k1+oXSVftAygmXOCe4lUlkwgjKh4eiv/SMhfjQiyQ==
X-Received: by 2002:a05:6000:40ce:b0:430:f718:2388 with SMTP id ffacd0b85a97d-432bca2c3efmr2606539f8f.8.1767692958475;
        Tue, 06 Jan 2026 01:49:18 -0800 (PST)
Message-ID: <19ae296c-5ea0-46ce-9107-8d212c065257@suse.com>
Date: Tue, 6 Jan 2026 10:49:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/cpu-policy: enable build of fuzzing harness by
 default
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4a8f06b9-8210-487f-9dd7-e0221e2df9db@suse.com>
 <c3fcc1a5-6479-400b-b65d-35d7d7233b4a@suse.com>
 <5d45bb91-4ef5-48ec-b1fd-4f186f46c0ad@suse.com>
Content-Language: en-US
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
In-Reply-To: <5d45bb91-4ef5-48ec-b1fd-4f186f46c0ad@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.01.2026 10:36, Jan Beulich wrote:
> On 22.12.2025 17:53, Jan Beulich wrote:
>> ... on x86, to make sure its bit-rotting can be limited at least a little.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/tools/fuzz/Makefile
>> +++ b/tools/fuzz/Makefile
>> @@ -4,6 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
>>  SUBDIRS-y :=
>>  SUBDIRS-y += libelf
>>  SUBDIRS-y += x86_instruction_emulator
>> +SUBDIRS-$(CONFIG_X86_64) += cpu-policy
>>  
>>  .PHONY: all clean distclean install uninstall
>>  all clean distclean install uninstall: %: subdirs-%
>>
> 
> As it turns out this causes build failures on Ubuntu (and only there, and only
> with gcc, which I don't understand):
> 
> afl-policy-fuzzer.c: In function 'main':
> afl-policy-fuzzer.c:153:9: error: ignoring return value of 'fread', declared with attribute warn_unused_result [-Werror=unused-result]
>          fread(cp, sizeof(*cp), 1, fp);
>          ^
> cc1: all warnings being treated as errors
> 
> Given how the code uses calloc() up front I don't really see why evaluating
> the return value would actually be meaningful here, so I'm inclined to add a
> cast to void (provided that would make a difference, which I have yet to
> check). Opinions?

Simply casting doesn't work. Hence what I'm intending to do is

--- a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
+++ b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
@@ -133,6 +133,7 @@ int main(int argc, char **argv)
 #endif
     {
         struct cpu_policy *cp = NULL;
+        size_t size;
 
         if ( fp != stdin )
         {
@@ -150,9 +151,9 @@ int main(int argc, char **argv)
         if ( !cp )
             goto skip;
 
-        fread(cp, sizeof(*cp), 1, fp);
+        size = fread(cp, sizeof(*cp), 1, fp);
 
-        if ( !feof(fp) )
+        if ( !size || !feof(fp) )
             goto skip;
 
         check_policy(cp);

along with amending the description:

"Since on Ubuntu fread()'s return value needs evaluating, adjust the code
 there to also skip the test when there's no data at all."

May I keep your ack with that adjustment?

Jan

