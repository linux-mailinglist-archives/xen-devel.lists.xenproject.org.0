Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94357985DE0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 15:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803956.1214797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stRyN-00065x-9j; Wed, 25 Sep 2024 13:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803956.1214797; Wed, 25 Sep 2024 13:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stRyN-00063p-6s; Wed, 25 Sep 2024 13:22:27 +0000
Received: by outflank-mailman (input) for mailman id 803956;
 Wed, 25 Sep 2024 13:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3eZ=QX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1stRyL-00063j-1E
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 13:22:25 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2413::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 317ce7fd-7b41-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 15:22:22 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by BL3PR12MB9051.namprd12.prod.outlook.com (2603:10b6:208:3ba::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Wed, 25 Sep
 2024 13:22:15 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 13:22:15 +0000
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
X-Inumbo-ID: 317ce7fd-7b41-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIWFC7ETHfvHTSdcncCsqRF+/q6A44ezh0hGapCakzdRGxsbqnjwKp+WJjqhVDqHsW5MV1c7BC2RXlEmWB2r39k6raM+LQFEr/p+dMUt/ZmxF1vjjYfemLW/RSmDCxYsDgIPDBrYnSnJ4kCzwzrcCU9jaiVoFNxsKwHRZ9PteGy1S3M5y5eegNisyiCAAAQSgFNs2WMrEjScGg7XBAFINVlXU6bRM8O44DNuSjkr8em/yZzbtiTr2fiy8zaFKU9Ah36USjfZwq686Lcoro/EWB03Ybl5FwCWexLNR0V7GrkO2zpY/XTQZEGlOjwH5sHqwFay8H1kH3N8Cs6ddAuPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiifGkbK3yvGrH6M+9iSQQItBXbzkLqONO3Xkb06fqg=;
 b=fbnLQSHkfE6ZnCQ4txIyyz1fg97NjnIHVHNpysraHHzN/KAjwHJl7W1wlPKVYxd74FOXCFWW1eBQBN+SleEs9tGP5oNwDqcutlwGl/rexgR8fOAsMwlZwxCbruw7YDfdoqubtcMcQaoBopuEhciPkIFU60MkPGMaHHdvy2fx7jCDLXKgtmKHKzW5ByIE5QRGz26NNb53x3CH+Cl+ZP/6Dz6mveEWoAp3Cq1PdQz4jcEAPhI1IgOplYaihVHyIOYOsFTxoUKM6zjEFcejK4jAGkQtjAAiV3TAfFlz4Ya16vmgCorOcs0Y/1mLBVz/27XP/IiEF3IWE2lKeOSAi0PVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiifGkbK3yvGrH6M+9iSQQItBXbzkLqONO3Xkb06fqg=;
 b=rAlGpsYGI5J17I+jnV/8DNg/ljvjsv6iz2zK8fKmtJY1lD95FwDkIA6fcXwbHe4vaW47+LOxr5pK+4zQ2r0cgyB0VL4bUNdpVTl8m+hdLxzpu0MZTtgwMS8GebP117nxRiVu4t1Ij5uSCdUEpje/pHT4na7t0IPSvi1Bn3z4LBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <edb07929-32af-493b-91e9-debe06be4bc3@amd.com>
Date: Wed, 25 Sep 2024 14:22:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-4-ayan.kumar.halder@amd.com>
 <e515dfb1-efb6-41a5-85a4-65ec7e9c60a6@xen.org>
 <04bcb27f-8139-43ed-839c-1febe2eb5a13@amd.com>
 <59432427-950d-4667-aed9-1caad33d7cf9@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <59432427-950d-4667-aed9-1caad33d7cf9@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0330.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::11) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|BL3PR12MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e44294-a03d-4fd8-d3d4-08dcdd651292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dG43N0swY0lqUy9QcjhKcWVyRFhQMVRqb29KMXg2QXlpajJqVG8rR3E1SFUr?=
 =?utf-8?B?UThDemlvZ1BxR1ZlcmxTbitSOUZ2RHpGZkZwdGRuWncvd3FzRUw2N3JJZUI2?=
 =?utf-8?B?ZmVNNGNMQUE0aXNyOXJjUERJQzh4M3pNak1YSi9NZllLSDl5a0RoWkV3RjJi?=
 =?utf-8?B?clR1WlVLY0FBSFAxN3M2T1dKT1lQQitFL1hsS1YvS1daSEdiYkM4MGtvVkJB?=
 =?utf-8?B?bDRqb0pCRTdSRkthWnRnczdMOExQS0MrQWRMN3RXbTJPcjB5WjBnR0RPUlp2?=
 =?utf-8?B?YUFnNUNWQVFqcHNhV24vemlXMDBYYStQM0VqamwzNmJpdVVucVppc0dtaHdL?=
 =?utf-8?B?VmFOaHdEWFhvZDZrNXpETXk0UC80RnIrS1ZIbEdPR1c2U0x1WitXWTZzc3BX?=
 =?utf-8?B?WloySmhxdlVKalgzREkzdU9LNHdoOFFnekJ5aUNHMHNZV2ZEaUNwOW5uYUNo?=
 =?utf-8?B?c3RtRkFwMGs3RjVYN2NtNHQ1YjZjWHVTbVlkeDd1NGprNGpLa0pkWXlvdXdQ?=
 =?utf-8?B?cXVSSDA5YVhiS2xuQUhGNStLZHRKblRwVW1rNHc3bHBsc2R4L2QwV3lhWWUy?=
 =?utf-8?B?Tk1UeUhuQ0J1NjYzSjZ1YTJGSXI1OWw3QW9xbWxoRjV1S0tmZXMwU0o1MktH?=
 =?utf-8?B?WHdRL2t4WDIvOWlVV2FZSzdFWnhlc0YzSzVJRGRnNEVZVFhuUlpmNllqdDRM?=
 =?utf-8?B?Q3M5VmN5OFladjlhTFRGQUN0eXhTMWlnMjdvaEZ5SHIyR3pXL3N3bnVuaHlV?=
 =?utf-8?B?V0N3K2dkNFpGa2RzVUc4RURPRFJhTklUYTZ6SkZjR3BEQyt3K1ZFdDBmbElt?=
 =?utf-8?B?Z2ErWmp1cDBqMWlIc0dlTFl5OGFYU1pDOWpBOWxsZTBFSUh2ZVZJOU85b1pL?=
 =?utf-8?B?b1AwYVRtWEhxT211MWhEem03azlEU1RFWjlPVkpTQkZ1SmlCN3dySHorUVU3?=
 =?utf-8?B?SmJTUHdhMkpSdnFiRy84VSthR1VhRzEycU9xeDk4bGFnOGlNOW9sWVBUWUFw?=
 =?utf-8?B?eHFMaEtsK1ZhMVB4OFZZZFZLWWxiTjBkZzlIZ1p6THBjL0RyYUdIY3J2MWx6?=
 =?utf-8?B?ZDNnM1h5L0J5WEZoVStGblZzQzZWOFY5TmlqT2thK2JyVlZIWG1FajBieTE5?=
 =?utf-8?B?SURHdzdyb2RpSWZxdTcwREZUNHk3Nm5mVDdJTWRVd2JpWnhRUG9GNldqZlk1?=
 =?utf-8?B?UjZ5UkVqM0FjNHRkRDRqOVp6VHFJM0VJUWtwWEVETDZvMk4rNk94Q25WaE4w?=
 =?utf-8?B?RUNVOWZ0cFNxc2I3SEpMR1ZXajFPdHZGTWhiV1RBM25YaXhac0N6cW43b3h3?=
 =?utf-8?B?bEtTdDI0bWljOUJjMWNjeFBLNGpVV0pyMGtkY1V0MkJJY2FiSllzQ2hjQ29T?=
 =?utf-8?B?SHpXV2p2REQ1dFdvdkRkRGlQZXUyTkdhTEpUN0dhLzhJYTFlWEIwb2ViOU0v?=
 =?utf-8?B?WDVFdU5jZWtNYUxsMTdTUE9sdVhTN3dHNjNGd3hGZ3psQUFXdDV5S2dIRHFp?=
 =?utf-8?B?dG1MbUt1ZVJnbFpTR284aTFEU2dXeVRodFA5VjNNbDlwTW9WMW1ic3A5a09y?=
 =?utf-8?B?LzRwaExmV2JicDBqdkt2d2c5YXV4UEZYa3pMMEhPUTVrUEtWaGRNaktPNmIz?=
 =?utf-8?B?SVZnU3h4eGQ1dHZ3ME9mbVlDWVNOU0kya3RQaUQ5djNGOXdYZ1lYTWRES3BQ?=
 =?utf-8?B?UVh4cW1VS2xuUlZaVnU2R3JhV2hzQUxKYVNDM3JIUFlwdkxhdEY1cS9leVE2?=
 =?utf-8?B?QXp3TTFpNklJZ3dQQkM3ZUJ0TWJsNkhZQmlzS05TcThkc2toVnQwYWVXTWxZ?=
 =?utf-8?Q?IUwyGP4R0JWYOKn8d6aE7QkFSFeVQ9PLtlzNE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnZFMnNtbmp6TXUzZXhTZys2ZVVoWVZlT2tTMzV4UDlNZXppUEdaaDlLU1JJ?=
 =?utf-8?B?clB5dHZYY3k1cmlZTS9nc2dlclhKd1BlNXcxenlxQVdjOGZkNXJaS21WVHEw?=
 =?utf-8?B?VGE5WUc5WUdIdyt3TWNoc21ac1pxWlNSM1c1ZWwrcWhBVzVrMkZtVFZVcSto?=
 =?utf-8?B?YUhoZFc4Ni9FNmZ3M2c4TmoxSTk2Z3NodzU2NnV0VHRsSXRsTVpFd3NqR0Fi?=
 =?utf-8?B?dkNmdGNwVzliY25NQ2ZlbjJRdHNJWlI5bDNCczhnQjU3SWlubjNiUDFiWWVF?=
 =?utf-8?B?eFd1elVNYkZXeXEwbnJsZ25udWltcitVUXdkZXZKbWN2QVUyeWpOaVViYWpK?=
 =?utf-8?B?ZnhyVVlobHhlTnFVWnZJY2liSW5ZTEZoaTUydnNBVngzNWIxd0p5ZFJySElY?=
 =?utf-8?B?SnhLczBWeE94MUtoYVkxZlc0MWhZdHE5dVBWN29zeHpDZTFpR29QZEpMaFNQ?=
 =?utf-8?B?M1hBVXh2ZXB5aVM5Njl0bzAxQ1l3aGxRdzFmWDdNdnNyeW16VEFVbkxqVHVr?=
 =?utf-8?B?Qk5qckRuaUhDRzVSTXFEaGxEZ3dGZ3U2ZXNBUjNoeTJTa04rOS8rM3hjdE9z?=
 =?utf-8?B?SkpOd2dycTY3dGVYN2JNNUpVNEVJTTlhV2pxTTNydmFELytUcXRScWFFdmMz?=
 =?utf-8?B?cFB3cGhUaU1tN0NFVVFEeGxMM2p4UENPVjdUSS9aWmtrWHNZa0FBNzVkb3lE?=
 =?utf-8?B?QXVxS29iMUFVUE1ESGtncDMvUG94TitxaS9mYmM4c0JxVUNtWnVLZ2NHTjg4?=
 =?utf-8?B?U05pbnREdERveFc2UG9mcXcvWVU1bk9VWDN3K2tPSlUvSjA4TzQrd2IrZGEx?=
 =?utf-8?B?Z3RRSmY4Q0Z6UDN0c0hZdGMxQjJyTGJHa3JaMFhFU1NXRVlIa2VOQU5BWmtl?=
 =?utf-8?B?Vkw3bW5sM1ZZV0xhSzRrRVhEbjFoWXhmV29UalVRQTFHb09xb0R4N21HUTA3?=
 =?utf-8?B?OUtPcVNoUGNPOG5WQXMyUzN5S3NBM1FYS285M0hDYUFPcGhUME9zbnFhV3Zl?=
 =?utf-8?B?U3VEQ3p2b0tlQkcwYzlEYVR1Z3VnSEV2Um5EN3V2MHRxMkVwU2xLRTJJVWVJ?=
 =?utf-8?B?ZUFoQWl5UjM4YUVacnVSU1pSMmZKOUY1QlJUc3JSTTUyS1pSZDhhdzFCR0Rz?=
 =?utf-8?B?RDhDcnFBNGQwUG1WRk40ejhlOWlIYjloVWJIblFKNzN6VEZxZ2c3QmNlSWpD?=
 =?utf-8?B?WnVnUDc4TEREb3BzNHQ4VDdnenVLM2xtT0pnRjBDY2ZJNVVTdVZZSlBNdHA0?=
 =?utf-8?B?RTh4bHVqUlVQSHVvQ2VWSWpnQXFIYjU5ZHV1NlgwZWJZKy8zSXpMaWNNbUdy?=
 =?utf-8?B?TzZsQUIrUUhiRWJlSFF5RE0reWV4eWlrWDRkWW5mK2VCY2FBZGtYM0EzN21W?=
 =?utf-8?B?UFdnWkd0aG4rcHBaTXhVOXUvd2FqVWdZdUtwTGxTNDhkdGNMMzJIWWtnWmt0?=
 =?utf-8?B?bWpicSt3Zk5QbTVmeHhOREl6bTE3ZXJDMjlMUUUzVStGSG8zcG1JckhyMytk?=
 =?utf-8?B?U0tzUlJET3lNaGtqMUNzVWgrU05NT3lBK1JuSGtPc0g5ZEh1emo1Q1p5TkdH?=
 =?utf-8?B?R2xybjUvT3hkOEtiNHFBV285bWNxODdHbW1LQXR0T1dTdzJPTUxsVHYrS2lM?=
 =?utf-8?B?blBsS0lROGE0aXdiVlVOK3Q4dWZPOWJDeXBESDJvSDRpUHlRRHo5ZU5EemFl?=
 =?utf-8?B?dXdtWkJQcTVCT0R0QTBmR2hRMk0rUzZZOEc3ZEMwczJTN2txVHlMaGFxREJB?=
 =?utf-8?B?ajcxb29XNjNEZVFrYk9oMWhmTTNqcEZONFFpTWJwRTYyZHlGZmc0WVRwNUd5?=
 =?utf-8?B?R3JycHJhTkZvd3I5WUNwYTF6a1JZWHdlQk1DTk1hOFM5WVMvYzBPeGUxTWdx?=
 =?utf-8?B?b2lXOVhNcFBWcVd2amM0UUpsdEVPY05FTS9YQXlGWC9JdmJ4ZEdpQ041SVBM?=
 =?utf-8?B?UmYya1gzMTJpVzFUZ3VvREI0RG5UdElvOU1ta20vc1FrSU1Bcy9ONCtYcVcr?=
 =?utf-8?B?aWpIVVpINjRDYlRqVUNCUW5hTE0vckkvWjBhMkROMEc0MG50bXlRQWVqR0Qx?=
 =?utf-8?B?Mkt1c09reWxBcldOWExJRER5SmdmOGFETWRlNUlUZVQ3MTdSeTJiR09vM3hv?=
 =?utf-8?Q?InEn1sEtz5Gh07G15PeUl3Ame?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e44294-a03d-4fd8-d3d4-08dcdd651292
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 13:22:15.4424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61cI8TmfTkUhUR3N7Ezzl69f8Gvau+pDac+MxmPasLqsrcyXqlPR1Z8xJG9vTQiRKoqo9DnCYLkmvpV26Ov0Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9051


On 24/09/2024 18:10, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 24/09/2024 12:32, Ayan Kumar Halder wrote:
>>
>> On 19/09/2024 14:16, Julien Grall wrote:
>>> Hi Ayan,
>>
>> Hi Julien,
>>
>> I need some clarifications.
>>
>>>
>>> On 18/09/2024 19:51, Ayan Kumar Halder wrote:
>>>> Define enable_boot_cpu_mm() for the AArch64-V8R system.
>>>>
>>>> Like boot-time page table in MMU system, we need a boot-time MPU
>>>> protection region configuration in MPU system so Xen can fetch code 
>>>> and
>>>> data from normal memory.
>>>>
>>>> To do this, Xen maps the following sections of the binary as separate
>>>> regions (with permissions) :-
>>>> 1. Text (Read only at EL2, execution is permitted)
>>>> 2. RO data (Read only at EL2)
>>>> 3. RO after init data (Read/Write at EL2 as the data is RW during 
>>>> init)
>>>> 4. RW data (Read/Write at EL2)
>>>> 5. BSS (Read/Write at EL2)
>>>> 6. Init Text (Read only at EL2, execution is permitted)
>>>> 7. Init data (Read/Write at EL2)
>>>>
>>>> If the number of MPU regions created is greater than the count defined
>>>> in  MPUIR_EL2, then the boot fails.
>>>>
>>>> One can refer to ARM DDI 0600B.a ID062922 G1.3  "General System 
>>>> Control
>>>> Registers", to get the definitions of PRBAR_EL2, PRLAR_EL2 and
>>>> PRSELR_EL2 registers. Also, refer to G1.2 "Accessing MPU memory region
>>>> registers", the following
>>>>
>>>> ```
>>>> The MPU provides two register interfaces to program the MPU regions:
>>>>   - Access to any of the MPU regions via PRSELR_ELx, PRBAR<n>_ELx, and
>>>> PRLAR<n>_ELx.
>>>> ```
>>>> We use the above mechanism to configure the MPU memory regions.
>>>>
>>>> MPU specific registers are defined in
>>>> xen/arch/arm/include/asm/arm64/mpu/sysregs.h.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>> Changes from :-
>>>>
>>>> v1 - 1. Instead of mapping a (XEN_START_ADDRESS + 2MB) as a single 
>>>> MPU region,
>>>> we have separate MPU regions for different parts of the Xen binary. 
>>>> The reason
>>>> being different regions will nned different permissions (as 
>>>> mentioned in the
>>>> linker script).
>>>>
>>>> 2. Introduced a label (__init_data_begin) to mark the beginning of 
>>>> the init data
>>>> section.
>>>>
>>>> 3. Moved MPU specific register definitions to mpu/sysregs.h.
>>>>
>>>> 4. Fixed coding style issues.
>>>>
>>>> 5. Included page.h in mpu/head.S as page.h includes sysregs.h.
>>>> I haven't seen sysregs.h included directly from head.S or mmu/head.S.
>>>> (Outstanding comment not addressed).
>>>>
>>>>   xen/arch/arm/Makefile                        |   1 +
>>>>   xen/arch/arm/arm64/mpu/Makefile              |   1 +
>>>>   xen/arch/arm/arm64/mpu/head.S                | 176 
>>>> +++++++++++++++++++
>>>>   xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  27 +++
>>>>   xen/arch/arm/include/asm/arm64/sysregs.h     |   3 +
>>>>   xen/arch/arm/include/asm/mm.h                |   2 +
>>>>   xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 +++
>>>>   xen/arch/arm/include/asm/mpu/mm.h            |  20 +++
>>>>   xen/arch/arm/xen.lds.S                       |   1 +
>>>>   9 files changed, 253 insertions(+)
>>>>   create mode 100644 xen/arch/arm/arm64/mpu/Makefile
>>>>   create mode 100644 xen/arch/arm/arm64/mpu/head.S
>>>>   create mode 100644 xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>>>>   create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
>>>>   create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
>>>>
>>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>>>> index 7792bff597..aebccec63a 100644
>>>> --- a/xen/arch/arm/Makefile
>>>> +++ b/xen/arch/arm/Makefile
>>>> @@ -1,6 +1,7 @@
>>>>   obj-$(CONFIG_ARM_32) += arm32/
>>>>   obj-$(CONFIG_ARM_64) += arm64/
>>>>   obj-$(CONFIG_MMU) += mmu/
>>>> +obj-$(CONFIG_MPU) += mpu/
>>>>   obj-$(CONFIG_ACPI) += acpi/
>>>>   obj-$(CONFIG_HAS_PCI) += pci/
>>>>   ifneq ($(CONFIG_NO_PLAT),y)
>>>> diff --git a/xen/arch/arm/arm64/mpu/Makefile b/xen/arch/arm/arm64/ 
>>>> mpu/Makefile
>>>> new file mode 100644
>>>> index 0000000000..3340058c08
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/arm64/mpu/Makefile
>>>> @@ -0,0 +1 @@
>>>> +obj-y += head.o
>>>> diff --git a/xen/arch/arm/arm64/mpu/head.S 
>>>> b/xen/arch/arm/arm64/mpu/ head.S
>>>> new file mode 100644
>>>> index 0000000000..ef55c8765c
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/arm64/mpu/head.S
>>>> @@ -0,0 +1,176 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * Start-of-day code for an Armv8-R MPU system.
>>>> + */
>>>> +
>>>> +#include <asm/mm.h>
>>>> +#include <asm/page.h>
>>>> +
>>>> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>>>> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>>>> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>>>> +
>>>> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>>>> +
>>>> +/*
>>>> + * Macro to round up the section address to be PAGE_SIZE aligned
>>>> + * Each section(e.g. .text, .data, etc) in xen.lds.S is page-aligned,
>>>> + * which is usually guarded with ". = ALIGN(PAGE_SIZE)" in the head,
>>>> + * or in the end
>>>> + */
>>>> +.macro roundup_section, xb
>>>> +        add   \xb, \xb, #(PAGE_SIZE-1)
>>>> +        and   \xb, \xb, #PAGE_MASK
>>>> +.endm
>>>
>>> Can you explain why we need the region to be page-aligned? Would not 
>>> 64-bytes alignment (IIRC this is the minimum by the MPU sufficient)
>> We are aligning the limit address only (not the base address). 
>> However ...
>>>
>>> And more importantly, if those regions were effectively not aligned, 
>>> would not this mean we would could configure the MPU with two 
>>> clashing regions? IOW, this round up looks harmful to me.
>>
>> you are correct that there is chance that limit address might overlap 
>> between 2 regions. Also (thinking again), the limit address is 0x3f 
>> extended when is programmed into PRLAR. So, we might not need 
>> alignment at all for the limit address.
>
> I am not sure I fully understand what you wrote. Can you point me to 
> the code you are referring to?

Actually I was referring to the ArmV8-R AArch32 docs ( ARM DDI 0568A.c 
ID110520) here.

In case of HPRBAR "Address[31:6] concatenated with zeroes to form 
Address[31:0]" , so the base address need to be at least 64 byte aligned.

However for HPRLAR, "Address[31:6] concatenated with the value 0x3F to 
form Address[31:0],". So even if we align the limit address to 4 KB or 
64 byte or anything, the actual limit address will  always be unaligned. 
So, I am thinking that aligning limit address might not make sense.

>
>>
>>>
>>>> +
>>>> +/*
>>>> + * Macro to prepare and set a EL2 MPU memory region.
>>>> + * We will also create an according MPU memory region entry, which
>>>> + * is a structure of pr_t,  in table \prmap.
>>>> + *
>>>> + * Inputs:
>>>> + * sel:         region selector
>>>> + * base:        reg storing base address (should be page-aligned)
>>>> + * limit:       reg storing limit address
>>>> + * prbar:       store computed PRBAR_EL2 value
>>>> + * prlar:       store computed PRLAR_EL2 value
>>>> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not 
>>>> specified it will be
>>>> + *              REGION_DATA_PRBAR
>>>> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not 
>>>> specified it will be
>>>> + *              REGION_NORMAL_PRLAR
>>>> + *
>>>> + * Clobber \tmp1, \tmp2
>>>> + *
>>>> + */
>>>> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, tmp1, 
>>>> tmp2, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>>>> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>>>> +    and   \base, \base, #MPU_REGION_MASK
>>>> +    mov   \prbar, #\attr_prbar
>>>> +    orr   \prbar, \prbar, \base
>>>> +
>>>> +    /* Prepare value for PRLAR_EL2 reg and preserve it in \prlar.*/
>>>> +    /* Round up limit address to be PAGE_SIZE aligned */
>>>> +    roundup_section \limit
>>>> +    /* Limit address should be inclusive */
>>>> +    sub   \limit, \limit, #1
>>>> +    and   \limit, \limit, #MPU_REGION_MASK
>>>> +    mov   \prlar, #\attr_prlar
>>>> +    orr   \prlar, \prlar, \limit
>>>> +
>>>> +    msr   PRSELR_EL2, \sel
>>>> +    isb
>>>> +    msr   PRBAR_EL2, \prbar
>>>> +    msr   PRLAR_EL2, \prlar
>>>> +    dsb
>>>
>>> Please use "dsb sy". This has the same meaning as "dsb" but more 
>>> explicit for the reader.
>> Ack
>>>
>>>> +    isb
>>>> +.endm
>>>> +
>>>> +/* Load the physical address of a symbol into xb */
>>>> +.macro load_paddr xb, sym
>>>> +    ldr \xb, =\sym
>>>> +    add \xb, \xb, x20       /* x20 - Phys offset */
>>>> +.endm
>>>> +
>>>> +.section .text.header, "ax", %progbits
>>>
>>> Does the code below actually need to be in .text.header?
>>
>> I can remove this altogether.  As I understand, the code should be in 
>> .text section.
>>
>>>
>>>> +
>>>> +/*
>>>> + * Enable EL2 MPU and data cache
>>>> + * If the Background region is enabled, then the MPU uses the 
>>>> default memory
>>>> + * map as the Background region for generating the memory
>>>> + * attributes when MPU is disabled.
>>>> + * Since the default memory map of the Armv8-R AArch64 
>>>> architecture is
>>>> + * IMPLEMENTATION DEFINED, we intend to turn off the Background 
>>>> region here.
>>>
>>> Based on this sentence, I was expecting an instruction to clear 
>>> SCTRL_EL2.BR. What did I miss?
>>
>> Sorry, based on https://developer.arm.com/documentation/102670/0300/ 
>> AArch64-registers/AArch64-register-descriptions/AArch64-other-register- 
>> description/SCTLR-EL2--System-Control-Register--EL2- , SCTLR_EL2.BR 
>> == 0 (reset value). Thus, the background region is disabled by default.
>>
>> Should I still set SCTLR_EL2.BR = 0 ? Or do I update the description 
>> with this info.
>
> Both the Arm Arm and the TRM will tell us the state when the CPU boot. 
> But I guess that there might be a firmware running before Xen. So we 
> can't assume the values in the registers (unless this is documented in 
> the boot protocol like Image).
>
> So I think we need to set SCTLR_EL2.BR to 0.
Ack.
>
>>
>>>
>>>> + *
>>>> + * Clobbers x0
>>>> + *
>>>> + */
>>>> +FUNC_LOCAL(enable_mpu)
>>>> +    mrs   x0, SCTLR_EL2
>>>> +    orr   x0, x0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>>>> +    orr   x0, x0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>>>> +    orr   x0, x0, #SCTLR_Axx_ELx_WXN  /* Enable WXN */
>>>> +    dsb   sy
>>>
>>> There is no memory access in enable_mpu. So what is this dsb for?
>>
>> We need to ensure that the outstanding memory accesses are completed 
>> before the MPU is enabled. I think the same rationale applies here as
>>
>> enable_mmu()
>>
>> {
>>
>> ...
>>
>> "dsb   sy                     /* Flush PTE writes and finish reads */"
>>
>> ..
>>
>> }
>>
>> In the case of MPU, we need the reads to be completed.
>
> I can't remember why a dsb was added there. But I don't see why we 
> would need with the MPU as:
>   1/ we have a 1:1 mapping
>   2/ everytime we touch the MPU sections, we ensure the change will be 
> visible
ok, so we don't need any barriers here.
>
>>
>>>
>>>> +    msr   SCTLR_EL2, x0
>>>> +    isb
>>>> +
>>>> +    ret
>>>> +END(enable_mpu)
>>>> +
>>>> +/*
>>>> + * Maps the various sections of Xen (described in xen.lds.S) as 
>>>> different MPU
>>>> + * regions. Some of these regions will be marked read only while 
>>>> the others will
>>>> + * be read write or execute.
>>>
>>> And some in the future may need to be memory region (e.g. to use the 
>>> UART early) :). So how about just dropping it?
>> Yes.
>>>
>>> > + *> + * Inputs:
>>>> + *   lr : Address to return to.
>>>> + *
>>>> + * Clobbers x0 - x7
>>>> + *
>>>> + */
>>>> +FUNC(enable_boot_cpu_mm)
>>> > +    mov   x7, lr> +
>>>> +    /* x0: region sel */
>>>> +    mov   x0, xzr
>>>> +    /* Xen text section. */
>>>> +    load_paddr x1, _stext
>>>> +    load_paddr x2, _etext
>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>>>> attr_prbar=REGION_TEXT_PRBAR
>>>> +
>>>> +    add   x0, x0, #1
>>>> +    /* Xen read-only data section. */
>>>> +    load_paddr x1, _srodata
>>>> +    load_paddr x2, _erodata
>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, 
>>>> attr_prbar=REGION_RO_PRBAR
>>>> +
>>>> +    add   x0, x0, #1
>>>> +    /* Xen read-only after init data section. */
>>>> +    load_paddr x1, __ro_after_init_start
>>>> +    load_paddr x2, __ro_after_init_end
>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>>
>>> Is it necessary to have a section for the ro-after-init? IOW, could 
>>> we just fold into...
>>>
>>>> +
>>>> +    add   x0, x0, #1
>>>> +    /* Xen read-write data section. */
>>>> +    load_paddr x1, __ro_after_init_end
>>>> +    load_paddr x2, __init_begin
>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
>>>
>>> ... this one during boot 
>>
>> This makes sense. So what you are saying is that there should be a 
>> single RW data region from __ro_after_init_start to _eteemediator  (not 
> > __init_begin as it would overlap with the next).
>
> _eteemediator may not be properly aligned. You will likely need 
> another variable.
>
> As a side note, I don't understand why the TEE mediator are part of 
> RW. It is a separate problem though.
>
>>
>> Followed by a text region from __init_begin to _einittext. However 
>> _eteemediator is same as __init_begin, so should we be inserting a 
>> dummy page in between ?
>
> I don't understand what you mean. _init_begin should be suitably 
> aligned to 4KB. So why would we need a page in between?

Sorry I didn't explain clearly. In my xen-syms.map

0x202000 D __ro_after_init_start

0x202000 D _eteemediator

0x202000 T __init_begin


So since __ro_after_init_start == _eteemediator, so the RW data region 
is empty. There is nothing to map here.

However if  _eteemediator  and __init_begin were 0x203000 , so I should 
create a RW data region from 0x202000 - 0x202FFF (ie __init_begin - 1).

And then there will be Text region from __init_begin to _einittext - 1.

Is my understanding correct ?

>
>>
>> A RW data region from __init_data_begin to __bss_end. Can we combine 
>> the BSS section and init data section into one region ?
>
> If they have the same attribute then yes.

ok, so my sections look like this (from readelf -DS)

   [ 0]                   NULL             0000000000000000 00000000
        0000000000000000  0000000000000000           0     0     0
   [ 1] .text             PROGBITS         0000000000200000 00000100
        0000000000000832  0000000000000000 WAX       0     0     32
   [ 2] .rodata           PROGBITS         0000000000201000 00001100
        0000000000000d78  0000000000000000   A       0     0 256
   [ 3] .note.gnu.bu[...] NOTE             0000000000201d78 00001e78
        0000000000000024  0000000000000000   A       0     0     4
   [ 4] .data.ro_aft[...] PROGBITS         0000000000202000 00003170
        0000000000000000  0000000000000000  WA       0     0     1
   [ 5] .data             PROGBITS         0000000000202000 00002100
        0000000000000000  0000000000000000  WA       0     0     1
   [ 6] .init.text        PROGBITS         0000000000202000 00002100
        0000000000000048  0000000000000000  AX       0     0     4
   [ 7] .init.data        PROGBITS         0000000000203000 00003100
        0000000000000070  0000000000000000   A       0     0     1
   [ 8] .bss              NOBITS           0000000000208000 00003170
        0000000000000000  0000000000000000  WA       0     0     1

IIUC, [2] and [3] will be combined.

[4] and [5] will be combined.

So we will be creating 6 MPU regions in total. Is this correct ?

- Ayan

>
>>
>>> and then fold the ro-after-init to the read-only region? 
>>
>> This I did not understand.
>
> I mean that the MPU regions would be updated so that after boot, one 
> region would cover .rodata + .ro_after_init. The other region would 
> cover .data up to .init (not included).
>
> Cheers,
>

