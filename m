Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 228A98A52F2
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 16:19:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706300.1103399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwNB7-0002qm-Df; Mon, 15 Apr 2024 14:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706300.1103399; Mon, 15 Apr 2024 14:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwNB7-0002oJ-AG; Mon, 15 Apr 2024 14:19:25 +0000
Received: by outflank-mailman (input) for mailman id 706300;
 Mon, 15 Apr 2024 14:19:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQk4=LU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rwNB5-0002no-T9
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 14:19:23 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27c55d02-fb33-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 16:19:23 +0200 (CEST)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-69b4454e2f1so9686856d6.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 07:19:23 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j7-20020a0ceb07000000b00690cd39da04sm6255782qvp.32.2024.04.15.07.19.20
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 07:19:21 -0700 (PDT)
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
X-Inumbo-ID: 27c55d02-fb33-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713190761; x=1713795561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WdkHLGw1jj6gIdxdQaXcwMEhOG1JJyVu1c4koxn1bM8=;
        b=bSBCiis+0pW4JOUrOG0foUHM0SNRs3ilWmxWNrYy/D5eQjPV1d2yzwPD/qUgKz4ZpW
         3oksxqLK3nbyMhegaRF/3pSxdn22hGEXN8ftoBz6r2Rl+coEYQrWGk58Ip20a8yV08Gh
         eNgzgAtLmwojhn7zsF0+Ky4epn8rpaFmn220s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713190761; x=1713795561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdkHLGw1jj6gIdxdQaXcwMEhOG1JJyVu1c4koxn1bM8=;
        b=BB8MVdPvmAMDGqr4quCGg1KgJq4QI5Y9h1tPeXgukoaDxtin7t9EpAZ+hl80lTmH7D
         FJEnirB4N9jE9y4i1MwSes0d1AJOAQBw6hMCbYWuO8DpcpKh4tTAnUPAJiztzGRUkrQW
         oQTU0+xxOs3jCoj6/BmZUeTJ67LvSZsKn2/POVXHtIo5V/ibIYqIdo9NmcPw3hAoi8TJ
         zLbM0uW9pectJBUY5FN8K4PPMgD4rVJes+4sx9kRIE7LCvWO15oP504tX4uUn2ff//kh
         hfnyDNRt/pLreeX0+fiOR4cSIZ5PeU8eACvvNHO1hiP3T1e5qJ10HVgh8jdKj7l639Fk
         tFJw==
X-Gm-Message-State: AOJu0Yx4MGyNi9QpLMzI69jI6TIVtzLwnJHyn8xINbHxctUusdwjyXNA
	+X8TBBqsr12iKNrz6ZaQUwNeJHMjd4XIkVAHTrzdPdCjVj85DV63zNDk7rkWgrUYr7uY7DeHQe4
	vLv0=
X-Google-Smtp-Source: AGHT+IGUHrLDM5YkODh3x+wEZZCFPUmiyTcjNQwgqpI9W/TTjyAoBlZRk1tDselry2XIPI2PoED9Eg==
X-Received: by 2002:ad4:5802:0:b0:69b:f88:9567 with SMTP id dd2-20020ad45802000000b0069b0f889567mr9437045qvb.1.1713190761498;
        Mon, 15 Apr 2024 07:19:21 -0700 (PDT)
Message-ID: <99a97dcf-af7a-4af4-98a4-1c1d2c91351b@citrix.com>
Date: Mon, 15 Apr 2024 15:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Rewritten XSA status page, xsa.json
To: xen-devel@lists.xenproject.org
References: <CA+zSX=a_-_QpwbE2_aG6jFFozaCAAZd_PQ-iOfaFygyxmd=cJQ@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CA+zSX=a_-_QpwbE2_aG6jFFozaCAAZd_PQ-iOfaFygyxmd=cJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/04/2024 3:14 pm, George Dunlap wrote:
> Hey all,
>
> Some of you may have noticed that xenbis.xenproject.org/xsa/ doesn't
> currently list XSA-456.  This has prompted me to rewrite the perl code
> which generates that area of the webpage into golang, which is much
> easier for the current security team to understand and modify.  The
> draft replacement is here:
>
> https://xenbits.xenproject.org/people/gdunlap/xsa-draft/
>
> In particular, if you use `xsa.json` for any purpose, let me know if
> you have any issues.  If I don't hear any objections I'll replace the
> website generation code on Wednesday.

As I said on Friday, LGTM.

I'm tempted to say put it live now, announce it on Matrix and ask for
people to point out issues that they find.

Or post your draft link and ask people to look at that?  It's the
downstreams who are more likely to notice problems...


But a tangent while we're here.  How difficult would it be to get some
basic info about XSAs 1-25 on this page?

We have the primary advisory-*.txt's in xsa.git at least, and going to
the wiki isn't great.

~Andrew

