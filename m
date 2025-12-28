Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ABECE4D62
	for <lists+xen-devel@lfdr.de>; Sun, 28 Dec 2025 13:50:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193781.1512368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZqDL-0007o4-3y; Sun, 28 Dec 2025 12:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193781.1512368; Sun, 28 Dec 2025 12:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZqDK-0007my-Vy; Sun, 28 Dec 2025 12:49:38 +0000
Received: by outflank-mailman (input) for mailman id 1193781;
 Sun, 28 Dec 2025 12:49:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIfO=7C=bounce.vates.tech=bounce-md_30504962.69512754.v1-d36f786847d04c379ce739a8e79bc6c2@srs-se1.protection.inumbo.net>)
 id 1vZqDJ-0007ms-D4
 for xen-devel@lists.xenproject.org; Sun, 28 Dec 2025 12:49:37 +0000
Received: from mail137-23.atl71.mandrillapp.com
 (mail137-23.atl71.mandrillapp.com [198.2.137.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a42a1725-e3eb-11f0-9ccf-f158ae23cfc8;
 Sun, 28 Dec 2025 13:49:26 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-23.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4dfK1J5V8xz1XLFWK
 for <xen-devel@lists.xenproject.org>; Sun, 28 Dec 2025 12:49:24 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d36f786847d04c379ce739a8e79bc6c2; Sun, 28 Dec 2025 12:49:24 +0000
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
X-Inumbo-ID: a42a1725-e3eb-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1766926164; x=1767196164;
	bh=3XiTMeV+2IW1xdRQNSSLaOcS0uReSSjLIjsndGXvcE8=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=MUKPzb3XmYozgV02JCGMP3YUXqGSmhe7BDyIgw0l/Vgvp591kSYfzmpnCMcxOugN9
	 +edbdGinBZkuRbeKLFSj6U1tzkagBwCRN88y5rHt3NXhqkdQdfeNTgoSaLqRhWCPnv
	 /cmVa6ybNYa0WqdYBwtY+k6bbKbEiVPihmK+B+48S2hM2ko0EpJE1Q+YuG1EhiM0mo
	 G03892+5J9qAglGD+xcZEqzg3TjsahyOeMux9EKN2ri3ApkO/AKefEUGvhYyZ7moXR
	 SO4TZHNTd3U1SgSpeK9RPEoG2MMRahNFY6kMi1qgWniTVpVbDMU/ygY1urkkAEwETn
	 q3fdpr1ISkQ5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1766926164; x=1767186664; i=teddy.astie@vates.tech;
	bh=3XiTMeV+2IW1xdRQNSSLaOcS0uReSSjLIjsndGXvcE8=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=of+TdZRsfX3uD8wiBEuSLDShvXkRpEiTADnY4tfXJR/FGVjUo4Abe48PWIShVGtGN
	 cIwGzarykgeVkEhWBUAhq/sMrkrXhMlkpasNLiq0Ix64Kl2nYxG5z0gzSi+z+Nv96p
	 zcZ0VsbCUBwqVGl7vZULE7i+9kIGYTRdImqFSfhicVHXBXJnGGk89+eVHgTy2sUaMY
	 8V+4sn3c6qXOCOpp5xNkIqYkk3QOW7UVMiJN6+cpiQu3YCx+xcknfT3CpF33Uw+KuC
	 B0+N3JPT8UEpob+ffoKJXWtau8UFh1n31cOQdcl8pLbgnKxQayAsIGHF7LHr9nEl6r
	 Rw58ujMYtd9OQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH]=20pvh:=20Introduce=20SIF=5FHVM=5FGHCB=20for=20SEV-ES/SNP=20guests?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1766926163327
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <3b6f5146287d3402a09836b7cf876d4f8dc9eee1.1766889890.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d36f786847d04c379ce739a8e79bc6c2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251228:md
Date: Sun, 28 Dec 2025 12:49:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Under SEV, the pagetables needs to be post-processed to add the C-bit
(to make the mapping encrypted). The guest is expected to query the C-bit
through CPUID. However, under SEV-ES and SEV-SNP modes, this instruction
now triggers #VC instead. The guest would need to setup a IDT very early
and instead use the early-GHCB protocol to emulate CPUID, which is
complicated.

Alternatively, we can signal to the guest that it is a SEV-ES/SNP through
start_info structure, which is visible to the guest early on. All SEV-ES/SNP
guests have the GHCB MSR available, which can be trivially [1] used to get the
C-bit and proceed with the initialization avoiding CPUID instruction.

We integrate that to the PVH ABI and expect all SEV-enabled domain builders
to honor this flag for simplifying the PVH entry point logic of guests.

[1] Initial GHCB MSR value contains the C-bit. The guest can trivially read this
MSR and skip CPUID logic.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Actually, C-bit itself cannot be a part of ABI as it is hardware-dependant
(and even firmware configuration dependant).
---
 docs/misc/pvh.pandoc     | 5 +++++
 xen/include/public/xen.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/docs/misc/pvh.pandoc b/docs/misc/pvh.pandoc
index 3e18789d36..6453ee21eb 100644
--- a/docs/misc/pvh.pandoc
+++ b/docs/misc/pvh.pandoc
@@ -44,6 +44,11 @@ using HVMPARAMS, just like it's done on HVM guests.
 The setup of the hypercall page is also performed in the same way
 as HVM guests, using the hypervisor cpuid leaves and msr ranges.
 
+## SEV-ES/SNP guests ##
+
+The domain builder must set `SIF_HVM_GHCB` in start_info if the guest uses
+SEV-ES or SEV-SNP technologies; i.e requires the use of GHCB protocol.
+
 ## AP startup ##
 
 AP startup can be performed using hypercalls or the local APIC if present.
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 7f15204c38..9b84df573b 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -890,6 +890,8 @@ typedef struct start_info start_info_t;
 #define SIF_MOD_START_PFN (1<<3)  /* Is mod_start a PFN? */
 #define SIF_VIRT_P2M_4TOOLS (1<<4) /* Do Xen tools understand a virt. mapped */
                                    /* P->M making the 3 level tree obsolete? */
+#define SIF_HVM_GHCB      (1<<5)   /* Domain is SEV-ES/SNP guest that requires */
+                                   /* use of GHCB. */
 #define SIF_PM_MASK       (0xFF<<8) /* reserve 1 byte for xen-pm options */
 
 /*
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


