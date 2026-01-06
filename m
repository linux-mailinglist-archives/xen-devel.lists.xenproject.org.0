Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676B7CF9BD8
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 18:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196371.1514205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdAzI-0003Bw-CC; Tue, 06 Jan 2026 17:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196371.1514205; Tue, 06 Jan 2026 17:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdAzI-00038p-9J; Tue, 06 Jan 2026 17:36:56 +0000
Received: by outflank-mailman (input) for mailman id 1196371;
 Tue, 06 Jan 2026 17:36:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J2WE=7L=bounce.vates.tech=bounce-md_30504962.695d4831.v1-bfe4d8aa3bf34ea088abf611718410b1@srs-se1.protection.inumbo.net>)
 id 1vdAzH-00038j-70
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 17:36:55 +0000
Received: from mail132-4.atl131.mandrillapp.com
 (mail132-4.atl131.mandrillapp.com [198.2.132.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48df8576-eb26-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 18:36:52 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-4.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4dlyyp0gVTzlfcH2
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jan 2026 17:36:50 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 bfe4d8aa3bf34ea088abf611718410b1; Tue, 06 Jan 2026 17:36:49 +0000
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
X-Inumbo-ID: 48df8576-eb26-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767721010; x=1767991010;
	bh=w3mV3E2iL19ORVQDih7RkM67id0b/WPDTgHutCZfw84=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=IlcgEn9aTOIPo7aVto3g5B3TVUeI1vYI3ZKIkXIiOGdBruPh3+BCgKVbCFlsLAwLi
	 hJDnpZct7vVPSeAvG3KmYpRdRj/2hHu98dOJ7AI0vZIF+SwcBFYpqmJsbsT6XRVyWz
	 I4+5RVSYPPPDO97nDTYqfcvlUPdSXvFDGnnaCyC7OFKijn1i7AuxraWiu9/g2B1okn
	 R2EIf6gtt4Jcmq+T3/mFs4p+W6kho+f/VG0Jxpj4eZog70mEeRlJwoDHBQq9Mr2PHI
	 0URLDF5OHQ7kPYnpU+rwGKd1sGliRRTry7M8Im3+VSN9PgRUpZjVnKBy2zP8KR4SjU
	 D4KDka/JDPJ3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767721010; x=1767981510; i=teddy.astie@vates.tech;
	bh=w3mV3E2iL19ORVQDih7RkM67id0b/WPDTgHutCZfw84=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=gkW6SiOF15wS5oFhi4GscfzabCvx6VxzbcLjKybXDnAT7/kiNe3WRuOk2260zCERF
	 nRcF/j/YgA8b810Uk4k1qx/b03yaaxs4WHqmfO0nBBn2Dbv1IA9x/mYRcCY9DQQwxN
	 2P1tUdWs4rbw5egWCqKLCUREFVWKVpwYxWM3PkCm5R/44FE+1WvTu7aAC3MTImgr2i
	 +xVb1FOvFHoL82Bu9LSEHblif623dWCVDN0iXH4CMUlyh3df45HzYyGiIjt6+VwG9b
	 pQcS4pL1DzYYHrVFA2tr48gGGVHfJePNUR+UH4tjMJkRzXPzG4hnFBW3yGr6Sk3iQ0
	 51BXaUY8QnzDg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20xen/virtio:=20Don't=20use=20grant-dma-ops=20when=20running=20as=20Dom0?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767721008494
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Boris Ostrovsky" <boris.ostrovsky@oracle.com>
Message-Id: <6698564dd2270a9f7377b78ebfb20cb425cabbe8.1767720955.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.bfe4d8aa3bf34ea088abf611718410b1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260106:md
Date: Tue, 06 Jan 2026 17:36:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Dom0 inherit devices from the machine and is usually in PV mode.
If we are running in a virtual that has virtio devices, these devices
would be considered as using grants with Dom0 as backend, while being
the said Dom0 itself, while we want to use these devices like regular
PCI devices.

Fix this by preventing grant-dma-ops from being used when running as Dom0
(initial domain). We still keep the device-tree logic as-is.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
Fixes: 61367688f1fb0 ("xen/virtio: enable grant based virtio on x86")
---
CC: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>

 drivers/xen/grant-dma-ops.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 14077d23f2a1..c2603e700178 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -366,7 +366,8 @@ static int xen_grant_init_backend_domid(struct device *dev,
 	if (np) {
 		ret = xen_dt_grant_init_backend_domid(dev, np, backend_domid);
 		of_node_put(np);
-	} else if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_pv_domain()) {
+	} else if (!xen_initial_domain() &&
+		   (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_pv_domain())) {
 		dev_info(dev, "Using dom0 as backend\n");
 		*backend_domid = 0;
 		ret = 0;
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


