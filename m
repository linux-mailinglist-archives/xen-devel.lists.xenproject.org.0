Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1682C9F60C3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 10:05:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860033.1272102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNpzA-0003X5-JS; Wed, 18 Dec 2024 09:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860033.1272102; Wed, 18 Dec 2024 09:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNpzA-0003VP-Gj; Wed, 18 Dec 2024 09:04:52 +0000
Received: by outflank-mailman (input) for mailman id 860033;
 Wed, 18 Dec 2024 09:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TrB=TL=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1tNpz8-0003VJ-RG
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 09:04:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20607.outbound.protection.outlook.com
 [2a01:111:f403:2612::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 221edbd7-bd1f-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 10:04:48 +0100 (CET)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DB3PR0302MB8989.eurprd03.prod.outlook.com (2603:10a6:10:433::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 09:04:45 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.8251.008; Wed, 18 Dec 2024
 09:04:45 +0000
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
X-Inumbo-ID: 221edbd7-bd1f-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxqLOaWRt4Z3dLzjIX16zByUcSBt7/4f2jQX4pd0lx4J4JnJCWL3ufgFAxMyTY67r/mAddXab0tcDo7TXz0uq1Pr280WzUepOMB3d9taBU3pWQuvkbRLlNvD5T5THlDxD3RigLR0iinNNeD4u9ACr5uVYiH4ztjz6SpCEL2xrgQRO0c4F+FGOT1G2FW+gWnXscBIV3YP7A7NrAEHuVlT1Z+hQGr5H6ksJDaOqccGYIzyM7mLvLdTpcznz6PdvMnY0XBrsBC95CByRVNuNtbSmF/p+JLxZ4bHFJXvBZbY39cwSojHDY3j7xRio5wASo4IO0HiTBdhriZpFKxLa740+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joj87V4dVBXCPzIgqm8KkspSGXIaqaxBIO9gnzwpP2A=;
 b=p421KYIr44nUGqOpOZPyOCuvk1LKvSBHnhhGVb010c26PC9mP5PhyeYShERQ5AwR3ooIBeUyAk13YOL30TP+5rgnw39105DGeRm+Bw14OwqP3M8pCSu3qHzo/ZvPnpyhDmETG9i89vzvGn8rhsxjlWbyUS08otPeOqHCHOjAjwum7wa/jU5Ed3FpxMCRRARJLXY4Lmg58LG4tTWYVWtmy0lqCZZqELuuDXWP0s6lSZf8hgFtNajSj4gWJvZnHgRX89VqlzZnNywefNvEIfMoOVLxZY+duMtD8PSEhnsi+wrV/swzm7M8VlTGF4hGibcCCp08vDjUlTPQbnUGtLZomQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joj87V4dVBXCPzIgqm8KkspSGXIaqaxBIO9gnzwpP2A=;
 b=tn5OUB/Dwuqr4pOJRo5mSlHH4vvdPSBJrbd7KFbG+rS8VLanNfhr1hrU/jRLZ9UbJz2NRpEB3s3KDBn1WxL/jPnVikX+NtxQBTfwpiPkk/IqUrYew7W5Y3J0q4DAg35vxBgBHy3ExJ1DFpYOgw39ef/xrn9wuiQWGmiB7yoxmw0ZlzBqNUil09RhalrknwPIokF/bCLJgBZvq3cI1nJF9NeF8zRe6lXfU6egOhSGaHeb23/kSrV2IC/DKSwHcdceLTAr6G7lnTt/D1b3Eg5XI07WMgS3ITb+F2KDrBXGErYerjQoGE32wzvHqdkqN/fg2p93Gv56xOXKp4XHnUaf+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <bec09981-93bb-4bb8-a22c-cb9156093555@epam.com>
Date: Wed, 18 Dec 2024 11:04:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] arm: introduce kconfig options to disable
 hypercalls
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241216114358.2845447-1-Sergiy_Kibrik@epam.com>
 <4ef8626a-0ff9-4c02-a1bf-72e39b950e8a@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <4ef8626a-0ff9-4c02-a1bf-72e39b950e8a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DB3PR0302MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 520bc497-f026-4cfb-9943-08dd1f430472
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXpraHo0QWdQRDF2WitELzBSM0ViZ3NDekF0dmxGemZEbG1GTFpIbE5UeWFz?=
 =?utf-8?B?dVp0T25kYnNMZUw2bUVmQmgyRSsvd1V0WHZuU0FBZXZSTkhkVkFUTktVN1pY?=
 =?utf-8?B?dWF5SnpTNUdUbVhNN3FPMHZxTU5WeGw5ejM2SnplUlltN2p4bTRObWxKT1Z1?=
 =?utf-8?B?aS9IemdET0h3K2dWczJzRzRsN3prdzJxWGU2ZXdld0J2d3JJRkQyZ0pxb2dw?=
 =?utf-8?B?S25HUU5WZG42TjJ4K0FoaFZKUDU3NTlEN21xN3Y4dUhDMEg4Qi95R29kRmZL?=
 =?utf-8?B?RXB0aVJCdlljWGJiREprOTJIUmkxOE5GMVVLVkx0emdWMGhFR2FQUlcrRjU5?=
 =?utf-8?B?UXVIQlgzMkIrV1F5Tm4rSGdKMi96ZTgySms4cFU2eGpoQjdWQlA3NUFPU214?=
 =?utf-8?B?eVFDRmQ5b1o3cGF2eFBocnd1dldGWXdVNitITDkxRjBPV3owMkNORTZUbFNS?=
 =?utf-8?B?eVhtMkg2cWtxR1hPVkhDaTZrd2d5b0ptS3puOFpCSHVmN05lWXViWnkyN2VP?=
 =?utf-8?B?KzJmUzRDT0dDb3ZmR2hmNjR3dkJGRGNpMit0cHU0Q2FwZ2IzZk03cG1JQlFv?=
 =?utf-8?B?T3R6ZVIyTjBzeHNVaThpRWNMaGtmc0NpKyt0NXJxdDczd0hRcGFxdFdJMi9j?=
 =?utf-8?B?WERxOGxvNjc3SCtodkRJZktyMTN3eHZ6RkNqR01uaVJlWnMwOE1wRzlSb094?=
 =?utf-8?B?NmJ6TE45OEx5dzZEOUxlbXEvRy9Gd2FYZng1QWlkVXYxb1Zyc3dWRDlXK2xw?=
 =?utf-8?B?Rm16ei90cjJKZitMMjBMTGlsUHlqbDgza0RxWEJ2Mk9JUmFSdEtZeklIYjBq?=
 =?utf-8?B?QUU3c1N4cHdmTDgyRElkSmhIOEorWFRLT3ZaQnJGZms2UHVEMkZsZmp1RUFr?=
 =?utf-8?B?OTNSYmczY2FkU3JOdWZIRDNLLzdZeFBGQU85SzBTT05QWk55UTZmV01sTG4z?=
 =?utf-8?B?N0NNVVJPNGM3cXFhaEI3TFpXWGF2UGtXZWIyUmpLUVE5YzlRMkpDYlp5d1Fq?=
 =?utf-8?B?MFZmbG8wVklGSi9EZlZlV1hwOHAzYXFmQUVveExKTEFJbTJ0R28xNTlPbVlF?=
 =?utf-8?B?VWZxaks1V1RSNVIweDExcU9BaUxtZVlvRFVuZlBUQmFtRDA2aTVDWTlrNHFv?=
 =?utf-8?B?RnB2WXVNaGxCSCs2WnpkczFPM1BxRFRBZnE5OWdHaXZ0RVZCQ0orWXE1QWQ1?=
 =?utf-8?B?d2xpK3JFV2ZINmRHNmw3NzhkYVF0alFJYzY3RFFGbXorNUcvd24raklETFAy?=
 =?utf-8?B?SU8vZzhKOWFNdkVFcHpkNGprSmxIaG5JNktRcGduWkVScEJnVms5eEtCV3RK?=
 =?utf-8?B?Ky9NMVUzMDlib0pWRDFmaVVCK2lxOTAva2FScllLWnE0bUk4N0hxeWZFTkZV?=
 =?utf-8?B?UGlFV2F6eVZJRXJoMGlOYmJCSGJEMFJ3SEpDRDl4WU9WWEs5RXBweXYrUkp2?=
 =?utf-8?B?ZitsTEdMVHpnTWhEb1B1ZzBpQXdocTNCVVlZNnQyK3hKcnEzakxUblo2eFZ0?=
 =?utf-8?B?WmxleGtaaFRpdndRcmFlbFNRd0pmaHp2UHczNnlDaTM4Z0g2ODlneCttVkp0?=
 =?utf-8?B?RWVsMG1kVXJpa2xoVU14bVczblVydGM1MHg3WTdyQUh5YzdUZklPUnJjajVI?=
 =?utf-8?B?UGM5ZnM3WWtJZkxFclFJQ2FLbnN1Vnl2Wm12ck9kMHJkZXpHaDhRZjdTQzBZ?=
 =?utf-8?B?WklyNkNLR2lRbmk3T1NkK1htZ0FTWmNObnBnWDhhMTd4YnRoTFN3bi9pa2hG?=
 =?utf-8?B?aU9VSEVLZVNXQTdlZngwbEFzTHZ6WGZJS2czOEYvM2gyTnRweHBhcVhyZ2s0?=
 =?utf-8?B?VEF2Mjk2M3ltTXlMWVB1MHJhL0FFY3FibjU4TVZCWDNTT3VNTERKQ0RCL09i?=
 =?utf-8?Q?NleE+tvA3QCKq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHhUc1QrZDFKUnJQeGhwZGNwK2N3b0tyR2RFdjB2dTRIRHN3VlV4cjFsdVZL?=
 =?utf-8?B?TWJKK00yN3VDMEc1TStqTWFxMDVUM0lWS1J4STZRTmxuMjVlTTVJK0YvS0pZ?=
 =?utf-8?B?TFZTTm1PWFRxcDI1c3hhNFdDcHl0Z1Z1OE1xVWgzaXhpK3FhUW50VlhFaDQ5?=
 =?utf-8?B?WlNybEZ3Q1NJeDh4eGdVdklWc1hRazdIYUgwVWtDQ0wyazlhTDFwKzBoSGtI?=
 =?utf-8?B?aHduQVJSb0hQNHBJTFhzb3NXQ3JIazdleGVtYkZ5bVg0SjZOWEdha1dWUSt0?=
 =?utf-8?B?aVNJT3FGSTVDdm04eEw1TmRhRXNsQ3Y4S2Vyd2NzMTdmUTFrRlYvdE13UVBL?=
 =?utf-8?B?MVFCOVJ1UE54ZVRkNVh6WmlpZ255VGZ2V2JjeEw0d0pEYnlzQlMwbjBLOVU5?=
 =?utf-8?B?dk5zdURsSmFuYzZ0TDNNbVRhdDlqbDZDQmFuRUt1TEs0clVmVFZvbCtTSzFO?=
 =?utf-8?B?SXljcUVPd2FDaitPazZLNm9pU2RVc1N1VElMRVNGdVVHcVlOb3ZCUERFSkpH?=
 =?utf-8?B?cWFtQkxMQWd1QW9EM1RleG5RakVjUEljejErVjRjMWdvY2x6bEtwZkhKUjJs?=
 =?utf-8?B?bnV3cktGUWUxTVNHb2hUV21NSFEvdS9WaVViWGliZmZaaFozZUF5RW9wV0Rk?=
 =?utf-8?B?MGxpYzE5UElzNHBsRGEzcHllSmR0VzI0TGY4UmdFNlNQQ3ZaYUFqS2pYQjVw?=
 =?utf-8?B?d0RPNmcwcm1jWE5pTzY3MGpUMFZZZDJReHZwYk9lb1d1L1A5bEhQNm9xU0NV?=
 =?utf-8?B?U1J6Y3lHb0RJemV4YVNXQm5pZm82TTJPK3RjRXRISmFuY0l0bXlsN0pObFpC?=
 =?utf-8?B?TXA3N0xITm9qbFFIY1RCQjZkbXByRHltT2Y2T0c3ZnJQbklCOUZMVFdHMnFh?=
 =?utf-8?B?UFRHc3VPRnJMSmF2LythTHE5UUplaHFOU0dxTnVGdFllOVZRUTR3NlN6WGJ5?=
 =?utf-8?B?U1dRTEo1c0hFVDNTbW1RTjgwbXZ1TG05QUJHVHpKME9salh1VGovdm5EUkRu?=
 =?utf-8?B?d2ExdkFkVjZjMEtRR1BxdnhjMU4zUWdQNzhid2VvS0VtaXFobnlzdHN4U1hl?=
 =?utf-8?B?YWdsR2tsNUYzWjJiTGtsNE1WSjhrK3hxY2pRNzRJR1J5SHpoTWhMaGc5OVlD?=
 =?utf-8?B?c0x6QVdHNnNERW9FY1AvNnlMS0tVeFVKWlkzSVhBdkhoS3lGSmQ5eEF1ZDIw?=
 =?utf-8?B?MGEwYTJDbU5mOVY2K29VNVg1cFNSTnhadzdjd04wYUNXS3pHNk44UmVxR1V0?=
 =?utf-8?B?NzNwTGU3NWRyNHNwWWczcldLcjlWRW9NWmY2dlZVUjRxR2UwcSsvK3NsYXhY?=
 =?utf-8?B?V0VINU1rVUhMUUZSVzlaU2tvaWNCTjc4UXVRcWpETzlZN3FCSVlhWUxseEtC?=
 =?utf-8?B?T2lxYTJrS2RIU0loSWN4QzF2UEp6QWVWV0hGZEtMbXVDejVMeUNJWlBtWjhV?=
 =?utf-8?B?bnpWNUF1TjlNcm9HWVZQVGc0K3Fvem9oN0VWRDBIOVpYT2d5SXd1TG9wV3Yx?=
 =?utf-8?B?VjI0WldHeW5rT24zVFFwbk1ITzc1c2ROQllncEF6Y1pWVlE1d0s0eElXVHE5?=
 =?utf-8?B?dUcyYjM2cmtENGV2S2t3VDZYd3FMd0drRjc4cEJEMGZMREg0ejNpbEUvZVhI?=
 =?utf-8?B?VVRPWVdBeWJOWEVRYjl0Vm5xWXRSVEh2NXp3SG8zN3ZHSUEzM251RFNCQjJk?=
 =?utf-8?B?VS8zakxMaSswZVJFRzE0cmxjdDlubGpDQm1nbGFiYm5xdlYrNURRWThxZlRL?=
 =?utf-8?B?V2U2aFgwZTI2c1hYc3V5RHNHaEpBeCtJaTJJQm1qeWpuUkp4dmJ4TVVpVjBW?=
 =?utf-8?B?NDhrNHdHeEExWkR4dXlDYjhKMFFJcTBEMWYrL1AxRkZybEZick12UTV6WTZx?=
 =?utf-8?B?MU11ejh6b2xESXVNeDJvdXMxdk52UmtqQVR5MVp5VklCM3pYOVRMK0kvTEFS?=
 =?utf-8?B?SUUxUWErN2ZlOFpVVkczTzdQVi9OS0lEUlBtQXBZZzdWRjhycmtYdkFFekl1?=
 =?utf-8?B?cFJoS241ekxRWlFlc1R3bGt4NTJIck5KdmgxWGNQY01lSHJzNmdlM1dlNE9r?=
 =?utf-8?B?ZGJEWG9uNVJ6Y213dUl3WFNGeFg1NExoSENXN0Y5NzU0WVdZZldaZE53ekRW?=
 =?utf-8?B?Wkx6Zk5RQWQ2eE5BV0N0MG1YbmN4RmpOTlNxaU5tWXY3RzlIMmhuZnBGZ2Nr?=
 =?utf-8?B?aVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520bc497-f026-4cfb-9943-08dd1f430472
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 09:04:45.6264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUay183UgEkbKefvOjo2Q3MguKN6/E2qRwBQmICL0j2ZSiUlCBhY5oRuz+3dW0bWzwh61g0P8I8E5bA8htrthw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB8989

17.12.24 15:00, Jan Beulich:
> On 16.12.2024 12:43, Sergiy Kibrik wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -516,4 +516,31 @@ config TRACEBUFFER
>>   	  to be collected at run time for debugging or performance analysis.
>>   	  Memory and execution overhead when not active is minimal.
>>   
>> +menu "Supported hypercall interfaces"
>> +	visible if DOM0LESS_BOOT && EXPERT
>> +
>> +config SYSCTL
>> +	bool "Enable sysctl hypercall"
>> +	default y
>> +
>> +config DOMCTL
>> +	bool "Enable domctl hypercalls"
>> +	default y
>> +
>> +config HVM_OP
>> +	bool "Enable HVM hypercalls"
>> +	depends on HVM
>> +	default y
>> +
>> +config PLATFORM_HYP
>> +	bool "Enable platform hypercalls"
>> +	depends on !PV_SHIM_EXCLUSIVE
> 
> Any reason you don't do the shim related conversion also for domctl and
> sysctl?
> 

you're right, I'll do it in v2

> Much like you have HVM_OP, may I suggest PLATFORM_OP here and ...
> 
>> +	default y
>> +
>> +config PHYSDEVOP
>> +	bool "Enable physdev hypercall"
>> +	default y
> 
> ... PHYSDEV_OP here?
> 

yes, sure

>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -1053,7 +1053,9 @@ int domain_kill(struct domain *d)
>>           d->is_dying = DOMDYING_dying;
>>           rspin_barrier(&d->domain_lock);
>>           argo_destroy(d);
>> +#ifdef CONFIG_DOMCTL
>>           vnuma_destroy(d->vnuma);
>> +#endif
> 
> There is a stub already for this, just that right now it's shim-specific.
> >> --- a/xen/include/hypercall-defs.c
>> +++ b/xen/include/hypercall-defs.c
>> @@ -234,7 +234,7 @@ stack_switch                       do:2     do:2     -        -        -
>>   set_callbacks                      compat   do       -        -        -
>>   fpu_taskswitch                     do       do       -        -        -
>>   sched_op_compat                    do       do       -        -        dep
>> -#ifndef CONFIG_PV_SHIM_EXCLUSIVE
>> +#if defined(CONFIG_PLATFORM_HYP)
> 
> Nit: Why not #ifdef, like it was, and like you have it ...
> 
>> @@ -247,7 +247,9 @@ set_timer_op                       compat   do       compat   do       -
>>   event_channel_op_compat            do       do       -        -        dep
>>   xen_version                        do       do       do       do       do
>>   console_io                         do       do       do       do       do
>> +#ifdef CONFIG_PHYSDEV
>>   physdev_op_compat                  compat   do       -        -        dep
>> +#endif
>>   #if defined(CONFIG_GRANT_TABLE)
>>   grant_table_op                     compat   do       hvm      hvm      do
>>   #elif defined(CONFIG_PV_SHIM)
>> @@ -269,14 +271,20 @@ callback_op                        compat   do       -        -        -
>>   xenoprof_op                        compat   do       -        -        -
>>   #endif
>>   event_channel_op                   do       do       do:1     do:1     do:1
>> +#ifdef CONFIG_PHYSDEVOP
>>   physdev_op                         compat   do       hvm      hvm      do_arm
>> -#ifdef CONFIG_HVM
>> +#endif
>> +#ifdef CONFIG_HVM_OP
>>   hvm_op                             do       do       do       do       do
>>   #endif
>>   #ifndef CONFIG_PV_SHIM_EXCLUSIVE
>> +#ifdef CONFIG_SYSCTL
>>   sysctl                             do       do       do       do       do
>> +#endif
>> +#ifdef CONFIG_DOMCTL
>>   domctl                             do       do       do       do       do
>>   #endif
>> +#endif
>>   #ifdef CONFIG_KEXEC
>>   kexec_op                           compat   do       -        -        -
>>   #endif
>> @@ -293,7 +301,9 @@ hypfs_op                           do       do       do       do       do
>>   #endif
>>   mca                                do       do       -        -        -
>>   #ifndef CONFIG_PV_SHIM_EXCLUSIVE
>> +#ifdef CONFIG_DOMCTL
>>   paging_domctl_cont                 do       do       do       do       -
>>   #endif
>> +#endif
> 
> ... everywhere else?
> 

yes, will fix that

>> --- a/xen/include/xen/hypercall.h
>> +++ b/xen/include/xen/hypercall.h
>> @@ -24,6 +24,18 @@
>>   /* Needs to be after asm/hypercall.h. */
>>   #include <xen/hypercall-defs.h>
>>   
>> +#if !defined(CONFIG_DOMCTL) && !defined(CONFIG_DOM0LESS_BOOT)
>> +#error "domctl and dom0less can't be disabled simultaneously"
>> +#endif
>> +
>> +#if !defined(CONFIG_PHYSDEVOP) && !defined(CONFIG_DOM0LESS_BOOT)
>> +#error "physdevop and dom0less can't be disabled simultaneously"
>> +#endif
>> +
>> +#if !defined(CONFIG_SYSCTL) && !defined(CONFIG_DOM0LESS_BOOT)
>> +#error "sysctl and dom0less can't be disabled simultaneously"
>> +#endif
> 
> I'm puzzled by this: It covers only 3 of the 5, and it really only
> re-checks what Kconfig already enforces.
> 

At some point I wasn't sure that kconfig will enforce this, because 
somehow I made kconfig produce configuration with both DOMCTL & 
DOM0LESS_BOOT being off. Anyway I can't reproduce it now, so will drop 
these checks in v2.

   -Sergiy

