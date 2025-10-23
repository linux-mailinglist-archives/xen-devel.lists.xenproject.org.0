Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D9AC01FB1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:06:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149266.1480948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwtI-0001uB-3w; Thu, 23 Oct 2025 15:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149266.1480948; Thu, 23 Oct 2025 15:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwtI-0001s9-06; Thu, 23 Oct 2025 15:06:12 +0000
Received: by outflank-mailman (input) for mailman id 1149266;
 Thu, 23 Oct 2025 15:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ct/T=5A=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vBwtG-0001V1-O1
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:06:10 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cceb5743-b021-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 17:06:08 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SA1PR03MB7031.namprd03.prod.outlook.com (2603:10b6:806:337::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 15:06:01 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 15:06:00 +0000
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
X-Inumbo-ID: cceb5743-b021-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBHIXmVvI5wanT1D2KG0mTPWptcSr5FZJ6PnPs1NC9yRiLy7Zq9FH73G6tup2HU1YItTjjS8E6EBGHfJQT/PY4RMxUCbvctdTi9LINm7nuOsVCvk1Ze1YPldcWlJRjgHpEdWMJpKd7dZGlwYRzwAsy/zyGPvKIofN34xDu3SqST4OzZl+jaGtTsySCGdhtoYANDWDLL+q13EAVjNFq1IxARubINrzlGLlO0poH9IYsjfQ7FrtogeePV9MSWeej+yZOvMiETaCsdWcu8leV4HBrHzHd3ivQexwHCT2j/H3R8C0TrnJtjawEOpx8HP/w9xN4KVYyQ/drtuvo9pjJYGBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ep14Fjn2U69DKo4o9l0vy3NCooP1RZIdT7PiC9uK0LY=;
 b=N3k+p6fGCw3EgX3pNFxBTHtcc8TzC7h8FzODMyW8wQjFy+71FDxtKSYOI0LJALmWRjGzVVbOibYb3CCVMsCEhSHsEbJwQ79ZNvOJzkgThhWL4IcxlorEs9IvFMgsix1D59R1Dy+m+Q1bkgCJ+3CJsqNBOHjyXt9gjS1Zw3SgRC0NMiNRNf3lFzdDLOzBeyuhDsvPLXwSn1+xg1EbpmlexUSZ3wXC8K/bzJUoMASA0vgrx6UajB82/Ea5MmAxZlbCng+Eabo+FZUcbQPDpL2y1RtcZ2mtgFOWAnzRlzJ70U6Z3RJFDi7wOl1u1c0cy/pjczqp0NkAaWsee+75REZzfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ep14Fjn2U69DKo4o9l0vy3NCooP1RZIdT7PiC9uK0LY=;
 b=bULuUWQ4wlkfgoxb204quDvMnVqdRiJWgyZ8/uLpPs4MGAgEb4Fpp9KuniP1ELeAtMRoOeaCQA1qX87+dkTR9V58yoaOTXg3XLl86fCUQWOpbX6rCqKUeEXzATaW4QhLydMGhUm/u/X6GGnImUY+vygo9RG75w3sTVKjb93OQL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <11af3953-ae52-474f-9d18-d12f79ff231c@citrix.com>
Date: Thu, 23 Oct 2025 16:05:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH for-4.21] tools: require at least json-c 0.15
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20251023085730.36628-1-anthony@xenproject.org>
 <bd6c0e3f-f2bc-4399-adf6-d2dc18b06982@citrix.com> <aPpD_G_oULdfeWbf@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aPpD_G_oULdfeWbf@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0331.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::12) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SA1PR03MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7cf26e-e791-44dd-6d2f-08de1245ad10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWhCa3FDRzEvL1NMeVdIcVNhRWJtVXZzd3lNRU1HR1U5L0ZNN0lFQUJWM0NS?=
 =?utf-8?B?L2xzVEc2dDMwZ0FBeENYUHJpellOaFg4M0VTZzZWeTN4SzRqSnovaEczYkM5?=
 =?utf-8?B?ZmhRVjBDZDRoS1prNjR5KzF0RlVERUN6S2R0bnJ5RmRmckJzbVF0N3B6ZVd3?=
 =?utf-8?B?RWlVcFg1QlVlbjcyRU03dU51NlhRMi9aWDVKY2QvOUs2RnNnV3ZacDIrT1E3?=
 =?utf-8?B?Qm43YkxXNGdlTDBKWlZiM0haT2ZMUm1nMTQrZUQyWGZ3QURUWlZGUUJyYVQx?=
 =?utf-8?B?RjBXb2s4MWlPU2lsSE1Qbkc4SHgzblVjbGVtcVdDYlIxL1FoN2ZWR0dZZlc5?=
 =?utf-8?B?NUdPWUtoS1c4TzdaWGdCbmxQTzh6T3NkSFNPUWpyemZ1eUtqREQ5VHFHMC9j?=
 =?utf-8?B?YTdqamFFU0ZHWVMyRitiSXBNNkY3Q2hwZUpyZS85UFpaUEtVS1MxcTZPUTFV?=
 =?utf-8?B?Q3pZZVdpZzNWdlhDL2F4UGorazAwcm8rWWdwakhodUh1elM3ZzY4SDhETzNJ?=
 =?utf-8?B?cFVPSExBSk5EU3hWVzFmMkg2SWozTjd5MEpaeUs3a1RWN1ZnTzBZemg2U0RK?=
 =?utf-8?B?aHNhSkdLem1JdCs4NVRtZDFqVTF2NDVoRERXMEFUK0U3L0tNTTlnOHM0UUpK?=
 =?utf-8?B?aW5xSG9hNnF4QkdSREloZFRFS1h6K0FEM3FBeHo3Tkt2R0dMYUw4eE90TmMz?=
 =?utf-8?B?SW13TVE0YjlYWUNPNTRkM2RNNVpabURrdEROL1ZjZzkxQStVcDhQUE5jNC9H?=
 =?utf-8?B?c2NPWUljazc1RFVhNjN2STg1dDQ2anRQSVluYlQvUXI0dG8yZlJtVHhCZ09h?=
 =?utf-8?B?Q0l6VTh0bEk2L0tUVjlzQWRKL1BackJmSS8rMStrZG9lV0JjQ2lLQWhYWTRB?=
 =?utf-8?B?RWdFMDIxTlZWdmlCSUZ4L01wejg4bEV6eTErODRuR2t3M3NnbGhGMHhuR1BV?=
 =?utf-8?B?L1c5R0svQ1MyZnBIWXpjd216cHNNYW9OT2NWK2NSNUFhUWZ4em03cHlyUXls?=
 =?utf-8?B?bmFUTnI4UTBaMDJ5QVFuZGVYVXpnMW43OFp3bkNtWW9yODF4K1VIZkk2SFVI?=
 =?utf-8?B?UEJKZVAwbm5yYnFoNHp1WmZzWjFsSUxwejVncjhYQmpzaUI5YUh5dGRRNUR0?=
 =?utf-8?B?VXpHZmxnZ0tvVTdNaTJoYmRtcEdHT3JMcFZYSkV3djQ3aGVkdmlUalR3YUQ2?=
 =?utf-8?B?SFhJUkxra2ZJVmxuSmQySmRwbWhEUlBwMzdZSHN3UXlYNVRrbVkyZHJaSVBv?=
 =?utf-8?B?cTA1Q2t1czFrMngxcjZsbUhoOXl0Q1dRWUUxak1FTEQyTHJWamVES1ZJVjVT?=
 =?utf-8?B?NTBTdjJVbHM1U2d4cTJqdnhIRm5mWk5uYzRzQ0lEMytML0IwRTE0YnZPckps?=
 =?utf-8?B?cXYyUXppZGtGZHdzdXg4U2VRN21laWhESUNIZEpIazhmakk1b0s2eWJDZXdm?=
 =?utf-8?B?VDNMOThLeHlOdWlSazkydW80M0pjUkpxV1JjWmh1NFdsSmFEbktic3YwZUps?=
 =?utf-8?B?YmxTLzhGNEF6bVpneGxxdEl3d0p3V0N3UTdPZ1ZiUEp2clVQOTEycXZ3NkFm?=
 =?utf-8?B?bVo5aXBKY1BoVUZTTktkbUdLRTRCNnY5a2NuRjcyNS9QVnJaVUNaRGNFOG93?=
 =?utf-8?B?TE9PaXpCb2haQjhFd3ZaNzVCSkxHSXkxN1dzQ053N28weDFxWVIzY1I2MVhF?=
 =?utf-8?B?ZHljWmZDVWxyRzZWTWtDOCtLL0J5cFUwQTZkL0JUblRNd1NYbDZyQTZINkwv?=
 =?utf-8?B?TUxYMVB2UUNPYVg4ZUI2dXFsc1VQK2dHSEFGbU5BRFF0ZzJLb0VPSHgrMUk4?=
 =?utf-8?B?ZmZGUW5VZytvOXN4MnlMTi9nY3hnc01EbVJqUHJ3MmtsQ25hdVZaelpGdUdQ?=
 =?utf-8?B?dlAzRU9tVnBOcnI3amxFSXEzK2N5cmM3WTBKUkp3NlYrSlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEx1emxsRGkwenNCeXFIejlKaU11Y3Z3cjBGUWpEMWthMkxLTjZhQy96Nk1U?=
 =?utf-8?B?TjNzeUpjU0tQaEhEdGRnbXVQZkNBUEtnVW5XQlJ2SWJMZGcwMXhmZWNjZ2lH?=
 =?utf-8?B?dmZLR2VxYzBHbjl1ekJKZFJac0RmTGJob2xGeGt2K3dQOWFqQWhwVzNNTExE?=
 =?utf-8?B?djJOQytWQnBOTjBHd2QyY3VkaWJNVzVZSVRocFE4Wlp2djV2MkYvQXlDZUpz?=
 =?utf-8?B?cDA4ZkZwb25NeWh6L1pJMElncVRXWnRzb1dsMjcrRzhhbVdia3U0ZDZtQmg4?=
 =?utf-8?B?a1RLYUxZV3N3ZlA5a0FoSUFXcksrZ01KMWhaVHhGbE56blRuLzBTL3hoRGhP?=
 =?utf-8?B?WHpHOVlueVp0V1pEdVRWbk4rUDJ4djkyTXhPeTJqMURIVlM0THBTVFFPQXFo?=
 =?utf-8?B?WG84UHNWSlpuWkNtZGg0b1VYSUREckRpTHZoaVBaTUdOVnMzZWpwbDZmbldZ?=
 =?utf-8?B?UUlha0dPVTR1Y2hsQ0ppaHgxQ2pBNi9JSEdBTXFsUWFsL0x0dDFXV21mOW4w?=
 =?utf-8?B?dDZnSFMrakVMT3FnZUhhMktkTEpUelM1aS82ZW96VUNWa1k5SWVXMGV1NXNR?=
 =?utf-8?B?UDBnc3dWY3Q4azZIVFFjVjdFMC9hdURWbkJrTmVKVEp5ZEs3WFdvRGltWW9z?=
 =?utf-8?B?STAwcmNacTIzaVM5ekxpWmRxWnNzN3oxY3Z5bGszcU9PeWpPYVlpd1N3U1d5?=
 =?utf-8?B?MzFYZkR5K3diSkQ1bGlkc3gzY05MeWx1V3ViTXdYK1VvUGpRREZIS01rTGRQ?=
 =?utf-8?B?TDN5c1FIM1hFVFFwODJzUTduVHFsTllpRENqRUJDZFYvZzRwWFZlYkJMNXVC?=
 =?utf-8?B?enhJYnFvY3oyUmZ5THV0L1NBSnhwVEZYcUhZMExrbUtYWWp4MjF3Rlc4ZWl1?=
 =?utf-8?B?dDM3anFtTW5Va01qS2FIOWF0ak9QOGtKNjRsUy82OENZdHM5ODZkYUpMNzBh?=
 =?utf-8?B?Z2t5REFkNmhiWXB0a1NwT2NyUlhpQjhKZFRtV2FwaGJ3d2VKTGl1QUJrak5u?=
 =?utf-8?B?YkJwVFNScEpEdUV3NFljdjlhZG1CZmxQb3pMcmNwTkZ3ejIwVFhqdmpWUVhn?=
 =?utf-8?B?S0FzbDFlN1kwdHFoV1VRQVdxY0ozOVl1SzU2Zk5FRjlVcEZqRWxWZEltTmdh?=
 =?utf-8?B?djlQYlk4QnRtUk9weDJHV2dYU3J5VFk4QjJzWklVaWM0MXU1QS9IdXM4SSt6?=
 =?utf-8?B?a3BCN29IZm9RTUFKOUpDYUQyWkJLOXo3UGFTdVJNNkdsTW80b3lMd2tYTXZW?=
 =?utf-8?B?Sks5eUg2bFUwZUFMSUl1ZmcyMU10U1VnYVZ0MmI1Z3Q5RzlGdXk1YmVwSHcz?=
 =?utf-8?B?QTVsdTlCSE1BZnVFdW56Rk14YWVsZFhyN24rK1FrK0x4YlVkWWJ0SVVmQ1h1?=
 =?utf-8?B?MVZoLzVjSVMvdjdrSWhkaEg5bWZXcjF4ZlIwd0tUUDJuaDhWVjlOV0JOT01H?=
 =?utf-8?B?aXBNMDA2WklGamlFVmVoWDFkWnJ2ajE1RG1BZlI2VU1BYWN2U0J3bW9rQlJZ?=
 =?utf-8?B?TGdTeEtqQTdOUkRkbFRoK3lEc0VtYUh3Mlp0cGdINU1HRW12RTFVQ0toVThE?=
 =?utf-8?B?djZKMzgwVXV2cnkxUzhDNW5kai9iL09PMk82NGxneEtnTTNXcWhSdThZQnB0?=
 =?utf-8?B?RHZ1T21uUG9OMnBkZzg3WTZTS3VTdHRMWjZTTFZsc250a0ZYd2JHck5Ea3Vw?=
 =?utf-8?B?TEJGNTI0bThaajVaK1BtbnZQZjVtSmYveUdyTnFPVml1VERzOHNsN3YvN3NG?=
 =?utf-8?B?ZTM2YW5DdEtsUFV6T1BOZDVraUdsWTJxZzUrSGlaSlhKaEYrcTlYR0N4ejJ3?=
 =?utf-8?B?MUVGZFpablVOUnlRc20rZTJLbTB0ZndqTTF5OENKZGRSaXFnM25kejdjWEow?=
 =?utf-8?B?RE4vY1RFWk9QUm1rMVpvckcrdmpjMHkxazB6TUhwQkx4T29UQncrMHQwOGRh?=
 =?utf-8?B?Q1V1elFoSktMWEJteXp1V1BCWlRzUzdFSGxjVENUdm1JdnJvWWJHVmRicHBY?=
 =?utf-8?B?OGtVMnJKaEJ6RGo3RDBiWUVadkZnYStCZURuamRoZjN0QUlOeHoxaEZGMmN4?=
 =?utf-8?B?M2tpU1R1WDdyZExTVDdURDZyT2VhMlRRM1AxK1hwdHY3Zy9hMzNURk0wMk03?=
 =?utf-8?B?Ym1xQUJBdnJhMXFxZHdxZmNId2RjRkxJTUhteWhUelBpUCtNOTJzR2ExUmFB?=
 =?utf-8?B?bEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7cf26e-e791-44dd-6d2f-08de1245ad10
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 15:06:00.3219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CgYvPAv6qhQc9LhYTdPhiQ9xZmtwPygZkgZVnNnmUOLiGoyW3CggBIKNV5O3s14mRIGnZtGNJ85PvDSvrsl2m6e1EEgZNU8MuL6UbOknUxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7031

On 23/10/2025 4:04 pm, Anthony PERARD wrote:
> On Thu, Oct 23, 2025 at 03:45:55PM +0100, Andrew Cooper wrote:
>> On 23/10/2025 9:57 am, Anthony PERARD wrote:
>>> From: Anthony PERARD <anthony.perard@vates.tech>
>>>
>>> If not available, fallback to using YAJL.
>>>
>>> The code is using json_c_visit() which was introduced in 0.13.
>>> json_object_new_null() and json_object_new_uint64() where added to
>>> 0.14. And the last one json_object_new_array_ext() was introduced in
>>> 0.15.
>>>
>>> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> However, you should adjust README and possibly Changelog.md to give this
>> new minimum version.
>
> Will this do?
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 0cf9ad2d95..fc4f6d7c8a 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,8 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
>     to the baseline change.
>   - Linux based device model stubdomains are now fully supported.
> - - New dependency on library json-c, the toolstack will prefer it to `YAJL`
> -   when available.
> + - New dependency on library json-c 0.15 or later, the toolstack will prefer it
> +   to `YAJL` when available.
>
>   - On x86:
>     - Restrict the cache flushing done as a result of guest physical memory map
> diff --git a/README b/README
> index eaee78bd73..53a4d5c2ae 100644
> --- a/README
> +++ b/README
> @@ -53,7 +53,8 @@ provided by your OS distributor:
>      * Development install of Python 2.7 or later (e.g., python-dev)
>      * Development install of curses (e.g., libncurses-dev)
>      * Development install of uuid (e.g. uuid-dev)
> -    * Development install of json-c (e.g. libjson-c-dev) or yajl (e.g. libyajl-dev)
> +    * Development install of json-c 0.15 or later (e.g. libjson-c-dev)
> +      or yajl (e.g. libyajl-dev)
>      * Development install of libaio (e.g. libaio-dev) version 0.3.107 or
>        greater.
>      * Development install of GLib v2.0 (e.g. libglib2.0-dev)

Yup.  LGTM.

~Andrew

