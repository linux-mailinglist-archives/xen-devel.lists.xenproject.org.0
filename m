Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF30874EC0
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:16:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689852.1075226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCfX-0004Cj-I4; Thu, 07 Mar 2024 12:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689852.1075226; Thu, 07 Mar 2024 12:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCfX-0004BD-FD; Thu, 07 Mar 2024 12:16:15 +0000
Received: by outflank-mailman (input) for mailman id 689852;
 Thu, 07 Mar 2024 12:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qXJj=KN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1riCfW-0004B7-2I
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:16:14 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c5fd32c-dc7c-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 13:16:12 +0100 (CET)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-7884bfc77acso3147185a.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 04:16:12 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 vv24-20020a05620a563800b0078821ab6668sm5015970qkn.34.2024.03.07.04.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 04:16:10 -0800 (PST)
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
X-Inumbo-ID: 7c5fd32c-dc7c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709813771; x=1710418571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YVs+BxVlwZMWWSv06IRPU7DiZaS7F6CzcUc0mkPOuaE=;
        b=hBu7ngQRrOlQW5HOw9MgtuePvECkg5CNCDn+MO5/3IfTIjj32WK8DPl0as5PiXmb92
         SZROL4eDS/12C8VDM5m6kTDAqOJl4pkezhbUmhE2/9wA1yr5USNaXk1+iNgiVqHn4aKd
         DPXdrOe25XZm7xPpliXnVS/JfJEJysG2J1tfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709813771; x=1710418571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVs+BxVlwZMWWSv06IRPU7DiZaS7F6CzcUc0mkPOuaE=;
        b=JrHeI7FFCdXb6X6Wm8P/7MEuKgETs12AJyAHPL7hocLYG9SboKJgQmSK/CRSf38qFP
         zhm8iheDuYWz/CGNXcvaof6NlBv66puiKfoIWbGvyA2YyxlbfRx8xPyqLK38zQ62a+U5
         sXzdNk7s6l+JlLSab0NCUiitCPb0IoAQmMpVgHC3POkQiS1YWXD2UvpFqX41vBQdM9U0
         Pt+uYV75f8Uw7mMXnX2/2X8GqAa/nhfzytVleS/sWl8nrJ1faCPLGqBr+Jxhdxw5eprU
         3nn6ZY69Z0JeSRPwuZhfq5yLVSrNUm1kXuxKxF0K7RxhiFBqz0AeSw0oI31hF+D9I78A
         tbuw==
X-Forwarded-Encrypted: i=1; AJvYcCUG2LX8B8kovu7z4AUwxBHFWfkMd2dH+zWGZTh9kA5KqIxJaLUzETxhpk4a6oSkEhzXF6gJf51Tej3PtNkGk+1g/zmAiA7/radcV6ltJl8=
X-Gm-Message-State: AOJu0Yzmz4qrPxaXXJ8dAmAbALOPRMXgCet3vHhAYSJz8GnS6IZYa1m7
	T88Tru2FxW/FsumqrZSpPquIJr664BvlWQyFbULppikgYdvBRTxzh7Sz1ojcDJg=
X-Google-Smtp-Source: AGHT+IFeNEeNc66TzOYEswILIHEvQI7AlVThlYIpa4WrWBrqu1nuDKfzsjqCG3Gk5j2cnUSK7p5O3Q==
X-Received: by 2002:a05:620a:5373:b0:788:332d:6f7e with SMTP id op51-20020a05620a537300b00788332d6f7emr7875162qkn.39.1709813771111;
        Thu, 07 Mar 2024 04:16:11 -0800 (PST)
Message-ID: <e8b5ef98-900b-42b7-a688-a379168ef396@citrix.com>
Date: Thu, 7 Mar 2024 12:16:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/virtual-region: Include rodata pointers
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ross Lagerwall <ross.lagerwall@cloud.com>
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
 <20240305121121.3527944-3-andrew.cooper3@citrix.com>
 <87b82706-f538-4807-abaf-1e59cebd286b@suse.com>
 <CAG7k0EqWrPU0qocSJHyJAQca44LakQwZwAbiv5GRk-sQeaAYAg@mail.gmail.com>
 <82126c3a-0cde-452f-86aa-2571482f42aa@citrix.com>
 <76ce9dcf-8cac-44b3-9550-f516024bad6e@suse.com>
 <9e827057-9306-4a2a-8816-410661bf8892@citrix.com>
 <818ac202-5473-4638-b140-45272b1041ed@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <818ac202-5473-4638-b140-45272b1041ed@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/03/2024 11:58 am, Jan Beulich wrote:
> On 07.03.2024 12:31, Andrew Cooper wrote:
>>
>> The thing called virtual_region already describes 6 ranges, and I'm
>> adding a 7th.
> Hmm, yes, in a way you're right.
>
>> It has been a module-ish description right from the very outset.  I
>> don't think it is fair to describe this as an abuse at all.
>>
>> Is this going to satisfy the outstanding concerns?
> Yes. And thank you for bearing with me.

No problem.  I'm glad that we've come to an agreement.

Ross?

~Andrew

>
> Jan
>
>> diff --git a/xen/include/xen/virtual_region.h
>> b/xen/include/xen/virtual_region.h
>> index d05362071135..9d150beb8a87 100644
>> --- a/xen/include/xen/virtual_region.h
>> +++ b/xen/include/xen/virtual_region.h
>> @@ -9,6 +9,12 @@
>>  #include <xen/list.h>
>>  #include <xen/symbols.h>
>>  
>> +/*
>> + * Despite it's name, this is module(ish) description.
>> + *
>> + * There's one region for .text/etc, one region for .init during boot only,
>> + * and one region per livepatch.
>> + */
>>  struct virtual_region
>>  {
>>      struct list_head list;
>>
>> ~Andrew


