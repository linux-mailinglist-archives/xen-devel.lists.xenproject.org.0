Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266B1875979
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 22:40:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690043.1075697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riLTG-0000iJ-Bp; Thu, 07 Mar 2024 21:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690043.1075697; Thu, 07 Mar 2024 21:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riLTG-0000g5-8x; Thu, 07 Mar 2024 21:40:10 +0000
Received: by outflank-mailman (input) for mailman id 690043;
 Thu, 07 Mar 2024 21:40:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qpjc=KN=bounce.vates.tech=bounce-md_30504962.65ea3436.v1-c1048633bc104bee924125ad065e382c@srs-se1.protection.inumbo.net>)
 id 1riLTF-0007ic-8w
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 21:40:09 +0000
Received: from mail137-23.atl71.mandrillapp.com
 (mail137-23.atl71.mandrillapp.com [198.2.137.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43b9fe28-dccb-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 22:40:07 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-23.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4TrN4k11pWz1XLPtB
 for <xen-devel@lists.xenproject.org>; Thu,  7 Mar 2024 21:40:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c1048633bc104bee924125ad065e382c; Thu, 07 Mar 2024 21:40:06 +0000
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
X-Inumbo-ID: 43b9fe28-dccb-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1709847606; x=1710108106;
	bh=7ADkLZwRQhzXGdiUMxsI+/EhhIGWK2TxOmfDmaI2ACw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0GetQ7d6lW38OBwUVSvyZt9yQEsyz9rXkwWTsZLUyp84b/c1KMC/FQcjXhqoBQ6Ll
	 CwV9RyVcNcdxpotFHBjCC+bsPXgd6CR39CZ6a/QO4xMH4Qv+4lCWyfEOZB5aeBfLJ2
	 VbtdXtT0kDSNApHgaXcskdf1E6qkMCn/S/LjQEDbqPXLQkqaHRZ3mnNpdlviBIUghK
	 kJv33UFBCvdsUWYcQiDJfMz0Gk7JZMuZPvZOgaua9QgcomwKJ3njQSW7KLQS8mVfkS
	 iGs//xPM4u3lxgdPgVjnOCZpxpRnWzyuDsyzSfIVvA8vMIJP+wvq+A7dnU5sayX+yB
	 J4l23Mz2Cxh2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1709847606; x=1710108106; i=vaishali.thakkar@vates.tech;
	bh=7ADkLZwRQhzXGdiUMxsI+/EhhIGWK2TxOmfDmaI2ACw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jQ3WujnoCVAehDD1VLmYo8HHamcpEDGQlijkuNavf7h7n795XsAGUWwaL9YDgOIvG
	 1GD3jd4lK10QUnAV3XOdPyg5DbzruNKWg15PUzflc3lIlEoGbCSznQa2/3WvdMbG93
	 sMtRw9ZYWCF4J/SDAw3gGrvpGtwMeKpfeqqkO3iwnOnFo9VmIXyIY446K+MqmwzJ45
	 X6AgzGVBKlbgNPh4xHfhwlp4cIq2DgiRI6Zt9hQUQK+p9kb5Y7nW/+2LHk3wkxBGkE
	 XWhrL2yVyxQu+8d5LcB7IGd3YSjieCRzvB3MDGIhlENBBM2fkU66Ilxbjr8Rue/SOX
	 hHypLFOFziK8Q==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?[PATCH=202/2]=20x86/svmdebug:=20Print=20sev=20and=20sev=5Fes=20vmcb=20bits?=
X-Mailer: git-send-email 2.44.0
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1709847604792
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org, Vaishali Thakkar <vaishali.thakkar@vates.tech>
Message-Id: <9cc6b407ec3b45f034b7deb6f5f44a561eecca47.1709846387.git.vaishali.thakkar@vates.tech>
In-Reply-To: <cover.1709846387.git.vaishali.thakkar@vates.tech>
References: <cover.1709846387.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c1048633bc104bee924125ad065e382c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240307:md
Date: Thu, 07 Mar 2024 21:40:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

While sev and sev_es bits are not yet enabled in xen,
including their status in the VMCB dump could be
informational.Therefore, print it via svmdebug.

Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>
---
JFYI, we'll send the follow-up patches with the enablement
of sev and ASP driver.
---
 xen/arch/x86/hvm/svm/svmdebug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index 24358c6eea..f54b426fb3 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -53,6 +53,8 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
            vmcb->exitinfo1, vmcb->exitinfo2);
     printk("np_ctrl = %#"PRIx64" guest_asid = %#x\n",
            vmcb_get_np_ctrl(vmcb), vmcb_get_guest_asid(vmcb));
+    printk("sev = %d sev_es = %d\n",
+           vmcb_get_sev(vmcb), vmcb_get_sev_es(vmcb));
     printk("virtual vmload/vmsave = %d, virt_ext = %#"PRIx64"\n",
            vmcb->virt_ext.fields.vloadsave_enable, vmcb->virt_ext.bytes);
     printk("cpl = %d efer = %#"PRIx64" star = %#"PRIx64" lstar = %#"PRIx64"\n",
-- 
2.44.0

