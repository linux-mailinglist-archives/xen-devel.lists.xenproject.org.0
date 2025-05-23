Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83520AC22F8
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 14:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995708.1377957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIRpy-00088Z-Lv; Fri, 23 May 2025 12:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995708.1377957; Fri, 23 May 2025 12:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIRpy-000877-JC; Fri, 23 May 2025 12:49:22 +0000
Received: by outflank-mailman (input) for mailman id 995708;
 Fri, 23 May 2025 12:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ep+V=YH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uIRpy-000871-33
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 12:49:22 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58da08f2-37d4-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 14:49:21 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso17086941a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 05:49:21 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ac33757sm11894907a12.59.2025.05.23.05.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 05:49:20 -0700 (PDT)
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
X-Inumbo-ID: 58da08f2-37d4-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748004561; x=1748609361; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9CVl9Kxzo6lE9JOiVku/hr4UIbWy7NMEmzAFYkSpUlE=;
        b=RBBinJxg3n+2uPxNikgM5YePQndgaFs1bcbZu4iQ051lqSO6EuxRjy3FOg3eG5bzjC
         bBZ+/kJlcPOF+WN0Y4cxw2kawui5v//h1crS7MhgV+HrJ61G6GlbmlxDRleqyEi7ytJ7
         GZsr4vS6iiqioUsKMhRmNkfJnRej9ppnflTqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748004561; x=1748609361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CVl9Kxzo6lE9JOiVku/hr4UIbWy7NMEmzAFYkSpUlE=;
        b=f0Ug5OI7Wlg4++ZWZ458me2peK512U9SLkBg2wiPliLH1LC1aaNVNhQg4h8xoVshjX
         Y1EMxzAYFquEMPZh18etn0PYnFyXD74h8MpVEn8ujgV9/4K0auJIymcEn2sJF74tzAOw
         LPlG7yZOkkg1KDmKt3Vds8+gbaEyjyvWsHUDzOmzsyEso46i6D4P6kBtxTO6CJd5sngU
         SW0Fw3buzRbf50w2q9rOZcbObrQlqZNGCCMV8z/xGFY12AnZRFP+fFQxqE4cfBT6A7M8
         0KLpA5c89CfxshWRGDDd8JyGuirOyiR/nzEgcIKDuoLUN88tdooh//rsJyNhvWNYWT6p
         P6RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBWrrSWYxgPo5ljK21mxhVUGY++6Z70lZWO6haeYlotrUkGPrJT6SgXeP/Tb+HgOH7Ho307kHtsWU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtrSHoJ5uJJt78ugQ1HPbB8O5Vplp7VqHDuCnsMY7IOjCPVWbf
	vVqP/Sc9pNjU6tMGUHxg6ypbqadYT3oICkxWxIyuuKLhDOtzXUapcmSO2Fwi2MLePPU=
X-Gm-Gg: ASbGnctroFW2pG+Y4A+qM0g0PaChhG1itSpOMvFdPi4yiXbyCoYtCJohMMXrIrn57v0
	Lt1JQI69l1QUL4wi7gMCWUN2tQd+cfXYzG5g00bnIsSe3xJHU7BsNOFwgiyrG9IB4BvpwkYYuHd
	S3FLK+I4u5+T+79Y9yxrdYKRgaQfOoIPKBzw9PXylRSrmtHrF1/7bluBwDMcScu8JWzdtJw2yXL
	nDT6IJJIG3nrqL6/6oYw7BMRNAU47DE45gkEUarE4rcXoXkP7yA2QNb0tJwx0fgAhsQ0XBDEETj
	4liSrBga1q8uYLVIpIbNywXoLKwqs1s1B6YdShNb0tzOoJumRVOOIHBhOeyg1coknQ9B9XEiHam
	y0qWKlF2Hh3yLZEP6
X-Google-Smtp-Source: AGHT+IEgGVF0a8o4FOy7JKbGAyKw98PJDdVmQ8wzS+s2fGxMRsg+DEcPFW5xTuKWyOM0MUfTYxl+lA==
X-Received: by 2002:a05:6402:5252:b0:5fa:82a4:4879 with SMTP id 4fb4d7f45d1cf-601140b5286mr25794126a12.16.1748004560706;
        Fri, 23 May 2025 05:49:20 -0700 (PDT)
Message-ID: <dc7e9b9c-0225-4ba2-9d37-2c8fdd9de395@citrix.com>
Date: Fri, 23 May 2025 13:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] x86/traps: split code to dump execution state to a
 separate helper
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250523082135.18088-1-roger.pau@citrix.com>
 <20250523082135.18088-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250523082135.18088-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2025 9:21 am, Roger Pau Monne wrote:
> Split the code that triggers remote CPUs to dump stacks into a separate
> function.  Also introduce a parameter that can be set by the caller of the
> newly introduced function to force CPUs to dump the full stack, rather than
> just dumping the current function name.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

