Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68E3719FF1
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:28:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542546.846546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHd-000732-Fu; Thu, 01 Jun 2023 14:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542546.846546; Thu, 01 Jun 2023 14:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jHd-000702-AP; Thu, 01 Jun 2023 14:28:09 +0000
Received: by outflank-mailman (input) for mailman id 542546;
 Thu, 01 Jun 2023 14:28:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Xwn=BV=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q4jHc-00066T-59
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:28:08 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86e6c215-0088-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 16:28:07 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.5.3 AUTH)
 with ESMTPSA id L38909z51ES11So
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jun 2023 16:28:01 +0200 (CEST)
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
X-Inumbo-ID: 86e6c215-0088-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1685629681; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=RdU2wH2wP6gPwbVMH62EKme8z/QCnUaXOiHFqncxlGmIdDBvPrbQourb0aBlOgOH/V
    obEQFi3tltEgdnzIzBgndNvHBHtH5tXZ0ovBWCdbGXBvgz/+pejT5xN5BaJjHBypQ7AQ
    5ZFXDh0YBj01CetBE82YDSTEhuH/wYsqlPU8mq2E0T3TR4XoqYpzGn2KAJbNln5WjRzi
    FLGFH4qIhYJG20bxyNK6+8QJvJxyF0tHqFUUdRfmPZ2UrAymCc1euy6GTpBbm2S1np75
    DyoL4cv6zRYZTzWQdnpegGYyrtPTiMF9/1IyMQ2KwI04mWUQaFZEZcndXlylUS3XmRqh
    coSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629681;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=j6XBpMmDw+ppBy9pdGC4zIeWbEgfy6izbkgl65jdiEw=;
    b=qJMe87sKlyuMaZB4GpR5nWLyeFEz1xReFafLn9OtuY39fPVQK43uqR6HucyloRHzak
    r6iCLwWfGCbYkzg7zSNfTvpHF26kogC4aRlvVPdo2fSMHryaDig66ZK4iqW8LH1e6jTr
    3KQbmuij/f24Zdvw0n4Yb1U0f7SsQnlKHXoKkgQ8rfOh4G6xbuMRF21X6eRWlk4RJKgW
    U90i698cXEHjZSLv2NRTXgfLxAEANirPVD3RjzX/yde1YZjhoHCXu4XtKQJjN6RiO7X0
    NsctqvyZph6HpnMbOeuVM6A48fEoAAPm9pzuUFWvJEai3OBP6zFjWWllNyJe5KEPMp65
    djzA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685629681;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=j6XBpMmDw+ppBy9pdGC4zIeWbEgfy6izbkgl65jdiEw=;
    b=hYFBOR4+N24HBqH7GBW6Qcmj2MK/zxJ9kFTOQdnTwbDB/1DXy0aiRbWO5jxKEAUXMJ
    Mp6v9zgB3pI8BJPKILRaLTj0qYFOkueRgX46SBJW0eUdj9fOsP9n1prpVEOOg80itDOV
    px4cA+qv1FZTYBpRhQmQBoKH1+yLG53dwArkJwdv5QSDAZYeXl6dG0rlMN8bQ1Cvc2Cf
    1P2wXENH7yWKVZb8JiMR1rfeBOR7V6RosILrNT+XkQ0oV2HADWLHXAhcGCcI+NijkhbQ
    iNBlpxlDIPBuCuDwhfCdPhl6VSHV9cXPO1+lPop66vGMqhaIGCturjJhMuR4qCCUbMLi
    pRdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685629681;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=j6XBpMmDw+ppBy9pdGC4zIeWbEgfy6izbkgl65jdiEw=;
    b=5nc3yv1RMR484ne3P7YoKcYcBhohN8FvCgQkyKZruYSi2v0xkJZQS8/d5kaiy17XMX
    rAUTrvjMRd1xYKEWQTAg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4xqFv7EJ0tgRX/vKfT/e8Ig6v0dNw4QAWpzMWrRQ=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 3/7] xenalyze: sync with vmx.h, use EXIT_REASON_PENDING_VIRT_INTR
Date: Thu,  1 Jun 2023 16:27:38 +0200
Message-Id: <20230601142742.15489-4-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230601142742.15489-1-olaf@aepfle.de>
References: <20230601142742.15489-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/xentrace/xenalyze.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index a50538e9a8..1cae055ef4 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -447,7 +447,7 @@ struct {
 #define EXIT_REASON_SIPI                4
 #define EXIT_REASON_IO_SMI              5
 #define EXIT_REASON_OTHER_SMI           6
-#define EXIT_REASON_PENDING_INTERRUPT   7
+#define EXIT_REASON_PENDING_VIRT_INTR   7
 #define EXIT_REASON_PENDING_VIRT_NMI    8
 #define EXIT_REASON_TASK_SWITCH         9
 #define EXIT_REASON_CPUID               10
@@ -503,7 +503,7 @@ const char * hvm_vmx_exit_reason_name[HVM_VMX_EXIT_REASON_MAX] = {
     [EXIT_REASON_SIPI]="SIPI",
     [EXIT_REASON_IO_SMI]="IO_SMI",
     [EXIT_REASON_OTHER_SMI]="OTHER_SMI",
-    [EXIT_REASON_PENDING_INTERRUPT]="PENDING_INTERRUPT",
+    [EXIT_REASON_PENDING_VIRT_INTR]="PENDING_VIRT_INTR",
     [EXIT_REASON_PENDING_VIRT_NMI]="PENDING_VIRT_NMI",
     [EXIT_REASON_TASK_SWITCH]="TASK_SWITCH",
     [EXIT_REASON_CPUID]="CPUID",
@@ -4632,7 +4632,7 @@ void hvm_generic_postprocess(struct hvm_data *h)
             switch(h->exit_reason)
             {
                 /* These just need us to go through the return path */
-            case EXIT_REASON_PENDING_INTERRUPT:
+            case EXIT_REASON_PENDING_VIRT_INTR:
             case EXIT_REASON_TPR_BELOW_THRESHOLD:
                 /* Not much to log now; may need later */
             case EXIT_REASON_WBINVD:

