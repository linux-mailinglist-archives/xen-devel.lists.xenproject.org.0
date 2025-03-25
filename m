Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF410A7052D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 16:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926622.1329458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx6Jl-0005ef-Ds; Tue, 25 Mar 2025 15:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926622.1329458; Tue, 25 Mar 2025 15:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx6Jl-0005c5-B3; Tue, 25 Mar 2025 15:35:53 +0000
Received: by outflank-mailman (input) for mailman id 926622;
 Tue, 25 Mar 2025 15:35:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDid=WM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tx6Jj-0005by-G8
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 15:35:51 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2418::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d334095f-098e-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 16:35:49 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MW4PR12MB7263.namprd12.prod.outlook.com (2603:10b6:303:226::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 15:35:44 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 15:35:44 +0000
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
X-Inumbo-ID: d334095f-098e-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vw0PCHe/K+BzVl+w4pw3MwAgWHaV69SHhbatpQewAZfcUetpPxwjqR1mjmpW8crC9u7BLK0c9nurK4xaRhKCvYGHHQ76AkWGOe9axg3QWv94YZsg/kU63m1RxzVJpMowqL4q/kP8LLXKBfsHfBzNI9IwMGgjqeK1onrQSQpn4dNUqbxTM5DNGKsuBJRVrt4i6pyy8piOfaJa1Dgl7gitJvCRCfsQYCq+YAYrJwJe+o8Ksk4oGZ0BGSqbYRpoFbKv8/QEnVCWmTYEYYH1LObSDv5ZvQPY1PrbpNbNMRXD7pfTrZP1a6FqeUpVR5pnbphHG480ksQ7aW2vNojnMz3AnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nC1Vn21WNWdvDhr0BOmuRDdfFSgfJjNuavugtAXje1o=;
 b=pDko8wVXIz7ikKaqBXUVX9/icx4+h3UFh4JxVN9Nh/8p61hmsXWGBIa79vLOF/d9GddXnqVmy1aRKB34vLI0G5/kESIv15M/jS+8lnHhgXqf6Y2AwPmxSYC0tjpt4s+rTQEo9ODJ/2gW9l8e3Zy1nRKN7zauOwTfufuBmt5Z1MGPPkujOYLjz7cl87C4glHmKWUUWPW8oX9dAift6HWF81ZQvmh0gHXWG4JNgaZyBMZJOg2ShXZL5u9pJxvmqAxoA4RgfAqZncjTQNXx2Sfb4DxETMAChEfI9dTpVFLRdnnqhyPnDruEb4gvDPIXKPn16uysUpaU+kQiJE+Cmufxgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nC1Vn21WNWdvDhr0BOmuRDdfFSgfJjNuavugtAXje1o=;
 b=uc9g4Mc8obIR7l7WDhEzxHauYiEv/u+CO7eNu5PO59Ru+pydRhG5wrj/mtheapqhZL1OA6xO7TZqlCfJzzVqdbL1JmtpFIGhbzIoGgDlYNCzDwmtaaHRNYS9t/2Di+v9wppFlpMDk2hLSfon2ru7IaantFwef5RyRKkgRffVxdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4e048dad-bd12-4526-ae62-f424bdb8271b@amd.com>
Date: Tue, 25 Mar 2025 16:35:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
To: Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250325150842.2015968-1-oleksandr_tyshchenko@epam.com>
 <9b96395c-ca88-483b-be06-b7768b552983@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <9b96395c-ca88-483b-be06-b7768b552983@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0274.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::18) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MW4PR12MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: bc730006-9bfb-4b36-1371-08dd6bb2b4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1Vla2hOV1FrcFVhcElONkRJcHg5bHZtdlBOS1ZBbi9xbjlPMnoxdzdOalBX?=
 =?utf-8?B?RzduN0VqTENCOU11RUpGWlVhME5EWlAwczkrdy9TRStaaGlJQXhoblovbTRn?=
 =?utf-8?B?TTdPNEd5ZUJzMGNqbHJrY2k4WnhrZXJCZGVMU1lMS0FDaTBMMTl6OUVJUEN5?=
 =?utf-8?B?QUg3cFpCRTF4S0pCR21xNjhrclM5S3FnL1l3R2hTZFVCUWVVU0RqdVJCYy8y?=
 =?utf-8?B?dHlKb2szVlFISis2NWdjM3BjcWl6U29JZEdaaUxHUmErRU1YWEhLczNCZDZ6?=
 =?utf-8?B?c0JoMmppUnJZLzVyZk4xaUVmeDRjcmJWOFYzOFYyaUxCYWc3NFJVWFlYQkZp?=
 =?utf-8?B?Uzl5UzB0Y1JTYzhvQ0FPY2JkcHk3Q2RGWnl0cllnVXRVVnBnQWlqYU1LTkZ4?=
 =?utf-8?B?N1RIbENkb3dxbEk5OVRsS2NrMXhTZWlScS84bkhNQ2xENFlKWm0ya0QwYlhi?=
 =?utf-8?B?Q3M2cWorK1BrMDgza0pHdTVtbFRieW03V2MwNUJVdWw2UjN0Sndna2RKZzgx?=
 =?utf-8?B?NmtLZ0pVY3lFTUVpTHpmZldQRmxpdHN2bnF4RCtvRnZJcFVXZ3ZkenpFTC83?=
 =?utf-8?B?dENwSTU0eGIzQS9tdHVYVXo0cmV4bXR1T3ZqWE5Rd3JBenJKSkRvZ3daeDZV?=
 =?utf-8?B?M0dYeG1nbkhaTytnYTl3M0p6WmEwRjN5eWVwRXNTRlp1bDRaTlFiT0FXN05o?=
 =?utf-8?B?QzhqallielN4Yk1STGdFSUhxU29pa3AvZ1V6M3VpNU8wcHZBeG1ZRE0zQU5l?=
 =?utf-8?B?MGF6aUNZVE9jRzJMaGdyS2dlSmhlMjFWZ0RzZmloc1pZTHlVT0ducTFTa3dO?=
 =?utf-8?B?RjNSS0xPVzlURk5pbnFVczhvcVFoOGxmV3BBR3RCVDgrUElVcDllMEI3bWda?=
 =?utf-8?B?VFVvR3Fod29yOXQ0NHpURmR2aGc3TmpXbElUMkkyZU1UQzEzbmRBcTViM09q?=
 =?utf-8?B?VUNFRXJuSTBHSy81cWp0ZnVnd3NmeENlNlZ0MHY3T1pUVlhHRGJXMFZHS3gz?=
 =?utf-8?B?YVlPWE8wdUFONTJEZjhRL05hcmNlRVFhZHQrYWdOR2dEdVFjVDJQRmtsVDBk?=
 =?utf-8?B?Tjh1ck1oaWFtaTJpMEVuVnIzTGFmejBOUUo2QlF4aU1KU2IweityUzRrWE5v?=
 =?utf-8?B?WWs5dUJVQlJkd29mMCtaQUN2MzlxSmIvSmF6SERHdnZhbXNkSXlkTG5CZEN0?=
 =?utf-8?B?OFVUMlhYcW50bHlpWlBiSE0xajBEZEU2Sk5tWjB5MzJNUGFUTGF2NFRGTEQx?=
 =?utf-8?B?S2JRb3BPR0w1VldKNDNyVVArb3N0NHc0VjQyZzJkT1cvSGlCYjRmUVE3b0xH?=
 =?utf-8?B?blp2RWFwTmtEMFVCYllwVkJZaGZmbVpiNmNCT3A2eEFaa2lNTUtjKytRL0VR?=
 =?utf-8?B?Q1daRUlHU2hMQTZXTXRTNVNlWk1PYW1UZ08yOVJTL2lwT2l3Y2xuQVpvdXRQ?=
 =?utf-8?B?Rm90RjB0SDVRTjN5Z2M0SGZ3eXptTis0MjRhZWF1cVNnM3gycjEraWRNaDI4?=
 =?utf-8?B?dmhCN1RLTlBVR3ZWRVRyYkVnOGtyVHFyTFNTRDRIcjF1WU1Hb2lGSW8xZDN5?=
 =?utf-8?B?S3BZa3FkTGE2eDVONGswVk1DUjk1Z1dVTU5OYW5YZ3FPQkdlemtVVHo4ejJ3?=
 =?utf-8?B?QThuZlFIdXFhSkRzckRaSnFHWkQ1OHl0REl3Y2dPdjI0MFdVU0pqRUhENzlD?=
 =?utf-8?B?Q3VvVnhWRjQ1Mkt3NDI5S3gybmorSEJkQ2hpQ0tQWmZwSUtlNVhVYnpPWWUv?=
 =?utf-8?B?bDl0dyt2Uk5EdWxOeVFZWnlsK1RCZnU0TlloaVdTVjJFQmd5RVNzdk5tK054?=
 =?utf-8?B?UWRTTnhkQ0l2bWthOEpEOGxrMUZOS1l1Wi8xZGJKTFhyc2swOVI2ek5rOUVX?=
 =?utf-8?B?S3FISWJ5ckNIa3VqY0twMDJrNklJcW1zT3E2SE9oMFJvK2pqWExVeDdtUG1p?=
 =?utf-8?Q?A7KBbM1a02w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3hIdHQzemFKVCt6TzhSeXpUK1FlQ2doTElOTXRBb0lnbW1PbUd5Rk1BYjF6?=
 =?utf-8?B?bEdFMzIvU2ZMRjF3N3ZxczRsYWRpWENiazg1Rkg3Q1E4d2VBaWEzWlg5dklI?=
 =?utf-8?B?S2JORVpUdjdjaXRoTmpCRHJOeHpPVXhrV3pRbmptbjJwd2JSbjlkNElJUGJV?=
 =?utf-8?B?UXAzMUszdU1KRGdaa3UrSzNiYzh0SUFBVWNIQ1FiMVltU3FvUlNuTlk2aDN4?=
 =?utf-8?B?bEtEMk8rbVAvRHE5NUNKSExGTlRFekRhRVV6T3hYbkRiUllVTUdGNmJFcURm?=
 =?utf-8?B?Rlh0UWJ2bTRwNzNYbnlybDgvbXEwYmJDWU1aUEZjc2cwblhaVkE2MjVCRHQ4?=
 =?utf-8?B?WW5KWkZMNTY1aGpUM014eExGYzBTQ1RDWEhIRW8wQjZJSjlnV3NZT2RqSGsy?=
 =?utf-8?B?S2s2d2p6emxVQjVsamVXWEU2R0g1Zm0ybDRQdDI2SWNBOHRjQ0pBUkVuK1RF?=
 =?utf-8?B?VnpqeDJrTVlMeXF3NlBxNGY5MU1MeHJ2RVI5M2I1UGQ0WStnc3g0K0o1S0c4?=
 =?utf-8?B?ZzdLWGNLRUlXd1BQOHdycVlPVW5idDliVXhZNmFYUVhTVDhJU1ZFVHFvZFA4?=
 =?utf-8?B?VXI4ZmRUbXc0Z0JROWdCNmwrU1pXdllSaXhBTGpwUnRRdzJHUzBNRmRlNGhj?=
 =?utf-8?B?TjNNQWtYK2VaeFlXUTNndDVHbTBGV0FlUU9oR2Y2eEFBTUFRSTJJSWhpdkY2?=
 =?utf-8?B?SGw1eUEyb1BsMGJ2MHFZVE5oclVzL0kxdktyZnpwWk13VTZZNTlha1ZiNFBk?=
 =?utf-8?B?OUJHU3o1U25LWXcwTTJ0b3lqOWtnelFwWEMrU1kxWksxWEZSNHl0WnRkSjl3?=
 =?utf-8?B?TVZBeTZYbFpYZWV0bzBiS2VBWi80MXFJZDFpRlRsNzFNTXBNa0VoVXgvQVk2?=
 =?utf-8?B?SCtXbW5qc3pRdGtmSEU3YVZMdHZiUTY5UnJQbXIyekVjZnNUZE1DbGsvaVdv?=
 =?utf-8?B?bDJWYjdGNU1LYjBVeWY0YmZuNG5wQjBkMkhMRFh3Z2VBNzgxZG9UYS9nM3ZV?=
 =?utf-8?B?MFZSckQ5VnVFT2IwSHpGTmlEZUdVTW9EOEdVTnhMdGpGSVU0LzZzQ0pyVVJa?=
 =?utf-8?B?MlZrdHZPb2lEZWpEK0RmcGpuN0VsQ3piZHh6ekdwZ3ZlU3pYd1ZGMFlLcWIy?=
 =?utf-8?B?d0E1RzlDc1NqYVhUNTNDK25uVll0dTFVczN4bkpvV25uSVZsM2poNXBNSzNn?=
 =?utf-8?B?M3J0ZldpR2s3Wkg1ZzVDcm5aaHpFblhtNW13QjJzZ3BGT213TVFmNXJrZngx?=
 =?utf-8?B?S3Z1a0xPNjl6Ly8zRXBuWDNoTS96Z043SE01UkhTM1ZIVnBlN0taaHdnQ0Zi?=
 =?utf-8?B?YW1Ob0xET1p2ZHFmbTZTOURaU0JFVFNOaXJ1Nk9EcmNBdXFibTJsRjlibUxM?=
 =?utf-8?B?ckdsUFk3TEowV3IvQ29laFczYTRwOC9wUGlZUkloaVgxSkF2ZVA1azdBeWlO?=
 =?utf-8?B?c3M0WTZGYzZyNGpvaGw1dDlvRVNWOWY3TTZ6RDJwdUhudDQ0WFpab25aQnU2?=
 =?utf-8?B?NkwyYUw3eENuOVROZVFEQmViRTJWVkQvY292RzBVS2d1YTF6Q2dLTTIrMWZN?=
 =?utf-8?B?QTlXQnd2djFNcnZXSXBFMVIzek5hT1FyZjR4SmlqczUxajVMUXpxK2libzRZ?=
 =?utf-8?B?eW1ERkkrdFJmZ3M1bU1Oc2pvUElvdTZsa05veEZrVEpWUVNiMFVzeTlHZ0FE?=
 =?utf-8?B?eHV4THRpM0JtYURQT1dIY0lVeXFjSUhtR3hOeXcvZ20vMFhsQXNRL1VsdjNM?=
 =?utf-8?B?YWFtYStyaVIzSklWUHN6cUFnc3JodWpKZ01JSGxLZlUvcnJnazVFSnJ1Q1Vj?=
 =?utf-8?B?aGY1RmpCaUErTVVLbnF3bWFPY3ZUaUxoTXQ2SUhURTJlOXdMVmcrTUtZemVw?=
 =?utf-8?B?WEp6TFNaemttV0EraTc2eFRrUlBobHhYVEVoNENtOWdvRExicUNnYUd4aDlO?=
 =?utf-8?B?STlKUFJDakIvTkxmU1ZJeTdpY3h3SHBYRFNVdXg4cVhwS3NvVkZNTWxUeDFD?=
 =?utf-8?B?a1dicmticDNoMWpiWnFHcFhPMWdBOHhRWWUrWHNhRXc1K2djQWtMUGVCL01U?=
 =?utf-8?B?ZTdIQnVYVFpMcEQ2alY0M0hJN1I1eW1rY2czdTZtMUlER293VjNOcDV1OUJU?=
 =?utf-8?Q?c/q4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc730006-9bfb-4b36-1371-08dd6bb2b4cf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 15:35:44.0495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjlZHBv2r68Bc1XPmu/EYswRVWX/MxFhzbqO10HObz1tQkQmC0qQxZJiBqOuraGz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7263



On 25/03/2025 16:23, Julien Grall wrote:
> 
> 
> Hi Oleksandr, Michal,
> 
> On 25/03/2025 15:08, Oleksandr Tyshchenko wrote:
>> On the device-tree-based Arm64 system, if Xen is built with
>> CONFIG_ACPI=y, CONFIG_STATIC_MEMORY=y, and the static memory range
>> is provided in the host device tree, the BUG is triggered in
>> common/page_alloc.c during Xen's early boot. The BUG occurs when
>> the first page from the static range is fed to the domain
>> sub-allocator and finally ends up in mark_page_free().
>> The pg->count_info & PGC_state is not in the state that
>> the code expects to see there.
>>
>> (XEN) Checking for initrd in /chosen
>> (XEN) Checking for "xen,static-mem" in domain node
>> (XEN) RAM: 0000000040000000 - 00000000bfffffff
>> (XEN)
>> (XEN) MODULE[0]: 0000000043200000 - 0000000043343fff Xen
>> (XEN) MODULE[1]: 0000000043400000 - 0000000043402fff Device Tree
>> (XEN) MODULE[2]: 0000000042e00000 - 0000000043111f82 Ramdisk
>> (XEN) MODULE[3]: 0000000040400000 - 0000000042cfffff Kernel
>> (XEN)  RESVD[0]: 0000000050000000 - 000000005fffffff
>> (XEN)
>> (XEN) CMDLINE[0000000040400000]:domU0 console=ttyAMA0
>> (XEN)
>> (XEN) Command line: console=dtuart conswitch=ax
>> (XEN) pg MFN 50000 c=0x2180000000000000 o=0 v=0 t=0
>> (XEN) Xen BUG at common/page_alloc.c:1474
>> [snip]
>>
>> The problem is that the static range gets mistakenly unreserved
>> in populate_boot_allocator() and reaches init_boot_pages().
>> This happens since by the time the populate_boot_allocator()
>> is executed, the evaluated in fw_unreserved_regions()
>> an acpi_disabled variable is still false and as the result
>> the dt_unreserved_regions() which should simply skip that static range
>> does not get called. The acpi_disabled will be set to the actual value
>> (in our case it is true) later on in acpi_boot_table_init().
>  > > The important question is why acpi_disabled is false by the time
Simply because it's a static bool variable with no assigned value i.e. gets
defaulted to false. And it stays at default value until acpi_boot_table_init()
call that cannot really be moved before setup_mm().

>> setup_mm() is executed. With CONFIG_ACPI=n it is a macro that is always
>> true, but with CONFIG_ACPI=y it is a boolean that is false from the very
>> beggining, even though the entire acpi_boot_table_init() (which is called
>> after setup_mm()) is written with the assumption that ACPI is off by default
>> at the start. So, initialize acpi_disabled to true during declaration
>> if CONFIG_ACPI=y to avoid an issue and match to acpi_boot_table_init().
> 
> While I agree that acpi_disabled should be false. It feels like a bit of
You meant true (?) i.e. ACPI default off not to make any assumptions whether
it's really on/off which can only be determined in acpi_boot_table_init(). I
think we still need this patch to match the code expectation.

> a workaround for the issue you are trying to solve here. If
> fw_unreserved_regions() doesn't work with ACPI enabled, then it is still
> a problem after your patch.
I don't understand. It does work with ACPI enabled provided that it's indeed
enabled. When booting with ACPI, reserved memory regions are not used - we even
have a comment in struct bootinfo. The issue here is that acpi_disabled is set
to false i.e. incorrectly there is assumption that ACPI is enabled by default
and calling fw_unreserved_regions() prior to acpi_boot_table_init() works as
long as we respect the expected default value.

> 
> Furthermore, what happen if we decide to use ACPI afterwards? Wouldn't
> this mean that the static regions would be reserved even if ACPI doesn't
> use static memory (all the memory is expected to be given to the allocator)?
I don't think such hybrid configuration is valid (booting with ACPI yet
declaring reserved regions in DT). See commit:
9c2bc0f24b2ba7082df408b3c33ec9a86bf20cf0

~Michal


