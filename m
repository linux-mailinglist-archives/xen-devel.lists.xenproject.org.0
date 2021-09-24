Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF7441773B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 17:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195457.348172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmkY-00080b-IY; Fri, 24 Sep 2021 15:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195457.348172; Fri, 24 Sep 2021 15:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTmkY-0007uw-En; Fri, 24 Sep 2021 15:04:30 +0000
Received: by outflank-mailman (input) for mailman id 195457;
 Fri, 24 Sep 2021 15:04:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VJv2=OO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mTmkW-0007sb-TJ
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 15:04:28 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c592ba0-ab74-4fa4-a5ce-f1c8b8b2f7bd;
 Fri, 24 Sep 2021 15:04:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C76A11FDF0;
 Fri, 24 Sep 2021 15:04:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD9A513C0A;
 Fri, 24 Sep 2021 15:04:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aCIzKfroTWHvWwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 24 Sep 2021 15:04:26 +0000
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
X-Inumbo-ID: 4c592ba0-ab74-4fa4-a5ce-f1c8b8b2f7bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632495866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W/uBl5hwPg6EF4w9vueW8esS9XeIP9DMgCbyFhO8PuM=;
	b=URdFAOWDv5ckSLDLrO9skMzBIBJMioRnDM3ijBK+eChFiEhwWphtVJIyvOw/uMeVwOFIdE
	9LjTesF+mcWF5GoEijY/ghzHaiV9MfDHypwraJqBBbHsaEeSAu4YGey/pI6ZrRm9d6WTHK
	N72wbDX9nmSQFAqVEzSjovvnu0yadrA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] include/public: add better interface description to usbif.h
Date: Fri, 24 Sep 2021 17:04:24 +0200
Message-Id: <20210924150424.10047-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210924150424.10047-1-jgross@suse.com>
References: <20210924150424.10047-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PV USB protocol is poorly described. Add a more detailed
description to the usbif.h header file.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/public/io/usbif.h | 164 ++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/xen/include/public/io/usbif.h b/xen/include/public/io/usbif.h
index fbd6f953f8..10ff2ded58 100644
--- a/xen/include/public/io/usbif.h
+++ b/xen/include/public/io/usbif.h
@@ -32,6 +32,34 @@
 #include "../grant_table.h"
 
 /*
+ * Detailed Interface Description
+ * ==============================
+ * The pvUSB interface is using a split driver design: a frontend driver in
+ * the guest and a backend driver in a driver domain (normally dom0) having
+ * access to the physical USB device(s) being passed to the guest.
+ *
+ * The frontend and backend drivers use XenStore to initiate the connection
+ * between them, the I/O activity is handled via two shared ring pages and an
+ * event channel. As the interface between frontend and backend is at the USB
+ * host connector level, multiple (up to 31) physical USB devices can be
+ * handled by a single connection.
+ *
+ * The Xen pvUSB device name is "qusb", so the frontend's XenStore entries are
+ * to be found under "device/qusb", while the backend's XenStore entries are
+ * under "backend/<guest-dom-id>/qusb".
+ *
+ * When a new pvUSB connection is established, the frontend needs to setup the
+ * two shared ring pages for communication and the event channel. The ring
+ * pages need to be made available to the backend via the grant table
+ * interface.
+ *
+ * One of the shared ring pages is used by the backend to inform the frontend
+ * about USB device plug events (device to be added or removed). This is the
+ * "conn-ring".
+ *
+ * The other ring page is used for USB I/O communication (requests and
+ * responses). This is the "urb-ring".
+ *
  * Feature and Parameter Negotiation
  * =================================
  * The two halves of a Xen pvUSB driver utilize nodes within the XenStore to
@@ -99,6 +127,142 @@
  *      The machine ABI rules governing the format of all ring request and
  *      response structures.
  *
+ * Protocol Description
+ * ====================
+ *
+ *-------------------------- USB device plug events --------------------------
+ *
+ * USB device plug events are send via the "conn-ring" shared page. As only
+ * events are being sent, the respective requests from the frontend to the
+ * backend are just dummy ones.
+ * The events sent to the frontend have the following layout:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |               id                |    portnum     |     speed      | 4
+ * +----------------+----------------+----------------+----------------+
+ *   id - uint16_t, event id (taken from the actual frontend dummy request)
+ *   portnum - uint8_t, port number (1 ... 31)
+ *   speed - uint8_t, device USBIF_SPEED_*, USBIF_SPEED_NONE == unplug
+ *
+ * The dummy request:
+ *         0                1        octet
+ * +----------------+----------------+
+ * |               id                | 2
+ * +----------------+----------------+
+ *   id - uint16_t, guest supplied value (no need for being unique)
+ *
+ *-------------------------- USB I/O request ---------------------------------
+ *
+ * A single USB I/O request on the "urb-ring" has the following layout:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |               id                |         nr_buffer_segs          | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                               pipe                                | 8
+ * +----------------+----------------+----------------+----------------+
+ * |         transfer_flags          |          buffer_length          | 12
+ * +----------------+----------------+----------------+----------------+
+ * |                       request type specific                       | 16
+ * |                               data                                | 20
+ * +----------------+----------------+----------------+----------------+
+ * |                              seg[0]                               | 24
+ * |                               data                                | 28
+ * +----------------+----------------+----------------+----------------+
+ * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
+ * +----------------+----------------+----------------+----------------+
+ * |             seg[USBIF_MAX_SEGMENTS_PER_REQUEST - 1]               | 144
+ * |                               data                                | 148
+ * +----------------+----------------+----------------+----------------+
+ * Bit field bit number 0 is always least significant bit, undefined bits must
+ * be zero.
+ *   id - uint16_t, guest supplied value
+ *   nr_buffer_segs - uint16_t, number of segment entries in seg[] array
+ *   pipe - uint32_t, bit field with multiple information:
+ *     bits 0-4: port request to send to
+ *     bit 5: unlink request with specified id (cancel I/O) if set (see below)
+ *     bit 7: direction (1 = read from device)
+ *     bits 8-14: device number on port
+ *     bits 15-18: endpoint of device
+ *     bits 30-31: request type: 00 = isochronous, 01 = interrupt,
+ *                               10 = control, 11 = bulk
+ *   transfer_flags - uint16_t, bit field with processing flags:
+ *     bit 0: less data than specified allowed
+ *   buffer_length - uint16_t, total length of data
+ *   request type specific data - 8 bytes, see below
+ *   seg[] - array with 8 byte elements, see below
+ *
+ * Request type specific data for isochronous request:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |            interval             |           start_frame           | 4
+ * +----------------+----------------+----------------+----------------+
+ * |       number_of_packets         |       nr_frame_desc_segs        | 8
+ * +----------------+----------------+----------------+----------------+
+ *   interval - uint16_t, time interval in msecs between frames
+ *   start_frame - uint16_t, start frame number
+ *   number_of_packets - uint16_t, number of packets to transfer
+ *   nr_frame_desc_segs - uint16_t number of seg[] frame descriptors elements
+ *
+ * Request type specific data for interrupt request:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |            interval             |                0                | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                                 0                                 | 8
+ * +----------------+----------------+----------------+----------------+
+ *   interval - uint16_t, time in msecs until interruption
+ *
+ * Request type specific data for control request:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |                      data of setup packet                         | 4
+ * |                                                                   | 8
+ * +----------------+----------------+----------------+----------------+
+ *
+ * Request type specific data for bulk request:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |                                 0                                 | 4
+ * |                                 0                                 | 8
+ * +----------------+----------------+----------------+----------------+
+ *
+ * Request type specific data for unlink request:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |           unlink_id             |                0                | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                                 0                                 | 8
+ * +----------------+----------------+----------------+----------------+
+ *   unlink_id - uint16_t, request id of request to terminate
+ *
+ * seg[] array element layout:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |                               gref                                | 4
+ * +----------------+----------------+----------------+----------------+
+ * |             offset              |             length              | 8
+ * +----------------+----------------+----------------+----------------+
+ *   gref - uint32_t, grant reference of buffer page
+ *   offset - uint16_t, offset of buffer start in page
+ *   length - uint16_t, length of buffer in page
+ *
+ *-------------------------- USB I/O response --------------------------------
+ *
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |               id                |          start_frame            | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                              status                               | 8
+ * +----------------+----------------+----------------+----------------+
+ * |                          actual_length                            | 12
+ * +----------------+----------------+----------------+----------------+
+ * |                           error_count                             | 16
+ * +----------------+----------------+----------------+----------------+
+ *   id - uint16_t, id of the request this response belongs to
+ *   start_frame - uint16_t, start_frame this response (iso requests only)
+ *   status - int32_t, USBIF_STATUS_* (non-iso requests)
+ *   actual_length - uint32_t, actual size of data transferred
+ *   error_count - uint32_t, number of errors (iso requests)
  */
 
 enum usb_spec_version {
-- 
2.26.2


