Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D877BBC44
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 18:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613744.954501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qonGv-0004ni-2U; Fri, 06 Oct 2023 16:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613744.954501; Fri, 06 Oct 2023 16:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qonGu-0004kM-Ua; Fri, 06 Oct 2023 16:01:48 +0000
Received: by outflank-mailman (input) for mailman id 613744;
 Fri, 06 Oct 2023 16:01:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vVKM=FU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qonGt-0004kG-Gu
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 16:01:47 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5d4567c-6461-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 18:01:45 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40651a726acso20828325e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Oct 2023 09:01:45 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ay20-20020a05600c1e1400b0040640073d25sm4088608wmb.16.2023.10.06.09.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 09:01:44 -0700 (PDT)
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
X-Inumbo-ID: a5d4567c-6461-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696608105; x=1697212905; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz3hj6YbxS7+NsoIRQ5kUSI4xOf4m7CXOGyEthgsV8U=;
        b=FIZmcTHrOARBf4j/si5/0X2mRY1zxvm+PNkub7nQGyPWcvjLYdcOqg04+u2kct/B8l
         xZ8HxUX6NechtFqDO6ijs3aEthq0M+Nkxijuu/EGbHlruhue/youtXdr5zsnp+GQZRDT
         vgf49JqwKDH4HQJhec1PeroDEVDdriw69CKeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696608105; x=1697212905;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oz3hj6YbxS7+NsoIRQ5kUSI4xOf4m7CXOGyEthgsV8U=;
        b=iwPNG/WSbN4bMkR3S/h2KjU0bcm0ZmFu/AA3SXjw1BGOrBuwUjmy81KXfb7tJ3/1Mu
         audZDBibMJtuJ4VjVZ0opimVORUxBHFCiDt+FWCk0HHkESe9hGYMr34Q+6BFbKgjv689
         epoOgagWkM4pxxMWeWOiX2JBHeu/8CbTQc2UXyBFjBwOlgS0fY9uE8fsQnfkfriCE6kf
         vQjlsu0nAPk/Rn3ER1bpyQW+D0AD0yTgmolY/Rn006pJxtJOuWXqYpHZT8sjV2xOZjfb
         m3dzO8KlyMec4sCKnrIuxonc6Dwu+fkaBJyjpUzJH7eTv8M3096UQQ+7yYemZt1ArnqO
         Jp6w==
X-Gm-Message-State: AOJu0YyKa0blOLwv7XqbCyq+Yc52GnB2qt0FqMeiPTjKdixuukfjD85Y
	2BhgCpKgIR2zhre1cpY0xevIRA==
X-Google-Smtp-Source: AGHT+IGCw/BGyrDkJ6zO6xd5GEX5tZJL+x+v08ooQGglKuEmnoMd2M8YZy7yjI4JdgJywWP9KyIOxQ==
X-Received: by 2002:a05:600c:2044:b0:402:e68f:8896 with SMTP id p4-20020a05600c204400b00402e68f8896mr8166321wmg.0.1696608104666;
        Fri, 06 Oct 2023 09:01:44 -0700 (PDT)
Message-ID: <b95fa9cd-2534-4d7a-9843-2bc71695655d@citrix.com>
Date: Fri, 6 Oct 2023 17:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.18 v5] xen/pdx: Make CONFIG_PDX_COMPRESSION a common
 Kconfig option
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Julien Grall <jgrall@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Henry Wang <Henry.Wang@arm.com>, George Dunlap
 <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231006144405.1078260-1-andrew.cooper3@citrix.com>
 <efc2b22e-6650-4c1f-b4cf-9971d4d08b49@xen.org>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <efc2b22e-6650-4c1f-b4cf-9971d4d08b49@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2023 4:09 pm, Julien Grall wrote:
> 
> 
> On 06/10/2023 15:44, Andrew Cooper wrote:
>> From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>
>> Adds a new compile-time flag to allow disabling PDX compression and
>> compiles out compression-related code/data. It also shorts the pdx<->pfn
>> conversion macros and creates stubs for masking functions.
>>
>> While at it, removes the old arch-defined CONFIG_HAS_PDX flag. 
>> Despite the
>> illusion of choice, it was not optional.
>>
>> There are ARM and PPC platforms with sparse RAM banks - leave compression
>> active by default there.  OTOH, there are no known production x86
>> systems with
>> sparse RAM banks, so disable compression.  This decision can be
>> revisited if
>> such a platform comes along.
> 
> (Process remarks rather than the code itself)
> 
> Jan is away this week so I want to make sure this doesn't go in without
> him having a say.
> 
> While I don't particularly care about the approach taken for x86, Jan
> voiced concerned with this approach and so far I didn't see any
> conclusion. If there is any, then please point me to them.
> 
> For the record, the objections from Jan are in [1]. If we want to ignore
> them, then I think we need a vote. Possibly only from the x86 folks (?).


What do you think the 2 x86 maintainer tags on this patch in this exact
form, following far too much wasted time already, represents.  The vote
has already concluded.

~Andrew

