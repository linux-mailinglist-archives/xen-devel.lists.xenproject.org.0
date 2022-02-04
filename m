Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712134A9AAF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 15:08:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265582.458987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzGM-0005Sb-Qr; Fri, 04 Feb 2022 14:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265582.458987; Fri, 04 Feb 2022 14:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzGM-0005Q8-Nc; Fri, 04 Feb 2022 14:08:34 +0000
Received: by outflank-mailman (input) for mailman id 265582;
 Fri, 04 Feb 2022 14:08:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJWP=ST=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1nFzGL-0005Q2-Rr
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 14:08:34 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eef1448c-85c3-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 15:08:32 +0100 (CET)
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
X-Inumbo-ID: eef1448c-85c3-11ec-8eb8-a37418f5ba1a
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643983711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SNX1Snmen8jqN1d+Tprj24WFL9DXT+zGfgm398dt/9w=;
	b=GYPJETjivlarCGcd2NnYBL7Qo+KgDYTTNSvwI8Mc1AAL1UNC05tUzwOPd4Dca3PH7Di3CN
	2be/kMF0G7ogbnKJJVYBeYAiapY3dWqqdJzCbleiRNmtIzVNS4jY4TH58gEjgXRVHgs6o8
	qYD9j8qmBFJD3HyGXIfzQXvRI9cayCrj/E8JrqgYoSmKm6+j+xWo6VMfPlPxZkhCCs3reh
	FYqq07Z0trOT7LskDGz2hgmGYJVMq8qMnQO+C/ft4SN5jaGtL1zaTlXKmEHPe8xAyBUSQb
	GBbZECGBb5a/duk5ARL46wCPe7MKtnxPpxThj5sD7RUAv/HhJtv/4f0EwF06Ug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643983711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SNX1Snmen8jqN1d+Tprj24WFL9DXT+zGfgm398dt/9w=;
	b=2ajljAVIRESQmw2ljEtocIHSocWU8lbZ+4yPSjAvTcvbOdhsdt5OzeN5xJE5SGqZhdMx5s
	FAowyc1MLHlkfYCA==
To: Jan Beulich <jbeulich@suse.com>, Ricardo Neri
 <ricardo.neri-calderon@linux.intel.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, the
 arch/x86 maintainers <x86@kernel.org>
Subject: Re: x86: insn-eval.c's use of native_store_gdt()
In-Reply-To: <68c4f398-0494-e272-47e0-6803b6865f15@suse.com>
References: <0d687d64-1cf0-8965-0569-bce27cf0a8b7@suse.com>
 <68c4f398-0494-e272-47e0-6803b6865f15@suse.com>
Date: Fri, 04 Feb 2022 15:08:30 +0100
Message-ID: <87fsoyd8rl.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Feb 04 2022 at 10:23, Jan Beulich wrote:
> On 30.11.2021 12:09, Jan Beulich wrote:
>> I think it is b968e84b509d ("x86/iopl: Fake iopl(3) CLI/STI usage")
>> which uncovered an issue with get_desc() trying to access the GDT, as
>> introduced by 670f928ba09b ("x86/insn-eval: Add utility function to
>> get segment descriptor"). When running in a PV domain under Xen, the
>> (hypervisor's) GDT isn't accessible; with UMIP enabled by Xen even
>> SGDT wouldn't work, as the kernel runs in ring 3.
>> 
>> There's currently no hypercall to retrieve a descriptor from the GDT.
>> It is instead assumed that kernels know where their present GDT
>> lives. Can the native_store_gdt() be replaced there, please?
>> 
>> For context (I don't think it should matter much here) I'm observing
>> this with the kernel put underneath a rather old distro, where
>> hwclock triggers this path.
>
> I'd like to note that the issue still exists in 5.16.

I'd like to note, that I've seen no patches to that effect.

Thanks,

        tglx

