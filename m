Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C915680E9
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 10:17:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361942.591727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90Dq-0001gb-SS; Wed, 06 Jul 2022 08:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361942.591727; Wed, 06 Jul 2022 08:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90Dq-0001el-P8; Wed, 06 Jul 2022 08:17:22 +0000
Received: by outflank-mailman (input) for mailman id 361942;
 Wed, 06 Jul 2022 08:17:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mwIU=XL=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o90Dp-0001ef-L8
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 08:17:21 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e45293a-fd04-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 10:17:20 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so8517258wmb.5
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jul 2022 01:17:20 -0700 (PDT)
Received: from [192.168.1.10] (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adfea0b000000b0020fff0ea0a3sm34471738wrm.116.2022.07.06.01.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 01:17:19 -0700 (PDT)
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
X-Inumbo-ID: 0e45293a-fd04-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=loc17+3WYD5W3w9zBMYX7h5+wACGmAaV/gF7By+b5K8=;
        b=c7xwFVjl6i+/DXUWzvUZz5x7uu8ucah4IILFf3gBN/T/wVCRKcBbMCOeKSpO2cH5sa
         0Iy7Ewb0UngjzdWyzkmO+RdnuL7hEvusj8ZVH8pvLFHgrWAsUrJIhMW+nGUh2VzJt+Mx
         EcbpWIS6b4IQuMb+QLkrtl/uTiM4m9H3OhFYfQHeACHRO9nClYTYcws6kyXUk/jks5E4
         E4UeeACEOchHzsPX95qX/IXqHaIyMPH0PW8wWbz2ULUQlpfkScHSx/APwVN2Qa1yN61r
         yYUtsG0VRUz5HOM1rvA5fiLCSqETZmT6+fEmeXYbg56Yk6ZxfzdNBWMRVhfmyWVvIdZo
         O57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=loc17+3WYD5W3w9zBMYX7h5+wACGmAaV/gF7By+b5K8=;
        b=ujbPs6F/bE8wiWLVQ8zTZiBN0Y/8k2XgpEdQTWlL+b9siFrmxQ3zipdqV60olGBMsO
         uC9Ea2yr36iXURoXxJ3gmETHo5Y2CpXYRmE6FQJzCNQ6+OqOIKaiBGjeogOE+kAFcpTa
         A+luSGCnt4QYbg4wPUS1SUmiJ10J7ZKmFhic2YwlsFjvPIxCo3/JsyMGUH/IstwqO1aJ
         iw2PBF1ZlRDnKAxu4Y6xZR+7E/y8DtJlrLj5MBOr9M3GIOlGR7UiI/AgjPdPEzmY5zCE
         X6P6QkihLr2o4NtM6gPOV0JZVSVB+82HW3qvUgKIs5csLXX5sYpUKfjEBuvUf1G8PLHf
         7ZWw==
X-Gm-Message-State: AJIora+Q0qjVnenm0PTGgMogEu9aWtkIWwXQLmRXcbGIOTfgSvrzRnqy
	DLMXcCpF0jWcY3eixgU6sLA=
X-Google-Smtp-Source: AGRyM1vW/3k4wUJE0lcdkZEuaQO86vsMns9bJM6DK2/BbiBPLZqJUPQi8TomfncMSI3JJAsupqp3+w==
X-Received: by 2002:a7b:c3cd:0:b0:3a1:95b6:3fd0 with SMTP id t13-20020a7bc3cd000000b003a195b63fd0mr22221776wmj.75.1657095439868;
        Wed, 06 Jul 2022 01:17:19 -0700 (PDT)
Message-ID: <4499c0fe-a9f5-919f-bf46-43d30ef8b04c@gmail.com>
Date: Wed, 6 Jul 2022 11:17:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/4] xen/char: pv_console: Fix MISRA C 2012 Rule 8.4
 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-5-burzalodowa@gmail.com>
 <47ed7737-5422-e4be-c99d-0e448616f5b5@xen.org>
 <fc36b54b-5bc9-d30b-3524-79711abbbdc8@gmail.com>
 <540e8f0d-8a1f-f80d-c6f2-05192600c4bd@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <540e8f0d-8a1f-f80d-c6f2-05192600c4bd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/6/22 10:18, Jan Beulich wrote:
> On 06.07.2022 00:02, Xenia Ragiadakou wrote:
>> Hi Julien,
>>
>> On 7/6/22 00:38, Julien Grall wrote:
>>> Hi Xenia,
>>>
>>> On 05/07/2022 22:02, Xenia Ragiadakou wrote:
>>>> The function pv_console_evtchn() is defined in the header
>>>> <xen/pv_console.h>.
>>>> If the header happens to be included by multiple files, this can
>>>> result in
>>>> linker errors due to multiple definitions,
>>>> So, it is more appropriate to resolve this MISRA C 2012 Rule 8.4
>>>> violation
>>>> warning by making pv_console_evtchn() inline with internal linkage.
>>>
>>> There are multiple version of pv_console_evtchn(). The version below is
>>> only used when !CONFIG_XEN_GUEST.
>>>
>>> The header is also included multiple time within Xen. So I am a bit
>>> puzzled why we haven't seen this error before. Maybe this is unused when
>>> !CONFIG_XEN_GUEST?
>>>
>>> If yes, I would remove the call. If no, then I think the commit message
>>> should be clarified.
>>
>> You are right. I had to clarify that this holds when !CONFIG_XEN_GUEST.
>> So when !CONFIG_XEN_GUEST, the function pv_console_evtchn() is defined
>> inside the header file and the header is included only by a single file.
>> This is why the error has not been triggered.
> 
> Irrespective of that it is as Julien suspects: The function is only ever
> referenced when XEN_GUEST. Hence the better course of action indeed looks
> to be to ditch the unused stub; we don't even need DCE here for there to
> not be any references.

Yes, if the function is not used at all when XEN_GUEST, then I think its 
definition is considered unreachable code (Rule 2.1) and needs to be 
removed.

-- 
Xenia

