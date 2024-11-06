Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580199BE1AF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 10:06:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830620.1245686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8bys-0002F0-W3; Wed, 06 Nov 2024 09:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830620.1245686; Wed, 06 Nov 2024 09:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8bys-0002D0-SA; Wed, 06 Nov 2024 09:05:38 +0000
Received: by outflank-mailman (input) for mailman id 830620;
 Wed, 06 Nov 2024 09:05:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w0tz=SB=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1t8byr-0001yg-G3
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 09:05:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 473a7ece-9c1e-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 10:05:33 +0100 (CET)
Received: from truciolo.bugseng.com (unknown [78.210.84.32])
 by support.bugseng.com (Postfix) with ESMTPSA id A75A04EE0757;
 Wed,  6 Nov 2024 10:05:31 +0100 (CET)
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
X-Inumbo-ID: 473a7ece-9c1e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQ3M2E3ZWNlLTljMWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODgzOTMzLjI5ODU2NSwic2VuZGVyIjoiZmVkZXJpY28uc2VyYWZpbmlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1730883932; bh=NK6/l84ndfnWAGmtP6OHIKeJ23lpGjO2dcrBNpNvUxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z99WuS2+UF6fyFzN31Z0VD+zX8Yr2veiL0kO+rtCMMubiWPiLRRDlBCeiibM3v3pD
	 VzNYMfrUD71UOiicw1lx/b341KW4ECEoV21alKN3ERrW4vwPRqUr5GCuyQ2nBaErTj
	 8fSJPcHUaC0wDCfjqRiqju+p5VqhuBCXo/idZ6OPJUaoO++iv8+45S52xi3rynj4dN
	 LuE8CDXO2P4Bl8KikJZHfQa1W+cNQIiC1BbSXf4WJy0DRZV5KclPvAH9mYcQksKFdo
	 GGp/f2UMQDbe1b8Vz/RQbRC2gnRb/KTELsnDlEzEGup95oK/TcF1lzpMnVcOgJA0Hj
	 gvcgJiytRRwSQ==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/3] x86/emul: define pseudo keyword fallthrough
Date: Wed,  6 Nov 2024 10:04:45 +0100
Message-ID: <a0341b50ece1ba1b5b346b54db7d2abdc150cb95.1730880832.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730880832.git.federico.serafini@bugseng.com>
References: <cover.1730880832.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pseudo keyword fallthrough shall be used to make explicit the
fallthrough intention at the end of a case statement (doing this
through comments is deprecated).

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/x86_emulate/x86_emulate.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index d75658eba0..f49b1e0dd8 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -23,6 +23,16 @@
 # error Unknown compilation width
 #endif
 
+/*
+ * Pseudo keyword 'fallthrough' to make explicit the fallthrough intention at
+ * the end of a case statement.
+ */
+#if (!defined(__clang__) && (__GNUC__ >= 7))
+# define fallthrough        __attribute__((__fallthrough__))
+#else
+# define fallthrough        do {} while (0)  /* fallthrough */
+#endif
+
 struct x86_emulate_ctxt;
 
 /*
-- 
2.43.0


