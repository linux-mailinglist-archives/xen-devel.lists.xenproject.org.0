Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BF3B19BF9
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 09:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068789.1432649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipLD-0004N7-L1; Mon, 04 Aug 2025 07:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068789.1432649; Mon, 04 Aug 2025 07:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uipLD-0004Lg-IH; Mon, 04 Aug 2025 07:10:39 +0000
Received: by outflank-mailman (input) for mailman id 1068789;
 Mon, 04 Aug 2025 07:10:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uipLC-0004La-G7
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 07:10:38 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c8b373e-7102-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 09:10:33 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-af949891d3aso220746266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 00:10:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0761f2sm689951866b.11.2025.08.04.00.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 00:10:32 -0700 (PDT)
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
X-Inumbo-ID: 1c8b373e-7102-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754291433; x=1754896233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kAbg2fpt8q7gSdAtEulXxegtVqA4Vtuy09atbtg1+zQ=;
        b=NgdwrTC3rI7K0vFhvEo+2PqKAShLWNrC9Ouktyp8pfgccv17pTRhhWtCNrXweg0VRj
         hYGbDN5kZEf05984wG0591PeclcFncouV6e4r6+6njB49LETy62WPEBGmgXrwYSeo1/s
         SbyK9thXDmsFtW2nN9bN8lX/vfb2LnyvG/CdLyWoGNicO03DjtoNLpB+hwneWjRjQMZG
         e4gwFWSiKkWZh2lVYYEfMvcSOc3kHrnqXQzlHUyDoHg4Q7TBqbS3hAYuiSPhrQkMNjEE
         2SfzhAwnXpxaeA2BsiyiJnnfqdramU5C+Ifq0GQV/lOrSNvlPC2nrYSW/alTRKj2yTTr
         oL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754291433; x=1754896233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAbg2fpt8q7gSdAtEulXxegtVqA4Vtuy09atbtg1+zQ=;
        b=EjKnN7Vo0ai6V/CGIgrGw/IHMB19DnErhJRsgkZzoQA2NDSmWLXYiINrW/TlNWPGja
         4OG6qEPbsxL0b48JiDABSvKGeIyt24tAM95ltYOZPZ0S+lqSz9UFSfF+cy8NOFwA76Is
         tLi2Aa/CD9LdHnWMgirDlBftNFicycFCfBUn5uzHg9n9OBdyASeukGi3W0Rbja5h3WUM
         RvNZgox6GecD2+WouYEofNMHdZ95hlNpN3BEbz3UtZUSqgbCeBo9VURYf/nUAofdJYh0
         PKbq0D1MFOXyZPGJTPHqGcclnPobUR4z8Z74gg5OPMk5Cdl6ait0sZ/SwpGXZCklxDnC
         3zLw==
X-Gm-Message-State: AOJu0YzL0rcZ0LIgfdNvg6W+54hKP/U2s1s+xq21Mc+2F+QzDJ+T2/0S
	yIFet9MTXIrJ9FchL3ByvMMw842lYEuoDAlUvQLc9FG7cSCrFOE2/30NiDJKLsCsig==
X-Gm-Gg: ASbGncsy1jMNboKD/we3g1nq9mAMc9Gxf0m9exSMTvkkhrVXdDCRHTF3lfHI1jgOnGz
	Xk4ywLFGWrkg/fC0YwKqFtrXTpECzn1ekkQ/1FShOM703tjyAQgsyRL3NDwuQmYNyOaarQixZux
	D9dk7qWCQ2A/PryW9PsuCaqqOPt56y/wD3kR+6rRp+Kf1wWIrubneYfm9rpcFrpjho7dHW+dfC+
	gCwxQxk53AD1ktzNozTaaFLo4aeGGv6wWu/LNwUOjnNfv2S3GNSa8L7nGJ1DH2JclK9e5Bm3YwQ
	CoykbTyFOPb4FaVmNEdXiLDL/M2J4fSNC76P6WurvJRBiUjOea8gUPCAKTDM5r31twHLFom7DmB
	sOMVYEIs+hHBkR/lu6hmuR6RJ4xG2IQpQWbViok1JU57EicOL9K+AW4dDDcDuYNIGsRh/CH7vKD
	JUCOLKD/g=
X-Google-Smtp-Source: AGHT+IF/gdQE7cmEfCcBw27sV0Xk1huFbm1Put0SBok+RCDsXA1ILi+LOetcEmIxrTB55zz/Ij0QGg==
X-Received: by 2002:a17:907:d86:b0:ae0:c976:cc84 with SMTP id a640c23a62f3a-af9400a94a6mr827921666b.24.1754291432690;
        Mon, 04 Aug 2025 00:10:32 -0700 (PDT)
Message-ID: <f0201ab2-db01-440a-98e9-acd3a29e91d3@suse.com>
Date: Mon, 4 Aug 2025 09:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] console: make printk_ratelimit_{burst,ms} const
To: dmkhn@proton.me
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <5fcd1c68-6c18-4a1d-8a1d-f056bdb6cde9@suse.com>
 <aI0OWwWkr0wg6FKw@kraken>
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
In-Reply-To: <aI0OWwWkr0wg6FKw@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.08.2025 20:58, dmkhn@proton.me wrote:
> On Fri, Aug 01, 2025 at 09:30:34AM +0200, Jan Beulich wrote:
>> Them not being altered by any means, their __read_mostly attribute is
>> actually counter-productive: It causes the compiler to instantiate the
>> variables, when already with just the attributes dropped the compiler
>> can constant-propagate the values into the sole use site. Make the
>> situation yet more explicit by adding const.
>>
>> Also switch the variables away from being plain int, and have the
>> parameters of __printk_ratelimit() follow suit. While there also
>> similarly adjust the type of "missed" and "lost", and - while touching
>> the adjacent line - increase lost_str[] to accommodate any unsigned
>> 32-bit number.
>>
>> Fixes: a8b1845a7845 ("Miscellaneous data placement adjustments")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> In principle {__,}printk_ratelimit() may also want to have their return
>> type changed to bool, but I think doing so would go too far here: This
>> would have knock-on effects elsewhere, and it would want considering to
>> actually flip polarity.
>>
>> Despite the Fixes: tag I wouldn't consider this for backport.
>>
>> --- a/xen/drivers/char/console.c
>> +++ b/xen/drivers/char/console.c
>> @@ -1268,12 +1268,12 @@ void console_end_sync(void)
>>   * This enforces a rate limit: not more than one kernel message
>>   * every printk_ratelimit_ms (millisecs).
>>   */
>> -int __printk_ratelimit(int ratelimit_ms, int ratelimit_burst)
>> +int __printk_ratelimit(unsigned int ratelimit_ms, unsigned int ratelimit_burst)
>>  {
>>      static DEFINE_SPINLOCK(ratelimit_lock);
>>      static unsigned long toks = 10 * 5 * 1000;
>>      static unsigned long last_msg;
>> -    static int missed;
>> +    static unsigned int missed;
>>      unsigned long flags;
>>      unsigned long long now = NOW(); /* ns */
>>      unsigned long ms;
>> @@ -1288,14 +1288,16 @@ int __printk_ratelimit(int ratelimit_ms,
>>          toks = ratelimit_burst * ratelimit_ms;
>>      if ( toks >= ratelimit_ms )
>>      {
>> -        int lost = missed;
>> +        unsigned int lost = missed;
>> +
>>          missed = 0;
>>          toks -= ratelimit_ms;
>>          spin_unlock(&ratelimit_lock);
>>          if ( lost )
>>          {
>> -            char lost_str[8];
>> -            snprintf(lost_str, sizeof(lost_str), "%d", lost);
>> +            char lost_str[10];
>> +
>> +            snprintf(lost_str, sizeof(lost_str), "%u", lost);
> 
> Since this code is touched, I would also simplify the entire `if ( lost )`
> block (I have it done in another experiment):
>  
>             char lost_str[64];
>             size_t lost_len = snprintf(lost_str, sizeof(lost_str),
>                                        "printk: %d messages suppressed.\n",
>                                        lost_str);
> 
>             /* console_lock may already be acquired by printk(). */
>             rspin_lock(&console_lock);
>             printk_start_of_line(CONSOLE_PREFIX, cflags);
>             __putstr(lost_str, lost_len);
>             ...
> 
> What do you think?

Maybe, but definitely not right in this patch.

Jan

