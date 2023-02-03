Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C63D688C85
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 02:29:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488980.757299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNks9-0006ko-AF; Fri, 03 Feb 2023 01:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488980.757299; Fri, 03 Feb 2023 01:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNks9-0006iL-7R; Fri, 03 Feb 2023 01:28:13 +0000
Received: by outflank-mailman (input) for mailman id 488980;
 Fri, 03 Feb 2023 01:28:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CeHV=57=kernel.org=gustavoars@srs-se1.protection.inumbo.net>)
 id 1pNks6-0006iF-VT
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 01:28:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 036d70ba-a362-11ed-933c-83870f6b2ba8;
 Fri, 03 Feb 2023 02:28:09 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B0E661D41;
 Fri,  3 Feb 2023 01:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FACC433EF;
 Fri,  3 Feb 2023 01:28:05 +0000 (UTC)
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
X-Inumbo-ID: 036d70ba-a362-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675387686;
	bh=YDq9DRcIdKEp/Kugr9aBiusQ8u+FDDTKTPm1TZDr/f4=;
	h=Date:From:To:Cc:Subject:From;
	b=gvqoqpOSSNib2tlfvK8CGHUCDMHtfqmB61mU6rLB0+nAxmGZ8BWrhDDfM0G/8/mT8
	 cZ3rqvfGxy6jIdw2sV1vLbFUWMYm6y0SleW7smBAxgJdOWDs1yWrpfOECUkpRQnOAH
	 yLzOkQNAa27uTG95itmWYHH5KldEqiBj12toXdWvkYjGRPJEZpcKkUwT304JFofCLT
	 ayZ3USV8QVWPt7fMVmOfHtwotw1VEhzVEz4yoN4NXm1RSBKYQ/4/V5w3507ctN/SdZ
	 h1JaPYp69xj72VZ274xfpShjvcYtcjjUo8ILQ5FAl78Ld9M1ARS7arvgEa47b2j16W
	 FILdpib+E6imQ==
Date: Thu, 2 Feb 2023 19:28:23 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] xen: Replace one-element array with flexible-array
 member
Message-ID: <Y9xjN6Wa3VslgXeX@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

One-element arrays are deprecated, and we are replacing them with flexible
array members instead. So, replace one-element array with flexible-array
member in struct xen_page_directory.

This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
routines on memcpy() and help us make progress towards globally
enabling -fstrict-flex-arrays=3 [1].

This results in no differences in binary output.

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/255
Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/xen/xen-front-pgdir-shbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xen-front-pgdir-shbuf.c b/drivers/xen/xen-front-pgdir-shbuf.c
index 5c0b5cb5b419..b52e0fa595a9 100644
--- a/drivers/xen/xen-front-pgdir-shbuf.c
+++ b/drivers/xen/xen-front-pgdir-shbuf.c
@@ -30,7 +30,7 @@
 struct xen_page_directory {
 	grant_ref_t gref_dir_next_page;
 #define XEN_GREF_LIST_END	0
-	grant_ref_t gref[1]; /* Variable length */
+	grant_ref_t gref[]; /* Variable length */
 };
 
 /**
-- 
2.34.1


