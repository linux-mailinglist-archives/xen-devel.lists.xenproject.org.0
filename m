Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE31C81B49C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 12:03:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658828.1028222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGpt-0004D8-Ft; Thu, 21 Dec 2023 11:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658828.1028222; Thu, 21 Dec 2023 11:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGpt-0004Aq-DC; Thu, 21 Dec 2023 11:03:29 +0000
Received: by outflank-mailman (input) for mailman id 658828;
 Thu, 21 Dec 2023 11:03:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yxSo=IA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rGGps-0004Ai-Jx
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 11:03:28 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90ba67b5-9ff0-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 12:03:26 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d05ebe642so10474975e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 03:03:26 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c18-20020a5d4f12000000b00336788c812fsm1770547wru.88.2023.12.21.03.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 03:03:25 -0800 (PST)
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
X-Inumbo-ID: 90ba67b5-9ff0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703156606; x=1703761406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yFcJP4WfSBefhhVEW36q8nG1l2KbuGVyh1mFyFrTVKQ=;
        b=FKghzDd17ozgYRUJsT7w2207Y6PgMO5Lodnbk8xY8w93KVEcbp+5gBNY0g6Wh2BX2q
         1xDfbzD2HwOK+tlJmD0Ob9gi/TmuxOP1JcdLnUqkgzcWWxZqQKbeCBsZrr8qOe/c9DlU
         NJ2MLQpz8c1sstrOg2H6bNZvfnpDclZH2Oj/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703156606; x=1703761406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFcJP4WfSBefhhVEW36q8nG1l2KbuGVyh1mFyFrTVKQ=;
        b=xCI2k06Qv/MiNoojBOeusruyeAsnjWaVxSVoE2NHd/ncoiCYWRPMrh2tx4PZ3uDwTT
         VkP034Om8EGb0fllCFUXGtORmpaIqgARzDUHDRQrs+MU/9TyGQ/2Io5kJsnua/K9U4GQ
         ZYFOtoyj2QokSHV10UKzxsnJ5cJ0eM8ZEoGUWf20r3JyfVEExgu3eCMGBaETH17ZTWWi
         N71alLp3adCf4LEr7BV28Iu/fEeECQHl14j2k2LC+ol3Mk38AMi3yAdCnV/d8qadoBG5
         s8taCVlDN/7l6PKsefrYKqitI25E+fWxJ+OiPfP5xCkJ/kTQyAyG5axUFGtgUyav52jD
         zpFw==
X-Gm-Message-State: AOJu0YwBf2coYcTFeVjz89aHlFhkokjh91RyUVWbXuiGelEwXVs7X7iw
	hXf3ez0G5acaDyNzlGzTdzi3GQ==
X-Google-Smtp-Source: AGHT+IGIgkiYAYsbvrCaHZprOEnIqMixI8LmPJ00yv3vLWDLFYeTb7v892DmFGoK+IZ2yc2Zg8CmVg==
X-Received: by 2002:a05:600c:1554:b0:40c:2788:2903 with SMTP id f20-20020a05600c155400b0040c27882903mr317172wmg.125.1703156606160;
        Thu, 21 Dec 2023 03:03:26 -0800 (PST)
Message-ID: <0c5bbfde-4cf0-4878-b1ee-ccc8eb775464@citrix.com>
Date: Thu, 21 Dec 2023 11:03:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC] x86/uaccess: remove __{put,get}_user_bad()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <9cf852da1c03b614bf5010132c58a18adc2a4161.1703155225.git.federico.serafini@bugseng.com>
 <a2050ac1-e205-4d7f-b9b1-aa625136e63a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a2050ac1-e205-4d7f-b9b1-aa625136e63a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/12/2023 10:58 am, Jan Beulich wrote:
> On 21.12.2023 11:53, Federico Serafini wrote:
>> Remove declarations of __put_user_bad() and __get_user_bad()
>> since they have no definition.
>> Replace their uses with a break statement to address violations of
>> MISRA C:2012 Rule 16.3 ("An unconditional `break' statement shall
>> terminate every switch-clause").
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>> Several violations of Rule 16.3 come from uses of macros
>> get_unsafe_size() and put_unsafe_size().
>> Looking at the macro definitions I found __get_user_bad() and __put_user_bad().
>> I was wondering if instead of just adding the break statement I can also remove
>> such functions which seem to not have a definition.
> No, you can't. Try introducing a caller which "accidentally" uses the
> wrong size. Without your change you'll observe the build failing (in
> a somewhat obscure way, but still), while with your change bad code
> will silently be generated.

The construct here is deliberate.  It's a build time assertion that bad
sizes aren't used.

__bitop_bad_size() and __xsm_action_mismatch_detected() are the same
pattern in other areas of code too, with the latter being more explicit
because of how it's wrapped by LINKER_BUG_ON().


It is slightly horrible, and not the most obvious construct for
newcomers.  If there's an alternative way to get a build assertion, we
could consider switching to a new pattern.

~Andrew

