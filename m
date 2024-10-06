Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5A69921CA
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:52:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811338.1223920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZAv-0007cT-Ck; Sun, 06 Oct 2024 21:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811338.1223920; Sun, 06 Oct 2024 21:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZAv-0007Zy-9I; Sun, 06 Oct 2024 21:52:25 +0000
Received: by outflank-mailman (input) for mailman id 811338;
 Sun, 06 Oct 2024 21:52:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZAt-0007Zk-OC
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:52:23 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43674cee-842d-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 23:52:22 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728251423076361.4005991604132;
 Sun, 6 Oct 2024 14:50:23 -0700 (PDT)
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
X-Inumbo-ID: 43674cee-842d-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1728251424; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Cm2yfDgYKVhiWdiJpNXBaqZCh9/wTnSqO8SGzK4i6Z2mEkoDfvn7ZaQtEFd37N1xSBjAiKfMd1b2p5Mg7D1JS9mdth0ESL+yyaBCW3jOP8Rlpf6bBk5DzLR6spYt1rzNg2USfy1EbmK2LdMywHEO220c6vuV/DuOWCPGpocKtt4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251424; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rsjinz7BtJ8PUF4bqFrjiANBKB2lhUkIggv9H9Y5wr0=; 
	b=kXenxq/25XZNg6VAiDUYU2cr/yZp0s512PCAb+K53nXBh0byxnHgyNBSahYP1ZH+fH5WMkNHamDAX08LtWSR84NS9N/DjD7q9bFxFaxE8gzNSVdSQksmsrDMUOJBqYIRn4Wx0EkxSLSgkfrCEdXskCqytUbMroS/n5w0BIrztuM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251424;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=rsjinz7BtJ8PUF4bqFrjiANBKB2lhUkIggv9H9Y5wr0=;
	b=ehzm01XGqWInV9duJeZ9tiR0stjjoz0zfGP6K3UYKwH/3lybb1s+SnrcF+W59Guc
	fxTfJVR6HrLql3mNUYSPYUIvPAW9JD3Q9cpRB/sDPeYfoChjjfZkxhNRJlk7lIcrlCN
	95eZReM0hPWsK8zd0gsPWMPLoTkf1ojisL2432SE=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 16/44] x86/boot: introduce consumed flag for struct boot_module
Date: Sun,  6 Oct 2024 17:49:27 -0400
Message-Id: <20241006214956.24339-17-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Allow the tracking of when a boot module has been consumed by a handler in the
hypervisor independent of when it is claimed. The instances where the
hypervisor does nothing beyond claiming, the dom0 kernel, dom0 ramdisk, and a
placeholder for itself, are updated as being consumed at the time of being
claimed.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 1 +
 xen/arch/x86/setup.c                | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index c79678840d31..7833b065eff1 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -34,6 +34,7 @@ struct boot_module {
 
     uint32_t flags;
 #define BOOTMOD_FLAG_X86_RELOCATED     (1U << 0)
+#define BOOTMOD_FLAG_X86_CONSUMED      (1U << 1)
 
     paddr_t start;
     size_t size;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4f540c461b26..235b4e41f653 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -318,6 +318,7 @@ static struct boot_info __init *multiboot_fill_boot_info(unsigned long mbi_p)
 
     /* map the last mb module for xen entry */
     bi->mods[bi->nr_modules].type = BOOTMOD_XEN;
+    bi->mods[bi->nr_modules].flags |= BOOTMOD_FLAG_X86_CONSUMED;
     bi->mods[bi->nr_modules].mod = &mods[bi->nr_modules];
 
     return bi;
@@ -1196,6 +1197,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     bitmap_fill(module_map, bi->nr_modules);
     __clear_bit(0, module_map); /* Dom0 kernel is always first */
     bi->mods[0].type = BOOTMOD_KERNEL;
+    bi->mods[0].flags |= BOOTMOD_FLAG_X86_CONSUMED;
 
     if ( pvh_boot )
     {
@@ -2085,6 +2087,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
 
     initrdidx = find_first_bit(module_map, bi->nr_modules);
     bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
+    bi->mods[initrdidx].flags |= BOOTMOD_FLAG_X86_CONSUMED;
     if ( bitmap_weight(module_map, bi->nr_modules) > 1 )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
-- 
2.30.2


