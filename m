Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F2YLKKp32nQXQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 17:07:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0838405AC1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 17:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282593.1565155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD1pA-00029y-9Z; Wed, 15 Apr 2026 15:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282593.1565155; Wed, 15 Apr 2026 15:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD1pA-00027t-6x; Wed, 15 Apr 2026 15:06:40 +0000
Received: by outflank-mailman (input) for mailman id 1282593;
 Wed, 15 Apr 2026 15:06:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peng.fan@oss.nxp.com>) id 1wD1p8-00027n-JQ
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:06:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD1p7-002iit-Uy
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 17:06:38 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peng.fan@oss.nxp.com>)
 id 69dfa97d-bab6-0a2a0a5309dd-0a2a4506a5cc-6
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 17:06:37 +0200
Received: from [52.101.69.16]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <peng.fan@oss.nxp.com>)
 id 69dfa977-0df0-0a2a45060019-34654510a9d7-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 17:06:31 +0200
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAXPR04MB9470.eurprd04.prod.outlook.com (2603:10a6:102:2b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:06:28 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 15:06:28 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1-NXP1-onmicrosoft-com header.d=NXP1.onmicrosoft.com header.i="@NXP1.onmicrosoft.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/YegBjGjvFF6v1M2n/hBabdRgNfRarK31AZDLhxa0FEHM3EBHGBc8NCRpOeeVWQY1KCvjvY9GbcIYW+k/Di8Q5+tPY0POJznBSL/lxTZgqWUbp+0VvTrqaME38iP/XM5IoE2wAGhhYFRSkj520jW8INpd+nU9Bvvk9JJ80/atMf4CjM1Vy/EVf0tHAKT0JMvArhVlgOYpQ0q0RhT3LkoAxNPyRQ7GzRUdRQuTkKvUl/B5jetVKCBihDURBsS6+kivh6OlBvyzzzOsedeIqWJ1hLl3FVxGrnA0o+BP/VndP4GuwQoj8GpccFw4etuVjSAvG+U+uqq7L648B34qic1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmcvVWSkK3QeMTcIF/V8g/ybVObIa+ABL+fgg4jkOUY=;
 b=N1mMycjWO3sl6YOOdwvc6DgsSMNADFO4aK0K4U+NCCBrWXSCJdmxt5Mx/ACGH4CGBKrDI+NDqoy+YUpE93q+nTeT/kP1mahslfaEmXhpWJgIDH94CSCDyfyGyVUMWXDNLFFT8Kqztv94lCc7gdSwSXWNz2UaytX92t3xt8Z2e9gYJ9Ks+bWxhyBDC40aCorEkCQaDYVVe1lWdpATSjMFl3h3eHwQ17LoPyw7PTe7Zxdjj8zhGJxa76tFEHhrNfUTO7t5alA60RHL/nE8jYu/+ZKO9NcqjsO9tX2DaN+TKhGAmPt6VXRoMvtEXcjb1dsF+pmJmhDR1NR3C9Es1mKnQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmcvVWSkK3QeMTcIF/V8g/ybVObIa+ABL+fgg4jkOUY=;
 b=XbdyP+DV3mu9iZx/XFaF7SIvBA2pehw3uUd5aa9SNL4V7ZZXrOyTkiqKpWV6g2kipioadIYeW40VrppYixT6P/mR96MQh9la276Omfx5MRgwobrYtCTP94Z0Fh4+/6P3pLFzZBezmSDI0OyQVr0nWxMkKyntILFHPl2B6/4SDTZXUIEHp3vpQfOeYY3TC2EV5jQSetZoX/Rwow0HZCmjowmhFrST48YSxLGw01oF/6sJCJrbMmZMkJ+4e/F+cjmVvV6mH9onRHO4WjM6/BrueoV7/YqzJrRMgKj+ar1t+DGHp0DG0HN2D4ZJ1WP+4xPfdnU8ug+Q3YsBlqU3EZP8IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Apr 2026 23:08:36 +0800
Subject: [PATCH RFC] xen/swiotlb: avoid arch_sync_dma_* on per-device DMA
 memory
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com>
X-B4-Tracking: v=1; b=H4sIAPOp32kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0NT3YrUPN3i8sz8kpwkXWOTRENLiySzZMMUMyWgjoKi1LTMCrBp0Up
 Bbs5KsbW1AJtHq/JiAAAA
X-Change-ID: 20260415-xen-swiotlb-34a198b6c1d6
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0226.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::11) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PAXPR04MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: 389c48ec-d835-4f4f-9c53-08de9b0091b2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|19092799006|1800799024|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	6ZjO6FFmkIuqO3Zki60YObNpRN0M9BMGRrNX5m5cSn38ed1JJuzkfs/R/9KqmB+BCyoAZ5RTfnccrJlu9oLEXXLKzm1fLYjSk1AlBkNwjOboxpfl3sYE6vplOLkWukNg0CW4Xq9WkLYwu+654IJG2cKmW1DjaHGpWFDmKYOVFBMCbXsQZNKNJMPsNb2dTLl2y4yULESD4sbm9EuljnZJBVO4ixkIRcaBc1lhPMrz+j+NMoIfEpOnkL71557ZBjrC4Qx3eWRpaKlmyQI2/cevQ4SgJz0EhUi0Wj72JOxUqqBNdpqiY4JpeBoC9D/aTsLEvvh+Va0/VJR/M2PCijzC9+wV5TQwBYDaGuHROuQ79L9WJQvFU9U5vh5aMtF6Ybg8hW6fBoBMdZ5WySj/aWxRXu3XHKSwcCB3sQTt9ulcYoNCkj6I9MOT3UKzrVJaFVZY9c4DxpMoUjsThjouirz6wy9BuQbPKfUSKroU79RwQ2M6ge5j01IH7/BAbIXTE/SROxzH5+XvUtLLIdSInJLj/MBpWjkbhYR4w6KL7grESFbTE9u1Ft9HJca7SZ4a3HYZfR5USmfUo21iDtF7SxQSgkA+OuiKvp0Xetxc11STzqe5R9m0oYzqxqGJq5MiBgf1jxPgPn13d4JhRBWxBU+xgfu6iYySkSHTC0/8F1xjOXkYQpe+v9Re3Df////KF5Hxjmbzpd/y6jIhjfqOsR9Y5evIPBPuwTGY+0wyxDGsYGWzLDAsGOISWOOrJAhcdZOfvAqYgPXYplqrkdEad1mgcum7CNQNwTTA7wGmxC5tz9k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(19092799006)(1800799024)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?My9MZjNLZHB0Umhmakc4MExSYTRkUDFKeW8wSE5YR0JtSFk1Lzd0Vm5LN3Iz?=
 =?utf-8?B?NkRYYVMrMkVjTlF1QWxkdFBXVHBlOGFXTFNvRzF2ZHoyV0l4M2V3TzU4d0Zq?=
 =?utf-8?B?K2RQSWlqcG5UNzhsdFhEZEoxZGJMaFNaNlZEUmpIOTd2c1h6UTNWa1MrNDhU?=
 =?utf-8?B?aGdwY0RsUG9Pem8vUElHdTVhMHpTczhqN20vM0sxYXBHKzJiNWJoaHRObDhY?=
 =?utf-8?B?RGYrMnhKa1ZGblhDdHZQTVIwQ2pTQjQ4WFBjRnBNdkJzSjN0QnJwWkZ2YnUw?=
 =?utf-8?B?NnRJN0l0eWVabGVoK0QxSTY3bktibnNjVDRsRmZHNTJWb3g4R050ODJ5aHJZ?=
 =?utf-8?B?eENFSzZvME1SczJUMHZJSUtjakpva1ZrOFNxQndIS21oOXphWWpSeW9Gb1ZO?=
 =?utf-8?B?R0ZNY2NVSzNHUWQwVWJZWUlLMFNwYU5HL2poNU9paW9XQlRyRzZNSVF6RDk2?=
 =?utf-8?B?UFNRZWRBQWJjVjNEcm81a0ppU2JKR2NyRDRJZUc0OFhlV1ErWTdvK3hqU2M5?=
 =?utf-8?B?THg5bmI2ZTl1cHNseitWYXBLeWpscDNycnE5QTFhTEN4bGJQVXR4a0FSZ1FX?=
 =?utf-8?B?bE81VlVmRHM5dzY1bnhLRDNOMjlsRnAxeWN6eTFCY0VSdGpxQWp0VlNKMndt?=
 =?utf-8?B?aGJFRC85cnAwNXd6UWxydm1rVENPajZ2L3hMZStkaHlGUzRxTXlPdDlTeFNB?=
 =?utf-8?B?ZGxvR3RzZTY4QnhIaW53U3hVRG9LTCtvR0VzaUt5M0syYy9RbVk5b2pxb0ZF?=
 =?utf-8?B?M0w4N2ZoWWYxMXd2NWNFYk1tNjVPU01Pa3oyeUxmMGpZL3c4UE56c0pONXJu?=
 =?utf-8?B?L0JQRVpoQm50cWR5bUFtOXlEdVhWWTBRWGtlT2xHaEVzZ3VzZ3RSdWxlekQr?=
 =?utf-8?B?L2ZWaDQ3eUE5eU5tYldrRVJubE9aUHJHQlp1bGxXZHRQcmRXaFh2ZWZvT1RR?=
 =?utf-8?B?SDB1UzhrSTdxWG1McTQxVitCRUk5N3JTRGRrc2loNjRLbUFZN0dwWFFIOENa?=
 =?utf-8?B?VGtzcEJ4OVFrd3pLTitremhNYkI3enhTRWZEMERsVzN4VkJMdjJ3aTFnanhj?=
 =?utf-8?B?MTVhQUJ3VHFzQis5eVRZY09YaDNReUdQUmpHMjI4WGkwZktYWWtwbktZbHh4?=
 =?utf-8?B?bXpwVzFzamtFajdKWE9rQitqNlhRRlJVdnVtOFBuWlJiRm9XSHZkei9zMWM4?=
 =?utf-8?B?UUFUU2RFV2VZUFJsQU84eGlNNzNIRFJjRVo2QVhBbGJucExXc3FRekRnV05V?=
 =?utf-8?B?cWZoVlJNdzB6aklKSER0bzdLWjMzZUVrcWdkbGJMNmRPR251ZUNxWjhMQnJV?=
 =?utf-8?B?QXdSYytlbEh6OW81bmlISDhLeFoybjR4TmtPRnRIeGlzcGMvblBiK0srUWFD?=
 =?utf-8?B?Qm5IYWtaSjRXd0VwYUNYWllHSVVwSnZmczlrZm8vOHo2ZjZlMFVQZVg1eSs0?=
 =?utf-8?B?bVRKT3JYbHF0SmhZUEZyYjBsNVhPeHVCYkZ2d2dLbkhNdWVXc0hUREZ2VVdE?=
 =?utf-8?B?eEJQWHNOUDJHdVVETkZQd0hiTFJuaDQ0VElhbGhnanN5a3RKc2hWdjJ6cVpw?=
 =?utf-8?B?OWwvYTBZbW1maFMyYWUzSjdBOHkrbGl1cGlXMmJhczI4MTVoVEkvUkdVRHlJ?=
 =?utf-8?B?RDQ3SGk5aFhwZTVQaVFvMytoNlRMQ29CNmRKQi8xWldIdUczN0pkVTV6aVY3?=
 =?utf-8?B?Z1NhV0FDOWh5R3pCcUtwVFB6VGJ1b2wwZnVxbXlaQ0huV3B4OTRxclJDZFVV?=
 =?utf-8?B?eENQZDE2L3dUTU9yaHEzRFMrUU5wMS9PTnYyU2tFd01tUllRc01Zd0Nqb2Uv?=
 =?utf-8?B?SHZ2OFZ4elhPaUxsRVB6dGsycURwMVhRTFlqck1RbXRhTVJSM1F4alI0QlVB?=
 =?utf-8?B?ZUYwcStlVHB0djVZcGRYR05oOVR0bWdndDNMYWxnK2xzNXhVUEV4MGNNWWNX?=
 =?utf-8?B?QzdlMmcySjRWaFkybmtoTXI2YTd6azJJblB0U0RmeFMzMW50RHpkNHZSSnMv?=
 =?utf-8?B?T3BubkpFWnNNSjh6OUlXZGVLbjdzYkpjMWtIT3BpZUd0MVN0cG95dGxOZTU0?=
 =?utf-8?B?T2RyNXh3UTgxY0RycDVFY0dVNnF5K0d0SVRLaHVISDZFbHJXM0o4d242VlR2?=
 =?utf-8?B?MVE3UkFvN0NENDRQcHJBMVBkaEpzdkhhaVZoYWlkbHZhTWVkTU5PWUZyYWNZ?=
 =?utf-8?B?dHRhTG9rZm9keEtHOWJaZlVRVVpSMHVGSGVXc0hjNGNMUzdrYlJjLzVnbG1I?=
 =?utf-8?B?NHFDckdzRlBhcTZKSXY3VWdodFY3NG1pZE1iNGJJT3J5TGpZcmpJeXBBKytY?=
 =?utf-8?B?YWhFeTFYYmhhU3hTSGxhc1B1RXF1U2t6dDNBSTZkN2VqL28wRmpLUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 389c48ec-d835-4f4f-9c53-08de9b0091b2
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 15:06:28.2062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xNfQ/kYJg/5HWIFG6LcqcUDkOI5eHnBOxSU9LqS9k/P7BJgjW1QhrrWmKNX7t1VnImQdaJQZrE87fD7+o900w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9470
X-purgate-ID: tlsNG-16d1c6/1776265591-644493D8-4CF1AFE5/0/0
X-purgate-type: clean
X-purgate-size: 3649
X-Spamd-Result: default: False [-1.59 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:peng.fan@nxp.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F0838405AC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Peng Fan <peng.fan@nxp.com>

On ARM64, arch_sync_dma_for_{cpu,device}() assumes that the
physical address passed in refers to normal RAM that is part of the
kernel linear(direct) mapping, as it unconditionally derives a CPU
virtual address via phys_to_virt().

With Xen swiotlb, devices may use per-device coherent DMA memory,
such as reserved-memory regions described by 'shared-dma-pool',
which are assigned to dev->dma_mem. These regions may be marked
no-map in DT and therefore are not part of the kernel linear map.
In such cases, pfn_valid() still returns true, but phys_to_virt()
is not valid and cache maintenance via arch_sync_dma_* will fault.

Prevent this by excluding devices with a private DMA memory pool
(dev->dma_mem) from the arch_sync_dma_* fast path, and always
fall back to xen_dma_sync_* for those devices to avoid invalid
phys_to_virt() conversions for no-map DMA memory while preserving the
existing fast path for normal, linear-mapped RAM.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/xen/swiotlb-xen.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2cbf2b588f5b20cfbf9e83a8339dc22092c9559a..b1445df99d9a8f1d18a83b8c413bada6e5579209 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -195,6 +195,11 @@ xen_swiotlb_free_coherent(struct device *dev, size_t size, void *vaddr,
 }
 #endif /* CONFIG_X86 */
 
+static inline bool dev_has_private_dma_pool(struct device *dev)
+{
+	return dev && dev->dma_mem;
+}
+
 /*
  * Map a single buffer of the indicated size for DMA in streaming mode.  The
  * physical address to use is returned.
@@ -262,7 +267,8 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
 
 done:
 	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr)))) {
+		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr))) &&
+		    !dev_has_private_dma_pool(dev)) {
 			arch_sync_dma_for_device(phys, size, dir);
 			arch_sync_dma_flush();
 		} else {
@@ -289,7 +295,8 @@ static void xen_swiotlb_unmap_phys(struct device *hwdev, dma_addr_t dev_addr,
 	BUG_ON(dir == DMA_NONE);
 
 	if (!dev_is_dma_coherent(hwdev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(hwdev, dev_addr)))) {
+		if (pfn_valid(PFN_DOWN(dma_to_phys(hwdev, dev_addr))) &&
+		    !dev_has_private_dma_pool(hwdev)) {
 			arch_sync_dma_for_cpu(paddr, size, dir);
 			arch_sync_dma_flush();
 		} else {
@@ -312,7 +319,8 @@ xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
 	struct io_tlb_pool *pool;
 
 	if (!dev_is_dma_coherent(dev)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr)))) {
+		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr))) &&
+		    !dev_has_private_dma_pool(dev)) {
 			arch_sync_dma_for_cpu(paddr, size, dir);
 			arch_sync_dma_flush();
 		} else {
@@ -337,7 +345,8 @@ xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
 		__swiotlb_sync_single_for_device(dev, paddr, size, dir, pool);
 
 	if (!dev_is_dma_coherent(dev)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr)))) {
+		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr))) &&
+		    !dev_has_private_dma_pool(dev)) {
 			arch_sync_dma_for_device(paddr, size, dir);
 			arch_sync_dma_flush();
 		} else {

---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260415-xen-swiotlb-34a198b6c1d6

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


