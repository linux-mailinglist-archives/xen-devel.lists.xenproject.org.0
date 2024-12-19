Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA57E9F7A51
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 12:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861112.1273132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEd6-0000PX-Qb; Thu, 19 Dec 2024 11:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861112.1273132; Thu, 19 Dec 2024 11:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEd6-0000Kz-K7; Thu, 19 Dec 2024 11:23:44 +0000
Received: by outflank-mailman (input) for mailman id 861112;
 Thu, 19 Dec 2024 11:23:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vR1G=TM=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tOEd4-00089J-Qi
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 11:23:42 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2ab163c-bdfb-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 12:23:40 +0100 (CET)
Received: from PA4SPRMB0023.eurprd04.prod.outlook.com (2603:10a6:102:268::8)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 11:23:38 +0000
Received: from PA4SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::fd16:4665:bad7:33ce]) by PA4SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::fd16:4665:bad7:33ce%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 11:23:38 +0000
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
X-Inumbo-ID: b2ab163c-bdfb-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROtRYIQ3PqmooNE8ejhwSyf7apZFqZ70NhrIZL/G6S0ACoGgdO4sp2oMctSZtGJ+dID/8YvygkWvWJt1NJXXMSRQ3uokPa3l/GGfAIBBnYzrudO/qC0nhvrjyLLvPy4zd44XRHHc8o965OZeRY6aTTRCfLL2j3UdccYfXkhu9pf4JuCGL3hAIFOg0ZQws1B+T7YQ0fHneqyH9hD4O/rSUhoP8RewR9pOAstdO6FHzBDAOuHyPbZVqrWVN2wHreUxrqyxdA0TNx3YHnW+N6uEjDzhDB4+Wy5pvMSxOjudDXu87jQrM4tbLDrjqtAWbdXi2uyKL9bvPvHrUj1GWSGQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuw7cnOM3mI8njSlNPRlEkwpuzbqcfYC3MCc/8dj7Xo=;
 b=v7xGyYWxbwBZT4s5qAP/p8tHqIM4q2ZGItoZ+q36BDRguyMn5fvYvtyc7KT7ZeVSalRsGdS9+D4u0T6PpOaFml9cu12LYdRqZxxi3lAIsAAKcb3whrfxX0wFVZUMtTn5/p9+fn4mW6Xa54jr5nY7XEEBxA8+8uP5furQ+lo1Zwdx0MrsuS0zMlD5LXiIHQYC5UGw8PCjF8UVFlad65fxF1lozbinxb9/qL0cRT6+jooN6/wLsp64j/TYIARhG2wS1wdJKpaapl+pDRrTyGO91qaBcZk+qIGx51p2z8UE56XeS5drEYb6im1XX/1evUzIBejoocL/LuyBLHi1OI6vTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuw7cnOM3mI8njSlNPRlEkwpuzbqcfYC3MCc/8dj7Xo=;
 b=UKwQ7S8wdL5cc7IW/J22zkostYVdG/KzUISzVbRqGxgJ2TlfuSjyibnm/1VU/wGQmmGF8cBY17w/gdnJqKKePdvzW8IwqBq4XkRhqMXU12TXmAA6zYHp73HVHvJ++vvXN1rQRG9zjtBrYyJpdDSYxC85R4cqOZz2t1Bikg7xBlFpqoEFbX7d6Df77UPhmuS2QmlMWlceSdYb48Gf+CWsWpJi2Dx/dHa5Erenj9ppCYe/HqJhK/XGNPS7OHTQqlQemVRCAy1tzfB/jBdGnQt9TiTLQ6TvoPayR7bX9Lv2qaPK9Koo3fqkVWYhHrRSis9DWX5FWaDQ0BukZEkcOx9Mlg==
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v4 5/6] SUPPORT.md: Describe SCMI-SMC layer feature
Date: Thu, 19 Dec 2024 13:23:14 +0200
Message-ID: <20241219112315.2461048-6-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
References: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:208:1::16) To PA4SPRMB0023.eurprd04.prod.outlook.com
 (2603:10a6:102:268::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4SPRMB0023:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: 147d0a65-5201-42f0-8741-08dd201f956b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Hl8bxjNXT6oLth6yT8TT7VQBxNQPzardcnuc6Iv+n7F3g4J6uSUPRPMl550?=
 =?us-ascii?Q?BElEA9Wo6iLtvXJUujvTrdXvqd/VRNXR14aszYhSDpUn9Y/IcaA0HDKeskCD?=
 =?us-ascii?Q?EtMh2ItG6LzFXqS7EdqjJFMqFi88zLfF+Ry+KJqqos5UC7eyEvYqpqjfqzWq?=
 =?us-ascii?Q?fWMKzKGq7w54YLhYS+sRCAbN53khkvmNOVen6OcO06KlHf//S2d3Xp5FEzIE?=
 =?us-ascii?Q?6eym2Lk9EgS2AXMYJFKlxxfNLjvIk5e/rzjCR7VtEh8giRzpqIJzTWlN9iBb?=
 =?us-ascii?Q?nWU00G7mig1EyTrc+R3jB8XhRBYre/rG0u+Rg3B2SZL/ENOyFbHtGWwDDuhx?=
 =?us-ascii?Q?eOcE9c9i5U9tA7aGI2KlAMfIr3xfSxdJvc8sSIeNF4CjifvjzvTEgE8iI7rG?=
 =?us-ascii?Q?5HkTSY+Lcma8ZMbmmn1ly5rkPusvit2QBirWyTd0hJs/1szZR7Ig6hZaAwbp?=
 =?us-ascii?Q?8ra11iskVjsVTl1R36JwVux7cg/KUF+6HTdt6TKuTUvPnhb/78Pp34vE/+0R?=
 =?us-ascii?Q?yR/ltz9yLfB8th8ilrt8bOvjCRCOHkN2GB+GkeRAtAe6cQbJZvM/BQjXHc69?=
 =?us-ascii?Q?arWupdxbTvIU9o6fY0kBGTUaGgMNc/yF6Eu8s2maz7a3jY+eZGNTjbkMoce+?=
 =?us-ascii?Q?U90R4bMRj+759QI92lDc8f/3abhdV7uzZM6ALJg+3JNM5s/jZG+ro847HnJe?=
 =?us-ascii?Q?zCDk4WfIGrn0HyRROUEq0xEhbvPyZakzFsAtEgsfTAEQovSRpyzXAfAFEHRA?=
 =?us-ascii?Q?/pTOW/04MiDRA49qSN4VDxSK4Symh7gpmO+unURxikCDzzp33eA0KXNVNX7p?=
 =?us-ascii?Q?tUBXWkGXMtomcrFp/DMzpHBs6PZDps0/tZDh1EdXZTDW/1HxaYTeQ0OLOOh7?=
 =?us-ascii?Q?OWBbk8t3RTBCdzV53RdJsArZNnjinvgSpPsW+SSbOCNSVnFBzxqsmWN7aVw2?=
 =?us-ascii?Q?eb9pvcHqf59g46C7HlN3k467WisnNedjQ+R+vieTPtCfZRJyyZR53Hd9Y10l?=
 =?us-ascii?Q?9KCwQoZGKvITUxwe3xmIIek2CCoQtsqe8dvtdW0CvmjxGzYK01yFUCfTKiU3?=
 =?us-ascii?Q?p7RT3RDKeYNKvybxDvTUNqqMn91gl78W4s/5R0AQ+nW5YERqg3GFpg/aPvH0?=
 =?us-ascii?Q?FnXgoJ9YFdZYbr9JFg0j/f0hC/dBVk6hGEMPD78tP3145H8HS/uzipF1j8l8?=
 =?us-ascii?Q?Mib5S4IWInMx9bpLTyNS6Rjrj8bc9lYloduHrT+37D/9SrsGsAdZLB+rx/L/?=
 =?us-ascii?Q?tRgvsqR5tAtnhPJvZs07QWllEVAyqkfOvOLmMN4Ac2kv8PLeQerJXkdX8IM9?=
 =?us-ascii?Q?DlLiBr50lAEqEh90KUMV1Ewyy979/djJvtR2VTuSFkDB7FJMmw2KNv2Dyrpz?=
 =?us-ascii?Q?Q6A4URcZyLSE5iEgqDzRxBX6isWoIZOpZpZJNPIbMDA8WSPaEGPJ+79IORas?=
 =?us-ascii?Q?jCy6zg/u7q18467MrYw67okaeLHJiQb8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4SPRMB0023.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iMp3YRZa1Z0n1XEzbDBsJZXBidCwULkRxIiaY8wh6RtBGzbC8t07Ale0BEdU?=
 =?us-ascii?Q?5Elo2fXw8dNedThCv7G8sdrcnLUo07uwxtZFWL0VzZTIEXnbDJ51DRdLK8mG?=
 =?us-ascii?Q?3+fOwBc+GgqvUXEwWLIguhzE23KwqaYyn5yOg/JHkJhQUVYvTsAYtYbWeYdF?=
 =?us-ascii?Q?OFkoHzZ2wCyCBRkcO3sSajuDgtuPk4SaLvgf2MYS60f3Owt8brnrVEDBpM8n?=
 =?us-ascii?Q?NQ7kbMOaFXwG5z7FuarSkF4smRn3Dx+yaA+rKu7NNUN+ud/pF051/1UWKwVz?=
 =?us-ascii?Q?o8vGC8RyrAy83885TEqJVatyeJgS4T6Z5zEOyQLJ+54Vt8OW/lewOCVNCJBk?=
 =?us-ascii?Q?9YA26PndJy54bsxBbzpe+kDoiJO9eqY8Owmoxd8gLTOZ+pIeDGlPst96f9WJ?=
 =?us-ascii?Q?FhzE+a4bfeqeyxr/kdRtuXOlSI3XIvcca1tk0RHHfcOXdTCfPCixN8omkTU7?=
 =?us-ascii?Q?bgDTDPDMb/N5tja5RQTFPcqQBbI2v58YHazP2RX9W7tnOnrYvFk+a5eEw/Nk?=
 =?us-ascii?Q?qFY6asa89QcfepqzYuBgXWz3HybVa7sWFK8m6JPBn0OnSMSKyq5RtcI/QzNd?=
 =?us-ascii?Q?vahWw3XuAMHwalzUTAj54ch5jenqhlp8dVrArG4yXVyvoi3aqVVxoqAsg6tQ?=
 =?us-ascii?Q?cPvWO/KyAjKUXeQeevPk7q9043RRGH/t+TblIX/+76ENXoCGUXyMtRLP1hDN?=
 =?us-ascii?Q?dsL7TjFLvrHXAiJV9B9QL6do6uwSlRjHoHen995x4EL2wrh6sQh4PZFIrYiT?=
 =?us-ascii?Q?/MewElWwVkP8ECZfOxiIQAsrZ+Aulnp86/E1Dq8e/LNs92Qj5E/gHYw+rFso?=
 =?us-ascii?Q?ObL+fIHYdxP8Rh0cjXQFguwh3UpIPwy3hVnMgdnfMlvUr6I92knzaGm4GlkI?=
 =?us-ascii?Q?nJs/aLpfeQiDeGt2Kc8psCk5OZ+sKiFBNvMHpHfkItXUWNFqgW76q/aOYWSC?=
 =?us-ascii?Q?QZOFrJwkNfMeSQ0QnPkAApaNnCUq9SdMckznxDP7TzFeXSuYhyej9sbyjWFr?=
 =?us-ascii?Q?cXhwcYTrEmCAPJPmtCZQo2EgtrC9SvoWNm8cOpVAe1iNUZOwl/zBKrLNPdMT?=
 =?us-ascii?Q?l1ROm+sfmqDprApUs7TAbpgcCS7+BmLkcbBgiQPLjnk0UpQg2Aktr/Y0gdmh?=
 =?us-ascii?Q?NdZUhXoCrLvTpdD8Od3AyafwT7RC4HukLL01qYhTwAZzHb9Xv6GrvHamskm2?=
 =?us-ascii?Q?qOZ0gvA9ka0SdaoCwEqgSn3sn7BkJ0urwEYTMFfpK9+ru3lacDUh52t+eKMQ?=
 =?us-ascii?Q?6YG+2sw35SYIDeuf6lfJ/FbWMWyVkdWof2yqtmOG7bLGbFWEhmfI+URVAD21?=
 =?us-ascii?Q?RLlXWpHHQNVd76zhPPl6g4ZohUHLdE9XujbYak/raDnSRrUcko5C+1HKUbCc?=
 =?us-ascii?Q?f/CxyGfdZYJKYaunuUHiuK6dw3JJAORke4dYkbcgZCPBjkobSK88Zv8h7jsu?=
 =?us-ascii?Q?nYkp5E+Lmm8jPSJ/hlOmLzVo2XMYI+B58OnjpVJpNF2uv1hSqANpXBmo26g+?=
 =?us-ascii?Q?OYDyyq4xAxO++P/eDt3IqzFjldk5C4hwdmcIA8SY9CAfjl40xnf1kdJ8mIHR?=
 =?us-ascii?Q?kX7g4U9j/0kVhPdlNArYKu2G7/E4CBvAHxMy7Z7YYDUZI4FqUv4XHuFrxsfQ?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147d0a65-5201-42f0-8741-08dd201f956b
X-MS-Exchange-CrossTenant-AuthSource: PA4SPRMB0023.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 11:23:38.0989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjRqoNVUn3UYS2KfLq9sKoiqL5ahLcsQ7XOQ7gTHNCYjwUmPVTmJCPy3akLpO1m2bNodo9e1OH941FA174ZSGvOxz2/7rkOFuZrF8VgIjE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Describe the layer which enables SCMI over SMC calls forwarding
to EL3 FW if issued by the Hardware domain. If the SCMI firmware
node is not found in the Host DT during initialization, it fails
silently as it's not mandatory.

The SCMI SMCs trapping at EL2 now lets hwdom perform SCMI ops for
interacting with system-level resources almost as if it would be
running natively.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>
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


