Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F158D50EE
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 19:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732896.1138938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCjTg-0005Vj-KZ; Thu, 30 May 2024 17:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732896.1138938; Thu, 30 May 2024 17:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCjTg-0005U2-H2; Thu, 30 May 2024 17:22:12 +0000
Received: by outflank-mailman (input) for mailman id 732896;
 Thu, 30 May 2024 17:22:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8pxM=NB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCjTf-0005Tw-9X
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 17:22:11 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25a3ab56-1ea9-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 19:22:10 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57a23997da3so956254a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 10:22:10 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31b99445sm35146a12.18.2024.05.30.10.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 10:22:09 -0700 (PDT)
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
X-Inumbo-ID: 25a3ab56-1ea9-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717089730; x=1717694530; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JB2maaoYCqR6n0ZV4f5ax1waFqmhG7Zo47ceb3HW61M=;
        b=L7DWXisPX/T1KZjwCQDFsdmd8G+GMSdwY4dnwvxuA5usuocvKRdc9V82xLhmDkHv7v
         saC0Fznn4B95kOawbVOAk8uA1Snr5Si1JWfdGfPNfy0yaoJNF1SmaY2K4JZblpQsPon8
         QzrrAd1DaSHRmLuCBcoKTaBdKG/DS0KRh5A6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717089730; x=1717694530;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JB2maaoYCqR6n0ZV4f5ax1waFqmhG7Zo47ceb3HW61M=;
        b=SSKWyIaE/5fzOdhJspmka+Vaj86vvBMbzv2x0l0mRHkalc3elJwgUEoYq3UcO/L1+b
         ZuiyDLpeG7LUnWcHF0bBntFBUQO53us2uFC0Iw68W11VRDS/u54Qb61wR7qNI52PxHcQ
         hjpRDeK+nghjOqirJjiQXU2YvbKQfSJX3eOYzILThSQMhwse2B5WexCzO638AJVc5a1m
         t8Ujowtdld0FpDjOMC5iG/M8jJcbPGFSu5orZevayUg//cijPLEE/Ol/vfn8gDSP6mn6
         odMeGXT6qKIg/ziEl8KDHHrr6fcHYHBx1AkTkpLfwVfkNyp2IihjdQZ3pgbfex59C3/u
         LSZA==
X-Forwarded-Encrypted: i=1; AJvYcCXt9yKK3uJQdpJ0El9/AhOUlbdb0Y75TOiKYGnumkU1+jaJnsyS7hrmEGM58LqJMtHfuoe28NFwiEPHqwoJU9mnhr/66uDkMskCABXCXKw=
X-Gm-Message-State: AOJu0Yyg3H+NICwLuMD9FRVghiLTgKyQuhTxVrh4vEKStcvqrWHpH8IR
	0fh7vqt/PGsXmhHev2ZqoQ5kprjFB5EzXj1xU1xrML83Fi8oRqXdZFo8ifpD/VC48caZvXGSr9H
	g
X-Google-Smtp-Source: AGHT+IFqD4g9gWrWBuQlAjhg3EVC8h6c95E84upKFYvRL8oiayZjf8iEtuFyZRTP+qWZE6fGLTyjSA==
X-Received: by 2002:a50:f69a:0:b0:57a:1e0a:379f with SMTP id 4fb4d7f45d1cf-57a1e0a381bmr1422422a12.16.1717089729646;
        Thu, 30 May 2024 10:22:09 -0700 (PDT)
Message-ID: <8f37cb67-32ae-4e01-af60-f94af136698f@citrix.com>
Date: Thu, 30 May 2024 18:22:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 8/8] xen/README: add compiler and binutils versions
 for RISC-V64
To: "Oleksii K." <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
 <c6ff49af9a107965f8121862e6b32c24548956e6.1717008161.git.oleksii.kurochko@gmail.com>
 <065c4b2f-93b6-428f-beca-b77e6f98cecc@citrix.com>
 <27148c63318ef78d542db7cc20373e3cb3836df3.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <27148c63318ef78d542db7cc20373e3cb3836df3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/05/2024 6:16 pm, Oleksii K. wrote:
> On Thu, 2024-05-30 at 17:47 +0100, Andrew Cooper wrote:
>> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
>>> diff --git a/README b/README
>>> index c8a108449e..30da5ff9c0 100644
>>> --- a/README
>>> +++ b/README
>>> @@ -48,6 +48,10 @@ provided by your OS distributor:
>>>        - For ARM 64-bit:
>>>          - GCC 5.1 or later
>>>          - GNU Binutils 2.24 or later
>>> +      - For RISC-V 64-bit:
>>> +        - GCC 12.2 or later
>>> +        - GNU Binutils 2.39 or later
>>> +          Older GCC and GNU Binutils would work, but this is not a
>>> guarantee.
>> This sentence isn't appropriate to live here.
>>
>> The commit message saying "this is what we run in CI" is perfectly
>> good
>> enough.
>>
>> With this dropped, Reviewed-by: Andrew Cooper
>> <andrew.cooper3@citrix.com>.  Can fix on commt.
> I am okay with dropping this sentence, but someone ( unfortunately I
> don't remember who Jan? Julien? ) requested it, and I think it would be
> nice to hear their opinion before doing so.

It's line noise, and literally a redundant statement.  The same is true
of every other line in the file, and we don't write it because that
would be incredibly stupid.

Anyone who wants to see why this was chosen can read the commit message.

~Andrew


