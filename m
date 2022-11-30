Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF363D754
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 14:57:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449906.706944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0NZw-0005JP-U5; Wed, 30 Nov 2022 13:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449906.706944; Wed, 30 Nov 2022 13:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0NZw-0005G8-O1; Wed, 30 Nov 2022 13:56:48 +0000
Received: by outflank-mailman (input) for mailman id 449906;
 Wed, 30 Nov 2022 13:56:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NcZi=36=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1p0NZv-0005G2-4h
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 13:56:47 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc86d7fe-70b6-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 14:56:33 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 ay27-20020a05600c1e1b00b003d070f4060bso1454085wmb.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Nov 2022 05:56:44 -0800 (PST)
Received: from [192.168.23.148] (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a5d46c8000000b0023662d97130sm1673991wrs.20.2022.11.30.05.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 05:56:43 -0800 (PST)
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
X-Inumbo-ID: cc86d7fe-70b6-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JJCTMIqF448FJLyxITwgMGZvlQGJ1mGh31rovw0F9WE=;
        b=UkOYn5dkaxHV8op/sI1h8z338WQK7lhezmBhf/ENNFoPhN7Ir5TwMjUHd3PU3UqaPA
         /RX9ixfy3iwJIDrNBSKjZIL5EfVPRmt2dL2KwqQi5NAwfuZeBc5Zg5sGu2a3ioOo2KHx
         AcUcm4GjTSy6xv0p5IFsyHTPOuu3T3lg49P5KsehgKTxrbpm2m9VIEOPiL/I6oJCq8hh
         ot72Ht8mueCy9VK2r8HbE1WXlTPbISpJPMVb9z0R0MulEMrp3f23wXJ95+BHBugl6Vkd
         ImytgSI6MwvrD1/uhb/YCpQJTmwos5oB15L0Uk8NY+d2pA1qTbZdObPtTPt/2V2HZd6s
         0O9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJCTMIqF448FJLyxITwgMGZvlQGJ1mGh31rovw0F9WE=;
        b=Z60C9RweU2Zh8hn4Ant1M384G1BxF2uJhn2cG0IxuIJNPDxNY9UgQm5rQoXNpfVWc6
         41P8WuRu+N+O8Dj5/iM2c6IlxYO2hpm8wcRgy4I0Grm1vghTXWej07hOWlskk59W9+Ci
         3FNWbxB4zjzUb3s5ohbg8uE3d/4ov22Jg76iG0GavtrowddZb86dVaAeGrdYZkzlSwZJ
         Z6Z53bhLfRYwdJ5WVkNpXLTPtkwcxpiAYQ6cmL6H3pby4Kak+KmmeULfiz1xXr5I0tX+
         dV89ZX42oXa5ZhneMG0PJKjsbhGsVX/fEgiXw+4LSbxN91W9z6FeYWq2rvy5MsCwzIsE
         vLWQ==
X-Gm-Message-State: ANoB5pmm5pRdF392z1DXxyeNsgec/uZX30HMXWAeAK6tCdt293iugv/d
	zR0fGz+xLLfheFfVnM9Fvik=
X-Google-Smtp-Source: AA0mqf5RuqhW7TvmQbTm1OmbDzH2pQ04E1xdPZA6bRiGZp6y7j10d09oNV9zrk3znAgW5yQw/PaL5A==
X-Received: by 2002:a05:600c:2302:b0:3cf:a3c4:59b3 with SMTP id 2-20020a05600c230200b003cfa3c459b3mr37573664wmo.198.1669816603925;
        Wed, 30 Nov 2022 05:56:43 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b4f6191a-ddc7-86c3-83e9-7587b566dce2@xen.org>
Date: Wed, 30 Nov 2022 13:56:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ioreq_broadcast(): accept partial broadcast success
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: Per Bilse <per.bilse@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <06ad4b3a67a15192fc986b35e3f2fcd35b2f4c2f.1669383767.git.per.bilse@citrix.com>
 <d7a42f21-6dd3-108e-9278-74d756d941e6@xen.org>
 <fdc2eb93-2b8a-f3c9-82b0-5d4e90ecda9c@suse.com>
 <Y4SWTceb13wfRimb@Air-de-Roger>
 <f3d00a16-3cf3-9cad-60c3-84eb455a3323@suse.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <f3d00a16-3cf3-9cad-60c3-84eb455a3323@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/11/2022 12:26, Jan Beulich wrote:
> On 28.11.2022 12:06, Roger Pau Monné wrote:
>> On Mon, Nov 28, 2022 at 09:21:47AM +0100, Jan Beulich wrote:
>>> On 26.11.2022 23:19, Julien Grall wrote:
>>>> On 25/11/2022 14:15, Per Bilse wrote:
>>>>> This patch modifies ioreq_broadcast() to allow partial success.
>>>>
>>>> The commit message is quite vague, so it is hard to know what you are
>>>> trying to solve exactly. AFAIU, there are two reasons for
>>>> ioreq_broadcast to fails:
>>>>    1) The IOREQ server didn't register the bufioreq
>>>>    2) The IOREQ buffer page is full
>>>>
>>>> While I would agree that the error message is not necessary for 1) (the
>>>> IOREQ server doesn't care about the event), I would disagree for 2)
>>>> because it would indicate something went horribly wrong in the IOREQ
>>>> server and there is a chance your domain may misbehave afterwards.
>>>
>>> In addition I think ignoring failure (and, as said by Julien, only because
>>> of no bufioreq being registered) is (kind of implicitly) valid only for
>>> buffered requests. Hence I'm unconvinced of the need of a new boolean
>>> function parameter. Instead I think we need a new IOREQ_STATUS_... value
>>> representing the "not registered" case. And that could then be used by
>>> ioreq_broadcast() to skip incrementing of "failed".
>>
>> So introduce an IOREQ_STATUS_UNREGISTERED return code and don't
>> increase failed if buffered == true and UNREGISTERED is returned,
>> would that be acceptable?
> 
> Yes afaic, but Paul is the maintainer of this code. And of course the
> new error indicator shouldn't surprise any existing callers.
> 

A new status code does indeed seem like the cleanest way forward.

   Paul

