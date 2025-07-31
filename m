Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7D1B174A5
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:05:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066011.1431424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVmm-00079G-LY; Thu, 31 Jul 2025 16:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066011.1431424; Thu, 31 Jul 2025 16:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVmm-00077V-H7; Thu, 31 Jul 2025 16:05:40 +0000
Received: by outflank-mailman (input) for mailman id 1066011;
 Thu, 31 Jul 2025 16:05:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8WGx=2M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uhVmk-0006t2-JK
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 16:05:38 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32f614ff-6e28-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 18:05:38 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45629702e52so4499625e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 09:05:38 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abeb2sm2855730f8f.11.2025.07.31.09.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 09:05:36 -0700 (PDT)
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
X-Inumbo-ID: 32f614ff-6e28-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753977938; x=1754582738; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iAic0Pc8nhr4wTIyvJuvuKH97ZCqZXWYYnDi/TzQFjE=;
        b=LcYz4qlqhG/S8O6PZXkh0PKyfnxdiKz9IYPjGY/5zPN1hnsOVDIJCkXyLrN7nzXAcF
         FPx2wX2zirqq4ypo4jmqzlgdf+BtmjdXH7p1OpJfzQEBp75Dx+MwEHeiSX6+17QoroFZ
         wvONSSbXpsMI4R+fnawNZ9/84kGaaBGYL3MUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977938; x=1754582738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAic0Pc8nhr4wTIyvJuvuKH97ZCqZXWYYnDi/TzQFjE=;
        b=gKt1DAHrS/3pnMULtai3AQLvSbgu4ouqipO3Zi9xi2ITA67e4zvZi2GGH//iamRNwH
         yrdQhSdWXRlis83DOmNeuBJy/FyYiK9ih8RpRFY9hKwm46wFfvACe+P4sKUu3wurpkDU
         7oaYODolFno74zzZ/BJq6r5061xDJzQliRA45zPXoVMmGu6K3jMkOhQhjuhdo0fW11DV
         4oQIn+SxWvVDzLNTtc1YijWH2m1ecdmvxB2tL3XJDOn94Nzp24MYpW+/VM0pp9VAMcEa
         jQFWUJPG81eoHdqXArNrIJZWQCtMHoHkYbAbxVKONNdDYUzokY+lNkMD6n3SMCT2+er6
         pQTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhB71sFCVxFm8As/FGdjsz1HyAk9Eb6ncHoKL1saHkc3ylmIn39TcrGjI3NCVXrz5JEH+6+IPQb0k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9Zoy3dMYGfcfgOFukbVOhCBu4NaDGGkK/os8kwwxnII7UY8TT
	40TIjSLVPy2BZgoR8UnoZs26jghKemTQDSU99cnjqSAUhhXrlVF+kuv2zwaKJ3gcs54=
X-Gm-Gg: ASbGncvB4jtSF/IYel3vrVy22SUepVomBUJvqeOSpsI062H8mCMccFqKcC3A3Qn+klr
	lt2UaXOJippW4yEw6AiG55AQpfEuM/+UHXm0VGNEW0iqMmBZe9W/BbP2yK8CKKLQc/qkX/kZgVa
	ZysFmvXP0ABxA/YmpKwVED+xAPkYMDi6gHLotEUxI1oKIwZVAA/eiD0qP5VSGmuZ+QxaZMK7zgn
	MLAjbJayfHaT3d61iJaFH1/qPIJMqJt+wajTcXf2+w04kWIfbzdkRr7HvBDGgyNlZ54jJVbUHkj
	1UoBQT3P1I0qU0kc29d5AGgku8VuZZF6Q68cOBW50ZemnpSD6iZyg5+PLaG8ytr9E13Dj9trTdM
	6sq0UFg9yneuqHNhLNHUYI3teO5KUa9FjO5mHLg7ahYk4shpkQr4UwYMEQvQW7p96wyanpyoRrb
	1VwIc079Z99njKcg==
X-Google-Smtp-Source: AGHT+IFhTD44IhqFgKh+s315gESAMnwFZddlKefIHDHG0MPzjsmwgcrhyAd+78VeJjtjlMxLbriOWw==
X-Received: by 2002:a05:600c:6297:b0:456:2771:e654 with SMTP id 5b1f17b1804b1-45892bd1a7fmr67226295e9.24.1753977937532;
        Thu, 31 Jul 2025 09:05:37 -0700 (PDT)
Message-ID: <9952fc5c-b95a-4879-a442-12e491438e08@citrix.com>
Date: Thu, 31 Jul 2025 17:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: fix violations in macros GVA_INFO, TRACE_TIME
To: Jan Beulich <jbeulich@suse.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <73cfc8a2d4d66042b49f44c69e672ce8ad0556ce.1753971749.git.dmytro_prokopchuk1@epam.com>
 <470a04e6-f8c1-4937-8478-0f80107d562d@citrix.com>
 <898e1c2a-7684-489b-84cd-254b2ee53e5d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <898e1c2a-7684-489b-84cd-254b2ee53e5d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/07/2025 4:58 pm, Jan Beulich wrote:
> On 31.07.2025 17:37, Andrew Cooper wrote:
>> On 31/07/2025 4:16 pm, Dmytro Prokopchuk1 wrote:
>>> MISRA Rule 13.1: Initializer lists shall not contain persistent side
>>> effects.
>>>
>>> The violations occur because both the `GVA_INFO` and `TRACE_TIME` macro
>>> expansions include expressions with persistent side effects introduced
>>> via inline assembly.
>>>
>>> In the case of `GVA_INFO`, the issue stems from the initializer list
>>> containing a direct call to `current`, which evaluates to
>>> `this_cpu(curr_vcpu)` and involves persistent side effects via the
>>> `asm` statement. To resolve this, the side-effect-producing expression
>>> is computed in a separate statement prior to the macro initialization:
>>>
>>>     struct vcpu *current_vcpu = current;
>>>
>>> The computed value is passed into the `GVA_INFO(current_vcpu)` macro,
>>> ensuring that the initializer is clean and free of such side effects.
>>>
>>> Similarly, the `TRACE_TIME` macro violates this rule when accessing
>>> expressions like `current->vcpu_id` and `current->domain->domain_id`,
>>> which also depend on `current` and inline assembly. To fix this, the
>>> value of `current` is assigned to a temporary variable:
>>>
>>>     struct vcpu *v = current;
>>>
>>> This temporary variable is then used to access `domain_id` and `vcpu_id`.
>>> This ensures that the arguments passed to the `TRACE_TIME` macro are
>>> simple expressions free of persistent side effects.
>>>
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> The macro `current` specifically does not (and must not) have side
>> effects.  It is expected to behave like a plain `struct vcpu *current;`
>> variable, and what Eclair is noticing is the thread-local machinery
>> under this_cpu() (or in x86's case, get_current()).
>>
>> In ARM's case, it's literally reading the hardware thread pointer
>> register.  Can anything be done to tell Eclair that `this_cpu()`
>> specifically does not have side effects?
>>
>> The only reason that GVA_INFO() and TRACE_TIME() are picked out is
>> because they both contain embedded structure initialisation, and this is
>> is actually an example where trying to comply with MISRA interferes with
>> what is otherwise a standard pattern in Xen.
> Irrespective of what you say, some of the changes here were eliminating
> multiple adjacent uses of current, which - iirc - often the compiler
> can't fold via CSE.

Where we have mixed usage, sure.  (I'm sure I've got a branch somewhere
trying to add some more pure/const around to try and help out here, but
I can't find it, and don't recall it being a major improvement either.)

The real problem here is that there are a *very few* number of contexts
where Eclair refuses to tolerate the use of `current` citing side
effects, despite there being no side effects.

That is the thing that breaks the principle of least surprise, and we
ought to fix it by making Eclair happy with `current` everywhere, rather
than force people to learn that 2 macros can't have a `current` in their
parameter list.

~Andrew

