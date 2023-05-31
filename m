Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D39A6718146
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 15:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541791.844904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4LkC-0007Ah-5m; Wed, 31 May 2023 13:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541791.844904; Wed, 31 May 2023 13:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4LkC-00075O-0r; Wed, 31 May 2023 13:20:04 +0000
Received: by outflank-mailman (input) for mailman id 541791;
 Wed, 31 May 2023 13:20:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VTAn=BU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4LkA-0006Ii-9M
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 13:20:02 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7e423fd-ffb5-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 15:19:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8971.eurprd04.prod.outlook.com (2603:10a6:20b:40a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 13:19:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 13:19:58 +0000
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
X-Inumbo-ID: d7e423fd-ffb5-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOEkwWIkl5LJlW2bZEPwYu2vTAAokFWLf+PRGCcrAKn+JOZJWy61zj/wYZQrGb733F3XMIuep1QDRbRNoqAMtUWz7fZIbO4IEIY+SnMlC45QttrQzGAih++4WEuaACj6/Fy8SI69Jbnif4F3NspdIR6RIF2OPgCmGoP6wJDIyMwOukrGM5rw8XVUSCmWdk/1ffb/K4wFeCC1zq9tcBYPuqJ3yDwJnEtF4okfhsMMx2uyosBdQBfJ3jc4piXZrRRCVtIKyDbTRol8o3OJa5zN8f2r5ekx23M5OtYyTi80Nij6Mu7R3stPoi2vteE+S3eoX9qU6qc4RCkDSCzfrIm7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSlSXBqwCEB3zRwV6lgVr1HsRYwYeKUKlwNXh+OiKo0=;
 b=Q4lBs4RuflhHm4j3SiyBPesSAzEjNnSwy46UwIfgY9+Buimzfvs1ZgxMg6oDcK/S3KtQBcGbKNuz+du30E8u+RHBXRyMsSZA9HSndOUSTC/2WctV1ozBemOkiDnCTJCgPeHhJNtMGytqd18VZGD20C2k1iiRO3GFPBFHY3cIDoWNLcUxQ4QNXUyKFVaw/nrHaRamDNOTHUsQpF2OXcM0D9Ft3JnlUSD17NkXjZgJ3VSEx3mc/cD2Th5Pow1Cl2r8V1KlJmkvE989KHtKUPUFJwM0pyY4SrLiV9rPNmjQzUEyAN980cuXLRHaQrTk6UJ3cXp0mRDhtYM1axxT1GjWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSlSXBqwCEB3zRwV6lgVr1HsRYwYeKUKlwNXh+OiKo0=;
 b=3ZWgdIa2O7AyQpZjhUhmOsrB7ajoP1LAQz8s96Qx0ptp00f1Z2BNyxFt2e9vEfiz1X+13MFJx9c6aSxEHRwfy72zO2dyMbIuS24Yt5H6Mf1dxlZQT3WjhUEp0G7CaqDJqC5eqcYfSTtS2rdvMmU7Fx95tTdhl3PIlK+pk+QTgt0CB2XeaR6RfZ+30Ly6oW1cGrXZJuUvLR95yBEsmHUPsX6NFsENif2vlEi30lk0LHUIJP704koHUbqpTcJBPcK65P4qhnyMknM/dtYuLtu0O4ExQ7WBcjxnZ/tBS/z4a3kuR5nFlpr3xMd+najfU2UebWqS8x+HAwMYtYVUZeyuIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <838c09e5-97ce-2d23-9d42-645a8925217d@suse.com>
Date: Wed, 31 May 2023 15:19:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH 2/2] vPCI: fix test harness build
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bb1bfe6c-eef6-5552-78e4-bdec8fd43561@suse.com>
In-Reply-To: <bb1bfe6c-eef6-5552-78e4-bdec8fd43561@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc676a5-8249-4eee-09e5-08db61d9bb34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tADcMHGOWYemyAYm9qA+36UnVk5no+j+qgGOKtTIzl6H6UOg8MbewgDmahQSm8F9/6M5uRoSpozSw/zLbHQCIHPN8AAdFhVVEruk4e9OQJd/ytqLdb8MVKH8rufgTBoP2ouf5IUIoNvrgTyBLVBkNjJ4+1GRKHqTwQjNkfDK5OU79/eUL5w2scqFtbpBJBMoBPTP/kIsEoPQdpSnXPctD/NcUzrYb7pxiUAaYiiCXm9aLBZ0Uzsvas+A/2Q/L43WTXnvZvKiFY88C9CNrecOZ9Hr+NJ+/O4m17Tih16lyF66O71ZZLTStgVo/axYNvViRkdM9RuDSGZB6u+VwjhIFPqyp//RmPe90f81SPo+vWfO//8WW1HioMEqYk4ufWyy1DqnGFj7bLb0VuRnQxZhoP/DSKLbEYYYfikXAnI4Ir0J3CZ89GDBy0oYbVqpIF1eYcETlU9LWKnt9v7+E6kXOYMCV5OUYuMRkhb9SOiWGqhaIHkp5tRAiM8zxY7LqG5Hk34NZLU0FRZCOo8GVXbtqPx8/0fv4ZCKBAZ5WPPvozIOe/q7gKXb7ayFAdgx3VKtUIJp4lqqbxzcZCLfRRzsOZClt00HeXky/PE18bHtxkUXAFzpW657DKkSsRUw7O6UAlttIW7M+bg+jXqyjOcmMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(8936002)(4744005)(8676002)(2906002)(2616005)(5660300002)(41300700001)(38100700002)(6506007)(26005)(66476007)(6512007)(36756003)(316002)(186003)(66946007)(6916009)(66556008)(4326008)(31696002)(31686004)(86362001)(83380400001)(54906003)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVpxT01NcVUyQjhBNC9tZW9ZK2wrS3pKTnErU1JoUjE5RXR4WURMdmxYYUk3?=
 =?utf-8?B?Q01iMjF0RzE1UGh2RzRkdkFNYUdDdnZnOTNiZlU3SnlzTVNNNzgyK0dYZGhG?=
 =?utf-8?B?RG54WDY2eXY5Q2tMVWN2Y0ZBaEZJMTVFZmZEZml5WU10K0tIZ21aYVh4Q1BF?=
 =?utf-8?B?M2pZWkQ3TkdCampGeE1BbE5rbFkxNU9ieXVRTHh1Z05XcythTCtuRjJyRUJa?=
 =?utf-8?B?QW1wdUhQNy9RbnFUQ2RFdG41cmU1OHZrUDQ5eSsyaEZBbU1YRm9uQnlsQ2Yz?=
 =?utf-8?B?dXdDZ0poNHFoYW51aHJ3UkR2Z3A3RlZoMExmTlV6UWVHN2ZFdm5KK1BabnQ2?=
 =?utf-8?B?TTNPMmg0Mk9GZFdBSnBUQlgvL2N4QXZDVVdTeGg3YzFicVJudUpFeFpMRXRx?=
 =?utf-8?B?dFVkcDVBYjAvM3I0c2JlY0dSSmtiMlNtQkdZckx6cmRkTlRtclhMQWYxVmFw?=
 =?utf-8?B?TDl0VUdiSGZNZHV2YWFQc1V3Q3BiejFuL2R4eVJpZndJMEVVWnBQK2tIc3ZO?=
 =?utf-8?B?VytVUWRtTThaZjJ1Zm1LdGI0ak05NHl1dXhwT0UxWVdVZkhCN3g5Z1hQUUY4?=
 =?utf-8?B?cFA2NVZobXRpK2ZFZkFqU01sb3Q2cWx0djZiQkUvYU1acW1SZGZPREpBNE4v?=
 =?utf-8?B?VEkvZVJUUnU5QmxpcWRMdFJ1SEY5aW45bFY3YXVGQVByV0dMWEVLL1k0dzk3?=
 =?utf-8?B?Y3BOcEpJWnJnQ3UyTHZtVjNVNWNyRU5xZzFzZmsrWmFWazFsaXF3b2lwUU8y?=
 =?utf-8?B?K3R1cldMTUt6SDZMRE80K3hpaFpPaHc2ZkI2cDk1dUNFaDZrVUh1eG43VnlN?=
 =?utf-8?B?VS93RzFTZW1tRXg1NTIxNHdRKytWWTh6UllJaWlXMGFMQ203NUJsTzZEaXVp?=
 =?utf-8?B?a0M0WU4yVU9vWE1OUC9kZXJJQzJRVWJEcS9Ya3BlU0QrOHd2L0hnSGZaZFRM?=
 =?utf-8?B?RC9rVzc0Ny9scXhBQVdzNld0UGNhOUR2NFBtVkxpbkZBME1sR01OZ3JDeHRk?=
 =?utf-8?B?Zmg4aTZvQ2x1WXZxd3A0YVVqaGptbXkyT05JWm1hSGhGZkJyemdCc2h1SUtY?=
 =?utf-8?B?US92NU9vRmF5SlZIZGw3ZmZaZGxwWGt6Si9Sam9BVUlGa1Zyck9jNjhiTTVs?=
 =?utf-8?B?dVd3UE9LbVM2MnRIUEpKZjh4V0V6b0JBQkwrM3N0RGFETmJxYVdSbHNCZTB3?=
 =?utf-8?B?UFV0TUtWOG9ybVY1MSsrb1M3eDk5WlErazZ2YXJYbmtTV1NjTnRpaXFUTloz?=
 =?utf-8?B?Vi9UME1ZNFQyeU9wejRLTEVsOFdUZkNRRjBGdzJIVEMrTkRjcldvbGFBOVNT?=
 =?utf-8?B?OVJOTTBFQWphbnZHeGxkd2lqNjRsajV1RnBmdU54Y3F5WmJjdk5BVzZKbFpF?=
 =?utf-8?B?bmdFblJ0RGFhUXI0dGR3V0p2akl0ak9TZUZaTjNUYUtqMVAwOUJRVVFOSW5t?=
 =?utf-8?B?RTJyQStOa1pvajZISjZuMUhBNGFsTkFuZk5BTUFtWUtiTEY2Y25jK3hkRHRW?=
 =?utf-8?B?aEprYkxITGpyWmtKRGppQStEaWkwVytlSXlEWk85blI0eXBFS1UxK2lVeU4v?=
 =?utf-8?B?bVpYQ2hDNHZMZXRYdU5RYkFDeW5TbHlqaVhUOWQwaW5Oek1WRCtyS1JHWG9C?=
 =?utf-8?B?ckdWdVZORUlBUnpCSWNwRThuNUhOdlVGVUpnWUV4WXg2eHdEMEo2VmRNYW5r?=
 =?utf-8?B?WStRL3VPWmhwMXQ2b0lvY3UzV3Z3T2ZZbFVZRExzVEg2SHFWZW9KajFsRUZo?=
 =?utf-8?B?Rm1NQ2lNRFZYWWNFVm1xaXNKV20xUStNa0VVS1RNQ3M0NFZKNjUxR2tmZEw5?=
 =?utf-8?B?UytzZmE0NWRtd1VhaHFRcDNNN2x3T081L3ZVaU56Y2gvQzdJQTZIV2l3WUhI?=
 =?utf-8?B?M0dRODZuU2RUYXpENUpMM01nQmJFeTM2N2F3QXRqQnBCdVU5aDdjNncrZ3JL?=
 =?utf-8?B?QTNIbnJaREtOenR6R1FrUUhpT3pJQmEvQTBYUk9ud1BmT1VPR21TcHZta1Ns?=
 =?utf-8?B?UldwUHdMRVdKRnpMUkRXa0RmYmZuQm9mQVBFWEdGSFhIVWtFekxoYmcrcGw5?=
 =?utf-8?B?Z3ZhVjVJYXNjL1JrZjU3dlJjSGxuUWlZcVdlNFhVVGllbTUrRjJ6V3dydlNM?=
 =?utf-8?Q?y0KWI305Wq4jDGfx4EJ9i84hC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc676a5-8249-4eee-09e5-08db61d9bb34
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 13:19:58.1505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aO9EdjvQqEZcu5DU2u0xbTlLnY45gMg7jlQ+/4hm0y/4XMn4+HyIvHma6CGOgWehG4GtLm4tmvxnq8WWv3lDwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8971

The earlier commit introduced two uses of is_hardware_domain().

Fixes: 465217b0f872 ("vPCI: account for hidden devices")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -82,6 +82,8 @@ typedef union {
 
 #define __hwdom_init
 
+#define is_hardware_domain(d) ((void)(d), false)
+
 #define has_vpci(d) true
 
 #define xzalloc(type) ((type *)calloc(1, sizeof(type)))


