Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0B8996FC5
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 17:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814834.1228521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYfx-0002vB-EF; Wed, 09 Oct 2024 15:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814834.1228521; Wed, 09 Oct 2024 15:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYfx-0002sm-BX; Wed, 09 Oct 2024 15:32:33 +0000
Received: by outflank-mailman (input) for mailman id 814834;
 Wed, 09 Oct 2024 15:32:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syYfv-0002se-G9
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 15:32:31 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b255b596-8653-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 17:32:30 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c8af23a4fcso8522997a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 08:32:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c92ff3a267sm173343a12.72.2024.10.09.08.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 08:32:29 -0700 (PDT)
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
X-Inumbo-ID: b255b596-8653-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728487950; x=1729092750; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IBl5PMQsVJkRgqUZiKmNB0QuqpHX2Sf9BgRLdoD7dng=;
        b=EX/14q2XqCALw5cf+hCGQgVO0yQNUe9jgQvkm9VHAaBVbK5T8ZE2GQjL/aPiwJSqig
         N3zQ+szAgRdf73Gc2DJRU1MzK38hB1+Y076Z0BEUWT2Zt4k8Ysh1IVZGZsLkKzuM4FUn
         cKbPM88gck+2fhbEjxzXwHiSkrUOsfKjM1uy94fPYo+uN02X4d6UuINnF42p2PtXX2P/
         qQ/F9cqpWNGVvobkMN7pN0MktIxxzrqQDnWQNxZP61Tv5kVBndFq86noFo9/IkZbBz54
         o7KI+Im7tNI/iX+qsKwk8ZAFewXRE2/ed7bK+X5BybR2Xqqa0ivAfgu6t1tm5MI5KDcY
         Y4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728487950; x=1729092750;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBl5PMQsVJkRgqUZiKmNB0QuqpHX2Sf9BgRLdoD7dng=;
        b=a5FatU0ypuf3m5kqvd4DeFY8d0mKHcQYH5R0YT3uQG/1ysYXbP3DllpzYQENgQxmFl
         XVVjIUXyjvJrGX7P+Rb2gXZ/YHc08SmjuMeCmcNhBEjqT53bO18D+roqQimjucwFwqvu
         lJpLGGhWa1uBtvJJjONbRkQywd8HrjRs3x8z9pWTOkG2ZYYj7WSw8nf78xafiDnfeJQU
         tHsn0Ibk0Q14Oes1TrXdRZaG1Uyst5hE1g0XYF6YE63bx9dXv06WgevVwTxa/WCzjO6P
         TMk0kw9NcYUCexOxKpAbmsAKqF3bXD+P5EFV1s3sf6jmKAq7xkO0HV+e1BQs8OkwrGgR
         EzgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKn9DjszWGTBuVCszlB3FuKQnoVYjuEWfhx8pJZmfj8fyuI+S/yBg/bjqby2geyyT9Uk2vXBwPvqM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywt4n6fSekq45TVNoby8bDOoPDyFwqF7I+0/ovRFkYJ0EC7nf6w
	BQsYqZFIfHGl3OC63kiIWM3hLgWHaRvqpByTpFmKvaUdu6yoAawdHtvmv89S6sF8YNNGPT+zwTE
	=
X-Google-Smtp-Source: AGHT+IF3/3MW28h8VTBpp+QXbP5PvaAOEwlpbai8vXhfNn9+q/KvccAVO58+GEbox0aU62VkIsKRuQ==
X-Received: by 2002:a05:6402:5209:b0:5c5:c4b9:e68f with SMTP id 4fb4d7f45d1cf-5c93241df0fmr198701a12.5.1728487949875;
        Wed, 09 Oct 2024 08:32:29 -0700 (PDT)
Message-ID: <c8e3ac4f-642b-4dc2-b73e-7018e27f6c76@suse.com>
Date: Wed, 9 Oct 2024 17:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/44] x86/boot: introduce boot module flags
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-11-dpsmith@apertussolutions.com>
 <9372d72c-c98d-495b-bc3c-8b81208f7cd5@amd.com>
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
In-Reply-To: <9372d72c-c98d-495b-bc3c-8b81208f7cd5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.10.2024 22:02, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> The existing startup code employs various ad-hoc state tracking about certain
>> boot module types by each area of the code. A boot module flags is added to
>> enable tracking these different states.  The first state to be transition by
>> this commit is module relocation.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/include/asm/bootinfo.h | 4 ++++
>>   xen/arch/x86/setup.c                | 8 ++++----
>>   2 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
>> index 6941a8975ea6..021ff0d93643 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -31,6 +31,10 @@ struct boot_module {
>>        */
>>       unsigned long headroom;
>>       enum bootmod_type type;
>> +
>> +    uint32_t flags;
>> +#define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
>> +
> 
> Stray newline.  Otherwise:
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



