Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A77784CC9A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 15:25:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677687.1054447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXirE-0004iI-Me; Wed, 07 Feb 2024 14:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677687.1054447; Wed, 07 Feb 2024 14:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXirE-0004f4-Jm; Wed, 07 Feb 2024 14:25:00 +0000
Received: by outflank-mailman (input) for mailman id 677687;
 Wed, 07 Feb 2024 14:24:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7Cu=JQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rXirC-0004ey-Rs
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 14:24:58 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab8ddbe0-c5c4-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 15:24:57 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56001b47285so828124a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 06:24:57 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v30-20020a50a45e000000b0056023efc5besm756492edb.53.2024.02.07.06.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 06:24:57 -0800 (PST)
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
X-Inumbo-ID: ab8ddbe0-c5c4-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707315897; x=1707920697; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YXilhrGUfIHrLwjt0i+K1G2q3zjUJ7iYeyluDTomkHQ=;
        b=tcXCCoTcyxlgmP9tfnApZ5fES3CJiMTbw0b5GLO2VbzhW6Hw0y8IfsjSEcCpsQI0Jr
         y2gMaraJKWsKnmBI1FRc3e+dkQfks6Rv1rpwQu3FJKeOEM1xROD/93OHoetw7wao7Fmi
         156Q2QXz5yqwXRcuYNoYxExQBhx+oIRNGEXmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707315897; x=1707920697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXilhrGUfIHrLwjt0i+K1G2q3zjUJ7iYeyluDTomkHQ=;
        b=Bsz/kvfEVQ/vXhkRzPLG8E3CiqHGKpkim2njvQLoHtjluZmaiHMubFJnbZz/Wuqa0e
         Jqj9GpQ+d6icM52zGOA5pqpEH+PUz36D4Kf5WKHGHK4+WNdCyOMeH/la0Jerca7YNWYt
         01EAJCqo9gqO2QqfYBRQlWQWNB6iDLd7ozAsxNgPQMh+Vrf2VwjulDXxbjUr0f0NVImS
         a8cQSRzuhCo6HDGlRlWjps5HSMCT6AZtpU6UoISV6qAKRD1vF5IscWo920cbUX/iGWsP
         gt96QAOVnZ68ibaFqICRZ91zIJc62REjD/ct8d41Pp/s9OEZwoColzFD+M8BWb1CxrtV
         QWFQ==
X-Gm-Message-State: AOJu0Yxpv2uM7BhezFvB2Kp4l4J5bdjbcP1I5eV1prI7CaRH0KH/KCQS
	tGYf6EjghhwosLXsgKXg0ezmmyxgLaTFRfECSLriEF+oZzUNVDlW2BviY7ac5GU=
X-Google-Smtp-Source: AGHT+IHOSn0TVoob/vj6+vgW8+pgnuW54al1/4+1LQar4mwK9hG5hs+HolndV8AG8Omz4htzmryvgQ==
X-Received: by 2002:a05:6402:31f3:b0:55f:f2ae:20ed with SMTP id dy19-20020a05640231f300b0055ff2ae20edmr4150228edb.16.1707315897417;
        Wed, 07 Feb 2024 06:24:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPudKpEgYVB1GH3Oa+Qf4lNCV0U0Z3h/Yp8hJ0kr4wS62UOm6Jt1v9LW8OdmeR3xSNxu0ebHxToC1ElSRIN+bWAzyXYfJL1p3l1L2HrEFnEObFjmCVs0FlPoVakgjt889/xeDw2X3NNP0=
Message-ID: <65665f86-cbfc-4352-9d81-67ac0b21b161@citrix.com>
Date: Wed, 7 Feb 2024 14:24:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | f4519ee8
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <65c38d7a7ea07_2d1b5321c96792@gitlab-sidekiq-catchall-v2-779bdffdc8-kp98w.mail>
 <115f10ac-a115-40d1-a444-50e960320557@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <115f10ac-a115-40d1-a444-50e960320557@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/02/2024 2:20 pm, Jan Beulich wrote:
> On 07.02.2024 15:02, GitLab wrote:
>>
>> Pipeline #1167820960 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
>>
>> Commit: f4519ee8 ( https://gitlab.com/xen-project/hardware/xen/-/commit/f4519ee87ebfb74fe0451130d82c99453b75e2e1 )
>> Commit Message: eclair: move function and macro properties outs...
>> Commit Author: Maria Celeste Cesario
>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>>
>>
>> Pipeline #1167820960 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1167820960 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>> had 1 failed job.
>>
>> Job #6116519549 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6116519549/raw )
>>
>> Stage: test
>> Name: qemu-smoke-riscv64-gcc
> I have to admit that I can't connect what was pushed recently to this job
> failing.

The qemu smoke tests for riscv and ppc intermittently fail on the
OSSTest-lab infrastructure in Gitlab.

We've never got to the bottom of it.

~Andrew

