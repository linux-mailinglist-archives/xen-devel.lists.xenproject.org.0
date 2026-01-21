Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOg/ER+PcGkaYgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 09:32:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A087C539BB
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 09:32:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209436.1521431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viTcP-0008Bz-UZ; Wed, 21 Jan 2026 08:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209436.1521431; Wed, 21 Jan 2026 08:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viTcP-00089G-RT; Wed, 21 Jan 2026 08:31:13 +0000
Received: by outflank-mailman (input) for mailman id 1209436;
 Wed, 21 Jan 2026 08:26:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yo3L=72=gmail.com=mmyangfl@srs-se1.protection.inumbo.net>)
 id 1viTXW-000789-7Z
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 08:26:10 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d553e3e0-f6a2-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 09:26:08 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2a79998d35aso4250965ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 00:26:08 -0800 (PST)
Received: from d.home.mmyangfl.tk ([2001:19f0:8001:1644:5400:5ff:fe3e:12b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7190d14cfsm147637005ad.38.2026.01.21.00.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 00:26:05 -0800 (PST)
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
X-Inumbo-ID: d553e3e0-f6a2-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768983966; x=1769588766; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pOfh991Nf5x6cbHEyitGr4ECnygIc5lXslxo+H2b9a0=;
        b=iIHjYIW8ExwXFwlPRkAudkl7I+1lSaKNkXmOJF5466GmpMZH0jqFzU4DMYW4jvXcr6
         3SuAMOeMg7G53Qmk4ABhyQE172ne35AUns8rTnRYVjoIMwPXtUmc1ZQPUeVwYURs/7ej
         s+Qiq0RNByLheOSwMfB0N3MNoiM0kupd+5Q+CcrpqRz+L+sv62g2uSHz/Aa2JqW3JsBJ
         ZSJKEpoh4LoOWBcg1Ihd1viN1XUq59MQfj076iHGVobqhvjCqfGa+NUKN438rxP3tjpW
         n/OauMlPgjKgzfTXJ973Tqe1TGYZKcKrdB49bnrheBVYwjg72fJBZnPQWLSZnS/0qz08
         DILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768983966; x=1769588766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOfh991Nf5x6cbHEyitGr4ECnygIc5lXslxo+H2b9a0=;
        b=UWG5pDcLb37f64PVzm1eZi1PlX8eLywPRp3oNF7gMjtoTlKbnm2Vg9uleNOWq3uEtz
         3+iwJ54JHLU5Ff3iBCnhEzY7DRozZIWMXoN339qB3ss03/FSAbxggO1gx7e66Vu/MBbD
         QjK3/mPgv90NcBQ1+ewVxYFDt1y7V4BP9Y32HEyzhyL/F25H4uATAS4LxK0ZxhsSVlOf
         gHnF8immIL2Xo5tBX35nqeMFwCWu2hNroPkmJlfCqcb7OVhntXwIH2oCK/vPB2ks/ILW
         7BJIOYF7K52lbCH9HbLKiS70JRw5s0pXwVqUMm5iWXdPGxw6vQC+euM3/bwlwLjB1il2
         re5g==
X-Forwarded-Encrypted: i=1; AJvYcCWec4VErRlIKOzGzMVmDeHOuU7lvEOWJK+14qbAxEy/G0Ak9Ap8TGLcKtXJp/D58GgscWB/MkYEy4g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzROORnaLeLpHidK/6cVkeysCi5Nm+sDXyiPShkiSeBqTsFiPWf
	wQnYez7SOmBGN4uKd0R63qMpGmnKHX4ihrR/ILCrh6zwYZehIAX0TSqsAlXocg==
X-Gm-Gg: AZuq6aJGzT4GunRCqyUlFjdL1jKtRLKoer6/kjpZ6hLRMAQIVbAGT4K3W/0bA7e/EFM
	z980qSDL08YOVroxYl/9Wun2EQffJFRHlgnSySSDwjM/UJyYgyWueYzvGMpi1a/KJLlsUnR2cn8
	2eYOVESrd4/H3AUrLBoB4yHWLgvU0czuvnG8n8pp1LP4hkfqMzWx4CDOpnQM2PbZsjAQFyDa+Pc
	HE1lv0hUztrwHp+1yP3ZkO/KvWvaISDHPlarOimAmBPp1WZ3oHzkSMGuXYebgJ8ywt5adCcLOoi
	UoqMhf7E0wDhCx8Kd7b4mivWpXuAywVcC/d2Bd+wocNjaRFMg1Uw5rdEm2M2BVbGI5PsPMhDYyB
	eArGS0Tt3f58okGTR5bcWtQp2W12kMUv6De4vibFAZKvzQXa24wTUBlgK9h1R/DY0/Wn5mVhxiN
	DxD3DNG1wAhKeSmZA9FPC1BdmY7UbaNbgxqfidSRwmQQ0PMT4lzGP6gA==
X-Received: by 2002:a17:903:1110:b0:271:479d:3dcb with SMTP id d9443c01a7336-2a717518996mr161853105ad.6.1768983966532;
        Wed, 21 Jan 2026 00:26:06 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] xen/netfront: Use u64_stats_t with u64_stats_sync properly
Date: Wed, 21 Jan 2026 16:25:46 +0800
Message-ID: <20260121082550.2389249-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,kernel.org,epam.com,lunn.ch,davemloft.net,google.com,redhat.com,lists.xenproject.org,vger.kernel.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:mmyangfl@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[mmyangfl@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[mmyangfl@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel,netdev];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A087C539BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 64bit arches, struct u64_stats_sync is empty and provides no help
against load/store tearing. Convert to u64_stats_t to ensure atomic
operations.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/xen-netfront.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 7c2220366623..0969d5c9f6b7 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -97,8 +97,8 @@ struct netfront_cb {
 static DECLARE_WAIT_QUEUE_HEAD(module_wq);
 
 struct netfront_stats {
-	u64			packets;
-	u64			bytes;
+	u64_stats_t		packets;
+	u64_stats_t		bytes;
 	struct u64_stats_sync	syncp;
 };
 
@@ -634,8 +634,8 @@ static int xennet_xdp_xmit_one(struct net_device *dev,
 		notify_remote_via_irq(queue->tx_irq);
 
 	u64_stats_update_begin(&tx_stats->syncp);
-	tx_stats->bytes += xdpf->len;
-	tx_stats->packets++;
+	u64_stats_add(&tx_stats->bytes, xdpf->len);
+	u64_stats_inc(&tx_stats->packets);
 	u64_stats_update_end(&tx_stats->syncp);
 
 	return 0;
@@ -843,8 +843,8 @@ static netdev_tx_t xennet_start_xmit(struct sk_buff *skb, struct net_device *dev
 		notify_remote_via_irq(queue->tx_irq);
 
 	u64_stats_update_begin(&tx_stats->syncp);
-	tx_stats->bytes += skb->len;
-	tx_stats->packets++;
+	u64_stats_add(&tx_stats->bytes, skb->len);
+	u64_stats_inc(&tx_stats->packets);
 	u64_stats_update_end(&tx_stats->syncp);
 
 	if (!netfront_tx_slot_available(queue))
@@ -1249,8 +1249,8 @@ static int handle_incoming_queue(struct netfront_queue *queue,
 		}
 
 		u64_stats_update_begin(&rx_stats->syncp);
-		rx_stats->packets++;
-		rx_stats->bytes += skb->len;
+		u64_stats_inc(&rx_stats->packets);
+		u64_stats_add(&rx_stats->bytes, skb->len);
 		u64_stats_update_end(&rx_stats->syncp);
 
 		/* Pass it up. */
@@ -1400,14 +1400,14 @@ static void xennet_get_stats64(struct net_device *dev,
 
 		do {
 			start = u64_stats_fetch_begin(&tx_stats->syncp);
-			tx_packets = tx_stats->packets;
-			tx_bytes = tx_stats->bytes;
+			tx_packets = u64_stats_read(&tx_stats->packets);
+			tx_bytes = u64_stats_read(&tx_stats->bytes);
 		} while (u64_stats_fetch_retry(&tx_stats->syncp, start));
 
 		do {
 			start = u64_stats_fetch_begin(&rx_stats->syncp);
-			rx_packets = rx_stats->packets;
-			rx_bytes = rx_stats->bytes;
+			rx_packets = u64_stats_read(&rx_stats->packets);
+			rx_bytes = u64_stats_read(&rx_stats->bytes);
 		} while (u64_stats_fetch_retry(&rx_stats->syncp, start));
 
 		tot->rx_packets += rx_packets;
-- 
2.51.0


