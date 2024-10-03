Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B26EF98F5B2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:00:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809685.1222168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ75-0007iI-AK; Thu, 03 Oct 2024 17:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809685.1222168; Thu, 03 Oct 2024 17:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ75-0007fp-6Y; Thu, 03 Oct 2024 17:59:43 +0000
Received: by outflank-mailman (input) for mailman id 809685;
 Thu, 03 Oct 2024 17:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ73-0006qR-Dy
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:41 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42101a9c-81b1-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 19:59:39 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso174951166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:39 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:35 -0700 (PDT)
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
X-Inumbo-ID: 42101a9c-81b1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978378; x=1728583178; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WG00VI55fdierDp7iCxKZRLsKioMh3K5ULaHRKtO+pg=;
        b=lz2A/kNhNObGdcOiTxtFmQcfkkARtSSzukh95nqzdGlRNdHyiPaAu7Bj+edPz5Y2mm
         YWZbp4N3WH0ei+J+nTiU8vhjPpf4xNAcykHpPwU0agWsHnDCrNvVbDvtfG6+6niWDsOw
         zEeSeRq2YhK8OZTNKN5l9koITs8u+Cnw6wtzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978378; x=1728583178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WG00VI55fdierDp7iCxKZRLsKioMh3K5ULaHRKtO+pg=;
        b=uhLhs4swIvkapl7F5svegk88F0LUK4a2QS6QUf7VVT+hkUbBSfVLAMQeIDtnhtmpKq
         9yKt8JsjU8bisWKNDXNz5WYrO/HxFbLpK/lLiA2+95vpf2gGMuuozVg2RNB03W1Gg8m/
         OrdT73pkTRvFoR6SiiWmgcVETw0vzqJb+2vqdb2NEzeW0dhTyW8x56fjXqCsATVA574x
         hX03XjTcSmB4XBzCZl8vz0Tbtpyd2CIWiziCsESEtxTUuf1sBlnY/+EQee36U6kxXE5m
         rb5bWvfS2G8QbLorgGsI9W6NTtgtQf+FccMDnbgYwzFTH8oQimhxRxJWjf6Uh4Zw/0P5
         cpzw==
X-Gm-Message-State: AOJu0YxPUUTIie/5U6dOcSoV5JoLW2UX1kZSaoGDlhywhJh29/3Ff9xl
	i98zNXuep8pqoyM/ZzJdEnELzx+TOf/c/CjZl+OU52H7JEpNTu0VLHKwMpjm7HWkGUwi+OlEdjU
	I
X-Google-Smtp-Source: AGHT+IGBdFcQ0OUq9dcELZUFA77VgO8aTHJARHGhm8MZzBiMxrxAxgz+Eo3uac18yCKTGNIBUvcH9w==
X-Received: by 2002:a17:907:e665:b0:a91:158c:8057 with SMTP id a640c23a62f3a-a991bed88bemr17037866b.54.1727978375663;
        Thu, 03 Oct 2024 10:59:35 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v2 02/19] xen: Update header guards - X86
Date: Thu,  3 Oct 2024 18:59:02 +0100
Message-Id: <20241003175919.472774-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to x86 architecture.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/video.h                           | 6 +++---
 xen/arch/x86/cpu/mcheck/barrier.h                   | 6 +++---
 xen/arch/x86/cpu/mcheck/mcaction.h                  | 4 ++--
 xen/arch/x86/cpu/mcheck/mce.h                       | 6 +++---
 xen/arch/x86/cpu/mcheck/mce_amd.h                   | 4 ++--
 xen/arch/x86/cpu/mcheck/mctelem.h                   | 4 ++--
 xen/arch/x86/cpu/mcheck/util.h                      | 4 ++--
 xen/arch/x86/cpu/mcheck/vmce.h                      | 4 ++--
 xen/arch/x86/cpu/mcheck/x86_mca.h                   | 6 +++---
 xen/arch/x86/cpu/microcode/private.h                | 6 +++---
 xen/arch/x86/cpu/mtrr/mtrr.h                        | 6 +++---
 xen/arch/x86/guest/hyperv/private.h                 | 6 +++---
 xen/arch/x86/hvm/svm/nestedhvm.h                    | 6 +++---
 xen/arch/x86/hvm/svm/svm.h                          | 6 +++---
 xen/arch/x86/hvm/viridian/private.h                 | 6 +++---
 xen/arch/x86/include/asm/acpi.h                     | 4 ++--
 xen/arch/x86/include/asm/alternative-asm.h          | 6 +++---
 xen/arch/x86/include/asm/alternative.h              | 6 +++---
 xen/arch/x86/include/asm/altp2m.h                   | 6 +++---
 xen/arch/x86/include/asm/amd.h                      | 6 +++---
 xen/arch/x86/include/asm/apic.h                     | 6 +++---
 xen/arch/x86/include/asm/apicdef.h                  | 4 ++--
 xen/arch/x86/include/asm/asm_defns.h                | 6 +++---
 xen/arch/x86/include/asm/atomic.h                   | 6 +++---
 xen/arch/x86/include/asm/bitops.h                   | 6 +++---
 xen/arch/x86/include/asm/bug.h                      | 6 +++---
 xen/arch/x86/include/asm/byteorder.h                | 6 +++---
 xen/arch/x86/include/asm/bzimage.h                  | 6 +++---
 xen/arch/x86/include/asm/cache.h                    | 4 ++--
 xen/arch/x86/include/asm/config.h                   | 6 +++---
 xen/arch/x86/include/asm/cpu-policy.h               | 6 +++---
 xen/arch/x86/include/asm/cpufeature.h               | 6 +++---
 xen/arch/x86/include/asm/cpufeatureset.h            | 6 +++---
 xen/arch/x86/include/asm/cpuid.h                    | 6 +++---
 xen/arch/x86/include/asm/cpuidle.h                  | 4 ++--
 xen/arch/x86/include/asm/current.h                  | 6 +++---
 xen/arch/x86/include/asm/debugreg.h                 | 6 +++---
 xen/arch/x86/include/asm/desc.h                     | 6 +++---
 xen/arch/x86/include/asm/device.h                   | 6 +++---
 xen/arch/x86/include/asm/dom0_build.h               | 6 +++---
 xen/arch/x86/include/asm/domain.h                   | 6 +++---
 xen/arch/x86/include/asm/e820.h                     | 6 +++---
 xen/arch/x86/include/asm/edd.h                      | 6 +++---
 xen/arch/x86/include/asm/elf.h                      | 6 +++---
 xen/arch/x86/include/asm/endbr.h                    | 6 +++---
 xen/arch/x86/include/asm/event.h                    | 4 ++--
 xen/arch/x86/include/asm/fixmap.h                   | 4 ++--
 xen/arch/x86/include/asm/flushtlb.h                 | 6 +++---
 xen/arch/x86/include/asm/gdbsx.h                    | 6 +++---
 xen/arch/x86/include/asm/genapic.h                  | 4 ++--
 xen/arch/x86/include/asm/grant_table.h              | 6 +++---
 xen/arch/x86/include/asm/guest.h                    | 6 +++---
 xen/arch/x86/include/asm/guest/hyperv-hcall.h       | 6 +++---
 xen/arch/x86/include/asm/guest/hyperv-tlfs.h        | 4 ++--
 xen/arch/x86/include/asm/guest/hyperv.h             | 6 +++---
 xen/arch/x86/include/asm/guest/hypervisor.h         | 6 +++---
 xen/arch/x86/include/asm/guest/pvh-boot.h           | 6 +++---
 xen/arch/x86/include/asm/guest/xen-hcall.h          | 6 +++---
 xen/arch/x86/include/asm/guest/xen.h                | 6 +++---
 xen/arch/x86/include/asm/guest_access.h             | 6 +++---
 xen/arch/x86/include/asm/guest_atomics.h            | 6 +++---
 xen/arch/x86/include/asm/guest_pt.h                 | 6 +++---
 xen/arch/x86/include/asm/hap.h                      | 4 ++--
 xen/arch/x86/include/asm/hardirq.h                  | 6 +++---
 xen/arch/x86/include/asm/hpet.h                     | 6 +++---
 xen/arch/x86/include/asm/hvm/asid.h                 | 6 +++---
 xen/arch/x86/include/asm/hvm/cacheattr.h            | 6 +++---
 xen/arch/x86/include/asm/hvm/domain.h               | 6 +++---
 xen/arch/x86/include/asm/hvm/emulate.h              | 6 +++---
 xen/arch/x86/include/asm/hvm/grant_table.h          | 6 +++---
 xen/arch/x86/include/asm/hvm/guest_access.h         | 6 +++---
 xen/arch/x86/include/asm/hvm/hvm.h                  | 6 +++---
 xen/arch/x86/include/asm/hvm/io.h                   | 6 +++---
 xen/arch/x86/include/asm/hvm/ioreq.h                | 6 +++---
 xen/arch/x86/include/asm/hvm/irq.h                  | 6 +++---
 xen/arch/x86/include/asm/hvm/nestedhvm.h            | 6 +++---
 xen/arch/x86/include/asm/hvm/save.h                 | 6 +++---
 xen/arch/x86/include/asm/hvm/support.h              | 6 +++---
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h        | 4 ++--
 xen/arch/x86/include/asm/hvm/svm/svm.h              | 6 +++---
 xen/arch/x86/include/asm/hvm/svm/svmdebug.h         | 6 +++---
 xen/arch/x86/include/asm/hvm/svm/vmcb.h             | 4 ++--
 xen/arch/x86/include/asm/hvm/vcpu.h                 | 6 +++---
 xen/arch/x86/include/asm/hvm/vioapic.h              | 6 +++---
 xen/arch/x86/include/asm/hvm/viridian.h             | 6 +++---
 xen/arch/x86/include/asm/hvm/vlapic.h               | 6 +++---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h             | 4 ++--
 xen/arch/x86/include/asm/hvm/vmx/vmx.h              | 6 +++---
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h             | 6 +++---
 xen/arch/x86/include/asm/hvm/vpic.h                 | 6 +++---
 xen/arch/x86/include/asm/hvm/vpt.h                  | 6 +++---
 xen/arch/x86/include/asm/hypercall.h                | 6 +++---
 xen/arch/x86/include/asm/i387.h                     | 6 +++---
 xen/arch/x86/include/asm/intel-family.h             | 6 +++---
 xen/arch/x86/include/asm/invpcid.h                  | 6 +++---
 xen/arch/x86/include/asm/io.h                       | 4 ++--
 xen/arch/x86/include/asm/io_apic.h                  | 4 ++--
 xen/arch/x86/include/asm/iocap.h                    | 6 +++---
 xen/arch/x86/include/asm/iommu.h                    | 6 +++---
 xen/arch/x86/include/asm/ioreq.h                    | 6 +++---
 xen/arch/x86/include/asm/irq.h                      | 6 +++---
 xen/arch/x86/include/asm/ldt.h                      | 4 ++--
 xen/arch/x86/include/asm/mach-default/bios_ebda.h   | 6 +++---
 xen/arch/x86/include/asm/mach-default/io_ports.h    | 6 +++---
 xen/arch/x86/include/asm/mach-default/irq_vectors.h | 6 +++---
 xen/arch/x86/include/asm/mach-default/mach_mpspec.h | 6 +++---
 xen/arch/x86/include/asm/mach-generic/mach_apic.h   | 6 +++---
 xen/arch/x86/include/asm/machine_kexec.h            | 6 +++---
 xen/arch/x86/include/asm/mc146818rtc.h              | 6 +++---
 xen/arch/x86/include/asm/mce.h                      | 4 ++--
 xen/arch/x86/include/asm/mem_paging.h               | 6 +++---
 xen/arch/x86/include/asm/mem_sharing.h              | 6 +++---
 xen/arch/x86/include/asm/microcode.h                | 6 +++---
 xen/arch/x86/include/asm/mm.h                       | 6 +++---
 xen/arch/x86/include/asm/mpspec.h                   | 4 ++--
 xen/arch/x86/include/asm/mpspec_def.h               | 4 ++--
 xen/arch/x86/include/asm/msi.h                      | 6 +++---
 xen/arch/x86/include/asm/msr-index.h                | 6 +++---
 xen/arch/x86/include/asm/msr.h                      | 6 +++---
 xen/arch/x86/include/asm/mtrr.h                     | 6 +++---
 xen/arch/x86/include/asm/multicall.h                | 6 +++---
 xen/arch/x86/include/asm/mwait.h                    | 6 +++---
 xen/arch/x86/include/asm/nmi.h                      | 6 +++---
 xen/arch/x86/include/asm/nops.h                     | 6 +++---
 xen/arch/x86/include/asm/nospec.h                   | 6 +++---
 xen/arch/x86/include/asm/numa.h                     | 4 ++--
 xen/arch/x86/include/asm/p2m.h                      | 6 +++---
 xen/arch/x86/include/asm/page-bits.h                | 6 +++---
 xen/arch/x86/include/asm/page.h                     | 6 +++---
 xen/arch/x86/include/asm/paging.h                   | 4 ++--
 xen/arch/x86/include/asm/pci.h                      | 6 +++---
 xen/arch/x86/include/asm/perfc.h                    | 4 ++--
 xen/arch/x86/include/asm/perfc_defn.h               | 6 +++---
 xen/arch/x86/include/asm/processor.h                | 6 +++---
 xen/arch/x86/include/asm/prot-key.h                 | 6 +++---
 xen/arch/x86/include/asm/psr.h                      | 6 +++---
 xen/arch/x86/include/asm/pt-contig-markers.h        | 6 +++---
 xen/arch/x86/include/asm/pv/domain.h                | 6 +++---
 xen/arch/x86/include/asm/pv/grant_table.h           | 6 +++---
 xen/arch/x86/include/asm/pv/mm.h                    | 6 +++---
 xen/arch/x86/include/asm/pv/shim.h                  | 6 +++---
 xen/arch/x86/include/asm/pv/trace.h                 | 6 +++---
 xen/arch/x86/include/asm/pv/traps.h                 | 6 +++---
 xen/arch/x86/include/asm/random.h                   | 6 +++---
 xen/arch/x86/include/asm/regs.h                     | 6 +++---
 xen/arch/x86/include/asm/setup.h                    | 4 ++--
 xen/arch/x86/include/asm/shadow.h                   | 6 +++---
 xen/arch/x86/include/asm/shared.h                   | 6 +++---
 xen/arch/x86/include/asm/shstk.h                    | 6 +++---
 xen/arch/x86/include/asm/smp.h                      | 4 ++--
 xen/arch/x86/include/asm/softirq.h                  | 6 +++---
 xen/arch/x86/include/asm/spec_ctrl.h                | 6 +++---
 xen/arch/x86/include/asm/spec_ctrl_asm.h            | 6 +++---
 xen/arch/x86/include/asm/spinlock.h                 | 6 +++---
 xen/arch/x86/include/asm/string.h                   | 6 +++---
 xen/arch/x86/include/asm/system.h                   | 4 ++--
 xen/arch/x86/include/asm/time.h                     | 6 +++---
 xen/arch/x86/include/asm/trampoline.h               | 6 +++---
 xen/arch/x86/include/asm/traps.h                    | 6 +++---
 xen/arch/x86/include/asm/types.h                    | 6 +++---
 xen/arch/x86/include/asm/uaccess.h                  | 6 +++---
 xen/arch/x86/include/asm/vpmu.h                     | 6 +++---
 xen/arch/x86/include/asm/x86-defns.h                | 6 +++---
 xen/arch/x86/include/asm/x86-vendors.h              | 6 +++---
 xen/arch/x86/include/asm/x86_64/elf.h               | 6 +++---
 xen/arch/x86/include/asm/x86_64/page.h              | 6 +++---
 xen/arch/x86/include/asm/x86_64/regs.h              | 4 ++--
 xen/arch/x86/include/asm/x86_64/system.h            | 6 +++---
 xen/arch/x86/include/asm/x86_64/uaccess.h           | 6 +++---
 xen/arch/x86/include/asm/x86_emulate.h              | 6 +++---
 xen/arch/x86/include/asm/xenoprof.h                 | 6 +++---
 xen/arch/x86/include/asm/xstate.h                   | 6 +++---
 xen/arch/x86/mm/hap/private.h                       | 6 +++---
 xen/arch/x86/mm/mm-locks.h                          | 6 +++---
 xen/arch/x86/mm/p2m.h                               | 6 +++---
 xen/arch/x86/mm/shadow/private.h                    | 6 +++---
 xen/arch/x86/mm/shadow/types.h                      | 6 +++---
 xen/arch/x86/oprofile/op_counter.h                  | 6 +++---
 xen/arch/x86/oprofile/op_x86_model.h                | 6 +++---
 xen/arch/x86/pv/emulate.h                           | 6 +++---
 xen/arch/x86/pv/mm.h                                | 6 +++---
 xen/arch/x86/x86_emulate/x86_emulate.h              | 6 +++---
 xen/include/public/arch-x86/cpufeatureset.h         | 6 +++---
 xen/include/public/arch-x86/cpuid.h                 | 6 +++---
 xen/include/public/arch-x86/guest-acpi.h            | 6 +++---
 xen/include/public/arch-x86/hvm/save.h              | 6 +++---
 xen/include/public/arch-x86/hvm/start_info.h        | 6 +++---
 xen/include/public/arch-x86/pmu.h                   | 6 +++---
 xen/include/public/arch-x86/xen-mca.h               | 6 +++---
 xen/include/public/arch-x86/xen-x86_32.h            | 6 +++---
 xen/include/public/arch-x86/xen-x86_64.h            | 6 +++---
 xen/include/public/arch-x86/xen.h                   | 6 +++---
 xen/include/xen/lib/x86/cpu-policy.h                | 6 +++---
 xen/lib/x86/private.h                               | 6 +++---
 194 files changed, 552 insertions(+), 552 deletions(-)

diff --git a/xen/arch/x86/boot/video.h b/xen/arch/x86/boot/video.h
index 1203515f9e..cecd8965b7 100644
--- a/xen/arch/x86/boot/video.h
+++ b/xen/arch/x86/boot/video.h
@@ -1,5 +1,5 @@
-#ifndef __BOOT_VIDEO_H__
-#define __BOOT_VIDEO_H__
+#ifndef X86__BOOT__VIDEO_H
+#define X86__BOOT__VIDEO_H
 
 /*
  * Video modes numbered by menu position -- NOT RECOMMENDED because of lack
@@ -71,4 +71,4 @@ struct boot_video_info {
 extern struct boot_video_info boot_vid_info;
 #endif /* __ASSEMBLY__ */
 
-#endif /* __BOOT_VIDEO_H__ */
+#endif /* X86__BOOT__VIDEO_H */
diff --git a/xen/arch/x86/cpu/mcheck/barrier.h b/xen/arch/x86/cpu/mcheck/barrier.h
index 7ec483226f..c4c59ce627 100644
--- a/xen/arch/x86/cpu/mcheck/barrier.h
+++ b/xen/arch/x86/cpu/mcheck/barrier.h
@@ -1,5 +1,5 @@
-#ifndef _MCHECK_BARRIER_H
-#define _MCHECK_BARRIER_H
+#ifndef X86__CPU__MCHECK__BARRIER_H
+#define X86__CPU__MCHECK__BARRIER_H
 
 #include <asm/atomic.h>
 
@@ -58,4 +58,4 @@ void mce_barrier_exit(struct mce_softirq_barrier *bar, bool do_wait);
 
 void mce_barrier(struct mce_softirq_barrier *bar);
 
-#endif /* _MCHECK_BARRIER_H */
+#endif /* X86__CPU__MCHECK__BARRIER_H */
diff --git a/xen/arch/x86/cpu/mcheck/mcaction.h b/xen/arch/x86/cpu/mcheck/mcaction.h
index 6c79498cd2..e5a7cb9e0d 100644
--- a/xen/arch/x86/cpu/mcheck/mcaction.h
+++ b/xen/arch/x86/cpu/mcheck/mcaction.h
@@ -1,5 +1,5 @@
-#ifndef _MCHECK_ACTION_H
-#define _MCHECK_ACTION_H
+#ifndef X86__CPU__MCHECK__MCACTION_H
+#define X86__CPU__MCHECK__MCACTION_H
 
 #include <xen/types.h>
 #include "x86_mca.h"
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index eba4b536c7..f2a423f029 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -1,6 +1,6 @@
-#ifndef _MCE_H
+#ifndef X86__CPU__MCHECK__MCE_H
 
-#define _MCE_H
+#define X86__CPU__MCHECK__MCE_H
 
 #include <xen/init.h>
 #include <xen/percpu.h>
@@ -244,4 +244,4 @@ struct mce {
 
 extern int apei_write_mce(struct mce *m);
 
-#endif /* _MCE_H */
+#endif /* X86__CPU__MCHECK__MCE_H */
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.h b/xen/arch/x86/cpu/mcheck/mce_amd.h
index c12c25d745..35e3bc6a6d 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.h
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.h
@@ -1,5 +1,5 @@
-#ifndef _MCHECK_AMD_H
-#define _MCHECK_AMD_H
+#ifndef X86__CPU__MCHECK__MCE_AMD_H
+#define X86__CPU__MCHECK__MCE_AMD_H
 
 bool cf_check mc_amd_recoverable_scan(uint64_t status);
 bool cf_check mc_amd_addrcheck(uint64_t status, uint64_t misc, int addrtype);
diff --git a/xen/arch/x86/cpu/mcheck/mctelem.h b/xen/arch/x86/cpu/mcheck/mctelem.h
index f4c5ff848d..a77c9bcffb 100644
--- a/xen/arch/x86/cpu/mcheck/mctelem.h
+++ b/xen/arch/x86/cpu/mcheck/mctelem.h
@@ -8,9 +8,9 @@
  * License.
  */
 
-#ifndef _MCTELEM_H
+#ifndef X86__CPU__MCHECK__MCTELEM_H
 
-#define	_MCTELEM_H
+#define	X86__CPU__MCHECK__MCTELEM_H
 
 #include <xen/init.h>
 #include <xen/smp.h>
diff --git a/xen/arch/x86/cpu/mcheck/util.h b/xen/arch/x86/cpu/mcheck/util.h
index a5468b89fa..b4a71e21d4 100644
--- a/xen/arch/x86/cpu/mcheck/util.h
+++ b/xen/arch/x86/cpu/mcheck/util.h
@@ -1,5 +1,5 @@
-#ifndef _MCHECK_UTIL_H
-#define _MCHECK_UTIL_H
+#ifndef X86__CPU__MCHECK__UTIL_H
+#define X86__CPU__MCHECK__UTIL_H
 
 void mce_panic_check(void);
 
diff --git a/xen/arch/x86/cpu/mcheck/vmce.h b/xen/arch/x86/cpu/mcheck/vmce.h
index a9a325f776..d934b02c8b 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.h
+++ b/xen/arch/x86/cpu/mcheck/vmce.h
@@ -1,5 +1,5 @@
-#ifndef _MCHECK_VMCE_H
-#define _MCHECK_VMCE_H
+#ifndef X86__CPU__MCHECK__VMCE_H
+#define X86__CPU__MCHECK__VMCE_H
 
 #include "x86_mca.h"
 
diff --git a/xen/arch/x86/cpu/mcheck/x86_mca.h b/xen/arch/x86/cpu/mcheck/x86_mca.h
index 18116737af..d5514762ed 100644
--- a/xen/arch/x86/cpu/mcheck/x86_mca.h
+++ b/xen/arch/x86/cpu/mcheck/x86_mca.h
@@ -4,8 +4,8 @@
  * Copyright (c) 2007-2012 Advanced Micro Devices, Inc. 
  */
 
-#ifndef X86_MCA_H
-#define X86_MCA_H
+#ifndef X86__CPU__MCHECK__X86_MCA_H
+#define X86__CPU__MCHECK__X86_MCA_H
 
 #include <public/arch-x86/xen-mca.h>
 
@@ -150,4 +150,4 @@ struct mca_error_handler
 /* Global variables */
 extern bool opt_mce;
 
-#endif /* X86_MCA_H */
+#endif /* X86__CPU__MCHECK__X86_MCA_H */
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index c72f060ac3..a3707863b9 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -1,5 +1,5 @@
-#ifndef ASM_X86_MICROCODE_PRIVATE_H
-#define ASM_X86_MICROCODE_PRIVATE_H
+#ifndef X86__CPU__MICROCODE__PRIVATE_H
+#define X86__CPU__MICROCODE__PRIVATE_H
 
 #include <public/platform.h>
 
@@ -83,4 +83,4 @@ void ucode_probe_intel(struct microcode_ops *ops);
 static inline void ucode_probe_intel(struct microcode_ops *ops) {}
 #endif
 
-#endif /* ASM_X86_MICROCODE_PRIVATE_H */
+#endif /* X86__CPU__MICROCODE__PRIVATE_H */
diff --git a/xen/arch/x86/cpu/mtrr/mtrr.h b/xen/arch/x86/cpu/mtrr/mtrr.h
index 632bf658be..c23987cedc 100644
--- a/xen/arch/x86/cpu/mtrr/mtrr.h
+++ b/xen/arch/x86/cpu/mtrr/mtrr.h
@@ -1,8 +1,8 @@
 /*
  * local mtrr defines.
  */
-#ifndef X86_CPU_MTRR_MTRR_H
-#define X86_CPU_MTRR_MTRR_H
+#ifndef X86__CPU__MTRR__MTRR_H
+#define X86__CPU__MTRR__MTRR_H
 
 #define MTRR_CHANGE_MASK_FIXED     0x01
 #define MTRR_CHANGE_MASK_VARIABLE  0x02
@@ -28,4 +28,4 @@ extern unsigned int num_var_ranges;
 
 void mtrr_state_warn(void);
 
-#endif /* X86_CPU_MTRR_MTRR_H */
+#endif /* X86__CPU__MTRR__MTRR_H */
diff --git a/xen/arch/x86/guest/hyperv/private.h b/xen/arch/x86/guest/hyperv/private.h
index 0277e8314c..790872e3c9 100644
--- a/xen/arch/x86/guest/hyperv/private.h
+++ b/xen/arch/x86/guest/hyperv/private.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2020 Microsoft.
  */
 
-#ifndef __XEN_HYPERV_PRIVIATE_H__
-#define __XEN_HYPERV_PRIVIATE_H__
+#ifndef X86__GUEST__HYPERV__PRIVATE_H
+#define X86__GUEST__HYPERV__PRIVATE_H
 
 #include <xen/cpumask.h>
 #include <xen/percpu.h>
@@ -29,4 +29,4 @@ int hyperv_flush_tlb(const cpumask_t *mask, const void *va,
 /* Returns number of banks, -ev if error */
 int cpumask_to_vpset(struct hv_vpset *vpset, const cpumask_t *mask);
 
-#endif /* __XEN_HYPERV_PRIVIATE_H__  */
+#endif /* X86__GUEST__HYPERV__PRIVATE_H  */
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index 43245e13de..dd3533c74b 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2011, Advanced Micro Devices, Inc
  */
 
-#ifndef __X86_HVM_SVM_NESTEDHVM_PRIV_H__
-#define __X86_HVM_SVM_NESTEDHVM_PRIV_H__
+#ifndef X86__HVM__SVM__NESTEDHVM_H
+#define X86__HVM__SVM__NESTEDHVM_H
 
 #include <xen/mm.h>
 #include <xen/types.h>
@@ -64,7 +64,7 @@ int cf_check nsvm_hap_walk_L1_p2m(
 
 int nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack);
 
-#endif /* __X86_HVM_SVM_NESTEDHVM_PRIV_H__ */
+#endif /* X86__HVM__SVM__NESTEDHVM_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index 8dbf37ff49..159cc71943 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -6,8 +6,8 @@
  * Copyright (c) 2004, Intel Corporation.
  */
 
-#ifndef __X86_HVM_SVM_SVM_PRIV_H__
-#define __X86_HVM_SVM_SVM_PRIV_H__
+#ifndef X86__HVM__SVM__SVM_H
+#define X86__HVM__SVM__SVM_H
 
 #include <xen/types.h>
 
@@ -86,7 +86,7 @@ unsigned int svm_get_task_switch_insn_len(void);
 #define _NPT_PFEC_in_gpt       33
 #define NPT_PFEC_in_gpt        (1UL<<_NPT_PFEC_in_gpt)
 
-#endif /* __X86_HVM_SVM_SVM_PRIV_H__ */
+#endif /* X86__HVM__SVM__SVM_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/hvm/viridian/private.h b/xen/arch/x86/hvm/viridian/private.h
index 1bf65c761c..c10544842f 100644
--- a/xen/arch/x86/hvm/viridian/private.h
+++ b/xen/arch/x86/hvm/viridian/private.h
@@ -1,7 +1,7 @@
 /* Copyright (c) 2018 Citrix Systems Inc. */
 
-#ifndef X86_HVM_VIRIDIAN_PRIVATE_H
-#define X86_HVM_VIRIDIAN_PRIVATE_H
+#ifndef X86__HVM__VIRIDIAN__PRIVATE_H
+#define X86__HVM__VIRIDIAN__PRIVATE_H
 
 #include <asm/hvm/save.h>
 #include <asm/hvm/viridian.h>
@@ -57,7 +57,7 @@ void viridian_dump_guest_page(const struct vcpu *v, const char *name,
 void viridian_map_guest_page(struct domain *d, struct viridian_page *vp);
 void viridian_unmap_guest_page(struct viridian_page *vp);
 
-#endif /* X86_HVM_VIRIDIAN_PRIVATE_H */
+#endif /* X86__HVM__VIRIDIAN__PRIVATE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 217819dd61..5784b10b1f 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_X86_ACPI_H
-#define _ASM_X86_ACPI_H
+#ifndef ASM__X86__ACPI_H
+#define ASM__X86__ACPI_H
 
 /*
  *  Copyright (C) 2001 Paul Diefenbaugh <paul.s.diefenbaugh@intel.com>
diff --git a/xen/arch/x86/include/asm/alternative-asm.h b/xen/arch/x86/include/asm/alternative-asm.h
index 83e8594f0e..9ad8fb9213 100644
--- a/xen/arch/x86/include/asm/alternative-asm.h
+++ b/xen/arch/x86/include/asm/alternative-asm.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_X86_ALTERNATIVE_ASM_H_
-#define _ASM_X86_ALTERNATIVE_ASM_H_
+#ifndef ASM__X86__ALTERNATIVE_ASM_H
+#define ASM__X86__ALTERNATIVE_ASM_H
 
 #include <asm/nops.h>
 
@@ -115,7 +115,7 @@
 #undef as_true
 
 #endif /* __ASSEMBLY__ */
-#endif /* _ASM_X86_ALTERNATIVE_ASM_H_ */
+#endif /* ASM__X86__ALTERNATIVE_ASM_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index 38472fb58e..d4c0fb014c 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -1,5 +1,5 @@
-#ifndef __X86_ALTERNATIVE_H__
-#define __X86_ALTERNATIVE_H__
+#ifndef ASM__X86__ALTERNATIVE_H
+#define ASM__X86__ALTERNATIVE_H
 
 #ifdef __ASSEMBLY__
 #include <asm/alternative-asm.h>
@@ -423,4 +423,4 @@ extern void alternative_branches(void);
 
 #endif /*  !__ASSEMBLY__  */
 
-#endif /* __X86_ALTERNATIVE_H__ */
+#endif /* ASM__X86__ALTERNATIVE_H */
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index c57a8c5588..f43b075ed0 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -4,8 +4,8 @@
  * Copyright (c) 2014, Intel Corporation.
  */
 
-#ifndef __ASM_X86_ALTP2M_H
-#define __ASM_X86_ALTP2M_H
+#ifndef ASM__X86__ALTP2M_H
+#define ASM__X86__ALTP2M_H
 
 #ifdef CONFIG_ALTP2M
 
@@ -46,4 +46,4 @@ void altp2m_vcpu_disable_ve(struct vcpu *v);
 
 #endif
 
-#endif /* __ASM_X86_ALTP2M_H */
+#endif /* ASM__X86__ALTP2M_H */
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 9c9599a622..7dbd8fae06 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -2,8 +2,8 @@
  * amd.h - AMD processor specific definitions
  */
 
-#ifndef __AMD_H__
-#define __AMD_H__
+#ifndef ASM__X86__AMD_H
+#define ASM__X86__AMD_H
 
 #include <asm/cpufeature.h>
 
@@ -174,4 +174,4 @@ bool amd_setup_legacy_ssbd(void);
 void amd_set_legacy_ssbd(bool enable);
 void amd_set_cpuid_user_dis(bool enable);
 
-#endif /* __AMD_H__ */
+#endif /* ASM__X86__AMD_H */
diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index d8eda6df6d..87970cfce7 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_APIC_H
-#define __ASM_APIC_H
+#ifndef ASM__X86__APIC_H
+#define ASM__X86__APIC_H
 
 #include <asm/apicdef.h>
 #include <asm/fixmap.h>
@@ -201,4 +201,4 @@ extern unsigned int nmi_watchdog;
 #define NMI_NONE	0
 #define NMI_LOCAL_APIC	1
 
-#endif /* __ASM_APIC_H */
+#endif /* ASM__X86__APIC_H */
diff --git a/xen/arch/x86/include/asm/apicdef.h b/xen/arch/x86/include/asm/apicdef.h
index 49e29ec801..8d9a29d488 100644
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_APICDEF_H
-#define __ASM_APICDEF_H
+#ifndef ASM__X86__APICDEF_H
+#define ASM__X86__APICDEF_H
 
 /*
  * Constants for various Intel APICs. (local APIC, IOAPIC, etc.)
diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index 92b4116a15..812bd5c52a 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -1,6 +1,6 @@
 
-#ifndef __X86_ASM_DEFNS_H__
-#define __X86_ASM_DEFNS_H__
+#ifndef ASM__X86__ASM_DEFNS_H
+#define ASM__X86__ASM_DEFNS_H
 
 #ifndef COMPILE_OFFSETS
 /* NB. Auto-generated from arch/.../asm-offsets.c */
@@ -346,4 +346,4 @@ static always_inline void stac(void)
 #define ASM_CONSTANT(name, value)                \
     asm ( ".equ " #name ", %P0; .global " #name  \
           :: "i" ((value)) );
-#endif /* __X86_ASM_DEFNS_H__ */
+#endif /* ASM__X86__ASM_DEFNS_H */
diff --git a/xen/arch/x86/include/asm/atomic.h b/xen/arch/x86/include/asm/atomic.h
index 16bd0ebfd7..f852b154ef 100644
--- a/xen/arch/x86/include/asm/atomic.h
+++ b/xen/arch/x86/include/asm/atomic.h
@@ -1,5 +1,5 @@
-#ifndef __ARCH_X86_ATOMIC__
-#define __ARCH_X86_ATOMIC__
+#ifndef ASM__X86__ATOMIC_H
+#define ASM__X86__ATOMIC_H
 
 #include <xen/atomic.h>
 #include <asm/system.h>
@@ -236,4 +236,4 @@ static inline void atomic_and(int m, atomic_t *v)
 
 #define atomic_xchg(v, new) (xchg(&((v)->counter), new))
 
-#endif /* __ARCH_X86_ATOMIC__ */
+#endif /* ASM__X86__ATOMIC_H */
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 39e37f1cbe..613310c1e2 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -1,5 +1,5 @@
-#ifndef _X86_BITOPS_H
-#define _X86_BITOPS_H
+#ifndef ASM__X86__BITOPS_H
+#define ASM__X86__BITOPS_H
 
 /*
  * Copyright 1992, Linus Torvalds.
@@ -498,4 +498,4 @@ static always_inline unsigned int arch_hweightl(unsigned long x)
 }
 #define arch_hweightl arch_hweightl
 
-#endif /* _X86_BITOPS_H */
+#endif /* ASM__X86__BITOPS_H */
diff --git a/xen/arch/x86/include/asm/bug.h b/xen/arch/x86/include/asm/bug.h
index e748b6c2f2..59a9871cba 100644
--- a/xen/arch/x86/include/asm/bug.h
+++ b/xen/arch/x86/include/asm/bug.h
@@ -1,5 +1,5 @@
-#ifndef __X86_BUG_H__
-#define __X86_BUG_H__
+#ifndef ASM__X86__BUG_H
+#define ASM__X86__BUG_H
 
 /*
  * Please do not include in the header any header that might
@@ -68,4 +68,4 @@
 
 #endif /* !__ASSEMBLY__ */
 
-#endif /* __X86_BUG_H__ */
+#endif /* ASM__X86__BUG_H */
diff --git a/xen/arch/x86/include/asm/byteorder.h b/xen/arch/x86/include/asm/byteorder.h
index a877c07f67..802d50e3fc 100644
--- a/xen/arch/x86/include/asm/byteorder.h
+++ b/xen/arch/x86/include/asm/byteorder.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_X86_BYTEORDER_H__
-#define __ASM_X86_BYTEORDER_H__
+#ifndef ASM__X86__BYTEORDER_H
+#define ASM__X86__BYTEORDER_H
 
 #include <xen/types.h>
 #include <xen/compiler.h>
@@ -33,4 +33,4 @@ static inline attr_const __u64 ___arch__swab64(__u64 val)
 
 #include <xen/byteorder/little_endian.h>
 
-#endif /* __ASM_X86_BYTEORDER_H__ */
+#endif /* ASM__X86__BYTEORDER_H */
diff --git a/xen/arch/x86/include/asm/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
index 7ed69d3910..53c86f0d5b 100644
--- a/xen/arch/x86/include/asm/bzimage.h
+++ b/xen/arch/x86/include/asm/bzimage.h
@@ -1,5 +1,5 @@
-#ifndef __X86_BZIMAGE_H__
-#define __X86_BZIMAGE_H__
+#ifndef ASM__X86__BZIMAGE_H
+#define ASM__X86__BZIMAGE_H
 
 #include <xen/init.h>
 
@@ -8,4 +8,4 @@ unsigned long bzimage_headroom(void *image_start, unsigned long image_length);
 int bzimage_parse(void *image_base, void **image_start,
                   unsigned long *image_len);
 
-#endif /* __X86_BZIMAGE_H__ */
+#endif /* ASM__X86__BZIMAGE_H */
diff --git a/xen/arch/x86/include/asm/cache.h b/xen/arch/x86/include/asm/cache.h
index f15d10dc7f..8683cecee2 100644
--- a/xen/arch/x86/include/asm/cache.h
+++ b/xen/arch/x86/include/asm/cache.h
@@ -1,8 +1,8 @@
 /*
  * include/asm-x86/cache.h
  */
-#ifndef __ARCH_X86_CACHE_H
-#define __ARCH_X86_CACHE_H
+#ifndef ASM__X86__CACHE_H
+#define ASM__X86__CACHE_H
 
 
 /* L1 cache line size */
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index f8a5a4913b..9d931f4ace 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -4,8 +4,8 @@
  * A Linux-style configuration list.
  */
 
-#ifndef __X86_CONFIG_H__
-#define __X86_CONFIG_H__
+#ifndef ASM__X86__CONFIG_H
+#define ASM__X86__CONFIG_H
 
 #define LONG_BYTEORDER 3
 #define CONFIG_PAGING_LEVELS 4
@@ -292,4 +292,4 @@ extern unsigned long xen_phys_start;
 
 #define ARCH_CRASH_SAVE_VMCOREINFO
 
-#endif /* __X86_CONFIG_H__ */
+#endif /* ASM__X86__CONFIG_H */
diff --git a/xen/arch/x86/include/asm/cpu-policy.h b/xen/arch/x86/include/asm/cpu-policy.h
index 99d5a8e67e..c69df4526f 100644
--- a/xen/arch/x86/include/asm/cpu-policy.h
+++ b/xen/arch/x86/include/asm/cpu-policy.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef X86_CPU_POLICY_H
-#define X86_CPU_POLICY_H
+#ifndef ASM__X86__CPU_POLICY_H
+#define ASM__X86__CPU_POLICY_H
 
 struct cpu_policy;
 struct domain;
@@ -30,4 +30,4 @@ void recalculate_cpuid_policy(struct domain *d);
  */
 void calculate_raw_cpu_policy(void);
 
-#endif /* X86_CPU_POLICY_H */
+#endif /* ASM__X86__CPU_POLICY_H */
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 3a06b6f297..478b9cd2bd 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -3,8 +3,8 @@
  *
  * Defines x86 CPU feature bits
  */
-#ifndef __ASM_I386_CPUFEATURE_H
-#define __ASM_I386_CPUFEATURE_H
+#ifndef ASM__X86__CPUFEATURE_H
+#define ASM__X86__CPUFEATURE_H
 
 #include <xen/cache.h>
 #include <xen/const.h>
@@ -281,7 +281,7 @@ struct cpuid4_info {
 int cpuid4_cache_lookup(int index, struct cpuid4_info *this_leaf);
 #endif /* !__ASSEMBLY__ */
 
-#endif /* __ASM_I386_CPUFEATURE_H */
+#endif /* ASM__X86__CPUFEATURE_H */
 
 /* 
  * Local Variables:
diff --git a/xen/arch/x86/include/asm/cpufeatureset.h b/xen/arch/x86/include/asm/cpufeatureset.h
index a9c51bc514..037b4b6997 100644
--- a/xen/arch/x86/include/asm/cpufeatureset.h
+++ b/xen/arch/x86/include/asm/cpufeatureset.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_X86_CPUFEATURESET_H__
-#define __XEN_X86_CPUFEATURESET_H__
+#ifndef ASM__X86__CPUFEATURESET_H
+#define ASM__X86__CPUFEATURESET_H
 
 #ifndef __ASSEMBLY__
 
@@ -27,7 +27,7 @@ enum {
 
 #undef XEN_CPUFEATURE
 
-#endif /* !__XEN_X86_CPUFEATURESET_H__ */
+#endif /* !ASM__X86__CPUFEATURESET_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/cpuid.h b/xen/arch/x86/include/asm/cpuid.h
index b32ba0bbfe..6cfebbb4eb 100644
--- a/xen/arch/x86/include/asm/cpuid.h
+++ b/xen/arch/x86/include/asm/cpuid.h
@@ -1,5 +1,5 @@
-#ifndef __X86_CPUID_H__
-#define __X86_CPUID_H__
+#ifndef ASM__X86__CPUID_H
+#define ASM__X86__CPUID_H
 
 #include <asm/cpufeatureset.h>
 
@@ -51,7 +51,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
                  uint32_t subleaf, struct cpuid_leaf *res);
 
 #endif /* __ASSEMBLY__ */
-#endif /* !__X86_CPUID_H__ */
+#endif /* !ASM__X86__CPUID_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/cpuidle.h b/xen/arch/x86/include/asm/cpuidle.h
index 3a6b73142b..bfa11d1451 100644
--- a/xen/arch/x86/include/asm/cpuidle.h
+++ b/xen/arch/x86/include/asm/cpuidle.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_X86_CPUIDLE_H__
-#define __ASM_X86_CPUIDLE_H__
+#ifndef ASM__X86__CPUIDLE_H
+#define ASM__X86__CPUIDLE_H
 
 #include <xen/cpuidle.h>
 #include <xen/notifier.h>
diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index bcec328c98..1aebbf991b 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -4,8 +4,8 @@
  * Information structure that lives at the bottom of the per-cpu Xen stack.
  */
 
-#ifndef __X86_CURRENT_H__
-#define __X86_CURRENT_H__
+#ifndef ASM__X86__CURRENT_H
+#define ASM__X86__CURRENT_H
 
 #include <xen/percpu.h>
 #include <xen/page-size.h>
@@ -211,4 +211,4 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
  */
 DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
 
-#endif /* __X86_CURRENT_H__ */
+#endif /* ASM__X86__CURRENT_H */
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index 23aa592e40..05f1925f9b 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -1,5 +1,5 @@
-#ifndef _X86_DEBUGREG_H
-#define _X86_DEBUGREG_H
+#ifndef ASM__X86__DEBUGREG_H
+#define ASM__X86__DEBUGREG_H
 
 #include <asm/x86-defns.h>
 
@@ -140,4 +140,4 @@ static inline unsigned int x86_bp_width(unsigned int dr7, unsigned int bp)
     return 1U << raw;
 }
 
-#endif /* _X86_DEBUGREG_H */
+#endif /* ASM__X86__DEBUGREG_H */
diff --git a/xen/arch/x86/include/asm/desc.h b/xen/arch/x86/include/asm/desc.h
index a1e0807d97..1598205ab0 100644
--- a/xen/arch/x86/include/asm/desc.h
+++ b/xen/arch/x86/include/asm/desc.h
@@ -1,5 +1,5 @@
-#ifndef __ARCH_DESC_H
-#define __ARCH_DESC_H
+#ifndef ASM__X86__DESC_H
+#define ASM__X86__DESC_H
 
 #include <asm/page.h>
 
@@ -240,4 +240,4 @@ static inline void ltr(unsigned int sel)
 
 #endif /* !__ASSEMBLY__ */
 
-#endif /* __ARCH_DESC_H */
+#endif /* ASM__X86__DESC_H */
diff --git a/xen/arch/x86/include/asm/device.h b/xen/arch/x86/include/asm/device.h
index f2acc7effd..32a71e35b0 100644
--- a/xen/arch/x86/include/asm/device.h
+++ b/xen/arch/x86/include/asm/device.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_X86_DEVICE_H
-#define __ASM_X86_DEVICE_H
+#ifndef ASM__X86__DEVICE_H
+#define ASM__X86__DEVICE_H
 
 #include <xen/pci.h>
 
@@ -13,7 +13,7 @@ typedef struct pci_dev device_t;
 #define dev_is_pci(dev) ((void)(dev), 1)
 #define pci_to_dev(pci) (pci)
 
-#endif /* __ASM_X86_DEVICE_H */
+#endif /* ASM__X86__DEVICE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 107c1ff983..8fafa7e3a4 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -1,5 +1,5 @@
-#ifndef _DOM0_BUILD_H_
-#define _DOM0_BUILD_H_
+#ifndef ASM__X86__DOM0_BUILD_H
+#define ASM__X86__DOM0_BUILD_H
 
 #include <xen/libelf.h>
 #include <xen/sched.h>
@@ -29,7 +29,7 @@ unsigned long dom0_paging_pages(const struct domain *d,
 void dom0_update_physmap(bool compat, unsigned long pfn,
                          unsigned long mfn, unsigned long vphysmap_s);
 
-#endif	/* _DOM0_BUILD_H_ */
+#endif	/* ASM__X86__DOM0_BUILD_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index bdcdb8de09..188b063788 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_DOMAIN_H__
-#define __ASM_DOMAIN_H__
+#ifndef ASM__X86__DOMAIN_H
+#define ASM__X86__DOMAIN_H
 
 #include <xen/mm.h>
 #include <xen/radix-tree.h>
@@ -796,7 +796,7 @@ unsigned int domain_max_paddr_bits(const struct domain *d);
 #define arch_init_idle_domain arch_init_idle_domain
 void arch_init_idle_domain(struct domain *d);
 
-#endif /* __ASM_DOMAIN_H__ */
+#endif /* ASM__X86__DOMAIN_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/e820.h b/xen/arch/x86/include/asm/e820.h
index af90085d65..bda19aab2c 100644
--- a/xen/arch/x86/include/asm/e820.h
+++ b/xen/arch/x86/include/asm/e820.h
@@ -1,5 +1,5 @@
-#ifndef __E820_HEADER
-#define __E820_HEADER
+#ifndef ASM__X86__E820_H
+#define ASM__X86__E820_H
 
 /*
  * PC BIOS standard E820 types and structure.
@@ -40,4 +40,4 @@ extern struct e820map e820_raw;
 extern struct e820map bios_e820map[];
 extern unsigned int bios_e820nr;
 
-#endif /*__E820_HEADER*/
+#endif /*ASM__X86__E820_H*/
diff --git a/xen/arch/x86/include/asm/edd.h b/xen/arch/x86/include/asm/edd.h
index afaa23732a..f3cda0c1d7 100644
--- a/xen/arch/x86/include/asm/edd.h
+++ b/xen/arch/x86/include/asm/edd.h
@@ -20,8 +20,8 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __XEN_EDD_H__
-#define __XEN_EDD_H__
+#ifndef ASM__X86__EDD_H
+#define ASM__X86__EDD_H
 
 #ifndef __ASSEMBLY__
 
@@ -161,4 +161,4 @@ extern u8 boot_edd_info_nr;
 #define EDDEXTSIZE              8
 #define EDDPARMSIZE             74
 
-#endif /* __XEN_EDD_H__ */
+#endif /* ASM__X86__EDD_H */
diff --git a/xen/arch/x86/include/asm/elf.h b/xen/arch/x86/include/asm/elf.h
index 1d7ea96e22..9ce6f69830 100644
--- a/xen/arch/x86/include/asm/elf.h
+++ b/xen/arch/x86/include/asm/elf.h
@@ -1,5 +1,5 @@
-#ifndef __X86_ELF_H__
-#define __X86_ELF_H__
+#ifndef ASM__X86__ELF_H
+#define ASM__X86__ELF_H
 
 typedef struct {
     unsigned long cr0, cr2, cr3, cr4;
@@ -7,7 +7,7 @@ typedef struct {
 
 #include <asm/x86_64/elf.h>
 
-#endif /* __X86_ELF_H__ */
+#endif /* ASM__X86__ELF_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/endbr.h b/xen/arch/x86/include/asm/endbr.h
index ba3bae7147..f6b8b9435e 100644
--- a/xen/arch/x86/include/asm/endbr.h
+++ b/xen/arch/x86/include/asm/endbr.h
@@ -2,8 +2,8 @@
 /******************************************************************************
  * Copyright (c) 2021-2022 Citrix Systems Ltd.
  */
-#ifndef XEN_ASM_ENDBR_H
-#define XEN_ASM_ENDBR_H
+#ifndef ASM__X86__ENDBR_H
+#define ASM__X86__ENDBR_H
 
 #include <xen/types.h>
 
@@ -66,4 +66,4 @@ static inline void place_endbr64_poison(void *ptr)
     *(uint32_t *)ptr = gen_endbr64_poison();
 }
 
-#endif /* XEN_ASM_ENDBR_H */
+#endif /* ASM__X86__ENDBR_H */
diff --git a/xen/arch/x86/include/asm/event.h b/xen/arch/x86/include/asm/event.h
index 5e09ede6d7..eb91d3345a 100644
--- a/xen/arch/x86/include/asm/event.h
+++ b/xen/arch/x86/include/asm/event.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef __ASM_EVENT_H__
-#define __ASM_EVENT_H__
+#ifndef ASM__X86__EVENT_H
+#define ASM__X86__EVENT_H
 
 #include <xen/shared.h>
 
diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
index 516ec3fa6c..53eb149d1a 100644
--- a/xen/arch/x86/include/asm/fixmap.h
+++ b/xen/arch/x86/include/asm/fixmap.h
@@ -9,8 +9,8 @@
  * Modifications for Xen are copyright (c) 2002-2004, K A Fraser
  */
 
-#ifndef _ASM_FIXMAP_H
-#define _ASM_FIXMAP_H
+#ifndef ASM__X86__FIXMAP_H
+#define ASM__X86__FIXMAP_H
 
 #include <xen/page-size.h>
 
diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index bb0ad58db4..7f60cca86c 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2003-2004, K A Fraser
  */
 
-#ifndef __FLUSHTLB_H__
-#define __FLUSHTLB_H__
+#ifndef ASM__X86__FLUSHTLB_H
+#define ASM__X86__FLUSHTLB_H
 
 #include <xen/mm.h>
 #include <xen/percpu.h>
@@ -201,4 +201,4 @@ static inline int clean_dcache_va_range(const void *p, unsigned long size)
 unsigned int guest_flush_tlb_flags(const struct domain *d);
 void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
 
-#endif /* __FLUSHTLB_H__ */
+#endif /* ASM__X86__FLUSHTLB_H */
diff --git a/xen/arch/x86/include/asm/gdbsx.h b/xen/arch/x86/include/asm/gdbsx.h
index e906be9ea3..d22e5ad361 100644
--- a/xen/arch/x86/include/asm/gdbsx.h
+++ b/xen/arch/x86/include/asm/gdbsx.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __X86_GDBX_H__
-#define __X86_GDBX_H__
+#ifndef ASM__X86__GDBSX_H
+#define ASM__X86__GDBSX_H
 
 #include <xen/stdbool.h>
 
@@ -26,4 +26,4 @@ static inline int gdbsx_domctl(
 }
 
 #endif /* CONFIG_GDBSX */
-#endif /* __X86_GDBX_H__ */
+#endif /* ASM__X86__GDBSX_H */
diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
index a694371c6d..9e6b7c7530 100644
--- a/xen/arch/x86/include/asm/genapic.h
+++ b/xen/arch/x86/include/asm/genapic.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_GENAPIC_H
-#define _ASM_GENAPIC_H 1
+#ifndef ASM__X86__GENAPIC_H
+#define ASM__X86__GENAPIC_H 1
 
 #include <xen/cpumask.h>
 
diff --git a/xen/arch/x86/include/asm/grant_table.h b/xen/arch/x86/include/asm/grant_table.h
index 5c23cec90c..67a4f84cbb 100644
--- a/xen/arch/x86/include/asm/grant_table.h
+++ b/xen/arch/x86/include/asm/grant_table.h
@@ -4,8 +4,8 @@
  * Copyright (c) 2004-2005 K A Fraser
  */
 
-#ifndef __ASM_GRANT_TABLE_H__
-#define __ASM_GRANT_TABLE_H__
+#ifndef ASM__X86__GRANT_TABLE_H
+#define ASM__X86__GRANT_TABLE_H
 
 #include <asm/paging.h>
 
@@ -72,4 +72,4 @@ static inline void gnttab_clear_flags(struct domain *d,
 #define gnttab_need_iommu_mapping(d)                \
     (!paging_mode_translate(d) && need_iommu_pt_sync(d))
 
-#endif /* __ASM_GRANT_TABLE_H__ */
+#endif /* ASM__X86__GRANT_TABLE_H */
diff --git a/xen/arch/x86/include/asm/guest.h b/xen/arch/x86/include/asm/guest.h
index c3124c7b8d..826000261c 100644
--- a/xen/arch/x86/include/asm/guest.h
+++ b/xen/arch/x86/include/asm/guest.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
-#ifndef __X86_GUEST_H__
-#define __X86_GUEST_H__
+#ifndef ASM__X86__GUEST_H
+#define ASM__X86__GUEST_H
 
 #include <asm/guest/hyperv.h>
 #include <asm/guest/hypervisor.h>
@@ -15,7 +15,7 @@
 #include <asm/guest/xen-hcall.h>
 #include <asm/pv/shim.h>
 
-#endif /* __X86_GUEST_H__ */
+#endif /* ASM__X86__GUEST_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/guest/hyperv-hcall.h b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
index b76dbf9ccc..2fdf6d5143 100644
--- a/xen/arch/x86/include/asm/guest/hyperv-hcall.h
+++ b/xen/arch/x86/include/asm/guest/hyperv-hcall.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2019 Microsoft.
  */
 
-#ifndef __X86_HYPERV_HCALL_H__
-#define __X86_HYPERV_HCALL_H__
+#ifndef ASM__X86__GUEST__HYPERV_HCALL_H
+#define ASM__X86__GUEST__HYPERV_HCALL_H
 
 #include <xen/lib.h>
 #include <xen/page-size.h>
@@ -73,7 +73,7 @@ static inline uint64_t hv_do_rep_hypercall(uint16_t code, uint16_t rep_count,
     return status;
 }
 
-#endif /* __X86_HYPERV_HCALL_H__ */
+#endif /* ASM__X86__GUEST__HYPERV_HCALL_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
index a6915ad731..ba7ca0e450 100644
--- a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
+++ b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
@@ -6,8 +6,8 @@
  * https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/reference/tlfs
  */
 
-#ifndef _ASM_X86_HYPERV_TLFS_H
-#define _ASM_X86_HYPERV_TLFS_H
+#ifndef ASM__X86__GUEST__HYPERV_TLFS_H
+#define ASM__X86__GUEST__HYPERV_TLFS_H
 
 #include <xen/bitops.h>
 #include <xen/page-size.h>
diff --git a/xen/arch/x86/include/asm/guest/hyperv.h b/xen/arch/x86/include/asm/guest/hyperv.h
index c05efdce71..fe0c2c485c 100644
--- a/xen/arch/x86/include/asm/guest/hyperv.h
+++ b/xen/arch/x86/include/asm/guest/hyperv.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2019 Microsoft.
  */
 
-#ifndef __X86_GUEST_HYPERV_H__
-#define __X86_GUEST_HYPERV_H__
+#ifndef ASM__X86__GUEST__HYPERV_H
+#define ASM__X86__GUEST__HYPERV_H
 
 #include <xen/types.h>
 
@@ -62,7 +62,7 @@ const struct hypervisor_ops *hyperv_probe(void);
 static inline const struct hypervisor_ops *hyperv_probe(void) { return NULL; }
 
 #endif /* CONFIG_HYPERV_GUEST */
-#endif /* __X86_GUEST_HYPERV_H__ */
+#endif /* ASM__X86__GUEST__HYPERV_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/guest/hypervisor.h b/xen/arch/x86/include/asm/guest/hypervisor.h
index c8f18a035e..5ab900e14c 100644
--- a/xen/arch/x86/include/asm/guest/hypervisor.h
+++ b/xen/arch/x86/include/asm/guest/hypervisor.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2019 Microsoft.
  */
 
-#ifndef __X86_HYPERVISOR_H__
-#define __X86_HYPERVISOR_H__
+#ifndef ASM__X86__GUEST__HYPERVISOR_H
+#define ASM__X86__GUEST__HYPERVISOR_H
 
 #include <xen/cpumask.h>
 
@@ -61,7 +61,7 @@ static inline int hypervisor_flush_tlb(const cpumask_t *mask, const void *va,
 
 #endif  /* CONFIG_GUEST */
 
-#endif /* __X86_HYPERVISOR_H__ */
+#endif /* ASM__X86__GUEST__HYPERVISOR_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/guest/pvh-boot.h b/xen/arch/x86/include/asm/guest/pvh-boot.h
index 247ba6899e..77f1fb7190 100644
--- a/xen/arch/x86/include/asm/guest/pvh-boot.h
+++ b/xen/arch/x86/include/asm/guest/pvh-boot.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
-#ifndef __X86_PVH_BOOT_H__
-#define __X86_PVH_BOOT_H__
+#ifndef ASM__X86__GUEST__PVH_BOOT_H
+#define ASM__X86__GUEST__PVH_BOOT_H
 
 #include <xen/multiboot.h>
 
@@ -34,7 +34,7 @@ static inline void pvh_print_info(void)
 }
 
 #endif /* CONFIG_PVH_GUEST */
-#endif /* __X86_PVH_BOOT_H__ */
+#endif /* ASM__X86__GUEST__PVH_BOOT_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/guest/xen-hcall.h b/xen/arch/x86/include/asm/guest/xen-hcall.h
index 665b472d05..c078ade2a7 100644
--- a/xen/arch/x86/include/asm/guest/xen-hcall.h
+++ b/xen/arch/x86/include/asm/guest/xen-hcall.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
-#ifndef __X86_XEN_HYPERCALL_H__
-#define __X86_XEN_HYPERCALL_H__
+#ifndef ASM__X86__GUEST__XEN_HCALL_H
+#define ASM__X86__GUEST__XEN_HCALL_H
 
 #ifdef CONFIG_XEN_GUEST
 
@@ -188,7 +188,7 @@ static inline long xen_hypercall_shutdown(unsigned int reason)
 }
 
 #endif /* CONFIG_XEN_GUEST */
-#endif /* __X86_XEN_HYPERCALL_H__ */
+#endif /* ASM__X86__GUEST__XEN_HCALL_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/guest/xen.h b/xen/arch/x86/include/asm/guest/xen.h
index c330c4d400..1e46fbf0d3 100644
--- a/xen/arch/x86/include/asm/guest/xen.h
+++ b/xen/arch/x86/include/asm/guest/xen.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
-#ifndef __X86_GUEST_XEN_H__
-#define __X86_GUEST_XEN_H__
+#ifndef ASM__X86__GUEST__XEN_H
+#define ASM__X86__GUEST__XEN_H
 
 #include <xen/types.h>
 
@@ -37,7 +37,7 @@ DECLARE_PER_CPU(struct vcpu_info *, vcpu_info);
 static inline const struct hypervisor_ops *xg_probe(void) { return NULL; }
 
 #endif /* CONFIG_XEN_GUEST */
-#endif /* __X86_GUEST_XEN_H__ */
+#endif /* ASM__X86__GUEST__XEN_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/guest_access.h b/xen/arch/x86/include/asm/guest_access.h
index 69716c8b41..e42d2c59ba 100644
--- a/xen/arch/x86/include/asm/guest_access.h
+++ b/xen/arch/x86/include/asm/guest_access.h
@@ -4,8 +4,8 @@
  * Copyright (c) 2006, K A Fraser
  */
 
-#ifndef __ASM_X86_GUEST_ACCESS_H__
-#define __ASM_X86_GUEST_ACCESS_H__
+#ifndef ASM__X86__GUEST_ACCESS_H
+#define ASM__X86__GUEST_ACCESS_H
 
 #include <asm/uaccess.h>
 #include <asm/paging.h>
@@ -47,7 +47,7 @@
                      (last)-(first)+1,                  \
                      sizeof(*(hnd).p)))
 
-#endif /* __ASM_X86_GUEST_ACCESS_H__ */
+#endif /* ASM__X86__GUEST_ACCESS_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/guest_atomics.h b/xen/arch/x86/include/asm/guest_atomics.h
index c2dec0d650..99f861fc39 100644
--- a/xen/arch/x86/include/asm/guest_atomics.h
+++ b/xen/arch/x86/include/asm/guest_atomics.h
@@ -1,5 +1,5 @@
-#ifndef _X86_GUEST_ATOMICS_H
-#define _X86_GUEST_ATOMICS_H
+#ifndef ASM__X86__GUEST_ATOMICS_H
+#define ASM__X86__GUEST_ATOMICS_H
 
 #include <xen/bitops.h>
 
@@ -22,7 +22,7 @@
 #define guest_cmpxchg(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))
 #define guest_cmpxchg64 guest_cmpxchg
 
-#endif /* _X86_GUEST_ATOMICS_H */
+#endif /* ASM__X86__GUEST_ATOMICS_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/guest_pt.h b/xen/arch/x86/include/asm/guest_pt.h
index 21473f9bbc..943504dc76 100644
--- a/xen/arch/x86/include/asm/guest_pt.h
+++ b/xen/arch/x86/include/asm/guest_pt.h
@@ -13,8 +13,8 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
-#ifndef _XEN_ASM_GUEST_PT_H
-#define _XEN_ASM_GUEST_PT_H
+#ifndef ASM__X86__GUEST_PT_H
+#define ASM__X86__GUEST_PT_H
 
 #if !defined(GUEST_PAGING_LEVELS)
 #error GUEST_PAGING_LEVELS not defined
@@ -452,4 +452,4 @@ static inline void print_gw(const walk_t *gw)
         );
 }
 
-#endif /* _XEN_ASM_GUEST_PT_H */
+#endif /* ASM__X86__GUEST_PT_H */
diff --git a/xen/arch/x86/include/asm/hap.h b/xen/arch/x86/include/asm/hap.h
index f01ce73fb4..cf1a7584f3 100644
--- a/xen/arch/x86/include/asm/hap.h
+++ b/xen/arch/x86/include/asm/hap.h
@@ -10,8 +10,8 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
-#ifndef _XEN_HAP_H
-#define _XEN_HAP_H
+#ifndef ASM__X86__HAP_H
+#define ASM__X86__HAP_H
 
 #define HAP_PRINTK(_f, _a...)                                         \
     debugtrace_printk("hap: %s(): " _f, __func__, ##_a)
diff --git a/xen/arch/x86/include/asm/hardirq.h b/xen/arch/x86/include/asm/hardirq.h
index 342361cb6f..9385d220fc 100644
--- a/xen/arch/x86/include/asm/hardirq.h
+++ b/xen/arch/x86/include/asm/hardirq.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_HARDIRQ_H
-#define __ASM_HARDIRQ_H
+#ifndef ASM__X86__HARDIRQ_H
+#define ASM__X86__HARDIRQ_H
 
 #include <xen/cache.h>
 #include <xen/types.h>
@@ -34,4 +34,4 @@ void ack_bad_irq(unsigned int irq);
 extern void apic_intr_init(void);
 extern void smp_intr_init(void);
 
-#endif /* __ASM_HARDIRQ_H */
+#endif /* ASM__X86__HARDIRQ_H */
diff --git a/xen/arch/x86/include/asm/hpet.h b/xen/arch/x86/include/asm/hpet.h
index c402c63168..66c5867b96 100644
--- a/xen/arch/x86/include/asm/hpet.h
+++ b/xen/arch/x86/include/asm/hpet.h
@@ -1,5 +1,5 @@
-#ifndef __X86_HPET_H__
-#define __X86_HPET_H__
+#ifndef ASM__X86__HPET_H
+#define ASM__X86__HPET_H
 
 /*
  * Documentation on HPET can be found at:
@@ -98,4 +98,4 @@ void hpet_disable_legacy_broadcast(void);
 
 extern void (*pv_rtc_handler)(uint8_t reg, uint8_t value);
 
-#endif /* __X86_HPET_H__ */
+#endif /* ASM__X86__HPET_H */
diff --git a/xen/arch/x86/include/asm/hvm/asid.h b/xen/arch/x86/include/asm/hvm/asid.h
index 17c58353d1..dff25733ed 100644
--- a/xen/arch/x86/include/asm/hvm/asid.h
+++ b/xen/arch/x86/include/asm/hvm/asid.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2009, Citrix Systems, Inc.
  */
 
-#ifndef __ASM_X86_HVM_ASID_H__
-#define __ASM_X86_HVM_ASID_H__
+#ifndef ASM__X86__HVM__ASID_H
+#define ASM__X86__HVM__ASID_H
 
 
 struct vcpu;
@@ -28,7 +28,7 @@ void hvm_asid_flush_core(void);
  * boolean indicating whether all ASIDs must be flushed. */
 bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid);
 
-#endif /* __ASM_X86_HVM_ASID_H__ */
+#endif /* ASM__X86__HVM__ASID_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/hvm/cacheattr.h b/xen/arch/x86/include/asm/hvm/cacheattr.h
index 79e721d074..fe7bb8d54f 100644
--- a/xen/arch/x86/include/asm/hvm/cacheattr.h
+++ b/xen/arch/x86/include/asm/hvm/cacheattr.h
@@ -1,5 +1,5 @@
-#ifndef __HVM_CACHEATTR_H__
-#define __HVM_CACHEATTR_H__
+#ifndef ASM__X86__HVM__CACHEATTR_H
+#define ASM__X86__HVM__CACHEATTR_H
 
 #include <xen/mm.h>
 
@@ -20,4 +20,4 @@ int hvm_get_mem_pinned_cacheattr(struct domain *d, gfn_t gfn,
 int hvm_set_mem_pinned_cacheattr(struct domain *d, uint64_t gfn_start,
                                  uint64_t gfn_end, uint32_t type);
 
-#endif /* __HVM_CACHEATTR_H__ */
+#endif /* ASM__X86__HVM__CACHEATTR_H */
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 333501d5f2..9d4137c43a 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -6,8 +6,8 @@
  * Copyright (c) 2005, International Business Machines Corporation
  */
 
-#ifndef __ASM_X86_HVM_DOMAIN_H__
-#define __ASM_X86_HVM_DOMAIN_H__
+#ifndef ASM__X86__HVM__DOMAIN_H
+#define ASM__X86__HVM__DOMAIN_H
 
 #include <xen/list.h>
 #include <xen/mm.h>
@@ -151,7 +151,7 @@ struct hvm_domain {
 #endif
 };
 
-#endif /* __ASM_X86_HVM_DOMAIN_H__ */
+#endif /* ASM__X86__HVM__DOMAIN_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
index 29d679442e..9e382803ef 100644
--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -9,8 +9,8 @@
  *    Keir Fraser <keir@xen.org>
  */
 
-#ifndef __ASM_X86_HVM_EMULATE_H__
-#define __ASM_X86_HVM_EMULATE_H__
+#ifndef ASM__X86__HVM__EMULATE_H
+#define ASM__X86__HVM__EMULATE_H
 
 #include <xen/err.h>
 #include <xen/mm.h>
@@ -143,7 +143,7 @@ static inline void hvmemul_write_cache(const struct vcpu *v, paddr_t gpa,
 void hvm_dump_emulation_state(const char *loglvl, const char *prefix,
                               struct hvm_emulate_ctxt *hvmemul_ctxt, int rc);
 
-#endif /* __ASM_X86_HVM_EMULATE_H__ */
+#endif /* ASM__X86__HVM__EMULATE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/hvm/grant_table.h b/xen/arch/x86/include/asm/hvm/grant_table.h
index 01e23f79b8..ec6c6251d3 100644
--- a/xen/arch/x86/include/asm/hvm/grant_table.h
+++ b/xen/arch/x86/include/asm/hvm/grant_table.h
@@ -7,8 +7,8 @@
  * Copyright (C) 2017 Wei Liu <wei.liu2@citrix.com>
  */
 
-#ifndef __X86_HVM_GRANT_TABLE_H__
-#define __X86_HVM_GRANT_TABLE_H__
+#ifndef ASM__X86__HVM__GRANT_TABLE_H
+#define ASM__X86__HVM__GRANT_TABLE_H
 
 #include <xen/mm-frame.h>
 
@@ -39,7 +39,7 @@ static inline int replace_grant_p2m_mapping(uint64_t addr, mfn_t frame,
 
 #endif
 
-#endif /* __X86_HVM_GRANT_TABLE_H__ */
+#endif /* ASM__X86__HVM__GRANT_TABLE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/hvm/guest_access.h b/xen/arch/x86/include/asm/hvm/guest_access.h
index edacba75db..007d1ff70b 100644
--- a/xen/arch/x86/include/asm/hvm/guest_access.h
+++ b/xen/arch/x86/include/asm/hvm/guest_access.h
@@ -1,8 +1,8 @@
-#ifndef __ASM_X86_HVM_GUEST_ACCESS_H__
-#define __ASM_X86_HVM_GUEST_ACCESS_H__
+#ifndef ASM__X86__HVM__GUEST_ACCESS_H
+#define ASM__X86__HVM__GUEST_ACCESS_H
 
 unsigned int copy_to_user_hvm(void *to, const void *from, unsigned int len);
 unsigned int clear_user_hvm(void *to, unsigned int len);
 unsigned int copy_from_user_hvm(void *to, const void *from, unsigned int len);
 
-#endif /* __ASM_X86_HVM_GUEST_ACCESS_H__ */
+#endif /* ASM__X86__HVM__GUEST_ACCESS_H */
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index dd7d4872b5..1a320fe5c8 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -6,8 +6,8 @@
  * Copyright (c) 2005, International Business Machines Corporation.
  */
 
-#ifndef __ASM_X86_HVM_HVM_H__
-#define __ASM_X86_HVM_HVM_H__
+#ifndef ASM__X86__HVM__HVM_H
+#define ASM__X86__HVM__HVM_H
 
 #include <xen/mm.h>
 
@@ -967,7 +967,7 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 
 #endif  /* CONFIG_HVM */
 
-#endif /* __ASM_X86_HVM_HVM_H__ */
+#endif /* ASM__X86__HVM__HVM_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index f2b8431fac..f7e4550f0a 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2004, Intel Corporation.
  */
 
-#ifndef __ASM_X86_HVM_IO_H__
-#define __ASM_X86_HVM_IO_H__
+#ifndef ASM__X86__HVM__IO_H
+#define ASM__X86__HVM__IO_H
 
 #include <xen/pci.h>
 #include <public/hvm/ioreq.h>
@@ -135,7 +135,7 @@ void destroy_vpci_mmcfg(struct domain *d);
 /* Remove MMCFG regions from a given rangeset. */
 int vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r);
 
-#endif /* __ASM_X86_HVM_IO_H__ */
+#endif /* ASM__X86__HVM__IO_H */
 
 
 /*
diff --git a/xen/arch/x86/include/asm/hvm/ioreq.h b/xen/arch/x86/include/asm/hvm/ioreq.h
index 84be14fd08..2e7254d640 100644
--- a/xen/arch/x86/include/asm/hvm/ioreq.h
+++ b/xen/arch/x86/include/asm/hvm/ioreq.h
@@ -5,15 +5,15 @@
  * Copyright (c) 2016 Citrix Systems Inc.
  */
 
-#ifndef __ASM_X86_HVM_IOREQ_H__
-#define __ASM_X86_HVM_IOREQ_H__
+#ifndef ASM__X86__HVM__IOREQ_H
+#define ASM__X86__HVM__IOREQ_H
 
 /* This correlation must not be altered */
 #define IOREQ_STATUS_HANDLED     X86EMUL_OKAY
 #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
 #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
 
-#endif /* __ASM_X86_HVM_IOREQ_H__ */
+#endif /* ASM__X86__HVM__IOREQ_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/hvm/irq.h b/xen/arch/x86/include/asm/hvm/irq.h
index 87e89993a4..41ae7eef8d 100644
--- a/xen/arch/x86/include/asm/hvm/irq.h
+++ b/xen/arch/x86/include/asm/hvm/irq.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2006, K A Fraser, XenSource Inc.
  */
 
-#ifndef __ASM_X86_HVM_IRQ_H__
-#define __ASM_X86_HVM_IRQ_H__
+#ifndef ASM__X86__HVM__IRQ_H
+#define ASM__X86__HVM__IRQ_H
 
 #include <xen/timer.h>
 
@@ -213,4 +213,4 @@ void hvm_set_callback_via(struct domain *d, uint64_t via);
 struct pirq;
 bool hvm_domain_use_pirq(const struct domain *d, const struct pirq *pirq);
 
-#endif /* __ASM_X86_HVM_IRQ_H__ */
+#endif /* ASM__X86__HVM__IRQ_H */
diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
index ea2c1bc328..323d749a73 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
@@ -5,8 +5,8 @@
  * Author: Christoph Egger <Christoph.Egger@amd.com>
  */
 
-#ifndef _HVM_NESTEDHVM_H
-#define _HVM_NESTEDHVM_H
+#ifndef ASM__X86__HVM__NESTEDHVM_H
+#define ASM__X86__HVM__NESTEDHVM_H
 
 #include <xen/types.h>         /* for uintNN_t */
 #include <xen/sched.h>         /* for struct vcpu, struct domain */
@@ -86,4 +86,4 @@ static inline bool vvmcx_valid(const struct vcpu *v)
 void start_nested_svm(struct hvm_function_table *hvm_function_table);
 void start_nested_vmx(struct hvm_function_table *hvm_function_table);
 
-#endif /* _HVM_NESTEDHVM_H */
+#endif /* ASM__X86__HVM__NESTEDHVM_H */
diff --git a/xen/arch/x86/include/asm/hvm/save.h b/xen/arch/x86/include/asm/hvm/save.h
index ec8de02931..fc1e81fd28 100644
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -3,8 +3,8 @@
  * save.h: HVM support routines for save/restore
  */
 
-#ifndef __XEN_HVM_SAVE_H__
-#define __XEN_HVM_SAVE_H__
+#ifndef ASM__X86__HVM__SAVE_H
+#define ASM__X86__HVM__SAVE_H
 
 #include <xen/types.h>
 #include <xen/init.h>
@@ -146,4 +146,4 @@ int hvm_save_one(struct domain *d, unsigned int typecode, unsigned int instance,
                  XEN_GUEST_HANDLE_64(uint8) handle, uint64_t *bufsz);
 int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h);
 
-#endif /* __XEN_HVM_SAVE_H__ */
+#endif /* ASM__X86__HVM__SAVE_H */
diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/include/asm/hvm/support.h
index 2a7ba36af0..f2d77b9268 100644
--- a/xen/arch/x86/include/asm/hvm/support.h
+++ b/xen/arch/x86/include/asm/hvm/support.h
@@ -6,8 +6,8 @@
  * Copyright (c) 2005, International Business Machines Corporation.
  */
 
-#ifndef __ASM_X86_HVM_SUPPORT_H__
-#define __ASM_X86_HVM_SUPPORT_H__
+#ifndef ASM__X86__HVM__SUPPORT_H
+#define ASM__X86__HVM__SUPPORT_H
 
 #include <xen/types.h>
 #include <xen/sched.h>
@@ -146,7 +146,7 @@ int __must_check hvm_msr_read_intercept(
 int __must_check hvm_msr_write_intercept(
     unsigned int msr, uint64_t msr_content, bool may_defer);
 
-#endif /* __ASM_X86_HVM_SUPPORT_H__ */
+#endif /* ASM__X86__HVM__SUPPORT_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
index 205989e800..6c9f29f06c 100644
--- a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
@@ -4,8 +4,8 @@
  * Copyright (c) 2011, Advanced Micro Devices, Inc
  *
  */
-#ifndef __ASM_X86_HVM_SVM_NESTEDSVM_H__
-#define __ASM_X86_HVM_SVM_NESTEDSVM_H__
+#ifndef ASM__X86__HVM__SVM__NESTEDSVM_H
+#define ASM__X86__HVM__SVM__NESTEDSVM_H
 
 #include <xen/types.h>
 
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 4eeeb25da9..f35126cc40 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef __ASM_X86_HVM_SVM_H__
-#define __ASM_X86_HVM_SVM_H__
+#ifndef ASM__X86__HVM__SVM__SVM_H
+#define ASM__X86__HVM__SVM__SVM_H
 
 /*
  * PV context switch helpers.  Prefetching the VMCB area itself has been shown
@@ -57,4 +57,4 @@ static inline bool cpu_has_svm_feature(unsigned int feat)
 #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
 #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
 
-#endif /* __ASM_X86_HVM_SVM_H__ */
+#endif /* ASM__X86__HVM__SVM__SVM_H */
diff --git a/xen/arch/x86/include/asm/hvm/svm/svmdebug.h b/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
index 2fb76ec24c..4db4203f6a 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
@@ -5,8 +5,8 @@
  *
  */
 
-#ifndef __ASM_X86_HVM_SVM_SVMDEBUG_H__
-#define __ASM_X86_HVM_SVM_SVMDEBUG_H__
+#ifndef ASM__X86__HVM__SVM__SVMDEBUG_H
+#define ASM__X86__HVM__SVM__SVMDEBUG_H
 
 #include <xen/types.h>
 #include <asm/hvm/svm/vmcb.h>
@@ -16,4 +16,4 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb);
 bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
                       const struct vcpu *v, bool verbose);
 
-#endif /* __ASM_X86_HVM_SVM_SVMDEBUG_H__ */
+#endif /* ASM__X86__HVM__SVM__SVMDEBUG_H */
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index 28f715e376..ed937480ae 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2004, Intel Corporation.
  *
  */
-#ifndef __ASM_X86_HVM_SVM_VMCB_H__
-#define __ASM_X86_HVM_SVM_VMCB_H__
+#ifndef ASM__X86__HVM__SVM__VMCB_H
+#define ASM__X86__HVM__SVM__VMCB_H
 
 #include <xen/types.h>
 
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index 64c7a6fede..866516aae9 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2005, International Business Machines Corporation.
  */
 
-#ifndef __ASM_X86_HVM_VCPU_H__
-#define __ASM_X86_HVM_VCPU_H__
+#ifndef ASM__X86__HVM__VCPU_H
+#define ASM__X86__HVM__VCPU_H
 
 #include <xen/tasklet.h>
 #include <asm/hvm/vlapic.h>
@@ -186,7 +186,7 @@ struct hvm_vcpu {
     struct viridian_vcpu *viridian;
 };
 
-#endif /* __ASM_X86_HVM_VCPU_H__ */
+#endif /* ASM__X86__HVM__VCPU_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/hvm/vioapic.h b/xen/arch/x86/include/asm/hvm/vioapic.h
index 68af6dce79..5020bb9d2f 100644
--- a/xen/arch/x86/include/asm/hvm/vioapic.h
+++ b/xen/arch/x86/include/asm/hvm/vioapic.h
@@ -21,8 +21,8 @@
  *  License along with this library; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __ASM_X86_HVM_VIOAPIC_H__
-#define __ASM_X86_HVM_VIOAPIC_H__
+#ifndef ASM__X86__HVM__VIOAPIC_H
+#define ASM__X86__HVM__VIOAPIC_H
 
 #include <xen/types.h>
 #include <public/hvm/save.h>
@@ -69,4 +69,4 @@ int vioapic_get_mask(const struct domain *d, unsigned int gsi);
 int cf_check vioapic_get_vector(const struct domain *d, unsigned int gsi);
 int vioapic_get_trigger_mode(const struct domain *d, unsigned int gsi);
 
-#endif /* __ASM_X86_HVM_VIOAPIC_H__ */
+#endif /* ASM__X86__HVM__VIOAPIC_H */
diff --git a/xen/arch/x86/include/asm/hvm/viridian.h b/xen/arch/x86/include/asm/hvm/viridian.h
index 4c8ff6e80b..07854a95de 100644
--- a/xen/arch/x86/include/asm/hvm/viridian.h
+++ b/xen/arch/x86/include/asm/hvm/viridian.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef __ASM_X86_HVM_VIRIDIAN_H__
-#define __ASM_X86_HVM_VIRIDIAN_H__
+#ifndef ASM__X86__HVM__VIRIDIAN_H
+#define ASM__X86__HVM__VIRIDIAN_H
 
 #include <asm/guest/hyperv-tlfs.h>
 
@@ -99,7 +99,7 @@ void viridian_synic_poll(struct vcpu *v);
 bool viridian_synic_is_auto_eoi_sint(const struct vcpu *v,
                                      unsigned int vector);
 
-#endif /* __ASM_X86_HVM_VIRIDIAN_H__ */
+#endif /* ASM__X86__HVM__VIRIDIAN_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
index 2c4ff94ae7..3e729cd146 100644
--- a/xen/arch/x86/include/asm/hvm/vlapic.h
+++ b/xen/arch/x86/include/asm/hvm/vlapic.h
@@ -6,8 +6,8 @@
  * Copyright (c) 2006 Keir Fraser, XenSource Inc.
  */
 
-#ifndef __ASM_X86_HVM_VLAPIC_H__
-#define __ASM_X86_HVM_VLAPIC_H__
+#ifndef ASM__X86__HVM__VLAPIC_H
+#define ASM__X86__HVM__VLAPIC_H
 
 #include <xen/tasklet.h>
 #include <asm/hvm/vpt.h>
@@ -137,4 +137,4 @@ bool vlapic_match_dest(
     const struct vlapic *target, const struct vlapic *source,
     int short_hand, uint32_t dest, bool dest_mode);
 
-#endif /* __ASM_X86_HVM_VLAPIC_H__ */
+#endif /* ASM__X86__HVM__VLAPIC_H */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 939b87eb50..d96007838e 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -4,8 +4,8 @@
  * Copyright (c) 2004, Intel Corporation.
  *
  */
-#ifndef __ASM_X86_HVM_VMX_VMCS_H__
-#define __ASM_X86_HVM_VMX_VMCS_H__
+#ifndef ASM__X86__HVM__VMX__VMCS_H
+#define ASM__X86__HVM__VMX__VMCS_H
 
 #include <xen/mm.h>
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index f0ec459622..d8e23d313b 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -4,8 +4,8 @@
  * Copyright (c) 2004, Intel Corporation.
  *
  */
-#ifndef __ASM_X86_HVM_VMX_VMX_H__
-#define __ASM_X86_HVM_VMX_VMX_H__
+#ifndef ASM__X86__HVM__VMX__VMX_H
+#define ASM__X86__HVM__VMX__VMX_H
 
 #include <xen/sched.h>
 #include <xen/types.h>
@@ -676,4 +676,4 @@ typedef union ldt_or_tr_instr_info {
     };
 } ldt_or_tr_instr_info_t;
 
-#endif /* __ASM_X86_HVM_VMX_VMX_H__ */
+#endif /* ASM__X86__HVM__VMX__VMX_H */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
index da10d3fa96..551390e245 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
@@ -8,8 +8,8 @@
  *         Eddie Dong <eddie.dong@intel.com>
  *
  */
-#ifndef __ASM_X86_HVM_VVMX_H__
-#define __ASM_X86_HVM_VVMX_H__
+#ifndef ASM__X86__HVM__VMX__VVMX_H
+#define ASM__X86__HVM__VMX__VVMX_H
 
 struct vvmcs_list {
     unsigned long vvmcs_mfn;
@@ -199,5 +199,5 @@ int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
                         uint64_t *exit_qual, uint32_t *exit_reason);
 int nvmx_cpu_up_prepare(unsigned int cpu);
 void nvmx_cpu_dead(unsigned int cpu);
-#endif /* __ASM_X86_HVM_VVMX_H__ */
+#endif /* ASM__X86__HVM__VMX__VVMX_H */
 
diff --git a/xen/arch/x86/include/asm/hvm/vpic.h b/xen/arch/x86/include/asm/hvm/vpic.h
index d71b270193..6dfbd3ef9e 100644
--- a/xen/arch/x86/include/asm/hvm/vpic.h
+++ b/xen/arch/x86/include/asm/hvm/vpic.h
@@ -24,8 +24,8 @@
  * IN THE SOFTWARE.
  */
 
-#ifndef __ASM_X86_HVM_VPIC_H__
-#define __ASM_X86_HVM_VPIC_H__
+#ifndef ASM__X86__HVM__VPIC_H
+#define ASM__X86__HVM__VPIC_H
 
 struct domain;
 struct vcpu;
@@ -37,4 +37,4 @@ void vpic_reset(struct domain *d);
 int vpic_ack_pending_irq(struct vcpu *v);
 int is_periodic_irq(struct vcpu *v, int irq, int type);
 
-#endif  /* __ASM_X86_HVM_VPIC_H__ */  
+#endif  /* ASM__X86__HVM__VPIC_H */  
diff --git a/xen/arch/x86/include/asm/hvm/vpt.h b/xen/arch/x86/include/asm/hvm/vpt.h
index 0b92b28625..61abea565f 100644
--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2004, Intel Corporation.
  */
 
-#ifndef __ASM_X86_HVM_VPT_H__
-#define __ASM_X86_HVM_VPT_H__
+#ifndef ASM__X86__HVM__VPT_H
+#define ASM__X86__HVM__VPT_H
 
 #include <xen/timer.h>
 #include <xen/list.h>
@@ -196,4 +196,4 @@ void hpet_init(struct domain *d);
 void hpet_deinit(struct domain *d);
 void hpet_reset(struct domain *d);
 
-#endif /* __ASM_X86_HVM_VPT_H__ */
+#endif /* ASM__X86__HVM__VPT_H */
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index e71b48d860..7ff9609589 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -7,8 +7,8 @@
 #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
 #endif
 
-#ifndef __ASM_X86_HYPERCALL_H__
-#define __ASM_X86_HYPERCALL_H__
+#ifndef ASM__X86__HYPERCALL_H
+#define ASM__X86__HYPERCALL_H
 
 #include <xen/types.h>
 #include <public/physdev.h>
@@ -81,4 +81,4 @@ static inline void clobber_regs32(struct cpu_user_regs *regs,
     clobber_regs ## b(r, array_access_nospec(t ## b, n)); \
 })
 
-#endif /* __ASM_X86_HYPERCALL_H__ */
+#endif /* ASM__X86__HYPERCALL_H */
diff --git a/xen/arch/x86/include/asm/i387.h b/xen/arch/x86/include/asm/i387.h
index a783549db9..452b0e4135 100644
--- a/xen/arch/x86/include/asm/i387.h
+++ b/xen/arch/x86/include/asm/i387.h
@@ -8,8 +8,8 @@
  *	Gareth Hughes <gareth@valinux.com>, May 2000
  */
 
-#ifndef __ASM_I386_I387_H
-#define __ASM_I386_I387_H
+#ifndef ASM__X86__I387_H
+#define ASM__X86__I387_H
 
 #include <xen/types.h>
 
@@ -37,4 +37,4 @@ struct xsave_struct;
 void vcpu_setup_fpu(struct vcpu *v, struct xsave_struct *xsave_area,
                     const void *data, unsigned int fcw_default);
 void vcpu_destroy_fpu(struct vcpu *v);
-#endif /* __ASM_I386_I387_H */
+#endif /* ASM__X86__I387_H */
diff --git a/xen/arch/x86/include/asm/intel-family.h b/xen/arch/x86/include/asm/intel-family.h
index d44dd3f69f..d53d860753 100644
--- a/xen/arch/x86/include/asm/intel-family.h
+++ b/xen/arch/x86/include/asm/intel-family.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_X86_INTEL_FAMILY_H
-#define _ASM_X86_INTEL_FAMILY_H
+#ifndef ASM__X86__INTEL_FAMILY_H
+#define ASM__X86__INTEL_FAMILY_H
 
 /*
  * "Big Core" Processors (Branded as Core, Xeon, etc...)
@@ -167,4 +167,4 @@
 /* Family 5 */
 #define INTEL_FAM5_QUARK_X1000		0x09 /* Quark X1000 SoC */
 
-#endif /* _ASM_X86_INTEL_FAMILY_H */
+#endif /* ASM__X86__INTEL_FAMILY_H */
diff --git a/xen/arch/x86/include/asm/invpcid.h b/xen/arch/x86/include/asm/invpcid.h
index bf5c30313a..670d69bae8 100644
--- a/xen/arch/x86/include/asm/invpcid.h
+++ b/xen/arch/x86/include/asm/invpcid.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_X86_INVPCID_H_
-#define _ASM_X86_INVPCID_H_
+#ifndef ASM__X86__INVPCID_H
+#define ASM__X86__INVPCID_H
 
 #include <xen/types.h>
 
@@ -54,7 +54,7 @@ static inline void invpcid_flush_all_nonglobals(void)
     invpcid(0, 0, X86_INVPCID_ALL_NON_GLOBAL);
 }
 
-#endif	/* _ASM_X86_INVPCID_H_ */
+#endif	/* ASM__X86__INVPCID_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/io.h b/xen/arch/x86/include/asm/io.h
index 1cb4217cff..f2f9bb3247 100644
--- a/xen/arch/x86/include/asm/io.h
+++ b/xen/arch/x86/include/asm/io.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_IO_H
-#define _ASM_IO_H
+#ifndef ASM__X86__IO_H
+#define ASM__X86__IO_H
 
 #include <xen/vmap.h>
 #include <xen/types.h>
diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index 62456806c7..4446e768c2 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_IO_APIC_H
-#define __ASM_IO_APIC_H
+#ifndef ASM__X86__IO_APIC_H
+#define ASM__X86__IO_APIC_H
 
 #include <xen/types.h>
 
diff --git a/xen/arch/x86/include/asm/iocap.h b/xen/arch/x86/include/asm/iocap.h
index 53d87ae8a3..15a0c42ccd 100644
--- a/xen/arch/x86/include/asm/iocap.h
+++ b/xen/arch/x86/include/asm/iocap.h
@@ -4,8 +4,8 @@
  * Architecture-specific per-domain I/O capabilities.
  */
 
-#ifndef __X86_IOCAP_H__
-#define __X86_IOCAP_H__
+#ifndef ASM__X86__IOCAP_H
+#define ASM__X86__IOCAP_H
 
 #include <xen/sched.h>
 #include <xen/rangeset.h>
@@ -44,4 +44,4 @@ static inline int ioports_deny_access(struct domain *d, unsigned long s,
     return ret;
 }
 
-#endif /* __X86_IOCAP_H__ */
+#endif /* ASM__X86__IOCAP_H */
diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 8dc464fbd3..6d7f876080 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ARCH_X86_IOMMU_H__
-#define __ARCH_X86_IOMMU_H__
+#ifndef ASM__X86__IOMMU_H
+#define ASM__X86__IOMMU_H
 
 #include <xen/errno.h>
 #include <xen/list.h>
@@ -137,7 +137,7 @@ void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg);
 /* Check [start, end] unity map range for correctness. */
 bool iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end);
 
-#endif /* !__ARCH_X86_IOMMU_H__ */
+#endif /* !ASM__X86__IOMMU_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/ioreq.h b/xen/arch/x86/include/asm/ioreq.h
index 5fe811eff5..065efcbe24 100644
--- a/xen/arch/x86/include/asm/ioreq.h
+++ b/xen/arch/x86/include/asm/ioreq.h
@@ -8,14 +8,14 @@
  * Copyright (c) 2016 Citrix Systems Inc.
  */
 
-#ifndef __ASM_X86_IOREQ_H__
-#define __ASM_X86_IOREQ_H__
+#ifndef ASM__X86__IOREQ_H
+#define ASM__X86__IOREQ_H
 
 #ifdef CONFIG_HVM
 #include <asm/hvm/ioreq.h>
 #endif
 
-#endif /* __ASM_X86_IOREQ_H__ */
+#endif /* ASM__X86__IOREQ_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index d3bc768068..86c2266578 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_HW_IRQ_H
-#define _ASM_HW_IRQ_H
+#ifndef ASM__X86__IRQ_H
+#define ASM__X86__IRQ_H
 
 /* (C) 1992, 1993 Linus Torvalds, (C) 1997 Ingo Molnar */
 
@@ -231,4 +231,4 @@ int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p);
 int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
                               int type, struct msi_info *msi);
 
-#endif /* _ASM_HW_IRQ_H */
+#endif /* ASM__X86__IRQ_H */
diff --git a/xen/arch/x86/include/asm/ldt.h b/xen/arch/x86/include/asm/ldt.h
index 58e3e042fc..b77b53c1b8 100644
--- a/xen/arch/x86/include/asm/ldt.h
+++ b/xen/arch/x86/include/asm/ldt.h
@@ -1,6 +1,6 @@
 
-#ifndef __ARCH_LDT_H
-#define __ARCH_LDT_H
+#ifndef ASM__X86__LDT_H
+#define ASM__X86__LDT_H
 
 #ifndef __ASSEMBLY__
 
diff --git a/xen/arch/x86/include/asm/mach-default/bios_ebda.h b/xen/arch/x86/include/asm/mach-default/bios_ebda.h
index 42de6b2a5b..b1daf7fa69 100644
--- a/xen/arch/x86/include/asm/mach-default/bios_ebda.h
+++ b/xen/arch/x86/include/asm/mach-default/bios_ebda.h
@@ -1,5 +1,5 @@
-#ifndef _MACH_BIOS_EBDA_H
-#define _MACH_BIOS_EBDA_H
+#ifndef ASM__X86__MACH_DEFAULT__BIOS_EBDA_H
+#define ASM__X86__MACH_DEFAULT__BIOS_EBDA_H
 
 /*
  * there is a real-mode segmented pointer pointing to the
@@ -12,4 +12,4 @@ static inline unsigned int get_bios_ebda(void)
 	return address;	/* 0 means none */
 }
 
-#endif /* _MACH_BIOS_EBDA_H */
+#endif /* ASM__X86__MACH_DEFAULT__BIOS_EBDA_H */
diff --git a/xen/arch/x86/include/asm/mach-default/io_ports.h b/xen/arch/x86/include/asm/mach-default/io_ports.h
index a96d9f6604..d8daaade5c 100644
--- a/xen/arch/x86/include/asm/mach-default/io_ports.h
+++ b/xen/arch/x86/include/asm/mach-default/io_ports.h
@@ -4,8 +4,8 @@
  *  Machine specific IO port address definition for generic.
  *  Written by Osamu Tomita <tomita@cinet.co.jp>
  */
-#ifndef _MACH_IO_PORTS_H
-#define _MACH_IO_PORTS_H
+#ifndef ASM__X86__MACH_DEFAULT__IO_PORTS_H
+#define ASM__X86__MACH_DEFAULT__IO_PORTS_H
 
 /* i8253A PIT registers */
 #define PIT_MODE		0x43
@@ -27,4 +27,4 @@
 #define SLAVE_ICW4_DEFAULT	0x01
 #define PIC_ICW4_AEOI		2
 
-#endif /* !_MACH_IO_PORTS_H */
+#endif /* !ASM__X86__MACH_DEFAULT__IO_PORTS_H */
diff --git a/xen/arch/x86/include/asm/mach-default/irq_vectors.h b/xen/arch/x86/include/asm/mach-default/irq_vectors.h
index f546aedd87..52f7bec7c3 100644
--- a/xen/arch/x86/include/asm/mach-default/irq_vectors.h
+++ b/xen/arch/x86/include/asm/mach-default/irq_vectors.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_IRQ_VECTORS_H
-#define _ASM_IRQ_VECTORS_H
+#ifndef ASM__X86__MACH_DEFAULT__IRQ_VECTORS_H
+#define ASM__X86__MACH_DEFAULT__IRQ_VECTORS_H
 
 /* Processor-initiated interrupts are all high priority. */
 #define SPURIOUS_APIC_VECTOR	0xff
@@ -43,4 +43,4 @@
 #define FIRST_IRQ_VECTOR        FIRST_DYNAMIC_VECTOR
 #define LAST_IRQ_VECTOR         LAST_HIPRIORITY_VECTOR
 
-#endif /* _ASM_IRQ_VECTORS_H */
+#endif /* ASM__X86__MACH_DEFAULT__IRQ_VECTORS_H */
diff --git a/xen/arch/x86/include/asm/mach-default/mach_mpspec.h b/xen/arch/x86/include/asm/mach-default/mach_mpspec.h
index 1a4e3f8c4f..3027533052 100644
--- a/xen/arch/x86/include/asm/mach-default/mach_mpspec.h
+++ b/xen/arch/x86/include/asm/mach-default/mach_mpspec.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_MACH_MPSPEC_H
-#define __ASM_MACH_MPSPEC_H
+#ifndef ASM__X86__MACH_DEFAULT__MACH_MPSPEC_H
+#define ASM__X86__MACH_DEFAULT__MACH_MPSPEC_H
 
 #define MAX_IRQ_SOURCES 256
 
@@ -7,4 +7,4 @@
 /* Maximum 256 PCI busses, plus 1 ISA bus in each of 4 cabinets. */
 #define MAX_MP_BUSSES 260
 
-#endif /* __ASM_MACH_MPSPEC_H */
+#endif /* ASM__X86__MACH_DEFAULT__MACH_MPSPEC_H */
diff --git a/xen/arch/x86/include/asm/mach-generic/mach_apic.h b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
index c0d8b232c9..ae8b2372d8 100644
--- a/xen/arch/x86/include/asm/mach-generic/mach_apic.h
+++ b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_MACH_APIC_H
-#define __ASM_MACH_APIC_H
+#ifndef ASM__X86__MACH_GENERIC__MACH_APIC_H
+#define ASM__X86__MACH_GENERIC__MACH_APIC_H
 
 #include <asm/apic.h>
 #include <asm/io_apic.h>
@@ -74,4 +74,4 @@ static inline void set_apicid(int phys_apicid, physid_mask_t *map)
 	physid_set(phys_apicid, *map);
 }
 
-#endif /* __ASM_MACH_APIC_H */
+#endif /* ASM__X86__MACH_GENERIC__MACH_APIC_H */
diff --git a/xen/arch/x86/include/asm/machine_kexec.h b/xen/arch/x86/include/asm/machine_kexec.h
index d4880818c1..78072325b2 100644
--- a/xen/arch/x86/include/asm/machine_kexec.h
+++ b/xen/arch/x86/include/asm/machine_kexec.h
@@ -1,5 +1,5 @@
-#ifndef __X86_MACHINE_KEXEC_H__
-#define __X86_MACHINE_KEXEC_H__
+#ifndef ASM__X86__MACHINE_KEXEC_H
+#define ASM__X86__MACHINE_KEXEC_H
 
 #define KEXEC_RELOC_FLAG_COMPAT 0x1 /* 32-bit image */
 
@@ -13,4 +13,4 @@ extern const char kexec_reloc_end[];
 
 #endif
 
-#endif /* __X86_MACHINE_KEXEC_H__ */
+#endif /* ASM__X86__MACHINE_KEXEC_H */
diff --git a/xen/arch/x86/include/asm/mc146818rtc.h b/xen/arch/x86/include/asm/mc146818rtc.h
index 1a34512d29..5e796cda7e 100644
--- a/xen/arch/x86/include/asm/mc146818rtc.h
+++ b/xen/arch/x86/include/asm/mc146818rtc.h
@@ -1,8 +1,8 @@
 /*
  * Machine dependent access functions for RTC registers.
  */
-#ifndef _ASM_MC146818RTC_H
-#define _ASM_MC146818RTC_H
+#ifndef ASM__X86__MC146818RTC_H
+#define ASM__X86__MC146818RTC_H
 
 #include <asm/io.h>
 #include <xen/spinlock.h>
@@ -117,4 +117,4 @@ outb_p((val),RTC_PORT(1)); \
 unsigned int rtc_guest_read(unsigned int port);
 void rtc_guest_write(unsigned int port, unsigned int data);
 
-#endif /* _ASM_MC146818RTC_H */
+#endif /* ASM__X86__MC146818RTC_H */
diff --git a/xen/arch/x86/include/asm/mce.h b/xen/arch/x86/include/asm/mce.h
index 2ec47a71ae..a70748da90 100644
--- a/xen/arch/x86/include/asm/mce.h
+++ b/xen/arch/x86/include/asm/mce.h
@@ -1,5 +1,5 @@
-#ifndef _XEN_X86_MCE_H
-#define _XEN_X86_MCE_H
+#ifndef ASM__X86__MCE_H
+#define ASM__X86__MCE_H
 
 #include <xen/spinlock.h>
 #include <xen/types.h>
diff --git a/xen/arch/x86/include/asm/mem_paging.h b/xen/arch/x86/include/asm/mem_paging.h
index 5ae86669fb..c5ab2ee80e 100644
--- a/xen/arch/x86/include/asm/mem_paging.h
+++ b/xen/arch/x86/include/asm/mem_paging.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2009 Citrix Systems, Inc. (Patrick Colp)
  */
 
-#ifndef __ASM_X86_MEM_PAGING_H__
-#define __ASM_X86_MEM_PAGING_H__
+#ifndef ASM__X86__MEM_PAGING_H
+#define ASM__X86__MEM_PAGING_H
 
 int mem_paging_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_paging_op_t) arg);
 
@@ -18,7 +18,7 @@ int mem_paging_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_paging_op_t) arg);
 # define mem_paging_enabled(d) false
 #endif
 
-#endif /*__ASM_X86_MEM_PAGING_H__ */
+#endif /*ASM__X86__MEM_PAGING_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/mem_sharing.h b/xen/arch/x86/include/asm/mem_sharing.h
index 040962f690..c0e0beb727 100644
--- a/xen/arch/x86/include/asm/mem_sharing.h
+++ b/xen/arch/x86/include/asm/mem_sharing.h
@@ -6,8 +6,8 @@
  *
  * Copyright (c) 2009 Citrix Systems, Inc. (Grzegorz Milos)
  */
-#ifndef __MEM_SHARING_H__
-#define __MEM_SHARING_H__
+#ifndef ASM__X86__MEM_SHARING_H
+#define ASM__X86__MEM_SHARING_H
 
 #include <public/domctl.h>
 #include <public/memory.h>
@@ -147,4 +147,4 @@ static inline int mem_sharing_fork_reset(struct domain *d, bool reset_state,
 
 #endif
 
-#endif /* __MEM_SHARING_H__ */
+#endif /* ASM__X86__MEM_SHARING_H */
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index 57c08205d4..55ca221c13 100644
--- a/xen/arch/x86/include/asm/microcode.h
+++ b/xen/arch/x86/include/asm/microcode.h
@@ -1,5 +1,5 @@
-#ifndef ASM_X86__MICROCODE_H
-#define ASM_X86__MICROCODE_H
+#ifndef ASM__X86__MICROCODE_H
+#define ASM__X86__MICROCODE_H
 
 #include <xen/types.h>
 #include <xen/percpu.h>
@@ -30,4 +30,4 @@ int microcode_init_cache(unsigned long *module_map,
                          const struct multiboot_info *mbi);
 int microcode_update_one(void);
 
-#endif /* ASM_X86__MICROCODE_H */
+#endif /* ASM__X86__MICROCODE_H */
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 2a837f3d59..81eb0bb8cd 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -1,6 +1,6 @@
 
-#ifndef __ASM_X86_MM_H__
-#define __ASM_X86_MM_H__
+#ifndef ASM__X86__MM_H
+#define ASM__X86__MM_H
 
 #include <xen/list.h>
 #include <xen/spinlock.h>
@@ -628,4 +628,4 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
     return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
 }
 
-#endif /* __ASM_X86_MM_H__ */
+#endif /* ASM__X86__MM_H */
diff --git a/xen/arch/x86/include/asm/mpspec.h b/xen/arch/x86/include/asm/mpspec.h
index 45e474dfd1..bcd9be54ac 100644
--- a/xen/arch/x86/include/asm/mpspec.h
+++ b/xen/arch/x86/include/asm/mpspec.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_MPSPEC_H
-#define __ASM_MPSPEC_H
+#ifndef ASM__X86__MPSPEC_H
+#define ASM__X86__MPSPEC_H
 
 #include <xen/cpumask.h>
 #include <asm/mpspec_def.h>
diff --git a/xen/arch/x86/include/asm/mpspec_def.h b/xen/arch/x86/include/asm/mpspec_def.h
index b17ec41426..79a9760be8 100644
--- a/xen/arch/x86/include/asm/mpspec_def.h
+++ b/xen/arch/x86/include/asm/mpspec_def.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_MPSPEC_DEF_H
-#define __ASM_MPSPEC_DEF_H
+#ifndef ASM__X86__MPSPEC_DEF_H
+#define ASM__X86__MPSPEC_DEF_H
 
 /*
  * Structure definitions for SMP machines following the
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 748bc3cd6d..ad9b4c90a3 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_MSI_H
-#define __ASM_MSI_H
+#ifndef ASM__X86__MSI_H
+#define ASM__X86__MSI_H
 
 #include <xen/cpumask.h>
 #include <xen/pci.h>
@@ -251,4 +251,4 @@ void guest_mask_msi_irq(struct irq_desc *desc, bool mask);
 void cf_check ack_nonmaskable_msi_irq(struct irq_desc *desc);
 void cf_check set_msi_affinity(struct irq_desc *desc, const cpumask_t *mask);
 
-#endif /* __ASM_MSI_H */
+#endif /* ASM__X86__MSI_H */
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 9cdb5b2625..abde451b98 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_MSR_INDEX_H
-#define __ASM_MSR_INDEX_H
+#ifndef ASM__X86__MSR_INDEX_H
+#define ASM__X86__MSR_INDEX_H
 
 /*
  * CPU model specific register (MSR) numbers
@@ -698,4 +698,4 @@
 #define MSR_PKGC9_IRTL			0x00000634
 #define MSR_PKGC10_IRTL			0x00000635
 
-#endif /* __ASM_MSR_INDEX_H */
+#endif /* ASM__X86__MSR_INDEX_H */
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 355fb324ec..033bb9d6ff 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_MSR_H
-#define __ASM_MSR_H
+#ifndef ASM__X86__MSR_H
+#define ASM__X86__MSR_H
 
 #include "msr-index.h"
 
@@ -441,4 +441,4 @@ int init_vcpu_msr_policy(struct vcpu *v);
 int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val);
 int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val);
 
-#endif /* __ASM_MSR_H */
+#endif /* ASM__X86__MSR_H */
diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtrr.h
index 36dac0a775..384c29f2a7 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_X86_MTRR_H__
-#define __ASM_X86_MTRR_H__
+#ifndef ASM__X86__MTRR_H
+#define ASM__X86__MTRR_H
 
 #include <xen/mm.h>
 
@@ -85,4 +85,4 @@ extern bool pat_msr_set(uint64_t *pat, uint64_t msr);
 bool is_var_mtrr_overlapped(const struct mtrr_state *m);
 bool mtrr_pat_not_equal(const struct vcpu *vd, const struct vcpu *vs);
 
-#endif /* __ASM_X86_MTRR_H__ */
+#endif /* ASM__X86__MTRR_H */
diff --git a/xen/arch/x86/include/asm/multicall.h b/xen/arch/x86/include/asm/multicall.h
index 7e1d4c121a..9e9050dacd 100644
--- a/xen/arch/x86/include/asm/multicall.h
+++ b/xen/arch/x86/include/asm/multicall.h
@@ -2,11 +2,11 @@
  * asm-x86/multicall.h
  */
 
-#ifndef __ASM_X86_MULTICALL_H__
-#define __ASM_X86_MULTICALL_H__
+#ifndef ASM__X86__MULTICALL_H
+#define ASM__X86__MULTICALL_H
 
 #include <xen/multicall.h>
 
 typeof(arch_do_multicall_call) pv_do_multicall_call, hvm_do_multicall_call;
 
-#endif /* __ASM_X86_MULTICALL_H__ */
+#endif /* ASM__X86__MULTICALL_H */
diff --git a/xen/arch/x86/include/asm/mwait.h b/xen/arch/x86/include/asm/mwait.h
index 000a692f6d..90781aa035 100644
--- a/xen/arch/x86/include/asm/mwait.h
+++ b/xen/arch/x86/include/asm/mwait.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_X86_MWAIT_H__
-#define __ASM_X86_MWAIT_H__
+#ifndef ASM__X86__MWAIT_H
+#define ASM__X86__MWAIT_H
 
 #include <xen/types.h>
 
@@ -23,4 +23,4 @@ static inline bool mwait_pc10_supported(void)
 }
 #endif
 
-#endif /* __ASM_X86_MWAIT_H__ */
+#endif /* ASM__X86__MWAIT_H */
diff --git a/xen/arch/x86/include/asm/nmi.h b/xen/arch/x86/include/asm/nmi.h
index 9a5da14162..ce4ab3690f 100644
--- a/xen/arch/x86/include/asm/nmi.h
+++ b/xen/arch/x86/include/asm/nmi.h
@@ -1,6 +1,6 @@
 
-#ifndef ASM_NMI_H
-#define ASM_NMI_H
+#ifndef ASM__X86__NMI_H
+#define ASM__X86__NMI_H
 
 #include <public/nmi.h>
 
@@ -43,4 +43,4 @@ void trigger_nmi_continuation(void);
 
 /* Check for NMI continuation pending. */
 bool nmi_check_continuation(void);
-#endif /* ASM_NMI_H */
+#endif /* ASM__X86__NMI_H */
diff --git a/xen/arch/x86/include/asm/nops.h b/xen/arch/x86/include/asm/nops.h
index 2724a9862e..0d2480a416 100644
--- a/xen/arch/x86/include/asm/nops.h
+++ b/xen/arch/x86/include/asm/nops.h
@@ -1,5 +1,5 @@
-#ifndef __X86_ASM_NOPS_H__
-#define __X86_ASM_NOPS_H__
+#ifndef ASM__X86__NOPS_H
+#define ASM__X86__NOPS_H
 
 /*
  * Define nops for use with alternative().
@@ -65,4 +65,4 @@
 
 #define ASM_NOP_MAX 9
 
-#endif /* __X86_ASM_NOPS_H__ */
+#endif /* ASM__X86__NOPS_H */
diff --git a/xen/arch/x86/include/asm/nospec.h b/xen/arch/x86/include/asm/nospec.h
index e058a3bb0e..d3efb3c52e 100644
--- a/xen/arch/x86/include/asm/nospec.h
+++ b/xen/arch/x86/include/asm/nospec.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved. */
 
-#ifndef _ASM_X86_NOSPEC_H
-#define _ASM_X86_NOSPEC_H
+#ifndef ASM__X86__NOSPEC_H
+#define ASM__X86__NOSPEC_H
 
 #include <asm/alternative.h>
 
@@ -88,7 +88,7 @@ static always_inline bool arch_lock_evaluate_nospec(bool condition)
         return barrier_lock_false();
 }
 
-#endif /* _ASM_X86_NOSPEC_H */
+#endif /* ASM__X86__NOSPEC_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 7866afa408..8371bc3a44 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_X8664_NUMA_H 
-#define _ASM_X8664_NUMA_H 1
+#ifndef ASM__X86__NUMA_H 
+#define ASM__X86__NUMA_H 1
 
 #include <xen/cpumask.h>
 
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 321c7b5941..f3cd804af5 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -11,8 +11,8 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
-#ifndef _XEN_ASM_X86_P2M_H
-#define _XEN_ASM_X86_P2M_H
+#ifndef ASM__X86__P2M_H
+#define ASM__X86__P2M_H
 
 #include <xen/paging.h>
 #include <xen/mem_access.h>
@@ -1101,7 +1101,7 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
 
 #endif /* CONFIG_HVM */
 
-#endif /* _XEN_ASM_X86_P2M_H */
+#endif /* ASM__X86__P2M_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/page-bits.h b/xen/arch/x86/include/asm/page-bits.h
index 6f7fc7d035..5350baf69d 100644
--- a/xen/arch/x86/include/asm/page-bits.h
+++ b/xen/arch/x86/include/asm/page-bits.h
@@ -1,5 +1,5 @@
-#ifndef __X86_PAGE_SHIFT_H__
-#define __X86_PAGE_SHIFT_H__
+#ifndef ASM__X86__PAGE_BITS_H
+#define ASM__X86__PAGE_BITS_H
 
 #define L1_PAGETABLE_SHIFT      12
 #define L2_PAGETABLE_SHIFT      21
@@ -23,4 +23,4 @@
 #define PADDR_BITS              52
 #define VADDR_BITS              48
 
-#endif /* __X86_PAGE_SHIFT_H__ */
+#endif /* ASM__X86__PAGE_BITS_H */
diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index e01af28916..63c7341fcc 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -1,5 +1,5 @@
-#ifndef __X86_PAGE_H__
-#define __X86_PAGE_H__
+#ifndef ASM__X86__PAGE_H
+#define ASM__X86__PAGE_H
 
 #include <xen/const.h>
 #include <xen/page-size.h>
@@ -389,7 +389,7 @@ static inline void invalidate_icache(void)
 
 #endif /* !__ASSEMBLY__ */
 
-#endif /* __X86_PAGE_H__ */
+#endif /* ASM__X86__PAGE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 8a2a0af408..b7c59c426b 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -9,8 +9,8 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
-#ifndef _XEN_PAGING_H
-#define _XEN_PAGING_H
+#ifndef ASM__X86__PAGING_H
+#define ASM__X86__PAGING_H
 
 #include <xen/mm.h>
 #include <public/domctl.h>
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index fd5480d67d..ac38417fc5 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -1,5 +1,5 @@
-#ifndef __X86_PCI_H__
-#define __X86_PCI_H__
+#ifndef ASM__X86__PCI_H
+#define ASM__X86__PCI_H
 
 #include <xen/mm.h>
 
@@ -67,4 +67,4 @@ static inline bool pci_check_bar(const struct pci_dev *pdev,
     return is_memory_hole(start, end);
 }
 
-#endif /* __X86_PCI_H__ */
+#endif /* ASM__X86__PCI_H */
diff --git a/xen/arch/x86/include/asm/perfc.h b/xen/arch/x86/include/asm/perfc.h
index a1a591e803..b1c3e0d7f7 100644
--- a/xen/arch/x86/include/asm/perfc.h
+++ b/xen/arch/x86/include/asm/perfc.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_PERFC_H__
-#define __ASM_PERFC_H__
+#ifndef ASM__X86__PERFC_H
+#define ASM__X86__PERFC_H
 
 static inline void arch_perfc_reset(void)
 {
diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/include/asm/perfc_defn.h
index 487e20dc97..20cfbb40c5 100644
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -1,6 +1,6 @@
 /* This file is legitimately included multiple times. */
-/*#ifndef __XEN_PERFC_DEFN_H__*/
-/*#define __XEN_PERFC_DEFN_H__*/
+/*#ifndef ASM__X86__PERFC_DEFN_H*/
+/*#define ASM__X86__PERFC_DEFN_H*/
 
 PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
 
@@ -131,4 +131,4 @@ PERFCOUNTER(iommu_pt_coalesces,   "IOMMU page table coalesces")
 PERFCOUNTER(buslock, "Bus Locks Detected")
 PERFCOUNTER(vmnotify_crash, "domain crashes by Notify VM Exit")
 
-/*#endif*/ /* __XEN_PERFC_DEFN_H__ */
+/*#endif*/ /* ASM__X86__PERFC_DEFN_H */
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 26e2fb1369..c7ea2f674f 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -1,8 +1,8 @@
 
 /* Portions are: Copyright (c) 1994 Linus Torvalds */
 
-#ifndef __ASM_X86_PROCESSOR_H
-#define __ASM_X86_PROCESSOR_H
+#ifndef ASM__X86__PROCESSOR_H
+#define ASM__X86__PROCESSOR_H
 
 #ifndef __ASSEMBLY__
 #include <xen/types.h>
@@ -529,7 +529,7 @@ void amd_check_zenbleed(void);
 
 #endif /* !__ASSEMBLY__ */
 
-#endif /* __ASM_X86_PROCESSOR_H */
+#endif /* ASM__X86__PROCESSOR_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/prot-key.h b/xen/arch/x86/include/asm/prot-key.h
index 0dcd31b7ea..162db7b3ee 100644
--- a/xen/arch/x86/include/asm/prot-key.h
+++ b/xen/arch/x86/include/asm/prot-key.h
@@ -2,8 +2,8 @@
 /*
  * Copyright (c) 2021-2022 Citrix Systems Ltd.
  */
-#ifndef ASM_PROT_KEY_H
-#define ASM_PROT_KEY_H
+#ifndef ASM__X86__PROT_KEY_H
+#define ASM__X86__PROT_KEY_H
 
 #include <xen/percpu.h>
 #include <xen/types.h>
@@ -82,4 +82,4 @@ static inline void wrpkrs_and_cache(uint32_t pkrs)
     wrmsr_ns(MSR_PKRS, pkrs, 0);
 }
 
-#endif /* ASM_PROT_KEY_H */
+#endif /* ASM__X86__PROT_KEY_H */
diff --git a/xen/arch/x86/include/asm/psr.h b/xen/arch/x86/include/asm/psr.h
index d21a59d98f..461a39395f 100644
--- a/xen/arch/x86/include/asm/psr.h
+++ b/xen/arch/x86/include/asm/psr.h
@@ -13,8 +13,8 @@
  * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
  * more details.
  */
-#ifndef __ASM_PSR_H__
-#define __ASM_PSR_H__
+#ifndef ASM__X86__PSR_H
+#define ASM__X86__PSR_H
 
 #include <xen/types.h>
 
@@ -92,7 +92,7 @@ static inline void psr_domain_init(struct domain *d) {}
 static inline void psr_domain_free(struct domain *d) {}
 #endif
 
-#endif /* __ASM_PSR_H__ */
+#endif /* ASM__X86__PSR_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/pt-contig-markers.h b/xen/arch/x86/include/asm/pt-contig-markers.h
index 1ad5c8fb6c..b0af22a6ba 100644
--- a/xen/arch/x86/include/asm/pt-contig-markers.h
+++ b/xen/arch/x86/include/asm/pt-contig-markers.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_X86_PT_CONTIG_MARKERS_H
-#define __ASM_X86_PT_CONTIG_MARKERS_H
+#ifndef ASM__X86__PT_CONTIG_MARKERS_H
+#define ASM__X86__PT_CONTIG_MARKERS_H
 
 /*
  * Short of having function templates in C, the function defined below is
@@ -107,4 +107,4 @@ static bool pt_update_contig_markers(uint64_t *pt, unsigned int idx,
 
 #endif /* CONTIG_MASK */
 
-#endif /* __ASM_X86_PT_CONTIG_MARKERS_H */
+#endif /* ASM__X86__PT_CONTIG_MARKERS_H */
diff --git a/xen/arch/x86/include/asm/pv/domain.h b/xen/arch/x86/include/asm/pv/domain.h
index 75a6b9e5c7..83c779442b 100644
--- a/xen/arch/x86/include/asm/pv/domain.h
+++ b/xen/arch/x86/include/asm/pv/domain.h
@@ -7,8 +7,8 @@
  * Copyright (C) 2017 Wei Liu <wei.liu2@citrix.com>
  */
 
-#ifndef __X86_PV_DOMAIN_H__
-#define __X86_PV_DOMAIN_H__
+#ifndef ASM__X86__PV__DOMAIN_H
+#define ASM__X86__PV__DOMAIN_H
 
 #include <xen/sched.h>
 
@@ -110,7 +110,7 @@ static inline void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 void cf_check paravirt_ctxt_switch_from(struct vcpu *v);
 void cf_check paravirt_ctxt_switch_to(struct vcpu *v);
 
-#endif	/* __X86_PV_DOMAIN_H__ */
+#endif	/* ASM__X86__PV__DOMAIN_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/pv/grant_table.h b/xen/arch/x86/include/asm/pv/grant_table.h
index 88f36c6595..aa03ff5345 100644
--- a/xen/arch/x86/include/asm/pv/grant_table.h
+++ b/xen/arch/x86/include/asm/pv/grant_table.h
@@ -7,8 +7,8 @@
  * Copyright (C) 2017 Wei Liu <wei.liu2@citrix.com>
  */
 
-#ifndef __X86_PV_GRANT_TABLE_H__
-#define __X86_PV_GRANT_TABLE_H__
+#ifndef ASM__X86__PV__GRANT_TABLE_H
+#define ASM__X86__PV__GRANT_TABLE_H
 
 #ifdef CONFIG_PV
 
@@ -36,7 +36,7 @@ static inline int replace_grant_pv_mapping(uint64_t addr, mfn_t frame,
 
 #endif
 
-#endif /* __X86_PV_GRANT_TABLE_H__ */
+#endif /* ASM__X86__PV__GRANT_TABLE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/pv/mm.h b/xen/arch/x86/include/asm/pv/mm.h
index 182764542c..1135b7bda6 100644
--- a/xen/arch/x86/include/asm/pv/mm.h
+++ b/xen/arch/x86/include/asm/pv/mm.h
@@ -7,8 +7,8 @@
  * Copyright (C) 2017 Wei Liu <wei.liu2@citrix.com>
  */
 
-#ifndef __X86_PV_MM_H__
-#define __X86_PV_MM_H__
+#ifndef ASM__X86__PV__MM_H
+#define ASM__X86__PV__MM_H
 
 #ifdef CONFIG_PV
 
@@ -46,4 +46,4 @@ static inline bool pv_destroy_ldt(struct vcpu *v)
 
 #endif
 
-#endif /* __X86_PV_MM_H__ */
+#endif /* ASM__X86__PV__MM_H */
diff --git a/xen/arch/x86/include/asm/pv/shim.h b/xen/arch/x86/include/asm/pv/shim.h
index 6153e27005..2a7d1c1594 100644
--- a/xen/arch/x86/include/asm/pv/shim.h
+++ b/xen/arch/x86/include/asm/pv/shim.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2017 Citrix Systems Ltd.
  */
 
-#ifndef __X86_PV_SHIM_H__
-#define __X86_PV_SHIM_H__
+#ifndef ASM__X86__PV__SHIM_H
+#define ASM__X86__PV__SHIM_H
 
 #include <xen/hypercall.h>
 #include <xen/types.h>
@@ -98,7 +98,7 @@ pv_shim_reserved_pages(unsigned int *s)
 
 #endif
 
-#endif /* __X86_PV_SHIM_H__ */
+#endif /* ASM__X86__PV__SHIM_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/pv/trace.h b/xen/arch/x86/include/asm/pv/trace.h
index c616206eeb..b9ecfb066c 100644
--- a/xen/arch/x86/include/asm/pv/trace.h
+++ b/xen/arch/x86/include/asm/pv/trace.h
@@ -1,5 +1,5 @@
-#ifndef XEN_X86_PV_TRACE_H
-#define XEN_X86_PV_TRACE_H
+#ifndef ASM__X86__PV__TRACE_H
+#define ASM__X86__PV__TRACE_H
 
 #include <xen/trace.h>
 
@@ -45,4 +45,4 @@ static inline void trace_ptwr_emulation(unsigned long addr, l1_pgentry_t npte)
         __trace_ptwr_emulation(addr, npte);
 }
 
-#endif /* XEN_X86_PV_TRACE_H */
+#endif /* ASM__X86__PV__TRACE_H */
diff --git a/xen/arch/x86/include/asm/pv/traps.h b/xen/arch/x86/include/asm/pv/traps.h
index 404f5b169c..31f9f19231 100644
--- a/xen/arch/x86/include/asm/pv/traps.h
+++ b/xen/arch/x86/include/asm/pv/traps.h
@@ -7,8 +7,8 @@
  * Copyright (C) 2017 Wei Liu <wei.liu2@citrix.com>
  */
 
-#ifndef __X86_PV_TRAPS_H__
-#define __X86_PV_TRAPS_H__
+#ifndef ASM__X86__PV__TRAPS_H
+#define ASM__X86__PV__TRAPS_H
 
 #ifdef CONFIG_PV
 
@@ -47,7 +47,7 @@ static inline bool pv_trap_callback_registered(const struct vcpu *v,
 }
 #endif /* CONFIG_PV */
 
-#endif /* __X86_PV_TRAPS_H__ */
+#endif /* ASM__X86__PV__TRAPS_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/random.h b/xen/arch/x86/include/asm/random.h
index 9e1fe0bc1d..55f0293a0f 100644
--- a/xen/arch/x86/include/asm/random.h
+++ b/xen/arch/x86/include/asm/random.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_RANDOM_H__
-#define __ASM_RANDOM_H__
+#ifndef ASM__X86__RANDOM_H
+#define ASM__X86__RANDOM_H
 
 #include <asm/processor.h>
 
@@ -13,4 +13,4 @@ static inline unsigned int arch_get_random(void)
     return val;
 }
 
-#endif /* __ASM_RANDOM_H__ */
+#endif /* ASM__X86__RANDOM_H */
diff --git a/xen/arch/x86/include/asm/regs.h b/xen/arch/x86/include/asm/regs.h
index ddf5e14e57..e99b18e3ab 100644
--- a/xen/arch/x86/include/asm/regs.h
+++ b/xen/arch/x86/include/asm/regs.h
@@ -1,6 +1,6 @@
 
-#ifndef __X86_REGS_H__
-#define __X86_REGS_H__
+#ifndef ASM__X86__REGS_H
+#define ASM__X86__REGS_H
 
 #include <asm/x86_64/regs.h>
 
@@ -30,4 +30,4 @@ static inline void read_sregs(struct cpu_user_regs *regs)
     asm ( "mov %%gs, %0" : "=m" (regs->gs) );
 }
 
-#endif /* __X86_REGS_H__ */
+#endif /* ASM__X86__REGS_H */
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index d75589178b..be6cac0095 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -1,5 +1,5 @@
-#ifndef __X86_SETUP_H_
-#define __X86_SETUP_H_
+#ifndef ASM__X86__SETUP_H
+#define ASM__X86__SETUP_H
 
 #include <xen/multiboot.h>
 #include <asm/numa.h>
diff --git a/xen/arch/x86/include/asm/shadow.h b/xen/arch/x86/include/asm/shadow.h
index 9a8d1b8353..034d389c60 100644
--- a/xen/arch/x86/include/asm/shadow.h
+++ b/xen/arch/x86/include/asm/shadow.h
@@ -19,8 +19,8 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef _XEN_SHADOW_H
-#define _XEN_SHADOW_H
+#ifndef ASM__X86__SHADOW_H
+#define ASM__X86__SHADOW_H
 
 #include <xen/sched.h>
 #include <xen/perfc.h>
@@ -271,7 +271,7 @@ static inline void shadow_remove_all_shadows(struct domain *d, mfn_t gmfn)
     sh_remove_shadows(d, gmfn, 0 /* Be thorough */, 1 /* Must succeed */);
 }
 
-#endif /* _XEN_SHADOW_H */
+#endif /* ASM__X86__SHADOW_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/shared.h b/xen/arch/x86/include/asm/shared.h
index 60b67fa4b4..b08c8b3f7b 100644
--- a/xen/arch/x86/include/asm/shared.h
+++ b/xen/arch/x86/include/asm/shared.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_X86_SHARED_H__
-#define __XEN_X86_SHARED_H__
+#ifndef ASM__X86__SHARED_H
+#define ASM__X86__SHARED_H
 
 #ifdef CONFIG_COMPAT
 
@@ -83,4 +83,4 @@ GET_SET_VCPU(unsigned long, cr2)
 #undef GET_SET_VCPU
 #undef GET_SET_SHARED
 
-#endif /* __XEN_X86_SHARED_H__ */
+#endif /* ASM__X86__SHARED_H */
diff --git a/xen/arch/x86/include/asm/shstk.h b/xen/arch/x86/include/asm/shstk.h
index 9160fe9f0e..e04694c151 100644
--- a/xen/arch/x86/include/asm/shstk.h
+++ b/xen/arch/x86/include/asm/shstk.h
@@ -2,8 +2,8 @@
 /******************************************************************************
  * Copyright (c) 2022 Citrix Systems Ltd.
  */
-#ifndef XEN_ASM_SHSTK_H
-#define XEN_ASM_SHSTK_H
+#ifndef ASM__X86__SHSTK_H
+#define ASM__X86__SHSTK_H
 
 /*
  * RDSSP is a nop when shadow stacks are inactive.  Also, SSP has a minimum
@@ -31,4 +31,4 @@ static inline void wrss(unsigned long val, unsigned long *ptr)
           : [val] "r" (val) );
 }
 
-#endif /* XEN_ASM_SHSTK_H */
+#endif /* ASM__X86__SHSTK_H */
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
index c8c7960134..90c17d1a2b 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SMP_H
-#define __ASM_SMP_H
+#ifndef ASM__X86__SMP_H
+#define ASM__X86__SMP_H
 
 /*
  * We need the APIC definitions automatically as part of 'smp.h'
diff --git a/xen/arch/x86/include/asm/softirq.h b/xen/arch/x86/include/asm/softirq.h
index 415ee866c7..796ee09586 100644
--- a/xen/arch/x86/include/asm/softirq.h
+++ b/xen/arch/x86/include/asm/softirq.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SOFTIRQ_H__
-#define __ASM_SOFTIRQ_H__
+#ifndef ASM__X86__SOFTIRQ_H
+#define ASM__X86__SOFTIRQ_H
 
 #define NMI_SOFTIRQ            (NR_COMMON_SOFTIRQS + 0)
 #define TIME_CALIBRATE_SOFTIRQ (NR_COMMON_SOFTIRQS + 1)
@@ -11,4 +11,4 @@
 
 bool arch_skip_send_event_check(unsigned int cpu);
 
-#endif /* __ASM_SOFTIRQ_H__ */
+#endif /* ASM__X86__SOFTIRQ_H */
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 72347ef2b9..472c0a3e94 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2017-2018 Citrix Systems Ltd.
  */
 
-#ifndef __X86_SPEC_CTRL_H__
-#define __X86_SPEC_CTRL_H__
+#ifndef ASM__X86__SPEC_CTRL_H
+#define ASM__X86__SPEC_CTRL_H
 
 /*
  * Encoding of Xen's speculation control flags in:
@@ -196,7 +196,7 @@ static always_inline void spec_ctrl_exit_idle(struct cpu_info *info)
 }
 
 #endif /* __ASSEMBLY__ */
-#endif /* !__X86_SPEC_CTRL_H__ */
+#endif /* !ASM__X86__SPEC_CTRL_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index 729a830411..5c6f0e1ec6 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2017-2018 Citrix Systems Ltd.
  */
 
-#ifndef __X86_SPEC_CTRL_ASM_H__
-#define __X86_SPEC_CTRL_ASM_H__
+#ifndef ASM__X86__SPEC_CTRL_ASM_H
+#define ASM__X86__SPEC_CTRL_ASM_H
 
 #ifdef __ASSEMBLY__
 #include <asm/msr-index.h>
@@ -501,7 +501,7 @@
 .endm
 
 #endif /* __ASSEMBLY__ */
-#endif /* !__X86_SPEC_CTRL_ASM_H__ */
+#endif /* !ASM__X86__SPEC_CTRL_ASM_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/spinlock.h b/xen/arch/x86/include/asm/spinlock.h
index 56f6095752..11bec91e7f 100644
--- a/xen/arch/x86/include/asm/spinlock.h
+++ b/xen/arch/x86/include/asm/spinlock.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SPINLOCK_H
-#define __ASM_SPINLOCK_H
+#ifndef ASM__X86__SPINLOCK_H
+#define ASM__X86__SPINLOCK_H
 
 #define _raw_read_unlock(l) \
     BUILD_BUG_ON(sizeof((l)->lock) != 4); /* Clang doesn't support %z in asm. */ \
@@ -24,4 +24,4 @@
     arch_lock_signal();             \
 })
 
-#endif /* __ASM_SPINLOCK_H */
+#endif /* ASM__X86__SPINLOCK_H */
diff --git a/xen/arch/x86/include/asm/string.h b/xen/arch/x86/include/asm/string.h
index f08d95096e..c0a469ff48 100644
--- a/xen/arch/x86/include/asm/string.h
+++ b/xen/arch/x86/include/asm/string.h
@@ -1,7 +1,7 @@
-#ifndef __X86_STRING_H__
-#define __X86_STRING_H__
+#ifndef ASM__X86__STRING_H
+#define ASM__X86__STRING_H
 
-#endif /* __X86_STRING_H__ */
+#endif /* ASM__X86__STRING_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
index 73cb16ca68..f347e2664e 100644
--- a/xen/arch/x86/include/asm/system.h
+++ b/xen/arch/x86/include/asm/system.h
@@ -1,5 +1,5 @@
-#ifndef __ASM_SYSTEM_H
-#define __ASM_SYSTEM_H
+#ifndef ASM__X86__SYSTEM_H
+#define ASM__X86__SYSTEM_H
 
 #include <xen/bitops.h>
 #include <xen/bug.h>
diff --git a/xen/arch/x86/include/asm/time.h b/xen/arch/x86/include/asm/time.h
index 3dfbb5297a..5452da7c62 100644
--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -1,6 +1,6 @@
 
-#ifndef __X86_TIME_H__
-#define __X86_TIME_H__
+#ifndef ASM__X86__TIME_H
+#define ASM__X86__TIME_H
 
 #include <asm/msr.h>
 
@@ -92,4 +92,4 @@ u64 scale_delta(u64 delta, const struct time_scale *scale);
 #define PIT_STATUS_NULL_COUNT (1 << 6)
 /* Lower bits match Timer Control Word. */
 
-#endif /* __X86_TIME_H__ */
+#endif /* ASM__X86__TIME_H */
diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include/asm/trampoline.h
index 57a1f85a53..a9bbfeedf7 100644
--- a/xen/arch/x86/include/asm/trampoline.h
+++ b/xen/arch/x86/include/asm/trampoline.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef X86_ASM_TRAMPOLINE_H
-#define X86_ASM_TRAMPOLINE_H
+#ifndef ASM__X86__TRAMPOLINE_H
+#define ASM__X86__TRAMPOLINE_H
 
 /*
  * Data in or about the low memory trampoline.
@@ -92,4 +92,4 @@ extern uint8_t video_flags;
 extern uint16_t boot_edid_caps;
 extern uint8_t boot_edid_info[128];
 
-#endif /* X86_ASM_TRAMPOLINE_H */
+#endif /* ASM__X86__TRAMPOLINE_H */
diff --git a/xen/arch/x86/include/asm/traps.h b/xen/arch/x86/include/asm/traps.h
index 01ef362edc..92348b201c 100644
--- a/xen/arch/x86/include/asm/traps.h
+++ b/xen/arch/x86/include/asm/traps.h
@@ -4,12 +4,12 @@
  * Author: Christoph Egger <Christoph.Egger@amd.com>
  */
 
-#ifndef ASM_TRAP_H
-#define ASM_TRAP_H
+#ifndef ASM__X86__TRAPS_H
+#define ASM__X86__TRAPS_H
 
 const char *vector_name(unsigned int vec);
 
-#endif /* ASM_TRAP_H */
+#endif /* ASM__X86__TRAPS_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/types.h b/xen/arch/x86/include/asm/types.h
index 4cbbc8eaa6..99f3388218 100644
--- a/xen/arch/x86/include/asm/types.h
+++ b/xen/arch/x86/include/asm/types.h
@@ -1,8 +1,8 @@
-#ifndef __X86_TYPES_H__
-#define __X86_TYPES_H__
+#ifndef ASM__X86__TYPES_H
+#define ASM__X86__TYPES_H
 
 typedef unsigned long paddr_t;
 #define INVALID_PADDR (~0UL)
 #define PRIpaddr "016lx"
 
-#endif /* __X86_TYPES_H__ */
+#endif /* ASM__X86__TYPES_H */
diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
index 2d01669b96..d47a81a36b 100644
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -1,6 +1,6 @@
 
-#ifndef __X86_UACCESS_H__
-#define __X86_UACCESS_H__
+#ifndef ASM__X86__UACCESS_H
+#define ASM__X86__UACCESS_H
 
 #include <xen/compiler.h>
 #include <xen/errno.h>
@@ -427,4 +427,4 @@ extern void sort_exception_tables(void);
 extern void sort_exception_table(struct exception_table_entry *start,
                                  const struct exception_table_entry *stop);
 
-#endif /* __X86_UACCESS_H__ */
+#endif /* ASM__X86__UACCESS_H */
diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index dae9b43dac..cb5f2b3b17 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -7,8 +7,8 @@
  * Author: Haitao Shan <haitao.shan@intel.com>
  */
 
-#ifndef __ASM_X86_HVM_VPMU_H_
-#define __ASM_X86_HVM_VPMU_H_
+#ifndef ASM__X86__VPMU_H
+#define ASM__X86__VPMU_H
 
 #include <public/pmu.h>
 
@@ -142,5 +142,5 @@ static inline int vpmu_allocate_context(struct vcpu *v)
 }
 #endif
 
-#endif /* __ASM_X86_HVM_VPMU_H_*/
+#endif /* ASM__X86__VPMU_H*/
 
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 7abc5bcd42..a2f3e5ebe7 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_X86_DEFNS_H__
-#define __XEN_X86_DEFNS_H__
+#ifndef ASM__X86__X86_DEFNS_H
+#define ASM__X86__X86_DEFNS_H
 
 /*
  * EFLAGS bits
@@ -204,4 +204,4 @@
 #define X86_MT_UCM    0x07 /* UC- */
 #define X86_NUM_MT    0x08
 
-#endif	/* __XEN_X86_DEFNS_H__ */
+#endif	/* ASM__X86__X86_DEFNS_H */
diff --git a/xen/arch/x86/include/asm/x86-vendors.h b/xen/arch/x86/include/asm/x86-vendors.h
index d51c516909..eb69dab2fc 100644
--- a/xen/arch/x86/include/asm/x86-vendors.h
+++ b/xen/arch/x86/include/asm/x86-vendors.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_X86_VENDORS_H__
-#define __XEN_X86_VENDORS_H__
+#ifndef ASM__X86__X86_VENDORS_H
+#define ASM__X86__X86_VENDORS_H
 
 /*
  * CPU vendor IDs
@@ -36,4 +36,4 @@
 #define X86_VENDOR_HYGON_ECX _AC(0x656e6975, U)
 #define X86_VENDOR_HYGON_EDX _AC(0x6e65476e, U)
 
-#endif	/* __XEN_X86_VENDORS_H__ */
+#endif	/* ASM__X86__X86_VENDORS_H */
diff --git a/xen/arch/x86/include/asm/x86_64/elf.h b/xen/arch/x86/include/asm/x86_64/elf.h
index 00227e0e12..7842e4c997 100644
--- a/xen/arch/x86/include/asm/x86_64/elf.h
+++ b/xen/arch/x86/include/asm/x86_64/elf.h
@@ -1,5 +1,5 @@
-#ifndef __X86_64_ELF_H__
-#define __X86_64_ELF_H__
+#ifndef ASM__X86__X86_64__ELF_H
+#define ASM__X86__X86_64__ELF_H
 
 #include <asm/msr.h>
 #include <asm/regs.h>
@@ -72,7 +72,7 @@ static inline void elf_core_save_regs(ELF_Gregset *core_regs,
     asm ( "mov %%cr4, %0" : "=r" (xen_core_regs->cr4) );
 }
 
-#endif /* __X86_64_ELF_H__ */
+#endif /* ASM__X86__X86_64__ELF_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/x86_64/page.h b/xen/arch/x86/include/asm/x86_64/page.h
index 201b79f99e..797bc698f3 100644
--- a/xen/arch/x86/include/asm/x86_64/page.h
+++ b/xen/arch/x86/include/asm/x86_64/page.h
@@ -1,6 +1,6 @@
 
-#ifndef __X86_64_PAGE_H__
-#define __X86_64_PAGE_H__
+#ifndef ASM__X86__X86_64__PAGE_H
+#define ASM__X86__X86_64__PAGE_H
 
 #define __XEN_VIRT_START        XEN_VIRT_START
 
@@ -153,7 +153,7 @@ static inline intpte_t put_pte_flags(unsigned int x)
 #define PAGE_HYPERVISOR_WT      (__PAGE_HYPERVISOR_WT | \
                                  _PAGE_GLOBAL | _PAGE_NX)
 
-#endif /* __X86_64_PAGE_H__ */
+#endif /* ASM__X86__X86_64__PAGE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/x86_64/regs.h b/xen/arch/x86/include/asm/x86_64/regs.h
index 171cf9a2e2..55a309cf24 100644
--- a/xen/arch/x86/include/asm/x86_64/regs.h
+++ b/xen/arch/x86/include/asm/x86_64/regs.h
@@ -1,5 +1,5 @@
-#ifndef _X86_64_REGS_H
-#define _X86_64_REGS_H
+#ifndef ASM__X86__X86_64__REGS_H
+#define ASM__X86__X86_64__REGS_H
 
 #include <xen/types.h>
 #include <public/xen.h>
diff --git a/xen/arch/x86/include/asm/x86_64/system.h b/xen/arch/x86/include/asm/x86_64/system.h
index e94371cf20..2bb71615fe 100644
--- a/xen/arch/x86/include/asm/x86_64/system.h
+++ b/xen/arch/x86/include/asm/x86_64/system.h
@@ -1,5 +1,5 @@
-#ifndef __X86_64_SYSTEM_H__
-#define __X86_64_SYSTEM_H__
+#ifndef ASM__X86__X86_64__SYSTEM_H
+#define ASM__X86__X86_64__SYSTEM_H
 
 #define cmpxchg(ptr,o,n)                                                \
     ((__typeof__(*(ptr)))__cmpxchg((ptr),(unsigned long)(o),            \
@@ -59,4 +59,4 @@ static always_inline __uint128_t cmpxchg16b_local_(
     __cmpxchg16b(_p, (void *)(o), (void *)(n));            \
 })
 
-#endif /* __X86_64_SYSTEM_H__ */
+#endif /* ASM__X86__X86_64__SYSTEM_H */
diff --git a/xen/arch/x86/include/asm/x86_64/uaccess.h b/xen/arch/x86/include/asm/x86_64/uaccess.h
index c6fa3fd381..e775af5487 100644
--- a/xen/arch/x86/include/asm/x86_64/uaccess.h
+++ b/xen/arch/x86/include/asm/x86_64/uaccess.h
@@ -1,5 +1,5 @@
-#ifndef __X86_64_UACCESS_H
-#define __X86_64_UACCESS_H
+#ifndef ASM__X86__X86_64__UACCESS_H
+#define ASM__X86__X86_64__UACCESS_H
 
 /*
  * With CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS (apparent) PV guest accesses
@@ -68,4 +68,4 @@ extern void *xlat_malloc(unsigned long *xlat_page_current, size_t size);
     (likely((count) < (~0U / (size))) && \
      compat_access_ok(addr, 0 + (count) * (size)))
 
-#endif /* __X86_64_UACCESS_H */
+#endif /* ASM__X86__X86_64__UACCESS_H */
diff --git a/xen/arch/x86/include/asm/x86_emulate.h b/xen/arch/x86/include/asm/x86_emulate.h
index 2b75f7f8e2..95aba22819 100644
--- a/xen/arch/x86/include/asm/x86_emulate.h
+++ b/xen/arch/x86/include/asm/x86_emulate.h
@@ -9,8 +9,8 @@
  *    Keir Fraser <keir@xen.org>
  */
 
-#ifndef __ASM_X86_X86_EMULATE_H__
-#define __ASM_X86_X86_EMULATE_H__
+#ifndef ASM__X86__X86_EMULATE_H
+#define ASM__X86__X86_EMULATE_H
 
 #include <xen/types.h>
 #include <xen/lib.h>
@@ -19,4 +19,4 @@
 
 #include "../../x86_emulate/x86_emulate.h"
 
-#endif /* __ASM_X86_X86_EMULATE_H__ */
+#endif /* ASM__X86__X86_EMULATE_H */
diff --git a/xen/arch/x86/include/asm/xenoprof.h b/xen/arch/x86/include/asm/xenoprof.h
index dc6f822d32..8d729a0397 100644
--- a/xen/arch/x86/include/asm/xenoprof.h
+++ b/xen/arch/x86/include/asm/xenoprof.h
@@ -7,8 +7,8 @@
  *                    VA Linux Systems Japan K.K.
  */
 
-#ifndef __ASM_X86_XENOPROF_H__
-#define __ASM_X86_XENOPROF_H__
+#ifndef ASM__X86__XENOPROF_H
+#define ASM__X86__XENOPROF_H
 
 struct vcpu;
 
@@ -82,7 +82,7 @@ static inline bool nmi_oprofile_send_virq(void)
 
 #endif /* CONFIG_XENOPROF */
 
-#endif /* __ASM_X86_XENOPROF_H__ */
+#endif /* ASM__X86__XENOPROF_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index b4ee555953..b673412e71 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -5,8 +5,8 @@
  * 
  */
 
-#ifndef __ASM_XSTATE_H
-#define __ASM_XSTATE_H
+#ifndef ASM__X86__XSTATE_H
+#define ASM__X86__XSTATE_H
 
 #include <xen/sched.h>
 #include <asm/cpufeature.h>
@@ -142,4 +142,4 @@ static inline bool xstate_all(const struct vcpu *v)
            (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
 }
 
-#endif /* __ASM_XSTATE_H */
+#endif /* ASM__X86__XSTATE_H */
diff --git a/xen/arch/x86/mm/hap/private.h b/xen/arch/x86/mm/hap/private.h
index 7eb672fa41..a85d390f56 100644
--- a/xen/arch/x86/mm/hap/private.h
+++ b/xen/arch/x86/mm/hap/private.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2007, AMD Corporation (Wei Huang)
  *
  */
-#ifndef __HAP_PRIVATE_H__
-#define __HAP_PRIVATE_H__
+#ifndef X86__MM__HAP__PRIVATE_H
+#define X86__MM__HAP__PRIVATE_H
 
 #include "../mm-locks.h"
 
@@ -30,4 +30,4 @@ unsigned long cf_check hap_p2m_ga_to_gfn_4_levels(
     struct vcpu *v, struct p2m_domain *p2m, unsigned long cr3,
     paddr_t ga, uint32_t *pfec, unsigned int *page_order);
 
-#endif /* __HAP_PRIVATE_H__ */
+#endif /* X86__MM__HAP__PRIVATE_H */
diff --git a/xen/arch/x86/mm/mm-locks.h b/xen/arch/x86/mm/mm-locks.h
index a695a28324..e676c19b87 100644
--- a/xen/arch/x86/mm/mm-locks.h
+++ b/xen/arch/x86/mm/mm-locks.h
@@ -10,8 +10,8 @@
  * Copyright (c) 2006 Michael A Fetterman
  */
 
-#ifndef _MM_LOCKS_H
-#define _MM_LOCKS_H
+#ifndef X86__MM__MM_LOCKS_H
+#define X86__MM__MM_LOCKS_H
 
 /* Per-CPU variable for enforcing the lock ordering */
 DECLARE_PER_CPU(int, mm_lock_level);
@@ -394,4 +394,4 @@ declare_mm_lock(paging)
 #define paging_unlock(d)       mm_unlock(&(d)->arch.paging.lock)
 #define paging_locked_by_me(d) mm_locked_by_me(&(d)->arch.paging.lock)
 
-#endif /* _MM_LOCKS_H */
+#endif /* X86__MM__MM_LOCKS_H */
diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
index 635f5a7f45..6815367c10 100644
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -3,8 +3,8 @@
  * arch/x86/mm/p2m.h
  */
 
-#ifndef __ARCH_MM_P2M_H__
-#define __ARCH_MM_P2M_H__
+#ifndef X86__MM__P2M_H
+#define X86__MM__P2M_H
 
 struct p2m_domain *p2m_init_one(struct domain *d);
 void p2m_free_one(struct p2m_domain *p2m);
@@ -33,7 +33,7 @@ int ept_p2m_init(struct p2m_domain *p2m);
 void ept_p2m_uninit(struct p2m_domain *p2m);
 void p2m_init_altp2m_ept(struct domain *d, unsigned int i);
 
-#endif /* __ARCH_MM_P2M_H__ */
+#endif /* X86__MM__P2M_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index a5fc3a7676..f6156eceb7 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -8,8 +8,8 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
-#ifndef _XEN_SHADOW_PRIVATE_H
-#define _XEN_SHADOW_PRIVATE_H
+#ifndef X86__MM__SHADOW__PRIVATE_H
+#define X86__MM__SHADOW__PRIVATE_H
 
 // In order to override the definition of mfn_to_page, we make sure page.h has
 // been included...
@@ -912,7 +912,7 @@ static inline int sh_check_page_has_no_refs(struct page_info *page)
 /* Flush the TLB of the selected vCPUs. */
 bool cf_check shadow_flush_tlb(const unsigned long *vcpu_bitmap);
 
-#endif /* _XEN_SHADOW_PRIVATE_H */
+#endif /* X86__MM__SHADOW__PRIVATE_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/mm/shadow/types.h b/xen/arch/x86/mm/shadow/types.h
index d700d8d64c..ade4e6601d 100644
--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -7,8 +7,8 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
-#ifndef _XEN_SHADOW_TYPES_H
-#define _XEN_SHADOW_TYPES_H
+#ifndef X86__MM__SHADOW__TYPES_H
+#define X86__MM__SHADOW__TYPES_H
 
 /* The number of levels in the shadow pagetable is entirely determined
  * by the number of levels in the guest pagetable */
@@ -377,7 +377,7 @@ static inline uint32_t sh_l1e_mmio_get_flags(shadow_l1e_t sl1e)
 #endif /* SHOPT_FAST_FAULT_PATH */
 
 
-#endif /* _XEN_SHADOW_TYPES_H */
+#endif /* X86__MM__SHADOW__TYPES_H */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/oprofile/op_counter.h b/xen/arch/x86/oprofile/op_counter.h
index b515ac9ebc..b2ad0fb108 100644
--- a/xen/arch/x86/oprofile/op_counter.h
+++ b/xen/arch/x86/oprofile/op_counter.h
@@ -7,8 +7,8 @@
  * @author John Levon
  */
  
-#ifndef OP_COUNTER_H
-#define OP_COUNTER_H
+#ifndef X86__OPROFILE__OP_COUNTER_H
+#define X86__OPROFILE__OP_COUNTER_H
  
 #define OP_MAX_COUNTER 8
  
@@ -38,4 +38,4 @@ struct op_ibs_config {
 
 extern struct op_ibs_config ibs_config;
 
-#endif /* OP_COUNTER_H */
+#endif /* X86__OPROFILE__OP_COUNTER_H */
diff --git a/xen/arch/x86/oprofile/op_x86_model.h b/xen/arch/x86/oprofile/op_x86_model.h
index 35bc3c1e22..92253da6a5 100644
--- a/xen/arch/x86/oprofile/op_x86_model.h
+++ b/xen/arch/x86/oprofile/op_x86_model.h
@@ -8,8 +8,8 @@
  * @author Graydon Hoare
  */
 
-#ifndef OP_X86_MODEL_H
-#define OP_X86_MODEL_H
+#ifndef X86__OPROFILE__OP_X86_MODEL_H
+#define X86__OPROFILE__OP_X86_MODEL_H
 
 struct op_msr {
 	unsigned long addr;
@@ -55,4 +55,4 @@ void arch_perfmon_setup_counters(void);
 extern int ppro_has_global_ctrl;
 extern struct op_x86_model_spec const *model;
 
-#endif /* OP_X86_MODEL_H */
+#endif /* X86__OPROFILE__OP_X86_MODEL_H */
diff --git a/xen/arch/x86/pv/emulate.h b/xen/arch/x86/pv/emulate.h
index 49a4d34832..7eef71758e 100644
--- a/xen/arch/x86/pv/emulate.h
+++ b/xen/arch/x86/pv/emulate.h
@@ -1,5 +1,5 @@
-#ifndef __PV_EMULATE_H__
-#define __PV_EMULATE_H__
+#ifndef X86__PV__EMULATE_H
+#define X86__PV__EMULATE_H
 
 #include <xen/sched.h>
 
@@ -22,4 +22,4 @@ static inline const seg_desc_t *gdt_ldt_desc_ptr(unsigned int sel)
     return &tbl[sel >> 3];
 }
 
-#endif /* __PV_EMULATE_H__ */
+#endif /* X86__PV__EMULATE_H */
diff --git a/xen/arch/x86/pv/mm.h b/xen/arch/x86/pv/mm.h
index 4564cab9fc..49a10b2878 100644
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -1,5 +1,5 @@
-#ifndef __PV_MM_H__
-#define __PV_MM_H__
+#ifndef X86__PV__MM_H
+#define X86__PV__MM_H
 
 #include <asm/shadow.h>
 
@@ -181,4 +181,4 @@ static always_inline l4_pgentry_t adjust_guest_l4e(l4_pgentry_t l4e,
     return l4e;
 }
 
-#endif /* __PV_MM_H__ */
+#endif /* X86__PV__MM_H */
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 3e819d4174..d52ac28307 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -8,8 +8,8 @@
  * Copyright (c) 2005-2007 XenSource Inc.
  */
 
-#ifndef __X86_EMULATE_H__
-#define __X86_EMULATE_H__
+#ifndef X86__X86_EMULATE__X86_EMULATE_H
+#define X86__X86_EMULATE__X86_EMULATE_H
 
 #include <xen/lib/x86/cpu-policy.h>
 
@@ -846,4 +846,4 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
     ctxt->event = (struct x86_event){};
 }
 
-#endif /* __X86_EMULATE_H__ */
+#endif /* X86__X86_EMULATE__X86_EMULATE_H */
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 8fa3fb711a..7138a3e2e6 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -30,15 +30,15 @@
  * Includer has not provided a custom XEN_CPUFEATURE().  Arrange for normal
  * header guards, an enum and constants in the XEN_X86_FEATURE_xxx namespace.
  */
-#ifndef __XEN_PUBLIC_ARCH_X86_CPUFEATURESET_H__
-#define __XEN_PUBLIC_ARCH_X86_CPUFEATURESET_H__
+#ifndef PUBLIC__ARCH_X86__CPUFEATURESET_H
+#define PUBLIC__ARCH_X86__CPUFEATURESET_H
 
 #define XEN_CPUFEATURESET_DEFAULT_INCLUDE
 
 #define XEN_CPUFEATURE(name, value) XEN_X86_FEATURE_##name = value,
 enum {
 
-#endif /* __XEN_PUBLIC_ARCH_X86_CPUFEATURESET_H__ */
+#endif /* PUBLIC__ARCH_X86__CPUFEATURESET_H */
 #endif /* !XEN_CPUFEATURE */
 
 
diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index 3bb0dd249f..81648850fa 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -10,8 +10,8 @@
  *    Keir Fraser <keir@xen.org>
  */
 
-#ifndef __XEN_PUBLIC_ARCH_X86_CPUID_H__
-#define __XEN_PUBLIC_ARCH_X86_CPUID_H__
+#ifndef PUBLIC__ARCH_X86__CPUID_H
+#define PUBLIC__ARCH_X86__CPUID_H
 
 /*
  * For compatibility with other hypervisor interfaces, the Xen cpuid leaves
@@ -119,4 +119,4 @@
 
 #define XEN_CPUID_MAX_NUM_LEAVES 5
 
-#endif /* __XEN_PUBLIC_ARCH_X86_CPUID_H__ */
+#endif /* PUBLIC__ARCH_X86__CPUID_H */
diff --git a/xen/include/public/arch-x86/guest-acpi.h b/xen/include/public/arch-x86/guest-acpi.h
index de40259b6a..d5326b3227 100644
--- a/xen/include/public/arch-x86/guest-acpi.h
+++ b/xen/include/public/arch-x86/guest-acpi.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef __XEN_PUBLIC_ARCH_X86_GUEST_ACPI_H__
-#define __XEN_PUBLIC_ARCH_X86_GUEST_ACPI_H__
+#ifndef PUBLIC__ARCH_X86__GUEST_ACPI_H
+#define PUBLIC__ARCH_X86__GUEST_ACPI_H
 
 #ifdef __XEN_TOOLS__
 
@@ -20,7 +20,7 @@
 
 #endif /* __XEN_TOOLS__ */
 
-#endif /* __XEN_PUBLIC_ARCH_X86_GUEST_ACPI_H__ */
+#endif /* PUBLIC__ARCH_X86__GUEST_ACPI_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 7ecacadde1..9763dadbb6 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -6,8 +6,8 @@
  * Copyright (c) 2007 XenSource Ltd.
  */
 
-#ifndef __XEN_PUBLIC_HVM_SAVE_X86_H__
-#define __XEN_PUBLIC_HVM_SAVE_X86_H__
+#ifndef PUBLIC__ARCH_X86__HVM__SAVE_H
+#define PUBLIC__ARCH_X86__HVM__SAVE_H
 
 #include "../../xen.h"
 
@@ -631,7 +631,7 @@ struct hvm_msr {
  */
 #define HVM_SAVE_CODE_MAX 20
 
-#endif /* __XEN_PUBLIC_HVM_SAVE_X86_H__ */
+#endif /* PUBLIC__ARCH_X86__HVM__SAVE_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/arch-x86/hvm/start_info.h b/xen/include/public/arch-x86/hvm/start_info.h
index e33557c0b4..ce5486e8a1 100644
--- a/xen/include/public/arch-x86/hvm/start_info.h
+++ b/xen/include/public/arch-x86/hvm/start_info.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2016, Citrix Systems, Inc.
  */
 
-#ifndef __XEN_PUBLIC_ARCH_X86_HVM_START_INFO_H__
-#define __XEN_PUBLIC_ARCH_X86_HVM_START_INFO_H__
+#ifndef PUBLIC__ARCH_X86__HVM__START_INFO_H
+#define PUBLIC__ARCH_X86__HVM__START_INFO_H
 
 /*
  * Start of day structure passed to PVH guests and to HVM guests in %ebx.
@@ -139,4 +139,4 @@ struct hvm_memmap_table_entry {
     uint32_t reserved;          /* Must be zero for Version 1.               */
 };
 
-#endif /* __XEN_PUBLIC_ARCH_X86_HVM_START_INFO_H__ */
+#endif /* PUBLIC__ARCH_X86__HVM__START_INFO_H */
diff --git a/xen/include/public/arch-x86/pmu.h b/xen/include/public/arch-x86/pmu.h
index d0a99268af..4eaab67725 100644
--- a/xen/include/public/arch-x86/pmu.h
+++ b/xen/include/public/arch-x86/pmu.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2015 Oracle and/or its affiliates. All rights reserved.
  */
 
-#ifndef __XEN_PUBLIC_ARCH_X86_PMU_H__
-#define __XEN_PUBLIC_ARCH_X86_PMU_H__
+#ifndef PUBLIC__ARCH_X86__PMU_H
+#define PUBLIC__ARCH_X86__PMU_H
 
 /* x86-specific PMU definitions */
 
@@ -129,7 +129,7 @@ struct xen_pmu_arch {
 typedef struct xen_pmu_arch xen_pmu_arch_t;
 DEFINE_XEN_GUEST_HANDLE(xen_pmu_arch_t);
 
-#endif /* __XEN_PUBLIC_ARCH_X86_PMU_H__ */
+#endif /* PUBLIC__ARCH_X86__PMU_H */
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/arch-x86/xen-mca.h b/xen/include/public/arch-x86/xen-mca.h
index bb1b12f14f..fc1c27fa7d 100644
--- a/xen/include/public/arch-x86/xen-mca.h
+++ b/xen/include/public/arch-x86/xen-mca.h
@@ -33,8 +33,8 @@
  *     and tell Xen to trigger a machine check
  */
 
-#ifndef __XEN_PUBLIC_ARCH_X86_MCA_H__
-#define __XEN_PUBLIC_ARCH_X86_MCA_H__
+#ifndef PUBLIC__ARCH_X86__XEN_MCA_H
+#define PUBLIC__ARCH_X86__XEN_MCA_H
 
 /* Hypercall */
 #define __HYPERVISOR_mca __HYPERVISOR_arch_0
@@ -435,4 +435,4 @@ DEFINE_XEN_GUEST_HANDLE(xen_mc_t);
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __XEN_PUBLIC_ARCH_X86_MCA_H__ */
+#endif /* PUBLIC__ARCH_X86__XEN_MCA_H */
diff --git a/xen/include/public/arch-x86/xen-x86_32.h b/xen/include/public/arch-x86/xen-x86_32.h
index 9e3bf06b12..e6ee09f4f2 100644
--- a/xen/include/public/arch-x86/xen-x86_32.h
+++ b/xen/include/public/arch-x86/xen-x86_32.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2004-2007, K A Fraser
  */
 
-#ifndef __XEN_PUBLIC_ARCH_X86_XEN_X86_32_H__
-#define __XEN_PUBLIC_ARCH_X86_XEN_X86_32_H__
+#ifndef PUBLIC__ARCH_X86__XEN_X86_32_H
+#define PUBLIC__ARCH_X86__XEN_X86_32_H
 
 /*
  * Hypercall interface:
@@ -164,7 +164,7 @@ typedef struct xen_callback xen_callback_t;
 
 #endif /* !__ASSEMBLY__ */
 
-#endif /* __XEN_PUBLIC_ARCH_X86_XEN_X86_32_H__ */
+#endif /* PUBLIC__ARCH_X86__XEN_X86_32_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/arch-x86/xen-x86_64.h b/xen/include/public/arch-x86/xen-x86_64.h
index 43f6e3d220..f33ca35f26 100644
--- a/xen/include/public/arch-x86/xen-x86_64.h
+++ b/xen/include/public/arch-x86/xen-x86_64.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2004-2006, K A Fraser
  */
 
-#ifndef __XEN_PUBLIC_ARCH_X86_XEN_X86_64_H__
-#define __XEN_PUBLIC_ARCH_X86_XEN_X86_64_H__
+#ifndef PUBLIC__ARCH_X86__XEN_X86_64_H
+#define PUBLIC__ARCH_X86__XEN_X86_64_H
 
 /*
  * Hypercall interface:
@@ -211,7 +211,7 @@ typedef unsigned long xen_callback_t;
 
 #endif /* !__ASSEMBLY__ */
 
-#endif /* __XEN_PUBLIC_ARCH_X86_XEN_X86_64_H__ */
+#endif /* PUBLIC__ARCH_X86__XEN_X86_64_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index fc24879866..4a48057e5c 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2004-2006, K A Fraser
  */
 
-#ifndef __XEN_PUBLIC_ARCH_X86_XEN_H__
-#define __XEN_PUBLIC_ARCH_X86_XEN_H__
+#ifndef PUBLIC__ARCH_X86__XEN_H
+#define PUBLIC__ARCH_X86__XEN_H
 
 /* Structural guest handles introduced in 0x00030201. */
 #if __XEN_INTERFACE_VERSION__ >= 0x00030201
@@ -363,7 +363,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_msr_entry_t);
  */
 #define XEN_HVM_DEBUGCONS_IOPORT 0xe9
 
-#endif /* __XEN_PUBLIC_ARCH_X86_XEN_H__ */
+#endif /* PUBLIC__ARCH_X86__XEN_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index f43e1a3b21..cef116d8cb 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -1,6 +1,6 @@
 /* Common data structures and functions consumed by hypervisor and toolstack */
-#ifndef XEN_LIB_X86_POLICIES_H
-#define XEN_LIB_X86_POLICIES_H
+#ifndef XEN__LIB__X86__CPU_POLICY_H
+#define XEN__LIB__X86__CPU_POLICY_H
 
 #include <xen/lib/x86/cpuid-autogen.h>
 
@@ -542,7 +542,7 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
                                     const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err);
 
-#endif /* !XEN_LIB_X86_POLICIES_H */
+#endif /* !XEN__LIB__X86__CPU_POLICY_H */
 
 /*
  * Local variables:
diff --git a/xen/lib/x86/private.h b/xen/lib/x86/private.h
index 60bb82a400..bd55647d68 100644
--- a/xen/lib/x86/private.h
+++ b/xen/lib/x86/private.h
@@ -1,5 +1,5 @@
-#ifndef XEN_LIB_X86_PRIVATE_H
-#define XEN_LIB_X86_PRIVATE_H
+#ifndef LIB__X86__PRIVATE_H
+#define LIB__X86__PRIVATE_H
 
 #ifdef __XEN__
 
@@ -65,7 +65,7 @@ static inline bool test_bit(unsigned int bit, const void *vaddr)
 
 #endif /* __XEN__ */
 
-#endif /* XEN_LIB_X86_PRIVATE_H */
+#endif /* LIB__X86__PRIVATE_H */
 
 /*
  * Local variables:
-- 
2.34.1


