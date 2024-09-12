Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA0297662E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 11:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797207.1207081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soga2-0001ld-FI; Thu, 12 Sep 2024 09:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797207.1207081; Thu, 12 Sep 2024 09:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soga2-0001jx-CU; Thu, 12 Sep 2024 09:57:38 +0000
Received: by outflank-mailman (input) for mailman id 797207;
 Thu, 12 Sep 2024 09:57:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1soga1-0001SW-1S
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 09:57:37 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70231567-70ed-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 11:57:36 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f75c205e4aso9148001fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 02:57:36 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76eb6sm6344709a12.61.2024.09.12.02.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 02:57:34 -0700 (PDT)
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
X-Inumbo-ID: 70231567-70ed-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726135055; x=1726739855; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ju8Db0umbs/KULkJ8M/r34V4oer1tV3hfXhK1DqxJ8k=;
        b=cmbYDB2wjfYbfP2YK29gRhLUk0CIkDF6uHSwdAaHXG9HMboIYO8zn2nwJ91+OWBHq2
         umjewvm8WEkMRUUjxaT94uZ12cG6Mkx3yVpImyELdmuzE6kqCYub+mYaHdQzf11TUW1K
         Fvo9XScdv0jFgEiZbqk0Y5E9M3R/j3j8xE1Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726135055; x=1726739855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ju8Db0umbs/KULkJ8M/r34V4oer1tV3hfXhK1DqxJ8k=;
        b=runYSElWJPXWNYyH8s/hVkWuDhtf92QszNJmI8ON5TDIg1mNKylnKONXBQCN5/1PK+
         N1sXBp79J4L/PdmBkKUulGLwqlzhp5zUKXPAcHh7GP6qe5kiVmsaSruLk0nRZzoLWHQR
         uouOnMA8MdBx3Ijw9+8nQSKYAwVwU3pghGcyIrSVhs6LKrtEqf4huFSA0I84XvEiC9FQ
         4zjzA1OY1ZilKM3AVcyWcIvbFXiH/qkBB6peQckjV+yrWSEDQxQkzHkx0j7NAyx9xui0
         TaAISdDbfgrLAxK2fH3DoiH8/r/+c/Qijz7k60Jk/FJQcxIQ4ZIYm1f9RiAdlYZMD8Js
         BHwQ==
X-Gm-Message-State: AOJu0YxFmzUd25332EBHdMzsG0DvHr42VX4DetNxHAVABlnnIJiVeXVo
	YWpUxaFwu6f5qBowhq5SScg03XhtoKLQm76rOWerRzGOPAv1i8MNx33glIHbVlPBfhO6RnxQpEW
	W
X-Google-Smtp-Source: AGHT+IF0YdTwdauBtETcc+rV6roH8ahGW6GYO0mEhzhOKN7pHaTLVQqDv7ap/FYo/NldMHA7yV01yg==
X-Received: by 2002:a05:651c:2110:b0:2f6:61d7:ab63 with SMTP id 38308e7fff4ca-2f787edbb94mr13224941fa.23.1726135055075;
        Thu, 12 Sep 2024 02:57:35 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>,
	Owen Smith <owen.smith@cloud.com>,
	Mark Syms <mark.syms@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3] blkif: reconcile protocol specification with in-use implementations
Date: Thu, 12 Sep 2024 11:57:29 +0200
Message-ID: <20240912095729.25927-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Current blkif implementations (both backends and frontends) have all slight
differences about how they handle the 'sector-size' xenstore node, and how
other fields are derived from this value or hardcoded to be expressed in units
of 512 bytes.

To give some context, this is an excerpt of how different implementations use
the value in 'sector-size' as the base unit for to other fields rather than
just to set the logical sector size of the block device:

                        │ sectors xenbus node │ requests sector_number │ requests {first,last}_sect
────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
FreeBSD blk{front,back} │     sector-size     │      sector-size       │           512
────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
Linux blk{front,back}   │         512         │          512           │           512
────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
QEMU blkback            │     sector-size     │      sector-size       │       sector-size
────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
Windows blkfront        │     sector-size     │      sector-size       │       sector-size
────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
MiniOS                  │     sector-size     │          512           │           512

An attempt was made by 67e1c050e36b in order to change the base units of the
request fields and the xenstore 'sectors' node.  That however only lead to more
confusion, as the specification now clearly diverged from the reference
implementation in Linux.  Such change was only implemented for QEMU Qdisk
and Windows PV blkfront.

Partially revert to the state before 67e1c050e36b while adjusting the
documentation for 'sectors' to match what it used to be previous to
2fa701e5346d:

 * Declare 'feature-large-sector-size' deprecated.  Frontends should not expose
   the node, backends should not make decisions based on its presence.

 * Clarify that 'sectors' xenstore node and the requests fields are always in
   512-byte units, like it was previous to 2fa701e5346d and 67e1c050e36b.

All base units for the fields used in the protocol are 512-byte based, the
xenbus 'sector-size' field is only used to signal the logic block size.  When
'sector-size' is greater than 512, blkfront implementations must make sure that
the offsets and sizes (despite being expressed in 512-byte units) are aligned
to the logical block size specified in 'sector-size', otherwise the backend
will fail to process the requests.

This will require changes to some of the frontends and backends in order to
properly support 'sector-size' nodes greater than 512.

Fixes: 2fa701e5346d ('blkif.h: Provide more complete documentation of the blkif interface')
Fixes: 67e1c050e36b ('public/io/blkif.h: try to fix the semantics of sector based quantities')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
Changes since v2:
 - Reword a sentence and fix incorrect use of sector-size.

Changes since v1:
 - Update commit message.
 - Expand comments.
---
 xen/include/public/io/blkif.h | 52 ++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/blkif.h
index 22f1eef0c0ca..9b00d633d372 100644
--- a/xen/include/public/io/blkif.h
+++ b/xen/include/public/io/blkif.h
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
2.46.0


