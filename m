Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACD9964CD6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 19:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786042.1195602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjize-0000YS-E2; Thu, 29 Aug 2024 17:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786042.1195602; Thu, 29 Aug 2024 17:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjize-0000VV-B6; Thu, 29 Aug 2024 17:31:34 +0000
Received: by outflank-mailman (input) for mailman id 786042;
 Thu, 29 Aug 2024 17:31:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zolI=P4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjizc-0000VL-Pj
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 17:31:32 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87cb4bcc-662c-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 19:31:31 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-371b015572cso730485f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 10:31:31 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89892221cdsm100868866b.207.2024.08.29.10.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 10:31:30 -0700 (PDT)
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
X-Inumbo-ID: 87cb4bcc-662c-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724952691; x=1725557491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JVc5H4Sqrf5HsD0UnVXy0zp71X7ivIbue4Mk1LYDI3s=;
        b=XlfXfYsQkVoV7TdWb3AxKj1QAGkM7NPda+A85fvwvCsEy84iQjFL6LPP3V48VaDO1P
         1dMTdQhzL0GX3IchhIuNsL3andHa0RrnFdZrcvb4w7JEwSuoe6R80QkY31lQ7FdPp/1m
         dh6F1ADZpy2tmpWHtJeQEuWa00WZAZXr42Fm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724952691; x=1725557491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVc5H4Sqrf5HsD0UnVXy0zp71X7ivIbue4Mk1LYDI3s=;
        b=o4Lj4BHr9MXrdW+OwmBeE+MDjVtHpUg/6x7hHjSWxFs49Yl+b84rvPiu6MmZvM7Pqh
         uBJ0r0f8sckMaBdtTyOahMBOXqZFTg1rPIuGRKrvyWnuxphNKHE0NTi6M6vZ/8jVKqW2
         5bE4vlqU8kCa+lec8n6Yy5wlu8TVpEjO39nVmCn5rrMS01y51l6GIKuohBPOq07znD/s
         mT7Yitl70ej1W/o3nNyQjFuKbqam8L6y9oIvAR1QpIx+JpyD+h3uA28OE48YWQukd8DO
         4x2B53QyK10Z+6qCdJ7AbjNE1+yj6tg4Zgw94uiL6DMep/D6D7hmT+2/ETZyGTu0dZOF
         G6fA==
X-Forwarded-Encrypted: i=1; AJvYcCWJKpGVpvLn30V36SIg0uwPXVFCktgIe3TbDyosNMOqaX1sNm7lS4OKfpKKgo9rgNBas40iypGKex0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgFXgd7eyCLc1fijipJIeHxACuVEZiKLsIxzICsA2mqdh0+ezE
	7nDhgZF2S5nv9J/bSVY8pTJC7yTc/tQkg+vEoGIeEz/tqzbba9CVwSKUCNgz8kawfEucs9ejLiU
	9
X-Google-Smtp-Source: AGHT+IHMXbC51obgubKT6vUVA/B52MOWuZftGEeZ8V74U58TzxEwcbA31dB1sHgenRW+fz/bmiXjtg==
X-Received: by 2002:adf:e005:0:b0:368:4c38:a668 with SMTP id ffacd0b85a97d-3749b526b73mr3361000f8f.9.1724952690527;
        Thu, 29 Aug 2024 10:31:30 -0700 (PDT)
Message-ID: <f6bfba53-3a17-4da2-ac45-50b7b2175eb2@citrix.com>
Date: Thu, 29 Aug 2024 18:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IOREQ completions for MMIO writes
To: Jason Andryuk <jason.andryuk@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <f4551fc8-d0c0-492c-8ad3-b045843af381@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f4551fc8-d0c0-492c-8ad3-b045843af381@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/08/2024 5:08 pm, Jason Andryuk wrote:
> Hi Everyone,
>
> I've been looking at ioreq latency and pausing of vCPUs.  Specifically
> for MMIO (IOREQ_TYPE_COPY) writes, they still need completions:
>
> static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
> {
>     return ioreq->state == STATE_IOREQ_READY &&
>            !ioreq->data_is_ptr &&
>            (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
> }
>
> state == STATE_IOREQ_READY
> data_is_ptr == 0
> type == IOREQ_TYPE_COPY
> dir == IOREQ_WRITE
>
> To a completion is needed.  The vCPU remains paused with
> _VPF_blocked_in_xen set in paused_flags until the ioreq server
> notifies of the completion.
>
> At least for the case I'm looking, a single write to a mmio register,
> it doesn't seem like the vCPU needs to be blocked.  The write has been
> sent and subsequent emulation should not depend on it.
>
> I feel like I am missing something, but I can't think of a specific
> example where a write needs to be blocking.  Maybe it simplifies the
> implementation, so a subsequent instruction will always have a ioreq
> slot available?
>
> Any insights are appreciated.


This is a thorny issue.

In x86, MMIO writes are typically posted, but that doesn't mean that the
underlying layers can stop tracking the write completely.

In your scenario, consider what happens when the same vCPU hits a second
MMIO write a few instructions later.  You've now got two IOREQs worth of
pending state, only one slot in the "ring", and a wait of an unknown
period of time for qemu to process the first.


More generally, by not blocking you're violating memory ordering.

Consider vCPU0 doing an MMIO write, and vCPU1 doing an MMIO read, and
qemu happening to process vCPU1 first.

You now have a case where the VM can observe vCPU0 "completing" before
vCPU1 starts, yet vCPU1 observing the old value.

Other scenarios which exist would be e.g. a subsequent IO hitting STDVGA
buffering and being put into the bufioreq ring.  Or the vCPU being able
to continue when the "please unplug my emulated disk/network" request is
still pending.


In terms of what to do about latency, this is one area where Xen does
suffer vs KVM.

With KVM, this type of emulation is handled synchronously by an entity
on the same logical processor.  With Xen, one LP says "I'm now blocked,
schedule something else" without any idea when the IO will even be
processed.


One crazy idea I had was to look into not de-scheduling the HVM vCPU,
and instead going idle by MONITOR-ing the IOREQ slot.

This way, Qemu can "resume" the HVM vCPU by simply writing the
completion status (and observing some kind of new "I don't need an
evtchn" signal).  For a sufficiently quick turnaround, you're also not
thrashing the cache by scheduling another vCPU in the meantime.

It's definitely more complicated.  For one, you'd need to double the
size of an IOREQ slot (currently 32 bytes) to avoid sharing a cacheline
with an adjacent vCPU.

I also have no idea if it would be an improvement in practice, but on
paper it does look like it warrants some further experimentation.

~Andrew

