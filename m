Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007FE651CA1
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:51:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466608.725629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLW-0005b4-OX; Tue, 20 Dec 2022 08:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466608.725629; Tue, 20 Dec 2022 08:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLV-0005H5-Jr; Tue, 20 Dec 2022 08:51:33 +0000
Received: by outflank-mailman (input) for mailman id 466608;
 Tue, 20 Dec 2022 08:51:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLR-0001kP-OY
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7e493ca0-8043-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 09:51:29 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52F90FEC;
 Tue, 20 Dec 2022 00:52:09 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D32F3F71A;
 Tue, 20 Dec 2022 00:51:27 -0800 (PST)
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
X-Inumbo-ID: 7e493ca0-8043-11ed-8fd4-01056ac49cbb
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 13/18] public/x86: cppcheck: misra rule 20.7 deviation on hvm/save.h
Date: Tue, 20 Dec 2022 08:50:55 +0000
Message-Id: <20221220085100.22848-14-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>

Cppcheck has found a violation of rule 20.7 for the macro
XEN_HVM_VIOAPIC, but the first macro argument is never used
as an expression, cppcheck is not taking into account the context of
use for it, so we can suppress the finding.

Eclair and coverity does not report this finding.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/include/public/arch-x86/hvm/save.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 7ecacadde165..08f221483dc8 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -366,6 +366,7 @@ union vioapic_redir_entry
 
 #define VIOAPIC_NUM_PINS  48 /* 16 ISA IRQs, 32 non-legacy PCI IRQS. */
 
+/* SAF-1-false-positive-cppcheck R20.7 argument as text substitution */
 #define XEN_HVM_VIOAPIC(name, cnt)                      \
     struct name {                                       \
         uint64_t base_address;                          \
-- 
2.17.1


