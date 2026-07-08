Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TCNdEFC7TmrHTAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C6E72A683
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=a6N+z8XS;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357346.1611755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZQj-0003CR-R1; Wed, 08 Jul 2026 21:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357346.1611755; Wed, 08 Jul 2026 21:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZQj-0003Bd-Nc; Wed, 08 Jul 2026 21:03:41 +0000
Received: by outflank-mailman (input) for mailman id 1357346;
 Wed, 08 Jul 2026 21:03:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1whZQi-0003BP-21
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 21:03:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whZQh-001FOW-87
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 23:03:39 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb18-5cb7-0a2a0a5109dd-0a2a4506bcd2-16
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:38 +0200
Received: from [40.107.200.0]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb29-08de-0a2a45060019-286bc8004b52-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:38 +0200
Received: from DS1PR07CA0020.namprd07.prod.outlook.com (2603:10b6:8:44d::18)
 by MW6PR12MB8707.namprd12.prod.outlook.com (2603:10b6:303:241::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 21:03:33 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:8:44d:cafe::8b) by DS1PR07CA0020.outlook.office365.com
 (2603:10b6:8:44d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 21:03:33 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 21:03:32 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 16:03:10 -0500
Received: from ubuntu (10.180.168.240) by satlexmb09.amd.com (10.181.42.218)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 14:02:46 -0700
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ds+Jnw6+Y13cP7or4zEp/SX7EBS0nFidmJBUFtYLuYJSuHClAbFlWGtVBofhERrjKgtBPQFQkohFVTNeUbTluBG9MRkj4q7HRCN4OzDJQu+7hJWqUFb4by+VYNVqjuPlEbJINND4QEyWK1vXsZZrsShOyBqZ557PlvYFgdKKeg3vKj3qnb+T14jKe4nn923LRpF+yixi9/mxni4B6m1FHFGOu1aBI5YP2x5F96vIov83Q8WA0nFkfr8s2EOfNRTPE6xkxbcYq8N/SNLBTBTJ721tXCwHfNpxY8yvAfTQz0Dsbmu6hsoEa4qCDRFAWY9k5nBPnY/TsT+0gJlFcriVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Re+/NsS2fHCdtWKJR3e8eS6UfUmnYG0QhSgvKlhrUAw=;
 b=kOlUj9EZae2C+xc/H2eKbUT+oYXGm2iA/f9sNoMJavMR1LxGEF2GWhdd6EXL+k62GCWUIlqr6zpfeJvs4eEE4wXkYTJBVqrpEfCAGpaT1yG9Jwxur+LE4kNc74lpyQCKxTox2CaxhYdRK3VZjR4pNPzLka9r2n596pD+xIk662v1SIAayleBkATflxE0LYXkuVqvJ+dwR3yTv/cKAbH4iheMyCtux2qJQGw/HOy/zjewmP5yztnZYTw0jvTbG4TJRf264EPoBsTsFeMGYPZ+REaeXFt5j+cqzeRwfe9jMIM0xksVpOrAJsqEp/+Yz9y5P+GaPtHF8oW2mC6P7b4+vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Re+/NsS2fHCdtWKJR3e8eS6UfUmnYG0QhSgvKlhrUAw=;
 b=a6N+z8XSfbr5oPkHAZ7eTa7FF/k3TdJLQhfsNYClTQQWy38cmyJ37Sxl02pyDyUQ21sWCz0YmYB36Nv3ZdTK+lNhMLzKITUDzFTxRl8ESlWvQbHlCvkPFan5l/ADC+dmRq7sQv06d6jE60SRhu7CNGWOdbiqL8wAkOl8xdXwq7c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 0/9] vpci: allow queueing of mapping operations
Date: Wed, 8 Jul 2026 17:02:15 -0400
Message-ID: <20260708210233.922275-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|MW6PR12MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 545fb8b2-e277-48aa-2309-08dedd345e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|18002099003|13003099007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	zg5+ildCoGEyLggKOX8af2i0031h6E0NDmTN60AV0gOd1UvqIEMit99sk3QMEG3f4gftrhTp93htU77hOLVzOVbK1HRX/O5O53T/mSOBpzVBE+Nhop3JR7lnBJFwg6AucUznlBoNwXFUwLsVBb+DGp4t+HJPjhHhK3WvVpR0ViNBRDHfZGTE8rtkFThjWA9/AaUaT3R8xM6a0kwH2+gRH7qGKS61JtHmOsUOt9RbeoJGnYJagyFf6/vyMX/A0Ryg7iloWJJ0/Cr35zQYyQbgyAKPvo7J3+OdVGp/Hhn88EKNk4CR/CS00NuEwn9g0OfXPxkfWpkLzel/tiR4ZyPBZ+x77fy4n4CQdgXw2aCnK1O2BXz2LVTp9O97OpO+vYZoimPGF7/OOnO/3PmtBRYhAAaYb5QEtXRy/LlGGkzSxi17SRiknqCrxM1zzx5BHNOXFubGXJxAMoLmXr+kJzEwhilSxmlD5q7P/MLojDzTHzUh5HZEBvPwvzu3/DPRqJg3VANEegZnct+PFAg8f+dwxkz+neewuraCrL7w6+1LgvX3l6lZRkKEJXlk44r93e2h0fuwuFZJN1Lr6qThGR8X9xqfDCNKiaJIKMg4REpvfxO4iRTc0LHT1nJMsZVsysC95KUZHuQwgYyqdGVONcSDn5URoM3i5iqdaIFHca//mKk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(13003099007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7A0U8J8/ZGIb06OO9NBzy0gPDsFDnABPpWkXVw3Xw4f6Q2a3Jr7izxUcu0jtqls/2BrTiA0936Rxtcqlr12CKEJO9eq0qozrj3nQPqdU6khcqMZJVKlvof4ybbqw4LoCPS0TvqCQWrOyBHbhdwvWSTqXt5QI9t6VSynE29Tlun2CBKS1srIe64W94+2ow8ZuT1dH0AeuuXn6IFLc85yooOxO8slg/Y5c0TB8VbeklYvctZLxwRFGSB2pL1/g4t4fVxVKWaQ3JGFMXvHaEJLpN84GBqV4st89C4zYde0+4KiSCyxrRgkJfr3JRGAiyPjeVtNHMEBYP0+89fpcwS3n2PsEiH++CRdNm+B5gxxyG2o15J/JSigpMfRbRtcL3lkmno+VvC0LQaxGW2gpX5yeoy3UAG2MV9VvX6X7SI2KDSoIljmchmczSJkJdztsNtTS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 21:03:32.5510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 545fb8b2-e277-48aa-2309-08dedd345e7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8707
X-purgate-ID: tlsNG-16d1c6/1783544618-F93EC68D-F9F71883/0/0
X-purgate-type: clean
X-purgate-size: 4448
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8C6E72A683

Introduce the ability to queue p2m mapping operations in vPCI. This is
pre-requisite for both vPCI SR-IOV [2] and the ability to handle BAR writes
with memory decoding enabled [1]. I thought I might wait to submit the BAR-
write-with-memory-decoding-enabled patch until the prerequisite is reviewed
acked/merged, but if you'd find it more helpful for me to submit it right away
I'd be happy to do so (I've already pushed it to the gitlab pipeline [0]).

When multiple operations are queued, there are some non-trivial complexities
with the deferred setting of bar->enabled, header->rom_enabled, and
header->bars_mapped flags. If deferred, these flags wouldn't be updated until
the p2m op queue is processing, but we need to consult them in modify_bars()
at queue time, so they wouldn't be accurate when adding multiple tasks to the
queue. In order to simplify the deferred mapping state, and in particular
avoid complexities with the bar->enabled, header->rom_enabled, and
header->bars_mapped flags, I have picked up Roger's vPCI fixes series [3]. The
overall result is now that _only_ p2m operations are deferred. PCI config
space writes, flag-setting, and everything else is handled at queuing time.

1. vpci: move BAR mapping permissions checks
2. vpci: make BAR mapping more resilient for the hardware domain
3. vpci: only check BAR validity once
4. vpci/msix: move MSI-X hole punching as a result of memory decoding enable
5. vpci: simplify handling of memory decoding and ROM enable writes
6. vpci: create mem local variables
7. vpci: split vpci_process_pending()
8. vpci: allow queueing of mapping operations
9. vpci: don't pass command value to modify_bars()

Patch 1 is code movement, and patch 2 is hardening map_range(). While these
 first 2 are not strictly pre-requisites for queued mapping, they simplify the
 subsequent prepwork.
Patches 3-5 progressively remove modify_decoding().
Patches 6-7 are non-functional changes pulled out from patch 8.
Patch 8 is the core feature: pre-requisite for SR-IOV and BAR-write-with-
 memory-decoding-enabled.
Patch 9 is cleanup I chose to put at the end for lower diffstat.

Patches 2-5 are borrowed from Roger's vPCI fixes series [3]. These patches
have gone directly from v1 to v5, but otherwise revlogs are written assuming
this is a continuation of the BAR-write-with-memory-decoding-enabled series.

v4->v5:
* don't defer anything that's not p2m related
* drop ("vpci: allow 32-bit BAR writes with memory decoding enabled") for now
  to focus on the pre-requisite patches first
* split non-functional changes

v3->v4:
* switch back to dynamically allocated queue elements

v2->v3:
* add ("vpci: Use pervcpu ranges for BAR mapping")
* rework with fixed array of map/unmap slots

v1->v2:
* new approach with queued p2m operations

RFC->v1:
* rework BAR mapping machinery to support unmap-then-map operation

[0] Pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/2662651745

[1] BAR write with memory decoding enabled
v4: https://lore.kernel.org/xen-devel/20260406191203.97662-1-stewart.hildebrand@amd.com/T/#t
v3: https://lore.kernel.org/xen-devel/20260324030513.700217-1-stewart.hildebrand@amd.com/T/#t
v2: https://lore.kernel.org/xen-devel/20250723163744.13095-1-stewart.hildebrand@amd.com/T/#t
v1: https://lore.kernel.org/xen-devel/20250531125405.268984-1-stewart.hildebrand@amd.com/T/#t
RFC: https://lore.kernel.org/xen-devel/20250312195019.382926-1-stewart.hildebrand@amd.com/T/#t
Gitlab: https://gitlab.com/xen-project/xen/-/issues/197

[2] vPCI SR-IOV
v3: https://lore.kernel.org/xen-devel/cover.1775742115.git.mykyta_poturai@epam.com/T/#t
v2: https://lore.kernel.org/xen-devel/cover.1772806036.git.mykyta_poturai@epam.com/T/#t
v1: https://lore.kernel.org/xen-devel/cover.1753450965.git.mykyta_poturai@epam.com/T/#t
2018 v2 https://lore.kernel.org/xen-devel/20180717094830.54806-1-roger.pau@citrix.com/T/#t

[3] vPCI miscellaneous fixes
https://lore.kernel.org/xen-devel/20250814160358.95543-1-roger.pau@citrix.com/T/#t


 xen/common/domain.c        |   5 +
 xen/drivers/vpci/header.c  | 443 +++++++++++++++++++++----------------
 xen/drivers/vpci/private.h |   1 +
 xen/drivers/vpci/vpci.c    |  17 +-
 xen/include/xen/vpci.h     |  15 +-
 5 files changed, 279 insertions(+), 202 deletions(-)


base-commit: 03851197a7b2cd58851b9ec2293bdf4a68c47b66
-- 
2.54.0


