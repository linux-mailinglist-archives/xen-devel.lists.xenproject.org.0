Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC2D9A6DA9
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:08:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823653.1237680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2u0X-00062Z-L4; Mon, 21 Oct 2024 15:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823653.1237680; Mon, 21 Oct 2024 15:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2u0X-0005zt-IB; Mon, 21 Oct 2024 15:07:45 +0000
Received: by outflank-mailman (input) for mailman id 823653;
 Mon, 21 Oct 2024 15:07:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uLLp=RR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t2u0V-0005zn-Or
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:07:43 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2416::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 376bfd37-8fbe-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 17:07:42 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 15:07:37 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 15:07:37 +0000
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
X-Inumbo-ID: 376bfd37-8fbe-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJ0kVrIRDio9aSUlHJMQ2xc8vs+WPEaZSsnqrUnuoOefWD+X2GXLWmINvILZt2whZpexYvMJWv2OT9uLzbYf3NDmpm++OJHJyEfIHnZMsKFqYGq19TwbEkBfApjMGyOtK5JE7+N10+PoqXI0iWTanK2kj1evHPBB5IUFCbx4/HIKsvtxdR/oputoXRiVtOTF49dX09iCL01Rj5E8njymRIu1fHjA3MWPg/AOgngGw/9g15nw4yi2+k5hlF+LrE1qNTASRTrXjXX2pM5CW9uOQ4hj+xGk7vBdIcDCIMThwwGP5VQ3F5sf30vXrN4Nc8Jm2N4G0p4/+JfzwYXFpMSf9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vK0gOMX5GY3wYuzkvhrqd3XvZMD6GY+H+a4JObZ05fk=;
 b=DhsB+b4/v7y5BY8uQuomocbeT63Db1/oKEJwW8pDy8m9qiLfHDllO8mOhOWf6rL/UK9U6bvS7emhiXg8sKYg1Wv3stYmkrQ2+7LBP0/hEgEi72bjCUq5/RljVwXCcmFW4n9Apph7rFfppj5vPB5l8Mjqm0Et3qMLf/8BGYjmSV8bxALQnnHCv2cq+vPqQDUlt/ByIO4eCOLpby23tNomRfrOQx+TMNdVJcqTefVDwlLicBGC2S56MsdF1721vSGP0O9WbpoagWOvI/ejjnYBiGUzesKO4Zr2or9Foaovzhto8yurY5YrlfS12JPoHFHvpFERZ3W+qc7cRkTFv8fyHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK0gOMX5GY3wYuzkvhrqd3XvZMD6GY+H+a4JObZ05fk=;
 b=IHGJO4y0qOnYZf3Om6rEXj8Y7jESBvnAIQlNWVXboiZZ674KOrgd9dIFzDVfeW2p3T2KYt9NHtwao57Ktf6sTF15VeD4NIgofFAHlDSC2W8smKhuXSqHumhu28xU4++8f38xGTBUYCMVIsGIwhK3NqO33hHyeY9Bubw+D0HDz/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d7918da2-1ea7-4036-ab12-89afc6deb966@amd.com>
Date: Mon, 21 Oct 2024 16:07:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-5-ayan.kumar.halder@amd.com>
 <870059bd-d2af-4100-88be-9f6eb4facbe9@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <870059bd-d2af-4100-88be-9f6eb4facbe9@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0546.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::17) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH7PR12MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 723d41cc-bce7-44d2-0f3f-08dcf1e21969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzVPR1lMSXkwdXZYSk9VVURld21yd3VxdVk1YWR2eXovSzFWTzIwbVpsaHNZ?=
 =?utf-8?B?RU9XQi9XZU4wM2k0MW53KzR5WDVKdDRJVXVqT3RZWlkxUXNwbUtEYjFsQzFM?=
 =?utf-8?B?VURKb3d4VjhKeE5kakZaZnhoUisvUzFOeHk4NW1xNk1mUXRCbXZoWFR3ZW9I?=
 =?utf-8?B?czNnendDdE1jVVhHalMvK1djZnZWNXFiRXBDNXFxRnBhWTZGSVBxb1lvK3NC?=
 =?utf-8?B?NXBkKzhmeTltYXB4MXhTZzFVaHVOYnNJRDNEam12M2FVTUEwbGpvMjdjVUZG?=
 =?utf-8?B?MCs5dUtKNTh1VlZ4dWlrcXQ3MEcrWENmM2Nab3NwSk1CaUZIdFc1UXF5V2Ft?=
 =?utf-8?B?L0E2MjNHSUlYRTB1UmdKWkk2aURVZ29uRitnZUoyaFNIM01NdnBxVE5HVG9n?=
 =?utf-8?B?WHhhTHBXOXBGaGpGaGVENVoxNmxXK1JmS0svektpcTMzR2hQV1hUd01jNXVr?=
 =?utf-8?B?NVZTZGg5R0R6Zzh5YXE2NjZWUnNUNVQ2VzU0Z2hFZVVKQ1NTVmhPMmZ1bGRE?=
 =?utf-8?B?bTB2NWJwNThPWXQzMVNBOWw3SXE5Q0NpbTVFL2p0UXY5YjJKaVovVThZSm95?=
 =?utf-8?B?cVZRWmFZbGQ1elcweXpNVklGdWdvL0V2dHdEZmF0U09FSFo0anJWaHhNcWlK?=
 =?utf-8?B?NnBOMmh3d1lzcXVWekFzclVoN1REclByczhkWVhjdUdUZkE5V014SGxXUnR6?=
 =?utf-8?B?MFpVT1JMQ2ZBQVFja3h2VjAyVENmNHpBK1RsTnE2dmt4UDlpd204dzE3ZFVx?=
 =?utf-8?B?bjFnaWpJMHFHK2RNaXVOVHI2aFJSWHVvRG9qVUJ3WDVpbGxXN0xLQ0hEWHMv?=
 =?utf-8?B?Unc1ZTE5OVVNS0RQWGdwQXhlTElucEprVHJZcHFONHpYUE56QlVkTEc3UEJ1?=
 =?utf-8?B?R0diYlc2dzRYVkxLaEw2dTNuMTVPYTBGdDBFRVhOUUU0ZHlVcE1meTZVVDRn?=
 =?utf-8?B?anJ2cmJiMWFoK0twbXRXbVZhU0ZYb1BKSklVTGVNdDlpUG1CN041K1JwVEtP?=
 =?utf-8?B?dmh3MWV6Ky9iNDZQQmV1L0xlL0JHOHRKUzFxU0cwdFFsaUtQQUl4MVQwN01Z?=
 =?utf-8?B?OTJEdHV3VVZzRi9BbmlrWkNXWGp1RWROYjBWS3RybUkvSjhhdFE5TWhPSFBM?=
 =?utf-8?B?enhGVmZLREI0dXg1ZmJieXhMSElQeFlFd0tVblcrNmwzWFp4N28xK1FIbEZq?=
 =?utf-8?B?S1B1WjZHaE12Q2NvQ0VGOWNaOUZxM2x6WG9Md3BIck1lVTIxemltZExEUTky?=
 =?utf-8?B?OGxPcW0xeUFqYmgwSEtwZElOUWV6Y2JGcnQ3SXlkaE9iMFhnTkF3eEs5QmpG?=
 =?utf-8?B?d2d1dUhQN2laU25lWE5SR05wNVJhUkcxclNzM3hzckMrdzNnQ1Rqcm13eHln?=
 =?utf-8?B?S3J3dEEyMHNiSzNiNGFiR29hSEd5WVA4NzhGSFNSbUZtcktBL3RGYkpjVjc5?=
 =?utf-8?B?RGxJbWFHMUE1ZngzN3JsSU14S2dCSzl4L05laUpvZ2xSRUg2TmdTaHpuZ2RG?=
 =?utf-8?B?NFZPU2VTUXhGZGwxckJ5VmlCQWZnWWZzUzQ3Ukc1d2dsNkdJQmtueDZ4TFpH?=
 =?utf-8?B?N09ORUsyL09Ddll0SENhOGxZazBQc2lmQVc3eDdxb3Jrc29qMUl4LzFaaDRJ?=
 =?utf-8?B?cTk3QU5pRDJ0NzJWdWRVU0JLMjVOL1ptL2FTYlJZRUFGZm13am9ZdVRHdEgw?=
 =?utf-8?B?aGZ0U3dTMGIzUVhlcVU3M3cyZGNhaGFoKyttQkZMeDY5dm1xSG43TjVFSlFV?=
 =?utf-8?Q?hnSXLXW8/Tpwi1gki4bS289hsXS4YaLrpX0S/CP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEFCelRldkFNVnZFdFl1ZHdNWkNDaW84V2ZXeWRuVjA3OTV2QzhaL1pDRzJi?=
 =?utf-8?B?NnFFdHA2aVZkb1phaklFRjFBOG42WGtwdnRrZmt4SklDZFZTZzMyRnpGU0lq?=
 =?utf-8?B?OEZJaGlhNmppMURvcWEzdFpWbWtNR1gzZkRoanlSTmVuSHhwSmFwazNkeVVk?=
 =?utf-8?B?bWI1L3FtNGVEaXR3b1l0QjMzdmYxRE9qZmpRdHc1SURNVmZwNjQ3aVN6TFJK?=
 =?utf-8?B?RFRFRUVoTUFjTGZsdVIveEtvNlRuZUc4UWFPRjhXU1orVmYyTGkwbUNiU3JH?=
 =?utf-8?B?RVVld3hVeW0xTnhQNkZ6MHc5UWVjaHpBbklaQUxZaVpiZ3NmbzV4MlR1ck1s?=
 =?utf-8?B?RXJqaVBqSjdMVDM1ZWFEQ29GdDFGaS9ENU1paGlhZHhhbHF6emYrdzlOMmVy?=
 =?utf-8?B?eXNzZTVBRU5wUTl3bGhZREtkT3lrSDhjaW5BSlJaS3ZNSEhqbVcrNXF2Yjhs?=
 =?utf-8?B?cmFyYzJXMmthclFyUUhNVVppLzhISzdZWFA2dlFNZkdyZVM4aGlWZ0NlNDVX?=
 =?utf-8?B?TjVLZGJHMnF6bXhrRVNCN2VObGVLTUJNVWhMQ0NKZWNWSFVUem1mcWFDajd0?=
 =?utf-8?B?eGVZbkVoRHN4RDhuK1Y4V3MrOUJEMG9RbUorenp1WmV4M0ZzbmxzZlFJUjRv?=
 =?utf-8?B?OGdNbHIwSVlEVnlhVVM5SUljdVRIbXdCcGVoaERrWmpJZUl0SmcweWU5SjdJ?=
 =?utf-8?B?WEFZV1Z6U1JHWllrTjNHVnF6SFZ4MjFUcWc3MDVDc1VsbkEyUjEvSkRPOGI4?=
 =?utf-8?B?NkpBWkdtT29JNGV0dHV4YVFaMkVUOW9abGxJTldFeTZJMHVhdFNLdWhYdjNk?=
 =?utf-8?B?M1FsbUZhM1BCY0lSdmw0YXgxTWlMaXV4UWRKSU5MNXZhMTgwdUg2bjhRbFhh?=
 =?utf-8?B?NUVnc1ZYNE85S0E1My91bmZaQ3UrS1A3bHFFMGoveGV3aERKS1ZKeDNJU2lG?=
 =?utf-8?B?ZWs0WVdFbGF4MDREY2VMUXJtbUJsSTNRcG9obmwwNFk0S1NJWjhBWGM4MXRv?=
 =?utf-8?B?aHJPdEhMSTRQWEYzKzlWTVowVm1XQlpaZjJyQ3F2OGxqV0RnQXRSWkR2RFd0?=
 =?utf-8?B?Z2VURnROTVJIMUxCZ3VXdm9CRHVscEptWlVsQzFqWWpjMUdzOENkUXA0Tjh3?=
 =?utf-8?B?UnhXbGpyYm9TKzYreHFWQmdOYmQ2QUw2WjhEWEs0QlFSRVFOZ1hDWTJOUVpF?=
 =?utf-8?B?VFloeDkrS0luYnNIZTR4dUNPcEkrUEpwaGUzQ2NHY3pvblZwaHdOVjc3MmRt?=
 =?utf-8?B?VkJ5cnNrWUpUeW9GRDlyaU1rM2tqbThOdVBpemFxRTdnNXZXcHA0VjNWelE4?=
 =?utf-8?B?MS9lQnVKa3JWaG8vckNISUVuWWxCREMyekpKZFgxTTVIZXBjWElYSHpMcnNp?=
 =?utf-8?B?UTNhQTNPSjV4eWEwWGx2RVFLaG51QThuVEdueHFNUFhta05SWjUvQ24rU2dr?=
 =?utf-8?B?eFdRbXc4V3lFZUdNaC8zckwycG05UUc4NFNJaExjalRieGl5ODJxbkdlWTRy?=
 =?utf-8?B?STJTZURCWldXQmF3dFZnMDloajlidXJoc3cwNlBjRVNGTWpZTUtuNHIvRnR1?=
 =?utf-8?B?dmhPcXE2b3VmRVVrdGxQb3E4aTZ6bVJXbHlPYk42d3FpNytJRUJXeGlwYmhJ?=
 =?utf-8?B?OUZaYUovYTRiK0ROUWo0Ky9jMWtVdEg0ZjR1T2FFdTRyVlNsTHZsMk5OY2Na?=
 =?utf-8?B?cnNtVmlKTFFWTlEzUWZMY2pYYVV1bGdBSDcrYldJVUM1R2lmUEhqcGs2bzFD?=
 =?utf-8?B?RER5YmdRdytrY05GdFl4Z1FTUk4wckVXSXMxZTU2bmlpSVNWSTFlYmltbHE4?=
 =?utf-8?B?Qys3Q3draC9LVkdaYkFmSklya3p4YjYwVzZNSXRtdmIvc0FDYU9ZN0dKbURI?=
 =?utf-8?B?eDg0bUVBcFBrNnovUnR1Y2lyVlEyREx1WStFMURzRFlJMHNqODBDWlg2aG9w?=
 =?utf-8?B?K1JlWWZIRzRSZzdxU3JzS2hoUm9jQ00xUkkrdVcrYk5YVE5tZGp2cDVIZ1Zv?=
 =?utf-8?B?VkYvcmkwSjFsR2JTOG8vZFozcEQ5RjRzOWxNdHFGR1BodzZsdkJwTlk4QzJv?=
 =?utf-8?B?OWkwWFRheWVEcGo2WE1jZHhFVy9xV2xHWkZUcUFSNldyS2tZSkcvRW5WMHJr?=
 =?utf-8?Q?kcNN0X2SVJizTi+dJ2unDSRNq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723d41cc-bce7-44d2-0f3f-08dcf1e21969
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 15:07:37.4009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXKgyHKV23eECycdcXiZphoXmNOhkKvA5NfC/q3dhex1qH8amNQ9wPVkx5BVUHa3ffz094RKizhMnJkge6a+8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8826


On 18/10/2024 23:13, Julien Grall wrote:
> Hi Ayan,

Hi Julien,

Just one clarification.

>
> On 10/10/2024 15:03, Ayan Kumar Halder wrote:
>> diff --git a/xen/arch/arm/arm64/mpu/Makefile 
>> b/xen/arch/arm/arm64/mpu/Makefile
>> new file mode 100644
>> index 0000000000..3340058c08
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/mpu/Makefile
>> @@ -0,0 +1 @@
>> +obj-y += head.o
>> diff --git a/xen/arch/arm/arm64/mpu/head.S 
>> b/xen/arch/arm/arm64/mpu/head.S
>> new file mode 100644
>> index 0000000000..4a21bc815c
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/mpu/head.S
>> @@ -0,0 +1,130 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Start-of-day code for an Armv8-R MPU system.
>> + */
>> +
>> +#include <asm/mm.h>
>> +#include <asm/arm64/mpu/sysregs.h>
>> +
>> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>> +
>> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>> +
>> +/*
>> + * Macro to prepare and set a EL2 MPU memory region.
>> + * We will also create an according MPU memory region entry, which
>> + * is a structure of pr_t,  in table \prmap.
>> + *
>> + * Inputs:
>> + * sel:         region selector
>> + * base:        reg storing base address (should be page-aligned)
>> + * limit:       reg storing limit address
>> + * prbar:       store computed PRBAR_EL2 value
>> + * prlar:       store computed PRLAR_EL2 value
>> + * maxcount:    maximum number of EL2 regions supported
>> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not 
>> specified it will be
>> + *              REGION_DATA_PRBAR
>> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not 
>> specified it will be
>> + *              REGION_NORMAL_PRLAR
>> + */
>> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, 
>> attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>> +
>> +    /* Check if the number of regions exceeded the count specified 
>> in MPUIR_EL2 */
>> +    add   \sel, \sel, #1
>> +    cmp   \sel, \maxcount
>> +    bgt   fail
>> +
>> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>> +    and   \base, \base, #MPU_REGION_MASK
>> +    mov   \prbar, #\attr_prbar
>> +    orr   \prbar, \prbar, \base
>> +
>> +    /* Limit address should be inclusive */
>> +    sub   \limit, \limit, #1
>> +    and   \limit, \limit, #MPU_REGION_MASK
>> +    mov   \prlar, #\attr_prlar
>> +    orr   \prlar, \prlar, \limit
>> +
>> +    msr   PRSELR_EL2, \sel
>> +    isb
>> +    msr   PRBAR_EL2, \prbar
>> +    msr   PRLAR_EL2, \prlar
>> +    dsb   sy
>> +    isb
>> +.endm
>> +
>> +/* Load the physical address of a symbol into xb */
>> +.macro load_paddr xb, sym
>> +    ldr \xb, =\sym
>> +    add \xb, \xb, x20       /* x20 - Phys offset */
>
> Sorry I didn't spot this until now. Xen will be linked to a specific 
> physical address, so why do we need to add an offset?
Yes, this needs to be removed. x20 contains 0.
>
>> +.endm
>> +
>> +/*
>> + * Maps the various sections of Xen (described in xen.lds.S) as 
>> different MPU
>> + * regions.
>> + *
>> + * Inputs:
>> + *   lr : Address to return to.
>> + *
>> + * Clobbers x0 - x5
>> + *
>> + */
>> +FUNC(enable_boot_cpu_mm)
>> +
>> +    /* Check if the number of regions exceeded the count specified 
>> in MPUIR_EL2 */
>
> AFAIU, this doesn't match what the instruction is doing below.
Sorry, this needs to be removed.
>
>> +    mrs   x5, MPUIR_EL2
>> +
>> +    /* x0: region sel */
>> +    mov   x0, xzr
>> +    /* Xen text section. */
>> +    load_paddr x1, _stext
>> +    load_paddr x2, _etext
>> +    cmp x1, x2
>> +    beq 1f
>
> This check seems to be excessive... I can't think of a reason why 
> there would be no text at all... Same for a lot of the checks below.
Is it ok if we have this excess check ? The downsides are only a small 
increase in code size and boot time. Otherwise, I need to justify why we 
have this checks in some places, but not in others.
>
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>> attr_prbar=REGION_TEXT_PRBAR
>> +
>> +1:  /* Xen read-only data section. */
>> +    load_paddr x1, _srodata
>> +    load_paddr x2, _erodata
>> +    cmp x1, x2
>> +    beq 2f
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>> attr_prbar=REGION_RO_PRBAR
>> +
>> +2:  /* Xen read-only after init and data section. (RW data) */
>> +    load_paddr x1, __ro_after_init_start
>> +    load_paddr x2, __init_begin
>> +    cmp x1, x2
>> +    beq 3f
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5
>> +
>> +3:  /* Xen code section. */
>> +    load_paddr x1, __init_begin
>> +    load_paddr x2, __init_data_begin
>> +    cmp x1, x2
>> +    beq 4f
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>> attr_prbar=REGION_TEXT_PRBAR
>> +
>> +4:  /* Xen data and BSS section. */
>> +    load_paddr x1, __init_data_begin
>> +    load_paddr x2, __bss_end
>> +    cmp x1, x2
>> +    beq 5f
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5
>> +
>> +5:
>> +    ret
>> +
>> +fail:
>
> This name is a bit too generic given you use within a macro. Also, I 
> think it should be its own local function because the macro can be 
> used anywhere.

Ack. I will convert this to a function.

- Ayan


