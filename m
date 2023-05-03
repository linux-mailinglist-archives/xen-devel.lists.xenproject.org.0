Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEE56F5A92
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529285.823519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puDze-0000Ok-UH; Wed, 03 May 2023 15:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529285.823519; Wed, 03 May 2023 15:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puDze-0000N3-RY; Wed, 03 May 2023 15:02:10 +0000
Received: by outflank-mailman (input) for mailman id 529285;
 Wed, 03 May 2023 15:02:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YH74=AY=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1puDzd-0000Mx-II
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:02:09 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7849e45f-e9c3-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 17:02:06 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz43F1sivZ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 3 May 2023 17:01:54 +0200 (CEST)
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
X-Inumbo-ID: 7849e45f-e9c3-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1683126114; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=an3Si/DZaCH9pneAM2ENpePOMfOaZa3AqjW2ZOatMWSZjVpyNM67SFvneQ2TG1R6ns
    a5/y296PLUGefDtOel9H0Bq5qpvuUtrYPl45LiYkjVwoqxAPGDDMU9oLbiqiadRX9WBN
    a45gNROs6dbRgLUxkpXqEHd2G3El65Ye1VtPO1rA2rf2JmhT6zLsa5Q/5vUqtMYLnI1J
    NR4rSCzfSLzIRE/JRglCKKYZhBH8+PBk63G2Zwl+hiKsZLDgE7OracoM25zD9jw0vqu4
    GPSfrIt9CBsjPX3r1lYpcLpGbVdPXLuEyFLl9mxweE4KqcK+4wA7BFPyFOx1GbmX3Hdm
    uXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683126114;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=n+NGG3DQPZc+9Rhhl9b5pYee5RxxjvFCd1OK5V3cABk=;
    b=tYOI7l4mnIlwWPP2R9bd0LxGM5EIKKxU/38cbULkB/wbY6q8PIA/d/GYi2Tmk+75Wn
    krowxG79KasyoaWG59yNEAxTuCH1HCC93uscrw8MgsM7pynAleOg8cnBDevFKERLG8V9
    Ss4dPh8X8eju60Q5+wQY82FumUikBXi8Gk/vTftt0YBRhngzc47QKr6o07YRwo5fRTeE
    43CaqutIvvFafc9K7rdMu98Lo7yJr0MtR/MUVMe8TxpIKzHAGnuo6GgnmgeDiVlzBi22
    4bmxBBb0hmyPmYcwM/F4chhxZCBfuxwynQlKo7rU7SycmvD/DoUkxW6NQPOzibAdO5Pd
    L9jA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683126114;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=n+NGG3DQPZc+9Rhhl9b5pYee5RxxjvFCd1OK5V3cABk=;
    b=TwqpkV9ug89fcyLYQDObqODL/gjAl5sWmoKuMUOfMOgoeZcolvstn32mO+JzHJ9y7F
    emDjSSgB63OHF6aLZAhY8zOEX149SnVPN8t1w7Q+Ji+ztysf61onHr7DMloLguAZAnSp
    8V0KWR0TfPbnDTWQwBG9W0/0oe1o3dow3KeFb+Lkuxz8IXaRLYbWgU3TjP5GeD8afUNS
    C2etHiuduuDJE8XHRPIM7EBQDnFGvPLYP34J+qkhNOA5YJuKiS+gYgUBVTSQkPzpvLfl
    x37KOnrQbT0KPUYw8shGFUJjZG/ygx3JPgD0Een/FZLKRyOWF226YaBiUebgT9896CJM
    +u+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683126114;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=n+NGG3DQPZc+9Rhhl9b5pYee5RxxjvFCd1OK5V3cABk=;
    b=wC8s4YqIb8NF+7s79yfRMixs7jT1xwEizl+opuOr9Hzp8EA4X61a0D70gEtzXL5m2F
    R5CDEjEVQEyQ8TTYBRCQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4wqVv7FZ8tH5EUSbMVU80kUr7f4QlYaI60OjHt/Q=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v1] tools: convert bitfields to unsigned type
Date: Wed,  3 May 2023 15:01:42 +0000
Message-Id: <20230503150142.4987-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

clang complains about the signed type:

implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]

The potential ABI change in libxenvchan is covered by the Xen version based SONAME.

The xenalyze change follows the existing pattern in that file.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/include/libxenvchan.h | 6 +++---
 tools/xentrace/xenalyze.c   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/include/libxenvchan.h b/tools/include/libxenvchan.h
index 30cc73cf97..3d3b8aa8dd 100644
--- a/tools/include/libxenvchan.h
+++ b/tools/include/libxenvchan.h
@@ -79,11 +79,11 @@ struct libxenvchan {
 	xenevtchn_handle *event;
 	uint32_t event_port;
 	/* informative flags: are we acting as server? */
-	int is_server:1;
+	unsigned int is_server:1;
 	/* true if server remains active when client closes (allows reconnection) */
-	int server_persist:1;
+	unsigned int server_persist:1;
 	/* true if operations should block instead of returning 0 */
-	int blocking:1;
+	unsigned int blocking:1;
 	/* communication rings */
 	struct libxenvchan_ring read, write;
 	/**
diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 12dcca9646..1b4a188aaa 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -1377,7 +1377,7 @@ struct hvm_data {
     tsc_t exit_tsc, arc_cycles, entry_tsc;
     unsigned long long rip;
     unsigned exit_reason, event_handler;
-    int short_summary_done:1, prealloc_unpin:1, wrmap_bf:1;
+    unsigned short_summary_done:1, prealloc_unpin:1, wrmap_bf:1;
 
     /* Immediate processing */
     void *d;

