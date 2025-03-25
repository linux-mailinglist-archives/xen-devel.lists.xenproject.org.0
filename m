Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5B0A7032A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 15:06:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926532.1329370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx4vL-0006Jj-FL; Tue, 25 Mar 2025 14:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926532.1329370; Tue, 25 Mar 2025 14:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx4vL-0006IG-Cf; Tue, 25 Mar 2025 14:06:35 +0000
Received: by outflank-mailman (input) for mailman id 926532;
 Tue, 25 Mar 2025 14:06:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+BiV=WM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tx4vJ-0006I8-MT
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 14:06:33 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5af49aa1-0982-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 15:06:32 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-549644ae382so7064004e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 07:06:32 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d6ddf2974sm15089925e9.0.2025.03.25.07.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 07:01:29 -0700 (PDT)
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
X-Inumbo-ID: 5af49aa1-0982-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742911592; x=1743516392; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cC/c6pwFIt9FzZ0w0vk6GdMd9YSlqqiv9sspJFqJhHE=;
        b=HoPXzz6B9kn/T5EFCUSZQGN6EQ9B0REpBKVgguwlcUduu9v1wNdd6sx883XD5Gmf/1
         KWK5KoUEVsHnpp8uZUm8g1Wm8nR7MOSJ91C/Swcv12hxMyUZ7oOfzkv6SXjb/E2lkxD7
         68T3YtJEXsXysnQArcf/nvxHLNiEp9QT5Kc30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911592; x=1743516392;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cC/c6pwFIt9FzZ0w0vk6GdMd9YSlqqiv9sspJFqJhHE=;
        b=n0uRTAchCQHsEA2VU2kKzkxf+rfyaOK0Zu7HcGuPH3Xe58UdizC6cYwDA5fEq4oTNp
         4SVBKC54a7ErZeGsEXC+l7Xk5cgOBIpgkbx420lb2vzaM2W3SNEsw+wzJItsnRL9+Eiv
         PAOD3tIfBkTu4hupxewq5DNvx44Zj3mPve68VchG8mG67CXSNSASMDCz2mye+bn6c/NT
         2kW9akLSkhbcqeizFGNQwIOxYM9j7JGrmhb0uIqz5Q17W16VKPPfvjoB6wc3jOvVX7/M
         Zo5tQUPDhZ8WCKDA8AEHL4WYfl13daXlpIRxcscQQbw2/xS4q3XNlBIhmhLwZKClnMxU
         SU3g==
X-Forwarded-Encrypted: i=1; AJvYcCWBaTYA6Afqq7SmKukrwz+4OABS10ficwFnKQvUqWY0NTkmMzV/H7L222h6YQ7MYox12g3qogu/5kA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtP1G8K8CYxuforKLvH4Jyv4n5dsfyVmWiebHD2Qhf2zOm2eyU
	VEXr+QSFV2BIEvm18q2hk5lPfPhLKwlLs8FJJadPXqX9sk+nuTP10XHEwvaF/1GgGkn172jt+0m
	YHB0=
X-Gm-Gg: ASbGncvTw6lCs49qTfAirtLXVgmviXIyp1dkdu35OyO0pDKHv27tRcQti3WLKER6hK/
	SscFWEpqJkit74CmYJxlIIGl/PdhkYBkeX3CIE+MbaLgC0vJHJKiU6h0TkEiMEYe3BmVM9pcMJj
	Mi0vGOD3OfxdircGgN7R5eZ+DS0BfWicGprpAHfYAuze+oQrz/naGQXNETvrEmT5eRdMb+PZRfW
	HtzIEmtzsgjmpT/TXxgnX6A76sx1QMpeV3yazNYj8LBxHr7Lo1udWwKZ9wGxQy6GGZCRnX+yLPm
	Pt9eqD6hEogfKOldYJm/eHvAkDngsNcOelxevqueRz1e9RMiYM+0fo0x9ygiOKhxlKd7BoQt1r8
	324J0exYKmQ==
X-Google-Smtp-Source: AGHT+IEVK6Pud4/ukel0usRyIb8cOiva6CPSma9jPt7pAWvcg+66J6Mm9h0e7JcIlVOA4InWYFSocA==
X-Received: by 2002:a05:600c:4686:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43d509ee23dmr165651685e9.7.1742911290412;
        Tue, 25 Mar 2025 07:01:30 -0700 (PDT)
Message-ID: <25d90d94-b151-48ef-824a-a72c16a45647@citrix.com>
Date: Tue, 25 Mar 2025 14:01:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pmstat: fold two allocations in get_cpufreq_para()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b2f1d0dc-54b0-4520-b4b6-3a1892662e53@suse.com>
 <31635ea1-cac9-4a5e-a4d3-2349d2bfb942@citrix.com>
 <6e252e58-d589-41ba-87ba-d71ef0b04d73@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6e252e58-d589-41ba-87ba-d71ef0b04d73@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/03/2025 2:00 pm, Jan Beulich wrote:
> On 25.03.2025 14:52, Andrew Cooper wrote:
>> On 25/03/2025 12:53 pm, Jan Beulich wrote:
>>> --- a/xen/drivers/acpi/pmstat.c
>>> +++ b/xen/drivers/acpi/pmstat.c
>>> @@ -219,25 +218,22 @@ static int get_cpufreq_para(struct xen_s
>>>          return -EAGAIN;
>>>      }
>>>  
>>> -    if ( !(affected_cpus = xzalloc_array(uint32_t, op->u.get_para.cpu_num)) )
>>> +    if ( !(data = xzalloc_array(uint32_t,
>>> +                                max(op->u.get_para.cpu_num,
>>> +                                    op->u.get_para.freq_num))) )
>>>          return -ENOMEM;
>>> +
>>>      for_each_cpu(cpu, policy->cpus)
>>> -        affected_cpus[j++] = cpu;
>>> +        data[i++] = cpu;
>>>      ret = copy_to_guest(op->u.get_para.affected_cpus,
>>> -                       affected_cpus, op->u.get_para.cpu_num);
>>> -    xfree(affected_cpus);
>>> -    if ( ret )
>>> -        return ret;
>>> +                        data, op->u.get_para.cpu_num);
>>>  
>>> -    if ( !(scaling_available_frequencies =
>>> -           xzalloc_array(uint32_t, op->u.get_para.freq_num)) )
>>> -        return -ENOMEM;
>>>      for ( i = 0; i < op->u.get_para.freq_num; i++ )
>>> -        scaling_available_frequencies[i] =
>>> -                        pmpt->perf.states[i].core_frequency * 1000;
>>> +        data[i] = pmpt->perf.states[i].core_frequency * 1000;
>>>      ret = copy_to_guest(op->u.get_para.scaling_available_frequencies,
>>> -                   scaling_available_frequencies, op->u.get_para.freq_num);
>>> -    xfree(scaling_available_frequencies);
>>> +                        data, op->u.get_para.freq_num) ?: ret;
>>> +
>>> +    xfree(data);
>>>      if ( ret )
>>>          return ret;
>>>  
>> Not altered by this patch, but `ret` is bogus here.
>>
>> It's the number of bytes not copied, and needs transforming into -EFAULT
>> here and later.
> Oh, right - I noticed this when making the patch, then forgot again. I can
> make another patch, unless you have one in the works already.

I've not started one.  Please go ahead.

~Andrew

