Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5FF873CD8
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 18:03:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689405.1074334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhufh-0004fR-0m; Wed, 06 Mar 2024 17:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689405.1074334; Wed, 06 Mar 2024 17:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhufg-0004dF-UC; Wed, 06 Mar 2024 17:03:12 +0000
Received: by outflank-mailman (input) for mailman id 689405;
 Wed, 06 Mar 2024 17:03:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9guM=KM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rhufg-0004AA-51
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 17:03:12 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69b55285-dbdb-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 18:03:11 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-412e96284b9so17527925e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 09:03:11 -0800 (PST)
Received: from [192.168.69.100] (vau06-h02-176-184-43-100.dsl.sta.abo.bbox.fr.
 [176.184.43.100]) by smtp.gmail.com with ESMTPSA id
 u21-20020a7bc055000000b004129a1097e7sm24003609wmc.12.2024.03.06.09.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 09:03:10 -0800 (PST)
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
X-Inumbo-ID: 69b55285-dbdb-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709744591; x=1710349391; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r2aSHjVP+Xu8BA7aiHVPv6ilPDdzaBKFNJurg14KCaA=;
        b=APIkE72vYt8RezoIHgKYIOtqmquM86KQZTqKEcBoL1lqeRX8PE01UhteMiyKHz306a
         ZsW1tBZPugHHojL4ZxRZvYgcibkhL6cFpn35RcR0z6xnD6PKIZcoJ9Ld1h8g76frPpW9
         P1jG5RxyLKh0q2F69e5MVdf6tiiyyQ4lqCDuifn1LuyprMWPPKHdvzHEQNMTBILRv1lW
         EZ0fhl7TGS3rSImNS92U8XLKEvx+DygKTYtv3Jg4KHqY1OPiD0E4HEQfV+a10I91cVul
         6OgyNDiANlxu36F41XULgsguSEg3dcxqr0av3ctQ3zDtRntmikiLkBxtjCyhCcXzk3f4
         xWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709744591; x=1710349391;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r2aSHjVP+Xu8BA7aiHVPv6ilPDdzaBKFNJurg14KCaA=;
        b=dImpclzI2GabZDCWKz31hC6hathR8B88xy/WsYNyqVuBgpsy6N2pavGBWYCI8k6kCm
         +mjHuIqsaEiqej+JIN01z1TS+fzYtFNibI43jMdSWbOEfqP0d/dvq2dZ57T4kRtQLSQm
         2CHAjehBGgt6/miz/ZfsN5rnr/jPo8j/jGzcHlMkGA/wuwaP7GSkhl1PMo9q4NRRVbrC
         KXzgxIpZ8JfPG+6X7P1SpA0YzKvS4tTWaerVKr2h3SbKvIhovQNrhuNfYy3J4sN3L6oH
         +MxcLhQJ8ciRstJGRgFjtRhNmcCErSpYhegFO9qlMNitSDWsga/ZULtYmNEGIQBN1e86
         K2qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVwvyjwhGpJVF6+Ov5NjWJL9vW67Gl4chxoUQ4E2t40xXrB9B7iO3cv+pW+bNoAz4LTA/bsnEdIxYBfbsFt0fm1c4j38u358lVMd77KOk=
X-Gm-Message-State: AOJu0YxOofIL1n1U9o8Y7FOlAw8vZaHXDLz27G7RI2pFXU/DxMTddz2t
	xW4J0K+2MA8FF7yEV78a1ylsX8Fn5f83GP4yg5dei51efL4+wRtnGE4gUiW4ROg=
X-Google-Smtp-Source: AGHT+IEsDTdAWujgDph7eInjSucsXEx2XwJLDZSG22OQUW1INRiZK92/ydMK1V2qWC2wu4aeYu1cUg==
X-Received: by 2002:a05:600c:1d9e:b0:412:ef25:aaa5 with SMTP id p30-20020a05600c1d9e00b00412ef25aaa5mr3453077wms.36.1709744590971;
        Wed, 06 Mar 2024 09:03:10 -0800 (PST)
Message-ID: <fdb970ba-0b15-4a59-a5ed-f9df1430ddd8@linaro.org>
Date: Wed, 6 Mar 2024 18:03:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.0 0/9] hw/xen: Have ARM targets use common
 xen_memory_listener
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org
References: <20231114163123.74888-1-philmd@linaro.org>
 <0064f684-793e-4954-90cf-d39c21385a43@linaro.org>
In-Reply-To: <0064f684-793e-4954-90cf-d39c21385a43@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

ping ^ 2

On 13/12/23 18:00, Philippe Mathieu-Daudé wrote:
> ping?
> 
> On 14/11/23 17:31, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> While looking at Xen target-specific code, I noticed some
>> generic code used by x86 which is not implemented for ARM.
>>
>> Maybe ARM machines don't need it, I don't know. But I
>> wanted to see if I can get this common code target agnostic
>> and build it once, possibly bringing smth useful to ARM.
>>
>> The changes don't break CI testing and Avocado local tests.
>> If this xen_memory_listener feature isn't required for ARM,
>> I'll send follow up patch that keep this series with common
>> xen_memory_listener but with a runtime flag to disable.
>>
>> Patches do the usual "change target-specific API to a
>> target-agnostic one", in particular using "exec/target_page.h"
>> at runtime. Then non-x86 code is extracted, then merged to
>> the generic xen/xen-hvm-common.c.
>>
>> Thoughts?
>>
>> Regards,
>>
>> Phil.
>>
>> Based-on: <20231114143816.71079-1-philmd@linaro.org>
> 


