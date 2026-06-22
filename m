Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sOAxAdwbOWrrmwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 13:26:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0116AF0C4
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 13:26:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1343646.1602891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbcmp-0005qv-Ih; Mon, 22 Jun 2026 11:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343646.1602891; Mon, 22 Jun 2026 11:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbcmp-0005p4-GB; Mon, 22 Jun 2026 11:25:55 +0000
Received: by outflank-mailman (input) for mailman id 1343646;
 Mon, 22 Jun 2026 11:25:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vulab@iscas.ac.cn>) id 1wbcmo-0005oy-1k
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 11:25:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbcmm-007YAG-OR
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 13:25:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vulab@iscas.ac.cn>)
 id 6a391bba-bab6-0a2a0a5309dd-0a2a450bc16c-10
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 13:25:50 +0200
Received: from [159.226.251.81] (helo=cstnet.cn)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <vulab@iscas.ac.cn>)
 id 6a391bbb-5e53-0a2a450b0019-9fe2fb5183b8-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 13:25:49 +0200
Received: from localhost.localdomain (unknown [117.182.74.238])
 by APP-03 (Coremail) with SMTP id rQCowADH5dy4GzlqFCSGFQ--.2637S2;
 Mon, 22 Jun 2026 19:25:46 +0800 (CST)
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
From: Wentao Liang <vulab@iscas.ac.cn>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2] xen/gntdev: fix error handling in ioctl
Date: Mon, 22 Jun 2026 19:25:41 +0800
Message-Id: <20260622112541.38194-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADH5dy4GzlqFCSGFQ--.2637S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF13Zw4kWry7trWfZrW7CFg_yoW8Aw4Dp3
	9xKa98Ar4rX3yIq3Wqyaya9FyFg34fKFW8CFykK3Z8ZrnIv3W2vr15tFyjgr4UJws7urW5
	Zr1v9FyruFW5ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbSfO7UUUU
	U==
X-Originating-IP: [117.182.74.238]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwkGA2o43crsHAAAs+
X-purgate-ID: tlsNG-42698a/1782127550-46FE100E-34595B79/0/0
X-purgate-type: clean
X-purgate-size: 1796
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:vulab@iscas.ac.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vulab@iscas.ac.cn,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime];
	FROM_NEQ_ENVFROM(0.00)[vulab@iscas.ac.cn,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C0116AF0C4

When gntdev_ioctl_map_grant_ref() fails to copy the operation result
back to userspace after successfully adding the mapping to the list,
the error path returns -EFAULT without releasing the reference
acquired by gntdev_alloc_map(). The mapping remains in priv->maps
with a refcount of 1, causing a memory leak and a dangling list
entry.

Additionally, gntdev_add_map() may modify map->index to avoid overlap
with existing mappings. Therefore, the index returned to userspace
must be obtained after gntdev_add_map() completes.

Fix this by holding the mutex across gntdev_add_map(), retrieving
the correct index, and copy_to_user(). If copy_to_user() fails,
remove the mapping from the list and release the reference while
still holding the lock.

Cc: stable@vger.kernel.org

Fix these issues by properly handling all error cases.

Fixes: 1401c00e59ea ("xen/gntdev: convert priv->lock to a mutex")
Fixes: 68b025c813c2 ("xen-gntdev: Add reference counting to maps")

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/xen/gntdev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 61ea855c4508..1dcc4675580e 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -670,11 +670,15 @@ static long gntdev_ioctl_map_grant_ref(struct gntdev_priv *priv,
 	mutex_lock(&priv->lock);
 	gntdev_add_map(priv, map);
 	op.index = map->index << PAGE_SHIFT;
-	mutex_unlock(&priv->lock);
 
-	if (copy_to_user(u, &op, sizeof(op)) != 0)
+	if (copy_to_user(u, &op, sizeof(op)) != 0) {
+		list_del(&map->next);
+		mutex_unlock(&priv->lock);
+		gntdev_put_map(priv, map);
 		return -EFAULT;
+	}
 
+	mutex_unlock(&priv->lock);
 	return 0;
 }
 
-- 
2.39.5 (Apple Git-154)


