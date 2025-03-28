Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CC3A7461C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 10:14:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930365.1333028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5mn-0002CX-5a; Fri, 28 Mar 2025 09:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930365.1333028; Fri, 28 Mar 2025 09:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5mm-00024t-Uk; Fri, 28 Mar 2025 09:13:56 +0000
Received: by outflank-mailman (input) for mailman id 930365;
 Fri, 28 Mar 2025 09:13:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=huHb=WP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ty5mk-0001nv-JX
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 09:13:54 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2009::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f755ffde-0bb4-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 10:13:53 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MW4PR12MB7141.namprd12.prod.outlook.com (2603:10b6:303:213::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 09:13:49 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.045; Fri, 28 Mar 2025
 09:13:49 +0000
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
X-Inumbo-ID: f755ffde-0bb4-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXQ5FQS35hCZKVEAFWaQKCWhvy5gtp7k9uRZnkRYRWusO8t+BGrHfXz+ataNXKmD/BZE8pJRXrtPpJ5E8u3ia5Vq1aCZ9f/YCgbSik1GVf/D5dkkESFTZN0oblrOs+1U0TVRlzFOdc96aHi6Ng4mwE99f2w84IHd7GzEiEtf2y1WIApjjxQk4wmYv8Effi4Zf3BxtyZeOY6kVmBE67B6kYTopOtSF4+M9nSKPxeFAt8W5xFwx3aYAr4mLfEuCK2wC9LpohcWamDE1Vxvhu01ktMAjVjMT/aU8VRZRc0GkSktkvVlddi0dVFM6AnrSF7YPmIe2rfwE5Ahrc2YtGpTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsHSJJaOKk4neO7+xXGCJ1G+n7FINOVR8E0/e0L7Yz4=;
 b=tnWZcJew6HD42nmISJP0EFaoCYPG+HjmT7v0FNhYr6UxMWczwSC8O4exyMZvFHy3aozZkxtbVdDtDDLaJc0j6FYJxFyE5EVW7w4U8EWPt8zTZwZQkR2ObKvFgaMX+yy5cmmL45W54wYIB0DZamWLYm0tEt653vfNuHloRF/8RLiAkbpvCKzC1ei67+vWxIR6KUECGubBHS9VXQKdCkSXkhdh22AptbhdJ3Sp/ygu0Umbl5FTV3xoONOUuN5QW/g+d4Wfdxf7w4XLZq2GF9bF850HPf6EZRZ1a0vZ4bV2PrSmGvR0WUa0O7r4fdZ8O69WSw8Aj3JGBK67zOgks6xvXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsHSJJaOKk4neO7+xXGCJ1G+n7FINOVR8E0/e0L7Yz4=;
 b=KqrTAVKO6Yxmom78kSGQ8Fkb+OSeW8tXqbx7IFN2GSMID6hXWQhgPL5Fc13sJmwbEb1azrs2OuL0+sGpisJFMwJdr+drlrgcY6HwWNcVh45GcktlqOUedVD+4eRCTlGsnUEibt91fuYq6oHXH1xAqCQWi7DljqhlpIDUnjmPmSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <cb652d45-9beb-4385-84cd-2015f983e27e@amd.com>
Date: Fri, 28 Mar 2025 10:13:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/char: implement suspend/resume calls for SCIF driver
To: Julien Grall <julien@xen.org>, Mykola Kvach <xakep.amatop@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>
References: <800acb5c8447153e6c451c8df316ff678fbb4087.1743114879.git.mykola_kvach@epam.com>
 <d5c15760-c6cd-4f20-b296-a9f9fd44ab0d@amd.com>
 <baf871c2-8f4e-45a4-b03e-cb0b59c8eb18@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <baf871c2-8f4e-45a4-b03e-cb0b59c8eb18@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MW4PR12MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 78bbda1e-97f5-45f5-0b56-08dd6dd8d9f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHVMOWNtUWhCUExiRk0vTG5QVVg3Z1cxYkZ5anB6QXNsdzR6NE1HcE1iWU9l?=
 =?utf-8?B?WStRRUlJYVBZcld6SGNndzJHenZiUEc5RlZqOS9wczc5Z3VDL05jVm1pcmhi?=
 =?utf-8?B?ZUZOVzhiTDcrMWF2ZXRwSzBndzN1NzE4MUVNY1RGV1FGZHBERHlMTDhMUkZW?=
 =?utf-8?B?QWhxZnVrYmtFV3FheHV0a3JaNk04Q01QbVFrSUxKS2Q2b2o5SllmYmZTRnlZ?=
 =?utf-8?B?L2lTSzR0b3dZSzJEUFdRT05ZSHVXSU1VekpRZ0hyTG5kd0ZvUzRJNTY5MzRK?=
 =?utf-8?B?OVBTRmxZUDJmQk5zNEN1QlhsUkZBQXZxK0UrOG10aUpqYmVXR3g0bzA2S0F3?=
 =?utf-8?B?SUVpZVdDazZOT0gvejhhTk5hb3E0L0x2eVpLOWczRWVlMVRjZ0NEQUxld2Z4?=
 =?utf-8?B?Wi9IWk9uYi9URjdGUkdjREgzSndYVVp0cG4yQVQ5bmI5aGJiZGpuY0hJTUdO?=
 =?utf-8?B?eEFUMUYyOGMyckhicXZQRTNRaVE1QWVPbzhCSWM2TGhSdnNzK05hOHE2UUZY?=
 =?utf-8?B?SThKN01ZQ21GUVFHdzBLZDJEdGEzb2ZFQ090VUNLOTZXODQ4M0E1MC9peG9L?=
 =?utf-8?B?MzMwMFpMZFNOc1hFcittdW1zZHFldkpnNDI5K0poUFg1My9qNlVUN1FNWTNS?=
 =?utf-8?B?bmE5aFZhMlRNa0NObE5tZnYrREdOT1d0U2lGeVVZbWZaSzNpR3pxcnpxMVZT?=
 =?utf-8?B?UWlhaFdiR1RneU1heHRaa0xLSUNrbEI4V2hnOUUxbmFudkM4anR0WVA4a2ZK?=
 =?utf-8?B?OUN4dUtOQjZTVUhMNVJDaEgvbkxQc2hNT0Uxb2lQNEdUdEdhRmVlRUk4ZkZ0?=
 =?utf-8?B?bTlIMUZqYmFYS2hDdkhCUzZ2TUtYc05ENGtSN1FpLzd2VHBrN2s4aDhwQURi?=
 =?utf-8?B?OHVkSmtGTnN3aHhoamZpalJVQytib0k2cTZoekh4ODhJRThMaGlMa0tOUzFX?=
 =?utf-8?B?OTB5alpTMWxOM2habXhpZGZkbDZCQ2l1aHVncFRLd2VBMXJrNFJtZVd2WDV6?=
 =?utf-8?B?cmI3MHJzb0VGaU1nR0tTKzFkRy9kZUdJVndvNmdRTUwvYWxzNS9FVnNyazVK?=
 =?utf-8?B?TDFUVDd4ZXJzeWl5dUNDY3I5RHVSc0dPb1RZelpGMExHUElMUFdpaW16MWJW?=
 =?utf-8?B?alQvRzlFWDVENy8xTU8zUVdLYVg5MG91eUZrbFBHbVMvZXBCTGptSGxORVdC?=
 =?utf-8?B?cnlBUHU2Si9BVWVWOGJ6YUYxekFqUWhpT3hCNENqZUE2MVh6SkFQNVRyOWJs?=
 =?utf-8?B?ZC9CdzRNOFhsNFJWMWdycld1T2JTb3hMbnRONjlTenhFaGNPb1UvdEhCQ3lY?=
 =?utf-8?B?NG1CdUcxM1pTQWdqVmgwNHl2Q1lZbGRvK0dKUkNCSEJXL0R3Y1dWTkRGcU1Z?=
 =?utf-8?B?V3lRUDJwdGJFdjY4UVVuZXZyWnJ1WXRDU1o3ZE1CMFJTWFhpWm40VkdYZnkr?=
 =?utf-8?B?UmhoUStBOHJrNlZlT0hxWEJCNFhYenZXMnBRZ1hTYnRDeFJtdFFHd3BYMEdk?=
 =?utf-8?B?WGNsQmgzUmNrbWEzRVYrK3dKNVZkQU5QVGVLY0NCZjNGb2tTZml0M2svclBO?=
 =?utf-8?B?bGNINkZaSDRpVTRabGdDM0dDQlEzUzIzVXJGSnU4YlEvVFVSMXRQeGFXU2h1?=
 =?utf-8?B?bW1RR0k0RlN2OTVBVkZmc0QvNnd1ZDJZa2MrSDBaTWh6QXpGR1dYb0VqWDhh?=
 =?utf-8?B?eWo1UEVzdGpoREN3OVU1aVlmOThnamdZZElWTnYyV3JvT1ppK2JkZWN5dFBy?=
 =?utf-8?B?SEczbU5zbm9oZkorcXBBTWVsVGd1aVVSUlM4VWYzZ2tBWmpwVHc4T1dSQWtj?=
 =?utf-8?B?eU85UFp6OTVpbURhbWNQb1pkRyt1c1FkZEJRNkZ1eVlSdzFVUFFHWlpxN3lx?=
 =?utf-8?Q?++tZcwJacZusT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGV5VkJDR2VTSDdoWHczNUp1QmlTOWxqSTlKV0V4ay9XendPUGVlMGV4R25o?=
 =?utf-8?B?Q01nVFhkZWs2VktFTnNWNkgxZ0RGT21Ib1JNZndxbmNXTVhTS0FKVlEvTkto?=
 =?utf-8?B?ejFneWoxblJXdmR3UENuZWtIbXMzUUkxQVdQSWdLeElmOTJ5NnpqSy94T3lB?=
 =?utf-8?B?czNERFVFNHAyUytZUTZqV2VYVExLRmJZSFo4elI2OWdtTmc4UVdIRHZYZ2tU?=
 =?utf-8?B?bTBFclFPSCtvV3VGbFdxREsyUDNXS1pTUTFsUUsybmFWNXNpWTdxNnh2bGpa?=
 =?utf-8?B?VDVhL2lpMWh5OVdFSXNKeVU5Mk9MejhITktzZnUrZXcwdWU3cjhTNlNWelpw?=
 =?utf-8?B?KzV6WmQvdUFraTh5MWxHWGs1RUJBS1hSN1ltamwwOFBVbGFwc1BkQkRoWTZQ?=
 =?utf-8?B?WFE2cGRtb1VTbzRWZU14UHRUNkF1a25IYkFEUnY2QnNNYi84Qkxhc2Nkd1VV?=
 =?utf-8?B?ZDN2N2ppb1A1UUtuUndHZjU4KzBRRWVWVlNnWlN2N2R1YTBQbkptREdxb1gx?=
 =?utf-8?B?V1ZLWnpKcUhQL2Jha2QxdFczSFhDZVpPbVhWcE9zUExYOTlzSVlWWW95VVFk?=
 =?utf-8?B?UFc2WklqL2htRi9laWV3RExNUGhjSEJ4QmdUWmIxZHdjY2dMUy9wSzgzY2NP?=
 =?utf-8?B?bnJzYXZMOW1kVTZ1UExKTGVkWDZ2K2o2dDVPVzBPejZSb3c1L1FLak94aFkv?=
 =?utf-8?B?dWd4eUtlaXQ4R082aGtrK3hrbG1Ta1ExM2J5NVZxUmcxYkJXcTJLRUNMdDc5?=
 =?utf-8?B?a21uWVZIYmlRUjFGc05WeWtSdDcwUU5qL2I5NFJFL1JTU2dUanp2dmF5L0hu?=
 =?utf-8?B?aUVSV1NSZGVOVDJEaDVseHByc0QwU3phZlp4MHJtcEpQZ2hQV3VRdE1rVVMx?=
 =?utf-8?B?THBiakpDbHN2YlhEYjNJTUdRZnZVTDRPUml2ZEI4L2xhUWE0Ri93RW9qNThW?=
 =?utf-8?B?YnFJWDh3SGtJU0dzb0Izb3Z1b3pOT1FkTnovV2dQTEUwVUFHQ3k0UStjRTRp?=
 =?utf-8?B?R3Z2cGw0N3ZBMzE5MldrSGZoMVU5UTFndHpOTUZvR1lpVG9zV3BPNWp2enlp?=
 =?utf-8?B?UEZBd1JKbmdNbTdjZ2RxTVJSa1NYdnZ3QStrdWJCYkkwK3NmbksrdGtwTXZt?=
 =?utf-8?B?dWpQaHJkUTFZMW1hQlVDdVJsQ0JUbkN6eVI0SGw5Z1VWelMwU254T1g0UVlm?=
 =?utf-8?B?VWp3ZGxkbDExSjBORFUybEJUMDJuS1ZSZHJGZ1kzaWYrSENjZzlQU284Uytv?=
 =?utf-8?B?eGwzeSt5UzFlaCtLR08xalFSZ2NENHdOR2FrVG9xUlRqVXBwZDFnNmo5Q0dE?=
 =?utf-8?B?OW1YaURWdWdObEdaaUYwZ1QxdHBIc1VNMFVUajloMk02RElzbE8yb2ZFV29N?=
 =?utf-8?B?bVVzWGFjaTQ3UU1kYWFVU3BjU2xmcUNwLzNtbi84WjlEbUExQWlYTm1kRmdF?=
 =?utf-8?B?SldUTkR6WDdranlsUjVCSjE1eDZucXBPc0dBRW5xUElaN3Z3NktyMjhCUGdv?=
 =?utf-8?B?UzNPZVdGYW8xclN5UWlSeEVDN0pvZ1pTci9JY1JVTXpyMFAzclh1dlRDRDdn?=
 =?utf-8?B?MVU2VWZ5VzdiMGxPUVZkOE5tWUlNbUoyVDBCYW5lSUFVZldOZmh2ME1yVFRy?=
 =?utf-8?B?dHN1SEpDY0JDM21DblY3V1pBbHA3N1NRRjIyYTdLbGZUeGFlWm80VTRSZGdH?=
 =?utf-8?B?U0tENVdKdGhIdnhEZFdXaU1SdWRXWFZCNDVDTStiT0phd3ZTaER0dVc5S1JO?=
 =?utf-8?B?aTRVYjhMMjAyZTEweWhHM0h5b2RuTkMwZzZlTzJmR2tFLy81Y2U0SWx5WEwy?=
 =?utf-8?B?bmY4Tmk1SjdidURKc3A0MTVlNFg5N3FMTVdyT2VGYytiRFFleHlUQ2NpY1RB?=
 =?utf-8?B?YnNNV0xLZFl3R3NQeFZrakJSOUFDQkg0YnJSQlRYSW0rS2pSNVNJVFBEVXRm?=
 =?utf-8?B?S2xibWVZeGFqaDg4a1Y5eUJnYm9rNnZDdFNIbzVraXdOL1ExNzJDMzU4Tk9j?=
 =?utf-8?B?ZjZyQm5RNDA1RXI1MXBBeVlpZ1VONWpHaE5jdVZ0UUEyR2JNY1R1NDcxUmYv?=
 =?utf-8?B?MVlXU0hUcDJ0YisyOXIzcEp4OVVxb0p3QXZseENtKzBDU3lyZ1pQY3d4a0tG?=
 =?utf-8?Q?sZgZ4UGOVPrRi6tEp+s9Ox/Nw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bbda1e-97f5-45f5-0b56-08dd6dd8d9f3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 09:13:49.5343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdrCTHIRJGnGnJuiBlRIpduhJ91f7XOqGnw79yG/OxzXMq2l4GCiT3c4VgeiTVhH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7141



On 28/03/2025 09:57, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 28/03/2025 08:39, Orzel, Michal wrote:
>>
>>
>> On 28/03/2025 08:08, Mykola Kvach wrote:
>>>
>>>
>>> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>
>>> The changes have been tested only on the Renesas R-Car H3 Starter Kit board.
>>>
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> I'm afraid that without a suspend feature on Arm merged, this is just
>> introducing a dead code which we try to eliminate both for MISRA and safety.
>> I'd prefer to wait for the suspend feature to be merged first.
> 
> This patch is not different from the ns16550 driver which already have
> suspend/resume callback and users. They will be used by but the caller
> is not used on Arm yet. So you are saying the code there is not MISRA
> compliant? If so, is this reported by ECLAIR?
NS also works for x86 that has suspend feature. SCIF only works for Arm that
does not have suspend feature.
Neither NS nor SCIF are enabled in ECLAIR.
We have enabled MISRA 2.1 rule about unreachable code (suspend is example of
unreachable because it *cannot* be executed), but it's not clean i.e. gating.

> 
> Regardless that, I don't think the full suspend/resume series would
> help. AFAIR, the caller will be protected with a config (SUSPEND
> something). So IIUC your definition, this code will still be "dead code"
> in certain config. Therefore are you suggesting to protect everything
> suspend specific code with SUSPEND?
I'd say so, yes.

> 
> If the answer is yes, how about introducing the SUSPEND config now? This
> would allow to get some of the code merged in advance.
Better this than nothing. But in case of this patch, why would we take it anyway
without suspend feature? I'd prefer to add SUSPEND config and protect existing
code i.e. NS that can work on x86 but not on Arm, etc.

~Michal


