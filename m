Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650DB81B451
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 11:50:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658805.1028182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGcP-0005hR-Ea; Thu, 21 Dec 2023 10:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658805.1028182; Thu, 21 Dec 2023 10:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGcP-0005eF-B6; Thu, 21 Dec 2023 10:49:33 +0000
Received: by outflank-mailman (input) for mailman id 658805;
 Thu, 21 Dec 2023 10:49:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yxSo=IA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rGGcN-0005cw-Ra
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 10:49:31 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dcd119b-9fee-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 11:49:29 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d4103aed7so2004485e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 02:49:29 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k4-20020a5d66c4000000b00336755f15b0sm1749980wrw.68.2023.12.21.02.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 02:49:28 -0800 (PST)
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
X-Inumbo-ID: 9dcd119b-9fee-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703155769; x=1703760569; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yn4VRIhhFyvs5CfnHpdoDU7KtUorz+VOVIRC0NZ0jSc=;
        b=LzkxlXa6nXQEd3rsFDLoosESX86bOE93U5dQdifTGBnv+/xpttZkoeiPw9VrBVdc8J
         /q9xTtm7FncVFr+ZJQXCPiwQAyYCB38hPJMnjKFPzaoqES6QrDcKzrc/GCZc7G5tl0wi
         16gGN367zAY4cezq9Wq0jWXKmn9NERc9vLZPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703155769; x=1703760569;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yn4VRIhhFyvs5CfnHpdoDU7KtUorz+VOVIRC0NZ0jSc=;
        b=mhuooDX/HhSlXMTxI8/ORc4ylKKnc5VXQDi9QWcAsykp69vCUM6Awb3FjWWh99DRiM
         Zj4KiXFc4NE87uA7H3/WzNd3GpP2NWaolqN0qi406SN1fO684wJHFKUunByjtMN8U2Td
         UkRDfFY0kDTYl3D0Z//vwwYV9h/jCIFwi2A6phVELIQ1mW8RKJ0uT6owCBL9Y56A5QLn
         YDH5AfmK6L5Mq7TS05kZf/CCRao6KFGsr3tsjcZnLio5rDSrMbJyft9p7LkO9ie+ff8c
         6UqHwudEYNalRvnJpwVOGK3mp0mAGdXZjiPeIumNFM36BbIAyTZ0D99ZccOvHlvfatZR
         psrw==
X-Gm-Message-State: AOJu0Yy7Pc08MjgU/2fMrEOhxTQCcupSZPHAOMgRv23M3Q1XCmA97k3B
	R+aFTEnxZ5kfFRU3qe2eBu+PIw==
X-Google-Smtp-Source: AGHT+IEx5WEmWgQ579yoynj2nXa4gKWSzgMCtB+gOZBDDMcDX0jRK2MxgZp5SdXx9Qil7Dmj4oiM4w==
X-Received: by 2002:a7b:c414:0:b0:40d:3bde:1327 with SMTP id k20-20020a7bc414000000b0040d3bde1327mr678332wmi.165.1703155769055;
        Thu, 21 Dec 2023 02:49:29 -0800 (PST)
Message-ID: <919b2fc9-08a6-4bec-842d-f1bba98b44c1@citrix.com>
Date: Thu, 21 Dec 2023 10:49:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] xen/arm: v{cp,sys}reg: address violations of
 MISRA C:2012 Rule 16.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <541bc4fd47d26b12ea131590bf0c49f7c92d9368.1703066935.git.federico.serafini@bugseng.com>
 <0200354e-08b9-4136-b6e9-3220a51256af@xen.org>
 <9e9e3086-6311-4a76-8624-a06d52e7ec0b@suse.com>
 <c3a128d9-dea8-4e05-b292-1a6a04fb0daf@bugseng.com>
 <alpine.DEB.2.22.394.2312201008070.685950@ubuntu-linux-20-04-desktop>
 <e5a812ab-faaf-47fd-bada-9b19e0c94bcc@citrix.com>
 <6f3e64d1-5719-4960-9f60-0497a8ccea00@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6f3e64d1-5719-4960-9f60-0497a8ccea00@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/12/2023 10:29 am, Federico Serafini wrote:
> On 20/12/23 22:23, Andrew Cooper wrote:
>> On 20/12/2023 6:24 pm, Stefano Stabellini wrote:
>>> On Wed, 20 Dec 2023, Federico Serafini wrote:
>>>> On 20/12/23 12:55, Jan Beulich wrote:
>>>>> On 20.12.2023 12:48, Julien Grall wrote:
>>>>>> On 20/12/2023 11:03, Federico Serafini wrote:
>>>>>>> --- a/xen/arch/arm/arm64/vsysreg.c
>>>>>>> +++ b/xen/arch/arm/arm64/vsysreg.c
>>>>>>> @@ -210,8 +210,8 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>>>>>             /* RO at EL0. RAZ/WI at EL1 */
>>>>>>>             if ( regs_mode_is_user(regs) )
>>>>>>>                 return handle_ro_raz(regs, regidx,
>>>>>>> hsr.sysreg.read, hsr,
>>>>>>> 0);
>>>>>>> -        else
>>>>>>> -            return handle_raz_wi(regs, regidx, hsr.sysreg.read,
>>>>>>> hsr,
>>>>>>> 1);
>>>>>>> +
>>>>>>> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read,
>>>>>>> hsr, 1);
>>>>>> I don't 100% like this change (mostly because I find if/else clearer
>>>>>> here).
>>>>> While (it doesn't matter here) my view on this is different, I'm
>>>>> still
>>>>> puzzled why the tool would complain / why a change here is necessary.
>>>>> It is not _one_ return statement, but there's still (and
>>>>> obviously) no
>>>>> way of falling through.
>>>> The tool is configurable:
>>>> if you prefer deviate these cases instead of refactoring the code
>>>> I can update the configuration.
>>>   If you say "deviation", it implies that there is a violation. I think
>>> Jan's point was that both code versions shouldn't be any different.
>>>
>>> # option-1
>>> if (a)
>>>    return f1();
>>> else
>>>    return f2();
>>>
>>> # option-2
>>> if (a)
>>>    return f1();
>>> return f2();
>>>
>>> Both options are equally guaranteed to always return. It looks like a
>>> peculiar limitation to only recognize option-2 as something that
>>> returns
>>> 100% of the times. Also option-1 returns 100% of the times. What am I
>>> missing?
>
> I don't think this is necessarily a limitation because it highlights
> cases where an if-else could be replaced with a simple if:
> some may find an if-else clearer, other may find the single if clearer.
>
> From a safety point of view both options are safe because there
> is no risk of unintentional fall through.
>
> If you all agree on the fact that small code refactoring like the ones I
> proposed are counterproductive, then I can update the tool configuration
> to consider also option-1 as safe.

I would certainly prefer if we could continue to use option 1.

~Andrew

