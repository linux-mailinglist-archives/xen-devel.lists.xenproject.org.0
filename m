Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C5F8B3754
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 14:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712769.1113599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0KoR-0005j9-Bn; Fri, 26 Apr 2024 12:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712769.1113599; Fri, 26 Apr 2024 12:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0KoR-0005gG-98; Fri, 26 Apr 2024 12:36:23 +0000
Received: by outflank-mailman (input) for mailman id 712769;
 Fri, 26 Apr 2024 12:36:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIFE=L7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s0KoP-0005fr-HD
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 12:36:21 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94b496a0-03c9-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 14:36:19 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6a073f10e8eso10708276d6.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 05:36:19 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m14-20020a0c9d0e000000b0069b748abd98sm7960422qvf.89.2024.04.26.05.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 05:36:17 -0700 (PDT)
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
X-Inumbo-ID: 94b496a0-03c9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714134978; x=1714739778; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LnUWdTSDeOqhdUnrJdKTlMT31A4OExZQ0K9d9ZxfmP4=;
        b=tTKkUsM2VD3PRg4re3BOaL1i/urXudGJNym9OYyyysmZRrd6V2yNwnEZOG+Os7Qk6E
         mYvukTTMrXkXgXcWmTKaXwsf2LppiQda1I6nSPuDVWRqUUWYmuWMaO40m9VKZSYRIwjS
         vLiwZ47Pp1lgBktX23ExFFd+3N/mR/xHto+kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714134978; x=1714739778;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnUWdTSDeOqhdUnrJdKTlMT31A4OExZQ0K9d9ZxfmP4=;
        b=P/Yvy0dZUl7l6NsFcOXZCsxIWEDEA4KzDkWam//y4JyNXcGBAYTGxRohX58R16yvnr
         BghNWJNCuBjaoKM5l6g5JupKZD1zQF2QNWvywK+IIxFVy8Ur09YKNCodfpwS7rJFJDxM
         PNpO199kYbefjhNI01Yg5Vdg1D4TPmhI4sW7wMeh2Ey6w/3uhgdEk97IuMtJ/ErAgRrZ
         UOiFyLMxdqPjvvjSsdjcPJQEbSYn7cLrYUKipU+YqeJ9UqtD3w6Wosr4UmTv488f+mIE
         6bFxVDIbzqi7++eTjgzOfl2uLScS/QB/FX3F+xbb02lPrtpsZf7e8runfis6/M9sr+Ni
         skAA==
X-Forwarded-Encrypted: i=1; AJvYcCX6U7lkKf5r2r4N2G990/ibvk8W3MoKJcbAOt3Js6wX8J6NfjZI47hmIJFFePBAxHA7iKAdcrbCyfyMbMeTqU6jRT6A8sDIegS+RWXQH+Q=
X-Gm-Message-State: AOJu0YwFBPPSkL5m6rhjcyDKTlB69AqwaOWthxDFfSgG02eRzNKIx/QL
	uOH5yTsPqXWCerR2SE3PZXPdg+16sLibL3p8Ns23KZU1IOPne6lBRugLQl2iQYk=
X-Google-Smtp-Source: AGHT+IE52NRMJ/mui1CMQ5vMw0QgddS5KRYNw4dsq9ZIsPEq3H/tVPfxvBhpjlwoz6Pv9KahQfEPPA==
X-Received: by 2002:a05:6214:1312:b0:69b:7af:62e2 with SMTP id pn18-20020a056214131200b0069b07af62e2mr3459929qvb.36.1714134978111;
        Fri, 26 Apr 2024 05:36:18 -0700 (PDT)
Message-ID: <1526fe0f-e937-46be-95f8-61fdc991ff5b@citrix.com>
Date: Fri, 26 Apr 2024 13:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] gzip: move bitbuffer into gunzip state
To: Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240424163422.23276-1-dpsmith@apertussolutions.com>
 <20240424163422.23276-8-dpsmith@apertussolutions.com>
 <06b325c3-04a4-4294-85e1-a6d05019e3f0@citrix.com>
 <42614bdf-0aaa-4bbe-aa0f-f9d54c1e10d1@suse.com>
 <a0404716-7611-4b2f-9fd1-c16b109067b5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a0404716-7611-4b2f-9fd1-c16b109067b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/04/2024 6:57 am, Jan Beulich wrote:
> On 26.04.2024 07:55, Jan Beulich wrote:
>> On 25.04.2024 21:23, Andrew Cooper wrote:
>>> On 24/04/2024 5:34 pm, Daniel P. Smith wrote:
>>>> --- a/xen/common/gzip/inflate.c
>>>> +++ b/xen/common/gzip/inflate.c
>>>> @@ -1017,8 +1014,8 @@ static int __init inflate(struct gunzip_state *s)
>>>>      /* Undo too much lookahead. The next read will be byte aligned so we
>>>>       * can discard unused bits in the last meaningful byte.
>>>>       */
>>>> -    while (bk >= 8) {
>>>> -        bk -= 8;
>>>> +    while (s->bk >= 8) {
>>>> +        s->bk -= 8;
>>>>          s->inptr--;
>>>>      }
>>> Isn't it just me, but isn't this just:
>>>
>>>     s->inptr -= (s->bk >> 3);
>>>     s->bk &= 7;
>>>
>>> ?
>> I'd say yes, if only there wasn't the comment talking of just a single byte,
>> and even there supposedly some of the bits.

The comments in this file leave a lot to be desired...

I'm reasonably confident they were not adjusted when a piece of
userspace code was imported into Linux.

This cannot ever have been just a byte's worth of bits, seeing as the
bit count is from 8 or more.  Right now it's an unsigned long's worth of
bits.
> Talking of the comment: Considering what patch 1 supposedly does, how come
> that isn't Xen-style (yet)?

I had been collecting some minor fixes like this to fold into patch 1
when I committed the whole series.

I'll see if I can fold them elsewhere.

~Andrew

