Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0356A5B51
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 16:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503442.775721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX1Za-0007q0-T1; Tue, 28 Feb 2023 15:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503442.775721; Tue, 28 Feb 2023 15:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX1Za-0007nk-Q2; Tue, 28 Feb 2023 15:07:22 +0000
Received: by outflank-mailman (input) for mailman id 503442;
 Tue, 28 Feb 2023 15:07:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VB9=6Y=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pX1ZZ-0007nX-EK
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 15:07:21 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 993b01c4-b779-11ed-9695-2f268f93b82a;
 Tue, 28 Feb 2023 16:07:20 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id d30so41347305eda.4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 07:07:20 -0800 (PST)
Received: from [192.168.1.93] ([188.73.239.246])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a17090634cb00b008e36f9b2308sm4602113ejb.43.2023.02.28.07.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 07:07:19 -0800 (PST)
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
X-Inumbo-ID: 993b01c4-b779-11ed-9695-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jK06YMa7zlDhPqSW5oUxHX1w39uN0C+HqUUTiKN/nsM=;
        b=oNHppN0RyMGMuT7903lIZhzSpOaSH+80s4RVVPSLJiC0uLViblU4UF+q7mU46dv2Nj
         LKgB2AgQzZ5hhqKIH7GelhBEzOKZ0roJv90vNh4A0G7Kib/bCd9P48GXeiBvDKwvLphn
         30Eqe+DpsnzYBYqQkfdW2M28lBqdmjMuAwa2UrFAnWddNToy6MmdFxHbqmb369JJDOS1
         QiKUUsDAFHdYgrsw569RVc6N5bzf6rpMqrifRe4QbIfwLSQe3MAKU+NareA+VK5G5QXO
         s2ljhXQTcL4HCzsgduiNodZ8x2gkLHLSbPe7g9D6toYa2BLKzs/9UEq94tkrpPYZCZDx
         eNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jK06YMa7zlDhPqSW5oUxHX1w39uN0C+HqUUTiKN/nsM=;
        b=B1g8x9aUWYWOo5C2+mLvIpph5gmTxUJBWqBnBCBpBXzl6iOOksN57qU980eVysWm6k
         ujwKdLMPWpQU4YbVCn0890BBn/YzWaDp1SECu+60lJNQLQpb+uScqADEc0IsF7bxYq44
         SqzB3OGxRZx2L01EDAHGQnSFdL6XQkqJ1821e76b8xoR5Cve96XsEFF2vRnKF7JNg8ie
         Yy+XWE2b+GAXQiDNNQgJFYWq0Bla8Pnn1ySO3dxRM0JttaWLE8h8d+NTimNbbmOa//IY
         /Y+qs9OMhkmIsf1zdGmZ7oVfK36IxzcPmuqK6IsQRU+EY0NqIZddIwU3eSjI0kFrAWQN
         btCg==
X-Gm-Message-State: AO0yUKV9MvPz3n9cIL1UaSaHGq87bPhxQNQnbVJYUG+6mv8TG0vUeBsu
	UDn6OnNZhRVrB3t1DT797iCY+glzzHY=
X-Google-Smtp-Source: AK7set9lnKjsUg2OudHwFhWc4ZA6TJgCORl/hZ3KQgNST0B2MjoteQbX44rZL8zU0ZRNn4Z7yiq0eA==
X-Received: by 2002:a17:906:c0cf:b0:8b1:812f:2578 with SMTP id bn15-20020a170906c0cf00b008b1812f2578mr3399387ejb.45.1677596840158;
        Tue, 28 Feb 2023 07:07:20 -0800 (PST)
Message-ID: <e91460f8-9872-9968-0aa1-268b3dc68d9c@gmail.com>
Date: Tue, 28 Feb 2023 17:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/4] x86/vmx: replace enum vmx_msr_intercept_type with the
 msr access flags
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
 <20230227075652.3782973-4-burzalodowa@gmail.com>
 <c9c6b915-fd3f-22d9-ebf9-5497eb6aa578@suse.com>
 <bd819cdd-1c63-65b2-090f-911a4f9e8157@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <bd819cdd-1c63-65b2-090f-911a4f9e8157@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/28/23 16:34, Jan Beulich wrote:
> On 28.02.2023 15:31, Jan Beulich wrote:
>> On 27.02.2023 08:56, Xenia Ragiadakou wrote:
>>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>>> @@ -644,18 +644,8 @@ static inline int vmx_write_guest_msr(struct vcpu *v, uint32_t msr,
>>>       return 0;
>>>   }
>>>   
>>> -
>>> -/* MSR intercept bitmap infrastructure. */
>>> -enum vmx_msr_intercept_type {
>>> -    VMX_MSR_R  = 1,
>>> -    VMX_MSR_W  = 2,
>>> -    VMX_MSR_RW = VMX_MSR_R | VMX_MSR_W,
>>> -};
>>> -
>>> -void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr,
>>> -                             enum vmx_msr_intercept_type type);
>>> -void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr,
>>> -                           enum vmx_msr_intercept_type type);
>>> +void vmx_clear_msr_intercept(struct vcpu *v, unsigned int msr, int type);
>>> +void vmx_set_msr_intercept(struct vcpu *v, unsigned int msr, int type);
>>
>> unsigned int please again for the last parameter each.
> 
> Oh, also, another remark here towards patch 2: Note how the middle parameter
> each is "unsigned int msr" here, when in SVM code you make it (kind of leave
> it) uint32_t. As per ./CODING_STYLE unsigned int is to be preferred; in any
> event both (and the eventual hook) want to agree.

Thx. I will fix and keep it in mind.

> 
> Jan

-- 
Xenia

