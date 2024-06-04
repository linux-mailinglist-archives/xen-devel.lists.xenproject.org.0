Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B768FB9CA
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 19:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735449.1141607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEXZP-0001Yd-7D; Tue, 04 Jun 2024 17:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735449.1141607; Tue, 04 Jun 2024 17:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEXZP-0001XU-4T; Tue, 04 Jun 2024 17:03:35 +0000
Received: by outflank-mailman (input) for mailman id 735449;
 Tue, 04 Jun 2024 17:03:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7N6=NG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sEXZN-0001XO-SG
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 17:03:33 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f95c397-2294-11ef-90a1-e314d9c70b13;
 Tue, 04 Jun 2024 19:03:32 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-35dc0472b7eso5061531f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jun 2024 10:03:32 -0700 (PDT)
Received: from [172.31.7.231] ([62.28.210.62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e52ec4616sm8140769f8f.4.2024.06.04.10.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 10:03:31 -0700 (PDT)
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
X-Inumbo-ID: 5f95c397-2294-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717520612; x=1718125412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ew5sWGfZJZnu6vS8zquzyKtG+O1Hmmq3JNQC8TnCPt4=;
        b=eidZ9j5DNX1UIVG3hdCSh5fMdbT1XhuxRAIejo2y47YHEJz2qPfJHiRHX4BLGKIAv7
         RZDAeSEwym/MYzLd8YDtmg70mqlJ07c0zcY+VJtL5i0qHSqA6L5liwRzFlqhMzLUI/g/
         l0Gz9+ZiONkq+s6ODO2/63laleLnCs83jMyYu1/9nmjH/X4ST5KSEQHmt6cHuiz6sT5K
         eLJBmkJM+HwAyYp7oE4AlV8f+YiUILaOJtzPUzJeX2HCF3hZAe8/+Xfj4sZojY4sQcSJ
         zS2svGadTu6p2opvXVTmneF0Jfc9RQEuuuXMFZrdP+c1cjG1W/u1yyGO9EwHWmVoxgwi
         A4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717520612; x=1718125412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ew5sWGfZJZnu6vS8zquzyKtG+O1Hmmq3JNQC8TnCPt4=;
        b=lLi80n9enGz/jf4dz/Daf7+3XhmkVGpmQ43RKDlFsyV/YG4s1LaO+KnKuwWpV7IN6o
         1A4l2hKhcKmFYJskE1yIdk75YiNtTuIdV6n8FuSbF9M4yc1ZQrynSbS6FaU8rSl7q/qH
         U2O5B3CXfkVIPsQ7hB85grJYWJKa/4eHpt6/f/NCfW8+zMJq5nl1SZU4viQpfKPbewpM
         U3gnpLK0hV+mlZ6BcnQ/GYbIC/wohy60HSfUge9X1m+avL7ocqA3c0GaLDHu9vHICLLG
         an7x0FrLhIsdn2MCS5uvawO5kvcPyqaQt9p9aVr16y6cScRVoK/TTc2lvPwi7z46ajSV
         fEqA==
X-Forwarded-Encrypted: i=1; AJvYcCUDuv298OcwgWvKs0u53GGiYCWfn8L/BcityTdVeJI92OZUstg6asToIPv98jkgH0DrWeuAUBMNgSoa6rfF5Yt9WWRt92aVG4zYLkJzRLo=
X-Gm-Message-State: AOJu0YxuiVXgooQrF9iXFi8eSVLRTG5HTi9WCOxGccLYPaBZ3av2DMFC
	8efT79t/htxH1Gxh9W6URqSfKcLkd5mSHy5BioRGIovIKbn1bJx4gOLLH2eIAQ==
X-Google-Smtp-Source: AGHT+IEcduNcOq5162GCg9hR4YRjjZOzNwpYXbjZVf7dyY70y+nyoUD84iragVkzNzBzfQ7PG6lGfA==
X-Received: by 2002:adf:e262:0:b0:354:f692:2c1d with SMTP id ffacd0b85a97d-35e84047375mr16866f8f.12.1717520612158;
        Tue, 04 Jun 2024 10:03:32 -0700 (PDT)
Message-ID: <d35c45b2-6b93-4eea-a037-e4aa2284245d@suse.com>
Date: Tue, 4 Jun 2024 19:03:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 14/16] ioreq: make arch_vcpu_ioreq_completion() an
 optional callback
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <a0f9c5ef8554d63e149afd0a413a27385c889faa.1717410850.git.Sergiy_Kibrik@epam.com>
 <cc51da4b-d024-4923-95a4-18e11b150f90@xen.org>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cc51da4b-d024-4923-95a4-18e11b150f90@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.2024 13:07, Julien Grall wrote:
> On 03/06/2024 12:34, Sergiy Kibrik wrote:
>> @@ -2749,6 +2750,20 @@ static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>>       vmx_vmcs_exit(v);
>>   }
>>   
>> +bool realmode_vcpu_ioreq_completion(enum vio_completion completion)
> 
> No one seems to call this function outside of vmx.c. So can it be 'static'?

Plus it absolutely needs to be cf_check. If it is to stay, which
it looks like it isn't, as per further comments from Julien.

Jan

