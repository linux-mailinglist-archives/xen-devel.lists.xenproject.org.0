Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603269D856E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 13:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842502.1258040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFYCx-0007xV-IP; Mon, 25 Nov 2024 12:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842502.1258040; Mon, 25 Nov 2024 12:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFYCx-0007vQ-EW; Mon, 25 Nov 2024 12:28:51 +0000
Received: by outflank-mailman (input) for mailman id 842502;
 Mon, 25 Nov 2024 12:28:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z5yF=SU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tFYCw-0007vK-5b
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 12:28:50 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfeddeb5-ab28-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 13:28:44 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5cf9ef18ae9so10218165a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 04:28:44 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3c052fsm4073171a12.44.2024.11.25.04.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 04:28:43 -0800 (PST)
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
X-Inumbo-ID: cfeddeb5-ab28-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzMiLCJoZWxvIjoibWFpbC1lZDEteDUzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNmZWRkZWI1LWFiMjgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTM3NzI0Ljg5NDI5OCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732537724; x=1733142524; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=embojS4IjDDsPnguFr4MdhbSnmkJKNqXjs8bsz5CVqY=;
        b=diUhsnShE6wKd/rBQTskrvcnSpgbOkCpA+VgDYDJt5k2ApXMIdnjf5YJJ4s4z2euiI
         5kjt0psGLgX5HYVC1Voyn8gfR3XjSMKbJ5zuTciaApUIsvj+fi8hJ/B0bp5QotZmEBZM
         gf9MlxVJhJ/hC1jAFE08Knz1agHqtBtaixf9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732537724; x=1733142524;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=embojS4IjDDsPnguFr4MdhbSnmkJKNqXjs8bsz5CVqY=;
        b=XI18bN2Sfg2mcMCy63Zo+Ygy3AyRry9UppHjmoD+FgP1kbyPtURU1t3G+Wzof84HoW
         JONcnF8XzuS30AWUEFi2AJ2aUYLrmA87W3D5kUYOePxb7BKdzdcyb/gP5Io/bRkxGqry
         h0QxYEZUfAxMLl4QsRZYuRrgue9wcnZbt1MOXEAs9YwiVSY2zH4fl+WobK/VkQNe2o3e
         7OGz8TlZAyBHXCc7jlcpLz8pwzGvRZBMa6Lug067ZCWID42+GUr8gVIUGwhg40ZAVuLS
         55zg7mDnIlOpYpl05drLMsWjF551cuLaSI4z3lfY63kcJEQwSy429eRP0fyoaa6W1Jmp
         ihCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgSqKBaHK4/BqzaZA80xpbQnVW4V4BjniYWAKPHVWn0qx9RH4Bfk8JlwdVc6KZou6NYaGERPcO4y0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw98i6P//ufYlCK7711Sdt0OEfQtlN36OiMGwfAZc57NYOuAO6A
	Sz9sL6O0iVCAbuaPM0lotTmjluKLeQIObXvRhW1CyXaxee/nKbWvk2tB8EFxMiI=
X-Gm-Gg: ASbGncuWZHLJIAuauoDkPT2hDy30c5L8cuMyZPCVNiAocHfOqgD6g8xIB0AEEpFZ61W
	Mfl93TtX61E3xiM079XFOyOF8bfNOccJcRTRLyb2XexNcwViXmvHWTpCMjo1Kacn/4F8DQyYv+Q
	Purl/tqfvgCfp7lxuQf9oE8mW5JSr1aXRjo2GCNdj4qCHecZMczmxN/51C5Qh12u7jFJYBuHMiR
	11ySHxESmj/zaZgSuEk4UYoDWVnFd5BBZD7qCsL+me0AR6CL/AGj9BCTmKwKxQ=
X-Google-Smtp-Source: AGHT+IE1ggMdCNkqaCM2s7vOvz6Z5TvTbTaJ1VuUSeLyh/8WjcpnIWRcy2tx86pBycVeic9jx7lm5g==
X-Received: by 2002:a05:6402:358b:b0:5cf:cd5d:f119 with SMTP id 4fb4d7f45d1cf-5d007bfb44dmr15595137a12.4.1732537724354;
        Mon, 25 Nov 2024 04:28:44 -0800 (PST)
Message-ID: <cb5e988c-0774-4881-81c9-e4a1a830d64d@citrix.com>
Date: Mon, 25 Nov 2024 12:28:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 2e853c19
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <67446a18cdb7b_2e311cddc121912@gitlab-sidekiq-catchall-v2-65d69c5784-4rjws.mail>
 <9ad17178-b6c9-4aec-8f67-7f1db1a85276@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9ad17178-b6c9-4aec-8f67-7f1db1a85276@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/11/2024 12:17 pm, Jan Beulich wrote:
> On 25.11.2024 13:14, GitLab wrote:
>>
>> Pipeline #1558962580 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
>>
>> Commit: 2e853c19 ( https://gitlab.com/xen-project/hardware/xen/-/commit/2e853c19204e2d660a8becf4b377cc99216854dd )
>> Commit Message: xen/common: Move gic_dt_preinit() to common cod...
>> Commit Author: Oleksii Kurochko ( https://gitlab.com/olkur )
>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>>
>>
>> Pipeline #1558962580 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1558962580 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>> had 1 failed job.
>>
>> Job #8461870351 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/8461870351/raw )
>>
>> Stage: build
>> Name: debian-11-riscv64-gcc
> ERROR: Job failed: failed to pull image "registry.gitlab.com/xen-project/xen/debian:11-riscv64" with specified policies [always]: Error response from daemon: Get "https://registry.gitlab.com/v2/": dial tcp: lookup registry.gitlab.com on 127.0.0.53:53: read udp 127.0.0.1:53667->127.0.0.53:53: read: connection refused (manager.go:251:0s)
>
> i.e. nothing on the side of what's under test. I'm afraid I don't even know
> what to do in such a case, to get things moving again.

It seems Gitlab is having networking problems.

Hit the retry button.  (top right hand side, 2 arrows in a circle, white
on blue background).

I've rerun this test for now, but I expect others will fail.

~Andrew

