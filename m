Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2E6422626
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 14:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202184.356889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXjNN-00071h-8F; Tue, 05 Oct 2021 12:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202184.356889; Tue, 05 Oct 2021 12:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXjNN-0006ya-3u; Tue, 05 Oct 2021 12:16:53 +0000
Received: by outflank-mailman (input) for mailman id 202184;
 Tue, 05 Oct 2021 12:16:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOXf=OZ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1mXjNL-0006y6-EJ
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 12:16:51 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1dddb831-25d6-11ec-bedc-12813bfff9fa;
 Tue, 05 Oct 2021 12:16:49 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-fIbnxzTSOKeOo2Y7cHkiOw-1; Tue, 05 Oct 2021 08:16:46 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A66F1084683;
 Tue,  5 Oct 2021 12:16:44 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22A421F436;
 Tue,  5 Oct 2021 12:16:12 +0000 (UTC)
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
X-Inumbo-ID: 1dddb831-25d6-11ec-bedc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633436209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eNI9g9wwmQcdN9iXnExKxfHZe2dTuiVg+oq/PzETzdk=;
	b=Cp+tOj5SlUt0HQawQjRz6V3qiG5vhuZV2h3jHUP7b5h/s2JlOW62RGb/CsDxZSCERQ7GZ8
	s2E5nSxVSVHuBxe0zWuYZtApenEeSsj/c3tDOYTZURxCGzyv0cA7G5StDDcLMIH9MlsBGZ
	2zJZTgS8fv5q+pi4vVs0F7TV50Pz+7g=
X-MC-Unique: fIbnxzTSOKeOo2Y7cHkiOw-1
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
Subject: [PATCH v2 3/9] x86/xen: print a warning when HVMOP_get_mem_type fails
Date: Tue,  5 Oct 2021 14:14:24 +0200
Message-Id: <20211005121430.30136-4-david@redhat.com>
In-Reply-To: <20211005121430.30136-1-david@redhat.com>
References: <20211005121430.30136-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

HVMOP_get_mem_type is not expected to fail, "This call failing is
indication of something going quite wrong and it would be good to know
about this." [1]

Let's add a pr_warn_once().

[1] https://lkml.kernel.org/r/3b935aa0-6d85-0bcd-100e-15098add3c4c@oracle.com

Suggested-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/xen/mmu_hvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/mmu_hvm.c b/arch/x86/xen/mmu_hvm.c
index d1b38c77352b..6ba8826dcdcc 100644
--- a/arch/x86/xen/mmu_hvm.c
+++ b/arch/x86/xen/mmu_hvm.c
@@ -22,8 +22,10 @@ static int xen_oldmem_pfn_is_ram(unsigned long pfn)
 		.pfn = pfn,
 	};
 
-	if (HYPERVISOR_hvm_op(HVMOP_get_mem_type, &a))
+	if (HYPERVISOR_hvm_op(HVMOP_get_mem_type, &a)) {
+		pr_warn_once("Unexpected HVMOP_get_mem_type failure\n");
 		return -ENXIO;
+	}
 	return a.mem_type != HVMMEM_mmio_dm;
 }
 #endif
-- 
2.31.1


