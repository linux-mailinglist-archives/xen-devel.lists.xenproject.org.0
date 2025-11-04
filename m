Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E300C31FE3
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 17:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155822.1485207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGJeF-0001V2-ER; Tue, 04 Nov 2025 16:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155822.1485207; Tue, 04 Nov 2025 16:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGJeF-0001SX-B5; Tue, 04 Nov 2025 16:12:43 +0000
Received: by outflank-mailman (input) for mailman id 1155822;
 Tue, 04 Nov 2025 16:12:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oRVh=5M=bounce.vates.tech=bounce-md_30504962.690a25f7.v1-aae3f4366e3e45698dcc63bfaf2be13e@srs-se1.protection.inumbo.net>)
 id 1vGJeE-0001SR-DY
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 16:12:42 +0000
Received: from mail180-3.suw31.mandrillapp.com
 (mail180-3.suw31.mandrillapp.com [198.2.180.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16307f2f-b999-11f0-9d16-b5c5bf9af7f9;
 Tue, 04 Nov 2025 17:12:40 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-3.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4d1D4l3XvZzDRHxHy
 for <xen-devel@lists.xenproject.org>; Tue,  4 Nov 2025 16:12:39 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 aae3f4366e3e45698dcc63bfaf2be13e; Tue, 04 Nov 2025 16:12:39 +0000
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
X-Inumbo-ID: 16307f2f-b999-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762272759; x=1762542759;
	bh=JVtqe9pbf3JmbyY+Xaghsy9tjFWXb8JpV4OnFNchyo4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=sn1n3hOcDLdr5MqGMZB1zJA0mhXxFfG2DtHFnx6R2PSLo7qf09P8aDjxMWfhKgS1z
	 35khGb3BnRLAE74snChIn1I38i3FbbKVtBK0zvFadis5VbVxA9/cGC/DwAjlb89WbV
	 Hfpq+sPdAkR6Pb5cMEORY86NznnW89ms2GnTpjkQxY/5J1ReVC/0bL+iXmZjjh5TGU
	 eClCK/8W5ytPLU+sf0TrIgvAluIfjMR28Cp0sCnabldMZ3DrXexnMlEAR6vp/YpW77
	 3PAi/vjY3/BpO9aoGzMjUF9JbdvcA3lmcJeqNiRhLvvvcKI+rJTXiRUc2MiuCnK9ZD
	 cLwOz2YLfJMEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762272759; x=1762533259; i=ngoc-tu.dinh@vates.tech;
	bh=JVtqe9pbf3JmbyY+Xaghsy9tjFWXb8JpV4OnFNchyo4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=tRvrqlOLgMN48SVN5079d/sRJav3lgPcVWgv5EmwqslQHLEWn8uLb69CJ0nl6wnpw
	 Gzuj9DWkrgZiQhTOEq5660EleOtuRkZTMuvIhnE2jsJ3bKdbdGUP76HDSthIsqIWGv
	 OBqknpwme70HnOAE76AlfygxNRADhpknwK4oy55rY0hb091gPlFBiyjk0eZyWDagge
	 Sp++fCfux3/U18NSQXuZJj3xArXpD/ZUuYB1u/YU/9+4GjgAn8oicqCRlY42DuaCyW
	 /EnVRAf9+JqerpcCLQ3UH83XlLJqVBxM03sSjWpBuVW1woq9J0g03d2PHlxEePq23z
	 g4sovjjyepxeA==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20acpi:=20Set=20TPM2=20LAML=20to=20actual=20log=20area=20size?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762272758782
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Message-Id: <20251104161230.22789-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.aae3f4366e3e45698dcc63bfaf2be13e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251104:md
Date: Tue, 04 Nov 2025 16:12:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The LAML field should follow the TCG PFP specification:

The TCG ACPI specification uses the field name "Log Area Minimum
Length", but the field value is the actual log area length reserved by
Platform Firmware, not a lower bound.

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 tools/libacpi/build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index 2f29863db1..95188e217e 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -473,7 +473,7 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
             tpm2->platform_class = TPM2_ACPI_CLASS_CLIENT;
             tpm2->control_area_address = TPM_CRB_CTRL_REQ;
             tpm2->start_method = TPM2_START_METHOD_CRB;
-            tpm2->log_area_minimum_length = TPM_LOG_AREA_MINIMUM_SIZE;
+            tpm2->log_area_minimum_length = TPM_LOG_SIZE;
             tpm2->log_area_start_address = TPM_LOG_AREA_ADDRESS;
 
             set_checksum(tpm2,
-- 
2.43.0



--
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


