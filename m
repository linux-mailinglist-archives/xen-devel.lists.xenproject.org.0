Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10FC9CDE02
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837349.1253335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBv3d-0004B3-MM; Fri, 15 Nov 2024 12:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837349.1253335; Fri, 15 Nov 2024 12:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBv3d-00048J-Iq; Fri, 15 Nov 2024 12:04:13 +0000
Received: by outflank-mailman (input) for mailman id 837349;
 Fri, 15 Nov 2024 12:04:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBut9-0005UF-Mf
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:23 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3490053b-a348-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:53:18 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9a0c7abaa6so208764266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:18 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:17 -0800 (PST)
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
X-Inumbo-ID: 3490053b-a348-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzMiLCJoZWxvIjoibWFpbC1lajEteDYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM0OTAwNTNiLWEzNDgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcxNTk4LjgxMjcwOCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671598; x=1732276398; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UP4t8//FGJyNBLIO0mqUe6Ltob3Zl7JdI4z52xmh06g=;
        b=XLX5hNb1XRxR7tYsrRIGpptdr7QKNTWMuBt348NVFwz3ikMauWsEx2YiLs7XkjUYsf
         qJ9++th2oKDnjm+nJacq+wFAb4uVP8u/+pVwrG+rS5K3rrz4Qy5JLnWn/jaexc+0BK0O
         aP/2XYsV6Co9Dkdx8jdQ9fAqPQ//nTx7pgDlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671598; x=1732276398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UP4t8//FGJyNBLIO0mqUe6Ltob3Zl7JdI4z52xmh06g=;
        b=X+OYVRYrSUXN/3GLk57wGjnJwWyYhWoiYk/3txS3CelA3Cuih4FFO7v3FD63bQq5fT
         WjC2puP4l76ic2MJGoCCHOWN4a4R0rUPwZyRfT7egDHs6Hh0VKNWZUbBKNmZSoqMomPP
         iiwW+9a0ieDi+cKL+3GLWUXYVpxJSNjIL0dOZ5Vy6p1E3LdYsPXsCPpDIi3ihg9BwaaX
         tJM3rKP/FxiBM1hQQmRVdqHGlDkyubM0JJIIed155mcspocKge5Vr4d4e+t+n3EBAgRs
         Ep7di5aI01xRFEIliR9WeD8jswSVnsq1hPWzlNlMXaHjBsGBjj58k/MQQEwCcgBeCYX9
         J7jg==
X-Gm-Message-State: AOJu0YwOOvuKykzec8geF3qSjNENShu6Mep2ACoS/ykKXFhcfRoM+Knj
	YH6EtlXC97GaIVtcSIGpdZh1O2SM+6sY5rHvzQiUN8dgMaMmY/tc0t1hZSLuuTzW29J05DDItSu
	7
X-Google-Smtp-Source: AGHT+IHg0ja9QNxUZ4tZIEtdCtUnugpmjWlFsHvFvUqEWr/jij87LRHqfv+lw7XDsHJoaVUXh8EXFg==
X-Received: by 2002:a17:907:7f1e:b0:a9f:508:6726 with SMTP id a640c23a62f3a-aa4833f60eemr182698766b.2.1731671597758;
        Fri, 15 Nov 2024 03:53:17 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [RFC PATCH 22/25] tools/xen-sys: Add autogenerated Rust files
Date: Fri, 15 Nov 2024 11:51:51 +0000
Message-ID: <20241115115200.2824-23-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

And a single autogen.rs file to demultiplex the arch module into
whatever arch-specific target is mandated by target_arch.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/rust/xen-sys/src/autogen.rs            |  27 +++++
 tools/rust/xen-sys/src/autogen/arch_arm.rs   |  56 ++++++++++
 tools/rust/xen-sys/src/autogen/arch_ppc.rs   |   8 ++
 tools/rust/xen-sys/src/autogen/arch_riscv.rs |   8 ++
 tools/rust/xen-sys/src/autogen/arch_x86.rs   |  55 ++++++++++
 tools/rust/xen-sys/src/autogen/domctl.rs     | 104 +++++++++++++++++++
 tools/rust/xen-sys/src/autogen/sysctl.rs     |  26 +++++
 tools/rust/xen-sys/src/lib.rs                |   2 +
 8 files changed, 286 insertions(+)
 create mode 100644 tools/rust/xen-sys/src/autogen.rs
 create mode 100644 tools/rust/xen-sys/src/autogen/arch_arm.rs
 create mode 100644 tools/rust/xen-sys/src/autogen/arch_ppc.rs
 create mode 100644 tools/rust/xen-sys/src/autogen/arch_riscv.rs
 create mode 100644 tools/rust/xen-sys/src/autogen/arch_x86.rs
 create mode 100644 tools/rust/xen-sys/src/autogen/domctl.rs
 create mode 100644 tools/rust/xen-sys/src/autogen/sysctl.rs

diff --git a/tools/rust/xen-sys/src/autogen.rs b/tools/rust/xen-sys/src/autogen.rs
new file mode 100644
index 000000000000..8a1cab8561f2
--- /dev/null
+++ b/tools/rust/xen-sys/src/autogen.rs
@@ -0,0 +1,27 @@
+//! Low-level description of buffers as used in hypercalls with the Xen hypervisor
+//!
+//! This module is fully autogenerated from TOML files defining the hypercall
+//! specification.
+
+#[cfg(any(target_arch = "x86", target_arch = "x86_64"))]
+pub mod arch_x86;
+#[cfg(any(target_arch = "x86", target_arch = "x86_64"))]
+pub use arch_x86 as arch;
+
+#[cfg(any(target_arch = "arm", target_arch = "aarch64"))]
+pub mod arch_arm;
+#[cfg(any(target_arch = "arm", target_arch = "aarch64"))]
+pub use arch_arm as arch;
+
+#[cfg(target_arch = "riscv64")]
+pub mod arch_riscv;
+#[cfg(target_arch = "riscv64")]
+pub use arch_riscv as arch;
+
+#[cfg(target_arch = "powerpc64")]
+pub mod arch_ppc;
+#[cfg(target_arch = "powerpc64")]
+pub use arch_ppc as arch;
+
+pub mod domctl;
+pub mod sysctl;
diff --git a/tools/rust/xen-sys/src/autogen/arch_arm.rs b/tools/rust/xen-sys/src/autogen/arch_arm.rs
new file mode 100644
index 000000000000..dc460557b2f0
--- /dev/null
+++ b/tools/rust/xen-sys/src/autogen/arch_arm.rs
@@ -0,0 +1,56 @@
+//! arch-arm
+//!
+//! AUTOGENERATED. DO NOT MODIFY
+
+/// Content of the `gic_version` field of the domainconfig struct.
+#[repr(u8)]
+#[derive(Clone, Debug, Default, PartialEq, Eq)]
+pub enum XenDomctlConfigGic {
+    /// Emulate the underlying GIC present in the current host.
+    #[default]
+    Native = 0,
+    /// Emulate a GICv2.
+    V2 = 1,
+    /// Emulate a GICv3.
+    V3 = 2,
+}
+
+/// TEE mediator exposed to the guest
+#[repr(u16)]
+#[derive(Clone, Debug, Default, PartialEq, Eq)]
+pub enum XenDomctlConfigTee {
+    /// No mediator. Guest can't communicate with the TEE.
+    #[default]
+    None = 0,
+    /// Expose an OP-TEE mediator.
+    Optee = 1,
+    /// Expose an FF-A mediator.
+    Ffa = 2,
+}
+
+/// arm-specific domain settings.
+#[repr(C)]
+#[derive(Clone, Debug, Default)]
+pub struct XenArchDomainconfig {
+    /// IN/OUT: GIC version exposed to the guest.
+    ///
+    /// When `native` on input the output value holds the automatically chosen version.
+    pub gic_version: XenDomctlConfigGic,
+    /// IN: SVE vector length (divided by 128) exposed to the guest.
+    pub sve_vl: u8,
+    /// IN: TEE mediator exposed to the guest.
+    pub tee_type: XenDomctlConfigTee,
+    /// IN: Number of SPIs exposed to the guest.
+    pub nr_spis: u32,
+    /// OUT
+    /// Based on the property clock-frequency in the DT timer node.
+    /// The property may be present when the bootloader/firmware doesn't
+    /// set correctly CNTFRQ which hold the timer frequency.
+    ///
+    /// As it's not possible to trap this register, we have to replicate
+    /// the value in the guest DT.
+    ///
+    /// = 0 => property not present
+    /// > 0 => Value of the property
+    pub clock_frequency: u32,
+}
diff --git a/tools/rust/xen-sys/src/autogen/arch_ppc.rs b/tools/rust/xen-sys/src/autogen/arch_ppc.rs
new file mode 100644
index 000000000000..8b68799648b9
--- /dev/null
+++ b/tools/rust/xen-sys/src/autogen/arch_ppc.rs
@@ -0,0 +1,8 @@
+//! arch-ppc
+//!
+//! AUTOGENERATED. DO NOT MODIFY
+
+/// ppc-specific domain settings.
+#[repr(C)]
+#[derive(Clone, Debug, Default)]
+pub struct XenArchDomainconfig;
diff --git a/tools/rust/xen-sys/src/autogen/arch_riscv.rs b/tools/rust/xen-sys/src/autogen/arch_riscv.rs
new file mode 100644
index 000000000000..1a68c7a02c7f
--- /dev/null
+++ b/tools/rust/xen-sys/src/autogen/arch_riscv.rs
@@ -0,0 +1,8 @@
+//! arch-riscv
+//!
+//! AUTOGENERATED. DO NOT MODIFY
+
+/// riscv-specific domain settings.
+#[repr(C)]
+#[derive(Clone, Debug, Default)]
+pub struct XenArchDomainconfig;
diff --git a/tools/rust/xen-sys/src/autogen/arch_x86.rs b/tools/rust/xen-sys/src/autogen/arch_x86.rs
new file mode 100644
index 000000000000..d63a3920c91e
--- /dev/null
+++ b/tools/rust/xen-sys/src/autogen/arch_x86.rs
@@ -0,0 +1,55 @@
+//! arch-x86
+//!
+//! AUTOGENERATED. DO NOT MODIFY
+
+use bitflags::bitflags;
+
+bitflags! {
+    /// Content of the `emulation_flags` field of the domain creation hypercall.
+    #[repr(C)]
+    #[derive(Copy, Clone, Debug, Default, PartialEq, Eq)]
+    pub struct XenX86Emu: u32 {
+        /// Emulate Local APICs.
+        const Lapic = 1 << 0;
+        /// Emulate a HPET timer.
+        const Hpet = 1 << 1;
+        /// Emulate the ACPI PM timer.
+        const Pm = 1 << 2;
+        /// Emulate the RTC clock.
+        const Rtc = 1 << 3;
+        /// Emulate an IOAPIC device.
+        const Ioapic = 1 << 4;
+        /// Emulate PIC devices.
+        const Pic = 1 << 5;
+        /// Emulate standard VGA.
+        const Vga = 1 << 6;
+        /// Emulate an IOMMU.
+        const Iommu = 1 << 7;
+        /// Emulate a PIT timer.
+        const Pit = 1 << 8;
+        /// Route physical IRQs over event channels.
+        const UsePirq = 1 << 9;
+        /// Handle PCI configuration space traps from within Xen.
+        const Vpci = 1 << 10;
+    }
+}
+
+bitflags! {
+    /// Contents of the `misc_flags` field of the domain creation hypercall
+    #[repr(C)]
+    #[derive(Copy, Clone, Debug, Default, PartialEq, Eq)]
+    pub struct XenX86Misc: u32 {
+        /// Grants access to the real physical MSR registers of the host.
+        const MsrRelaxed = 1 << 0;
+    }
+}
+
+/// x86-specific domain settings.
+#[repr(C)]
+#[derive(Clone, Debug, Default)]
+pub struct XenArchDomainconfig {
+    /// IN: Bitmap of devices to emulate.
+    pub emulation_flags: XenX86Emu,
+    /// IN: Miscellaneous x86-specific toggles.
+    pub misc_flags: XenX86Misc,
+}
diff --git a/tools/rust/xen-sys/src/autogen/domctl.rs b/tools/rust/xen-sys/src/autogen/domctl.rs
new file mode 100644
index 000000000000..7c3b872409be
--- /dev/null
+++ b/tools/rust/xen-sys/src/autogen/domctl.rs
@@ -0,0 +1,104 @@
+//! domctl
+//!
+//! AUTOGENERATED. DO NOT MODIFY
+
+use bitflags::bitflags;
+
+use super::arch::XenArchDomainconfig;
+
+bitflags! {
+    /// Content of the `flags` field of the domain creation hypercall.
+    #[repr(C)]
+    #[derive(Copy, Clone, Debug, Default, PartialEq, Eq)]
+    pub struct XenDomctlCdf: u32 {
+        /// Set if this is an HVM guest. Cleared if it's PV.
+        const Hvm = 1 << 0;
+        /// Use hardware-assisted paging if available
+        const Hap = 1 << 1;
+        /// Set if domain memory integrity is to be verified by tboot during Sx.
+        const S3Integrity = 1 << 2;
+        /// Set if Out-of-Sync shadow page tables are to be disabled
+        const OosOff = 1 << 3;
+        /// Set if this is a xenstore domain
+        const XsDomain = 1 << 4;
+        /// Set if this is domain can make use of the IOMMU
+        const Iommu = 1 << 5;
+        /// Set for the domain to have nested virtualization enabled.
+        const NestedVirt = 1 << 6;
+        /// Set to expose a vPMU to this domain.
+        const Vpmu = 1 << 7;
+    }
+}
+
+bitflags! {
+    /// Content of the `iommu_opts` field of the domain creation hypercall.
+    #[repr(C)]
+    #[derive(Copy, Clone, Debug, Default, PartialEq, Eq)]
+    pub struct XenDomctlIommuOpts: u32 {
+        /// Set to _NOT_ share page tables between the CPU and the IOMMU when it would be possible to do so.
+        const NoSharept = 1 << 0;
+    }
+}
+
+/// Content of the `altp2m_mode` field of the domain creation hypercall.
+#[repr(u8)]
+#[derive(Clone, Debug, Default, PartialEq, Eq)]
+pub enum XenDomctlAltp2MMode {
+    /// Keep altp2m disabled
+    #[default]
+    Disabled = 0,
+    /// Use mixed-mode for the altp2m (not yet evaluated for safety).
+    Mixed = 1,
+    /// Use external mode for the altp2m.
+    External = 2,
+    /// Use limited mode for the altp2m.
+    Limited = 3,
+}
+
+/// Create a new domain with the passed parameters.
+///
+/// IMPORTANT: The domid part of the domctl is IN/OUT. When the passed
+/// domid is 0 or over `DOMID_FIRST_RESERVED` a new domid is auto-allocated
+/// and returned.
+#[repr(C)]
+#[derive(Clone, Debug, Default)]
+pub struct XenDomctlCreatedomain {
+    /// IN: `Source Security IDentifier` (See XSM).
+    pub ssidref: u32,
+    /// IN: Unique identifier for this guest given by the toolstack.
+    pub handle: [u8; 16],
+    /// IN: Bitmap of domain features to enable/disable.
+    pub flags: XenDomctlCdf,
+    /// IN: Bitmap of configuration settings for the IOMMU.
+    pub iommu_opts: XenDomctlIommuOpts,
+    /// IN: Maximum number of CPUs this domain can hold, including hotplug.
+    pub max_vcpus: u32,
+    /// IN: Maximum number of usable event channels
+    pub max_evtchn_port: u32,
+    /// IN: Maximum number of pages this domain is able
+    ///     to grant access to for other domains.
+    ///
+    /// `< 0` means "use default value in the hypervisor."
+    pub max_grant_frames: i32,
+    /// IN: Maximum number of pages of foreign domains
+    ///     can be accessed via the grant mechanism.
+    ///
+    /// `< 0` means "use default value in the hypervisor."
+    pub max_maptrack_frames: i32,
+    /// Maximum grant table version allowed for this domain
+    pub max_grant_version: u8,
+    /// Unused padding. Reserved to zero.
+    pub rsvd_0_a: [u8; 3],
+    /// Which mode to configure altp2m with
+    pub altp_2_m_mode: u8,
+    /// Unused padding. Reserved to zero.
+    pub rsvd_0_b: [u8; 3],
+    /// IN: Per-vCPU buffer size in octets. 0 to disable.
+    pub vmtrace_size: u32,
+    /// IN: CPU pool to use; 0 or an existing CPU pool.
+    pub cpupool_id: u32,
+    /// Arch-specific settings.
+    ///
+    /// Each architecture is free to make its fields IN/OUT/INOUT
+    pub arch: XenArchDomainconfig,
+}
diff --git a/tools/rust/xen-sys/src/autogen/sysctl.rs b/tools/rust/xen-sys/src/autogen/sysctl.rs
new file mode 100644
index 000000000000..a2d8beb91d84
--- /dev/null
+++ b/tools/rust/xen-sys/src/autogen/sysctl.rs
@@ -0,0 +1,26 @@
+//! sysctl
+//!
+//! AUTOGENERATED. DO NOT MODIFY
+
+/// Read console content from Xen buffer ring.
+#[repr(C)]
+#[derive(Clone, Debug, Default)]
+pub struct XenSysctlReadconsole {
+    /// IN: Non-zero -> clear after reading.
+    pub clear: u8,
+    /// IN: Non-zero -> start index specified by `index` field.
+    pub incremental: u8,
+    /// Unused.
+    pub pad: u16,
+    /// IN:  Start index for consuming from ring buffer (if @incremental);
+    /// OUT: End index after consuming from ring buffer.
+    pub index: u32,
+    /// IN: Virtual address to write console data.
+    ///
+    /// NOTE: The pointer itself is IN, but the contents of the buffer are OUT.
+    pub buffer: crate::Align64<*mut u8>,
+    /// IN: Size of buffer; OUT: Bytes written to buffer.
+    pub count: u32,
+    /// Tail padding reserved to zero.
+    pub rsvd_0_a: u32,
+}
diff --git a/tools/rust/xen-sys/src/lib.rs b/tools/rust/xen-sys/src/lib.rs
index efab54ee1025..526193a920f8 100644
--- a/tools/rust/xen-sys/src/lib.rs
+++ b/tools/rust/xen-sys/src/lib.rs
@@ -7,6 +7,8 @@
 
 pub mod autogen;
 
+pub use autogen::*;
+
 use core::ops::{Deref, DerefMut};
 
 /// Wrapper for pointers and 64bit integers so they are _always_ aligned to 8
-- 
2.47.0


