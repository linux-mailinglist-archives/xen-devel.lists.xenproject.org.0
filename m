Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B2A696AAE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 18:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495407.765777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyh8-000158-8Y; Tue, 14 Feb 2023 17:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495407.765777; Tue, 14 Feb 2023 17:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyh8-00013Q-5g; Tue, 14 Feb 2023 17:02:18 +0000
Received: by outflank-mailman (input) for mailman id 495407;
 Tue, 14 Feb 2023 17:02:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LsmO=6K=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRyh6-00013I-V1
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 17:02:17 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 554f2201-ac89-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 18:02:16 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id t24so1438712eji.4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Feb 2023 09:02:16 -0800 (PST)
Received: from [192.168.67.143] ([62.74.15.167])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a1709063cf200b008af4dadd9c4sm7063362ejh.116.2023.02.14.09.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 09:02:15 -0800 (PST)
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
X-Inumbo-ID: 554f2201-ac89-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f7GEHqKSndAUZtVxefE/h9zlnYXbz5OEgVN/13AtDoI=;
        b=IW3O4O6/BJNaaREsNPqEouEIvQ408IvA2Kzp61KJAaAvYWq6Y0PJcNioExlykBJEcA
         w3sJGshsmYXeHZ23iOJ05GANrXgR0Su8ZkgeuubkrmjMUkjxAqaA2ozFaSPYv0R5eEcB
         sYM1yyp/IYlwcQy1WdCPlt2dBLc0CXgSfK6OSwHM9s4gvH8jVOIBxdr2s39tBmNtMjv0
         qe63iiTALOg0lTSz0RfhgV+DXF/matSsd+/RYCpzRRFq6TWByWZhHvcEvPyD6GJYQ/aO
         wySvINVMVAGlMZfusCusQ04avJDoKvWlkBLtVPwbsjravkD+VOcM/7uynVAVLVQKh0Gc
         wlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7GEHqKSndAUZtVxefE/h9zlnYXbz5OEgVN/13AtDoI=;
        b=4CDtSXcNSkSGZzK403NsjujXcSkXVvTWrBDyvhzrp6o2XfrlJZYt/FU1X4cC39jtNF
         egtSf2k7yimPE0Fyp7qvfRbIEiaHVl+mdhjxvMHcgaToSNipc3MZBpEoAhpw03oFaego
         louTreD4oK6WN8x/zyy3lFoEOxxEKTiALBdgCK78gWDUizLaQliJq0UH7D9gTPs5OMN3
         hVzO5Szz8skSkaLBafoPtu5iv7dK9rISi5Te88W3tvv3EQy0XSYrb8l/vhCM/b3VeEvr
         iZj4LUu1ng0hsLT6umVLurqDwJHrw2jU8pxQLZc26kKsi9avh8MI35KOR8cXRcHBdjg7
         /gbA==
X-Gm-Message-State: AO0yUKWQUJpaLcrBAJaJ6ppjnW700RDMGQXpOx6loDV1ymX6sOkO7GIf
	Lf7jECknL7Nov9PDQGkYb8jZy+iojkA=
X-Google-Smtp-Source: AK7set9lunnXYzVT33wfMZZaFN5sGiASecxoHt86UokuVuz2AEXKjxH/yf/xxInQzYKM34rzoBUWWw==
X-Received: by 2002:a17:906:a3d8:b0:8a6:93a4:c892 with SMTP id ca24-20020a170906a3d800b008a693a4c892mr3459692ejb.44.1676394135801;
        Tue, 14 Feb 2023 09:02:15 -0800 (PST)
Message-ID: <3f954ef8-eb62-a60c-1ecd-54f84c586057@gmail.com>
Date: Tue, 14 Feb 2023 19:02:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC 09/10] x86/ioreq: guard VIO_realmode_completion with
 INTEL_VMX
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-10-burzalodowa@gmail.com>
 <883a4563-9a37-eb17-6e91-03216f336e99@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <883a4563-9a37-eb17-6e91-03216f336e99@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/14/23 18:46, Jan Beulich wrote:
> On 13.02.2023 15:57, Xenia Ragiadakou wrote:
>> VIO_realmode_completion is specific to vmx realmode, so guard the completion
>> handling code with INTEL_VMX.
> 
> While it means slightly bigger a code change, personally I'd prefer if
> VIO_realmode_completion simply didn't exist as enumerator when !VMX.
> Besides ...
> 
>> --- a/xen/arch/x86/hvm/ioreq.c
>> +++ b/xen/arch/x86/hvm/ioreq.c
>> @@ -44,6 +44,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion)
>>   {
>>       switch ( completion )
>>       {
>> +#ifdef CONFIG_INTEL_VMX
>>       case VIO_realmode_completion:
>>       {
>>           struct hvm_emulate_ctxt ctxt;
>> @@ -54,6 +55,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion)
>>   
>>           break;
>>       }
>> +#endif
> 
> ... this use there's exactly one further one which would need #ifdef-ing.
> I think that's tolerable.

Sure. I will fix it.

> 
> Thinking further (not necessarily for you to carry out) the x86 version
> is identical to Arm's when !VMX, so it would look better to me if the
> entire x86 function became conditional, the Arm one was dropped, and
> common/ioreq.c provided a fallback for the case where no arch one exists.

It may look awkward to have arch_vcpu_ioreq_completion() in VMX guards 
in common ioreq code because the connection is not obvious immediately.

> 
> Jan

-- 
Xenia

