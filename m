Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDE47AD5B8
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 12:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607776.946075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkihw-0005Ez-6r; Mon, 25 Sep 2023 10:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607776.946075; Mon, 25 Sep 2023 10:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkihw-0005Bd-3s; Mon, 25 Sep 2023 10:20:52 +0000
Received: by outflank-mailman (input) for mailman id 607776;
 Mon, 25 Sep 2023 10:20:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rzaM=FJ=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qkihu-0005BX-Q9
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 10:20:50 +0000
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 322bea63-5b8d-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 12:20:49 +0200 (CEST)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-577e62e2adfso3802238a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Sep 2023 03:20:49 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 t15-20020a17090a024f00b00256b67208b1sm10280962pje.56.2023.09.25.03.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 03:20:47 -0700 (PDT)
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
X-Inumbo-ID: 322bea63-5b8d-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695637248; x=1696242048; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/WMJeXdZnpKS9wvRULiLsNQE8Uy/4sYLBIN2QFxqLI=;
        b=GVMrzZeIBqMluhKCNroUYmj2lWW9VygEXYfHu+OS4LHpCiw86NYW8oN1MVekW6beuf
         glC+sozc3cE9G4xACyC3GwVwcsipNmDFqhhP+GraaDcCrU6SdX7kqxZuCvmgc1dTaCwB
         SHQz52upeXseTAlRp05BgTwi5dPkCbuTInHS/R1nCw1ZnLqnk+jJMDUm0Jl8iMdPhXpi
         SBp8OgjHq3VK+Rjo6h8RKNJyFFO81HtznhQiqLNfFtdw/q1MbgsqIOvlp0gahVHGmE6P
         22iMp8BrSxBm0EpmCcW11W152YCkvCYjAnzsI7fuvfe5C9hgxjly5hkzpxLrZmqwB1yD
         InzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695637248; x=1696242048;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/WMJeXdZnpKS9wvRULiLsNQE8Uy/4sYLBIN2QFxqLI=;
        b=vUx/HYTDZ4W7ULY0Lk9Akw4/ip3cXMbl2rj1l9f6nF+ZhCGVsvkpTxWZUAyAOedAKv
         3YYmQHGaPjyhFyhbnjfsxMD5al1bv8WEmaqFaYsHw8pEiBa9xlko+k01A2fpVohK8LFn
         kt4oMxQqFJW0qmGlVXsHqyJiDK8Dtr1PS8QhCITYpXUIIrmfihKo3CpKafPS3tJncsB3
         j1iBFQJoQ1A3isGmh1sI+RY1Xj8st6bBvVJeF1tH8JlIbbPlrGPLnwKbR5n1kJpdiItl
         QDL5oirG175MsV8pneAdZnAFRypOHYOJqz+Ix34vvqKvmaz+Ct6u7DJXEvpYt/y5VfYZ
         4PmA==
X-Gm-Message-State: AOJu0YxGBFrjzWloMu6Pu8DujsvkXG6EbvZMfvdb0ZqBYRPGvYpyjihy
	nu5ppyBdJkNDuo3kSLvUsbc=
X-Google-Smtp-Source: AGHT+IFONqDzSBZ3AOjo7ovjcBYj1+JeowPlrAkhfhZ4axCnWR9Q9vkaqJ+/N5CStUTgxDA1GP9USg==
X-Received: by 2002:a17:90a:e617:b0:263:829:2de with SMTP id j23-20020a17090ae61700b00263082902demr3979184pjy.2.1695637247809;
        Mon, 25 Sep 2023 03:20:47 -0700 (PDT)
Message-ID: <13e3a0e1-42fe-d954-f06e-88526d56e919@gmail.com>
Date: Mon, 25 Sep 2023 19:20:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-6-andrew.cooper3@citrix.com>
 <943d1d28-08de-3c1a-5a64-6caa98cdba78@suse.com>
 <43428539-4fe0-e2ac-48a0-b2fd9bcc0d1f@citrix.com>
 <f365e11a-9ca7-fb3f-ceae-28da7e1d6779@suse.com>
Content-Language: en-US
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: Re: [PATCH 5/7] x86: Introduce x86_merge_dr6()
In-Reply-To: <f365e11a-9ca7-fb3f-ceae-28da7e1d6779@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/25/23 16:30, Jan Beulich wrote:
> On 22.09.2023 18:11, Andrew Cooper wrote:
>> On 18/09/2023 12:37 pm, Jan Beulich wrote:
>>> On 15.09.2023 22:36, Andrew Cooper wrote:
>>>> The current logic used to update %dr6 when injecting #DB is buggy.
>>>>
>>>> The SDM/APM documention on %dr6 updates is far from ideal, but does at least
>>>> make clear that it's non-trivial.  The actual behaviour is to overwrite
>>>> B{0..3} and accumulate all other bits.
>>> As mentioned before, I'm okay to ack this patch provided it is explicitly said
>>> where the information is coming from.
>>
>> The information *is* coming from the relevant paragraph of the relevant
>> chapters of the relevant manuals.
>>
>> I don't need to teach programmers how to suck eggs.  Nor am I going to
>> quote buggy manuals (corrections are pending for both) as a
>> justification for restating several paragraphs of information as a oneliner.
> 
> Earlier on you said this to my original request:
> 
> 'SDM Vol3 18.2.3 Debug Status Register (DR6) says
> 
>  "Certain debug exceptions may clear bits 0-3. The remaining contents of
>  the DR6 register are never cleared by the processor."'
> 
> "Certain" and "may" do not describe the behavior that your change implements.
> Hence imo there's still a need to clarify where the extra information is
> coming from. Pending corrections are of course appreciated; in case you have
> been told the new wording already, perhaps you could quote that?

As an outsider's perspective, I think this kind of thing is where selftests
really shine.  I got the impression that Xen will need to rely on numerous other
platform oddities, the documentation of which are often unavailable.

Of course, adding a whole new test infrastructure in code freeze is not viable.
Maybe I have missed something, but I only see three paths forward here:

1. Reference the most relevant paragraph in SDM/APM, but don't quote it.
   Keep the current explanation, and state that the manual is vague anyway.

2. Acknowledge that SDM/APM is incomplete, and completely abandon the manual
   as the *authoritative* source of information.  Perhaps embed a sample test
   program that demonstrates the behavior, if it isn't too long.

3. Actually assert in runtime that DR6 behaves as expected.

> 
> Jan

-- 
Sincerely,
Jinoh Kang


