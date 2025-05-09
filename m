Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A72BAB0B0B
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 08:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979808.1366309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDHda-0002yh-MX; Fri, 09 May 2025 06:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979808.1366309; Fri, 09 May 2025 06:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDHda-0002vY-JG; Fri, 09 May 2025 06:55:14 +0000
Received: by outflank-mailman (input) for mailman id 979808;
 Fri, 09 May 2025 06:55:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ji9h=XZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uDHdZ-0002vS-5V
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 06:55:13 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2009::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bfd1ec0-2ca2-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 08:55:11 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA1PR12MB5640.namprd12.prod.outlook.com (2603:10b6:806:23e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 9 May
 2025 06:54:47 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 06:54:47 +0000
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
X-Inumbo-ID: 8bfd1ec0-2ca2-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLTb3CUZnaLrG53uAimt1PC7nAF0eStSzKA5GMb5CBt/scLsnBh3nOvlQEs7ZsQxcBZwzQi3Ujj90zDmu56fZY3HV8u+lrRiSPEe3oSXi/rV2b6smEJ7HbeFsNsWN/d5pFQx8vKdZDFIFuSChht1qChecag8RRb1vmriJutR+8Z1ZLsdliwT+8S0hl4jVzJpZy7wjfsSgAdlB9v7mTzu7ri4me5FDcFzH8q5jvUrxmV/pM32Z2JdjdQbjbMd2qREWMjsDO6s9X+NqLNqJ5sJd7RTfckBiwKXlEG5P6FH9FxyaPrad6avSSWTcgGpyA81+80yUWa2hgd/2I47efcXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WM4/BbTKRObY7yBOBEXzESKHwCuU7WnJu6KhkyapCHw=;
 b=dO7km+1zw5S9D0FQk3ycryknIl9NXAyIbVKJR+IeCcszGb12A6KhhjWVta9qa7L2EqgEXKM7pP8TgNHVf0acVuJ6P3TAghk9fa3ywaf7rPB78n2oBg9SUOZBqbOmbH4Docd4uWv8HciMnaYEa4uja4qgZqG18Twy2M3DbBqPJJHNgq3WWYX7VYl8+9c64Na3OaIKqWJRlce9uqEBwMIV4gx3k5ONkwoN+6kUvCMfdaBym2x2k67rMnGvsP/WjyrtIuSJF2/p6HN5Z6lKRIXcZzYypVxhIN5oYIacLwccpIa8ZODnUqjTqctzzCpzbx00aHZzZJKWg2Gtu8mxEV37+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WM4/BbTKRObY7yBOBEXzESKHwCuU7WnJu6KhkyapCHw=;
 b=stDCxG7VdLKIcKyW7t79Fy2tekUCUH7H9+eeXv81TojvDAaGaN7PKq3/mdiC9y3rmxnpKAoqEK9JTGPV8/w1UuMWRiG2pJqsLL/S78oBlHdR5KyEkRHQGvJLGiUh+8APTTNmDsBds7AsqKgcuw140tVkuYDnB3i+xlwIf4nx0F4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3caa25d7-9faf-4099-a0a2-f7014c01e1ce@amd.com>
Date: Fri, 9 May 2025 08:54:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] xen/arm: exclude xen,reg from domU extended
 regions
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
 <20250508132040.532898-6-stewart.hildebrand@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250508132040.532898-6-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0323.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::6) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA1PR12MB5640:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2d0848-f7a5-429b-37ee-08dd8ec662bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eW1iS0ZHcTIyMUdzWTBsYUlncWU4WTNtcmFUV0oyUUNDR1QzbGw4VFpDWDhZ?=
 =?utf-8?B?bHVTUEtwRG9rM1RjWkdFUXU5Lzdya0pjdVFUOUxvOFJERHFDTGJpUUJaODNq?=
 =?utf-8?B?bFZqTVE2TFVySW1qdnUxR1IwQ0tCMFp6SzJUNnA1RlVvR2RnL3k4MXJ4WGFL?=
 =?utf-8?B?SGhKNGRHVkswdFptUVFDL2VEODRUS1RhUS81TjdsU0huN3A1WlRUMDkvZ0Vz?=
 =?utf-8?B?T2hPMS8zd3ZVaEtaSGpjWVFKKzd4RDVMYXZHeTE4cUtSWU5BTnYxTXQxVFJG?=
 =?utf-8?B?bk5kVnRERVRpUnhINktmaUdPQlg5UFUvZHA3Rm1VVFR0ZGpYUElxZncvMzhY?=
 =?utf-8?B?R3dIM3RCRFVqVjRVZEk5WU96RWpEa2IxR1dBS0h6dm1YNVBUUFpSSjNjM0xn?=
 =?utf-8?B?R2d4NXU5WGlwOFpndHI5WExnelV4bFZuZzBmY1RsQS9pQnNET1lTU0lDRUhC?=
 =?utf-8?B?UTFnK3hRYisxcDNJdS80c1ZHYWFocVNyYXdHTUI0R2JnQUhjbW5UZlBHQVVO?=
 =?utf-8?B?OHk3ZHAydzhmcVVydEtaZ0RYYjQ5MEl3ZzM1TVZKMGxKTkYwWFV4R0JTS2to?=
 =?utf-8?B?NlE0VGxFOFdhNHNwUjk1cXZBYXkrc1hRbWV1c0FrY01kZ051UnY4d2ZmSVFQ?=
 =?utf-8?B?eUc2eW9ieFo5L1FIVVh1MHM2TVNIMXo2SmdrcWI5QlJNZFRJMVJvMjdkTGQx?=
 =?utf-8?B?RFlRcTdEQlRaODFiRXpoU3NpUDJyN1ZtREFMc0svcC9VZ2oyVWxHclFDK2N5?=
 =?utf-8?B?Q003SnRQZ3pOTFEwZllXL0UwWGJIdmZzRXlxZGQ0R2QzQ3oxOEtqVlhKc3Z6?=
 =?utf-8?B?UDc1Rjk3Z3FMZjNDVmZyYWtYR3pmYWpzOTBocTNNWE1JYlpzOTF6cEdFMWNM?=
 =?utf-8?B?M21tTG5VV09PMUY4TW1Bc3JyUGwwc2VDL1Y1VmlCS0FMQlhnU2kzWmlka1FK?=
 =?utf-8?B?ZXVUbSs3ME8xTExJeG1BWFN3MFYyRDVkWjV3eEw0QnVwYmtIdk54N09Maklo?=
 =?utf-8?B?QXl6V1pBUFNTWThkTHkvNzhZZEc4SlMzY041N2hvemdxS1dvQ2tqRGgwbVpF?=
 =?utf-8?B?azIvMS9YTzNpTEpxMXgvUU42aTRoKzJJUXV1M2UwQlFoR1R6RVNGVDR1MGR3?=
 =?utf-8?B?cC9tVitjOTZqcUtOMzFjZjhvMnpBRElaWWRBWlE5aVlNTWUxeXpWckp6Vit6?=
 =?utf-8?B?aEhza25ZdVhLcGNWUU1QK1NlSjFldnJRMnJQbzRxQk14d0dDNjRwTHpiaHRG?=
 =?utf-8?B?NGVNWk9yZXF1R2hMMjR1Y25aUGdPNDVDcW11K2dLVXJsVDBLZFkrTTNaM2Jx?=
 =?utf-8?B?MVpWOFllYkFxdnNPR1pRSVZPcE80MkZwTFEveHZkVDFka01IOFphOUFvV1hR?=
 =?utf-8?B?RWJpK0s0S3FncHpvMUFaSXowb3ZsTURVTllNejZ6K3NNMHZhNElUcTNya2xB?=
 =?utf-8?B?UFFlODZoaVM4NDM4Q3c5QmFLc1YycC9SbEFROFB6cUJqN2tCRlFjdUlmaHVr?=
 =?utf-8?B?SWNlL003SElCT3NDRFNva1l1UmR0QmJ1L2c3ZTlxa29uYU5rTERrdXphN0pz?=
 =?utf-8?B?ZUt3MS9XRkI5S1VlWlJmcFV3dHByeTVnL0IreWs2RlJaMThYMDQ0c0ZFbmlk?=
 =?utf-8?B?ZUdxaTFGT0RWTHdaUGJhMFdFU2ZVS1ZpVEYrTWZNWkFqTitvVXFnaUFJbXNz?=
 =?utf-8?B?V2x5ZVdLMVYzUHJ2eGpsWVQvQ3oxZVNUQzBnQmwwcFFyVU0xVXBiOEtQSWdl?=
 =?utf-8?B?aFJYY3VFMWZ4d3NrcG04V29iTk1qazRyUlNDN0xhMjB0NDRFZlhDL3NEdFBG?=
 =?utf-8?B?QXFHZkJteEgvbUg0aWFVUkNoUVRuRHVqTnNTS0RUQ0tpaUQrOGwyOFZaZktQ?=
 =?utf-8?B?MmtMZ3grR0NMMlUzVFpTU3VUakZhRFhCU085TWJNWExqVUNyM3Z1MFl0RmY2?=
 =?utf-8?Q?n2piAheqyaY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVBOY04ycEhQcUhheC84NGJNeE1iMFRVWGtuNWtWbmlScVpSekZxNzlKKzBY?=
 =?utf-8?B?MGUxMEVRTVRTTmM0YVZQdExuRGwxK29XRDU2R2ROdTAvMUYxVEFJRVNaQnF1?=
 =?utf-8?B?V0VWSXRLNmt3OWVYbkdxNVRiWlNzQ05LQ3h4QzYvZFhVc3Nlakh3K1JLdTBF?=
 =?utf-8?B?aGpCbCs4a3A1MTJUU1dnZDkzNk15bW5jWTdoakJiZGU1d29uWTJNanZGbUxW?=
 =?utf-8?B?QWxBcmVTUkpmWXRHRnpKSjJXeDc2S0RrbWdlVjk0RWhkdWJUZWRlTXozWXBi?=
 =?utf-8?B?cEVrUkc5VlhxckVvQ0czODRZaUc1b2pPdkUxUzJGb21aaUcyR3VOUTA1WWZz?=
 =?utf-8?B?emNlVXhpREQ5alhRWWFLcW92Z1dsWHpiYzIzY2dkKy9HVFY4VFdMeUlXMlY0?=
 =?utf-8?B?VmVxNk4rcStlWkxpQk5PVmsrcFVrbi9VRmI5VUZCb0g2MHVGUW5HQ0xpT2Ny?=
 =?utf-8?B?dll3Sjg3enNzWnY4U0pxMjBINmdyVFFmS1lNc1JRWmtCRFVHUlNMNVpNOEg5?=
 =?utf-8?B?eVE5Rk1vdkQ0dHJTQW9BbzljVXRCNFhXWUNTbFNLQmRJKzJ1QkFvOWZJVmtX?=
 =?utf-8?B?RVc1NFFmcVpOclJIa0N2bFFQYzVPbURpVTJ5NnRodldvditzWXhFT3ZLRUpK?=
 =?utf-8?B?SHVZUDkxUlpldTRFQStWMnB0ODEzSXNvaWc2L2t5RjRwc0tLQVBUWmZkaVNE?=
 =?utf-8?B?K1NWQ0tTTmZleEhEQStFQ1BwdXNBdE1wbVdTN2NKZnhHbUhaUmNyZ2U0eGZ6?=
 =?utf-8?B?NmFURUd1MUpIZE83L01ERzgrYTU2bG5FZmFvdmZIaTRGYURsanlvWSt1VjZ2?=
 =?utf-8?B?RXY4R0dUZzlrNFhTdnljNHozZ0lXUk5jTnBJc1JKNjNZbWtMaW9qM1J6N3Ny?=
 =?utf-8?B?S2hBZlFrSnl1SytSUGlPa0Q3N08zdUh3YU1Gd3JoczlvSit5Si9lL0t5dVZs?=
 =?utf-8?B?eEFhdlo5dDZwTXFVV0t3V0daQWFPRUxpWmFkU0hMSmpYUUdMR0FOV29IVFl3?=
 =?utf-8?B?dURERFpKWS9qTWI2bG5nYmJ5RDFXZTAvS0xkT3p1bmtqYlRvcmdMdkh6dlBF?=
 =?utf-8?B?ZmpoTFVFOEdZTE51UHNmWnRxRGNLZzB0VHp3c2hXTmVEZm1Rb1RPeE42eSts?=
 =?utf-8?B?ai8rRnorU1FoSUZFaFE4UHdLMmJBN0tEeDhBQkw5eGdWMWNtYXdiM0JpVmJR?=
 =?utf-8?B?aHovTUpLNHN0eGw4Wnk5OEhIWm1LamhYRCswNDNRbkdSRkhrQUhYbVpqZzdJ?=
 =?utf-8?B?enNVK3RqNG9zcVJPcUZqOXF0Ym1ibmRManhMRlF1akdwMldOZUxQcXI2YWtH?=
 =?utf-8?B?N1F0czJkVklSamJxUTV5NHJJOFRoKzUyVUhyTW5zUGk5bHFrd2FlNFUwTnNN?=
 =?utf-8?B?amlSNk1yUWNkZ3FoY0FqK0RBSEFBNXJwSWs1bmxVOEJsWktQZzJUQ01FVHhO?=
 =?utf-8?B?YWV4VE1wTUE2ajlZTGM4K1VKcjN3WDhxakpRMnBmUFdXSHdWajNVSWN0Zy80?=
 =?utf-8?B?MUVoRzZ3QnkxbFRDUENsVkZ0b3BEakZMb0xFeStYSlM4NGUzditCdHhLVDFK?=
 =?utf-8?B?OEhRL1NnV2IzUFlsVEpIM0lFS3NwSWJMMUlMY29OUmtWVjQvd1pEaWkrbGpT?=
 =?utf-8?B?QmxlRVAyeXhZd0lFcHd0amR5ZFhESGE3ODdld3Z4RHUrWmorNkdnRENISC9o?=
 =?utf-8?B?SU43MlZiazNtc0hZU2xPbVFQam53bExEL2tjcVdWckN0UFI3d3dJL2hjOGZ6?=
 =?utf-8?B?V0kyR0toMFpGVGYyRXV0akloUlhJdzdtYm9CQ1F0TVh5N1Y5a0ZqVFUvZjhl?=
 =?utf-8?B?WHovMjhDejlVblFWM0MxUnhTUXlueXVHc08vK3JHby9IOG9POWx2MTFLbFdL?=
 =?utf-8?B?V0xnVkFtbHh0RlJBajBmNW9USFRmYWdZWU5sc3EwQUxKRnNHRUdIOTBkTTgz?=
 =?utf-8?B?UkFReENoZTREWjhta2dXVWpLc3FPSGh3WjRSck5XdGlnT2dxZE01cVNFOW1q?=
 =?utf-8?B?Skd3MklXVUg2UnhwUVNPNzl5ZUVhZkFnb3JNVnVqYzZZUmtsUk45UzdXL0hK?=
 =?utf-8?B?SGoyR2I3UllFaGREbXQwVGFrRStZczJRdDNZWVRndnBVWjQvWEdSQVhmSlFK?=
 =?utf-8?Q?kInc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2d0848-f7a5-429b-37ee-08dd8ec662bf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 06:54:47.0132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U++yGcF67cK6u694tNPraViKh/BqAKTD1CJHvnhr22526/nZIs9K6lJ/ZTIjzAoj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5640



On 08/05/2025 15:20, Stewart Hildebrand wrote:
> When a device is passed through to a dom0less domU, the xen,reg ranges
> may overlap with the extended regions. Remove xen,reg from extended
> regions.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> Not sure if we need a Fixes: tag, but if we do:
> Fixes: 2a2447757b3c ("xen/arm: implement domU extended regions")
> 
> v1->v2:
> * adjust commit message to not mention xen,reg-cacheable
> * don't call rangeset_destroy() in construct_dom0()
> * rebase
> 
> I investigated an alternate approach of parsing the partial device tree
> again to scan for xen,reg properties, but it resulted in quite a lot of
> code duplication. Adding a rangeset pointer to "struct kernel_info" has
> a much smaller diffstat, and then we avoid the need to parse the partial
> device tree a second time.
> 
> I discovered this issue when booting a dom0less domU with a device
> passed through. Partial device tree excerpt:
> 
>     passthrough {
>         ... <snip> ...
> 
>         axi_uart16550_0: serial@a0001000 {
>             clocks = <&uart_fixed_clk>;
>             compatible = "ns16550a";
>             interrupt-parent = <&gic>;
>             interrupts = <0 89 4>;
>             reg = <0x0 0xa0001000 0x0 0x1000>;
>             reg-shift = <2>;
> 
>             xen,reg = <0x0 0xa0001000 0x00 0x1000 0x0 0xa0001000>;
>             xen,path = "/amba_pl@0/serial@a0000000";
>             xen,force-assign-without-iommu;
>         };
>     };
> 
> The domU was assigned an extended region overlapping with MMIO of the
> passed through device:
> 
> (XEN) d1: extended region 0: 0xa0000000->0x100000000
> (XEN) d1: extended region 1: 0x200000000->0xf000000000
> 
> The domU panicked when attempting to initialize the device:
> 
> [    3.490068] a0001000.serial: ttyS0 at MMIO 0xa0001000 (irq = 15, base_baud = 6249375) is a 16550A
> [    3.498843] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> [    3.498853] Mem abort info:
> [    3.498855]   ESR = 0x0000000096000044
> [    3.498859]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    3.498864]   SET = 0, FnV = 0
> [    3.498867]   EA = 0, S1PTW = 0
> [    3.498870]   FSC = 0x04: level 0 translation fault
> [    3.498874] Data abort info:
> [    3.498876]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
> [    3.498879]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
> [    3.498884]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    3.498888] [0000000000000010] user address but active_mm is swapper
> [    3.498894] Internal error: Oops: 0000000096000044 [#1] SMP
> [    3.498899] Modules linked in:
> [    3.498908] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.10-stew #1
> [    3.498917] pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    3.498924] pc : mem_serial_out+0x18/0x20
> [    3.498936] lr : serial8250_do_set_mctrl+0x6c/0xc0
> [    3.498943] sp : ffff800081bab6d0
> [    3.498946] x29: ffff800081bab6d0 x28: ffff8000815e0dc8 x27: ffff000001c29c60
> [    3.498957] x26: 0000000000000000 x25: ffff00000347b900 x24: ffff000005504c00
> [    3.498968] x23: ffff00000347b800 x22: 0000000000000000 x21: ffff800081b69d78
> [    3.498978] x20: ffff800081b69d78 x19: 0000000000000000 x18: ffffffffffffffff
> [    3.498989] x17: 3d20647561625f65 x16: 736162202c353120 x15: 3d20717269282030
> [    3.498999] x14: 3030313030306178 x13: ffff800081a21ff0 x12: 00000000000007fe
> [    3.499010] x11: 00000000000002aa x10: ffff800081a4dff0 x9 : ffff800081a21ff0
> [    3.499020] x8 : 00000000fffff7ff x7 : ffff800081a4dff0 x6 : 0000000000000008
> [    3.499030] x5 : 0000000000000000 x4 : ffff800080797584 x3 : 0000000000000002
> [    3.499040] x2 : 0000000000000000 x1 : 0000000000000010 x0 : 0000000000000000
> [    3.499050] Call trace:
> [    3.499053]  mem_serial_out+0x18/0x20
> [    3.499059]  serial8250_set_mctrl+0x34/0x40
> [    3.499065]  serial_core_register_port+0x534/0x7dc
> [    3.499075]  serial_ctrl_register_port+0x10/0x1c
> [    3.499084]  uart_add_one_port+0x10/0x1c
> [    3.499092]  serial8250_register_8250_port+0x308/0x4c0
> [    3.499102]  of_platform_serial_probe+0x2c4/0x48c
> [    3.499110]  platform_probe+0x68/0xdc
> [    3.499120]  really_probe+0xbc/0x298
> [    3.499128]  __driver_probe_device+0x78/0x12c
> [    3.499135]  driver_probe_device+0xdc/0x160
> [    3.499142]  __driver_attach+0x94/0x19c
> [    3.499149]  bus_for_each_dev+0x74/0xd0
> [    3.499155]  driver_attach+0x24/0x30
> [    3.499162]  bus_add_driver+0xe4/0x208
> [    3.499168]  driver_register+0x60/0x128
> [    3.499176]  __platform_driver_register+0x24/0x30
> [    3.499184]  of_platform_serial_driver_init+0x1c/0x28
> [    3.499192]  do_one_initcall+0x6c/0x1b0
> [    3.499199]  kernel_init_freeable+0x178/0x258
> [    3.499209]  kernel_init+0x20/0x1d0
> [    3.499218]  ret_from_fork+0x10/0x20
> [    3.499228] Code: f9400800 1ac32021 8b21c001 d50332bf (39000022)
> [    3.499233] ---[ end trace 0000000000000000 ]---
> [    3.499237] note: swapper/0[1] exited with irqs disabled
> [    3.499247] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    3.499251] SMP: stopping secondary CPUs
> [    3.499284] Kernel Offset: disabled
> [    3.499286] CPU features: 0x00,00000080,00200000,0200420b
> [    3.499292] Memory Limit: none
> [    3.792412] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> ---
>  xen/arch/arm/domain_build.c             |  7 +++++++
>  xen/common/device-tree/dom0less-build.c | 19 ++++++++++++++++++-
>  xen/include/xen/fdt-kernel.h            |  1 +
>  3 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 05a77a4f92c6..b189a7cfae9f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -973,6 +973,13 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>      if ( res )
>          goto out;
>  
> +    if ( kinfo->xen_reg_assigned )
> +    {
> +        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
> +        if ( res )
> +            goto out;
> +    }
> +
>      res = rangeset_report_ranges(mem_holes, 0,
>                                   PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
>                                   add_ext_regions, ext_regions);
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 4aa36c8ef33f..2c56f13771ab 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -146,6 +146,14 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>      int res;
>      paddr_t mstart, size, gstart;
>  
> +    if ( !kinfo->xen_reg_assigned )
> +    {
> +        kinfo->xen_reg_assigned = rangeset_new(NULL, NULL, 0);
> +
> +        if ( !kinfo->xen_reg_assigned )
> +            return -ENOMEM;
> +    }
> +
>      /* xen,reg specifies where to map the MMIO region */
>      cell = (const __be32 *)xen_reg->data;
>      len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
> @@ -187,6 +195,11 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>                     mstart, gstart);
>              return -EFAULT;
>          }
> +
> +        res = rangeset_add_range(kinfo->xen_reg_assigned, PFN_DOWN(gstart),
> +                                 PFN_DOWN(gstart + size - 1));
> +        if ( res )
> +            return res;
>      }
>  
>      /*
> @@ -814,7 +827,11 @@ static int __init construct_domU(struct domain *d,
>  
>      domain_vcpu_affinity(d, node);
>  
> -    return alloc_xenstore_params(&kinfo);
> +    rc = alloc_xenstore_params(&kinfo);
> +
> +    rangeset_destroy(kinfo.xen_reg_assigned);
> +
> +    return rc;
>  }
>  
>  void __init create_domUs(void)
> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
> index 7a6cd67c22f1..1939c3ebf7dc 100644
> --- a/xen/include/xen/fdt-kernel.h
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -24,6 +24,7 @@ struct kernel_info {
>  #ifdef CONFIG_STATIC_SHM
>      struct shared_meminfo shm_mem;
>  #endif
> +    struct rangeset *xen_reg_assigned;
The purpose of your newly introduced xen_reg_assigned is to keep track of these
ranges so that we can remove them from extended regions. The concept of extended
regions exists only for Arm today. Therefore I'm not sure why making all these
common i.e. entry in struct, rangeset allocation, etc. The other aspect is that
extended regions may be disabled by the user and you would still allocate
rangeset and add xen,reg to it for no purpose - i.e. dead code.

Also, what about direct-mapped domUs? We don't seem to take xen,reg into account
there.

P.S.
After recent dom0less code movement there are some issues that I reported to
Oleksii. Long story short, we shouldn't be making the code common (e.g. static
mem, shmem, domain type) that is implemented for now only for one arch. If the
need arises in the future, the feature code together with callers can be moved
to common. At the moment, we have some features being in arch specific
directories but callers in common code and #ifdef-ed (making the stubs
unreachable). That's not great.

~Michal


