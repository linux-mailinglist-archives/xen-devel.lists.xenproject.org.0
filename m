Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E96ADAE5CE9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 08:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023146.1399066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTxHh-0004w3-Di; Tue, 24 Jun 2025 06:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023146.1399066; Tue, 24 Jun 2025 06:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTxHh-0004uf-At; Tue, 24 Jun 2025 06:37:33 +0000
Received: by outflank-mailman (input) for mailman id 1023146;
 Tue, 24 Jun 2025 06:37:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NDMB=ZH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uTxHf-0004uT-Vd
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 06:37:31 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20629.outbound.protection.outlook.com
 [2a01:111:f403:2418::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3c43565-50c5-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 08:37:30 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BY5PR12MB4068.namprd12.prod.outlook.com (2603:10b6:a03:203::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 06:37:26 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 06:37:26 +0000
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
X-Inumbo-ID: b3c43565-50c5-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hl48SLcpM1I5txA+rhu4MnJ2KHPiKhiFDkQU7gkra8LH7u9ZZJ4YMK6FXfaJry7HmTLVwECFXC0AONul5BslpMEcoj6DrC9l57BDPp/q1WCqL7G522DkXToUb3+E5WBwDzidzpdTYxAqMFNzM5znh4xs8PKVAdsPrWl+v1c6sJuLH0FGcrcUO2D+dkSrIurv/zcZHjHE5v+pncXyOuNsa5ihtyufRj2ZFXlBj6x8VzdneohB8yKrBdzC9aOustc+UfPmJeNPzI6As56mEYiRq0Gd2pYb/HqDiARzB7dNvu+AzWtI8Z8vlusPoBf7ymmgCIa4/BGZ/G+JkJK+1U1ElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HlwwAJT3wSwT9dOfKxVZ1LcxafB2aD3LX7acmr0LkE=;
 b=FkkM7/WlYwkZNAxVpmwXvlrRrdgV3GJND/bO+UfHcuhT5VicyTkNZRaaMo3ZIaXWiPjDyU4jWe62PEZMxq+i8w3SCD5qFD8EpSEPTapCv5kO+IPCL+ZPGv9hLYvtdMy2bKEbmZF2NKtxdZOKD4p1Ou+ZaW2Gc2+yo6gjEHQ/AnMyW0UPLS4oHa16fG77Q/Q4BktiVD62rFWBrJFU0584lUAE9suNRgxnrVT6lTXK2ar5/K8r5T/BOOpqH0K3zTVIUVkw1wfEu/ohwiBl1a30cHTGnO1rJp5SItpdjW3Sg1mDOPDCDrmcviwdaPvIS32fOz1NjZnEU+N8XK6fvXHZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HlwwAJT3wSwT9dOfKxVZ1LcxafB2aD3LX7acmr0LkE=;
 b=YsnkooyrH7b0UKi7+keE9NHyaJRLCClSvLapiGpZWEDNP9U92OwkacbHKXoe6JQ4OUpovUE7ufNsfvUJ1NcJo/+2MJ+yawqA3EHvkoZKXXET8//A6edmxGu/zkY7uQbfL0KBs/10E0jpXjtFJKlyblos/sj6DQIzwa40+5Q5Abw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <070f16b8-c397-487c-bcb8-0ba13bad919b@amd.com>
Date: Tue, 24 Jun 2025 08:37:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/16] arm/vuart: rename 'virtual UART' Kconfig option
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-8-dmukhin@ford.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250624035443.344099-8-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::18) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BY5PR12MB4068:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b1c9fd-a96e-4087-f174-08ddb2e99580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NklIdTh2ZWtJWk5zczN2V2lOTERXR2tmYkg2WjBKOGtXZlNTZzdUajNHRTFR?=
 =?utf-8?B?dHVaYnBGTWl6cnBoLzRQWGpzM0xyQlFjdXVSQ1NBQWFBVWNJQi9UeWFVN0tq?=
 =?utf-8?B?TlBhakUzditIaDJ6UktEOFQyTnRBQUdrdU9vSjdLQmtQUXZCNDhCNjhuNmxX?=
 =?utf-8?B?SUhTRmVsMnIyc01ISUlUcDF3ZkVqeDRJd2U5Wk8zUnRjaFpkeVdYY1ZXRmVr?=
 =?utf-8?B?RDF6dEN0bVpIdGJadWZXeTB2L2cyWExBOWRib1NxOTRlZmNOcHhzNU5ZZTdt?=
 =?utf-8?B?VFdOV0RibHJMVS9Pd1A3emNXaS9aeWRSZGdabkJER2p0bFlyaGdQS0JpR0Vn?=
 =?utf-8?B?cDZQUXlDZTV2WVhLUkU4eDF2QzRveWlUVkkxL0w0Vm5veXJoNWU3NS9sM054?=
 =?utf-8?B?TWdSTzU4ZFZoL1pFYXJBYnR6NWdDR2hteGlac0tvMVhBa3BQay92Tk9xN3V2?=
 =?utf-8?B?WFA5aGVYenFhM0I1aXp5UkJMY1Y2bS80T3FzcDQ5TFBMR1NyRDRzTTFJWHJr?=
 =?utf-8?B?WTA2ejhOMWdTeGUwaWJDRG9jeTg5NXg3cWdMQW9uTnltQ2ZzRFNGZnpkREY2?=
 =?utf-8?B?YWUyRXFoS0pjakI3UG5jamRKT2Zvb1FCeGVoc056bk1xRncva3VDT240a3Va?=
 =?utf-8?B?Vkxmc3gyVFR5OFFsOXVvbGZYaTdielhNVmxBZWZXOXBCQlM4eHZJS2YvME1y?=
 =?utf-8?B?MHJHOW5nMzR6emhBaW5MNm5pTnVabU50cUx2QXcxK0dHWEZFUWlNdnk5b0Ju?=
 =?utf-8?B?dXc3dk1IbHhJN0taNVBicGJTOXdHSS9EcnMxVlRYelpSRWorcGlhZ29UbjBG?=
 =?utf-8?B?YnpCOVZMd3p6amFVc2RiaDY2Z2hCMHlra3RZdzUxWW5GbU1rR2dzbEVqa0xY?=
 =?utf-8?B?UlEzczFZeVYwUnE3STNud1hJSTBwRFgwVFAwNTR6eHlHaEpyUU0rMFZpQTd5?=
 =?utf-8?B?YndZVDZtcG9IdzAvaU4vVHZOTVljOTJHNFZuMlBDNzREK05ISks3UCtVb2lk?=
 =?utf-8?B?Si9GczJrT0ZWdkZpNk9XSmh1NDFXR2g0RTRyckwvc0YrbDlGRGxrajlmVUhw?=
 =?utf-8?B?YUlYamtNVzVielRtSjhieHU2RmZ2L2pOV0ZRRGF0RTBDcjhiZ2djbkI5b0Rs?=
 =?utf-8?B?bG1RTjNLb1dWdWdNdm1zdG83MWxZK2ZWNTYwTE9OOUtmL3hqV0ZQNjNDRUY1?=
 =?utf-8?B?WndvNWFGVDZrTjhDRnhtaVlzNE4wZURKZ0o2NFF2MHMvSjlNYkxTSzM1RVBs?=
 =?utf-8?B?TXhsZ0ZxcmZyZWhOVytPMTVNSzN0QkVMTVgzTXYxVDMzNDREM2pLYmhqd21m?=
 =?utf-8?B?WStUd0N6L0NaSHB2Rm8wd1dmVE40czN5MzY5MVdJK3l4SjZXWGJtaUFtYzZo?=
 =?utf-8?B?em8wdEsvR1hxeUUxOE8vY29lNUprbS9ybFROd0tRbUl4Sy9XcFU3MDB0UE1S?=
 =?utf-8?B?S0ZGbVovTDZBcHZlWWNrRHZFSnVQWjdQdW5nWFFyZkcxUVR0ZkdqVEpobnkv?=
 =?utf-8?B?SHZLWnNXMi9kZjNyYUMyZWJqT253dzNSbGd4ZkJnSXhHT0FpdXF3U2JoUktD?=
 =?utf-8?B?MDhvWEV3SXd4RnJCVjdxVzM1eGM0MHEvY1RYNzdWc0FjZHNvLzlmRlZlN3dz?=
 =?utf-8?B?ODd0Y0lWWkZNN3MxNlo2TVkxWDhlakg2U3l2OXltK05JaVA5UmNuTzg1R3NG?=
 =?utf-8?B?eG4rZnQxWGJpb0hUTXBrNjBGbHZHRExOUjh3dGxWaGVKQndIS1Y4OERwMUto?=
 =?utf-8?B?V1FYSFh3OGNwWnBaS1dWSXE1dGlBSXJEUWR6SXc3QWl1dHJSbDFrWjdtZ1Fa?=
 =?utf-8?B?aG9nTWpXSWRwN1NtbFAwZGtmZXowTU9zTEpJWjNTdjhRVGxycUI5dlNyVGI5?=
 =?utf-8?B?L3YzcjhpT2JkMzh5YjhvbnhTbFpDVHQvUUpQQWFRM0Fvbmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1dISXl2azFtcjcwSlRqdm9VK2Z6eTNKNmRmaTR0MjN3eDUwZU9DTkJQT3ZV?=
 =?utf-8?B?azMxUmhSQXlybEZiRXgzYVVjK2YycjNieERNZnNOUUxXSDJLUFdPTjE2MEdn?=
 =?utf-8?B?S1pXN0l1bFhwcWdTUEJsczZPbEFwMldDK2QxVkErcTNwakJaRmtKRFl0UTUz?=
 =?utf-8?B?UTVLQTJGUmNWM3ZobURYZjc5UVhFS1lwUVVKckc1WXpNVFJGMGl3MFVIRDdn?=
 =?utf-8?B?WmQ1MGR6OC9OdkdKV2tHdGJncXVKTmVuQm5PSmloamxGd2VjNHFrUDA5aE5w?=
 =?utf-8?B?Yko1a0dWOFcvMktzd2RML3dCalZNNVVORStqSzVhZ1pnRG54OGJ1dzRPYm02?=
 =?utf-8?B?NlNpNjFtM0dJMUZxRVBUMTV0cVhyR3VQSWtRYkY0cDNzN2MzWTNmMmRFNDJv?=
 =?utf-8?B?c1R4VFhQWndIbGVFQlRoRVJyeFYwVHNyenhYcFBIVjExQTBnWHIwTGNaZTU2?=
 =?utf-8?B?OVlXU1VYMUJQN2IyL2ZSMXBsY0RjaGdBWEZyMlZVVUtTcUxpYjdRbGVDUWM5?=
 =?utf-8?B?Ymc2a2xTZjd2LzJVdStLSnBmb2grS0l6ZFBBNGN0Tld3TUtRNmhRR1FENmU5?=
 =?utf-8?B?TGVxcnIvcjh6RjY0blZDNDlLSnNqamdEMm94SGFsbkMvZzZaa2FpZExoUGNv?=
 =?utf-8?B?MUowTUdUWVdURzc2eXUvSlh4cFJQa1ZKSUlQb2JkZXl6cWlOSkIzcE5KcGkz?=
 =?utf-8?B?alh5bnpvMjlMWTZtUWxtQm9mK2JFakFDRW1kanFPc05IaFBmaWprMmZhK0NX?=
 =?utf-8?B?OGhRcEVqTXZRSEM3dUhrbW9XVldkVkdHVWZEbzA4MjVKOUV1bmVRN1kvZTBk?=
 =?utf-8?B?aitzNlB2UThKd0NwdzZRenpETUdiUHNGV1ZtWFU5OVlHT2llamJKKzE4SEN4?=
 =?utf-8?B?QUFlcWlFZ21OcWMxUU01S2tQTStUV3ZTeUJubmJKcUFpdDhBU0RuVFpkWGM0?=
 =?utf-8?B?WlZyTXN4d0xqUlg0MG9HTGdXZ2hQNmcvb1crNWpmYW9lYy9VL0hqUExxbVZP?=
 =?utf-8?B?Uk5ha05tTllHNElYdTV0b0hkbGhDb0loR0trU29QVFhGbVZiWFhKWmgwQURO?=
 =?utf-8?B?SEZrdU44ZEtLSzNTODk5dWxzSzNuWjZ1UU9CV1FCbFRJaHJpam5OV2toZnpO?=
 =?utf-8?B?SEJLUVppMFYvUkt5Tm85c1dadWg0R0liZjVBcVJFeHFvZ1Z0djNhU0I3L3NW?=
 =?utf-8?B?cHlFdTFXQWRsYUJPSFczeG5YS0hHQ1lWbkpnRlRFeGtFenI3Um5VRTQwdy80?=
 =?utf-8?B?NHlBZUJoM0I0K1dsV09PRkJGZ0UrbkEyL21KdjFVKzYzeXFuc3ZKeXRiNW90?=
 =?utf-8?B?cXRLNGNqZ0hRSkdHM0hWbm1iR3J0b0dMam1iV3BhSUkyWm1kMHg0ZlBxc001?=
 =?utf-8?B?Mzc1NXZ0aVFCbkZrb09wbkJiang4YTVPckNkKytsYk5QTmtKcjlTZUV0eGEx?=
 =?utf-8?B?a0hFcmNHamxXTEozNm96SVRmR0sxVWZXbkdVdExZMFpqQjlIUDQ4TzFoakN3?=
 =?utf-8?B?UW1YOEJ4YUxDTWxaL3h4bVY3UmJEVXZvaDZtb2RVK29Kdk00Ly9HeHFWdUVi?=
 =?utf-8?B?ZHJjWnVPT1FMV0FpUXdSYStUbHphZTNjeXVzeE5mZ285V1FRZjJWa3Y0THVm?=
 =?utf-8?B?SUxkVEVyaXRHZlJGQ3pwSVJiLzZQMm11eVhIaGRGUDVuVmlXY2VuQ2NNNnpK?=
 =?utf-8?B?NjVnZEEwYS9IQlc4ZkN3dVJPREt2MHVCNEl2ckJhZVcwUmNJRElKdWx0Yi9q?=
 =?utf-8?B?L1lNUEQzZEZBaVdZUk8wR1RyVlZZYkVITXJCMnZ1SUxsMVhFNytnQ0RhbzAr?=
 =?utf-8?B?K1hCbGRaZ0FlN0ZBbm96VEhtMU0wVy9UYkxmaVFmODVPKzhDVWxHVlZsSnZt?=
 =?utf-8?B?NXZFck1vblIxSmxDVlRjS3JIMGZFR0tjNGswN0ZUR2ZQcW9DRnR5WW5NZ0ZE?=
 =?utf-8?B?TWFRbm5iSkpiMjRMaTdubzJSK2dObHc3Z3M4RWh3c1FkbmtaWVpFU1k2OHkz?=
 =?utf-8?B?d0lvbDk1WTBXMVp4TU1wUmpOd3hWbUkweCtRZDN4NGpHMXJ1VkpKZzY4ZzdD?=
 =?utf-8?B?U21ZaHp5QlVWUVdtZUwrM2dpQkRZZGppOXQ2QXVEcmRmWG4xRlc5UE1BQU5j?=
 =?utf-8?Q?bKXmBz1aq7T+e4ZocR9kPC9O+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b1c9fd-a96e-4087-f174-08ddb2e99580
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 06:37:26.8178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeIJ0pEwV+1XYGzVGrdzOD30iCv+n5ElSnxSBVyQ0PGYcxskuMK2NEIGfeVWyAXZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4068



On 24/06/2025 05:55, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Rename HWDOM_VUART to HAS_VUART_MMIO.
> 
> This emulator emulates only one register and the use of the emulator is
> limited to early boot console in the guest OS.
> 
> No functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/arm/Kconfig              | 2 +-
>  xen/arch/arm/Makefile             | 2 +-
>  xen/arch/arm/include/asm/domain.h | 2 +-
>  xen/arch/arm/vuart.h              | 4 ++--
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 03888569f38c..b11cb583a763 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -177,7 +177,7 @@ config HAS_VUART_PL011
>  	  Allows a guest to use SBSA Generic UART as a console. The
>  	  SBSA Generic UART implements a subset of ARM PL011 UART.
>  
> -config HWDOM_VUART
> +config HAS_VUART_MMIO
I personally don't like this change. The current config option name reads much
better and clearly denotes the purpose.

~Michal


