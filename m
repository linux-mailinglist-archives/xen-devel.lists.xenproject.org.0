Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10169D6816
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 08:43:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842083.1257525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEkmJ-0004Ms-Hl; Sat, 23 Nov 2024 07:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842083.1257525; Sat, 23 Nov 2024 07:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEkmJ-0004KK-EN; Sat, 23 Nov 2024 07:42:03 +0000
Received: by outflank-mailman (input) for mailman id 842083;
 Sat, 23 Nov 2024 07:42:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U4h7=SS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tEkmH-0004KE-RJ
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 07:42:01 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6906ecc1-a96e-11ef-99a3-01e77a169b0f;
 Sat, 23 Nov 2024 08:41:54 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3822ec43fb0so2211909f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 23:41:54 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825faf9f59sm4480231f8f.34.2024.11.22.23.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 23:41:53 -0800 (PST)
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
X-Inumbo-ID: 6906ecc1-a96e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmEiLCJoZWxvIjoibWFpbC13cjEteDQyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY5MDZlY2MxLWE5NmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMzQ3NzE0Ljc5MjQ0OCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732347714; x=1732952514; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BHtiFrlnk5wNQ2xcKnNmkcEGMOHMkcIDcdpbC7dGDSo=;
        b=V+HpdQ3am5JFyYSmo/cGvE+dmV3w/sSaWZPLY9OgnV2xSrFg7Ne6i3Kh/iAPjFor77
         lH9VMR+weghbZQ5RvrfyW6x+7dgC4pfZ0QZZlp+Qwasy0zJsgAk77fYEKZ45feQ9EAW8
         uuA0iKuWKdDMwIEZuA7oVjDWLkfZuIXlEin/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732347714; x=1732952514;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHtiFrlnk5wNQ2xcKnNmkcEGMOHMkcIDcdpbC7dGDSo=;
        b=Z40pDj3CtubvvM8MYnl7Dm3he8yTSOj7METAbpWiF0saxOpN9adAdweAUy4VnuQuLe
         qp67dmLysFF8A60Ott40rj9cko12l3BdKWJaUpeQJneVSqsrEOhIo8hc3zm0N4EGKiBr
         8Jy8Yw8QudQwosGdM2VfM+1s7LmzFetHHSsFk/KUdkBPzEsCWq5kJ3f3t5Y6sNsieQ8/
         EAsTrE0B6mQDiVWZfCWHtKufGikGycb2AT38kPe/u6AI1qepm95bqt4GNrD4QgBz2z+o
         SAP9pHP4NmAEkSrEbZtuDbCiBsKpcEkE6pySfJDgp71LChS2ldkGEVGOD31CsTMM0GsO
         qVIA==
X-Forwarded-Encrypted: i=1; AJvYcCU8LiJbkpLtzofXnc5UMJuTomdN39o7YtQgOAvaqf0y8NwfeW8HS/BbtPwRitA6bX/0z1Nhg8yK/fk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgLkQOhRsUZsgVItkvMKtUzZVU3krIeUZVDbQ2f36QLgJjZE0o
	bu5wsugfq3l1UdSmmQFikukAoLrMLvnpcUESfX6FEQI8U9deHBJnQZrFX9kra0k=
X-Gm-Gg: ASbGncvdm61qZjw2rnWlth7pZfQKsZVFNZLWyYcMu2u0py7muYgtDKZCjXk9Go5qpJG
	xHpwIKatt1AHQleLgqj5un4MTH4m8OP5SicAo5W+i1262SoEObHBRqKsocwaza2YG2g5aWd9Qcs
	G0biMEcVcQICi6k2pHU3MFzWesDM+f53Kv0JJRKSj4/+1X3ZFQlVjUQ1teCo5ppa37YMY5CRxGo
	fEAr34da7U6mo3nrA5qs33NjI5RAfCsK5ZPOX9AXEvnPNPZB4zVKkyKyXK8h33ti/wXYVKDH0wm
	cdGCVi/26L89Yg==
X-Google-Smtp-Source: AGHT+IHli3gx8osuPd7o6qYuw2BpJ0B3JryQsLmqWDY+w9IJvpsF+i2Hhngscr6so58rch9oCtr5Cg==
X-Received: by 2002:a05:6000:1acc:b0:382:58b7:e538 with SMTP id ffacd0b85a97d-38260b44c73mr4236083f8f.4.1732347714140;
        Fri, 22 Nov 2024 23:41:54 -0800 (PST)
Message-ID: <1c3f9ae2-cde3-4e7e-aff3-63ec36bb5b4a@citrix.com>
Date: Sat, 23 Nov 2024 07:41:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20241122210719.2572072-1-volodymyr_babchuk@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241122210719.2572072-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/11/2024 9:07 pm, Volodymyr Babchuk wrote:
> Both GCC and Clang support -fstack-protector feature, which add stack
> canaries to functions where stack corruption is possible. This series
> makes possible to use this feature in Xen. I tested this on ARM64 and
> it is working as intended. Tested both with GCC and Clang.
>
> My aim was to enable it on x86 also, but it appears that on x86 GCC
> stores canary value in TLS, exactly at fs:40, which is hardcoded. As
> Xen does not setup fs register for itself, any attempt to enable stack
> protector leads to paging abort.

It's rather worse than a #PF, if a devious PV guest decides to map
memory at 0.

There's a long and complicated history with stack-protector on x86.

It is %fs:40 by default, but this becomes %gs:40 with -mcmodel=kernel
(which Xen doesn't use, but is necessary to know if anyone wants to look
at how Linux does this.)

Xen on x86 uses neither %fs nor %gs for per-cpu variables, because PV
guests do.  This happens to have saved us from a number of privilege
escalation corner cases that exist in the x86 architecture.  I'm very
reluctant to open ourselves up to such problems just to support
stack-protector.


With GCC 8.1, we get -mstack-protector-{guard,reg,offset} to fine-tune
things a whole lot more.  I am not sure when these got into Clang.

In particular, -mstack-protector-guard=global lets us have a scheme that
seems to be the same as the ARM/RISCV, which is probably good enough to
start with, although it involves restarting the toolchain debate and is
probably not something you want to do in this series.

See
https://lore.kernel.org/lkml/20241105155801.1779119-1-brgerst@gmail.com/T/#u
for most of the gory details.

> I also tested build-ability for RISCV platform, but didn't tested that
> it does not break anything, so we will need RISCV maintainer's
> approval.

There's a RISC-V smoke test in gitlab CI, but you can run it locally too.

~Andrew

