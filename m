Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC542B08FC1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 16:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046988.1417365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucPq8-0006P9-J3; Thu, 17 Jul 2025 14:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046988.1417365; Thu, 17 Jul 2025 14:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucPq8-0006MG-GN; Thu, 17 Jul 2025 14:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1046988;
 Thu, 17 Jul 2025 14:44:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ucPq7-0006M6-3v
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 14:44:03 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20613.outbound.protection.outlook.com
 [2a01:111:f403:2414::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74b50254-631c-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 16:43:53 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ5PPFDDE56F72B.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Thu, 17 Jul
 2025 14:43:47 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 14:43:47 +0000
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
X-Inumbo-ID: 74b50254-631c-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvMEsp3WDOvobV//elBkxQmqhwnxy55Vr4QEs0I0mw9rJ1HXqtvdY4AhnNNT4sQyn+5Vm5uRp2FwMAQW3agZVX9gg34oUCX77xMm6oCmJGVzSWhWxBesR/NfPkeornwvB1Zbx5o8Jyz0vkD6keIr/KNzDNpRAMk+nszU9YJRl+jmRTdjXghAVXA60QDg0IYX3kFIAPJI8p6xWlD1ML+REes3qH43kxYFUylUp2gmdYxru7pPWDUaw2XJycDUVtu/0myoKidBxiMcmebA68GFG3m21zUI8VOsyOEhrsYVEhMmahyHRFItrrG0SzIQ5ZgsMw66zPtUUO8lfoRNao8IkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FtPNdQWU2FaZ1mNLmFoHIv/iSkXslvOhnsw76/rXR8=;
 b=vsRnUsvNo75/lJKn7Ojx1TNkXB75zC9hh74jgLmlx0A1JdrXymQWlUHa7FLrJ8lHGI37sP7R0efQWzvVxCYgP7QmVzzyxywPmpmombpNxn/Kwh5ACxQVV3sHPoeXD7xgxF1MN/ROaMADaSB+uJWPwgXQCJlL8dEMsr6cEgmBefxCCbFwseLplCW2OxNFdUK0czjhbUq36vwoF1Us4BIIwuGxgDejtv9XuiLDKNu8PufNS9XTnVBpFKo/zAb3i/I5DtISSFuJUQs1Rxtmpc+QREfF5DIhMKnlVT+rWUVS3SpI/+Zy8ycNJLo4BZ0zzNnG4P3ZktD1+rBjxgW1V4hXeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FtPNdQWU2FaZ1mNLmFoHIv/iSkXslvOhnsw76/rXR8=;
 b=n7DpiCWmmVXWk+XDyP+O8/U83ZFOF7+7WISC7gitOmdkoEKmY7sdR6B1fsqV9pnZzfXIGhnw9CV4NYmBpxqEwKkrBLbv38Zrk3X11/45d0/ZLIxppzffbrhclY7zjtHFVqEx7BYtmed9DMz0rIrNyV1lC/Jf8Z8+vrcOU9rDntw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <248e5f27-775e-4bd4-ad52-233c2deac1cb@amd.com>
Date: Thu, 17 Jul 2025 16:43:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] xen/dt: Extract bootinfo-independent functions
 to bootfdt.c
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
 <20250715161108.141126-8-alejandro.garciavallejo@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250715161108.141126-8-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0386.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::14) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SJ5PPFDDE56F72B:EE_
X-MS-Office365-Filtering-Correlation-Id: 65878476-71c7-46ce-c848-08ddc540560c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEgrVFNKM210SmRRR3YwRUlObkl3T2lQdStSS2ZFdUZMblVQK1o1bThDNjlj?=
 =?utf-8?B?a0ZhUFFEM0o4Wi9nby9iZ1NSY2ZpRENaOUdwWnhzTnQ3SllYWFBIQTZScTk0?=
 =?utf-8?B?SHpMY3FsdUxWams2TVdNLzltVjhud3BjbWlMa1ZKNzZBbXZxc2hLV3hLUURU?=
 =?utf-8?B?UnE1MUx3WjdxQ0MvN2R1QjV0OWJtaU5PNDc0dngxMEY0OWs3dWFEeWg2QUwr?=
 =?utf-8?B?ekRTV2VCNTVLR0ppV2FGTHBHQkJvVE9hNUoxMG94cm45dEl5UXpSODBzSTND?=
 =?utf-8?B?RUtuNjVlRE5UTUFOdTgrVWJNc1NtdVl0N2lDVlpTTVlmdGxaOUR3NkF3cU5s?=
 =?utf-8?B?MU0yTVpXQlF2d3E2N0hEMm5BK2tad2t5Nys5SFBwTDl5OTZJVzJwR3F5K3hW?=
 =?utf-8?B?ZjBOY2pSd2I3ZkpRR3Juc3hhbkxQVmxBWVVYRGcyZmlDdkcrSUV3czFXRDZO?=
 =?utf-8?B?djJZME5wMFpNTzNZdmRJaWQxaHcrZXVOaHhCRzVPREEwYjZyeUZKc0NQbWJh?=
 =?utf-8?B?U2h5V2dIY3JLVTA3azU1Q0FvS1FmSXhwNEJxbWswTVdOUkRXYnh3VmFPSEZN?=
 =?utf-8?B?ZEwrRWl1djhseXJBNWJYVGxQWXlqbzRmaCtVYkx5S3lTdjA4d29ldnFWM3JC?=
 =?utf-8?B?cDRVelhIZjc0ampqdm96Mk5GLzUrUm16MTJ6UG1NK0ZvYjRqWCtjdE5RRXdD?=
 =?utf-8?B?ZjlYUU5YSWo4cW9NL3p4eGV6RFBGdSs0MGJVL0ozbVVWV2w3RFNmRUY4VFRa?=
 =?utf-8?B?ejBFdlY5UXc0ZkpTa3Jid0xvbGg5Sy9BZkNhQjdEWHVsTCtoWEkyMWMwYkE4?=
 =?utf-8?B?U1JZVTU2NE9rTG52VEJzejE1R3I0QlI3aDdFdHdCSml5N2VhNW1FNm5ST0lB?=
 =?utf-8?B?d2ViKzYwTU5PbDl6VzF4VGpzVnllWWpiZ21vTmtzZ2dldWk3V3NSWkVSVlg0?=
 =?utf-8?B?VHdRY3B5NEJocEN5UEhqeWY5OVJkczA5WDNFeUEvcXNqM3B4WldlTmpGSWRT?=
 =?utf-8?B?QXI2UE5PU3U4Uit2c3E4c0RxWUdVYnAyNkkreFUza2Jqdi9jdWFyQmhHSWlt?=
 =?utf-8?B?N3d6NEw2ZkF1aEtRR0tTOTBLQ2hRdlJ2WXJWNkNyOUhjWU1GNkhGaG9tYmhO?=
 =?utf-8?B?Rmx4Ulppc3prTmo4WWsvMUpWNmh5aXRxa2NNZlFSalJ5Y1ZTNEVxZjRwSXoy?=
 =?utf-8?B?UEZZc05uRmo4TlNOZnVTTmNqeTFUTzBWQWphSXdPN21zSjQrdUN0SXUwdkZ0?=
 =?utf-8?B?NUIvTzk1VGFjK0gvKzBZTmcyS21BMlpKQ1pFbU5lL2hRSW8yU25XZDF5STVZ?=
 =?utf-8?B?N29EQU5RWWtQRnlHTG00Tk9JVUZPcFlPZ3Ntb2NPRE5GV1N4ekFPMWtvSmlU?=
 =?utf-8?B?L1J0T2gyNjhsOVEyMmNIeDBNT1hTQitTNDVsQkQvVUhOclowSEFRdk96bnFL?=
 =?utf-8?B?VlRFa1dkR1gvZWNYaG51VmhwYlRhWFBYdzJ4MHFNdmVHbmx0MDJueS9PRmtQ?=
 =?utf-8?B?czlUK2cvc2oxeWJYU1lDNHNaNTRaQXhEbU5kQ3FZOHZ5UzhGYWpOZnhHMENi?=
 =?utf-8?B?RUlyL2VJaWJZdTZlQStpd3ZJUEd2c1h0RmU4cTIzME4wWWRQa2V5Rk5SdmFV?=
 =?utf-8?B?Umc0NjZqSEt4OWVNUFZyQTRuR3RCWWhFd2hCMjJkd1YrbTNrVVB0MDBNbTR3?=
 =?utf-8?B?dmtFUTVGR3RJTm12dXo3V0owZjhXY1pONXFyZGlqelpRc0tGcGdrc0pMWjZa?=
 =?utf-8?B?S1NQZVhnNmYwZ2RnM1k3OFEwRFU1RDcyQVFaZzZFWm9LTEt1c2E3Zlp6S1BD?=
 =?utf-8?B?VTNRZDBaSHBFQ3Boc2hTZzJTanRWYnJMMXhGQURqeVFuMDMzWGNTcXVrUmp5?=
 =?utf-8?B?eU9EMzRUYTRSZlk1cGhROUp4aFJOS3J4Zk5pSW1oNGpxbTZaRG5laitjN3JV?=
 =?utf-8?Q?eV8G53n2pa0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnVEREE2a2JoQ1kvV2FXVnFEMmlNdTVFVmgxWFJZMGVjekVkYnlnNGhBWmor?=
 =?utf-8?B?b0tRclhQNTlKQTFxQlRmSlRIRm82NFRWUU9OYXlvQTllN3RMNGFLMmJOTkhH?=
 =?utf-8?B?ODVVSUYycStjL2Q4TWt6MUlYd0EycXhzWlVPRlF6dko5TVdNWEhiNE9wREZx?=
 =?utf-8?B?VUJ3QS9JTzJTcXVtdXhiZkx2M3B4dDk1N0EyeFVwUzZ0Mm15OGtmaHVLSk5V?=
 =?utf-8?B?bHA0eDFqWUxZL2pPZ3NxUi83L0lmZHp1MDF6bWdTSWs2QmtnS3I2cDRzMFdy?=
 =?utf-8?B?b1JYMVAwQVowZkd0ZlhETUNqZUNTY0ZNbHowallkbVNlUzVlYjhZV2pZU2Q2?=
 =?utf-8?B?NGRJbE5DalFCalRxVzBtNUVaMDJvdmRtZXV2WVpPWEtmVlFRMHVZL3EzSml1?=
 =?utf-8?B?M1RQYWpTbW55bEsrckhWZ3Nxd1paSFBnaEVFWnBKZ0JoSzRESUpCRFU5bVE0?=
 =?utf-8?B?TGM1Mks4VkNodmJpVGJWRXBlNFF5ZkN0WmNjNEF4K016MXhNdEpGWU90T0xj?=
 =?utf-8?B?Q28raDhZcTAyYjQva3NGWnN4Ry9ueGsxMlBUaDM0ajVUMldQajRBQnk2Ulo5?=
 =?utf-8?B?YUJBVmxzUVVVRjVFSzRsT0JhVTFOTnlHY000ai9YWGVJb29FMWsxdm1ucnNY?=
 =?utf-8?B?aks4dkh1Y210Nmg5UlpmUU5uV1FoSUxobEZWOTZlR2pNeWY4alpxZ3REejFB?=
 =?utf-8?B?ZlY2SDIwL1dnczd6eEN2V0hZRndaQlFQakVLbE90YTNxTXh0NzU4WHdwMk96?=
 =?utf-8?B?cHBiT2JBYk5tWHR2R2FDRzZxN3R1dTJQM2Uvc0tvR1c4b1c5bzM1ak1xU01u?=
 =?utf-8?B?aXlUcncvUWNRTDVGSGZ4blkxQUFZOHdtczVYeHNYWkloU3ZySnB0eFpJSmlm?=
 =?utf-8?B?c2FCN1pXc0ZFQXFJUnNScnJKMzljblVtVk5XK1FvaVpkQk5aWDU0UnBOd0RT?=
 =?utf-8?B?Q2tIS2QxeE9tMDhEUk92N3dXOXdRT0hFQjQ4bzFIOFJkaFBwTDFFOGozWUdr?=
 =?utf-8?B?c2c1OHQvR1h3MDRtN0hxdm9yNS9MYkFaS2JPU0RhUkdlcjIrditQc3Y2U08v?=
 =?utf-8?B?ZndwT0JsUWQyVkRKYXRPUkRVWWhVbE1TVzREaGNrditUUWUxOUVyRTJwdllX?=
 =?utf-8?B?RTlCWkV2NitLZjVNNndleHhHb3lFRTByTzZkYVVtTEJxTHk4eHkwSTBQV1k2?=
 =?utf-8?B?R3dXbENzYjlqaGg1TktCdUxJc1c3QzdVSjdGT1J6Smc4Uk8yM0ljdVo0dGtI?=
 =?utf-8?B?Qnpsenh2VEltRHNnWWxyTzVKQTdRakhicEdURytxTG5nRytSdTkyVWJQdW1a?=
 =?utf-8?B?VTcwSm5ZeFJMeFZwY3B5UnB3V2oxSjZucGFqYlVGV2ZubStvTldSZTBHbFp5?=
 =?utf-8?B?emlnalN6bEVwRHdPM29acnVmbUtXSWlhbnhkTW5kMmRGN2g2cnVha215d2dV?=
 =?utf-8?B?aFZDWGc5NEpmeTF5RDF2bi9wQU1pRERQNjFPMzd6UHJCVUh3MGY1M2REYmM1?=
 =?utf-8?B?QUIvck9XcUlYNG0xdHYwbEw4WEZiNTYxL01UZDBHZEJOZlpMRHFzV2dETXpW?=
 =?utf-8?B?S3VMZkpXQkZrc3JrNlhMaHVMRmxraTJxZ0hMZWduaU1jNXJwdE1nRld1QjVi?=
 =?utf-8?B?dStiTVVHdkxSSjhzTy9qVFkwWmhrQm1MN2hNL1NoQm9EdVRSczh1RDg4d0tJ?=
 =?utf-8?B?T2Fia0RaSWlVbFhjdEl2T0xmdkdmWmJoRFNweUV3MTArMVRmbGxvaXBQMGlr?=
 =?utf-8?B?d0ZRaUt2L1VBZjVHbi9McXpUdkdnMmdoVlowbjl3S3RvdHVPQ2RzUFJxbTQ4?=
 =?utf-8?B?U0NzT3lNVkFtVExOanVoRGZOM1ZiYUo1N1lZS2NaQmZSNGdwTFFrQmJvbE5E?=
 =?utf-8?B?dDQwL0UzQ1h0S0Q2N202S0JGYnF0RWh5WlVvaHdLb3N2SXNnREZLUmIzeEl5?=
 =?utf-8?B?YmRUN0xicFRIaWNJOEJ2OFMwbytXS0xUVG9rYUdEZ21oVktidjd5NldRUld2?=
 =?utf-8?B?YUszWU1XOXJhb0dYWHhyejc2OE5TZ2JIU2xldDREZ2xlVWJ2VXA5VkpTUHRI?=
 =?utf-8?B?SmpPUm1wM3BwczNDOU4veFg3T3lmdHRnZ0xhSFZFV1RPMHNMS0FrTmZ5V1JS?=
 =?utf-8?Q?J8BKjt44L7pfpnoF+5XapvmBV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65878476-71c7-46ce-c848-08ddc540560c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 14:43:47.1016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfQos21P0IwM8/CZoGBIy5PgOB/xw4w6Alyvc3gSzI1BH6E66Cgs9ISzi9467UxH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDDE56F72B



On 15/07/2025 18:11, Alejandro Vallejo wrote:
> Move all functions independent of "struct bootinfo" back to bootfdt.c
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>\
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


