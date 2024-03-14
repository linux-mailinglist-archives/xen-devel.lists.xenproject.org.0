Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066A87BB0E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 11:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693105.1080845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rki5x-00025U-56; Thu, 14 Mar 2024 10:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693105.1080845; Thu, 14 Mar 2024 10:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rki5x-00023K-1z; Thu, 14 Mar 2024 10:13:53 +0000
Received: by outflank-mailman (input) for mailman id 693105;
 Thu, 14 Mar 2024 10:13:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CDQ4=KU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rki5v-00023E-N6
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 10:13:51 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cff4877-e1eb-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 11:13:49 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-513d3746950so247890e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 03:13:49 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 az9-20020adfe189000000b0033e43756d11sm418115wrb.85.2024.03.14.03.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 03:13:48 -0700 (PDT)
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
X-Inumbo-ID: 8cff4877-e1eb-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710411229; x=1711016029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QV/7YSOjyXoSad2Q83mYfpPTpBrwdJT2JAjx5TCIICs=;
        b=U6Y42fGP2F+NXzf2xKbsE4uHCp+ILe0uLwAcZVlRn0aOa3TTc+Vg9hjTJgYfXXC8F4
         Nd8M1yZ5nxG/HwL9O6PXVkvA8t5bBtE4JQBOgMu2iLUJzCKTk8n9H6tDvH2VMA/nGMeY
         vzOk/iJJ+c5vyjuOvk3F9ah0IYC1DqY9IMc3J0RJPNC4qgtafWOdKz2RUyRXobDkrKer
         2clT6jXu5zsWpV06jY4ASwhFyZ98evILdjdq7kaIVQE6/WhL8AgFquL4vaRJP6Tg1PUJ
         B7EHR6AO4sekIP2XBEuKqHEd/46PbP8mcmrRFOblGku6VnnLBle5GukR+cM+UDHEEmnr
         r9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710411229; x=1711016029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QV/7YSOjyXoSad2Q83mYfpPTpBrwdJT2JAjx5TCIICs=;
        b=USbZycsZ+y4S/iMHtZpB2s8laq3fJds5JY29geKgefdQO5fVWySmzwxJk0IPvEpTkn
         z5q0cbbP2dKKZyutdl8VIoHk1zYKEc6lD8PSXjxNQUv/sqq76hGJFlezvZDhMlsqJbCT
         v3IRl+g8HxrKzWr9Nbg8HRst0BsnZq84jbXXq1YY91usYqjbluqUQIWJjJtJoGdNQbaG
         tJ9ZgSGkJXHB6ADt+mLQGkMfcjowsA1V4wY/gUJIb2qQUeU0aFe3A2VLGv+i4m4ztIN3
         zXcvE61eVK1hmEckfGLK3nhGc0zYp7sVJ5SJjer/6DJ02ZLGgLSGoAFPWV6d8eWyh6l5
         NpKg==
X-Forwarded-Encrypted: i=1; AJvYcCV8t7Ogtq3Uf58pMmjRAV0ZNaLn2HONbmI0PMr6sYpmt1DwKiL+J++SzkLY/mjcfLyULUHa+Z3Bwq9L2M28xMZVCxlDatlGwzfgzi+ALjQ=
X-Gm-Message-State: AOJu0YzRQMQ7uhobQCxMcXwKrrauMt8u1yu9z6ZH8akISrqzKKjc/dih
	LQklX9HFaSgjPOITPTFW8SupkawXCO6ekXdCWzz2gZBFrYbzmL7kvZ7A/gdcpAE=
X-Google-Smtp-Source: AGHT+IFsdAq1sObnIBALiBXbjhwsyGGd6S6C10jbyOssYWYqr4CSQ/1oBaatC2I4q63KzfvSvAcEPg==
X-Received: by 2002:ac2:4296:0:b0:513:96ff:a04a with SMTP id m22-20020ac24296000000b0051396ffa04amr770394lfh.43.1710411228962;
        Thu, 14 Mar 2024 03:13:48 -0700 (PDT)
Message-ID: <3753234c-2f9c-44f1-84f5-60a58c81b7b6@suse.com>
Date: Thu, 14 Mar 2024 11:13:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] xen/spinlock: remove misra rule 21.1 violations
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-2-jgross@suse.com>
 <272d0e4a-3ac0-4b42-9297-6d476151e28d@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <272d0e4a-3ac0-4b42-9297-6d476151e28d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.03.24 08:32, Jan Beulich wrote:
> On 14.03.2024 08:20, Juergen Gross wrote:
>> In xen spinlock code there are several violations of MISRA rule 21.1
>> (identifiers starting with "__" or "_[A-Z]").
>>
>> Fix them by using trailing underscores instead.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> I can live with the changes as they are, but before giving an ack, I'd
> still like to ask if the moved underscores are really useful / necessary
> in all cases. E.g.
> 
>> --- a/xen/include/xen/spinlock.h
>> +++ b/xen/include/xen/spinlock.h
>> @@ -22,7 +22,7 @@ union lock_debug {
>>           bool unseen:1;
>>       };
>>   };
>> -#define _LOCK_DEBUG { .val = LOCK_DEBUG_INITVAL }
>> +#define LOCK_DEBUG_ { .val = LOCK_DEBUG_INITVAL }
> 
> ... for an internal helper macro it may indeed be better to have a
> trailing one here, but ...
> 
>> @@ -95,27 +95,27 @@ struct lock_profile_qhead {
>>       int32_t                   idx;     /* index for printout */
>>   };
>>   
>> -#define _LOCK_PROFILE(lockname) { .name = #lockname, .lock = &(lockname), }
>> -#define _LOCK_PROFILE_PTR(name)                                               \
>> -    static struct lock_profile * const __lock_profile_##name                  \
>> +#define LOCK_PROFILE_(lockname) { .name = #lockname, .lock = &(lockname), }
>> +#define LOCK_PROFILE_PTR_(name)                                               \
>> +    static struct lock_profile * const lock_profile__##name                   \
> 
> ... I'm not entirely convinced of the need for the double infix ones
> here ...

This reduces the chance of name clashes with other lock profiling variables or
functions (e.g. lock_profile_lock). In case you think this can be neglected, I'm
fine with dropping the extra underscores.


Juergen

