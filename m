Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAF587D118
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 17:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693931.1082637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlAHV-000694-Af; Fri, 15 Mar 2024 16:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693931.1082637; Fri, 15 Mar 2024 16:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlAHV-00066w-7w; Fri, 15 Mar 2024 16:19:41 +0000
Received: by outflank-mailman (input) for mailman id 693931;
 Fri, 15 Mar 2024 16:19:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9knB=KV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rlAHU-00066q-6a
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 16:19:40 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1bdf95a-e2e7-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 17:19:38 +0100 (CET)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-690c1747c3cso20834606d6.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 09:19:38 -0700 (PDT)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gg8-20020a056214252800b00690befbe5a5sm2165055qvb.74.2024.03.15.09.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 09:19:36 -0700 (PDT)
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
X-Inumbo-ID: d1bdf95a-e2e7-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710519577; x=1711124377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CKu39slrG6a1VHtNDYlfaSJE1xOSh8axePXwE8pvjAU=;
        b=aShxp+o+L0vL7eb1VGdusHz33qT4jywa3ITUeOJ/WL+kjk+rBh2qC288mjKPqFPTiQ
         1ADweh4PdDPskLr6+FuJuUF9kvQXAblm1dl43RDcvB5VF0vEXEyEAZgIbeXCmuG7usVV
         v+mcejb3Y902VzSvXPXZ5HOqFL60sLIDFYNPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710519577; x=1711124377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CKu39slrG6a1VHtNDYlfaSJE1xOSh8axePXwE8pvjAU=;
        b=MwxRcLWwRGJin5STAVbrjFeu2OedOgcWs3F74M8Zp1zPhsqn+cU0lxQ1xNU8OIQasi
         nK7TioQfZXssnPPinotb4+vYcm6mQxM86GeNCycJ2itTWlHRCnQExvtbIWKu0iaZsmC2
         N7cMnZsXtakf3EZZVJP4Su/iPEeD87qu2b7QfrnGaW51J2GA3BOjx1v2o4pG0eAlhAD0
         zIL3rEXTJL2Tp3OtOkcCGrnN1ysY48l0WW6fK2lvBvRw8BzkHqZq6o2GpNDaw94dzuxm
         hVr2A4Q+MX4wUlN7GPLXMYlugRnWFd8s66YN85sN7ScSDqhLhoLMxB52vlBOmuZnOUmo
         LmLA==
X-Gm-Message-State: AOJu0YwRHIYYyImKme3yQ4vSPwNGTWpVHgVUP4Ve3O07kREkPOnrejUS
	9G3VVfcBjHbccFp/l4qOEVIK1qM96HG8xhOb1/QH7mt/c+4f+kNRyhL62d40KI31X/s9sPmCKLI
	2
X-Google-Smtp-Source: AGHT+IFlA/OyynrsC5394jj0QMAwobbYSi/kX11eVpi5V7h2Mpeg4vY4wqUHPgCKvwUzUZ8Po1dRVA==
X-Received: by 2002:a0c:f2d0:0:b0:690:d4e7:1374 with SMTP id c16-20020a0cf2d0000000b00690d4e71374mr9548918qvm.13.1710519577378;
        Fri, 15 Mar 2024 09:19:37 -0700 (PDT)
Message-ID: <38ed2c56-67f3-4d6d-9766-38a294661af6@citrix.com>
Date: Fri, 15 Mar 2024 16:19:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vpci: Improve code generation in mask_write()
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20240315121322.3300387-1-andrew.cooper3@citrix.com>
 <ZfRlo2mzARgue1cz@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZfRlo2mzARgue1cz@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/03/2024 3:13 pm, Roger Pau Monné wrote:
> On Fri, Mar 15, 2024 at 12:13:22PM +0000, Andrew Cooper wrote:
>> The use of __clear_bit() forces dmask to be spilled to the stack, and
>> interferes with the compiler heuristcs for some upcoming improvements to the
>> ffs() code generation.
>>
>> First, shrink dmask to just the active vectors by making out the upper bits.
>> This replaces the "i < msi->vectors" part of the loop condition.
>>
>> Next, use a simple while() loop with "clear bottom bit" expressed in plane C,
>> which affords the optimiser a far better understanding of what the loop is
>> doing.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Noticed when looking at the ffs() code gen improvements.
>>
>> Any suggestion on how to test this?  test_vcpi doesn't seem to check anything
>> here.  I think I've got the boundary conditions for msi->vectors right, but
>> I'd be lying if I said I was certain...
> There's no easy way to test this because it relies on having a PCI
> device underneath.  test_vpci just checks the logic to add & remove
> handlers, but doesn't get remotely close as to attempting to provide
> some kind of dummy environment for pass through to be sanity tested.
>
> I should look into it.
>
>> bloat-o-meter reports:
>>
>>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-28 (-28)
>>   Function                                     old     new   delta
>>   mask_write                                   142     114     -28
>>
>> which is a consequence of the compiler having a much better idea of what's
>> going on in the loop.  There's more to come with the ffs() improvements too.
>> ---
>>  xen/drivers/vpci/msi.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
>> index d3aa5df08941..30adcf7df05d 100644
>> --- a/xen/drivers/vpci/msi.c
>> +++ b/xen/drivers/vpci/msi.c
>> @@ -169,13 +169,15 @@ static void cf_check mask_write(
>>  
>>      if ( msi->enabled )
>>      {
>> -        unsigned int i;
>> +        /* Skip changes to vectors which aren't enabled. */
>> +        dmask &= (~0U >> (32 - msi->vectors));
> Do we need to ASSERT that msi->vectors <= 32 in order to avoid
> theoretical UB?

I don't think so.  Things have gone catastrophically wrong elsewhere to
get here with 64 or 128.

All this does is stop calling the set-mask callback for disabled vectors.

~Andrew

