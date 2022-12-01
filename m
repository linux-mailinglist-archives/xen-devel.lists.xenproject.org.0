Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE4F63EFCD
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450614.707974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hzf-0002Ch-IS; Thu, 01 Dec 2022 11:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450614.707974; Thu, 01 Dec 2022 11:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hzf-00029w-Fg; Thu, 01 Dec 2022 11:44:43 +0000
Received: by outflank-mailman (input) for mailman id 450614;
 Thu, 01 Dec 2022 11:44:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lVjU=37=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0hzd-00029X-Du
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:44:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89f83653-716d-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 12:44:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9464.eurprd04.prod.outlook.com (2603:10a6:102:2ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 11:44:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 11:44:38 +0000
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
X-Inumbo-ID: 89f83653-716d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjQPRmm8G/7F0IOToAhXh0V/Oxn9vrrkgstUKstDZq9iWPymBZ2dOkGLKqlSu+xU/WkaLo5C4VZG/UGA4TI2WS0uPpr9iHhCOau+w8PyEsV9xynlp1I5/+wUfpr/76Xm07pFrjGdjrpEt8nFWsC4HP5r4ityRryqwyNTNBuzsNJ+w0EP6zn6KWyWaZfDwXSEj+ERRrqGqmz5GPiifoL/4rqAbN2rlP//R678wtI7GmcrGXDbucKl1nLk2YQNTtK754wPGgbGpK1grtmmJCQdSqm+yJs1ctnTezQ3DWicvkHDUlskiSEABMt6bHJiNsuUrUIP0ijoC4N0J0U4mwCFEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sO00GJ18TMM3c6JJKnNd/bqPxhg09YDK+94ASBBHNd4=;
 b=OSEry7XcRvrLVkenojpCxG8EiZlWhfCIgKzGPcgsFj0oeU3fQaWpbk0SSHF5gHBSl1hZxUQvAT9aPzUv/NOvTQO28C7CvRFhJi3BSAjoQco1VLhBb7izT79AKi6hfOsPchC0R4aSJZ4t/WNr6FP3Cms5XKw5vFpblPPmjrFACRhYDwlq87MsfnK+As6vvnneQx3kgje4YHcdmm6YA45u2npKBETwYBqYi+bb0Z9encVaB79N+RPUDrydPqkXfGjEuWfA1yDj9jJ/OajU+Aw3EXVdYiP9wAu7eQ2vw4+kPIKKJf+7leOu2yz9D4CtVvDULwpAUBJk5DCKlMTzH4XWEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO00GJ18TMM3c6JJKnNd/bqPxhg09YDK+94ASBBHNd4=;
 b=a2COuFLv+oSAjqTHFSDkjQO+k8cfHlP5JOurC+5wZjbCa7p2tNHkFH4Q2pnV8DOTOOjDITqEFsTlwxhXi2930vGd1rjOSC7zTow+KtECENffgOZDf8g1r7mHvWTSsEQHweY72+7X5tHjvaztemEbviVpdvC02wAM9/b61Ibtafj1SBW9ApYVjfV73iC+9n9sEPF+ZvVhJT97DW3J6S+774fckpz7iC1IvKhSc4stFWz3Qiha21hin5HFib4qtWWEYVoa+oalZOcA4c9grCqMVr/LfbF9n7Y2PkFfvjEkb6i8V3dsNTGxEYvcZNh2mPtn4+WLsamwh3JGgRxGGGrcDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <37e05485-7625-a227-2fb0-f12ba0ce79b4@suse.com>
Date: Thu, 1 Dec 2022 12:44:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [XEN v1] Xen: Enable compilation when PADDR_BITS == BITS_PER_LONG
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, bobbyeshleman@gmail.com, alistair.francis@wdc.com,
 connojdavis@gmail.com, wl@xen.org, xen-devel@lists.xenproject.org
References: <20221201100309.2385-1-ayan.kumar.halder@amd.com>
 <c89992bb-065b-e7e4-3f5f-1c70754e4635@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c89992bb-065b-e7e4-3f5f-1c70754e4635@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb8897e-24ad-491e-b338-08dad3916d19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UlG/b938SLHorbayo1QcqlnsuA9Oh+k/Pc4/HaE6UmvF90+Q4dlVOoT6/2ZReNHsOVp9+o5QIxLIQKaJvNtHxPlNgOJZAM+ebBzqCPoEfrE7c0cpLsLZ2sGnOAa99odXuphTqk+Wq3djqxdMH5Qk20bzJVADvZYex8KYSYxrN+yynUy1xe4FqgMmbBqFvKQ2+P72Nz3tVVrQzAsqxJfEHsKd2A+ZM4MOfj0W6b0+XYldodi/4Aal4ua5yPrs7S4vsKg3g7Cb8Y52qqBNe6VsrUIzP+R/e5tBgE/Uo1z4rwNsPLI7jRit01gRBGISgyUYnElL8JrW8mq5xCOtj4Mso58H3tBy4aM5pbVc5ApRBRsTe0jf56qP0ac/HwS68kENmGBRPPTPC7yTniV5fwtgwXOLCHh61JBWtipLvmizAnNmbjE8Rhp+KOBBipXLKS3M0a5rz4uz9hxgI3jVvcqPINp1ISHuilR+9cCDwpYw1J5V52NrAIaKAr7aEM41w4J6o7vQp5oBD9TU4C0Lbzy9iPVC4wRFD24rcBnpoFqJj1v5SOlc5Wf5epsQbbuooGIivBOsrhHK6POglMZwglqdyW7CFLQKODuD1oUPtWljZJgi2Gn04TtAgXKEH85LuzJGf0maL0IIWl+M4xO4iG/Qc2HGPemQuWe4buvtT8uY2DZec5ND+7WzHEP7cji5n9ItFqzG71zhdDi0S0LTCKJY/HdGGtflSivJQ+jV2cVz09Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(376002)(396003)(346002)(366004)(451199015)(41300700001)(186003)(2616005)(8936002)(4744005)(36756003)(31696002)(2906002)(86362001)(110136005)(66556008)(66476007)(7416002)(5660300002)(316002)(66946007)(8676002)(4326008)(478600001)(6486002)(31686004)(6506007)(6512007)(38100700002)(53546011)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjR2QjZmT2xYeGMrSW03TFhuZzErNDJLWDNWcGd5bGRIV1I1cEJuMGsrTGli?=
 =?utf-8?B?Yy9qclk0aGFFclJ0TVdRMC94MmZYMEQ1a2g4TEpZOVllcjhiOTZ5aTJOdXd0?=
 =?utf-8?B?aGNkOTVBZnUrOGYrNU42ZXV5YUFZd2lOQXhIYld4ZkVrNmh6ZVBCUTBBTFhi?=
 =?utf-8?B?TWQ1TSs2S01DbWpxcUlDODNuOXhtdGxBdjJXc0x5MXZPdGR4Mm4vVFU2cmJQ?=
 =?utf-8?B?NGtFR2FpRHkrRjRSS292bWRRNVh4ODFSR0xsNkdhZllwdVYzYmk0U3ppWVY0?=
 =?utf-8?B?THFHRGp5UUhZdHJkVm0wb3VvY3JkNktreHpaNU5PMmtuK2dmMGsxL1pXRmIr?=
 =?utf-8?B?M0hNNHJUTTJleUZ6Y2ZXKzIwYTVpQlhGc0JvL1QvYTFmeXIrb0FDVnVmcUI1?=
 =?utf-8?B?MWN2UVkxelRtR05xVmxUZ1lnZlQrN09SMlU2ODdETnVmRVBCSWd3dGRoQjBB?=
 =?utf-8?B?U0RMbTJmVElYVmx5RWdhczg1L0xFRDFmMXdrSXh5WHM2YVJqMVZzR0lCMEYy?=
 =?utf-8?B?b1R2TDJ3aDEwRC9PRlV4eFo4ZXI5eXBoei9UTENzcjRjMm5WY2hWemg0VGY2?=
 =?utf-8?B?N200aXZXeUQwU2dnZ0VFdVhvVHNBQkFPM0VaSFlXZFBLRHFsemw2WFlneXFz?=
 =?utf-8?B?ZEJPalhYZDJGRTg1MmpCdEZzQ3k4YWdmcEpmSVBXWG9GNXVwN0JxalVyVUJW?=
 =?utf-8?B?dzg4QWVES3BWMkxYWGE3OWkvbXhsSVkxVEE1azlML3MzcUFGQ1A1UkUrTlU5?=
 =?utf-8?B?Wm9qbTNWZWxMT3l0dmIyS0toRlQxcXRSc1hZMXFPSFozYnkxVUtFTGhlaUYx?=
 =?utf-8?B?OXlTTUNTS1ZrUjF0bHZxazhqT2xiUnZ1RlphWkJzcXViVm9BbGFwUFgyTHds?=
 =?utf-8?B?NUZrMXROams3TmdtUHZIcHBINlVSYmZGamlXclIwNHNDTS9Qd3pxTy9LSzlx?=
 =?utf-8?B?QXZNWThvR0VTa3dQQ2dhY2ZwWkZmNlVBeWlzcHVVdFpHVjBwN1FtUW9nem5w?=
 =?utf-8?B?Rm9tTFAzU1VYemVBZWlYYVF2K2ovQm5ha2o2RXd6TS90U0pSZnloSEF5NERY?=
 =?utf-8?B?c3hTcGhzK1p2R1BvZTFsWkdvSGF3SFpBMWRuT3ROYmhKMXJmdjc1WThtdVVQ?=
 =?utf-8?B?T1F1RHV1UnBOc1NjT0dyZElVeDZ4OVZzVnZSUWN5Znd5SXRVYkZ5L0RxcjZx?=
 =?utf-8?B?SkZobURXWHFOTHh5TE44aDl3ZUdsNkhjdlZlUjhYMGxFNVlkcHVCWjZXZkZR?=
 =?utf-8?B?eVdjVDJEek9ZVldwelZuNWwrZnpXL0UwYUtlenVxWkUzOFhDMjdXdkVibXNL?=
 =?utf-8?B?R3RoV2dYMEYyS2dRakNtYWNNazUxYzlROUcwcklLbVQzYkYzZ3l6TVZ5ZERU?=
 =?utf-8?B?dWd6NGdxbC93RTlINVhBTENiT05wVlJXdUc0UFF4ekFxSWZCTkNuS0RFTjFh?=
 =?utf-8?B?WWdRcjdsZzJqekpscGQwTVljZkdTQWpIemlJRlRUeVFEQnBnckYySmsyV281?=
 =?utf-8?B?MFNTYWZiTDdPQ0c2L0VBL2VzWEJNYkFSYm93eXRWWGNGYW9xa3k0bUJoUnFM?=
 =?utf-8?B?UzUyM1JRaDZETTl4aHVnbllsdHFWWUtteEw4TFVzeUZ0SURRWTArV2pSaTBJ?=
 =?utf-8?B?c2NxYnhNNHVlNkdnb0pPVWlYcDlKS0tRbFNzL2s0d1RvcVVzQVl0TXZHd2xh?=
 =?utf-8?B?ZUppejc0OEtRenByL0dDUFhpenJYZkdnRHR0VzlBSFlLMWt3c1doVHpNWnVN?=
 =?utf-8?B?RlMrRkZkOTUvMlA3YU9IRlovcWJzTFh6blBkWVNZN2R2SEpYQS8zOFNXUkdE?=
 =?utf-8?B?Q0dpK1JzcVlVdFFveENtbkxJUjFTTVVjQkNmUUtwU0o4MDgzTGNIbEZhYzZy?=
 =?utf-8?B?T2F4aGJVM015ekh0Sno4d0hXSlBSbXpZTEdvMHgycUlPd3Ftb296dGRabXFk?=
 =?utf-8?B?b2QyaTk1Rk93REFMdWx4YUhaWEVzZWdIZ3VIcENScitMSlFmbFZSYlhsUEwr?=
 =?utf-8?B?OTZDdDcrS2xWNDFzSmJJejV5aFFPeUhmZXZ0SEQ3OUdJdXRzdmxNNUM1b3dF?=
 =?utf-8?B?MlN2UEdFbEhOb1dZWlE5dmJQTWFKRUNmQzJDYkNXLzFLTDhBVEcrYVpWKzVQ?=
 =?utf-8?Q?27kKfZMRXjieBvdK7bdPw+FGb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb8897e-24ad-491e-b338-08dad3916d19
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 11:44:38.2653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgtBuWvQw/quC1FNpjilWg4BXNcO9JbI6bMmcZI+NBXDOQCXMe/s4929ENSIldetGnglbVS930RUhdBlI8pH/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9464

On 01.12.2022 11:26, Julien Grall wrote:
> On 01/12/2022 10:03, Ayan Kumar Halder wrote:
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -2245,7 +2245,7 @@ void __init xenheap_max_mfn(unsigned long mfn)
>>   {
>>       ASSERT(!first_node_initialised);
>>       ASSERT(!xenheap_bits);
>> -    BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
>> +    BUILD_BUG_ON(PADDR_BITS > BITS_PER_LONG);
> 
> Based on the above, I think this wants to be "(PADDR_BITS - PAGE_SHIFT) 
>  >= BITS_PER_LONG)".

+1, fwiw.

Jan

