Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D06C1A2207
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 14:28:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM9oS-0001CM-RF; Wed, 08 Apr 2020 12:28:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D8Jc=5Y=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jM9oR-0001Bc-SL
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 12:28:11 +0000
X-Inumbo-ID: 67d6e8c0-7994-11ea-81db-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67d6e8c0-7994-11ea-81db-12813bfff9fa;
 Wed, 08 Apr 2020 12:28:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 66C7CAC44;
 Wed,  8 Apr 2020 12:28:07 +0000 (UTC)
Subject: Re: [RFC PATCH 00/26] Runtime paravirt patching
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d7f8bff3-526a-6a84-2e81-677cfbac0111@suse.com>
Date: Wed, 8 Apr 2020 14:28:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200408050323.4237-1-ankur.a.arora@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, kvm@vger.kernel.org, peterz@infradead.org,
 hpa@zytor.com, virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 bp@alien8.de, mhiramat@kernel.org, jpoimboe@redhat.com,
 mihai.carabas@oracle.com, namit@vmware.com, vkuznets@redhat.com,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.04.20 07:02, Ankur Arora wrote:
> A KVM host (or another hypervisor) might advertise paravirtualized
> features and optimization hints (ex KVM_HINTS_REALTIME) which might
> become stale over the lifetime of the guest. For instance, the

Then this hint is wrong if it can't be guaranteed.

> host might go from being undersubscribed to being oversubscribed
> (or the other way round) and it would make sense for the guest
> switch pv-ops based on that.

I think using pvops for such a feature change is just wrong.

What comes next? Using pvops for being able to migrate a guest from an
Intel to an AMD machine?

...

> There are four main sets of patches in this series:
> 
>   1. PV-ops management (patches 1-10, 20): mostly infrastructure and
>   refactoring pieces to make paravirt patching usable at runtime. For the
>   most part scoped under CONFIG_PARAVIRT_RUNTIME.
> 
>   Patches 1-7, to persist part of parainstructions in memory:
>    "x86/paravirt: Specify subsection in PVOP macros"
>    "x86/paravirt: Allow paravirt patching post-init"
>    "x86/paravirt: PVRTOP macros for PARAVIRT_RUNTIME"
>    "x86/alternatives: Refactor alternatives_smp_module*
>    "x86/alternatives: Rename alternatives_smp*, smp_alt_module
>    "x86/alternatives: Remove stale symbols
>    "x86/paravirt: Persist .parainstructions.runtime"
> 
>   Patches 8-10, develop the inerfaces to safely switch pv-ops:
>    "x86/paravirt: Stash native pv-ops"
>    "x86/paravirt: Add runtime_patch()"
>    "x86/paravirt: Add primitives to stage pv-ops"
> 
>   Patch 20 enables switching of pv_lock_ops:
>    "x86/paravirt: Enable pv-spinlocks in runtime_patch()"
> 
>   2. Non-emulated text poking (patches 11-19)
> 
>   Patches 11-13 are mostly refactoring to split __text_poke() into map,
>   unmap and poke/memcpy phases with the poke portion being re-entrant
>    "x86/alternatives: Remove return value of text_poke*()"
>    "x86/alternatives: Use __get_unlocked_pte() in text_poke()"
>    "x86/alternatives: Split __text_poke()"
> 
>   Patches 15, 17 add the actual poking state-machine:
>    "x86/alternatives: Non-emulated text poking"
>    "x86/alternatives: Add patching logic in text_poke_site()"
> 
>   with patches 14 and 18 containing the pieces for BP handling:
>    "x86/alternatives: Handle native insns in text_poke_loc*()"
>    "x86/alternatives: Handle BP in non-emulated text poking"
> 
>   and patch 19 provides the ability to use the state-machine above in an
>   NMI context (fixes some potential deadlocks when handling inter-
>   dependent operations and multiple NMIs):
>    "x86/alternatives: NMI safe runtime patching".
> 
>   Patch 16 provides the interface (paravirt_runtime_patch()) to use the
>   poking mechanism developed above and patch 21 adds a selftest:
>    "x86/alternatives: Add paravirt patching at runtime"
>    "x86/alternatives: Paravirt runtime selftest"
> 
>   3. KVM guest changes to be able to use this (patches 22-23,25-26):
>    "kvm/paravirt: Encapsulate KVM pv switching logic"
>    "x86/kvm: Add worker to trigger runtime patching"
>    "x86/kvm: Guest support for dynamic hints"
>    "x86/kvm: Add hint change notifier for KVM_HINT_REALTIME".
> 
>   4. KVM host changes to notify the guest of a change (patch 24):
>    "x86/kvm: Support dynamic CPUID hints"
> 
> Testing:
> With paravirt patching, the code is mostly stable on Intel and AMD
> systems under kernbench and locktorture with paravirt toggling (with,
> without synthetic NMIs) in the background.
> 
> Queued spinlock performance for locktorture is also on expected lines:
>   [ 1533.221563] Writes:  Total: 1048759000  Max/Min: 0/0   Fail: 0
>   # toggle PV spinlocks
> 
>   [ 1594.713699] Writes:  Total: 1111660545  Max/Min: 0/0   Fail: 0
>   # PV spinlocks (in ~60 seconds) = 62,901,545
> 
>   # toggle native spinlocks
>   [ 1656.117175] Writes:  Total: 1113888840  Max/Min: 0/0   Fail: 0
>    # native spinlocks (in ~60 seconds) = 2,228,295
> 
> The alternatives testing is more limited with it being used to rewrite
> mostly harmless X86_FEATUREs with load in the background.
> 
> Patches also at:
> 
> ssh://git@github.com/terminus/linux.git alternatives-rfc-upstream-v1
> 
> Please review.
> 
> Thanks
> Ankur
> 
> [1] The precise change in memory footprint depends on config options
> but the following example inlines queued_spin_unlock() (which forms
> the bulk of the added state). The added footprint is the size of the
> .parainstructions.runtime section:
> 
>   $ objdump -h vmlinux|grep .parainstructions
>   Idx Name              		Size      VMA
>   	LMA                File-off  Algn
>    27 .parainstructions 		0001013c  ffffffff82895000
>    	0000000002895000   01c95000  2**3
>    28 .parainstructions.runtime  0000cd2c  ffffffff828a5140
>    	00000000028a5140   01ca5140  2**3
> 
>    $ size vmlinux
>    text       data       bss        dec      hex       filename
>    13726196   12302814   14094336   40123346 2643bd2   vmlinux
> 
> Ankur Arora (26):
>    x86/paravirt: Specify subsection in PVOP macros
>    x86/paravirt: Allow paravirt patching post-init
>    x86/paravirt: PVRTOP macros for PARAVIRT_RUNTIME
>    x86/alternatives: Refactor alternatives_smp_module*
>    x86/alternatives: Rename alternatives_smp*, smp_alt_module
>    x86/alternatives: Remove stale symbols
>    x86/paravirt: Persist .parainstructions.runtime
>    x86/paravirt: Stash native pv-ops
>    x86/paravirt: Add runtime_patch()
>    x86/paravirt: Add primitives to stage pv-ops
>    x86/alternatives: Remove return value of text_poke*()
>    x86/alternatives: Use __get_unlocked_pte() in text_poke()
>    x86/alternatives: Split __text_poke()
>    x86/alternatives: Handle native insns in text_poke_loc*()
>    x86/alternatives: Non-emulated text poking
>    x86/alternatives: Add paravirt patching at runtime
>    x86/alternatives: Add patching logic in text_poke_site()
>    x86/alternatives: Handle BP in non-emulated text poking
>    x86/alternatives: NMI safe runtime patching
>    x86/paravirt: Enable pv-spinlocks in runtime_patch()
>    x86/alternatives: Paravirt runtime selftest
>    kvm/paravirt: Encapsulate KVM pv switching logic
>    x86/kvm: Add worker to trigger runtime patching
>    x86/kvm: Support dynamic CPUID hints
>    x86/kvm: Guest support for dynamic hints
>    x86/kvm: Add hint change notifier for KVM_HINT_REALTIME
> 
>   Documentation/virt/kvm/api.rst        |  17 +
>   Documentation/virt/kvm/cpuid.rst      |   9 +-
>   arch/x86/Kconfig                      |  14 +
>   arch/x86/Kconfig.debug                |  13 +
>   arch/x86/entry/entry_64.S             |   5 +
>   arch/x86/include/asm/alternative.h    |  20 +-
>   arch/x86/include/asm/kvm_host.h       |   6 +
>   arch/x86/include/asm/kvm_para.h       |  17 +
>   arch/x86/include/asm/paravirt.h       |  10 +-
>   arch/x86/include/asm/paravirt_types.h | 230 ++++--
>   arch/x86/include/asm/text-patching.h  |  18 +-
>   arch/x86/include/uapi/asm/kvm_para.h  |   2 +
>   arch/x86/kernel/Makefile              |   1 +
>   arch/x86/kernel/alternative.c         | 987 +++++++++++++++++++++++---
>   arch/x86/kernel/kvm.c                 | 191 ++++-
>   arch/x86/kernel/module.c              |  42 +-
>   arch/x86/kernel/paravirt.c            |  16 +-
>   arch/x86/kernel/paravirt_patch.c      |  61 ++
>   arch/x86/kernel/pv_selftest.c         | 264 +++++++
>   arch/x86/kernel/pv_selftest.h         |  15 +
>   arch/x86/kernel/setup.c               |   2 +
>   arch/x86/kernel/vmlinux.lds.S         |  16 +
>   arch/x86/kvm/cpuid.c                  |   3 +-
>   arch/x86/kvm/x86.c                    |  39 +
>   include/asm-generic/kvm_para.h        |  12 +
>   include/asm-generic/vmlinux.lds.h     |   8 +
>   include/linux/kvm_para.h              |   5 +
>   include/linux/mm.h                    |  16 +-
>   include/linux/preempt.h               |  17 +
>   include/uapi/linux/kvm.h              |   4 +
>   kernel/locking/lock_events.c          |   2 +-
>   mm/memory.c                           |   9 +-
>   32 files changed, 1850 insertions(+), 221 deletions(-)
>   create mode 100644 arch/x86/kernel/pv_selftest.c
>   create mode 100644 arch/x86/kernel/pv_selftest.h
> 

Quite a lot of code churn and hacks for a problem which should not
occur on a well administrated machine.

Especially the NMI dependencies make me not wanting to Ack this series.


Juergen

