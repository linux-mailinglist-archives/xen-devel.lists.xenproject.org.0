Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A77B8FD80
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 11:50:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127730.1468345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0dAg-0004CA-Gt; Mon, 22 Sep 2025 09:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127730.1468345; Mon, 22 Sep 2025 09:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0dAg-00049P-Ad; Mon, 22 Sep 2025 09:49:22 +0000
Received: by outflank-mailman (input) for mailman id 1127730;
 Mon, 22 Sep 2025 09:49:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n98p=4B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1v0dAe-00049J-Lk
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 09:49:20 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66ea36ba-9799-11f0-9809-7dc792cee155;
 Mon, 22 Sep 2025 11:49:16 +0200 (CEST)
Received: from AS9PR04CA0179.eurprd04.prod.outlook.com (2603:10a6:20b:530::21)
 by AM0PR08MB5505.eurprd08.prod.outlook.com (2603:10a6:208:18e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 09:49:10 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:20b:530:cafe::35) by AS9PR04CA0179.outlook.office365.com
 (2603:10a6:20b:530::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 09:49:10 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Mon, 22 Sep 2025 09:49:10 +0000
Received: from PAWPR08MB9005.eurprd08.prod.outlook.com (2603:10a6:102:33e::18)
 by PAVPR08MB9858.eurprd08.prod.outlook.com (2603:10a6:102:300::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 09:48:36 +0000
Received: from PAWPR08MB9005.eurprd08.prod.outlook.com
 ([fe80::d65b:a08:278:38e3]) by PAWPR08MB9005.eurprd08.prod.outlook.com
 ([fe80::d65b:a08:278:38e3%4]) with mapi id 15.20.9137.012; Mon, 22 Sep 2025
 09:48:36 +0000
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
X-Inumbo-ID: 66ea36ba-9799-11f0-9809-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ryUswlh2bPfQjhtacTN4xP7rucK+2AvSM+ZaKQjG1Tk+yskweE3LNZjAUDcMnh4BhwoDh2bra3zBJ9xrAVpJbqTO1jcb3glpVoV9q1dzYYkM1x6QsUoM681fOu+rbyFEUyLOG5zYq8Mf8LqT5o1xxhaKoCQG0WTxVN+RHDphjK0BbAY4/sUnDAXuGw7tRUHlKR5ZLuvPDfReHriiN6DeymwHmHfMFhXRvinyu5amsF+dnOeE0qUeC3AZWH4D/qL1XiPa+SQrWdFw8O7S71Ng7Lll1qAmfVr9KDr4OoprV54e4dB+zsERUMMJKM6lCaLBpN5YoQluybw/xxUMtTuJww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCdKscu6ruRp97nwmqgS4IMyeU9XD9sfV9Qu+aXDYms=;
 b=bLMJ1VBE2vp6wMnux3kHiN1vkWn95mlpOs1SY3G3q0zWUEISvZ1ClMggN8TOdfdpWvES0KDbRf376mILy9xKNzEitTnQqP3NICA/NNZFsTl386nq/x6slu4RoxZda+7/vf5j2tirUaWT23KpcmA4aBp4xJUgQnItmDqdER9WgIHBOoHEiVg71sPSzkYBSOySDQkbOjoVohkxPYhO8LdRCacTw4ZHzTZRK3aAEoZYFbslI+Fgy6JJYtZklikucdItztxJnjIuWdp+7/VmdKciXlk5SV0qNiJdb8sXiyrc5I/LE23ITt05wVK7nUjzMNZ1G883bNNtMCdgJpPOxpwUcQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCdKscu6ruRp97nwmqgS4IMyeU9XD9sfV9Qu+aXDYms=;
 b=BdWU/2gT8XlaY1CZ2JKMxF7BK+nSss56Dgmy4ER0FZ/eC2xNOn8BMTnYHm3fZSfLJoB+wJCjIs7Ow7wG7Blt/xJZ3Z/tXpTmrSEYfCSQ764CmnO5+uxkvLf/OM8xUq1nJKxLcV6CKSRMD1rFcN/vSduDn+UVXg2G1q67mL39NdI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2wZZdLOuigaRyhNap3K14f7tm+CZhxvv3gxiP2/s15X9cMDTfzSU7aQ60Xwstw0KjkbntY7XXPUnbChpLBbaKVnKIbzUaey+8dJ0QU91LiHR6MohER97x7pkMpL4HHaWQXs4Uz2insdx3CPAwVGe28SGkwe8T/TgchTAc+3eX0p5lN/YYf/qaaXoeRySnhpHOlvnfBRT2najaDQh/NdDRbITd6NuKqhKdAURSQOyYPT8Yit2u7vWqVLNrjulNwvDeOzqIZIoii8X1Qnn+46zMs75QcELrcoaObgjTr5jQLnLbLy5ayTfl8XawIhLdFiJTkNa7LKzZVxTIxN2gZrNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCdKscu6ruRp97nwmqgS4IMyeU9XD9sfV9Qu+aXDYms=;
 b=Ns72EQFYXXKs/zrAIh34b81Gm8sfgeIzfgrUCusE4iReDQ6mg23aZSDh52/UeRn2lIEPQK8eF4rIrpOs0BWct9wSm54EOStf8Knd7lCRcgG2Ap3bmBhN8Wf0J3EWSYYPhtXFt1W27LUb7QG9Zj6mlLwHpFGPq5F+gB+FMEPErIfVuhH17WjizH80H0fn2BU9n6o8e/uUl0Q8oxXqe+Or0WoANn3qJ8R69GU0q5FbVDTmKBxdnyfH5v2OM2HnVZH5CTTMgAmqO3UpcwkK82NLzJ5CYexfNYgmrrHw61u0PtRUHdg4g5Y+l+Jc76gZNwCo84tq6a4jXdGzugZKBTqIqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCdKscu6ruRp97nwmqgS4IMyeU9XD9sfV9Qu+aXDYms=;
 b=BdWU/2gT8XlaY1CZ2JKMxF7BK+nSss56Dgmy4ER0FZ/eC2xNOn8BMTnYHm3fZSfLJoB+wJCjIs7Ow7wG7Blt/xJZ3Z/tXpTmrSEYfCSQ764CmnO5+uxkvLf/OM8xUq1nJKxLcV6CKSRMD1rFcN/vSduDn+UVXg2G1q67mL39NdI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH] xen/arm: restrict cpu_up_send_sgi() to arm32
Thread-Topic: [XEN][PATCH] xen/arm: restrict cpu_up_send_sgi() to arm32
Thread-Index: AQHcJC1gjv9t41MjxkWbCWqmFW+v17SQHGmAgA7nUIA=
Date: Mon, 22 Sep 2025 09:48:36 +0000
Message-ID: <A139EB0F-3966-409B-90D5-4A12684E81EB@arm.com>
References: <20250911081213.1323594-1-grygorii_strashko@epam.com>
 <705d4436-2263-462b-a582-5f0092821959@xen.org>
 <alpine.DEB.2.22.394.2509121512450.628111@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2509121512450.628111@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAWPR08MB9005:EE_|PAVPR08MB9858:EE_|AM2PEPF0001C713:EE_|AM0PR08MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: 18480cb0-7802-4bd3-db0c-08ddf9bd478c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?GMoaELS6hJh4HBahlFsAWhchYYkXv0ceVPS+Hfp4rBk2IHqHMfv1aqx4o2Hk?=
 =?us-ascii?Q?vuTQjLz2X7+L/MI3I1JLNyHDVTb3+dcIIJ/pfGrDGvzf/Upc6sbcPcKDzobu?=
 =?us-ascii?Q?FuZYiDYwRqhhnKPzeBmK1IvG35xvF4I7CFMEJl3uGIsQ1ovINly444kNR/7J?=
 =?us-ascii?Q?ky5aXOqd3JjMX9Pc9nEYsLDTg+Rxy1iAJZBotAfd7PKLZ0dpOnlTX0S2Qu63?=
 =?us-ascii?Q?XPyzedvlfL/YvDCo3A5uPLCzQ0SMxehPEUrqEQhoae9DoOdSTMJb55XJyE4A?=
 =?us-ascii?Q?1CePSZZxzzXIQYgDtzWmMkb8qRI5iUVhioC8WY7lpR/IKJyg7RuGMqg2Mt6T?=
 =?us-ascii?Q?O6fO0GQ95CJzfwvmcAwsHiyQZZ8amlxO7+rIme2gFN6CHcbrFAMsr3DV2LhA?=
 =?us-ascii?Q?pA9O16MMomsjTrVawYJTT/5B6q5Aq2pvM9R0x7rgTdndVFVathhOnGs5SJWV?=
 =?us-ascii?Q?ouuXAD4mq0BN+oFoKxnx7Bo4IMrpT4LJCo3tcJcdjwueVd9bdotQdHWu8xcf?=
 =?us-ascii?Q?OGYNdsNUg5kzjbZoaNmxiXnT8zhQXBDXwkrOckNY0f2clsC4xeg9Nz3tnSfu?=
 =?us-ascii?Q?fNpzn4VAxjIT3fvugCISXsIIMv6qdTbvJmBkeihJVyYqRA0tg3kwLvDGpayR?=
 =?us-ascii?Q?tgnC4YNavrzrwrNjSR3qG4NESu8jC7lnwlR2jD6wkiObj/gmOcCOIpA/Q0js?=
 =?us-ascii?Q?14rVOTWVNSPDrmRLfjki9QDxLxYg9i3Sk6Nt/u1YzS55kmDFF6lmSvS48x+A?=
 =?us-ascii?Q?8teISowI28Otj9jdiCvgvZ2muw3KAT6PAf91hgjI4o0stF/OQxorzGUpEnoT?=
 =?us-ascii?Q?ms172K/4wo7zyi7lSdcynS6DNuecnO37yGfBrt82eLKYj4uarKIxTCBnJuWq?=
 =?us-ascii?Q?I2PvC6kWTYM2VvHewfNkSIvywySlkWk9Z7M92tx1tqKQ9IMSyD8wWGgKERuG?=
 =?us-ascii?Q?jFESR7AV++I1IDEBrvgKS4aUMiR5eBpYDLyTUG9iEB5F76h1m6PMWRhNmIhQ?=
 =?us-ascii?Q?siuTie3DivVg2nEg3VMxvYACtZI1jQ3f6Z9joEJsBq9gQPmxAoC7UVL/flFX?=
 =?us-ascii?Q?tY2tIFt7Z7B6bC+5SE93TDlwVbFdQ+vyeCiQIHpwMFuGHT9M0FJvGbeDtGX9?=
 =?us-ascii?Q?/5WDuwftVcUjjS6YubBQq0D051CcbuCleAR6xYkCqeWk/KrBiMeWy5T84mrK?=
 =?us-ascii?Q?z9lpEgqFVIvVzJ2v1Bz+iQZEqJH9d1HGhQV7mwDF5HP2CIiPvVHcilDGBzhr?=
 =?us-ascii?Q?rv+KsKEKgCZoYVSsRJWAhsdm80NpmIKmBomo3m5479evWQp7xUIqtc0QU+ZD?=
 =?us-ascii?Q?uw60Du2xV5wMgbXdZ0MB8y7r6S+GuS57w3R05ycr6sk/vEMkcuomeil8LF2W?=
 =?us-ascii?Q?3kuR/gSKETmEidTvx3LpZV6pVCWi5+eixNp3eI61JQac3wQ4A1w1y34quuaW?=
 =?us-ascii?Q?CkwrZoONqRSCKWBX3dNNynKTOW1LXphiEcqvoLRkfo9vyOU08NDNYeBu7sLd?=
 =?us-ascii?Q?XhdfAFU2NY3bs6E=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9005.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <490EE14B0226E848BB26CDD6E38A9D18@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9858
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	34cf2371-4e01-4cd8-7ed6-08ddf9bd334e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|35042699022|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q1w+S5T9eLW4Nn0aE3yCAuNbncTEVTxz/UsjN8RwX29ST1S4jsuNMmTol8IF?=
 =?us-ascii?Q?3d2gB7HvfPQ39OC0U+MTOAH63K/vkdYzzhHSl9zigVanygXd69L/cQ45lMVM?=
 =?us-ascii?Q?i0sR8F5G3FCQVkjoyH8f3b+p8mYklxpioeRdR0Oi1IHOikVQAv1ihwfHWv/Z?=
 =?us-ascii?Q?M3l2KdcZKowYVqZQjgJuw0Qug6ArWLCxAbkZyrKpz3gr/V7xeXXmJNi8gi/Z?=
 =?us-ascii?Q?HbFDxp4GHJKog9YyTbCizep2Ei5GxY8R8VNRBDP7DxwrKjQe2DPlZRISJ6MP?=
 =?us-ascii?Q?3bnG59F3tl7CSomDG19V8GzSljAETJjea04Bq7Ps7qq4kFR+5LuFm9tB3foL?=
 =?us-ascii?Q?RM7JWUMhc/UkxRXgY2JXMGqqtDldYcaeerbbnBtZFrYLiNAOcVLvQxDdfyeL?=
 =?us-ascii?Q?DgMYPstW45nGx41vrbzBbDBxHeWyQfEFB2alP22rEPX51hc/gRuBnFnw14GF?=
 =?us-ascii?Q?AQn5da0+CtVMpzCs6KZxVUcBfCy6X7lRyxNM89hzUWfJ2sOKBHhJ6RjasPWV?=
 =?us-ascii?Q?W58l79830ZQLwImToqP6M002Zr7l1/24HDoBbSR3FL+jyuYpAcHByQk5XQW8?=
 =?us-ascii?Q?5we8N29S4AEHU70XJQkxeBgKrVEGYdoMBjXAmjg+KPF0mp/OiB6konE/4pMQ?=
 =?us-ascii?Q?TylFwXEB83CA7DP+c0LvpzB9d0h2HCuCmP/vlDTQTykay559HrqFFt+qemhj?=
 =?us-ascii?Q?Kghsv4/zxdIwMZ8wNamYH+YqpeNFeedOM1jMNr04uVe3OrlFbCDlfNFZkrA2?=
 =?us-ascii?Q?K8ylB+CxrQ1WktCLn1o0/7Mb8f8odI6DV/Ydx83Nre8u3rv3CT1CmTF6K6f6?=
 =?us-ascii?Q?9ISFUG7z0532cqWxlsk2ETQoOMtdcDXMgeSYPQmE2UbJmhfM+MYd7HxccTMn?=
 =?us-ascii?Q?0KXyhiW6ff2QHl2V1lmWaTy367z62vH75vHLF6SArxFCOllO+IqUvhPSCeT/?=
 =?us-ascii?Q?1P6bXg/oqxFCjFKfN/ypDMDiOc74bicx6lmDVhntYl/9uXVqNDveOMc5AeC0?=
 =?us-ascii?Q?4A9Lh05U+fcJFSZYwKm2/IXziblE/Hrc8YsPx5D/N8Y99wKTm8AgWkdhMggY?=
 =?us-ascii?Q?eAFMCaVuC/rCVnj78AFZgeIQ6tMOPtbJuXHiy4YErq36O7iqd5QMnEzpS5qD?=
 =?us-ascii?Q?ka0VdTlHSqigt+WTpbr5VrFN6oUdJKDu7lDgQNiRHoQFmo1hns7HFW5XXOo7?=
 =?us-ascii?Q?6m2jbusxXmRuWVDOsrJen3oPT5dZSlez1cBNBfR9WP+m7CaoE7+OFZT5yvyd?=
 =?us-ascii?Q?Dvt+eXGy7jUAjVPbiM4dkKgF6pJM0p3Bx90FpMHr0s2Bboqbas55BSf9Zgz5?=
 =?us-ascii?Q?8mS9i+RxP445u0lmtj1GjFcuc1aAU2UVmgZu+MWAOWYT/LVBfx4YM+XCGFy4?=
 =?us-ascii?Q?LE0uFvFJWnirOcjfMxv6EL4PTSOF0LHFAGU48gT2ccA7vNrnuR2vMpeinySq?=
 =?us-ascii?Q?XDvn6+rNNK+1Z1D5JCRDfxKk2zims3SayZQzVh1mpAPx6AFr5zR/lPJJjd+h?=
 =?us-ascii?Q?FFqDFP1uWDUZtgX3gQAGLmZ5ep8yJSTGp6QP?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(35042699022)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 09:49:10.0012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18480cb0-7802-4bd3-db0c-08ddf9bd478c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5505

Hi,

> On 13 Sep 2025, at 00:12, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Fri, 12 Sep 2025, Julien Grall wrote:
>> Hi Grygorii,
>>=20
>> On 11/09/2025 09:12, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>=20
>>> Restrict cpu_up_send_sgi() function to arm32 code as it's used by arm32
>>> platforms only and unreachable on arm64 (Misra rule 2.1).
>>>=20
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---> Logically cpu_up_send_sgi() should be moved in arm32, but source i=
s
>>> "GPL-2.0-or-later" while possible destination is "GPL-2.0-only", so put=
 it
>>> under ifdef for now.
>>=20
>> :(. I don't know if we will ever solve this license mess... Looking at t=
he
>> list of platform using cpu_up_send_sgi(), all the platforms are 10+ year=
s old
>> and to be honest except maybe the rcar2 development platforms. I doubt t=
here
>> are anyone using them.
>>=20
>> So I would be tempted to get rid of them and mandate PSCI when booting o=
n Xen.
>>=20
>> Bertrand, Michal, Stefano any thoughts?
>=20
> I am OK with that.

I am OK with that to.

Cheers
Bertrand

>=20
>=20
>> Meanwhile for this patch:
>>=20
>> Acked-by: Julien Grall <jgrall@amazon.com>



