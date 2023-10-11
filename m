Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DB67C4C66
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 09:52:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615249.956552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqU0U-0001EN-Gl; Wed, 11 Oct 2023 07:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615249.956552; Wed, 11 Oct 2023 07:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqU0U-0001C1-Dz; Wed, 11 Oct 2023 07:51:50 +0000
Received: by outflank-mailman (input) for mailman id 615249;
 Wed, 11 Oct 2023 07:51:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH0+=FZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qqU0T-0001Bv-Bc
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 07:51:49 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 068f79c0-680b-11ee-9b0d-b553b5be7939;
 Wed, 11 Oct 2023 09:51:46 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c3ca6ff5a7so54333891fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Oct 2023 00:51:46 -0700 (PDT)
Received: from [10.157.20.243] ([103.14.252.248])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902c20d00b001b53c8659fesm13171152pll.30.2023.10.11.00.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 00:51:45 -0700 (PDT)
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
X-Inumbo-ID: 068f79c0-680b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697010706; x=1697615506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u8M59+lXWDoLSiDR4wX/k7oPGYY6EZCNI6M7ttWjpzU=;
        b=hmjTdXQ8BOAoNOcvYbbSEL04x1Si8eQNfEFJqyMbIjCvuRdUw4Yp7/TTBHbUF7tBBB
         g3xDH536lpjsqoM65kMwuAvbyt94qRJ4IbFjihqp2Wt/BmTxcnPz2apOd3AYBTDRksEP
         +tFTAGMmIglKok5/2LvqZ9zKRDdLgGwRbQe0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697010706; x=1697615506;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8M59+lXWDoLSiDR4wX/k7oPGYY6EZCNI6M7ttWjpzU=;
        b=wiuZjv5/0ZyTk+wu3RfD9TrKYOOtWbwOeCBoaiXsDthoOMJHE36RC9zWCTSl8Y/JV5
         awrUmxfEEk0bTkodRdKrjs1LSYdWJfBEcmxpe26FMwdY0Njqy4ERnapUjNjozwJzNCGL
         li5zDIQWzTdx31j4iY6mUTo5/5rFd1o9AhN3dkl3yWk589DgWWR2Ca79vgJCdGURNVmx
         K/mBfPxC9OXMhNeXGbYgPIyo/mT+k06+J3BrYyIZdsf0chSQUT/gfJv4xFqhDmNzgOMt
         jry0BtKqWuzqv0oRWE7h1CAgmOJ7OPhKBVvSQko2D+0hHYlWDgqddpnytj0zB31gQuiR
         illQ==
X-Gm-Message-State: AOJu0YwIfxGavR2+eNsiSZiaUlTFGOBxT6efojF3kHgf2d4d1auwtKIs
	KSpArkytuqZQIhhCBaIvXwbOBA==
X-Google-Smtp-Source: AGHT+IGeQhp4cH3Wr0N0ONe7MgYrIFntm8IPn/ZH/p1+jSoGNUVPJpegNqPXsNSSScFB/6RdJzNeVQ==
X-Received: by 2002:a2e:b0e9:0:b0:2bc:be3c:9080 with SMTP id h9-20020a2eb0e9000000b002bcbe3c9080mr17955579ljl.27.1697010705683;
        Wed, 11 Oct 2023 00:51:45 -0700 (PDT)
Message-ID: <26f09702-9340-41ae-afcc-808becb67876@citrix.com>
Date: Wed, 11 Oct 2023 15:51:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: MISRA C:2012 D4.11 caution on staging
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <7972c20f361126022fa97f6b51ca2d9c@bugseng.com>
 <61f04d4b-34d9-4fd1-a989-56b042b4f3d8@citrix.com>
 <baa73fa24385b39bc6e82c4ccb08bd13@bugseng.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <baa73fa24385b39bc6e82c4ccb08bd13@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/10/2023 3:47 pm, Nicola Vetrini wrote:
> On 11/10/2023 02:15, Andrew Cooper wrote:
>> On 10/10/2023 5:31 pm, Nicola Vetrini wrote:
>>> Hi,
>>>
>>> as you can see from [1], there's a MISRA C guideline, D4.11, that is
>>> supposed to be clean
>>> (i.e., have no reports), but has a caution on an argument to memcpy
>>> (the second argument might be null according to the checker, given a
>>> set of assumptions on
>>> the control flow). To access the report just click on the second link
>>> in the log, which should take you to a webpage with a list of
>>> MISRA guidelines. Click on D4.11 and you'll see the full report, which
>>> I pasted below for convenience.
>>>
>>> If the finding is genuine, then some countermeasure needs to be taken
>>> against this
>>> possible bug, otherwise it needs to be motivated why the field
>>> config->handle can't
>>> be null at that point.
>>> The finding is likely the result of an improvement made to the
>>> checker, because the first
>>> analysis I can see that spots it happened when rc1 has been tagged,
>>> but that commit does not
>>> touch the involved files.
>>>
>>> [1] https://gitlab.com/xen-project/xen/-/jobs/5251222578
>>
>> That's a false positive, but I'm not entirely surprised that the checker
>> struggled to see it.
>>
>> First,
>>
>> ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
>>
>> All system domains (domid >= 0x7ff0, inc IDLE) pass a NULL config.  All
>> other domains pass a real config.
>>
>> Next,
>>
>> /* DOMID_{XEN,IO,etc} (other than IDLE) are sufficiently constructed. */
>> if ( is_system_domain(d) && !is_idle_domain(d) )
>>     return d;
>>
>> So at this point we only have the IDLE domain and real domains.
>>
>> And finally, the complained-about construct is inside an:
>>
>> if ( !is_idle_domain(d) )
>>     ...
>>
>> hence config cannot be NULL, but only because of the way in which
>> is_{system,idle}_domain() interact.
>>
>> ~Andrew
>
> Ok. I think this should be documented as a false positive using the
> comment deviation mechanism
> in the false-positive-eclair.json file (once a name for the prefix is
> settled on in the
> other thread).
>

Yeah - I was expecting that.

This code is mid-cleanup (in my copious free time, so not for several
releases now...) but even when it is rearranged sufficiently for IDLE to
have an earlier exit, I still wouldn't expect a static analyser to be
able to recognise this as being safe.

~Andrew

