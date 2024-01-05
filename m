Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA2B825B27
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 20:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662354.1032447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLq16-0007kS-Qk; Fri, 05 Jan 2024 19:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662354.1032447; Fri, 05 Jan 2024 19:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLq16-0007i8-O8; Fri, 05 Jan 2024 19:38:04 +0000
Received: by outflank-mailman (input) for mailman id 662354;
 Fri, 05 Jan 2024 19:38:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EEqs=IP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rLq16-0007i2-7e
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 19:38:04 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eff975dd-ac01-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 20:38:01 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-336990fb8fbso1365952f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2024 11:38:01 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k4-20020a5d6284000000b00336c43b366fsm1942382wru.12.2024.01.05.11.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 11:38:00 -0800 (PST)
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
X-Inumbo-ID: eff975dd-ac01-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704483481; x=1705088281; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqdgfNCdld1H6TGYnTtWN5scasQkJ+Tlke64vk+CQzE=;
        b=fOMxvvEoN9LR/ZB5hUwDKDmu5/Vi4GLNeLKDfLtR5j2bzveoHUJbEyV1GH40+iNen9
         jl/nC27/2oL9/1/HIjpeiSOP4tRYMYu4+cRXM7mIqimbjVlJfsR+wNx/wQy8d7sWsMN2
         zNHlHC8HW97ZPngcqgS07laHdWBrIrvHQLgl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704483481; x=1705088281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqdgfNCdld1H6TGYnTtWN5scasQkJ+Tlke64vk+CQzE=;
        b=Ixp85YC7bMvuBenvnA94UbLK8U8cuK+B5Lqgf685d1lDjRhOf52O2rUZ4q/O5u0lft
         VTSi3zSyArEvmFAj45/1Elp4/Lp61/73pYn5sjarjUrPCDxM7P4mIib8I1btNIa9x5pj
         EHtLSZEAl4Wkhm0zb+/dFu0Nw6459UjR2cNP4eIgYG6dR1BJOERFw05cTeBIehy8ez0G
         eLQ7nGGXvCEjy1O/TC9Snu7fGlHozKf7CPqjljddL2tx5q9hn8GmZngE2xjb8NVttYZv
         mebo/xGly40tFvJ9UHnrV9PoE2jmdpLlrJQIh/IBwk7dQHdaZNegH8iF67kS5Z6otDUl
         GiJg==
X-Gm-Message-State: AOJu0Ywh539fOtjOL60np82kNsqeL5QcpMCQ9bBzWSrk0+4gjr6CVcgg
	ouRTjkyPz2aDUb3qeaq9FHxq66Ky4TDWVQ==
X-Google-Smtp-Source: AGHT+IFKTWNkvdDVXgSELdy/5jp9h4WKAIYTf2LVe/W4defr6PzjuxUodMM2HG55BteuFObG/Gu23A==
X-Received: by 2002:adf:c783:0:b0:336:6479:3b0a with SMTP id l3-20020adfc783000000b0033664793b0amr1858354wrg.122.1704483481187;
        Fri, 05 Jan 2024 11:38:01 -0800 (PST)
Message-ID: <64bc70ce-e9e8-482b-9cdc-61465d2e09b5@citrix.com>
Date: Fri, 5 Jan 2024 19:38:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mwait-idle: fix ubsan warning
Content-Language: en-GB
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <f0ac3890b5e2e1e98bfd3fe5fffcf3c3c031e12c.1704388276.git.tamas.lengyel@intel.com>
 <ba53053f-a2c6-4e4f-a805-4d60970bae39@suse.com>
 <CABfawhmovqKjTSRbjgSqhY7kDhANyHrXFHYyPTGhsrnT1cdtBQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CABfawhmovqKjTSRbjgSqhY7kDhANyHrXFHYyPTGhsrnT1cdtBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/01/2024 4:09 pm, Tamas K Lengyel wrote:
> On Fri, Jan 5, 2024 at 2:34 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 04.01.2024 18:13, Tamas K Lengyel wrote:
>>> Fix warning:
>>> (XEN) UBSAN: Undefined behaviour in arch/x86/cpu/mwait-idle.c:1300:44
>>> (XEN) left shift of 15 by 28 places cannot be represented in type 'int'
>>>
>>> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>>> Fixes: 5a211704e88 ("mwait-idle: prevent SKL-H boot failure when C8+C9+C10 enabled")
>> No matter that I appreciate the change, I think this wants fixing by a
>> patch to the (Linux) original, which we'd then import (like we do for
>> other changes, including the one referenced by the Fixes: tag).
> Feel free to submit it to other projects if the same issue applies to
> them. I only ran into this with Xen and can only test it with Xen.

Linux is affected by this, but a fix to Linux won't apply to Xen because
Xen already diverged from Linux in this function.

~Andrew

