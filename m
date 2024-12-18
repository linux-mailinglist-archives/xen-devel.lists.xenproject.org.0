Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 693B29F6271
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:12:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860100.1272203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNr2n-0007Km-SB; Wed, 18 Dec 2024 10:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860100.1272203; Wed, 18 Dec 2024 10:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNr2n-0007H4-NA; Wed, 18 Dec 2024 10:12:41 +0000
Received: by outflank-mailman (input) for mailman id 860100;
 Wed, 18 Dec 2024 10:12:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M/38=TL=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tNr2l-0006CD-Om
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:12:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f403:2612::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bad6762-bd28-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 11:12:38 +0100 (CET)
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com (2603:10a6:10:312::7)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 10:12:32 +0000
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f]) by DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:12:32 +0000
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
X-Inumbo-ID: 9bad6762-bd28-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ny6XGApHiDdDryB5G5h0Z9ShP/LdK49pzE166PxW5OYVUgInUmUdf0YwbBc/qSXvA8fwtcZuiSACgTNYI4hlMAF3CEjI8s4JNq8EpaRqFln9ihWzV5u0W7Fv9xbm/zw5nwfvXALEtQJD5eadFqFSUg4NMEDOesc2s/7XJYpfi2EfpgqL2j0x1TGtlokr0wqFZYsX9SRrOLLeAV0nz9ltZwhEL7cpjnuarHOkjP1N40v8X0x/2fiTh9tzEVY4wFx1QYkijudkEG/a9ufqAu+Qqh+UquJzYScEfNyJ2jWcibhzkXjbJCbMp0SjvkE3qbfJ5Vwv/ObjYsPftBwAJ/cU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ny/wNuZoyr66v5NmfQ0ulf2O/bvCewWrWpPK80nxoY=;
 b=pCYC7wZqPKOFrAkEjhEdyk0x/yhsYjQ5+NtxRxCPBctQAsCdJsFAz+GJn46CPmD8jIQRANfPKLx/cJGCftJ9Vgqh7kZtZKCsCS0XZkTrsiYw9u/wYfMp4mz/9Y7LHFbicmndo+v6VTrhsctkYsIUBS6sFznmFnClAaAg9d0V2a26PqBxadnYgHTgvNstZffgBqBeLW1XUw+myXBdmUCXsLFTsltYfwkG3LYbPTKobUihLUU4Boow3l3znK66C/FjuMD/ax09ZfET7DtDpH1VCc3Nf3PDXJuObFNni7GgzGyhGPv0GgIxzix0iqJrPMJzUj6CvX8nx46a8pgFV6Sm0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ny/wNuZoyr66v5NmfQ0ulf2O/bvCewWrWpPK80nxoY=;
 b=iIHSX6dHOQJzhlMWx9UISqUwXvs5bdMu65SI+rI2eQTS28HDbP4uo/jfHyp0VF/1E+vsSxLeLhtOn8QlGuZnu8pUj+4S9LRpH6tfNCJapm/gSCQZv7krnOxugQO9nV/J71pQO9yxPxiPJ3XGUDcciZPgqaM2yCAAvf5g28v7YjPP3QP82nTIBrpu620EN97j0UmtCMiF5cGcFTONpx2Lx/duJJcBeCLaScn+ln9atmkjnP+zGcN4VstLyV89uxnvQfK3OlhZX+4+bS7EMPsBcsluH9d3y6mJ3iS14M1LWP8D+Po2aNNMnOpfznEcb01yO9t5519gUqtc2P03X6pHdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: S32@nxp.com,
	andrei.cherechesu@oss.nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 5/6] SUPPORT.md: Describe SCMI-SMC layer feature
Date: Wed, 18 Dec 2024 12:11:40 +0200
Message-ID: <20241218101142.1552618-6-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0228.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::35) To DU0PR04MB9561.eurprd04.prod.outlook.com
 (2603:10a6:10:312::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9561:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: 564151a4-a3d4-4173-4e82-08dd1f4c7cad
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z3IcyEBC31btxwQ+ffsMwhvvRaSlI+jgaqOBDy4BtiVDYFyUVzvB+f64cjxp?=
 =?us-ascii?Q?7MtrIqADsnGM85iTvOCieB/A3DTd8dz8OQvLB1xdi5ZkblXAb1aBsV/jjjZD?=
 =?us-ascii?Q?MrG6yDRBuUHaNv3cUbNgXAGakIwaJ+1us5Zye9N5aRwXy6JRHOexE8s9Xuw3?=
 =?us-ascii?Q?tjQQdsNjtW6KEb2hz5Oh3x9YuBeuZYCNYXCDbfwPjPFZKJutQ4qoIu6gYZ1g?=
 =?us-ascii?Q?wAFGrmaBZvYc5UjfbhbGJ40LDuC6k7ix84bMWnQqgBBgz2UbhMBDv1h3gebt?=
 =?us-ascii?Q?d4EwB4eafsDObMTeZ89gQVC6//32bWAvoEzxYJnoAJQMZ2NXcMHEz1l5o3Kn?=
 =?us-ascii?Q?67J8UtbxujeQdsXAS6AfOsM+TrloC3QaJwTg9GeRfqzMEeAdgqKotoGXTZnF?=
 =?us-ascii?Q?wyB+Vpo8oqTavzyOmArT45OihNSn1tVWuWmqeuhRS8jURvCkHlb8cFUptqN1?=
 =?us-ascii?Q?Ao3AeJY1/oMdPhGbQ+xvhHfFka2rzikTZiqPTYpDpR8tIr7j4GDFgl3hcZ4M?=
 =?us-ascii?Q?RKJwIhGwxVXY2X/LL+phcdhrdYSGUGWTTEWVsQrE6OqcNVqNddWjlw3cTvE1?=
 =?us-ascii?Q?ni2654raNgL5JAHlum99Uxpb3JABu5pzIjUB8aUoM85CY8QfZdFgD4fzRDS7?=
 =?us-ascii?Q?PxZeTodqusuNuTieMLCRKhOM5+O1q5PaOxl1WYk0BvliCvC0FEUxa0BhtoO+?=
 =?us-ascii?Q?ugHi6uihcL7PgI3DJTmf6jRbPx8bI0uBL+3vbvkqLNlZ50l2Na3t9Kwj40uW?=
 =?us-ascii?Q?vOgmrzXpQDNt/VVdphA2dTO+pQmCt+ly2EuUnFTlRGpgSTjAY4a/KV6wSFU6?=
 =?us-ascii?Q?8AbFDfELqW2BYhB0EqyFaJq1OB6OBpyMqQSvPqMg+7OwJSAtf2FKsopktnrQ?=
 =?us-ascii?Q?0BYXShDyfgvvrRESgP6t0uq3A0jwJZ6wznazc6ENj2eMACqemN51rdRV0q8L?=
 =?us-ascii?Q?9byommmbN1cvf10iwS7Ev7R/7Fadp4pmRZpqaTs8bu7DC1FSKiL2SKN696Yz?=
 =?us-ascii?Q?5/x/3w5dy11bPjVipmi4/Hy+cCQIALMx8ZgaZMxuONJQUA6i+qJL6EV7su2A?=
 =?us-ascii?Q?41vU18qAaBQqUizduR7qIQKiHs9zhsZbvnTCqs+V2/K/85E4Z2umZ1Vvd+ne?=
 =?us-ascii?Q?G4PF/Pn1TpzooccWTME8bkzRfrN6q9BA4l2YgPFHNTd98GiT5AktROV4IofI?=
 =?us-ascii?Q?tKd0ZUQYhKwI+3kAMcQPgqil0FrfBoQsWaGb+p+mkXpeR6YWCozirAkOXmJ8?=
 =?us-ascii?Q?2oSR5YCNQU+3o39dE+qznYkoa/c4mcfGjAvjtUh6B3KRWKeGktxO3rNXJC0m?=
 =?us-ascii?Q?WKOaeDCPLDtWxYTmNPOBCnecFnWXwkE3VSe2Ek/ZjkRExTfAahAixYVHcBvD?=
 =?us-ascii?Q?VJfwnLjWzTpt5t6SzkQhDNSX0NieEKQh0Y91HOgaQJD9x/p0D7YSEVX99wr7?=
 =?us-ascii?Q?Jq0+Jzibth/LVhObj6nQPLmNI4wtuw5K?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9561.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?slpDCEM4WducXOVAVtDgdDeo6mdju3hQSAdGe9F1iPi+2AKYTXkwBCDdyxzz?=
 =?us-ascii?Q?mJInXyl2AeyoGI9OzyVujXknqjfe9wH7OEhIkHI0953LBKYuSg7NZCS+/Dzk?=
 =?us-ascii?Q?pS/xyBuPprhJfjVetCvcgQznMCRUX//C66z+OXCnqJKzvwtPmdP9y+ElwbmH?=
 =?us-ascii?Q?8ZaK3gXUBMEdlUbGUhA+TvDezmzGUNfjMdW4zGR/dxbbmhLZyT30ZPmKnUgu?=
 =?us-ascii?Q?Gb66i7OpAInXSTtzms2EDNO4A0i4ZtP7Jg+d/V0uYrQIKUxPZazWRzeVuWud?=
 =?us-ascii?Q?hqpm5+wnbSMBs6xO5ZPWp9JQtSUN0igjpI6RVPJsFlcxSN2mG5+i+5pJl83O?=
 =?us-ascii?Q?mEMesgY8nE0hbU+od3etqK8Hg7Hp2ft5EoaAj294DTdczKyKVM9RasPckSqB?=
 =?us-ascii?Q?fKH798h+c2LRrZ/J95iNiKLEcjYOmB7WTn78YzHYoMM7Gw80Zd3Tw2a6GUoT?=
 =?us-ascii?Q?hluohvc5PTdd2YTuJ1SSaYOiFbbBn5+bRrzC2BqZRQhVUCejhNGeHNaIrX7F?=
 =?us-ascii?Q?/6AOZKe+Yn3qiOpzf4w61D52zLd8092J5wSkLquWkmjtJ6P5hl0zCqpWjmz9?=
 =?us-ascii?Q?0DATu9jukt4EI6XDqz7rnF1W4o14MmA44JaSg05e9B468eKYlEm+Oo5zR9UU?=
 =?us-ascii?Q?iJmxnfsuCOd66GpamlIJ1+rTw4WRJpeHvk9n/ITmzBOAUOFJAqNgQb4MS3F/?=
 =?us-ascii?Q?a6qgHcUHuW/JIqxfE3f1Px+M97FYxYHHz5IrKb/2XbC8MhDwzw5X77RZFK0h?=
 =?us-ascii?Q?TsTksJTbi9C+l8517oWXhK7nC8QVruLKYMGUcCi9WF7qi35rkDV2Bmx+nppy?=
 =?us-ascii?Q?ox2+gKAXmeVZe4va+feSar/qgnG2JeP8ukEjB7E8w5XtqHuzGirSvuoUeSyJ?=
 =?us-ascii?Q?9SEaMO2aR/GX50OP6NHFwpaWaLQh6/1ZfYkS/eJlmi9TxpF6SfJFDD2Cxitf?=
 =?us-ascii?Q?RgiElSHP0K+nFF56/YD+qvjV0miqmasme4VQiFAAq6bRSK6sNQbke6J7T7mu?=
 =?us-ascii?Q?CXGTsh6wrgWQxPj49vLkpIzrWTE+GP1Wbg1l8b5zshYmVZrOODPXawYAsG+I?=
 =?us-ascii?Q?ATI/VVRXX8nIQUTt1mSdIqt+xnaXZeg58QDsd5RKtXk96D4EUoAFDg4gA3qx?=
 =?us-ascii?Q?ckOMbDyj8ybVycs4ojvw2Ko5qtkh0H7QqY+HoqMGkH7vXlfZ2QxlaU2LJFMb?=
 =?us-ascii?Q?q3kPERgl10wEqefL6On7TN+1w2gU3MrifdGvSO1uMzBDPir/hRDSRpJQQJqs?=
 =?us-ascii?Q?T4rZrugex9yG5R5pop5MYhsZEpn5MxSYRWLimZXJcqKQbQi/mCd+cWq8pzHg?=
 =?us-ascii?Q?kJvOd1u7wHXu0JHVZC4g7a9ag1Y0WPebPHJbe3fd6H287Rd3HzUUtayI1fZw?=
 =?us-ascii?Q?UEjV7F/vO5AHVFBSYkuUEimEPFjsTVWoKEGCzFmxt1ij1/8adHlOo1TKxmGN?=
 =?us-ascii?Q?BgXrblHtYBT78SfUYxf+jcS/3J4EpNtBDuF+a3VkQW0GrGJpsPmHRG6TOVg9?=
 =?us-ascii?Q?aV2OYpfJqiclXnYDEZmGbHxnnb3La66DYefW14MI3YSDED1UJIpKB3hwkHPO?=
 =?us-ascii?Q?xUYPh4L5co3AuEFQ1Fg++FL+t+sZhZ0gWDT9g8FNtCY5Q0NDFFQj7t+697K+?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 564151a4-a3d4-4173-4e82-08dd1f4c7cad
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9561.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:12:32.8270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdD854vRjHxcVrurR5HHLj78dCWLYDnlM0IShip6H7zl92iKNs7ox1Dczmq7D2WtbYI7NSBwoXHXP2FLNEVSA23NA6LUb+AXouM1bX3B4SI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Describe the layer which enables SCMI over SMC calls forwarding
to EL3 FW if issued by the Hardware domain. If the SCMI firmware
node is not found in the Host DT during initialization, it fails
silently as it's not mandatory.

The SCMI SMCs trapping at EL2 now lets hwdom perform SCMI ops for
interacting with system-level resources almost as if it would be
running natively.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 SUPPORT.md | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 82239d0294..1f7867bd32 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -928,6 +928,14 @@ Add/Remove device tree nodes using a device tree overlay binary (.dtbo).
 
     Status: Tech Preview
 
+### Arm: SCMI over SMC calls forwarding to EL3 Firmware
+
+Enable SCMI calls using SMC as doorbell mechanism and Shared Memory for
+transport ("arm,scmi-smc" compatible only) to reach EL3 Firmware if issued
+by hwdom. Some platforms use SCMI for access to system-level resources.
+
+    Status: Supported
+
 ## Virtual Hardware, QEMU
 
 This section describes supported devices available in HVM mode using a
-- 
2.45.2


