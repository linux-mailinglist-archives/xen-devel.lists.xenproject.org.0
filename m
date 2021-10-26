Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2B143AC28
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 08:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216199.375740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfFkc-0004nH-JI; Tue, 26 Oct 2021 06:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216199.375740; Tue, 26 Oct 2021 06:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfFkc-0004kG-Fv; Tue, 26 Oct 2021 06:15:58 +0000
Received: by outflank-mailman (input) for mailman id 216199;
 Tue, 26 Oct 2021 03:27:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJH3=PO=iscas.ac.cn=jiasheng@srs-us1.protection.inumbo.net>)
 id 1mfD82-00064z-9H
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 03:27:58 +0000
Received: from cstnet.cn (unknown [159.226.251.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b4a15a7e-360c-11ec-8423-12813bfff9fa;
 Tue, 26 Oct 2021 03:27:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.128])
 by APP-05 (Coremail) with SMTP id zQCowAAH6u61dXdhPPotBQ--.46973S2;
 Tue, 26 Oct 2021 11:27:50 +0800 (CST)
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
X-Inumbo-ID: b4a15a7e-360c-11ec-8423-12813bfff9fa
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH] xen: Fix implicit type conversion
Date: Tue, 26 Oct 2021 03:27:48 +0000
Message-Id: <1635218868-2437564-1-git-send-email-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID:zQCowAAH6u61dXdhPPotBQ--.46973S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw18Xr43urW8Gr4Uuw43trb_yoWDtFbE9r
	s0qr1xXrWvvF1qvayUKw4fZFW09w1xuayfXw1qg39xAw1Sqr47Xryjqr93Xw17GrWIyFsr
	Zw17Xr1xAryUGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
	GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU84SoDUUUU
X-Originating-IP: [124.16.138.128]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/

The variable 'i' is defined as UINT.
However in the for_each_possible_cpu, its value is assigned to -1.
That doesn't make sense and in the cpumask_next() it is implicitly
type conversed to INT.
It is universally accepted that the implicit type conversion is
terrible.
Also, having the good programming custom will set an example for
others.
Thus, it might be better to change the definition of 'i' from UINT
to INT.

Fixes: 3fac101 ("xen: Re-upload processor PM data to hypervisor after S3 resume (v2)")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/xen/xen-acpi-processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
index df7cab8..2551691 100644
--- a/drivers/xen/xen-acpi-processor.c
+++ b/drivers/xen/xen-acpi-processor.c
@@ -518,7 +518,7 @@ static struct syscore_ops xap_syscore_ops = {
 
 static int __init xen_acpi_processor_init(void)
 {
-	unsigned int i;
+	int i;
 	int rc;
 
 	if (!xen_initial_domain())
-- 
2.7.4


