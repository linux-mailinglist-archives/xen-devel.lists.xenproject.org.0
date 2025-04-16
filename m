Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D77A8B727
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 12:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955531.1349283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u50M1-0001wu-4d; Wed, 16 Apr 2025 10:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955531.1349283; Wed, 16 Apr 2025 10:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u50M1-0001uo-1v; Wed, 16 Apr 2025 10:50:53 +0000
Received: by outflank-mailman (input) for mailman id 955531;
 Wed, 16 Apr 2025 10:50:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PIlj=XC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u50Lz-0001tl-Et
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 10:50:51 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2415::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7a94cd4-1ab0-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 12:50:48 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS7PR12MB5741.namprd12.prod.outlook.com (2603:10b6:8:70::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.33; Wed, 16 Apr 2025 10:50:45 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 10:50:45 +0000
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
X-Inumbo-ID: a7a94cd4-1ab0-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiZxqZKx8rp0k5IvShL4lwVGd8dhyljAUdIcfDN1mIIUrqcIX9mYU+21n6GqsR4vyVI04U8h5H66fiUmyp4WgM6j/7K+xt1VWhlNRLHBdJrllLDM1rHScHW9TmhM+1Ns/jGllgSplKhF+5tPC62dpKYp09SA5c2Cy/8dQxjz0ot5I4eZQicdMw8r/TOOquACeVeaP6ZRDnb2ZuMZP/LW2bI5Cydv1EEE4TCaT1yAAsP3XNXsl2bYY1Rxl4UVYilSgqdZ2q4Z8bgp1Cam9BaYjsrxKTPVoGlYr+X+43OetraEWZeABYNGZndWokENWovC8zzkZPX9q9aCiOcDwzuZyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heQNtd111nig9aTk/NYEc+rG0PoT6+pO/VFw1vMtPoI=;
 b=dYixT+dW3NvmS9U/rZ4IgRpyflc2kk6Wjg68ghXgbERIsw/efEUZKj0xbPnRUf7x5uCvVgM48QUU5vOQJAzwjJ/400G3ZUSWLI0kd2MLYRVcZQZGjCetcec27W/oPjr3eHmlMIFZBLDavAzf0kugykmdiBD9rUQxwjtMoyOzwI+TfHg3K7BkVbFypl1hM19TZpnEf0+aeFE2RvYMSVhvool68fzQybTwwCmmnGim703wpQ2eiYNt7UdFcDZWFIaoGtr4Ne0LP1gfaFHjyi9KhQ6KCg+CMUMNSyowl1U8r4snWte5SUzJyNVba1DZWt+sjjYeTRUI3OiO53RbUIQrqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heQNtd111nig9aTk/NYEc+rG0PoT6+pO/VFw1vMtPoI=;
 b=IfT9bmHEfqcuf2pAGwFakhKHps5tIkA/MAJhPSqH+RESZ7mIdOW2gGmWtG0xFxRCymsazjBvXZuMou8BhXXuxc7k/Vz1wI8fXbfoIpzDsCZ83cXw6JrpKa5uev5ufWcZkLcO5EQTTqf97EXIcKlRAQGYlmFPOT5y8Q0ONBusR+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d2b51729-e5dd-4325-9275-615ab1cbb68d@amd.com>
Date: Wed, 16 Apr 2025 12:50:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] arm/mpu: Introduce utility functions for the pr_t
 type
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-4-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250411145655.140667-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::19) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS7PR12MB5741:EE_
X-MS-Office365-Filtering-Correlation-Id: 9755ae38-ab8e-461d-7d90-08dd7cd48a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a28xbVFVbDRqbUZ0SUU3bkNVNmxtMkdwMzFyUGN3T0RnbEUzNWdFZFpEM01N?=
 =?utf-8?B?M2pqdkFNdm5XVjZoUnRvZmVnNTV2TkU2Y1lBeGlBOXZHV01hU0MrbWhSTDhv?=
 =?utf-8?B?UTRRRUh0V2RidWFveWZGSHI2aUN4dXNMQU03QTlCNWRHczFqczAveXJSbjA4?=
 =?utf-8?B?LzNZSjZYTVkwb0ZBaGljTERyeXdkTU00UHFnU0NyWjFTOVRVT09RWmkyWE1Q?=
 =?utf-8?B?K2hsK2Q4T1hOUXJ1SEZWQSsvc2hPSEZZVE85RGw2Q2lsZWxqbk5kN0kyUzRp?=
 =?utf-8?B?bWVpWVRJTit6YnArYTk0bDBya0M0Y0tkNUMveGFsUElMZnN2ZHJuTDVBWDBD?=
 =?utf-8?B?bVQzRFNlM2FSbjFFR1d0NFBlVFMrVy8rVzhwSWZWbHpFdmo3S1prMWJFYThT?=
 =?utf-8?B?d2tzd3BNTkJzaFB4WGVnUWRkUEFVclViMzVWNnplZHNkMVZpVmlYT0g3U2I4?=
 =?utf-8?B?Q0dWRk9sckc1dit4VHAvVGdCYkFUa0IrS0Z3Z3ViYWxucVRjbW1TSStnOTJi?=
 =?utf-8?B?ZDVBd2Z3ZGI0WHgvaldVZVNKb3V5dy9nYitpM3ZSZWdnRGVXUGVaWXVVdHJw?=
 =?utf-8?B?NDAwTXJmdS91VHF5YjB4UGtlQWQ4MzdxU294VmJRZGVCdDRHMUpob2ppSTQ4?=
 =?utf-8?B?Z0xTWTdDbnk1Vkc4OHN0QVYrMGNhMCtGNG52c2p3bkUvQkl4aTR3VVEzK3lh?=
 =?utf-8?B?dEIrNmtmV3JwOUlLUVRJdFVMWUtGY09HOVhGOW5tWHJmczlVQWdJdW5UZUtk?=
 =?utf-8?B?ckpJM2YzRmE0ZEpZZkVEazNxWjYyWUJwajRYTHZxOHI2QnloWkhxUFJ0RjJl?=
 =?utf-8?B?QmJMWWpIUG0xNXZUS1BRTmF0U1pOejY1dVB1YXJSM05xd2hUUXJBcjR4UzRa?=
 =?utf-8?B?S25wWnB1b1o1L0dwcXdxY3Q5eGN1TklKazlocVh0djdZeDZFUnpzOWhYNmNH?=
 =?utf-8?B?NTdtcW51N0pkNnlaOFE0MTEreHY2M2JrcE1xWVptcmtIUDlleE9NT1pTMVhR?=
 =?utf-8?B?UHN4WmdoSmN6Mmc4T2dyME90ZkM1VzR5RDB0a2NnNzcvQmZSSWJzeDhFWUZk?=
 =?utf-8?B?azN3eFpnUkpqaTliRG8relpXQjlrSFJGSlQzQ295ellDLzNSY09wRFl3N3RG?=
 =?utf-8?B?ZDhqNGNKbnRFQklPSEpHdDZWaThwa0E4UWhPanVyWjBzNXNoWmVzeGwwYnZU?=
 =?utf-8?B?WDlDNEE1YjZRSysvVG1SWnpVZkVQbGhGaWsrK2F0RXlIcnRqWnI3cW9rdk5m?=
 =?utf-8?B?RWp0ckZMSXp3UDZVbjdma01IblJjMTNodGNDVU91NUVWM1VDV2huS1FVWmZy?=
 =?utf-8?B?aFk1RFA0eTAwY2planRCODhqU2VIVlRNU29wTkhmQVhnWlhnNEpLbXBJZ0hV?=
 =?utf-8?B?aWRteHN4dTlTMHFPMWlhWFMxZlVTT0NQL1FwMnlrRHB5b1ZKdnQ5S1EyTHVJ?=
 =?utf-8?B?aERhbGZZdWlFL2lBeUZIdC9GZjcwMUpLNk5KbjNmcnRxL2tsRGxtNmJ1eGdR?=
 =?utf-8?B?Mk1Tam5aUXNZVENSRTdmZmV0M1UvSCsyYmhSWjNBdWNUOFo4Q21xTGVyTkZz?=
 =?utf-8?B?UFlFemkwR0J5bTNzMllOQmhqRmQwemdEaHcvMURTNDVkMFA2VytHYlYxTkV5?=
 =?utf-8?B?MmszdWltNmI2OVBlSVJIS3FmamE3N2hTL2NMZkdQMUNVYkdaa0t5VDJxR3V4?=
 =?utf-8?B?dmJHU1h2ZVBDSFZ5TmtZeTNFZktjWHUreCtaL0IrbG5rbzZkOFdmbGxUbVRC?=
 =?utf-8?B?aGxGK2QwazdtSGl2emZiaTZyUWJjQjJrTkgxaG5EZnZnUU9PL0lhaUFrNXpL?=
 =?utf-8?B?K2V3NmkyRUVwSWtYOEFFazI2S2w0dlRGZFpHeTY0TnNoUHpiZGhrVWJsMkFD?=
 =?utf-8?B?SkE3bEFpY2tmekZBcUd1OUluYnZLNnJSOEo3OC9sTEpVdTltNm91RUVuK3h4?=
 =?utf-8?Q?rLGIEyNhl4I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUt5MGRUY3B0MkhCQVZTMGpmTnB2cEthbGxpcEFIL1l6TjBBNjNpUmVwNHl1?=
 =?utf-8?B?TzlpcnF4K0VzT2N5TjJOd2QrMGJmc2FFZUhYT2ZENUJrLzJvWjlpNW5TNGtH?=
 =?utf-8?B?c2VOS2pqallvR01VYXpkblJRMk4vWXdjQmtwSjhaeWZnUlpRdTgzWjlac2Yy?=
 =?utf-8?B?VU5SREhhK2djcVFwVGp4d2hXcFRmNGppZThnSTZwdFZhdzBZcGt4QzlwQ1I2?=
 =?utf-8?B?SHhqcEhqSnc5a2ZTcUJiUWUrQ3YwclZNRitVUnVIVjR2c0ZqUzkzREtYS3NI?=
 =?utf-8?B?ZGNJc0s2bWlHRVhvOC9qaHdacW4vUHhjcmx1NnRUVldiVFdtY3Qvc1FmUzZn?=
 =?utf-8?B?YitWNVd2a0JNUDBHZXZTMTJEbjRBQjlsQnhqUkJPOEpEV2J4NU94L0pzVi92?=
 =?utf-8?B?c0xvWitxUldoYWFTMEo0ODNDOG9sMXJ2aDZTVFBYckMzeFpJQ3l4WERXekZ5?=
 =?utf-8?B?SkxVeTBrbzFmN0xRMWZoZnhhcWs5aklvQjlqL085anFMOHNSZng4a3h4MnYz?=
 =?utf-8?B?QThwUmZ3QnlHbGJER1BhQ1N1dkhxbTY5cmVSNTltSloxTDFHcm9MdHNnWDFk?=
 =?utf-8?B?cFRZRjM5ZHliU09TMDFyQ2x5dVBnM21NSmpEY1JLZzVyd1lIRit3ZDB6a3VL?=
 =?utf-8?B?Q0FaYlhIQkxtN1prSEI3RkZJQVRBTitZVmNyNlYzZWRkS0hoclFKTDhWeHVQ?=
 =?utf-8?B?OUg3SDgwajRJdHBrL09HNWZ3NFlhMGt4WHBYOEZRbzRNdnpEbUNOSEV5UXR6?=
 =?utf-8?B?bEVlR3k3eVR5SldqbnArOXNkdFA3b2krR3psRVJUenhUaFQwbG5jY1ZHTG5j?=
 =?utf-8?B?cjNZK1ZjeGljbmljVm9vcEtrNHl1MHF1Ym5DWnBkMDI4RjdyN09zalZLeWVR?=
 =?utf-8?B?eGdoaWlGeVBIbVJHV0hVZGl1UXNScm4wZ2t4YitpNERYQkd0NEN0V2EwamxH?=
 =?utf-8?B?emhlRTZxRTRmTzEyU2pXSjM3aVpiL0ExUWxXR3I0WHQyNE9HWGRpRkpWdFk5?=
 =?utf-8?B?M3RNL1c2ZklUZFJmK014MmtBMmtuSk81WGFobnAxQTV6UUcybmVzZjNSdlI3?=
 =?utf-8?B?RXh3Y0lEQW11NW1rWFJUcnVWVGczRWE0Z1ExUGVmQ0N2U2FTaWNRTmZQVVZH?=
 =?utf-8?B?clRIQjUwazYzMHJSYWVBbHlEYUk1bzM0L0hTem1KTjFNeTZrMW0xZUdEWnNM?=
 =?utf-8?B?aGZMdTI2SkxtNndqK0M3MmdlYjdpd3NzWCs1RW1seitGbjNtQWZVZVlSNER4?=
 =?utf-8?B?RDhNaVU2MlVBZ1JBVk1BOWhOSXJtS2lVMTlPZVNraXlTWXNjTlBwcTBqbzQ5?=
 =?utf-8?B?T2Q4d1FEL05jbEJpMWxJYVg4eWt6bEluQUtxRWJrYzMvNWNBL004SnFtOGpG?=
 =?utf-8?B?VlkvclpsbUExb25Rdjgwd0s4ZDFGTmRQNjVLNURWYzBod2UzZlNZa3JxVnF3?=
 =?utf-8?B?MlpwcnFxTEtrTWlCY0tHdEMyemtDRnYxN2N6RlVsbUdJbkl6bUp2VzRqVG5n?=
 =?utf-8?B?N1ovcEdod2RPSUZWb1Y3c0toOUxkVWIwNnh1Y1ZpN0l1SjJ1dWpYbHFRNk5m?=
 =?utf-8?B?NmZYSExPbTdrSXY5dE04eTZONno4dGlsOGd5Wmp3RDhIc3BzcUd5Mm1QRFRH?=
 =?utf-8?B?VkxCa3BBOTY5aFdaVzJEUEE5VWhOZkgxOFp0WlZNYnp4NEI2MGo5aVd3eWNP?=
 =?utf-8?B?WW9OUFdBbElFOU40QXJnTUQrWHJJblh5cWZkU1BkczdQNlZVeXBEcWFoRHh4?=
 =?utf-8?B?NU5YV0Q5cFJHVlZzT1poQlZPNC9PNzZuc0E5L01wV095aEJxY0RDK2hYc3g5?=
 =?utf-8?B?WE5mV1pKNVJJZnhJT2hrWmZNS3VnSzVVanh3S3BFd2loamExMm9udnFIQk0y?=
 =?utf-8?B?bUNxbzRZNU1FeFZGMk40Z2JwNGZIYWZlYkh0YmwwTWwzeGpZZ3ZjSG83ZlM5?=
 =?utf-8?B?cVQrYi96MHRUNXVSdmV3L1ZEcWVHcmM1S01yeWRjYndtdnQ0bEp5NDVLWHFH?=
 =?utf-8?B?cElheG94c1ZCczd4UmFIcThwL0xEajZJNE9vcTd0V1VVUWY5QUhLTGxtd2gy?=
 =?utf-8?B?SE5qdHFKWUxWQk5pT3RwOVNTMCs0VnlqbGM3aTFXaEQrSGVoQ1hZS05aVkxp?=
 =?utf-8?Q?nKlUxl4aupIUjuADIeQNhimwL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9755ae38-ab8e-461d-7d90-08dd7cd48a36
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 10:50:45.1936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0e0J2enB5XoflUB4ebMvXV3KfUrnTW5NCIFzgEDaRthVq3X6xZepFBPJVe0g+i4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5741



On 11/04/2025 16:56, Luca Fancellu wrote:
> Introduce few utility function to manipulate and handle the
> pr_t type.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/include/asm/mpu.h | 40 ++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 59ff22c804c1..6971507457fb 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -20,6 +20,46 @@
>  #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>  #define MAX_MPU_REGIONS         NUM_MPU_REGIONS_MASK
>  
> +#ifndef __ASSEMBLY__
> +
> +/* Set base address of MPU protection region(pr_t). */
What's the use of (pr_t) in this comment? pr_t is a data type. If at all, it
would want to be ...region @pr but I think you can skip it.

> +static inline void pr_set_base(pr_t *pr, paddr_t base)
> +{
> +    pr->prbar.reg.base = (base >> MPU_REGION_SHIFT);
Looking at pr_t definition, base/limit is 46 bits wide. However the spec says
that last 4bits are reserved (i.e. you should not write to them) unless FEAT_LPA
is implemented. What's our plan here?

> +}
> +
> +/* Set limit address of MPU protection region(pr_t). */
> +static inline void pr_set_limit(pr_t *pr, paddr_t limit)
> +{
> +    pr->prlar.reg.limit = ((limit - 1) >> MPU_REGION_SHIFT);
Why -1? AFAIR these registers take inclusive addresses, so is it because you
want caller to pass limit as exclusive and you convert it to inclusive? I think
it's quite error prone.


~Michal


