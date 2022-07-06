Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B256824B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 11:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361995.591821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90uV-0003cc-Gl; Wed, 06 Jul 2022 09:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361995.591821; Wed, 06 Jul 2022 09:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o90uV-0003aK-Cj; Wed, 06 Jul 2022 09:01:27 +0000
Received: by outflank-mailman (input) for mailman id 361995;
 Wed, 06 Jul 2022 09:01:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o90uT-0003aE-TC
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 09:01:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60060.outbound.protection.outlook.com [40.107.6.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 366d686b-fd0a-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 11:01:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3474.eurprd04.prod.outlook.com (2603:10a6:208:1e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 09:01:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 09:01:23 +0000
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
X-Inumbo-ID: 366d686b-fd0a-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ya7rxddcD8AndSZQThk3MXldrwA9DOJ3u51CZSY4Tkb8VzIsJXk9tIHbys2fdbAK+HsCJWtzFHQgla8wSiCQZ320iKTqxGJdsQDCbe98N7HS2wLiva4C/NZY3qpy0FqCdZFNdH0auCVIbac0IGLY2eZ6QCaGQZD2NcrG3lIzGMoVJEdiRT5ns39vZCrElF6jfm/wwFOUTxbPMm60YAt+V2bO973DizkcDCQLhrZ+vWxJLqtj1IN9nzvy22kSyRnXuJPKsxHZW/9O81Xr2/T+huwBDwFapnLKN1Os3mCWdo5l5l8wrkgj6TnqsJtkqt3Q83gQSWUO91amrh1zRu0jJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fkv2XVwsr90t6HhOorncs2A8E2c5BJgYWjXcZMWvKBA=;
 b=iXlqA5cwMZ65iFEQeuAQZWmtezdrgDCivkre01ZnijhtbyjFtU31m7mXhFF67a6k5LNTlXss9JzAybbzkcWNKE1rhnDUWbfhvBVW6+F/htMjIvQegiAPF6iz2z4aREkaa9cpE6oI/QAZRiDoL+49FNnoTr+QdUDouxzmH4fyA7AjLI/3RFP29Hjw2fMYLCf+JV8mv6jcJ4iIJD3woBBnAnArc64+VEiao3Atdx9hS2VPyXDJVGWM84ESXuNhHls8q7GjBGUdtfXAeZjUx0ZNaEHguftyUwrpb55a/uuDtXEi07mnOo/XHFaNLaS69IIn+GNH6Xy3w0XQlwZrVj+cmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fkv2XVwsr90t6HhOorncs2A8E2c5BJgYWjXcZMWvKBA=;
 b=O0gQ4SDCN4vgUmyVRWiu6w6v431b8vSsqzhgtKQK9XFBRC74O7cDlffyrd36LpCzy14cigP8Axh+JL1kca9mobtXyZ6ktpO7TI2SNWCib4t89iO0UriHuXgP3FAr4rlIuxY3IrJewJ5v0ZIdsCIr9g0soI9ne8YSoBDEYTtZ8WRqacwD4SOKUHYVjGjTb8I9T40NOyKm3zDbn0EV9dJinqStycYDY7GMAl7BdRWJbnq2OM8xnNb3Ib5ayXPBgfvocL5urDjynivEU6YVqmuDc1pZwC91b25Ssu/U62UBOKzvAGZzMMdR35cGtn/jDvVQHkZvJjPfXYMZMvn7TYfnxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46944677-13fd-829f-1b73-13720bf2956e@suse.com>
Date: Wed, 6 Jul 2022 11:01:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 0/4] Introducing a common representation of boot info
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: "scott.davis@starlab.io" <scott.davis@starlab.io>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <AS8PR08MB79910EC13ABF2C848AF9850092809@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB79910EC13ABF2C848AF9850092809@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dafe755-4261-4d04-8584-08da5f2e19ef
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3474:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MULdZ3vaTrQR3gwlWVjFBE/LSKC4f1IM8L1cS1cCJ6OSTHgmm4vDSs5k8io5wgKdTcXf6BEj709MVBOZxLh19hV4PoFU6ayWQy8DKwGh9UVjGA9jKAn1bhPaFkewnPpXy9EarklUzoP8mAMpiQyZ1/ydelDgMvFs1MzgmxOFiXQ9dcts87uFLBYkTsDfel9ocwftBQWgDOrcm0FfOwhF4PDbi2QNatKF+IIr1KzUc2yZD9KqbDUNVcaza3e/2cDieIdalUKVfL0C2jFciAvqBiVV9f3JkNFhtAn0l3a9jTNT41ncO/IGQG0blG4SMMqFM3+j4WLObqPCH0xgZ9nu5rc5a0Bs2QhJwkz45Q0ghQeIxpryPY4Xew339mrUFwn2N/vppYn3/kcu2VdANA5lcrSGpGhyancsdM7vwtXMZOU+UQtcHKy+NFUMi1Y/zwDktK+njOtPLCFbCLu/zZEVgltUWnvaezKLKOqPr9vbQgLGE6Wbl8WnQDmHlPxKxGt1BZMWLygxAeU3K8sbL6UEcEXmrvIsrql2m+karAAfr/jbb/s2vB5yMrdk/FfhSTjJRsVYeWud/Qa5ckvEiMWMrHgUPDWo+H8vx0V0H6eOl77+WZ36cOvLs0gW1TlfnBuMYmuZf6qbUi7gSV68pje3sRhYxSNGzelDGG7wi4oTbYe7XGEe2lCWMIl3NePEwTm7EFxVrFvr19kOClkSynjdsO/0m3Qpy9aERgkxkajr67c5+TGCZUt8qPjyg1kXfcFik3e8MTO9Y9vJ1XhA9hCw0Y92BZjV20rHL1HrCkRo05A5jKMBw+uFf39Rb7ttIpMaVV7I8iAsLv3VL3Rm3bBILSQ9JUz/WjnuKTV9prKLfoo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(396003)(366004)(376002)(186003)(26005)(6506007)(83380400001)(41300700001)(2906002)(54906003)(53546011)(316002)(36756003)(31686004)(38100700002)(6486002)(8936002)(31696002)(6862004)(5660300002)(86362001)(2616005)(4744005)(66556008)(478600001)(66946007)(6512007)(4326008)(8676002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bldVVWhBcy9CZk9MdkVHQkpYeHNoa00vWUdBU3hidWJLUHBBcHBrdzlVY0NM?=
 =?utf-8?B?citEQmxScmY1REU0dENPdVlrVUk2MXAwUTlJcTZ6eGdoT25FY1ZOUkxSNlhx?=
 =?utf-8?B?VXd1MllWcU96RGQvcUEvQm5IS3VYQmZDa25yWVlvbXcxRGtzL25xZDZybGw4?=
 =?utf-8?B?UnBrUVFwa1Z5WjhNOUUrSXFNQ3d5RjBLUDdJMlRMdTR6UXJzY1RwVHpuN3h1?=
 =?utf-8?B?LzkvOHRQUkxGSllGekd1MUk4SFV1aTlLM3FHbGVjUXdFWHdOQmhkNmdxaTYv?=
 =?utf-8?B?YUFnNGRaVWJ6REdKd0lPNTFnTmptd3pqUGx5cGJaOUdLQ0tUMkFzYnM0NEFj?=
 =?utf-8?B?WTNhWWhDNzVwTTJ0YVJuWUc0MkxTKzk4cTBNR3dzVGZKV1dSY21IUmFZZzd4?=
 =?utf-8?B?cFFjRTc1SktacXpSZjFSWHdkMXE4WGhiTmFMTUxtNllpcHRKQUZEZU8rVzZs?=
 =?utf-8?B?OU5YWXdlc1ZIcTNTSjhLYmxlR0VURkFHUU52d1FSbU1UL3VId1ZQR2hGU3Q5?=
 =?utf-8?B?UVlIcTZoYlpNMzliUWlhV0VreDhtNVZOeEdEbjk0MTA0T2thNkZvbEx1SjZ1?=
 =?utf-8?B?cW1Ia0FkdFViVzYza3ZFWExob29pMHlxWG5leUN4WmlXMHhXQ0lES3Rob1Bj?=
 =?utf-8?B?VE5QRnB6VW92NndjY0lYNTFEQmtGQkNBM0VhbmtSbURmQ2FjTlhBaWM3WmFY?=
 =?utf-8?B?WjdvQjBESXhKcGhSc2s4UlpmWmtINU03Ni9FSmlKS1RyaGc5ZEd1VFVZUGE2?=
 =?utf-8?B?dlFwUDk5aEhSWk9jNTZ2SEVvNXJKRXB1YjloeUs0QTQ0UERYMmV1YlFpZ1Q0?=
 =?utf-8?B?NVdCa0ZKSHZVYUwvYnhyMmUzYk5UaTk0QTJRV25aL01JOU8wUEdyZy83RmN5?=
 =?utf-8?B?d1BUejZ4MlErc25aemZybWc5S2wzUU5tejZsRVcrVC9Rdm1xSldIOU1mV1Qv?=
 =?utf-8?B?MFRvVmd6eEgxTE5rbVdjOWo2OHZsemJhZ2RERVBWb2wvUHViamRlVk5ncVl2?=
 =?utf-8?B?Tng1cnpNRDZQSGZkenhiMHRia085ZUFvUkxaV3dIbGxzYWFFdy9oYkpWRDJR?=
 =?utf-8?B?S0dsa1JOZ0ROMnR2R3Nhb2hiYVpxNVFkdzVJUUhpa01QRWRCa2JWcTJnUVZr?=
 =?utf-8?B?NlBhRWNsSkxqeTEybVM2RjVIQkNJTHJrakQxSmszMFBmYlRHQmd4ekM2Vm83?=
 =?utf-8?B?OFdUY2N5dTRzaFQ2cVZPQzk3cjJPMzQ2V1BWalE1aTgyMXN6YkxsNmF2dmtE?=
 =?utf-8?B?d2d6UGZsWFpIV1hnbkdIZGNHQTdYVHUvbElxNFVjb1NkWUJlZlgwVERpOUlp?=
 =?utf-8?B?bUFpS0NkMEJEVDJHUXR3QVhZSTJmOTR2TlNEc1QwUzdMdzhBSnp0Q2dLdHVH?=
 =?utf-8?B?bmZBSU02ME05ZXprejNFelg1UDJ0K3hDRCtCc2MvcXNQQ0hGRGtqYWtYN3lI?=
 =?utf-8?B?bWVrMjVMdHVKdXJGN0NFdUpPekxsWnp6Y0lhZStFY1RUZk13YXdqbk9QY1My?=
 =?utf-8?B?VmxsY3RTcUZETEF5cGRZSWxKYUNqN1RzWjFRTmF6Z3dlQmNTR1FScHU5Znk4?=
 =?utf-8?B?cUZpOG1qTkRWQVJwZmhTckk0b05UL2xmaFBUSXhyVTdsMW02NnlKL3VEQ0l3?=
 =?utf-8?B?NU1iN2hRNDB0WndQdVRHVzlNNFNmakQ3T0p4SURQLzBTcnEyOWY5ZURvZFFC?=
 =?utf-8?B?VFQycFJ2MFkwSFprS0VpanJJWmdjbUF1aElEZ09Zbk1GRkV4d1JJL0g1TEgr?=
 =?utf-8?B?cy9hOVNaYnc0aVVVT1lWZ3IyaDlTRnZXbFU3M2dMc1RHWU1pZzZjZnk0eGZR?=
 =?utf-8?B?L0hnZTNxeTREK09CaTFjRkVKNUljbWRhM2RHbnNMWXk1VnNPa2FIbWFmdTZi?=
 =?utf-8?B?ZUtlYmhVU083V2Z3YWt0RDNDU2JOYnJnK0pyVDEzZ21rdUlZVDU4Y3FKWGNz?=
 =?utf-8?B?MzQ4bE5kOXBhZlljQnlqdVdxdzlRVDF6a0RWMFN5S2NYaFNkV0ZEWHpCUFh2?=
 =?utf-8?B?ZlRIeGhkRVJTTlFxbHQwdHBGd0ZHcm96QkhEVGI3RDV2UXMzQmFhajhnaVU3?=
 =?utf-8?B?VWJ0ZmdJMExkTlFiZ01yWm5mZHBJOXlJRUVmaU0zVnZTeUtwa3FMVXZ4dkZk?=
 =?utf-8?Q?cKfzH2YvXAqxBMKBN2pvWxAOx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dafe755-4261-4d04-8584-08da5f2e19ef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 09:01:23.6014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYAQlclH21Xvx/N6366zVQEFmukk1n6QpxOdrrAb1vBpgOUIu3Ki58NveIRzcLCe+rlWquKKydHOFmCutl2eMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3474

On 06.07.2022 09:30, Henry Wang wrote:
> It seems that this series has been stale for more than a month, with:
> 
> Patch #1 has some discussions in thread.
> Patch #2 #3 #4 need some feedback from maintainers.
> 
> So sending this email as a gentle reminder. Thanks!

As a general remark: RFCs, at least in my view, take lower priority than
"ordinary" patch submissions (and other work). I, for example, have this
and other on my "to look at" list, but I can't really predict when all
higher priority items would have been dealt with. It's the sad reality
that in effect this often means RFCs won't be looked at at all. One of
the many unfortunate effects of our limited review bandwidth.

Jan

