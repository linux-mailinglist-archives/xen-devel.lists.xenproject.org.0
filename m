Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C1A987112
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805156.1216214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlW5-00061M-Gy; Thu, 26 Sep 2024 10:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805156.1216214; Thu, 26 Sep 2024 10:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlW5-0005zb-Db; Thu, 26 Sep 2024 10:14:33 +0000
Received: by outflank-mailman (input) for mailman id 805156;
 Thu, 26 Sep 2024 10:14:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oaHi=QY=bounce.vates.tech=bounce-md_30504962.66f53402.v1-b04c8c0a2027475f899eab81071c77c5@srs-se1.protection.inumbo.net>)
 id 1stlW3-0005XB-MC
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:14:31 +0000
Received: from mail136-20.atl41.mandrillapp.com
 (mail136-20.atl41.mandrillapp.com [198.2.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c6acf6f-7bf0-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 12:14:29 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-20.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XDqFt5zH9zCfBkVd
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 10:14:26 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b04c8c0a2027475f899eab81071c77c5; Thu, 26 Sep 2024 10:14:26 +0000
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
X-Inumbo-ID: 1c6acf6f-7bf0-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1727345666; x=1727606166;
	bh=v3B/Sq5q797M597CcyjXUiFgMC2JpYVkeXzk/0VKvek=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=x3v/zXYLudVNeoT5epbibVp7Z2Fus60mjLrkLPV75Oa0PFzXGlULZCWx8VPaNldxW
	 zYVWwNd7tUCT+/XkmL4ZzcIu3h/FA1707PHc2FuxeF5pQZ6Li0gQMzbihgJNzjdBK3
	 lTMXKv8kMGOQj+TqjEsXyflIfGhnl+qZ7o+MdF9oEHuh3Ww7szw93udnTPYSgnOTDc
	 /9XEdAw2iXwyHnCQiwBM7iY7Ykz6n8ytxCQ2wYAJutP4MK1DZlAs3l3+U4jWKMbmO3
	 58VpPSZdruW6AITaxqt3n+fSRTvIoBjo/4FyYuaPbjeXI/f09h+YCiOpSUnLF0JDHG
	 9TTn8RkaxXLHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1727345666; x=1727606166; i=anthony.perard@vates.tech;
	bh=v3B/Sq5q797M597CcyjXUiFgMC2JpYVkeXzk/0VKvek=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IedPJ6Y5U44VdUxNbq7KszUFxT0ffqUfY+0OS9fFlGuxn2qNkfwkvD99MQd2k90d+
	 9sTUSOyYVG6MvIfss0WY6OcsYlEaiT/TIv7hjW77cuCpw7ZJYmbvjF08t1lE9DV8tO
	 dkIHnO9mhjiNTfv8rtSsumMWjA+LRFlVXGTxIdR0attY131a++BTo9Ic9fEREbHL9R
	 LU+yib404y9xuBJAIdI94QwevNH8ZFYJAEN5lUI6ccPDRN/pPoHLRHIRpleNi6Xxfu
	 lU8PeMqM+SJMOu4G3Lysfov3Kvt5PG8JJ2PeW8zP804VTXcmRB/BPp3peXUvZRoF7C
	 IvbJPQB5iJGoA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[PATCH=201/2]=20include:=20update=20Xen=20public=20headers=20io/blkif.h?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1727345665475
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, xen-devel@lists.xenproject.org
Message-Id: <20240926101334.2388-2-anthony.perard@vates.tech>
In-Reply-To: <20240926101334.2388-1-anthony.perard@vates.tech>
References: <20240926101334.2388-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b04c8c0a2027475f899eab81071c77c5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240926:md
Date: Thu, 26 Sep 2024 10:14:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 include/hw/xen/interface/io/blkif.h | 52 +++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/include/hw/xen/interface/io/blkif.h b/include/hw/xen/interface/io/blkif.h
index 22f1eef0c0..9b00d633d3 100644
--- a/include/hw/xen/interface/io/blkif.h
+++ b/include/hw/xen/interface/io/blkif.h
@@ -237,12 +237,16 @@
  * sector-size
  *      Values:         <uint32_t>
  *
- *      The logical block size, in bytes, of the underlying storage. This
- *      must be a power of two with a minimum value of 512.
+ *      The logical block size, in bytes, of the underlying storage. This must
+ *      be a power of two with a minimum value of 512.  The sector size should
+ *      only be used for request segment length and alignment.
  *
- *      NOTE: Because of implementation bugs in some frontends this must be
- *            set to 512, unless the frontend advertizes a non-zero value
- *            in its "feature-large-sector-size" xenbus node. (See below).
+ *      When exposing a device that uses a logical sector size of 4096, the
+ *      only difference xenstore wise will be that 'sector-size' (and possibly
+ *      'physical-sector-size' if supported by the backend) will be 4096, but
+ *      the 'sectors' node will still be calculated using 512 byte units.  The
+ *      sector base units in the ring requests fields will all be 512 byte
+ *      based despite the logical sector size exposed in 'sector-size'.
  *
  * physical-sector-size
  *      Values:         <uint32_t>
@@ -254,9 +258,9 @@
  * sectors
  *      Values:         <uint64_t>
  *
- *      The size of the backend device, expressed in units of "sector-size".
- *      The product of "sector-size" and "sectors" must also be an integer
- *      multiple of "physical-sector-size", if that node is present.
+ *      The size of the backend device, expressed in units of 512b.  The
+ *      product of "sectors" * 512 must also be an integer multiple of
+ *      "physical-sector-size", if that node is present.
  *
  *****************************************************************************
  *                            Frontend XenBus Nodes
@@ -338,6 +342,7 @@
  * feature-large-sector-size
  *      Values:         0/1 (boolean)
  *      Default Value:  0
+ *      Notes:          DEPRECATED, 12
  *
  *      A value of "1" indicates that the frontend will correctly supply and
  *      interpret all sector-based quantities in terms of the "sector-size"
@@ -411,6 +416,11 @@
  *(10) The discard-secure property may be present and will be set to 1 if the
  *     backing device supports secure discard.
  *(11) Only used by Linux and NetBSD.
+ *(12) Possibly only ever implemented by the QEMU Qdisk backend and the Windows
+ *     PV block frontend.  Other backends and frontends supported 'sector-size'
+ *     values greater than 512 before such feature was added.  Frontends should
+ *     not expose this node, neither should backends make any decisions based
+ *     on it being exposed by the frontend.
  */
 
 /*
@@ -619,11 +629,14 @@
 #define BLKIF_MAX_INDIRECT_PAGES_PER_REQUEST 8
 
 /*
- * NB. 'first_sect' and 'last_sect' in blkif_request_segment, as well as
- * 'sector_number' in blkif_request, blkif_request_discard and
- * blkif_request_indirect are sector-based quantities. See the description
- * of the "feature-large-sector-size" frontend xenbus node above for
- * more information.
+ * NB. 'first_sect' and 'last_sect' in blkif_request_segment are all in units
+ * of 512 bytes, despite the 'sector-size' xenstore node possibly having a
+ * value greater than 512.
+ *
+ * The value in 'first_sect' and 'last_sect' fields must be setup so that the
+ * resulting segment offset and size is aligned to the logical sector size
+ * reported by the 'sector-size' xenstore node, see 'Backend Device Properties'
+ * section.
  */
 struct blkif_request_segment {
     grant_ref_t gref;        /* reference to I/O buffer frame        */
@@ -634,6 +647,10 @@ struct blkif_request_segment {
 
 /*
  * Starting ring element for any I/O request.
+ *
+ * The 'sector_number' field is in units of 512b, despite the value of the
+ * 'sector-size' xenstore node.  Note however that the offset in
+ * 'sector_number' must be aligned to 'sector-size'.
  */
 struct blkif_request {
     uint8_t        operation;    /* BLKIF_OP_???                         */
@@ -648,6 +665,10 @@ typedef struct blkif_request blkif_request_t;
 /*
  * Cast to this structure when blkif_request.operation == BLKIF_OP_DISCARD
  * sizeof(struct blkif_request_discard) <= sizeof(struct blkif_request)
+ *
+ * The 'sector_number' field is in units of 512b, despite the value of the
+ * 'sector-size' xenstore node.  Note however that the offset in
+ * 'sector_number' must be aligned to 'sector-size'.
  */
 struct blkif_request_discard {
     uint8_t        operation;    /* BLKIF_OP_DISCARD                     */
@@ -660,6 +681,11 @@ struct blkif_request_discard {
 };
 typedef struct blkif_request_discard blkif_request_discard_t;
 
+/*
+ * The 'sector_number' field is in units of 512b, despite the value of the
+ * 'sector-size' xenstore node.  Note however that the offset in
+ * 'sector_number' must be aligned to 'sector-size'.
+ */
 struct blkif_request_indirect {
     uint8_t        operation;    /* BLKIF_OP_INDIRECT                    */
     uint8_t        indirect_op;  /* BLKIF_OP_{READ/WRITE}                */
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

