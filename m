Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A29D4DE6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 14:41:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841504.1256991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE7Pm-00067q-Hx; Thu, 21 Nov 2024 13:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841504.1256991; Thu, 21 Nov 2024 13:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE7Pm-00065Z-FO; Thu, 21 Nov 2024 13:40:10 +0000
Received: by outflank-mailman (input) for mailman id 841504;
 Thu, 21 Nov 2024 13:40:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tE7Pk-00065T-B1
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 13:40:08 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cf89ba9-a80e-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 14:40:04 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a99f3a5a44cso137831466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 05:40:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f4368728sm81853266b.175.2024.11.21.05.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 05:40:03 -0800 (PST)
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
X-Inumbo-ID: 1cf89ba9-a80e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFjZjg5YmE5LWE4MGUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTk2NDA0LjI0OTk3NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732196404; x=1732801204; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rER2P1S97qYIe3gE3lSaUMaeg+LUuhJHScG/Xzp1hAU=;
        b=Y7QpoFAltNLp4Jnxmwq/GSmGWKEJu5bbiq6TU8HdwIJ4ZGlTkx5Wlh3WhLDzTizQDl
         hxMrn/iQ6Ex8ofl0gGOsI0vW9Yq7H08X7Ui6flrsByVPaeG579EbYlMD0yTpoS1I7RWN
         Z7RkHiMCCSJIngeq10E9YTH3fKU8fJGKd6NRsTEn76/5zYQxUV8HVGZlEMqnKF/VSuuy
         2NjfTCpcTeOPINpcdDH3PDvz+3xenjt1EViU2PDbtchaI79s8j02JlUDPeBYfpMqW0Sp
         4Wrxrf/oxPmt0wL+qxE3H3JBzz61vStfBNprJmJ75A27FQDZEzVUdxEvcnfePFIwg8OH
         GR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732196404; x=1732801204;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rER2P1S97qYIe3gE3lSaUMaeg+LUuhJHScG/Xzp1hAU=;
        b=dcWkCEHtiO+W3enVDMnDuxh3UoD8ikAfP1gBNgROmmoW/3XlgU9GApbwNbTyjntV78
         injIi9m55jBR4AGaOpyf3lRUFChdOZK42Cv6A4cz9k+43Tsx6GKVBpvQnDTCHtr9oY7r
         Ca10jbEpnd7kJXLMOn3TFOu3LC0kCWejk60JTpK86dUB1x9FtNFh8r1DVDyN0JpWIAWj
         uhcsn3LNYuG3iQX/cJuE5L3atC22dRFFFJGowSpEQ9uRIHjhsQnQSPHGJeo2KogHWGHo
         9PpPkFIpWjloGJFnFbP1wiJZOCZk2Ei9AXnK0J98+EDjmy9f7Mv8PtWiAetdSSFfmKqf
         LCYA==
X-Forwarded-Encrypted: i=1; AJvYcCV/DzttepeWQd0whnNIifPX3YcY4vLcujCl/Do/OwTD3DqmhVv5AB4t24ARhMzKDxAHHRWFYGBQ6s4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOWSMfWwuzFS/8UtKrA2WCVz5qkIWXGPdTLT8kK6xiTvcln2Qj
	+DMube2Ie3kcxNjkRcVo0NUF21bE5IkwIewkPou6n7CGtq+GzR1ROXG28y4LDQ==
X-Gm-Gg: ASbGncupkxY85hnxtoDJK6fb+qLo75YlK6nNO5QCgPoTs95M3h8uJWMIYzrtuSQiCot
	D8cb65O7G4raxicOf8Wa+NIxhTt7GvheRaI/ghnd9ad7MMameuTq2+6FR5QKZB+nrVLERgwrCT6
	UqxDDx98P5eyML6u+ZgoTYya3po3DkF7kdTgjXh7SQ0v2xN0CDITDgQ3+ohoFJ9WmfkpDJkGfm+
	bHDEJdodOFweKXK+/ezEE1VzsO8New6rkOxXSg/j4Jg+OkXxBH67Gy5JUxlWcWsv+RG0IeLsLdn
	dXUxY20UWpAWElresI81ejrfeiMhqnIU1P8=
X-Google-Smtp-Source: AGHT+IH1Jau7BJ+jBfLtqR5Y4JObGIflkGNWWF1rVezWjxrlVcOrGvnSSMoLVDFhkOMhcXXpfbR3mw==
X-Received: by 2002:a17:907:7f8f:b0:a99:ec3c:15cd with SMTP id a640c23a62f3a-aa4dd74b6ffmr580996466b.54.1732196403593;
        Thu, 21 Nov 2024 05:40:03 -0800 (PST)
Message-ID: <21cfb919-9150-4276-b613-d972a4b1d864@suse.com>
Date: Thu, 21 Nov 2024 14:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.20 release schedule
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: oleksii.kurochko@gmail.com, Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>
References: <e470822f190a41b2f1600821b81d7ad158ed33db.camel@gmail.com>
 <227db2a2-d36f-453e-8886-b8ef0d5f9616@citrix.com>
 <CACHz=ZjnfL_MorLcwduhJpUjFLX2y3KtQE8Pd4s=V68OgiV_rA@mail.gmail.com>
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
In-Reply-To: <CACHz=ZjnfL_MorLcwduhJpUjFLX2y3KtQE8Pd4s=V68OgiV_rA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.11.2024 13:53, Frediano Ziglio wrote:
> On Wed, Oct 30, 2024 at 1:25 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 21/10/2024 1:02 pm, oleksii.kurochko@gmail.com wrote:
>>> Hello everyone,
>>>
>>> As there were no objections to the proposed release schedule
>>> (https://lore.kernel.org/xen-devel/CAMacjJxEi6PThwH2=NwG3He8eQn39aiaxZCw3bQF7i4YcmjuNw@mail.gmail.com/
>>> ), I've updated the wiki with the schedule for Xen 4.20 release
>>> (https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes), and
>>> it is now accessible from
>>> https://xenbits.xen.org/docs/unstable-staging/support-matrix.html.
>>
>> I have a blocker to raise (against myself...) and no good idea of how to
>> proceed.
>>
>> The for_each_bit work has a unexpected bug.
>>
>>     for_each_bit ( ... )
>>     {
>>         if ( ... )
>>             break;
>>     }
>>
>> will fall into an infinite loop.  This is caused by for_each_bit()
>> hiding a double for() loop, in order to declare two scope-local
>> variables of different types.
>>
>> The two variables are one copy of the source expression (really quite
>> important to keep), and one unsigned int iterator (improved optimisation
>> capability by not using a wider-scope variable).
>>
>> Options are (off the top of my head)
>>
>> 1) Always take the iterator from outer scope
>> 2) Iterator always the same type as the source expression
>> 3) Figure out some way of expressing "once" in the outer loop
>>
>> Or anything else that I've missed.
>>
>> ~Andrew
>>
> 
> Something like
> 
> #define for_each_set_bit(iter, val)                     \
>     for ( typeof(val) __v = (val), __c=1; __c; __c=0)   \
>         for ( unsigned int (iter);                      \
>               __v && ((iter) = ffs_g(__v) - 1, true);   \
>               __v &= __v - 1 )
> 
> ?

Hmm, right, but then we don't even need a 2nd variable, do we?

#define for_each_set_bit(iter, val)                     \
    for ( typeof(val) __v = (val); __v; __v = 0 )       \
        for ( unsigned int (iter);                      \
              __v && ((iter) = ffs_g(__v) - 1, true);   \
              __v &= __v - 1 )

Jan

