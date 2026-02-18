Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGcLI/mLlWlhSQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 10:52:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42706154E9C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 10:52:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235390.1538388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vseEG-00074t-U0; Wed, 18 Feb 2026 09:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235390.1538388; Wed, 18 Feb 2026 09:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vseEG-000731-Ps; Wed, 18 Feb 2026 09:52:20 +0000
Received: by outflank-mailman (input) for mailman id 1235390;
 Wed, 18 Feb 2026 09:52:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RtAK=AW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vseEF-0006Zz-PB
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 09:52:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8393c050-0caf-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 10:52:19 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BDB405BCC8;
 Wed, 18 Feb 2026 09:52:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 886533EA65;
 Wed, 18 Feb 2026 09:52:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eMwnINKLlWn0fQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 18 Feb 2026 09:52:18 +0000
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
X-Inumbo-ID: 8393c050-0caf-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1771408338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Us/u84SsxFMO0tl1d+eBym7mS0CVvhetUanmuDsPoqE=;
	b=C65Oht9X6FM1TbuBFE3CaVYZlsnmaR9Nss+awa/RYN8fsCAsnGCLQVIy/KV9SrI5PFePYa
	jRWpttC0vb0wu4IoTttLhb8Wxcy5Zjz7vc/rlEzvuXlqjeX3cRICn1+EL3XjiOS7X0Btnl
	NYaJKyFJOO1XXlz08F2XDfJfAgaVPUE=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1771408338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Us/u84SsxFMO0tl1d+eBym7mS0CVvhetUanmuDsPoqE=;
	b=C65Oht9X6FM1TbuBFE3CaVYZlsnmaR9Nss+awa/RYN8fsCAsnGCLQVIy/KV9SrI5PFePYa
	jRWpttC0vb0wu4IoTttLhb8Wxcy5Zjz7vc/rlEzvuXlqjeX3cRICn1+EL3XjiOS7X0Btnl
	NYaJKyFJOO1XXlz08F2XDfJfAgaVPUE=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 2/2] xen/xenbus: better handle backend crash
Date: Wed, 18 Feb 2026 10:52:05 +0100
Message-ID: <20260218095205.453657-3-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218095205.453657-1-jgross@suse.com>
References: <20260218095205.453657-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -7.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[info.dev:url,suse.com:mid,suse.com:dkim,suse.com:email,invisiblethingslab.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 42706154E9C
X-Rspamd-Action: no action

When the backend domain crashes, coordinated device cleanup is not
possible (as it involves waiting for the backend state change). In that
case, toolstack forcefully removes frontend xenstore entries.
xenbus_dev_changed() handles this case, and triggers device cleanup.
It's possible that toolstack manages to connect new device in that
place, before xenbus_dev_changed() notices the old one is missing. If
that happens, new one won't be probed and will forever remain in
XenbusStateInitialising.

Fix this by checking the frontend's state in Xenstore. In case it has
been reset to XenbusStateInitialising by Xen tools, consider this
being the result of an unplug+plug operation.

It's important that cleanup on such unplug doesn't modify Xenstore
entries (especially the "state" key) as it belong to the new device
to be probed - changing it would derail establishing connection to the
new backend (most likely, closing the device before it was even
connected). Handle this case by setting new xenbus_device->vanished
flag to true, and check it before changing state entry.

And even if xenbus_dev_changed() correctly detects the device was
forcefully removed, the cleanup handling is still racy. Since this whole
handling doesn't happened in a single Xenstore transaction, it's possible
that toolstack might put a new device there already. Avoid re-creating
the state key (which in the case of loosing the race would actually
close newly attached device).

The problem does not apply to frontend domain crash, as this case
involves coordinated cleanup.

Problem originally reported at
https://lore.kernel.org/xen-devel/aOZvivyZ9YhVWDLN@mail-itl/T/#t,
including reproduction steps.

Based-on-patch-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 drivers/xen/xenbus/xenbus_client.c | 13 +++++++++--
 drivers/xen/xenbus/xenbus_probe.c  | 36 ++++++++++++++++++++++++++++++
 include/xen/xenbus.h               |  1 +
 3 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index e502435145ae..19672b08a680 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -226,8 +226,9 @@ __xenbus_switch_state(struct xenbus_device *dev,
 	struct xenbus_transaction xbt;
 	int current_state;
 	int err, abort;
+	bool vanished = false;
 
-	if (state == dev->state)
+	if (state == dev->state || dev->vanished)
 		return 0;
 
 again:
@@ -242,6 +243,10 @@ __xenbus_switch_state(struct xenbus_device *dev,
 	err = xenbus_scanf(xbt, dev->nodename, "state", "%d", &current_state);
 	if (err != 1)
 		goto abort;
+	if (current_state != dev->state && current_state == XenbusStateInitialising) {
+		vanished = true;
+		goto abort;
+	}
 
 	err = xenbus_printf(xbt, dev->nodename, "state", "%d", state);
 	if (err) {
@@ -256,7 +261,7 @@ __xenbus_switch_state(struct xenbus_device *dev,
 		if (err == -EAGAIN && !abort)
 			goto again;
 		xenbus_switch_fatal(dev, depth, err, "ending transaction");
-	} else
+	} else if (!vanished)
 		dev->state = state;
 
 	return 0;
@@ -941,6 +946,10 @@ enum xenbus_state xenbus_read_driver_state(const struct xenbus_device *dev,
 					   const char *path)
 {
 	enum xenbus_state result;
+
+	if (dev && dev->vanished)
+		return XenbusStateUnknown;
+
 	int err = xenbus_gather(XBT_NIL, path, "state", "%d", &result, NULL);
 	if (err)
 		result = XenbusStateUnknown;
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 2eed06ba5d38..eb260eceb4d2 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -444,6 +444,9 @@ static void xenbus_cleanup_devices(const char *path, struct bus_type *bus)
 		info.dev = NULL;
 		bus_for_each_dev(bus, NULL, &info, cleanup_dev);
 		if (info.dev) {
+			dev_warn(&info.dev->dev,
+				 "device forcefully removed from xenstore\n");
+			info.dev->vanished = true;
 			device_unregister(&info.dev->dev);
 			put_device(&info.dev->dev);
 		}
@@ -659,6 +662,39 @@ void xenbus_dev_changed(const char *node, struct xen_bus_type *bus)
 		return;
 
 	dev = xenbus_device_find(root, &bus->bus);
+	/*
+	 * Backend domain crash results in not coordinated frontend removal,
+	 * without going through XenbusStateClosing. If this is a new instance
+	 * of the same device Xen tools will have reset the state to
+	 * XenbusStateInitializing.
+	 * It might be that the backend crashed early during the init phase of
+	 * device setup, in which case the known state would have been
+	 * XenbusStateInitializing. So test the backend domid to match the
+	 * saved one. In case the new backend happens to have the same domid as
+	 * the old one, we can just carry on, as there is no inconsistency
+	 * resulting in this case.
+	 */
+	if (dev && !strcmp(bus->root, "device")) {
+		enum xenbus_state state = xenbus_read_driver_state(dev, dev->nodename);
+		unsigned int backend = xenbus_read_unsigned(root, "backend-id",
+							    dev->otherend_id);
+
+		if (state == XenbusStateInitialising &&
+		    (state != dev->state || backend != dev->otherend_id)) {
+			/*
+			 * State has been reset, assume the old one vanished
+			 * and new one needs to be probed.
+			 */
+			dev_warn(&dev->dev,
+				 "state reset occurred, reconnecting\n");
+			dev->vanished = true;
+		}
+		if (dev->vanished) {
+			device_unregister(&dev->dev);
+			put_device(&dev->dev);
+			dev = NULL;
+		}
+	}
 	if (!dev)
 		xenbus_probe_node(bus, type, root);
 	else
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 15319da65b7f..8ca15743af7f 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -80,6 +80,7 @@ struct xenbus_device {
 	const char *devicetype;
 	const char *nodename;
 	const char *otherend;
+	bool vanished;
 	int otherend_id;
 	struct xenbus_watch otherend_watch;
 	struct device dev;
-- 
2.53.0


