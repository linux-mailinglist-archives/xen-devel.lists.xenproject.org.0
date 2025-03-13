Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3E6A5EF8F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911692.1318091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsesb-0007h2-1r; Thu, 13 Mar 2025 09:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911692.1318091; Thu, 13 Mar 2025 09:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsesa-0007f4-Ui; Thu, 13 Mar 2025 09:29:28 +0000
Received: by outflank-mailman (input) for mailman id 911692;
 Thu, 13 Mar 2025 09:29:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6QA=WA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tsesZ-00073f-N4
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:29:27 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20618.outbound.protection.outlook.com
 [2a01:111:f403:2407::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7d37795-ffed-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 10:29:26 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MN2PR12MB4373.namprd12.prod.outlook.com (2603:10b6:208:261::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 09:29:23 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 09:29:23 +0000
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
X-Inumbo-ID: a7d37795-ffed-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rdda0Jym0O0S2QxwhaN4y0nY0D0j4W0FzYmucXX/cA6a9Vo8xyJdQ/yPeZsnJ+JooG2kQlrYzERLsE3QzyqymIH1kP86IzrjTha2GfIFI7ZNgDzEvzHDhscHc9zJTCcTRnZMmErmW53eM4jthucQVuAHJNoSW+B+s5owho7BnKtdi/8Lzp33jgU51wtdlh2q4Vo1965laibuDOLU9hRPB946JPEUXXZ2P1qZVP8UL7BtPjnFSxyFYO9HQpqxXyU5TvAjafNVHlTjW1NxUMqkKDmfw6dXu3/tsjADTi1zG06Usg3SqzhDuOZVND3z5NiCzMZB6/7BCfUUB0Ew7wShEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZXHQsqvPnFfoUWzocheZMxcy1ZL1XdKeTeeg83BgJo=;
 b=XPf5/YHzVJ/6DT1ke4iS1qLuK1G5ribfTPbMVZQXhVr9YX+JoD1wXfC0YrgBf9qGf+ZABXl3insnbPGo0iUBbISk4076nwmoeumXMFUdVuewgF64QlTR/D01QvQo7cTPcOHoVSP+Z7ttCoeBwh/XNTDCWwK5Q3PtqlNWTBRxU6xoSf7B5RTcEOoUjAGJGHL+Q+CabUDPnWNa0gP0H7ebgmzCQsdftIcoruX1Mo6nvfhjyW5aUzQSFatmmYguAdh96gRuh+76t5cLuiLSVJukGTFOXipRVQFCaVdrkJQhRQ+E7XSJG19cDZxZpV0r07eFKzYLPjjvgZqIXN+qGaTwMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZXHQsqvPnFfoUWzocheZMxcy1ZL1XdKeTeeg83BgJo=;
 b=KRZ4J0GCliUligAfRIpdPU0o73zLilODdUeqt+/y8i7TK2AF1qsBwqAKexmNkP6t82ThYgkIgSpDNG0wEjT7EhM3I3vJf2cS6ohg0UzTMHDx3SSKlergvQK7adUcTmeFYldLLCfb/g15f2Ddggu8T3yfcp6usvEDR1LRZGg2Y7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <25481877-e9de-4573-b721-e0dfc060a991@amd.com>
Date: Thu, 13 Mar 2025 10:29:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] arm/mpu: Introduce frame_table, virt_to_page,
 maddr_to_virt
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-6-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250312135258.1815706-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0301.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MN2PR12MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c35226-c2c1-425c-b399-08dd62118a95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkEwaFJ1b1hyYVFSSysxS1hhT0owcTFrblR4bUNrVHNONWFqMkd4V2VqT0hp?=
 =?utf-8?B?SVYyTWF1aVVyZ3N2SzZydFhScElleUsyU1BCMkRQczdQbXVYS0tnQU5ja0tr?=
 =?utf-8?B?YVpLZ2JyRmd2alJVS3NmVXdqVkNEdi80b0ZjSUJDNnNjS0pqcW1VaVBVcWhV?=
 =?utf-8?B?VHd5ZCtQTWtWdDhjMVhaa2VaWUFVUlN5YWtEdnRVOGFWMEtwWlhmWnl4amZz?=
 =?utf-8?B?Z2F6ZUdoU3pwTzcvWldOUjFpdk1zaGpNMy9qQ09kdGJNNlpPNHRpOFl5QkdQ?=
 =?utf-8?B?TXNOZFdEc00yRkRwbHFaa0lMVjFqSWRjYnF4cnRIMVdvZUxHY1dMSjAxQ3Jk?=
 =?utf-8?B?TUxPc21sMk1WVDJmUzZvaHI4Z29ZaEJxbFFKUWRzQUVnd3pUUStjYjNIRCtq?=
 =?utf-8?B?TDYydkVENVV0RHdoakRHeDU3ek44SUVQV3FoREdjNGgwcVlIZVRkaUpwTThL?=
 =?utf-8?B?ZDBSV1FNUXJESlBiM2M0QXJTS2ZqRjJyOUpNVVVyY0k1cU9sdzhYUmovMnFq?=
 =?utf-8?B?WDUvOVZ5cTJaM1N3SjNhWXI0OGhsYVg1QXNPeE8rSUUxdjZ1M0Q1THRmSHVM?=
 =?utf-8?B?MVJJNmpNR1NJdDJDTEUxWmEwUG5ldXBPRE9ONU1kTUw0K05xZzJpVTVaVmxQ?=
 =?utf-8?B?WjR4OEZlVzNCTDU3OGVnbkxyTmROTWI0SzE5NE9jbDhaM2ZGZm1RaWRiU1I1?=
 =?utf-8?B?WjhjM1hObHRIOG9GWkNRb3o4U3VRdVVUbjduSk1oM0xiSlAwQkYzQWNFS0VT?=
 =?utf-8?B?bVh4WmthWWZmQ2pKYnVCRU9TaHh0UXBsNmgyOURUYzZvUU10ZytYRjhNNVVO?=
 =?utf-8?B?WHdrRzZZTWo5NmVBcUVsK1JWeUdhOWFOWTRUdTdUZ3d2UFBLamJmeUVLZHV3?=
 =?utf-8?B?enFGT2ZJNkVQdHJiOUJWQnRITUExbys5SjAzdEk2QzhpU0ZHaEFxWXVGUm5J?=
 =?utf-8?B?L0hnWTJmQm5xTjZwdGY3V081VUE5MWo5Y2ZCS0h6NkRZQk5qdSs0N3k0UVBs?=
 =?utf-8?B?aFAzQ0JwZW9ORnVjamZzMDZ6TnJjb1JNWUZ1Y2dDVjRRY2k0cXhudWZCeDZy?=
 =?utf-8?B?NUZNK3RIZWs4SWFVZDdTeTd6d0N0aTJCMkg2dllZZHNXYWtFb3lodm5vUlc2?=
 =?utf-8?B?ODd1Y2Z2bVN0djNRV21iUHJQYldZYUNBOEJKM2Mvc0dmUUpTOWZnY0V1TzU3?=
 =?utf-8?B?RG9UUUU1SlpRKzgxakcwcWYvbXllRTFENkpJSmZUVytsOFlVTTgxY1J4VFpE?=
 =?utf-8?B?ck9nUU1vc05rRWdsSW94Z1lZVE0wSXJubDBDTDNJemVZL2dOMFFkU2owSnNK?=
 =?utf-8?B?VE1UV1V5NVB1cDFpeFhac1ptZ21YbGZ1b0ZKRTlKc0hidjdCZDkweVBjK0k1?=
 =?utf-8?B?eGdVS0dad3VsblBmNlpvL3A3eUg1WkxiczNBQjd0TDdyN1gvZ3VTeHFaOUdx?=
 =?utf-8?B?Y21xbU5qU0lsem9PTW1FQ1p3dzQvWXM5RTM2R3RKRk1NazBRY3J6WjgrZFVw?=
 =?utf-8?B?Zkd6b1pLTWE0RjV0QmpBM3NmTWpvbVg1TlljMXArNFhzWHRQN3RkTmZyY1o0?=
 =?utf-8?B?MC9sWWRQSXN3OG1qUXRPL043ZFViYTdhOUNxZlY2S0dYZjhWT0hieHdqdEgv?=
 =?utf-8?B?ejBIWFlZZHViRy9Ka0kvUVE4b3JJNnhnWkxxVHZrcHJqQ1J4Z2dlRXR2cmN3?=
 =?utf-8?B?V3pBdnhHQWZ0WllVVHpJRjkyTitWaTFMdTdpUmdjdXVLV1JKN2lXa3Z3Lzc1?=
 =?utf-8?B?b2lFSVgySXhGOWE5REFjWUp0bkxmRG9zN1BoNUJqeGxoL3FyZGcwRGJzM3VN?=
 =?utf-8?B?WEkwSkRxTDh1anVmcUltYzZqU1FkMXZ1L0NGYnhmMEFwK21qb09mYm1QZ2xQ?=
 =?utf-8?Q?adUOrZ1RCKbSg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG1BODVDbENzemk1NlM3cmY1WWV4dWp0azZwK1M4eFVpTmZYRnRUdnk4WEdn?=
 =?utf-8?B?RnZiZ0dBSGcxc2ZVcm9FSVZBTWZ6cE1oQVYvemNYczVVUndJNUJvM3FhR3Uw?=
 =?utf-8?B?elZkaGtaMHU2VXB5dTMrQ2VrcHAraVZ5N2lKNitDQjk3cXNwaXhVWDErbWgz?=
 =?utf-8?B?ZlJzczhiNXRpc3JzYVM2cklXZGtTNS9ESnhFYmI3VGtzRmx1UDBReEo1d0Fw?=
 =?utf-8?B?d0RUUWdpb2JaTm1CU2hKcTBxS1owOU11MWpBSXVyUXFJc0pJNlFTa1lJY1ZY?=
 =?utf-8?B?WmwvZTc4cm9FMEg0SlNmdUYxdDlsQ3V4ZGhDRjlFUGJuYjRia0tHM3BaM1Ju?=
 =?utf-8?B?dDdlUnozeU12aUp0c3hPNG8ybVM3c01zUlN3RGF3TGNqeFVuUlRhQmRZS1pk?=
 =?utf-8?B?U29ZTzlzaU10ZjIrN1U0UmFlUkhFc1pRenRIdHJEY3hCR0JuWHhIZjRSaklr?=
 =?utf-8?B?QUFhYkJsN3NaWlRERmNKUXFIUUdmZWtOMG55YTZjS2xRVlA0bnlFS0hkR1BW?=
 =?utf-8?B?aldGSjFnTnAxUnRQTmVKR3Njakpub3NDaFJibzQ2bE0veWRRUEUrNE9OQUp1?=
 =?utf-8?B?UWJqdlgvSkh3dWlRQUR1ODZ5Z1dMUjVCRFN3UFk2aUxBSXhrQmZUaFRXY1dL?=
 =?utf-8?B?ZnRTaXI0eG5vVkJLa1dDNFA1QnlKNWtaZklRQmE1Q0kyNEJWb3R5MW9MTnVC?=
 =?utf-8?B?dWpvaVdWQmZKdWVKNnZyazlPa0x2azJxd0I1N1BPQUc0a1lWbm9jY2RlZzJU?=
 =?utf-8?B?bEhzUlZOa1UrNEo2d3FwZFpDQ3pPb092YnE3TWNwTkprNWN0MFdEb3BVZHZk?=
 =?utf-8?B?ZFVCQ3QxTHdteUVKOVJUamY3K3ZjRnJyMGplTStVZ1FzNzRyRGtwcnpQNmVM?=
 =?utf-8?B?c1RiU20rRWhzank0eTBJaGc4a3pPNnFldm1nWFFVcmx5ZlM4L2FVbTFDcTFn?=
 =?utf-8?B?Z1ZZMXE5UDlzWmZxajNua0JQL2VPQSt6bHNLeXl3UTdjdWxBSVg4M2VrYU9p?=
 =?utf-8?B?N3Fhb2k1YVhuNmhYVkgyTm4xQkx6aVRyTUlvVis1SGIvN24ydHFxME56aE5H?=
 =?utf-8?B?eFpYWE42Y3pSb2RONWxtRytTU3crMUhDM1RTRHJLUDI1Qkw0YThYTGJucTNu?=
 =?utf-8?B?dGNPZWtHdzl6MG9yaWcrN1psUUR3dUl3SXRBSEJWNjNSR2hkYnZtbzAxa2sz?=
 =?utf-8?B?SGtJNmNQZ1V4QXpjK2J2RGJTV3JIUWl4WXROTDluQmJjaWlnRko1dHZWdGlR?=
 =?utf-8?B?KzlwZ1Z4aFFqWmVTanNNbkl1STNUVlRFTmhCaFdKcFR5UTNtaFd0WURRK1g1?=
 =?utf-8?B?OWdNelhmRHYwdDBEZUE1bEVmZlZ6VEpLRUJZRVM0a1k1ZHcyZUZyWS8rczZR?=
 =?utf-8?B?NzBPU3pWSkNHUnVjbEpkeTd6RHNSMVIxeGRSaU1xKzlSb25SWHdaYUFTd2J3?=
 =?utf-8?B?T1FsUndHRGszUEFIdmxQYjdZNGl3WHpra3RvSGF1T3Bxc0ZTRmJyeWp0M2N5?=
 =?utf-8?B?SDF0OTFJeDBmRGtpUUlSYzM3cWFVN08waHhGNzVFc0x4MUVxaEdkMW1rVW5U?=
 =?utf-8?B?WDZwSjhqWWdJQUsvVUx2dW1ubEdYejR5dEgxNXkxbVlPSHpEZG1GZkN0OHd1?=
 =?utf-8?B?MjdSdW05VjNFdVAxaFJkbHJ2Sy93WU5abWFOdVorRmRBdzdEekIwekNFS283?=
 =?utf-8?B?S2YwRXRKZkJUWW8yelNTUmRzNTJRNHdoQ0g0SDBPbEdJSWtOV1d0REhLS1FP?=
 =?utf-8?B?REw0N3BxYzJ0bC9zUDVsS3pXNWVYekIrNEZVMHpRdjVPUFJGNEF5NUN0WnZ0?=
 =?utf-8?B?eE1KNmhLb3YwZWhyQzAwc2x2VmtZeTlGWWdJTVYwam91U2d5UzBlSFV5TlpM?=
 =?utf-8?B?NlY1TndnN0phWmJWd3Rza1pTbDVOdUFYRkdKQTdqY1lKU3BsNEVtZ2xqMHRW?=
 =?utf-8?B?RXZOcHV1MXU4aXUwbjdORTYySzJTMXJxZ3loOUx3Vm4rUGRNVTRBaXM3ZWFX?=
 =?utf-8?B?NjJRRGluQmtBV1JLQnNweWUvZC9FS0YyLzhNY2F3YkZVNmZTWU5DdUIrL0x0?=
 =?utf-8?B?Y0prc01UVzhXTVZJNkl6SFdZSFM0bHlHeE4wZzdCK3JKNVp2WllqUTg2QnVZ?=
 =?utf-8?Q?hE0k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c35226-c2c1-425c-b399-08dd62118a95
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 09:29:23.6984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9q51nOTrKiwxQXCPMDAo/gnC4NZPXJqzZNLDgLfAgx9B013USGX7T81ptSB2f3W0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4373



On 12/03/2025 14:52, Luca Fancellu wrote:
> 
> 
> Introduce variables and functions used in the common Arm code by
> MPU memory management subsystem, provide struct page_info and
> the MPU implementation for helpers and macros used in the common
> arm code.
> 
> Moving virt_to_page helper to mmu/mpu part is not easy as it needs
> visibility of 'struct page_info', so protect it with CONFIG_MMU
> and provide the MPU variant in the #else branch.
I see we move some helpers to mmu,mpu while others stay in generic mm.h. If it's
not possible to do the movement, then I'd suggest to keep the pairs in generic
mm.h to avoid situation where one helper e.g. MMU is in generic mm.h and for MPU
in mpu/mm.h

> 
> Introduce FRAMETABLE_NR that is required for 'pdx_group_valid' in
> pdx.c.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/include/asm/mm.h         | 18 ++++++++++++++++++
>  xen/arch/arm/include/asm/mpu/layout.h |  3 +++
>  xen/arch/arm/include/asm/mpu/mm.h     |  3 +++
>  xen/arch/arm/mpu/mm.c                 |  4 ++++
>  4 files changed, 28 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index e7767cdab493..c96d33aceaf0 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -341,6 +341,8 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va, paddr_t *pa,
>  #define virt_to_mfn(va)     __virt_to_mfn(va)
>  #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
> 
> +#ifdef CONFIG_MMU
> +
>  /* Convert between Xen-heap virtual addresses and page-info structures. */
>  static inline struct page_info *virt_to_page(const void *v)
>  {
> @@ -355,6 +357,22 @@ static inline struct page_info *virt_to_page(const void *v)
>      return frame_table + pdx - frametable_base_pdx;
>  }
> 
> +#else /* !CONFIG_MMU */
> +
> +/* Convert between virtual address to page-info structure. */
> +static inline struct page_info *virt_to_page(const void *v)
> +{
> +    unsigned long pdx;
> +
> +    pdx = paddr_to_pdx(virt_to_maddr(v));
> +    ASSERT(pdx >= frametable_base_pdx);
> +    ASSERT(pdx < frametable_pdx_end);
I struggle to see the usefulness of frametable_pdx_end and we don't generally
add more that start, size. Looking at your tree, the only use of
frametable_pdx_end is in this ASSERT which is a bit pointless considering
release build. You already have start, size, so you could open code it.

> +
> +    return frame_table + pdx - frametable_base_pdx;
> +}
> +
> +#endif /* CONFIG_MMU */
> +
>  static inline void *page_to_virt(const struct page_info *pg)
>  {
>      return mfn_to_virt(mfn_x(page_to_mfn(pg)));
> diff --git a/xen/arch/arm/include/asm/mpu/layout.h b/xen/arch/arm/include/asm/mpu/layout.h
> index 248e55f8882d..c46b634c9c15 100644
> --- a/xen/arch/arm/include/asm/mpu/layout.h
> +++ b/xen/arch/arm/include/asm/mpu/layout.h
> @@ -3,6 +3,9 @@
>  #ifndef __ARM_MPU_LAYOUT_H__
>  #define __ARM_MPU_LAYOUT_H__
> 
> +#define FRAMETABLE_SIZE   GB(32)
> +#define FRAMETABLE_NR     (FRAMETABLE_SIZE / sizeof(*frame_table))
> +
>  #define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
> 
>  /*
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 57f1e558fd44..2219c9979548 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -5,6 +5,9 @@
> 
>  #include <xen/macros.h>
> 
> +extern struct page_info *frame_table;
> +extern unsigned long frametable_pdx_end;
> +
>  #define virt_to_maddr(va) ({  \
>      (paddr_t)va;              \
>  })
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index a11e017d8a96..4036dd62eeeb 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -3,6 +3,10 @@
>  #include <xen/lib.h>
>  #include <xen/init.h>
>  #include <xen/sizes.h>
> +#include <xen/mm.h>
It's not great for a relatively new header to not have its includes sorted.
Please take the occasion to reorder them.

> +
> +struct page_info *frame_table;
> +unsigned long __read_mostly frametable_pdx_end;
> 
>  static void __init __maybe_unused build_assertions(void)
>  {
> --
> 2.34.1
> 

~Michal



