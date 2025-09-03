Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D587B4263B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 18:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108724.1458780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utq1e-0007EU-FN; Wed, 03 Sep 2025 16:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108724.1458780; Wed, 03 Sep 2025 16:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utq1e-0007Bh-Bm; Wed, 03 Sep 2025 16:07:58 +0000
Received: by outflank-mailman (input) for mailman id 1108724;
 Wed, 03 Sep 2025 16:07:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Q+D=3O=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1utq1c-0007BZ-97
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 16:07:56 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25f24d9c-88e0-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 18:07:54 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3c46686d1e6so74342f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 09:07:54 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3df4fd372ccsm2044061f8f.32.2025.09.03.09.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 09:07:52 -0700 (PDT)
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
X-Inumbo-ID: 25f24d9c-88e0-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756915673; x=1757520473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3m/rgbH8ClLoYH3sdTBN3BOtpxBTw+323MJgH3uWVbQ=;
        b=LuF4GNcm/ZvGa/z2fQ+VAfGrgg4/LsYQQ2Hlx1tGTkvRuaETryLKPO8s00ZCV6c7OE
         I4o6K+5EO1W3KOBAPqLrWw5X4jNrqAJixuSSAEX4QrxC4uDAD8VtSRIrVRTVnSUb+zkN
         KvjkJWcFdqq3N8+KL9QFoxrbeDMDva6R4rfe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915673; x=1757520473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3m/rgbH8ClLoYH3sdTBN3BOtpxBTw+323MJgH3uWVbQ=;
        b=mIDY0xasOiIBmpoupXYfIgWjBUD99eVuQjtpwRvV9H/7gbWISGbA1HsS4EGBhALcXE
         /HD+hOMmqSv/Kq3/UbguW0LBsy7K9JHNoiiICbk+IHCCIv2e9AJ9xztGF5wugaDO/Wrd
         bCWw6KZ5NM2bDA6eucRObuzmvolgGxfjfUkC1oXEzOZKy02j1pJ7GXxjP8XMvxglYkh7
         RfMOYqmZuk0xRaJt+HrIOIrnYxn0R4Hldht0BWEU2M0I1n2RuPyKZaKF5SpfiNBBNKP1
         wRT5STMzK/Zy04T5SuyAGf9YTy8WpazRpGjP/8zj3wDGr0d9wASDWmAI/jQBjiQG9xn8
         BLCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/tShm2CHI+2vNlvS0CJZDHc5vb86PJWYE/jvW7pVpgNyUb/PaXN9GVhfLCjyP350Yo7heMonzkdc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQXVjwIxOm7zlB7lvZFcGW8LgVPxEJTKeHeE7jaowJRCNjr+Dx
	yd1vOY7ytw0kercMyzpJ5FJzmDMMPz1wdR+Bu6IbqH6+8+K1Inyoa8dfBsqpKXVZdj/W7TBnREp
	UyJPC
X-Gm-Gg: ASbGncs4HW0UR6Dw4UJbE0ZkRwnja+L4ZkASKi5pCWQ3DzQqeGEpu3B7dzUXq1IxGb7
	pOIhMdet+uhls67R20cYN3RI3Pd/67pRuHl4os5SVQEgppL6P8GPbXAT/aYCwWhUhxpT3o29TMT
	jrx1HfZsEsAr/MeMjwSawYy5t/oVeT6IQa9FVU8J1KmMtSVRIsrp1XITStH4X5xc2zQ/qUnnLE0
	BqAYpSjmDj59JrGTjyqoKSDiHnX3GR+L+l6B/WVAmn3V9EGS5NjE52QrbypcXTqXir+Fac6K8NU
	NKrAYTh/Qt8JL7yy+NiJQi3R0mdxUxgxSJH1eipnmLb22ZVBIeg1vepoADeItyAKRisEL4MvZtx
	R75AEQzQM+8qmBWcEmm9mjSWVIhTcc6FGELdHLPJ5eJanEnA6149d7bvIIK0pdVbHnlxL
X-Google-Smtp-Source: AGHT+IHwyHE/oR9zGyf3axYiroAcD3V1o5Yf1SItG89C5yfJqjKaKRJCTfyVwafmHzmiiM09VsbO1w==
X-Received: by 2002:a05:6000:26cb:b0:3ce:f0a5:d581 with SMTP id ffacd0b85a97d-3d1dd81d1cfmr11673916f8f.7.1756915673339;
        Wed, 03 Sep 2025 09:07:53 -0700 (PDT)
Message-ID: <f9cc7287-7f12-400b-8b23-bcb855973f5f@citrix.com>
Date: Wed, 3 Sep 2025 17:07:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging-4.19 | dabd7193
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <68b85acabf772_2ce5982c10997@gitlab-sidekiq-catchall-v2-5996545549-5wvcj.mail>
 <e817c472-5c62-457c-9635-7aef6fadbee2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e817c472-5c62-457c-9635-7aef6fadbee2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2025 4:57 pm, Jan Beulich wrote:
> On 03.09.2025 17:12, GitLab wrote:
>>
>> Pipeline #2019389649 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>> Branch: staging-4.19 ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging-4.19 )
>>
>> Commit: dabd7193 ( https://gitlab.com/xen-project/hardware/xen/-/commit/dabd719321b652286b9d0b0c23e29c8427eb7da5 )
>> Commit Message: x86/gen-cpuid: Fix debugging for cycle detectio...
>> Commit Author: Andrew Cooper ( https://gitlab.com/andyhhp )
>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>>
>>
>> Pipeline #2019389649 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/2019389649 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>> had 1 failed job.
>>
>> Job #11232025215 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11232025215/raw )
>>
>> Stage: test
>> Name: qemu-alpine-x86_64-gcc
> I cannot make sense of the failure, and hence I have no idea what to do. Is
> the perhaps another root container issue?

Seems like a likely guess.

That ran on gitlab-docker-seagull, but this is the singular failure
https://gitlab.com/groups/xen-project/-/runners/14174957

The sequentially previous job was
https://gitlab.com/xen-project/hardware/xen/-/jobs/11230956609 which was
a Xen 4.17 run of opensuse-leap-gcc which is a root container.

I think I'm going to have to do some careful container rebuilding here...

~Andrew

