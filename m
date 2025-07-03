Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE361AF70D6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 12:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031960.1405710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHRk-0000S6-A4; Thu, 03 Jul 2025 10:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031960.1405710; Thu, 03 Jul 2025 10:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHRk-0000Qc-7B; Thu, 03 Jul 2025 10:45:40 +0000
Received: by outflank-mailman (input) for mailman id 1031960;
 Thu, 03 Jul 2025 10:45:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rGZt=ZQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uXHRi-0000QW-P1
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 10:45:38 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d86d1765-57fa-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 12:45:33 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso78416255e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 03:45:33 -0700 (PDT)
Received: from [10.79.43.25] ([83.247.137.20])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bcececsm23244235e9.23.2025.07.03.03.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 03:45:32 -0700 (PDT)
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
X-Inumbo-ID: d86d1765-57fa-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751539533; x=1752144333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ZkHDTYnd7w9tT7FcErUb/YTrxXuUo9RA3yVDQCWTRk=;
        b=Nnv/uLvsV6PYluz2aNvLTDqRJjvWX+VNaYj0WB5ZLUqavTvcnD59ne0ADL2avTMlP4
         0kSh97ORWm9HP16LDAYJ4/ah6q0KrihHaT+tuAQzHMclcpT9T2yFgQubrDxlpQuSnqlb
         B5FT6QH2jeEQJHC6KHY64vHO/Iinuv7btNzC1CZ4MQlr/CdF/qJaUrlm2X/nfg6V9U1c
         mRUrzK5fif/WsAr2RUqFqnq8CvboX2dbjVhopfsTU4ZJ32mIUXCbm/9MtUZJLTT3u6nw
         Qi3t3xCxYlL9pMgwB5Yjd+C1MgyzaTkK6MD/n7TLsO/eVmxn+QXEYP6ldYa9VIgtu1tO
         wptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751539533; x=1752144333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZkHDTYnd7w9tT7FcErUb/YTrxXuUo9RA3yVDQCWTRk=;
        b=qyPaiAGYxq2oGSjwjH1zHj4Ugb3Uadc1YU2NAnW5gd8TDoZ1cKf78Y5e8L+5SWzOcE
         KTW/SUDtHUELLtWvy/lVoBwVVcxVLHETsJjyuJIJaVR/vGO6DIDB2LyilmUkgaW3OUt/
         hvrh8e7PZCtXW8GWWZBH7NvpE0s4Ve7IOcrFRQ720ZRwHu/j80iFrf/ovZKFX9/zrlkT
         PDvxYl7i1elwn4IdajPrJbX7ntn6R3gcY46KCWvx/nh4qXGDDZIPNmwdYzpaF7Tl7T75
         E3HTFjYVthyFVNZnBsd6+yYHqqP5lzR+ag2hlxq1KeNqJ2Aq9a3S0tHQ9xaLl7eqhJPW
         CmpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBlyAmoXklwNWGW7ZPszVl5md30V2ew2JKqoGXtQEvoeOGDROFjj106cNflyZ5ji4WOxu183JvTaY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhbKKK8V8VHKcMC3xH0zfvHwt5eMRvoD4P2Zi/jMa9VSAv8KAT
	nMrcjMHsDMktdBD10cdczpn1aTEdtOF0CkFKgX0v2qU+NMEuXhU3FqR3Or82cVBXOxg=
X-Gm-Gg: ASbGncsW80SKP+LqLqTpZxOaxxrmSdr0I1yYvIs7LcL+QC0yugh/5nQi25kOL9i9+SI
	HVgHzJfrYwKMiK3GT7NWbnBE+pqSZVEnPNnXdzpf3CsNby8SLGisuR3HhFQC37sW6nYVl4a8bLi
	gS3b4lznZUqjuuj2YBlKmnXF7bwFr9Qk0kTm3UF/ptiTy7SjRKcgH/GA8sSfU9T/XGnUKVnvUJN
	uf+p2vdp171+k3mIDSNzf71iGmuNxz8dmgQ2tMQItEW1zpeUxGGKGr5wZ+3if7UAjxE3vINNvV1
	qo5haK4YjN5Abg3P2IrA/VloqnNgNy61yDOi4kMzr6zrJMw1It6Rt09QMc1dSfCytFrSRuW4fL0
	h
X-Google-Smtp-Source: AGHT+IElA0mswuuh9WSnt4MDEnV+aPiBDrsxNfrDJ6sq7nHox2RqriJhZeVkOckam7J4GYfITpiuOA==
X-Received: by 2002:a05:600c:4ecd:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-454a9e47500mr31207415e9.0.1751539532844;
        Thu, 03 Jul 2025 03:45:32 -0700 (PDT)
Message-ID: <d15188cb-fa33-4d94-a3d9-b0ba3b2d71da@linaro.org>
Date: Thu, 3 Jul 2025 12:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 57/65] accel: Always register
 AccelOpsClass::kick_vcpu_thread() handler
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-58-philmd@linaro.org>
 <5348f155-5644-497d-b9f9-89924d961cff@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <5348f155-5644-497d-b9f9-89924d961cff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/7/25 23:26, Pierrick Bouvier wrote:
> On 7/2/25 11:53 AM, Philippe Mathieu-Daudé wrote:
>> In order to dispatch over AccelOpsClass::kick_vcpu_thread(),
>> we need it always defined, not calling a hidden handler under
>> the hood. Make AccelOpsClass::kick_vcpu_thread() mandatory.
>> Register the default cpus_kick_thread() for each accelerator.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/system/accel-ops.h | 1 +
>>   accel/kvm/kvm-accel-ops.c  | 1 +
>>   accel/qtest/qtest.c        | 1 +
>>   accel/xen/xen-all.c        | 1 +
>>   system/cpus.c              | 7 ++-----
>>   5 files changed, 6 insertions(+), 5 deletions(-)
> 
> Sounds good.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> Unrelated, but I noticed that hvf_kick_vcpu_thread uses hv_vcpus_exit 
> [1] on x86 and hv_vcpu_interrupt [2] on arm64.
> I'm not even sure what's the difference when reading the Apple doc, 
> except that exit existed before interrupt.
> [1] https://developer.apple.com/documentation/hypervisor/ 
> hv_vcpus_exit(_:_:)

This is the "Apple Silicon" documentation,

> [2] https://developer.apple.com/documentation/hypervisor/ 
> hv_vcpu_interrupt(_:_:)

and the "Intel-based Mac" one ;)

> 
> It might be worth moving x86 to use interrupt also, in a future series.
> 
> Regards,
> Pierrick


