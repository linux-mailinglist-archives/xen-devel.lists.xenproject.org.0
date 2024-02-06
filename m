Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E2F84B814
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 15:38:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676972.1053351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXMaQ-00066O-Rp; Tue, 06 Feb 2024 14:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676972.1053351; Tue, 06 Feb 2024 14:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXMaQ-00063w-P3; Tue, 06 Feb 2024 14:38:10 +0000
Received: by outflank-mailman (input) for mailman id 676972;
 Tue, 06 Feb 2024 14:38:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8l/=JP=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1rXMaO-00063q-Vx
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 14:38:09 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57495528-c4fd-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 15:38:06 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33929364bdaso3498044f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 06:38:06 -0800 (PST)
Received: from [192.168.2.1] (82-64-138-184.subs.proxad.net. [82.64.138.184])
 by smtp.googlemail.com with ESMTPSA id
 e5-20020adfef05000000b0033b4a77b2c7sm600795wro.82.2024.02.06.06.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 06:38:05 -0800 (PST)
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
X-Inumbo-ID: 57495528-c4fd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20230601.gappssmtp.com; s=20230601; t=1707230286; x=1707835086; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9JjcHkICbDf4yb/GLYRyN14BpoDErXvG9PwCggk40Xg=;
        b=mLNinxHRuCyt41v0avM7h32VXLzgEHdhF5ghLdeO1Ph1Juq41SzbLw9IePLBrxN+nv
         SlsRHLk3LlE9iNYP4+zluhS5EXTgHs0TKmpjEshnS0DVM7nqJxRfpndYn76PsxlZlVyu
         ZJGN5yZQS8kWZmx2C3EE1D8LTdcYWaguhgOEbcno1ocbGVGO2tr6wIA5U6YvzB2VTfff
         c1mBQm+e2YcWTM46vGqNhRXXXWpQr/BsCx482x21FDfIKu8VsvTzgexw58fgYHaT2hjE
         nsPbfeqCcXZzazFzWBMW6dTVUku1oa4Q6tLDWySsDAtDjIhj7HqhLulfpAk1gWaXyUtb
         HiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707230286; x=1707835086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9JjcHkICbDf4yb/GLYRyN14BpoDErXvG9PwCggk40Xg=;
        b=DI44ZUhYYPTXpJ2L4VkKy0xnABjo8cr07lIOiILLn4gcB2/lRo912jOIKV/NjRGX3v
         qULuxSxiE/340DpF703R264shHjFXGG+zUsTAz27JTNkUBdhI96FeMds+vxEdzedJjBg
         NQb0ADKuhWSCN4i/rF3VgKqlWfAzPc92DZ9AeE8BTidQ/wegYu1H30otmsVvPorWFXuQ
         VyQNqbd79ZJydNOLd0pOWY3OKD1W4rWyFpcTQnDk0lMQFOp1w0bfj8rb3oy6gaDdu+sf
         thw550941A12kdyQMF5fKJBQlCp19cDSFZ6MRS8YAZm7FJKQvlLxx+Caylf02pfulre7
         i5IA==
X-Gm-Message-State: AOJu0YyNPPF30x1enIX/8y2v7nbMFMKJNVR2S+5do5f3BYllEvAFfAYQ
	aTwU004N4yAkR9cwR0MmsyBcMjA73L2dIJLq5xG0U3fYnPpNDQZ07hOkZJ3/WN6pGajIJyiDi2M
	ADVc=
X-Google-Smtp-Source: AGHT+IH8dsuGnjeAzuII9kpk2nYFeY/M61PYOV3TObHXoNvBxgt1m2KgotWgZLWf5fDl5vwRpFtbgw==
X-Received: by 2002:adf:fe46:0:b0:33a:ea2c:5b36 with SMTP id m6-20020adffe46000000b0033aea2c5b36mr1183811wrs.0.1707230286046;
        Tue, 06 Feb 2024 06:38:06 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWsH4N2j4g9SHA/eNhrOCEhXUNGAVRYJjq5UKJoWPTUzvCn41AAeBx6R6Ro1Y6W1E7V2PjojPm+LXQt
Message-ID: <1f2fab6d-6eaf-4e32-a124-cf1042c31312@rabbit.lu>
Date: Tue, 6 Feb 2024 15:38:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xentop: add option to display dom0 first
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <87846acd5b31991e38561c9765eb97730c79d0f3.1706723494.git.slack@rabbit.lu>
 <a8194dec-70f0-4f90-898d-f15152a5018b@perard>
From: zithro <slack@rabbit.lu>
In-Reply-To: <a8194dec-70f0-4f90-898d-f15152a5018b@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05 Feb 2024 18:27, Anthony PERARD wrote:
> On Wed, Jan 31, 2024 at 06:51:34PM +0100, Cyril Rébert wrote:
>> Add a command line option to xentop to be able to display dom0 first, on top of the list.
>> This is unconditional, so sorting domains with the S option will also ignore dom0.
>>
>> Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>
> 
> Hi Cyril,

Hi Anthony,

> Your patch looks like a good idea

Thanks, I also have a "display dom id column" in the pipes, almost ready 
to send, but I found kind of a bug doing this (field_id/fields offsets 
off by one).
Are there "most wanted functionnalities" concerning xentop, while I'm at 
it ? There's a TODO in xentop's folder.
Things I'd like to add, if possible, is domain management 
(pause/unpause, maybe shutdown/destroy), columns hiding and domains hiding.

> but xentop segv without '-z' now, when there are guest running.

I failed at the strict minimum here, should have tested ... Sorry for 
wasting your time !
Bug spotted ("sort_start" incorrectly initialized), will post a v2.

> Revelant part of a backtrace:
> #0  xenstat_domain_name (domain=0x121) at xenstat.c:344
> 344		return domain->name;
> #6  0x00006344dd283651 in top () at xentop.c:1209
>          i = 2
>          num_domains = 2
>          sort_start = 1
>          sort_count = <optimized out>
>          dom0_index = <optimized out>
> 1209		qsort((domains+sort_start), (num_domains-sort_count), sizeof(xenstat_domain *),
> 1210		      (int(*)(const void *, const void *))compare_domains);

What soft did you use to get that output ? A debugger ?
(It's a real question, I'm a noob).

> Also, could you update the man page? Here "docs/man/xentop.1.pod""

Will do with v2 !

> 
> Thanks,
> 

-- 
++
zithro / Cyril


