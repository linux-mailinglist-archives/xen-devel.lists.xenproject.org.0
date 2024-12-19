Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 141729F7921
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 11:03:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861039.1273038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tODNC-0003qy-MQ; Thu, 19 Dec 2024 10:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861039.1273038; Thu, 19 Dec 2024 10:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tODNC-0003oU-JW; Thu, 19 Dec 2024 10:03:14 +0000
Received: by outflank-mailman (input) for mailman id 861039;
 Thu, 19 Dec 2024 10:03:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vR1G=TM=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tODNB-0003oO-06
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 10:03:13 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20611.outbound.protection.outlook.com
 [2a01:111:f403:260c::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74282dce-bdf0-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 11:03:11 +0100 (CET)
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com (2603:10a6:10:312::7)
 by PA4PR04MB9590.eurprd04.prod.outlook.com (2603:10a6:102:26f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Thu, 19 Dec
 2024 10:03:07 +0000
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f]) by DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f%6]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 10:03:07 +0000
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
X-Inumbo-ID: 74282dce-bdf0-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggz87eeGV5Q0vgMnhI0CJP5gcI8ifozUxtPDt5gaPzuOqJAe/TyapFe7o8CdJmnml6OVbLPjiUHJ5TyDIt7YLie1VyCTrIJhrNlx06dxX8SRddVJ4nn3kdi4j7srcHeYRR7LkKavgY5l8oxFXx0AN2mCmEVIbRQsRnBxm7bDQazwl6Y6K8/yviQV2GcpWiK2JfYKYzP6Vwk0rb3GnAKDbzOrn/DquBzHBVLU1SYcB2f7pGCEwh5vaOETDgHHAI3TwlZYXqo+y38+QKTbTt6bzwIuK22lcjEEFw58/ZkB+Vk30HkKPVYxZTSPhJcjJxEzqfRfyeiI06MuWLKQx2zBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QK1C1SuFyM8QJxGneRzCFJCjyqz4CB8QTpVoXs1AB0E=;
 b=EPBtI9SJiSY5Hlf2wDoHicQudvswWE/XF/KyN3WCRhY0ls7Tctccogo3uUqk4CQK2WO9/UAaBavhg8AqzNYoz94tuNWuHDe3OlHB6DiLX5B71B23aEMce5Pxr+PhTki9pI44JcEgVGQjTHyvmcItuVDdWFtIXbECiiOyoHbtA/damRAgZ/3V5jHFvqv0O/r6BX52Ir4QW/tKa4//YeLk/UEFYC06FKGHXhw/aTQ8RjhumGKfjo3RTtUH1Fy8/+jsEqm0zseNfynVWxU+VRHjkvAAznahmTh4Xc+Qn7zRSg3A2KRpVyFgnTdImVXXX7CxUaPUr1E7JUSFzCMx8kmKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QK1C1SuFyM8QJxGneRzCFJCjyqz4CB8QTpVoXs1AB0E=;
 b=E+7Bkl97DwRhqMwMeo6PellWjSMSlpJAnM3kB0IA83qCKOSPvTyVAnIByoVKdLV/9Q1XB4ltOIGho3KKrWVyG8P22S4Seggo1CCBzFqLmv35hFdpMZUZteAss9IeBePh4HPyBCuvPsldxPduH9tDnicRI6jFRNjpxwV5NYPbl1UCSdm/ViCx+4wMyFeSE0sf4Xfs+TL1WY1VnfGCZCEbiSeF8xfrV15qxUbYfeng5g2+SphXWqKoSymjfKu0L+we8Uz+FTRWD21ljDRyNDjy9QKrcP+HNXrvp8UpUTgxxC9JB27OLtYcXhVo1ivsZCLjlU4mFRQYroiN2wqfqTxG0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <21968a5d-9d81-4cbc-985a-6765a6dc090a@oss.nxp.com>
Date: Thu, 19 Dec 2024 12:02:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] xen/arm: firmware: Add SCMI over SMC calls
 handling layer
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-2-andrei.cherechesu@oss.nxp.com>
 <60d4ac08-c5e8-4a38-bfc9-2b73e6cf5ec7@amd.com>
 <b8ae100a-4ee9-4351-9f60-0cd961810af2@oss.nxp.com>
 <87aad119-a55e-4683-824c-606f681af60c@amd.com>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <87aad119-a55e-4683-824c-606f681af60c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR05CA0076.eurprd05.prod.outlook.com
 (2603:10a6:208:136::16) To DU0PR04MB9561.eurprd04.prod.outlook.com
 (2603:10a6:10:312::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9561:EE_|PA4PR04MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 57fe8b48-32f9-4eab-547f-08dd20145640
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFZOM3hZTnJHd21Nai9aTktibG4yOWQxcnlwNFRZVnRRcmo3YjVzWHAwK0hq?=
 =?utf-8?B?R251UHV4eU1GbGhqRjZ5UzlFTkhmL2h2dCtZT0tNbXR1WEVLUkUyL3JEMEVW?=
 =?utf-8?B?RUE1aEY4d2s1T2I0LzRhRmx1YnNaaHlYdTN3YTM5Skt6TXdiSlZNY1FBdW9M?=
 =?utf-8?B?cGwvbXF1bkhLR0lwSFdla1paVUpoS0dNMDVyRVl1RkdRdTc4MmhNTm05OHdk?=
 =?utf-8?B?aHgwUU1iMzVGMnIyNWNCcGJHZVN1dU51a3FhRFlBdTh6bGpVL09nNnJVdGww?=
 =?utf-8?B?THIyUDZ6WG0vRnRrYm5wNExPaE9rOEJLaGR3VUtrSCtqaVVrem52WGZHenB6?=
 =?utf-8?B?ZlhtWVV6VzFjbE9rUVg0anU5T3FzU2Z4cWlkOHVjQXEwSkx3c05LS1NhTUdC?=
 =?utf-8?B?M3pnOU9QcXdVMTN3djFuaDA5UUR2MzVCUjNkZ0JNSXNzRnl5VVFKZGxsUDBs?=
 =?utf-8?B?cDBoaWh5cVZuV0lDR0VkMjltYVdONHd4YzZPU1dQTURpU0dJVjhob3VCdEcr?=
 =?utf-8?B?K3R5T3NiWm9NSFlQdEFCYWhnL1FOVmJLSnpaN2RRNm40cUZrcHZEQmtaOTNO?=
 =?utf-8?B?dFF0azUvRFlZVWlIOTJ3STJacllUdXNEUHA5RUM3S3kzU3hDZGNZOUp6bmJ2?=
 =?utf-8?B?aXlHWG9OTkxZWHljV1dmTEhKd2wyTUR2VitFdXlFVGJZZlpxVm5LM3l4NGJX?=
 =?utf-8?B?bkxvTElMZGZlcUx5RUVJN3gwWUFTU3lPS2lMdEk5a0xtcC90akdlQlhRN2Zm?=
 =?utf-8?B?VmdVMnh5RndHbnZJNHJWN3ZLVXdwU0ppUDg0dzM5RHlHNGpVVDJVNWt6cno0?=
 =?utf-8?B?YjJmL2ovMjFCd2FTTUw1bys2bHdteGR0M09UZEdpTkU0ekR5akh4WERVVW04?=
 =?utf-8?B?Rms4Y0hieXpzRjhqM1RvZ0ZNbjhRcUlXTXhHcWpTaWs5U2ZkU3RJcWZzaXlw?=
 =?utf-8?B?dWZtT3QyY3hTVWtKa2t3V3ZXaVE1TEh1VldRbUdmYnBObzJQVS9lQ1JSaTB4?=
 =?utf-8?B?RDhwNGM4YURya3RZUlZpMnNsdkNncjI5WGtvK3NrU1hoZm52VWlmQnAzUjBQ?=
 =?utf-8?B?Zk1TeEZ0SWVnVmZadC8xZDBadWtIMXFpbFhLeE9ZclpRSndvOFZWNE5xRkJu?=
 =?utf-8?B?MDM2eHAxcDcvZUd4SUNXWE9rbEorK0pCdUpKSWdGQWg1aVltd2JmUHRNcFFC?=
 =?utf-8?B?ZVhxUG96ZndUZy9NVW1mdS8yMXd6bkNRV2lwN3g3ZzE2QXN2Mll5dnFMdWxz?=
 =?utf-8?B?WUpsYWlSblRnTkhnTWhUTm1WL3dBb0RmSUJiVE1TNGs0SkNHZC9rbWxtWHQw?=
 =?utf-8?B?MWVYY3h6WTI5cUdqQVorRjMwUktrZE5aNnRtM01XYjg4cW1GSWtJZTIzQVdP?=
 =?utf-8?B?eUthTUR3dGdjMmFaaHdNalQrdEp6dEZFNFFyamNTNkxad0FzczRMQVZQYWs5?=
 =?utf-8?B?RUJ1dFdWcVdKb2RvdjRpdHVJdzJyQ282QVpRQTFlL3plbHBiMG9xdUpodEsx?=
 =?utf-8?B?d1V0TXoyemthRUdRL1I0UTlKTnZxUEpUK1ArQkNzbzlLdExjOWtVZmpncEFi?=
 =?utf-8?B?SDlDdllZVGN3ZWV4TFlMTFJtNW9FMEhzOWZCTWV2alYwOWIyeXVjdmxYeHQy?=
 =?utf-8?B?OW00dENMMlFwQVZIaFYrVlgyZjBEOUdJa3Z1Z2Nja3kvSFJIRnR0Y1ZHYnpR?=
 =?utf-8?B?ZWs2dmpXMGdoZ2NsVGlqR1dOOUhQMzFscXV5VDZyMHM1bm1lSk9tWXRleEF0?=
 =?utf-8?B?S0tpNFkraTlsTktEMEpiNkt4c3YrTGttbFZOdVg1ekVLQXB2em1kYk5oeTlu?=
 =?utf-8?B?Zmc2TWVTSmpJOVlzUUFxaWVTcmNGTjBlVjJiZGs3Nzl6Y2NvQW5oTlc0TWE3?=
 =?utf-8?Q?AUqAPkGpS8AL1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9561.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG1CeWZ4cm9UdlpxN0p3MGZWU1d0RTU3VnY0ZTgvVkpBQmt1cEZmejVpRk9F?=
 =?utf-8?B?MWZ4dVVQZHNrNGNWYlhrQ3kxbXA1aWZqVDhNTzF2a0V4QVM0NGFNR3A5UHVp?=
 =?utf-8?B?cXIvd21KZG9XZVVLMU9Lb1RKY01ndUN0cWRMVDY4SjhxZXdsNDdrbnRkOTk1?=
 =?utf-8?B?dWpsNDQrL2VnajIxUmV0VjlGN0pxU0dYUGJNdXpWRVA0N1F0L0VSYW5JRThw?=
 =?utf-8?B?azJzdEs4aHZZbjN5SHA2a3hjOXR0L3plMjFiTnFNOWpmaUIvRU5HSGt0NDNq?=
 =?utf-8?B?SmlEbHVkTUNURGNTMEhxeWhmU0puUmJnWGZscVIxclR3Qk55NmlFK0pnelhw?=
 =?utf-8?B?bFp2cjRPT3BWOGlaWCtBbEdiKzRhbk8rSkgrQzYzTFlFTEFXd2xveHpqWUtO?=
 =?utf-8?B?Yyt4ZTlyNWMvOFRpN0FYNDJiMnlsNjdSV2s2VzRjWktpVXJuVEVWcThIdUpv?=
 =?utf-8?B?SUF2Y3d2Qk5hdys5S21wS3g3K2lFS21kYTNtc0xzejd3ZkN5cHZEL2o0MWox?=
 =?utf-8?B?NEZDZDN1U3k1cUJzZ0tRQWNCZTRGbDlxT1VWdXZqTHZ4Z244c3pteGU4Rndr?=
 =?utf-8?B?bm5ZS052Y1pOYzdmV0xZOUJKbDVURFIrVHJZT1poa2Z1TnUwL3VwZS9oei9o?=
 =?utf-8?B?cldEVk5DV21GQXdXcEN5YWQ2bnlHdm0weEV3VjlzWituYm5ZZEl3S21kZG5Q?=
 =?utf-8?B?bDNPc3ZpRUZpUUdUMjZWZ1VsZEJGYldnTjNkQzU3Wk9zcUZHWGdpN293QlZZ?=
 =?utf-8?B?VTkyOC9JaEpscFU3UnRtMUlUa1RLTUcxUWFacUpXRHZpbGRvSlRHSHhwUkEr?=
 =?utf-8?B?MTRqUUlwKzdXSENlZ29Ia2dJeHpGeXIyM2JNL1Q3bFNjck5LVU11SExOVzUv?=
 =?utf-8?B?b0tMM3Q5dnl2V0RJL25ISjdjaWVaQzVFTjFEMnM1bjIzQnBLZjNoZHF3emQ0?=
 =?utf-8?B?K3A5VkF0aVRscGwxQnVrVE91VWtLR3JDeGN6Umw1WjB3bWh0NHg0Ri9mTldC?=
 =?utf-8?B?VWQ5V1ZmdGxMc1hDNm9ZMXlMcVdodnFVY1ViN1d2YXpDZW5QeUl0NEZtSjhI?=
 =?utf-8?B?VjNlREFJNkZDTVZxVTIreUp0RHdiQ1QxQlVJVHM4MFErNW1wV1RGeFZPanZE?=
 =?utf-8?B?cDU1Wklwc1JDMlVubm55NG9kd3pmazYzbUlYa0MxOCtWcE5xL3JKOUJxMUN3?=
 =?utf-8?B?aEE4bms5NHoxa2lxL2txV1M0dFBOR2orU2NJMklRQnpPbnNDc3ZSYmoyUkpi?=
 =?utf-8?B?a055bjRiZnFLazlXRUdnZjVxU3BPa01yTmxzdFI5SFZPVWVITGMwdDhXdEsr?=
 =?utf-8?B?YmdnUEVtdGdlc2s2VDVXcFFCYnZmbHVCZG1peXJXZXp1MkEvTmt5Wi9ZVHZF?=
 =?utf-8?B?WFZBTy9tTmlaSmlEWnZmWmxkRTZOZXdmMUJXc3lRekZ2c2lORGJOU0Jpd0VI?=
 =?utf-8?B?aHA2T0gyOURlVDhySzNQSy9aSTY0Ukg5b0kzckVYVjM5QnkwTjVlSGdyT2R4?=
 =?utf-8?B?WGx4R1I0Y1NSWEZjcDg0TFZER1k2cGVDZ0FKMjFpOHEveCtOWTk3bldyK0Qy?=
 =?utf-8?B?b2RKL1JhUlNIUnJHMWhSYnNkZzlsdy9nMjRTKzlMZElEVlpJQ3F4MWRLKzU0?=
 =?utf-8?B?UVU1WTN6ZVVKT3AwWERIbXIxUVJ5Y2dZSDk2Uk10endMYWZ6ejBxTE5qUzRB?=
 =?utf-8?B?aVZuOURMZnJSR2ltWnFyZ1FMdnU0SkdLaGhpWW5pVkVsVHhkTFI0am5SZWww?=
 =?utf-8?B?ZHRQNlhQOTVMbk42LzZKSU9qc2d6QmE5TUZVZTlRZjZXZkdBUTFYL3ZQRjZE?=
 =?utf-8?B?dTcxWi9rL0JFUmMxZTBsSUNyeVdSZkZpSkY2Wk5iN1V1NGMvWjBtdXBrSEJE?=
 =?utf-8?B?cHNjUUN6aFdrdUc3YlhKNW9uUHhuWG9BTjNRRlVBWXZDenNJUUFWV25RSUoz?=
 =?utf-8?B?K1UrMHJHY2M0ZWpzc0dhR2RTNGJGMlNxWlh1L1lZRml6eGlNZXR2TUU1RWIv?=
 =?utf-8?B?R3B0dm82MGd3VzM1YXBEdTRIaTRXaHRtQlBxTndhTE1DbEJpS0sybmt5MlRy?=
 =?utf-8?B?dldLU00xOTd4U3RobWhKZ0IxZ3RtTXIzY3ZiTUVyajM1TDNDcGZpNlh1bEJJ?=
 =?utf-8?B?c1Q0ZDZKUWUrQVptbG1JeHRaR2RaVDVsWlgxMDBsTEphOWR5ZHZMbEJYbjE3?=
 =?utf-8?B?Ync9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57fe8b48-32f9-4eab-547f-08dd20145640
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9561.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 10:03:07.7852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbQq8DMEW/lsvCuVo4oDhEpm5wRsjU2C15SLnx8FYRPmBxzg+BiDupnpU83llbGyplJskMe891iYkRI+WX4rp5Os2OOPxTEviCMAlgn9py4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9590

Hi Michal,

On 19/12/2024 10:35, Michal Orzel wrote:
>
> On 18/12/2024 15:58, Andrei Cherechesu wrote:
>>
>> Hi Michal,
>>
>> Thank you for the review.
>>
>> On 18/12/2024 16:26, Michal Orzel wrote:
>>> On 18/12/2024 11:11, Andrei Cherechesu (OSS) wrote:
>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>
>>>> Introduce the SCMI-SMC layer to have some basic degree of
>>>> awareness about SCMI calls that are based on the ARM System
>>>> Control and Management Interface (SCMI) specification (DEN0056E).
>>>>
>>>> The SCMI specification includes various protocols for managing
>>>> system-level resources, such as: clocks, pins, reset, system power,
>>>> power domains, performance domains, etc. The clients are named
>>>> "SCMI agents" and the server is named "SCMI platform".
>>>>
>>>> Only support the shared-memory based transport with SMCs as
>>>> the doorbell mechanism for notifying the platform. Also, this
>>>> implementation only handles the "arm,scmi-smc" compatible,
>>>> requiring the following properties:
>>>>         - "arm,smc-id" (unique SMC ID)
>>>>         - "shmem" (one or more phandles pointing to shmem zones
>>>>         for each channel)
>>>>
>>>> The initialization is done as initcall, since we need
>>>> SMCs, and PSCI should already probe EL3 FW for SMCCC support.
>>>> If no "arm,scmi-smc" compatible node is found in the host
>>>> DT, the initialization fails silently, as it's not mandatory.
>>>> Otherwise, we get the 'arm,smc-id' DT property from the node,
>>>> to know the SCMI SMC ID we handle. The 'shmem' memory ranges
>>>> are not validated, as the SMC calls are only passed through
>>>> to EL3 FW if coming from the hardware domain.
>>>>
>>>> Create a new 'firmware' folder to keep the SCMI code separate
>>>> from the generic ARM code.
>>>>
>>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>> ---
>>>>  xen/arch/arm/Kconfig                         |   2 +
>>>>  xen/arch/arm/Makefile                        |   1 +
>>>>  xen/arch/arm/firmware/Kconfig                |  13 ++
>>>>  xen/arch/arm/firmware/Makefile               |   1 +
>>>>  xen/arch/arm/firmware/scmi-smc.c             | 166 +++++++++++++++++++
>>>>  xen/arch/arm/include/asm/firmware/scmi-smc.h |  46 +++++
>>>>  6 files changed, 229 insertions(+)
>>>>  create mode 100644 xen/arch/arm/firmware/Kconfig
>>>>  create mode 100644 xen/arch/arm/firmware/Makefile
>>>>  create mode 100644 xen/arch/arm/firmware/scmi-smc.c
>>>>  create mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
>>>>
>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>> index 604aba4996..23dc7162a7 100644
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -271,6 +271,8 @@ config PARTIAL_EMULATION
>>>>           not been emulated to their complete functionality. Enabling this might
>>>>           result in unwanted/non-spec compliant behavior.
>>>>
>>>> +source "arch/arm/firmware/Kconfig"
>>>> +
>>>>  endmenu
>>>>
>>>>  menu "ARM errata workaround via the alternative framework"
>>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>>>> index e4ad1ce851..8c696c2011 100644
>>>> --- a/xen/arch/arm/Makefile
>>>> +++ b/xen/arch/arm/Makefile
>>>> @@ -6,6 +6,7 @@ obj-$(CONFIG_HAS_PCI) += pci/
>>>>  ifneq ($(CONFIG_NO_PLAT),y)
>>>>  obj-y += platforms/
>>>>  endif
>>>> +obj-y += firmware/
>>>>  obj-$(CONFIG_TEE) += tee/
>>>>  obj-$(CONFIG_HAS_VPCI) += vpci.o
>>>>
>>>> diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
>>>> new file mode 100644
>>>> index 0000000000..817da745fd
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/firmware/Kconfig
>>>> @@ -0,0 +1,13 @@
>>>> +menu "Firmware Drivers"
>>>> +
>>>> +config SCMI_SMC
>>>> +       bool "Forward SCMI over SMC calls from hwdom to EL3 firmware"
>>>> +       default y
>>>> +       help
>>>> +         This option enables basic awareness for SCMI calls using SMC as
>>>> +         doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
>>>> +         compatible only). The value of "arm,smc-id" DT property from SCMI
>>>> +         firmware node is used to trap and forward corresponding SCMI SMCs
>>>> +         to firmware running at EL3, for calls coming from the hardware domain.
>>>> +
>>>> +endmenu
>>>> diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefile
>>>> new file mode 100644
>>>> index 0000000000..a5e4542666
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/firmware/Makefile
>>>> @@ -0,0 +1 @@
>>>> +obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
>>>> diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
>>>> new file mode 100644
>>>> index 0000000000..62657308d6
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/firmware/scmi-smc.c
>>>> @@ -0,0 +1,166 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>> +/*
>>>> + * xen/arch/arm/firmware/scmi-smc.c
>>>> + *
>>>> + * ARM System Control and Management Interface (SCMI) over SMC
>>>> + * Generic handling layer
>>>> + *
>>>> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>> + * Copyright 2024 NXP
>>>> + */
>>>> +
>>>> +#include <xen/acpi.h>
>>>> +#include <xen/device_tree.h>
>>>> +#include <xen/errno.h>
>>>> +#include <xen/init.h>
>>>> +#include <xen/sched.h>
>>>> +#include <xen/types.h>
>>>> +
>>>> +#include <asm/smccc.h>
>>>> +#include <asm/firmware/scmi-smc.h>
>>>> +
>>>> +#define SCMI_SMC_ID_PROP   "arm,smc-id"
>>>> +
>>>> +static bool __ro_after_init scmi_support;
>>> I don't understand the need for this variable. IMO it's useless, given that in next patch you do:
>>>
>>> ...
>>> if ( scmi_is_enabled() )
>>>     return scmi_handle_smc(regs);
>>>
>>> return false;
>>>
>>> which could simply be changed to:
>>> ...
>>> return scmi_handle_smc(regs);
>>>
>>> and the variable, functions for it, etc. could be removed which would simplify the code.
>>>
>>> [...]
>> Well, I agree that the code would maybe be simpler, but
>> that means we would call `scmi_handle_smc()` both when
>> SCMI-SMC layer is initialized and when it is not.
>>
>> That then means that if `scmi_handle_smc()` returns false,
>> we won't know in the caller if the SCMI-SMC layer is not
>> initialized at all or if it is initialized, but the SMC
>> request is invalid (it does not have the SMC ID we expect).
>> Do we need to, though?
> Let me explain more:
> scmi_handle_smc() is called from within handle_sip() that can result true/false.
> If SCMI is disabled, we need to return false. If SCMI is enabled but request is
> invalid we need to return false as well. If SCMI is enabled but not initialized
> we also need to return false. 

Right, that's what I expressed my concern about too: that we're grouping up all
of these cases under a single return code of the same function. I'm fine with
that, though.

> I suggest to drop scmi_is_enabled() as exported
> function and only use scmi_handle_smc() as global like I did in my example.
> Now, this solves the part where SCMI is disabled since you have a stub returning
> false and also the part where SCMI request is invalid. However, this does not
> solve the part where SCMI is enabled but layer not initialized. To fix it, you
> simply need to check inside scmi_handle_smc() if it's initialized. That's much
> simpler than requiring to use another global function which is not nice.

Got it, my understanding was that you suggested to completely drop the `scmi_support`
variable and its associated function (`scmi_is_enabled()`), and decide internally
whether the SCMI layer is initialized based on another mechanism. That's why I suggested
`scmi_smc_id != 0` as mechanism and said that it simplifies the code, but
requires maybe some non-trivial assumptions (if `scmi_smc_id == 0` => SCMI not
initialized yet).
...

>
> Diff below:
> diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
> index 62657308d61d..b3f34bdbb89b 100644
> --- a/xen/arch/arm/firmware/scmi-smc.c
> +++ b/xen/arch/arm/firmware/scmi-smc.c
> @@ -24,12 +24,6 @@
>  static bool __ro_after_init scmi_support;
>  static uint32_t __ro_after_init scmi_smc_id;
>
> -/* Check if SCMI layer correctly initialized and can be used. */
> -bool scmi_is_enabled(void)
> -{
> -    return scmi_support;
> -}
> -
>  /*
>   * Check if provided SMC Function Identifier matches the one known by the SCMI
>   * layer, as read from DT prop 'arm,smc-id' during initialiation.
> @@ -52,6 +46,9 @@ bool scmi_handle_smc(struct cpu_user_regs *regs)
>      uint32_t fid = (uint32_t)get_user_reg(regs, 0);
>      struct arm_smccc_res res;
>
> +    if ( !scmi_support )
> +        return false;
> +
>      if ( !scmi_is_valid_smc_id(fid) )
>          return false;
>
> diff --git a/xen/arch/arm/include/asm/firmware/scmi-smc.h b/xen/arch/arm/include/asm/firmware/scmi-smc.h
> index 57cc9eef8676..58730a8037c5 100644
> --- a/xen/arch/arm/include/asm/firmware/scmi-smc.h
> +++ b/xen/arch/arm/include/asm/firmware/scmi-smc.h
> @@ -17,16 +17,10 @@
>
>  #ifdef CONFIG_SCMI_SMC
>
> -bool scmi_is_enabled(void);
>  bool scmi_handle_smc(struct cpu_user_regs *regs);
>
>  #else
>
> -static inline bool scmi_is_enabled(void)
> -{
> -    return false;
> -}
> -
>  static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
>  {
>      return false;
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index c4d225c45cd3..62d8117a120c 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -232,10 +232,7 @@ static bool handle_sip(struct cpu_user_regs *regs)
>      if ( platform_smc(regs) )
>          return true;
>
> -    if ( scmi_is_enabled() )
> -        return scmi_handle_smc(regs);
> -
> -    return false;
> +    return scmi_handle_smc(regs);
>  }
>
>  /*

...
I understand now that your suggestions were not that restrictive :).

Thank you for the clarification!
v4 is on the way.
> ~Michal
>

Regards,
Andrei Cherechesu


