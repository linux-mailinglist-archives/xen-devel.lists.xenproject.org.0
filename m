Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D34AC07A2
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 10:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993235.1376663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI1bi-0004We-9n; Thu, 22 May 2025 08:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993235.1376663; Thu, 22 May 2025 08:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI1bi-0004UZ-71; Thu, 22 May 2025 08:48:54 +0000
Received: by outflank-mailman (input) for mailman id 993235;
 Thu, 22 May 2025 08:48:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ayyk=YG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uI1bh-0004UT-1X
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 08:48:53 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2414::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9531915e-36e9-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 10:48:51 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by LV3PR12MB9213.namprd12.prod.outlook.com (2603:10b6:408:1a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 08:48:47 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 08:48:47 +0000
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
X-Inumbo-ID: 9531915e-36e9-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9i4o41MC2Zd5J0JPA3qDgQR7YTDWKHHAUGR75Z6HqTwaVh7nA7EOSCNTmaRrFu/oSNETA9BFk+v4pQ2G08+7cQQ9wH3WkIM56Lb0jXoNKATs9sVJUBTHeDz22ALZTEd7VgSX+eedbTAG5DFDBOuK6v5e3Lt1gcEJqE1OmBcNQqueBIWFN+LipINQTzuWwVHbsv/RmFOdSzTfmxDg99sVBdJp84WY32ajEILd4ogyvIVG9meqe83gzHscQbj2Ji2rPrIzT7JmdTC4UyGDMZ2JyeVjxUTeKbByVj6flw2BWFiu5irOTeOS7gUd0Ogb/Ex1CIb0Ra2Nrnq17WVbBqtWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1LBU9Kn1Os0qoiuZLo3U/AMfrFQTFFhLK8MerzpK2A=;
 b=pGiO6aQVBQNoITwjP3vsrd5lBQFMQDkUOEeSt4Xlfoiij9X3WOzF6cYL9dPjAVc9WvxNWgfdlNX9XeFk0QMKSdoYNBppMnuWu+I40jPx/ybq2ka8jMfC8h4NNVWWo8iIvt/ngTdT0gnVTPwLwsVr2b+p5pCNCKoUazvhkEmJ7bxyJ2r6yqRRMEjbOTxQ11vUeWbA5Dfvom2v4TPAugY7fZGIZH4atFi8/3if8kosTRrBeXy3qkiIzrTBUmBKG40oEnG7SosmN8NVf1znjZ3I6ZIG4BbI/Xi9iQD514Bv8Cr5ej3JbNCyNfVXmsk9uUt7QzOSjHVLP62D0cjjGa/ZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1LBU9Kn1Os0qoiuZLo3U/AMfrFQTFFhLK8MerzpK2A=;
 b=bNfMue4Aa0M5PLkjMy/JOu28bq6Gob9+PCOyN2vSXi6wVi90Nh8X/59MRjLdz+cGyiul7J9cEvDSs+dsym5U2ips4OaN8PQfWOrkDLKqeLUVdsM/EvvyPK1lV974SgTy/SL4Ztny0yhepS/kLcdPOQ0Qz0VfyW3Ij8MQxXg/Afs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ddf26315-ff48-411d-a0ca-9a99867323a7@amd.com>
Date: Thu, 22 May 2025 10:48:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] arm/mpu: Introduce utility functions for the pr_t
 type
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
 <20250513084532.4059388-6-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250513084532.4059388-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0198.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::23) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|LV3PR12MB9213:EE_
X-MS-Office365-Filtering-Correlation-Id: 513c4cd4-e2ab-483d-53f8-08dd990d776c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUUvL3hzV3ZpZnMzbGRXM3FRVEdtZ09pa2FZLzV3bnkvZnhncWM0T25mTHBm?=
 =?utf-8?B?V09UeWRkOEZ3SE9Da2hYemZJcE1SaTJ2R05OdUxzYlVjOUtFUlpOTExWb2xN?=
 =?utf-8?B?Vmg3UExGNFJEQjdYWjlKS2JGcW05NlFCYWR3Z1BkenBOMzlaSzRWNjB2dlYx?=
 =?utf-8?B?bkxzeHFtR2hYNkpmWkUzUmdMdmJneDBaQTFLdE44QWhvTmNsR2Uwd0pveThv?=
 =?utf-8?B?RG5ZTVQ5MjJTMGMwSVBRS0MyOUhmNUF6NDJnK21xNEJHYTlNdlJqNVNDL1gz?=
 =?utf-8?B?ankxRHFsOUpqbnQ3cW5vS1QxWC9yc2tMRWwrNGFEQjFORVJIb29lZzI4V0lO?=
 =?utf-8?B?VU9zcmc2YkZiUGxML0ZKcTVkakRhWWJuejZYaDNaV0JOTTBJZWJsanZXM1Fu?=
 =?utf-8?B?QnYzZ2xuckEvNDdmZ2FMNThpVEJTU2FyakVtU1gxdXZ3eGJxZkd3clNaT1h2?=
 =?utf-8?B?NExraTMxTTdkWWN3d3ZPWk5CVzhBb1NnV1hVUWZzaFI2a3duWnJmZGFkWEpD?=
 =?utf-8?B?NENMbHpBU2RWcExSVytwSGZDZHJqbkZKMFNPZkdxdlJ5Y0FzbjlrcTQ5WCtI?=
 =?utf-8?B?bmk5dXNMRHFhd1lwZ0RmZjE4R3h2RVhvN29DazkzMTluRXpWc3Jmb0ZoRTdB?=
 =?utf-8?B?MWxZdDVtNmJDRmI0U0pOOG1tcDNrVzhDQTl2dEtmOVBWVjFXQ2hlTjBCUWIr?=
 =?utf-8?B?SjNUWkpJMndxV3o5dXRydWJtWUlXN3BFczBod2NQblBOYWt2TVUrYnN3YVc1?=
 =?utf-8?B?djQ0N3B6eGI2VkpNVERTQWlSOVVENVZxVWlOVEVWR2EySHhCSzVRL3R0MWFN?=
 =?utf-8?B?bm4vUHVmRlM0UHBDWG5qQnpjWjF5N0E4NFpsQ1FBZHNTN1N5U1ozaVJBSk96?=
 =?utf-8?B?bWJqOTVKcm9LNGpCK0J1RjA0ZlEwVmhaS0oxakF2R3ptditxdnE4bkVXSk0y?=
 =?utf-8?B?Vk5qaXBEUldVYmZ2bHA1MHB3cHRhTHVaV3RzSjlFRTIvSHhEZFczTWgvZklC?=
 =?utf-8?B?UVhqMlZ2dUJZU3FIcFQySEpKOSttbWs3YWdPQlJnYmxXMGlJREpCelV3aFRN?=
 =?utf-8?B?dTM3dkNkSjdka3kyQWVQYWJ0Yjh6c2RXNXBoeXk2a09xcFZvaGlXTzczSEtW?=
 =?utf-8?B?cldPWTdoSjVFRFZlY2krZjJ2am8vRHJIMUJUYytGVVhDS0dzeTF5SUZ2TEhl?=
 =?utf-8?B?alBaVlF0LzB6bkhMeDlqUUttUkRFZVBLRk5oRW9Gem52QWJiY2FjOTlCN2dB?=
 =?utf-8?B?bm8wWnBWOUdaUkFMdnkzTmhlbitwVk9qbzhnazk1aGVSL2wyd3FJWXdXNGlO?=
 =?utf-8?B?a1ZTT1BpL1M2b05uaXhPZUVuM2Ixc1dzS1Q1UmdKNmNHbi8rMUZudUNBTjNE?=
 =?utf-8?B?RDBYaUo5WkFUZjA2TjMyMkZUS3JuY0ZwZlhyVkdOdWtsbzJKaU1JSHcxRkJ2?=
 =?utf-8?B?eDJSY0xJQ1Zhd1pKM2pVRkRSbDJwQzFhVUtZNVA4SUc3OGkwTVB4WHptMzRZ?=
 =?utf-8?B?TUZPei9meVFjV0IwMncvbnY1N1MzR3F2WXNxaVppdFZjREZ6NkRhVmpzbWEv?=
 =?utf-8?B?OVFsMVFBMnFDblBLcXk5QjhHNEh1eUtWSW13YXl3MFp6RTFFRzkyQUg3eE9x?=
 =?utf-8?B?eXVUVU93Y0syWTN1UEIyb0NxVHVwOEFsbUNndFY3S3E1SDVSWGJyZ20ydTUw?=
 =?utf-8?B?MkZRcituU2thTDFycDlKcGtTa3paQXozZ1I4M0tEdnVrK281aFd5bVJDQ0JW?=
 =?utf-8?B?ZVEvWjhpT2R5aTRhNzlnSHc3SEl3Vy9tMnBFaEh1eU5uZGU5Yy81YlJsQ2JN?=
 =?utf-8?B?OFBmcm5aaTUrazdWUzQ0SXZNQUhPQUdhOEkrM1B4eWQ0YmY0clBRd09pb2ZH?=
 =?utf-8?B?NE9ZaVVHU1gwa3g1aStXcWpYWnh6ak85dXpKNGhWS0IvYWhQWWM4QTJCZmJq?=
 =?utf-8?Q?kc9lxg/r+sQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWIrRjlEK3VvcmZrTEhENVFkK0UzZ083a29aV25CdnZJMEkxeFJyN09TbGlS?=
 =?utf-8?B?aUNlVUF0RTJBVjJ2WDhibGpRNEh0VFhoYUV5VVNQQTlNOW9MMkpCQldjZWk0?=
 =?utf-8?B?WSt1c3YxeHk4ZmxMYkVXQWlLTGJqODJMWDIyb2FxNU1GZFJMTVdJNHBXTS9O?=
 =?utf-8?B?QVl6Z3dyVU9EaUpXNDYremJXTFBPS3B1VzNvVDFJNnAyU0ZlSFpabThxdWVn?=
 =?utf-8?B?NGVYVjdtNitXcFR4SHBOOTVwaGFVMVBpNEZLYWdtL014VndpV3RocjdQY2NS?=
 =?utf-8?B?aGdpNTlEVFBFWmlDQnVUTjVXcGY3MU9GQWcra3VpbTY2ZFpYSm50eEFOQ3I5?=
 =?utf-8?B?Z2tkTjhUbkw2aDdBemRpVUpYOCsrNFJ1K3ZKNVBKR1E3VXUzU0lhNFBBd0Z0?=
 =?utf-8?B?U1NZMUprWTAwVENLYmRBbkdUN1Z0eUJ2Ym1hV01jRlZqSTMrU1F0bkFzWDkr?=
 =?utf-8?B?S1QyYVVkRFhsRm5vMllScXAxa0loVWNXQlQwTDdHREJNVmovdG1DNGdjSHpk?=
 =?utf-8?B?TVZIekpzREN5ZTNJaHZOa0N4dkhHZEo0UG5EdnBtZ3MvNVE1YXB5am1Xa1Q1?=
 =?utf-8?B?OFBSSUh4QTFEckN1eldoMWFpVGViTWx0SUZTWHg0SkV6djhidFQ4aXlGZ2t6?=
 =?utf-8?B?cE4yazYyOVpnUXloeGdqUTE2bmNUVjl3c1JqK3dTV2U3MVo2Z3l2djYwd3pG?=
 =?utf-8?B?U240djAxM0dXMFVmbnFpZjFHNEtnZDNBUmNNY3ZWSHRqOUNNbW90Zitwa1g5?=
 =?utf-8?B?ODZtUlZJQ0ptRjA0U00vWVpVSk82RkdYc0VVUVJ1UVFyMVdsYllyVU53U1BY?=
 =?utf-8?B?dDBFZ3ovQlA3K3hNSTZmMFFEUzN4WmtSQ01oZ28wSzk2QnFzcDVNWmhZU0kr?=
 =?utf-8?B?SitEOHN0VWViSmdmL3hMdGR6eFN0SVdXNUVjc1NCblU0Szc4YXBiZzZMS09N?=
 =?utf-8?B?OSs4MGNwNjFlaGJnYmRoNm01b2xzUTFQa2NLV1FpN2hDRmxJWWtUSnRDK2tl?=
 =?utf-8?B?NWlhWGNkV1VMeUR2NTRPRWY0VzdBYXAvbHhnREJFWjlScEdjWndFS1pEWjZh?=
 =?utf-8?B?THVNTEhnYTlyTFZCbEMrRDdTS0dUQWpFd1lXeTR2dTRnYm9peFAyeGdXQ1Vt?=
 =?utf-8?B?b21NaFVaN1FUVGVycHR3amRLR0RqcjRTR0RtUjIzQlRrVkZ5MzBMdy9jenRO?=
 =?utf-8?B?c2RSb1FPYXU5alM4S0lRRlJyeGlrbDRKTjBWaisvRGxUU21OR0FhbThnaEwy?=
 =?utf-8?B?eE9JQ0tqOUJ1cmpyNWFQaWtwc1VXS3hMV1p4MUVqK3lYV1FsMGNVUElKaXVH?=
 =?utf-8?B?clZCOEx6NmxBeG9EQXorUGlrOFNaY2FWMXFCYWJSN3dwN3EyTXB4QmJmMFhU?=
 =?utf-8?B?dUM5cmVYZEhMRmczLzZNcU5wRnR4ZDU3R3Z2VE5NVVJXZ2N6ejBxWWRzeFl4?=
 =?utf-8?B?Mk1Cd0ZMMjBBU0c4VDBzL00xNWFJTjRpODlNTTdKam1UTzNZYlJPdlFXdDdH?=
 =?utf-8?B?VWV3QXFUYnlHdU1tTVo0OTU0c2p3eFdURDZvVlYySVIzcDFaUCs4T0Z0anJl?=
 =?utf-8?B?ZXJkYmt2U0lQbDhnTitLaStaN0tGeTYwMVNqK0M3TFlTVm1iRUNkT2xFeWdS?=
 =?utf-8?B?b3FyZjBmZWxEMkZReUs5aG94dUIxTGgrTlBkMHVkTzlFOHdUeVc5Q3lYVWYw?=
 =?utf-8?B?R2ZzUEJ4cmh3VmgxMUhLRC84NlFmNkJnQy8zLytXb2lXa1N2UmFKUVFLWnp4?=
 =?utf-8?B?a1NFalM2MktIeW1Tc3QzU1lBM080andQL1JNMXN2dmdYNGFyaS9nd1ZyOFV3?=
 =?utf-8?B?UnNEbUFYc1BXdTlSQzRnSG1sMW1PMTBKMTViVDlSNUpOWjZYeHlVYU9TdXVE?=
 =?utf-8?B?VTFCUXdHdm1KMmdkMzBSemtYUmNBeTVoWEV2ZFVTdnJUYVZDcjdQL25MK25y?=
 =?utf-8?B?eDRHc1VCNThmVk9FdEtiQjE3OUs3NTU4c1NwQUNrYThzSmEzdSt1aWxYV2dQ?=
 =?utf-8?B?ajB2eUlzOVZGamtHeVROcmpjRWZWM3hlK2ozbG9RV2pkZDFRSy9uTHJ0K0Rr?=
 =?utf-8?B?SmZxSHhUa2xYb0RMNk5zQUg4UTE4VUFnQWNTU2M5Zm5xblR3cWdtczVkdUh3?=
 =?utf-8?Q?csB7TJ2JHsAUyPnc7GwrbpKxu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513c4cd4-e2ab-483d-53f8-08dd990d776c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:48:47.5689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhxoRI07j8wv3SMemEOi13FaRJw4vroKMHXJ62fAVGK63CGwzbAdg4ptl6Izf/ec
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9213



On 13/05/2025 10:45, Luca Fancellu wrote:
> Introduce a few utility functions to manipulate and handle the
> pr_t type.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v5 changes:
>  - Don't rely on bitfield and use the mask MPU_REGION_RES0 for
>    pr_set_base and pr_set_limit to make it explicit. Fixed typos
>    in commit message.
> v4 changes:
>  - Modify comment on top of the helpers. Clarify pr_set_limit
>    takes exclusive address.
>    Protected common code with #ifdef Arm64 until Arm32 is ready
>    with pr_t
> ---
>  xen/arch/arm/include/asm/mpu.h | 65 ++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index fb93b8b19d24..b90ae8eab662 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -23,6 +23,71 @@
>  #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>  #define MAX_MPU_REGION_NR       NUM_MPU_REGIONS_MASK
>  
> +#ifndef __ASSEMBLY__
> +
> +#ifdef CONFIG_ARM_64
> +/*
> + * Set base address of MPU protection region.
> + *
> + * @pr: pointer to the protection region structure.
> + * @base: base address as base of the protection region.
> + */
> +static inline void pr_set_base(pr_t *pr, paddr_t base)
> +{
> +    pr->prbar.reg.base = ((base & ~MPU_REGION_RES0) >> MPU_REGION_SHIFT);
> +}
> +
> +/*
> + * Set limit address of MPU protection region.
> + *
> + * @pr: pointer to the protection region structure.
> + * @limit: exclusive address as limit of the protection region.
> + */
> +static inline void pr_set_limit(pr_t *pr, paddr_t limit)
> +{
> +    pr->prlar.reg.limit = (((limit - 1) & ~MPU_REGION_RES0)
Might be worth adding a comment that PRLAR expects inclusive limit hence (limit -1).

> +                           >> MPU_REGION_SHIFT);
> +}
> +
> +/*
> + * Access to get base address of MPU protection region.
> + * The base address shall be zero extended.
> + *
> + * @pr: pointer to the protection region structure.
> + * @return: Base address configured for the passed protection region.
> + */
> +static inline paddr_t pr_get_base(pr_t *pr)
Why not const?

> +{
> +    return (paddr_t)(pr->prbar.reg.base << MPU_REGION_SHIFT);
> +}
> +
> +/*
> + * Access to get limit address of MPU protection region.
> + * The limit address shall be concatenated with 0x3f.
> + *
> + * @pr: pointer to the protection region structure.
> + * @return: Inclusive limit address configured for the passed protection region.
> + */
> +static inline paddr_t pr_get_limit(pr_t *pr)
Why not const?

> +{
> +    return (paddr_t)((pr->prlar.reg.limit << MPU_REGION_SHIFT)
> +                     | ~MPU_REGION_MASK);
> +}
> +
> +/*
> + * Checks if the protection region is valid (enabled).
NIT: in other helpers you use imperative mood, so this should be "Check if"
> + *
> + * @pr: pointer to the protection region structure.
> + * @return: True if the region is valid (enabled), false otherwise.
> + */
> +static inline bool region_is_valid(pr_t *pr)
Why not const?

> +{
> +    return pr->prlar.reg.en;
> +}
> +#endif
Please add /* CONFIG_ARM_64 */

> +
> +#endif /* __ASSEMBLY__ */
> +
>  #endif /* __ARM_MPU_H__ */
>  
>  /*


~Michal


