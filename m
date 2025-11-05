Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB5EC336F6
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 01:03:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155933.1485277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGQzr-0007sW-Gd; Wed, 05 Nov 2025 00:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155933.1485277; Wed, 05 Nov 2025 00:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGQzr-0007pv-Ds; Wed, 05 Nov 2025 00:03:31 +0000
Received: by outflank-mailman (input) for mailman id 1155933;
 Wed, 05 Nov 2025 00:03:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qfcm=5N=bounce.vates.tech=bounce-md_30504962.690a944f.v1-a786ec3e0a7a48769e94054a7ee72a06@srs-se1.protection.inumbo.net>)
 id 1vGQzq-0007eR-Pm
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 00:03:30 +0000
Received: from mail180-3.suw31.mandrillapp.com
 (mail180-3.suw31.mandrillapp.com [198.2.180.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbb7c141-b9da-11f0-9d16-b5c5bf9af7f9;
 Wed, 05 Nov 2025 01:03:29 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-3.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4d1QX00VxjzDRHxHs
 for <xen-devel@lists.xenproject.org>; Wed,  5 Nov 2025 00:03:28 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a786ec3e0a7a48769e94054a7ee72a06; Wed, 05 Nov 2025 00:03:27 +0000
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
X-Inumbo-ID: dbb7c141-b9da-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762301008; x=1762571008;
	bh=8W92A1Mr2lIJPILYhyF4rcihIHzKMgtpeeOD07WrWMw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ELGbczGPUO//Tvhze/KPoq67L6G9H/4RotAJFDVGpzMREftb1s1bIR/ouFZAok0oJ
	 1U5/iW0i9v5AjX4m1wgQUox0Rpb2PIJlN4+nWYITWbSIBVb/s6eDGMegAm/tffSKNO
	 ROaO32irkmNvrXAsDME8vaTFxee3x2wGm1uWV9vSbfLG4Se+XkJ/IuvrWR46nGkyUY
	 wJ+szLmxkYJZTCNTqdQy1/R0q8lGAarCNE7Rq/bI8fS6YsWl/Qb2uPMWuCns4ask8X
	 BL3pAefn3l77ukn38t8qCpqYEvBFSnvYxDdtE0AR3ZBTS7wh2SU91Kub+2Htb35ZRM
	 mbb+hxvh73ypQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762301008; x=1762561508; i=ngoc-tu.dinh@vates.tech;
	bh=8W92A1Mr2lIJPILYhyF4rcihIHzKMgtpeeOD07WrWMw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=i9avZkUTsdwFg0cZyegKTWjpvsT5X6H/n8sQp20vrkbq6ssk5uOO7dPwSMOzPfuQr
	 PIbghdEOGf4DIfUdPkFikRpSu+rHbREqS9U0WMTV3nZQB+eXEoij4SPHhnVGrMJetI
	 vOb1P77UG/xaGMet/P5trN43k59CkPf1UgGdJNnkvp1Jb0pVyElGHNdwN3hBtMPQaL
	 iXeDgu5/14jMyrX8cXCHjZSxbg/v7RnhDfyLfQCIuR+dNXyf0LUJ5mOthw4VUmB7ak
	 YxQbghyn+FoNIeLrrYi4gG1vihkBSu8AlXuLRfYoEcJ5YPq9cmiMn1yxTDOCsoUgsA
	 0dhF3RUWOPj2A==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[PATCH=20for-4.22=20v2]=20acpi:=20Set=20TPM2=20LAML=20to=20actual=20log=20area=20size?=
X-Mailer: git-send-email 2.51.0.windows.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762301007171
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Daniel Smith" <dpsmith@apertussolutions.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>
Message-Id: <20251105000310.690-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a786ec3e0a7a48769e94054a7ee72a06?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251105:md
Date: Wed, 05 Nov 2025 00:03:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The LAML field should follow the TCG PFP specification:

The TCG ACPI specification uses the field name "Log Area Minimum
Length", but the field value is the actual log area length reserved by
Platform Firmware, not a lower bound.

Remove the now-unused TPM_LOG_AREA_MINIMUM_SIZE.

No functional change.

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
v2: Remove the now-unused TPM_LOG_AREA_MINIMUM_SIZE.
---
 tools/libacpi/acpi2_0.h | 1 -
 tools/libacpi/build.c   | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/libacpi/acpi2_0.h b/tools/libacpi/acpi2_0.h
index 6dfa939a8c..51623e2a8a 100644
--- a/tools/libacpi/acpi2_0.h
+++ b/tools/libacpi/acpi2_0.h
@@ -140,7 +140,6 @@ struct acpi_20_tpm2 {

 #define TPM_LOG_AREA_ADDRESS        0xFED50000

-#define TPM_LOG_AREA_MINIMUM_SIZE   (64 << 10)
 #define TPM_LOG_SIZE                (64 << 10)

 /*
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


