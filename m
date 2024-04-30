Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A96A8B6EE6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 11:58:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714699.1115987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1kFq-0007sU-2y; Tue, 30 Apr 2024 09:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714699.1115987; Tue, 30 Apr 2024 09:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1kFp-0007qR-Vm; Tue, 30 Apr 2024 09:58:29 +0000
Received: by outflank-mailman (input) for mailman id 714699;
 Tue, 30 Apr 2024 09:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OUm+=MD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1kFo-0007m4-4i
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 09:58:28 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3089dc43-06d8-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 11:58:27 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-790e7c02430so220080885a.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 02:58:27 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ay42-20020a05620a17aa00b00790f48e615fsm1737168qkb.63.2024.04.30.02.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 02:58:25 -0700 (PDT)
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
X-Inumbo-ID: 3089dc43-06d8-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714471106; x=1715075906; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jp5ONAqvKJG69Z758I++7qC8zo3IhFHGHUriRupNjPY=;
        b=nDfR+2XVt6IcxUkDTxrAli3CCNcdtmeBJjD/vk0RkUzT6aPbqXwNN8kxfNinvHht1r
         4OHw8O8EFokTp0U8RVRWKdB4BUViHAoK0I2UOjpoBG/2shDv+n1zmLJAAKZ+A0cVXb/m
         LsEIN31vYYeL0YixwCqLyo5ieRybnav1XZYbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714471106; x=1715075906;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jp5ONAqvKJG69Z758I++7qC8zo3IhFHGHUriRupNjPY=;
        b=Hfk9tIb7L5x0yslLIIzLMXsbhpVN6EdpwifE89BWAYU2j/KrpvFNdYIJRsRREpNl1s
         r8G425O1t8rEld4uwv5aDXnWs8zw3SZ+DPk5dd7Y3ot0+y/1vmHMcKmHHuLVzAf0gEKc
         YiqY3GadiJFRAqpBd+kutnvVj7FaOpnGSQrvH2gOmdjESQuqGbej3lNr8QhtRMv6c0rl
         hCx3jucIqJ4dNjzJRWe72CnXBzAi6/NXkGAtNQiFrssScUYduNeQYgP9OSzVQ6bM9Fjx
         CJ4tXsxmoNQU8Dq2CPspzXJD1Y00EgKgwagf0BVRdJ7Rf1O+davzBLpuE5v6Lm14hP7+
         gqgg==
X-Forwarded-Encrypted: i=1; AJvYcCXOMApoJ/xCY9XJv8qh+ZfZ861i3Zt2g+aggOMpsoqhserj0vJI+GpM3HTYgEm0weKmhL6WsJCHfeJs1C3vu6fVnw2CaKmg4dyJXiImn8o=
X-Gm-Message-State: AOJu0YxkqFMk+dhBMhGMVRsXUMQ8RILBUmRuAcQz47pUhlA4wSjoPMnU
	/wdpB035PQGVKfICQOKCgYMQa1vdCgADIGZCj9aLenJ7Bz981nILET4gTi2mD/E=
X-Google-Smtp-Source: AGHT+IGT23cPqj6PYAExJ+5RsQ3Lhlngu/Zp82LX10LO1GPmFGvwmJIULkDuilnsYfdxJAfmOP0/pg==
X-Received: by 2002:a05:620a:b82:b0:790:b6e0:e1ac with SMTP id k2-20020a05620a0b8200b00790b6e0e1acmr10955982qkh.6.1714471106254;
        Tue, 30 Apr 2024 02:58:26 -0700 (PDT)
Message-ID: <17589fc4-9755-4822-9092-f53078488363@citrix.com>
Date: Tue, 30 Apr 2024 10:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | b819bd65
To: Jan Beulich <jbeulich@suse.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6630a5ea2588_2c1971e1c10965b@gitlab-sidekiq-catchall-v2-ddbc855b7-4zkpr.mail>
 <892ad877-2576-4ce5-9110-47fa5f1fdb06@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <892ad877-2576-4ce5-9110-47fa5f1fdb06@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/04/2024 10:00 am, Jan Beulich wrote:
> On 30.04.2024 10:03, GitLab wrote:
>>
>> Pipeline #1272869158 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
>>
>> Commit: b819bd65 ( https://gitlab.com/xen-project/hardware/xen/-/commit/b819bd65f4fb25be582f66ba2e4134f61d86f459 )
>> Commit Message: revert "x86/mm: re-implement get_page_light() u...
>> Commit Author: Jan Beulich ( https://gitlab.com/jbeulich )
>>
>>
>> Pipeline #1272869158 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1272869158 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>> had 3 failed jobs.
>>
>> Job #6745823842 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6745823842/raw )
>>
>> Stage: test
>> Name: adl-pci-hvm-x86-64-gcc-debug
>> Job #6745823720 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6745823720/raw )
>>
>> Stage: analyze
>> Name: eclair-x86_64
> This flags start_nested_{svm,vmx}() as regressions, when the regression was
> previously spotted already. Is that intended?

Yes.

>  I.e. shouldn't the comparison
> be to the previous pipeline run, such that issues are pointed out only for
> what is actually being added anew with the patch / batch under test?

Why should it be?  That's unlike every other CI we use, even OSSTest.

Gitlab, like many others, is stateless between runs.

These violations are ones where we had got down to 0 in Xen, and Xen was
marked as "clean" for these rules.  Any nonzero count (in the subset of
things we think we've fixed fully) is a failure.

This is no different to e.g. a panic on boot.  OSSTest will keep on
complaining of a regression until it gets fixed.

~Andrew

