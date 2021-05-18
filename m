Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C49387D28
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 18:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129431.242951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2MF-0001H7-DI; Tue, 18 May 2021 16:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129431.242951; Tue, 18 May 2021 16:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2MF-0001El-9z; Tue, 18 May 2021 16:14:11 +0000
Received: by outflank-mailman (input) for mailman id 129431;
 Tue, 18 May 2021 16:14:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lj2ME-0001CC-3m
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 16:14:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8495d333-d79c-45f0-994d-3ecf211878bc;
 Tue, 18 May 2021 16:14:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 68702ABED;
 Tue, 18 May 2021 16:14:08 +0000 (UTC)
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
X-Inumbo-ID: 8495d333-d79c-45f0-994d-3ecf211878bc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621354448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Qh/UZ1VOm2y48tyKXzASGbqQVo3psCNIRYWaNH1KbM=;
	b=BBDARNgKmSrexkj1M/FtvHzFy3OiIqf5YV/0KY1P9OL4vf2FFYZfOnZKts8XQVPRj3Otce
	xY0bwqdrovRTCwslvfcOtSo+nQYLWkXTK/i+hl1XKuOc8zaB4wqzw30jKi6MXYm9x8WpVf
	rflxrlwLXkO7fLhkuJtOnbdmAgYZBv8=
Subject: [PATCH v2 2/2] xen-pciback: reconfigure also from backend watch
 handler
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Konrad Wilk <konrad.wilk@oracle.com>
References: <38774140-871d-59a4-cf49-9cb1cc78c381@suse.com>
Message-ID: <2337cbd6-94b9-4187-9862-c03ea12e0c61@suse.com>
Date: Tue, 18 May 2021 18:14:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <38774140-871d-59a4-cf49-9cb1cc78c381@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

When multiple PCI devices get assigned to a guest right at boot, libxl
incrementally populates the backend tree. The writes for the first of
the devices trigger the backend watch. In turn xen_pcibk_setup_backend()
will set the XenBus state to Initialised, at which point no further
reconfigures would happen unless a device got hotplugged. Arrange for
reconfigure to also get triggered from the backend watch handler.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Cc: stable@vger.kernel.org
---
v2: Also move comment. Add a comment.
---
I will admit that this isn't entirely race-free (with the guest actually
attaching in parallel), but from the looks of it such a race ought to be
benign (not the least thanks to the mutex). Ideally the tool stack
wouldn't write num_devs until all devices had their information
populated. I tried doing so in libxl, but xen_pcibk_setup_backend()
calling xenbus_dev_fatal() when not being able to read that node
prohibits such an approach (or else libxl and driver changes would need
to go into use in lock-step).

I wonder why what is being watched isn't just the num_devs node. Right
now the watch triggers quite frequently without anything relevant
actually having changed (I suppose in at least some cases in response
to writes by the backend itself).

--- a/drivers/xen/xen-pciback/xenbus.c
+++ b/drivers/xen/xen-pciback/xenbus.c
@@ -359,7 +359,8 @@ out:
 	return err;
 }
 
-static int xen_pcibk_reconfigure(struct xen_pcibk_device *pdev)
+static int xen_pcibk_reconfigure(struct xen_pcibk_device *pdev,
+				 enum xenbus_state state)
 {
 	int err = 0;
 	int num_devs;
@@ -373,9 +374,7 @@ static int xen_pcibk_reconfigure(struct
 	dev_dbg(&pdev->xdev->dev, "Reconfiguring device ...\n");
 
 	mutex_lock(&pdev->dev_lock);
-	/* Make sure we only reconfigure once */
-	if (xenbus_read_driver_state(pdev->xdev->nodename) !=
-	    XenbusStateReconfiguring)
+	if (xenbus_read_driver_state(pdev->xdev->nodename) != state)
 		goto out;
 
 	err = xenbus_scanf(XBT_NIL, pdev->xdev->nodename, "num_devs", "%d",
@@ -500,6 +499,10 @@ static int xen_pcibk_reconfigure(struct
 		}
 	}
 
+	if (state != XenbusStateReconfiguring)
+		/* Make sure we only reconfigure once. */
+		goto out;
+
 	err = xenbus_switch_state(pdev->xdev, XenbusStateReconfigured);
 	if (err) {
 		xenbus_dev_fatal(pdev->xdev, err,
@@ -525,7 +528,7 @@ static void xen_pcibk_frontend_changed(s
 		break;
 
 	case XenbusStateReconfiguring:
-		xen_pcibk_reconfigure(pdev);
+		xen_pcibk_reconfigure(pdev, XenbusStateReconfiguring);
 		break;
 
 	case XenbusStateConnected:
@@ -664,6 +667,15 @@ static void xen_pcibk_be_watch(struct xe
 		xen_pcibk_setup_backend(pdev);
 		break;
 
+	case XenbusStateInitialised:
+		/*
+		 * We typically move to Initialised when the first device was
+		 * added. Hence subsequent devices getting added may need
+		 * reconfiguring.
+		 */
+		xen_pcibk_reconfigure(pdev, XenbusStateInitialised);
+		break;
+
 	default:
 		break;
 	}


