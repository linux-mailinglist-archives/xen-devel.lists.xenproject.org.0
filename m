Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9987397366E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 13:47:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795445.1204814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snzKl-000652-V6; Tue, 10 Sep 2024 11:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795445.1204814; Tue, 10 Sep 2024 11:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snzKl-00062t-RM; Tue, 10 Sep 2024 11:46:59 +0000
Received: by outflank-mailman (input) for mailman id 795445;
 Tue, 10 Sep 2024 11:46:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EW7V=QI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snzKk-00061T-Au
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 11:46:58 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6113c3db-6f6a-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 13:46:55 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53655b9bbcdso5271253e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 04:46:55 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ced17asm476963266b.170.2024.09.10.04.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 04:46:53 -0700 (PDT)
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
X-Inumbo-ID: 6113c3db-6f6a-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725968815; x=1726573615; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CussbI2aA5YwJpapZkD0GVCNMRnAVWQU1162e52AtsI=;
        b=BOTGn1UyUVPaeZ9fsm6pK0s5BHitTjdnW68X1TbhMD+fdLm7OT7HMF7CMdh6G/T0V6
         CjNakPlS8dMW5Ps8Jb49MNkuuSgK8IFalVcseX1MsQehH3hx+Y0ERsKspB7JQsj0KIh4
         bFgv6uVARWN35/Xj/OWMYS34DwKE0lNTjDqKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725968815; x=1726573615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CussbI2aA5YwJpapZkD0GVCNMRnAVWQU1162e52AtsI=;
        b=uI01UnjmzSwoPyt5h8FZNQ/3QN8/qZUmvCpq0TY2Uz4jFOzqIPC5G5c/G/1L2cCc0d
         zF12PnhbHbqTlXJqgAIQPbA5ibRcP58SmR5tMdmB7sDmZv+h7fcfpB1nssNa0kKQGk99
         RlcraGPydlp6/mzoOx8IiEfJemUrsEe4bq13pCcq/5dHJp7BPoTaYFP7eYaG+9SRX/X3
         Wmip06Y9avfM5Peqxk3ZLGdzCkUGlF3wnVwZXjGZu+6Xzt20ijOHwipsYXp59nfvKP+n
         hEcipe8aoDMwYo08hXYD3SkMNiIQ9R28ai7vppDTeOqt4silTfAJNvzLvsTUNChtDPCB
         bxTA==
X-Gm-Message-State: AOJu0YwIhBVUliZdrX9e9D7uehGDcpfxdRgS4wddCDaIFBS27L3WZhZ6
	LupglbmNha0cjOlMfq6y820CKSJWWHUL0witQDHfEEQapSYs7YNopSSC3gpocAUrTpb4NWSDEQv
	E
X-Google-Smtp-Source: AGHT+IFS808Uzc4dFAQsK/AYDlaOlePojPw011gZazEFijz+Y0zT8JAc3SFNb8W2lgph6fujL7uRFw==
X-Received: by 2002:a05:6512:3983:b0:536:53fc:e8fc with SMTP id 2adb3069b0e04-536587ac031mr7916406e87.16.1725968813775;
        Tue, 10 Sep 2024 04:46:53 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>,
	Owen Smith <owen.smith@cloud.com>,
	Mark Syms <mark.syms@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] blkif: reconcile protocol specification with in-use implementations
Date: Tue, 10 Sep 2024 13:46:04 +0200
Message-ID: <20240910114604.13194-1-roger.pau@citrix.com>
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
---
Changes since v1:
 - Update commit message.
 - Expand comments.
---
 xen/include/public/io/blkif.h | 50 ++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/blkif.h
index 22f1eef0c0ca..da893eb379db 100644
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
+ *      When exposing a device that uses 4096 logical sector sizes, the only
+ *      difference xenstore wise will be that 'sector-size' (and possibly
+ *      'physical-sector-size' if supported by the backend) will be 4096, but
+ *      the 'sectors' node will still be calculated using 512 byte units.  The
+ *      sector base units in the ring requests fields will all be 512 byte
+ *      based despite the logical sector size exposed in 'sector-size'.
  *
  * physical-sector-size
  *      Values:         <uint32_t>
@@ -254,8 +258,8 @@
  * sectors
  *      Values:         <uint64_t>
  *
- *      The size of the backend device, expressed in units of "sector-size".
- *      The product of "sector-size" and "sectors" must also be an integer
+ *      The size of the backend device, expressed in units of 512b.
+ *      The product of "sector-size" * 512 must also be an integer
  *      multiple of "physical-sector-size", if that node is present.
  *
  *****************************************************************************
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


