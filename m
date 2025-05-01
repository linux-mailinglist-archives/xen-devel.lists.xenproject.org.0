Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E78AA5FCF
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 16:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974162.1362096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAUmQ-0000c7-TX; Thu, 01 May 2025 14:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974162.1362096; Thu, 01 May 2025 14:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAUmQ-0000aN-QJ; Thu, 01 May 2025 14:20:50 +0000
Received: by outflank-mailman (input) for mailman id 974162;
 Thu, 01 May 2025 14:19:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7NBP=XR=flex--jackmanb.bounces.google.com=3BYMTaAgKCaAJACKMANBGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@srs-se1.protection.inumbo.net>)
 id 1uAUlX-0007ss-4m
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 14:19:55 +0000
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com
 [2a00:1450:4864:20::349])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57719e8d-2697-11f0-9ffb-bf95429c2676;
 Thu, 01 May 2025 16:19:50 +0200 (CEST)
Received: by mail-wm1-x349.google.com with SMTP id
 5b1f17b1804b1-43d00017e9dso4366235e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 May 2025 07:19:50 -0700 (PDT)
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
X-Inumbo-ID: 57719e8d-2697-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746109189; x=1746713989; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TmEF1yP8U0niebBh9hfc5iyUEhI2jhPWqahRuFkaIQM=;
        b=p97jVs5M78NaXH/fKcYp1hHsNMMwzdQb+FmeejZH1I5gLAqho0p8VOM46kaPyiQhrC
         cTUT59aHIKES1kOp7QB92AtbP76CBQ7FsTxoaox5fv8+/S9DHcjTBqhfWpjo36Ibte/t
         XQuYiyw3Y2CFwj79rJO056sFUvLpBxdWtmc6kF0CDPXMSE08GRuHEHbNQE3j46Ju/4wh
         +V9ZleFGJcy7Y8BMHcWroMozxk+2mPuH1tVYu8memDqrIcquIe1pvhnUSA4W1S7uG1LZ
         wRDQ1LkpHkAPnKRPh8yPGo8hMqNqc2azGqMIUXSz7Jvv3ZB8Zwg9i84qsmQMm3ua2CN/
         V8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746109189; x=1746713989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmEF1yP8U0niebBh9hfc5iyUEhI2jhPWqahRuFkaIQM=;
        b=F1KZ3fpqvP45utk9HmtJN46h4yHexvbm+U1CmnoqdbK277+i9WIjsNag6WiU2mqGdK
         PtEERFA+2iFopeO+icPWSNZaMwPeT2co/8eDXnsxpegIKHU6LZGCNPKGKl3vnyVsRy1D
         WADxXmg3E2Rz8pL3GwljjRiMhfC2gwKzGhrHpkGPYP4q2agYTXCdLmwlELWkPGOv/IhT
         yYz8rIkUPtbu396YYluuRrPlzweTchCVS4esrI/DT7dWHIispvil2+O2kY/B9s2+bstF
         po0PcUsE1nH6WR7u1yO7iVsyyfDqV7yi6tEPCqyKoOOc8wmFOerDgrSpjL/VohV0t54U
         0h2w==
X-Forwarded-Encrypted: i=1; AJvYcCWdzpIsMjbGCFkUZv6EICiOvfJU3i0SN+viTSuSduzGwlKCr/Ro+GGcoBDHocHn/8ax/SlZeKYoJG4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynIpWPaB1FPXF6/sbky1wey8vbJVHw9JoWI8zpsbMA8qQjfKTo
	m/V88AGt/Q6EPvzWfK0bHU6uTvNgAbryiOXr8lyb9OneNritdZxq4mMXeqkwRqpVlY/kZ7WVGZm
	Ac+jk+djOKg==
X-Google-Smtp-Source: AGHT+IE4OWD5XxcERH4cgRX5gY9PM+u+mzYGVEd/YlTx4e+t3SrV5tDi5azUj0xMuNVR7NdRXpnF4uWQLtuxPQ==
X-Received: from wmbhe15.prod.google.com ([2002:a05:600c:540f:b0:441:b79a:76cf])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35d6:b0:43c:f8fc:f686 with SMTP id 5b1f17b1804b1-441b64ed9d8mr27510245e9.3.1746109189194;
 Thu, 01 May 2025 07:19:49 -0700 (PDT)
Date: Thu, 01 May 2025 14:19:47 +0000
In-Reply-To: <20250429123504.GA13093@lst.de>
Mime-Version: 1.0
References: <20250429-noautoinline-v3-0-4c49f28ea5b5@uniontech.com> <20250429123504.GA13093@lst.de>
X-Mailer: aerc 0.20.0
Message-ID: <D9KW1QQR88EY.2TOSTVYZZH5KN@google.com>
Subject: Re: [PATCH RFC v3 0/8] kernel-hacking: introduce CONFIG_NO_AUTO_INLINE
From: Brendan Jackman <jackmanb@google.com>
To: Christoph Hellwig <hch@lst.de>, <chenlinxuan@uniontech.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Sagi Grimberg <sagi@grimberg.me>, Andrew Morton <akpm@linux-foundation.org>, 
	Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Peter Huewe <peterhuewe@gmx.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, <linux-nvme@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <kvm@vger.kernel.org>, 
	<virtualization@lists.linux.dev>, <linux-integrity@vger.kernel.org>, 
	<linux-kbuild@vger.kernel.org>, <llvm@lists.linux.dev>, 
	Winston Wen <wentao@uniontech.com>, <kasan-dev@googlegroups.com>, 
	<xen-devel@lists.xenproject.org>, Changbin Du <changbin.du@intel.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue Apr 29, 2025 at 12:35 PM UTC, Christoph Hellwig wrote:
> On Tue, Apr 29, 2025 at 12:06:04PM +0800, Chen Linxuan via B4 Relay wrote:
>> This series introduces a new kernel configuration option NO_AUTO_INLINE,
>> which can be used to disable the automatic inlining of functions.
>> 
>> This will allow the function tracer to trace more functions
>> because it only traces functions that the compiler has not inlined.
>
> This still feels like a bad idea because it is extremely fragile.

Can you elaborate on that - does it introduce new fragility?

