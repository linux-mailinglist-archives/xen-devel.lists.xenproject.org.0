Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG2LHhH8gGn9DQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 20:33:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20749D08D7
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 20:33:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219049.1527918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmzfm-0003SK-Ia; Mon, 02 Feb 2026 19:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219049.1527918; Mon, 02 Feb 2026 19:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmzfm-0003RQ-EX; Mon, 02 Feb 2026 19:33:22 +0000
Received: by outflank-mailman (input) for mailman id 1219049;
 Mon, 02 Feb 2026 19:33:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vmzfl-0003RK-C7
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 19:33:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vmzfl-00H77H-0g;
 Mon, 02 Feb 2026 19:33:20 +0000
Received: from [140.209.201.102] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vmzfk-00EHaV-1o;
 Mon, 02 Feb 2026 19:33:20 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From; bh=22z1W8ArJdHHeBbTucgXt39+2PIybp7ytLowPDqnvIU=; b=bNz3ON
	9bySzHKbGNlMiA/4KzLiM+GpaJGQ/YmBNXnQC5TTa0klCqO9jViG4tcGXR2doSXOqKtaQU1oPtsvL
	pVu5iF8EMk/iGN8uysRu/KsPlVMvF8E6wwt4sbUzXCxdz2rhWEwNNLscth5AfruKulof8k0MCKXFm
	00sHobB+Lsg=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v1] automation: align XTF qemu parameters across achitectures
Date: Mon,  2 Feb 2026 11:32:31 -0800
Message-ID: <20260202193230.21412-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[dmukhin@xen.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:mid,ford.com:email];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20749D08D7
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

It is handy to have 2 CPUs and more RAM for smoke testing a hypervisor
change via XTF.

Align x86 QEMU configuration with Arm for XTF tests: 2 CPU and 2G of RAM.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/scripts/include/xtf-x86-64     | 3 ++-
 automation/scripts/include/xtf-x86-64-efi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/include/xtf-x86-64 b/automation/scripts/include/xtf-x86-64
index b1b0cc201efa..186f074bd8eb 100644
--- a/automation/scripts/include/xtf-x86-64
+++ b/automation/scripts/include/xtf-x86-64
@@ -23,7 +23,8 @@ function xtf_arch_setup()
         -nographic \
         -monitor none \
         -serial stdio \
-        -m 512 \
+        -m 2048 \
+        -smp 2 \
         -kernel ${XEN_BINARY} \
         -initrd ${XTF_BINARY} \
         -append \"${XEN_CMDLINE}\" \
diff --git a/automation/scripts/include/xtf-x86-64-efi b/automation/scripts/include/xtf-x86-64-efi
index 8340c745dbf4..15c6463dcdc5 100644
--- a/automation/scripts/include/xtf-x86-64-efi
+++ b/automation/scripts/include/xtf-x86-64-efi
@@ -49,7 +49,8 @@ EOF
         -nographic \
         -monitor none \
         -serial stdio \
-        -m 512 \
+        -m 2048 \
+        -smp 2 \
         -M q35,kernel-irqchip=split \
         -drive if=pflash,format=raw,readonly=on,file=${FW_PREFIX}OVMF_CODE${suff}.fd \
         -drive if=pflash,format=raw,file=${WORKDIR}/OVMF_VARS${suff}.fd \
-- 
2.52.0


