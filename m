Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AD092EB73
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 17:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757581.1166602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRvX8-0000EX-4b; Thu, 11 Jul 2024 15:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757581.1166602; Thu, 11 Jul 2024 15:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRvX8-0000D1-1d; Thu, 11 Jul 2024 15:16:34 +0000
Received: by outflank-mailman (input) for mailman id 757581;
 Thu, 11 Jul 2024 15:16:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRvX7-0000Cv-FX
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 15:16:33 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e0b8e35-3f98-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 17:16:32 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso1332615a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 08:16:32 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6e1742sm259545066b.70.2024.07.11.08.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 08:16:31 -0700 (PDT)
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
X-Inumbo-ID: 8e0b8e35-3f98-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720710992; x=1721315792; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tnPB3qftd3vvj7nZ0A4tQ6LT0BW77BDW/tokRA8p4N8=;
        b=M4YsfEVVQ09PxP/Md7ZHYKKis6o8az2fKJ2Lg71v9Yn1r/i3RctXKll3/wHuG0c0R9
         wEi0MAfoIE11ihLD+uRD9Jb3TwkXkndgRCllKws8AcROEVbPfAI+npmLFH2GcTHzvZ2W
         tlgo+VhiULSIWJo2BAUoMk45EkkYQi+e4sRxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720710992; x=1721315792;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnPB3qftd3vvj7nZ0A4tQ6LT0BW77BDW/tokRA8p4N8=;
        b=gNF38u6zw61ybf/VmtR6/wB+5uJlSFAPye6xuiLTCsSfvIGrq6b0+5TGpX1tE57Q5b
         EuVGXLlaNFPYrCvE4fWZ0TJ9Cy/Gp53osukRzH3jgqd/qbBKoqDUhiJ6eHZKL08WZM/K
         tHMAuS7MNfQV46MKwvyurjPw1MnO88s2NKR2w9r+wvckOQMDHqG3p10yVIlHInrRmWkU
         tC8u0peKAlLvSGOV95WBrC/DLdoozBr1dtoSORJagcsfvioyXefyYHCxWyLiFCBfQqLj
         q4S3jKaHEMTnKKVXLqxfQZ8LocB+uwhhoKXjV14H11cJ5DFDCZrmXFbdJxtbA2SXW23x
         okLA==
X-Gm-Message-State: AOJu0YyN2hOSl35FGD1lHjQSSsrU7dHJOt6+8mZanPIEqzI/O0FcJ7f1
	6VSOK/Y1qY4eLWggvoSY+ypN9xErvflTH0+CqENyovhm45DWVF9fWXxqldBDQhI=
X-Google-Smtp-Source: AGHT+IEFCS+n1qmG64ndRkSMvJq6C7dUY+95piaeO7uisZ/gjR9WXMlexO563ET4dhIZelP0D+c7fg==
X-Received: by 2002:a17:907:3f1a:b0:a79:82c1:a5b2 with SMTP id a640c23a62f3a-a7982c1a956mr447560866b.9.1720710991756;
        Thu, 11 Jul 2024 08:16:31 -0700 (PDT)
Message-ID: <5eb4de29-edd3-447a-845a-57d20ad8462b@citrix.com>
Date: Thu, 11 Jul 2024 16:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] CI: Remove useless/misleading randconfig jobs
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
 <20240711111517.3064810-3-andrew.cooper3@citrix.com> <Zo/ZdG8pt5FIledD@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zo/ZdG8pt5FIledD@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/07/2024 2:09 pm, Anthony PERARD wrote:
> On Thu, Jul 11, 2024 at 12:15:07PM +0100, Andrew Cooper wrote:
>> Randconfig builds pick CONFIG_DEBUG with 50% probability.  Therefore
>> $foo{,-debug}-randconfig are two identical jobs with misleading names.
>>
>> Furthermore, arm64 has a randconfig jobs for both the alpine and bookworm
>> build environments.  Both use GCC 12.2, so we have 4 identical jobs.  Delete 3
>> of them.
>>
>> This leaves us with 4 primary randconfig jobs:
>>
>>   gitlab-ci/build.yaml:381:debian-bookworm-gcc-arm32-randconfig:
>>   gitlab-ci/build.yaml:429:alpine-3.18-gcc-arm64-randconfig:
>>   gitlab-ci/build.yaml:495:archlinux-current-gcc-riscv64-randconfig:
>>   gitlab-ci/build.yaml:640:debian-bookworm-gcc-randconfig:
>>
>> as PPC64 doesn't want randconfig right now, and buster-gcc-ibt is a special
>> job with a custom compiler.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.

>
> Thanks,
>
>> If we want to run multiple identical randconfig jobs, that's spelt
>>
>>   parallel: 5
>>
>> in the configuration, and here is an example of what such a run looks like:
>>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1368824041
>>
>> Notice the randconfig jobs have a 5 in place of a retry button, and show a
>> submenu when clicked on.
> We already have "parallel: 2" on the whole pipeline, give or take, but
> those are quick jobs so it might be worth it to run them a few more time
> on a pipeline.

I'm afraid I don't follow.

The runners themselves are set up to run concurrent jobs.  I could well
believe that's spelt parallel: in the runner config files.

Here, its really jobs:parallel which is the way of saying "I want 5
copies of this job to run in the pipeline".

Obviously, 5 is arbitrary.  I was thinking of having a scheduled (once
per day, at 3AM or whenever) running randconfig only with a parallel:20
or so, so we can make good use of otherwise-idle time.

~Andrew

