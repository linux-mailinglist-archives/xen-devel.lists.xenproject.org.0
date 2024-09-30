Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A2998A011
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807211.1218515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEBZ-0007zd-1s; Mon, 30 Sep 2024 11:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807211.1218515; Mon, 30 Sep 2024 11:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svEBY-0007xA-Uy; Mon, 30 Sep 2024 11:03:24 +0000
Received: by outflank-mailman (input) for mailman id 807211;
 Mon, 30 Sep 2024 11:03:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gdTo=Q4=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1svEBX-0007x1-BV
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:03:23 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ae5050e-7f1b-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 13:03:21 +0200 (CEST)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DB9PR03MB7178.eurprd03.prod.outlook.com (2603:10a6:10:22a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Mon, 30 Sep
 2024 11:03:17 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.8005.021; Mon, 30 Sep 2024
 11:03:16 +0000
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
X-Inumbo-ID: 9ae5050e-7f1b-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5ZFatWQQ2xpNnPFMfRECLJImNCFQ46HOfK9e4N//arQwtj6Wpv6c7Bu99gB79VToX1obWXJnRFBIxOwCAwl4+E5Rpv83/x96UkfqQ8rXpd11TrL7tK9ncu8olIbbG5rtPzpE8VTy0QvtNXoK6krX4dnFvuVnGCxIjQwen+061j1AZtVwznGvNxOs8uXDIg70fK9MYJXm4UyoIlR6ISOx7ZEk6Z4jyZ/2XBzWNzBtCa2UalAv6RO8Gb0fFhnI3xkktWlVh01DG1DBXuqNdjjgKIsw1iRaO8/L56v7EE619GCdvdW+zqTMoUrHWSRDnURWbhurKfJ4M52IK84+RoUAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w91KXap/SWein/qOOwiA3At4+nxmeGCrGRMelOsN/zk=;
 b=tvkp61lYMkDiwrb58ZZdiQdtk8bB2+FUKAl7VPjP/btkrqQypszS2VurEGuOq8I4Lbtpmx0G0lmcUMYtejwlEIoQvF0B0OsztkzAxbKRV7PfsbqtMEI8Jw03QrdLZj/0JWdXN5KA0wk2pSaNhesOPPQnQc1k1SUQVktcU0i/i9eMvYr/olAVtZZoDOxkdSM2aRJ7o0OywAuE1SZ8kqRrBSKuVmDdzMbb5x4AlMiPL6cPNIlaUGYO0HgbhZYcUKplh2BX8dvU279ja8pQOWXpnBt2Si6shNxbb9I+oJNjiBR0bwdbOZJ8JntMltVJCQmjB4NPVOJbTPFL35DI6WktDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w91KXap/SWein/qOOwiA3At4+nxmeGCrGRMelOsN/zk=;
 b=c4VvEd0C5Y0T+X/VYHXJ3VJ33MMCNzjAp2bEepKYTn89GHMyH5JGSWQ6QLVPi65JuI+xm6zkvvjKuWWNdX6ow5/rRi3+QC2zLNgMCXc0KnuC4JeFhUG6tTffSxw/+7Qta/T6Thq6W8yAQikrIn4qIZUBN3/hZVK8aDtHtybYafXQ7JpEWNwWwJ4oIN1qMm9BoKefy4d9s5pzHhUE0LJOHgArE+Q95aUUkXBG0r2yserQCxAVRFYnQn3OhVMiCMlO1BuKh9b+ykC/YpRzi2uxwT6R2DMvpJR++NNVczy3eCzPEtCfmnZu7ObLIZhi3wUIYNNugAruZ/OESM/cUDI+Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <b2edae9d-2c1a-4e67-9e01-2ce3813d4dbe@epam.com>
Date: Mon, 30 Sep 2024 14:03:14 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/hvm: make ACPI PM timer support optional
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240916063757.990070-1-Sergiy_Kibrik@epam.com>
 <Zufh7DOSCwzhrpZG@macbook.local>
 <alpine.DEB.2.22.394.2409161252380.1417852@ubuntu-linux-20-04-desktop>
 <614611f1-dfbe-4185-8f0a-dc89aa7f5a20@epam.com>
 <ZuqgTKqaUDWC_I-u@macbook.local>
 <27d717f7-3073-4139-bef0-05d1a39f1e6c@epam.com>
 <d5a6774b-3c50-4b39-9bb7-740f0763a1d4@suse.com>
 <12072ee1-5a39-4c19-a442-c5be45fb968e@epam.com>
 <15d79e3e-dea6-4c07-82c6-43e17e429123@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <15d79e3e-dea6-4c07-82c6-43e17e429123@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::9) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DB9PR03MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: c4670928-4ada-4061-3aec-08dce13f7c7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTJtekZwQjN4VEJvR2xvUGlMWndCQjZSY1R2ekVvMjBGdXcwMnU2VFBERTNa?=
 =?utf-8?B?NGwvNEkxMjI2YWNpSnR4NzlxMGNkUUxYWTB6OTFVeVJGMU5qKzVwTDhWQXhW?=
 =?utf-8?B?Sk9oYWZRc2NnLzBBdHVyWjJsSjM5eTN6bFF3SWtSTDdhOTBFVkNnQk9KVkN5?=
 =?utf-8?B?V3pCbmlZdXRsZVhQM0F3NFpvNTVmbHFKK1FRMzZUQVBkWnJmOS9jTElaUnJw?=
 =?utf-8?B?Vy9CY3RYMWUxVUswZzVkVVp0eWdQR0MzRzlDSkN1ZkxFQXBrWDdIWWNiT25H?=
 =?utf-8?B?YmFCV3VvMWlNSmFVYXFvZ2NJWCt1ZnhsWGx1ZWhQQmdKM1BIbUx5bHpzTmF5?=
 =?utf-8?B?bCtJQ252MUQyQlF4MmlJVkJheHlyRUEzVXFGL1RIbjFhMVNFYjJTSWd3QnZt?=
 =?utf-8?B?enFlNnFRSzdmdVk5QVdDaEZaNEpKTXpxWDdQQ1JOcm5HeFoxMUp2QTJQYTZj?=
 =?utf-8?B?QUJGMU8zVkhVc2FTd09VM095V3ZMaVhWcTN0Rkp5SnZqWUlHZHg4RE1pNHp2?=
 =?utf-8?B?YVVjOHc4Y2tkLzlVTnVoRkJuRFZlanJvZ0wrRG8xUEVnUWdmeDV6WisvL256?=
 =?utf-8?B?UW9hOHQxWTh1d2RERmwwNkZRZHQ1ZW1ZbExHTWRKSDkwM0RrSnFiVXpjQmhJ?=
 =?utf-8?B?Sy9MdXN1M0kvWUQ2RHRyRzVLZ0dBZjA5NzZoK0JOY2s3cmZMMThNWFhOM1lH?=
 =?utf-8?B?Ynk3YTc0c1ZtYnNPcWZibXdreG55NDRYTFNhNWJkdmQ1T0w0L2p4bVJacjlT?=
 =?utf-8?B?d0NQNkh1Q3pBMkNhQXNmQkF2eXVtczJvc3E2TFMrL25hSUgyeWFvSy96cTlJ?=
 =?utf-8?B?YlVZRGRMUE5XUUhWZXE2NWF5cHV1YkI1R2hGb2diWUhTZUN5NXlkOC9zRzhi?=
 =?utf-8?B?Ry96SkpidGxUNzQ1MUxIcE1aUU1zM3NGVyttRWhqSjJONHpnTTVUazRLQ0JZ?=
 =?utf-8?B?aDlQN3V3Q01GTzJhaG9lVkVDeTYySFpJV2g4V2xRSzZoS0s4VmhhMVBlRHVu?=
 =?utf-8?B?bEJKdkZtOE5KYTR2ZmRVYTBtbzdTLzA2QWdZL21LWUQ0QjRjNjRtOXd4L2FK?=
 =?utf-8?B?R3U4b1h0R2dPQXdtRkRCQUFaeER2bEdKMXJIZFlTZnlVYWtRbFg5L3NnbTlG?=
 =?utf-8?B?aDZJTS9vcHhGRVdGam9MaEhJUmgwR051R2hGOHBORk42MU1TcEM1Kyt6SGpD?=
 =?utf-8?B?SG9JZ1gvaGM3TEVZV0Zob1NIRHRuMDR4Nmt3YlI5QTJBaDBqaFZERldqbE1P?=
 =?utf-8?B?UVlmUGJHZERYdDcwMFMxOEZNdlZlRVBUcE1KeXNNaEtLTTlPSHIzRzJFQ2Fs?=
 =?utf-8?B?ck1kME5scS9Cb3NkMmd2K1pxUHB1QnRCajAxMy93ZmprSlVLWUZjN3hlRmxV?=
 =?utf-8?B?SWhoQXFSUlpnUVNjeEdQSmdpY1YwWmpMMGQ1LzljbXJ1NGduQk5CSGcwemIr?=
 =?utf-8?B?TGp4TFl4Rk15NTFqRitETVJPd3pBbnpJSW1ROEVzZUJLbVo0SDJsQnlpNUJU?=
 =?utf-8?B?aE9KWis3L3hIbXRaY2Nwd2NqcW1oR3NMc1JKU1JOR0ZmdVNEWW1LM0svVGY1?=
 =?utf-8?B?dkZrcFNoSHc5dklROHdHN1NIWStVTXYzeDNCZVdpbG5jeEZyRW96MUhObHhS?=
 =?utf-8?B?TWJIY1ErZGJnWG5TeFVkT3VnWTV6a1pvc1VXYkp4ZVliWWlRRUlIaGhYM3Bw?=
 =?utf-8?B?V0dDVGZIN1NZVXpLV1E5UkRqT2F0d2FQYjBDVldrOEEvWTRNRTBxbFVYYVZ5?=
 =?utf-8?B?UzJ5aytaQTEwQzQybkdJSWo0blUyZFlKbVgxdGJ1bE1NWUlURUxEODRXWVVw?=
 =?utf-8?B?UjFONDNFU0w1ZjFESHJ1Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3oxVUZLRVl6M0pKTlF4SEd6VXJveCtlWDdMSWczRnhtc015bEI1YjJjMk14?=
 =?utf-8?B?TlpkWFRxTGZJUkV6T3d0TXYwNlhtbU02RTk5dCtjZWNtWnVkRkFsZy96MytC?=
 =?utf-8?B?ZDlHRERJcWVOSWpkejBhay9RTnB6SFRvQWw1U2xmbWVCeWlTK1ZyYUU0ejIv?=
 =?utf-8?B?Q0ZNMklZMTZoMTVRUUR1QmtmQzdlMy9TeVdWdVdSNy9vYlAwUlBWRnF4YjV6?=
 =?utf-8?B?SnRIZGlwNGQ4d1lJS2Uzd2w3UlkwWm9xcTYrRkVYZUpHenVvWDhNeTd2c2dq?=
 =?utf-8?B?Yk1qNENRbUdxZEtOeUtaN2hzVVdVbGVrRXQxaHRxbnEwRXpuUktmQlQwdHg4?=
 =?utf-8?B?UHBVWm1ScnR0Qit2NWtVMm1NVG9CRDdBcWtHdGJFM3g3K0hSaWpwZHNEZi9y?=
 =?utf-8?B?UVlmM2FreDA2T0I3NGVpZkRybW5CVytka1QyeDdWUE9lZXE5RG42WHlpSkMr?=
 =?utf-8?B?WDlXdE1vQVFjSnp6L2lPY3RXWWQzcHBMRnQrYkl2SWhFaU0raHBVdk1CK1VN?=
 =?utf-8?B?S3JnYkJOL2x0MXFrVnFTQVVyM1JTTlhqRTJwNzZPTitlUDJ5K3BlSFFGWWhs?=
 =?utf-8?B?TlZJdHRSRzdtUWI0UUhyUmFqRWxmaWprNW1oclkyYUxtK0JCVWVYVEY1dFp0?=
 =?utf-8?B?Si91T3laYjlyT2JYTVFKR1ZRSENoSEdxVTlMMkExMkdhQkxaVGQ0aHVZSk40?=
 =?utf-8?B?emJhbVVncDRQcjE5djB2R2NBUlNxd1BDTUVhYzB2d0RKN2w4NTg2clJhUG82?=
 =?utf-8?B?VHQ2OE1EZkxsY0Z6L1Z2NjNaQ3FjS2tLaG56Mm1GSTk1UGpsTGZDTEY4Sll0?=
 =?utf-8?B?ZW96b0xKd1ZnR1dLdnJJTEREMlZscENrZ25mVjRGdVRCUGFFZ1h2b1VnNThw?=
 =?utf-8?B?RW9LWjRacEM1TkkwK1FJUjJzZDhvY3BzbTY1d1hJekUwOGFZb3BBcXJHcUgv?=
 =?utf-8?B?NFltUUwrR2VWL2l4bGdQd2g2cnhBazNNcUtwZUhjMGIxclJmekdURFRTRE00?=
 =?utf-8?B?dWFIWnN6ekFBbUF2M2IrNFBzanQwUERVdDFjS3hkckNnWXR6c0lhQVZwT1lW?=
 =?utf-8?B?VnV1bkRUVm9aWkpyUStZaG5HYVFjdHZnVm9hQkwxaGRnZFFWUDZiYnZKdGs1?=
 =?utf-8?B?czFhK1MvS2lNUHJUbUgwdmZGVWVBWG5od21rWFN0a3pHQU1HWWV5TEhqR2Y3?=
 =?utf-8?B?b3RzdjgxZ0xMMmRJeUd2VXNCWTZhcHFBdXovcUE3M2RGN3BDejJUNEpLUWRm?=
 =?utf-8?B?THRNSGtWc0g3a25WSHU5Q005dEdia3hFTG9PQ1lUWTcxN25OQW9rYlloemNM?=
 =?utf-8?B?eWdxQUwrTjVPK1dBQ3YyWlhtTGN4eTNlYjhDSUZ0YkRQdENJb2ZxZm5Bc01o?=
 =?utf-8?B?YkR5cG1MalRDQ0JPNmhmR3M1dEUvV1NvQ1lvTFRnTHRmSGlycWN6VnFHb3Zk?=
 =?utf-8?B?NldaYkVkcE5BNlRpSWZtNWQvZVF0ZE9ZQ21GeGZTcGUrNFpoclpyVE5WR1VS?=
 =?utf-8?B?em1XeUt4UGpIK0o3Y1h1U1p3cnNzanoyditoSzFzLzEyNlJqRWFNTC81VHpl?=
 =?utf-8?B?UTMyVGplalFkM29LVTdpd1QvZFVYZmJnZGVwU1k4ZWhsQXl1NjdUQzZqNllI?=
 =?utf-8?B?ejVQYlkzenlId1E3Z0JTejArd0ZqbDJhTldmUE5LWTNDanZpblFIU0F4cVQy?=
 =?utf-8?B?bis5SVNiVkg5NGN4aWdqK2NSYUo0eFJUZXdwSnk2d2N0K2ZaVEhkNTVjdlI0?=
 =?utf-8?B?V1RHZzFZdE84cGVDeTA2bDJDNVRzT0k4TlFHSnFGcnhPZ0FQczFtQi9lM3Vh?=
 =?utf-8?B?dmJPREJMVm1xc3c2R1Q0UkpkdlhRem1NNFo4cFUybmR3WURZQkxZUkJzRlNG?=
 =?utf-8?B?Z0t3bUVYa1dSQit6cWhLU1FmbmJzV1ZsSlIzVm0vOGUrOXV4aVF2RWRncXlv?=
 =?utf-8?B?enFPSE0ydXVQNGdpeW1tTEtMUFpialNwaXNOMWxBbEZXV2dvaFFXbFdEblRv?=
 =?utf-8?B?MzhiQ3F1eTBnOWpiUTZFd3U0Tm5iTkZMbHlqUFV6ZzRrRnIxbHkvNWkzYzlG?=
 =?utf-8?B?VEY4cUJQVi9Ga3ppclhWNlhWaEJaYTRmM0dnSHA5cElic2xHc0pMYWN0ZDJH?=
 =?utf-8?Q?nws/83Lq911mQBiQxbzyWvhbe?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4670928-4ada-4061-3aec-08dce13f7c7b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 11:03:16.9210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qc2KtxU2nf8DhTaCtjnbeAdE0+rD+jRJWRsV0atSW9gVGzoU3q3ktsztHPKoU3RiS7gzE7q3rai89xvg1eo0zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7178

27.09.24 12:44, Jan Beulich:
>>>> (probably with X86_PMTIMER option depending on PV)
>>> HVM you mean?
>>>
>> I wanted to do it like this:
>>
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -386,7 +386,7 @@ config ALTP2M
>>             If unsure, stay with defaults.
>>
>>    config X86_PMTIMER
>> -       bool "ACPI PM timer emulation support" if EXPERT
>> +       bool "ACPI PM timer emulation support" if EXPERT && PV
>>           default y
>>           depends on HVM
>>           help
>>
>> to allow it to be disabled when PV is on and prevent situation when pvh
>> domain can't be created because !PV and hvm domain can't be created
>> either without emulated timer.
> How does PV matter for this "depends on HVM" setting?

Options are dependant on HVM option, because pmtimer & stdvga drivers 
are part of HVM support code.
At the same time these options are allowed to be de-selected when PV/PVH 
enabled, because only PV/PVH domains can be created when stdvga or 
pmtimer are disabled
(if both PV & any emulated device are disabled one would end up with 
weird system that can't create any VM).
So that's the idea behind making all these dependencies.

   -Sergiy



