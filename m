Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19AAA476D2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 08:49:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897865.1306493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYde-0005gI-Gn; Thu, 27 Feb 2025 07:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897865.1306493; Thu, 27 Feb 2025 07:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnYde-0005eX-Dz; Thu, 27 Feb 2025 07:48:58 +0000
Received: by outflank-mailman (input) for mailman id 897865;
 Thu, 27 Feb 2025 07:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UvAR=VS=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1tnYdc-0005eR-VI
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 07:48:57 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b167c9b-f4df-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 08:48:55 +0100 (CET)
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
X-Inumbo-ID: 4b167c9b-f4df-11ef-9898-31a8f345e629
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740642533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z/FiwpGgcFsUVJIrAAggZ118vbyRdPHUpVwLgvzzG6g=;
	b=j1XjA1dW4vnGkpn5Ci9y75c6Hdtwk4+Ny32gBE+duhCt1GqH+SXgRR8OpfDqAuGbWuEt1h
	5EJbYwhnGxs5hjLOxbM+6Emv5CZEuK3td6X14YzCv3acdSA9qJBj39CKJLgzNXURkKDViy
	0iBhoMl/MyKy3kGACfuxeLZzn/9ezs2VF+nelJPTcZFERUxRkA/Z16PYeh4FqaYt+wCxMI
	aXjwKb4z5MkbSu3pyzx965lwDghTQomZT81AkpHNuj9pZSh7BpG6U82ffo9q/wb1pqAdJA
	tKWZyeKKyru4urnzo1wUAlcKzsUWT7XqFBVJHaYqHguCn3LQgZ2m5ojNvENTqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740642533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z/FiwpGgcFsUVJIrAAggZ118vbyRdPHUpVwLgvzzG6g=;
	b=8ISW4tf/hrqDpFSd37qm+hMBh7bnHgcoCCi0Z02YB2HvefWAxjbmeiVp57WxbL7NKjJPKI
	kpAAcrCDeSx49VDA==
To: Sean Christopherson <seanjc@google.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Juergen Gross <jgross@suse.com>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu
 <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Ajay Kaher
 <ajay.kaher@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, John Stultz
 <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
 kvm@vger.kernel.org, virtualization@lists.linux.dev,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, Tom Lendacky
 <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Subject: Re: [PATCH v2 24/38] timekeeping: Resume clocksources before
 reading persistent clock
In-Reply-To: <20250227021855.3257188-25-seanjc@google.com>
References: <20250227021855.3257188-1-seanjc@google.com>
 <20250227021855.3257188-25-seanjc@google.com>
Date: Thu, 27 Feb 2025 08:48:53 +0100
Message-ID: <87r03jeska.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Feb 26 2025 at 18:18, Sean Christopherson wrote:

> When resuming timekeeping after suspend, restore clocksources prior to
> reading the persistent clock.  Paravirt clocks, e.g. kvmclock, tie the
> validity of a PV persistent clock to a clocksource, i.e. reading the PV
> persistent clock will return garbage if the underlying PV clocksource
> hasn't been enabled.  The flaw has gone unnoticed because kvmclock is a
> mess and uses its own suspend/resume hooks instead of the clocksource
> suspend/resume hooks, which happens to work by sheer dumb luck (the
> kvmclock resume hook runs before timekeeping_resume()).
>
> Note, there is no evidence that any clocksource supported by the kernel
> depends on a persistent clock.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

