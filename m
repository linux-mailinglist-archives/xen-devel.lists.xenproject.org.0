Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18530422620
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 14:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202175.356878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXjMn-0006M1-UI; Tue, 05 Oct 2021 12:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202175.356878; Tue, 05 Oct 2021 12:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXjMn-0006J0-Q7; Tue, 05 Oct 2021 12:16:17 +0000
Received: by outflank-mailman (input) for mailman id 202175;
 Tue, 05 Oct 2021 12:16:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOXf=OZ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1mXjMm-0006HZ-VO
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 12:16:16 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1344e3a7-3d6d-467e-b626-32e0603a39e0;
 Tue, 05 Oct 2021 12:16:16 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-B14qeA0YO_ehUZiZU6OrOQ-1; Tue, 05 Oct 2021 08:16:15 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC5411006AA2;
 Tue,  5 Oct 2021 12:16:12 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E602A1F6;
 Tue,  5 Oct 2021 12:15:44 +0000 (UTC)
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
X-Inumbo-ID: 1344e3a7-3d6d-467e-b626-32e0603a39e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633436176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/50e74I6mK0ds4X9rX72a/33EthQOH3jN2qPda+wXk=;
	b=WhIY/ADUaAxjlpq6UbqCLTBis1bEuupekqkuieq++DcAJthI1VQjizdvC44zHWOVgGeZ+s
	LHUEsyHmOOCiDZMdy2XFhvi9oHJRgbfprtbjl/PBQftdpcafx99ZICankCPU+S8yV3kflp
	2Qjdd5P2ErkHr8jLvR+ZICJEggRh0HQ=
X-MC-Unique: B14qeA0YO_ehUZiZU6OrOQ-1
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
Subject: [PATCH v2 2/9] x86/xen: simplify xen_oldmem_pfn_is_ram()
Date: Tue,  5 Oct 2021 14:14:23 +0200
Message-Id: <20211005121430.30136-3-david@redhat.com>
In-Reply-To: <20211005121430.30136-1-david@redhat.com>
References: <20211005121430.30136-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

Let's simplify return handling.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/xen/mmu_hvm.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/x86/xen/mmu_hvm.c b/arch/x86/xen/mmu_hvm.c
index b242d1f4b426..d1b38c77352b 100644
--- a/arch/x86/xen/mmu_hvm.c
+++ b/arch/x86/xen/mmu_hvm.c
@@ -21,23 +21,10 @@ static int xen_oldmem_pfn_is_ram(unsigned long pfn)
 		.domid = DOMID_SELF,
 		.pfn = pfn,
 	};
-	int ram;
 
 	if (HYPERVISOR_hvm_op(HVMOP_get_mem_type, &a))
 		return -ENXIO;
-
-	switch (a.mem_type) {
-	case HVMMEM_mmio_dm:
-		ram = 0;
-		break;
-	case HVMMEM_ram_rw:
-	case HVMMEM_ram_ro:
-	default:
-		ram = 1;
-		break;
-	}
-
-	return ram;
+	return a.mem_type != HVMMEM_mmio_dm;
 }
 #endif
 
-- 
2.31.1


