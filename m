Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA61B12091
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058055.1425720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK0y-0002Od-7t; Fri, 25 Jul 2025 15:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058055.1425720; Fri, 25 Jul 2025 15:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK0y-0002Mm-2M; Fri, 25 Jul 2025 15:07:16 +0000
Received: by outflank-mailman (input) for mailman id 1058055;
 Fri, 25 Jul 2025 15:07:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufK0w-0002MW-1z
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:07:14 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0af029c3-6969-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 17:07:12 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-612a8e6f675so3728656a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:07:12 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm2194208a12.22.2025.07.25.08.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 08:07:11 -0700 (PDT)
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
X-Inumbo-ID: 0af029c3-6969-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753456032; x=1754060832; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kluUUTP0hTT9OcAwmZPg/obLwWQwHpDNiU2oKOR6/kU=;
        b=K2q9SeqV/FbpLI30/af7B9GSu6EtJKUWv8T1RdmZw07z6yLWILpPIs1sOgK9pWNyOo
         VSrp82VagZVdFUx5F2dJ9f9C31OTMm0qRWwm0tHb2yswh9r/+pWbSbf13+o6ra1jNFQ+
         umNmLn+1BWRouFmMdQYf1cucwPWxx+P5IO01I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456032; x=1754060832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kluUUTP0hTT9OcAwmZPg/obLwWQwHpDNiU2oKOR6/kU=;
        b=LnnTZCA+5xzNSPsRzlBfpUhjwDMICA9sj0id870DMKOZCEa37CBKSmuJ9s5DE9n98B
         1/DeXfUEPIMyRzeeAn83v4ChgLyr6o+4ZvXgFDiQgGJN0aUmLhCdxzHEagMNLdE08RyX
         E6KxDWIPifzwLpm7m8NvbpvQWVPHQ/oWwaLaMko5VsxMdG1FQZkL2XJlm+nC0yIcHWb5
         vdgqP+7K0PHFlYtz8/cybYW46eCHR7dxyYj0mM//UzdhiMQpC1H8AcD6MGHWEp+TMFrJ
         H1Qjwc6PEGlzc0xBTrDe2z4vGH5fV7B9vHwi2NTLgHv2qeK0Mt291YaEI6ZTxd4Qdkmo
         NamA==
X-Gm-Message-State: AOJu0YyYQ62y1o7MCOUqPADw+IoIjsfbQnOH4XD/Uv0d8YeFt3KVQsdT
	MxUQ3LU9pUVyXF+PhKuU8FP2pJfJMu8WF/wyihPB1DLjnRwpXlCdNvVF3x6SscJW6tqO8XenTav
	lWfO7uWA=
X-Gm-Gg: ASbGncsdKTe2vkVSMNmgyweY8p49K23CjFusoA5tWp40kILCqpOL+EkR/T1pgt1WMxe
	fMUYiFzJ3I9VwWlDROq/fyNxZZPPGO7T5NzOpDCt4VWOUzaf4teMuU2tFnW/t2SpC10fkKytTc6
	OVnpjcy98kEycMHU0N69pGbIL9PAYB60gHCBfoE1pNROAAD0alGhT4xH+JdDiv9jS0X6GZkFd/l
	oErabroMNYKZXH2fFdCiAKqk6GjndZsIvp1/RXuyUIp9W1wR4brIYUqmTDxDc/AZF6J/IesTE2D
	74nFpvflGmNy5yMnifCdoW6E6oIwygwK39ZdXx7tlNYllxBafyvsegBmzZxxIbi9vBsbuOvxAIp
	EaMzjXQvYnQIPjGU4X/Bu/uVWC3SBtlVIMXR7
X-Google-Smtp-Source: AGHT+IH0FaWQmAq/1N6vQLYIALaxfASv58EkSbZ4gRM/NHFNbYgOnfAJi+/k0EodV1Fd7M40AuUAvQ==
X-Received: by 2002:a05:6402:1eca:b0:614:d585:3594 with SMTP id 4fb4d7f45d1cf-614f1bd824emr2164991a12.5.1753456031753;
        Fri, 25 Jul 2025 08:07:11 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	andriy.sultanov@vates.tech,
	boris.ostrovsky@oracle.com
Subject: [RFC PATCH v1 00/10] Xen flamegraph (hypervisor stacktrace profile) support
Date: Fri, 25 Jul 2025 16:06:36 +0100
Message-ID: <cover.1753372928.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I've long wanted to get stacktraces when profiling Xen, otherwise all
you'd see is e.g. the address of memcpy, but without knowing which
function called it you can't optimize it.

Once you have stacktraces, even a simple low (prime) frequency timer
based profile can show hotspots that would be optimization candidates,
aka Flamegraphs. (even if the sample doesn't
always hit within the same function and individually they'd be too small
to be noticable, it should hit in one of the parents if it is a
bottleneck).

Example flamegraph produced using these patches:
 * workload: an otherwise idle VM migrated on localhost by XAPI in a loop:
 https://cdn.jsdelivr.net/gh/edwintorok/xen@pmustack-coverletter/docs/tmp/migrate-localhost.svg?x=473.2&y=2197&s=null
 * workload: VM migrated between 2 hosts by XAPI (NFS storage):
 https://cdn.jsdelivr.net/gh/edwintorok/xen@pmustack-coverletter/docs/tmp/migrate-send.svg?x=950.6&y=2197
 https://cdn.jsdelivr.net/gh/edwintorok/xen@pmustack-coverletter/docs/tmp/migrate-receive.svg?x=906.6&y=869

There might be other approaches that could be tried in the future, e.g. Last Branch Record, but:
 * although both Intel and AMD support it, AFAIK Xen doesn't support it on AMD
 yet
 * there is a hardware limit to how deep it can be (~32?)
 * LBR may need some additional configuration to enable it to trace the
  hypervisor
 * Intel PMU is completely broken on the system I tried it on, so I
  would've had to first fix that

This is some very early experimental work, thought I'd share it to get
feedback on:
 * the desired ABI additions in pmu.h and arch-x86/pmu.h
 * any bugs you may spot
 * if anyone wants to port the python symbol lookup to perf itself
 (actually latest perf ships a flamegraph.py too)

It also starts to become useful enough to spot performance hotspots in
Xen, e.g. the rwlock.c scaling issue with large CONFIG_NR_CPUS, or
unexpected page faults in 'unmap_page_range' (spotted by Andrew).

It builds on top of:
 * the existing VPMU support, documented by Boris Ostrovsky in this thread: https://lists.xenproject.org/archives/html/xen-devel/2016-08/msg03244.html
 * a python script by Andriy to post-process the perf output

Steps to enable:
 1. ensure that you've got a build of Xen with CONFIG_FRAME_POINTER=y.
 Debug builds would have it, but for performance testing creating a
 release build with frame pointers enabled is recommended.

 2. Apply both the Linux and Xen patches.
    I tested on top of ~6.6.22, and Xen 4.21+ (5c798ac8854af3528a78ca5a622c9ea68399809b)

 3. ensure that VPMU is enabled in Xen, e.g. a GRUB line like:
 ```
 multiboot2 /boot/xen.efi dom0_mem=4288M,max:4288M crashkernel=256M,below=4G console=vga vga=mode-0x0311 watchdog=0 vpmu=on dom0_vcpus_pin
 ```
 On a XenServer system that can be achieved by:

 ```
 /opt/xensource/libexec/xen-cmdline --set-xen watchdog=0
 /opt/xensource/libexec/xen-cmdline --set-xen vpmu=on
 /opt/xensource/libexec/xen-cmdline --delete-xen dom0_max_vcpus=1-16
 /opt/xensource/libexec/xen-cmdline --set-xen dom0_vcpus_pin
 reboot
 ```

 4. On everyboot: enable desired vPMU features:
 ```
 echo 9 >/sys/hypervisor/pmu/pmu_features
 echo all >/sys/hypervisor/pmu/pmu_mode
 ```

 5. Record a trace, e.g. a simple timer based stacktrace, useful for
 initial investigation with a flamegraph:
 ```
 perf kvm --host --guest record -a -F 97 -g
 ```

 Or if you also want to trace userspace:
 ```
 perf kvm --host --guest record -a -F 97 --call-graph=dwarf
 ```

 6. Look at the report: perf kvm --host --guest report.
  This will contain hex addresses for now, but a script can be used to
  resolve them.

 7. Use the provided python script, and look at symbolized output

Caveats:
 * x86-only for now
 * only tested on AMD EPYC 8124P
 * Xen PMU support was broken to begin with on Xeon Silver 4514Y, so I
 wasn't able to test there ('perf top' fails to parse samples). I'll
 try to figure out what is wrong there separately
 * for now I edit the release config in xen.spec to enable frame
 pointers. Eventually it might be useful to have a 3rd build variant:
 release-fp. Or teach Xen to produce/parse ORC or SFrame formats without
 requiring frame pointers.
 * perf produces raw hex addresses, and a python script is used to
 post-process it and obtain symbols. Eventually perf should be updated
 to do this processing itself (there was an old patch for Linux 3.12 by Borislav Petkov)
 * I've only tested capturing Dom0 stack traces. Linux doesn't support
  guest stacktraces yet (it can only lookup the guest RIP)
 * the Linux patch will need to be forwarded ported to master before submission
 * All the caveats for using regular VPMU apply, except for the lack of
  stacktraces, that is fixed here!
    * Dom0 must run hard pinned on all host CPUs
    * Watchdog must be disabled
    * not security supported
    * x86 only
    * secureboot needs to be disabled


Edwin Török (10):
  pmu.h: add a BUILD_BUG_ON to ensure it fits within one page
  arch-x86/pmu.h: document current memory layout for VPMU
  arch-x86/pmu.h: convert ascii art drawing to Unicode
  vpmu.c: factor out register conversion
  pmu.h: introduce a stacktrace area
  arch-x86/pmu.h: convert ascii art diagram to Unicode
  arch-x86/vpmu.c: store guest registers when domain_id == DOMID_XEN
  pmu.h: expose a hypervisor stacktrace feature
  vpmu.c hypervisor stacktrace support in vPMU
  xen/tools/pyperf.py: example script to parse perf output

 xen/arch/x86/cpu/vpmu.c           | 130 ++++++++++++++++++++------
 xen/arch/x86/cpu/vpmu_amd.c       |   2 +-
 xen/arch/x86/cpu/vpmu_intel.c     |   2 +-
 xen/arch/x86/include/asm/vpmu.h   |   1 +
 xen/include/public/arch-arm.h     |   1 +
 xen/include/public/arch-ppc.h     |   1 +
 xen/include/public/arch-riscv.h   |   1 +
 xen/include/public/arch-x86/pmu.h | 101 ++++++++++++++++++++-
 xen/include/public/pmu.h          |  41 ++++++++-
 xen/tools/pyperf.py               | 146 ++++++++++++++++++++++++++++++
 10 files changed, 395 insertions(+), 31 deletions(-)
 create mode 100644 xen/tools/pyperf.py

-- 
2.47.1


