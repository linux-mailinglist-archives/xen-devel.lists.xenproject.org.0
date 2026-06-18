Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tKvOAxwSNGq6NQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 17:43:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FD46A14FB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 17:43:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IqBnH09L;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1341409.1601867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEtN-0008QD-Pa; Thu, 18 Jun 2026 15:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341409.1601867; Thu, 18 Jun 2026 15:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waEtN-0008Nt-Lc; Thu, 18 Jun 2026 15:42:57 +0000
Received: by outflank-mailman (input) for mailman id 1341409;
 Thu, 18 Jun 2026 15:42:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stojkovicdusan555@gmail.com>) id 1waEsa-0008G5-KK
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 15:42:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waEsZ-00DcyC-Tn
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 17:42:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a3411c9-e002-0a2a0a5209dd-0a2a450adcbe-24
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 17:42:07 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a3411cf-93a5-0a2a450a0019-d155802bc9ee-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 17:42:07 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490ac10e337so6944975e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 08:42:07 -0700 (PDT)
Received: from RTRKN1313-LIN.domain.local ([89.216.37.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c473bsm69038581f8f.28.2026.06.18.08.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 08:42:06 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781797327; x=1782402127; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5OyJqBkAzAjyDPdkHar1t9BiEBSy+RR+rbYVavGE65s=;
        b=IqBnH09L9CE9V0MvR9kJAz5gDW6iFG6yjlv3F+hHkT/pz0G7ejU0tYNJYos7fBoyvR
         sSX4MlhGYeKlU713G41vGdATdTtXW84sQGuW75PcM0Ii/1QZOQR7JSVj6yM7EmrUUXbQ
         G6RMzF2bcgaFLDU2mMPvkWPxZ94SYSMomKwOsWI+5qYG3CutDT3Sx6MA9CbkyIeLlYJ6
         JYzP6PK3T/43HqY0IcyDfxQ3Kwr42A6jYVcbSRK3SeO5BOVwvb/V5JvWTV+SOiDF5IUs
         8sgFWmCjOfx5DXyJLkkuZua3gZ5GkCXASaUHUUzdutt8sGCdmG1nrNSE3FXCCvxWR59n
         4xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781797327; x=1782402127;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OyJqBkAzAjyDPdkHar1t9BiEBSy+RR+rbYVavGE65s=;
        b=iKDbTJhZYR/ZAuoLi7z71UefC/cRC4YP3QQ6+u8wbCA/zlEIuWwcqrDUs0fHkSSY0e
         GD0uBz4RUKCGe3ego9OAFzf928TaJ662IwgmAIxzM+pzmi5XMyqSq+TdQcxcfDguRuFG
         LXZupXhWwT14KJYI8bTr7HUgdQHBXiPqC5Puzkh7aJ8BqWOHW+sWfOXdO3LZEe9iy3RK
         XXHLgfaqg4EpSt6VijDhL4N1NE1MXqv0sCtqxdOA2GgKruR33y2ItLzI4nho/gKKPwsA
         JODXOTrGtYjFhsKIGmGkofgr/lu5OcMx9B9vY01LALDRFy2UY3XeVl4NtyeZ/o3ykxMx
         WK8w==
X-Forwarded-Encrypted: i=1; AFNElJ+pDT+1aV6ci5pAA0F9EnTjO+AhVnPW4xUnbAQwCQ7K6na9x66SePUiB5QpJffhW8swtqD/PMu59Uo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKizk6NV4EBpWZXo55gfq/d7eY87q/06yS1gXO526XmesqxTJC
	SoY1dx7yRVxVKJeFDCgMLaL9pVQPiQx1wu5/Y9Lqyr+n0xpJ3/BcN3nl
X-Gm-Gg: AfdE7cmpS/5MCFxwoRX3UqNwvgqcw0pRzPjf1TGKrXghaeF3dgZ+OsDIFC9CM+hjuh5
	72U1G/H0TYMnyZaYvoP6FkY8w6lEN5GHo3iidTjmWVd6ed9LtpS04MF0SWop5042pV+z387DnlK
	XvvcGmhqdMWj3crw0ROg6T8YIvC7aFt2jvlaeVoM/fEvzr+xEFJb28r8JZEoy6KqQSVGLYIIqf0
	B1S3+mnC2wupfLqPY+kSPf/6QJKQHrztGeWYxK5PuNQPOFYA7SJNdIOJ0vmwb9L7TWfSXL9C5iu
	tpB2V5VqaA6+moLvhDfMhIfoH5iMyDdEoxhjBnxiliwDmA0RNqBta4z3YSGyWuzGzdcwIIpCeA9
	Lv6b2smgPYM7yDbEZK2Z8HwuyjP83iGBqSlpSjjTnmGI/Mor8PwNOpBmfXpuLfh5YM2JTMW3fDS
	vzygLQSASbkfdqDmyOPFQOGuwwMAJf5PomRZU9kvAsEA==
X-Received: by 2002:a05:600c:3b29:b0:490:b724:dbd6 with SMTP id 5b1f17b1804b1-4923ef51a52mr2168455e9.6.1781797327006;
        Thu, 18 Jun 2026 08:42:07 -0700 (PDT)
From: Dusan Stojkovic <stojkovicdusan555@gmail.com>
Subject: [PATCH RFC 0/2] vhost-user: support Xen foreign memory mappings
Date: Thu, 18 Jun 2026 17:39:35 +0200
Message-Id: <20260618-vhost-xen-foreign-mapping-v1-0-7f60a6241971@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADcRNGoC/x3MPQqEMBBA4avI1A7ELEaxFTyA7bKFP2OcwklIJ
 Aji3TdYfsV7N0QKTBG64oZAiSM7yajKApZ9EkvIazZopY0yVYtpd/HEiwQ3F4it4DF5z2JxVfq
 ztPU8N8pA7n2gja/3/YVx6OH3PH83XneGcAAAAA==
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony PERARD <anthony@xenproject.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 xen-devel@lists.xenproject.org, Viresh Kumar <viresh.kumar@linaro.org>, 
 Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>, 
 Nikola Jelic <Nikola.Jelic@rt-rk.com>
X-Mailer: b4 0.13.0
X-purgate-ID: tlsNG-4011c0/1781797327-B19F2DB8-76CFF576/0/0
X-purgate-type: clean
X-purgate-size: 7767
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:mst@redhat.com,m:sgarzare@redhat.com,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:xen-devel@lists.xenproject.org,m:viresh.kumar@linaro.org,m:Dusan.Stojkovic@rt-rk.com,m:Nikola.Jelic@rt-rk.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stojkovicdusan555@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,xenproject.org,gmail.com,lists.xenproject.org,linaro.org,rt-rk.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[stojkovicdusan555@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53FD46A14FB

This series lets QEMU, when running as a Xen device model, drive
vhost-user backends that map guest memory through the Xen foreign
mapping interface, implementing the front-end side of
VHOST_USER_PROTOCOL_F_XEN_MMAP. The protocol extension itself is
already documented in docs/interop/vhost-user.rst (feature bit 17,
extended memory region description) and implemented by rust-vmm's
vhost / vm-memory crates and the vhost-device backends built on them.
 
The problem this solves: under Xen the guest's RAM is not allocated by
QEMU and is not backed by a file descriptor. memory_region_get_fd()
returns -1, so vhost_section() filters out every RAM section, the vhost
memory listener registers no regions, and starting any vhost-user
device fails with "Failed initializing vhost-user memory map". With
F_XEN_MMAP the backend maps guest memory itself.

The protocol requires one file descriptor per region in SET_MEM_TABLE.
Guest RAM under Xen has no backing fd, so the front-end opens
/dev/xen/privcmd per region purely to satisfy that requirement; the
backend derives the mapping from guest_phys_addr + domid and never
reads the fd. Each fd is closed once the message has been sent.

This patchset was rebased onto the new vhost_phys_vring_addr infrastructure 
and extends vhost_user_gpa_addresses() so that negotiated
F_XEN_MMAP (bit 17), not F_GPA_ADDRESSES (bit 21, which the backend doesn't 
advertise), drives GPA addressing for both rings and userspace_addr.

The two patches:
  1/2  accept the Xen RAM section in vhost_section()
  2/2  negotiate F_XEN_MMAP and build SET_MEM_TABLE from the extended
       region layout. 
Testing:
Tested on Xen/ARM64 with a DomU using virtio-mmio transports created
by the xenpvh machine, running vhost-device-sound (rust-vmm, built
with the "xen" feature) as the backend in dom0. The device negotiates,
receives the memory table and ring addresses, and the guest's
virtio-snd driver probes and operates.

Non-Xen / x86 KVM: vhost-user-snd backed by
vhost-device-sound (null backend) on a q35/KVM guest. The device
negotiates, the guest virtio-snd driver probes and runs the control and
PCM paths, and the SET_MEM_TABLE and vring-address traffic is identical
to a build without this series confirming the
non-Xen path is unchanged.

The control message exchange between the frontend and backend was
tracked using sockdump as was described in:
Making VirtIO sing - implementing virtio-sound in rust-vmm project
|-> at FOSDEM 2024

Setup:
The main part of the xl config this enables:
virtio = [
 'backend=0,type=virtio,device,transport=mmio,grant_usage=false'
]

device_model_args = [
 ...
 '-chardev', 'socket,id=snd_chardev,path=/tmp/snd.sock',
 '-device', 'vhost-user-snd,chardev=snd_chardev,id=snd,iommu_platform=true',
 ...
]

Xen 4.22-unstable was used with:
 -enable-IOREQ_SERVER 
 -enable-EXPERT

An extra patch was added to xen-tools.
Namely, xen tools will request a pv device drive type for ARM64 but 
qemu expects pvh. This is a known issue:
github.com/Xilinx/xen/commit/5f669949c9ffdb1947cb47038956b5fb8eeb072a

Qemu master was used configured with the following flags:
    --target-list=aarch64-softmmu \
    --cross-prefix=aarch64-linux-gnu- \
    --enable-xen \
    --enable-vhost-user \
    --extra-cflags="-I$XEN-TOOLS/usr/local/include" \
    --extra-ldflags="-L$XEN-TOOLS/usr/local/lib -Wl,
        -rpath-link,$XEN-TOOLS/usr/local/lib" \

Likewise for x86:
    --target-list=aarch64-softmmu \
    --enable-slirp \
    --enable-xen \
    --enable-vhost-user \
    --enable-virtfs \

Linux version 6.11.7 was used with extra configuration flags:
* For enabling Xen Dom0/DomU support
* For enabling virtio (mmio, snd, etc.)
* For enabling sockdump features (BPF, IKHEADERS, KPROBE, etc.)
* Extra debug flags (DEBUG_FS, etc.)

vhost-device commit-id:
    c3bb658ef4fe20a2f264dbbbbc6fa19f1c08c0c5
    
    Was used built with:
    --features alsa-backend,xen

Importantly in vhost-device-scmi/src/vhu_scmi.rs:

// QUEUE_SIZE must be apparently at least 1024 for MMIO.
// There is probably a maximum size per descriptor defined in the kernel.
const QUEUE_SIZE: usize = 1024;

A similar change was made to make mmio work in vhost-user-sound device:

```
diff --git a/vhost-device-sound/src/device.rs b/vhost-device-sound/src/device.rs
index 99e1a8f..1397076 100644
--- a/vhost-device-sound/src/device.rs
+++ b/vhost-device-sound/src/device.rs
@@ -603,7 +603,7 @@ impl VhostUserBackend for VhostUserSoundBackend {
         // a queue is filled up. In this case, adding an element to the queue
         // returns ENOSPC and the element is not queued for a later attempt and
         // is lost. `64` is a "good enough" value from our observations.
-        64
+        1024
     }

     fn features(&self) -> u64 {
```

Without this frontend and backend will fail to negotiate queue size.

Scope and known limitations:
* Foreign mappings only. Grant mappings are not supported: vhost's
  section tracking derives a host pointer for each region, which is
  invalid for the grant pseudo-region, and per-access grant mapping
  needs a different region description (GRANT | no-advance-map). Patch
  1 rejects the xen.grants region explicitly. Setting grant_usage=true
  does not change the qemu<->backend vhost-user exchange.
 
* VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS is suppressed under Xen:
  the ADD/REM_MEM_REG path has not been converted to the extended
  region format, and Xen guests currently expose a single RAM region,
  so SET_MEM_TABLE is sufficient. Multiple RAM regions are not yet
  exercised. Postcopy is refused.

* Spec vs reference implementation: docs/interop/vhost-user.rst
  describes the "can not be mapped in advance" xen-mmap flag as Bit 8
  (value 0x100), whereas rust-vmm's vm-memory uses 0x8 (bit 3,
  MmapXenFlags::NO_ADVANCE_MAP). This series uses neither, but the
  discrepancy probably wants resolving in the spec. Viresh, which is
  intended -- bit position 8 or value 0x8?

* userspace_addr is carried unchanged in the region descriptor; under
  Xen it does not correspond to a mapping and backends do not
  interpret it. An alternative would be to define it (e.g. mirror
  guest_phys_addr).

Open questions:
- userspace_addr semantics under Xen: leave it unchanged, or define it?
- Multi-region support: convert ADD/REM_MEM_REG to the extended layout
  rather than suppressing CONFIGURE_MEM_SLOTS?
- Grant-mapping support: worth pursuing, and what region-description
  shape do backends expect?
- Updating vhost-device-sound to reflect the mmio support.

References:
- vhost-user spec, F_XEN_MMAP / extended memory region / xen mmap flags:
  docs/interop/vhost-user.rst
- rust-vmm vm-memory MmapXenFlags (FOREIGN=0x1, GRANT=0x2,
  NO_ADVANCE_MAP=0x8): src/mmap/xen.rs
- Making VirtIO sing - implementing virtio-sound in rust-vmm project
|-> at FOSDEM 2024

Signed-off-by: Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>
Signed-off-by: Nikola Jelic <Nikola.Jelic@rt-rk.com>
---
Dusan Stojkovic (2):
      vhost: accept Xen guest RAM sections for vhost-user
      vhost-user: implement VHOST_USER_PROTOCOL_F_XEN_MMAP

 hw/virtio/trace-events         |   2 +
 hw/virtio/vhost-user.c         | 120 +++++++++++++++++++++++++++++++++++++++--
 hw/virtio/vhost.c              |  18 +++++++
 hw/xen/xen_stubs.c             |   5 ++
 include/hw/virtio/vhost-user.h |   2 +-
 5 files changed, 143 insertions(+), 4 deletions(-)
---
base-commit: c7cf7c810153d6f5f31aa2d5c0dee9087f6b4dff
change-id: 20260618-vhost-xen-foreign-mapping-d023c85bb706

Best regards,
-- 
Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>


