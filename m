Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bAIBAcAzRmrILgsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:47:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994606F5791
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:47:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PK8X7hvS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1351516.1608674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfE10-0003oK-Ap; Thu, 02 Jul 2026 09:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351516.1608674; Thu, 02 Jul 2026 09:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfE10-0003mq-84; Thu, 02 Jul 2026 09:47:26 +0000
Received: by outflank-mailman (input) for mailman id 1351516;
 Thu, 02 Jul 2026 09:47:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stojkovicdusan555@gmail.com>) id 1wfE0x-0003mj-Sz
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:47:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfE0x-005v0l-9U
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 11:47:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a4633aa-e002-0a2a0a5209dd-0a2a4503d058-6
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:47:23 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stojkovicdusan555@gmail.com>)
 id 6a4633ab-ec1a-0a2a45030019-d1558036bdb0-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:47:23 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493bb510ce4so11840455e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 02:47:23 -0700 (PDT)
Received: from RTRKN1313-LIN.domain.local ([89.216.37.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a4a15sm7539152f8f.14.2026.07.02.02.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 02:47:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782985643; x=1783590443; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fKC1D1OsYzhuu2T5DhZS+ayo24Iqaetkzw1OMf9jA3M=;
        b=PK8X7hvSC/DNLjsOvSvgMjKIJnqJ0PX7MFOKTu8pVhqSgNFflqUHh9R3T8qg3aSoX6
         LWcBwMvqrSurAYPwLTr9pIUZHwCXBCsTsuEmtpwQs096eeoXcSbRGSmS+XN8hFRMf4UT
         dBt8fdMdWF+BhXfDa8yZ1iXbHKXkq4Y4LotnjNHVw7QIu6OLVqI4v9xE8dkNqy88FE+o
         x6UIeq5WuRRxSX8ztp8yQSW9pfF1pwsRV8rc0CWpda6uSWcVPG/ot+K9ETrpg38xawXU
         OXf05TmaAN1K/np1jwutEfok8YdfY28uOYNK9/l6AUlAq46lLQKr2oeGiJxnXN5QuS/6
         NTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985643; x=1783590443;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKC1D1OsYzhuu2T5DhZS+ayo24Iqaetkzw1OMf9jA3M=;
        b=Z0iKEbH+zZWiMjhmpFJK/8OgKy5drRZjQqiLebAN2UfrqYUh5yPvDSZdKM9LgRaQB+
         eM4IGvX2SMgbqpRoEJ92lcNAajpQ6Ylr24sIFSD+wgOEOJewDY2qY2bO/nR2rc6HElFV
         ekRLecshxEFHAMrmA4C8YFZz1QwTdFvEWBN+3nd3rbAjoERAvlSolGDKkDcoPq2n/vJW
         jTcX1X96b3nm2ohuRX1pHABreWBJxGDzc7gOLLWexFAd1kVzjB4M3/XGSTCyjOZ9g5HL
         dCQ73OBuU1NH+1DQO3MremWOtHBkqdr8dqOXTV9qed/ByXIMHAioBqrMaxE+ALnU/sPy
         BYsw==
X-Forwarded-Encrypted: i=1; AFNElJ84cRpXPwmO3jhXo7iiSHoN5D1wIB1n0Hqt3/bzs/akpmHFCBCEpvQeM+h7HHlm2MferiknFhOYbrw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHj0fmLbNDukEGWWLtG2GLCcJq5mfND/MZTqptqOLTv6f2KY+0
	9XORYSyI9ooA0txM13SX+wYbq75udiP4rK692WT64zKxeTpx7Pf5ZHZt
X-Gm-Gg: AfdE7cnx43GUJtNT0qx+LYtg/6YrAqtm9EEqBf1qZHRizu72AqXWRJDwk0yO+z+Rppk
	uqXf8KOIpXtw7wWANMqcCSTJPz/klGvPQUWMEh/O1XhaeXD8CB45K0DRxEohNvn+fIpq8tmqMMu
	nsrNyhM12wt3b1Raqn2cUXwZnRBKtLHKH8/zKDZByW2Q0xTCY8jGjOdFZmaPi+O2Q+7V3+zN7ct
	d5VsXApN6isxE9Zj32J6i1ubdQi0W2q4uO85in5ZF8cPs1LqYyRWbosQP/vq1QLYGt+8OhJms9K
	3xazoT/o/oUhtU+2sUuDGW8JNk4Vg+c5gpmDAgRClrRZBYpA3E3MvCAT7X651aKEJ4ukT1vc3Bv
	saFxEzIKSp8Ya31c/Vk9bW2idm8Ng+0Wbb/JRtn/ElaaJn2G2dkxhGGvqMBmGf98z6qTiUt+O0C
	2xkR7oj+KetP+2hriGGDn5rb9X+PTmqgtmnAT/ZeXJHw==
X-Received: by 2002:a05:600c:8b30:b0:493:bdaf:83a7 with SMTP id 5b1f17b1804b1-493c83a5b75mr4322745e9.28.1782985642521;
        Thu, 02 Jul 2026 02:47:22 -0700 (PDT)
From: Dusan Stojkovic <stojkovicdusan555@gmail.com>
Subject: [PATCH RFC v3 0/2] vhost-user: support Xen foreign memory mappings
Date: Thu, 02 Jul 2026 11:46:11 +0200
Message-Id: <20260702-vhost-xen-foreign-mapping-v3-0-2b8ef913382b@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGMzRmoC/43NTQqDMBAF4KtI1p2SRJNoV4VCD9Bt6cKfUUMxk
 USCRbx7Q1auSpdvHvO9jXh0Gj25ZBtxGLTX1sSQnzLSjrUZEHQXM+GUSypZCWG0foEVDfTWoR4
 MTPU8azNAR3nelqJpFJUk/s8Oe70m+0ke9xt5xeOo/WLdJ+0Flqo/6MCAguolrSUvWKXY1S3g3
 ufWTkkN/CDx6pfEo8QqLGQpUAkljtK+719pMItFEQEAAA==
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
X-purgate-ID: tlsNG-33051d/1782985643-05B345D1-9B66165D/0/0
X-purgate-type: clean
X-purgate-size: 7723
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
X-Rspamd-Queue-Id: 994606F5791

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

A similar change was made to make mmio work in vhost-user-sound device,
bumping QUEUE_SIZE to 1024.

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
Changes in v3:
- Rebased onto current master
- Fixed semantic error in vhost_section comment
- Link to v2: https://lore.kernel.org/qemu-devel/20260629-vhost-xen-foreign-mapping-v2-0-19e4685e7575@rt-rk.com

Changes in v2:
- Rebased onto current master
- Cover letter: removed a rust-vmm hunk which made the git am
  on Patchview fail. The reference is now mentioned in a sentance.
- Link to v1:
  https://lore.kernel.org/qemu-devel/20260618-vhost-xen-foreign-mapping-v1-0-7f60a6241971@rt-rk.com

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
base-commit: 30e8a06b64aa58a3990ba39cb5d09531e7d265e0
change-id: 20260618-vhost-xen-foreign-mapping-d023c85bb706

Best regards,
-- 
Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>


