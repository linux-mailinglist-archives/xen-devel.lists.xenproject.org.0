Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD197D6FB4
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622961.970277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfDs-0000dz-9H; Wed, 25 Oct 2023 14:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622961.970277; Wed, 25 Oct 2023 14:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfDs-0000c3-61; Wed, 25 Oct 2023 14:51:04 +0000
Received: by outflank-mailman (input) for mailman id 622961;
 Wed, 25 Oct 2023 14:51:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJSz=GH=casper.srs.infradead.org=BATV+85b1c44ac99574f3713d+7367+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvfDq-0000WU-NP
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:51:02 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e91455e0-7345-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 16:50:59 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qvfDY-009Nmf-Ta; Wed, 25 Oct 2023 14:50:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qvfDY-002dEJ-0I; Wed, 25 Oct 2023 15:50:44 +0100
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
X-Inumbo-ID: e91455e0-7345-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cMQamAmGxVX8j1TYaTFUxDpxUmOm6N6treNgi5dENCI=; b=WtDuCSvr5Q0uexpCx5QwfNxVZy
	ROoD7PbXDpLBTHv10a4sb52qOcYxP7sVaVH/NJGwCgJ77PtptHAmxIq1lmRxaLvn1/sAI4mNcVa5y
	12MBgl4J0jy+1GLBWvXaSTgc4K1BCjA/Yzihw3gyve96vcuHO9XMDH9OrxcLxgRE8veib5GQ8ptb2
	hY7TYHtsyq18aAgKXiMYIlQ+358roX1Kia+c+gpKgmAlDKQ8yBhxawYBqJm5uBrelE/kfRoCjO185
	nYGVKukjvboJ/wX9kHgvqrqfE/NVMb6HDHzCd7q1HBeO/OLNaZ1qtk3OhrwOmFOTaGnRChQkaQuje
	9y7XfXuw==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Bernhard Beschow <shentey@gmail.com>,
	Joel Upham <jupham125@gmail.com>
Subject: [PATCH v3 06/28] hw/xen: take iothread mutex in xen_evtchn_reset_op()
Date: Wed, 25 Oct 2023 15:50:20 +0100
Message-Id: <20231025145042.627381-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025145042.627381-1-dwmw2@infradead.org>
References: <20231025145042.627381-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The xen_evtchn_soft_reset() function requires the iothread mutex, but is
also called for the EVTCHNOP_reset hypercall. Ensure the mutex is taken
in that case.

Fixes: a15b10978fe6 ("hw/xen: Implement EVTCHNOP_reset")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 3d6f4b4a0a..b2b4be9983 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -1135,6 +1135,7 @@ int xen_evtchn_reset_op(struct evtchn_reset *reset)
         return -ESRCH;
     }
 
+    QEMU_IOTHREAD_LOCK_GUARD();
     return xen_evtchn_soft_reset();
 }
 
-- 
2.40.1


