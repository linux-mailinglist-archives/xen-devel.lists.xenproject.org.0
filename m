Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOtVBRRynGmcGAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 16:28:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D2B178B60
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 16:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239130.1540565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuXqs-0000tk-P6; Mon, 23 Feb 2026 15:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239130.1540565; Mon, 23 Feb 2026 15:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuXqs-0000rg-ML; Mon, 23 Feb 2026 15:28:02 +0000
Received: by outflank-mailman (input) for mailman id 1239130;
 Mon, 23 Feb 2026 15:28:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ndCc=A3=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vuXqq-0000ra-TN
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 15:28:00 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b9c9c5a-10cc-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 16:27:59 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB5975.namprd03.prod.outlook.com (2603:10b6:208:31a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 15:27:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 15:27:55 +0000
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
X-Inumbo-ID: 3b9c9c5a-10cc-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8L8zRDVKdXmHewL1ZdHhEeUz9s6WubMGihK2jaFe447QOmmyf5Mxi8xuJG/tTa5vDs6bq2ifpsPa25Ahm4Fr4N7UNgEMvUJXQTY2Nu9iqhOU6RG6AUHLQctaMeZJKFQcM8iAVpLy27XWLsw4bqvw3GJo/L8H2MD+D/WQMaqyjN7aT9ByKrmhoottDx0z5j9doHNeq5aNl0hR/KYuRxHALMqOAqAbU+irs+hoQlZ6xo0H9xJvFhaO+1Nc2J/GHX4JYMwcurxgMF/BGt4eK9IGusX6OuRUrMCp3pYpwTna2P93q15+zFBUidDSvvwqwgLbd/v6M3kr1a4qlA7iH9l4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RD6EGVMj/RXjZfLDvyRwa7LgHV4F59El5tlUhzDwmnc=;
 b=BJIOeDtlJGJabyUS/i+0tSM7h2cO1sbzlvyTSej7x61ra3h/ku31G3HXOjhDuRQvg/oY7kCoSmfWHeF+PM1zRS77UXx/e5rhLte+aKFJhpCtFiCo9fZtHQq/u7JOcZaImbZI09vDDx1U+W9kYDbTT+DkBcsSoNTSnodssKMkEIiL/xH3wNbxN0WJ9qB4xnImJTYkEdEcyv4I2DeYg5ki5tlhs+QLIoghKdm8+dcdKWtM+T2Wf6xzB5OYkECQNj88CJR+20w5NTicgoOaNFIHXNeXayn7UuCDJtaIwRJOPwZ/hbRh2pkyXnkuTvrVM298N+OAECeCGxtCMjCO2h8T2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RD6EGVMj/RXjZfLDvyRwa7LgHV4F59El5tlUhzDwmnc=;
 b=Rt8sx8Srfv1C/MWY3n2p0fS9R/s9janfG/TBubbpxQH+Q8v7xOi0phM2iz3GFJzXPROVoyRoFUlwRqku+Nzj4mFXXm84ONR4U0K8u2vAIcWKRQysX8uuX9ScRMCtjcgXq24hSRrSmQvCdipLUyz8VLHvSdfNmZpFkvCWYd8ANUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7ce632b7-32e5-4aa8-bbb4-ca32cfebba29@citrix.com>
Date: Mon, 23 Feb 2026 15:27:51 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v2] wait: drop wake_up_{all,one}()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <be4a2b14-2217-49a2-a65a-237852bd5296@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <be4a2b14-2217-49a2-a65a-237852bd5296@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0034.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::22)
 To CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: e1abf922-e0f7-4c5b-9445-08de72f01d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d09PeEQvWUE2bmxGdFVzU0pSM200TVVYNFM3NkI1N0FHT2Iyamd2bTQvL0Za?=
 =?utf-8?B?YjhTVzdtdWdCQ1ZBR21OVzhKb2svd1k3Z0E3Y3lETUVBbkFZait0MG5CT3JD?=
 =?utf-8?B?VFl6b0NSN3ZEL0NmeUZyYlE0T2k3VHJuazI1empZVFNWZFUzaFlNcG1qNVVq?=
 =?utf-8?B?TUM5Yk8vQjBmWjU0YkhDMmg5QU5mc1RuV09WMjMrV21DZ1lsSWZkMHVpWlYz?=
 =?utf-8?B?Ym55OU9MTWNiQnZxRUhvdE5nM3lKTDFibk5ZRXdWdTg3TFJWWi9wSENDYjhB?=
 =?utf-8?B?cXNMZkJ1Yzc5L09jVE9rL2V1czZuNGtkbTJLcUVEb2VndW5heDNlbE16QjZ4?=
 =?utf-8?B?c3dDRHhNYkprZ0xxYVJiNEFKRkcrcVZzdUNvQmFGOXJaU1JvZTBKSmQyRE1R?=
 =?utf-8?B?RG5yRnVia1psNHk1ZHBPYURHU2lhRG9xUFN0SFZnd0IxVmxCQXc4UEY5WXBX?=
 =?utf-8?B?OFJ3N2JZVmlWSHNtaVh3b2haNkVkWjVsWDdlRG5nL1ZvNTRWbTV1cStGMDBL?=
 =?utf-8?B?ZjBHRE10R1FoZ3Vuc1Q4eTdOVEJXdVdQNnVzZnZVK2ZodUIxdXZaT1dXOE85?=
 =?utf-8?B?UW0vcWNxYXZiOThxL1lpNTcxS096YUV4NThJRlB1QjJZenhsYm1WVEVBb2pk?=
 =?utf-8?B?S0VNMFV1d3VkdzlhZkJZdyt4MnFKZUpjVXJYd2RoMytGRHlrM3R4Ukh5NlRL?=
 =?utf-8?B?WmxvOVZmZUJHeVFNbGpCMUcyUnN6bEw2WG1GZWx0UzZTZXV4cW80TkdHYWpR?=
 =?utf-8?B?SUZEenMrWGRJdENVcHlIeDRZMWovbENZN3dFaW41aGEycVFVSzYwM3BsN1Bs?=
 =?utf-8?B?VFlib0tBaEpaS3ovVFpka0t6ekJ3ZmZHSjhCMFZmT1Zwci8vTk94R2JjWjhy?=
 =?utf-8?B?U0dUUktMMlJPSTNTMHB1Q09EMGw3MTdvZjYyQi9MTlI5NTBjYjVsOHpUdVpY?=
 =?utf-8?B?NDd5WHFHczNrWThsL0h0NUFJK2VXNUZyRUNsNjVSUzUxQXdhSjRJZTJGakwy?=
 =?utf-8?B?NVN0QWJrZW9Ud2YvRVJ6TUlwOVgveVV2NlN2MFpCT1NTaElOR1RNSXM5azNB?=
 =?utf-8?B?RWdDbDdoWEQvaDlacDRFU1FrWE9BeWI3aEJMR21taHlmbVVFbHJqZGozWndN?=
 =?utf-8?B?S0hlZUYwVnd1c3lsaFV0Lzc1VFRqVGVNSHpwcGlEU0Iwem11YTk1L0ExWTBH?=
 =?utf-8?B?MXRKV2JMeGg1MWFRSWlaRGZ2N2tUVk54ekowUit3U3JGTEZXeFdSdTdaSUdG?=
 =?utf-8?B?OVpENGtWT2k2bSsyNjc1MjNYNjVqNjlNMVVHUGtma1UwMjhWVS85ZnFlbXJ1?=
 =?utf-8?B?d0o3bWJET0I5eEpIcU4wR2hiRkJ2V0p1RUkwOG5oYVkrbEpNSFpUZEF0L3FI?=
 =?utf-8?B?L3MrM2VybG5KVVp6QVc5bFFUUmZTbEVydmJpb09ubGZ2VlU0N3ozQUthQk5U?=
 =?utf-8?B?akUwREIrbnpaTEtPSDVFWXBoVDRLYmRVN1kxWTVDa3pSUDdSbllodC9BZyt6?=
 =?utf-8?B?a282eHJQeW9zY2pMeW1xeDFtQmw0OHoxaEorY0cvQm1zcTFya2pHRm13NXdl?=
 =?utf-8?B?K3lTVUt4V3puSVVucVNIeFVjNnprdkU0OVoxZnp6SmpGSDdOcTVwTGZSdWlT?=
 =?utf-8?B?Mk9rU21VbjNxcUlhMkJ4cSs3bHJBVGZySHhPMGhSeEM3L2krMk1qR255MHhZ?=
 =?utf-8?B?YUFOelRoamdSazdEalBNMTVwd0F6MnlRQjcxbmJiT0lQM3NhWjVqb3VVN25Y?=
 =?utf-8?B?QjBSZXBMOHhyNUxjRzQ5OE5BZE5EcDZWMzBYR1Y1aGt6WlpidXlvd29uanZz?=
 =?utf-8?B?ZjA5NnhVWDlLWVNYZmV5Q0ZqbGdhQ1A0UFRTZk94RExQWktVUE9pZmp4d0lm?=
 =?utf-8?B?NWJuOWViV1lEWWFDVjdtdFVwdTVpS3B4VTFBd3FhVXM2aFgyQWlLVFk1MjVw?=
 =?utf-8?B?cFQzclRVU00vaFZNV3NBaDBGNE5Qcm1GaDdwWkFwYjF4QzEwZmdTakRXOXpt?=
 =?utf-8?B?RkNPVXlqbDMzTUt2bVIzRm8vUEVhTmxuVGl6YklaZ01oejBwdlJOV0VCVFlt?=
 =?utf-8?B?ZVJXcE1Ma1h0U0hJNjdyOW1PYjFwTjE1ZG0wMm5FTURaUCtSN0hYYmU5dHM4?=
 =?utf-8?Q?c3PQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnRGbFRRK1Z1d0d0VU9xQXdXa1BENjFrVEp6S0Z6SCtLQVBZRkRiUHZQZ3oy?=
 =?utf-8?B?bjY4bXpXZ3FiWmZOR3lOR0pQeXlrYTNuK21uNTd3RjB2N2Z4T29uZ2o3bHVU?=
 =?utf-8?B?aGZCUWhEbUNEbWp3V2h0ZVN5eEo1Wmp0a09zRXJ4Rk4wSEVURm80U1MrSjBI?=
 =?utf-8?B?czBpbEdsNXlMdGtQSzVqNUhFenNlcnpJeXIzY0JUdUFXeVFHcTlEQkdoSmhI?=
 =?utf-8?B?eE1GcDBLZHkxSWFqYnEyc2FWcEtmS28wUEV5UzY1SlVjaXA1ZzYrT3ZDelFC?=
 =?utf-8?B?Zk1RNVVrdWU5T0QzaW5ZZDYyb0NrdmRmWEhLT2ErVHJsQnY0QnJKb3diV1ZB?=
 =?utf-8?B?WCt5UlBtbXF1SlRsaGNjendaVVdPbGhhM0tvU1lMWURQVWtXYlQzZ2hMWGw0?=
 =?utf-8?B?MTRwUXpxTVovdlgvQk5YY1NrSGo2Rjcwd1hRRWIzSEJkUHM1OXJpZ0RHTzU1?=
 =?utf-8?B?YiszekhkMEdsUUx1bFptRjh5ajBWTHlGTmthS3FQaUR0OWFtaFZyQ2FVVDVP?=
 =?utf-8?B?VWVnTU4wUTFvZk1RUktudDE0RXREYmY0SHJvVGw3b3ZvSXFrdUJYWmIxalBq?=
 =?utf-8?B?R0RpMFNyVlU0MENzQnpSZERnQkcrWUovNGNLKzV0V3NTTUw2NG9XT0svalNj?=
 =?utf-8?B?Um83UUs4UnZneEFNOTdYU053NmNWbEo3MU8vZUZQK3haRTdaQS9UVmFzZlg4?=
 =?utf-8?B?c1dDMXFLaklIbzdxakxFNndxQ1FuRlRaNXpQRkR4d2dBRStuYThUa2NDMWtD?=
 =?utf-8?B?OG15NldHQ2V1OE4zRjl5dVpTNUVBcjZHZDVqMk45MHBlS3Nvd0JQUEJ6U20x?=
 =?utf-8?B?NTlQaFYxdkYvQk1TOEFZbU5IWlJzZVc2WjBVakRRRFAwd0orVHdxTjZiQnFw?=
 =?utf-8?B?TlZDYXVKMlQ4c21iMitLWkNMVHJab1FjR2hKMVkzUE1SQm9vcVZzcnJIc2Rl?=
 =?utf-8?B?NllFZmpDOFMzbkxlQURlTE5KWUtXSGlENHUrdlY1SE5uUys1ZCt1dnpPV3BV?=
 =?utf-8?B?SUJYM0QzTzNEdDJydFhva1d4a0ZONzVMa1JaNmhrUXZuclVDMGhJVEdERjln?=
 =?utf-8?B?dHhoVEVKc290S3FRVTdOT042ZUxKNE53MFJsRW1qT2U2Vmw3MmIwLzNVK3Jx?=
 =?utf-8?B?WEsvNmpZSXBaaDVrM2RyaWRiL1ROVklMR2IxVDhmRGxKUXllMVFuQ1dwSGl3?=
 =?utf-8?B?TjgzRklkMXZKejRpOVZ2V0ZJRTRFNWlOMUlxcWhaeGlpSm5JbzFiQ1RDRUFD?=
 =?utf-8?B?dlliV2cyZldZanhyblF2aTlUVjhabDBRSzM3cFFrY3Z3V0JDWkU1QkQrRG5i?=
 =?utf-8?B?UHMvbEZWRGkwR042bzJpUHNMYXV6YXovQUlZc0FNOXhUVDZ4emZkZUJtRy9O?=
 =?utf-8?B?UDRuMFk5VkxGYytFMWlCZTZSNkVXWUlXYWdtY3gzTll1eVNsWFJrdEtGNWY1?=
 =?utf-8?B?U0tTS3pPb1NEcndKb2E2UzIrMnA1N29RNTdvU2t1QzMzbjQ1aXV2MkFPV1RR?=
 =?utf-8?B?dXFkQzUyVHViOG5KdTVsQk5LWXRlRk44L1dlL3g1TTZRUzdWSnlwYVhzMUlo?=
 =?utf-8?B?OW1ibUFLU25vVVljYVRrT1krcVQ5clJFRFFmeWo1ampFVEFSWTF4anZmaWJ3?=
 =?utf-8?B?SytJbTJ6TkNVYW9oaUgxQVhMT3d6ckptTG4wRVNKL3FpSVhmTmdHOVgrSUZD?=
 =?utf-8?B?NXFERUdXdnYrYmV2clJzc1M4Z1VVNUxpLzRxakQyNzhHTkxRVUNCcHJ3dlJn?=
 =?utf-8?B?UGZyejRQZE9tbm9pTHRqQzFPU3VlZGlHOThabFY1emJqZlBPQ3ZDUEtLWmxU?=
 =?utf-8?B?SlF1aVpNU0lpaXB2cDNzNFJ3ejloMFVDWTZpQUFCWDZRUXE2b2ZpR1drb0RZ?=
 =?utf-8?B?eWx6b2dOSlg3aldZb2szb1kweUlNWnI3L05KOXVaYm5wdFVoTVgvUHlXd2xX?=
 =?utf-8?B?VDRYQjA0WFd1WWpCSXZUUGlaTGFpV2VudGw5SXVRQUVKN1VqTTNHOUhJWXFF?=
 =?utf-8?B?TnNMaENFckhjM1BrcjJHbVF0ZHpiOUs4OVBzRzBpQzN1OU9ZVllEREMwOURR?=
 =?utf-8?B?a1NVSFVvZTJUL215bXprM2xvZ2hzZ0h6Y0dTdmRINFhldFFGYU11Rm9GZ0ZF?=
 =?utf-8?B?R0R0NzVhQlU1d2xoL3lkYi8wZ21TQXhjUGxVUnorclM3RXZxMW5qWW82WDlU?=
 =?utf-8?B?S2pmcVg5d2J0TWRQL1Jac0h2MnZZd3ZDTkp0dHhmMTFDRDV4SWFRUWxidVhH?=
 =?utf-8?B?cHY4M01LODhkVWZOV2hqZURHSkpmVHRobTh2bU1FNUlqVDNNYkdJT3JGRmhi?=
 =?utf-8?B?Wmh0MUMzUVpiQkZkSnFxSjdkVHR3ZHBLUXluajQ2MWNOVFlVZklYdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1abf922-e0f7-4c5b-9445-08de72f01d9a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 15:27:54.9742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXRdmpL5idjoAiLDBlosz+6i60R+yDeSanFCaSPaNy0eXzv8D99WMsknF5evY0Ba7v+8afSLqsxeoYZCJl1zq8CD08ErR+qHbxTBsaRWf0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5975
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 62D2B178B60
X-Rspamd-Action: no action

On 23/02/2026 3:09 pm, Jan Beulich wrote:
> wake_up_one() isn't used at all, so violates Misra rule 2.1 (unreachable
> code). wake_up_all() is only used locally, yet rather than making it
> static its sole user can invoke wake_up_nr() in the intended way directly.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

