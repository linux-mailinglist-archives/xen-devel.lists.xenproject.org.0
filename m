Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82F341B618
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 20:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198311.351753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHlo-00085W-T3; Tue, 28 Sep 2021 18:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198311.351753; Tue, 28 Sep 2021 18:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVHlo-00083U-Oy; Tue, 28 Sep 2021 18:24:00 +0000
Received: by outflank-mailman (input) for mailman id 198311;
 Tue, 28 Sep 2021 18:23:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jiAA=OS=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1mVHlm-0007E1-Ul
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 18:23:58 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3c09fb0f-2089-11ec-bcc4-12813bfff9fa;
 Tue, 28 Sep 2021 18:23:53 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-77qRMUygOxyTob3UgChZqw-1; Tue, 28 Sep 2021 14:23:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F21C1A40C2;
 Tue, 28 Sep 2021 18:23:49 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3200E60854;
 Tue, 28 Sep 2021 18:23:41 +0000 (UTC)
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
X-Inumbo-ID: 3c09fb0f-2089-11ec-bcc4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632853433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rRKr51/8zMLS50oc29PqKZsNRavWkybmtHfcIniBEhA=;
	b=bm0FYZtUD4yWki63YmFUxIAN8X3u/zoe3j9b6zhFlBmZP86nQaS4e2xEPzt3bna2UzDjJE
	Pi0tfURFhQr42liWzPfH0EBrhnGuD7yuUO029QhquD6zeAUMsJILhJT+KzJw9Mg7aOLZRM
	s5Tr6jRi8bmquPutYekjrJH7dVsEKTA=
X-MC-Unique: 77qRMUygOxyTob3UgChZqw-1
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	virtualization@lists.linux-foundation.org,
	kexec@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v1 3/8] proc/vmcore: let pfn_is_ram() return a bool
Date: Tue, 28 Sep 2021 20:22:53 +0200
Message-Id: <20210928182258.12451-4-david@redhat.com>
In-Reply-To: <20210928182258.12451-1-david@redhat.com>
References: <20210928182258.12451-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13

The callback should deal with errors internally, it doesn't make sense to
expose these via pfn_is_ram(). We'll rework the callbacks next. Right now
we consider errors as if "it's RAM"; no functional change.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/proc/vmcore.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/proc/vmcore.c b/fs/proc/vmcore.c
index 9a15334da208..a9bd80ab670e 100644
--- a/fs/proc/vmcore.c
+++ b/fs/proc/vmcore.c
@@ -84,11 +84,11 @@ void unregister_oldmem_pfn_is_ram(void)
 }
 EXPORT_SYMBOL_GPL(unregister_oldmem_pfn_is_ram);
 
-static int pfn_is_ram(unsigned long pfn)
+static bool pfn_is_ram(unsigned long pfn)
 {
 	int (*fn)(unsigned long pfn);
 	/* pfn is ram unless fn() checks pagetype */
-	int ret = 1;
+	bool ret = true;
 
 	/*
 	 * Ask hypervisor if the pfn is really ram.
@@ -97,7 +97,7 @@ static int pfn_is_ram(unsigned long pfn)
 	 */
 	fn = oldmem_pfn_is_ram;
 	if (fn)
-		ret = fn(pfn);
+		ret = !!fn(pfn);
 
 	return ret;
 }
@@ -124,7 +124,7 @@ ssize_t read_from_oldmem(char *buf, size_t count,
 			nr_bytes = count;
 
 		/* If pfn is not ram, return zeros for sparse dump files */
-		if (pfn_is_ram(pfn) == 0)
+		if (!pfn_is_ram(pfn))
 			memset(buf, 0, nr_bytes);
 		else {
 			if (encrypted)
-- 
2.31.1


