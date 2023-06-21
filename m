Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2081738C4A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 18:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553025.863341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC12o-0003xd-BK; Wed, 21 Jun 2023 16:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553025.863341; Wed, 21 Jun 2023 16:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC12o-0003uo-86; Wed, 21 Jun 2023 16:50:58 +0000
Received: by outflank-mailman (input) for mailman id 553025;
 Wed, 21 Jun 2023 16:50:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KpsQ=CJ=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 1qC12n-0003ug-1z
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 16:50:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9b2a015-1053-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 18:50:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D3C6615DD;
 Wed, 21 Jun 2023 16:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96030C433C8;
 Wed, 21 Jun 2023 16:50:53 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 241B6CE3A04; Wed, 21 Jun 2023 09:50:53 -0700 (PDT)
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
X-Inumbo-ID: c9b2a015-1053-11ee-b236-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687366253;
	bh=nRDgHtA8hqej023ToUhLoZFNoVkS+qHIHVfPG/sX2HM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ZyW7hIwOiMuVBWbNLKkUGG4I9ld9sU+55M4ZDtjpb54AQkZkjrW2BAQpUQDsBScUV
	 3PuViCowDv3Bh65idoeIVGTOkyHEoIL1b2dC7j3xNY75mpWFddVIKrc+1BtooEGsEG
	 e/W29ML5aWligBRBGCkUt8zz0q42K8B1DFB8acM9a3AodCf3X2UrAc7M5tj+QzaIJ3
	 BNU9X9pGdKljGOCb/rjllAVrKb5Q0YONOpcuvdetSA7nDoLJjqbTznsYdA3e/pOQr+
	 ICEH22H0gKf07QhrEh2lPU2+jAbQ9m6lwbXYETYMIVq5QZlLXIOlJBhglEsFLf9vur
	 hkWXTdIwRXM4w==
Date: Wed, 21 Jun 2023 09:50:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Usama Arif <usama.arif@bytedance.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 05/37] x86/topology: Remove CPU0 hotplug option
Message-ID: <b487a394-0a70-4ec9-ac43-0e8fb14ad110@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230414225551.858160935@linutronix.de>
 <20230414232309.510911744@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414232309.510911744@linutronix.de>

On Sat, Apr 15, 2023 at 01:44:21AM +0200, Thomas Gleixner wrote:
> This was introduced together with commit e1c467e69040 ("x86, hotplug: Wake
> up CPU0 via NMI instead of INIT, SIPI, SIPI") to eventually support
> physical hotplug of CPU0:
> 
>  "We'll change this code in the future to wake up hard offlined CPU0 if
>   real platform and request are available."
> 
> 11 years later this has not happened and physical hotplug is not officially
> supported. Remove the cruft.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |   14 ---
>  Documentation/core-api/cpu_hotplug.rst          |   13 ---
>  arch/x86/Kconfig                                |   43 ----------
>  arch/x86/include/asm/cpu.h                      |    3 
>  arch/x86/kernel/topology.c                      |   98 ------------------------
>  arch/x86/power/cpu.c                            |   37 ---------
>  6 files changed, 6 insertions(+), 202 deletions(-)

[ . . . ]

> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2294,49 +2294,6 @@ config HOTPLUG_CPU
>  	def_bool y
>  	depends on SMP
>  
> -config BOOTPARAM_HOTPLUG_CPU0

Removing this requires also removing its use in rcutorture.

I have therefore queued the commit below in -rcu, but please feel
free to take it along with the BOOTPARAM_HOTPLUG_CPU0-removal patch.
Just please let me know if you do.

(Yes, I finally got back to testing -next.  Why do you ask?)

							Thanx, Paul

------------------------------------------------------------------------

commit 95588de780c0e81004b72526aa3e3ef5ce054719
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Wed Jun 21 09:44:52 2023 -0700

    rcutorture: Remove obsolete BOOTPARAM_HOTPLUG_CPU0 Kconfig option
    
    Now that the BOOTPARAM_HOTPLUG_CPU0 Kconfig option is in the process of
    being removed, it is time to remove rcutorture's use of it.
    
    Link: https://lore.kernel.org/lkml/20230414232309.510911744@linutronix.de/
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Cc: <x86@kernel.org>

diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TREE01 b/tools/testing/selftests/rcutorture/configs/rcu/TREE01
index 04831ef1f9b5..8ae41d5f81a3 100644
--- a/tools/testing/selftests/rcutorture/configs/rcu/TREE01
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TREE01
@@ -15,4 +15,3 @@ CONFIG_DEBUG_LOCK_ALLOC=n
 CONFIG_RCU_BOOST=n
 CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
 CONFIG_RCU_EXPERT=y
-CONFIG_BOOTPARAM_HOTPLUG_CPU0=y

