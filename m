Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B56C2B85855
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 17:19:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126292.1467915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzGQ8-0008TW-1l; Thu, 18 Sep 2025 15:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126292.1467915; Thu, 18 Sep 2025 15:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzGQ7-0008Qk-Uq; Thu, 18 Sep 2025 15:19:39 +0000
Received: by outflank-mailman (input) for mailman id 1126292;
 Thu, 18 Sep 2025 15:19:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uzGQ6-0008Qe-Bz
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 15:19:38 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3980e74-94a2-11f0-9d13-b5c5bf9af7f9;
 Thu, 18 Sep 2025 17:19:37 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3ee12332f3dso833271f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Sep 2025 08:19:37 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269802fdfdfsm28729315ad.102.2025.09.18.08.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Sep 2025 08:19:36 -0700 (PDT)
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
X-Inumbo-ID: e3980e74-94a2-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758208777; x=1758813577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZbwCz2lCCCWc3XO4MtNdHpZcqN+Y4d1Inqq2N7dk448=;
        b=GojYeGh4v6iCpVD3tCj8EpTlHHDAhnI2cwGS2P2SEIBw4e7xL0+tmFEQD5jrLcKqEZ
         Quf8jj42rNSSuttpoyrLiRMblznjXE42nfQEnTjWoGvVfvrs4p0EDi7Nnp5q1sc3Cr+R
         UPbqMYS9DaxBDThJXHxZFT40ApN0iO9d1sX/vey+QJ9cCLXHp+1N+J/ZbG9D7H7l39Iz
         tfuRKKTVCxBhDvdwSqqfRfHBMW4yCxNM5u5cXRmVPb9aXMcb3ahXLV0OVZSeyccxnPNJ
         vx7AtPSCbbDGBLE4zFjf85DA3lNLemE52uaNdv/ZKz3R58HaJtz2TOlcysTqZV6GtHSV
         zaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758208777; x=1758813577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbwCz2lCCCWc3XO4MtNdHpZcqN+Y4d1Inqq2N7dk448=;
        b=g6ujI05C+kohCvzzlMYQJMwZDYnD5zeZcGCCv2T5jKmxMi9Qcd5LUxZUBFi+Lzm8je
         70pzVkPcb9j4bNZoGFHvAadamw0VSquzkgsvzgfc1tnojpS3blc1QnPgCdjHWADoKh4H
         uVKPupjGrg0cnblYHFmHsBd7gDUCj+vuFOasl1l1p0BtvSlhwMpFubkKcU9y4C+NvKOr
         7LgGSj+L0kgCBZJ6MW9f5CasMxV3Ti/n7yz3Sqp/NeegJgYz/2Y+BOX5GgfTQemcS1B3
         7za9BR9fWk2BXI5CCapnGJKWrI/xrlVOkDkdNM2idUvTq5F/29yI+41TV2/yY13kyfYv
         CJFA==
X-Forwarded-Encrypted: i=1; AJvYcCXH273hSAQtCU4jRLTuo0/atvD205uLk9OuynH2xN/8SzjiX+qoRNzP9feeo7El30n9X8Yr8EHbeTI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzO4x4oNn5uPACZor5/2GqOEMHViMGCo7uOPTZZbtRQx8qjn0dI
	AA3xWhgMbIqTU6IGdKp8v7cpzY16XjIzgNhaBrX7/cBhXLqVq5mQZCuKphl9ZpKBNw==
X-Gm-Gg: ASbGnctPk7dP7jrmy607tJYB8Sc0E2k89MX+r8cvCon15qTx9nBV75cnYXsUqyauzgF
	uqgnZVFHso/DdFizDfVXCXeYyivN0oX3l6dV4yeY0BHzXIyWU7CHLF5Fo54oZ0aby9iM7ePeoUE
	NvgRXx9BeGXSzo8Osw8mZlaEIqn4J9MUp+WRtiQWZFd+Y6qPIxaWke+q/BdD6det/XX9diswKNH
	w+Oyoqc7tp8a0cADKswdqTfhvh6HgFPPSXxyB8l6ynUcBXsskoglPG3QrrWNVn4u4fKXMbKdAOa
	j3/kee5zITUpg1qx1pED2R//Zy817s06kQJpIRma5E5geNnCHkXfVtQk7aSYAwZrYKinZxJGC+G
	3LB7oioN3id9tef71iDoqEIcwGKD20NNGBIxXw4i/0VEYMJzl5g==
X-Google-Smtp-Source: AGHT+IEcLMrwFF6jAGGjQD0Df2c7egQCSUUfiv7iLG8h9pjhMHCTQ8rmyzMoLPBmp1A18j7JieYXaA==
X-Received: by 2002:a5d:64c8:0:b0:3ea:e0fd:28ea with SMTP id ffacd0b85a97d-3ecdfa0d2e6mr5337896f8f.39.1758208776523;
        Thu, 18 Sep 2025 08:19:36 -0700 (PDT)
Message-ID: <d23f9b58-8da2-43e7-b8cc-351ee6d8c849@suse.com>
Date: Thu, 18 Sep 2025 17:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250916134114.2214104-1-grygorii_strashko@epam.com>
 <d6df84f5-862b-48af-8dea-3e15c029c433@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d6df84f5-862b-48af-8dea-3e15c029c433@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.09.2025 17:15, Grygorii Strashko wrote:
> On 16.09.25 16:41, Grygorii Strashko wrote:
>> --- a/xen/arch/x86/hvm/Kconfig
>> +++ b/xen/arch/x86/hvm/Kconfig
>> @@ -62,6 +62,16 @@ config ALTP2M
>>   
>>   	  If unsure, stay with defaults.
>>   
>> +config HVM_VIRIDIAN
>> +	bool "Hyper-V enlightenments for guests" if EXPERT
>> +	default y
>> +	help
>> +	  Support optimizations for Hyper-V guests such as faster hypercalls,
>> +	  efficient timer and interrupt handling, and enhanced paravirtualized
>> +	  I/O. This is to improve performance and compatibility of Windows VMs.
>> +
>> +	  If unsure, say Y.
>> +
> 
> Actually there is a question for x86 Experts -
> Does it make sense to have HVM_VIRIDIAN enabled without enabled AMD_SVM/INTEL_VMX Virtualization extensions?

It makes as much or as little sense as HVM=y with both of the ones you mention
turned off. Iirc Andrew in particular wanted to permit such configurations, to
allow to prove the (abstract) correctness of building them, even if the
resulting hypervisor may be of little use.

Jan

