Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005667EE707
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 19:56:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634631.990092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3hW7-0002EC-84; Thu, 16 Nov 2023 18:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634631.990092; Thu, 16 Nov 2023 18:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3hW7-0002Bh-51; Thu, 16 Nov 2023 18:55:07 +0000
Received: by outflank-mailman (input) for mailman id 634631;
 Thu, 16 Nov 2023 18:55:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ywrF=G5=kernel.org=gustavoars@srs-se1.protection.inumbo.net>)
 id 1r3hW5-0002Bb-LT
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 18:55:05 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6e69c82-84b1-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 19:55:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6BC1AB81CE0;
 Thu, 16 Nov 2023 18:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBB8C433C8;
 Thu, 16 Nov 2023 18:55:01 +0000 (UTC)
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
X-Inumbo-ID: a6e69c82-84b1-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700160902;
	bh=JwQgKXdyVFHDeYy2JqIrcrbfOB3OycZsBTQgBU7qjPM=;
	h=Date:From:To:Cc:Subject:From;
	b=Q2KeOstZqpSdN4JhKTSNmJecY3BmKrmxV0TKxlDYtF5gv7UBoA9ki8l+3oU7WT0Hx
	 SGmSc3VfEncIDsy7g1gUdu/dUurdmxWoNKqVqXpNG0JIQn/9CRKtLj4EZby3gR0ebM
	 W29DzH+9f5rXc4ky/j82PuHjBZxanaXp2OXpLgfdOeYwEyc8H6InT7BIuTjYwI2twZ
	 K2Q59QirBuKsjjD1uHuCUq6Vt0CT0Ut1+Mc3R70pFEkwWmeLddoRJdAqfYUx+Un6j7
	 onTVWGPMm6W16RlorLGNo7T/80qIpz+vuwThsSHkscF6lBwIA6x+UPnUOlCQ+Gw8al
	 9yTiFS6TTIGSg==
Date: Thu, 16 Nov 2023 12:54:59 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] xen: privcmd: Replace zero-length array with
 flex-array member and use __counted_by
Message-ID: <ZVZlg3tPMPCRdteh@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fake flexible arrays (zero-length and one-element arrays) are deprecated,
and should be replaced by flexible-array members. So, replace
zero-length array with a flexible-array member in `struct
privcmd_kernel_ioreq`.

Also annotate array `ports` with `__counted_by()` to prepare for the
coming implementation by GCC and Clang of the `__counted_by` attribute.
Flexible array members annotated with `__counted_by` can have their
accesses bounds-checked at run-time via `CONFIG_UBSAN_BOUNDS` (for array
indexing) and `CONFIG_FORTIFY_SOURCE` (for strcpy/memcpy-family functions).

This fixes multiple -Warray-bounds warnings:
drivers/xen/privcmd.c:1239:30: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
drivers/xen/privcmd.c:1240:30: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
drivers/xen/privcmd.c:1241:30: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
drivers/xen/privcmd.c:1245:33: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]
drivers/xen/privcmd.c:1258:67: warning: array subscript i is outside array bounds of 'struct ioreq_port[0]' [-Warray-bounds=]

This results in no differences in binary output.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/xen/privcmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 1ce7f3c7a950..0eb337a8ec0f 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -1115,7 +1115,7 @@ struct privcmd_kernel_ioreq {
 	spinlock_t lock; /* Protects ioeventfds list */
 	struct list_head ioeventfds;
 	struct list_head list;
-	struct ioreq_port ports[0];
+	struct ioreq_port ports[] __counted_by(vcpus);
 };
 
 static irqreturn_t ioeventfd_interrupt(int irq, void *dev_id)
-- 
2.34.1


