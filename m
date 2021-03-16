Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8783633D5B4
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 15:28:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98304.186362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAf8-0007Ll-Gq; Tue, 16 Mar 2021 14:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98304.186362; Tue, 16 Mar 2021 14:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAf8-0007LO-Da; Tue, 16 Mar 2021 14:27:10 +0000
Received: by outflank-mailman (input) for mailman id 98304;
 Tue, 16 Mar 2021 14:27:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMAf6-0007LJ-UG
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 14:27:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6916d55-6b5b-4832-bef6-19585d47080c;
 Tue, 16 Mar 2021 14:27:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 502DFAC75;
 Tue, 16 Mar 2021 14:27:06 +0000 (UTC)
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
X-Inumbo-ID: f6916d55-6b5b-4832-bef6-19585d47080c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615904826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/1j9Ff2jV/b/CPFIP6stH7jt/5y0/txE3Pw0WedSKhc=;
	b=rP3yqDyTITgXnX8Gd74Tt7g0DhL67EWm/knP3vK1rChhjUqqnYEW0ZQvY7kUYJ1dv2aFNW
	i73GOIr7BRXagOfWiwCf7m/gsh2dngMP36n/UOpjPxZhxLhMzrtFT+Sws/gDqTsTJD97Jp
	YAddpBXJ2FITM/hDGZY5QRfNYllzzOE=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: libxl / xen-pciback interaction
Message-ID: <c9bf77ec-8a82-5a6e-c0eb-36e4cc373b23@suse.com>
Date: Tue, 16 Mar 2021 15:27:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All,

while trying to test a pciback fix for how SR-IOV VFs get placed in the
guest PCI topology I noticed that my test VM would only ever see the 1st
out of 3 VFs that I passed to it. As it turns out, the driver watches
its own (backend) node, and upon first receiving notification it
evaluates state found in xenstore to set up the backend device.
Subsequently it switches the device to Initialised. After this switching,
not further instances of the watch triggering would do anything.

In all instances I observed the watch event getting processed when the
"num_devs" node still reported 1. Trying to deal with this in libxl, by
delaying the writing of the "num_devs" node, led to a fatal error
("num_devs" not being available to read) in the driver, causing the
device to move to Closing state. Therefore I decided that the issue has
to be addressed in the driver, resulting in a patch (reproduced below)
that I'm not overly happy with. I think the present libxl behavior is
wrong - it shouldn't trigger driver initialization without having fully
populated the information the driver is supposed to consume for its
device initialization. The only solution that I can think of, however,
doesn't look very appealing either: Instead of putting all pieces of the
data for one device in a transaction, make a single transaction cover
all devices collectively.

Are there opinions about where to address the issue, or suggestions as
to better approaches than the ones shown / outlined?

While doing this it also occurred to me as odd how "num_devs" is
actually used: It's not really a "number of devices" indicator, but
instead a "next device has this number" one: libxl reads the present
value and increments it by one for every new device. Destroying
(hot-unplugging) of devices doesn't have any effect on the value. If
addition / removal of a device happens a number of times for a VM,
quite a few leftover, no longer used entries would accumulate afaict.
This isn't only consuming space in xenstore for no good reason, but
also means pciback has to do an increasing amount of processing every
time a reconfigure event happens.

Jan

xen-pciback: reconfigure also from backend watch handler

When multiple PCI devices get assigned to a guest right at boot, libxl
incrementally populates the backend tree. The writes for the first of
the devices trigger the backend watch. In turn xen_pcibk_setup_backend()
will set the XenBus state to Initialised, at which point no further
reconfigures would happen unless a device got hotplugged. Arrange for
reconfigure to also get triggered from the backend watch handler.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Cc: stable@vger.kernel.org
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
@@ -374,8 +375,7 @@ static int xen_pcibk_reconfigure(struct
 
 	mutex_lock(&pdev->dev_lock);
 	/* Make sure we only reconfigure once */
-	if (xenbus_read_driver_state(pdev->xdev->nodename) !=
-	    XenbusStateReconfiguring)
+	if (xenbus_read_driver_state(pdev->xdev->nodename) != state)
 		goto out;
 
 	err = xenbus_scanf(XBT_NIL, pdev->xdev->nodename, "num_devs", "%d",
@@ -500,6 +500,9 @@ static int xen_pcibk_reconfigure(struct
 		}
 	}
 
+	if (state != XenbusStateReconfiguring)
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
@@ -664,6 +667,10 @@ static void xen_pcibk_be_watch(struct xe
 		xen_pcibk_setup_backend(pdev);
 		break;
 
+	case XenbusStateInitialised:
+		xen_pcibk_reconfigure(pdev, XenbusStateInitialised);
+		break;
+
 	default:
 		break;
 	}

