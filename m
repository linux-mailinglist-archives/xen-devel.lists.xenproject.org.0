Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7361A480146
	for <lists+xen-devel@lfdr.de>; Mon, 27 Dec 2021 16:57:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251997.433014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1sMS-0000aL-RE; Mon, 27 Dec 2021 15:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251997.433014; Mon, 27 Dec 2021 15:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1sMS-0000YH-Na; Mon, 27 Dec 2021 15:56:32 +0000
Received: by outflank-mailman (input) for mailman id 251997;
 Mon, 27 Dec 2021 15:27:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I4x1=RM=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1n1ruQ-0005HX-Qu
 for xen-devel@lists.xenproject.org; Mon, 27 Dec 2021 15:27:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81aab310-6729-11ec-9e60-abaf8a552007;
 Mon, 27 Dec 2021 16:27:32 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 486C6610E8;
 Mon, 27 Dec 2021 15:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A36FC36AFC;
 Mon, 27 Dec 2021 15:27:29 +0000 (UTC)
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
X-Inumbo-ID: 81aab310-6729-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1640618849;
	bh=lxj0CGnaQWsdrpP+ym0cjNUD1Q9ZWMmAFxZGfZWd1/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AZU79SCaAAErcyL3XJjB+XBBxU4dseioz5c5PvS4Lsq93aZ/IHtGX7LXjsaCirRQI
	 okJI1qxDciPro2BGBrAhjz2CoFvk74dWshQcrz//RMzaBC+CXm0RqJ/p7e9JcwpCpS
	 6GEnZ/tyJxCniKjVglKa4jpSDA+bzmHfLRbvrrVs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"xen-devel@lists.xenproject.org, Juergen Gross" <jgross@suse.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 4.4 12/17] xen/blkfront: fix bug in backported patch
Date: Mon, 27 Dec 2021 16:27:07 +0100
Message-Id: <20211227151316.349920128@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211227151315.962187770@linuxfoundation.org>
References: <20211227151315.962187770@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Juergen Gross <jgross@suse.com>

The backport of commit 8f5a695d99000fc ("xen/blkfront: don't take local
copy of a request from the ring page") to stable 4.4 kernel introduced
a bug when adding the needed blkif_ring_get_request() function, as
info->ring.req_prod_pvt was incremented twice now.

Fix that be deleting the now superfluous increments after calling that
function.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/block/xen-blkfront.c |    4 ----
 1 file changed, 4 deletions(-)

--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -493,8 +493,6 @@ static int blkif_queue_discard_req(struc
 	else
 		ring_req->u.discard.flag = 0;
 
-	info->ring.req_prod_pvt++;
-
 	/* Copy the request to the ring page. */
 	*final_ring_req = *ring_req;
 	info->shadow[id].inflight = true;
@@ -711,8 +709,6 @@ static int blkif_queue_rw_req(struct req
 	if (setup.segments)
 		kunmap_atomic(setup.segments);
 
-	info->ring.req_prod_pvt++;
-
 	/* Copy request(s) to the ring page. */
 	*final_ring_req = *ring_req;
 	info->shadow[id].inflight = true;



