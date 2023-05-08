Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E33C6FB57A
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 18:47:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531668.827448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw40S-0000CE-Ul; Mon, 08 May 2023 16:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531668.827448; Mon, 08 May 2023 16:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw40S-00009Q-RH; Mon, 08 May 2023 16:46:36 +0000
Received: by outflank-mailman (input) for mailman id 531668;
 Mon, 08 May 2023 16:46:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fEaP=A5=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pw40Q-000094-Mv
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 16:46:34 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.23]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2bcf59e-edbf-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 18:46:32 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz48GkL1ei
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 May 2023 18:46:21 +0200 (CEST)
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
X-Inumbo-ID: e2bcf59e-edbf-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1683564381; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=aQOBJvQhWb1t5tnqeVzHgWO/YtjOx3rNfKHaYf6UwWeC+MkYJiCW6nVylCffa88lSq
    rxywtfvj3AtpTtoxlKpAeE4d7M7PP7Jpm/WbNNNcb73Ij/TqE2erALOQFRhZcwmgtt6x
    Mjhg75RwKlvhrs0+85eJmM+nVXGzhGsJ1XrhOP5Y0zXGoj3blIyezNeI45wgpqvuOk9p
    AD7tSc+6GhenaDRaGJaO+oiPusdN7s/FMVw0+oRj4hoeDUcNWNYoyPMOF6qQUJWpOBHG
    jyayKvdqHKxnVoPxjQJapLW/IHBC5li5C7gPqcf2HYrd8c1PQfjUGkIAuAmKHcb38HoR
    cgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683564381;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ckiWL2I0mA50zkvrZeK7N1+RfhrIURHzeKf776Hu3nE=;
    b=sA2c/UTSPr2n7ftMly/N4kZ+4i/RdAraMSv6OKQJzoMMS31a4YiFXk317NdQ8JDecl
    UZ3YSpJiHy4jOftrucQE2aQwBKabxU/6Mg86o/MfTEktpulYnCrA7ngx18K8YJ77gPkF
    VcB3npY+fxOlecInxj2vvi026+WWT2z/rOzFnVQjfCNjXeTnpza3x/GBuYUsV5L/2qUa
    KhDA1kudFXhh8eMON1SO2Vlb9IHdbexSPZwtOh3HjlI1sppc0BI/FEEw9UzINc3agVbZ
    KuVMnRfa1JoWmeg0klSPaOyyt6lvUt6NsboUaR+VItTy7lxuhOGUSwd7l7lrYt3cI9TU
    DBmw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683564381;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ckiWL2I0mA50zkvrZeK7N1+RfhrIURHzeKf776Hu3nE=;
    b=DYlKtcZN7zjBC8XassEpnx4dkpk7e+6kblL6C/sXsfFuSVud0v/JrJWX0/jFftfBNB
    EQeYLWdSZ3xsZ/WJfX0hz/gA5177SlhTDVIx3qo40NVDsNmMiDickNOZWWDt1Vw6+Uh6
    SvgFrMp4rP2ik9yU5YUcD4szOKk3myQheW9DQTPuvCKUjdUzHBoRHJ1dMDsY53UuRiUq
    27NNBL2ui3LtZN7Kb6ZQSI5kZSZ5qRYHtZgT5EOKBMLGh2mbGDdSGdP44WlhGzOg8IxW
    jmkSnshwncGbb/Q7VO/lZW7t1AF8l8nhXMaLC45fp1m8xgIWfIpPIGWeskhPLyzyvfZY
    /6+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683564381;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=ckiWL2I0mA50zkvrZeK7N1+RfhrIURHzeKf776Hu3nE=;
    b=R/ogvXlolyxT7xoTrk9JeByV/QKhwCZGA0U4eQmaLX3o5UhMKPO6iBpLAuUruMwFvW
    odSG+o0vcbpzzlmCDfCQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xr137Gpot26qU4O0oDB37weYobhAHKAaiA4NsOg=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2] tools: convert bitfields to unsigned type
Date: Mon,  8 May 2023 16:46:18 +0000
Message-Id: <20230508164618.21496-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

clang complains about the signed type:

implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]

The potential ABI change in libxenvchan is covered by the Xen version based SONAME.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
v2: cover one more case in xenalyze

 tools/include/libxenvchan.h | 6 +++---
 tools/xentrace/xenalyze.c   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

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
index 12dcca9646..a50538e9a8 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -1377,7 +1377,7 @@ struct hvm_data {
     tsc_t exit_tsc, arc_cycles, entry_tsc;
     unsigned long long rip;
     unsigned exit_reason, event_handler;
-    int short_summary_done:1, prealloc_unpin:1, wrmap_bf:1;
+    unsigned int short_summary_done:1, prealloc_unpin:1, wrmap_bf:1;
 
     /* Immediate processing */
     void *d;
@@ -8235,13 +8235,13 @@ void mem_set_p2m_entry_process(struct pcpu_info *p)
 
     struct {
         uint64_t gfn, mfn;
-        int p2mt;
-        int d:16,order:16;
+        uint32_t p2mt;
+        uint16_t d, order;
     } *r = (typeof(r))ri->d;
 
     if ( opt.dump_all )
     {
-        printf(" %s set_p2m_entry d%d o%d t %d g %llx m %llx\n",
+        printf(" %s set_p2m_entry d%u o%u t %u g %llx m %llx\n",
                ri->dump_header,
                r->d, r->order,
                r->p2mt,

