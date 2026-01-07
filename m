Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BA9CFEF64
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 17:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197013.1514701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWoI-00008r-HZ; Wed, 07 Jan 2026 16:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197013.1514701; Wed, 07 Jan 2026 16:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWoI-0008V9-Bp; Wed, 07 Jan 2026 16:55:02 +0000
Received: by outflank-mailman (input) for mailman id 1197013;
 Wed, 07 Jan 2026 16:55:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hzfu=7M=bounce.vates.tech=bounce-md_30504962.695e8fe0.v1-69d9506fa8e44d5ea0d5c68a30f8e736@srs-se1.protection.inumbo.net>)
 id 1vdWoG-0008Pf-JV
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 16:55:00 +0000
Received: from mail132-4.atl131.mandrillapp.com
 (mail132-4.atl131.mandrillapp.com [198.2.132.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98f6e935-ebe9-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 17:54:58 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-4.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4dmZ001jfGzlfh3m
 for <xen-devel@lists.xenproject.org>; Wed,  7 Jan 2026 16:54:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 69d9506fa8e44d5ea0d5c68a30f8e736; Wed, 07 Jan 2026 16:54:56 +0000
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
X-Inumbo-ID: 98f6e935-ebe9-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767804896; x=1768074896;
	bh=dvpM8KfreT681wQu18BQ2I0ULSna7H2R9oVtTe2ENm4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=e8EAewOz0fErJtY7w8S95VOq2xku94JGgLX3q5ZZ2OWilXm7DlrI/nnIQR79W8+go
	 CTeM76XNZGxI9XM3JgKgB90wgwiufLKHcMEKV5nIX95XAu3YxS6SScaVzasFAGgwHp
	 Kz38CC3Q+5xNeIZDkpJN9Zc78EYS1wCTj64YnhjF5IkwUCG4wWo3WQ4TVMH9ecihTd
	 0BMZy7SmIZxnEQnGFzw1cpU1H6Cr6aVFkTQOisA2nQmScDu68HTTG0kLHQJrzIPDR3
	 Cch3U6idTIzDIr9lbLlcLJF+LVdUZ7bUjW6fq7K041q4mbAPuPllejyi3R0qfXjjfp
	 20pvYpyuexZ8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767804896; x=1768065396; i=teddy.astie@vates.tech;
	bh=dvpM8KfreT681wQu18BQ2I0ULSna7H2R9oVtTe2ENm4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qpqNwKDxqFkws5MglGsiYHva3+IMoi9VsGzWj2g2czJ2lLaSNfIlQeoId7KXKQniA
	 U2ooEGKbCzsKkQlROcmwfvEuwrUKMrhfyDuHT7xBqWJCKPvZEbZ8HltJ69JbVRdeXF
	 C8WGqltiCZLr/bwCZLzVfWkx82n3TXJDW72P5+GX/R78yrypqM4p+ldh3NwpbRbZAp
	 R+CIna8O08CL9i9Tu5X37QUjpUxvTyV0Yr7Gj+w2EWJn0JVlRIL3XmugdVA3cGWZL/
	 Xx/JkyGcMiGy3zzdq15N1hQ1fxdEjipZi1R6BnZseJJ7C2cR0Q+cefI1LptcCTjmcs
	 SRpJstzfncccg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v1=201/2]=20x86/pci:=20Improve=20pci=5Fmmcfg=5F{read,write}=20error=20handling?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767804895192
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <1042a6163ae71527987a853e3c746c8a6633c0ee.1767804090.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1767804090.git.teddy.astie@vates.tech>
References: <cover.1767804090.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.69d9506fa8e44d5ea0d5c68a30f8e736?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260107:md
Date: Wed, 07 Jan 2026 16:54:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Return -ENODEV in case no mmcfg information is available instead of -EINVAL,
that is also returned when the parameters are incorrect.

It helps us distinguish between incorrect usage and no MMCFG support.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/x86_64/mmconfig_64.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/x86_64/mmconfig_64.c b/xen/arch/x86/x86_64/mmconfig_64.c
index ffdc62700d..1a2803d2a3 100644
--- a/xen/arch/x86/x86_64/mmconfig_64.c
+++ b/xen/arch/x86/x86_64/mmconfig_64.c
@@ -60,15 +60,15 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
 {
     char __iomem *addr;
 
+    *value = -1;
+
     /* Why do we have this when nobody checks it. How about a BUG()!? -AK */
-    if (unlikely((bus > 255) || (devfn > 255) || (reg > 4095))) {
-err:        *value = -1;
+    if ( unlikely((bus > 255) || (devfn > 255) || (reg > 4095)) )
         return -EINVAL;
-    }
 
     addr = pci_dev_base(seg, bus, devfn);
     if (!addr)
-        goto err;
+        return -ENODEV;
 
     switch (len) {
     case 1:
@@ -96,7 +96,7 @@ int pci_mmcfg_write(unsigned int seg, unsigned int bus,
 
     addr = pci_dev_base(seg, bus, devfn);
     if (!addr)
-        return -EINVAL;
+        return -ENODEV;
 
     switch (len) {
     case 1:
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


