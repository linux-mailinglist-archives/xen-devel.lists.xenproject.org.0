Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2+KIOg6uUGpx3QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 10:32:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C56273882B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 10:32:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=epam.com header.s=selector1 header.b=DQsGkmQ0;
	dmarc=pass (policy=quarantine) header.from=epam.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358897.1612745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi6eC-0002rV-ME; Fri, 10 Jul 2026 08:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358897.1612745; Fri, 10 Jul 2026 08:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi6eC-0002on-JA; Fri, 10 Jul 2026 08:31:48 +0000
Received: by outflank-mailman (input) for mailman id 1358897;
 Fri, 10 Jul 2026 08:31:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wi6eB-0002oh-GP
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 08:31:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi6e9-0068DB-T6
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 10:31:45 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50ade4-5cb7-0a2a0a5109dd-0a2a4509a4b0-32
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 10:31:45 +0200
Received: from [40.107.162.74]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50adf1-b440-0a2a45090019-286ba24acae3-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 10:31:45 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by PA4PR03MB7518.eurprd03.prod.outlook.com (2603:10a6:102:107::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 08:31:44 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 08:31:44 +0000
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
 b=wMpE6MFBzo97MT+aUuYgsLUghr+M9Y9yXp1/n4D2TwCzu9GW2/yCldNFNkfqGBFTVENj3HpV0Kr0Mrfo0qjmLQ5mBmIkrmEI0RXubPOIcjTYJ1qJJL68z6ZQaa2QouosijE2/fgfhWt75TlqIm+VDybbAmOKxOGDeNziPbJ6diXZW5LEhglRLanulmCiWt+b5K0fmGmS80DHReEh1s3FJ7VJGYaqW7jd5x0gWLPZmD/VE6VyQp80usEgX+z2hO6Ns2dO7h5Q4E0+/oSK3uzy+FkFRcdkhSwVtbUspwq3j3TtC6ffJDWVYycS7W+t6sM2EYvAozXUmTNjdHn/MD2bxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njYmxRByqxvj8zB9Sro/i12/XrQGCj0Q7a3fR9R1pDw=;
 b=yU3onzZHOkv54d2AjdwYQ1UND/T3s+mbEchevDySJ8fFqoISrCqim0GNgvN7uXT3nJLls8+2NWtMMY2YE95rJw3hLQeeeySZTckR5zU3Uoqm83CDa8qg02xPLqw6VqX0qIkn9lW5oxWr0LNRYuYcBSVPcUxz0Yx2zUmgz8/di/HhIpDICQj0Vyb0TpiRH2t6zWKQU2qPMYtODZcxGUcO5KetFPCdVhxV2T3a3BqAO/KvEEBaHFuGcpeFfbWsoD0QjLYcq2ODf+DiU8/jXA7Ijbt471NJ4LLNEQO3NkrppL5z75KinLGYu5zrJr68XIIau8uJwZ4YdgRlTgbnhzMCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njYmxRByqxvj8zB9Sro/i12/XrQGCj0Q7a3fR9R1pDw=;
 b=DQsGkmQ010H0/37ku709iYKfW2xYyPFhY234Lp4ZJyz0YBIBopMPfFxTsc/452Zos4rXMNjFYfbR+o8QBa/I6cGo7qyaYqHE9+l25mZV2KOZHu7VpBvEbCTVZAfUomYJRb9GU06HFGc02vdEK6KXNroaNDgVRLfaHafqqIKxVGEu8w95Abyb5xp2fcOz50CM2SeVQM5pkGWZ8oKqcul/wMWNxbTC4fXr9d//AusyfemouJYCv77XZ5b9pQuW8vtHoWeFABRMH63zBMdg8uSxGgW+jDyy7gXHcbNtUDgVhD4RDCjlrrZ3TUapWDdHYm+0GoKV3LfGP5a+ipCyGvfZ9g==
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.22 0/2] xen/arm: Fix eSPI IRQ indexing issues
Date: Fri, 10 Jul 2026 11:31:30 +0300
Message-ID: <cover.1783671887.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B93.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::631) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|PA4PR03MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: b763f364-de12-4310-1102-08dede5dac40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	afTGIJn7SvP3aeYXaLL67nghKv0YPVfXVa8LTjsy+jigIU6FrE0N6UXt/OvtQCYg23sWUI0Wza7rAIM0mEDkmwCyyVEllhXdpCY+p66rSsUQBCLgJa2YOi8iGGQ0r+pn4bx8RdAjN40FJKdmZJwibDJYYHwElW3Z7lVOsRGawslbjQQl+oo90/HLwl1Dw2gaXUaH8nicmk3vawSV/I34SmZkkGcOuhrXiXk2W60qJZdMWSeHe1bvaFflk8Ov+abVxgWhkatEdYIprjmcBbaHd1g2zVR4XhaV4l92q9TnD5vKahdxOsrGPQF8UsNm2U/ilg37G9uVPxWlRvoCysh4DuEJyMLoIqj5SwVW44bKkLQt6EEJ9X8L/tQT3WaZwId8Q+xBhxHMewhYE12XoV8IVTuB9knU7L4hZAecCRVXYdq+mr0ItqNPSOFOgZV1H5inRL9mp0oaTYtY7V3yfavrrjJvZOUcJW5BiG6MbefaQWNoGD+2J1C6qhOwBl4CaPXE8mdIfa1CFgvmn4PPTh+kVMN8rtL8nLSQukGs9jdKhejsWjycFsMMdo/8potiU8iMlEMcuJQw5VnLsCbiAnFAJBD6hGnaoSJII6OvHHnyq5z9UebhZp7CL2TI7VqlBEB5LZUheynPP9Qx4NDYYe3dvKsb96T2Iavbg2vVNRlmZ5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M2JNzgj3wogufgfb1YxEJpG6YauH7fFkNsCw7aZPUjLVzWyRWFrTJ/IT5d53?=
 =?us-ascii?Q?mUizPihMw5YSYFBC6yifXB3BY6m6sBt8C5+OMku71ALW3iIXQ9nvPY3QBY3F?=
 =?us-ascii?Q?SyiG8veBMUrj+/eMgDDZ/liowJMJDlCZEifes6cgrsqySnxPcfUd+stMLA5e?=
 =?us-ascii?Q?u25Ys08D8WyCdxoLc3D5VY50n7dbMsLQ2gsRW0iUert+Z3NffMNaiOGTQ72b?=
 =?us-ascii?Q?lr2n6/9z0gRXj8gLAkB75/UDJMFwMq3G7loIFF5uSn88OGunK8v+1lq1D3zW?=
 =?us-ascii?Q?JBNJX+rSCtdCkVFNbS6eanQoj6sxxV/vhneMe7+/T8kD/a52ta/VJD6Znr/k?=
 =?us-ascii?Q?kQOcMiyg+8yOHy260oWXXfxekpiYoFIxwMD5BoWWHnVdc0dvDDuxml2IlHB0?=
 =?us-ascii?Q?SQbo/IB8KYvFZrpxHSgTSf5Z5lhbPJ+EEJWOFNwLVpr3bsi/QzgHa4+d95bh?=
 =?us-ascii?Q?FlNmfpzV16zrs0dlWj1Fhh/iJIYAaE9/pZavYpDLLsGNjafFC33hWlQsidsr?=
 =?us-ascii?Q?a/tdjUYowzIISaQk4oBZH6yAomPUdsMhoqrFYfVCai7d44oEKnGW09EMqxQg?=
 =?us-ascii?Q?2Pf8aTAM/oUYVWh/ZNnJ/mG9e21aY6q02pKa1P53lz6J96HcXBuQKyg1kqWz?=
 =?us-ascii?Q?spkWEiCrauATp2525SU39rDgfs6km9RuSph8rbj7ks0FxhCKf3B3mVqCW05L?=
 =?us-ascii?Q?ko37LZ/dTnZgV04HNty++SCiNyv6c2TZqLCRaJ5o59hvavvtv8H5oPEv2IZD?=
 =?us-ascii?Q?ANuvl4JEvmeDTCmKV8mb427yCAYPTBJhktG7wi0ReuZSMqNAd+IAd/r43eIE?=
 =?us-ascii?Q?ktJTXnZSPgzb0eTg81gW8GmnzbSPque9Oaeam0mz3M1UKfa/odoVRnlN+/Ri?=
 =?us-ascii?Q?/ZbgmAq+4B00/cCkaSrk4gagxMNyukqRX44fc/3N8Fuc9Ghan4/GkLYbh0iY?=
 =?us-ascii?Q?aIK+7ufV87wV3EhghbMuUcbPOasREVUb4+pXtaX8M0THlaU0PrHYwjZr07ir?=
 =?us-ascii?Q?50XoyR49A92UZwbRWGBhlVod7jcnQnAde2zsr/Xgj/MhNAnod0O7GWZ7vypJ?=
 =?us-ascii?Q?0WKmg+m3k/enUGXS+/2Xg5Ti3VHiiLZB7sv0hY4KF2vIAItXFRmehj3b4Sui?=
 =?us-ascii?Q?vQCN9f82KNvJlVq+E9fJStcag+SYSKF8Nql7vZ3zcrCvXuFpPfP/MD0brPl8?=
 =?us-ascii?Q?JgdRJC7jWSA7091q423Dd5RUyBraZh/YgJoz5o6RvPDQZC5RaYR2B+VAdZSB?=
 =?us-ascii?Q?P+qJQp+COY45hPnV1JU7d94ZczHipe39lsMYp6dn/NEKgJApZjSLxdC4sfy+?=
 =?us-ascii?Q?nEYlvneNqp2HhCdMaqNFpdBB+45ixLJ4+8Nul5PWGas7nayklIBj+P8uHGrF?=
 =?us-ascii?Q?gBuwxCMcKJttds7WXseWmCdC5wKzE6fzEykGJYvpB7NYC2uoqKiyMe3xjIyK?=
 =?us-ascii?Q?dSG5VwLN23czaorRL5J6FutyesQCQBKEiLmxp5l4kqh+cLdxG60NZ2hfHn5L?=
 =?us-ascii?Q?pyaGuWdFKkesBrZ4YeC6STPyQ53Bm+GVL9N2JR2gJ9o5/TOBlt+COv+v7jqT?=
 =?us-ascii?Q?3M+BgLKE+p3eRLIrs8VgiXYOAYYrw1NHiqMimS3SRXAqxSwrDYHZFFEbmaM2?=
 =?us-ascii?Q?TDR07P0Ev+Q+rq9yObeHTTxXd3JJICi1o5lBHAdvqdtTHnutY9qb6CushEMf?=
 =?us-ascii?Q?Vw/26krx4QNvXts/Y1yd5Zd411faPShwqs1vCTzcha+LSHdm5pezEA9l8HqX?=
 =?us-ascii?Q?PXZBqrAbDA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b763f364-de12-4310-1102-08dede5dac40
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 08:31:43.8930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3i5a79GKPoMzZJOqZTZQudEJY5myrkyBWweWqn1IsIQLM5CKtJT+fNdrtrRmBRHvWglvnDcZXd+QS74BpodhVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7518
X-purgate-ID: tlsNG-bad1c0/1783672305-5C344A0B-E5C3A448/0/0
X-purgate-type: clean
X-purgate-size: 1300
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:from_mime,epam.com:dkim,epam.com:mid];
	FROM_NEQ_ENVFROM(0.00)[mykola_kvach@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C56273882B

This small series fixes two eSPI-related indexing issues in the Arm
interrupt and classic vGIC paths.

With GICv3 eSPI support enabled, Xen exposes a sparse architectural
INTID namespace: regular SPIs occupy the traditional range, while eSPIs
start at INTID 4096. Some paths were still treating that namespace as if
it mapped directly to dense internal arrays or bitmaps.

Patch 1 prevents sparse INTIDs in the gap between regular SPIs and eSPIs
from reaching irq_to_desc() and being used as dense irq_desc[] indices.

Patch 2 fixes classic vGIC eSPI allocation bookkeeping: reserve used the
compressed allocation bitmap index for eSPIs, while free still used the
raw virtual INTID.

Both patches are intentionally small and keep the existing eSPI mapping
model.

Tested with:
- CONFIG_GICV3_ESPI=y build
- CONFIG_GICV3_ESPI=n build
- FVP boot with 64 eSPIs
- pre-fix reproduction using a fake DT interrupt for INTID 3000
- post-fix smoke boot to Linux dom0

Mykola Kvach (2):
  xen/arm: validate IRQs before descriptor lookup
  xen/arm: vgic: free eSPIs using the bitmap index

 xen/arch/arm/gic.c  |  2 --
 xen/arch/arm/irq.c  |  9 +++++++--
 xen/arch/arm/vgic.c | 27 ++++++++++++++++-----------
 3 files changed, 23 insertions(+), 15 deletions(-)

-- 
2.43.0


