Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D341A5FCF2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 18:03:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913160.1319276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslyA-0005Jk-8k; Thu, 13 Mar 2025 17:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913160.1319276; Thu, 13 Mar 2025 17:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslyA-0005HL-5q; Thu, 13 Mar 2025 17:03:42 +0000
Received: by outflank-mailman (input) for mailman id 913160;
 Thu, 13 Mar 2025 17:03:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsly8-0005Fn-9l
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 17:03:40 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c097738-002d-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 18:03:39 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso8572185e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 10:03:39 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7ebaf8sm2755349f8f.95.2025.03.13.10.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 10:03:37 -0700 (PDT)
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
X-Inumbo-ID: 1c097738-002d-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741885419; x=1742490219; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bfuxV/u6N20N+6ANnU3/8x0LT949DccMM9FieZY9mB8=;
        b=URQb45k5doFf9MB2/esM/hLCMQuUv6EKH6q1r/s5dCpRLfPUPpGCOJu4yTvlE1SN+B
         PFzIgazLjag3v4K5nSwnauS52ZmuN07IRElgTF4U93y2NjYAgllxWn185USZt//IlRT+
         nwtyzVz3/AcKDnIGEW8fcDaIBChji1ih1TstM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741885419; x=1742490219;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfuxV/u6N20N+6ANnU3/8x0LT949DccMM9FieZY9mB8=;
        b=xEWX0+FOBfa/5Yg4Zc4BxJq7TdwEaQu8OHtC5X2hxhxRmjfBwSQ21CWCW099oDt5cF
         BPcW2aFgnmub2ruEGl00FU6L/LnXmxAYhSUbCtI8G6hrZVtlPraZhyOWy740hXjDSQzy
         QdrOhe8gHLG4lWldPWnWYR5WDZdfJBtPhL/FfDAWVDNkqs3HhQuroVrrZqAtdHuW5BA4
         7jIbQeY79no3Y+NEmEteLobkAJ1ScB+BBDmiNa5WUg1TbslYi0S0UJM2N3L8U4IHrI8B
         kQQ1XyslvZQntIchsmYV5UW0nRcbyxJj87sfechwVbpmQJC/N67z8E9kvIwl5zvk/cTq
         JdcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjvw9TDmpEcJ4wekM7pe4ADkzWH/sQhcrnTPbwATGUcUU8R3Dxt/Zzb8p/enTlkx1nKnyGd+odBvk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0kqQ/oHxQiNBrIoV2S7GvQlDX5tWnA8Y80nqv/ArVesY2EUn8
	9+OGiHyCUrR04QwqfM7M6n3O/ak2Hh2Am1E7B9BOOlM99mEJQqhyWwHstLIa+Kc=
X-Gm-Gg: ASbGncs9xItYbGafl17g+no0O8zHoMc9azMKKmtCkdZinelXbYEKaPYho/VKm18fr3l
	8ooQf5VXW4Uw0DQ1z7noALgoTif2VKiNQ8hlZgXYSrWGJ1xV2arL31PqGfHy9Ow+19S2D+AmuNe
	/za4sx4oOtmeTHU2gwknTvf7n8OH4UhVLe/Vp+6oTIHt+RO6s5OjsQkXZka/crNXHPPfdfD3SY5
	o/5Cm9cmuHuEJE2r6zfdZh0u2tWF6PP637dm/DmP/x5Wz6OI4NYJ0ROrZhzgcUK7TuexHGU480b
	mDaHcSkORsndR4d0rsC5wwKQZvbahYFgp+3BsH+thyKvXhqPE4DNQG81h9BZoN3KKDRqFdVlz3y
	H8CalDxHl
X-Google-Smtp-Source: AGHT+IF2Db+pldOKhspqSAr0NyaunsXE+Qe/nxant4Y3ande7U0tRW03vhv0yQetcJnzWAiwlmXBWA==
X-Received: by 2002:a5d:64c2:0:b0:391:47a7:299c with SMTP id ffacd0b85a97d-396c326f4c3mr371034f8f.40.1741885418049;
        Thu, 13 Mar 2025 10:03:38 -0700 (PDT)
Message-ID: <b13543a1-4d43-4e2d-8fcd-08ec60be9dd3@citrix.com>
Date: Thu, 13 Mar 2025 17:03:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trace: convert init_trace_bufs() to constructor
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e1e556c4-ed71-41f7-acfc-b7fa866a0d3e@suse.com>
 <6ff81326-762c-46ec-a06a-254ba166433b@citrix.com>
 <b59ea14e-0bce-4c3e-b1fb-021b53af1780@suse.com>
 <d597523c-aa3a-4682-824f-e6e2f8ce753a@citrix.com>
 <61b762d0-d513-4d02-80ac-50fa12a725f3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <61b762d0-d513-4d02-80ac-50fa12a725f3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 4:37 pm, Jan Beulich wrote:
> On 13.03.2025 17:28, Andrew Cooper wrote:
>> On 13/03/2025 2:19 pm, Jan Beulich wrote:
>>> On 13.03.2025 14:58, Andrew Cooper wrote:
>>>> On 13/03/2025 1:38 pm, Jan Beulich wrote:
>>>> I'm tempted to ack this on the basis that it is an improvement, but a /*
>>>> TODO this is all mad, please fix */ wouldn't go amiss either.
>>> I understand you like adding such comments; I, however, at least
>>> sometimes (e.g.) don't. Especially without at least outlining what
>>> would need doing. Just saying "this is all mad" doesn't really help
>>> very much.
>> I was being somewhat flippant.  But a /* TODO, try and make this a
>> presmp_initcall() to improve alloc_trace_bufs() */ would be fine.
> Okay, added (to the existing comment).

RISC-V and PPC were both green in the pipeline, so they seem happy.

~Andrew

