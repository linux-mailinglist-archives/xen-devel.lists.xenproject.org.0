Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC7D7E1E8C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 11:40:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627878.978748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzx1h-0001CX-0W; Mon, 06 Nov 2023 10:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627878.978748; Mon, 06 Nov 2023 10:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzx1g-00016R-Rq; Mon, 06 Nov 2023 10:40:12 +0000
Received: by outflank-mailman (input) for mailman id 627878;
 Mon, 06 Nov 2023 10:40:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHvK=GT=casper.srs.infradead.org=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qzx1d-00010q-16
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 10:40:11 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9d0841d-7c90-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 11:40:07 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qzx1P-005R1i-Rt; Mon, 06 Nov 2023 10:39:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1qzx1Q-000qGH-0X; Mon, 06 Nov 2023 10:39:56 +0000
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
X-Inumbo-ID: d9d0841d-7c90-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=oTzSlnwFiwNNyo9+XLJSozlV3tES1c1DD/ZmREeHw24=; b=AFLH666BhTE9iLsKwkcxfjYYVk
	EK1GRnKx1eeQSIv4t+AlzQ51FcOiV4PCFI+D9tzyDeaMe6dga8PYsEugIJlk8ThSR6cXwK2AKXIxM
	vYAXj7UM09WBHcehjYNl+F4q/IdDbIauXkudVIoN/MgOzhWFA+Pyh9VobKDkjCaBQ0r3+ac+bZ7f4
	vjf/MzboSSR81s4957qqdvrSVWv9ufNI6hAQ3y8jvHLmnO/b1ZYN4vlIQa8/WUDuCtsOyPoL13Siu
	1oguA+OYtjBq95Y5Tnq77a8QjdpITiik2VpWIa7KX8H7aNQBgSFdL60drlP/vZ+JFZUNtSuxNPsF8
	R+CngbmA==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	kvm@vger.kernel.org
Subject: [PULL 6/7] hw/xen: take iothread mutex in xen_evtchn_reset_op()
Date: Mon,  6 Nov 2023 10:39:54 +0000
Message-ID: <20231106103955.200867-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106103955.200867-1-dwmw2@infradead.org>
References: <20231106103955.200867-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The xen_evtchn_soft_reset() function requires the iothread mutex, but is
also called for the EVTCHNOP_reset hypercall. Ensure the mutex is taken
in that case.

Cc: qemu-stable@nongnu.org
Fixes: a15b10978fe6 ("hw/xen: Implement EVTCHNOP_reset")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
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
2.41.0


