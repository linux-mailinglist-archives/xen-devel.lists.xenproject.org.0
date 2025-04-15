Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA334A89EEA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 15:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953878.1348279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fwM-0002Fa-W2; Tue, 15 Apr 2025 13:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953878.1348279; Tue, 15 Apr 2025 13:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4fwM-0002Dt-Ry; Tue, 15 Apr 2025 13:03:02 +0000
Received: by outflank-mailman (input) for mailman id 953878;
 Tue, 15 Apr 2025 13:03:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mbqe=XB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u4fwK-0001os-UN
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 13:03:01 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2413::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f322d33f-19f9-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 15:02:57 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 13:02:54 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 13:02:54 +0000
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
X-Inumbo-ID: f322d33f-19f9-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7XO15qeDXXCMBzVaOXJ6MgpV90UFldXiuYi9LGUidKKtn7BtHnoYgE9Au/Ktt+lO6bZyXS3m1CteqZtK1f5PBLW59SoSc+0Wkkeom3Z1SRIbIM2f24vFmWRGyca8vDqrnXkomp9nW11JRvLYYg+nxFx7S/I6jqYX1xCGZGp5XtL5I744dONDtaxY/Y6mN5GWdbI/Lrqw51YVzA3KJPwKhXNpxSO5nDao+55p7gkqv0CYzcicjScer4/TaI4Sa7GZ0TF7LtZZbbXu0fcH51eodkUwnYHVrONRjWiBE7eE0EmQCZZE30r1Swl7J0mPE/UkLSuzuC95aaFrG0tqyABiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UJI+vwtKmDJo6teNYvsvaetk2wHgi7gy3GK5A2opvw=;
 b=Gzi4el8AF2ak5KnCG6XwLursCs01sHW8KzGFo3kwtCaRJrpWtBCsYDAAnFyi/rn27eR/zGZq8ox7KBGdSodhSIYIBca1JP44QnZU203PyUi3tL01qmFrYocMQMG9FOiMY/e8NGFhW79rvX4S35eDO3cfZN9w5L+TsGH0psjcrfDJfuaIluZkLw8dXBLhk4TTXZTIQNHNUxpMq37MPRIKzoJ+tbzWwJPwAL/auypMgwuKQX9YGrGkdduxgdpQvorOmXJ9H8p42+7a5Ub2rp+I/U0mqdJ97/dNm4kfoR7ERZnhGCiVR5oYI/KXx6zl/p84agPM6Ky6Cjf8UYHOSPGTxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UJI+vwtKmDJo6teNYvsvaetk2wHgi7gy3GK5A2opvw=;
 b=mAH67u7nnVVNht2ckyFo98wPNfNqEQIZvQTm94kHxdvaEsuey4eU5XPQXTBLwV4+/N8xcvxD1WEFQComfbBNzFgT2bI4dj8SB1Pul2HjboamXrwRArHY/0FZGbsjp76A+XVWTW2q3rrRBPALXmrBR6KdtT9w3qGr15KrtWo4+5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <84be76c1-be06-4371-bff6-69cf48286952@amd.com>
Date: Tue, 15 Apr 2025 15:02:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Xen Armv8-R booting protocol
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <F10A37DE-4F3B-4A18-BAB7-B95616516A2A@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <F10A37DE-4F3B-4A18-BAB7-B95616516A2A@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::6) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA0PR12MB4384:EE_
X-MS-Office365-Filtering-Correlation-Id: 671e9974-6e76-4da2-56ad-08dd7c1dd5e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWZGUVpMR0RPZTNIdkNJRUlidGFNVEtadHdBSUE1WDBDRDd3bFVTQlJRVm9L?=
 =?utf-8?B?QUl0N0VOSVRBQ2VRSFdQTzVDcVBSNVBDU1ROZnorNXNhTEo3dXlId1NKUDJk?=
 =?utf-8?B?S3hyVC9qVWZSNUNKWk1EQ29RdUQzeXA0QStDcElBVCs1bUl4V3dscEd2eGti?=
 =?utf-8?B?THpWdkZXMmRCY3pUNk83YzdxclVQVTBrZUhrNEFWRDFmOGNKbnVOYUI2aVFQ?=
 =?utf-8?B?amcxZm5CcENzK1IxZEVSVHNSSW5CTnJiaFJkOTJhWUlKTXgra0Jjb0U0QjNK?=
 =?utf-8?B?QUxjcEhoKzFFaEV6anFucmpFaGFzZDJ2ZVdkUVU4eW92QlBQVVJwL2JPY3Yv?=
 =?utf-8?B?MlgydUVqMWdJM2ZYa0NhS0ZuUUVCNFBlaFBPOEdPSlhUZVhDU2N2R1dpMmZw?=
 =?utf-8?B?M2todlZlcWg5SGdyZUdzYWltTzZlcTZRR3FGUzNxMjYwUzhWazFKTnlQdTlO?=
 =?utf-8?B?NHlJTFVhOHcyUDBRYXdZSitGZndmbnRhVU0wTnF0L2tha0Rocmc0QzdMSkJH?=
 =?utf-8?B?TmR5ajJ0MWhVUnVYSFVmdllQdkEyWVFmd3d5OGZleUFOVCtROFJLN1lwM0dz?=
 =?utf-8?B?bFRpZmNyMlV5UWNlZCtiSld1Sk5tS3ppQUhsYXgrUEJreXNmaHdpV0ZLVTdp?=
 =?utf-8?B?TnZNTkYyd2ZBbGFWSmpOcnFxL05DSlcyT2lodHZuQ1dGTlZ3NnZsMHZQQnVX?=
 =?utf-8?B?dDRUWTF5QUZ2SlhsS0tXT2dlaFBrK3RwTkppbU84L2RLR2tRbURqbHJFbGRL?=
 =?utf-8?B?T1B3Y0c3dFVwWjI5NU0yakxWZDl2cmIyeDhCQkJzUmlXdVNKMUI0aFNBWmtw?=
 =?utf-8?B?Qll4cDlnUUt6SmEzYnE2UUh4K21UeHRUejMzRVF3ajdXVHV3NVdNbEU3YVdl?=
 =?utf-8?B?aXhFTmNwOWthbEJoYUtQSUM4VWRiaDVXbDNlT1g4NmRQUmVISkNBOEk4N3FM?=
 =?utf-8?B?MGpiaGU4MzZzclBRQytCR0M4c1ZrY2JpYmtCTEZ6ckFENHdIY2pMb3I5SUYw?=
 =?utf-8?B?R3duYm5hTGEyTE9uV1ZnQlVkVDk1S0ZKaWRYZ0J5TnM5YVZaMGltR1QzMGRM?=
 =?utf-8?B?ZVVuUUVxeE9Jd2E1YzNuWTNpbXBPQlBOa0lwTTkwOW0xUnBWMHhHTG12OWZK?=
 =?utf-8?B?NGdxTzZ0UXpNMVJPS0d1eGpjVW44NHNSZCtZV0crYzNmMkNUWURqYnN6VzJP?=
 =?utf-8?B?OXRpZzkyZjMwZ2RXRGoyLzQ4TjJRNWFRNVViSndRT0tDQmZyNFV1RWhaMFFE?=
 =?utf-8?B?VVd5ZHNiZGRLSkFzZ0p2REVFay9Ia0NqSndJSTN5K2svSE9TZUFydUJLZ2lu?=
 =?utf-8?B?c3ZEeVRlMUVUU1IrWWttaXRjVDJqRUxHMTI1Y1piNWJjRitsTW1tNGZHSWNw?=
 =?utf-8?B?Y3E5ck5kT0RvSDBVcXY2MDRUaXMxNXB4OHZtdDk0MkJEcVBMUTdjUExVVDV4?=
 =?utf-8?B?ZXFvYnV6M0d6aXVDdzRRMHpKUEIxWEltNC9DMmpsbHZIMGVOdXlURVpvc3hh?=
 =?utf-8?B?dEZBcVJ2eURkOTZzaGU0SFdKL3hWdmwxMmhYMXZQVHFHaHVsMUFFdUluV2dm?=
 =?utf-8?B?OFJaYXBCV3NBc2FaZXdPbnJXWHNoSTlXVmNKaG5lQ2xnYmx2UFlQNHFpbUtM?=
 =?utf-8?B?L0tPVVFHWTI2U0JKbmY3R2hrZEo2V29ySExNdUtldS9QbVp1Nm1KN3FRNUkw?=
 =?utf-8?B?Y1o4UmwrVXh6VGc3VWhGMHlZRkhwNVpzdUFUV1BZSDlZRGIvM1RvcFRGMjZJ?=
 =?utf-8?B?eFhlZktsR1l3eFpiOS9GQ3Z5RWhZYVkvcEUrSHJmdU9EcElkMzU5NmkvQUFF?=
 =?utf-8?B?aW5FOEpaT1RwTU9aTUpTWWNPN252TWNLTjJpVmFOemg2cWRORzgzZExHUzRt?=
 =?utf-8?B?ZEdSRXU1R2xXd3ZqdmxqRUJRcnpjQTZ1UUlXRDhCZFpoYmhRaEFmLy9neExU?=
 =?utf-8?Q?Nz/RaDHH6GA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVdvUjVsbi92ZCtFamphYmN4UlhxN1ZRRXAvV2tFODF1cFFlcWdiOERVelR1?=
 =?utf-8?B?ZEFjNis4WG9XbjhJbzgwMjJWRGhDYllIVHlDVDZxSXZ6R29NVHNwcVJVUHRG?=
 =?utf-8?B?bzRwWkd1OEY0VVhuVEFDeG5PS3ViSWpYSno3RzJDZ2NEWUl4L01FSExUd2ZP?=
 =?utf-8?B?ZVMwS2R0V1d6N1FXV2N6VHU0WHJBOVlYa0xkTDE2TS9WY3dQUVJoYnlVSGM3?=
 =?utf-8?B?SzhaL1c3ZE0zZm0rT0MxWC9aTnVkR1FHTzFaYnV4SDdXeENSRDdMNHQzdWpy?=
 =?utf-8?B?NE56b2N5b1RDYWZRcTg1bFdVb0ROS2tkN0RPQnN2WFFGVXhzVmJHRGdERXhJ?=
 =?utf-8?B?bHJIZEhHdHA5TDlTSW9UOTZzN2lGQWNuVzFpZHV3WjVDbGhRR1R1K0Yyekt1?=
 =?utf-8?B?Q0FGbEhobjRKRjZ4NFdDN2lqZFVleGFhSC9jS0NzclFxdktaNnlVb0RxOXRQ?=
 =?utf-8?B?UllHeW5YcHhuclhwaHpnRHRKYzVyWE5YdXU3U2d4S0o4TExWWUROWmpvcGp3?=
 =?utf-8?B?Q0FMbk41SE1LR1hqOE1tUitqOThGQ0VtTnJOTVlXbXBRSStrZW1MV3dWaDBR?=
 =?utf-8?B?aFRiYkppRlVBL1l6NXZYRlUvb1E2Wm1wSjhybkhqRThTbDd4Y3l2bGR6VzlX?=
 =?utf-8?B?V3IvdGlsNC85THphcmE4YlFqL29CdzR4RWJNbmUyUC9LNjlYSGNLbjk1UUs3?=
 =?utf-8?B?dk1QNnVMZzlXOUFHSmtnaUQ1bVdORzkxbzlyWDh3YnFab0V4TWNlYkJ1MGQz?=
 =?utf-8?B?VEhackVOL29UdmNmM0s3SGtUc0YwVVlwWU0rNTRzVmE1aVdmU3FiTTdoOUxX?=
 =?utf-8?B?dUlzMWEyMVNXWjVkQ1lGVXZIbmFtcHVFU2tZWHVWTkxBb2VmUnJBdXVNa2sx?=
 =?utf-8?B?QkU5TkVvVEFPMHIrb3hFOVJLaEY3eHZCNGhCNy9VVGxCeVNXTHJjUHRSYStu?=
 =?utf-8?B?eUFnNitHeElybFJnSHRwWTJCZlVENTlrck9tMFN5ZVZPTjEwclcxcnBNRXZS?=
 =?utf-8?B?YXh4WDVTKzBKL0J4ZUo1Sy9PL1NQUkY0eVlxSVliVUFOTUN1QTQ0SExGSmNQ?=
 =?utf-8?B?TkVyNFpnNFAxR0tKdDByQnk1bDlldUZlcFdtS0M3RmlIcncxdnJyUE55WnRF?=
 =?utf-8?B?cGZVSnd4OHBWZTdwdUNFc01zUXdMYS9Ua2NYTkcxVW83QWRiUnBCaWZ6eVAy?=
 =?utf-8?B?aE1GTTV5cnF1NVlJaWFUV3JqRnVmWXorUmpzcENjS29ZRUQyanBmVng1OWdX?=
 =?utf-8?B?b1Z2amtaWjVaT2I2bWpDUmR1MzhUR2IrWTZFTnlpRkE1WWRiekxhU0haV3VI?=
 =?utf-8?B?N2lnNm9GOXNmMysvSFZoQU1nUGdCOHZTcUZveGlVdEp6ZHYrZG5XREc1U2xF?=
 =?utf-8?B?TFc0WUhLWnpkOWY2TWg2Z3l3SmhoTkx0b0UvMEZjNmhnZ2FLeDFIa3lTemYz?=
 =?utf-8?B?Z3JYUTh1cmRiZmhoeEVVcVV3N0YwTTRLZUF5V09HWWFPRWsrSEtCVWFxVVVK?=
 =?utf-8?B?M1VFaWg0ek40WWlIa2JEUmdTdXkrY051cUJMYTNJVm1qNU5uS0s2VnV4L1Fy?=
 =?utf-8?B?L255TksyWVc2aFEybzJ4cll3c2VZYnZ1dHYrMzVxQzA5R3BNa0l2TUl2Qkt0?=
 =?utf-8?B?MXJ4bXJjWnFTRzd4N0ovV3BDVUplM0s3bDZCQklEdFp5R0tET1VsOFYwSzNp?=
 =?utf-8?B?NnJISzVKMkY3enljQzVvY1JXeTgrYmIwYS9zVklXWGxKQ2J0UzVOTHBCbWdy?=
 =?utf-8?B?V05FdVlrL0pFM0xqT2JRalY4d2U4VHVUajlDK0pQeGtxbnBaaTVreVAremxa?=
 =?utf-8?B?ODlMM2JNRlU3ZCtUc3BRbjVBakJHcm5KQXZXZmVYdmcyaklaOXlhd2NVNU1p?=
 =?utf-8?B?TkJDVm5ZMjdOUWRRY0xGbGJibURsSzBkVDMra2E1QWNFRzBkYmxhUy83Z05y?=
 =?utf-8?B?MjlNbWRNZ3g3S3FwYkNFQlY1UzFJTWJjaWQ1OWVWcUZZekxta2hsczRDb1pt?=
 =?utf-8?B?U1h3T0ZDZ3pWeC9BR3gyaW0wd3ZIQUthVDJ4Z2UrL2Y1cXlFQU9vOG9ycnd4?=
 =?utf-8?B?aU5vWkV5c21DRTYyeFZJRnpvRXUzUGFjTWRYZklhdFFkZEM0OGNvdVc2WnYx?=
 =?utf-8?Q?sqrw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 671e9974-6e76-4da2-56ad-08dd7c1dd5e6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:02:54.3544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IU9qiFLXzW3iduCcpCSP3zaLLxzmBNMqk+7PDIx+rFLJ2F0vKXt0E5Fcn4keIicq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384



On 15/04/2025 14:10, Luca Fancellu wrote:
> Hi all,
> 
> I’ve started this thread to talk about a possible Xen booting protocol when running on Armv8-R,
> currently Xen uses the Linux boot protocol and some other requirements stated in docs/misc/arm/booting.txt.
> 
> Unfortunately we don’t have anything already available for Armv8-R, the only implementation of a bootloader
> is the boot-wrapper-aarch64 which keeps the MPU off, I/D cache off.
> 
> So my proposal is to add additional requirements in our docs/misc/arm/booting.txt for the case where Xen is
> started on Armv8-R, under "Firmware/bootloader requirements”.
> 
> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index 21ae74837dcc..39f029153e38 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -62,6 +62,14 @@ Xen relies on some settings the firmware has to configure in EL3 before starting
>  
>  * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.
>  
> +When Xen runs on Armv8-R, the highest exception level is EL2 and the only
> +available mode is secure, hence the above requirements needs to be adjusted to
I think in Arm docs, this is called state, i.e. secure/non-secure state.
Also, s/needs/need/

> +this case:
> +
> +* Xen must be entered in S EL2 mode.
> +
> +* Xen must be entered with MPU off and data cache disabled (SCTLR_EL2.M bit and
> +  SCTLR_EL2.C set to 0).
>  
>  [1] linux/Documentation/arm/booting.rst
>  Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arch/arm/booting.rst
> 
> Please let me know your thoughts.
I think we need to have a place for boot assumptions for Armv8-R, so this is a
good start. MPU work is Experimental for now, so we can treat it as a living doc
(MPU part) for now.

~Michal


