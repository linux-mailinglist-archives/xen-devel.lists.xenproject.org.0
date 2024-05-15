Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE8E8C660A
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 13:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722266.1126106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7DHI-0004td-Vy; Wed, 15 May 2024 11:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722266.1126106; Wed, 15 May 2024 11:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7DHI-0004s7-So; Wed, 15 May 2024 11:58:36 +0000
Received: by outflank-mailman (input) for mailman id 722266;
 Wed, 15 May 2024 11:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHxB=MS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7DHH-0004rq-94
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 11:58:35 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74c2eb54-12b2-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 13:58:34 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2e538a264f7so70880691fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 04:58:34 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f87d20488sm265726055e9.25.2024.05.15.04.58.33
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 04:58:33 -0700 (PDT)
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
X-Inumbo-ID: 74c2eb54-12b2-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715774314; x=1716379114; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vO4leLrtvRFUHAgIvSBgaS0l2vESgB2VTMS6Hsi8+9Y=;
        b=kQ90EwthndEEEkovvfZbcgRO+Z7VHB6pzepT+LGfVeRLYoZkZcyV2mEz+AszOr3q/l
         88mgZyDvcjyohMM5qSguOy4Zf3NlpDl+bTDv1GsELZVnxhSx5DG353UtIeWBgIZyQypl
         lVmbYJgLBTFJEVsYBbQCvi1ZJwgKZ0YICU9cA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715774314; x=1716379114;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vO4leLrtvRFUHAgIvSBgaS0l2vESgB2VTMS6Hsi8+9Y=;
        b=FujimUmA2FUw4A9wuSeHGNZaz5RbhXE0cNOtwiA3xfgc/TMUesXuv1jfXQZD0JmiLv
         vbZ/TEDLS1AmUJcb6LDoDvgQ0Z2J3EzmbyLr1l8KMrQSAPmLiCyQ2LBJXu5IiJTeGHve
         A9vkh8lz0LJO8Buemh2ps8FV65C9MQyMkFyvSOWtBkwDIhidUW0dG0+ud2kxHgD+FriN
         NfM27NYJfpXei7Nq9CVEm1EyPtRMCWS4iU5Lp+rWIgtEHl52pufMj9wrsyt3PWM7x96e
         nb0AzltcYpFQ19/XO1D1E95woF0h5xgUb1PUELHcgNEvbMsMG77bUldWnwnLGi9sHB8h
         UmNA==
X-Gm-Message-State: AOJu0YzQLnie84B6NCK5W5PbBTscgTPBli81hcgOpbiGFuVLzSgXqohn
	wao1DWQkXg/I/t3LAWph5lS+MlmFeUYgSuPY7ZtOi8oe3L6Ilwn7++Yj2XZJ0FSsFpEfyKba2dp
	g
X-Google-Smtp-Source: AGHT+IEyQKsoelT+y3YmJ7mQl1NgHRL57EyYoa95atihJb97sSW2SPp2GvN45RCrwnGqetOhkHIKmQ==
X-Received: by 2002:a2e:9355:0:b0:2df:e0c4:8429 with SMTP id 38308e7fff4ca-2e51fd4afb7mr101390861fa.18.1715774313676;
        Wed, 15 May 2024 04:58:33 -0700 (PDT)
Message-ID: <41ae17df-fb06-40b3-a98a-02f6f495f169@citrix.com>
Date: Wed, 15 May 2024 12:58:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Xen crash in scheduler during cpu hotplug
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Just so it doesn't get lost.  In XenRT, we've found:

> (XEN) ----[ Xen-4.19.0-1-d  x86_64  debug=y  Tainted:     H  ]----
> (XEN) CPU:    45
> (XEN) RIP:    e008:[<ffff82d040244cbf>]
> common/sched/credit.c#csched_load_balance+0x41/0x877
> (XEN) RFLAGS: 0000000000010092   CONTEXT: hypervisor
> (XEN) rax: ffff82d040981618   rbx: ffff82d040981618   rcx:
> 0000000000000000
> (XEN) rdx: 0000003ff68cd000   rsi: 000000000000002d   rdi:
> ffff83103723d450
> (XEN) rbp: ffff83207caa7d48   rsp: ffff83207caa7b98   r8: 
> 0000000000000000
> (XEN) r9:  ffff831037253cf0   r10: ffff83103767c3f0   r11:
> 0000000000000009
> (XEN) r12: ffff831037237990   r13: ffff831037237990   r14:
> ffff831037253720
> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4:
> 0000000000f526e0
> (XEN) cr3: 000000005bc2f000   cr2: 0000000000000010
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss:
> 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d040244cbf>
> (common/sched/credit.c#csched_load_balance+0x41/0x877):
> (XEN)  48 8b 0c 10 48 8b 49 08 <48> 8b 79 10 48 89 bd b8 fe ff ff 49
> 8b 4e 28 48
> <snip>
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040244cbf>] R
> common/sched/credit.c#csched_load_balance+0x41/0x877
> (XEN)    [<ffff82d040245a18>] F
> common/sched/credit.c#csched_schedule+0x36a/0x69f
> (XEN)    [<ffff82d040252644>] F common/sched/core.c#do_schedule+0xe8/0x433
> (XEN)    [<ffff82d0402572dd>] F common/sched/core.c#schedule+0x2e5/0x2f9
> (XEN)    [<ffff82d040232f35>] F common/softirq.c#__do_softirq+0x94/0xbe
> (XEN)    [<ffff82d040232fc8>] F do_softirq+0x13/0x15
> (XEN)    [<ffff82d0403075ef>] F arch/x86/domain.c#idle_loop+0x92/0xe6
> (XEN)
> (XEN) Pagetable walk from 0000000000000010:
> (XEN)  L4[0x000] = 000000103ffca063 ffffffffffffffff
> (XEN)  L3[0x000] = 000000103ffc9063 ffffffffffffffff
> (XEN)  L2[0x000] = 000000103ffc8063 ffffffffffffffff
> (XEN)  L1[0x000] = 0000000000000000 ffffffffffffffff
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 45:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=0000]
> (XEN) Faulting linear address: 0000000000000010
> (XEN) ****************************************

which we can reproduce reliably enough with a shell script doing
xen-hptool cpu-{off,on}line.

~Andrew

