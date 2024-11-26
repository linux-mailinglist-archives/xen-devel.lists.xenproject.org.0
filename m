Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D6A9D9FB2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:35:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844299.1259885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG55p-00016T-7C; Tue, 26 Nov 2024 23:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844299.1259885; Tue, 26 Nov 2024 23:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG55p-00013g-3j; Tue, 26 Nov 2024 23:35:41 +0000
Received: by outflank-mailman (input) for mailman id 844299;
 Tue, 26 Nov 2024 23:35:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sq-0000At-EH
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 402dbdde-ac4d-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 00:22:07 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7DC285C5D1E;
 Tue, 26 Nov 2024 23:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC684C4CED2;
 Tue, 26 Nov 2024 23:21:56 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A2F71D66B94;
 Tue, 26 Nov 2024 23:21:56 +0000 (UTC)
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
X-Inumbo-ID: 402dbdde-ac4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjQwMmRiZGRlLWFjNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjYzMzI3LjMxNjU4Nywic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663316;
	bh=EehkYBiOP/PXKJY+PdWeOgafO7LhWK+IAcas/cU+rxo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=brD5/9fb2xAuUirBhFjGTHQOyaRnbK6H/SN3nlnc6TLnkymQMAVupzp+jdzWRxx4u
	 ozETwS51ugRZcEeZVAmEQIrcACKEt9AD1g8IOxVtmNczRcwSFDpqiCkvikBAPttGpi
	 LwxUKCvhsbBxF913fbsCaZ+qiS98SfMOs5i4fhdxfvn4C14Hq7z40b5LO4aYS97ItQ
	 x4ax8U+EfQGHnOzEhLXzOaO8qvHjO7mYzD8MMCv2Qtj+XQ2Lzx3WMmU3puNv3+5OgW
	 GlsOZnMeAtpQqTWtVgxJvTMUf5woCC4OmtO7B4ImYvj9FZ3FOinjGMU709Itsc7mHU
	 4X9yxORAq8oew==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:09 -0800
Subject: [PATCH 19/36] xen/console: introduce printk_common()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-19-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=1598;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=ZaoWKGFunF1v2fJrLgskSFgg/fFHSsN+iDoAE6XfT9Q=;
 b=qf1Tso16MB8AZmrXNCz9umrGZGM1ODTNxpZz1C5AlhIFFZtIt51Zk7hm0IXDTzpOaQ21aT1Xy
 Bnsh8vhnpDLD2g2jthBGW9Vj4jFyK4LFbJhtEQZuruPSO9haplPlZcM
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Introduce new printk() variant for convenient printouts which skip '(XEN)'
prefix on xen console. This is needed for the case when physical console is
owned by a domain w/ in-hypervisor UART emulation enabled.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 8 ++++++++
 xen/include/xen/lib.h      | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 86bf899ada8f8221ffc77bcffb1f58777a22198e..f034ce5aab3f3bf59b0df9fa583ee9ce32dbf665 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -968,6 +968,14 @@ void printk(const char *fmt, ...)
     va_end(args);
 }
 
+void printk_common(const char *fmt, ...)
+{
+    va_list args;
+    va_start(args, fmt);
+    vprintk_common("", fmt, args);
+    va_end(args);
+}
+
 void guest_printk(const struct domain *d, const char *fmt, ...)
 {
     va_list args;
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 81b722ea3e801e9089aaf8758249feb3a758c4f7..8a7ff2e8af9089796ff28ef8d01c00e9845782ca 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -61,6 +61,9 @@ debugtrace_printk(const char *fmt, ...) {}
 extern void printk(const char *fmt, ...)
     __attribute__ ((format (printf, 1, 2), cold));
 
+extern void printk_common(const char *fmt, ...)
+    __attribute__ ((format (printf, 1, 2)));
+
 #define printk_once(fmt, args...)               \
 ({                                              \
     static bool __read_mostly once_;            \

-- 
2.34.1



