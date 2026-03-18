Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMH5F3Y6u2mJhAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 00:51:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49542C3F07
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 00:51:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256579.1551129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w30f4-0002IX-IR; Wed, 18 Mar 2026 23:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256579.1551129; Wed, 18 Mar 2026 23:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w30f4-0002Gx-FO; Wed, 18 Mar 2026 23:50:50 +0000
Received: by outflank-mailman (input) for mailman id 1256579;
 Wed, 18 Mar 2026 23:50:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h/6n=BS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1w30f3-0002Gr-D3
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2026 23:50:49 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48162b14-2325-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 00:50:47 +0100 (CET)
Received: from BLAPR03CA0083.namprd03.prod.outlook.com (2603:10b6:208:329::28)
 by MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 23:50:38 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::7a) by BLAPR03CA0083.outlook.office365.com
 (2603:10b6:208:329::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 23:50:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 23:50:37 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Mar
 2026 18:50:37 -0500
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 18 Mar 2026 18:50:36 -0500
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
X-Inumbo-ID: 48162b14-2325-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBzBtaG702yy45jke0ewfT8X7DiQeQVoXUt2JuY8ikUfhfTI3jXmRSfFHHoLRfe2cAy1tSNy08pCqkniTuRl0SfbpkMTSrdblUqL+hI6hOCMcR5UKfrKpAJLcO5vK9wJhJD9lrsGIlZ+4TM2Xes+e4EV3P+3ltbbYdLVsl7DfMCYmHQ1wRvYLXI+FEaC28lAwlT4OaefcC3IPJlQ3CAUrTannyelXfNHhVGYJYZs38uKSo4xNgDUAo3aJcxUnukJecSedlDb77i6mjYO1Xt8bKj+n0hf8OLpLsv7zyfxT4SFQNwOTZSWvKOjyVAMSSobfJKVbJ7IwrpeyFB2vCjJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLbg1HDH6l1jiTK+VlQOSblYz6M6mENO37elpcq0i8w=;
 b=vXP4jftYwy+QIsCiGSlyXR96xHP4UFvWn4+im5iT6Ykq2EfQ8ul2gq/6JbcaE6NSnOlDISz18+meiroCRWKYvNqoEUKrCrHDd37Lp03Frd9SEYdWGCKaOnVr7ykLUYV7gdQavuoIRuxeLSespB61weCkYZQpcpthwgtlJoeh2jK0ImJ5VxG2T2jnUGmnCa/oKYmWEf4IMiq7v/s6MXmw2sGwla+qEGPFvWGU+l9xQ78iuZjaocwHhPNq0Y2ZXcEDUtquM546Crfeq7uNeJZ/nN+0XKmcjUvQH6OfOkZ3INNJ/jMz7zB3NB+yzBso1aYP4Bb5ooT3U6ck3J6Wx5ETdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLbg1HDH6l1jiTK+VlQOSblYz6M6mENO37elpcq0i8w=;
 b=wKpv8XDlNd5MrHitoRRfdUbJ7/T0NCLSYao+CZFh92ssSdHBM8kTz+ae6RmhYzahF/+3owUR6jHwKuTfBgXVwZ/QZExc6/lXK57s/TZ2aKUm+cp899bhFIpbwnO8R08jdtnFsL8AJs2SHscsrBDMsjxn5Y9mqLlylNF/pK6yKmQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v2] hvc/xen: Check console connection flag
Date: Wed, 18 Mar 2026 19:53:26 -0400
Message-ID: <20260318235326.14568-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|MN2PR12MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b892e22-8846-4191-c11f-08de854927bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JkpSHBDnsSk4aQuRibFmwQXefmYAh6y5Xn1e11gx4juQwNPfvxDVrn5/fmALEA4rhp95KsS4HR73G2/gtxikIZeBvXrE4I2tH+WrboeZnPUvokSTwQdllxEjJwrEIl31NeZm1MZgJ4kKkKpYJQBGPeGzSV0i3wZ5w2YB/VBF54OCPeQoKt/hS2X66M50emcTi2+oligKZAeDbX2ETviI98fATgQrsjag6iXoWtv4/vz3A6FYvalQ5wLi0g6yRN2MWh7pLNqjZTL7M9bDSdsk/GDJ77IHKEzZBlrwOJ6JtXOIxnMw3VffbyXvJZg/c/DF7TSQi4GTKfidCkOKaNuhs5o+F5rn0fQgFXPcfwIYaIB0BnhiFu44BNS49/jpsdpWL/vmdbdcK8lSe4eNmrSh/kMvpNsrK1NMUSERKhCT+ZCv9xtLngWD+OEEjvC+PyK62U9tnqtmUEw3LJyXqmhjcTMG5zD8CZVNaGlMbm0i1GroMHJ9qZeSzhtnxiwRSuqsuVQFr/R976a0jsgdfthhqU1JPFExXVBXhDpkJq1kn5czvZvCtsNUt3xaKIx2YTaCXsSgb9UEgHtL8sItqncw91Dz7FwokLIZBcwrtqviSE0R/tHpC0rIKOWxooXypwgOJhfKC/c+iGcnEI1UvqUAKTWI/ZRHHbtfjKMTAqHOuMxsX2nBGqwPE1yBuXZnw10oAHUoLZ+VOSIOejs1IE/tGBL7HMu0e8FCKSZkGhKHo/s7uBIa9gptvno3fbNJcHmq8MFkXldRhscT4Oh7TwyQXg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	re72hxWdptHIQ8P0TrugEA9BkVeKN6QYE49F6BlYwS38FuCoV+FnEbeNfWLmzCILrqnVDCDRtwTN5KDMI9eoM68Dbysezgyflkxt6qMw9u/9gCLxxeNkI1VixNFdJYpeC0FJ5D7TdgQzxgo77AauPFMAFSlPEca3ufcNboYbBXNRodihLoguxCbGIJq88uGjBBxRFfN+/k9HouYnJVUnUz4mUchYLrlFgsPRG1uNxyTTfhZxbRhhlUJa3WWhypnhgYH80bf+ZP4ImoZVJYC9KRr+1yzAA+y4YGuLuWgskIFgJx576w4HlrkHFmPGcHtbTaqM1Zs1kSD1cacQTbNHwkrYSUmdNLHvmh/HP5dHoJbktaoXHERrqqeU6Lq40KZfMkTVtGduh5mtRXPu8mPTrBpEGx2KSwVHNkSLdqNZAxNmFgyGZ6j1t4gpgIw2H4U2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 23:50:37.8718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b892e22-8846-4191-c11f-08de854927bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:jason.andryuk@amd.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: B49542C3F07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the console out buffer is filled, __write_console() will return 0
as it cannot send any data.  domU_write_console() will then spin in
`while (len)` as len doesn't decrement until xenconsoled attaches.  This
would block a domU and nullify the parallelism of Hyperlaunch until dom0
userspace starts xenconsoled, which empties the buffer.

Xen 4.21 added a connection field to the xen console page.  This is set
to XENCONSOLE_DISCONNECTED (1) when a domain is built, and xenconsoled
will set it to XENCONSOLE_CONNECTED (0) when it connects.

Update the hvc_xen driver to check the field.  When the field is
disconnected, drop the write with -ENOTCONN.  We only drop the write
when the field is XENCONSOLE_DISCONNECTED (1) to try for maximum
compatibility.  The Xen toolstack has historically zero initialized the
console, so it should see XENCONSOLE_CONNECTED (0) by default.  If an
implemenation used uninitialized memory, only checking for
XENCONSOLE_DISCONNECTED could have the lowest chance of not connecting.

This lets the hyperlaunched domU boot without stalling.  Once dom0
starts xenconsoled, xl console can be used to access the domU's hvc0.

Paritally sync console.h from xen.git to bring in the new field.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
s/XENCONSOLED/XENCONSOLE/ in commit message
Mention sync from xen.git in commit message
R-b: Stefano
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


