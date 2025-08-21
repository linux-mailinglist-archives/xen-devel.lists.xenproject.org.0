Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C06B2FE47
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088818.1446564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Au-0006j0-B4; Thu, 21 Aug 2025 15:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088818.1446564; Thu, 21 Aug 2025 15:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Au-0006fq-4H; Thu, 21 Aug 2025 15:26:00 +0000
Received: by outflank-mailman (input) for mailman id 1088818;
 Thu, 21 Aug 2025 15:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PmEG=3B=bounce.vates.tech=bounce-md_30504962.68a73a82.v1-841c9db552804ee1bbcff90c2e96fb43@srs-se1.protection.inumbo.net>)
 id 1up7Ar-0005na-Ux
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:25:58 +0000
Received: from mail179-29.suw41.mandrillapp.com
 (mail179-29.suw41.mandrillapp.com [198.2.179.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 214c3140-7ea3-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 17:25:55 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-29.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4c76bQ6yhPz7lmVSj
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 15:25:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 841c9db552804ee1bbcff90c2e96fb43; Thu, 21 Aug 2025 15:25:54 +0000
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
X-Inumbo-ID: 214c3140-7ea3-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755789955; x=1756059955;
	bh=h1vxOINHJNHHsgrwETVtPerz1HMSIPiyHjC13CAZ9ok=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OSXUMs4TNk4CogPQwFVu5iA6nJRI0yKKWnJL39JE3+4vTgIDtDQ2p9zy3gAJzWIW8
	 enMIN2VM2zKr5zUPaPSTMNYL3d3faLqrN6eE/2EAjfc91fz4GuKEUqwMZa1UlFSitA
	 ki8/CDvG4RwRi0zECF6v9/sVMj1QgJcYdGuFzzeSy/+H2yUrKWYjonOLaDloxMPauQ
	 tZ8vsiiMVF9yh6y3YVf1ZjNJXOSVVOycUggDYGiJh4KZCC4Ikk6p8qOAq43S8cW+fp
	 xs2NPsz96X9mPQzONhTVkYKa+gS3+GDnqsVhlsKU1DbtxyVEo62+YtZGfOa4HmRcZH
	 WyT5tiqiM+flg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755789955; x=1756050455; i=teddy.astie@vates.tech;
	bh=h1vxOINHJNHHsgrwETVtPerz1HMSIPiyHjC13CAZ9ok=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=p9YST2mu+RxKLaTz2ozkd1W5xi4S8wIQArxDjSZMqRaAgWnlCGhZoHIHlrViv1OqQ
	 jgHdyaWElM41OWv2dbf5V4l7eEG1rz+arFzs424qOYC2Rj/U/bKih7Feqg30bKUczu
	 1ssknsJAehUuzezhIyCIaC0RKczPXHA4fvnpVL7J8BB4GnpvKE/asjwU40SbWMc92J
	 MAVAgm9CjUZ0s/Bk2wvzPouiTO6j0srydk03Vdv5kusKNdbKXA58xkUTnyaV6DT7Vl
	 oMXZxPQOvGcDre41zeEzmarZp80NPb5B7Rro5rygdTMTUgKosZcJUsVingcKbcuUzq
	 CqqeA8JFYD5Gw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=205/9]=20docs/x86:=20Introduce=20FastABI?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755789953594
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <64800d22220f31bf052713ce61ecedeaa8a36b6f.1755785258.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1755785258.git.teddy.astie@vates.tech>
References: <cover.1755785258.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.841c9db552804ee1bbcff90c2e96fb43?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250821:md
Date: Thu, 21 Aug 2025 15:25:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

FastABI is a alternative ABI designed with performance and coco-enabled
guest in mind. It is register-oriented instead of refering to C structures
in the guest memory (through a virtual memory pointer).

It only focuses on kernel-side hypercalls, it doesn't aim to provide toolstack
operations.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 docs/guest-guide/x86/fastabi.pandoc |  50 ++++++++++
 docs/guest-guide/x86/index.rst      |   1 +
 xen/abi/event_channel.yml           | 130 ++++++++++++++++++++++++++
 xen/abi/grant_table.yml             |  46 +++++++++
 xen/abi/hvm.yml                     |  50 ++++++++++
 xen/abi/memory.yml                  |  11 +++
 xen/abi/sched.yml                   |  48 ++++++++++
 xen/abi/vcpu.yml                    | 139 ++++++++++++++++++++++++++++
 xen/abi/version.yml                 |  15 +++
 xen/include/public/arch-x86/cpuid.h |   4 +
 10 files changed, 494 insertions(+)
 create mode 100644 docs/guest-guide/x86/fastabi.pandoc
 create mode 100644 xen/abi/event_channel.yml
 create mode 100644 xen/abi/grant_table.yml
 create mode 100644 xen/abi/hvm.yml
 create mode 100644 xen/abi/memory.yml
 create mode 100644 xen/abi/sched.yml
 create mode 100644 xen/abi/vcpu.yml
 create mode 100644 xen/abi/version.yml

diff --git a/docs/guest-guide/x86/fastabi.pandoc b/docs/guest-guide/x86/fastabi.pandoc
new file mode 100644
index 0000000000..8ff8609f37
--- /dev/null
+++ b/docs/guest-guide/x86/fastabi.pandoc
@@ -0,0 +1,50 @@
+# x86 FastABI
+
+## Introduction
+
+FastABI is a alternative hypercall ABI designed with performance and confidential
+computing enabled guests (AMD SEV, Intel TDX, ...) in mind. It provides a minimal
+subset of the traditional ABI that is sufficient for having a working guest.
+
+This hypercall interface is designed around using registers for passing hypercall
+parameters and outputs rather than using pointer to C structures, thus it avoids
+potentially complicated or expensive memory copies from/to the guest.
+
+This ABI currently only supports HVM/PVH and x86 long mode.
+
+Each hypercall operation interface is described in a parsable yaml file, which
+defines each hypercall suboperation inputs and outputs and eventual metadata for
+code generation (e.g C stubs).
+
+## Support
+
+This interface is only supported if XEN_HVM_CPUID_FASTABI is set.
+
+## Semantics
+
+8 registers can be used as either input or output.
+
+Each hypercall operation (or sub-operation) defines its own set of used input and
+output registers. There is no implicit clobbering of unused registers, i.e input
+registers are not allowed to be modified by the hypervisor unless it is explicitely
+also marked as a output (or cloberred register).
+
+- reg0: `rax`: IN: hypercall operation index, OUT: error code
+- reg1: `rdi`: (if operation has sub-operations) IN: hypercall sub-operation index
+- reg2: `rsi`
+- reg3: `r8`
+- reg4: `r9`
+- reg5: `r10`
+- reg6: `r11`
+- reg7: `r12`
+
+`reg0` input is reserved for hypercall index.
+In order to distinguish FastABI with traditional hypercalls or viridian hypercalls,
+reg0 input needs to be OR-ed with 0x40000000 (__HYPERVISOR_FASTABI_MASK).
+
+`reg0` output is reserved for standard hypercall return code (errno) or returned value.
+
+`reg1` input can be used for identifying a sub-operation. output is available for use.
+
+The hypercall uses the native hypercall instruction, which is `vmcall` on Intel platforms
+and `vmmcall` on AMD platforms.
\ No newline at end of file
diff --git a/docs/guest-guide/x86/index.rst b/docs/guest-guide/x86/index.rst
index 6927271e53..aaae42da5a 100644
--- a/docs/guest-guide/x86/index.rst
+++ b/docs/guest-guide/x86/index.rst
@@ -7,4 +7,5 @@ x86
    :maxdepth: 2
 
    hypercall-abi
+   fastabi
    fixed-memory-layout
diff --git a/xen/abi/event_channel.yml b/xen/abi/event_channel.yml
new file mode 100644
index 0000000000..44a769cdbb
--- /dev/null
+++ b/xen/abi/event_channel.yml
@@ -0,0 +1,130 @@
+name: event_channel
+hypercall_index: 32
+
+subops:
+  alloc_unbound:
+    index: 6
+    input:
+      dom: 2
+      remote_dom: 3
+    output:
+      port: 4
+    c_lang:
+      struct: evtchn_alloc_unbound
+
+  bind_interdomain:
+    index: 0
+    input:
+      remote_dom: 2
+      remote_port: 3
+    output:
+      local_port: 4
+    c_lang:
+      struct: evtchn_bind_interdomain
+
+  bind_virq:
+    index: 1
+    input:
+      virq: 2
+      vcpu: 3
+    output:
+      port: 4
+    c_lang:
+      struct: evtchn_bind_virq
+
+  bind_ipi:
+    index: 7
+    input:
+      vcpu: 2
+    output:
+      port: 4
+    c_lang:
+      struct: evtchn_bind_ipi
+
+  bind_pirq:
+    index: 2
+    input:
+      pirq: 2
+      flags: 3
+    output:
+      port: 4
+    c_lang:
+      struct: evtchn_bind_pirq
+  
+  close:
+    index: 3
+    input:
+      port: 2
+    c_lang:
+      struct: evtchn_close
+  
+  send:
+    index: 4
+    input:
+      port: 2
+    c_lang:
+      struct: evtchn_send
+
+  status:
+    index: 5
+    input:
+      dom: 2
+      port: 3
+    output:
+      status: 4
+      vcpu: 5
+      output1: 6
+      output2: 7
+    c_lang:
+      struct: evtchn_status
+      mapping:
+        output1: u._output1
+        output2: u._output2
+  
+  bind_vcpu:
+    index: 8
+    input:
+      vcpu: 2
+      port: 3
+    c_lang:
+      struct: evtchn_bind_vcpu
+  
+  unmask:
+    index: 9
+    input:
+      port: 2
+    c_lang:
+      struct: evtchn_unmask
+  
+  reset:
+    index: 10
+    input:
+      dom: 2
+    c_lang:
+      struct: evtchn_reset
+
+  init_control:
+    index: 11
+    input:
+      control_gfn: 2
+      offset: 3
+      vcpu: 4
+    output:
+      link_bits: 5
+    c_lang:
+      struct: evtchn_init_control
+  
+  expand_array:
+    index: 12
+    input:
+      array_gfn: 2
+    c_lang:
+      struct: evtchn_expand_array
+
+  set_priority:
+    index: 13
+    input:
+      port: 2
+      priority: 3
+    c_lang:
+      struct: evtchn_set_priority
diff --git a/xen/abi/grant_table.yml b/xen/abi/grant_table.yml
new file mode 100644
index 0000000000..bcedaa966b
--- /dev/null
+++ b/xen/abi/grant_table.yml
@@ -0,0 +1,46 @@
+name: grant_table
+hypercall_index: 20
+
+subops:
+  map_grant_ref:
+    index: 0
+    input:
+      dom: 2
+      host_addr: 3
+      flags: 4
+      ref: 5
+    output:
+      handle: 6
+      status: 7
+    c_lang:
+      struct: gnttab_map_grant_ref
+  
+  unmap_grant_ref:
+    index: 1
+    input:
+      host_addr: 3
+      handle: 6
+    c_lang:
+      struct: gnttab_unmap_grant_ref
+  
+  query_size:
+    index: 6
+    output:
+      nr_frames: 2
+      max_nr_frames: 3
+    c_lang:
+      struct: gnttab_query_size
+
+  set_version:
+    index: 8
+    input:
+      version: 2
+    c_lang:
+      struct: gnttab_set_version
+
+  get_version:
+    index: 10
+    output:
+      version: 2
+    c_lang:
+      struct: gnttab_get_version
diff --git a/xen/abi/hvm.yml b/xen/abi/hvm.yml
new file mode 100644
index 0000000000..20c2421bdf
--- /dev/null
+++ b/xen/abi/hvm.yml
@@ -0,0 +1,50 @@
+name: hvm
+hypercall_index: 34
+
+subops:
+  set_param:
+    index: 0
+    input:
+      domid: 2
+      index: 3
+      value: 4
+    c_lang:
+      struct: xen_hvm_param
+
+  get_param:
+    index: 1
+    input:
+      domid: 2
+      index: 3
+    output:
+      value: 4
+    c_lang:
+      struct: xen_hvm_param
+
+  flush_tlbs:
+    index: 5
+
+  get_time:
+    index: 10
+    output:
+      now: 2
+    c_lang:
+      struct: xen_hvm_get_time
+
+  get_mem_type:
+    index: 15
+    input:
+      domid: 2
+      pfn: 3
+    output:
+      mem_type: 4
+    c_lang:
+      struct: xen_hvm_get_mem_type
+
+  set_evtchn_upcall_vector:
+    index: 23
+    input:
+      vcpu: 2
+      vector: 3
+    c_lang:
+      struct: xen_hvm_evtchn_upcall_vector
diff --git a/xen/abi/memory.yml b/xen/abi/memory.yml
new file mode 100644
index 0000000000..8b51490f8a
--- /dev/null
+++ b/xen/abi/memory.yml
@@ -0,0 +1,11 @@
+name: memory
+hypercall_index: 12
+
+subops:
+  memory_map:
+    index: 9
+    input:
+      nr_entries: 2
+      buffer: 3
+    c_lang:
+      struct: xen_memory_map
diff --git a/xen/abi/sched.yml b/xen/abi/sched.yml
new file mode 100644
index 0000000000..1b1ef50c7a
--- /dev/null
+++ b/xen/abi/sched.yml
@@ -0,0 +1,48 @@
+name: sched
+hypercall_index: 29
+
+subops:
+  yield:
+    index: 0
+
+  block:
+    index: 1
+
+  shutdown:
+    index: 2
+    input:
+      reason: 2
+    c_lang:
+      struct: sched_shutdown
+
+  poll:
+    index: 3
+    input:
+      timeout: 2
+      port: 3
+    c_lang:
+      params:
+        timeout: uint64_t
+        port: evtchn_port_t
+
+  shutdown_code:
+    index: 5
+    input:
+      reason: 2
+    c_lang:
+      struct: sched_shutdown
+
+  watchdog:
+    index: 6
+    input:
+      id: 2
+      timeout: 3
+    c_lang:
+      struct: sched_watchdog
+
+  pin_override:
+    index: 7
+    input:
+      pcpu: 2
+    c_lang:
+      struct: sched_pin_override
diff --git a/xen/abi/vcpu.yml b/xen/abi/vcpu.yml
new file mode 100644
index 0000000000..0b4fe4ea1f
--- /dev/null
+++ b/xen/abi/vcpu.yml
@@ -0,0 +1,139 @@
+name: vcpu
+hypercall_index: 24
+
+subops:
+  initialise:
+    index: 0
+    input:
+      vcpuid: 2
+      context_gfn: 3
+    c_lang:
+      params:
+        vcpuid: uint32_t
+        context_gfn: uint64_t
+
+  up:
+    index: 1
+    input:
+      vcpuid: 2
+    c_lang:
+      params:
+        vcpuid: uint32_t
+
+  down:
+    index: 2
+    input:
+      vcpuid: 2
+    c_lang:
+      params:
+        vcpuid: uint32_t
+
+  is_up:
+    index: 3
+    input:
+      vcpuid: 2
+    c_lang:
+      params:
+        vcpuid: uint32_t
+
+  get_runstate_info:
+    index: 4
+    input:
+      vcpuid: 2
+    output:
+      state: 2
+      state_entry_time: 3
+      time[0]: 4
+      time[1]: 5
+      time[2]: 6
+      time[3]: 7
+    c_lang:
+      struct: vcpu_runstate_info
+      params:
+        vcpuid: uint32_t
+
+  register_runstate_phys_area:
+    index: 14
+    input:
+      vcpuid: 2
+      addr.p: 3
+    c_lang:
+      struct: vcpu_register_time_memory_area
+      params:
+        vcpuid: uint32_t
+
+  set_periodic_timer:
+    index: 6
+    input:
+      vcpuid: 2
+      period_ns: 3
+    c_lang:
+      struct: vcpu_set_periodic_timer
+      params:
+        vcpuid: uint32_t
+
+  stop_periodic_timer:
+    index: 7
+    input:
+      vcpuid: 2
+    c_lang:
+      params:
+        vcpuid: uint32_t
+  
+  set_singleshot_timer:
+    index: 8
+    input:
+      vcpuid: 2
+      timeout_abs_ns: 3
+      flags: 4
+    c_lang:
+      struct: vcpu_set_singleshot_timer
+      params:
+        vcpuid: uint32_t
+
+  stop_singleshot_timer:
+    index: 9
+    input:
+      vcpuid: 2
+    c_lang:
+      params:
+        vcpuid: uint32_t
+
+  register_vcpu_info:
+    index: 10
+    input:
+      vcpuid: 2
+      mfn: 3
+      offset: 4
+    c_lang:
+      struct: vcpu_register_vcpu_info
+      params:
+        vcpuid: uint32_t
+
+  send_nmi:
+    index: 11
+    input:
+      vcpuid: 2
+    c_lang:
+      params:
+        vcpuid: uint32_t
+
+  get_physid:
+    index: 12
+    input:
+      vcpuid: 2
+      phys_id: 3
+    c_lang:
+      struct: vcpu_get_physid
+      params:
+        vcpuid: uint32_t
+
+  register_vcpu_time_phys_area:
+    index: 15
+    input:
+      vcpuid: 2
+      addr.p: 3
+    c_lang:
+      struct: vcpu_register_time_memory_area
+      params:
+        vcpuid: uint32_t
diff --git a/xen/abi/version.yml b/xen/abi/version.yml
new file mode 100644
index 0000000000..bce64a4d69
--- /dev/null
+++ b/xen/abi/version.yml
@@ -0,0 +1,15 @@
+name: version
+hypercall_index: 17
+
+subops:
+  version:
+    index: 0
+
+  get_features:
+    index: 6
+    input:
+      submap_idx: 2
+    output:
+      submap: 3
+    c_lang:
+      struct: xen_feature_info
diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
index 3bb0dd249f..ff44ce0e7b 100644
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -106,6 +106,10 @@
  * bound to event channels.
  */
 #define XEN_HVM_CPUID_UPCALL_VECTOR    (1u << 6)
+/*
+ * Support for fast HVM ABI.
+ */
+#define XEN_HVM_CPUID_FASTABI          (1u << 7)
 
 /*
  * Leaf 6 (0x40000x05)
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


