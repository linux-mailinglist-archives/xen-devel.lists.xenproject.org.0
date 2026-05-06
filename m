Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJQqAkDY+mk+TQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 07:57:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 564254D6654
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 07:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301155.1575478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKVFK-0006cG-5A; Wed, 06 May 2026 05:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301155.1575478; Wed, 06 May 2026 05:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKVFK-0006Zv-08; Wed, 06 May 2026 05:56:34 +0000
Received: by outflank-mailman (input) for mailman id 1301155;
 Wed, 06 May 2026 05:56:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <penny.zheng@amd.com>) id 1wKVFI-0006YJ-J5
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 05:56:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKVFH-00Ee8w-VL
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 07:56:31 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <penny.zheng@amd.com>)
 id 69fad800-e002-0a2a0a5209dd-0a2a4501c61e-26
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 07:56:31 +0200
Received: from [40.93.194.16]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <penny.zheng@amd.com>)
 id 69fad80e-c1f2-0a2a45010019-285dc21007f0-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 07:56:31 +0200
Received: from SA1PR02CA0021.namprd02.prod.outlook.com (2603:10b6:806:2cf::20)
 by DS0PR12MB7947.namprd12.prod.outlook.com (2603:10b6:8:150::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 05:56:24 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:2cf:cafe::2) by SA1PR02CA0021.outlook.office365.com
 (2603:10b6:806:2cf::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 05:56:24 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 05:56:24 +0000
Received: from SHA-L-CHUTZHEN.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 00:56:14 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIuZQ3DGfjSZC+i8p6gDae7XaKi6S/CA7psEprco7bAGuxHaoqdFO5AkCcVDJrK7uolEFf+g7LHr9jjAiynVZV4Ud7mWuv5BKNToBTWRrgEuPnyJdzbAaWDPclOmegjUT+IUTLv5USrSuAfteLBrRW8kxWHdRY14SRj1cmPM6mbTkVuQhYPfOkctwXSIO+AjdL+OlInuXJMBtyhgi5qVrQEQJo5WqOdiBA9NOooZlUHNfsQnBoopebKzp2uX7Y3vEaorOfw0EOlvqS+7ma94bp3ffBZhYnUoUSzG69zXk3GGtLSaBbIJQ662suCVt4oJYfyFCB15IoZ9yy+JxtS7Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gP1rZp1C6zAfw8kYloxp2KYZbgQfD9pbG7XPB4ULjcM=;
 b=vuoP1wPgDbXhaY+o/rMAEeRsZQBnbg1arj/ag5eA6bSWeQxxLQyo8Y5pV2ijeXhBlTHa+QSkm3rIEWoOh6NMoKAOHTTA6dc94zbPwJBW4RKIhHSkb7i0UWSbXjAD4mNAGg6a8WU2ROOnr1KYk3Kbb3qJCEqAegMqtUUcVMcYgQHJF2aKAn8U3afvZ1e2cCu1+hBaDZgrLP4gTh5Z71kl2kbxS/64pFMb8idGHCKD8n8fDsFLzdey++9UwsWB4368OpmO4x6vjuNwmnd0xn2NwSm8hnEZ8HKsxkjfj6NH0Nx/V14jG68TaHeGm0zuvixZB7YLREGiPAofLn5ORi8Wkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gP1rZp1C6zAfw8kYloxp2KYZbgQfD9pbG7XPB4ULjcM=;
 b=f7jcfqm+KHC1rqVvqZ2q3IFcHaQ9Geea3oJ+6fX9OUow65R7HN/r/GpLLdPKn+WoygOAw3ZvGsHWxA3DyUja3PmsfYgc9a4swgVbk0GMDvya2azfPTw75eyn973kLpwpPyWjC6tTQZw5tIrA3wCuW6mftrMd+iU725MBOdmDkAU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <penny.zheng@amd.com>
To: <x86@kernel.org>
CC: <ray.huang@amd.com>, <Jason.Andryuk@amd.com>,
	<stefano.stabellini@amd.com>, Penny Zheng <penny.zheng@amd.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>, Yazen Ghannam
	<yazen.ghannam@amd.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] x86/amd_node: reject SMN access when amd_smn_init() did not complete
Date: Wed, 6 May 2026 13:55:19 +0800
Message-ID: <20260506055528.476493-3-penny.zheng@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506055528.476493-1-penny.zheng@amd.com>
References: <20260506055528.476493-1-penny.zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|DS0PR12MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b19c043-6684-4e11-fa26-08deab3434d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rRckkP3aBlyKpJ0JzlJhaH7wsLTuUgan2bBVLQb/lIlh3jq9TbXEC/maTaqXnA3p+KOFPB2WnVdE0JVR7LHvjfDK0KKdC4M+YYNbtKUN8O3B3mIvpL/0YQViEV8BkcizmGwKEnVsOdxXYfo3JnTwuTl9sOFL0/t+MkbZhz1fXkJoMWDqkSSYv+pNl2s4epDEt+uvUY9k2KHvj1Av0H1tv/J35mj8Z1bd1utvg5zVUoePREBNDYNMPgQNEb7mrq+/DtaEhP46N7NcUnpLy2QT86ylBYkUvgP75xqHNZcbM2B45jMhHtr5IfiYIQ28Vx7wrGJOY1hHJyxiLBm2bBJxQPkAfU23qtxUevy75TbwUsfUSdJmN+43fXTFp70mg/lpLCwXo9q9VpoNapX2LyhuAYfj5HJm3APs6XBh65MBu0B3Wr339DfA+LckWdwV5vs4RECUAnB4aOZeCiJ+L7+qOT74mB1AbyDQQCtN3eBsAJrTp++mRxY/KgbcnGr3yfwGNQ/7D2paE202UltBTEgRAtrsTGizokittgKyfP8sFgzdZQw5PrpvRZ58ldRVQJs0XmQptp9BpDHrmAx7Xy6EJvelLI1sFu4xXnhyNTkyhIOOc9vU2MhJP7J1bt0qB2tLSR+SbHL09sYSaeZfmyiUrhZk21QeR7e60/wxAqMHb6x50NOQLlGUNTA5WMFbDdx5hj2WGnsBsb0p4Lv8zwjOsmoR0Lh4uvd534RHAQbv6Mc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mXlVNtNoo1kzNJh+imVuy1XCt55xpUiuUDxjjkMAl8pFT9/CRKPgt1GQRf/r9cBPnpteeU83OnlPkexoYYHuoyoXhpCSA1GVDnt9A3oiMtwz35sRv1XOlAdkLXTGZOH0b42+qZuSpy77jjNRbJ6kYRl4sW+ht86bNLSYR0WdAjeTLZeE2Ppr/axbgyxZQ0jRfvoN3AkIKyNeIROrCvqmp0nfTV8BjGcuzvTVW7jmHWENvOjcPvILp32Ugs9sLim4E8WlTOebbQchJddVJD9c7rKKg0Le3aIkstFutYHxDBfrja/VcZeofuF02gjI5bRxL1CCQMifEBdrFbv2NcP8ObmmFL+WdxF/YHnkaCUT8BSNqWufN4FeRbwMY1a3wqXP5kZQuhS9+7Mx04hBQcJRdGiVL7/EAY63PtI5steD0dMCSvTalNSdig/3tugytaRL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 05:56:24.5348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b19c043-6684-4e11-fa26-08deab3434d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7947
X-purgate-ID: tlsNG-d62444/1778046991-B5E6BFF4-2BC44A69/0/0
X-purgate-type: clean
X-purgate-size: 1820
X-Rspamd-Queue-Id: 564254D6654
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:x86@kernel.org,m:ray.huang@amd.com,m:Jason.Andryuk@amd.com,m:stefano.stabellini@amd.com,m:penny.zheng@amd.com,m:mario.limonciello@amd.com,m:yazen.ghannam@amd.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]

amd_smn_init() can fail early (e.g. -ENODEV when num_roots < num_nodes,
-ENOMEM from kcalloc) without setting smn_exclusive. In that case
amd_roots stays NULL, but the existing __amd_smn_rw() ordering dereferenced
amd_roots[node] before the smn_exclusive guard. The first SMN consumer (e.g.
amd_pmc_probe -> amd_smn_read) then hit a NULL pointer dereference
instead of getting -ENODEV.

Move the smn_exclusive check to the very beginning of __amd_smn_rw()
so a failed init is rejected before any deref. Also zero *value in
amd_smn_read() on the error path so callers never read uninitialized
data via the subsequent PCI_POSSIBLE_ERROR() check.

Signed-off-by: Penny Zheng <penny.zheng@amd.com>
---
 arch/x86/kernel/amd_node.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index c896060fe0df..cb9ed022c53c 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -88,6 +88,9 @@ static int __amd_smn_rw(u8 i_off, u8 d_off, u16 node, u32 address, u32 *value, b
 	struct pci_dev *root;
 	int err = -ENODEV;
 
+	if (!smn_exclusive)
+		return err;
+
 	if (node >= amd_num_nodes())
 		return err;
 
@@ -95,9 +98,6 @@ static int __amd_smn_rw(u8 i_off, u8 d_off, u16 node, u32 address, u32 *value, b
 	if (!root)
 		return err;
 
-	if (!smn_exclusive)
-		return err;
-
 	guard(mutex)(&smn_mutex);
 
 	err = pci_write_config_dword(root, i_off, address);
@@ -116,6 +116,11 @@ int __must_check amd_smn_read(u16 node, u32 address, u32 *value)
 {
 	int err = __amd_smn_rw(SMN_INDEX_OFFSET, SMN_DATA_OFFSET, node, address, value, false);
 
+	if (err) {
+		*value = 0;
+		return err;
+	}
+
 	if (PCI_POSSIBLE_ERROR(*value)) {
 		err = -ENODEV;
 		*value = 0;
-- 
2.43.0


