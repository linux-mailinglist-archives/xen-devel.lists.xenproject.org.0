Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4633CC9019D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 21:16:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174369.1499315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOiPH-0002oS-JB; Thu, 27 Nov 2025 20:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174369.1499315; Thu, 27 Nov 2025 20:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOiPH-0002mF-GX; Thu, 27 Nov 2025 20:15:59 +0000
Received: by outflank-mailman (input) for mailman id 1174369;
 Thu, 27 Nov 2025 20:15:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSjm=6D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOiPG-0002m9-Ba
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 20:15:58 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0e493f9-cbcd-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 21:15:55 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB6199.namprd03.prod.outlook.com (2603:10b6:208:315::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 20:15:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 20:15:51 +0000
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
X-Inumbo-ID: e0e493f9-cbcd-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItJZUW/zrhJzxKhyATOy+Rk52awa6fArRSyhD/QHwjfzpeB5JbN6s7r5o3STRi1kSZqA6PI7pdO722jCwHOZKaXH13OVVjRBS9XHS3aCfGCT7BN9JnuKvIE0Ntx0Tm82VnBgHAeCzhemah2m2vLesGS0XcsI+DFO7qfVRltGP6wOJ6BenBR+EVyrMaAl42qzFv9NqigQ1as4ONHyNgecVqLlFfBVGBY77XqL3M39b28YfLaBPuId8vBwAKHprQM87RFoBM1+Y6qZJX6VwrS8i9IVIFUCHVB67YUkeAfuJH1cB3rGNxSFUD1zlm8B1gQaDA1MhoRKXe6tsw4oI+ebVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1/Cch735HsmSXp1A6klo1Ajd+EVV4F3T+aLHoCWSJg=;
 b=ZTTUhrcY3KSNN+leGYinRWhVVkzFf08YFCkU2Fl832TSFz0aHBdW0h6lGsf41D01nmri9EapRAIMJqTNAmy+0QhuD9vBnuTXqI6J2SoD58nvfksl5o3B5USedLqIbcXs3G90Q1e1W+zjVxkNjl36cypckZnm90JS2KC0E34bTKcbHy6YhZuT6jkXkvH1BdZyoylnrr3IjGjGo6t5LkcdGbR6Vvqskm/u6WHH+hn1Ncx/wT8sxJWSJWBqxkULMuOMKyrrpYFOOMfnY5/3wwj5nQ8CdprHQE8JQVeePzHe9SvqkZ7RMnkT40CRRlfnxXosfT+eHjCWekOCrKxfLiDdew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1/Cch735HsmSXp1A6klo1Ajd+EVV4F3T+aLHoCWSJg=;
 b=A/symWkzpjy15zJqW197FMOgSzpqCNSBXMENMrxkqdaPEHfaKIScyJshHN4wabLm95zcpG+YuZtm5p1PxvwnLRUiF55JXvORqHN+SRsSmdJHX/zudbM7SjHwwoJJ2tKqmeJzigc0Bwjnu0GnJF4RFLeT7L4vCt+nX2/T4oHxY2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dc68b9ce-38aa-4949-b3e7-a7c0a7ee9a25@citrix.com>
Date: Thu, 27 Nov 2025 20:15:46 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 02/11] x86: Reject CPU policies with vendors other
 than the host's
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-3-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251126164419.174487-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0513.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: a8d2a439-bf4b-498a-9ebc-08de2df1c289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGw2aEEycDJGZHc2RmJoSW9mS2hHY2tBZGp0eCttQ1RTOWRGSGxJaW1GaFZO?=
 =?utf-8?B?ZWtxbXRFbW9SR005Snl2MTR5SGRqMnhWb05jOFMyUyt4ZmxMYS8wUzllMXpw?=
 =?utf-8?B?RGZ4aUxQTUNGWjhjcmc2YmlpMjlNWStGbklRbkwyWnY3OHc2dW9qaXN2RC9W?=
 =?utf-8?B?a0lFOHN3dzMwTnpCN1lOTlpERGVmN2ZPQWlzNFlWZGNNTnM4bitYcVpxbjRl?=
 =?utf-8?B?NVNQR2ZNTzFFZHkwVUVtNlBWNE9uTXRyeHc5eHJOdENTb0p0dXdVZUZ6UjFr?=
 =?utf-8?B?Ui81amoxWnUvRTA4RDFENElhWnpyQXVtYlY5Wjg2YXd1dndhMGNqWDRFdGZo?=
 =?utf-8?B?TzdaWXg2ODVubDNEMnVIWWJWUFFvRVFoUWRTQlJJOVdXK3JmMnZRbWRoZVMz?=
 =?utf-8?B?MDBidTQzMy9kYXlIekkyLzRqRmlsT3ZhTWNiRnJsNGlZTWxRRGFvWEFqQUJL?=
 =?utf-8?B?NjNZMWJmeGl2NzBYODJ2Q05VSDdENjFROFRlc0tvSkYvZXptR1ByYTY5Vnpi?=
 =?utf-8?B?bzhwOFlqUEMxM05LalFOT1NRNjhlcE1wL2N3OThSMzltUnNpKzc3RVlpRzE2?=
 =?utf-8?B?TEdXc2JUdkFGZE9uNDQ5RTZlOUpZUFlDaVdyRnREZkVsWUh5b2tiV1dMSUhu?=
 =?utf-8?B?V25pRFpjMURTVTAwR0pjWjA2YS8xdk1CNllzQk56MjVObzFwQkhOZjk2cXZ5?=
 =?utf-8?B?aTVrWXhDVDk5eWhBYWF6TUkzVjllUDZwOXlHS2tGU3dOWlVFOFkybnRvNmds?=
 =?utf-8?B?WS9rTGZJaEZQZDJuSjhIUHVZdDdsRWlTOWxJbzBKejg3blBlcUViZVBRTkQ5?=
 =?utf-8?B?WUFuZXFBajI3V3l2SS9vSkNhdUtZWU1yOERKdkk4ektjUjBuamZtTFNheGZG?=
 =?utf-8?B?bzZySjNzenByek0zSjY4dVJ0RXUxU1hNRVRTN0RkR1RZUlNUcytpbDExbi9J?=
 =?utf-8?B?R1ZSS2lSRWhua0tBNm0zWEZQVGZ0dTdKSmhlbjkwakwvN1VNaFo0Q0Q5dzRv?=
 =?utf-8?B?dmh5UDZPN29NVnFSSmNBM2JsM0pmUzB6a2l1YWY2MlpJMElLWkxpUENMWFlW?=
 =?utf-8?B?b1ZDalJQQTVoTGUxejhZOHJ6YVpFUmxuOHZFNld4aXdubUowbEFXRHlqcitV?=
 =?utf-8?B?YlNwaDREd0Uwak12bTNLdWhHdFliSXdOZjQ0WDRiaUZMZll0UjRvK2h6eVdp?=
 =?utf-8?B?WlZTaHdCRHhYYmVFM1hZRk9XWWFaeVdqWEhSZWJ0SzJkcjlSREtuUEFtT3ZC?=
 =?utf-8?B?QW0zbGZLazRSUkp6WkVPM0NRYTBDd3YwcVlMMVlBYndHaTd6OG5wUjgwamQ5?=
 =?utf-8?B?REU2SlJTR2JJdGRwNUxBc09DcU96cVNjS25aYTZXSTk4cnZ2WWZadHRZbUtk?=
 =?utf-8?B?NDNFYUhJc3JmNjVUVHdnNnFEeEM0SldBWkVUWXJyRGMwaDhCSXdTaUdJUXdW?=
 =?utf-8?B?YTZwWVoxdFc1blZuMTdJZ2NhYml2OVpzelZGa3NOdmtJSXBQMXg2Vi80WjZ5?=
 =?utf-8?B?MWxsV2wvT3RiU2ttNVVKTUlnZ2pEa0dxTzlxSnYxY3RTdW9PUm95VW92NmlP?=
 =?utf-8?B?TzFuSEJNSzBvSENrdFJWaGNNcGUvbXBPc0g5ZzZ3WE1FUU1jUGc1R2ZSYVFp?=
 =?utf-8?B?R0l0eFFieVpmS09XWnRHbVQ3ZDYwQnpWNVNYMVRpVzBJSUxlZFdXWHNwdm1H?=
 =?utf-8?B?amZXMnpQSHNKU29id0l4VlVycTdBTk5tbjBBcFZjMzBSeWNZcEtQSjlDWnlZ?=
 =?utf-8?B?QS9jSFNhTUpyQjAwc01Ic0ZhS0Ywd2JvU2ZGWTZoZk5oNjZTb1l6Zlk3THJZ?=
 =?utf-8?B?MGZOOHRJVUR2UVhIeWhGTXJDS3RHUTdSVWNtU3FYZysvSVBzdk5RczlKRURl?=
 =?utf-8?B?aVVabTFuL3pGOEZWczBWUWxLNTZNSFdtMWFwS1ZFb1Z6SVBTUHlMeFQwNVF1?=
 =?utf-8?Q?FetcONpCqp0sEroEfY7ljdNYEuWPA2MJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjJoa0FGcnhseHlmNXJWWnRZT0pCNFAvREg3QVRJU0pkVnBCSjQ5Ymo2a0Y2?=
 =?utf-8?B?NG9GQWx0OTdYUUxHQU5zQ01EVmUwK0xjSThYbEh1U0lWc3UzWk04OElVcmZL?=
 =?utf-8?B?WlR0QTBqbTRKY3FqZzN6UFhoY0ZzdTdHeHU4b3g3c0V5V0lyZUYza0tjV3dW?=
 =?utf-8?B?dEZIOXpRUGw4aEhHRzRLeVhvbUpHK05SSGs4c21pc0xCeGtOYklPeVltMzEx?=
 =?utf-8?B?NzlQN0xhRXZqdFZCQjVua2dpY1VxRlUzc3VZbFhMWUoyVE1zQWoyVktNZ3Q1?=
 =?utf-8?B?OEJqa1dPWGJmeDZ4OXVDTEZDdXhzZFRDZXhTV211YzVnUllGeGQrRFdMSFZ5?=
 =?utf-8?B?ME1BU0xpVFI0ZmVRZnVZTmhCOVlPMTc1SW5zZk0vZDNuNWRwUm5CNmF5RXFR?=
 =?utf-8?B?YUhyRHhxVTY2azdsN1RkRlRXMUxpVDI3WkJ4ZVRoRkhSSER3UlpLS2o4L3Y2?=
 =?utf-8?B?TVJPampjUXA2VVRvWCtaVUlSTVYxL1hmSkF0MFNvY2pKcWlWMHhVVjBDRTA4?=
 =?utf-8?B?RFo3N0kwL1dOQnZHUzgyckNIRkRhTlM1bzNoSnNLZ01ydlR0R0x0RlZpYm5W?=
 =?utf-8?B?aU5FT3FQWmFMUmZMZlE3KzRKWVN6S29wK1Ftc2RZL051bFBmcFdCK29CcDJ2?=
 =?utf-8?B?ckhhVUxYd1R4QStaSTNWMVUwU0lkbUJDaUNoSXBvZHpvN3daTWVDT1VnM3lV?=
 =?utf-8?B?MFBUMWc1VGdta3Yxb245UUYwbEZ6U0I2R2doZDZrQVdvclU0WlhnUmNHbEFI?=
 =?utf-8?B?UGNyZE5nM3hNUkNtVWJoRkxvR3UzYk1Gc3lWcFNtdDc2dHpFK2tnOS9jNUo3?=
 =?utf-8?B?YXR3ZEF2cElMUkpuVGtqZFljZUNGS2ppc3B0RkVBOXl2MUI2azd1QWpUQVpO?=
 =?utf-8?B?RTNjMENuR2hGSGUwSG9CZ1NkdVN2cTRmYXZhTjB1dFM2WW5jMW5PRGJYTkNX?=
 =?utf-8?B?M3UrMWVZNVlRWTh1dXpJOE9OeTZaSHloeU9iTENnWVliNDJCcTJ3N09LNURB?=
 =?utf-8?B?NXprYmZ2OUU4cHB0cG9iclNsNGhQT1czUE5xRmRGUElnOXRNVVNoUlJaQVRl?=
 =?utf-8?B?NEExcmVXWUpabjZGNlQ3VmJmTURmL1hWOVJpY0w3OE52SldOaWtEY2hrYUxT?=
 =?utf-8?B?YVdPb0V3WFE0Qjc3c2JsSlVIK1JlQTlxWi8wb09ORmpkRXRVNHVweGY2azZH?=
 =?utf-8?B?OGhYRmhLQURFQ2VsdmFsZUZaK2pBR09leEhveS9rTGlBcDdyenZtaU1xazZK?=
 =?utf-8?B?azZzRVBZNW9vS0hmMDEzZXN5bWo2UTQ3WjFHNkJBMWpWVEZGUzBzT0FLNzF0?=
 =?utf-8?B?MmFBUTBFWHBZUmNwditPNm54S04zVG9NNU9Eb3dvRks2a3FMcG5QYWIrak9C?=
 =?utf-8?B?UmoxWkhYVS8xaEpuTWd1K2NYZWpFaVpwK0pyR2NnalFLMkNNUG5RSytwM1FO?=
 =?utf-8?B?dUYvdm1KS05oN3ZJWFd3WjJrY1NEZmtEUEVNWCs1WEJqVmJacWZpcFhkUFlO?=
 =?utf-8?B?a1RaYjdzM0haY0pqZitobmoxNTNreHV5QnFPRVViM1U5NXFaMUdoK1BITjQw?=
 =?utf-8?B?T1RCSExBeGZHT0ExYXkxRUNyb2wzVHVzalhOR1l6U29ncTUvWVdHMjJvUVBQ?=
 =?utf-8?B?T0ZGRmhhcWtWWmpmRzNJNUlxMndRR2xVM3V1WlR4aHFkUHVMSG9pb1RDS0dR?=
 =?utf-8?B?aC9QSkpETjJuYlJDWG9yM2lOUjVzLzAvb3NCT0RiYmdXNytEdWo0eEhOQUxs?=
 =?utf-8?B?WXpoZEdFSk5JT2JmNGRNY25qMTQ3SitzMkF6ODMyWTZ0TDE5c2FYSHJybDhm?=
 =?utf-8?B?VnJidWxEdisyMnNyZk5obldSU1NUVlp4cFJKSEs3MWMwa2QxUXhyRlkwV2dZ?=
 =?utf-8?B?cVpsME10eUlSMlhlK0F6QXhqbGFOYVZJVUhoaXN0WnFrYWkzNm5VcUZuV3F4?=
 =?utf-8?B?ZVNYL09jaXQxSkZpMC9uZUV4V2RRMXBRZDVZaGpLeFArMU1xYzYrNUtWZzNO?=
 =?utf-8?B?QWgxbkI2aWgxVjVnZVF0L1B1RU03K2U4VENYVklHWGJ2ZkxHMEgyc2JlZ1hy?=
 =?utf-8?B?T1hZSTNqTzhVUkZsRWRJb0ZnYkpQU3ZucW0xSWVYb05rb0tKaHNhNEJ2d0w4?=
 =?utf-8?B?ekJDNnJ4OWVNQi9oZ2t0bXY2SGtycjljb3l3TkV6bGR3RituUXZKRVE1cVk2?=
 =?utf-8?B?Zmc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d2a439-bf4b-498a-9ebc-08de2df1c289
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 20:15:50.8918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OibgHdgkBbepROlrcIQS65To+7+7Jo+SFkAPIykd12TW9M25+tsn13egxAijBbmqJ9YUR6JHWTZRuuxF6ydQiVuJFGflB2oh2wIZn+sSAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6199

On 26/11/2025 4:44 pm, Alejandro Vallejo wrote:
> While in principle it's possible to have a vendor virtualising another,
> this is fairly tricky in practice. Not doing so enables certain
> optimisations with regards to vendor checks in later patches.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> I originally had a Kconfig option to allow cross-vendor virt and
> conditionally disable the check on policy compatibility. In practice,
> I suspect there's 0% of people that would want that, so I decided to
> simply remove it altogether. Happy to put it back if there's anyone
> interested.

We've debated dropping cross-vendor support several times.

Prior to speculation, it was actually the case that PV guests worked
fairly well (Xen abstracts away the details surprisingly well), and HVM
functioned to a first approximation (emulating the SYS* instructions is
horrible).

After speculation, there's no hope in hell of getting a viable VM in a
cross-vendor environment, so we should drop it.

In addition to this hunk, you'll want to drop is_cross_vendor(),
should_emulate logic in hvm_ud_intercept(), and the cross-vendor aspect
of determining #UD interception in {svm,vmx}_cpuid_policy_changed().

Also, I think you can clean up MSR_IA32_PLATFORM_ID / MSR_AMD_PATCHLEVEL
in guest_rdmsr() which have some pretty well hidden is-cross-vendor checks.

Also you'll want a note in CHANGELOG.md.

I'd also suggest splitting it out of this series.  It's quite different
to the rest of the series.

~Andrew

