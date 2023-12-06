Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD445806E10
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 12:33:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649134.1013535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAq9a-0003e2-Ps; Wed, 06 Dec 2023 11:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649134.1013535; Wed, 06 Dec 2023 11:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAq9a-0003b6-LU; Wed, 06 Dec 2023 11:33:22 +0000
Received: by outflank-mailman (input) for mailman id 649134;
 Wed, 06 Dec 2023 11:33:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rHB2=HR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rAq9Z-0003b0-5j
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 11:33:21 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41162716-942b-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 12:33:19 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c0a0d068bso33016815e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 03:33:19 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 fl8-20020a05600c0b8800b0040b37f1079dsm25733060wmb.29.2023.12.06.03.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 03:33:18 -0800 (PST)
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
X-Inumbo-ID: 41162716-942b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701862399; x=1702467199; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RtEQcKbt+YxPr2cmkE466WhRtvfACjQaCrMaylf9cWs=;
        b=jM1ycEOeotLtZg6574wnLbqfyMd9flRmx7yBlVcw7Kz6MUM6/0t5s8XzLrApPHDWAg
         MRL7K/zt2+M3KedwPadO2cewyLMtKOXUWi+iIPD9v2pS/oCYPKNXk20wgXJ+7hqN4mOa
         xOujArEwRswid7110fJkCatG4Rt0FMr8kIk9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701862399; x=1702467199;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtEQcKbt+YxPr2cmkE466WhRtvfACjQaCrMaylf9cWs=;
        b=o2/e+9rGvfnN2H9V8/Sll7xX/MO98JRZadE7Zs6q9Doc9Sq8CpEOTFBliVAszlhhEJ
         POM8cX1De1xavR+9ugbfhUg8b/ix5CpiRLL46kPkyCoPF0VvM8uq3EvR67GY8p3kypi4
         1gAhu9OGE2iYUJIyHe7lUouMpkq8JDZc6pvBwwim2gfBC/YqxrTW7PKFFCMBlWmHK1dO
         U+2paPiPLZITynXMrOzo1tVCnCcT7/sSwFqTiqmgy5Z625WzuPyzVoUKmDm8ERm4T3ke
         I5209TA1H7MYdJ9g+ILBJ4E1j+mLy+dgDoBj42aAkW89j59y/AIKLNnMvcFNsT+/Fj1F
         GXzA==
X-Gm-Message-State: AOJu0YxQe7PWjNQNGNMgnK7d+0h7dtZYV79wC9CaMKOTbyrpZuVzNmZ/
	nBDhFn/kNcRWucJzltDP+20ZzfITTRbFFo8OEuM=
X-Google-Smtp-Source: AGHT+IHI1xP7Xg12Me6OWjaJfjgAqD2aHBe0q4o9ACX6qKhTERfQiOFmNyokvv4Fk+gwoOb3gTDsAg==
X-Received: by 2002:a05:600c:46d1:b0:40b:4c36:f80 with SMTP id q17-20020a05600c46d100b0040b4c360f80mr571531wmo.32.1701862398723;
        Wed, 06 Dec 2023 03:33:18 -0800 (PST)
Message-ID: <9af90251-e16a-43b2-acdc-fa6feddd5a22@citrix.com>
Date: Wed, 6 Dec 2023 11:33:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>
References: <20231206071039.24435-1-jgross@suse.com>
 <20231206071039.24435-3-jgross@suse.com>
 <31e2e2cd-2b83-43cc-a385-97feef2cdbb6@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <31e2e2cd-2b83-43cc-a385-97feef2cdbb6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2023 10:59 am, Andrew Cooper wrote:
> On 06/12/2023 7:10 am, Juergen Gross wrote:
>> diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
>> index 0a2b16d05d..0ceb06a2bb 100644
>> --- a/xen/include/xen/unaligned.h
>> +++ b/xen/include/xen/unaligned.h
>> @@ -1,12 +1,4 @@
>>
>> -static inline uint16_t get_unaligned_be16(const void *p)
>> +static inline u16 get_unaligned_le16(const void *p)
> I've done some cleanup for you.
>
> You swapped away from using stdint types, and shuffled the order of
> functions, which made the diff basically illegible.
>
> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=commitdiff;h=1d448a845ee4ad74cab76563b3a2552b10953186
> is a much shorter diff.

Oh, and the Origin link ought to be

https://git.kernel.org/torvalds/c/803f4e1eab7a8938ba3a3c30dd4eb5e9eeef5e63

which is shorter and also lets people on the web view it.

~Andrew

