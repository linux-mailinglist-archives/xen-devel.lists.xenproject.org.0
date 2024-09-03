Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C52F96A036
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 16:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789258.1198830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUOJ-0008Hd-2t; Tue, 03 Sep 2024 14:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789258.1198830; Tue, 03 Sep 2024 14:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUOI-0008Fc-VC; Tue, 03 Sep 2024 14:20:18 +0000
Received: by outflank-mailman (input) for mailman id 789258;
 Tue, 03 Sep 2024 14:20:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slUOH-0008EC-5B
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 14:20:17 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3d74044-69ff-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 16:20:16 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42c2e50ec13so28879975e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 07:20:16 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c1de81b2sm8887057f8f.30.2024.09.03.07.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 07:20:14 -0700 (PDT)
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
X-Inumbo-ID: a3d74044-69ff-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725373215; x=1725978015; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5brs0OzGf3Ijj5JPYt9yTzzm8IWdRpdWSi0qhrs0RE=;
        b=bB9IzkZLeg1FVo2NL0L2tKjMhIniFGp2imcz/udwJNwooF3DRrJWtI9pDx7mjaDrwK
         aTLlww4lR40okQh54U4oLmDC+rXIUngcaHQWWadmDdiFleq1DHq9vR4q108Y6DRHzCDg
         24D9YtdA6QWR0iKv+6PHuhXSGpM+JpKdNQnuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725373215; x=1725978015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5brs0OzGf3Ijj5JPYt9yTzzm8IWdRpdWSi0qhrs0RE=;
        b=pWEGQIoN/mYd5gs88ArA9q7eTq8BlJBeurBVw0Jgnkb+qrdEqfRjAoIZTMOBGNwc9S
         uGrtDsxQuLWNpXFAQccLK8KeFIhjwr9B5A8iM1wbyzY4gJHxqilOITHO4h+z8UMmrAvU
         IZZGFMmYMhezvNyH7rRchEDV2lDX5RgMpgNKqXoFkjVGroDsCFtystNsDLqNCDfCsmJY
         Nd1m0CINcElbMH1Ovnw+dHd1cvYsBrgg5JA8MT6n9PjxtLRFvHSNi0g0Gns27Q51o/Qg
         DiQ7lzqqZ4zEpd+tPJG4Ds4NDbUX7jQZl2/Jut/1fu1AGbLdtKh85BtfRoQhhlIfJTHD
         mvfg==
X-Gm-Message-State: AOJu0Yz1dqduhkv/AwIfPDc8qt0A8f0S7GWHCTUNTwr7HdcQSsK9YdLe
	rfE8zvbqRX7LUSR9v7ERgeWcEL/26doGlyJzTT8mGQKvuoStAvknmgFhn5ANuokyxI3afN/e0M7
	2
X-Google-Smtp-Source: AGHT+IHGB9mESOscdmFse9iU85uDourzu+tL9mBSPctj4T6LPr0OyrY3Zf24+3SOtCwHoO603lJ1vA==
X-Received: by 2002:a5d:4d90:0:b0:374:ca92:5e44 with SMTP id ffacd0b85a97d-374ca92604dmr4548061f8f.32.1725373214705;
        Tue, 03 Sep 2024 07:20:14 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>,
	Owen Smith <owen.smith@cloud.com>,
	Mark Syms <mark.syms@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] blkif: reconcile protocol specification with in-use implementations
Date: Tue,  3 Sep 2024 16:19:23 +0200
Message-ID: <20240903141923.72241-1-roger.pau@citrix.com>
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

Partially revert to the state before 67e1c050e36b:

 * Declare 'feature-large-sector-size' deprecated.  Frontends should not expose
   the node, backends should not make decisions based on its presence.

 * Clarify that 'sectors' xenstore node and the requests fields are always in
   512-byte units, like it was previous to 67e1c050e36b.

All base units for the fields used in the protocol are 512-byte based, the
xenbus 'sector-size' field is only used to signal the logic block size.  When
'sector-size' is greater than 512, blkfront implementations must make sure that
the offsets and sizes (even when expressed in 512-byte units) are aligned to
the logical block size specified in 'sector-size', otherwise the backend will
fail to process the requests.

This will require changes to some of the frontends and backends in order to
properly support 'sector-size' nodes greater than 512.

Fixes: 67e1c050e36b ('public/io/blkif.h: try to fix the semantics of sector based quantities')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/public/io/blkif.h | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/blkif.h
index 22f1eef0c0ca..07708f4d08eb 100644
--- a/xen/include/public/io/blkif.h
+++ b/xen/include/public/io/blkif.h
@@ -240,10 +240,6 @@
  *      The logical block size, in bytes, of the underlying storage. This
  *      must be a power of two with a minimum value of 512.
  *
- *      NOTE: Because of implementation bugs in some frontends this must be
- *            set to 512, unless the frontend advertizes a non-zero value
- *            in its "feature-large-sector-size" xenbus node. (See below).
- *
  * physical-sector-size
  *      Values:         <uint32_t>
  *      Default Value:  <"sector-size">
@@ -254,8 +250,8 @@
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
@@ -338,6 +334,7 @@
  * feature-large-sector-size
  *      Values:         0/1 (boolean)
  *      Default Value:  0
+ *      Notes:          DEPRECATED, 12
  *
  *      A value of "1" indicates that the frontend will correctly supply and
  *      interpret all sector-based quantities in terms of the "sector-size"
@@ -411,6 +408,11 @@
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
@@ -621,9 +623,12 @@
 /*
  * NB. 'first_sect' and 'last_sect' in blkif_request_segment, as well as
  * 'sector_number' in blkif_request, blkif_request_discard and
- * blkif_request_indirect are sector-based quantities. See the description
- * of the "feature-large-sector-size" frontend xenbus node above for
- * more information.
+ * blkif_request_indirect are all in units of 512 bytes, regardless of whether the
+ * 'sector-size' xenstore node contains a value greater than 512.
+ *
+ * However the value in those fields must be properly aligned to the logical
+ * sector size reported by the 'sector-size' xenstore node, see 'Backend Device
+ * Properties' section.
  */
 struct blkif_request_segment {
     grant_ref_t gref;        /* reference to I/O buffer frame        */
-- 
2.46.0


