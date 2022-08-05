Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D82FA58AB3D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 15:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381219.615811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJx1c-0003GJ-0q; Fri, 05 Aug 2022 13:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381219.615811; Fri, 05 Aug 2022 13:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJx1b-0003DM-U3; Fri, 05 Aug 2022 13:05:59 +0000
Received: by outflank-mailman (input) for mailman id 381219;
 Fri, 05 Aug 2022 13:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvBN=YJ=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oJx1a-0003D0-MG
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 13:05:58 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 584833d9-14bf-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 15:05:57 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 186-20020a1c02c3000000b003a34ac64bdfso1685196wmc.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Aug 2022 06:05:57 -0700 (PDT)
Received: from ?IPV6:2a02:587:ac1d:6c00:cdd9:ab5d:6d5c:1538?
 ([2a02:587:ac1d:6c00:cdd9:ab5d:6d5c:1538])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d5290000000b0021e6c52c921sm4767354wrv.54.2022.08.05.06.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 06:05:56 -0700 (PDT)
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
X-Inumbo-ID: 584833d9-14bf-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SUSC5Af7lUsDUGvqC38W6woZTdDtRfk0cwc3lsb+0PI=;
        b=d+MS3cKkHjdmIohnsKJoG8wKyP0gFedyOYqeX2qaHEC3Oj7ySOJKB9rfZ36EAvXa8J
         vnlqc7sEsjvextezWLZGdIcrgIZrTcXUwPJA5l0cUcTzNBOPG15VNu33hU2DTwH8lZ/l
         ZUDc5Nx/bk73LQajtdoi685imgz5Gm2aC6VQ8hHqfAWP5y/dwoeNADZ6ome26xhXP/Uk
         7U9Dx4qUck8Iu2WAtyurRez0OcjJz6HkoA4o9C1wBGP/IZBYGWu5GvukLdsOVqDIQP9U
         ofznPla+/kcMx7D+X5o735wx0BJkyK6psGcHEhiB4EieI+Z6vh7N/KgQt+bLlAp0nGJv
         FSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SUSC5Af7lUsDUGvqC38W6woZTdDtRfk0cwc3lsb+0PI=;
        b=AaU7beYLglCkQvAzQ5rhbB9Fc0Xf1TVw3KEnDVlsk0vR54kLjDJrXQfT7FOIgRUb4T
         CunDgdXTkvySBZFyuyVyshOaaSjSQ/bHky6GyCwkoAUPvXXjFjfMdQG6aNOvArRfLBD6
         cehG7YHWm4qXSvWVdFVp+QnabS/V+w8l9YwW95PoDVEtALipLrmXX2a0cBI4pZM7T+Ym
         M1cmKrrK1OD0qdO76Oej/Xt1MOKqp8qi1C10a84dGg9N3iWmFdPHSTiakVZhT7ixJhPY
         ESQeHZXhVnZuvHaDsJ7GY9rDRHiX/q7eXkd8eOhwvhHNdmXrmQHbRu8iu3Nt7E5lYm1w
         wBLA==
X-Gm-Message-State: ACgBeo3Dq+11auunNgSTtM6Ui7tknm8aXAZL4mXudLiBp20VgKqy7CJ9
	dwBRbpVtPMHzxywG7k3ns7M=
X-Google-Smtp-Source: AA6agR68pRRoq1tsZsSs6Ca2qUS/k+R0WuCTSAbwzzDtGJ34alJKxq4+NfqLersFZSCU44maJij4yw==
X-Received: by 2002:a05:600c:1e0f:b0:3a3:191c:a3c8 with SMTP id ay15-20020a05600c1e0f00b003a3191ca3c8mr4863032wmb.151.1659704756874;
        Fri, 05 Aug 2022 06:05:56 -0700 (PDT)
Message-ID: <4749e664-0052-a6d1-c4a1-42cebc17e610@gmail.com>
Date: Fri, 5 Aug 2022 16:05:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/3] xen/cpu: Minor coding style fixes
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220805124442.1857692-1-burzalodowa@gmail.com>
 <67c9bf09-7639-bbb2-6942-9fce583bf700@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <67c9bf09-7639-bbb2-6942-9fce583bf700@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 8/5/22 15:50, Jan Beulich wrote:
> On 05.08.2022 14:44, Xenia Ragiadakou wrote:
>> Xenia Ragiadakou (3):
>>    xen/cpu: Fix MISRA C 2012 Rule 20.7 violation
>>    xen/cpu: Add missing white space around arithmetic operators
>>    xen/cpu: Undefine MASK_DECLARE_ macros after their usage
>>
>>   xen/common/cpu.c | 15 ++++++++++-----
>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> However,
> - I don't see why patches 1 and 2 needed splitting, when patch 1 already
>    touches all those lines. It is the usual thing for us to make cosmetic
>    adjustments when touching a line anyway.

In my opinion, the initial patch that added the code should not have 
been accepted in first place without the white spaces around '+'.
But maybe coding style rules came later.
Nevertheless, I continue to consider it unfair to rely on and request 
from new unrelated patches to fix those issues.

> - Patch 3, while fine to be separate, wants a Requested-by: or
>    Suggested-by: me (which I guess can be taken care of while committing).
> 
> Jan

-- 
Xenia

