Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35218802C1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 17:54:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695517.1085361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmcj6-0007u5-Ma; Tue, 19 Mar 2024 16:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695517.1085361; Tue, 19 Mar 2024 16:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmcj6-0007qa-JF; Tue, 19 Mar 2024 16:54:12 +0000
Received: by outflank-mailman (input) for mailman id 695517;
 Tue, 19 Mar 2024 16:54:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQvM=KZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmcj5-0007hl-6w
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 16:54:11 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dd1b257-e611-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 17:54:09 +0100 (CET)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-6962e6fbf60so11649786d6.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 09:54:09 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f7-20020a0562141d2700b00690f0d7057esm6654927qvd.39.2024.03.19.09.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 09:54:08 -0700 (PDT)
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
X-Inumbo-ID: 4dd1b257-e611-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710867248; x=1711472048; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cutktx+ICee1wOAHN/b2stNjsIly+eRSrL1CyxQSNSY=;
        b=t3Nf8E7NnFE4Sw0loM0D4KfOPN3bVELLklWY4hCdtDy0MrlDW33G5Xv5/WdiZiTU5L
         +j45CPm4Pg2sijm8iVMLqncwlEPL+o4bkgzBscdYLuxWetNZdGZ0eFJIDODd5Num/J4Y
         1wxHCxbfEkdp1N+RSvRbkZzqmrbfb7TFFXmbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710867248; x=1711472048;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cutktx+ICee1wOAHN/b2stNjsIly+eRSrL1CyxQSNSY=;
        b=AxSk/SieYTW4kVwma376gtc6gYv26DIKs1HZxgR5WYy+St6hWfUT2wFCOF361tKtL6
         TirytewgblJuBROCW4TLpsTMMe6Xg2N01QckqPHJRDz2lygNx05If4hXocbnCK93+uNX
         aeYNveopf2QqNe5xUGCuRTV5lEqTiG9dukIzFv30UC4rx2MiJOrY8Zgw7ElJykqQTg0n
         RB3reKSVfK9K6WuvY7ZoB8ropke5iXFeiakbmptwZQN0o/T3o4RX5GFu9FFaqnSioGBX
         n+HtQhRVFMnM9osBbeyCbjyZT9FJh73E1uZum9VQbhDzZHNyZ3hfTpOmkmIf9W3FJCed
         /rug==
X-Forwarded-Encrypted: i=1; AJvYcCWTaKslvHx2jeMuqpAZ/UfjoiW9VmcFcAtgXSgtxxnCROpyjy4Ec9kGp2/y/B0Z9F0KBtwTqDGJ1CTjPSS5Deg/cQKMaTGCptZ4cWJ5Npo=
X-Gm-Message-State: AOJu0YzrjpFYlikUuu8N4cgl1yADpCd50VYgVlcSYO7eTmNq0QeuNIKe
	mUjgylfiBTIDkU9oWd5WUixE7/Wf2yyrDFdTL6+3uQb4a2gWOVIOt5xf4S0OPPnN+3SLLpu1qJ1
	y
X-Google-Smtp-Source: AGHT+IFYmFA5/QWhfmnDwkW7P5s+XlmV13ZjXYQ35OAJKaDaBdMtRumBvBwUp8J6/yAk7pXY+uktkQ==
X-Received: by 2002:a0c:f912:0:b0:690:c79a:2d35 with SMTP id v18-20020a0cf912000000b00690c79a2d35mr15089006qvn.9.1710867248458;
        Tue, 19 Mar 2024 09:54:08 -0700 (PDT)
Message-ID: <31653616-35c0-4ad5-a9df-2a1496416f3f@citrix.com>
Date: Tue, 19 Mar 2024 16:54:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/boot: Support the watchdog on newer AMD systems
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240319144802.3894710-1-andrew.cooper3@citrix.com>
 <20240319144802.3894710-3-andrew.cooper3@citrix.com>
 <b27f1635-7f0d-4c8b-9dcc-934a84bdd98a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b27f1635-7f0d-4c8b-9dcc-934a84bdd98a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/03/2024 4:51 pm, Jan Beulich wrote:
> On 19.03.2024 15:48, Andrew Cooper wrote:
>> The MSRs used by setup_k7_watchdog() are architectural in 64bit.  The Unit
>> Select (0x76, cycles not in halt state) isn't, but it hasn't changed in 23
>> years, making this a trend likely to continue.
>>
>> Drop the family check.  If the Unit Select does happen to change meaning in
>> the future, check_nmi_watchdog() will still notice the watchdog not operating
>> as expected.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> --- a/xen/arch/x86/nmi.c
>> +++ b/xen/arch/x86/nmi.c
>> @@ -387,15 +387,12 @@ void setup_apic_nmi_watchdog(void)
>>      if ( nmi_watchdog == NMI_NONE )
>>          return;
>>  
>> -    switch (boot_cpu_data.x86_vendor) {
>> +    switch ( boot_cpu_data.x86_vendor )
>> +    {
>>      case X86_VENDOR_AMD:
>> -        switch (boot_cpu_data.x86) {
>> -        case 6:
> Just to mention it - this case label has been dead code anyway for about 10
> years.

Yeah... I noticed that after writing the commit message, although it's
not very easy to slip in.

Also it's 25 years since the K7 was released (June 1999), because I
apparently can't count.

~Andrew

