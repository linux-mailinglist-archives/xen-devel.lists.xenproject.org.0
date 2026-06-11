Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r44pIPXEKmpLwgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:23:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252AF672AE6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:23:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1335645.1597838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgJn-0004Wt-SI; Thu, 11 Jun 2026 14:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335645.1597838; Thu, 11 Jun 2026 14:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgJn-0004VQ-Oc; Thu, 11 Jun 2026 14:23:39 +0000
Received: by outflank-mailman (input) for mailman id 1335645;
 Thu, 11 Jun 2026 14:23:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vulab@iscas.ac.cn>) id 1wXgJm-0004Tg-EB
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:23:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXgJl-004kQW-RP
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:23:37 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vulab@iscas.ac.cn>)
 id 6a2ac4e4-bab6-0a2a0a5309dd-0a2a4502a182-18
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:23:36 +0200
Received: from [159.226.251.25] (helo=cstnet.cn)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <vulab@iscas.ac.cn>)
 id 6a2ac4e5-af86-0a2a45020019-9fe2fb1997a8-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:23:35 +0200
Received: from localhost.localdomain (unknown [117.182.75.76])
 by APP-05 (Coremail) with SMTP id zQCowACXHgLixCpq43AXEw--.957S2;
 Thu, 11 Jun 2026 22:23:32 +0800 (CST)
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
From: WenTao Liang <vulab@iscas.ac.cn>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	WenTao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] xen/gntdev: fix refcount leak in gntdev_ioctl_map_grant_ref()
Date: Thu, 11 Jun 2026 22:23:28 +0800
Message-ID: <20260611142328.87566-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACXHgLixCpq43AXEw--.957S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF13Zw4kWr1UXFyxtFy8Grg_yoW8GF1fpa
	9xCa43ArWrXw1Iq3WqqayagFy5X3sxJFy3Cry0k3s8ZFnIy3WIyr15tFy8ur4UJrs7CrW5
	Ar4kCFyruFW5A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUf8nOUUU
	UU=
X-Originating-IP: [117.182.75.76]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRAPA2oqh4XCBgAAsT
X-purgate-ID: tlsNG-720697/1781187816-7BD67161-C9C54D9A/0/0
X-purgate-type: clean
X-purgate-size: 1382
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[vulab@iscas.ac.cn,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:vulab@iscas.ac.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DMARC_NA(0.00)[iscas.ac.cn];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime];
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
X-Rspamd-Queue-Id: 252AF672AE6

When gntdev_ioctl_map_grant_ref() fails to copy the operation
result back to userspace after successfully adding the mapping to
the list, the error path returns -EFAULT without releasing the
reference acquired by gntdev_alloc_map(). The mapping remains in
priv->maps with a refcount of 1, causing a memory leak and a
dangling list entry.

Fix this by moving the copy_to_user() before gntdev_add_map(),
so that the mapping is only inserted into the list on success.
This avoids the need to remove the mapping from the list on error.

Cc: stable@vger.kernel.org
Fixes: 68b025c813c2 ("xen-gntdev: Add reference counting to maps")
Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
---
 drivers/xen/gntdev.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 61ea855c4508..a1c230756b3d 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -672,8 +672,13 @@ static long gntdev_ioctl_map_grant_ref(struct gntdev_priv *priv,
 	op.index = map->index << PAGE_SHIFT;
 	mutex_unlock(&priv->lock);
 
-	if (copy_to_user(u, &op, sizeof(op)) != 0)
+	if (copy_to_user(u, &op, sizeof(op)) != 0) {
+		mutex_lock(&priv->lock);
+		list_del(&map->next);
+		mutex_unlock(&priv->lock);
+		gntdev_put_map(priv, map);
 		return -EFAULT;
+	}
 
 	return 0;
 }
-- 
2.50.1 (Apple Git-155)


