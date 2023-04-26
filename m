Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 211CB6EF00C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 10:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526551.818387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1praJe-0003nJ-2J; Wed, 26 Apr 2023 08:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526551.818387; Wed, 26 Apr 2023 08:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1praJd-0003kA-Ux; Wed, 26 Apr 2023 08:15:53 +0000
Received: by outflank-mailman (input) for mailman id 526551;
 Wed, 26 Apr 2023 08:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PyPi=AR=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1praJb-0003Sj-G4
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 08:15:51 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e0ed531-e40a-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 10:15:50 +0200 (CEST)
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
X-Inumbo-ID: 8e0ed531-e40a-11ed-b224-6b7b168915f2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1682496949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y7cSCpTFBU6gtNFDDvX9BBXJHGwRYvRyuVYMZSUvskg=;
	b=puMJndFvZk2DjG2oGhTaaANtFluqIT71fJ8veXKWgaKYEc7ZaIibudafgbLM64wYizw2Y+
	OXOoExk0mzZdwI+qZRCbqqN29gJr4bx9hGMM4FqEkCO4H6WN381K3f/yJnQUdMhiDoudkE
	v7q+YkKqQYiLDFXvBw9Q1TAKdQtU3EOXylf0wOjoPixyD8dhvyM5BYTWe0qo092Dn58dWD
	wK5mQfTO6pClT3oj6wx4w2PqZTUsjxsf5TLo5xJWNv/gc/U3RQVFJKGrWcJS7Q1p/NUtUU
	aUWCZ+sybUxpx87tAuGvu76aAkAfxwkf6VweEiexDbnjkrDzfgfAwBP2nQkz6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1682496949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y7cSCpTFBU6gtNFDDvX9BBXJHGwRYvRyuVYMZSUvskg=;
	b=4JTA5ZSC1xgsH2IPcOsiykb/g/HrD1bcjGUJcIN8iOa9ku/bVlaHwu78ldM0LGCo2BtXJa
	9xfjqD5Ed8VSHzCw==
To: Mark Rutland <mark.rutland@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, David Woodhouse <dwmw@amazon.co.uk>,
 Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>, Arnd
 Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 22/37] arm64: smp: Switch to hotplug core state
 synchronization
In-Reply-To: <ZEjZ3pHjQWn4drs8@FVFF77S0Q05N>
References: <20230414225551.858160935@linutronix.de>
 <20230414232310.569498144@linutronix.de> <ZD1q3TF2ixVD1f2M@FVFF77S0Q05N>
 <87ttx3zqof.ffs@tglx> <ZEjZ3pHjQWn4drs8@FVFF77S0Q05N>
Date: Wed, 26 Apr 2023 10:15:48 +0200
Message-ID: <87ildjys7f.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 26 2023 at 08:59, Mark Rutland wrote:
> On Tue, Apr 25, 2023 at 09:51:12PM +0200, Thomas Gleixner wrote:
>> If not then it's just yet another way of DoS which is an "acceptable"
>> attack as it only affects availability but not confidentiality.
>
> Sure.
>
> My thinking is that this is an attack against the *integrity* of the guest
> (since the vCPU that gets unpasued may write to memory), and so it's
> potentially more than just a DoS.
>
> I only mention this because I'd like to account for that on arm64, and if other
> architectures also wanted to handle that it might make sense to have some
> common infrastructure to track whether CPUs are potentially still within the
> kernel.

Fair enough.

