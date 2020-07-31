Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EF9234243
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 11:19:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1RC4-0000Xo-0f; Fri, 31 Jul 2020 09:19:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XNXZ=BK=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1k1RC2-0000Wj-PZ
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 09:19:10 +0000
X-Inumbo-ID: e1ba0b76-d30e-11ea-ab95-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e1ba0b76-d30e-11ea-ab95-12813bfff9fa;
 Fri, 31 Jul 2020 09:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596187145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WXo92L6xzVp7lbkKaGhQOH5PjMjS2UMyqhJq+SqZmjU=;
 b=eKz2GmRzt71ZPjgS2zsWodplxYWV8Uzf3VNCS/zSN/Ixo1Sf06HXasBEzxNvRSR6NI5iBj
 tYpCPWqZft+a7ljcRaO0FmaQrcFBIvLYbJPkPOnFrHjoTJSgq6YOthrjZn2m2ZFGiSD1FH
 TBP6Q25KFwaqg7pQ276qpbNqxVmDjLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-Vj_nV24LO0GNaNZsmopdDQ-1; Fri, 31 Jul 2020 05:19:01 -0400
X-MC-Unique: Vj_nV24LO0GNaNZsmopdDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A93C718C63C0;
 Fri, 31 Jul 2020 09:18:59 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-22.ams2.redhat.com [10.36.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39C481A835;
 Fri, 31 Jul 2020 09:18:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFCv1 4/5] xen/balloon: try to merge "System RAM" resources
Date: Fri, 31 Jul 2020 11:18:37 +0200
Message-Id: <20200731091838.7490-5-david@redhat.com>
In-Reply-To: <20200731091838.7490-1-david@redhat.com>
References: <20200731091838.7490-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, Julien Grall <julien@xen.org>,
 David Hildenbrand <david@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Let's reuse the new mechanism to merge "System RAM" resources below the
root. We are the only one hotplugging "System RAM" and DIMMs don't apply,
so this is safe to use.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Julien Grall <julien@xen.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/xen/balloon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 77c57568e5d7f..644ae2e3798e2 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -353,6 +353,10 @@ static enum bp_state reserve_additional_memory(void)
 	if (rc) {
 		pr_warn("Cannot add additional memory (%i)\n", rc);
 		goto err;
+	} else {
+		resource = NULL;
+		/* Try to reduce the number of "System RAM" resources. */
+		merge_child_mem_resources(&iomem_resource, "System RAM");
 	}
 
 	balloon_stats.total_pages += balloon_hotplug;
-- 
2.26.2


