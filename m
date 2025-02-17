Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F14CA38E75
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 23:04:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890912.1300035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk9Ch-0002d3-17; Mon, 17 Feb 2025 22:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890912.1300035; Mon, 17 Feb 2025 22:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk9Cg-0002bb-Um; Mon, 17 Feb 2025 22:03:02 +0000
Received: by outflank-mailman (input) for mailman id 890912;
 Mon, 17 Feb 2025 22:03:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sEzH=VI=gmail.com=woods.greg.a@srs-se1.protection.inumbo.net>)
 id 1tk9Cf-0002bU-Og
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 22:03:01 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f239d288-ed7a-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 23:02:58 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-220dc3831e3so68402245ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 14:02:58 -0800 (PST)
Received: from smtpclient.apple ([2001:569:fd37:7700:507b:779a:938e:9dfb])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-adb5861860dsm6734972a12.40.2025.02.17.14.02.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Feb 2025 14:02:56 -0800 (PST)
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
X-Inumbo-ID: f239d288-ed7a-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739829777; x=1740434577; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfBKT09mFgaDbEYWCo2PQAlFRzZyVoi0HDc5llL+JF4=;
        b=KxYN1kpSCt7TsoXLnJ+SkacxMJ1WmzIBctCGnehmepq8rP8cQ+nFRgxjntuWKGaHIq
         83VEL2eW8Pb8B7czqQz7pK5QbYVcMXgxakcuZ8MKTSIl2ETWEnCFF9hqRvAIFToSsgmO
         xcTPE9OKJt51UGcvdqdK/qGXoCjfl3hX0nkuSy0zNrMav5uPEcJNKajgARQmEx+MhEYO
         OP2Uu5/QzEG8wOX9b+6+EwKA3A0nqaVfho8l4Kl/Ynw9Lsa4cjFaiT/X5go3I6z3raGu
         EkgelQlad6SSlnEqOq9PIl/k1DdSl9Qy8uPyY9+QZiyOSttlXoTJh2gM7LuJllc5FFf6
         t5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739829777; x=1740434577;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfBKT09mFgaDbEYWCo2PQAlFRzZyVoi0HDc5llL+JF4=;
        b=bn4f3ZceaYaML4wxz57lI32DqE/9Md7DzAk8LbI4bO0jJ0Ye1Xhb5RuMmZ9hN967Yx
         4ZNj5uoC04n0nMmeK2pnGsI3Nm8JJ+osRQJneLWys9I7cA7ylRrOtzBIwBRdM4mOPlds
         yqh6inVXHdKgBcdkLcDe1XRAaBlumZfreOxexDHpPkrGWPrz+3o2hWRBLH4sRgmwuYkw
         IEBsw6A5EvtOB6XuuMkC2mvEH9sEL78oEXz2YXjm9qG3Dh22PDTZu0nOaTiTAeW9SgX1
         g1ZxkFl7LfVXCGN2lnJsOVlUevejoiaEJVkOw46mko4mXeLCX6+46ua4IhIl3aI7yCAP
         ebEg==
X-Gm-Message-State: AOJu0YzCB9VRgbvrXrMc8S0BC+N5ZWCKFDO+l7tUD8VBby9nudqkp4Nk
	CGBhlu2sgIjMOfqaYQtEcQMXxSYUyuHs3DZ8wrEaFzVrwOVeroji
X-Gm-Gg: ASbGncsolw91D/aIpgRLtiJeCi+Vm66q/K62dbX4lfkaiGql+dl3qlzQ729a2qs7jit
	mXPuCMak/YSUAeGodXGCBFpwdrjbDJEewVjezwDsIbBVZOp3CKvJ+fhRRw2VeFCu+hFhIpVbsye
	+D9KnXEWov0nfUiK7XrCa2g0iot7Q3Y71g3WsCZe/iNxQfBFQSAJQFZ9+X8hthoLXlufoXFX7nm
	5T7VOZFoMxaJ5VDF8wTnRlCSOqk0e8g7mOYMR9lXC9tGl05+pindUKUIms5JAZiRWRzFy6+Jyei
	MntLsMCLeTUctYUgDXKFwBjiHEtj3wL2ufuINaWMYunC1g==
X-Google-Smtp-Source: AGHT+IEYAY2LcSJrtq7mbsOqRzhN4geZzjpq9Pl/RViHNokGThy83Kf0Rwr5aBcjJTS02n3LX7hL5g==
X-Received: by 2002:a05:6a20:7f90:b0:1ee:5f21:6720 with SMTP id adf61e73a8af0-1ee6c6adb1fmr27898268637.16.1739829776908;
        Mon, 17 Feb 2025 14:02:56 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: early crash while loading dom0 kernel between git:19730dbb3f and
 git:414dde38b0
From: "Greg A. Woods" <woods.greg.a@gmail.com>
In-Reply-To: <4be50b34-f4bf-46fd-b851-53db26272877@suse.com>
Date: Mon, 17 Feb 2025 14:02:45 -0800
Cc: xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BB0FB055-42C1-4181-90C7-012A02387595@gmail.com>
References: <6CBF18F6-8AF8-4A22-A4EC-0D7F382FA815@gmail.com>
 <4be50b34-f4bf-46fd-b851-53db26272877@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

A quick reply, maybe more later...

I thought I had done a fresh clean build as I ran "gmake clean" in the =
top
level directory, however then when reading your's and Andrew's replies I
realized I have been doing the Xen kernel build in a separate build =
directory,
which the top-level makefile won't know about.  (I never build in the =
source
tree of anything if at all possible.)

So I cleaned everything out and started again, and voila!  It works!

This is definitely annoying, but not a deal breaker!

Note again my local patches do not change any actual code in the xen =
subdir.

The "has no endbr64" messages are possibly due to the fact that I'm =
still
using GCC-9.x on NetBSD, and as I understand it that compiler is too old
to support ENDBR instructions.  I disabled the related build-time tests.
I can build with GCC-10.5 on another host and try that too.

BTW, there is also another regression (since 4.13, I think) on some =
hardware
that I've been trying to gather more data on, thus my testing from git.  =
That
is that on two of my older machines both the dom0 and domUs (running =
NetBSD
and FreeBSD) lose track of time after about 7.5 days.  The same code on =
a
slightly newer server runs reliably with accurate time.  Others using =
NetBSD
on Xen have reported similar problems.  Some claim running with 1 vCPU =
avoids
the problem.  I'm guessing something in the Xen kernel loses track of =
TSC
scaling when running on some CPUs.  This has been discussed in the =
port-xen
list for the past few months:  https://mail-index.netbsd.org/port-xen/=20=


--=20
Greg A. Woods
<woods.greg.a@gmail.com>
+1 250 762-7675 <woods@robohack.ca>



> On Feb 17, 2025, at 00:23, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 17.02.2025 00:09, Greg A. Woods wrote:
>> I had been testing 4.20-rc (at git:19730dbb3f) relatively =
successfully
>> on a older Dell PE-2950 server.
>>=20
>> Today I tried upgrading to git:414dde38b0 and I encountered the
>> following highly repeatable crash on first boot.  (note the git =
commit
>> shown in the log is from my(robohack) local NetBSD patches on GitHub,
>> none of which are in the Xen kernel itself -- just tools)
>=20
> That's a relatively large range, yet at the same time ...
>=20
>> The offending address ([<ffff82d040201015>] R _stextentry+0x15/0x165)
>> seems to be found here (according to "objdump -S xen-syms"):
>>=20
>> ffff82d040201000 <restore_all_guest>:
>>=20
>>        .section .text.entry, "ax", @progbits
>>=20
>> /* %rbx: struct vcpu, interrupts disabled */
>> FUNC_LOCAL(restore_all_guest)
>>        ASSERT_INTERRUPTS_DISABLED
>> ffff82d040201000:       9c                      pushfq
>> ffff82d040201001:       f6 44 24 01 02          testb  $0x2,0x1(%rsp)
>> ffff82d040201006:       74 02                   je     =
ffff82d04020100a <restore_all_guest+
>> 0xa>
>> ffff82d040201008:       0f 0b                   ud2
>> ffff82d04020100a:       48 83 c4 08             add    $0x8,%rsp
>>=20
>>        /* Stash guest SPEC_CTRL value while we can read struct vcpu. =
*/
>>        mov VCPU_arch_msrs(%rbx), %rdx
>> ffff82d04020100e:       48 8b 93 68 0d 00 00    mov    =
0xd68(%rbx),%rdx
>>        mov VCPUMSR_spec_ctrl_raw(%rdx), %r15d
>> ffff82d040201015:       44 8b 3a                mov    (%rdx),%r15d
>>=20
>>=20
>> If I'm not mistaken this is from xen/arch/x86/x86_64/entry.S.  I =
don't
>> see any recent changes there though, so I'm not sure where to go from
>> here.  Did something deeper in struct vcpu change?
>=20
> ..., as you say, nothing in that range looks like it might be related =
to
> your observation. Hence what comes to mind are
> - memory corruption, which simply started surfacing as a result of
>  unrelated changes,
> - a build issue - did you do a fresh, clean build, or an incremental
>  one?
> In any event it may be helpful to bi-sect the issue, so we know more
> precisely with what change the issue started surfacing.
>=20
> Since you say you have local patches on top, is it reasonably certain
> the cause isn't there? Can you repro without those patches?
>=20
>> Start @ 0x200000 [1=3D0x619000-0x6190ec]...
>> Xen 4.20-rc
>> (XEN) [000000341c1f78e9] Xen version 4.20-rc (woods@.local) (gcc (nb1 =
20200907) 9.3.0) debug=3Dy Sun Feb 16 13:33:02 PST 2025
>> (XEN) [000000341e299905] Latest ChangeSet: Wed Jan 29 13:29:16 2025 =
-0800 git:72eea1d3cb-dirty
>> (XEN) [000000341fba9b9d] build-id: =
0e6a2491c4ad94bdf27ff33fcefc31b5a8b61784
>> (XEN) [0000003420fc47e1] CPU Vendor: Intel, Family 6 (0x6), Model 23 =
(0x17), Stepping 6 (raw 00010676)
>> (XEN) [0000003422aea44d] BSP microcode revision: 0x0000060f
>> (XEN) [0000003423ad77fc] Bootloader: NetBSD/x86 BIOS Boot, Revision =
5.11 (Sun Dec  8 23:54:34 UTC 2024) (from NetBSD 9.99.81)
>> (XEN) [0000003425c00815] Command line: loglvl=3Dall bootscrub=3Dfalse =
dom0=3Dpv,verbose=3D1 dom0_mem=3D20G console=3Dcom1,vga =
console_timestamps=3Ddatems dom0_max_vcpus=3D8 dom0_vcpus_pin=3Dtrue =
guest_loglvl=3Dall pv-l1tf=3Doff,domu=3Doff cpuid=3Drdrand vpmu=3Don,ipc =
spec-ctrl=3Dno
>> [...]
>> (XEN) [    1.045341] alt table ffff82d0404bc3b8 -> ffff82d0404cf9be
>> (XEN) [    1.051374] altcall mc_memerr_dhandler+0x31/0x3b0 dest =
arch/x86/cpu/mcheck/mce_intel.c#intel_checkaddr has no endbr64
>> (XEN) [    1.062466] altcall do_machine_check+0x21/0x40 dest =
mcheck_cmn_handler has no endbr64
>> (XEN) [    1.070787] altcall mcheck_mca_logout+0x446/0x770 dest =
arch/x86/cpu/mcheck/mce_intel.c#intel_need_clearbank_scan has no endbr64
>> (XEN) [    1.082748] altcall mcheck_mca_logout+0x49c/0x770 dest =
arch/x86/cpu/mcheck/mce_intel.c#intel_recoverable_scan has no endbr64
>> (XEN) [    1.094447] altcall mcheck_mca_logout+0x56b/0x770 dest =
arch/x86/cpu/mcheck/mce_intel.c#intel_checkaddr has no endbr64
>> (XEN) [    1.105539] altcall =
arch/x86/cpu/microcode/core.c#parse_blob+0x9/0x20 dest =
arch/x86/cpu/microcode/intel.c#cpu_request_microcode has no endbr64
>> (XEN) [    1.118800] altcall =
arch/x86/cpu/microcode/core.c#primary_thread_work+0x3d/0x70 dest =
arch/x86/cpu/microcode/intel.c#apply_microcode has no endbr64
>> (XEN) [    1.132407] altcall =
arch/x86/cpu/microcode/core.c#microcode_update_helper+0xad/0x370 dest =
arch/x86/cpu/microcode/intel.c#intel_compare has no endbr64
>> (XEN) [    1.146275] altcall =
arch/x86/cpu/microcode/core.c#microcode_update_helper+0x2db/0x370 dest =
arch/x86/cpu/intel.c#intel_ctxt_switch_masking has no endbr64
>> (XEN) [    1.160400] altcall =
arch/x86/cpu/microcode/core.c#microcode_update_helper+0x2ff/0x370 dest =
arch/x86/cpu/intel.c#intel_ctxt_switch_masking has no endbr64
>> (XEN) [    1.174526] altcall =
arch/x86/cpu/microcode/core.c#do_microcode_update+0x13e/0x330 dest =
arch/x86/cpu/microcode/intel.c#apply_microcode has no endbr64
>> (XEN) [    1.188307] altcall microcode_update_one+0x11/0x70 dest =
arch/x86/cpu/microcode/intel.c#collect_cpu_info has no endbr64
>> (XEN) [    1.199486] altcall microcode_update_one+0x41/0x70 dest =
arch/x86/cpu/microcode/intel.c#apply_microcode has no endbr64
>> (XEN) [    1.210581] altcall ctxt_switch_levelling+0x116/0x120 dest =
arch/x86/cpu/intel.c#intel_ctxt_switch_masking has no endbr64
>> (XEN) [    1.221934] altcall identify_cpu+0x17a/0x530 dest =
arch/x86/cpu/intel.c#early_init_intel has no endbr64
>> (XEN) [    1.231726] altcall identify_cpu+0x2ef/0x530 dest =
arch/x86/cpu/intel.c#init_intel has no endbr64
>> (XEN) [    1.241075] altcall setup_local_APIC+0x26/0x470 dest =
init_apic_ldr_flat has no endbr64
>> (XEN) [    1.249482] altcall setup_IO_APIC+0x7a9/0xdbb dest =
cpu_mask_to_apicid_phys has no endbr64
>> (XEN) [    1.258148] altcall setup_IO_APIC+0x82d/0xdbb dest =
cpu_mask_to_apicid_phys has no endbr64
>> (XEN) [    1.266816] altcall setup_IO_APIC+0x96f/0xdbb dest =
cpu_mask_to_apicid_phys has no endbr64
>> (XEN) [    1.275483] altcall setup_IO_APIC+0xa53/0xdbb dest =
cpu_mask_to_apicid_phys has no endbr64
>> (XEN) [    1.284149] altcall io_apic_set_pci_routing+0x110/0x380 dest =
cpu_mask_to_apicid_phys has no endbr64
>> (XEN) [    1.293683] altcall io_apic_set_pci_routing+0x18f/0x380 dest =
cpu_mask_to_apicid_phys has no endbr64
>> (XEN) [    1.303215] altcall ioapic_guest_write+0x521/0x5f0 dest =
cpu_mask_to_apicid_phys has no endbr64
>> (XEN) [    1.312314] altcall ioapic_guest_write+0x536/0x5f0 dest =
cpu_mask_to_apicid_phys has no endbr64
>> (XEN) [    1.321416] altcall msi_compose_msg+0x7d/0xf0 dest =
cpu_mask_to_apicid_phys has no endbr64
>> (XEN) [    1.330082] altcall =
arch/x86/irq.c#_assign_irq_vector+0x39c/0x730 dest =
vector_allocation_cpumask_phys has no endbr64
>> (XEN) [    1.341089] altcall set_desc_affinity+0xb8/0x140 dest =
cpu_mask_to_apicid_phys has no endbr64
>> (XEN) [    1.350015] altcall send_IPI_mask+0xe4/0x1f0 dest =
send_IPI_mask_flat has no endbr64
>> (XEN) [    1.358163] altcall send_IPI_mask+0xfb/0x1f0 dest =
send_IPI_mask_flat has no endbr64
>> (XEN) [    1.366308] altcall send_IPI_self+0x4/0x10 dest =
send_IPI_self_legacy has no endbr64
>> (XEN) [    1.374454] altcall arch/x86/time.c#read_counter+0x1a/0x30 =
dest arch/x86/time.c#read_hpet_count has no endbr64
>> (XEN) [    1.384941] altcall time_resume+0x2d/0x170 dest =
arch/x86/time.c#resume_hpet has no endbr64
>=20
> The flurry of these (and the yet larger set further down) clearly =
points at some
> issue, possibly with the building of Xen. Were they present also with =
RC1? Were
> there any build time warnings? Are these present also with a plain =
upstream Xen?
>=20
> Cc-in Oleksii for awareness; might be nice to get to the bottom of =
this before
> the release, especially as for now it looks like a regression.
>=20
> Jan


