Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABFEC0679C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 15:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150329.1481523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCHmX-0004wO-RB; Fri, 24 Oct 2025 13:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150329.1481523; Fri, 24 Oct 2025 13:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCHmX-0004ux-OH; Fri, 24 Oct 2025 13:24:37 +0000
Received: by outflank-mailman (input) for mailman id 1150329;
 Fri, 24 Oct 2025 13:24:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XD6X=5B=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vCHmW-0004PA-Nw
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 13:24:36 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c56dde8c-b0dc-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 15:24:31 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CO1PR03MB5923.namprd03.prod.outlook.com (2603:10b6:303:6e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Fri, 24 Oct
 2025 13:24:27 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 13:24:27 +0000
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
X-Inumbo-ID: c56dde8c-b0dc-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=id+7ouB/O14EOZiKj/lmsmNbuEMxfUpCYwLIHyb/BQueguBGXqB9mVdFUYKaJ3y6WodrIybqVt3Uzu5rGUJ7G1vpEXpZzrRWCLpT5yzLF5lE0EvbpR5i1o+ibsrI5p4yolxEtGG7/xg+BhsYIMG+OmGAwAEYAwFqeAniu/srZAW8dOK36RU1d4bmvn4ZPmDcz5vJY9g5I/KubQA5OUxr77cPapre/vT5EC51AZrTI7RriPn+Bu9l4JpNcRnqa2WQ9wgTFnP1TRKAhNMhTcBlEMJYISsp+xG/eQ71QZWl/0qQkA89PqVAvadz7tIoDyzWiDi/mlLqXl5UjGgx5E2gxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vOpCmfrQ6Ssls9FWPWQE0CnV8KyUWRoy2QthAaCISE=;
 b=PzfHrb5Hro15hbfeoKA12OAFrYAJ27jF3ZRW3UnvOr+Zemph0YbQEiA2NS5yi1iRIiP5aXsToSsby6Kt51f2FZRFVo9lgdVbqDEQE+gYYDYoVX8L/C9yK4IJ863AOzY9EeHVS4qemczJwasolfKkmrhrIR9vajZoYNiIjLpjHj8sHJuIcSzyk9juiNoN+kyNEX391W1cKFdp2nQ2rpCQpjCoMRVHu2cJMjBj8HwL3EXrbMTpN1uReAO6smyORUp0iBDufj/+3JQp0pnqWuSZ3www/Wvy1a0VmbSKzkVhFvFEICJL/hNCZ+JffroA47kgAqCLGD984pwO/KhulZ2xYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vOpCmfrQ6Ssls9FWPWQE0CnV8KyUWRoy2QthAaCISE=;
 b=d85VflJv/J1lpcrRk7helJGQZF87ZTdiBeBMFz+YfUgU6pTsyN+IJ6ncuaUSIWx/jCFHF+qc02UpTNciovvomfAGDB83xEdIsalLlfkIRIajL+rf30E7pCnaeegPt3qKZSCz9OcqjEAugi5M8G4/wVMdjKqoQ4Qg+shXYdM22GM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 24 Oct 2025 15:24:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 for-4.21 2/9] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
Message-ID: <aPt-B5R-FwJpQbZR@Mac.lan>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
 <545d98e0-755d-471b-84c5-54f129a5aece@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <545d98e0-755d-471b-84c5-54f129a5aece@suse.com>
X-ClientProxiedBy: MA4P292CA0003.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::15) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CO1PR03MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5b1a7f-4626-4b01-3bd4-08de1300a76b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjVLWmtXUDA3TjUyK25TRWNRMGU2NHlzVmJsUkQ3ZGYxQXpmTldMUDhON0VB?=
 =?utf-8?B?b2krY2NhVDFqMkhkak9TUk1naC9sbElhZkh4TFU4NVhuSWRsUCs2cDgyVVEz?=
 =?utf-8?B?RFUvdTVCTXVOaFpkc1ZTTmowd3RrSkF5Tzh5YVNLSnlMZC91M2RDcUU4c2Q2?=
 =?utf-8?B?ZmhPRTByWEdIVGc2SUwrZjRIWlRPNVBmQUpTTzdUeFpmNGZkZmVNMGtsOEpF?=
 =?utf-8?B?MWdSVXZDTXlZVHNjbHk3WnVDOExoQXVqZ0tuQmJHeXJkZFQ2S1NRYTc0WVEr?=
 =?utf-8?B?RjZrR2ZjTnpyclpwOUxFaW1Ua2loYTVtdEw5TGp6MWVWVVNMNm10N1diekZs?=
 =?utf-8?B?cW9oZnZ6ekVaTlVuQUpyaUdmNzM3WGxCQTgwbkFhSUpDWU9WU3hHc0RRUkxX?=
 =?utf-8?B?VE9KcVVaUjBJaklac0F2c3NUVUJZODlXclJ5N3pxWXVsOTBzUi9lbllBMDZh?=
 =?utf-8?B?S3gyTzFRdUQzTjV3R0xYeU9jd2lnVXZpTmlHRUh1NUtCdzVoUVJmVUNDYjdZ?=
 =?utf-8?B?VnprM29aVUxUNjMzYTdTT3R2TWM1SEhIQXE0cTlHSWRLY3ZlN3NJbVAvR2VJ?=
 =?utf-8?B?M252QmRORVhLREdTMkpicFpQYmVZR2h1dG5BR0lidzlwV0gyVXNQMzE2NVh6?=
 =?utf-8?B?dHQ0RDBCcnFQTXhnMjBSRGZSQkd5eE82Qmg3SW9nOW9aMUJqTnh5Zk1PWk5I?=
 =?utf-8?B?c3pNMlBrcHc5Q2xRV0hKaVRqL0M4THBOa1JXL29LSTVQSDFaSkMyemlpY3RG?=
 =?utf-8?B?c01EeitTVVB5eEVCOURkYzdIOVFEWUlvbkRvUmpsZFZRRWc3YjJ3L084S01l?=
 =?utf-8?B?U0xPVWhOclI4bjNDeUwxVDhpaXg4K1N0c2dtSmdYMndvSTl6S3MreDdIUjhn?=
 =?utf-8?B?VnZGQU1jSmpFaTg2RkIwV3RHVjlKL2FOak9XWm5qZCtONmp1amhaZGJIOTB6?=
 =?utf-8?B?dUJiQzVLWWtSdUZNRW1DZUgrSDhWVTR3QXR2TkFyQ2JTcjJEeVhyS0JKeTZE?=
 =?utf-8?B?NHNQK3hVSmZtaU81TDFCMG1NeFVCWHJTZVpXK05DSzNLSDMvRVZ0R1lLYWJE?=
 =?utf-8?B?VnNGZUtGR1dUVlZVTlpWbnQ1ZUpsUDljVTJEN2RRVGFKVkdkM01vaHNHNC9Y?=
 =?utf-8?B?VTJkK3lOVmVhTnI0ZUcxNDJ0eURqQUl3ekk5cmVlVWVUOWNFMWhscXpXd0Rv?=
 =?utf-8?B?K1BMQmtrNmhnZ3plWWgzMklCRWRmbHNVeU5mcnEyOVFMY3dpeEdWNytzdHdT?=
 =?utf-8?B?MjhHUGt6cDZpZ01QL1BqV2ttaTV1dmVKakw3WXEvNlN3WmRBZCs4ckJCKzM1?=
 =?utf-8?B?N0RjNUJ1cGRKRUwwbC93Mmc1RVZYUGVjeG9rRHJvY1RBcWpuRE5kQldsN1Ix?=
 =?utf-8?B?YjhlWEJGTmhoTGZhY3pKeGxXei9Vc3VTaEJIMmhKWGNWeE9mQ3JsbHB4b0Zv?=
 =?utf-8?B?UE0yMDhzTDRmR0c2MERCL2pqWFRvU2xIRE9nRWVXRHdON012YU1sSjlUa3dD?=
 =?utf-8?B?K3A2L2tmWTVOSjA2QU9JRmhub2Q0OTN3YlVCQWI0V0cxVHVLS250dFdOVmRQ?=
 =?utf-8?B?TnVCMlBucDJONWhMNHJyR0RDNWF4MnJrclVQZEJwWXNEd3VGcDBQTjBqUmxC?=
 =?utf-8?B?UjI2bW05a3FRcDRrNnBVdDJSd292TzB4WUVlS3o1UEpHMlhTOXFHdk5UbjRR?=
 =?utf-8?B?VHplRjNIOGpsM2U5RkZyNUcwUDk0NmtSb0E4UjZMRVUyZHJMWUY0TkRvZVNl?=
 =?utf-8?B?d3N6QW1aWldKQVVObEJ5amxQYVV0V09NZ0JXenhkcld5Vy9lVU9sQjl3VEFa?=
 =?utf-8?B?WkYvbjVmaVBlbnplUzIxYU5tRlRjUE4reVpoeUtyTzg5RUs5WlRVYWJMWlNH?=
 =?utf-8?B?N3RoOWpQL3R4WkRMbkN5anZmaTluT2ZyYWRTWkpxWnBSaENRNU1pbGVGMDhG?=
 =?utf-8?B?VUJVTEVLbU5Wa1pFY3BlS0wwOEZ0bUZlcGRRQnozMEhoZG5HelR6UitPL3ZF?=
 =?utf-8?B?eHQ4NU9NTzdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWZtYjdDNDY5Q3Q3WVEvSXZ5alFmeFhGbU52RWJRR2cxbnZSWVNCM0pJSVZp?=
 =?utf-8?B?SVBZUGhrb2NSRkh1cGFWaW1xcGVwUzAzZ0VjajU0OGFUOUc3NmlLTjUzbENQ?=
 =?utf-8?B?YzAvd1BxT0xwbTEwRENRNWIyQ3VwUEcxUTBTV3lSLzA0WjdFTWR5azN1THow?=
 =?utf-8?B?bTM2T25ZY2oxK2dncG9KNHR3NFN0emxZOGJxKzlCbkhUMWVNZ0lhaUlPbEF1?=
 =?utf-8?B?d285R2t6a216R1A1OXlPSERxVGFrenE5UVM5TUNUajBpTTNXZEdYMlk3UXBi?=
 =?utf-8?B?ZUFJMFlsR3gzU2FTVDBoS2FKZjliNXpQRlR4MkZjQ1cwYkZmNk9SazQvQnR0?=
 =?utf-8?B?bk1GME9YcmJjcUVCYWR6V1pzU0Juc2FxWTBtamZjWFpUWk9nd3l0MWhtUjlh?=
 =?utf-8?B?ZFh3am9VK0NSWU0xc2x1bDlPc2xOMmdVRCt1RU9YdFFVYjdkUXZyL3VNa1E0?=
 =?utf-8?B?UGwzNzBZemtGKzVzbXpnNTFMLzdCQ2RSSllwMkdSOHI1YmZwNHU4NmN2QnlT?=
 =?utf-8?B?dlZ6dmxkaHc4MHZhRHc2bk1yQzV1NExRVjAzclFGN0NvczZJd24zbUgvbjZt?=
 =?utf-8?B?b1U2aHloSlloeEZJWStJdkI5S2U3THpoNGVWRVpwRUdEVjN6bG9VS1c1WVE3?=
 =?utf-8?B?R2duZzB6bmQ1U1d1d1lmTXhLOERJYWt3Q1NyQ2pHMDdEVTN5ZndoNmFrbERO?=
 =?utf-8?B?Nkl5eTFnRWZFamdSR3lIVFFmQWFZZzYzWlA1MXdwZzFqZUVDcm1uMG03Z1ZG?=
 =?utf-8?B?ejIrNUh2cTU1aXFHUmJabnRqakJlWUpuSXRYdEkxVEtZa2hWbm9kZ3VQZXQw?=
 =?utf-8?B?VU1DUWZRQmw0RnNlWTVINVBKOVVHa09pWGg2NVcrN2xhMGgwSzlWSk1nSjhU?=
 =?utf-8?B?alhHRWVoLzV1aSthbHcxUXdKNjhwL3FzT0V0LzJDWHUyOFI0VzRrUWI5Q0xx?=
 =?utf-8?B?c25OMHZyVTA4NEF4VWIvT1JIN0h2cEhvdmc2R0NFcVRCYjVPSFM5OXhRTTVD?=
 =?utf-8?B?c1oyNzFNeWV5b0dXTXREOFRER25kem9rT291WjJvRmN3Q1N5TVFiS0FCaUVS?=
 =?utf-8?B?VlNMajhiZG41U1lxWThrU3Q4TDZsMmN1bnhJY2psbnl6R3J6dVVHNTJMbzNp?=
 =?utf-8?B?MUZBSGFnSEtnZ3NrcjVTaW52TVNpQzdiQkZNd1ZFVHJ0bFhiRnV6elE1dWpX?=
 =?utf-8?B?Tm5EeStzSXNrMlZ6N3IrelIrMFlMd2RaVU9JYnkrYmcxMmsvMDVKc3NtL01T?=
 =?utf-8?B?ZzB2RXdIU1NrdndvZHg3MTNKSlhFdDEvbkd3RXFXaXlYRDNtV1JweTFYZTZl?=
 =?utf-8?B?RmpTQS93eTZwYmpzWGZXWVlOR1hydUU5cXNYcUZKdU5xYit3eTdpNTNqdDJo?=
 =?utf-8?B?OG9BZUlaemRtZWVxL3hMRXVZSjMxeWdobkhCVnBKNzVUc2VOdEpXR2daZ2Y1?=
 =?utf-8?B?VUU2bk9ESHdxbnpDdHpHUnJ5RzlSeEtqSTVPMTZwRHRCbEwraW0zOTF4NFBk?=
 =?utf-8?B?UlFqaHlPSTY1K3hMV2J6MlA2NE5JbWZjNEx6UnpCN3lHaVV0SnRybWlUekdy?=
 =?utf-8?B?RHUwMmV4eVN3aDBqazIxSW1KQlNmalFPVmFLLzFSbXV0T2xtOFRqM0Fhd0Vt?=
 =?utf-8?B?V3hXVlNqQ1ArbzYrVWxodnBHeTBzdVpkdFZ3WlZJeWZjdWd6NHlOa2dndGdF?=
 =?utf-8?B?TEtMT25Rc2tCYVlIUlBxc3QwOU0vUnlmV1haemU4MFd3UTM2ZFo5V09MSERJ?=
 =?utf-8?B?UkVGZ0VQL3E4VHlDZDdxWDd1VEd1MXpjK2tSTkFMbzFIWVQySlJrZlNuU3pF?=
 =?utf-8?B?QW9sc0o1STM1UTJaUjVMSVJJQlA4TDlDZ2hXdDMwVEI3Rk9scU94NU9Qd3pK?=
 =?utf-8?B?MjVjYjdtTDFHbkhEeW9oc1RieEI0V3ludjZLSkVpK3ZiNlh2bTMvK0s0aHJx?=
 =?utf-8?B?TCtpQ1VMQTRNOTNTQ0djTk9zbDU2cE9BVGhoUUFONGJxdmhSekxaa280SVM1?=
 =?utf-8?B?c1VUK2V2YXRFNjhvSGZvL2RPdXZJdXJwanh5TWxTZW5kTjdFUklmWm1rbU5t?=
 =?utf-8?B?ZzkxOFFtOHUwdkpoNndXV1A0eWdPWTRmY2drdWkzRCtGdlJiTFZKMVdVMkpq?=
 =?utf-8?Q?TdJXb1KY4v5dRmFId4RV3IhQ5?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5b1a7f-4626-4b01-3bd4-08de1300a76b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 13:24:27.3273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdlnry0qFK6LJTls07XZemMi5D1/JJpiuE7Tf5jpGeV8WEEX+sNAVclct33xTBIVTII2udUxZui7QcNW+kYHjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5923

On Thu, Oct 23, 2025 at 05:50:17PM +0200, Jan Beulich wrote:
> Using dynamically allocated / maintained vectors has several downsides:
> - possible nesting of IRQs due to the effects of IRQ migration,
> - reduction of vectors available for devices,
> - IRQs not moving as intended if there's shortage of vectors,
> - higher runtime overhead.
> 
> As the vector also doesn't need to be of any priority (first and foremost
> it really shouldn't be of higher or same priority as the timer IRQ, as
> that raises TIMER_SOFTIRQ anyway), simply use the lowest one above the
> legacy range. The vector needs reserving early, until it is known whether
> it actually is used. If it isn't, it's made available for general use.
> 
> With a fixed vector, less updating is now necessary in
> set_channel_irq_affinity(); in particular channels don't need transiently
> masking anymore, as the necessary update is now atomic. To fully leverage
> this, however, we want to stop using hpet_msi_set_affinity() there. With
> the transient masking dropped, we're no longer at risk of missing events.
> 
> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
                                    ^ space?

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I've got some comments below, but they shouldn't affect functionality.
I leave it up to you whether you think some of those might be
beneficial.

> ---
> This is an alternative proposal to
> https://lists.xen.org/archives/html/xen-devel/2014-03/msg00399.html.
> 
> Should we keep hpet_msi_set_affinity() at all? We'd better not have the
> generic IRQ subsystem play with our IRQs' affinities, and fixup_irqs()
> isn't relevant here. (If so, this likely would want to be a separate
> patch, though.)
> 
> The hpet_enable_channel() call could in principle be made (effectively)
> conditional, at the price of introducing a check in there. However, as
> much as eliminating the masking didn't help with the many excess (early)
> IRQs I'm observing on Intel hardware, doing so doesn't help either.
> 
> The Fixes: tag indicates where the problem got signficantly worse; in
> principle it was there already before (crashing at perhaps 6 or 7 levels
> of nested IRQs).
> ---
> v3: Switch to using vector 0x30, to unbreak AMD, including an adjustment
>     to AMD IOMMU intremap logic. Adjust condition around assertions in
>     set_channel_irq_affinity().
> v2: Re-work set_channel_irq_affinity() intensively. Re-base over the
>     dropping of another patch. Drop setup_vector_irq() change.
> 
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -9,17 +9,19 @@
>  #include <xen/timer.h>
>  #include <xen/smp.h>
>  #include <xen/softirq.h>
> +#include <xen/cpuidle.h>
>  #include <xen/irq.h>
>  #include <xen/numa.h>
>  #include <xen/param.h>
>  #include <xen/sched.h>
>  
>  #include <asm/apic.h>
> -#include <asm/fixmap.h>
>  #include <asm/div64.h>
> +#include <asm/fixmap.h>
> +#include <asm/genapic.h>
>  #include <asm/hpet.h>
> +#include <asm/irq-vectors.h>
>  #include <asm/msi.h>
> -#include <xen/cpuidle.h>
>  
>  #define MAX_DELTA_NS MILLISECS(10*1000)
>  #define MIN_DELTA_NS MICROSECS(20)
> @@ -251,10 +253,9 @@ static void cf_check hpet_interrupt_hand
>      ch->event_handler(ch);
>  }
>  
> -static void cf_check hpet_msi_unmask(struct irq_desc *desc)
> +static void hpet_enable_channel(struct hpet_event_channel *ch)
>  {
>      u32 cfg;
> -    struct hpet_event_channel *ch = desc->action->dev_id;
>  
>      cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
>      cfg |= HPET_TN_ENABLE;
> @@ -262,6 +263,11 @@ static void cf_check hpet_msi_unmask(str
>      ch->msi.msi_attrib.host_masked = 0;
>  }
>  
> +static void cf_check hpet_msi_unmask(struct irq_desc *desc)
> +{
> +    hpet_enable_channel(desc->action->dev_id);
> +}
> +
>  static void cf_check hpet_msi_mask(struct irq_desc *desc)
>  {
>      u32 cfg;
> @@ -303,15 +309,13 @@ static void cf_check hpet_msi_set_affini
>      struct hpet_event_channel *ch = desc->action->dev_id;
>      struct msi_msg msg = ch->msi.msg;
>  
> -    msg.dest32 = set_desc_affinity(desc, mask);
> -    if ( msg.dest32 == BAD_APICID )
> -        return;
> +    /* This really is only for dump_irqs(). */
> +    cpumask_copy(desc->arch.cpu_mask, mask);

To add some extra checks here for correctness, do you think it would
be helpful to add:

ASSERT(cpumask_weight(mask) == 1);
ASSERT(cpumask_intersects(mask, &cpu_online_mask));

Or that's too pedantic?

>  
> -    msg.data &= ~MSI_DATA_VECTOR_MASK;
> -    msg.data |= MSI_DATA_VECTOR(desc->arch.vector);
> +    msg.dest32 = cpu_mask_to_apicid(mask);
>      msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
>      msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
> -    if ( msg.data != ch->msi.msg.data || msg.dest32 != ch->msi.msg.dest32 )
> +    if ( msg.dest32 != ch->msi.msg.dest32 )
>          hpet_msi_write(ch, &msg);
>  }
>  
> @@ -324,7 +328,7 @@ static hw_irq_controller hpet_msi_type =
>      .shutdown   = hpet_msi_shutdown,
>      .enable	    = hpet_msi_unmask,
>      .disable    = hpet_msi_mask,
> -    .ack        = ack_nonmaskable_msi_irq,
> +    .ack        = irq_actor_none,
>      .end        = end_nonmaskable_irq,
>      .set_affinity   = hpet_msi_set_affinity,
>  };
> @@ -343,6 +347,12 @@ static int __init hpet_setup_msi_irq(str
>      u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
>      irq_desc_t *desc = irq_to_desc(ch->msi.irq);
>  
> +    clear_irq_vector(ch->msi.irq);
> +    ret = bind_irq_vector(ch->msi.irq, HPET_BROADCAST_VECTOR, &cpu_online_map);

By passing cpu_online_map here, it leads to _bind_irq_vector() doing:

cpumask_copy(desc->arch.cpu_mask, &cpu_online_map);

Which strictly speaking is wrong.  However this is just a cosmetic
issue until the irq is used for the first time, at which point it will
be assigned to a concrete CPU.

You could do:

cpumask_clear(desc->arch.cpu_mask);
cpumask_set_cpu(cpumask_any(&cpu_online_map), desc->arch.cpu_mask);

(Or equivalent)

To assign the interrupt to a concrete CPU and reflex it on the
cpu_mask after the bind_irq_vector() call, but I can live with it
being like this.  I have patches to adjust _bind_irq_vector() myself,
which I hope I will be able to post soon.

> +    if ( ret )
> +        return ret;
> +    cpumask_setall(desc->affinity);
> +
>      if ( iommu_intremap != iommu_intremap_off )
>      {
>          ch->msi.hpet_id = hpet_blockid;
> @@ -472,19 +482,50 @@ static struct hpet_event_channel *hpet_g
>  static void set_channel_irq_affinity(struct hpet_event_channel *ch)
>  {
>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
> +    struct msi_msg msg = ch->msi.msg;
>  
>      ASSERT(!local_irq_is_enabled());
>      spin_lock(&desc->lock);
> -    hpet_msi_mask(desc);
> -    hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
> -    hpet_msi_unmask(desc);
> +
> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
> +
> +    /*
> +     * Open-coding a reduced form of hpet_msi_set_affinity() here.  With the
> +     * actual update below (either of the IRTE or of [just] message address;
> +     * with interrupt remapping message address/data don't change) now being
> +     * atomic, we can avoid masking the IRQ around the update.  As a result
> +     * we're no longer at risk of missing IRQs (provided hpet_broadcast_enter()
> +     * keeps setting the new deadline only afterwards).
> +     */
> +    cpumask_copy(desc->arch.cpu_mask, cpumask_of(ch->cpu));
> +
>      spin_unlock(&desc->lock);
>  
> -    spin_unlock(&ch->lock);
> +    msg.dest32 = cpu_physical_id(ch->cpu);
> +    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
> +    msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
> +    if ( msg.dest32 != ch->msi.msg.dest32 )
> +    {
> +        ch->msi.msg = msg;
>  
> -    /* We may have missed an interrupt due to the temporary masking. */
> -    if ( ch->event_handler && ch->next_event < NOW() )
> -        ch->event_handler(ch);
> +        if ( iommu_intremap != iommu_intremap_off )
> +        {
> +            int rc = iommu_update_ire_from_msi(&ch->msi, &msg);
> +
> +            ASSERT(rc <= 0);
> +            if ( rc >= 0 )

I don't think the rc > 0 part of this check is meaningful, as any rc
value > 0 will trigger the ASSERT(rc <= 0) ahead of it.  The code
inside of the if block itself only contains ASSERTs, so it's only
relevant for debug=y builds that will also have the rc <= 0 ASSERT.

You could possibly use:

ASSERT(rc <= 0);
if ( !rc )
{
    ASSERT(...

And achieve the same result?

> +            {
> +                ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
> +                ASSERT(msg.address_lo ==
> +                       hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
> +            }
> +        }
> +        else
> +            hpet_write32(msg.address_lo, HPET_Tn_ROUTE(ch->idx) + 4);
> +    }
> +
> +    hpet_enable_channel(ch);
> +    spin_unlock(&ch->lock);
>  }
>  
>  static void hpet_attach_channel(unsigned int cpu,
> @@ -622,6 +663,12 @@ void __init hpet_broadcast_init(void)
>          hpet_events->flags = HPET_EVT_LEGACY;
>  }
>  
> +void __init hpet_broadcast_late_init(void)
> +{
> +    if ( !num_hpets_used )
> +        free_lopriority_vector(HPET_BROADCAST_VECTOR);
> +}
> +
>  void hpet_broadcast_resume(void)
>  {
>      u32 cfg;
> --- a/xen/arch/x86/include/asm/hpet.h
> +++ b/xen/arch/x86/include/asm/hpet.h
> @@ -90,6 +90,7 @@ void hpet_disable_legacy_replacement_mod
>   * rather than using the LAPIC timer. Used for Cx state entry.
>   */
>  void hpet_broadcast_init(void);
> +void hpet_broadcast_late_init(void);
>  void hpet_broadcast_resume(void);
>  void cf_check hpet_broadcast_enter(void);
>  void cf_check hpet_broadcast_exit(void);
> --- a/xen/arch/x86/include/asm/irq.h
> +++ b/xen/arch/x86/include/asm/irq.h
> @@ -116,6 +116,7 @@ void cf_check call_function_interrupt(vo
>  void cf_check irq_move_cleanup_interrupt(void);
>  
>  uint8_t alloc_hipriority_vector(void);
> +void free_lopriority_vector(uint8_t vector);
>  
>  void set_direct_apic_vector(uint8_t vector, void (*handler)(void));
>  void alloc_direct_apic_vector(uint8_t *vector, void (*handler)(void));
> --- a/xen/arch/x86/include/asm/irq-vectors.h
> +++ b/xen/arch/x86/include/asm/irq-vectors.h
> @@ -22,6 +22,9 @@
>  #define FIRST_LEGACY_VECTOR     FIRST_DYNAMIC_VECTOR
>  #define LAST_LEGACY_VECTOR      (FIRST_LEGACY_VECTOR + 0xf)
>  
> +/* HPET broadcast is statically allocated and wants to be low priority. */
> +#define HPET_BROADCAST_VECTOR   (LAST_LEGACY_VECTOR + 1)
> +
>  #ifdef CONFIG_PV32
>  #define HYPERCALL_VECTOR        0x82
>  #endif
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -468,6 +468,12 @@ int __init init_irq_data(void)
>            vector++ )
>          __set_bit(vector, used_vectors);
>  
> +    /*
> +     * Prevent the HPET broadcast vector from being used, until it is known
> +     * whether it's actually needed.
> +     */
> +    __set_bit(HPET_BROADCAST_VECTOR, used_vectors);
> +
>      return 0;
>  }
>  
> @@ -991,6 +997,13 @@ void alloc_direct_apic_vector(uint8_t *v
>      spin_unlock(&lock);
>  }
>  
> +/* This could free any vectors, but is needed only for low-prio ones. */
> +void __init free_lopriority_vector(uint8_t vector)
> +{
> +    ASSERT(vector < FIRST_HIPRIORITY_VECTOR);
> +    clear_bit(vector, used_vectors);
> +}

I'm undecided whether we want to have such helper.  This is all very
specific to the single use by the HPET vector, and hence might be best
to simply put the clear_bit() inside of hpet_broadcast_late_init()
itself.

I could see for example other callers wanting to use this also
requiring cleanup of the per cpu vector_irq arrays.  Given it's (so
far) very limited usage it might be clearer to open-code the
clear_bit().

> +
>  static void cf_check irq_ratelimit_timer_fn(void *data)
>  {
>      struct irq_desc *desc, *tmp;
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -2675,6 +2675,8 @@ static int __init cf_check disable_pit_i
>                 "Force enable with 'cpuidle'.\n");
>      }
>  
> +    hpet_broadcast_late_init();
> +
>      return 0;
>  }
>  __initcall(disable_pit_irq);
> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> @@ -551,6 +551,13 @@ int cf_check amd_iommu_msi_msg_update_ir
>          for ( i = 1; i < nr; ++i )
>              msi_desc[i].remap_index = msi_desc->remap_index + i;
>          msg->data = data;
> +        /*
> +         * While the low address bits don't matter, "canonicalize" the address
> +         * by zapping the bits that were transferred to the IRTE.  This way
> +         * callers can check for there actually needing to be an update to
> +         * wherever the address is put.
> +         */
> +        msg->address_lo &= ~(MSI_ADDR_DESTMODE_MASK | MSI_ADDR_DEST_ID_MASK);

You might want to mention this change on the commit message also, as
it could look unrelated to the rest of the code?

Thanks, Roger.

