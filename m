Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D776191E6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 08:27:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437310.691591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqr6Z-000861-EY; Fri, 04 Nov 2022 07:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437310.691591; Fri, 04 Nov 2022 07:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqr6Z-000832-Bg; Fri, 04 Nov 2022 07:27:07 +0000
Received: by outflank-mailman (input) for mailman id 437310;
 Fri, 04 Nov 2022 07:27:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BBJ=3E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oqr6Y-00082w-KZ
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 07:27:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1492f60a-5c12-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 08:27:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 023DE1F74A;
 Fri,  4 Nov 2022 07:27:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A76AD1346F;
 Fri,  4 Nov 2022 07:27:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MCOfJ8e+ZGPWQAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Nov 2022 07:27:03 +0000
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
X-Inumbo-ID: 1492f60a-5c12-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667546824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bESrsZp5nkJG/KdIDLKESNyabZqvX9dwTKnh7zplFPc=;
	b=n9o+6s3UG78TbvKngU6Oi+3uY2MUMWfFweD7Wtr6ymwqRx4TqaGq8uvAMGtf83rd5scylQ
	CVX9dPWF40VZMavSSC6wYSTPb4UhtbL+OspARLblOSHwGV3nXiydvJ94caPsOJUvkYjpCW
	ITxrIbaCKjSBJNpgH6PrJran/aYm0MA=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pu Wen <puwen@hygon.cn>
Subject: [PATCH v2 0/5] x86: Switch X86_FEATURE_XENPV to cpu_feature_enabled() use
Date: Fri,  4 Nov 2022 08:26:56 +0100
Message-Id: <20221104072701.20283-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make especially kernels without CONFIG_XEN_PV more efficient by
using cpu_feature_enabled(X86_FEATURE_XENPV) instead of boot_cpu_has()
and friends.

Changes in V2:
- new patch 4

Juergen Gross (5):
  x86: add X86_FEATURE_XENPV to disabled-features.h
  x86: remove unneeded 64-bit dependency in arch_enter_from_user_mode()
  x86: drop 32-bit Xen PV guest code in update_task_stack()
  x86: remove X86_FEATURE_XENPV usage in setup_cpu_entry_area()
  x86: switch to cpu_feature_enabled() for X86_FEATURE_XENPV

 arch/x86/include/asm/disabled-features.h | 8 +++++++-
 arch/x86/include/asm/entry-common.h      | 4 ++--
 arch/x86/include/asm/switch_to.h         | 7 ++-----
 arch/x86/kernel/cpu/amd.c                | 2 +-
 arch/x86/kernel/cpu/bugs.c               | 2 +-
 arch/x86/kernel/cpu/hygon.c              | 2 +-
 arch/x86/kernel/process_64.c             | 4 ++--
 arch/x86/kernel/topology.c               | 2 +-
 arch/x86/mm/cpu_entry_area.c             | 8 ++------
 9 files changed, 19 insertions(+), 20 deletions(-)

-- 
2.35.3


