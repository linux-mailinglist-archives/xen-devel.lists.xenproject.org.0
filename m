Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FAA322EB2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 17:27:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88898.167303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEaVz-0007fr-Vy; Tue, 23 Feb 2021 16:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88898.167303; Tue, 23 Feb 2021 16:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEaVz-0007fS-Sr; Tue, 23 Feb 2021 16:26:23 +0000
Received: by outflank-mailman (input) for mailman id 88898;
 Tue, 23 Feb 2021 16:26:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEaVy-0007fN-HY
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 16:26:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa8f8c93-3b77-4624-979d-c1926e38649e;
 Tue, 23 Feb 2021 16:26:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD749AC1D;
 Tue, 23 Feb 2021 16:26:20 +0000 (UTC)
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
X-Inumbo-ID: fa8f8c93-3b77-4624-979d-c1926e38649e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614097580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x8GTAvdmsyH+Pp0li/Vl3nOFzMKqCxBpQieMBY2N7/I=;
	b=A3SeXkLY1ANJcd40RWOUEDSk5mVdQ/bqXEvEmj8fAiYJcjYb/+L1HHL5J0WIczye/ltXIE
	WLSdk3KA4BqILQ31VrDh0VEDeEd8U5tiqvX1OSqGA40EzolPcB9ml6sOwf6fPkVJCo0GVo
	+Iu9NQqEJj3Aj0NwxicDKckdYmiKj60=
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen-front-pgdir-shbuf: don't record wrong grant handle upon
 error
Message-ID: <82414b0f-1b63-5509-7c1d-5bcc8239a3de@suse.com>
Date: Tue, 23 Feb 2021 17:26:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In order for subsequent unmapping to not mistakenly unmap handle 0,
record a perceived always-invalid one instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v2: Use INVALID_GRANT_HANDLE.

--- a/drivers/xen/xen-front-pgdir-shbuf.c
+++ b/drivers/xen/xen-front-pgdir-shbuf.c
@@ -305,11 +305,18 @@ static int backend_map(struct xen_front_
 
 	/* Save handles even if error, so we can unmap. */
 	for (cur_page = 0; cur_page < buf->num_pages; cur_page++) {
-		buf->backend_map_handles[cur_page] = map_ops[cur_page].handle;
-		if (unlikely(map_ops[cur_page].status != GNTST_okay))
+		if (likely(map_ops[cur_page].status == GNTST_okay)) {
+			buf->backend_map_handles[cur_page] =
+				map_ops[cur_page].handle;
+		} else {
+			buf->backend_map_handles[cur_page] =
+				INVALID_GRANT_HANDLE;
+			if (!ret)
+				ret = -ENXIO;
 			dev_err(&buf->xb_dev->dev,
 				"Failed to map page %d: %d\n",
 				cur_page, map_ops[cur_page].status);
+		}
 	}
 
 	if (ret) {

