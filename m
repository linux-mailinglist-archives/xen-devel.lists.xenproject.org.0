Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD0869D205
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 18:17:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498287.769144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9mi-0005oh-CR; Mon, 20 Feb 2023 17:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498287.769144; Mon, 20 Feb 2023 17:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9mi-0005lf-8l; Mon, 20 Feb 2023 17:17:04 +0000
Received: by outflank-mailman (input) for mailman id 498287;
 Mon, 20 Feb 2023 17:17:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kEKe=6Q=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pU9mg-0005Un-UY
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 17:17:03 +0000
Received: from coral.elm.relay.mailchannels.net
 (coral.elm.relay.mailchannels.net [23.83.212.39])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62d3ef3b-b142-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 18:17:02 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 72C958C184C
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 17:16:59 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 150DA8C149F
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 17:16:59 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.97.74.37 (trex/6.7.1); Mon, 20 Feb 2023 17:16:59 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4PL8Gx6vMMz19W
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 09:16:57 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e0067 by kmjvbox (DragonFly Mail Agent v0.12);
 Mon, 20 Feb 2023 09:16:54 -0800
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
X-Inumbo-ID: 62d3ef3b-b142-11ed-933d-83870f6b2ba8
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1676913419; a=rsa-sha256;
	cv=none;
	b=LHjYdKeo+GvxjBb2CAt5RzY3XHvdRjz0Ri//UuR/B0W8j7kdCpsCc+cSjrp0qIAiQW7mDh
	/rwarpT6ifIm0g7TBF0rDUSSN3kVhaWEO6rLersjz69TKQ/XtrMNI2X/hN860J/obOlKhB
	S6sfwOnuBvGvAJeiQqm+6iwAsdi9cViW52UiKRRGceLvoPpPhHrE1RfzBFdtLTmzy4MOPc
	tpPHmCvUEdbP5XN6uwZVPnXrGwYxV+NYvLrr3D5nKq3AIofhOMjnXCm2GXzTG3C8B16F2v
	WSKCxPvmGUNJKtRxX9/SmO0Wz+Z1xTV+T522qmbWuWpfGe8raon4zOYT4MM75A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1676913419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=jPLOaJx1XC+xepUu7FtXLYzyt2YPI1cX/q7Jp4OSr1s=;
	b=rdUXetuzMNqmuK9nBl2gfZjCvEfUnaT6XMq9GfLIPCOTE95p5b97DmEiLL9Dzp6KwSM0d/
	0uGLdwtW6dKohn+0Escr26SVcMiu+Kc5tkKiygZhqifUekV8Dinej4c/Y7SCxHfCYT0MNc
	QkDrxoIYxLsBujDRsoFiiAlw7wHwX27TAI6TQvoWkonO3hXGNRPGS06+zqkr4dkKuTLTmX
	114eTwCxIktNTb3WEAfB1V0rfQDjozUr2Pd9UiN/5b807nr9Ls+CypIoxxaf/wC+ObSnis
	O3VBtwzxZTlCBSX9P/BsBZNU1jyyubBijXPCz0YNylTkD0mJHQceh3p+ZgJdDA==
ARC-Authentication-Results: i=1;
	rspamd-9788b98bc-qjg4h;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Good
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Bottle-Quick: 1a8a282a7279178a_1676913419317_2330254153
X-MC-Loop-Signature: 1676913419317:2680030077
X-MC-Ingress-Time: 1676913419317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1676913418;
	bh=jPLOaJx1XC+xepUu7FtXLYzyt2YPI1cX/q7Jp4OSr1s=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=rBn5t9nd39DD3PrheNBrV//PfuVBGriKg54u+who5tQJupiTqQmzFpE9n1TFxGgTU
	 xH4H3u37nLpo1Hus0ou6M6JSe53Ak3WZWHlEXNd1YjZ/vUGRYBJlA0SvOslsHhzLUp
	 DozJZqCz3LnFjfiXoMPUBiMBqMd/9C7lTh+5cNiA=
Date: Mon, 20 Feb 2023 09:16:54 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	David Reaver <me@davidreaver.com>,
	Brendan Gregg <brendan@intel.com>
Subject: [PATCH linux-next 1/2] xen: update arch/x86/include/asm/xen/cpuid.h
Message-ID: <b8040de892acb46910ebae6d65291b2e021302b9.1676610413.git.kjlx@templeofstupid.com>
References: <cover.1676610413.git.kjlx@templeofstupid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1676610413.git.kjlx@templeofstupid.com>

Update arch/x86/include/asm/xen/cpuid.h from the Xen tree to get newest
definitions.  This picks up some TSC mode definitions and comment
formatting changes.

Signed-off-by: Krister Johansen <kjlx@templeofstupid.com>
---
 arch/x86/include/asm/xen/cpuid.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/xen/cpuid.h b/arch/x86/include/asm/xen/cpuid.h
index 6daa9b0c8d11..a3c29b1496c8 100644
--- a/arch/x86/include/asm/xen/cpuid.h
+++ b/arch/x86/include/asm/xen/cpuid.h
@@ -89,11 +89,21 @@
  * Sub-leaf 2: EAX: host tsc frequency in kHz
  */
 
+#define XEN_CPUID_TSC_EMULATED               (1u << 0)
+#define XEN_CPUID_HOST_TSC_RELIABLE          (1u << 1)
+#define XEN_CPUID_RDTSCP_INSTR_AVAIL         (1u << 2)
+
+#define XEN_CPUID_TSC_MODE_DEFAULT           (0)
+#define XEN_CPUID_TSC_MODE_ALWAYS_EMULATE    (1u)
+#define XEN_CPUID_TSC_MODE_NEVER_EMULATE     (2u)
+#define XEN_CPUID_TSC_MODE_PVRDTSCP          (3u)
+
 /*
  * Leaf 5 (0x40000x04)
  * HVM-specific features
  * Sub-leaf 0: EAX: Features
  * Sub-leaf 0: EBX: vcpu id (iff EAX has XEN_HVM_CPUID_VCPU_ID_PRESENT flag)
+ * Sub-leaf 0: ECX: domain id (iff EAX has XEN_HVM_CPUID_DOMID_PRESENT flag)
  */
 #define XEN_HVM_CPUID_APIC_ACCESS_VIRT (1u << 0) /* Virtualized APIC registers */
 #define XEN_HVM_CPUID_X2APIC_VIRT      (1u << 1) /* Virtualized x2APIC accesses */
@@ -102,12 +112,16 @@
 #define XEN_HVM_CPUID_VCPU_ID_PRESENT  (1u << 3) /* vcpu id is present in EBX */
 #define XEN_HVM_CPUID_DOMID_PRESENT    (1u << 4) /* domid is present in ECX */
 /*
- * Bits 55:49 from the IO-APIC RTE and bits 11:5 from the MSI address can be
- * used to store high bits for the Destination ID. This expands the Destination
- * ID field from 8 to 15 bits, allowing to target APIC IDs up 32768.
+ * With interrupt format set to 0 (non-remappable) bits 55:49 from the
+ * IO-APIC RTE and bits 11:5 from the MSI address can be used to store
+ * high bits for the Destination ID. This expands the Destination ID
+ * field from 8 to 15 bits, allowing to target APIC IDs up 32768.
  */
 #define XEN_HVM_CPUID_EXT_DEST_ID      (1u << 5)
-/* Per-vCPU event channel upcalls */
+/*
+ * Per-vCPU event channel upcalls work correctly with physical IRQs
+ * bound to event channels.
+ */
 #define XEN_HVM_CPUID_UPCALL_VECTOR    (1u << 6)
 
 /*
-- 
2.25.1


