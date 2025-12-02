Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E03C9D19C
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 22:35:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176364.1500864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQY0U-0003Yo-SQ; Tue, 02 Dec 2025 21:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176364.1500864; Tue, 02 Dec 2025 21:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQY0U-0003XH-PW; Tue, 02 Dec 2025 21:33:58 +0000
Received: by outflank-mailman (input) for mailman id 1176364;
 Tue, 02 Dec 2025 21:33:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WL05=6I=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vQY0T-0003X9-CS
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 21:33:57 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 914d7711-cfc6-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 22:33:39 +0100 (CET)
Received: from DB7PR03MB4603.eurprd03.prod.outlook.com (2603:10a6:10:18::24)
 by AS8PR03MB6806.eurprd03.prod.outlook.com (2603:10a6:20b:299::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:33:36 +0000
Received: from DB7PR03MB4603.eurprd03.prod.outlook.com
 ([fe80::7eb2:6a9b:fddb:6365]) by DB7PR03MB4603.eurprd03.prod.outlook.com
 ([fe80::7eb2:6a9b:fddb:6365%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:33:36 +0000
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
X-Inumbo-ID: 914d7711-cfc6-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NhWuLEoAh1Hz29yNuPV1Ti8mjyNvQPTNIK668211/Jpo8qY5ChyoySPUyrwa1khgjVUTHj2XZ1cxJBRA2XOyj7RGd9YGgjqtVf7LBoSRB75WDqzpdNDGEGTfDMrrixLiYF8y1i2TfEmSxiMPZW3Qxm22j11z0eZRVNjj2hhoUs5MnanFgtpBMM3y1URjO07H60VOTVbSrIhpzB2gViMJy9cjlE1pkmq/yJLzbXnH5tp8CepM4MUX4IvuNs2YEkRIIXSNfA+bJzJts2RoHGrwgxPuB1kbVytfpG+K3ix9acnVIi8ohcu0mci/wjX1rnUULRD12B8Hl96ENruiO3QkYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3imEDtJhDTR4KPhpBxwU3oT7pPoKK5KcXrl6UfJt+M=;
 b=j3n3q2qO8049q1OwzjEDMYfjRhJ1Q+ACpyjCRA4ORT9DAUIm3kmFheDiQfirQ7SckOWDbs3b/p2U7Gz/I6m2pOH05Sys/nGVbYuK7HT/kt370ff/SOMcKslgYcUiRLhRygYL6A3apHh5wQh5gFKwau9La7oonoVY4XZeTRPcTP+qaPYKcQfznl1nrkQS/FMKnWyPjNbu689H4135dbINVru8FuX+iH3JroXmCRgBtMGk0zYwqDSUdqgOQFJ+Sl40yb2VidqgtXCewSRgTu7B/JaTkuPm/jONspnlH4EMAkC+Id+CYcM5s7kb8chYWEHLuv/Pdri4mR9UjOzimC37Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3imEDtJhDTR4KPhpBxwU3oT7pPoKK5KcXrl6UfJt+M=;
 b=gbO1Zo7ESgn+Bld67tbfUF6vpeKkvN38j22sYT9s9agWn4FMNpuJikaWJgxlWGTm4jWmu6P4Yoh3ET1Qqqy7fK7lQTgNHHfpwJvm9cxxbRWdq+Ry17yK2SymVd9UPNb9RGOF4yKxw00ibB4JHO1IRnjbNDuU5VO8bIRei3Ux4MNnVrqGim1H1rWTfVoUpEUXO4mS+Ayr8bmcTal/JAL5mq4QS5wdYFTiZRiKIA9l0GxxmZLTVfwN1jMDGeTLlVfRtlg7rmFcZmZzPqEaPtZb+DQIrb5q5iC2Bk8Ykx0MG0yV91zmz48QspTRqcSVZ0vWFJOLwHBu2hCcAbXAwgU5zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <98e9f551-cd8f-4c0c-aa79-144466e68df0@epam.com>
Date: Tue, 2 Dec 2025 23:33:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/dom0less: Increase guest DTB size for high-vCPU
 guests
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20251202193246.3357821-1-oleksandr_tyshchenko@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251202193246.3357821-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::25) To DB7PR03MB4603.eurprd03.prod.outlook.com
 (2603:10a6:10:18::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4603:EE_|AS8PR03MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e56bd2-6557-4bf9-46bf-08de31ea73b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vi9odDkrN2RoVi9HSDhxZjNmQU9VaVJXd25qMmlYMnE3L0ZnMlFrd21iTXlW?=
 =?utf-8?B?UGlNVHlPOHVZUXlJQUdtSk5SREwvaFBNb20rRUhEVUJBOXRwVEhHekVRQy9Q?=
 =?utf-8?B?ekoyU2NKdDR1VXlYYmpJOFBndVVqWUFjWS9aRXBMa05pTDVuRzluMnVJa1ky?=
 =?utf-8?B?bC9rU004R3MwOWRuclBraXhEcVFLc0VlalVoZlZBT296RGQvRnZDY0kyMkpS?=
 =?utf-8?B?VlIzU2pLQVpudURISHc2SGVpQWdtd2lSREFSUmdGdDRxc0NTMkF5c1pUOWVz?=
 =?utf-8?B?eDFLZ0dlKzhFcG1iRDFPLzJKUE1MbXJ5ZnVCT0gzd3l1UWNMZEhNUUp3ZVZs?=
 =?utf-8?B?U1JVTjlrY0VRZTlwNFRCc1BkRzN0Y1dLT2ZaNW1SL3ZZU0ZRZnFWODlKSTE1?=
 =?utf-8?B?VUNpUHJJcHZVYWhCb3pjUEhZTWdEMjNQcTN4Y0QvQzNMOU42SHFyWHRyVm02?=
 =?utf-8?B?bnJCSmlsZUEyVExhaFp5aFBEb3BUZW9YaWV4cWNaR2k5TWM4V2NodzMwejJs?=
 =?utf-8?B?RHV6QWlvUnI4SVc1bFhLSWNQU3o2Q0FmditENitSeG91UmpKRjVKNlBON3kv?=
 =?utf-8?B?N3BhZjhacWxMUzQ3NHM5MVJLaGxLbDhhSE05RFQvcjBGSGd1a2oxWmJpc2I1?=
 =?utf-8?B?eUJnS1ZqRCtIaC9CN0VJVVQxWkpzdTd3SHZjTC9Falo1TDZmdmhmWGVDQWVH?=
 =?utf-8?B?dktiZW5oZnQzeUtjNTFGZFhKQWpXdUtWQzR4L2JZRkhpTTlweHJkU0ZMOCt3?=
 =?utf-8?B?cXJla0U3Y1ZaYVU0bU11OHNORnR1eDJ2ZE9PcTlUalJLbHpXZ0RCYzQ1NFdF?=
 =?utf-8?B?dUpHS1BDRWlMd0lnK0g1czg2Y05uNWY0V05YMlMyZHFrdzdDT0JoSGZjTC90?=
 =?utf-8?B?Sk1uVldhVDE2RzhPU21naVA0Q0VtVkx5S2JjNjRBN2hobWp1ZTI2NEYyMWRG?=
 =?utf-8?B?UEx3K0RieWQzd3ZYM0hFaExMT1p0aDFlRzUrZTh2Wk82R3d5bTRpbGMyY0hr?=
 =?utf-8?B?RzVoU2hlbWt3NGk2eDNocjZPalNac1lqOHpYbTRTUHpwcXZleG9wbVJDRjV1?=
 =?utf-8?B?UHBsSHRaNkRJR2lyMC8zb0dWMGxJZmRDRW52L2krWXl6OW5QVUpHd0pxajhN?=
 =?utf-8?B?dkZOaWZidktkcFNMaFg2YmxMRWMxaGlkTXpEdkZiSytuZmFmYlJTK0lJUVpO?=
 =?utf-8?B?eFNrM09mVWxlMGlnV1FTanVuWkxsL3lobW0xOHQrby9HRnVnR1dxSW5sc0Vo?=
 =?utf-8?B?eXN4M0VLMk1vRWRLZjFNSUtSZXNpcUFTY0pzSS81bkcvMlR3elJWM3V5WFpr?=
 =?utf-8?B?VFZwV0c5U2FKS0x6cVhyODl0eTFmZEFsQ3Fpd24rdXM5UWdlSWt2c25SdVpz?=
 =?utf-8?B?YVNDVnV5eGV4NS9VSzN2UWZWQW5CUExyTm5lbWJUbXRPcE1PZUVJMlE3WFlw?=
 =?utf-8?B?QllrSlRXSGFDY3JDYk1kN1hNVzY1ZFlqeHlHdXkyTFZEUDJMdzQvRlE0VDYv?=
 =?utf-8?B?cmFHTmNOUTgyQmV1Y3BXN3owMUFKdWtTOVFGRnhHWG52VC9EZFFpSHB4blJq?=
 =?utf-8?B?ZHFrbGRnWFlKOU8wTkVMN2Z5Y01VVXpsODJMWFBodHlyaXFvZDBaaklENTFT?=
 =?utf-8?B?dUhiSXd3ZHdKb1hFWkdPRVVjbGFCK2NYQkFVYVJCTXl2SzZHNU1vYVlBb2JN?=
 =?utf-8?B?YnZPUXE5WCtYN0MweHh4T2VES3lmMlpaN1kvVnRFeld2dW45TTFqQWxYL1dX?=
 =?utf-8?B?bC8rZUt2UG9tTkF0dzBzRjBtT0dvYjVqRUxTVDA1TTlwaENuQkxmTDJuM2Y4?=
 =?utf-8?B?YXVidFJMM3N2STdiTmxqVFgzc3dpQ0cxeklURGhwbTFEclF2N1RSZHlGbVFI?=
 =?utf-8?B?NHJFbWhGSkI0NE8xeEhUdFlLQlgwMjc3cmk2a2VWQzJ4QXVkem81dmduWHZl?=
 =?utf-8?Q?t7foYUUZhRL4RXi8+woRorefXw7xUUDg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4603.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmhET25XdzMrTGp4QlFSbWFyc3U3clJJTmpqTWlIR1RYdWFFeXU2MXhrSUcr?=
 =?utf-8?B?KzM5VEVoc1VtVlBWQUJIL3FMa0gyMExQNkQ2M3lnbjRFVjVUcjBIdkpXY0hW?=
 =?utf-8?B?Tzh5enRjU2h4cHJlWWluR2ZWU0toVlJnRzBKdHY2c2U5S2Q5Y0JzZnpnZStT?=
 =?utf-8?B?ZlRjUmZSS0RYL29mOEhzUWtIdCsrdlc1azBrb2pDT0xhU1BZMzBKa2xDNDN4?=
 =?utf-8?B?MW9rYmpzVnRqeUpVNnBGb3JjNzlnWXpNTnkrTEt6Nm9kVzdYdHRwNlY3eTVq?=
 =?utf-8?B?MkVQdEExYUgvRE1XUUorM083dGUvVGRuY2lnV3h0Y01BdlJyK2UzRnd2VVVE?=
 =?utf-8?B?NTc1MXpnS0I4eWdHb3laMU5jL1VzNHMxNnZTUUdIenVVWlVvc25qMk40cU9I?=
 =?utf-8?B?Mmg5UlhLN0Y1b201dDBLNkI5VWlsZVBhZEhMT1JLbFpvSWcrWmtMWUhxd01C?=
 =?utf-8?B?OGdrczFTMTZ0cy94c2FqakNJT2djV3lkNzNGTnF2MFR5TnJoZTFSR1BSWXpI?=
 =?utf-8?B?NlRLQjhtbjBsYVZIMkRaYVJpTnFCcVViZFl2T3hSUThrVk81elNsY3JITDls?=
 =?utf-8?B?QnRuTE1qUDdPNGlyZENtMGxXbDdNK095TGQydWYrSG9DQi82Z2ttSmJvOGhy?=
 =?utf-8?B?MG1QR1lxcEdlS0pxZFcvNlpuc2oybm5XUTRJWm5USEJzMEx4Uk4weThSc20y?=
 =?utf-8?B?OEtsY1NOVnpGbFVlZlNsbXRyU0VEQVlKekdjRXplQmR1QWZCaCtqVzl5aHpE?=
 =?utf-8?B?UDYvSVh3YW15TExUaEhaN0NKckM2Z0QxU3VkWGlnSjZsM0pZVEFEaGUwUWhQ?=
 =?utf-8?B?ZDRCMzR6YnZ1dXgzQ3lBcnNVeU9xVStoR0ZCNW85RXpXOVJ1ekIzTVpQVmN1?=
 =?utf-8?B?WUFJcHk2c1paQlBoN1k0d1UyZmROMkxwcHo5R0s2ZDIxTjBBeUw0VENWZnV3?=
 =?utf-8?B?RnRRdjgyMnFRSS85L2FIVEUxRHIwTFhmeWsyTFhBd1FwSGQrTnYzUEk1WldN?=
 =?utf-8?B?eEtPQktwMHlCZnJaQy9FT2lJeHVaOWRvNklLMUZhZHViUzRsWU5IbCt3Vkh2?=
 =?utf-8?B?VDhnaTdrVWNxMjBCMEM5RWpJdmhlRWcyLzNpUXFsU2dYVXFtZ1V2aDJsaklO?=
 =?utf-8?B?N040c29jYzJCVDMzYmgrbk1MZjBMU1FaYmF4Mzg0VUEwNU13QmNDTXEvRUhl?=
 =?utf-8?B?QVdhZDczOFRxdDJ1UWhWbWt5T2xjRFRjUnhjWU5ZVE9tNE16ZGdJMzYvajgy?=
 =?utf-8?B?TnhZWFZ3UkFEYldQSEZyU2lxclNMbTgra3JvUzBJaEdob1IxNy9nSGtqcHQ4?=
 =?utf-8?B?c0h4SUJtMnJGeVZra0VXdmt3REFUNjJOcEVZR3pZK3NET3lUSnlPdjBLNmJW?=
 =?utf-8?B?dk5FQW1NSzFrNEExc2lUMm5CZnB4aUVSQVB5TzB3Zi9VTFVxdC9lWFFoT01C?=
 =?utf-8?B?NzdHNklFeXhoYlVaTlpQclBVZTB5anBTMWduUDFYdVcwdE9MTTQzRUZvYUFk?=
 =?utf-8?B?K3gxeEF2NmczN2xFdmpuZzFYZ3JWU2lJL3dieUhnc0pzU2x4dDVOK3JIMEow?=
 =?utf-8?B?NGlUekFRV2l1OGJqSiszaWt4VjZCYTR2ZmZxd0ZRTTB2c083cWcyVGtCZ1RZ?=
 =?utf-8?B?bVNSdmdVQkIzeTA0MGxWei9OcWhSQ1NHQmVadjlpMkxra0w3emZvNUtWTHBG?=
 =?utf-8?B?OVk3M29ucWQvS3pFeGNORkQ5K2dLSmRkSUJVZjFjckVvZWFWdlFLN3lGbEJU?=
 =?utf-8?B?cXU4K0pZVzFHNVNPSEcxa3c4elFjdkd2K3R1NDhISFI4US9YUUEyVGplekJS?=
 =?utf-8?B?NHBjV3RVWVRtWktzdjRKWCtWMFlmL0hYRXE0a1Q4TTZNK0grbDFnOWwzL09T?=
 =?utf-8?B?clk3QldOaVhQZzhQNEtsYzI0ak4wWmkxbS9MTEc3NlBFcmNMb2M4Nk96eWJq?=
 =?utf-8?B?czc0Mncvbkh5MUJRUDFacWRJMUh1WnIxMkU0cGZpNy9xdEoyTkh5VndxVzFl?=
 =?utf-8?B?Y2tTaDFzT2lVaVdPazlNY2xGam0vZVY0aDR4VWhvY3YyYTNtdE1aZUJ4ZktM?=
 =?utf-8?B?UFZKczA0dS9VZm83VlFHRkpPd3prVTVyU3B0MExpeGsxeHlzTTNTdFRpUTh6?=
 =?utf-8?B?WGNXS2hwSDJabXNZaGRCRkt4YnVKeDdOVTZURHI3Y0FaMG00ckdpT0trZTlC?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e56bd2-6557-4bf9-46bf-08de31ea73b5
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4603.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:33:36.7977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+7BIFrcwqY4am0ec2nUTz0p3b8vs14gSMiMHHxuHJ1FSZxC7TKdK0cgASl0UaWvmBclmIkgpIFcxA00P9RtUJbULz58k0N/Fpz8oHdAu5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6806



On 02.12.25 21:32, Oleksandr Tyshchenko wrote:
> Creating a guest with a high vCPU count (e.g., >32) fails because
> the guest's device tree buffer (DOMU_DTB_SIZE) overflows during creation.
> The FDT nodes for each vCPU quickly exhaust the 4KiB buffer,
> causing a guest creation failure.
> 
> Increase the buffer size to 16KiB to support guests up to
> the MAX_VIRT_CPUS limit (128).
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Noticed when testing the boundary conditions for dom0less guest
> creation on Arm64.
> 
> Domain configuration:
> fdt mknod /chosen domU0
> fdt set /chosen/domU0 compatible "xen,domain"
> fdt set /chosen/domU0 \#address-cells <0x2>
> fdt set /chosen/domU0 \#size-cells <0x2>
> fdt set /chosen/domU0 memory <0x0 0x10000 >
> fdt set /chosen/domU0 cpus <33>
> fdt set /chosen/domU0 vpl011
> fdt mknod /chosen/domU0 module@40400000
> fdt set /chosen/domU0/module@40400000 compatible  "multiboot,kernel" "multiboot,module"
> fdt set /chosen/domU0/module@40400000 reg <0x0 0x40400000 0x0 0x16000 >
> fdt set /chosen/domU0/module@40400000 bootargs "console=ttyAMA0"
> 
> Failure log:
> (XEN) Xen dom0less mode detected
> (XEN) *** LOADING DOMU cpus=33 memory=0x10000KB ***
> (XEN) Loading d1 kernel from boot module @ 0000000040400000
> (XEN) Allocating mappings totalling 64MB for d1:
> (XEN) d1 BANK[0] 0x00000040000000-0x00000044000000 (64MB)
> (XEN) Device tree generation failed (-22).
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Could not set up domain domU0 (rc = -22)
> (XEN) ****************************************
> ---
> ---
>   xen/common/device-tree/dom0less-build.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 3f5b987ed8..d7d0a47b97 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -461,10 +461,12 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>   
>   /*
>    * The max size for DT is 2MB. However, the generated DT is small (not including
> - * domU passthrough DT nodes whose size we account separately), 4KB are enough
> - * for now, but we might have to increase it in the future.
> + * domU passthrough DT nodes whose size we account separately). The size is
> + * primarily driven by the number of vCPU nodes. The previous 4KiB buffer was
> + * insufficient for guests with high vCPU counts, so it has been increased
> + * to support up to the MAX_VIRT_CPUS limit (128).
>    */
> -#define DOMU_DTB_SIZE 4096
> +#define DOMU_DTB_SIZE (4096 * 4)

May be It wants Kconfig?
Or some formula which accounts MAX_VIRT_CPUS?

>   static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>   {
>       int addrcells, sizecells;

-- 
Best regards,
-grygorii


