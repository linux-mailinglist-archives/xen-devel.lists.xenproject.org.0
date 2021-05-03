Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087353720A9
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:42:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121872.229890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeRw-0000SA-Fi; Mon, 03 May 2021 19:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121872.229890; Mon, 03 May 2021 19:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeRw-0000Rl-CP; Mon, 03 May 2021 19:41:48 +0000
Received: by outflank-mailman (input) for mailman id 121872;
 Mon, 03 May 2021 19:41:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D+pa=J6=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1ldeRv-0000Rg-1z
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:41:47 +0000
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfdf417c-dd93-4ec6-bc85-65393b7babae;
 Mon, 03 May 2021 19:41:45 +0000 (UTC)
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
X-Inumbo-ID: cfdf417c-dd93-4ec6-bc85-65393b7babae
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1620070904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R89mha3W7dggNcHio8mKK09HcaBedKHLYwCG8+sIhQk=;
	b=baebpRmFzGasqi47KSv9CzosBnOiLYNu8TAQWs4HYL8bMXuO3WHl9PW+6B2wB2AHbx27rY
	oOoUfxBV37pDJYArt3WLnjTje5ja5x3UuYgZe+3XejjGC6KButNajyEr+v07Edoyiy3kHY
	c48uBhmkG0bWfoGuoCo8YiNsgbQDzNgJBfBp97ly7hDxC0o2vlwN5eDjufS0Kj2655+N9I
	1sRye9evLpVS4KWl2tnj1rrHO1TOMwMmvmTZSo/oiNE52v5yb9gRdFgMRILpKdoV9cp4oz
	YN6n4Am8JaNeey9jU2D5lUWhA6o6aTZm1mb5xm32PwtUdtQPjc9kG8iGX5ILXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1620070904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R89mha3W7dggNcHio8mKK09HcaBedKHLYwCG8+sIhQk=;
	b=VsoMRqDg8qyFRWUYjcU0Jkt5wjqQb3YctqCuac4VSxwB6NvvlM+s+7EveLibUxsYy8sW9y
	F+QEywnUKLPnq5CQ==
To: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <laijs@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Steven Rostedt <rostedt@goodmis.org>, Andi Kleen <ak@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Uros Bizjak <ubizjak@gmail.com>, Maxim Levitsky <mlevitsk@redhat.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Alexandre Chartre <alexandre.chartre@oracle.com>, Joerg Roedel <jroedel@suse.de>, Jian Cai <caij2003@gmail.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/4] x86/xen/entry: Rename xenpv_exc_nmi to noist_exc_nmi
In-Reply-To: <87r1ind4ee.ffs@nanos.tec.linutronix.de>
References: <20210426230949.3561-1-jiangshanlai@gmail.com> <20210426230949.3561-2-jiangshanlai@gmail.com> <87r1ind4ee.ffs@nanos.tec.linutronix.de>
Date: Mon, 03 May 2021 21:41:44 +0200
Message-ID: <87h7jjk3k7.ffs@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 03 2021 at 21:05, Thomas Gleixner wrote:

> On Tue, Apr 27 2021 at 07:09, Lai Jiangshan wrote:
>> From: Lai Jiangshan <laijs@linux.alibaba.com>
>>
>> There is no any functionality change intended.  Just rename it and
>> move it to arch/x86/kernel/nmi.c so that we can resue it later in
>> next patch for early NMI and kvm.
>
> 'Reuse it later' is not really a proper explanation why this change it
> necessary.
>
> Also this can be simplified by using aliasing which keeps the name
> spaces intact.

Aside of that this is not required to be part of a fixes series which
needs to be backported.

Thanks,

        tglx

