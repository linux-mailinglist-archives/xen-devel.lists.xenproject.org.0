Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68558877EB2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 12:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691406.1077355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjdcS-0008Et-Dd; Mon, 11 Mar 2024 11:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691406.1077355; Mon, 11 Mar 2024 11:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjdcS-0008D1-A4; Mon, 11 Mar 2024 11:15:00 +0000
Received: by outflank-mailman (input) for mailman id 691406;
 Mon, 11 Mar 2024 11:14:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1rQ=KR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rjdcQ-0008BZ-H6
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 11:14:58 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97f5114f-df98-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 12:14:57 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5683247fd0fso3918194a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 04:14:57 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 cn19-20020a0564020cb300b0056828004c75sm2857898edb.51.2024.03.11.04.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 04:14:56 -0700 (PDT)
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
X-Inumbo-ID: 97f5114f-df98-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710155697; x=1710760497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yod/563l2iAIl2xPs4D0/Pv76sN1ucJ7AXa1PUo2AV8=;
        b=QbJLNQACOEUS5b1m1AXJCes4zcX5d3U2ZNIiB8JRTOfuB4eVWcXQQtMSSHUoWxWbzL
         HJ16+/Imu6B5J1O2B4frTSGWcxAMeqphQuhzKvfiFTw+i11dxdXFjI49CJKcR9SHkfaO
         E69eyezvj3SDBrKb3mgGG6cOmN26ScUIk+H2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710155697; x=1710760497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yod/563l2iAIl2xPs4D0/Pv76sN1ucJ7AXa1PUo2AV8=;
        b=VKDTCOOG756yympi6q7wcYvwnm4fHj8xp5eSz+H5Fnvfn/oE3ZhvLvF4oQgReGH7up
         hkgiMXNpg0G2fLRyIFcM0WJ8AvIXK38IHk9OeO6NvLECVvvpc/JHfEJ95IW3At9+yZ9J
         PAMVL1bD58SmnMg5tN7/JTNfxLJwO1ZL496FGbBPRN9AZrdey7DOJ1iMADKLpno9v55i
         +nLU9aiO0htQEyu15z9IxvjLQkd0s7RBtRkYxcRNSOu7j7lFuTo/JLOlZKZsnIDyXfLg
         bN9GgTPetA4p6FciD9o9ezSE/YTtq+KfUo1Wwx1NpGCaRHUyLIOkIJW1NIryX8Uqfp+B
         XrJw==
X-Forwarded-Encrypted: i=1; AJvYcCV0l7sVmhhNzEhwSvvuEJBlRY74OhSALeRKJn0LsPsxCMKOC90tgPWUBakMZd5n37nX2NsUgQs5CPCSmivwRgosHsBU6+h7FYy0b17mgoQ=
X-Gm-Message-State: AOJu0Yyy00nrstHx4j+s4saLwZCvcaUFMpy5AA2Tu4/qoWJ8vAnk35ps
	q/O86I4i1DrvfzUkYe0IhKgzJLsb+lT/0nxBxuspg5Btc1vMKYcYe2Y0JlSIoSc=
X-Google-Smtp-Source: AGHT+IFhaM3MYXHZJttcahwtr8QDA1HFZ+hQDhu2HVwGMaoI8U+5xg8L/iqtb1tDad1gSGIYLNgd9w==
X-Received: by 2002:a50:cc9c:0:b0:567:fb9b:37d5 with SMTP id q28-20020a50cc9c000000b00567fb9b37d5mr4198119edi.32.1710155696847;
        Mon, 11 Mar 2024 04:14:56 -0700 (PDT)
Message-ID: <18cb61b2-780c-4378-9279-b5764e9d99a6@cloud.com>
Date: Mon, 11 Mar 2024 11:14:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: fix detection of last L1 entry in
 modify_xen_mappings_lite()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20240311105416.4556-1-roger.pau@citrix.com>
 <a7e045cb-e93a-420b-938d-b7786e8825ab@citrix.com>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <a7e045cb-e93a-420b-938d-b7786e8825ab@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/03/2024 11:01, Andrew Cooper wrote:
> On 11/03/2024 10:54 am, Roger Pau Monne wrote:
>> The current logic to detect when to switch to the next L1 table is incorrectly
>> using l2_table_offset() in order to notice when the last entry on the current
>> L1 table has been reached.
>>
>> It should instead use l1_table_offset() to check whether the index has wrapped
>> to point to the first entry, and so the next L1 table should be used.
>>
>> Fixes: 8676092a0f16 ('x86/livepatch: Fix livepatch application when CET is active')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
>> ---
>> This fixes the osstest livepatch related crash, we have been lucky so far that
>> the .text section didn't seem to have hit this.
> 
> I'm very surprised too.
> 

The two stages for software debugging:
  1. I really don't see how it can possibly fail.
  2. I really don't see how it could have possibly worked.

