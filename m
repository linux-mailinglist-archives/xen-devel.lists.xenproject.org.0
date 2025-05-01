Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44620AA60AF
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 17:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974214.1362135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAVka-0002cv-JJ; Thu, 01 May 2025 15:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974214.1362135; Thu, 01 May 2025 15:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAVka-0002as-Gk; Thu, 01 May 2025 15:23:00 +0000
Received: by outflank-mailman (input) for mailman id 974214;
 Thu, 01 May 2025 15:22:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sw/S=XR=flex--jackmanb.bounces.google.com=30JETaAgKCYkwnpxzn0ot11tyr.p1zAr0-qr8ryyv565.Ar0241wrp6.14t@srs-se1.protection.inumbo.net>)
 id 1uAVkZ-0002aj-7l
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 15:22:59 +0000
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com
 [2a00:1450:4864:20::349])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2919b1ea-26a0-11f0-9eb4-5ba50f476ded;
 Thu, 01 May 2025 17:22:57 +0200 (CEST)
Received: by mail-wm1-x349.google.com with SMTP id
 5b1f17b1804b1-43d734da1a3so4127795e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 May 2025 08:22:57 -0700 (PDT)
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
X-Inumbo-ID: 2919b1ea-26a0-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746112977; x=1746717777; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wm8HDKzWcPs/ZOJ7u1MGp3oUtkY4RQR0TPLRQCBj5DQ=;
        b=yrI6apzXc9Erfcp4hcfv8/Z7jIep8cZyydUuhap1r/uiQIgb1WVfoM1wb83jj/7qSY
         7wZIWjdXpjX03PnjDghzaNdtnI+3yslVJtsjkfeSjg1hVz9Jf7aWN7nyiW99c5cCYDlq
         zsP+ex1KKXZErr03M4BOoCGJePWMjphAPdm5i/XnFtZe+SSxWTWeJEeB935YBshkt572
         +TLDd1X5nokx+zRXuLc9PlSQqgP7CSXm+lKFRNcdxfxT7P3f9XIHShSULnY8TQiucSO4
         S85TktLcoBNkHmsSx6x0DbWTYuJI5NtYDPR2H2DJTuCK+cHqYeJOIwT1+iewH1ErkwPb
         DLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112977; x=1746717777;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wm8HDKzWcPs/ZOJ7u1MGp3oUtkY4RQR0TPLRQCBj5DQ=;
        b=VFL5MdUHvXmEOUzcirdmCFeN8gO7tb9iWKRPAM3I9DbSeUvy41j2okQdCVTtqtvvyK
         0v+XUWJ5yA1AmQ4BcVRhOMu2YHmwRjR/3FgNHlYK6neit8VnjOMqOK86ANh3m+oa/Sir
         ZTg6Vi4A8Ez9RaRVrBQw0NpF7/jyZrGhap0MpFmmleTIaosV4uIEbajMXZRNDYK2tJnc
         8Xx0OWmEXgx+6+pwAlYg7yTkXIGjxRW7SvWjkdZQ3xVHtQHzN7owmBAs/XJfEBJijH+I
         GlSrQbTDroJCuTOzc95Qnuvi8wv/2cHREaI/v5YRE2iBVmZZWmHxKM50x/AK9E5oNj0+
         KMmw==
X-Forwarded-Encrypted: i=1; AJvYcCWQELrQSTC4tngtMg1y7oyZurNe+Jt1QUfObZbxu7ur7nq1yHJW/8KjodpSvcMzggLqJ2NOSpvEJBo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzhLGPLdysGzyJ+vJTfejq8KP2L1mCdBVJ/E4Q781nCfhynHS+
	+jacDOFLwHIBDzYgLTkEQ6v2f0mobrine5dAX6B/uTt16CDbzbiGxzP+ZwqiIN4luIH+esrBin/
	SmHZ+xw6nmA==
X-Google-Smtp-Source: AGHT+IG1H8EWFmTdy9mXUfcCJxQBprr6abVa1X9treBvRrD020Cub+yFF9voa0K8UUVl5WCrL4gH+SDc7+SKLQ==
X-Received: from wmbel14.prod.google.com ([2002:a05:600c:3e0e:b0:440:5f8a:667c])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ec6:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-441b2635482mr61130455e9.6.1746112976936;
 Thu, 01 May 2025 08:22:56 -0700 (PDT)
Date: Thu, 01 May 2025 15:22:55 +0000
In-Reply-To: <20250501150229.GU4439@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20250429-noautoinline-v3-0-4c49f28ea5b5@uniontech.com>
 <20250429123504.GA13093@lst.de> <D9KW1QQR88EY.2TOSTVYZZH5KN@google.com> <20250501150229.GU4439@noisy.programming.kicks-ass.net>
X-Mailer: aerc 0.20.0
Message-ID: <D9KXE2YX8R2M.3L7Q6NVIXKPE9@google.com>
Subject: Re: [PATCH RFC v3 0/8] kernel-hacking: introduce CONFIG_NO_AUTO_INLINE
From: Brendan Jackman <jackmanb@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, <chenlinxuan@uniontech.com>, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>, 
	Andrew Morton <akpm@linux-foundation.org>, Yishai Hadas <yishaih@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex.williamson@redhat.com>, 
	Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, <linux-nvme@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <kvm@vger.kernel.org>, 
	<virtualization@lists.linux.dev>, <linux-integrity@vger.kernel.org>, 
	<linux-kbuild@vger.kernel.org>, <llvm@lists.linux.dev>, 
	Winston Wen <wentao@uniontech.com>, <kasan-dev@googlegroups.com>, 
	<xen-devel@lists.xenproject.org>, Changbin Du <changbin.du@intel.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu May 1, 2025 at 3:02 PM UTC, Peter Zijlstra wrote:
> On Thu, May 01, 2025 at 02:19:47PM +0000, Brendan Jackman wrote:
>> On Tue Apr 29, 2025 at 12:35 PM UTC, Christoph Hellwig wrote:
>> > On Tue, Apr 29, 2025 at 12:06:04PM +0800, Chen Linxuan via B4 Relay wrote:
>> >> This series introduces a new kernel configuration option NO_AUTO_INLINE,
>> >> which can be used to disable the automatic inlining of functions.
>> >> 
>> >> This will allow the function tracer to trace more functions
>> >> because it only traces functions that the compiler has not inlined.
>> >
>> > This still feels like a bad idea because it is extremely fragile.
>> 
>> Can you elaborate on that - does it introduce new fragility?
>
> given it needs to sprinkle __always_inline around where it wasn't needed
> before, yeah.

Right, I guess I just wouldn't have associated that with the word
"fragility", but that's a reasonable complaint!

> Also, why would you want this? function tracer is already too much
> output. Why would you want even more?

Yes, tracing every function is already too noisy, this would make it
even more too-noisy, not sure "too noisy" -> "way too noisy" is a
particularly meaningful degradation.

Whereas enlarging the pool of functions that you can _optionally target_
for tracing, or nice reliable breakpoints in GDB, and disasm that's
easier to mentally map back to C, seems like a helpful improvement for
test builds. Personally I sometimes spam a bunch of `noinline` into code
I'm debugging so this seems like a way to just slap that same thing on
the whole tree without dirtying the code, right?

Not that I have a strong opinion on the cost/benefit here, but the
benefit seems nonzero to me.

