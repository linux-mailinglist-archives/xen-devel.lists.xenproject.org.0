Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D76C82B276
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 17:08:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666427.1037056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNxbJ-0004cT-E9; Thu, 11 Jan 2024 16:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666427.1037056; Thu, 11 Jan 2024 16:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNxbJ-0004Zj-B2; Thu, 11 Jan 2024 16:08:13 +0000
Received: by outflank-mailman (input) for mailman id 666427;
 Thu, 11 Jan 2024 16:08:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPRU=IV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rNxbH-0004ZY-Vo
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 16:08:12 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d31f713-b09b-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 17:08:10 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e624a8cbbso3955995e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 08:08:10 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c4f9600b0040e53f24ceasm2413409wmq.16.2024.01.11.08.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 08:08:09 -0800 (PST)
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
X-Inumbo-ID: 9d31f713-b09b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704989289; x=1705594089; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46475TwqCHLodT7PISpqn7vSvRTuu0sInGJO70CSMtc=;
        b=KhhY99IkC3ZsUCpOPLxKwbIFmvaJcvpXghb9T+PqJdD+PRYfHgyiJz1wh2bHWNrv8v
         Mqcoas5/BQedY37qi0Aj3yBqLhWMAmbzC1LfL9Jh++vouYMXpQ9blGuyCnFBYPwTtRIX
         zt06N5LnMHhY0+eSea0CKCHgkV+0bHeJ9Pxxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704989289; x=1705594089;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46475TwqCHLodT7PISpqn7vSvRTuu0sInGJO70CSMtc=;
        b=clmlsgxkiY3WguGkSSebzBeoKKTGjulIfnmnolSwEM7gxV1BFyV+G7iHSpCakWQOdI
         xYYqbsBC+h/4qh/gWgngF1u8bu0UoyX/5FlNFN6RCHjthnLQ86W16TU67TkA8O2+Wcvw
         k9df/i8OVEyE/rzXSZElX8EvZ6rhgs5ScIyq28Op7MkYqk+hEsD3utiBUeeyjCHFJc9o
         o5iSnX2dQs+J4PSFI82Bu9eoOPrgTu9Gj4XlkOxPdzdodHULtnube/ma7tB1zBHBfS6/
         qq4YRQfF0MxcZip3aSsTFtVpfVxvx6ma70qH891rPg+KdcAX5RioBlQPnpDRSFe8EiHc
         5PKg==
X-Gm-Message-State: AOJu0YxUvG+NPa3CdCr7sCAB/iaMnhCxVjh7lSf72ORiRGaWNGkq0g2m
	cRlECWdPtfbBTrYEiwxJ3GWaW+Pwk/jXWg==
X-Google-Smtp-Source: AGHT+IHZwQZAA+u1HUNPxvp2swE+xsKXoVQDFz1rNddkECMIPHrBr2GugttVnOvF9qJwRwnPSG+fKQ==
X-Received: by 2002:a05:600c:4f48:b0:40e:6195:239c with SMTP id m8-20020a05600c4f4800b0040e6195239cmr28586wmq.90.1704989289515;
        Thu, 11 Jan 2024 08:08:09 -0800 (PST)
Message-ID: <d0af2c58-e902-48d5-b616-da5accf05375@citrix.com>
Date: Thu, 11 Jan 2024 16:08:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] keyhandler: don't pass cpu_user_regs around
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <dd1c24ec-4054-43e1-b0c9-6c2044b84046@suse.com>
 <7d21e38d-d1f8-46df-89ef-809dd9c5a38b@citrix.com>
 <aa0a0b1c-ffe0-456f-933f-2e62c9a47f82@suse.com>
 <ea5c4f94-e4eb-471e-aa45-cf4b8a3a3763@citrix.com>
 <5fb290bc-ded2-4883-a726-caeed98e9445@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5fb290bc-ded2-4883-a726-caeed98e9445@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/01/2024 3:49 pm, Jan Beulich wrote:
> On 11.01.2024 16:24, Andrew Cooper wrote:
>> On 11/01/2024 12:11 pm, Jan Beulich wrote:
>> It does occur to me that we're trying to accommodate for two behaviours
>> here.
>>
>> For a real keypress, we want to dump from the the point the interrupt
>> hit because that's the interesting bit of stack to see.  For a SYSCTL,
>> there's nothing, and we're using BUGFRAME_run_fn to generate one.
> There's three forms of handle_keypress() invocations really, and hence
> why (after having dropped the regs parameter already) I re-instated it.

Ok.  As you've done this analysis work, can you list these 3 forms?

I've clearly missed one in my analysis.

>
> As an aside - no, sysctl handling does not generate an exception frame.
> Is uses guest_cpu_user_regs() (and imo validly so).
>
>> So actually we just simply want "regs = get_irq_regs();" here and retain
>> prior NULL check, don't we?
> As per above, after I had it that way first, I backed off to accommodate
> all present use forms of handle_keypress(). But dealing with that (in
> whichever way we may end up deeming workable) can be separate anyway,
> afaict.

When complexity is involved, I always prefer to make changes in smaller
chunks.

~Andrew

