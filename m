Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAEE9778FC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 08:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797947.1208010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp0Aa-0006xH-BI; Fri, 13 Sep 2024 06:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797947.1208010; Fri, 13 Sep 2024 06:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp0Aa-0006uU-88; Fri, 13 Sep 2024 06:52:40 +0000
Received: by outflank-mailman (input) for mailman id 797947;
 Fri, 13 Sep 2024 06:52:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sp0AY-0006uO-S8
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 06:52:38 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c31606d4-719c-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 08:52:37 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-374c326c638so392504f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 23:52:37 -0700 (PDT)
Received: from ?IPV6:2003:ca:b721:c843:dc22:72c7:d9fc:4a1f?
 (p200300cab721c843dc2272c7d9fc4a1f.dip0.t-ipconnect.de.
 [2003:ca:b721:c843:dc22:72c7:d9fc:4a1f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm15954955f8f.50.2024.09.12.23.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 23:52:36 -0700 (PDT)
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
X-Inumbo-ID: c31606d4-719c-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726210357; x=1726815157; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CrzqcJMUDM9uRwY37LW1kCMZLMGnuhGUN2NmrPjqqI=;
        b=AMmUKANcmcPNpylaeuRgtcPMCpn6W2v52f2yJuxWnmYsWxPMAFEBs8DyrSIz7Zq+/N
         SnEqQhKvCL8Mr1k7snCqYT0OY0oJagnu87h+Q4vzeRPnnqMHBjpH0+MztSr49AjK5aUj
         CbvDrX72mU3UcgXBIOcM2eJDkSfGRWorAvRs8uf3u3RxrnUf/K86RnpHEA1rv0m+ECHC
         cqb2wN1zEFDbZUsUECoJb5psW5vS0WzbVJQbyO3WZECghKrwINRF8gvE5rrFU6YYEIGL
         rfeeh2F/nbPb46az75NHqO3OyN/DSbuZkDReFpbb0v26m/+l5SRrBIjnbBZjQ0dXdQxB
         f7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726210357; x=1726815157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2CrzqcJMUDM9uRwY37LW1kCMZLMGnuhGUN2NmrPjqqI=;
        b=klUoksFTpZXgXldPQVgvHWSPm+MJ5z1cGlPyceOBGuXNMQB3oJnUZg71K6aozc2o8A
         2R/zjDKPrM6GqSGzw+eKE9RlcOZwb0wfetc7m54V4AiGy9qqEc1NnlowsZ8yQF9zeGB2
         Zv8EtHjjwtiW5OH8fQxzsiZFU3xNjBLX3/qOc/eh3dDb6d3p1+JG7ogvKJIgDBz4zwdj
         hSt+AF/zTfP1+PkOiwktSgfcIH0gLYrXCHlISkZjMh8DnZWjFMOtQ3Cbcp3ECjamVDFw
         0NoRL0ctIyWzF0/ukc3WxA4KvuLAgW+lZYTzotmLtDHDeCCCELlNB1vlh/9rMIHBOwLE
         QnBg==
X-Forwarded-Encrypted: i=1; AJvYcCVtoxe0ntfhQ5LhOMIOi3iOryfsDUewdZy9fmzLtXLRbeEAQCpiuyzOOO2DVmzcSG9/YsQ8fHkBCDM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyPbzeBk3EPUaS9UhKjQQPnr11ybervECiy8Ln10SXiSa5tfGG
	gojYn6oN3oot07sWVWASyb61F5rgk2aV4YHZRjCm2OqJ9PYgn9uysgAefBvrLQ==
X-Google-Smtp-Source: AGHT+IGyo8TkyTCl3E0iFHFKAFg2We7gvZcEBxOcF5Rlu2F061TSC22OjxYhshKZo5JU7xUdf/eZzQ==
X-Received: by 2002:adf:b353:0:b0:374:b24e:d2bf with SMTP id ffacd0b85a97d-378d61f0af4mr833326f8f.27.1726210356862;
        Thu, 12 Sep 2024 23:52:36 -0700 (PDT)
Message-ID: <e9394226-4e21-4789-b685-8e0d9db61ad3@suse.com>
Date: Fri, 13 Sep 2024 08:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v15 2/4] x86/irq: allow setting IRQ permissions from
 GSI instead of pIRQ
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
 <20240911065832.1591273-3-Jiqian.Chen@amd.com>
 <971eba46-79e0-411f-8ae5-6b1f986f2ed0@apertussolutions.com>
 <5a3b43eb-6c98-42bf-8331-1112de9d888d@suse.com>
 <BL1PR12MB5849AB4428D6278BCD24C610E7652@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR12MB5849AB4428D6278BCD24C610E7652@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.09.2024 04:38, Chen, Jiqian wrote:
> On 2024/9/12 18:51, Jan Beulich wrote:
>> On 12.09.2024 12:34, Daniel P. Smith wrote:
>>> On 9/11/24 02:58, Jiqian Chen wrote:
>>>> @@ -237,6 +238,34 @@ long arch_do_domctl(
>>>>           break;
>>>>       }
>>>>   
>>>> +    case XEN_DOMCTL_gsi_permission:
>>>> +    {
>>>> +        int irq;
>>>> +        unsigned int gsi = domctl->u.gsi_permission.gsi;
>>>> +        uint32_t flags = domctl->u.gsi_permission.flags;
>>>> +
>>>> +        /* Check only valid bits are set */
>>>> +        ret = -EINVAL;
>>>> +        if ( flags & ~XEN_DOMCTL_GSI_ACTION_MASK )
>>>> +            break;
>>>> +
>>>> +        ret = irq = gsi_2_irq(gsi);
>>>
>>> I was recently informed that a = b = c; form is not MISRA compliant. 
>>> Since you just overwrite ret after the check, why not drop the 
>>> assignment to ret and mae the next check against irq instead.
>>
>> The Misra concern is valid, yet the suggestion doesn't look to be quite
>> matching what is needed. After all if we take ...
>>
>>>> +        if ( ret <= 0 )
>>>> +            break;
>>
>> ... the "break" path, "ret" needs to be set. Plus there's the problem of
>> "ret" being zero when exiting the function indicates success, yet this
>> is an error path (requiring ret < 0). So overall perhaps
>>
>>          irq = gsi_2_irq(gsi);
>>          if ( irq <= 0 )
>>          {
>>              ret = irq ?: -EACCES;
>>              break;
>>          }
>>
>> ?
> 
> Yes, ret needs to be set. And since gsi_2_irq doesn't return 0(if irq is 0, gsi_2_irq returns -EINVAL).
> Maybe below is enough?
>         irq = gsi_2_irq(gsi);
>         if ( irq < 0 )
>         {
>             ret = irq;
>             break;
>         }

My proposal was to cover that elsewhere we exclude IRQ0, and hence
it would be good to be consistent here.

Jan

