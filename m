Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A3669FA94
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 18:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499733.771019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUtKP-0001AK-N7; Wed, 22 Feb 2023 17:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499733.771019; Wed, 22 Feb 2023 17:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUtKP-00017j-Jz; Wed, 22 Feb 2023 17:54:53 +0000
Received: by outflank-mailman (input) for mailman id 499733;
 Wed, 22 Feb 2023 17:54:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L7in=6S=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pUtKN-0000qN-Dp
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 17:54:51 +0000
Received: from beige.elm.relay.mailchannels.net
 (beige.elm.relay.mailchannels.net [23.83.212.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fef0b3c7-b2d9-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 18:54:49 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id D3D513E109B
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 17:54:46 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 71AD63E16EA
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 17:54:46 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.116.179.67 (trex/6.7.1); Wed, 22 Feb 2023 17:54:46 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4PMP1d5LMsz14t
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 09:54:45 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e004a by kmjvbox (DragonFly Mail Agent v0.12);
 Wed, 22 Feb 2023 09:54:42 -0800
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
X-Inumbo-ID: fef0b3c7-b2d9-11ed-93b6-47a8fe42b414
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1677088486; a=rsa-sha256;
	cv=none;
	b=63+Wzl6aBa531tl++b0ez2kBBPnfvSmR1U3paRQGyxN98y0O6OP92cYBF2lR5ZZEZsUgan
	fB0zWbwPctZXpYaqJrenQutcV4/kpDkxk6uuUu50mmU91JN5YFLCPNfwMfq/jUxLi/mbS7
	eoSv1QL4WS5EHUqTjCZ4/2BpZ/UR99OnIbNVAr6qWOYFSpwgf8Wu2YJAhTD2pUY281J0dp
	Xr05cSpGW3mFme/tmnPYZIjf4aYfC7fgn1WU++4Rl0Jrat0h4HfwhmCv6RDVwGXyEyYK8l
	XXVVVzgW5qL97/JY3XdYIcyAj4aS2kqF1ISOSUgKG4rxlqAiI7rng7xpxVl52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1677088486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=jPLOaJx1XC+xepUu7FtXLYzyt2YPI1cX/q7Jp4OSr1s=;
	b=skRg/mcrOyzGQm0FL1h7oKwMmwDebYA2MST4Egm8WShxvESPe1l4fTiOvcpnjYlWYAXVrH
	dXjIjk+R4Xo9meW81cAoVIkLi8iVvbiIuBqCso2zkU2RhuMKvx8HdT/GUtyXF5kAo+aI73
	M6uuKWqON/mHF5PH59N9Ia1MHCj8DaAbm/QttXJi0XC6quHOr71LrN0dXd0e53yMTASGhW
	paHtyFqPB7sM63+wFP+CyBdzljyvwqwwk0+uig30e5kY7sVHzZyvTW6aL8lWaH9FTmmj+s
	1KVJcgILAerjpfcX/f6AiLvjBcVEkXv6VjkrA1IA3rTTp5ccH0MnwlJQH67t9Q==
ARC-Authentication-Results: i=1;
	rspamd-9788b98bc-5fcpp;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Macabre-Tart: 3a1cb88f046d65e9_1677088486703_666751592
X-MC-Loop-Signature: 1677088486703:994943487
X-MC-Ingress-Time: 1677088486702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1677088485;
	bh=jPLOaJx1XC+xepUu7FtXLYzyt2YPI1cX/q7Jp4OSr1s=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=qdobVzsjR9zv6DZs/ZU+JlQIvIMABZGLWOYbRVtroNjbc4+MwJguWEWeMnrF0Cp+n
	 gyLo1jZQeSTRi5y6uDlBdZ1ToVqbbFNaMxVqgSWzePjP0AK2N+YAgj/UzF5mEFIvTo
	 DPXCiUhTXg4XfeSPA2n2I53qi0o3iQTxErDZ2PEU=
Date: Wed, 22 Feb 2023 09:54:42 -0800
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
Subject: [PATCH linux-next v2 1/2] xen: update
 arch/x86/include/asm/xen/cpuid.h
Message-ID: <94b9046dd0db3794f0633d134b7108508957758d.1677038165.git.kjlx@templeofstupid.com>
References: <cover.1677038165.git.kjlx@templeofstupid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1677038165.git.kjlx@templeofstupid.com>

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


