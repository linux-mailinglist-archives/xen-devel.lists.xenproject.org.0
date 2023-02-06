Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151DA68BD8C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 14:11:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490422.759105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP1H0-0004qY-JB; Mon, 06 Feb 2023 13:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490422.759105; Mon, 06 Feb 2023 13:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP1H0-0004op-Fs; Mon, 06 Feb 2023 13:11:06 +0000
Received: by outflank-mailman (input) for mailman id 490422;
 Mon, 06 Feb 2023 13:11:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvBD=6C=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pP1Gz-0004oj-L0
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 13:11:05 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6104796-a61f-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 14:11:04 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id gr7so34003358ejb.5
 for <xen-devel@lists.xenproject.org>; Mon, 06 Feb 2023 05:11:04 -0800 (PST)
Received: from [192.168.1.93] (adsl-89.109.242.139.tellas.gr. [109.242.139.89])
 by smtp.gmail.com with ESMTPSA id
 bn18-20020a170906c0d200b0087f68a2681bsm5497250ejb.96.2023.02.06.05.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 05:11:04 -0800 (PST)
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
X-Inumbo-ID: b6104796-a61f-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6zNTbd2Z2XxmcopTyvxRAuoZZXbDNV1HPXuOoDsllLw=;
        b=Sgw+wt1y8XkOdY8IiFuukjL7Dt8V092rtqOwV5sfvVXqWWjKSPkRkKQs6Z278n8bJR
         2DBLrvQElGaQSdXbU03R25pSe7Crh/EOgMo4pbn7z8SNd+M3M2+CLUDYAj9szAQWLPeM
         ZuPwyO93NGUW7WEhoBf1SDYAr6u0FpESWkHgRi9sqmd/1Bgm8KBk9S+SU667YG9bHdlF
         Pxtw9RwG30CRrRd50XwbfWNmgE4SeG41304DRIHMSvhG7/BYmNHXFqqWMCraC8WKGQW/
         dzQSyjdoxecPGX6OmRpQWV76OAyYxZ+Bzxemt66/dE4Qt7Jg/5Zy0KXSwvq1elX2Sj7g
         PhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zNTbd2Z2XxmcopTyvxRAuoZZXbDNV1HPXuOoDsllLw=;
        b=HLuD7w4WLEyAMhfGQeUnfwKPSirHZlrWpbDpk5Wt89u60plaVP4oSRvX83n/tYjbn9
         gA/5YYCP6he0GxqiUdaUuRgshiIOZFG39XYJmpvt+dCDnIgeqmC4JA31d09Etnli72e0
         AqkV/VEEf7kFIZURRC77Tn+gdHzWRYePtgNA49mQAnYsE4eX0eLHtM/tqIeBQ1GWylQm
         ZtJClm4K0WjwqNjDhReAG0cZxuuOVxdkjk2ZuYc/8AAYdtCJsFZhJGDNsDptxt7Q3MvF
         C5jIE0dwDcuoLDKWgFWo4c9IODUIa91aALnLyMCx8WqjzF8x9PZVOKT6XIDyj03w2tlm
         8p8w==
X-Gm-Message-State: AO0yUKWWJbR+wQf6yZYkxxCVQTV6CKAgD43RnT35TEX5NgnWaMd2wELb
	Tpy1EkG3439Q3IGWH8dW6Vk=
X-Google-Smtp-Source: AK7set9lJM4uZIKi3h9uRVAlK+uEnMCNY/GiyVy1Nd8gLExPwdPBImhOM4lqQayL8rDaFdnO3HvWrg==
X-Received: by 2002:a17:906:ee8d:b0:8a4:e0a2:e77f with SMTP id wt13-20020a170906ee8d00b008a4e0a2e77fmr3677810ejb.34.1675689064507;
        Mon, 06 Feb 2023 05:11:04 -0800 (PST)
Message-ID: <5c112f02-37ab-8637-3e61-e5e19f42115d@gmail.com>
Date: Mon, 6 Feb 2023 15:11:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] x86: do not include asm/hvm/support.h when not used
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20230206124251.911744-1-burzalodowa@gmail.com>
 <20230206124251.911744-2-burzalodowa@gmail.com>
 <90bef569-a49c-fd29-a855-5ef0b93b1056@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <90bef569-a49c-fd29-a855-5ef0b93b1056@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/6/23 15:01, Jan Beulich wrote:
> On 06.02.2023 13:42, Xenia Ragiadakou wrote:
>> --- a/xen/arch/x86/emul-i8254.c
>> +++ b/xen/arch/x86/emul-i8254.c
>> @@ -34,7 +34,7 @@
>>   #include <asm/time.h>
>>   #include <asm/hvm/hvm.h>
>>   #include <asm/hvm/io.h>
>> -#include <asm/hvm/support.h>
>> +#include <asm/hvm/save.h>
>>   #include <asm/hvm/vpt.h>
>>   #include <asm/current.h>
> 
> To be honest I'd prefer if only the HVM-specific part of this file had
> this new #include (and ideally the other hvm/ ones would move there as
> well, but I can see this being beyond the scope of what you're wanting
> to do).

Ah I see. That's ok. I ll move it in v2.

> 
> Jan

-- 
Xenia

