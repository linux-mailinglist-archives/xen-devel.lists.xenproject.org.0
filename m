Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7665B88DC46
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 12:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698431.1090061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRFZ-0005E5-AT; Wed, 27 Mar 2024 11:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698431.1090061; Wed, 27 Mar 2024 11:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRFZ-0005CY-7b; Wed, 27 Mar 2024 11:15:21 +0000
Received: by outflank-mailman (input) for mailman id 698431;
 Wed, 27 Mar 2024 11:15:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Df3K=LB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rpRFY-0005CS-8d
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 11:15:20 +0000
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [2607:f8b0:4864:20::c2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4aabbce6-ec2b-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 12:15:18 +0100 (CET)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5a4f9f94e77so3735689eaf.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 04:15:18 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g15-20020ac870cf000000b0042f0008b8b7sm4684413qtp.35.2024.03.27.04.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 04:15:16 -0700 (PDT)
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
X-Inumbo-ID: 4aabbce6-ec2b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711538117; x=1712142917; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy+MmpaP4f4rRok/rZVfnYWJYxNaoshHSELahBIh2/M=;
        b=f9kYouQivNToDRNBorhQLuSiAs0edVBrDfkB5zvmLa0M1zt/iy/blHOPEfdBVKAaV3
         s1MzkKB+AKv0eC+IUppfIEZHU5JoEpV8IjnL+p4lr/xwjfjquEXwXzQZhpTkg3Utb7Qa
         +I8IBYhUWVTAG/itUP6D+I3AXWUbGIZ3T1BoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711538117; x=1712142917;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yy+MmpaP4f4rRok/rZVfnYWJYxNaoshHSELahBIh2/M=;
        b=LIs4bbzCJsv+Tqg5aE1U8++5B8rxpNOwIb9PgdHTX9oifl2qMgC8LJJLamLW0KRYYR
         AhFfDSeX63DZEOCSoJgRW7FpoKC+UDDIqOdknN/baGJYuYb53X2epIeuP22mGZ0e+mIC
         /jotMQ6TZL55K0uiMgOk9WEemaU9vc4dPk4GJ4ORXdE4uclgnlfQl/Pf8LBGRbFpNU8T
         I7j5QvysFYa74fmB1rWLk6CqGZpmVm0jvW968QnDI9+kaLEmM8Ey9QIdrOh4U1Ms9y8m
         CKiqppFAjeSfvCbXNir34W3LKZeHBFvB7B80lYUgzHZ/ilLWlSd80AGpCr3Qsjf5PmEB
         jxVw==
X-Forwarded-Encrypted: i=1; AJvYcCXbHlI5cSCYAjuKDiCi2qavpHQfHUP3Q9tCsYodr8CfOLS/6eBxtQEvD20noUQmES3kTGv4el/R25WxmvhCNktPBCMcgz5vt19JRV1wtw0=
X-Gm-Message-State: AOJu0YyDhDjMX8EvlGbjRcOMadQTgdU3YlPCcmAS+ZOgykL+DVkvgijD
	HEO6R4BEbHT57/zhvhrZBmCnuxFr8eA2KbSvrGj/6uQVQLXFQSS/IAIvS6xvwAo=
X-Google-Smtp-Source: AGHT+IGtkgIDwBjmaOnm0pNYIORBNIDg2UZHWZVxJjcWe68+QcgdeSCoydQGc2TGgtY0D1HRTkKuBA==
X-Received: by 2002:a4a:ee97:0:b0:5a5:25b9:dec5 with SMTP id dk23-20020a4aee97000000b005a525b9dec5mr780346oob.2.1711538117006;
        Wed, 27 Mar 2024 04:15:17 -0700 (PDT)
Message-ID: <83c124e5-50c9-4bbe-95d1-3d83b3b87ff2@citrix.com>
Date: Wed, 27 Mar 2024 11:15:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | e3883336
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6603edcb4d254_2c5c1671823573e@gitlab-sidekiq-catchall-v2-995bd4ccb-hkbtp.mail>
 <24d80c55-1669-4eaa-a805-7e950205dc26@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <24d80c55-1669-4eaa-a805-7e950205dc26@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/03/2024 10:40 am, Jan Beulich wrote:
> On 27.03.2024 10:58, GitLab wrote:
>>
>> Pipeline #1229415063 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
>>
>> Commit: e3883336 ( https://gitlab.com/xen-project/hardware/xen/-/commit/e3883336bb5abba2ec2231618f5b64f61b099b1e )
>> Commit Message: xen/efi: efibind: address violations of MISRA C...
>> Commit Author: Nicola Vetrini
>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>>
>>
>> Pipeline #1229415063 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1229415063 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>> had 1 failed job.
>>
>> Job #6487283739 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6487283739/raw )
>>
>> Stage: test
>> Name: qemu-alpine-x86_64-gcc
> qemu-system-x86_64: terminating on signal 15 from pid 52 (timeout)
>
> I have to admit I have no idea what this is supposed to be telling me.

In these smoke test, Qemu is run with a timeout in case things hang/crash.

This is saying Qemu running Xen+Dom0 didn't appear to get to the login
prompt within the timeout that the test specifies.

As to why, that's less clear.  It appears that it was making progress,
just slowly.

~Andrew

