Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4393812F0B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 12:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654490.1021426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDk8Z-0001gY-9k; Thu, 14 Dec 2023 11:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654490.1021426; Thu, 14 Dec 2023 11:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDk8Z-0001ap-4p; Thu, 14 Dec 2023 11:44:19 +0000
Received: by outflank-mailman (input) for mailman id 654490;
 Thu, 14 Dec 2023 11:44:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=57RS=HZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rDk8X-0000uU-PR
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 11:44:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1babaf59-9a76-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 12:44:15 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 20DB04EE0C81;
 Thu, 14 Dec 2023 12:44:15 +0100 (CET)
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
X-Inumbo-ID: 1babaf59-9a76-11ee-98e9-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 4/5] x86/hvm: dom0: use helper to get sizeof struct field
Date: Thu, 14 Dec 2023 12:44:09 +0100
Message-Id: <17b01f14b89a5dba6935bbd8019ddf431d595890.1702553835.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702553835.git.nicola.vetrini@bugseng.com>
References: <cover.1702553835.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of the proper helper macro also resolves a violation
of MISRA C Rule 11.9.
No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/hvm/dom0_build.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 70d31289b04a..e59f6657d918 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1144,8 +1144,7 @@ static int __init pvh_setup_acpi(struct domain *d, paddr_t start_info)
     rc = hvm_copy_to_guest_phys(start_info +
                                 offsetof(struct hvm_start_info, rsdp_paddr),
                                 &rsdp_paddr,
-                                sizeof(((struct hvm_start_info *)
-                                        0)->rsdp_paddr),
+                                sizeof_field(struct hvm_start_info, rsdp_paddr),
                                 d->vcpu[0]);
     if ( rc )
     {
-- 
2.34.1


