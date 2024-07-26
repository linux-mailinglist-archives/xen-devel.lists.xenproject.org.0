Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F103D93D6E6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 18:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765691.1176349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXNpi-0004Aj-48; Fri, 26 Jul 2024 16:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765691.1176349; Fri, 26 Jul 2024 16:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXNpi-00047c-1P; Fri, 26 Jul 2024 16:30:18 +0000
Received: by outflank-mailman (input) for mailman id 765691;
 Fri, 26 Jul 2024 16:30:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GXa=O2=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sXNpg-00046E-Gf
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 16:30:16 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2418::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54fdbe77-4b6c-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 18:30:14 +0200 (CEST)
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18)
 by MW6PR12MB8897.namprd12.prod.outlook.com (2603:10b6:303:24a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 16:30:07 +0000
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a]) by SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a%5]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 16:30:07 +0000
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
X-Inumbo-ID: 54fdbe77-4b6c-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVOyBrZQCLZ0tzjCw0XwC2wwMqMtcWrMU3IW7jx8CLGn8DC7rg6OjkEiT5oq9z4RpH5wD5I8CmUj7yqi54BnLpsIlv69KoMtXk6GbdFiCKb38JtkhsIFJ+GHRytBvLne0QZuLjnPOEpAfEBfq4w7s5FnQSe2WkPeYb3BQPi5xyXSWlwFNgSpNa07gOZV6W5UkqC2y/w2NL8XBgPj5OdXl6gp1N8Mek0YkUKGDAENvTB0YschLEGMQW+zlrIRwgueKHeZOzzbiyOa2zGzc56SVF5u9TyBH60CT2cefT8AWDbm5+zb8LhH2kXhqYVgAOYhcR3AFayCQruucQiMojk+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5/A11Jd0LhVLYAWmJfeRLAyGmxDxFiaeExH8ReIFC8=;
 b=Ev1AzMOKdza+Tlotr3oeY+Wgswb4iV/wUqGsPa2pFHuQ133p3K2tIop8NeoCZ4I+IyIG6/nECxris4T8t0KdMTEPIjZ39bq6L1lOFzD+5edz3brvpcDUy7am+CnHB3a7SDmaI8VSxqbtK44no9dWZgsZLWfAzX31U98U6AofDyFGuBbT1ltLRynZxbrIwRvHxO+zSGd4sEUCHSZCjKJK40yOtHfBl6+DWRWX0oS7LFeR6eUGooy7EWd6gn2W63n9QZTkSN/9cSENLM4Pryw3KOHn/CpXxkY0qeOzCpYbFAgybYiwrUzpZEmwMYtiP6H9+EP3iw4htailXOjDyU3trg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5/A11Jd0LhVLYAWmJfeRLAyGmxDxFiaeExH8ReIFC8=;
 b=Q1vAxk1bBLGbSBgQmjHlD4ghqsW6dIO4jKdR9xHzYfPp1V4Zn7yqOobm+BnlWSjYz4ykZk/8Ej3YW0HTg/RRgeS9p8DgL/zk9Z6q0WMvhNj1DFIub6vR2f2AQbFA7BP2SPTzsI8IQjVf4kmL3+avE+Qrby3dwKDq0Kl5XewE4Lw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <993a1f22-2d65-4bac-b466-aa4fb9626553@amd.com>
Date: Fri, 26 Jul 2024 09:30:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3] automation: add linker symbol name script
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com,
 consulting@bugseng.com, simone.ballarin@bugseng.com,
 xen-devel@lists.xenproject.org
References: <29c7f6cd166d5d3c0e9f64dc937e29dc7ecf3f2d.1721933988.git.victorm.lira@amd.com>
 <68c3ac17-2ccb-40db-b105-712d444440c3@suse.com>
Content-Language: en-US
From: "Lira, Victor M" <VictorM.Lira@amd.com>
In-Reply-To: <68c3ac17-2ccb-40db-b105-712d444440c3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To SJ2PR12MB8876.namprd12.prod.outlook.com
 (2603:10b6:a03:539::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8876:EE_|MW6PR12MB8897:EE_
X-MS-Office365-Filtering-Correlation-Id: 69808da6-1c21-4f0d-0213-08dcad9035f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WW1QWXJQME95T3MvZnU3YlVmOU92eXFjS3BBYk1vWDh1WVEzYkxiY1lzaFdW?=
 =?utf-8?B?MjRzWTBmbWlQVmUrLzE1SFc0QjZ0OXhvU1RZM0Z5ZEVlaXlMU1hTUWFETExN?=
 =?utf-8?B?V0V1TXlIcVBsV0l6bHhiOFAwSGpZNDFEejlFN25jWFYxTFo2V0VUUmZuWGYy?=
 =?utf-8?B?Nk5lYmNhc3AramU1eVg1dFFPT2FRL0NDSVlhc2lFS3RLTUhIbkVCTG4xdG1q?=
 =?utf-8?B?aGpWRVdYQXJpdHExVlQ1MUQ0clVGLys5SUY2S25HSmJNbzc4U2FjNXhpRys1?=
 =?utf-8?B?c0hHdUM4RVhOc21Zd3UxbXYyZ3pjZ1NUcjVqQjlGdzkrcFZKa3JIV2pLem5T?=
 =?utf-8?B?Ui9reDBNUDdacC83MmduYzdrdGFwSEhMcFMzdDFQWnlsaEJJZ0daWEdOcklU?=
 =?utf-8?B?US9abGVvVGdvYzlQcWRGRGs3aEVpUHI3UVV2R1VmOEw5TUxXallldFJKNDQv?=
 =?utf-8?B?WngxRTZIakhCZENZK29iOUdOWDJ2Mm01RlZpK2lITmlEeFgzelkwS013UTdY?=
 =?utf-8?B?b2ltQm5DaS81d0tZdi9SYjdBODdlcUlxQXp6VWpBdy9vWVRmazVNbVBDaTM4?=
 =?utf-8?B?WUtMK0RLTWhzUmU3eGhRd3haQ2VTK2VJT2V2a1lrZ1NOZ3JYTmtHRWNRMkJJ?=
 =?utf-8?B?MFIydENHWWZWRFlkWFovZVdVbE1WMUs0cWh3YngzbG16aG1VU3Rra3NCaGJt?=
 =?utf-8?B?OGc5UnlyRldLdXlGYWRGRnhCOEdVcklUdXI5b1JDNTJiWDdxL25FYTkrdFE5?=
 =?utf-8?B?MXliWStSWVM3bllIQVk1b204QkdLbEtaVUZYdGkvWUVHNnk1QTBtZGdCVkgx?=
 =?utf-8?B?YUxJMGtiTEIwQW8yeS9NM05UekIycE9PdHhCUXFaTDkyZXN1UEhqK2ZNa21w?=
 =?utf-8?B?eGJ4RkxyQytpNU5ESWxwaWdKSDZiSC82OWFjWW16UXFJUE9GS1NMb1pibFVU?=
 =?utf-8?B?dDRMVHhlRE1ITnNZZFBDUlFBSFI4UTNMZFc2azdTNFErbDNZeG9QUU84S2Ri?=
 =?utf-8?B?WVIvbEYxdU14Y3pwS1lQWDZBRk55aVRPYU91b1FEN2dERE9GVVRsclhjN2pj?=
 =?utf-8?B?cmhYRHpJaVBOOGEyL0hnU29Db2tHTEt1aVZ2VTZ6Zm5TNkFKQVdHUmY0anYx?=
 =?utf-8?B?QTVIdWZTWFIzbU5tVE4veUJiRjdWZ3NIN1N6RTVncmk2Q2U1bEtkL0RQQldk?=
 =?utf-8?B?bUMrZFROQW9kemdNUzQ0RDBsN3kzREU5L2lqVzhJdmZVN1FMcDRHRE03Z0pl?=
 =?utf-8?B?U2tEU3F2WCtQRUtMcXY3cC9BanZhRWhQNmlTTWlvRWtxL283bjdDY1IvQllG?=
 =?utf-8?B?cmpMd3FWK1ZxbG43emc1dGxqY2g3TG51UEUxUTNidXYycEs0dVAvOU8xUjNP?=
 =?utf-8?B?ekZ6dUFNZnRDMHB6WWJjQWkzZ2pNQTMyMmtUc1Rrd3hZdWZrbHBCQmlvcll6?=
 =?utf-8?B?MTl4eFZaMXF4T0dMYUMraGR1dkZuc2kvdm41UE1iWXdPSlRIbGdtVUduN2tV?=
 =?utf-8?B?Ynh0eHV4K3FjOTBZNU5hTUxGdDNuRWVZS3N5WnZjZWFPZzg0dkljSlNzK1Jk?=
 =?utf-8?B?eGR6OFhtZ1pHenl3VVY1b3lJWm5ZWUIwMGdtbTcwNHZpQ240c3lYckE3Wk5C?=
 =?utf-8?B?NzNBQXhtSFFsKytMWTBJeDZKZFJNcGRpTWFDYjBFVXRMM24zWnlrRGxJTE5Z?=
 =?utf-8?B?dUJnQ1F6N3pvdS9SYkZnYzhIWmErYmpvVXNSYjFneXZSdkhjdkZ4K2ppUEhi?=
 =?utf-8?B?S0E0ck5RS2szdW1pdXZIeWVWSW1acEUzZjFxNHV5UUFkY2VHSXB3U2VZdjV6?=
 =?utf-8?B?cHFMN013UjNrWk93SUZpUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8876.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXFUM0EwdnBCNkdadjRMK1JSZlduSi9FOEtpNnhkNnhxRTM3MWNNTTJUY1Jq?=
 =?utf-8?B?enFHWlFKeHNVUmNseWhVQnovR2xyNm5oZy9kVldjdTBrZGJtV3hsdFZoSmpz?=
 =?utf-8?B?bmhuUmZXTUFTS2M0Y21DeU9oSGkweDFRK0RJN1VJcDBiaHpveTc4eG9IejRl?=
 =?utf-8?B?NjRPSUw3dU82VG5VWHZmNnZJU0doTTlqRU9GMVBtanQzRUcrVi85VTV4WE93?=
 =?utf-8?B?ODNJc0J3Tm5YS05hdVhYRTdnVU1mMzVja2xUOE5oMFNhdDNGcU8xNnU4eEpt?=
 =?utf-8?B?Um16dEdLd0tJelZRQzJSZEF1YVlPc28zcHY3MmlBR1ZSOWxFdFJyNHRvSjFO?=
 =?utf-8?B?amtnTlBkV0ZDa3UzMisyVmlhMVczeVl1ZjQyVDRLUExtTm5ZbE9MKzdWZ213?=
 =?utf-8?B?aHRxTU5VbjJwUGJmTnMwWjljd09FWG90azFiWmdkdjRWdmRzNjJIbTU0alFs?=
 =?utf-8?B?cFJDSzNNbDRQQVBIa0dnL2JIL0lTbDlVZlEzSk1kRUFRKzlOaGVuNXVXVm0v?=
 =?utf-8?B?b3c5ZCtDdlltVGJmVnkxblJLRXY4NjlXa2dRRjJQNjJ2SEFhbnhtS2pYcTJJ?=
 =?utf-8?B?ZlYyVTRNaERYZWdnQ3VBd05xUkZuRkxLblBzRFhicFZQN2FXMlgxbmFtUVRR?=
 =?utf-8?B?Qy9JdFMxRTd1ZHJpbWpXY2lpS0d6N3pBZHNtc3FoNHM2L0NYQ1E0OFBGblR6?=
 =?utf-8?B?b0h1QzFqaWtZaDdUQVYyd2RzOWF0RUlpdGV1cTA2azh0a3pQbFhISkcwdkYz?=
 =?utf-8?B?Q0NEQWZkNEVqcnRYckE4Z0YvUXEvWFZyR2J4Y3pZeUJOR1RWc0NWbmo2Z2ZX?=
 =?utf-8?B?UVJlQU40RzNEMEpTT0tKNFByd2ozODZkR3JUZ3hsdVZpK2wyUnI0QXhuRlFw?=
 =?utf-8?B?Z3lpZWpMUlpNdXlrblFRZHE0ZVpYaW1lZmJSckFLRWVBWk8wNFlmcWZJeHd4?=
 =?utf-8?B?NEdzQ2RSckppTU9FSUlQVGpUbS9XOG9nNFVibjI1bWVVekc1cWU5VTFwNFJi?=
 =?utf-8?B?U1R1QWN5MjlKT3BqaG10MHlqVWEyM3c0NDlUV3lRV2twenJGRWIwdW0yYThH?=
 =?utf-8?B?K2pTNDdjZ2FkczNoZVEzdU5CYTNPdkV1clpiVnQvZkt2N0hqMUtNMk00dWxu?=
 =?utf-8?B?ZXQ0Zk1XZU9VbFlTaURxc2RnTU1JQytWSThJZmxJNkZOb3BlYnJOYXhIMyth?=
 =?utf-8?B?eGJMdHhoeW5QUGtYNXRuakh1R0hlSTlNTzU1dmxNMndUdkwwZ1FrZFc2S0VK?=
 =?utf-8?B?UzkrYmpqSUp0V0VTd2lkSmQ0R1A5Ly9KRmh1dUtVeXhkSm5HWTIxYVpVYWZL?=
 =?utf-8?B?andkdWpLeSs4RlZuc0w5VXJsQTlEcnY1UlNwQzFiUzRqTDRhNjJ2SldwdkRq?=
 =?utf-8?B?NktCZjNuY2pzT1BCMERKSEFic3dIVWkyZlRXTHozYXY0cXZ1Y2tuMUtiNS9j?=
 =?utf-8?B?c1FES0w2MTV0S0Q3Z3VUbHpFVmhPaWs0SmJHb2EyZ1dGcEpNcW1JR2NqWmlm?=
 =?utf-8?B?NzFHKzlQMUZiNndSSHRldmp4RUd0dk1UbDl0ODN0M2l4cWF5ZjdrOGNKZ2tZ?=
 =?utf-8?B?NTdGTkI0czNxTWxPT1l1NThKbWtXVjVRRjg2UVRocngzRlhhU3BjQzlzcHFQ?=
 =?utf-8?B?Tjc3SFRZMDU1b2d6dXhIeWs5QTdVZElKTmt1bjJWYnZhc0UvTUtaSXBwYysy?=
 =?utf-8?B?ZDk4bU0wZmxrbnZXVitpRHd6dXo1YlJaSm1Tb0J2eVMrd2ZlMW5nYStGak5l?=
 =?utf-8?B?NXRPVitUVXFNOXcxZnVmZ2dXUllzcys4KzF4c1pRdU5kTS9JK2pqcmIvSmc2?=
 =?utf-8?B?US96STVsVEdDbk1lcXVtWGVBVjJzQVVDc2MvaXpyRDcyTnV1eTdUMEQ2YU1i?=
 =?utf-8?B?OW9uZFRKQWNGY09DMFVlOGxnTFdMc1VzVUNaalViU29oTlpya2ZPbkVLVDd3?=
 =?utf-8?B?dzVFNTNaaVRPYS9DdWhRYzhnaGpoNk12b2t3OVpXSisxSWhHY2NESC9rS2tH?=
 =?utf-8?B?MENkYmloT2Z5Zi9OOTJwdUlJMDZHK09QMGJOYmZwTDhoSDRQWDJISWNRVUNG?=
 =?utf-8?B?MlZXZXI2NVB3Ukp2cjVUMzhvVlVRNytablgrd3d5L2ovS3BWVWV6K0NXTm9Q?=
 =?utf-8?Q?4JjiUNuDGU0/tQZIroRxx5cj/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69808da6-1c21-4f0d-0213-08dcad9035f7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8876.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 16:30:07.3147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2Cuao04v6I4PxL4lBuW8ZdbbJ5T3YsRRFQimLfxmY4qf5WndoygVhHCc7Np+uo4bRkjY74s10NkxzExq3Zffw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8897


On 7/26/2024 12:44 AM, Jan Beulich wrote:
>> +  fatal "Could not find ${1} linker script. Must be run after arm/x86 build."
> ... why you have "arm/x86" there when the message already includes ${1}.
> That'll simply go stale (and unnoticed) when PPC and/or RISC-V make further
> progress. Actually in usage() I'm similarly uncertain you want to mention
> the two architectures explicitly. Just say <arch> there? Happy to make
> adjustments while committing, so long as you agree.
>
> Jan

OK, I see your point and I agree with both changes.

Victor


