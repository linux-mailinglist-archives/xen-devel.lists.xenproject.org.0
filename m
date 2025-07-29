Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E31B15494
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 23:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063061.1428835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugrbw-0002eK-4r; Tue, 29 Jul 2025 21:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063061.1428835; Tue, 29 Jul 2025 21:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugrbw-0002ct-28; Tue, 29 Jul 2025 21:11:48 +0000
Received: by outflank-mailman (input) for mailman id 1063061;
 Tue, 29 Jul 2025 21:11:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/H3U=2K=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugrbu-0002cl-Sm
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 21:11:46 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a216d2a2-6cc0-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 23:11:45 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b78294a233so2489977f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 14:11:45 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953865dfsm1354505e9.18.2025.07.29.14.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 14:11:44 -0700 (PDT)
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
X-Inumbo-ID: a216d2a2-6cc0-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753823505; x=1754428305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hduzfZFjgMcEiUfZhhvrrxKo+Bv/lCTc5ngDyiNVc84=;
        b=kLPqtr9ddxofurL2x31AGXbab3gMw4TaSxE5YeFFXTp+pTIoGauXVmhyIxsZrvdOU2
         jvY/wKrVsc/dOTgoYYMx/zDQKaqY+HaTnql4yvKCP6IDfL6BfWVxF/AVr5n3YqRlmBPi
         1QH5m98JVp6rMYugK/QTFat/3smSXliAgsmAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753823505; x=1754428305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hduzfZFjgMcEiUfZhhvrrxKo+Bv/lCTc5ngDyiNVc84=;
        b=Q11+UWrgYe1xD0f+CNZK3WLftSg9b0Vmju5iH29FHkdzEUF+BXeV0MN8UQRNN30Jg8
         wcjhRFpzOigNrzbdk+FCQcDHaaa7xco8RFrn+Qbm6GW70cA9QTJl6FsQ6YPe3cU+6iZ5
         ss3mDfD9Z2SY47QPeR/mTAY7DBHqgr1QyQkQuOqM+9pxVsvn43eQMvRIK4hBTeibuSAC
         6nrYsr5kw3vWOLy7W8/+Hm8Tzc5JPc6tryhw13F80+lfAKy0j4lro1l3oTCU3htQuu/v
         dERuuy6uz2jUgMGkaL+M5J+sIBtB6LMNz76xXvYJs2BvAXr/61c4GzyiWElP7AYIc00B
         zfRA==
X-Forwarded-Encrypted: i=1; AJvYcCWMWJdQjFLlAQKWiT0xycMs6OlBEZh27aRmvl85gJhAnIatcQivVdOob5uNVzPwm4MpXgocFBdJLMU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydoAB6h/sYcwIzBaWVAV5Vbb+7pw+D8Dszbfve2iOhhh41dIBx
	FJcJDthatNpk7FUpgkx+L+uaHeKt1r3dfOPT95TZ1GWMgmZNk4L9pKABcftsRaHM8tc=
X-Gm-Gg: ASbGnctQ45MThuxtkrvJOafIr0Th4WPOF7tLI+3K96b6MroPvi1WH1B6ZvYv9Nh9aTo
	tkR1rCRsWuQJ3CtOhAZDEzG0XlF+lHE6iEObRtCozf8LeW3tffcnwSDIrEu/KHDh2DFzOwsOBFq
	dOJdAQlNQBf9Eu98O9Pk2o7hVRqczZCz+ojl3RqBj/KpfKVAIPJN3cP/5jhnupGIz2m2+7WYcnM
	6vF+OV7fB5nvVbtEWaCdWkFEXDRzsUrzflGpXS6mHH96gIkH9u15ufZ8+3ZupGaPArscI73V7ZR
	Q9fTi1kL4G65h8bek9FAnKMNgQMmVkKy/xQ3wUufKMM+zz7/hubcvYUw0sj8fNW7EYFs6G0DgAc
	g7v0PGR05Tclfy8mn+E7TuK2bUSLQNiu5dL3Nh3q6Wk91XU+GAW47HPFTAKAaQ/8byc0R
X-Google-Smtp-Source: AGHT+IFzT03cOpDSV2CZytiMQvasQT9XtqRRzbB2VEbk0DZ7I2twDBAy93P7h2r8havF7/fUnSc4RQ==
X-Received: by 2002:a05:6000:2289:b0:3b7:7680:35d3 with SMTP id ffacd0b85a97d-3b7950286fbmr729565f8f.37.1753823505216;
        Tue, 29 Jul 2025 14:11:45 -0700 (PDT)
Message-ID: <b8a2d3e4-6259-46ff-9404-a915dec79a2f@citrix.com>
Date: Tue, 29 Jul 2025 22:11:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: fix memory leak on error in vcpu_create
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250728195245.90356-1-stewart.hildebrand@amd.com>
 <08ca27cf-435b-4807-8cbc-0b866709b9df@citrix.com>
 <0fce6207-15b9-491a-97ab-3ad4b36ddaac@suse.com>
 <31db960a-e22b-4054-9ba3-97830859c054@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <31db960a-e22b-4054-9ba3-97830859c054@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/07/2025 10:08 pm, Stewart Hildebrand wrote:
> On 7/29/25 04:32, Jan Beulich wrote:
>> On 28.07.2025 22:09, Andrew Cooper wrote:
>>> On 28/07/2025 8:52 pm, Stewart Hildebrand wrote:
>>>> In vcpu_create after scheduler data is allocated, if
>>>> vmtrace_alloc_buffer fails, it will jump to the wrong cleanup label
>>>> resulting in a memory leak. Correct the label.
>>>>
>>>> Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> Urgh, sorry for breaking this.  Ultimately it comes from having two
>>> different error handling schemes.
>>>
>>> This patch is probably ok to start with (and to backport), but a better
>>> fix would be to handle sched and wq in vcpu_teardown().  That way we get
>>> a single failure path that does the correct thing irrespective.
>> I agree, and that variant would apparently be as easily backportable.
>> Stewart, are you up for going that route?
> Yep, I'll give it a try

Just as a heads up before you start, the key is to ensure that anything
called in *_teardown() is idempotent.

~Andrew

