Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E449ACA9B4
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 09:11:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002790.1382181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzJq-0000fZ-Nl; Mon, 02 Jun 2025 07:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002790.1382181; Mon, 02 Jun 2025 07:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzJq-0000cZ-L9; Mon, 02 Jun 2025 07:10:50 +0000
Received: by outflank-mailman (input) for mailman id 1002790;
 Mon, 02 Jun 2025 07:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yeyf=YR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uLzJo-0000cT-RZ
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 07:10:48 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2412::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3b966b5-3f80-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 09:10:46 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 07:10:42 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 07:10:42 +0000
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
X-Inumbo-ID: b3b966b5-3f80-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pny9ONUV1SxPtKl8TXN4Yeu6C7MzlLxeeqCiMA+eSAa43JRf81904CTV/SsFNcDXc3FQ5eboCyXEJJAZOUYNZWw/f/2TFiGEODU/CT476/Xbr1mxITehvxfCGJjpByjdN/4DVkLCwbXDZyRKo0oGafg5D/BAPB75rF7a3Pz7yQyMn//VeDUB74CkrOJxdMiFfyS59wOvZcuUWxPC7xpl/QBhiD3gs3PzwNYncu3fiRL/cmbwgCGE+Vs+aXi8zfs5/Evm5ro9STBR/bMuZdoTgOMluUAuyWPszsxwvAuq5LFUiF6sTNOd/VljFMAMkbICn4+MvAFwfMGIovOYLrggSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyUNW9kSP/98q59S4vT6keD2i0uxNIIX6C152C3yvdE=;
 b=irAOPO9K12cm2yxT1gDal/Byx448vDDVVGTaDSF5X8B7K8ojAhvE1qOYAsBGc/bNgKkBfUvgVUxAYgFogvcGswA+R1yHML6u+hd+EqTmV1024ZBZ+Dk5FZK88QDA5CdMhof1eDpwNAGPvRfrXYcRjLw4XKN6jmDtTf1IG8mRSLKj3Hl0P6kX5iq32lp6z8dcJ/ggjkxNQLx7XzjQSlky6iJkYXSU7QT2wCnDaUiCm661qF98aFvEb6bNsPSU5GSL2oF69Amddfp9R2V9IVck6yJHPtShFrzFuRddvI+VUQnI6N4uMEn9KMl3A9s6J8a9K1CpjaAeXBY+vMMLwDn2jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyUNW9kSP/98q59S4vT6keD2i0uxNIIX6C152C3yvdE=;
 b=OoZ0a/p1sCyuLQ75m7vWJrq/Tv2ZsgJGCNwUQmFieBShLNeilXUbX2NCWrxiNVDCXN3f61laLfcCZo0DtILA7DFB64PvLicVn+SUJYtOdNHcE/Ap96REV6S78eOf4ZBP92TxpRF/eI/WD+9huXCxjNv1rJW4KHSzqF+2mOndYX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <26d614da-3fb4-4209-8123-096512911897@amd.com>
Date: Mon, 2 Jun 2025 09:10:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: head: document missing input registers for MMU
 functions
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <9b1f50a40e3634f859ad8e7446c24e43caaa38eb.1748637004.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <9b1f50a40e3634f859ad8e7446c24e43caaa38eb.1748637004.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF0001A04D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::49a) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SJ0PR12MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 048e4f34-aab2-42b6-eabf-08dda1a49636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wm5oWmttYi9DTjkrRXZHZFBrKzZpaEZ6ZVRZN2NES1pxdGtlY3dmczhGOHFr?=
 =?utf-8?B?U2xrN21RVjJwZDV5dnM3SzZ6NFF5ZHUxakxqbWJkZ2lwemJmdWFyZ0VQcGlN?=
 =?utf-8?B?V1c3cWk0Q0xFOVNSQkJVSWhCaEVvU0dsMlBuOXpTQmNSTXhVaWdXS1lObmVJ?=
 =?utf-8?B?RTh0KzNnNjd1c1RtbEc5b1VPNUpJNVA4VVJCMklKOXVKUlRXQUZjQkNsRHZQ?=
 =?utf-8?B?cFhvZ1o2cndLNnM1a0dNV2l2d255ZXlrNzMraDV5WXBSOVcvZ3VuTUxBeFFo?=
 =?utf-8?B?YnJORG9rRzlZUU1EcFpJTGdTMzFQVUNqQU1FV1JXQ0Urckc3Um5xMTVJVFp4?=
 =?utf-8?B?QjF1WDlhdkY3OE1mUzNYYVNHTlRWWG45WDVrTmVQSVgrMkJLSDQrNFBKYmZv?=
 =?utf-8?B?eURneXBQc1VyRmxiSXJ6TC8xZ0dvdFJTSzBmODR5YVdWWVdoTXZLZ2RoTG1P?=
 =?utf-8?B?djd6eVNKR0xwRGZPR0JNU09neDA0ZDRxRlFDdTZaM1JNT3N4Zk1CS0xUSmNa?=
 =?utf-8?B?bU1GV2M2QnljV1cyUFVyUGY0Z3daOFJZMXZJWVNHTGNXb1BvSG1DQmNhUlBi?=
 =?utf-8?B?dlVHQzlRMWxpZzdvbHV6dVl1d3pqdlBhMVZ6eVFUOFhnRDBqY0FoV1dWZmMy?=
 =?utf-8?B?QWUwUldYTmtIUktPQkR2aElwaXlNU1Y5cjUrNG12NC9Qa2pIa1BoczhRajJM?=
 =?utf-8?B?ejJBbkVXdi9pRTYycHhTRHRBLzZoUnpjM2VwWjd6UXV6TVFqMWZPNnIxU29a?=
 =?utf-8?B?dnZwNGlXNE9oMXhqMmVtc3BFdXE4U0Fsc280dXdtdUtGQmxCRFU2ZlY2ODh6?=
 =?utf-8?B?YVlhYkJXSHIvSXh5RC9Ra2ROd2RBaTNFWjd2bzg3UGlSenRBclcxUVg0b1lZ?=
 =?utf-8?B?blJMWVptZS9WNWNMOS91L2t2R2R0d1ZodXdscXdZWGMxV2diR0xwbG5zbW84?=
 =?utf-8?B?d2gwaWZWYTh0VXB5U2NNZkhOSTVuK3JKQzd6Vk1xcm4xOGdyQXFLZ0VXVmpN?=
 =?utf-8?B?a04wTXRvUDFOVnJFRUNUWHMzdUtiQXYwTEo2RDYxMFV5SXdaRUtxKzdDL0hw?=
 =?utf-8?B?anlrVC90ckROY3NhZDI0eTFudkg5TWNlNjl2T3BTKzh0UFlJK2d6NVRxeHkz?=
 =?utf-8?B?aHBlTzB4NXRNdFRkaUhnZnc2Q3JiRTJSTDM2UmI1Qi9STjUvSFhURHZHWk9B?=
 =?utf-8?B?ODl5TUx1TEZlMS9PZXM1ZnJiMHNSb0RTWVhTWEtObmRMcXRwRndMd1dHMy9S?=
 =?utf-8?B?MkdKNVZuN0hsMUpPR0tDdXRKeWJZYUhMWXVkQ0JWaUhKT0NMMUVQTVg1WDN6?=
 =?utf-8?B?ODJkbE4zRk1hcFR0ZkxEd2xadG42TzZ1MTNkRFRiTUxhTDlxbkdpTGtwV1Q0?=
 =?utf-8?B?a3lJWGViS2V1WmhFTXQ5Zk1WZkt3cnJRVUliUEV4NWI0bmxZR2pWNGV4Z05h?=
 =?utf-8?B?a1dTMGc0WGIzcmJDK2M2UDI1WTZuRy8xeE5hRU10U09HN1RQY0lZZjBKTElH?=
 =?utf-8?B?SmV2emI0VUt5UDl0SmlNc1FEdklPWXlmZU9salJ1Rk9jYXU5VzdVOUplZVM0?=
 =?utf-8?B?NWtYeGZnRHY2K0ltZ1ZObG05ejEvWkdMZEpEVnk3dEZvd0k4c3VuK0luU2Rl?=
 =?utf-8?B?d3RnTnNDOEhCMzV2Y0ZzRy9hd0VrTTNUeXJ1K3BSK1k4bnRtMWx3NzREa0NQ?=
 =?utf-8?B?d2FabkMzR2pqN3Zla053TmZ6TmpRQzJnSllKSDFKKzhwRE50bU9GaU84ZHJR?=
 =?utf-8?B?U2llL3FqQ05XOGxJRk5ZU3NBUGZ5K21PNEZlWFMzRFR1VkNWZGFSamFNTS9V?=
 =?utf-8?B?bVZFYW5zdUV3RjhwNno1eUhEUVhvejJXUDNEQzBsaEhKRlNlRnpCeGFXc2JX?=
 =?utf-8?B?djhheXkxNVJaZGRyaXJ5cUdEQlA4Z0RNMWY3OHY3Qjlvcmk0N2lCVUlHaFV1?=
 =?utf-8?Q?WEqq+wCKL1s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXh4Qzh3Nld6Ry9LcDJxMUQrK0FzM1Z0c1pNTWFJeUYvelVQU0MwQ2YxNXIx?=
 =?utf-8?B?SGNjTXRoQ1NScVYrS2ZKeWpqWXlQQVptTG95ZEI2ZW9idFlUVWs1dExmMzlt?=
 =?utf-8?B?enJDZDR5cGdTaDBMcDV0Uk1VU3NDT3podUU1TG9wTjJvUXFobnZjSlpzUWN0?=
 =?utf-8?B?ek5kM2RKK1ZTOTdCc0tpa3NFd0FIZlVWT2Z3a0lVS0dLUndmUE1mOUMyRFNF?=
 =?utf-8?B?WHJ3MUJTc2JYa1NhUFVqRUszYXd1UTFCTitmMk9YZytUazVyVHp5akYyVWRS?=
 =?utf-8?B?Ulg2YUI0bFZISHpPWFpYRXhDY25hUWJyN25GQnhNNnUxa3p0V0Z5aVpEcFV6?=
 =?utf-8?B?SjdFUlF0KytUY2NpaVVhT1ZCMlNEM21nelZ1dE4wMkdWRnF6enlQdm5ndnIx?=
 =?utf-8?B?YzhWRFRGQ3B4b2k2a055dWZCWjU1V28xUTRMMHZmZ0V3TlBqQ0JQamNmYldw?=
 =?utf-8?B?ckxoaHRlRDQzU2N1bjlicHRvRlRlQ1NhN0pGbVpma1JuVlZNRU1aQ2N3c2Yr?=
 =?utf-8?B?V1hkaVQxL2xVb1V1MXdxdVZoaCt1QVNNRld5SGlZb0I0Sk5XVmQ4YVU1U1h4?=
 =?utf-8?B?aWh0cXJSOEJFNndOMUY3UVpHMFhSMWJtc0ZMTGdzNmJPSFBPNzVPT2VWTHJp?=
 =?utf-8?B?WllWcHQ4TFlMSlZ5WjRVcWszbmhncTZ2NFp1bWRDbjZvcFh4VTd1YldGWUNt?=
 =?utf-8?B?Qm5VcFBTOGx2T0wwWTk3MlBTdk5hWVhxM25RTlpwVzFBL0JsWlVXNjJURWhi?=
 =?utf-8?B?SDRpV0ZSU1cxNzhaUFJydzZGUDczQ2ZKQkJGcXFVWEdRdU1pcHBncHVFNkl1?=
 =?utf-8?B?Qm5PQTMvM1FUMERMMVR3dVVwdnEwWXBOVGFSYjl5SHFvNVpheDRzc0pYczFI?=
 =?utf-8?B?TGV6ZktMd3hjQ203dUtDVk9qYWFNUWVDa3hORE0yRkNJVDN3QTdjZVRib3Np?=
 =?utf-8?B?MUhOZEFKZG54eE1NL3RrOGNxbDRRNGRBR2hsNHZMYlBWYlpaMnVEMm5RU0Jh?=
 =?utf-8?B?ZytoZm10VU1xaVpjWk9XSzdXQjM5VzRHSHFtdkFiN09qZmU1SlVybm50eStJ?=
 =?utf-8?B?ZS8zUzJiVUp5aGRFUXhoeHlpaWhGUmxHR3AvNEFhSTJ1djkvZ3pHMjdzVWIx?=
 =?utf-8?B?OEQ5VUQ4UFN0d3dLVmVka1VhTHRUdC9yeVlUbUthdnBvN3VWQ29GejRQOHV2?=
 =?utf-8?B?MU9BcXFobGRKajRoN3VPb05sUVdSS2gxMm9Qc20wKzM0ZU1XUmpDRC9PUXlP?=
 =?utf-8?B?enJWWWh2cjIrZ3dISDlLNmx5eVFIU3drbEliUXA1QXhxKy9WeW1DSzdPTzhV?=
 =?utf-8?B?MFlQSjF2Wi9RSVBOOUMxejM5cytHK2IxUDdwOHBLSHJQeGt0elpndlZnUlAz?=
 =?utf-8?B?ZlZpOXRZVVh6dWF3Q0pta1I4UHVKYjFhb1ZBNGp1cnB2QlVwVmVtUk9UdWc4?=
 =?utf-8?B?WjBDb0JqV3pCN3pKSjMrUjVJMGVkTmRjNFlmMlk1cFBIL1FVZTZjdjN3VGxr?=
 =?utf-8?B?TUpwdEp1U2lVMGNmdW5EYjNxcGFKZldwdm9XcUZHMno3dWhiRnJBN3d5dDBp?=
 =?utf-8?B?NnVtbEpWWmdDaHQ2NFVZVEtUSW1CaWx5OXN5UnhuT253NXkvVVplN3cvSzBC?=
 =?utf-8?B?ak5ZZWU5V096QkhjdkNSbWlpZ3pKNmg1YnZ4RVpkSVZHNEtuTmhqcjhaTHRw?=
 =?utf-8?B?WlM4dEp6QmM0dmpqNmJhUkJUZTFiN0xPS3VmK252LzVOSnRzckNTL04yQU1G?=
 =?utf-8?B?c2YvZlIzSnorUUE2NnlUN0VBRzNzQllMMTZXSXI4ZEpHOGhKUktESlVtSXVi?=
 =?utf-8?B?VGlDUFNxUC9hYnVMOHBwWE9zR0VySEpnY01lZDdMZmV1OEVIWlJGZWlpd01n?=
 =?utf-8?B?azdsajhXdzA3VDE3M3dMTXgrMUR6QmNlczlhWTlYUUxZUGEvTUpWcmNYeks0?=
 =?utf-8?B?Q05kN1R5eGp3cHRKUi8yVDJFMFRkT2pqWWxTN21tbFRDTmxCRkdGWXBTTFpt?=
 =?utf-8?B?UFNvR0I5aStvc0ZHM1pSbnBEcjF1Nkdid3J4ZFp2OVpUVFg0dFEvc1JiOG04?=
 =?utf-8?B?MnJPSFFkenZJOFZmODROZDNCdWh1QWwyRm1QQkRvQUJTdVZaL25hY3BiOCtu?=
 =?utf-8?Q?wn8M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048e4f34-aab2-42b6-eabf-08dda1a49636
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 07:10:42.5194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aU/tZGL3NEFEatkKhXMwZFeA42//AGWXAi1G0nU+L54JtwdRgYCtGox6ojSnMydy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115



On 30/05/2025 22:31, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Add missing input register descriptions to enable_secondary_cpu_mm
> and enable_boot_cpu_mm functions.
> 
> Specifically:
> - x19 is used in enable_boot_cpu_mm as physical start address.
> - x20 is used in both functions for physical offset passed to load_paddr.
I'm not sure if we need to document register usage that is part of a comment in
so called "Common register usage". It's repeating information for me. That said,
I can see that Arm32 does that too so no objection.

> 
> This update improves code clarity and consistency in comments.
> 
> No functional changes are introduced by this patch.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  xen/arch/arm/arm64/mmu/head.S | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index 634156f83d..033b3a018a 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -313,6 +313,7 @@ END(enable_mmu)
>   *
>   * Inputs:
>   *   lr : Virtual address to return to.
> + *   x20: phys offset (used by load_paddr)
>   *
>   * Clobbers x0 - x6
>   */
> @@ -337,6 +338,8 @@ END(enable_secondary_cpu_mm)
>   *
>   * Inputs:
>   *   lr : Virtual address to return to.
> + *   x19: paddr(start) (used by remove_identity_mapping)
AFAICT it's also used by create_page_tables. I don't see it beneficial to
mention the places the register is used. It can easily go stale.

With the remark addressed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


