Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15234A00F1C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2025 21:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864633.1275843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tToZb-0005HH-Rb; Fri, 03 Jan 2025 20:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864633.1275843; Fri, 03 Jan 2025 20:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tToZb-0005F4-OE; Fri, 03 Jan 2025 20:47:11 +0000
Received: by outflank-mailman (input) for mailman id 864633;
 Fri, 03 Jan 2025 20:47:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/LDK=T3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tToZa-0005Ey-JG
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 20:47:10 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e55104ec-ca13-11ef-99a4-01e77a169b0f;
 Fri, 03 Jan 2025 21:47:07 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-43635796b48so76477765e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2025 12:47:07 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c4bbsm490042155e9.32.2025.01.03.12.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 12:47:05 -0800 (PST)
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
X-Inumbo-ID: e55104ec-ca13-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735937226; x=1736542026; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=exBLFrtWNgnHmKhXoK3LAaqFBTryX24sTmnjfI19g6s=;
        b=Gto0/XbhRneZVvw6V6db9aOfveeLpUnEKtqVHIUyX2bAJbyQvdgVCGvXaJWSySFnG8
         bFxqnozpYZObwNmupnFPL1o3e/T5Pt6lySELnW6g4OvXotfinU3JujXtHp/BRh31OAxl
         jJGyDj0WS5UYxMQzypfUy4GiWdJDSU9wEWPSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735937226; x=1736542026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exBLFrtWNgnHmKhXoK3LAaqFBTryX24sTmnjfI19g6s=;
        b=Yn0to3zfVHPwnM4zVs5yYwWxSORSBwV1Nr6Q5PytVyiNVdcxMXJ7EFV3jPXgwSTGIz
         gS4OY+Ed7k1fM6+RiQLoi0eLzscLn54Mupv8kL+p+2kEaXOcaszFgJRB7pR9h2HH9iXV
         VrVNoADilAIjzM8IBVT1BeIpzA4Tj9ecPrxYeScPHksYgpfy/lEogRq0Tejcc01yJf0W
         8dQIfyXd6LeqcmW5q9Q/8bzctK0D3+HNo2Jkl5TLKM0EmZ476OTB3fGd2hwGKWQ3wAB+
         VI1vWnqL+sa10WxQy8ZobNAp1eBywN7qAejbVp94WXhXe6/rDbUVizpEoOrQymPzhOZD
         7gUw==
X-Gm-Message-State: AOJu0YypcHxw/GMIMs8CxGSkIcdpFC7nmortouV5pDLi5TufK5a1Aqsj
	f6zHN4JiJ3++JCzTx2WPq362uFIiPSSh2W562FH6Y1Yj/viyB3gvv2CqdyTAyLi0qzTiIE0KzU/
	SywGHpMeX
X-Gm-Gg: ASbGncsdXgYBxPFgw3JBp6R0+uFmeoRLS6iIGSoelfMmoXw3SaR21Hmb05rmPeoJufq
	Q/k9WoOtL84OSU1UzE672GBhC8DNR3ZDhrJMqrVSRi9rhIIuewsc9ZAaPMaePGVZTH/Xnt4CqkJ
	VHPaD5Qn4dMbWkXXCw9Z/0DCcursaFddFxHCplw/0+X0HniBFR6H/QHdeHjcttsbqzVe858hSut
	KZFN6GCPwnT5xMfIH8KiEcPivI+Jd2MWV7GHV31CdvQLeAphzMdX19Bwlmqw1EVEgODlw0uUg4d
	5yjzex3b/xu8VwDHAtv61uCNdmx5HkjX1oHx
X-Google-Smtp-Source: AGHT+IGzmXkGFpP9d4v99nzTz4sJohR4wCiA1u3VOBebeRCL6m4hLRxWyw7L2qr1kDQk4q34NKk/kA==
X-Received: by 2002:a05:600c:4302:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-4365c775131mr425183595e9.9.1735937226225;
        Fri, 03 Jan 2025 12:47:06 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC] docs: FRED support in Xen
Date: Fri,  3 Jan 2025 20:47:04 +0000
Message-Id: <20250103204704.84067-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

An initial RFC discussion and plan.  Open TODOs are at the end.

This can be viewed online at:
  https://andrewcoop-xen.readthedocs.io/en/docs-devel/hypervisor-guide/x86/fred.html

I've got an 8-patch series doing the cpu_user_regs disentangling vs the public
API.  That's in pretty good shape now.

FRED itself is orders and orders of magnitude more simple than IDT, both in
terms of setup and operation, but I'm in the middle of a very large
cleanup (35 patches and count) to setup.c and trap.c in order to make FRED
able to be cleanly integrated into Xen, and that's still before any of the GS
changes to keep PV guests functioning correctly.
---
 docs/glossary.rst                   |   7 +
 docs/hypervisor-guide/x86/fred.rst  | 215 ++++++++++++++++++++++++++++
 docs/hypervisor-guide/x86/index.rst |   1 +
 3 files changed, 223 insertions(+)
 create mode 100644 docs/hypervisor-guide/x86/fred.rst

diff --git a/docs/glossary.rst b/docs/glossary.rst
index 6adeec77e14c..18502c0474f7 100644
--- a/docs/glossary.rst
+++ b/docs/glossary.rst
@@ -43,6 +43,13 @@ Glossary
      Sapphire Rapids (Server, 2023) CPUs.  AMD support only CET-SS, starting
      with Zen3 (Both client and server, 2020) CPUs.
 
+   FRED
+     Flexible Return and Event Delivery is a facility in x86 CPUs which
+     overhauls how system calls, interrupt and exception handling works.
+
+     Intel support for FRED is slated for Panther Lake (Client) and Diamond
+     Rapids (Server).
+
    guest
      The term 'guest' has two different meanings, depending on context, and
      should not be confused with :term:`domain`.
diff --git a/docs/hypervisor-guide/x86/fred.rst b/docs/hypervisor-guide/x86/fred.rst
new file mode 100644
index 000000000000..68146b79bdfc
--- /dev/null
+++ b/docs/hypervisor-guide/x86/fred.rst
@@ -0,0 +1,215 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+FRED: Flexible Return and Event Delivery
+========================================
+
+Overview
+--------
+
+FRED was originally intended to improve performance (reading and parsing the
+IDT, GDT/LDT and possibly the TSS is a bottleneck) and to provide an
+extensible mechanism to overcome other limitations in the future (e.g. support
+for more than 256 interrupt vectors).  During development, FRED was adjusted
+substantially to also fix lots of technical debt that had accumulated in the
+x86 architecture for the past 40 years, most of which is a fertile source of
+crashes and privilege escalation bugs.
+
+FRED is primarily concerned with establishing a new context when an event is
+recognised, and restoring the old context when the event is handled.  This
+includes events previously delivered through the IDT (exceptions and
+interrupts), as well as ``SYSCALL`` and ``SYSENTER`` instructions which
+avoided the IDT in the past for performance reasons.
+
+FRED strives to achieve that event delivery always establishes a good CPL0
+stack (and shadow stack if CET is active), that doesn't clobber still-active
+state from an outer nested context, and with the CPL0 GSBASE.
+
+Technical details
+-----------------
+
+When FRED is active, Rings 1 and 2 cannot be entered at all, Ring0
+compatibility mode cant be entered (i.e. Ring0 is strictly 64bit), and
+``IRET`` can no longer change privilege.  Call Gates no longer exist.
+
+A single entrypoint is registered in ``MSR_FRED_CONFIG``.  Entries from Ring3
+start at this address, while entries from Ring0 start at +256.  All
+interrupts, exceptions and syscalls route these.  VMExits do not, and retain
+their prior behaviour.
+
+There are 4 Stack Levels, SL 0 thru 3 and a notion of Current Stack Level,
+replacing the prior IST mechanism.  All stack pointers, and shadow stack
+pointers when CET-SS is active, are registered in ``MSR_{R,S}SP_SL{0..3}``.
+Supervisor Shadow Stack tokens no longer exist, and are replaced with an
+alternative mechanism.
+
+The IDT is no longer used.  The TSS is no longer used used to hold stack
+pointers, nor ``MSR_ISST`` if CET Shadow Stacks are active.  ``MSR_{L,C}STAR``
+as well as all SYSENTER MSRs are no longer used.  Under FRED, ``MSR_STAR`` and
+``MSR_FMASK`` are used with their previous behaviour extended to all event
+deliveries, not just syscalls.
+
+The instructions ``SWAPGS``, ``CLRSSBSY``, ``SETSSBSY``, ``SYSEXIT`` and
+``SYSRET`` unconditionally ``#UD``.  Establishing an initial SSP should use
+``RSTORSSP``.  GS maintenance can use the new ``LKGS`` instruction.
+
+Implementation considerations
+-----------------------------
+
+PV32 guests
+"""""""""""
+
+FRED formally removes the ability to use Rings 1 and 2, which prohibits the
+use of PV32 guests.  PV32 guests are already disabled by default in the
+presence of CET owing to the difficulty of using Ring 1 with CET active.
+Compatibility for PV32 guests is provided by PVShim, which takes care not to
+use CET in order to be able to run PV32 guests.  FRED can use the same
+approach.
+
+Initialisation
+""""""""""""""
+
+Exception handling is initialised right at the beginning of ``__start_xen()``
+prior to parsing the command line.  Having exception cover this early is
+important and wants to remain.
+
+The determination of whether to use FRED or not needs to account for the
+``fred`` and ``pvshim`` command line options, the ``FRED`` and ``LKGS`` CPUID
+bits.
+
+Therefore for simplicity, early exception handling will still use IDT
+delivery, and later setup can switch to FRED instead.
+
+cpu_user_regs vs vm86 segments
+""""""""""""""""""""""""""""""
+
+``struct cpu_user_regs`` exists in the public interface, and is embedded
+inside ``struct vcpu_guest_context``.  From an ABI perspective, the layout
+needs to remain.  ``struct cpu_user_regs`` is also a common name in Xen,
+covering the event information (pushed by hardware and software) and the GPRs
+(pushed by software).  From an API perspective, the name needs to remain.
+
+The data selectors (ds, es, fs, gs) are a vestigial remnant of vm86 mode.
+Hardware did push them on exit from vm86 mode, and ``IRET`` would consume them
+on the way back in.
+
+However, vm86 mode isn't usable in Long mode, and these selectors oughtn't to
+have survived into the PV64 ABI.  Under FRED, hardware pushes different
+information here, which needs accounting for in Xen's view of ``struct
+cpu_user_regs``.
+
+Therefore, the only option is to have the public API provide a struct by a
+different name, and provide a compatibility define for the ``!__XEN__`` case,
+freeing us up to have a similar but not identical ``struct cpu_user_regs``
+which Xen operates on.
+
+There are several uses of the vm86 fields in Xen:
+
+ #. ``struct vcpu`` embeds a ``struct cpu_user_regs`` to hold GPRs/etc when
+    the vCPU is scheduled out.  The vm86 fields are used by the PV logic only
+    (``{save,load}_segments()``) and can be moved into separate fields in
+    ``struct pv_vcpu``.  PV's ``dom0_construct()`` sets these fields directly,
+    and needs a matching adjustment.
+
+ #. As part of ``arch_{get,set}_info_guest()`` during hypercalls.  The
+    guest side needs to remain as-is, but the Xen side can rearranged to use
+    the new fields from above.
+
+ #. As part of vCPU diagnostics (``show_registers()`` etc).  The ``#DF`` path
+    uses the fields as scratch storage for the current register values, while
+    the other diagnostics are simply accessing the state of a scheduled-out
+    vCPU.
+
+ #. In HVM's ``hvm_sanitize_regs_fields()``, to poison the fields and make
+    them more obvious if used anywhere in HVM context.  This can simply be
+    deleted.
+
+ #. In x86_emulate.c's ``put_fpu()``.  As far as I can tell, this is
+    completely buggy; the values will be poisoned for HVM guests, and stale
+    from the prior context switch for PV guests.
+
+Stack layout
+""""""""""""
+
+Xen's CPU stacks are 8-page (8-page aligned), arranged as::
+
+  7 - Primary stack (with a struct cpu_info at the top)
+  6 - Primary stack
+  5 - Primary Shadow Stack (read-only)
+  4 - #DF IST stack
+  3 - #DB IST stack
+  2 - NMI IST stack
+  1 - #MC IST stack
+  0 - IST Shadow Stacks (4x 1k, read-only)
+
+which needs mapping into FREDs Stack Levels.
+
+FRED Stack Levels replace IST.  Most events from Ring3 enter Ring0 at SL0,
+including interrupts, and even exceptions with a non-zero Stack Level
+configured.  Nested exceptions originate from Ring0 even if they were trying
+to push a Ring3 event frame onto the stack, so do follow the Ring0 CSL rules.
+
+Within Ring0, a stack switch occurs on event delivery if the event has a
+higher configured Stack Level (exceptions in ``MSR_FRED_STK_LVLS``, interrupts
+in ``MSR_FRED_CONFIG``).  Otherwise, the new event is delivered on the current
+stack.
+
+Under FRED, most sources of ``#DF`` are gone; failure to push a new event
+frame onto a stack is the main remaining one, so ``#DF`` needs to be the
+highest stack level (SL3) to catch errors at all other stack levels.
+
+Also, FRED removes the "syscall gap", removing the primary need for ``NMI``,
+``#DB`` and ``#MC`` to need separate stacks.
+
+Therefore, Xen has no need for SL1 or SL2.  Under IDT delivery, we poison the
+unused stack pointers with a non-canonical address, but we cannot do that
+under FRED; they're held in MSRs and checked at WRMSR time.  Instead, we can
+point the SL pairs (RSP + SSP) at each others (regular and shadow stack) guard
+pages such that any use of an unused SL will escalate to ``#DF``.
+
+FRED event delivery also realigns the stack to a 64-byte boundary (increased
+from 16-byte in 64bit IDT delivery), which has an effect on the layout of
+``struct cpu_info``.  By coincidence, the top-of-stack block is already 64
+bytes before the start of the FRED-adjusted ``struct cpu_user_regs``, so no
+changes beyond a stricter alignment check are needed right now.
+
+In principle we could disconnect ``struct cpu_user_regs`` from ``struct
+cpu_info``.  Some future extensions to FRED might even require it.  However,
+right now, ``SPEC_CTRL_COND_VERW`` on exit to guest needs to access
+``CPUINFO_scf`` and ``CPUINFO_verw_sel`` as absolute displacements from
+``%rsp``.  This is easiest to achieve if ``struct cpu_user_regs`` is fixed and
+compatible with both IDT and FRED delivery.
+
+
+Still TBD
+---------
+
+Issues/areas I'm aware of, but haven't got a firm plan yet.
+
+Call Gates
+""""""""""
+
+FRED removes Call Gates, yielding ``#GP[sel]`` instead.  This is how we
+emulate call gates for PV32, but emulation is genuinely only wired up for PV32
+guests, not for PV64.
+
+PV64 guests do seem to be able to write Call Gates into their LDT/GDT, but
+have the DPL 0'd in common with PV32.  Given the absence of emulation, I think
+PV64 can't actually use Call Gates, but given the existing logic this also
+seems to be by accident rather than design.
+
+GS handling
+"""""""""""
+
+Xen does not use GS as a per-cpu pointer, but FRED is tied to the common OS
+usage.  Therefore, when FRED is active, ``v->arch.pv.gs_base_{user,kernel}``
+are logically the opposite way around when running in Xen context.
+
+Furthermore we cannot use ``SWAPGS`` as part of context switching, and there's
+no ``wrgsshadow`` instruction.  All guest GS handling within Xen needs to be
+altered.
+
+Kexec
+"""""
+
+NMI shootdown for kexec plays with IST settings carefully to keep the
+non-kexecing CPUs safely contained.  This will need changing completely.
diff --git a/docs/hypervisor-guide/x86/index.rst b/docs/hypervisor-guide/x86/index.rst
index c10cd1d7c0bd..64f9b4b2ccd4 100644
--- a/docs/hypervisor-guide/x86/index.rst
+++ b/docs/hypervisor-guide/x86/index.rst
@@ -7,3 +7,4 @@ x86
    :maxdepth: 2
 
    how-xen-boots
+   fred

base-commit: a1746cd4434dd27ca2da8430dfb10edc76264bb3
prerequisite-patch-id: a7f7bbaaec1c02d055eb07a630f2f4dc28b1e70b
-- 
2.39.5


