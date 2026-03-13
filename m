Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGXlNM08tGmDjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A8E28719D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253918.1549957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tp-0000Su-6K; Fri, 13 Mar 2026 16:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253918.1549957; Fri, 13 Mar 2026 16:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15To-0000O4-U0; Fri, 13 Mar 2026 16:35:16 +0000
Received: by outflank-mailman (input) for mailman id 1253918;
 Fri, 13 Mar 2026 16:35:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uwc8=BN=bounce.vates.tech=bounce-md_30504962.69b43cb7.v1-344d125658814570b3612034e846277e@srs-se1.protection.inumbo.net>)
 id 1w15Tm-0006Ps-NA
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:14 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 979dae23-1efa-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 17:35:06 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVT36mzZz5Qkjg4
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 344d125658814570b3612034e846277e; Fri, 13 Mar 2026 16:35:03 +0000
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
X-Inumbo-ID: 979dae23-1efa-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419703; x=1773689703;
	bh=SJNwp/e+ZZuXxiujULGF+OAKlHbvuetBMvexQHhjjo8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VtsccEyU7+GNTAHs4flCl0OeOQylMdjXtK3xTaGgkOt+kYYO462N6VEtbGvBaPXoU
	 50bUH5TgVxX1ZIM3cPKW61GchWLiBZazkDjJuZ5bL+c+fyLmRf2k3AZPtZIb2NkDLe
	 fDA140diy5tmrsrfRnqA3RVIZocKA2a6sFdK3R1oo9LVb8Y6fnf6BBD53Tb6xV8NhT
	 GzfzQmr8YeakG5WfBeDpby03k5BlRCitz8Y4Y8VAa2bIArVX3HfsU3QGpD5AP5p1p2
	 COQTLeC1mSJzb0hz6mV1bRgLo86pyu/5A3YzEFXC+UCtLS3eRmV+au32lO58yxYVUa
	 akRBQlMlnFn6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419703; x=1773680203; i=thierry.escande@vates.tech;
	bh=SJNwp/e+ZZuXxiujULGF+OAKlHbvuetBMvexQHhjjo8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lhkiGL07AiVnT6o0YW6293mnSd4WF2oA6yZIZXZaH7eUj250uCYW5OAtKbC7Nr83p
	 nmj9NaOyLkL0EuRONTiFZ2slExNmGAQbSluFxJ4o73DtLxLS4BfWfD38vOZ2R+RCAQ
	 9yA3l+X7Q3ArUQGgGaq9V3J+Z23B9MFJEHjjjQF+eEbtzcYKwP52aVlHM6uSUtJ+u6
	 fl71oFIEI8VChyctmq/bC0AOiHJgP/sFH1Vk+FtX5gKslnYsGdimR+Kg/F0Nk3TIL3
	 Ngbci2xTgcRCvisrb/6x01ms8DljL0fxO/W1CAZTi2aN2Q/84BD5q0ksB75OHwXUTD
	 ibH2w8VBIK9LA==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2010/17]=20hvmloader:=20Add=20support=20for=20HVMOP=5Fset|get=5Fecam=5Fspace=20hypercalls?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419703166
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <20260313163455.790692-11-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.344d125658814570b3612034e846277e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:03 +0000
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.572];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 77A8E28719D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch adds wrappers in hvmloader for the hypercalls used to set and
get the ECAM space base address and size.

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/firmware/hvmloader/util.c | 26 ++++++++++++++++++++++++++
 tools/firmware/hvmloader/util.h |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 45519ea583..ee7a09b5bc 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -690,6 +690,32 @@ error:
     BUG();
 }
 
+int hvm_set_ecam_space(uint64_t addr, uint32_t size)
+{
+    xen_hvm_ecam_space_t ecam;
+
+    ecam.domid = DOMID_SELF;
+    ecam.addr = addr;
+    ecam.size = size;
+    return hypercall_hvm_op(HVMOP_set_ecam_space, &ecam);
+}
+
+int hvm_get_ecam_space(uint64_t *addr, uint32_t *size)
+{
+    struct xen_hvm_ecam_space e = { };
+    int ret;
+
+    e.domid = DOMID_SELF;
+
+    ret = hypercall_hvm_op(HVMOP_get_ecam_space, &e);
+    if ( ret == 0 ) {
+        *addr = e.addr;
+        *size = e.size;
+    }
+
+    return ret;
+}
+
 static void validate_hvm_info(struct hvm_info_table *t)
 {
     uint8_t *ptr = (uint8_t *)t;
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 4641ca0c46..f63fdd3fbf 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -403,6 +403,10 @@ struct acpi_config;
 void hvmloader_acpi_build_tables(struct acpi_config *config,
                                  unsigned int physical);
 
+/* Pass ecam space information to Xen */
+int hvm_get_ecam_space(uint64_t *addr, uint32_t *size);
+int hvm_set_ecam_space(uint64_t addr, uint32_t size);
+
 #endif /* __HVMLOADER_UTIL_H__ */
 
 /*
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


