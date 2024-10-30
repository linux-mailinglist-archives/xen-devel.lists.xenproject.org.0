Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1281A9B6288
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 13:04:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828163.1243011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t67R7-00078d-G3; Wed, 30 Oct 2024 12:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828163.1243011; Wed, 30 Oct 2024 12:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t67R7-000775-D4; Wed, 30 Oct 2024 12:04:29 +0000
Received: by outflank-mailman (input) for mailman id 828163;
 Wed, 30 Oct 2024 12:04:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t67R6-00074O-FQ
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 12:04:28 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19e14d71-96b7-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 13:04:23 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4319399a411so50443145e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 05:04:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd99edebsm19581225e9.45.2024.10.30.05.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 05:04:22 -0700 (PDT)
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
X-Inumbo-ID: 19e14d71-96b7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE5ZTE0ZDcxLTk2YjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjg5ODYzLjEyODc2OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730289862; x=1730894662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cqfQ3IStKbRYRoeXW4hTyv1TuZbK6ZYqQ3juHqr1de8=;
        b=aXnPNbSASpRxp8AaYhK2UK9GnIKsBrdKaZJyLOYGt2SD+ocWfTIDOJ9qq2EJxmaszL
         CWqVoDQ9HBJuIf5BJSqAVzIElhlzNyn8JvgEBsiiNrC3icR1hcrNfwcufY1LIWkxqHnZ
         dHVks2JfuJrP2iHhhAAg0mMWw8U6D0wIWxKEb8IoHbqDsE/Gh1MZf1ykm7doIuFDBuVj
         IwLL6kGTX5oQN3tuwiZV8quGbZ5YBlH0e35ZsqgTbAibnaEE2RqeZlv2wHIljXg5guPp
         iFDQg4LwHFwpjy+aQvr+B8vDG6iBvxyJXpsVkcNxNiYr8S/ACR/47AqkPxMjSFBq7PKx
         bAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730289862; x=1730894662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqfQ3IStKbRYRoeXW4hTyv1TuZbK6ZYqQ3juHqr1de8=;
        b=orCekEvb/LF8Gqj7MA2k/+nyg5cu1b6Cg8h14s36hixLSxPTjkh/ZUgSRD7GjOjx9V
         DQKiItB17QH8gJN6Rf6Nfg3ZtjCTRqt2cxNVpO8azu5GO2mK++9JA83VRA02qjOiG5SL
         ZhzZL/bE2wki/0CHMJaSZPBVkDDrJCFYfTXkfM5EusIVQZqyyjX4NsyYOzp7lM5Ml6Mk
         e7leaBvr2j4edKKAOX4yiQo4oKVu/jBKh3V4gtmWkocFxYwansb7f8TISjJ0rK/XZZ63
         hrLfGmNluzHtCVeS/LJ1vkTgJ9MeE60BKxDvsGgIjJFdsnhg2sJ8Ocn/s1rFqLb3XYGj
         C5bA==
X-Forwarded-Encrypted: i=1; AJvYcCVmIhuVIJru1SuSs/kekK2yHRCDNuNvlvUX5QOT5myhmJPPHYnQ8DUUq57X5cb6rJwfwflBqY6VuG0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyM7PtERpP1qLbMKPeCOh4pSoRk0VsCQqVEx6cGjLVwbuiYQ6T4
	llGbLVgZifyDnQUl3DN67hf2hXl3MSo1CMKw3gZt8Cz521WkirVcsfUG4zjGaQ==
X-Google-Smtp-Source: AGHT+IEiVbx+VtOMQrip7AYfKFMyIoeHLqnQKO+8x2XV2/BVpbXU+iaMH3fYD2Uw+BYEkc7bcsr8+g==
X-Received: by 2002:a05:600c:3b13:b0:42f:8515:e4a8 with SMTP id 5b1f17b1804b1-4319ac70780mr111863875e9.6.1730289862450;
        Wed, 30 Oct 2024 05:04:22 -0700 (PDT)
Message-ID: <b1332284-2ba4-44bf-ab32-dd941b60f4eb@suse.com>
Date: Wed, 30 Oct 2024 13:04:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/10] tools/hvmloader: Retrieve (x2)APIC IDs from the
 APs themselves
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
 <20241021154600.11745-5-alejandro.vallejo@cloud.com>
 <e8e2385d-b575-4483-ba54-f80c669af9c3@citrix.com>
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
In-Reply-To: <e8e2385d-b575-4483-ba54-f80c669af9c3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2024 12:31, Andrew Cooper wrote:
> On 21/10/2024 4:45 pm, Alejandro Vallejo wrote:
>> --- a/tools/firmware/hvmloader/mp_tables.c
>> +++ b/tools/firmware/hvmloader/mp_tables.c
>> @@ -198,8 +198,10 @@ static void fill_mp_config_table(struct mp_config_table *mpct, int length)
>>  /* fills in an MP processor entry for VCPU 'vcpu_id' */
>>  static void fill_mp_proc_entry(struct mp_proc_entry *mppe, int vcpu_id)
>>  {
>> +    ASSERT(cpu_to_x2apicid[vcpu_id] < 0xFF );
> 
> This is just going to break when we hit 256 vCPUs in a VM.
> 
> What do real systems do?
> 
> They'll either wrap around 255 like the CPUID xAPIC_ID does, or they'll
> not write out MP tables at all.

"at all" may be going a little far. They may simply not advertise CPUs with
too wide APIC IDs there, while still allowing others to be discovered this
legacy way.

Jan

