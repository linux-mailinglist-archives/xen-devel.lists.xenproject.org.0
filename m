Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D048C6740
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 15:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722348.1126188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7EaK-0007Et-Ln; Wed, 15 May 2024 13:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722348.1126188; Wed, 15 May 2024 13:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7EaK-0007CW-JH; Wed, 15 May 2024 13:22:20 +0000
Received: by outflank-mailman (input) for mailman id 722348;
 Wed, 15 May 2024 13:22:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHxB=MS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7EaI-0007CQ-I6
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 13:22:18 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25b22d65-12be-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 15:22:16 +0200 (CEST)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-78f05341128so523799685a.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 06:22:16 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf2fca82sm677730685a.89.2024.05.15.06.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 06:22:14 -0700 (PDT)
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
X-Inumbo-ID: 25b22d65-12be-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715779335; x=1716384135; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gkwRZyhZIsCkGM+O4ci548+VvxsRNca7Pek4Id5P3uE=;
        b=nC3jBt5b3wgqrPpK251wM+nzLqv2PAFIrKPREzlsZk9xlnHzAf+/rhRUHF5yXlvuSf
         Y1CjkwHS+NpI3dnGC1bnRIPbjurzBISHoARhoIKe/QjTXq9KDQFaqkPajjHu46PcGumv
         BUmEdk/dbXYS0NOrMejFLtsOqYGB7ZZ1rPLYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715779335; x=1716384135;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkwRZyhZIsCkGM+O4ci548+VvxsRNca7Pek4Id5P3uE=;
        b=R8htyluwLXHFnZ8gYDQfoJtaZ4WHV3Dp5XzZFpPyDuZ/WsITy8AkmHOX4uMr2nHYSB
         Jki3yVUbkYbub1a4tvEsYHVX2DkFe5jFYMhbh+RZe+z4FXjg4JY8UQzg6HXYvP+VTnlK
         LwBjRauxqtWRiqLv4MjRwIvWWD3pfsjhsoR65XVHwpBfkk9lR65vWxgKgbfLY+xblDrY
         w0HpNiZ4S5c0awdPgHasA43nvHvPebjv+Sl3fIxwGB22FvggHcX2Rq/yxOPQ3+z4bDLj
         n8+FTd3iewRCb7IS2bLgDMr0PAXusgXjF1HUOGJNIdGYIRW5aZ78UKsZSECMQ62UaF7w
         7IAA==
X-Gm-Message-State: AOJu0YylBYgqaucVgQ9KmTn44SUuZG6oa6u8rPL9/VEwt0hNP/mqAJk8
	pFEmlnvH3oDA1uPLdfpTV7fjvO417GnTpmQ+pMVFxEH9XRJ6VYASvQrxM3yD71A=
X-Google-Smtp-Source: AGHT+IEFFyFDs9z7a2aga/FFMV0LyyHsktk1U3Gv14xPxSYqFQwgAmyIw2e4ld7icrUK1ZV4wNizfQ==
X-Received: by 2002:ae9:f212:0:b0:790:c7f3:abce with SMTP id af79cd13be357-792c75b0916mr1720212385a.37.1715779335192;
        Wed, 15 May 2024 06:22:15 -0700 (PDT)
Message-ID: <9fdbf8a1-56a6-4be3-96a0-fcded0382cf0@citrix.com>
Date: Wed, 15 May 2024 14:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen crash in scheduler during cpu hotplug
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <41ae17df-fb06-40b3-a98a-02f6f495f169@citrix.com>
 <7553291c-f88d-49c7-a1bd-5f8dbd21fd2b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7553291c-f88d-49c7-a1bd-5f8dbd21fd2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/05/2024 1:39 pm, Jan Beulich wrote:
> On 15.05.2024 13:58, Andrew Cooper wrote:
>> Just so it doesn't get lost.  In XenRT, we've found:
>>
>>> (XEN) ----[ Xen-4.19.0-1-d  x86_64  debug=y  Tainted:     H  ]----
>>> (XEN) CPU:    45
>>> (XEN) RIP:    e008:[<ffff82d040244cbf>]
>>> common/sched/credit.c#csched_load_balance+0x41/0x877
>>> (XEN) RFLAGS: 0000000000010092   CONTEXT: hypervisor
>>> (XEN) rax: ffff82d040981618   rbx: ffff82d040981618   rcx:
>>> 0000000000000000
>>> (XEN) rdx: 0000003ff68cd000   rsi: 000000000000002d   rdi:
>>> ffff83103723d450
>>> (XEN) rbp: ffff83207caa7d48   rsp: ffff83207caa7b98   r8: 
>>> 0000000000000000
>>> (XEN) r9:  ffff831037253cf0   r10: ffff83103767c3f0   r11:
>>> 0000000000000009
>>> (XEN) r12: ffff831037237990   r13: ffff831037237990   r14:
>>> ffff831037253720
>>> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4:
>>> 0000000000f526e0
>>> (XEN) cr3: 000000005bc2f000   cr2: 0000000000000010
>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss:
>>> 0000000000000000
>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>> (XEN) Xen code around <ffff82d040244cbf>
>>> (common/sched/credit.c#csched_load_balance+0x41/0x877):
>>> (XEN)  48 8b 0c 10 48 8b 49 08 <48> 8b 79 10 48 89 bd b8 fe ff ff 49
>>> 8b 4e 28 48
>>> <snip>
>>> (XEN) Xen call trace:
>>> (XEN)    [<ffff82d040244cbf>] R
>>> common/sched/credit.c#csched_load_balance+0x41/0x877
> While this is of course pretty little information, I've still tried to
> decipher it, first noticing it's credit1 that's being used here. Once
> forcing csched_load_balance() non-inline (no idea why it is a separate
> function in your build), I can see a sufficiently matching pattern at
> approximately the same offset into the function. That's
>
>     const struct cpupool *c = get_sched_res(cpu)->cpupool;
>     ...
>     const cpumask_t *online = c->res_valid;
>     ...
>     BUG_ON(get_sched_res(cpu) != snext->unit->res);
>
> overlapping, with the crash being on the middle of the quoted lines.
> IOW the CPU pool is still NULL for this sched resource. Cc-ing
> Jürgen for possible clues ...

We've seen it in 4.13, 4.17 and upstream, after Roger extended the
existing CPU hotplug testing to try and reproduce the MTRR watchdog
failure.  We've found yet another "no irq for handler" from this too.

It's always a deference at NULL+0x10, somewhere within csched_schedule().

---8<---
#!/bin/bash

set -e

CPUS=$(xl info nr_cpus)

while :
do
    for C in $(seq 1 $(($CPUS-1)))
    do
        echo "Offline $C"
        xen-hptool cpu-offline $C
        echo "Online $C"
        xen-hptool cpu-online $C
    done
done
---8<---

does rather well at reproducing the crash.

~Andrew

