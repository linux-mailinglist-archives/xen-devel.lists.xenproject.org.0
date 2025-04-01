Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1D5A77BFB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934305.1336049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbZa-0004ft-CZ; Tue, 01 Apr 2025 13:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934305.1336049; Tue, 01 Apr 2025 13:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbZa-0004dj-9r; Tue, 01 Apr 2025 13:22:34 +0000
Received: by outflank-mailman (input) for mailman id 934305;
 Tue, 01 Apr 2025 13:22:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KZod=WT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzbZY-0004c8-Gs
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:22:32 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dca5cfb-0efc-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 15:22:31 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso57742125e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:22:31 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314bbf1sm197189955e9.38.2025.04.01.06.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 06:22:30 -0700 (PDT)
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
X-Inumbo-ID: 5dca5cfb-0efc-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743513751; x=1744118551; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5WUzqrA+LcYY/Vhg5mLvvAklr4Mj/wh4x1uWNh/e3+0=;
        b=XYqjn7cvTb9SkKxb9eoiY5JXMAPOlStQtkqLeQdFwdFxWvJPfGgyqbkJEvXpSt5RX5
         ZtxtsB5s4kSVsUIvTLU7RzTpXd1JSQzwZ+arJp75suC1unGutyJAvldvHqANoFP0Zz28
         6tievJ0BgRHWUfxkVGu7Lf+ni4VnCtm/XboAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743513751; x=1744118551;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WUzqrA+LcYY/Vhg5mLvvAklr4Mj/wh4x1uWNh/e3+0=;
        b=MrBSWRqtvVxlr/W47nwseCnubnFv9rhqjQ72ublCScAVDaZ17BW7mrlsMHnbM5xNag
         Hoz3ZsXLiKqPn8k3U/y9scth0PULwT8R8sACvmAQ46pIhrj08qTo3VsaMAQNiVP4yOhu
         a0tb0xr9HMeSEEp1dNWP+Ro6IaVmD9BvKjisVr7OHX9h/zEkgexPSRXUTnVez2gwouwJ
         MfQMz6pnqcCSLJOHRT6bACDtCJvz1Ux3nHY6TpdrT3h/7DAvKIFJN1JI4aSkA4kGiEjE
         n6QVZJz9MGQbDoqpeHuSfB/NWTnJiTpcyYk8kLuq8PvPc6A3sBFnm4K63B7c4ZrtGwPr
         Q/QA==
X-Gm-Message-State: AOJu0YyeCES0/DQV9PqJztpOCeEifjT/duEDvOUY66O280ZLw78hBHK6
	MJKE20BaBH+je64bfKUx/3jTRztZVrhjLs9FEgbndsBOx4WWO6welSJPBc3cM0k=
X-Gm-Gg: ASbGncunGe1xK/H272yySILCnd7GtBUAiwwtPOFo1BsoUxH9pw4YKIhqfF9NW0qKjx1
	JGGR0moMGlDasQAILz+s444cNFyvD56qcDZi3qytNRd33c8ePvnE7osWYFyTbgFoL1dPrw6F5Sb
	ecHpkGkD/GVMlFN32Zs/krIl45gKtQpM4oi17heqEu+c5XCGs/PCunx/IO40nzxMzCpfUYUj/jk
	V/qya2o01bjag7xr4QFE2yKc4toe4mgJbErUYXiX4q94bwtyjXAOjyS0+K74HX/E6NxqDuqLzL0
	qKYYXftXpgVIM3Ls5Hj1TKO6Q23zTut7gkPwmqqvTBPX17N73eCghWO5uEwUyPmYacumPGJK+hq
	Rs415lJYeXA==
X-Google-Smtp-Source: AGHT+IF86HXuYi3czdDjUN/JDOlUKJoh/oHoEL3ugpvZufZw/xiyqmIdqvfq5hyNSww9wovFBU6Nkw==
X-Received: by 2002:a05:600c:5489:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-43dbc419540mr126131855e9.31.1743513751266;
        Tue, 01 Apr 2025 06:22:31 -0700 (PDT)
Message-ID: <fc21a6e6-90d2-4f1a-8032-516d6a371d8e@citrix.com>
Date: Tue, 1 Apr 2025 14:22:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] x86/efi: discard .text.header for PE binary
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-7-roger.pau@citrix.com>
 <9fb343fe-8bbf-4af9-a204-46eef4bd2aac@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9fb343fe-8bbf-4af9-a204-46eef4bd2aac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/04/2025 2:18 pm, Jan Beulich wrote:
> On 01.04.2025 15:08, Roger Pau Monne wrote:
>> The multiboot headers are not consumed in the PE binary, hence discard them
>> in the linker script when doing a PE build.
>>
>> That removes some relocations that otherwise appear due to the usage of the
>> start and __efi64_mb2_start symbols in the multiboot2 header.
>>
>> No functional change intended.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
>> ---
>> We could also place the multiboot header in it's own isolated section and
>> skip such section for relocations generation in mkreloc, but it seems best
>> to just remove the code if it's unused.
> I agree. I'd like to mention that I recall people intending to try to make
> xen.efi usable with an MB loader. Nothing ever came of that, so if anyone
> still wanted to pursue that route, they'd need to undo / redo what you're
> doing here.

It was Frediano, and for this same task (Host UEFI SecureBoot).

~Andrew

