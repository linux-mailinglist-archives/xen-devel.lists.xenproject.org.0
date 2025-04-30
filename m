Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57C8AA437F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 09:04:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973429.1361559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA1Ut-0007Rh-BN; Wed, 30 Apr 2025 07:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973429.1361559; Wed, 30 Apr 2025 07:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA1Ut-0007Ol-80; Wed, 30 Apr 2025 07:04:47 +0000
Received: by outflank-mailman (input) for mailman id 973429;
 Wed, 30 Apr 2025 07:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5DpC=XQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uA1Ur-0007Of-NB
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 07:04:45 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:2418::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 641300dd-2591-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 09:04:43 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 SA3PR12MB9089.namprd12.prod.outlook.com (2603:10b6:806:39f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Wed, 30 Apr 2025 07:04:39 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%5]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 07:04:39 +0000
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
X-Inumbo-ID: 641300dd-2591-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkGjN94J6tev/O6Re/NW4zwlPiVn2A4O6nYlUkjdAhAHycPGk66QA+duVrX0+QOpDbTZ5fHj5KPb2xmVBCsNwlsKLan0oYyBXSKsN10GZmI4F4GbU5iKGxLWNasgsNTlugfwlmLkzBhZ3HUbxlrIuTAPrTZyWbj1pDMVxgb5WxltwKA9npopmDEO+ZpxmqA6JYx5B915Y3w6nt5Kk4lawckU2woUsBECnnSk48j067vQz6kXaeZKagSrv+vGdna31GDeNhCIq6XJeEtzThW5IQArMYI/Mn+BBseMYgjERHC6M6nnKsN5zA88qKZkZPd5OI/VVwMcx/rcULLq1UvB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUKJOlf1NiocCmOfa2JBkysEc805oMydbC9+AHAzmzA=;
 b=XZQLpmvZaDb2gJBCjm256472gc1iM9fjaTgABEIfAby7a6ZBbMUkPA6ldXUgw9+pBVUjhyL96AwXsJqARZdraCr3Yvnu3saZ33Qv3V9ovLYO4rDgGvJA4wWzW/sQefJv1TKWoxI4+nl7vqIy+gRZbmpIHZa/TdxS3hfrOrGupc1MMB+ZDI76/HmD9F1YRMXx8zKDliK6PWFwF5+8GOkJdEOuI4yBbdXeQHyi20uAGpSlATzgndj/bdEaR6QmQW00ZeKdrEEbqF6WYbopTZLPxM1yBM7LKbtWwwBBbw4en7ccyKoUZ1jql8nptbK3HfkJTmt/wDOHvHT00y+TrsJOGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUKJOlf1NiocCmOfa2JBkysEc805oMydbC9+AHAzmzA=;
 b=liStCahPKJBrxUSh3xZvGKfebkYVRob7Xhuc+E1CSw+VS9unNC76prCtg0/qtPKliCOPZdoaWjPW/Cu9fJrg6vznhDC/ckeVDiVf0y+2R7/H1OYs/OZDpxNGcsBmvudNMVLarN6gBEhOygX/r0pcd7BjDdH86dYPJOv7IMHciv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <bc825300-1a9f-4cab-a0dc-f4f354a0cc9f@amd.com>
Date: Wed, 30 Apr 2025 09:04:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] docs/arm: Document Xen booting protocol on Armv8-R
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-2-luca.fancellu@arm.com>
 <a78219d3-4872-42ff-9588-53a65a6bba74@amd.com>
 <BCD1B005-3231-4542-9574-A269F4DDBBF8@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <BCD1B005-3231-4542-9574-A269F4DDBBF8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|SA3PR12MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 415a1a4a-0e6e-48dc-a0d8-08dd87b53b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2dscXBLeEk4KzlPS2l2S3kyRDQ3b1pIY3JjelBTclYwZzA4NUVYanRnMysr?=
 =?utf-8?B?eTBnaGJkcVFTajBFeCtzSVBpb0owQlFJbVJqY1dra0lNRFViUTFIQVVpaUxY?=
 =?utf-8?B?RUJCSDJvWndKa3E4QjFwNHduN3pqb3FvWkdWdjlnbENCeHBqT1MxQTN5SkVl?=
 =?utf-8?B?dHNRejZkSzB4bGFXY2pVNzNpL251MkZXcnptVmdoUGtVMXBOVW5iYjJLWll5?=
 =?utf-8?B?MVlnRUliNkg2Mm5IZ2xMUmhGTDRZMEpNUWxGQ2pDNmordUlYU3pXTUtFWCtO?=
 =?utf-8?B?aG1JRTFMazdFUWtqaEU4UDhzbHJDb0loSm44WDZuUERwWmpxNmxZZmFkaWgr?=
 =?utf-8?B?NWxLYVhyVkFNdzJWUXhvbGg3VEd6UjdyYzQyNXJYRGh6aG12Zlk2bWp2QjZs?=
 =?utf-8?B?ejZyOEpxVUh6S1pjd1hLeENiaHd4dWQ3SHVlamlhNEl2dTR5WlNybXdTcGtQ?=
 =?utf-8?B?SFRoNys4cFA4WmpETXE1c2JRT2RPaERLTG8zbGE2NVVReUo1a3kvM1poc3Jj?=
 =?utf-8?B?Qy9ZWEFNb3hQamFsZFFrQ2JCS0ZQNDNXUjVNaGNTMFZQL1Y3bjdkNitITmhM?=
 =?utf-8?B?bFlreWZOZHlDQkl0UkxVbWJaYVdTb0RTMWFIQmVUb1FiMzJaZEJuVXFSZFUy?=
 =?utf-8?B?Y0lNdVRNN2lHRzJYbHpUWW1vLy9TVlVOeHZVSnVYd3JTbE5hQ2FMUEx2WHlk?=
 =?utf-8?B?dVRydmttN2hwRVpoa0ZFNXhCMzZ5Vnc3ZEJuVkVQakdTaTBCYjFPekVjbTlI?=
 =?utf-8?B?SE9weUxSNHpUZVV2R3h0L3lyT3V1OFg0REFyU25nMnFsU3FXS0NZdEZoZ3RJ?=
 =?utf-8?B?bFdPSndtZ2s0VDV6aXdyd0M5L1Z4ZElzajBMNHRYM1dQMy9tL3hENVp5NWhj?=
 =?utf-8?B?WCs5Mlg4aERmNHM3dFZoeUQvUkZzVWoreGM2Wk5SZ01Jb3Bmd2NEU0pSa0o3?=
 =?utf-8?B?UkI4NDVVWURVRzN1SHd1N2YwcXkzWlQyZTZkaTlyeHpwMEhhYW1vZFVyWHMw?=
 =?utf-8?B?aGNET2h6dm5uS2FyZkJ3UzViTUdkRVRWdmF6K3V1K1RjTi9oVjl1ZXovMVBs?=
 =?utf-8?B?OVUvMGhrOHo1RG1wcThTSjZyTUFqY3RxVlR3NzVuNStRN3B5SkhTRTloQWRF?=
 =?utf-8?B?eFcrOXUxVWZ2OFA2cG9KWWpnaEluUUl1QTFXdTNpVEtiMjBrYjNnNlNPM0Zr?=
 =?utf-8?B?cVh6NE15dEE0bTZiKzF6c0xSdE1VNndWQkxtOXVyU1pVMmIvamlkWldHOWNy?=
 =?utf-8?B?VkZ5NlFJNlNaQnRqUU9pNGlVNkZ3cE9KOU13cDZtZlZyTXBWMjJxWS9oWmZR?=
 =?utf-8?B?MXNUcmtmMTdqWFJMaWtucXJJMW15ZXNIeVEydVFscW9ndkJvYVhVelFRd1A5?=
 =?utf-8?B?SHRNV0tqbTZuVmY3U3I2VXd3MTI4Q3JMd2xReitvc1ExOXFjemdPWmdQS28w?=
 =?utf-8?B?M0N6eG9reFBjNmZJTTNmajlZYmJSdXNFL3JXYTBvbTAzTVM5WG1MazRuTHpk?=
 =?utf-8?B?REFtem5pdmFmZlJtNWxYSFFtTmFVTHBHRU13Y2NKVjMrZmZiSVNqWGR5eXY1?=
 =?utf-8?B?a2xzREQ1aHBnY2dvQVNOMVN3VWt4M1RpTms0TlFmODMvUjJ1Zk5kYm1iVHpY?=
 =?utf-8?B?V2JRQWoyTHRzR1NBdDQyMzlhcVFZNUhCN2pXT0k1QUwyVW1LNkdDNGUxOTJD?=
 =?utf-8?B?YllubW9KRncxRHliK1d6WlZwdTF1ZHN2SjZuTUI2THhmWlJhaitaN2ZGUjRT?=
 =?utf-8?B?NUVFN0J0U1IyYUVNYmJiSFROWHJaVE13a1orbFFpR0hoWjY2YW53dGFtRTZq?=
 =?utf-8?B?ajdpSDF2U1pXbWh1bmVBa2lqaXo1QlFZbmV4dmpTbXAwZHNjM29lUjNuc24y?=
 =?utf-8?B?Wnp5bUN1eEFDbVFCa1hwN09vSnZDZXVsUUtvSXA2ZmduMEJva0Y1bmcrSGlU?=
 =?utf-8?Q?aBpjPAa3URY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUJmRGQwSXcvRmVWaGRBQjR0ekJZOWNvNW4vTjc3QU5POHVZOEYxZ1lSWk91?=
 =?utf-8?B?dUc2a1lvMlhTUjhYRktDRlQ2cDAxN3ZFV0Jja2hWeTQvQzQ5MlkweWlXdytx?=
 =?utf-8?B?SFBhMmt1L2hWSERQUGhxV25WSWdxeEcyMzR6dS8zY0s0dzZHWHc2bnF0Nkk2?=
 =?utf-8?B?SERpZ1ZYTlVMNlJsdmpGMEY3YVpXRDJVQ0cyNWFsMmNod3MveG5XOWgrRXQ0?=
 =?utf-8?B?UzM0RW1EUlNCQXpaVmI4YnNJTlZJT1pIY21zL1BIMkYxa2p0cmI4cHdFS3B2?=
 =?utf-8?B?SUxWQnkwSHNOV1dwc2RqUCs5SC96Y3g3MWZtVi9yWTdYd1BVRnBWWEVEZUpE?=
 =?utf-8?B?ZHQxY01sS0xuUHlmRXByUVpHb0ttSURCUzlWMjdjZzNtS1plTWRQWWRjdXds?=
 =?utf-8?B?MkVSUlhiRkpTUUVkZ2N4UHg5eldnNzE3MnlJTDQwQWxTZ0hxMTFDYW5ZdVJL?=
 =?utf-8?B?c0ppSy9qblRSd3l6dDR6dHFZdzFZeTRUWHBZbFU1OHhhWnFBZURXbnMwcnE5?=
 =?utf-8?B?K0JJSGFRMUt4a3l4VlNBTExRVEljdFoweWJ6eHFqbGNsanJsc2UwbnV1VmVU?=
 =?utf-8?B?ZkMzSGUyVU5iY1hiNnlaMVVBNU5GYnBPcStETGRmRzdSNk9yckJGUVZKN2NW?=
 =?utf-8?B?bTRoVmw0SEkzT1Bqcjc4OE8yYWZGRGFkZ0JTVXFYcW1vdlhsZ3Z2TTliTTNs?=
 =?utf-8?B?SWQwVEd6Smo0YjVVUENUeXI4d0RmL2Q0U0pzbFJPZWIwa2RIZUxneEJjRmx6?=
 =?utf-8?B?aWl6RUFVcGlER1FOdHQ2d2FxRUtLSGY0citoZSsxWHdhUE9VY2l3REt2cjhM?=
 =?utf-8?B?aGdZc2ZvVDcyUTVuK1Y2VmVtWnhMNWh4MkVZa05GaDNCaHA2bStSOExvenk1?=
 =?utf-8?B?YTdUUndBQUxPdXN6eklCSXdUcDFhbUF1RWppNUIrWGhIalZtNjlOTkJJM0tD?=
 =?utf-8?B?c2UrMHgxdXovalhpbHB5elJORG00akJ4eFduZlJReFZacnFISnlDenVicXBt?=
 =?utf-8?B?a09pU3ZocFdGUzV3MlgrVFI1bHpyM2tucFJoekcvZlkrSGovUGtiZnBROWs5?=
 =?utf-8?B?ZTY3V1ZZRmYzbUFEekxPanN6SFkwdkdmbmpDSnRpMmxOQTVWQWdKWk9FZUpo?=
 =?utf-8?B?dnYvU1VsZExMK1drOVhYQ1B5SjNNTldhT21xcVZPVEJKSWpZSVdPVys5RUYv?=
 =?utf-8?B?REI2dk42bzVxLzFXSE4rVmhGaXlzZnJrSkdIeXIvNzVyb0hFR1hvazBGQlB4?=
 =?utf-8?B?WmJMY280NkJXOHBndkRyd0xkYWpJc050RFpnVXdoMXN6MTBIV2szYVMweVZw?=
 =?utf-8?B?MmQ5MDdRWTFZT3dvbnV3Sml1aUxWeWh5V2MrVDNvRTQ4ZjIwRnJkY1o2NUdp?=
 =?utf-8?B?NFNsYW5zNmtzYVZsb1dZdkQ5TEdvbU56T1VPZnJTNVdBb0FOK3hwejB2dWE0?=
 =?utf-8?B?cDlXMDI2RWRRQTE3NVIrTmthUktPYzhrOHk0UTc0RWl5L0VtdjYrYkxFTEY5?=
 =?utf-8?B?eWJpRGRKWHVWbkxabXkyTlVGTWNTR1BWcHZ2U3F1a0dpZEVmTjdoeWFGNmxz?=
 =?utf-8?B?YkZveHpFQ3dKbm42L2tiak1HT3VjTko2ZWhIWlVRNUc0ZHdHTnBVa3V5NlVn?=
 =?utf-8?B?d0YwSDNudGpkajd3cjUrcFZ3YzZhSlplZFJmZXNqbTZ0c01RTVRmbWNTYldy?=
 =?utf-8?B?ZC9QNHNVYkxkekY5eTZ0aXM4cms5NmdOWDRXbWtET2NxSG5hMG91OHh6MTRZ?=
 =?utf-8?B?QnNuN3dqcUhuV0M1WHVsMEdmc3dCZkRuTW5VYjArc0lXcXlZTXI0QVE3OWdP?=
 =?utf-8?B?dS9YSSthamtCNFBQVGtQYjRHOVBMN0grVkxiMnFtbWtkaTFCNEp3L2NmWmJq?=
 =?utf-8?B?NmVBT3RlZlVHdTVTVytkNXdLMTlEVzFMKzlUZm9vSzN6QTRabjJrMjhZOUJx?=
 =?utf-8?B?a3Z3ZGdNeEdWbzF0S1IwcVR0V2FDa2wyeU5qRWFjeHVHWGYrdnN6dHVIbnVy?=
 =?utf-8?B?WDVBaFZLL0wyVXVIMFVIdVlDcmNIU3dIM2ZGRlkrWmYwNVpQVEJxUWRTOXd4?=
 =?utf-8?B?em13aVd5UkRMN25YTUMwUUV2QXVCQ2ZNc0wyRXk1dEJQTVJMOVltTGNadU1n?=
 =?utf-8?Q?EuV48ihSS24rv12nEH/4i0OHP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415a1a4a-0e6e-48dc-a0d8-08dd87b53b8c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 07:04:39.2390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xknouiJfuhVKPBD11S8NQb3DQcXtb0RIVc65jszpeM3pRtWrAgiqhWEdzTT1myrl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9089



On 30/04/2025 08:58, Luca Fancellu wrote:
> Hi Michal,
> 
>> On 30 Apr 2025, at 07:37, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>
>>
>>
>> On 29/04/2025 17:20, Luca Fancellu wrote:
>>> Document the requirement needed to boot Xen on Armv8-R platforms.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> v4 changes:
>>> - New patch
>>> ---
>>> docs/misc/arm/booting.txt | 8 ++++++++
>>> 1 file changed, 8 insertions(+)
>>>
>>> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>>> index 21ae74837dcc..719af74f1e69 100644
>>> --- a/docs/misc/arm/booting.txt
>>> +++ b/docs/misc/arm/booting.txt
>>> @@ -62,6 +62,14 @@ Xen relies on some settings the firmware has to configure in EL3 before starting
>>>
>>> * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.
>>>
>>> +When Xen runs on Armv8-R, the highest exception level is EL2 and the only
>>> +available state is secure (S) on Arm64 and non secure (NS) on Arm32, hence the
>>> +above requirements need to be adjusted to this case:
>>> +
>>> +* Xen must be entered in S EL2 mode on Arm64 and in NS EL2 mode on Arm32.
>>> +
>>> +* Xen must be entered with MPU off and data cache disabled (SCTLR_EL2.M bit and
>>> +  SCTLR_EL2.C set to 0).
>>>
>>> [1] linux/Documentation/arm/booting.rst
>>> Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arch/arm/booting.rst
>>
>> Is the goal of this patch to only write firmware/bootloader requirements or
>> accommodate booting protocol in general? Asking because in this file there is a
>> requirement that Xen should be loaded below 10TB which afaict does not fit Armv8-R.
> 
> Yes you are right, but I think this still holds since we support 1TB on Armv8-R at the moment?
No, this value denotes max RAM size you support and not where Xen must be
loaded. On ARMv8-A, we support max 2TB of RAM but require Xen to be loaded
anywhere up to 10TB. Do we have the same limitation on ARMv8-R?

~Michal


