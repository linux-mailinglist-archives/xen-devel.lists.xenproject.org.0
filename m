Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DB86FB705
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 21:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531743.827504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6lg-0004In-4V; Mon, 08 May 2023 19:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531743.827504; Mon, 08 May 2023 19:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6lg-0004GP-1s; Mon, 08 May 2023 19:43:32 +0000
Received: by outflank-mailman (input) for mailman id 531743;
 Mon, 08 May 2023 19:43:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49Re=A5=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pw6le-0004GB-BE
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 19:43:30 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a860726-edd8-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 21:43:28 +0200 (CEST)
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
X-Inumbo-ID: 9a860726-edd8-11ed-b226-6b7b168915f2
Message-ID: <20230508181633.089804905@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=cSONB8rAwM/DhP8pLyA+5ZPUbC2lOuuQwaVdJRn5WDM=;
	b=TUKnHdyKCm2jhBxD5IlUGRPEG/QaxWUEEk5j+F5TiwGQh75MzfKnWvvga1ogV0FWpqsAk0
	Z/VqPwKzVgozvsmFgeZHc6fKtgAWVGs7xGme4vq54PLJoTakzMDfDNVCbcO2rny0q4HnR6
	qlFXb43Qt1L8lTxJDtVVOKBuzxeXABCLtAFoVNNIdEV1p8ow/ukbkpiR2uIVB/FYpjA6p3
	h6hKX4cZFsqIirm+tNd9G+ACRA1lcKi+gtx7U3umktHuz9juvrtG2mgbwLKrM2SK5QyvS3
	r9jvL2zUpq3y0guhjpTb2zQUgu9MH/0dN+oTlFfspWYXJjDrCu5rao9nchjzhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=cSONB8rAwM/DhP8pLyA+5ZPUbC2lOuuQwaVdJRn5WDM=;
	b=i5YP5va30wPZDaaNSG4+BZNoSkYS91jOjq0F96kx0dzX5lZgVd2tGOGcKaXMK8erIbX4td
	IGoM8wVZMNo8tHAg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: [patch v3 00/36] cpu/hotplug, x86: Reworked parallel CPU bringup
Date: Mon,  8 May 2023 21:43:26 +0200 (CEST)

Hi!

This is version 3 of the reworked parallel bringup series. Version 2 can be
found here:

   https://lore.kernel.org/lkml/20230504185733.126511787@linutronix.de

This is just a quick reiteration to address the following details:

  1) Drop the two extended topology leaf patches as they are not longer
     relevant (Andrew Cooper)

  2) Make the announce_cpu() fixup work for real (Micheal Kelley)

Other than that there are no changes and the other details are all the same
as in V2.

Thanks,

	tglx






