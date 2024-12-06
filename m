Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F2B9E6664
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849411.1264038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQ9x-00057e-Ub; Fri, 06 Dec 2024 04:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849411.1264038; Fri, 06 Dec 2024 04:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQ9x-00050h-MG; Fri, 06 Dec 2024 04:41:45 +0000
Received: by outflank-mailman (input) for mailman id 849411;
 Fri, 06 Dec 2024 04:41:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9u-0004Kb-VS
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:42 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6197751f-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:39 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 52687A43EE1;
 Fri,  6 Dec 2024 04:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC663C4CEE8;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B1075E77175;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
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
X-Inumbo-ID: 6197751f-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460097;
	bh=W3lsM6sLlkNO6zjU1lHZ+u6ONjEFm+ba+WSVSjVypa4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DzXyb2zjGR03GXUhiHI+xBOLA5fTxJrXkDBwuKdD2uykpkrZ+FUvzLyROXp6yAHfk
	 gPqgyybJkcvTsxc15htT0OAM9Ivaj/BmebKPxvPKLGBuw5VzuI279sbQhQr9OKuovx
	 38W+0IFNSQLSeABoc7GgKPl6gv8MT6rIExY03ViEQYBHm1pKL5hi5B+uO+hiZu3QOO
	 cX1pEb7BisWouEaN5ux86AiFRrq7o8+lg4NqBJSzzQ2tiIfF1x19Gy8zsSakAZCoWF
	 GNR6U8WG+cbnhR4s+kP8mpNHOUh4XGXyj3F2U0R9JFTWCPPSaL1w4VztS1mLM+17wS
	 52WTHc1B2CF7w==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:37 -0800
Subject: [PATCH v2 07/35] ppc/domain: introduce domain_has_vuart()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-7-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=728;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=t3QJZEOM8PRrx5tFAM37Q5lrsCWx/ouiwIRJrERCogM=;
 b=Miqdv195rw9t1S3j6p1XRsugjWUwQ1EFx/shKs1eSw6d+ul8/IaMuWZDk+NDDthwgf90m1sxh
 3kbUZi6bZ/2BoWa5b05lZ0tlZtXQXK10znL6NDjaUHlqXg1kvLQo1tH
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Introduce domain_has_vuart() for PPC port to be used in the console driver.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/ppc/include/asm/domain.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/ppc/include/asm/domain.h b/xen/arch/ppc/include/asm/domain.h
index 3a447272c6f28586bf0d610929adbf228579e13f..764978e6a61b9d7220ec10fe0763e3424d07d27a 100644
--- a/xen/arch/ppc/include/asm/domain.h
+++ b/xen/arch/ppc/include/asm/domain.h
@@ -10,6 +10,8 @@ struct hvm_domain
     uint64_t              params[HVM_NR_PARAMS];
 };
 
+#define domain_has_vuart(d)         false
+
 /* TODO: Implement */
 #define guest_mode(r) ({ (void)(r); BUG_ON("unimplemented"); 0; })
 

-- 
2.34.1



