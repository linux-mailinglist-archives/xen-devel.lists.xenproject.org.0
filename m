Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEE379E6FC
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 13:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601226.937197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgOCc-00036d-JD; Wed, 13 Sep 2023 11:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601226.937197; Wed, 13 Sep 2023 11:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgOCc-00033j-Fd; Wed, 13 Sep 2023 11:38:38 +0000
Received: by outflank-mailman (input) for mailman id 601226;
 Wed, 13 Sep 2023 11:38:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xOkN=E5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qgOCb-0002ka-2s
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 11:38:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1378d01e-522a-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 13:38:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 50BCD218E3;
 Wed, 13 Sep 2023 11:38:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 223A113582;
 Wed, 13 Sep 2023 11:38:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0PoHBzyfAWVoCwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 13 Sep 2023 11:38:36 +0000
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
X-Inumbo-ID: 1378d01e-522a-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1694605116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dVPKyjPuFRiMX6H05C4yegFljVDNBdmN4FRlJrZXtC8=;
	b=DlBJopdppVqDlPo0820IN+B0NKE4azUrDiJXIdKEpL7OlV6MYr3nHi2QMsbkX4If5GTMSw
	NvGizRK0K/HmNwxhO3Ur6reeYkbMTx8gOR9zz1u+xaGJmgkuGNayQN6qLQvBTG8SUtXD26
	hVytxMzRpTNnAk+YIeojWOkv2IacXs8=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/3] arm/xen: remove lazy mode related definitions
Date: Wed, 13 Sep 2023 13:38:26 +0200
Message-Id: <20230913113828.18421-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230913113828.18421-1-jgross@suse.com>
References: <20230913113828.18421-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

include/xen/arm/hypervisor.h contains definitions related to paravirt
lazy mode, which are used nowhere in the code.

All paravirt lazy mode related users are in x86 code, so remove the
definitions on Arm side.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/xen/arm/hypervisor.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/xen/arm/hypervisor.h b/include/xen/arm/hypervisor.h
index 43ef24dd030e..9995695204f5 100644
--- a/include/xen/arm/hypervisor.h
+++ b/include/xen/arm/hypervisor.h
@@ -7,18 +7,6 @@
 extern struct shared_info *HYPERVISOR_shared_info;
 extern struct start_info *xen_start_info;
 
-/* Lazy mode for batching updates / context switch */
-enum paravirt_lazy_mode {
-	PARAVIRT_LAZY_NONE,
-	PARAVIRT_LAZY_MMU,
-	PARAVIRT_LAZY_CPU,
-};
-
-static inline enum paravirt_lazy_mode paravirt_get_lazy_mode(void)
-{
-	return PARAVIRT_LAZY_NONE;
-}
-
 #ifdef CONFIG_XEN
 void __init xen_early_init(void);
 #else
-- 
2.35.3


