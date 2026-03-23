Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAUGJ+dqwWnVSwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:31:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238B22F83EF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:31:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259474.1552800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iBa-0007dB-A1; Mon, 23 Mar 2026 16:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259474.1552800; Mon, 23 Mar 2026 16:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iBa-0007b6-5u; Mon, 23 Mar 2026 16:31:26 +0000
Received: by outflank-mailman (input) for mailman id 1259474;
 Mon, 23 Mar 2026 16:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n/J7=BX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w4iBY-00079z-Pr
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 16:31:24 +0000
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb69298a-26d5-11f1-b166-2bf370ae4941;
 Mon, 23 Mar 2026 17:31:24 +0100 (CET)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b98133bdc4bso522446566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 09:31:24 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm536248166b.17.2026.03.23.09.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:31:18 -0700 (PDT)
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
X-Inumbo-ID: bb69298a-26d5-11f1-b166-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283483; x=1774888283; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUX7GrhRziDvMmFWaLMh2GDPwrEhtXaG/vycDO8shAw=;
        b=dvBaEioFdDUTIS0NKusO4vriSn6gNLixUj0H7cm69Re7q8jIZRkgABDHF9Y7HrzZYH
         vFOjjl6h8ltr+ux3d//RuTt5lFWph0dbo585CvMmv5EOOUU0I4VZIO3H+CrJDysucJUq
         VFIkgz2Gor7wJ/YVIicyv3ZcQbPBJRxow8VFE3YvyApvV0p5lScwG2vuSFcTPPpPXuju
         mXrZwoBTV2ThJtBD+pZppgF07Z3SlN1B/TE9cDImhVOnqS2nyFm248aHxDWLp741mJEd
         mwKZR4pEIfjZ3YmBkQbdnbD185FaeX/8ysFRuzDzGRezadhd0RS3xhjMCMwfokZj/OHI
         0VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283483; x=1774888283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OUX7GrhRziDvMmFWaLMh2GDPwrEhtXaG/vycDO8shAw=;
        b=Q2vsJo8ZKxJCt6JfaSvaNXmE7KfokSHm11sbXOJnMvGf9vBDgjcSa2SqoQU9ISPRsE
         JGCkXXJN5UV9mfLaqAIE7O6iv4190PIV1lgQCu7NM+8roFjOHvz6LGVI8jrqjArSlE++
         uXBPKLuCY5/UEQvNPo8MxSvhDQDZD3bq9vjemdDlGXmPT50/vNqj4C/6wXNJ5GT5poRt
         KJdYPxWkbbFJHg1dLLDHtp5JFQe9shNiTZWU/WKh2YNyq7opMLceo4CeIvF6BFYdS79q
         avB5zEJ37QkzLtM9qFafGVHLbJMebstuoKeX8yW5lT86omYHgv8hSc7RnNt37w7oLNMb
         EW3g==
X-Gm-Message-State: AOJu0YyfPKFe3n5lo4efgOsXg16mKw5OWNeV9Z3Fhe14vsJsWRHMqDkS
	IQGpEmntJcgumg8QclgpJtfqwUi6n0jaLqMt2szpAknwFaLoLwrIscV9yA071Q==
X-Gm-Gg: ATEYQzyCVB8/D19vg6PXNVtF23Fg38qGaiMh0z82pJhBDpPxsfZy5PDNlrODU/hFNP8
	JyL3Ru3a5244BPV42KtiBFux+Cyr/GkPfD+TRxJew2JuQBWvobhzfCrIZFHWSuInROojJPMyDBM
	O0D3TApT0dKTsNvgcDZWuRpzBRq++l+CNQnT1EeItnn5Mub239fLyRxBwj0g9P8xsYoHrAJpJIR
	8gDpFTHR7NSTMjbt1G8tB5HMZA7K8t/SH6tXbUe4UmouqHRyH6TzlQIQbjoSaqAsDk56BzoNPJn
	WItntBRE+z/UjNICcmd2wI7qwssri3+pgH8sviDPUDBy5WoA7Wrt3JmxP1gk73Mfk7aI/XHeZEl
	TPh12hutrV9ZmBUHUtFiHGhtvWZjHpyoIyJs8k5e2ML/cTf4yQCc4NuEVr7mrYmb6NRxZ5105rE
	tzHDvTbAYnXLm6ZhQLUQFagvHi/eegVlnHWUZWBJOwUqq7uX1X7lAEP4NhAOixMRe4YA==
X-Received: by 2002:a17:906:5643:b0:b98:132e:ca97 with SMTP id a640c23a62f3a-b982f37d4damr665981666b.47.1774283483001;
        Mon, 23 Mar 2026 09:31:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 07/11] xen: move domain_use_host_layout() to common code
Date: Mon, 23 Mar 2026 17:29:48 +0100
Message-ID: <533d01db2b36b8357cd87e99a64a6e66dbdd1db4.1774281309.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774281309.git.oleksii.kurochko@gmail.com>
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 238B22F83EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

domain_use_host_layout() is not really architecture-specific, so move it
from the Arm header to the common header xen/domain.h and provide a common
implementation in xen/common/domain.c. domain_use_host_layout() potentially
is needed for x86 [1].

Turn the macro into a function to avoid header dependency issues.  In
particular, the implementation depends on paging_mode_translate(), and
including xen/paging.h from xen/domain.h would introduce circular
dependencies via xen/sched.h which will lead to compilation errors as
implicit declaration of struct vcpu, or struct domain, or similar things
declared in xen/sched.h.

Adjust the implementation to take paging_mode_translate() into account
so it works correctly for all architectures, including x86. Some extra
details about implementation [2] and [3].

Also, inclusion of asm/p2m.h is dropped as xen/paging.h already includes
it.

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602161038120.359097@ubuntu-linux-20-04-desktop/
[2] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602271742400.3148344@ubuntu-linux-20-04-desktop/
[3] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602271750190.3148344@ubuntu-linux-20-04-desktop/

Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Drop ifdef around defintion of domain_use_host_layout() as it
   was suggested generic version. It could be returned back when
   the real use case for it will appear.
 - Add Suggested-by: and update the commit message.
 - Make domain_use_host_layout() function instead of macros to
   avoid ciclular header dependecies. Look at more details in
   the commit message.
---
 xen/arch/arm/include/asm/domain.h | 14 --------------
 xen/common/domain.c               |  8 +++++++-
 xen/include/xen/domain.h          | 16 ++++++++++++++++
 3 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 758ad807e461..1a04fe658c97 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -29,20 +29,6 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
-/*
- * Is the domain using the host memory layout?
- *
- * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
- * To avoid any trouble finding space, it is easier to force using the
- * host memory layout.
- *
- * The hardware domain will use the host layout regardless of
- * direct-mapped because some OS may rely on a specific address ranges
- * for the devices.
- */
-#define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
-                                   is_hardware_domain(d))
-
 struct vtimer {
     struct vcpu *v;
     int irq;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index ab910fcf9306..87a6a17575f9 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -26,6 +26,7 @@
 #include <xen/hypercall.h>
 #include <xen/delay.h>
 #include <xen/shutdown.h>
+#include <xen/paging.h>
 #include <xen/percpu.h>
 #include <xen/multicall.h>
 #include <xen/rcupdate.h>
@@ -35,7 +36,6 @@
 #include <xen/argo.h>
 #include <xen/llc-coloring.h>
 #include <xen/xvmalloc.h>
-#include <asm/p2m.h>
 #include <asm/processor.h>
 #include <public/sched.h>
 #include <public/sysctl.h>
@@ -2544,6 +2544,12 @@ void thaw_domains(void)
 
 #endif /* CONFIG_SYSTEM_SUSPEND */
 
+bool domain_use_host_layout(struct domain *d)
+{
+    return is_domain_direct_mapped(d) ||
+           (paging_mode_translate(d) && is_hardware_domain(d));
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 93c0fd00c1d7..68fb1acd4083 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -62,6 +62,22 @@ void domid_free(domid_t domid);
 #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
 
+/*
+ * Is the auto-translated domain using the host memory layout?
+ *
+ * domain_use_host_layout() is always False for PV guests.
+ *
+ * Direct-mapped domains (autotranslated domains with memory allocated
+ * contiguously and mapped 1:1 so that GFN == MFN) are always using the
+ * host memory layout to avoid address clashes.
+ *
+ * The hardware domain will use the host layout (regardless of
+ * direct-mapped) because some OS may rely on a specific address ranges
+ * for the devices. PV Dom0, like any other PV guests, has
+ * domain_use_host_layout() returning False.
+ */
+bool domain_use_host_layout(struct domain *d);
+
 /*
  * Arch-specifics.
  */
-- 
2.53.0


