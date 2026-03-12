Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECfOMcT6smmLRAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 18:41:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D84C276AB8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 18:41:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252859.1549390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0k1e-0002OR-5M; Thu, 12 Mar 2026 17:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252859.1549390; Thu, 12 Mar 2026 17:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0k1e-0002Lv-29; Thu, 12 Mar 2026 17:40:46 +0000
Received: by outflank-mailman (input) for mailman id 1252859;
 Thu, 12 Mar 2026 17:40:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Gzm=BM=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1w0k1c-0002Lm-FX
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 17:40:44 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9436aed2-1e3a-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 18:40:38 +0100 (CET)
Received: from MN2PR01CA0066.prod.exchangelabs.com (2603:10b6:208:23f::35) by
 IA1PR12MB6211.namprd12.prod.outlook.com (2603:10b6:208:3e5::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.7; Thu, 12 Mar 2026 17:40:32 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:208:23f:cafe::bc) by MN2PR01CA0066.outlook.office365.com
 (2603:10b6:208:23f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 17:40:33 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Thu, 12 Mar 2026 17:40:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 12 Mar
 2026 12:40:25 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Mar
 2026 12:36:15 -0500
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Thu, 12 Mar 2026 12:36:13 -0500
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
X-Inumbo-ID: 9436aed2-1e3a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sg8uF+fEJLpMLAmcI23RxViePufPtat9MchzkTBk7UpFttNlcazkvPCvn4u456q5nTr8yh2ENfvzEeZEk1vSb7SllMG/4ZOs+YATz+SvlbX3HtbIE0BRENfN5zJNJG+UauGLE5pMdK9yA/jDgMgT+Dk1zCxI4KtIXh84+UfiS1EeQxh/GGu8ClVpzN6zKEUIGI4Hb6AlUnc2SqYWxZtlTGj2LUF9cpXSpVftQdjDmwcAzTU45DNSQw96Go/qNOFzd6WYPjSh0hxw1z2Et/zMtqTQf4uAGd8Pr0WwUVnt3wJY/OYnJ0tZaFdyxrfRYVcDQBPFErxFcu5FjOo2ifZbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07vyBeJURv8H6MFtvs6x930jEhHUd3uoBFGZSqh7bsQ=;
 b=J4WSCBwD1+wEVEZIg9OLjcabtRlHw2/ot4CV9bPZFoFKyZfp6xQosE71yxBuqAULsK6Br370uw8zwJkLb20x3HqOACMZX+g3ZlS6xeWks5D/D3+EozGyP2yMNq1CzfSbJEzW3ARy0L1zO+60Rnf8R0vmNToxm5gfp46RGb0L+pFHBtMlVoN4x1ZzQwcTxQoFjgYPSVcOcaueJ561y2e/9VmuGLvQnltJPOgzuN+Mt6KVuXQ15LwvdvK5+q5gFIL2G4SFFaL/xnGDmNoQlZ1QHMmb68BTwIU0E7fs6luVv5hBeimmh2Q4LqDZulVQuF5ppivw6lJ9pPoC+104vLs3hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07vyBeJURv8H6MFtvs6x930jEhHUd3uoBFGZSqh7bsQ=;
 b=tFkT9u02dDgQNoikKUp9dnGg9b3GdI1uKD6suq0li7IZl3fsNK4dOJ9499/HykDcGz464jIW/YgkXCAOxJecpyuTyt2Vx4rit6Qw3otyZjSmMqPmZOuOb+sDnjo9mn5UGbuaBn3wV2M4ptguZq07xHTbqFNBCnI0VXZ7/mAsHU8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH] hvc/xen: Check console connection flag
Date: Thu, 12 Mar 2026 13:38:44 -0400
Message-ID: <20260312173845.47235-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|IA1PR12MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4849b2-c6fd-4998-a035-08de805e75a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|30052699003|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ymtyRnfE3ZvQUhU1pERSLT7qLhoAJ8g+hmJl/BfwnAjMx0BV+l4EKysHcFWfZlccmVCiZlFv/zcqtRE38nvlOieIwnlzILJQ0Zdqfg+BOMfGWjHiKtkYkHkw14yjx8fCA4J8EgaRrHrpd35JY1fDkl6iJ8DwEH+i/BSijn/geceaDZ97RDYa1OHI4RqOPI+udOGw+dDN+rRnMknjV7f2jpo9E0YzLdqSsOFLuVEO2bit72BxZUwuPqVfUnXD6M56hy8Lzkz9U/xe0jkMTh009HIiwa+vs/RJU5eAG+7kfCfqbfmFDgeE43j8IAF3I2Prioh9zL2lfSfZmeThl15QyRndGOOJF+nwfPtylgIZbWtG3Hquf0i4r4+Vbp+QCDYNzWrMdoKtOcOZBVKhxHI2ncuWTH4Bx0OJbt8NJdOnHQrCRzXkk88Lg2amz5gBNs4VMNIrbDlGHPKQAFU5NAJJcYme4qyxpDFuOJL9B+cGZqzevfil2+37Prqafrc9u5PTkcxKVfI3HwNhwy+98EblccjtB2QeFOnJ0EUQ5j7AtReq8wxKnJzrvrkCilUn5Id3TRdzSLV5yVbMTgpi1osJsL6QTuNuAjkoaG6d1AxXkpw6kmOEPTSXSLiIPvsJ9cAPtBKon21strWohTSPEQIIhg93+9NkLE+gmCF67kHASAJbYFpFwSnx4/MDXvLM+L/q5ZR71W0is7trAt2Cpm49WMQsffxmI5zbFWoGxMfBaqU9rMM8KRy/Sp+xjxz/JMbTh6gHq5k/5Ml+wSTiXNc+Kw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(30052699003)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KgGtq4XNktfI7JVL0t7pdU+cJRf26J3nng+D5I13pZK+pCkB0kmwNvYQoEFoztC7GEJQU/qZl2YPBm1YIQpasWp/0tPWSNTPXysFk/yRGSTIPqCxSYudm/rXFrQMC7o8+7krF8kemS+S9HCnnu/pLYrUeH1ujPe507wXXxBKI2+Rkv6MqPXmiAlk2k1zYaAJvxPzDJJiNcRKnXSEyg0mLRfEZyCtd84dOzuXPGeDFIX1zeYqskuMyv74jP8rAopWBb/oO3/pO3IEBUYFYdL6UqCF3QMnrLfbO82+fcvw5RGy0TWHmgSXJCQ/fLUzi7DUlQ9G6RD1s/iBEdbvADGAsek4R4K+FMrUb6XrMiLwkcnMRk/WaVfQR9n19n17vq5rlr0t/fMKGeXkakOcZo1KROIRlDSJCKaZJWmXzBR67GU8hduVFMbLIpa/dRji+zVS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 17:40:32.1929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4849b2-c6fd-4998-a035-08de805e75a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6211
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:jason.andryuk@amd.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2D84C276AB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the console out buffer is filled, __write_console() will return 0
as it cannot send any data.  domU_write_console() will then spin in
`while (len)` as len doesn't decrement until xenconsoled attaches.  This
would block a domU and nullify the parallelism of Hyperlaunch until dom0
userspace starts xenconsoled, which empties the buffer.

Xen 4.21 added a connection field to the xen console page.  This is set
to XENCONSOLED_DISCONNECTED (1) when a domain is built, and xenconsoled
will set it to XENCONSOLED_CONNECTED (0) when it connects.

Update the hvc_xen driver to check the field.  When the field is
disconnected, drop the write with -ENOTCONN.  We only drop the write
when the field is XENCONSOLED_DISCONNECTED (1) to try for maximum
compatibility.  The Xen toolstack has historically zero initialized the
console, so it should see XENCONSOLED_CONNECTED (0) by default.  If an
implemenation used uninitialized memory, only checking for
XENCONSOLED_DISCONNECTED could have the lowest chance of not connecting.

This lets the hyperlaunched domU boot without stalling.  Once dom0
starts xenconsoled, xl console can be used to access the domU's hvc0.

Update the console.h header to bring in the new field.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 drivers/tty/hvc/hvc_xen.c          |  3 +++
 include/xen/interface/io/console.h | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 7f0b6262488c..c407592442cd 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -139,6 +139,9 @@ static ssize_t domU_write_console(uint32_t vtermno, const u8 *data, size_t len)
 	if (cons == NULL)
 		return -EINVAL;
 
+	if (cons->intf->connection == XENCONSOLE_DISCONNECTED)
+		return -ENOTCONN;
+
 	/*
 	 * Make sure the whole buffer is emitted, polling if
 	 * necessary.  We don't ever want to rely on the hvc daemon
diff --git a/include/xen/interface/io/console.h b/include/xen/interface/io/console.h
index cf17e89ed861..687949bdebb1 100644
--- a/include/xen/interface/io/console.h
+++ b/include/xen/interface/io/console.h
@@ -19,6 +19,19 @@ struct xencons_interface {
     char out[2048];
     XENCONS_RING_IDX in_cons, in_prod;
     XENCONS_RING_IDX out_cons, out_prod;
+/*
+ * Flag values signaling from backend to frontend whether the console is
+ * connected.  i.e. Whether it will be serviced and emptied.
+ *
+ * The flag starts as disconnected.
+ */
+#define XENCONSOLE_DISCONNECTED 1
+/*
+ * The flag is set to connected when the backend connects and the console
+ * will be serviced.
+ */
+#define XENCONSOLE_CONNECTED    0
+    uint8_t connection;
 };
 
 #endif /* __XEN_PUBLIC_IO_CONSOLE_H__ */
-- 
2.34.1


