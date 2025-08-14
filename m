Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2473EB25C97
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 09:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080823.1441008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umS1H-0001gH-9I; Thu, 14 Aug 2025 07:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080823.1441008; Thu, 14 Aug 2025 07:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umS1H-0001e5-6i; Thu, 14 Aug 2025 07:05:03 +0000
Received: by outflank-mailman (input) for mailman id 1080823;
 Thu, 14 Aug 2025 07:05:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umS1F-0001du-JR
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 07:05:01 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe674e97-78dc-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 09:05:00 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad4f0so879202a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 00:05:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7995sm22632601a12.36.2025.08.14.00.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 00:04:59 -0700 (PDT)
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
X-Inumbo-ID: fe674e97-78dc-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755155100; x=1755759900; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IfqcScLHgxuY2Zi+5prkCmWDnGGxsY4YG2ECvTGJSdM=;
        b=AQCV26nEps/VKRCukm7D5asQmCV/JrOlo2vSb1J01ZDVrXSTsJtTqQ2uq2GxQVHysP
         ivBn1B3Rn3ykmQ8vvnm8Btslok50UKKPtN7Y4lrs4S7XCDcSpn9NPRitvakVq7vAyKpM
         J9bD2l7JElA0AMY/ySt5wBziYB34KqUcoRAhVXa7sebBWZCubFLcE6SwKflu/f8ZEqIE
         iZGKyqcZQf1vykVjxux0Y9LYoKuzZ+nZ3L9LubmKcIRdTsGS8akOm35Flh4384Y7cToG
         qOphMkRPZGV4dF9pNB1rh9bkWg7yHXKtrnx58vpbz8DGEVDS5LbTV5k1o7XJVZ8E6eaC
         Tsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755155100; x=1755759900;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfqcScLHgxuY2Zi+5prkCmWDnGGxsY4YG2ECvTGJSdM=;
        b=H9Zprxe/pv0ve9Kphe/eWafUc+5t537CHDyMWUcDEjRzHV/WD8AiE9p5VpJP4Ujpjq
         ipVZJkw0Ro9RpZbLK8bxDFrzV3eNdIPWwW4Bq+VAzrrxJJGl3OcWCjHgd2kZMk4jSAmt
         FYQMUF6sEKFcxxzXKAhctpTuEl6NrVClxCL2KxCcgmQGHH2cinun5LJYNVJTpgtXcm0o
         tq0Wkh/RbiXXFjRUUnVehVBbCUUmmxllxJfzOdPd+azpW+NsgCaq7/90mnQXhVxxKYoj
         wzlQa7LG2/udJCcneEZnYoOVozEMy7mkqoodPk8FhTeoeitIOME1yL/8wdrQRhen5IfK
         oGZQ==
X-Gm-Message-State: AOJu0YxaN1H7SB58/unO+Qa0KlMAmh1IYCpmXWkMPdL7p+yk/YXsVF79
	ARNpqqNQwkQJLQpDwnP0O3W/znevvBf9YillqbYMwaQbNbzDIr8uI0Q0f/cavFMrLw==
X-Gm-Gg: ASbGncse+HEckBRXkH5c85B2eQp1/Xw4NEz8VNKnyTHgLIlKDMqfGozEM0/zAV3h0sG
	GgtUgW9D95HByMht8ZQNb4HPznRFwWSHIRqbl1f0TcImh8MrvJKTQ28FtyCUCJxwAm1RK8+/nUs
	b2PLJTAF1vq4bBzrjm5xXmsujRSUUzS7dfAfXo4xFKCAgqbsOiFZfbDWEsv0QvHyq049j5QyaJI
	pDM3UTM5hRc7uLMbPzRsnUMo4TX3Jk1HTec4AGqi1OdU10DVC5mWvgLpOK8jyxAFFj2DfZDIjHB
	Nd4bAjDAdthpV8q12NyMm6IOdxC12iwDvzHTt1fTjuA7aoSYvTUrGxHNZSoU1SuTrVLq96JHJs2
	Mq4RBWIBlD6U7GUmUeLL7s5zG8QhDb+U0lcDhS0zz5rv3LKTZPVUzwjDbp0f09dV0AQxaiUvi9r
	hGerhjFlNYHkNmPtycuQ==
X-Google-Smtp-Source: AGHT+IEsBTzjyNzOyinqNOg9TyQ5fpOH1TglryLnYWFLGw4zexSr7fjPQD+JlKZan0Syp99elAUEgw==
X-Received: by 2002:a05:6402:a0d1:b0:618:3521:6866 with SMTP id 4fb4d7f45d1cf-6188b9a65d6mr1620746a12.15.1755155100028;
        Thu, 14 Aug 2025 00:05:00 -0700 (PDT)
Message-ID: <2fdde11b-4830-41e7-b099-225447435efb@suse.com>
Date: Thu, 14 Aug 2025 09:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/mm: drop unmapping from marking-as-I/O in
 arch_init_memory()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <ddfd86ad-19b3-495b-930c-1770dd92fa99@suse.com>
 <5a862787-40d8-4c9f-bd89-01d866648120@suse.com>
 <aJtsIxI4y-UspLKg@macbook.local>
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
In-Reply-To: <aJtsIxI4y-UspLKg@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.08.2025 18:30, Roger Pau Monné wrote:
> On Mon, Aug 11, 2025 at 12:50:23PM +0200, Jan Beulich wrote:
>> The unmapping part would have wanted to cover UNUSABLE regions as well,
>> and it would now have been necessary for space outside the low 16Mb
>> (wherever Xen is placed). However, with everything up to the next 2Mb
>> boundary now properly backed by RAM, we don't need to unmap anything
>> anymore: Space up to __2M_rwdata_end[] is properly reserved, whereas
>> space past that mark (up to the next 2Mb boundary) is ordinary RAM.
> 
> Oh, I see, so this was done to unmap trailing space when the Xen image
> region is mapped using 2M pages.
> 
>> While there, limit the scopes of involved variables.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> @@ -292,12 +290,17 @@ void __init arch_init_memory(void)
>>       * case the low 1MB.
>>       */
>>      BUG_ON(pvh_boot && trampoline_phys != 0x1000);
>> -    for ( i = 0; i < 0x100; i++ )
>> +    for ( unsigned int i = 0; i < MB(1) >> PAGE_SHIFT; i++ )
> 
> I would use PFN_DOWN() rather than the shift, but that's just my
> preference.

Oh, yes, fine with me.

Jan

