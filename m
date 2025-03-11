Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4054CA5BE85
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 12:07:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907836.1315027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxRz-0004SQ-4P; Tue, 11 Mar 2025 11:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907836.1315027; Tue, 11 Mar 2025 11:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trxRz-0004QM-0p; Tue, 11 Mar 2025 11:07:07 +0000
Received: by outflank-mailman (input) for mailman id 907836;
 Tue, 11 Mar 2025 11:07:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5FZT=V6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1trxRx-0004QG-N2
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 11:07:05 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20621.outbound.protection.outlook.com
 [2a01:111:f403:2408::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eeb75080-fe68-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 12:06:51 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SN7PR12MB8026.namprd12.prod.outlook.com (2603:10b6:806:34b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 11:06:48 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 11:06:48 +0000
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
X-Inumbo-ID: eeb75080-fe68-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSBK+/rtJpwq+nxvqtUhyquhQ8p6M3PpLN0WmrLk2TztI7wJvemlpnOZcogJJneUEuotqlh7qL32OxD1EKS1MYYQBYzlJX0tEwml5Q3Nyo2a11RRMeZHJNZBx0TmyVbmPT+TN4QB1H/PtC+j+vHnWQ0aWe9dV92yzSnQ5C+N6Au0JIynswBZO6f/FbXxH3IDj4bR4t8cclbpEtu/ZKO5VLKYtiGQ1AztVw8SOBIp1nR1LFvKN0fPZ8cPofq7BBz3knxhuxnbrDnZ4wV6P2wdpOrDL2F9YuR5khf5O+3g5JEpYDZSfrZWhWmoSR+M/ybmzm+V0eVoZtGc/HsUi7qWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnOnmr6gHGourkrlcNvTlbPdrZcR/t1xMPpkUjoIn0c=;
 b=oSXrDjjJUfwya7F75CBgFZ3MOy3pz8qpmR1+WP6ldzwjIgrRARpx+mZgtoK4yme8ZWeFgUK4SgYkFuUbgXLh7k76wTCZKO37nWMQDV1IuhWi0XXPDi96MLIa27uxOjr6w190IL3PNT/qaQRe02B4uPD+loOMXFDiCWuL0qwwWMV1CjEMWO2YJ8SEe/uw7pJgRdzOUD1iJ/mEnGpPqPvWq2pog+94I05s1+EgfkfuCBdDKrt/v10TBmcP+lzkpkFwrFH49RTnAsqHhbFfYM0iYnsygM+1jlRTZOukLT26CoQa073dT0sKusFLHADh7c6K0lJ83ia6DqLrCAGVnl9IkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnOnmr6gHGourkrlcNvTlbPdrZcR/t1xMPpkUjoIn0c=;
 b=3e2TW78q3SYhnVjl9nC+ztQGjTad1nljnr3CA+yathj335IpUo7iTmTkK69lLqDgyD0y0ya930FzQOJ7imQ8mSFZdoH9AS1ikwKhbxofRvnl/V7RAtSFVGQaLQKhyG/wyrBjKtkT3Ei2W6oOPaL+DLIRp6IayRruRjG5iECZKVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8b06403d-02c9-49d1-a5d9-5aef57dde3cc@amd.com>
Date: Tue, 11 Mar 2025 12:06:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: Improve handling of nr_spis
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250311090409.122577-1-michal.orzel@amd.com>
 <20250311090409.122577-2-michal.orzel@amd.com>
 <69E0A550-5B43-4AE4-AD19-0456AA280871@arm.com>
 <2d66e9e2-e6a4-4552-960a-2e8d95555ff4@amd.com>
 <17173844-577F-44C0-AA74-984ACAEBABC3@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <17173844-577F-44C0-AA74-984ACAEBABC3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0382.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::20) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SN7PR12MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: d47ace9a-7334-4d5f-6afd-08dd608cd12a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VW9JRno4WXNNM1lOVVdwNkl3b1ZncjZudnpEenlKSXY2U3dHdE1RYWtXL1Bv?=
 =?utf-8?B?MWN3cnByUlU3TkNnNUF3bUxPemh2ck16UkF5bmdkREJPRS8zTy9uZGQ5UC9a?=
 =?utf-8?B?SzFHZzdRRkl3dVNWZEpwT0VRbXJQNk1jVk5NbEVwZC80SFpVTThmUVMyNTZo?=
 =?utf-8?B?TndLZ2hoV1VsRXNVN3RBOWJGYUh6cHlrNVlKelIyNUIvUzJsNzVwRlA3WmtQ?=
 =?utf-8?B?bWNqemtyeFU5dTJkQ3hDakRGS2xLNG9oakF6MmdFYXQrM1ZhTWQ2cmJybXk3?=
 =?utf-8?B?QVhXaDdxeGFIbWxaMzUxNk55ak9xZmFjd1l6dm56Ti9wMVBoN0REMC80dDgv?=
 =?utf-8?B?MnV0cjdNZ3ZwV3MwWXRVOVdvTjhxUUUwZEFadUZMNW0yOURqSXllZVRNTUdk?=
 =?utf-8?B?aG5EemlmaUxSenIyMy9SekpHeUF4bW1Sa1lVNWJpZWY0ZmhBUzQrUm85bnZx?=
 =?utf-8?B?bVNhbDZ2OSt4VHl4bEwzSjFYTUt0MHZYbkFGdFpjSUh3MDVUWGtXbWM4ZDVW?=
 =?utf-8?B?MDBhMzZTeHY3bUp3U3lNZFRQS2RDTWU1cm00ZjE3MEx1MWx0b0VINHpjbkZH?=
 =?utf-8?B?K3lXTDVpcjkwOU5BcFVxYnJQSS9KMDgzdFhSTHZPL0ZNQXNpQlpCcWt4bjZI?=
 =?utf-8?B?bGhFNFYyak1zTWs5eEI4bmF2L2JoZC9kZjFZT2ZrVDY0WjB3bVNmYjBNcVYx?=
 =?utf-8?B?aG9rZnNWaXEwcWRHRUVtTElraWhoMlUrMnhsdEorMkdoSVdpZWVqemJpNEJ1?=
 =?utf-8?B?ZXlkOHcrRkpSN1hnNkdIZTgrdUl6Y0gyVHdHU1B0dkVWY0RWVTFiTmt5cmxG?=
 =?utf-8?B?TG9EL1hXYm03a2luNms4TlpCcmdLSU5GYXNxdk1wWDNjYVM3V0xoeG1uN0dL?=
 =?utf-8?B?cWtLTENQUUFhU3Jja016L0RnWGY3WUErRE1qVTU1Y0JtdmR3L1pWYkFaY0Zn?=
 =?utf-8?B?VFZGTFlTRndFOGFLSkoza3RhbXdSN3JTWURGbU1TN0pJVDRUdHJ1c3VTd1VK?=
 =?utf-8?B?NjB1dDdMVmxGTFhGWnJNU25XY3hyeTRRRkRiQnpJSlBsWGh2SlNiTWxieFd5?=
 =?utf-8?B?UnY1enF1Qi9kUEh6STlNTjV2bFMvNCtWd1Y1bzRBVmE2bEVpcklTajlaaVR4?=
 =?utf-8?B?LzFEdmFlWW8yNU5GWitsZjhoWm1wSmtvWkg3M1NTMkFyRXVqSHlteDhRTEtW?=
 =?utf-8?B?Z21IYVpvdis0dUhZN0xDTyt1bC81VnliM0sxSVFoa0ZaUjd6U2VoQUhRM2Vs?=
 =?utf-8?B?Z1V4emRRRU5Zc3gzM1RzWE9YV2pQQUpUdDlGMVFLS0wxL3B1QTJiUkFiVEhT?=
 =?utf-8?B?RStOWnk2YUNucFVCS1QyTk1qYXNqSFRieGVDK1did1dYMVpZelNqS21idUMw?=
 =?utf-8?B?T3I3bGIxNy9hSE9leFpNb0swVDduKzM3VlErSWdsblhEWXdSbjdRZTBUQmpR?=
 =?utf-8?B?YkVZUERMK0FoU0JCU3JNQS9kWVY2Y1NNdnlDTERlUUVYdzNWWHd6WVdoSmhx?=
 =?utf-8?B?Zy90UGZpZk5SZ1ZSaXVGaUdIRzJGeStWNVFwTlVBa3l6UHJlNEtzWWVLcjdv?=
 =?utf-8?B?bmlPTE1tT2duQVJ6NnVMZmNuUHN0b2g3dURnYUp3VExMRi9wRnZtZERJcDRm?=
 =?utf-8?B?dG9ZbjdDWTJvV2lsSWQrWUtlekN4VkNpaWN4VDZlSTZjaUhmV0lzNFhEVDk4?=
 =?utf-8?B?TzFiNDh0bTQ2TWdiaU9RRkllRitheGZUaUtPdmF2U3UvUzRLSWNpOSsyd3Ey?=
 =?utf-8?B?aFJoVXNXRU11bkdvSHgrV3RQSkVPd1JTZm80SkJYTnFjK0s2ZTRNWEltOFZH?=
 =?utf-8?B?NHJlUTJvL2MxdUU4MnpMNWhlYzZueGpnMDhrMDdGbUEwT3IrWDVBSFdJanR3?=
 =?utf-8?Q?LN5CUr8WcEEbR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZllXSUJiK1Z4R1lZamZ5MmJ3aS9FbVdtWDZhZkxhdlloU3lSN21QbzdJQjZx?=
 =?utf-8?B?Q1FpcTN4bkZqUVFidWhvWFhXOHUvb2FOdy9ZKzJPSHBKeU9hb28xL1orNkFZ?=
 =?utf-8?B?b3NZSFpXcnZvUTVwN3NOS2lBdDRUVmw3STFnUjlwRnZ3TWNhYnA3K3ZJQkNH?=
 =?utf-8?B?TjZZbXRuMDh2cWRuTUQrUkRLdGYvcWNNOTljRURXUTFtVHdTVWpHSGEwL1hw?=
 =?utf-8?B?TDRZbEZxdzRYVWRnaWxFU3JmeHF1NVQ4ZzFBTklzeExRL0FTTVRidjUwN0Nm?=
 =?utf-8?B?TmlNOVE3dklWQXdvMFdjQXlJOE02aWZiYUd2U1YvWUQ5Y21SWXZ1OUJreWpj?=
 =?utf-8?B?YlN1QlpIQnBhUHJKT29DaSsycmJjdytYaXR6Z3NnejBsWXFYYjlTTWI5Wm5n?=
 =?utf-8?B?cDdTbkk4SVYrWFN2TjNRY1h6YTRPOUIxOHlvVWNpNlRUcFVRaGtBS2tEeks0?=
 =?utf-8?B?bU10Q3lhYnZrSkxYMjZOWmdsL1ZOZzJtbURsbXUvVXI0NGpFejZ4cnB0QlhM?=
 =?utf-8?B?KzduRjUwdDI5SzkrdEpqeEtOTUVtZVpFb1JFVUpESkFETmRSWHFsN2NlZG5j?=
 =?utf-8?B?M1JLSmZ4U1E4OHZXTGFSRGZQbUFKMjNEMmhKZjZlQjdNVFUyRGVOaUJLZ3Z3?=
 =?utf-8?B?UFBScjByei81bEo2czJUU3RNbzYvVmI4Nm9MS1BXOVA1ZUxCWHY4UmtzZHpK?=
 =?utf-8?B?YlB5d01peWZJczlBMUVMZDNadFlxK3dsYzV5dk5EYWh4WFVtTkhZb21ISnh4?=
 =?utf-8?B?WnU1QlZwM0ZuQlVnZ0lvbzZxOWwvckwrcmNmYzY0ckYxd2NVUmdvRG5sdFRp?=
 =?utf-8?B?aEd5bW9oblg0VWlXVUwvWFpwYzZKVytiSFhWUEZIcDZyWGkrMTl1NUd3OXYx?=
 =?utf-8?B?TXpWaEVtdkRJbThJNXowNHJZR3lHKzZ6UldiSFd2bERRSk9WSnZlY1FZUTlD?=
 =?utf-8?B?c2dEa0hIT3U3T0pwWThnWWRaYWNkNFVoN2M3T3lFVCtKZ2FNT2dkQi9YdXA1?=
 =?utf-8?B?TEpLY1hGRVllc2xheVJnd3RXOW80d2ZlUDJMRHVXN1ptaUU3bHN4cXo1WmYw?=
 =?utf-8?B?cVdkTmV1TkNmTENxbU9xcE80WW4ybzJQUGhaMll0dzAyY2p1Z2dhaGM1Zmp4?=
 =?utf-8?B?SFJ3OU4xeWR2V2x4Qit6NGZBcDdmUzJ1REl1eFlFdkNBYzNuemw0RFQyNUhG?=
 =?utf-8?B?U2RHNXZyV1k1aXlYNjQ4by96MERBVjYvbFR3T3dTVmNuTkJjT3hncU1VdUlv?=
 =?utf-8?B?R2Q0Q2Fwc3h6MGt6MzNtMjFUMm1qRndDUytYZFJrN3RkSVpnQS85cnY5Q2lI?=
 =?utf-8?B?ekJSclhOKzBzNDZYVFE4ZHF6cWZmSElYamg5RS96c3R5eDhzcjM3LzUzR2l3?=
 =?utf-8?B?TExNeGx0QnFFVDZzci9QYmsvamRlbGxPbSt2VG5BTVk1c3JNcGIwUFBWOHFw?=
 =?utf-8?B?cEV5MHBkZzNtUkdtUTVobUcyRFNlUFF1MEhYbjcybi9nclVBK0hGeGpON0NG?=
 =?utf-8?B?NDB4Qk1MUWs4TjM2YjduS205QXBvN3NIdzVOL25lUjlwTklscWhnN0lrcTFM?=
 =?utf-8?B?dEVmd0ZaREREbGV4VER6OXFMbFRJbnpQT2dHVmZVei90cVZjL3A4Vzg5V1Za?=
 =?utf-8?B?RS9xUnBpU28rZ1JoeEdKcUUrNU10TzRoNGdlTm40UHFkcDlTc25wRXYzVm9L?=
 =?utf-8?B?cDdyWFBwbkJQUmZoY3JtQWVkb2lMVEdJZFcwWDFpeUhEcmpjMVdlOGpyVGNF?=
 =?utf-8?B?elN4VnZZWThHSS9Sc1B1NUs2eFAyRVdJaW5VY2ZmdHMyM1FwN1dRU1A3TTJL?=
 =?utf-8?B?YzNUd1hQbmVWaGNBeGVZN21xRFlRL0hoN1RxRktzd0FsbE1GZi9WNjkxd09Q?=
 =?utf-8?B?SXo0VTVyb21IRmpicVZ2Y2tHOW9hdy96M3RvdE4wR2E0ek9kN3pid01kbDls?=
 =?utf-8?B?MVpJY0I3ZFJHTDRjUWRYWmJzVXd3Wis4QVQ3aU5qdkwrSnorVWtScFNkN0oz?=
 =?utf-8?B?Yi84SGozN0hqY0luRkp2UXduVEc1MjRCL2FSVW9TQzJBU3RLVitwaUR0bklF?=
 =?utf-8?B?THJIUDIvUVNoQ0toVVNFaEZqcTMvWC9ERHc2WXE2NElmWlEyVHJBL0xtZUZR?=
 =?utf-8?Q?sbiw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47ace9a-7334-4d5f-6afd-08dd608cd12a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 11:06:47.9458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEHXBvjCuUY4lsug8W1yDkiNUH4jcRwsyjOiZuCi4bGajqfps2tz9boDYCx7Mxo7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8026



On 11/03/2025 11:12, Bertrand Marquis wrote:
> 
> 
>> On 11 Mar 2025, at 10:59, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>
>>
>>
>> On 11/03/2025 10:30, Bertrand Marquis wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>>> On 11 Mar 2025, at 10:04, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>
>>>> At the moment, we print a warning about max number of IRQs supported by
>>>> GIC bigger than vGIC only for hardware domain. This check is not hwdom
>>>> special, and should be made common. Also, in case of user not specifying
>>>> nr_spis for dom0less domUs, we should take into account max number of
>>>> IRQs supported by vGIC if it's smaller than for GIC.
>>>>
>>>> Introduce VGIC_MAX_IRQS macro and use it instead of hardcoded 992 value.
>>>> Fix calculation of nr_spis for dom0less domUs and make the GIC/vGIC max
>>>> IRQs comparison common.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>> xen/arch/arm/dom0less-build.c   | 2 +-
>>>> xen/arch/arm/domain_build.c     | 9 ++-------
>>>> xen/arch/arm/gic.c              | 3 +++
>>>> xen/arch/arm/include/asm/vgic.h | 3 +++
>>>> 4 files changed, 9 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>>>> index 31f31c38da3f..9a84fee94119 100644
>>>> --- a/xen/arch/arm/dom0less-build.c
>>>> +++ b/xen/arch/arm/dom0less-build.c
>>>> @@ -1018,7 +1018,7 @@ void __init create_domUs(void)
>>>>        {
>>>>            int vpl011_virq = GUEST_VPL011_SPI;
>>>>
>>>> -            d_cfg.arch.nr_spis = gic_number_lines() - 32;
>>>> +            d_cfg.arch.nr_spis = min(gic_number_lines(), VGIC_MAX_IRQS) - 32;
>>>
>>> I would suggest to introduce a static inline gic_nr_spis in a gic header ...
>> Why GIC and not vGIC? This is domain's nr_spis, so vGIC.
> 
> yes vGIC sorry.
> 
>> But then, why static inline if the value does not change and is domain agnostic?
>> I struggle to find a good name for this macro. Maybe (in vgic.h):
>> #define vgic_def_nr_spis (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
>> to denote default nr_spis if not set by the user?
> 
> Yes that would work. My point is to prevent to have 2 definitions in 2 different
> source file and a risk to forget to update one and not the other (let say if some
> day we change 32 in 64).
> 
>>
>>>
>>>>
>>>>            /*
>>>>             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>> index 7cc141ef75e9..b99c4e3a69bf 100644
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -2371,13 +2371,8 @@ void __init create_dom0(void)
>>>>
>>>>    /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>>>>    dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>>>> -    /*
>>>> -     * Xen vGIC supports a maximum of 992 interrupt lines.
>>>> -     * 32 are substracted to cover local IRQs.
>>>> -     */
>>>> -    dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
>>>> -    if ( gic_number_lines() > 992 )
>>>> -        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
>>>> +    /* 32 are substracted to cover local IRQs */
>>>> +    dom0_cfg.arch.nr_spis = min(gic_number_lines(), VGIC_MAX_IRQS) - 32;
>>>
>>> and reuse it here to make sure the value used is always the same.
>>>
>>>>    dom0_cfg.arch.tee_type = tee_get_type();
>>>>    dom0_cfg.max_vcpus = dom0_max_vcpus();
>>>>
>>>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>>>> index acf61a4de373..e80fe0ca2421 100644
>>>> --- a/xen/arch/arm/gic.c
>>>> +++ b/xen/arch/arm/gic.c
>>>> @@ -251,6 +251,9 @@ void __init gic_init(void)
>>>>        panic("Failed to initialize the GIC drivers\n");
>>>>    /* Clear LR mask for cpu0 */
>>>>    clear_cpu_lr_mask();
>>>> +
>>>> +    if ( gic_number_lines() > VGIC_MAX_IRQS )
>>>> +        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded\n");
>>>
>>> I am a bit unsure with this one.
>>> If this is the case, it means any gicv2 or gicv3 init detected an impossible value and
>>> any usage of gic_number_lines would be using an impossible value.
>> Why impossible? GIC can support up to 1020 IRQs. Our vGIC can support up to 992
>> IRQs.
> 
> Maybe unsupported is a better wording, my point is that it could lead to non working system
> if say something uses irq 1000.
Actually, I took a look at the code and I don't think we should panic (i.e. we
should keep things as they are today). In your example, if something uses IRQ >
VGIC_MAX_IRQS that is bigger than gic_number_lines(), then we will receive error
when mapping this IRQ to guest (but you don't have to use such device and in the
future we may enable IRQ re-mapping). That's why in all the places related to
domains, we use vgic_num_irqs() and not gic_number_lines(). The latter is only
used for IRQs routed to Xen.

~Michal


