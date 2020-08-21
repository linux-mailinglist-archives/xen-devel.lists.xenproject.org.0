Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF3624D28B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 12:35:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k94OE-0000eW-S7; Fri, 21 Aug 2020 10:35:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=82Ct=B7=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1k94OC-0000do-R7
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 10:35:16 +0000
X-Inumbo-ID: 87800420-2e38-46e1-a254-1baa901fe22f
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 87800420-2e38-46e1-a254-1baa901fe22f;
 Fri, 21 Aug 2020 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598006116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKy/5qBO5o//LYJ+b8xL+LjmCbIRLl1gm4kTDHiwBRU=;
 b=X9QaBfV9UtkGKENQvWpDhiboujweGYZTE92dUhMcI/ow+4kw4SKTEvUD4+lG+ZRU3RVQBE
 uHaq9/jM2temy7+sp2JRu3w4AFeaqLl8quzrEOlKuQEkw6EXpR4KUYAdlSxEcWIRqnr3zF
 6wIzfzwAtpBRoxJtUHL4bW9Ha0CwYbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-2VGBU1yXNXyePjxSO5BEig-1; Fri, 21 Aug 2020 06:35:12 -0400
X-MC-Unique: 2VGBU1yXNXyePjxSO5BEig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 002AE80733A;
 Fri, 21 Aug 2020 10:35:10 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9887C756DD;
 Fri, 21 Aug 2020 10:35:04 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Baoquan He <bhe@redhat.com>, Wei Yang <richardw.yang@linux.intel.com>
Subject: [PATCH v1 4/5] xen/balloon: try to merge system ram resources
Date: Fri, 21 Aug 2020 12:34:30 +0200
Message-Id: <20200821103431.13481-5-david@redhat.com>
In-Reply-To: <20200821103431.13481-1-david@redhat.com>
References: <20200821103431.13481-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Let's reuse the new mechanism to merge system ram resources below the
root. We are the only one hotplugging system ram (e.g., DIMMs don't apply),
so this is safe to be used.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Julien Grall <julien@xen.org>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/xen/balloon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 37ffccda8bb87..5ec73f752b8a7 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -338,6 +338,10 @@ static enum bp_state reserve_additional_memory(void)
 	if (rc) {
 		pr_warn("Cannot add additional memory (%i)\n", rc);
 		goto err;
+	} else {
+		resource = NULL;
+		/* Try to reduce the number of system ram resources. */
+		merge_system_ram_resources(&iomem_resource);
 	}
 
 	balloon_stats.total_pages += balloon_hotplug;
-- 
2.26.2


