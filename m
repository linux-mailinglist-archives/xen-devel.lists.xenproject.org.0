Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934D6750534
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562354.878999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXUb-00038P-VO; Wed, 12 Jul 2023 10:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562354.878999; Wed, 12 Jul 2023 10:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXUb-00035s-Rw; Wed, 12 Jul 2023 10:54:45 +0000
Received: by outflank-mailman (input) for mailman id 562354;
 Wed, 12 Jul 2023 10:54:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJXUa-00035i-E7
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:54:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81985f07-20a2-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 12:54:43 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB9512.eurprd04.prod.outlook.com (2603:10a6:20b:40f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 10:54:40 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 10:54:40 +0000
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
X-Inumbo-ID: 81985f07-20a2-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBQzmL9Oxs6JQp8vakUGT7YCY45604IEo59/WNLFFPWu4JeDbW8VPlPQCOgcfsKC9O++2/1RAfOR7kJgEnGdv+aO059alp53mPoEDQLt7EwJTHXkZ232+8BCVnN3rio4opm4f6CUlGiAXfRbJtjKMlll6Q6xpeS/Bpw+zEqDg4xtKffKgPz8eguZtOGfK3QJeueVSz2HGCPuOcBJFTnxrs4ocQo26pVPyy0grySG5F8j1JWJ1y68O8z6qx6Pmo5aaqcgOdZxDn4tapFUh/S1InJw3T/4odOVm8q5Gff5h5GNhRHvVeU5WALHRVbFi9dg6iqwiCgg/e3xYXlCgUTEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbsBwAXNEArg1hcD+/sfkojwEe80jWAnvwgMMeO3kyM=;
 b=Z9BoDSlBj5Ccst+2VWVHtRTsCY6+TG2uceYm2ctt3cjBd4r92d0h3T5mr/MKhtKui8TXavBOjESWJM8uTn8MvzEmRq1eAdRZ53KdXDmEszvlFKheGDVM7NEoX11LOlzZ2JPHfkSn3+yoQBG+Y/x7tIq0eTTgOqlx0YVEHoGvfO4boBF2GckkgYQl+I6ocE1voveY/EHpLJk4fPkUMBIEEN6P6co85Ux62lnI4Jvk080GAxhOU3wZs416kSEuHy+hpHoyxaU6q1N39ZLti4tuqHW8pQoeHHf3ClecUYRDb5347eYUg14UgxjtJ38SUSdrubC44olTyR3FTwYPEMZIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbsBwAXNEArg1hcD+/sfkojwEe80jWAnvwgMMeO3kyM=;
 b=xT3VDFBiCYNmAzLSDAdwJr0mFNgFN6F1/UJ+/eghPJGOsHeJOSgGF05OvdE6f6dhtVxYEW3qlWHSIrwTa4XdgrSLScOQclYb6oSeO/2MEMpmW/Pz6vKXkYK9k0NXaGEdOq0MMxr21N6jtXIa0jdSCk146WJpLH9LqEYliPsmld35GusEr1WCseWPKHY78+8sCisZ06bS8nRdFZun6sng6rJfy0EHTdbajiefhCR8A0+YEePNb8roGUj91NkfvwXlmnOog4zuM7IUN9higbaqsTL6rrFI++M5GBnUhz7+sxpzqHbQRMHc5G09vCW7rbFSzHdFE7Mfu/wy0zMcwGbsEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <95c2b8a0-068b-c789-eb52-df6ff858f1cb@suse.com>
Date: Wed, 12 Jul 2023 12:54:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3 10/15] x86/monitor: fix violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1689152719.git.gianluca.luparini@bugseng.com>
 <13ba23be1b7aba72bbae2cdec781eba9d7d4abd3.1689152719.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <13ba23be1b7aba72bbae2cdec781eba9d7d4abd3.1689152719.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::15) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f20c89-a462-4aa2-06ba-08db82c664a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9DlrMpJ/St9N/l0NNdnTj/pFk3wieO2LggdycBJRjvpueBTzs5JYrTItDXP6Qp0XGTkYcsrxPifOkQPVBCRFVKSM7jSUwcuVPeW9sUmAzoGAfhaI4pnXnE9SlrQZNBCSb643FJGCoCNAfH1RyqYGcygaYZvzSBfBDuM6rrI8oBdY8s9K0KMZAyWgx5HsUSbrXRu7oKdc80+MiuKzT+MoH7eXSuob8XcQ5z2L9s9z6FCm5NnpHt/zrTu29vaCLadGkuHx3beIjjqagv30dM1QIJ5774XdPZWcs7uDH3e0ux4U/ql/k/c2fxl7xWLVhNYCy0Yds51GHNSLJUIbLNplQsMEwyVyMlV7xpBnQx1IiCSRGbDcHLYIloMogWDOsEW8V/tRSpbYJKtZl9t0nzPKrGfiJBWzdmzlfHntoMvHqaH0wA1bpDZnbOQcSQKr5ymcG4tjY1PkxPUvTfnDzNFYd9cMDI5b6691RCXQqFurnVXDLesElL0H+foRLrdOJLpv9RR0RdWzBA84dRZR+jhhbnNBeufFHx7KEA7lyP15cylgMgjIWF4Kp3yzrIHaimGjBeCoX/hmrQ2EWwuLu4NVuNOu904v83B449dbW2CYva4LLsJJRcZjPvcg94T+V3X0v3PgE3boXnGcTJzeZJYImA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199021)(31686004)(6486002)(4744005)(36756003)(86362001)(2616005)(53546011)(2906002)(38100700002)(4326008)(66946007)(6916009)(31696002)(186003)(66556008)(66476007)(478600001)(54906003)(316002)(41300700001)(83380400001)(26005)(6506007)(7416002)(5660300002)(6512007)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzI2aGVRQjVWVEVsbDhFdTBtcDdTeWRQZjNHa2JMRzQvY0ZMYVU3RlhiSXR6?=
 =?utf-8?B?MkorQXFlak8ycHNmL1R0aXc5VlVuTWd1eVBJQ1RLN3hPaU0wWEtKbEREU0t0?=
 =?utf-8?B?UjcyZExtamFURnRzVUVZc3NyV3Z1YytUQ3NRdE4vRHNzL2R0ODJsMndPVVlj?=
 =?utf-8?B?ZmZtZS80OVBsbThCYlVtZFB2ZUlSTk92a0pmZ054b011SEdQVGtXb0Q3Ym55?=
 =?utf-8?B?M1R6OFJEb09WODl0UnY2VTExNUpYeWx5RHVDWkQwUC9uOXF1NnYxUEo1UHpN?=
 =?utf-8?B?UXBoRmJnUURSelY4ekhxT0kxMTFUaTFFWVcwZlVnZnIxVG9IRHN2TmNvVklR?=
 =?utf-8?B?bk02dTM2U1NIb3NocTR4SExJajYwRjQzd2VNdjVBcGRmY09veUZkV3ZTY1Vi?=
 =?utf-8?B?MGkrMmZFU0xnWHVrWGJEcE10OCtZeXJyWmVPOTR6Mzl1UGloMEE4WTRXK1pu?=
 =?utf-8?B?S3g2QURFbXdzT3JaOCsvLzRrQjErZXBXKytIbFZ6VEgrSmZVSUw4V29DTE1l?=
 =?utf-8?B?NWF4b0kvdUhlQURxYXJkclh5UE42VWNIaHlzem4xbXl1MURsNjFEejVqUUU5?=
 =?utf-8?B?WENsUitBMkZzZTQrOTBLR0N2NHNMditpOWJDSXNpN2Rmd1gxWmRVL1dObEdY?=
 =?utf-8?B?QlpYYU5CUksxc1hlSTFqM1kyT2x6TURPa25kUlNTQ3UvVjM0UGo3dVZIeDFC?=
 =?utf-8?B?N1FuNDFPQ2N1UGZOWUxQaFpnU3JLQU15VTRSODhld1AwNHFlWGZ2M2lsTUJK?=
 =?utf-8?B?Z0lQYjA4ZjFFOGZzT2FvclNYUHUwVUlOc1pBeGQ0b3VtOFl2T2pIanlxTWJ3?=
 =?utf-8?B?N01aSnc3ZmUvblZ3UXdBcDJYTzZKSHFOVkg2UU8yY0dhWUdIRHpibjhSUkgr?=
 =?utf-8?B?YlUyMGVUR1dVOUY1NW9GeTJMMTdvNW1QUjh6eFgwdEk4SUdzSHo4VVNpRDRn?=
 =?utf-8?B?L09vQndDSU5kY1ZjRjdkUDhRZXkvazRFR1plcW5ROWtxV3M5WjY0d05kM3Y4?=
 =?utf-8?B?UUVqZUd5cTRjQVVBQy9NT0JONFZtVmh5VUh4WmNRWFlGcHZpVmZ2SEdZbGRB?=
 =?utf-8?B?R0RET2FRWmlWYmQwQWpEQUFaYUZjLzliQmtlcVVIYjMzdmJaenAwYUVrNkxZ?=
 =?utf-8?B?MnNXTnRieFJBNmRibWIySWxrZUpySFFQMFJGcVZBWkNpUm5LTmxJU3NXa0NS?=
 =?utf-8?B?VFpxTDNldE5yeS9KYklYWXR4NzlMV09XTVNYKzdzNlhqa0w3ajE1Um9UZnFx?=
 =?utf-8?B?WTI0L0lQem9SZlFpazM0bkpRbWwxb1NSdlNUSVVMOXlLUWZqOUxQV2d3MXp5?=
 =?utf-8?B?WEdlTU9YWlNhQlVVa1cvY3NyNm1mREVEbFMybzMyN0pHdEVVUHo0WnNiVjlQ?=
 =?utf-8?B?VFFkQStnZnFHMHdBMzkxa1FYWHlnWkFDc2pROGtLVE9zcnhCaGJESlZBYWty?=
 =?utf-8?B?aFU5R1Rkb1lyQWJvYlpFMy9oN29xWWJzVXhIQy9SL2JOT2NmUEVFbWhRY2pY?=
 =?utf-8?B?TWN3NGdPTGM1MEo3eWwrbGlNUUkvejhqZUVuUk1qb2QvSXA3NmpYQnhiWG9v?=
 =?utf-8?B?NGZBU1ZJeUFUSG9BYW0ra1pLbjYwU2ZGeTBPS29Ib05kR29ONlk2a2liOEZs?=
 =?utf-8?B?S3IwbXBpRkRZbHRWUlJBd3VkZnRmYXlKWlJmUzdKMDZUQzRKcEZOV1ZlcjRM?=
 =?utf-8?B?ZStNdzlJTnVLM09scXhZaDdqRmcveDJsZmpFZkRHc0VxZXBYbGxDUlkwUThl?=
 =?utf-8?B?WjBUTC9sTzFQNlc3QS9wVGkvTFVZYWFYR0FZeWJKb2g3V2pKak9oTVZSMVBG?=
 =?utf-8?B?TzZWcWRoOXJrSEZZQUlNTndwRmdkeUZhZUZlOVBRbGFVQWtmZmkwb01wb0s0?=
 =?utf-8?B?R1JlVjJFR05XK2xZbk5XSGZiRHRBQ2l2N1ZIWmx5OEgwYXpCUlZKV2RvM2Ju?=
 =?utf-8?B?eVg0L283NWw0NTNBOUxUWk1SbytOMlQ4N3pXZytOcU1nMkxDaFVENVdjZFp5?=
 =?utf-8?B?WXhvaUttVVE0NW4yNWFyTm9KQlJqTFZCZ1I1OFdmRDFlUEtRQXJtb05zZ3Bt?=
 =?utf-8?B?RlVwZ3huNnpUVVhvclhhckJRYzVVam9FYmVSd1pFUnYySmEwempvR2l0Yzho?=
 =?utf-8?Q?Yq71qCikn8VFCwVY6ByXjhuYu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f20c89-a462-4aa2-06ba-08db82c664a9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:54:40.7821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YK4MPErlOPm6Y3npinPuHqj21Xi4EEICJk+p6OuRORwe95XbUrpb1YEGWAlmvdYXXeOdMko0qudXRCCdDKBvcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9512

On 12.07.2023 12:32, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Looks like you've lost Tamas'es ack here.

Jan

