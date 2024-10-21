Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E109A5851
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:56:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822980.1236984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2giv-0001ym-9T; Mon, 21 Oct 2024 00:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822980.1236984; Mon, 21 Oct 2024 00:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2giv-0001vC-4r; Mon, 21 Oct 2024 00:56:41 +0000
Received: by outflank-mailman (input) for mailman id 822980;
 Mon, 21 Oct 2024 00:56:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gZz-000738-Uj
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:47:27 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a69954d-8f46-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:47:27 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471592962507.4627630240867;
 Sun, 20 Oct 2024 17:46:32 -0700 (PDT)
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
X-Inumbo-ID: 0a69954d-8f46-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471594; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mK3dy+ROetQibWDQkE2abbPJkr6Vvawn07z/3r4l9R6/eOQdmUtCtmVcoAp/UHYYPRI/J2a+LyrVZqkBsuABYmjX67AwkCKsJi6uXyiOwVlLhRNHz4sfIMts+nwJM8XJvoVRYziFGeR5u1s9pdIpQ2k/npu8kkFpFQbvMzkdxUE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471594; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Zg0/zrG8nOgRHoZJidNwfeDdFu4m0rBe5upUUFqNRlI=; 
	b=EdBwnOe0sw8iK8jWcyW0mtp8RxiKfJuLsSUDXW5Viny8SY8BMGO3x8LRmPf3WD69I5Xn9udTkI7JKdbmZ0QIDkrTvqptn78YawwKsta4HOEfx8G/SmtZoGvJoQj6HC1ZS9I4Wo9XNNMySd1Gb94oyHEmSgrWM9tEZ1OoSj9jBlw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471594;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Zg0/zrG8nOgRHoZJidNwfeDdFu4m0rBe5upUUFqNRlI=;
	b=Pv63iucLy2BAnqn+7M1Igu9pyL7cClzAcYZ5im4cNdjPK+wit+lVgb7o1XfducfZ
	XjOQFUN3Mxmf8Pf8SvxO3chfoAm5HMkdkceeTNWvGZcAqB6OniqO5PqH3GjZfLLLPFN
	j7bWdVFNQ4pC7pOh6+GwXgxHEjF6xpY4an0aHJBI=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 08/38] x86/boot: populate boot module for xen entry
Date: Sun, 20 Oct 2024 20:45:43 -0400
Message-Id: <20241021004613.18793-9-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Populate the start and size fields for the Xen entry when populating them in
the reserved module_t entry.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v6:
- apply correct conversion of assignment to mod_start
- rewrite commit message to reflect code change

Changes since v5:
- corrected conversion function for a missed switch from mfn to maddr/paddr
---
 xen/arch/x86/setup.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2e87aa314389..4e5d4055e7dd 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1411,8 +1411,11 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
          * respective reserve_e820_ram() invocation below. No need to
          * query efi_boot_mem_unused() here, though.
          */
-        bi->mods[xen].mod->mod_start = virt_to_mfn(_stext);
-        bi->mods[xen].mod->mod_end = __2M_rwdata_end - _stext;
+        bi->mods[xen].start = virt_to_maddr(_stext);
+        bi->mods[xen].size = __2M_rwdata_end - _stext;
+
+        bi->mods[xen].mod->mod_start = paddr_to_pfn(bi->mods[xen].start);
+        bi->mods[xen].mod->mod_end = bi->mods[xen].size;
     }
 
     bi->mods[0].headroom =
-- 
2.30.2


