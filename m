Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F998A6680
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 10:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706758.1104123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rweae-0007Vt-ND; Tue, 16 Apr 2024 08:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706758.1104123; Tue, 16 Apr 2024 08:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rweae-0007TB-JR; Tue, 16 Apr 2024 08:54:56 +0000
Received: by outflank-mailman (input) for mailman id 706758;
 Tue, 16 Apr 2024 08:54:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6dxz=LV=bounce.vates.tech=bounce-md_30504962.661e3cdc.v1-7bba17972cfe4af4ad5390684dfed8e2@srs-se1.protection.inumbo.net>)
 id 1rwead-0007Qr-57
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 08:54:55 +0000
Received: from mail5.us4.mandrillapp.com (mail5.us4.mandrillapp.com
 [205.201.136.5]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd82c147-fbce-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 10:54:53 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail5.us4.mandrillapp.com (Mailchimp) with ESMTP id 4VJdCJ2hJnzDRHxQy
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 08:54:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7bba17972cfe4af4ad5390684dfed8e2; Tue, 16 Apr 2024 08:54:52 +0000
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
X-Inumbo-ID: fd82c147-fbce-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713257692; x=1713518192;
	bh=RC5FFGk/Ic0BwHOG6ZfDIeoELywNOK2Ze7hIoIKrmOI=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Slgy1x0pUhd+E1sXA7dSZmGp444pncoqv/DqGngUKBlBdOzVeKsyNq/2Ghx4ct0TR
	 4FwVZZch3AnTuq5hNtk/CsosIVZRtOiog6HLNFxM/+coPZooAVwoJ/Kb5i5EKvtGAc
	 3qJNFtO1wl3NhirufXd4hhkSPB7g4B8yaZ01chQa1CG2seaT3iH8hhyed4lX0pSToa
	 UvAqR2ghjH/hpb6XxOBWmtby5Ppe9OVwRZOrSA7WOR0I/SeCHysiVd0N7/5zOxl4GN
	 dhtgQ0leycpac03Wdk7p1yoBjk3inX7yBnbxNxqrrPQZjRn9DDvjkvLWwi5ANirVQP
	 2Gkx5s8wPMUpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713257692; x=1713518192; i=vaishali.thakkar@vates.tech;
	bh=RC5FFGk/Ic0BwHOG6ZfDIeoELywNOK2Ze7hIoIKrmOI=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=1JJI7rZa+TIJhUBTgUK5AID5t56vY45OA+wIDpptWVlytAqiY2UWu0RoXSUnVSkIB
	 7rXGJv/3pxoE3FRpxZWTxajT4MH99NBbgwBY8rxr+8ToOXYSYdCimHOHc9ViwxDg/h
	 MDKR/h0n2SLQOFlrpEm0jYRVvqKT9zwF0hWoXSWGqvjku7xn5D47E4Lz19/iQcNp92
	 h5bECmhtSEkZ717Uy1ORm1J1U8miRy7Ne8RZqbY0VYd7Ei+igONgIZVj+Cz0f9M7o7
	 GrRizEPuv+WWuPlao9dL8H3ZcnD3pvfbPyQJtIJCGSJ4RKf4kTlwv4EHWNd5vlkY63
	 D8yMXtoFmYnhg==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/hvm:=20Allow=20supplying=20a=20dynamic=20start=20ASID?=
X-Mailer: git-send-email 2.44.0
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713257688425
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, Vaishali Thakkar <vaishali.thakkar@vates.tech>
Message-Id: <0d4ef987825080715873360c8b41ebb467b7dfdf.1713257278.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7bba17972cfe4af4ad5390684dfed8e2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240416:md
Date: Tue, 16 Apr 2024 08:54:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Currently, Xen always starts the ASID allocation at 1. But
for SEV technologies the ASID space is divided. This is
because it's a security issue if a guest is started as
ES/SNP and is migrated to SEV-only. So, the types are
tracked explicitly.

Thus, in preparation of SEV support in Xen, add min_asid
to allow supplying the dynamic start ASID during the
allocation process.

Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>
---
 xen/arch/x86/hvm/asid.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/asid.c b/xen/arch/x86/hvm/asid.c
index 8d27b7dba1..e14b64f2c8 100644
--- a/xen/arch/x86/hvm/asid.c
+++ b/xen/arch/x86/hvm/asid.c
@@ -41,6 +41,7 @@ boolean_param("asid", opt_asid_enabled);
 /* Per-CPU ASID management. */
 struct hvm_asid_data {
    uint64_t core_asid_generation;
+   uint32_t min_asid;
    uint32_t next_asid;
    uint32_t max_asid;
    bool disabled;
@@ -53,7 +54,8 @@ void hvm_asid_init(int nasids)
     static int8_t g_disabled = -1;
     struct hvm_asid_data *data = &this_cpu(hvm_asid_data);
 
-    data->max_asid = nasids - 1;
+    data->min_asid = 1;
+    data->max_asid = nasids - data->min_asid;
     data->disabled = !opt_asid_enabled || (nasids <= 1);
 
     if ( g_disabled != data->disabled )
@@ -66,8 +68,8 @@ void hvm_asid_init(int nasids)
     /* Zero indicates 'invalid generation', so we start the count at one. */
     data->core_asid_generation = 1;
 
-    /* Zero indicates 'ASIDs disabled', so we start the count at one. */
-    data->next_asid = 1;
+    /* Zero indicates 'ASIDs disabled', so we start the count at min_asid. */
+    data->next_asid = data->min_asid;
 }
 
 void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid)
@@ -117,7 +119,7 @@ bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid)
     if ( unlikely(data->next_asid > data->max_asid) )
     {
         hvm_asid_flush_core();
-        data->next_asid = 1;
+        data->next_asid = data->min_asid;
         if ( data->disabled )
             goto disabled;
     }
-- 
2.44.0

