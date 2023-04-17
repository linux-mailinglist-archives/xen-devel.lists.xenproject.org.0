Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6458B6E4658
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 13:25:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522001.811088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMyO-0000cX-5J; Mon, 17 Apr 2023 11:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522001.811088; Mon, 17 Apr 2023 11:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMyO-0000aC-2R; Mon, 17 Apr 2023 11:24:40 +0000
Received: by outflank-mailman (input) for mailman id 522001;
 Mon, 17 Apr 2023 11:24:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owEo=AI=molgen.mpg.de=pmenzel@srs-se1.protection.inumbo.net>)
 id 1poMyM-0000a6-CA
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 11:24:38 +0000
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fb18bd7-dd12-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 13:24:37 +0200 (CEST)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id C7E5061CC40F9;
 Mon, 17 Apr 2023 13:24:36 +0200 (CEST)
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
X-Inumbo-ID: 6fb18bd7-dd12-11ed-b21e-6b7b168915f2
Message-ID: <a736cae5-8c05-ddda-a1b0-37c8afdbd6ea@molgen.mpg.de>
Date: Mon, 17 Apr 2023 13:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>, David Woodhouse
 <dwmw@amazon.co.uk>, Usama Arif <usama.arif@bytedance.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "James E. J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de>
In-Reply-To: <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[Correct David’s address]

Am 17.04.23 um 13:19 schrieb Paul Menzel:
> Dear Thomas,
> 
> 
> Am 15.04.23 um 01:44 schrieb Thomas Gleixner:
> 
>> This is a complete rework of the parallel bringup patch series (V17)
>>
>>      
>> https://lore.kernel.org/lkml/20230328195758.1049469-1-usama.arif@bytedance.com
>>
>> to address the issues which were discovered in review:
> 
> […]
> 
> Thank you very much for your rework.
> 
> I tested this on the ASUS F2A85-M PRO, and get a delay of ten seconds.
> 
> ```
> […]
> [    0.258193] smpboot: CPU0: AMD A6-6400K APU with Radeon(tm) HD 
> Graphics (family: 0x15, model: 0x13, stepping: 0x1)
> […]
> [    0.259329] smp: Bringing up secondary CPUs ...
> [    0.259527] x86: Booting SMP configuration:
> [    0.259528] .... node  #0, CPUs:      #1
> [    0.261007] After schedule_preempt_disabled
> [   10.260990] CPU1 failed to report alive state
> [   10.261070] smp: Brought up 1 node, 1 CPU
> [   10.261073] smpboot: Max logical packages: 2
> [   10.261074] smpboot: Total of 1 processors activated (7800.54 BogoMIPS)
> [   10.261601] devtmpfs: initialized
> [   10.261697] x86/mm: Memory block size: 128MB
> ```
> 
> This delay has been there with v6.3-rc6-46-gde4664485abbc and some 
> custom (printk) patches on top and merging dwmw2/parallel-6.2-rc3-v16 
> into it. I only tested this. I think dwmw2/parallel-6.2-v17 failed to 
> build for me, when trying to merge it into Linus’ master version at that 
> time. I didn’t come around to report it, and you posted your rework, so 
> I am replying here.
> 
> I am going to try your branch directly in the next days, but just wanted 
> to report back already.
> 
> 
> Kind regards,
> 
> Paul

