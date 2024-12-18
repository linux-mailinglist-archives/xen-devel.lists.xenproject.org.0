Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC2B9F6A90
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 16:56:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860618.1272627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNwPH-0007ZR-OF; Wed, 18 Dec 2024 15:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860618.1272627; Wed, 18 Dec 2024 15:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNwPH-0007XM-LZ; Wed, 18 Dec 2024 15:56:15 +0000
Received: by outflank-mailman (input) for mailman id 860618;
 Wed, 18 Dec 2024 15:56:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M/38=TL=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tNwPH-0007XG-48
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 15:56:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2614::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99e508b5-bd58-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 16:56:11 +0100 (CET)
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com (2603:10a6:10:312::7)
 by GVXPR04MB10271.eurprd04.prod.outlook.com (2603:10a6:150:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 15:56:08 +0000
Received: from DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f]) by DU0PR04MB9561.eurprd04.prod.outlook.com
 ([fe80::9808:be1a:b32:173f%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 15:56:08 +0000
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
X-Inumbo-ID: 99e508b5-bd58-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7esPi9PMGUtfiQVDYZ8N8MQdRMZsRYTzCBNTO6BrwTf9evVMRf6Z4JnxC51jGCVDDNIGaH2iEQThWhq2/OCDsrgsIiz74XVagTh7tFkjqx8rnLiG8Zj7lXumYRpfBz+OKNkHh8DazSJNuVUXwZE0+2FZzCQOE44FzyjMUFYE+Bx52y8tc5R4J9qrKSXrfZHH/DA2FPKW7CRRiKhFmsvL38lvclP2EQqVw+iX7gG8BKywPlakSkyPuhyMBnBnChZETlJfxE6kabJMCw9aYSMutSavSQsJY9qKHqpe6ZMKrHEhzKFmWz+qFpGdBN0ttH6AYCn83VteKZH/pCEeGqkwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JyZOShfVQAJqhnlrx0QGPcJpdSXxYIrA6vIR1iKnVs=;
 b=taAzQ54OAQL60ywrF8T/bKIPaNMFklh6oWwEGtWmYGg58cJ6zXwcYQH1Tv86jTAyMpUPFpO9CD+ReIFPQZVr1+qZys8mhh1SGWTzEWG8U99W9JLP1ovsvASLAmwH7hRsd8JNlQCdCJ96N1HtxifkHw1VuYcP0rURgHQ87lzrz1SU6vHydRVJS5IarP0v3/iftX1mVxd06K3WUK/JuMlwrWUKjPtOuYPhD2ddvCeQ5YNxfl4fpxIxsrC0brToZfY/4XK95VpWqrlC2sVP4sJ+YzfOirqeXxNlhNgJMkbKlZerVbRRgaiCmfjOzECXGv7S3whgpYY1EdmQnYn4Qqkb3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JyZOShfVQAJqhnlrx0QGPcJpdSXxYIrA6vIR1iKnVs=;
 b=nRTBuYHORjMQi1WaBjSFDUuDA4aswVVaU3y4d70o8FX1po0VzcIA10jsH395ISxwszKQwUHXCs/l9clRCf5BxKAdXG96AZZU4NJV44E9RU5os2qLsVDpAZD3mRByJDc4kdAX39YXoNXxHIsqc6GCggohuo2gzZ5BYgdFXMY3zDO5vAibXK+EFL1lbXZnEbuGBsNNm/dYJ+XGbFoz+MKRwCjuME3lW/jz/WkF/TSmBcGifrGl+Wq77SWSLCIfg/Er0xIMLiU4BUDsvVN5a6lL1kor5YZQZw3rIMsD4A3SCiphfQRTvTVkxAUYqAMlWGJ0cQpsuz+Zv9W0miN1OrFLJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <17240d6a-42bf-45fb-bb8b-2ad5aa1e855f@oss.nxp.com>
Date: Wed, 18 Dec 2024 17:56:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] xen/arm: platforms: Add NXP S32G3 Processors
 config
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "S32@nxp.com" <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-4-andrei.cherechesu@oss.nxp.com>
 <8f1c342f-61d3-48f5-8311-a1162a20cb24@citrix.com>
 <3FDFACF4-C998-496C-806F-530CA3C87622@arm.com>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <3FDFACF4-C998-496C-806F-530CA3C87622@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::20) To DU0PR04MB9561.eurprd04.prod.outlook.com
 (2603:10a6:10:312::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9561:EE_|GVXPR04MB10271:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ea7016-de1b-4c56-836c-08dd1f7c7c57
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVdnQ2FXa3AyUU9Wai9zQytCTWtEVE1BM3Vaekd0VkZ4Q2sxZUNvNzRYR2w2?=
 =?utf-8?B?Z3B3eEZoajhJdmhZYmg4VkZ0YTI1TWVSQlhTYlFEenVwdFZTS3d6MHRXVTJS?=
 =?utf-8?B?cnoxV0JIMUZCTVhDOVdNbTVWeFo1Z2Z1U3JRdFBHK0d4cGUvdHRvTmVwckly?=
 =?utf-8?B?UFNrdXdyK1d0NTBid1hSRmFTUXpWdUR2NTc4ZXNCUW9tZE5nSkpzVzRGdE81?=
 =?utf-8?B?TEF3RDlseEJOZmZCRGovd3BJcmJwcjNEM21nWWhJYmVQbHQrc28wZXBmTWty?=
 =?utf-8?B?UXNLU3NENDdZMFRvNmhwYnFyZW5uQTI0enNZOTRxdm5GWU8xOGlzdWoxcXRU?=
 =?utf-8?B?RjNrdHZFeHZnQjJ5c0V6WmJHTmpTT0ppbWhJQWdoamprNUUvSENhck85VEUw?=
 =?utf-8?B?aERJQnBjWW1wbnFCU0x2Q0JDTlJSVktUWHVZejZIM1U4aXVtVUsyWFNDaDA4?=
 =?utf-8?B?eFJKYkRFUi9Qa0pIRUpLV2srdU12WjdwQXlEM3pLTDJHb1M2QXEra2M1ek9q?=
 =?utf-8?B?S0x2REsweWx0dWVlVEZTTnIzZXN0SVZIcE5CbHg2YU5nMXkyWGY3L0I5ZlJV?=
 =?utf-8?B?S05JWlZxNllwVktLa2Z4UTloYjV2Q0xYYnFaaG9PZzZnY3dIVkJTMEtPVjd3?=
 =?utf-8?B?eUdBSjNmczZxZHdka1h2WFgyUEFJYjFucFp1WjluZjYxUSswVitUcG9ZNEwx?=
 =?utf-8?B?bkdVZlUzREVneUZJa2pVcHgvRFdqT3hYZzRBb2VVVC9jdVVteHp6RGVaZk5W?=
 =?utf-8?B?eS9Hb2x1YmFrOFBHeTBnODhYbXo5ZnlkZDBoaExCZDVNSWJFeXhYNXZPdzNR?=
 =?utf-8?B?QWhCMHk2bVIycDYzQVI1TXFROWdRL0lEQUNzZVFOTEFoUHRqcUs3MnZET0Fo?=
 =?utf-8?B?SlJielJIdXB5NzFmeDQvMnFDWGxUQXY1YkZITDExSWxhVjhGSmhIeG9sZmlR?=
 =?utf-8?B?eWlGTE9palcyR2F4WDRCNXRrMnE2SVF2ZFRaUjZFVXNUVWx1aEgzNHNYaEJ0?=
 =?utf-8?B?RnpkNS91VHhtVldHcDVETWZ3amJBVjFzSzBmV3RYZmRvbEVsL0pkdk95REdU?=
 =?utf-8?B?YXFtaGphOHFRSFVWYnQwNWFEQ2dVRDA1S0oxQ2x0dkhhVmlwLzFTdXdZelNQ?=
 =?utf-8?B?S2JEQzlzaVlaVVBadStqdjVoaFhyTjQxL1QyMk1WcXcxd0tDQitWOGh2Z25i?=
 =?utf-8?B?Tjd0MC96MnVQTkl5aE1xVjUzQkhDRUtObW9LbkF4T0tCSmhZUU1MY0IreFJ6?=
 =?utf-8?B?dVhpOXEzNXhIQkF1dlR4UDFCY1Erb2IxZGFHUitZL2N5NTE5SVk1VHZOSndH?=
 =?utf-8?B?VXZpSVFVM3Z0Tm11eU9xMUdpRGM2b1pkaTQwa2Zja3RxT2YvcitRV0V3b0My?=
 =?utf-8?B?SDQzZnJmWDU2MFR3YTVXRWZ4anF2eHBkR3htV2J1TUJGMk9HRzJlU0ZGVmtX?=
 =?utf-8?B?cXk0cDhXMG9yWDZUOU0vZnpzc08rSTJDcWJCTnpSaUNQWCtqc1djSXRaZjVt?=
 =?utf-8?B?VkJCM2JhT0YrUTlJOHdsK2lIRWhsR280RjJzZFlpcTNwSmU0U3I4ZUJsZ1Y3?=
 =?utf-8?B?blliY205a2JuVVB5VlRqalZ6aWp6ZUw4aU9XYkJWTnQ2cnFBelJDMWFDWHF2?=
 =?utf-8?B?VDY3d2c5NUhuRU0zZ3hHRm1VOTl4em0zUm9lNkhBVGhhTjh2U1cyNDNFVWlT?=
 =?utf-8?B?QldxanlvMi96WEx4cFZrS2ZQSDNsWHE5dDRJSWV6UitWNGRQSDRmV1g0Y1Zl?=
 =?utf-8?B?ejNIKzByZEVualNEbVFGbnZHWEpVTDdTNUZyc2IwZG5PUk4rVkd6SllQS0NP?=
 =?utf-8?B?c2xrT0wvQStLa0pnR3ZqdlZGWnhDb1R3cy80UFJtU2ZMT3o1Smt3VWdHR0Fa?=
 =?utf-8?Q?nsw3r2ny/nf9l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9561.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW9zMEVOUUh5ZUk5MlpuKzJxTUJWVnNRa3o4ZzRYcklSWjVrd3RLMnVDZUtU?=
 =?utf-8?B?S3hTK2oySkVkS0NTV2h0OVBuSXVYQU9YRkcxdXVLeHhyWGNRVmRJZFpBWW8r?=
 =?utf-8?B?M0IwajAyeE8vUUQ0NEJMWG0yTS9tTkN2azAzZXUvMkpWVE10cDQ2RFg4TldT?=
 =?utf-8?B?bTluSG1KU1pSSTRGTTNvRndwWlhkWTUrODJpSlpmaUZkMmtES05GMER0K25X?=
 =?utf-8?B?SkU3SFpMS2k2Mlg4S0RrbGgrcGx1ZjFBYm5yaEU2TVNaMnFtWllSMy83QnUz?=
 =?utf-8?B?YUJNWFFRUmhYWDBBa243b05TR0hrZ3JzWVFUT01qK1M5TmxidUFRb1dOaXh3?=
 =?utf-8?B?S1hFNVNNeVR3UGMzMXA0Yjc2OFQ2NXFSSVRvdi85QXNzUlZWelNEQkJxUWRp?=
 =?utf-8?B?STNVM1lYY0plSWRhZ1RYeTRRUXg4WElYdnNaelNrK21XZjhNWnU5MkcvVTll?=
 =?utf-8?B?bzluNXhNclQ5SmkyWGRxQ3hkd2VPSXdtZ3p1TjFnaHJJREZabm1tTmNUTWY2?=
 =?utf-8?B?S0l1MlRVSVhITEhoTzNvcjVoeCtyNmFNV202cktSSVBkOTdNT1JQa3FOZU5n?=
 =?utf-8?B?a1BMck5kay9lRGczZ1V1MDlhUFNiOHBUR3lTb0NYdVRxcHl5U05oWFF0S1hq?=
 =?utf-8?B?OFlGMmdzbzBybUtLSnZwclZvN1N5YmI4OCtnOXFVNmtsVUFWK1dlbUttQ2Mw?=
 =?utf-8?B?SVpDRVpLQThHR2RTUW1NNXdtRjhuVkdpVmo0NHV5RHZiOVI5Q1pmVVlMejJp?=
 =?utf-8?B?b3VndHA2NVJrYmlUMjh6dzJ2bk14N0xDMk90aS9XNHpDSDVuNU0zUHVLWGxy?=
 =?utf-8?B?dmtMSFJTY1FDUTd2Q3o2VUlvS0wzOWxVTUhOOUhBVXdKV0dMbjFZNjBaOXVN?=
 =?utf-8?B?Q2Fqdit0dGZMYnVFUnpLZFYyN2lvditzbGFiaHRvTDBlTWNkSnN2aGF6OVBQ?=
 =?utf-8?B?L250M280Z1VrK3U4anVzNTRxOFVtaXJCWGxxa1BvT2xkNm1TeGhWRXNBcG5M?=
 =?utf-8?B?Wm1LaUU2cUxGL1g3SktwWGFubndzZDRJMmtndnlwWWh3Slh2RVlKODExU2xz?=
 =?utf-8?B?cmt0emZaamI0VUdCMms3eEdvcWJ0eDFGMXRPYWgxK09QV2FqVFNpM1V1UGlL?=
 =?utf-8?B?V3gzd0lwVnMvbFNBMG03amV4ekExRGl3ZDVQbUE4UGtPR25WVWdzeCtWaHpQ?=
 =?utf-8?B?SWd5bEpXcEttdUFENU5ZVUtzUW9ZMU9GbFgvQzBTSlMrZXJocUJjS3ljWGhr?=
 =?utf-8?B?c0RzZEw1YTBEOEJiT1krWFE1RjhWc3FJUDdSWU4xTmN4TEg0a2tqbnJPWVRZ?=
 =?utf-8?B?LzNhYVpoMW9PQURKdUFFZGZveVY0Q3NOV0dkaURBeDdGWDZLZG9BMUMyWjYv?=
 =?utf-8?B?YVFGZXd4cmNLKzJjTVdLR284OVU4WTJaTCtucllwVG5NNlhJNUY1SVluYWta?=
 =?utf-8?B?b25ocFJ4S1hLZkI4clU3TVpHVjZrMFhIenhtSFE1Mlk5R1FQNjYrN3grUDF0?=
 =?utf-8?B?QTlqVFRDNnhWbHZXeVpFRVpRL0VPdUZiekZueTFaV0IvSDAxQk5aV0czNGdE?=
 =?utf-8?B?aGNTbDBIekhiT3NZZElrVDZYb0hqS1hPWit2ZFZjOFA2Mk1za2J5NXJMSy9s?=
 =?utf-8?B?RWtZZ2ZmajFIUXZIdG9JRWczYThmOW9vdWU3d25vWnREc0ZvNzZmQXkvNk9a?=
 =?utf-8?B?LzVwaFV0MUpPQXljZVpMbDdUcmZyZlFldFFDOTczbVNaeUtZV2JKRGhLSWJZ?=
 =?utf-8?B?T3pHVkJ5ckUvZUJNY2hHQ2NxTHFZejJWayt3bi8reXZrNUE3Sk1kSFlXNEFm?=
 =?utf-8?B?NzZEejNaUytCSHBkdFc1TFI0Rm9SWkUrbnZlaWxoU05IVDBNZjJ5c3VjbjlC?=
 =?utf-8?B?ZFBIYlFzZStkYUM0OUlKK1NMdTIyUVN6Wk9mVkQ5K2ZPQWtrTWw0TUxoWlU3?=
 =?utf-8?B?UlJVL2tvb3YyRWlkOVJpNDI1MnZ3MXBLV2FTelpHZUxub3VHS09DVnhCWjNQ?=
 =?utf-8?B?bDEzeFJGd25HRTdvbmI5cDJTS01KTnRkYzlsSmV2UWE3d216OWlYMDBUeW5x?=
 =?utf-8?B?WVA0RHMyOFdVVkRtcnJHZjd0U2E1UlI2NlplUno2TVFBN1ZRZTB2ek4vV3Rt?=
 =?utf-8?B?c3d2VGVkTlZXclY5czVzTTg5SkZRY1hENmF6dkVBdkNzOWpzeEhxRXhuQ0tl?=
 =?utf-8?B?VXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ea7016-de1b-4c56-836c-08dd1f7c7c57
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9561.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 15:56:08.1268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwXUho3lmHDSTwHe5ZhheGc4tlo2KicA6bGIAcGX8kzj5IrZvOuErLJylHjXVqoQOV/Mos5waskdHrTKfQofGuSwTjycvn/D+3vDBmtqVW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10271

Hi Bertrand, Andrew,

On 18/12/2024 17:33, Bertrand Marquis wrote:
> Hi Andrew,
>
>> On 18 Dec 2024, at 16:19, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 18/12/2024 10:11 am, Andrei Cherechesu (OSS) wrote:
>>> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
>>> index 02322c259c..6dbf6ec87b 100644
>>> --- a/xen/arch/arm/platforms/Kconfig
>>> +++ b/xen/arch/arm/platforms/Kconfig
>>> @@ -37,6 +37,14 @@ config MPSOC
>>> help
>>> Enable all the required drivers for Xilinx Ultrascale+ MPSoC
>>>
>>> +config S32G3
>>> + bool "NXP S32G3 Processors support"
>>> + depends on ARM_64
>>> + select HAS_LINFLEX
>>> + select SCMI_SMC
>>> + help
>>> + Enable all the required drivers for NXP S32G3 Processors Family
>> Minor point.  Help text should be intended by 1 tab and 2 spaces.  The
>> surrounding examples are wrong.
>>
>> This can probably be fixed on commit if the series doesn't need a resend.
> All entries in this file are actually wrong.
> I did not mention it due to this fact and I thought of pushing one change to fix them all 
> instead once this would have been commited.

So, do you want me do address this individually in v4 (which I will send
anyway for other reasons), or would it be preferable that you make a
separate patch to fix them all afterwards?

>
> Cheers
> Bertrand
>
>> ~Andrew

Regards,
Andrei Cherechesu

