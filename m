Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B65A5EF2E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:11:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911622.1318031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseb5-0007r3-EK; Thu, 13 Mar 2025 09:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911622.1318031; Thu, 13 Mar 2025 09:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseb5-0007pJ-AR; Thu, 13 Mar 2025 09:11:23 +0000
Received: by outflank-mailman (input) for mailman id 911622;
 Thu, 13 Mar 2025 09:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6QA=WA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tseb3-0007bp-NP
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:11:21 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2414::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20392988-ffeb-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 10:11:20 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BL1PR12MB5777.namprd12.prod.outlook.com (2603:10b6:208:390::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 09:11:16 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 09:11:16 +0000
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
X-Inumbo-ID: 20392988-ffeb-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsJs7oUi48MdyEFkWQjtj6a+8cjwQDo9Lplc7AtXwWGoJoYHLwrAsjPuise4P8mnl54PLCTDezD8BwMuvJHnUyIDEYxdAv7rG6dZe9OTWdJWX5ztYXF7ksSM5wZgqWmVvVmRccnBxqO74CdaoIeI7KL7Vj2uX94oJFC00CstCs1CJIi7CYqZJW/CanieKZDKBgXZeM0XCzprGk+gVb5zJRcO5n4Pb40lVwmIyPiNZ5NYQXIwXwXxtBmH6VMh4EENhyalIYiJpRY67pfCkxB44lEDnIkIesVsqVfUV/mVbsRY5nLUd/hnvSvezWmhasICFUJBaJbJ77V4lxDWIgbL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqK+lSdRDDqo21XTuEup5Wmddt2jvScsxYz6XqeDWK0=;
 b=V9mE+6dbg6zROgmRq2Ufq+HzQaWtLZMV5MGsj13/J0+q214FNgJsmJutKLk00vzM+xDkvFb2rWKXibsgC4a7x42lR48KNGcV9PfAD1uT5Ovt8qg+0+Ae7TP4l5gRLyp+kW+dStuZDyT1Ee/ReobyY7nzGYgU/+vKUhpM5h66dgd+dnOkn9iTQ8SvbKNCgxLGklmfHhoPEzAE5YAID9r1DuVJGe44rm+f7BkuVMy9sEmnEP9PDEoqlpHui9rbOV1+w10K5lYFcLFg/Kd3zkXwwxkXqQdTjhhLgM5rY6fM6aFy8yfR1p/Aj1e4ttOPmbDwSF7oa8OLra8M0tLhtXpxNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqK+lSdRDDqo21XTuEup5Wmddt2jvScsxYz6XqeDWK0=;
 b=hPNmMgNV63va8A64g5SzhMvOjLsu22TmVH82mAFFiFTtnRh2y3gZZrx3Ck2deBm/itGd1YPJbOJiPttHQ+Rpae6XhX92fDJ1zgyHsa6JHX5D7o+DGhBpHcinyrRyl0H7na4VPajMA3gyaCNLuDkMpJTKGjMLtcybYzHItUahxMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <41c4f8aa-edf5-448d-81f6-c80c372585eb@amd.com>
Date: Thu, 13 Mar 2025 10:11:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] arm/mpu: Implement virt/maddr conversion in MPU
 system
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-5-luca.fancellu@arm.com>
 <f16ff8ff-6d9f-4763-914c-4ada8d7ecee4@amd.com>
 <8187117A-5463-494C-B401-5D8B73634DFC@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <8187117A-5463-494C-B401-5D8B73634DFC@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BL1PR12MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: bc139c4c-2324-4993-33d1-08dd620f02c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azVyVFdaQ3M0b3Y0ZFUwSE5na0J6SHZPVzRFVU91aEFNSzRUcjhrQjUrcHVH?=
 =?utf-8?B?dEc2Z3dYNmgwNDduR0FYWUUzRitDcFMzaHB0UWpTUHBFNE5yaFFoR2tqbHgw?=
 =?utf-8?B?UUFLSzNPWnhlK0c4UXZOeklsbUZ6WHM4YlhzWGNJT2ViWW9QQlQwZm9TYVRQ?=
 =?utf-8?B?SWt3emxEbVBmcmVMTXlpZWthbXlhWDRmdmVkRFVsVFdIQ2NsZGlTZjdENEdo?=
 =?utf-8?B?d1dxNXpJWGoxNC9DV0RGSm9lWUE4cStEVkVrVlVubHdtT2syOFBIOXRyRm9F?=
 =?utf-8?B?K0JXeG9odUUrTHZpR0NIYlQvYXZhYjF2M21VaEFnT1BtU3VvbHhuem9Zb0lj?=
 =?utf-8?B?VlIvT3VSQzJZV3luM1dwd3hFK2gxOEZmTW9jVjNLVkQxN0FSZDY5SCswb0xW?=
 =?utf-8?B?eDh3bFBiOUxPb04zREtYa3NpRnBHMGFBWU9malhhTG1YbzI3bDBkZzMzWGRM?=
 =?utf-8?B?WC9JOFNvL2xWVEVraE44TFZ0UWJzZG5qOFMxK1Nscnh0MkNqTXVQenJ4Q0RI?=
 =?utf-8?B?S0h2TmwwZHc3UTBVc3RwSng4Z0V4Q1lnVk16UXhtMkNsTWdJSm5VMkJ2Rm1S?=
 =?utf-8?B?dFE1S04vMkxpcWU2ekpvbE1rTDFDYXA3aGFnWm5ET0V6MnhiRnVhTkVPYWdO?=
 =?utf-8?B?L0xHdml5SnNRSkJ5MWJIUFI0MUNxWFJUQlpJSGhZTFlvdDdNWmZWVzV6bEtz?=
 =?utf-8?B?UGFwWTdYSjJNSXFtemloa1JobkJsY1VTcExGVUdFRU1JNmd4VElzbHkzRWJF?=
 =?utf-8?B?cEhLdFl3RTREc0hGUlNVNXJuWTJ0c3loZnRBVVIwbGducW1WaUozTnBHSHhz?=
 =?utf-8?B?YWMzdkhHeXRCUEJDdnRjQXE1N3Y1a2RwMHJ4NGg3TnNCL1llZDd2dDZ4Wkwx?=
 =?utf-8?B?L2JEYWN5QWFpY05XNjNjRm4reGx0b3F5amt2YzJiQmRscWpOUVRBcmFlSVBz?=
 =?utf-8?B?WndlMUY4djhNK1JjSGFQMDUwU0NMVlA1dVhibjVuQ01BVFJHS28zRnVuV2dl?=
 =?utf-8?B?R0ZRZGJUSy9HVFNFSktNZ0lnb09HeUdxWU0wS2hRcUdOWlJ6UTc0RklDUXBM?=
 =?utf-8?B?YU9aNEFLYjUxZE9PN2hYNlQ1Wmg3MTVmbTBmTktwcVBheHVSQzdacUw5TTc0?=
 =?utf-8?B?QVduUDZGUHp2Y1pubHgraGh4bkNqQlloUENnRE1BWWxCd3lmbDRoY2JZRlhV?=
 =?utf-8?B?cXp5ZGlObktNSFFPWWlpQk9xcVcxN2NHeU9NVXIzWVFCR1lZaDBmWElkYWpo?=
 =?utf-8?B?U3oyZW13ZzFWZ0JHZkhqamJNTUtidjhhajRub0psNWpoSzNyMDNLcTBWaG9F?=
 =?utf-8?B?dzZJeXdKV1RKMjJQTU5ZVUZYdDNJcU44UEY4RlB6NzY1dGZYRERpVnhyc1li?=
 =?utf-8?B?TkRyd090ZHpKczVManZmM2VGMS9YcVFIbE9LZ2VkaEdTbVQ0WVUvVzV0VVJG?=
 =?utf-8?B?UU0rVWFIWUJta3BpbkJDc3hIaldjNnBVQXZXenRzNDNISFpGdjRlVVdlSGJt?=
 =?utf-8?B?MEZVSyt0T0NseFZKNW1EWXJoSVpjSUd4aWJKWFdLMTRGYzQ2R2VRR2dxOFNq?=
 =?utf-8?B?MW1XSEhsaGpvYlA2VmtYY01CbS9YQkZ2VlVONkxKMks3eVI0NHRVV0x3M25J?=
 =?utf-8?B?L01qMngyVHlvc1Y4dkdzVXdzTkdnanJuTzJWMkE0c2M1ZDhyY2czdDZGWTFM?=
 =?utf-8?B?ZmhMV0MxQ01QR0psdUZnMXM0QURGUkN1VlBySGpmclNTMFRNeGxRbzhTTFRN?=
 =?utf-8?B?Q2VIb1dGL3dVdUNDOStYaDF4eS9XVkZsamtBVjVNcnB1Z1RTbFowaWw5UkVW?=
 =?utf-8?B?dlhRZ2FwNElnc2VNcXlzdG8zc1BIOUJDaGVGbEFVVnVQUDR6dmFWVGlMNW9y?=
 =?utf-8?Q?gREBGnjpwlFUz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2NVVFp0NTFHa3pzU1dmd1BMVXFsRUh6bDdMNy9Rck91Ymh6UDZEN081cGY3?=
 =?utf-8?B?NGdNUCtHVWJQREplb3ZYSlljVnhVbHBPbE5WOStZdXdoMElKazZLSTBQSi9R?=
 =?utf-8?B?MndsRzEvTy9oMm45SVJNNXVhdUFOMWVjY3VPT2hEZEszNk1PbFFDUlJLNlQ4?=
 =?utf-8?B?cFVBUDdDR0RGRm5lREJaeGxzUzBmMWdEY096WGZQakFxbWcrODRCc1RPYnJV?=
 =?utf-8?B?RXRUUkNQZU1ad1dOVnFEMGxPcTlEVzdiSjhzVG95Q25nTVM2Slk0dFBaMkx4?=
 =?utf-8?B?amZiazBUQzltMmxDY0xMN0JHVHc5V01LVWFBSDdJY2diZEt2cFJKS0RtaFRB?=
 =?utf-8?B?aS9keXJaa3pNOTJPV2JRSTc0S1lLeC9TOGU3MHNDNTVKc2o4WjVRWncwanNL?=
 =?utf-8?B?dUtQS2xpcGtXZVpCck5HY2lVblpPWkl4SDlqeHJ5MExpNEE1MWo5dDZhTXIy?=
 =?utf-8?B?ek9taWYxSzhhbUNac1BtQ2YzNlNMaURrUTc2ZTZsbEJEQVVHem02Q1Izc1Nt?=
 =?utf-8?B?K3NuWk9hdndOS2RmdUsrTHVrbXZFOWJNUG9xNDNmRDFTTm9rSHNBWFNUVUc1?=
 =?utf-8?B?TGRiZVl2UXhha1N6SGJ5TitLbUFOQlhWa29oY1MwazhHakNMNTdzRGk5aFQx?=
 =?utf-8?B?Q25ZUGx2aVdFUW1LZUR2RlFSL09panZpcjhna1dkclF0S2xXRDVNTyt1bC9i?=
 =?utf-8?B?aW56RXpXSkU3Y29zdE92WTI5c3dKNjRCZ01pZkxpZFFPd3FONmxDMGd2cDRv?=
 =?utf-8?B?QjM3b1lWb2xNb0JVR2hXaUhBaC9ERlI1ZVFrRm9FVDF6cGRRdzFFSDdLMzRs?=
 =?utf-8?B?UFVkZHFmMnlhVk5SY2cyRFlramNaSCt3bUFWL1dqRHc1ZkQ3L3k3TFluRWJm?=
 =?utf-8?B?cm5tYkdzSTc2d3JDMDhNSHhPWVF4TDRRY0I1TjdkT3lyY0lQWUhEMlhoQ25S?=
 =?utf-8?B?Mk5kYUdVTlNtdHlWSk54Yk9seklDT205TmZ0ZGFZNXFncTRSUDlhdHVzdUsx?=
 =?utf-8?B?K1JsV1VYMVI3cTg0S0wvcWt4dGUvTmFidTJueE56L1JGVFRJK1NVVTJucHZE?=
 =?utf-8?B?ZGhCQWxHVFYwWDJhVWJiQ2xoN3FPL1BpeHQ3MS9ScCtBd0s1SGxZSTMzNVNU?=
 =?utf-8?B?SkpHalRXK0lDQlhEU2U4R0NCZFh1ZUYzRTc1NnJWcTBnS3YrWEZaK3lXZkVI?=
 =?utf-8?B?RUlRSFViOGcxTUVrM1VWTFVpQUZ4MXRGVU5sQ3RWVnJKdjhDMDhEMFVoNUNI?=
 =?utf-8?B?SWlsOG9iNkgreUduVWRKNGtrYmo2RUVya01JUXB4UVovTG14U0JRSG1PVDZw?=
 =?utf-8?B?R3JtczF6dVp5Tis2RXB0Y1BXUWJWcUQxckVyWWkyZGluVHo4VXB6a1pCZzEx?=
 =?utf-8?B?ZjJkV09uS1ZVeGdMMGZ6M2kzcG1aTWk2Rnl4a1hBMitVU2FmOG9sMGhYTjNh?=
 =?utf-8?B?ZWwwTHowcEM1NFVMSjZ4cnVJMi8yTzdVRDR6bEVsVzRwTlVIbWw0RjRVYXRS?=
 =?utf-8?B?Qk02Rm80bWorQmxmR3Ivai91bE56Wk5nQk92RVIwK0RnUzNvVEZhWDhzSkN1?=
 =?utf-8?B?YkJ2VDB1VFE1ZTR5bHRmaFpiTXV1QW1ldnoyZEN5VXJQV3VyQXpQYmVyYXd5?=
 =?utf-8?B?cDVDUlRHWDFVQktGRithMVdzaVQvbVhGMUwxN2FXU2tLdXFyMEsxK0lEWXQz?=
 =?utf-8?B?ZXNQMkp4MGhjNFRZU3RLTStPWmM1anVVMVBLcVBvVmQzY1MxeS9QNWdxelN2?=
 =?utf-8?B?TTB1d0VsVXVPUkc2OWxINEZBYUN6Wk4rS0ZMNEJaYUdlUit0c1RwanVpUUVL?=
 =?utf-8?B?QVNMZ1FFYnVSQ1BYU2J6cjBNSjdxbEFQTVgyQkk4cjhMN0l3NDExVDZUR05n?=
 =?utf-8?B?RTlBTzVab0Y5ZW9YOEhqcXp4ckV5b2NiVXVjWFplQnZSTFQvRTN5MWkrdW5D?=
 =?utf-8?B?RWdIL0xvbHdZWG5TUDBuNzE3d2hIMWZVRndZSW5mUzJpZEg5cWFFZ2NPWDE4?=
 =?utf-8?B?S0pBVzFXYkNBV0FvRWFFd3VucHpLcmZpUFBoU0ZPaHl6SnU1QnhnTE1iMDVG?=
 =?utf-8?B?Y0xvUmtWeS83Z0hJcWRObHJSYTh2OE8wVlIxeFlmdEJZOGVNNVY5ZjRNUUV0?=
 =?utf-8?Q?w5xE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc139c4c-2324-4993-33d1-08dd620f02c4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 09:11:16.8544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/rkW4zPYJA+NKWzqo7avS7QifzFBcasE3QjoUBi8r1v8+h0m+9RYqn59zIVYKti
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5777



On 13/03/2025 10:04, Luca Fancellu wrote:
> 
> 
> Hi Michal,
> 
> thanks for your review,
> 
>>> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
>>> new file mode 100644
>>> index 000000000000..57f1e558fd44
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/mpu/mm.h
>>> @@ -0,0 +1,27 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef __ARM_MPU_MM__
>> Missing _H? Should be: __ARM_MPU_MM_H__
>>
>>> +#define __ARM_MPU_MM__
>>> +
>>> +#include <xen/macros.h>
>> I guess you also need xen/types.h
>>
>>> +
>>> +#define virt_to_maddr(va) ({  \
>>> +    (paddr_t)va;              \
>>> +})
>> Why multiline? Also, shouldn't we take PA bits into account?
>> I'd imagine:
>> ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
>>
>>> +
>>> +/* On MPU systems there is no translation, ma == va. */
>>> +static inline void *maddr_to_virt(paddr_t ma)
>>> +{
>>> +    return _p(ma);
>> Why do we need to cast paddr_t to unsigned long before casting to void?
>> Why not:
>> return (void *)(ma);
> 
> So it was pointed out on a previous review that it’s ok to use _p() instead of doing straight the cast:
> https://patchwork.kernel.org/project/xen-devel/patch/20230626033443.2943270-29-Penny.Zheng@arm.com/#25404105
> 
> please let me know your thought about it.
I'm ok with that.

~Michal


