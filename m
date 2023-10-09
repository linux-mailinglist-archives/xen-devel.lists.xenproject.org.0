Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A1F7BEA30
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 20:57:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614425.955469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpvPp-0008GL-BG; Mon, 09 Oct 2023 18:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614425.955469; Mon, 09 Oct 2023 18:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpvPp-0008Ed-8Y; Mon, 09 Oct 2023 18:55:41 +0000
Received: by outflank-mailman (input) for mailman id 614425;
 Mon, 09 Oct 2023 18:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jERe=FX=kernel.org=gustavoars@srs-se1.protection.inumbo.net>)
 id 1qpvPn-0008EX-ST
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 18:55:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d68288e-66d5-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 20:55:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CCF716131D;
 Mon,  9 Oct 2023 18:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F04BC433C7;
 Mon,  9 Oct 2023 18:55:32 +0000 (UTC)
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
X-Inumbo-ID: 6d68288e-66d5-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696877733;
	bh=GFc4Q5qaXcf/ZjZp9N+g0hF8nyG1r4y/dZRvyq8Du9A=;
	h=Date:From:To:Cc:Subject:From;
	b=E5t4oZoZGUwok3/PFxqTFm3bx+BQDZJJ+vyjeQKx5qfH3NW3T8avl6qgl+bnyUYJC
	 zO1yvhHO+sP4fFX8+Jb4cqmWJslQJwmigAelDrmyPqCA58TgriU+tkTzbfJb5SuovZ
	 jmqfndJSghzEQXm51nn5/kzyOz9T/Y1tXPAfnCjNoUTr4bTsLW0LPDmZeCVakppUDH
	 jEcJR2BKfR9ECTm+7FG2ekhXkNGfJJsXybno9Pv1LFe6AsPro4qWuKH7WRyXxsIk1O
	 o7ESnWSiQu2Nh1It7cAwnSiFhLfLU8drWQ2MQTfz+NjJJgjGI/aYtvnD6rJ7+HzeyS
	 ydCrTBcQ7J1Mg==
Date: Mon, 9 Oct 2023 12:55:30 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] xen/xenbus: Add __counted_by for struct read_buffer
 and use struct_size()
Message-ID: <ZSRMosLuJJS5Y/io@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

While there, use struct_size() helper, instead of the open-coded
version, to calculate the size for the allocation of the whole
flexible structure, including of course, the flexible-array member.

This code was found with the help of Coccinelle, and audited and
fixed manually.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/xen/xenbus/xenbus_dev_frontend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_dev_frontend.c b/drivers/xen/xenbus/xenbus_dev_frontend.c
index 0792fda49a15..6f56640092a9 100644
--- a/drivers/xen/xenbus/xenbus_dev_frontend.c
+++ b/drivers/xen/xenbus/xenbus_dev_frontend.c
@@ -82,7 +82,7 @@ struct read_buffer {
 	struct list_head list;
 	unsigned int cons;
 	unsigned int len;
-	char msg[];
+	char msg[] __counted_by(len);
 };
 
 struct xenbus_file_priv {
@@ -195,7 +195,7 @@ static int queue_reply(struct list_head *queue, const void *data, size_t len)
 	if (len > XENSTORE_PAYLOAD_MAX)
 		return -EINVAL;
 
-	rb = kmalloc(sizeof(*rb) + len, GFP_KERNEL);
+	rb = kmalloc(struct_size(rb, msg, len), GFP_KERNEL);
 	if (rb == NULL)
 		return -ENOMEM;
 
-- 
2.34.1


