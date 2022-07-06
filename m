Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C955567EDA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 08:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361793.591480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8ylu-0003Mx-Ob; Wed, 06 Jul 2022 06:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361793.591480; Wed, 06 Jul 2022 06:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8ylu-0003KW-Lb; Wed, 06 Jul 2022 06:44:26 +0000
Received: by outflank-mailman (input) for mailman id 361793;
 Wed, 06 Jul 2022 06:44:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8yls-0003KQ-Hm
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 06:44:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60068.outbound.protection.outlook.com [40.107.6.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11a365df-fcf7-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 08:44:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4189.eurprd04.prod.outlook.com (2603:10a6:803:3d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 06:44:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 06:44:19 +0000
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
X-Inumbo-ID: 11a365df-fcf7-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OapNexyMsroq2B7vY4vcb8wI53pPf1I4NT+eYARm3gllMZ/iLl2D/f7MwKZs2jq/01rR5K9H9zp6SFvtK1C+yLuhDskKuTcJBkn+iQq3OfGPNakNnHTBQnfGxu2b+j4ypf73DUH2jZ9O4FQLAypM5NcRZaAw0wJUY1IULV81EO5ysBmBv85GUaUZh2YxSMyOZh1n+MQA9LfDTZjBcfUTvd6UGIMyT3773o+zc4wRV6sxbAzQyoAi0AvaRwFPXpJXhFy5Ey5y+00+2z1JOPJYmUPnIdHLWGL5d7/UYQ2cqlTP9sFOIEpskpop56beR/A3yfvREHsGV2BFNpx2pxImfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/gK54icbsIHz2bCdPPSpmMzUybpoIrjdw7EWN6D9jM=;
 b=cPqGiju9j9g3V3uumTfPPT618NHlgV9wfkXsN/Mabqd6W4uwpT6yIkyXJWXDCnO2hV47W3xh7cg00HXsF8hHtko7d+kWlfUC+cp8w4nrtuu6bWF5atEPInJ8KpvWqjfUAH6RMvzUmAGrVXLKB2TJ/gz/fOAV1hGqpBINqJvb2Oe2/YtsH1xFfuSE1okfG1Cm5HiZ6DwUTh3LTZ/gIo8gaXOvhMx7pzUlMFwK+hNokm0AT13DpnaZQU6TMcNyodRE1TzXcTn+jF7vGT8dTOMmuX7SXxCGYpH3W6WNKCcZJI/d4K/3jXQLhbduOVCxTiEdY1A9CbpEkQ27K8eOteqOFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/gK54icbsIHz2bCdPPSpmMzUybpoIrjdw7EWN6D9jM=;
 b=QXSTPhCqDzNbpCeMgW8KGBNP0/j/rdyLXQPRNbr46FZKJ/kixGNN+gfQ8YVhLoJNYjs0bmIJ45ujkJsPPTVSEVfIEH1WU5D1ZnDx+mNqZQ4DDvWxRS8+UWLqJmXpkL8rMIli1V4mDWiQl4zyiSHFRky5uPliUXliTtsBdWyD81EGtLKJ4kFXhVYvHRE02ZLErQII+uVThECOBgIi9eK0bJ+g/olQlkaL4/c2NdkenhrzjiQOh8PJm3yLAOk2/qvB0OeOWRwbrooYxMF67xnMRy1ITu1RYw1d5fIZu+H9Uq0UABcmNE/Hc+i9+3Ik0q7PHv7po8rskQ+o9EknSjk1xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a9a8276f-725a-db6e-8223-a9e6060f7700@suse.com>
Date: Wed, 6 Jul 2022 08:44:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [xen-unstable-smoke test] 171511: regressions - FAIL
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <osstest-171511-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-171511-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 765d69bf-88a5-4430-7237-08da5f1af37c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4189:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5PsAAF3G7Tj41lAXhtunqBPEz6xR+2xuxMADJ+mRkmrSmaR0JpY8Zl7gXy6KCQyQs6abTWP/mXMuvW4tosXi1gCWAxudJQ+bhqdsRfBxjsueDnb6RDojsw3bKGkj2VF962XxFlpylkLGLn+igZN5nxWcKvwHhBqxkWqhrATp9I0u7qaB7vfag5U2z+cypdELTU21ivlTkoTjMjdyw/VVv6Vf3dZe4vHEQG2Ah0zD5YJCA2jbUYAE9Z5MrXVTzqjQiBrm79LVlM9zRTS6XbJ4d+x4g31kwsmc9TQbbQ57c5GN+fN158yK2grOWRQSy+/ShICsPgzK7Ev1eg4jUdttVUZw8e1aWz7F5sut4/BckOGwjoa8vLvixWejalDHgJYfpHtLxiH16JZVXoCAwyrb/LHUJbLa+kDv9+CWEIgpOK4z51d8b7qbROuj9z3EYLTlPwBNHWh0enOLryd/ggWJeE8joSYyH12kP0IikVMe2c3wKFOl9B/pEfEbWTrqHzjAvwZX1a8m3EcnEsjktLuRgLuVUeOzI9Q90O4/5maNjSGTyQhD3ZLjVEUG3CleHh4mFC1c4pV7QjfN5mzHkciQjxpzvdKzImIZd5XISSjDuW6gRmDSzpOG0XlD5+9IJvRVOKWeyj/fW3vSby0xuhEctKCem/qHJO/MOYUJ294WOrFeQoIqV3lL75sl6r36GVrn1wrQsxq39afEgNkmMBI31/dJuTQWjeIjVszZm3qxUy6jV0a7vF7DCEh9btpHgaTqfRh5crEpv2nVcavikV0PuCWOICeonswV2YgXIwjC0voALf5acBSyvx+EWZ9SU7YbE4QOZUpXcu8x/dujtTTbvIv5UO4WB7luKdNv4RUIUdqn8lCqCR7BhiyAdc8tYksHnv5GUsKDlDtgcsZ8wf4iXjB6kBTyyH9KFt/bb1U33aU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(376002)(39860400002)(366004)(83380400001)(31686004)(53546011)(6506007)(36756003)(6486002)(478600001)(966005)(26005)(186003)(2616005)(6512007)(41300700001)(31696002)(86362001)(54906003)(6916009)(4326008)(316002)(38100700002)(66476007)(66946007)(66556008)(2906002)(8676002)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1oySncram01cUJzN3lsaXdSTk1BKzRCTTducXhhZWVqR3lONDVyY21DeDR4?=
 =?utf-8?B?b1o2N3huWW0xU3Q2Zm5xeXRucGNNajk4Vm1hNFdCZlVyTXJkNkxvdHpOaHBi?=
 =?utf-8?B?eStGZUxCbyt2Y3M1bkxXOURNM0crNm56UWhwckR1QktQVE1KYjhyYkltVEpT?=
 =?utf-8?B?bHQvb0l4RzIxUjBsSHdCWmR3QjF4MnlybEY2cjlFMmk1a3NjcTJhNXcreU1o?=
 =?utf-8?B?SXhXNG01RTkzZXRBeGI2RUQvRjNzOHR5VU03MnlpWjV6TG9LRi81Y3NRWVQv?=
 =?utf-8?B?NGpJbXV3aVJHcWx4WjQva2U3SEk2Z040SEdXS2U5dnBkNG1Rc0MwcXpHdnFz?=
 =?utf-8?B?RjF6Y2dtdENmWm9uWTRhMFF4L3VEUjFzL1I3SHhhOVgySGpRdHpKcWN5anpt?=
 =?utf-8?B?ei9tdE9JcTJtaTFmK1dpOEkxZkVKMTVxSU5yaUxxQUZyNms4WEhCb2Z2TGg0?=
 =?utf-8?B?SVU2SEpYY1FQU2RnditsSGtpbW9OYzl0d0xNYXY5Wmt3R2hySkhkaUc1elRn?=
 =?utf-8?B?YS9BZXlYaTc3U3RqQUJ6M3dnWHlVeGVIejdzR0J4WDhNVDF5dUQwMHFwWFY4?=
 =?utf-8?B?dElJMnVEZWk1ZFNSdW5CTWVsdWMwa3J0amxTZnN3aUNXU1QySldFUUtVRDVM?=
 =?utf-8?B?a1FJM3dtdnMxOEhZSGg2cmFVSTNoUFBQb2Z1dVlFNVhyK1kyY1JOSVZMZnJQ?=
 =?utf-8?B?cGo5ODFmTmZFYks2L2kyR1htT0t5RXRMdVhiWTBQQ2cxRkcxSUg2RVRHejI0?=
 =?utf-8?B?dnNtZDJaVHNaMU10bHJESFBHSU9iSG80M2Z1TXJIN2MxSFZPUnBKWnVkcmdY?=
 =?utf-8?B?MUpDTzFCN2ZMN0hTV05hUm9sTWF2VTBValc5OTBMMDlYWncwSm84Yk5JUDM0?=
 =?utf-8?B?MHp2elRpaENhUmRhRzBmMElBYnJaeEp4dTM0VzlRUHFpSWlCdUE2M1dOeCt4?=
 =?utf-8?B?b2JVMm9OTjkrcHhPZ3BHcTlSVmZMUEovb2ZJU0tiQTNpM2o4aGN3dndvS3JD?=
 =?utf-8?B?bW5DSUcvQnBXYWRaaUZzdzFtSFhWMGprcEc3YjZtcC8wM09OYVd1bzkwQWVk?=
 =?utf-8?B?SlZ2dkFnSGIvR0l2UlJlcE14TDhJNUUrQmwvbXFJUG1wZ2ZJckk0QjN2bTYx?=
 =?utf-8?B?c3lqYSswM3Yxb0Z1V2QvQ3pXZkFsOHBOYjBiV1YvTjc3K2kySHR4TWVBcUpR?=
 =?utf-8?B?b1kzY2RPekdyWW90Q2tKQWYrMmhPSkcyaUR0T1ZQaFAwYmxkMU5UWlhIQVFy?=
 =?utf-8?B?YnYwK3gyVlRERmZMMS9VVUdxT2JVSGFYdUFVV1NpN3BrbGQxSkRPcHZqSDdV?=
 =?utf-8?B?dlhUQUVlbWpqS2JzYXNNa2NDb0tlT2dvWmt4TG9EWW85VW15VFJleG93a29j?=
 =?utf-8?B?a2tNM1pTc1pZRnozTDBFbFhtaWQxb3J5d1c3Q2RnRjZCL1d3Tm1IYXc0blVQ?=
 =?utf-8?B?MzVhU3lpTVBnVTlvVXJDUUY3TU5SOERGVTFRUUZUM21RbjZDM2YrbHBhV3ZI?=
 =?utf-8?B?MVZ2T0RLMzZqUlZOZlQ4cnJBQWl5dDF5TGdHNldaUEtHRE5Xb2RvNk9VRGNI?=
 =?utf-8?B?SjJnVU1jTER0cnZGVlZEaFpobnJiUzF0RDZEejRDcC9xQzFpbGNIVkYvaGw4?=
 =?utf-8?B?TVMvOUxrcUZyN284V2txNXNJSWozdTRxTE8xVm9DSUpwcHo0SGk1SHM5MERz?=
 =?utf-8?B?U2VhbnorekJTWllHdWlJTUVaTC9tbDkzWlhDb2RsQnNUZ2FTdzJqTFlaUHor?=
 =?utf-8?B?MWl0d0p6WEE1cFFJK1BkMTg0eng2bFVRWFR5MlBwV3Y2Q3RFbVhvVDFkdTJL?=
 =?utf-8?B?QmhiOE9SNnFCaHR2Ykl6ZkI4RnJhSmZDRHNsUlJwY3VqRGdybXlUVnFGNGhj?=
 =?utf-8?B?aHNYWGJtYmRFbjI0ZFhMWGZYanFVOHRKY3E2dnpUSzlqa3RyZ0lYWEt2WHQ0?=
 =?utf-8?B?V21aSDZMTlhjZ3VEWEZHQjRuSlVrdXpmUVF4VUdjRjFYNFhKei9DMFo1Qk5p?=
 =?utf-8?B?dGw4Z2w1dUplTnZFOU5KcXg0ejM2bllZZ0QwZGs3cUdvYzB4UTY4V1E2RjVU?=
 =?utf-8?B?OHM5MWpaMVdQVkJ0SWp5QVRmUy9lSWhwanltbXJNR1pZdUljR1VrVU0yZGov?=
 =?utf-8?Q?5DGFxohRjJ3VBhqpeAHUj9C80?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765d69bf-88a5-4430-7237-08da5f1af37c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 06:44:18.9685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLnLcCvshPKMuG5wI8TZefZMq8/uNN6JAJcOETK5d55DjQa0RorDIyizQU1Mt2w8PjlY1EBIBjS4Bk24PmPcxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4189

On 06.07.2022 05:39, osstest service owner wrote:
> flight 171511 xen-unstable-smoke real [real]
> flight 171517 xen-unstable-smoke real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/171511/
> http://logs.test-lab.xenproject.org/osstest/logs/171517/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-arm64-arm64-xl-xsm       8 xen-boot                 fail REGR. vs. 171486

Looking at what's under test, I guess ...

> commit 8d410ac2c178e1dd1001cadddbe9ca75a9738c95
> Author: Demi Marie Obenour <demi@invisiblethingslab.com>
> Date:   Tue Jul 5 13:10:46 2022 +0200
> 
>     EFI: preserve the System Resource Table for dom0
>     
>     The EFI System Resource Table (ESRT) is necessary for fwupd to identify
>     firmware updates to install.  According to the UEFI specification §23.4,
>     the ESRT shall be stored in memory of type EfiBootServicesData.  However,
>     memory of type EfiBootServicesData is considered general-purpose memory
>     by Xen, so the ESRT needs to be moved somewhere where Xen will not
>     overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
>     which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
>     in memory of type EfiRuntimeServicesData.
>     
>     Earlier versions of this patch reserved the memory in which the ESRT was
>     located.  This created awkward alignment problems, and required either
>     splitting the E820 table or wasting memory.  It also would have required
>     a new platform op for dom0 to use to indicate if the ESRT is reserved.
>     By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
>     does not need to be modified, and dom0 can just check the type of the
>     memory region containing the ESRT.  The copy is only done if the ESRT is
>     not already in EfiRuntimeServicesData memory, avoiding memory leaks on
>     repeated kexec.
>     
>     See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
>     for details.
>     
>     Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>     Reviewed-by: Jan Beulich <jbeulich@suse.com>

... this is the most likely candidate, considering in the log all we
see is:

Xen 4.17-unstable (c/s Mon Jun 27 15:15:39 2022 +0200 git:61ff273322-dirty) EFI loader
Jul  5 23:09:15.692859 Using configuration file 'xen.cfg'
Jul  5 23:09:15.704878 vmlinuz: 0x00000083fb1ac000-0x00000083fc880a00
Jul  5 23:09:15.704931 initrd.gz: 0x00000083f94b7000-0x00000083fb1ab6e8
Jul  5 23:09:15.836836 xenpolicy: 0x00000083f94b4000-0x00000083f94b6a5f
Jul  5 23:09:15.980866 Using bootargs from Xen configuration file.

But I guess we'll want to wait for the bi-sector to give us a more
solid indication ...

Jan

