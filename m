Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD9BAF9A29
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 19:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033610.1406957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXkbf-0003K8-3c; Fri, 04 Jul 2025 17:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033610.1406957; Fri, 04 Jul 2025 17:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXkbf-0003I1-0x; Fri, 04 Jul 2025 17:53:51 +0000
Received: by outflank-mailman (input) for mailman id 1033610;
 Fri, 04 Jul 2025 17:53:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9FN=ZR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uXkbc-0003Hr-Uu
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 17:53:48 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d56f6206-58ff-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 19:53:47 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso660029f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 10:53:47 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b4708d094csm2994854f8f.28.2025.07.04.10.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 10:53:46 -0700 (PDT)
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
X-Inumbo-ID: d56f6206-58ff-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751651626; x=1752256426; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3SKvZjYMUoxFeGJh3oZxTgufBc5EyFMOxJZOyOwY81s=;
        b=UbhkiWjvFHuAePhbhKs8uahIetm7xTEsRGjCy0NwZnWmq7EZESWtGRryNrmE+jhP//
         ykGKYkC97N74j/6b2YtXzMy2tNsefeGz3svX8z3qyAE/yuayuBGZyC+BqgXmvTI0fCNd
         WgF9nEdbZPeDKyXROv8L+9LixoPMqrEB9it7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751651626; x=1752256426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3SKvZjYMUoxFeGJh3oZxTgufBc5EyFMOxJZOyOwY81s=;
        b=YzokjnQuW9bdqYyx6cQzZ5da4oqv/SdKJMV+y+Ucr5fHWpizOWCwHT5hLOA+QYIV5a
         lP7KTaJJG72uuaRlExzqr2bxLoXho4sFDcIRbNQW6vrIRvo+oLSEbF01keJoYgpD67di
         qvW0c/MonLAUgVpXiVelsdMIlZqEh+UNpVsoWRuKK8ZXwYZR3rr8T4/i0oaSbkhlIMx2
         sRR9cNI089ViCa4bI0onxX/b8JLKSRLlLIQKfyyoq1bACiLtyykfNKvyTA8IZiVWTuGD
         p+X8WuxC5hMjx6CFm98MkjEGEHWlgJv+8Sh5ZXB2ryI+a0sbCZLL0yNifsq0wj/ZgIQ0
         8ivQ==
X-Gm-Message-State: AOJu0Yzr4Z7Vl+k+PRPDFPUuJngheGwRSM4bGfZDOUHuymF60uFPkngL
	rcAAfo8dpLF8FjmWisbCF8gNTeWM24K9CKUbbggyDuKgaf4aXy7fO1/eIhf3KvoGKrg=
X-Gm-Gg: ASbGncvH1D2JglcfTLg4SJjU9Ysk0DxiDAcCFF2aUkXiDEP/Y70G24ID//Zx5KuXtoJ
	OyLWWc7qpHV9D2wNXlNHMlKfmmjFiB7poGz03vojLiSFrGwTHfr8M8Ujz5Aa2q5o5GsRjkOfTOO
	8KK3c3tJdJdkJB2QoYhd7hdI0dM1JH1lLPH9VvO4DqYAvIQbeDgckpmWE15pj6RI/8RLNxLoiTR
	Fnu9BJztyZwjWc8TkLIg8M4+2qS7EZod1AuzqmsA3Fmw3kZByBGiMw8AdfgzWpmtVTnI7XVo7JR
	Wmey8S7UGJznRe2T3buxRJN5mqWKwAiQs+J4StOQgQQDQGUJJUg/pYhxuO8tqdt6wn256BSN+Me
	86X2jxnPwZSthohOfb3ydJjEEZzkUlA==
X-Google-Smtp-Source: AGHT+IEAonGI7gp9ijdBJLZYzRUyoWeZfw+cpFxoZdYROHxw3aMTrdoL+eNXLuJPAIwMEgUqfpqf6Q==
X-Received: by 2002:a05:6000:2285:b0:3aa:c95b:d1d9 with SMTP id ffacd0b85a97d-3b4964eb200mr2641330f8f.6.1751651626460;
        Fri, 04 Jul 2025 10:53:46 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:53:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 5/6] x86/idle: Implement a new MWAIT IPI-elision
 algorithm
Message-ID: <aGgVKfbMS8KwX-32@macbook.local>
References: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
 <20250704163410.1412367-6-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704163410.1412367-6-andrew.cooper3@citrix.com>

On Fri, Jul 04, 2025 at 05:34:09PM +0100, Andrew Cooper wrote:
> In order elide IPIs, we must be able to identify whether a target CPU is in
> MWAIT at the point it is woken up.  i.e. the store to wake it up must also
> identify the state.
> 
> Create a new in_mwait variable beside __softirq_pending, so we can use a
> CMPXCHG to set the softirq while also observing the status safely.  Implement
> an x86 version of arch_pend_softirq() which does this.
> 
> In mwait_idle_with_hints(), advertise in_mwait, with an explanation of
> precisely what it means.  X86_BUG_MONITOR can be accounted for simply by not
> advertising in_mwait.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

