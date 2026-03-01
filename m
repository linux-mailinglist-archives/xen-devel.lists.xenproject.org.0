Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEAJA2XJo2nCMwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 06:06:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D821CE8C2
	for <lists+xen-devel@lfdr.de>; Sun, 01 Mar 2026 06:06:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243670.1543294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwYzY-0000wm-0p; Sun, 01 Mar 2026 05:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243670.1543294; Sun, 01 Mar 2026 05:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vwYzX-0000ti-Pv; Sun, 01 Mar 2026 05:05:19 +0000
Received: by outflank-mailman (input) for mailman id 1243670;
 Sun, 01 Mar 2026 05:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4UQC=BB=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1vwYzV-0000ta-67
 for xen-devel@lists.xenproject.org; Sun, 01 Mar 2026 05:05:18 +0000
Received: from out28-170.mail.aliyun.com (out28-170.mail.aliyun.com
 [115.124.28.170]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 355011fc-152c-11f1-b164-2bf370ae4941;
 Sun, 01 Mar 2026 06:05:08 +0100 (CET)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.ghnzBIM_1772341500 cluster:ay29) by smtp.aliyun-inc.com;
 Sun, 01 Mar 2026 13:05:01 +0800
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
X-Inumbo-ID: 355011fc-152c-11f1-b164-2bf370ae4941
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1772341503; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=sdX+g4xfWUksNlVfdbgGXJ5fc68UgBRbz+En866aoYQ=;
	b=OrxFPWtB1uoOs3ftFfEAAKSQQe0ftc1to0gMiiOzN+bvR6wC+G/uIePYFORNpXNXseYXaT/zs++N3YHFCnMC/5xMvfMDllO/sm81JPby+yH7EKxkTLkKnbZYNls6jU2AlflOWGQZaWBsfPGMtr4/oZVg5/hxB6QgrnZbMAErM7g=
From: Hou Wenlong <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/2] x86/PVH: Use boot params to pass RSDP address in start_info page
Date: Sun,  1 Mar 2026 13:04:52 +0800
Message-Id: <76675c4d49d3a8f72252076812ef8f22276230c2.1772282441.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[antgroup.com,quarantine];
	R_DKIM_ALLOW(-0.20)[antgroup.com:s=default];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:houwenlong.hwl@antgroup.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[houwenlong.hwl@antgroup.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[antgroup.com:mid,antgroup.com:dkim,antgroup.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[houwenlong.hwl@antgroup.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[antgroup.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47D821CE8C2
X-Rspamd-Action: no action

After commit e6e094e053af75 ("x86/acpi, x86/boot: Take RSDP address from
boot params if available"), the RSDP address can be passed in boot
params. Therefore, store the RSDP address in start_info page into boot
params in the PVH entry instead of registering a different callback.
This removes an absolute reference during the PVH entry and is more
standardized.

Signed-off-by: Hou Wenlong <houwenlong.hwl@antgroup.com>
---
 arch/x86/platform/pvh/enlighten.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
index 2263885d16ba..f2053cbe9b0c 100644
--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -25,11 +25,6 @@ struct hvm_start_info __initdata pvh_start_info;
 
 const unsigned int __initconst pvh_start_info_sz = sizeof(pvh_start_info);
 
-static u64 __init pvh_get_root_pointer(void)
-{
-	return pvh_start_info.rsdp_paddr;
-}
-
 /*
  * Xen guests are able to obtain the memory map from the hypervisor via the
  * HYPERVISOR_memory_op hypercall.
@@ -95,7 +90,7 @@ static void __init init_pvh_bootparams(bool xen_guest)
 	pvh_bootparams.hdr.version = (2 << 8) | 12;
 	pvh_bootparams.hdr.type_of_loader = ((xen_guest ? 0x9 : 0xb) << 4) | 0;
 
-	x86_init.acpi.get_root_pointer = pvh_get_root_pointer;
+	pvh_bootparams.acpi_rsdp_addr = pvh_start_info.rsdp_paddr;
 }
 
 /*
-- 
2.31.1


