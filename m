Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F978AE6B85
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 17:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023910.1399972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5nv-0007Q7-Au; Tue, 24 Jun 2025 15:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023910.1399972; Tue, 24 Jun 2025 15:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5nv-0007NI-6g; Tue, 24 Jun 2025 15:43:23 +0000
Received: by outflank-mailman (input) for mailman id 1023910;
 Tue, 24 Jun 2025 15:43:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VtPk=ZH=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1uU5nt-0007NC-LY
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 15:43:21 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4624384-5111-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 17:43:20 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so37285525e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 08:43:20 -0700 (PDT)
Received: from [192.168.0.18]
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535e98b48asm180983835e9.16.2025.06.24.08.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 08:43:19 -0700 (PDT)
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
X-Inumbo-ID: f4624384-5111-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750779800; x=1751384600; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEHY+qVq0r9ZpEE3sKqySuCMi7v4bHNZzkUN4mDy9dY=;
        b=BLpJj+Uw37Sg4iKwuY++PuzbqN6LispUihDEl8RpNJXYG7mKAu+7/6DLrNCkDYFcTb
         G3eL0eSzM7XgGHaVOVy1Gt7YzSAiXZfg6w6fSXJhqxApS9jkBx3BeszNkirNcAR8GJRR
         LVokNiPIu0kSqK3n0OIEC2OsZO5R4TVifITXTYtBdjL2N+hb7Xc40rc+bfd2oYN02i1W
         sF2nOz8eH5nz86dp7+isHi1789aQV5B+nauGfKfbE5xBJdwEsZpij1UMrACmRO2/nelE
         xqoQVGtMnQ450Xow46WKa9y9qYzLbO97kpZ/m7OUn9Y9EQ42xtTkQ3pGydaVvaUj58F+
         0DtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750779800; x=1751384600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEHY+qVq0r9ZpEE3sKqySuCMi7v4bHNZzkUN4mDy9dY=;
        b=eR5a6p47OuBe/6n/W8fhMEWLSO6ZzjNd+lO8eqTgMrTeT0ljQMCh1y+2HMmsh+39ZU
         Rka617o7kGisKiJHuvyS1mDqFk+lwjpuBs+NOZvcUXZs4XK6lkrYz+2jH7WbSfjxcUCu
         enuEyybPKkbMmPs5mngqjE34FBX3JAUQCZHTwM6o01RSwA5o727tHWVs/gOHL4BZZZky
         zxS4mKsjN08H2ZCqjsJwKr/NU+72HodijUXnCEpxxwFC9f1PTnZWHJ7bedo5mhcjbqGF
         awY7CImIkdyP/BpCnb6yy7g5tTe0kHQo4rpQEURHTyFTVZTTAyPGCG/xGUqOClYXHZR+
         kdzA==
X-Forwarded-Encrypted: i=1; AJvYcCWXO1SLDUMv6Yfw/wPnYTfTWuSlGCo257fBhj13fjfThWD5cmEVcky0Y0IMEmehZStlKt+VTDLGzIo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCpNGAM/U8Fmj+9+k4RV/58QRjtaAoKkaWFdg2OO64GQ1K3Q8Z
	wSGsB3bpV5qvXTCRh31xiap9iCl9DBccYu7PfMM9l3ZbZaPIjLaWYUrH
X-Gm-Gg: ASbGncstyVjHjYLK2elV8gZ6ByyMQF7uFuNJyixu+I9zsb4Mt4RS67l8spl55G7W/Cv
	4k5npC3y9r5sipn3uvQlTEaPs6rJKBUG5PNv8ztSm6vCrPvS6pJ8GKkDLaFq9a6fORtz0Xll0yD
	fLolud1UiGdR/lP4FKSAv6L3OoQdXlNrhI0HHLdvcDCxLL/svRiPfJvysj0jZ4TKEe4PjH8hZBM
	+2lFBiBdG+7kxaw0VZiUd3hRPLEhw3LrBXwrDqjS5y0OBpu+UcSryFuFmUqpwrn1SfIXbAmBafy
	Kr7rkIAUwzcxKh+afExR9gZIXLRYJ+fKgHckPBWwDUAO3P5kYBt+4xN50cKnyrghiKL1c6k7Iiz
	xTx3X7SypKfAbIINCk1wY86QBwIlF9WnXjI1JXW38Y+7zHQF8KzTp
X-Google-Smtp-Source: AGHT+IG9gdcQt2YO1VB1xulXhkOVGAB5MZr3qOdYF4vJ0x8icTsa6zjgYlQrSW3eDS8JrV37HWWklw==
X-Received: by 2002:a05:600c:8b06:b0:453:6c45:ce14 with SMTP id 5b1f17b1804b1-4537ba0c671mr35361615e9.4.1750779799859;
        Tue, 24 Jun 2025 08:43:19 -0700 (PDT)
Message-ID: <0b43d8e0-7ba6-43e4-9b0a-58c45d222c4a@gmail.com>
Date: Tue, 24 Jun 2025 16:43:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xenstore - Suggestion of batching watch events
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 ngoc-tu.dinh@vates.tech, Christian Lindig <christian.lindig@citrix.com>
References: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com>
 <aad590a6-fd57-4c8b-bc64-93b7f12a9352@suse.com>
Content-Language: en-US
From: Andriy Sultanov <sultanovandriy@gmail.com>
In-Reply-To: <aad590a6-fd57-4c8b-bc64-93b7f12a9352@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/24/25 4:06 PM, Jürgen Groß wrote:

> The main reason for the large number of watch events after a 
> transaction is
> the fact that the watch for e.g. detecting the addition of a new block 
> device
> will be set on a node being common for all potential block devices 
> handled
> by the watcher. This results in a watch event for each single node 
> modified
> below this node, which are usually quite a lot even when only adding a 
> single
> device.
>
> The solution for this problem is NOT to batch all the events and to 
> ignore the
> majority of those events, but to avoid creating most of those events.
>
> For this reason the Xenstore protocol has been extended to allow for 
> limiting
> the number of node levels below a watched node to be relevant for a 
> watch to
> fire.
>
> What is missing so far are Xenstore implementations to support this 
> feature,
> and Xenstore users to make use of it. I'm working on supporting this in
> C xenstored, but due to other urgent work this will probably land 
> upstream only
> in the Xen 4.22 time frame, probably together with Xen tools (libxl) 
> making use
> of this feature.
>
>
> Juergen

I was not aware that watch has had a (relatively) new unimplemented 
parameter
added, thanks! I've noted this on the oxenstored side.
(https://github.com/xapi-project/oxenstored/issues/15)

But I think this only covers part of the problem. Looking at the 
concrete case of
xenopsd and Windows VMs, xenopsd cares about most of the nodes it receives
watch events from, the issue is that it doesn't know when these are grouped
together in one way or another.


