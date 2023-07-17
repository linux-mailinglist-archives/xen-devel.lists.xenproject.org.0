Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D5755D66
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564267.881707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIy5-00055d-NC; Mon, 17 Jul 2023 07:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564267.881707; Mon, 17 Jul 2023 07:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIy5-00052r-Jc; Mon, 17 Jul 2023 07:48:29 +0000
Received: by outflank-mailman (input) for mailman id 564267;
 Mon, 17 Jul 2023 07:48:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLIy4-00052j-6e
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:48:28 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 505cf9d5-2476-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 09:48:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8023.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 07:48:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 07:48:24 +0000
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
X-Inumbo-ID: 505cf9d5-2476-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4ok7YQGmijekyrTknmwQGv3SDEFVwZE5yFN+kgivY2HSI/hyZFRhj1t0sFjWy1v8f2EatJFCO4m3guS0102YE4zeEZC9jVppe+20lzOqBu6tIYA0tQHiQc2Zkiy0SExORY0XvmUwG8Y0/Pwqpa5pc3AyxS2BseYKklNt6GkLKT7pkLSTJqUGmm1Yn0FRzJjjk7Pn1rXkFy5oqnt3phgNxCk3ypUC8VXimrJCJIU1wlXoqQ80gD4R80V8hRWPR2IWnarjL2vQug9HzkfXFsI2Fw4C7ZSnhfIlRY5TDSBSZ7Hj9DVbnXQMOqgpHDArfS733tRqOHeIESUjvGByLfswg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xg69FafxRLOJ8/ki9CLiJ4p465ydScSmvXIGkVIfpwY=;
 b=TVJ0y/JabLuNAxcyTWOtR0YdhRoPgqYSJqcR7v5yuqipkXa3XzwmNkUJgnY6fNLqXSOkuZGpn/mfjpyqd+xBv/3SSosNgF9bZx+rWtwvgcY41K8dkCaeKYU3nVulOC7o8Cjq+lnC9nMxYUrUsa6gvhCh4E6qmuviKGE5lMwFNZlc9rLp6HYwG42lbQ/ka2+3P+aZ3ehayz/mlCbn/gNdBVDgdqLYt3lASKDIQPHp8wn/EgkwKRm4qeqHAfqjBl00j6LQeOX7TxW1rJ7Odr2tYCGKebddRI8EXxjMq63Iw1pZxE2mVRx9wZE9ryYXvrnIj5RD8Ni2QPbtw92YzdrRwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xg69FafxRLOJ8/ki9CLiJ4p465ydScSmvXIGkVIfpwY=;
 b=mCVoIVS7cV8Azn6Pd09SGfR84HIcbsjvh38OtLG1Wt5NhpGkP5WdaEuIWOr72QM1kFrHEBztP5Q0j4g+dYSK2bck0vtos6aR23goUQF/zZb55aT85wc6hZbTy47crBFTHFcKjOl1vSXeRjuP67hZqGEHIPClcuoXArmwPcYX3h0Tw6vgNZ8H99WAKzM3OmKrpIId/dFfRkLR2uwMp7W/PqW4SQYlbVOqtA4mH5YOuuqJFH59L0HDwd3my4NFBbQDzrWPuZJwdDudvliEznzhsXuYgfRPCwI8KyXOuTmpASqAx9m0Ofi1LRnGJs3LeSXLlhgGB0ssxGVGWlTKiXAeWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45ea80d7-4500-4c55-f82b-77338b3738d3@suse.com>
Date: Mon, 17 Jul 2023 09:48:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: XenSummit: Empty per-arch files
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <2aabfb63-1a2f-bb02-488a-ea79136bc6c0@citrix.com>
 <6af948f7-562d-65cc-ca1e-30bc8db90d02@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6af948f7-562d-65cc-ca1e-30bc8db90d02@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 05af2569-df7f-4e60-e443-08db869a332e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SOi57OVfArQCKPwlxOcX3iCc3kyVISXShjLQf3J+BQnD5EdwXlFDh0BLrSE9/vY4rh4CeQ9BrLGATHGnJ9kU4Dhh7zmFm0bfkZ7Vizv47LAO8I+njZ2Kjpf2e6LpqXBRC2glbErciwyiz/88i+RCgBExy1M79aZYzMhJfMfbT3S/b6CPAvgXpAv6uNb/YLEP3UGrO/Vn7A0EhmIUYy02KSFWWJTkk60ki1P3LwEeYRaYp2Sb5S3hwNZUSMpqMxvqkg2c+jPnr4KWv+5AgO94E6/vwyRKorw8nVka2GzgVXa2HY/Wk3xvFGSiPiyjme3ahfcN9dD7Tj3GiJsgqVGvv3VXvKqZjsehK1V9gMo/jgqm3+EGX/g+21IuFTIqW0B0I9GZx6o5Lkt1mBt+hvwRsdV+X4ncfkBFf+ARnyKaVtHITvRUDCwawzZSSS/aPu7rmSmK9pNLDeJDWKZGLqg2z/Hvtemo4PiS3VPQPBIHWT9xvNXxlzkUSZ8CEPKvngv/YzlomP0J9dfHg0S4HwAhHpOzfvM9Duy0lhMou4DWBVyoLYXQDEAMvI1NbenJw2kg2BaIeRaWBeQcUFBNuojIvbsvhTnHDlHcDQu89IeCXfsfBEexIxMa4MNH5Q+FOAhk9i+UMhvONxRyRYITA5ShFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199021)(6486002)(478600001)(54906003)(186003)(6506007)(53546011)(26005)(6512007)(2906002)(316002)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(5660300002)(7416002)(8936002)(8676002)(38100700002)(86362001)(31696002)(36756003)(2616005)(83380400001)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkpuZkREUGViUGl6V1hDVDg0dlJwaWcyWWVYRE5nMXNxTGE1UjdKS0IwM3Zr?=
 =?utf-8?B?MUhiZXl5VFhZaHIzTElZcmwxOWFZa2xuRUlUT3VRVy81ZXpLNlh3WmdtMzdh?=
 =?utf-8?B?NDRpbCtXTndTc2dNVkg0T0t2S1VwcmNLdFRxVHFDUk5DTFlNTjZCWkVzZXJO?=
 =?utf-8?B?Wko5SnBmOW1iRERvZyszNmFqZkYzOFhlUlpyWkdLS1pZcldZYjY2cFRlVisr?=
 =?utf-8?B?b3ZacngwZU9VQThrL21JL0F0d3pDcC9mWVJTNVM0UTZibkdPdnhNc2tKSnFV?=
 =?utf-8?B?dzduOW1lcHUyUGI1UHpNNTZUei9vdFF0S1JRNzBMOStYclR2bVE2ZVhhYTVP?=
 =?utf-8?B?ZU9sK3dDNFpZMVlZSXNIQW9USm4ySUpMOUZ3VHgwWjZkTWNCbU5kTkxrclFI?=
 =?utf-8?B?QUxKTVhqaGxxc1NwY0psSkU1WGlxQ1B3eGhTVUR5MFVKeHozNTJVaGdTQXYv?=
 =?utf-8?B?eDVUQkgwdTFySGVPYTE4dGRGcXZTMEhMMCtrelEwU3ZCRTFuNktUK1FjYjg2?=
 =?utf-8?B?ZHJET29BS21lT0pCbDdRV21oNTl5eEhPSGVUUmlkY0d1T29RRnZreHM3eUdl?=
 =?utf-8?B?M3kwcE42bk9panB5b1JyWlpiVHpKV1BEUjRqTktLa3B2N1VaVDVSaC9LdkJ3?=
 =?utf-8?B?Mm5PcUFseHZBbWJhblpnSHFkeWtVbno1QmZTM1R4azUrRTlXYjU4TWFUT0Rv?=
 =?utf-8?B?T3UzTVgvWTRQaEJtd0taMm9oWVlxeUVvTzA2U2VoWUE3bk5JelJyWHJYR0U0?=
 =?utf-8?B?VmE4bERxL25YODZScjNvZXpBUkVmNlNabUV4bW5ZbWVKYTVPbCt0RDFaTHJh?=
 =?utf-8?B?YmU2aU5MT3ZFYkc0Wmp5VWdQVUdGczloUE4vQkx1Y1U0VE1saVBBNTFPWUkr?=
 =?utf-8?B?NnpkM0p4N0Y0L3NJdkhjSWE5ay8xZ3RzOVc3Vzl2RjNxRnJiRVBNbkUyY3Nj?=
 =?utf-8?B?Ym9ZeXl5K1VRdTVYcWFEckFvVVZmcHFyaDM1R1dqRE5lcldiT3NLbW1PdlEy?=
 =?utf-8?B?Z2pVS1hpc0ZXdUplZG5QdUt3SDVManZObmVyb01SelIrQ1lBYUI0eXNlSUZC?=
 =?utf-8?B?WjA0V1M2YTVENXZXdUNSUTExeE1ZTk5ZQzNHVlQ3MmpTeEYwVlNZemNxRzRN?=
 =?utf-8?B?SmluY1o1cFVLS1Y1SE5peHNZdTVUclFkME14VTJJa3hmTUVqVElmM1BrRGZu?=
 =?utf-8?B?cEhGOTJkenVXSXhoVnhsTGJTT2RrQ052Rkw4bFM5Y3YvdDE4WTdrWFBWN2w3?=
 =?utf-8?B?RXhEekowMnYwekZCWjBCSHBZdlhxb3d6R0hJeXdzemwyelhxYW9oVk5VWlMw?=
 =?utf-8?B?WW1HVFZzUkJDRDBxc0tLUm5VSjM1S3F2V3dTdVg4bXdHbjZYS3RGeWZQS1g0?=
 =?utf-8?B?V056by91RnpvT2xjRGxwRXBMZVV4UCtDcndaMkphRlBnd1prSzcwWmIxWTBp?=
 =?utf-8?B?LzJueUtuUHFZczZrSzc1M1FrLzNhTTUrZ0Z1R3piZkVKeVA1eFVxS09kUnk1?=
 =?utf-8?B?eHE5WkFEYWpOZUx4NTlaam1WelpZd2t1ZzNMOUFwVXcra2VocmFPVEsxM1Z6?=
 =?utf-8?B?RkExTVM3WTQvZENjdktCbXBWTjJqeVZ2U0laVXpWelhTN3pSRmhYSVhwRnpi?=
 =?utf-8?B?TVVGSlNXL2c1dHQ5RHlDSWpLU1pKOXpwK2laN2xSOFJ2ZTZnVlJNTkZoWW0y?=
 =?utf-8?B?ZXVTcGE5bmdUbWZQSndXSUt4dGdlMk1vWFJoeXh6TGhvK1Y3dW1WYms0OW1u?=
 =?utf-8?B?dGRXWFhIc0RSdk5DQ2tNNGhDVWNlVnBnOUZRaGFqdVY0bVE3WlhnSHdJaE15?=
 =?utf-8?B?aUJJaWFMRldkTm51WVQwZi9uU2pKM2ZyR1RyaG1sUDI4eWM5N3JaSjd0NXRN?=
 =?utf-8?B?T2tmU1FoODRadHlkbzk5L002b3JUd1NTbWZDSlVsNGU1anpYNHBRZ1JaL0pq?=
 =?utf-8?B?Y0RMNkpMaUxNZlg1QjJjQ2lTS01sTDBzMjF0OG5TbmFhV0JRcWNKSFhsdkwr?=
 =?utf-8?B?cU12VzNuNnB3dzJRRjE0ZGJqYmdPSjRjNGgvMEhFUVNtdjkyWVNoa2cvdWUy?=
 =?utf-8?B?Ym9BVWFmQm0xNWgvKzBRR3pkMWdpdlFCQ3VSL2drTTBtTlhsYmFjdERuWUFK?=
 =?utf-8?Q?24LaSgOwIRCNwST9obxF4CqzU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05af2569-df7f-4e60-e443-08db869a332e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 07:48:24.5962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loOZE1OF6LYke4myuaBpHubmBIPExGfEaXvNMDHA+nHoHdg6upBjEb/jRyDpnauJPJW2hMQy1d7TFkbSZ7Ff3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8023

On 14.07.2023 22:52, Shawn Anastasio wrote:
> On 6/28/23 6:32 AM, Andrew Cooper wrote:
>> Hello,
> 
> Hi Andrew,
> 
>> This wasn't a formal discussion point at XenSummit, but Oleksii pointed
>> out that it was still a problem, hence this thread.
>>
>> As we take on more architectures, it becomes more and more important for
>> things to be handled in a mostly-common way.  With that comes quite a
>> lot of <xen/foo.h> including <asm/foo.h>, and the arch one being a stub
>> in simple cases.
>>
>> It would be nice to get rid of the stub files; they're irritating to
>> deal with, both when refactoring and simply for the file bloat they create.
> 
> This is definitely something that would be great to see from the Power
> side of things, especially as we're getting to the point where we'd like
> to start dropping the build overrides in arch.mk and building the rest
> of xen/common/.
> 
> As we get to that point, I was wonder if upstream would be fine with
> submission of patches that add stub files for ppc in the interim, to be
> removed later when this proposal is finalized and a solution is decided
> upon. It'd obviously be best to avoid too much duplication of effort,
> but at the same time we'd like to avoid getting blocked on progressing.

I see no reason why for the time being you shouldn't add stub files; you
clearly shouldn't be forced to wait.

Jan

