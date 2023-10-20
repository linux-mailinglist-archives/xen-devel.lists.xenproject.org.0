Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD067D13D2
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 18:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619875.965683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtsA7-000520-T0; Fri, 20 Oct 2023 16:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619875.965683; Fri, 20 Oct 2023 16:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtsA7-0004zH-P6; Fri, 20 Oct 2023 16:15:47 +0000
Received: by outflank-mailman (input) for mailman id 619875;
 Fri, 20 Oct 2023 16:15:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hgHW=GC=desiato.srs.infradead.org=BATV+0337522d548a1f056a92+7362+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qtsA5-0004Db-RF
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 16:15:46 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb95f86c-6f63-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 18:15:44 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qts9v-00BAsE-0Q; Fri, 20 Oct 2023 16:15:36 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qts9s-001UOW-0m; Fri, 20 Oct 2023 17:15:32 +0100
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
X-Inumbo-ID: eb95f86c-6f63-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=OW6M6axVm5EebrjONkYC4l2vPrYg1mjhksi3LsyyGRs=; b=EMC1XQKNq6loHyWtwUrjbzwmwV
	cAgfQRMd4tmkJ8vfgqiDsAHkfDsIEKFYNphoGgZltm07MeMmeMyO41dK4BLYlKHBUnL8cqRNJUffv
	zVUHHvzr6M4MMJHsTleqmotIfBWN5RE5+FHp2NiKmK8ql6L7KcoxAfQIzazUnV+8qIv//5YmJyAH9
	OxkBx/FtKdKWlxLO5fHYVYMBiLVYGrhC5A2L6h+uGalAtARfBXqSpuBlQovufA2ZACvU44sInMHHX
	saBDt/gndB0Jsk/Udp6oA3ydy0qG4OQ/poadbKKrrsFCSauxFUH/o6H3FX9ha6MDCtAaqPZVCLSsN
	QtrjJRcw==;
From: David Woodhouse <dwmw2@infradead.org>
To: Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dawei Li <set_pte_at@outlook.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 1/3] hvc/xen: fix event channel handling for secondary consoles
Date: Fri, 20 Oct 2023 17:15:27 +0100
Message-Id: <20231020161529.355083-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231020161529.355083-1-dwmw2@infradead.org>
References: <20231020161529.355083-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The xencons_connect_backend() function allocates a local interdomain
event channel with xenbus_alloc_evtchn(), then calls
bind_interdomain_evtchn_to_irq_lateeoi() to bind to that port# on the
*remote* domain.

That doesn't work very well:

(qemu) device_add xen-console,id=con1,chardev=pty0
[   44.323872] xenconsole console-1: 2 xenbus_dev_probe on device/console/1
[   44.323995] xenconsole: probe of console-1 failed with error -2

Fix it to use bind_evtchn_to_irq_lateeoi(), which does the right thing
by just binding that *local* event channel to an irq. The backend will
do the interdomain binding.

This didn't affect the primary console because the setup for that is
special — the toolstack allocates the guest event channel and the guest
discovers it with HVMOP_get_param.

Fixes: fe415186b4 ("xen/console: harden hvc_xen against event channel storms")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Juergen Gross <jgross@suse.com>
Cc: stable@vger.kernel.org
---
 drivers/tty/hvc/hvc_xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 98764e740c07..f24e285b6441 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -433,7 +433,7 @@ static int xencons_connect_backend(struct xenbus_device *dev,
 	if (ret)
 		return ret;
 	info->evtchn = evtchn;
-	irq = bind_interdomain_evtchn_to_irq_lateeoi(dev, evtchn);
+	irq = bind_evtchn_to_irq_lateeoi(evtchn);
 	if (irq < 0)
 		return irq;
 	info->irq = irq;
-- 
2.40.1


