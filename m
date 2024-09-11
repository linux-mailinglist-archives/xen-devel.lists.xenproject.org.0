Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7463D975B25
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 21:53:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796846.1206548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soTOp-0004eW-I9; Wed, 11 Sep 2024 19:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796846.1206548; Wed, 11 Sep 2024 19:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soTOp-0004bv-FJ; Wed, 11 Sep 2024 19:53:11 +0000
Received: by outflank-mailman (input) for mailman id 796846;
 Wed, 11 Sep 2024 19:53:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLDu=QJ=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1soTOo-0004bn-1P
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 19:53:10 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2606::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77c76768-7077-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 21:53:09 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by GVXPR04MB10023.eurprd04.prod.outlook.com (2603:10a6:150:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 19:53:06 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.7962.017; Wed, 11 Sep 2024
 19:53:06 +0000
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
X-Inumbo-ID: 77c76768-7077-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ltuj4oCAeXahqmLIBFnzJYb+G3epZvHPixHBUIWdkDCRmvMSU6w8NRUPGEnfJlTy8O2z1fYd/o7uOm8z0p+3yvPVNG/4VWujEuunQbA3CSKBQrXPC3+k3IqBzEMhPSa78brHuTe0hBUghMsFopU5BoWoTs4wpuWjlBcBMb0WcE1OQLy5ff1/IHFvMP9I2xV7whR0FWDGQxaeC0ib6IA6zEuXYjYmS+CBaHe87tUqYtQiqO1aVHK/428tkJL/8irIEn52exfAjLPR/IKvofi3c7kc7lw5aWHQSP2doyslSqdkIgn+MX/jvcQ1i12ubTLkZR+m1ij01CfnAFWdpsfiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kau3hk5JFPV4Z2/LtWGqRDGwKP8knZ+dWFS3/U21WRw=;
 b=bf6QHkZqJoHHZhEBbiOYa17BcJSsuRqcqSUpRjt8/oy9+XQgKxMPn5ZlrqaMVzoemoOEcNswt2hxuwtCjap9tjqlMXB533kj3i9emIdbZv6KCBAdzHbNWETM//9B0wKpK+ArJ9FGafpohH4YXZMaxMvqnfzN6DsxtHxqWKzSaoNfD523mLBFlTJikaAKeEk4dTj35GtMSlJvJrMr7+Mj5fh7pxV6cI1k2y12Os72Y3DRYKm0buqBiUX29Y9fRHSe/wbX6XhHXqagkiUsQs0J1fLshE5xp5By3FccgWKmhGMhmW1nE9l/s6HvlQzgtYYnXaE+pyCJDfr8T6PmWYiV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kau3hk5JFPV4Z2/LtWGqRDGwKP8knZ+dWFS3/U21WRw=;
 b=agGtgKeIXNlctBcUW58ZuhKILdLEzWOzcC8Ox2l672+OO4czmUISWoJbdhxfTKgqbdzf+TLR8bkU85gPlgyee9LOH/dSWTRfr1pLsl8N4HzYUZp3tyPDNOVO5jDea02dqLpc1eNKh7yYC34wg2LUO1gaCdL8LYJoivZ0Bg29FMw09M/akGKjqzRh/x8slXaAcIx/JZA6TJ19mK8zpi/QMcW/RZAcWk3qmkXJHDwjum5pDqWCUe1kzaO94fUlsPhLZXO9hgO+d8ZR7G4wo5UHiACxyl03RKtpSOUBVCExfxLeXzZI1WQL6pEOSl1UozRN3QdDoUoj4VC9dHyoGYJQHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <a41b68a8-9623-4acc-b470-d5bb367fce22@oss.nxp.com>
Date: Wed, 11 Sep 2024 22:53:03 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] xen/arm: Add NXP LINFlexD UART early printk
 support
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
 <20240910143411.178704-3-andrei.cherechesu@oss.nxp.com>
 <e1644410-4875-4243-8ba4-3d26c116b96b@xen.org>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <e1644410-4875-4243-8ba4-3d26c116b96b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0022.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::14) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|GVXPR04MB10023:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b70e7a-d1cf-4658-5c5d-08dcd29b5a96
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enFHWlhiMGJtYVhGcTV1ZjJJdG00ak5aL3plNDRPRmdzeEdXR3hhN0VqZHdO?=
 =?utf-8?B?UVZoazROd0wrSVR5R0lPMkRIVDhqWXhuWEdxbjEzdUxRbXduMlA3TjhheWN1?=
 =?utf-8?B?ai8wMFRCRTBDUlROc3BaUjdyZWVqT0xHMjlYaGVGUUdQZCtiYlhLb00wb3NM?=
 =?utf-8?B?Z1FGeHVNU1ZHaHdZTHE1Wkg4VnA1c085Y1A0dDFQSStkMXJkaGlzWkZmVmRL?=
 =?utf-8?B?dksvVnJGZ2lhSGVWYzZueXNCZGF1MU96UlNyaFdhWCsxNkpFSEJsakxrUHBK?=
 =?utf-8?B?NzFoUFJRWVNvTndQakFXMXVMbWo2L1k0MkhrRTdYM2xsN1U3SThBd3BLRDhT?=
 =?utf-8?B?M2kzMUdicHhwKzFyWExFZlVrVVJYREtkSHpRWlhmSnoxRllnNmxESW5WK1JJ?=
 =?utf-8?B?N2Z6Qy8yT0J6WnhIN2pSYzdOcXhsUFhBM1ZiRXNXS1gxbmtDNVRpZ1VLV0dT?=
 =?utf-8?B?U3p4VW52eHBOM1o5REVTcEJoaUFsbU1wVTc2d1VyZDN5TmhWLy82ZEtBYkJy?=
 =?utf-8?B?MkRKRnEyYWFQZlZKRHluWXhzQW9rY09mZXRSZ2JFV3IvSjVnNzNxcWhraGxa?=
 =?utf-8?B?R2UrR2pVVmJVS3FEUlBHeXZFc01kV1lBc3Y3SmpRVVErVkx1L2JBeXU1bzRS?=
 =?utf-8?B?MXQzRXNIeEFpTUJMSFZYNHg4eEI2ekVLcDg5UGhRZTFKNzU1ZW9JbEFRL3FO?=
 =?utf-8?B?YWFkZjVnYzlGT0h5RzVPaFRoSEoxQ3V4WC9GTGU2ZmxSZHMvemMxNmc0dVc2?=
 =?utf-8?B?TG9PMDIwUDVJNWdxZkZGZS9HVmxEZktKQ28zNzV3M1NvQUZqbWdEQkhSTW93?=
 =?utf-8?B?ZERSMnN0SmQ5MWxzL2dzYWRtMHJXeGhwOHNKeXR4eXRidWtLU1N0aXdiZ0F5?=
 =?utf-8?B?b1pKN29MLzlNK0dXOEI4S3kvL0gzb2xJa2sxOGIxb0h5VmxTZDVrMWtTUnN2?=
 =?utf-8?B?NzhuNWFYeEVPU1dodW5TT1U0aUplRTcxMmdDR3ZQMURpOFRkcWFTYkt0UllJ?=
 =?utf-8?B?eXBqb2M1SnlXYzI5ZUpsOXgwdk16bng4RXFLcTdCZVRtRnRKckNpaDNBK0FB?=
 =?utf-8?B?T2ROamNWY3h3dDNIQ3diempaS2hZekN0UUJBVnByekZnVUcxbm5PaWdCMHJL?=
 =?utf-8?B?SUIyOWd0ZE50MytqVDM3UVhJZEtDK0JUZnBEdHladTFNNmMzN1p0K21WejJP?=
 =?utf-8?B?TC81VGNzNkpjSnJSUG9xTWo2SE54ZkFKc2tvSmZRbmhOQTVRTVhrWmFnZ1hp?=
 =?utf-8?B?cXg4RUpGcXZiK0JzRHcxN21MS0lDUUZMSVlSSzhzU1BMbDErTGxpR1JXMXNo?=
 =?utf-8?B?NW01d3hIeGtoQmpFNWIyUThDYmN5OVl6RkJpUHEzMnVRVnRSc3FQNm9mNTMr?=
 =?utf-8?B?TlFIK0cwU2M2SjRIR0hvQlhwK3VEMFhKRGtXZnZiSm9PY2FVL3JEMnVjdmFj?=
 =?utf-8?B?SkJweFUwQ3U2NUp6VS8xOG8wekE5WDlkN0ZwNnZ4OU5NQkdkSUFWc2d4V2Fw?=
 =?utf-8?B?d2t4NGVwUU83aGJvb2h0bENBTE45UGFRNFgyeWtSOGh6Q1lRMlZ0RStza0l2?=
 =?utf-8?B?WVhReXNDTC9tSXhKYVZWdUhjaTBBN3ZDaGx5aDdZdGdReTZFZDFjMm9FUTN3?=
 =?utf-8?B?OFNFY1ZwcDZlMjZPdFFHeVpZYWc4SmpvU1QxajNDR1BSWnZGQUhVa0RkOHl3?=
 =?utf-8?B?QkkzTjl4WEFabGg2VisvSytkNnhlRy9BaTcxMm1hNWk4aWF4YTBocURiVGl6?=
 =?utf-8?B?dnRxK1VwK2c1ZmFSSVJuWVB5VTVzWklIWHE4QlhpSVBmd1pxcUs5aWZaWFNP?=
 =?utf-8?B?R0NFRHhjUHZwRlpwV0JPUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTRyc2NFZDMrSmMzdERqNTEwWVMwQ1NJRFNrcVZyVEpaYUNmbFc1NzlhcmhM?=
 =?utf-8?B?TU03WW13Y2p2YXg4L3U1TEp6Ynp0ZlRCS0RmQ1ZVNCtFV2JLM0toRGZhL2cv?=
 =?utf-8?B?dUphNHJQdHJIb0MxVjRxTFpyUGN2aVpEaS96a3lQYVJrSTUzbVErMXBqa1N4?=
 =?utf-8?B?R3VFMElpZnp0OWFzdXhQc2lVcnpRTlpSajRFYjRtdis1dUJDS0RKcG9VdTd4?=
 =?utf-8?B?UkxEL21sM2ZWaFQwSXFwQWVFOW1od0kvclEvN0RJTUxUMnNSODgrRGduaHZw?=
 =?utf-8?B?dlh2MGlrVldOZlpCRGtobTdOZ2p5clNObGl4NFlhM1dpNzRnTlNTTE5jbDN4?=
 =?utf-8?B?SktZV3VWQTVPbFdTMno3M3QvbFRPTW5qeXFiZWUza0dxL3NKNS9uRm9NNU04?=
 =?utf-8?B?cGRSa0ZHUElmUmgvOGxwRUw0bHVCVFFtS0RGWkdscE85R1BURkI2RnNKT2R6?=
 =?utf-8?B?R2hFRFM3YVBab1BMSGlrS2RUMW9CY0lxN1I4OHZrbnRvT3hKSXZEZUkzTlNY?=
 =?utf-8?B?Yjd6M2dnZFY4T0NQcHRNMXJybVlhRnI2UUEzS3hyZld5Tm9LNFFMY2VkdjNr?=
 =?utf-8?B?N1JTTHZ4aUpoNGxBd1FlZE5INlpKbEx2M24wN1VCUFI4NVR5TmFCYTJCZzJm?=
 =?utf-8?B?UGl2UU1NZ1padGIweGorWkZqWUtWSzZDbFVZcU42TnllNytzV2tzMHFPQUdP?=
 =?utf-8?B?MUZVZ240UmFzOWlKNXU4Q3l0eFgvbHU1OURDNlFYL2tMZ3AwY1Q5QXhaYlh2?=
 =?utf-8?B?UVBOTUpjZjQ0ZmRVcnJGSHVXOXdhT2VrVEtjaFFGU2tjZ1A3cUwraVV6dXVo?=
 =?utf-8?B?RVN5VXVuRVFYL3BrL1pYbU4vQlBKbHlBZWgzWGJvYXB4ZEFpZHBOTmlpUzN0?=
 =?utf-8?B?dForQUR2cktmbm5qQ2RjdVltUmpaYUxCOW92ajlZQUNCNVoxMHdYb2x0VlFV?=
 =?utf-8?B?WEtwSXFyUEpDVUV0MTIva2hDWjlWTFdPRXhWNEl3L1doZnE1a0FUSEpWUWN0?=
 =?utf-8?B?U21HdjFNaUlJOTkxYmtvY3RKc3BwN1JMcVZHZzY0WkR6VkxYSHRwVThrbVh6?=
 =?utf-8?B?cHFVTTNXYjh6aEVsV0hSOGtOdkFkbjAxUDg5UjJ5RTljbkhmaU43VDRxU2tM?=
 =?utf-8?B?VkVlM1FFMko2am1oZk5ZckEvQThZQm9MM0hNOElpalFSbWZZR3dzTDZEZ0o3?=
 =?utf-8?B?YnlsTDQzS3RvZzZWajV2dmJlVUxOTVFMcXJESGhuVDV6S0dCUThrNnVIU081?=
 =?utf-8?B?UzdreEdRK1B0aXk1L1BHZWZ5aWNmRU5Da29HeElEZTd2S2dBQkxablpVZWJq?=
 =?utf-8?B?MEYzNm96TW14L2Z5b3c0STZXR0VvUEpkbS9CS09XZjA5RFEvcEtsQk1xNXhh?=
 =?utf-8?B?b1Y4ci9DK0dYdUFVN1VCYTNBcDduRjI1ZlIwWG5FazhraDdpV0VXQm5ncGcx?=
 =?utf-8?B?K3UyV2lsOFpuQlRlQmhxZlYxRWtRSVFPeE1QdUp0QzBIR0ZOVmFhUWFBN2Z2?=
 =?utf-8?B?SnM0aDBpeTd3WUdscGM2UUZxa3lWaWo3empTUUZjNlJCVklqZ0M5OTlTM1dP?=
 =?utf-8?B?bWtRN3pWdEtrZnZseUU1dVVaRnVDQ2k0RlgrM0ZQdFBlNGFuMGZiZ0hxcFRO?=
 =?utf-8?B?T29mQTZsQkRBK0xuV3ViNGdkR0ZjcnBiMWptWTRFejVXMVN0YTZKRDEyT3h0?=
 =?utf-8?B?a2JsYmdvdldTYTBrRkoxTjlOeFFPeDVaUTg4eU1WS0RuMzZvV2NKdXlXaFFY?=
 =?utf-8?B?Zys1L1BKanZza2REMm5RSCtRd2NjVDkzM0dqSW5XamM5dk9VTUNJOVB1Yksz?=
 =?utf-8?B?Q0R1VkNtRjBmdi9SYkZZQnhRMktGNXh6c1J5ZDV2V1dFaHBTRVp1WmFlNjV6?=
 =?utf-8?B?VklqSGkrOExvWXhkWG0vaW1leDFrSG1WVk5GRWtzMVVXVGFsSW4vM1lsY2Q0?=
 =?utf-8?B?clVWbHRsSGNWaXRVZlFnR1B2K1J4ZlBaT0R6S3pHLzh4THNENEpTRWNURlBD?=
 =?utf-8?B?MHZTbUs0bHl4dmM2RGtDNGFTcjhzQ3BTbHhSUGhjV05DM0VxQ0szM3NUa1JD?=
 =?utf-8?B?clM5S2Z4Q2pDTkV6RnNPYWIzWk9Uc1dYZVdDTUoyNzJNOXVYY1Mxd3I2WTZE?=
 =?utf-8?B?QVdmOHVuSVUyemR5Q2cxOWRtTldRYnFOQm9aWDE3S1NST09LYVEwNllmK1R2?=
 =?utf-8?B?V1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b70e7a-d1cf-4658-5c5d-08dcd29b5a96
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 19:53:06.2848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PngfQlltP16wNzvMzEOQDPw4b1+JCg6CEBFABy2x7ei7+9IGj40IQCVxSf5zb6geHS9XqN9QnSQ0EZub8Hj/XDAsnHAYmjthGhV1MgNZbZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10023


On 11/09/2024 00:58, Julien Grall wrote:
> Hi,
>
> On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>
>> This adds support for early printk debug via the NXP LINFlexD
>> UART controller.
>>
>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> Signed-off-by: Peter van der Perk <peter.vander.perk@nxp.com>
>> ---
>>   xen/arch/arm/Kconfig.debug           | 14 +++++++
>>   xen/arch/arm/arm64/debug-linflex.inc | 58 ++++++++++++++++++++++++++++
>>   2 files changed, 72 insertions(+)
>>   create mode 100644 xen/arch/arm/arm64/debug-linflex.inc
>>
>> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
>> index eec860e88e..a309f67f90 100644
>> --- a/xen/arch/arm/Kconfig.debug
>> +++ b/xen/arch/arm/Kconfig.debug
>> @@ -68,6 +68,16 @@ choice
>>               provide the parameters for the i.MX LPUART rather than
>>               selecting one of the platform specific options below if
>>               you know the parameters for the port.
>> +    config EARLY_UART_CHOICE_LINFLEX
>> +        select EARLY_UART_LINFLEX
>> +        depends on ARM_64
>> +        bool "Early printk via NXP LINFlexD UART"
>> +        help
>> +            Say Y here if you wish the early printk to direct their
>> +            output to an NXP LINFlexD UART. You can use this option to
>> +            provide the parameters for the NXP LINFlexD UART rather than
>> +            selecting one of the platform specific options below if
>> +            you know the parameters for the port.
>>       config EARLY_UART_CHOICE_MESON
>>           select EARLY_UART_MESON
>>           depends on ARM_64
>> @@ -199,6 +209,9 @@ config EARLY_UART_EXYNOS4210
>>   config EARLY_UART_IMX_LPUART
>>       select EARLY_PRINTK
>>       bool
>> +config EARLY_UART_LINFLEX
>> +    select EARLY_PRINTK
>> +    bool
>>   config EARLY_UART_MESON
>>       select EARLY_PRINTK
>>       bool
>> @@ -304,6 +317,7 @@ config EARLY_PRINTK_INC
>>       default "debug-cadence.inc" if EARLY_UART_CADENCE
>>       default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
>>       default "debug-imx-lpuart.inc" if EARLY_UART_IMX_LPUART
>> +    default "debug-linflex.inc" if EARLY_UART_LINFLEX
>>       default "debug-meson.inc" if EARLY_UART_MESON
>>       default "debug-mvebu.inc" if EARLY_UART_MVEBU
>>       default "debug-pl011.inc" if EARLY_UART_PL011
>> diff --git a/xen/arch/arm/arm64/debug-linflex.inc b/xen/arch/arm/arm64/debug-linflex.inc
>> new file mode 100644
>> index 0000000000..6ed704e104
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/debug-linflex.inc
>> @@ -0,0 +1,58 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>
> GPL-2.0 is deprecated and replaced by GPL-2.0-only.
Will fix in v2.
>
>> +/*
>> + * xen/arch/arm/arm64/debug-linflex.inc
>> + *
>> + * NXP LINFlexD UART specific debug code
>> + *
>> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> + * Copyright 2018, 2021, 2023-2024 NXP
>> + */
>> +
>> +#include <asm/asm_defns.h>
>> +#include <asm/linflex-uart.h>
>> +
>> +/*
>> + * wait LINFlexD UART to be ready to transmit
>> + * xb: register which contains the UART base address
>> + * c: scratch register number
>> + */
>> +.macro early_uart_ready xb, c
>> +    ldr   w\c, [\xb, #UARTCR]       /* <= Control Register */
>> +    and   w\c, w\c, #UARTCR_TFBM    /* Check Buffer/FIFO (0/1) Mode */
>> +    cbz   w\c, 2f                   /* Buffer Mode => return */
>> +1:
>> +    ldrb  w\c, [\xb, #UARTSR]       /* <= Status Register */
>> +    tst   w\c, #UARTSR_DTFTFF       /* FIFO Mode => Check DTF bit */
>> +    b.ne  1b
>> +2:
>> +.endm
>> +
>> +/*
>> + * LINFlexD UART transmit character
>> + * xb: register which contains the UART base address
>> + * wt: register which contains the character to transmit
>> + */
>> +.macro early_uart_transmit xb, wt
>> +    strb  \wt, [\xb, #BDRL]
>> +
>> +    ldr   \wt, [\xb, #UARTCR]       /* <= Control Register */
>> +    and   \wt, \wt, #UARTCR_TFBM    /* Check Buffer/FIFO (0/1) Mode */
>> +    cbnz  \wt, 2f                   /* FIFO Mode => goto exit */
>> +
>> +3:  /* Buffer Mode */
>> +    ldrb  \wt, [\xb, #UARTSR]       /* <= Status Register */
>> +    and   \wt, \wt, #UARTSR_DTFTFF  /* Check Transmission Completed */
>> +    cbz   \wt, 3b
>> +
>> +    ldr   \wt, [\xb, #UARTSR]       /* <= Status Register */
>> +    orr   \wt, \wt, #UARTSR_DTFTFF  /* Clear DTF bit */
>> +    str   \wt, [\xb, #UARTSR]
>> +2:
>> +.endm
>> +
>> +/*
>> + * Local variables:
>> + * mode: ASM
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> \ No newline at end of file
>
> The file should end with a newline.
>
Will fix in v2.
> I haven't looked at the specifics of the UART. But the code integration in Xen LGTM. So with the two comments addressed:
>
> Acked-by: Julien Grall <jgrall@amazon.com>
>
> Cheers,
>
Thanks for the review!

Regards,
Andrei C

