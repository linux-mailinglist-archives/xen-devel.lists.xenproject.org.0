Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAPAHc88tGlAjgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEA72871CF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253909.1549878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Th-0006hY-A8; Fri, 13 Mar 2026 16:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253909.1549878; Fri, 13 Mar 2026 16:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Th-0006fR-3i; Fri, 13 Mar 2026 16:35:09 +0000
Received: by outflank-mailman (input) for mailman id 1253909;
 Fri, 13 Mar 2026 16:35:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UGzF=BN=bounce.vates.tech=bounce-md_30504962.69b43cb6.v1-67f6cedc721c42edbf171055fee92f62@srs-se1.protection.inumbo.net>)
 id 1w15Tf-0006Ek-Mo
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:07 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95fd48a8-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:03 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVT26z4fzPm0Tfk
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:02 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 67f6cedc721c42edbf171055fee92f62; Fri, 13 Mar 2026 16:35:02 +0000
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
X-Inumbo-ID: 95fd48a8-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419703; x=1773689703;
	bh=JfHFYvtudm5KF8F0VORCJcQt4zo5UBXTcc/C8TzmeOA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Cr7ix8mpoVVF1RvAhtUe+IUrYgBDRBNVWvATBUdkAJ2uY6+EBxGn1JyzvK2jr/hK0
	 +2FzWg9tElDWxwwrdRNVOYCacTF3/82Jr1yYNtVciklRlwa76WKeuMfgOH35LAnsfR
	 kJZUYEIppgxM8XI1W2ONvjARsMfksjiZ6yj/7FKz2Jvr62mXAsbpgf+t6OA4a1AZea
	 tG9ubT5uxIPHTlM6yFCZtq+EiDTSqNgxx7i5EBdX2pKNaSOUuDRZvP1pfGPO6gdqNB
	 PDkBzqYxCtPkwPXi8c/+HvBrAezSR07XaiAHoEr7qKfpqkziTqNDEhhMqku2etTE78
	 jRZP6fZdIFBfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419703; x=1773680203; i=thierry.escande@vates.tech;
	bh=JfHFYvtudm5KF8F0VORCJcQt4zo5UBXTcc/C8TzmeOA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VJqFJtu2xGYuVcLOW7Apox2ntOVpWsXdMGjhm68+C5UgmO5mOaBcuv3T0zQZR55gc
	 yPFw+iutjQLdj4RnAMKg2UHJlCj8QlPVXMG8eTqeU77Qz0CPBYIGC6qZWEI1493Uit
	 wH/nKlGTZIS0Gwr6uKAtcP1/fDpdOSiOxR+wCV06PEFufh6galoubakN6LrigCxmU9
	 DtxBSMegYH4bSHnqwUkOdTMHc6YSIUhNB84cFFpWkjravbnWHjzIQCC0pun01LF9YE
	 xNjUgRrPw0l5C0C0yXIyG8AgkgUMQvYOI8+kcmuuVe1Kxyt4GRTZhNUvRBJ6ysacMv
	 2a1rsCMbBZZGQ==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2005/17]=20hvmloader:=20add=20Q35=20DSDT=20table=20loading?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419701817
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Alexey Gerasimenko" <x1917x@gmail.com>
Message-Id: <20260313163455.790692-6-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.67f6cedc721c42edbf171055fee92f62?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,suse.com,citrix.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.105];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6CEA72871CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch allows to select Q35 DSDT table in the function
hvmloader_acpi_build_tables(). The machine_type global variable is used
to select a proper table (i440/q35).

As we are bound to the qemu-xen device model for Q35, there is no need
to initialize config->dsdt_15cpu/config->dsdt_15cpu_len fields.

Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/firmware/hvmloader/util.c | 17 +++++++++++++++--
 tools/firmware/hvmloader/util.h |  2 ++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index f9116bea4d..45519ea583 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -885,8 +885,21 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
     s = xenstore_read("platform/device-model", "");
     if ( !strncmp(s, "qemu_xen", 9) )
     {
-        config->dsdt_anycpu = dsdt_i440_anycpu_qemu_xen;
-        config->dsdt_anycpu_len = dsdt_i440_anycpu_qemu_xen_len;
+        switch ( machine_type )
+        {
+        case MACHINE_TYPE_Q35:
+            config->dsdt_anycpu = dsdt_q35_anycpu_qemu_xen;
+            config->dsdt_anycpu_len = dsdt_q35_anycpu_qemu_xen_len;
+            break;
+        case MACHINE_TYPE_I440:
+            config->dsdt_anycpu = dsdt_i440_anycpu_qemu_xen;
+            config->dsdt_anycpu_len = dsdt_i440_anycpu_qemu_xen_len;
+            break;
+        default:
+            /* Not likely to happen */
+            BUG();
+        }
+
         config->dsdt_15cpu = NULL;
         config->dsdt_15cpu_len = 0;
     }
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 2f37504aca..4641ca0c46 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -393,7 +393,9 @@ bool check_overlap(uint64_t start, uint64_t size,
                    uint64_t reserved_start, uint64_t reserved_size);
 
 extern const unsigned char dsdt_i440_anycpu_qemu_xen[], dsdt_anycpu[], dsdt_15cpu[];
+extern const unsigned char dsdt_q35_anycpu_qemu_xen[];
 extern const int dsdt_i440_anycpu_qemu_xen_len, dsdt_anycpu_len, dsdt_15cpu_len;
+extern const int dsdt_q35_anycpu_qemu_xen_len;
 
 unsigned long acpi_pages_allocated(void);
 
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


