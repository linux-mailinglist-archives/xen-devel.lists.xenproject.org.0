Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852CD8D88F7
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 20:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734997.1141149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sECn5-0007iW-9y; Mon, 03 Jun 2024 18:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734997.1141149; Mon, 03 Jun 2024 18:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sECn5-0007gD-7M; Mon, 03 Jun 2024 18:52:19 +0000
Received: by outflank-mailman (input) for mailman id 734997;
 Mon, 03 Jun 2024 18:52:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29W0=NF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sECn4-0007g7-95
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 18:52:18 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65cf6e0a-21da-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 20:52:16 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-35dcff36522so199547f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 11:52:16 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e56669a23sm4708045f8f.83.2024.06.03.11.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 11:52:15 -0700 (PDT)
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
X-Inumbo-ID: 65cf6e0a-21da-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717440736; x=1718045536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKxUQ0E03ZXKt081hO6/G9Tb33MrR59K+v3qCZgkfQg=;
        b=DFTXzedy5t+c57B+6Hw7+HB8F00iIFwCrXH9H4rMCoaGvGFGd0r5ujsegpEZALnbWL
         XXvCNdnM5YxnOvsOged++QKyPr0kYHh4UsFnP2BUDnn326yjtc5lrjSddPZ86LdqnyiE
         +j5Zcgxbkozqt/ScIWYP7hp8AYd5zwlBGpux6weKxOir61YcfJShYNA9Z0n3DUWGRNK2
         J2+ZcnwEZ7Yg7I9myxVc38scEZRVqbUFiPHNXdCljKyWfRnqR4d1hq+G4HfidQsNX3Hw
         5I2TqXxqs4W8I1RrQ1CoaBNiYDnWQb200akadE3UsUOnHpWuxGq0f7atWvVh2EkSHgNq
         CmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717440736; x=1718045536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKxUQ0E03ZXKt081hO6/G9Tb33MrR59K+v3qCZgkfQg=;
        b=LAYIheGK1Pqsc38af4i0Adm9scAldiSO0vXRUwI29bQXTc5ax/+gK8dk7QiTQgHAw0
         ubRuDVpr8fLi6RrjV7GKAKQajsD0pVn/VVTzLWMks0o9F6MvF+P9zKVyWBZz5BHe3r6d
         DpRjAnYdZvodoLi+VN0xr/+5fDtixwkvMwObzZpQmIeryDkjNpyJ7uNSRO/1tEIZHgF8
         Yaw+yzRo7vyjjtQkXIL/s6y9R6lX+wEWs1kHP9WhTgCP7tSidJFafqqg+1C5/DJV5k2Z
         ya4ytBd6lLT8AxyBtmmo009BLp8itdDpMvpUH8w7WT/qrwMoK0uxBGoFYqQ9Fd7rhiep
         O5uA==
X-Forwarded-Encrypted: i=1; AJvYcCXFjQ7n2ztUOkhE+TFaetnsdy7yXyKF/b4ipYfWB+5vF1xLbLbRIwu0OMyHALhxrz67NHfGgCOWhZsDBtSQuIaC3HYtPh9Cc+tmeWSaDys=
X-Gm-Message-State: AOJu0YxnuVW2M/iaYSljYvBs9Dn19d57xByOLczLErdqCHMM1AEm1nsj
	z6aL9FAL5r+1JkMflmGE77wh2uraNPt6zttTHhzPicZa1sXR3xfekue2HHbTgQ==
X-Google-Smtp-Source: AGHT+IEJZW9KdfEAUoyC9as1ECWnb173KMCJQarn7R6gGTk4tQSBvZl9zKEArGXcRGcXKs+7p8FzZg==
X-Received: by 2002:a05:6000:52:b0:354:e746:7515 with SMTP id ffacd0b85a97d-35e0f286676mr7506538f8f.34.1717440736173;
        Mon, 03 Jun 2024 11:52:16 -0700 (PDT)
Message-ID: <cb14826d-3c5c-45b8-aaea-30cfa85a450f@suse.com>
Date: Mon, 3 Jun 2024 20:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/5] automation/eclair_analysis: address remaining
 violations of MISRA C Rule 20.12
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
 <ba7e17494f0bb167fe48f7fe0a69fabc1c3f5d1a.1717236930.git.nicola.vetrini@bugseng.com>
 <90c40d6a-d648-46bb-9cb0-df11ac165bd7@suse.com>
 <085aabe9953d53e634d5cf75fecdb8b7@bugseng.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <085aabe9953d53e634d5cf75fecdb8b7@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 09:13, Nicola Vetrini wrote:
> On 2024-06-03 07:58, Jan Beulich wrote:
>> On 01.06.2024 12:16, Nicola Vetrini wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -483,6 +483,12 @@ leads to a violation of the Rule are deviated."
>>>  -config=MC3R1.R20.12,macros+={deliberate, 
>>> "name(GENERATE_CASE)&&loc(file(deliberate_generate_case))"}
>>>  -doc_end
>>>
>>> +-doc_begin="The macro DEFINE is defined and used in excluded files 
>>> asm-offsets.c.
>>> +This may still cause violations if entities outside these files are 
>>> referred to
>>> +in the expansion."
>>> +-config=MC3R1.R20.12,macros+={deliberate, 
>>> "name(DEFINE)&&loc(file(asm_offsets))"}
>>> +-doc_end
>>
>> Can you give an example of such a reference? Nothing _in_ asm-offsets.c
>> should be referenced, I'd think. Only stuff in asm-offsets.h as 
>> _generated
>> from_ asm-offsets.c will, of course, be.
>>
> 
> Perhaps I could have expressed that more clearly. What I meant is that 
> there are some arguments to DEFINE that are not part of asm-offsets.c, 
> therefore they end up in the violation report, but are not actually 
> relevant, because the macro DEFINE is actually what we want to exclude.
> 
> See for instance at the link below VCPU_TRAP_{NMI,MCE}, which are 
> defined in asm/domain.h and used as arguments to DEFINE inside 
> asm-offsets.c.
> 
> https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/staging/X86_64-BUGSENG/676/PROJECT.ecd;/by_service/MC3R1.R20.12.html

I'm afraid I still don't understand: The file being supposed to be
excluded from scanning, why does it even show up in that report?

Jan

