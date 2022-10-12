Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B09955FC0A8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 08:28:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420733.665716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVDy-0002Wr-N1; Wed, 12 Oct 2022 06:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420733.665716; Wed, 12 Oct 2022 06:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVDy-0002Tg-K8; Wed, 12 Oct 2022 06:28:14 +0000
Received: by outflank-mailman (input) for mailman id 420733;
 Wed, 12 Oct 2022 06:28:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiVDw-0002Ta-Uq
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 06:28:12 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00075.outbound.protection.outlook.com [40.107.0.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b675bba-49f7-11ed-91b4-6bf2151ebd3b;
 Wed, 12 Oct 2022 08:28:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8852.eurprd04.prod.outlook.com (2603:10a6:20b:42f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 06:28:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 06:28:06 +0000
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
X-Inumbo-ID: 0b675bba-49f7-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5HCJhx4VYpo1aoKCHYZ8YgH6AES7fj9yBXzHC4NxALAGr4Yt6fXYavTqiW5DJ5LsdfJaR1lO07jDS6ni8UvOhiEOIiX8zmPtTIeH2ofAZvaMDG/do2uEv1iHApmOJtlUby+iqz/lAYGQqxa90+C8LzC0RJrCYFc4OZD22tctK8nh0Iq9avUKlUlUP6P9fxZ3TW152dM25Zh0LTW7gxPtT9Xlqg0QY0tg0mytuobCvUHmIj3/rks09yY4KnqPjmEFZFVIoTlRtW3C8n6510+vsKGZ3RCvBnpwwQEJX/GTERimGrqMp/J2dSTnlP/x1NbcXsZYs/YQoXRJQ47YrwyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lx5wPmLUQT8BJVNDZsV7PbijR+Asnthhs2nNHgkcCEw=;
 b=KA0zUYApLBqzfI7YW0dq1TOppf7WArX2wbxZC64o2D+kFFsN+5UXuHh0D3SEQXHn2XKe8aItS4qTFbaYfLOewiF9TfznYOWi2LnmfhaMxcAegNfVMKRt18NklrwqXIg7g7HVwuHhxtrWD/220+OXx2p7Fzzbb0716f576UsV7C/Br0it+Ll2dw398xOC88Z4qC/gA7D+N51HztG0mNZDvPvKtc2yk5pCXJ3+A+L25XsToUB90CQzVPivk5m/mICFrWliyMz/VYJB9ZHi6hH78He9A0RBT3Kvfwy/vcypzJ6W8arsBWfcsqUJO0+M1EY9CiHSQCgXIxkNIiN90sMF2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lx5wPmLUQT8BJVNDZsV7PbijR+Asnthhs2nNHgkcCEw=;
 b=SHc2zFvg8UWTn/pc6X03ng8lAbLmhGBIZvilFxgaKAuaFmESJdFdgvZKhnfTumFs5K6BeumloNgc8Tlqh0VbCJ4WZpy2MB6JSYIsg3uSc7tS3XeL0YNLBG7Nj07Ijnu/LWaeZ4mpqj5CbuP4d6m1mSChdnJZC4SGkzPcdk8CnWZkXk4+Do3lzECeK3ZtlA4qB/3eRvl7vfVjQyxNgMQ4/ucJcNkVDSZh0WRXkYzmYqvt3lQFUwhGyuotRJFQcWOyToe2z/tFqRwlIypvih1kRH5yS9QDAC+OSJfckrYGRjVAfOvXkSJqEk0VcRS2D7WgFIkG0yo2bojZWleTHArH3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d048659-aad7-7c86-9f41-94489d9d90f0@suse.com>
Date: Wed, 12 Oct 2022 08:28:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [xen-4.15-testing test] 173498: regressions - FAIL
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>
References: <osstest-173498-mainreport@xen.org>
 <AS8PR08MB79914E7F4F60378327C271D692229@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB79914E7F4F60378327C271D692229@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: f72c3027-716b-4abd-aa04-08daac1aec85
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tAkoYPaRrTgk6RgrE8PJUifb1pRCjd7PHURoc82OYNuzkVyVKiYT++Rkw3FIvYuZLxAnzRjtspob95XyKKIA4UaFKVWTt1QeGZlUTn3kvNWEU9fY5jIyCzk4INELVQFbwMyrUvyAnomIwHKsO7cr5wc4m2WsD7NLGpkQzz99ioiVwiPAl2Osi2XZR9W8/ujnyO1+aI6/LUU4glDmrdpzj/cxyqmG9f1KutLUjImIoa+rKS3f3DYjaYEiWA4EL3PSzVrLsmXebVGlwBzMe22K4dACRPUdAQ6iHmJL4URiO7Qw1LSnMNw5F2iP4lIDPz2+7hapzGuuJkhZ8Tm53b2uonZrc3itQzkyeF9PuVzQlTb/MDFo/pyuNj2NO/I3ZRr/HfwN+7H2OfMXFXY0uzkiglhe6UReV5ktzu8a0fezQDti6oXoyihf0RU5Zk1qDbMH72+igt3SATRiyLita8nS7Twmaqnscz7lsD3OPDM2mGNl08uYgziHxtaLSS5QFL/oIkXc3TJf83QF77v32ArObiUE2UZeRYsPjo38KllUiGfKjEIQo/ZCOgcinu64BV0kUcZo8bWoOpAOoi/0FH5tFqk6zbxkgByEAReqWMHcRyb1BLXYbS9ta4TGR8eXLIxD8IupqGxe0U6yCxJZN4X9wjjuvG+3XKavGoPjkJqxscVvxIPcGHZ5TJoOx+FoqKcllvqohtKweoqGAhv56ojn7yeh7vmp0UmN+CUZaDi/ocsahgPrxGl1S7UFvoTSDcJM4Q4A6bzvFc4l2lJlaU5wqC3iUd1hzAhEt7M4AMnohsWoPIV51IgtIA/daT/PflWFR65xW4JA8Xka1468QXyuOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199015)(6506007)(31686004)(6512007)(86362001)(6916009)(54906003)(316002)(38100700002)(966005)(6486002)(6666004)(36756003)(66556008)(8936002)(83380400001)(8676002)(2616005)(53546011)(31696002)(5660300002)(2906002)(66946007)(66476007)(186003)(41300700001)(478600001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzlCdUtxOXlvTU9NOUVZcFArZUQzSFIvNmJRelpPMDdmMCtXNDJKSnYxUkVp?=
 =?utf-8?B?aVRTRDgvYUZweEl1dE0rZUlSZDh1WS91ODR1dzFiWm0vRkc3Vk1PZ3BzY3N4?=
 =?utf-8?B?MkJvRE16QVA1NmlSZ0NuOHJaRm1ZQTRuRXMvSmhuVzFWQUlwbzV1Z2JkZDEz?=
 =?utf-8?B?NHV5dFNyN21BWTZXZ1N1QVNTcW1LdXVESlBDQVBXZkxKUjhubmtxNk1iNUNU?=
 =?utf-8?B?eUF2bjBNMFBPSG9FaDZXVDBKODBTb0I4dmlVU1VPckF3MFhDMjlEeVFSTVdw?=
 =?utf-8?B?S2R4c3VnS3dGSms0Z3pjWHlNc2JZNGVXTERjTndPV2VyRzdnRzBvWTlZenE5?=
 =?utf-8?B?SDBGVGRCVkE2cHlSejFJSy81NWVTRTY2Wm5oZ0xFZFFNaGVwQVJ2d1oxVDBT?=
 =?utf-8?B?M0NFK3BQUDlaNnMwSTBHNzFoamRsYTZBbkNzRi9GM0YwRHRxUGcxSDkrSVJD?=
 =?utf-8?B?TXQyZy9CWm1oV3dGRkh2NEgzaG05SWFOckFqdVBOdWdrVVBuRmt6QVhGbkxl?=
 =?utf-8?B?NWJMeTBMTGVNRTFxcC9KeExCRXQ5b2ppMitudUtKYUEyZ3RjNEV1b0pTWTEx?=
 =?utf-8?B?b0pGMnJwQVlKU2NWQ1RlWEpuM3Z4TC9YS25zanNZU0lTS1QwNlJlSmxMbjBY?=
 =?utf-8?B?Z1EwSFR6dTBQM1gxM1lEL29yaWMvdEJnVzN5cU9panNUVTNac2lrZStHNHNZ?=
 =?utf-8?B?eWRmdmhpeHJwNmhBTnh1Mk5WcHRyT2dWVmtoMytpSGQ0QVhTZVArd0QxU3FV?=
 =?utf-8?B?SFlna2J3c2hTaGViWWxTdFVQdXoxS1l3aWJreGVaMUthRjh1SjEyTjlLeWdo?=
 =?utf-8?B?RUI5eU42U0NEdHBpbytac1hoOHpIWDdXWVdVM0cyYytnU0RDdHFFUEV6ejBl?=
 =?utf-8?B?SGRBSmdaaGJtUmx3Si9KYXZzVGxvaW05dHZqR1JYa3l6Z293eU13Tm9PdjhK?=
 =?utf-8?B?KzM3UW1zSlkxVDlkbnBjMEVqSHVSL1VTb01mMWxQZjhVRjJaYXVRUklmYmtm?=
 =?utf-8?B?VzZCR2ttSjE5ejZ2UnJxQnRkNzJtbTdxMkF1UU9pYjU5Yk1qL3FQVlp5dDV1?=
 =?utf-8?B?aUpRMlJpMk1nVDVLMWMvcVE4TVI3V0dXeS92QVZhOC9zbzcwSUw0WVlveDZL?=
 =?utf-8?B?TWIvMGtjQTg4b3JxdFVPbkNxV1JMenZIM1FHTXU3RlYwOC9WSFNjaFc5allx?=
 =?utf-8?B?L2hSbHhBQ01CbExwYUlPMFdzOHpFYjZOTHAxQWV1a2RnRXhXanF3RkZOV2Nk?=
 =?utf-8?B?bWRVMFBBOEtVYkRIMmhuWFV5aXZHc3dyWHF2ZDBSZE9qaVl4VEZ1Qkc4bVVR?=
 =?utf-8?B?SnRlOGJsSGZPR3I3RFZOdkJNZ0ZacDd2ais3MkF6T016TlprY0hKM0FieEJv?=
 =?utf-8?B?a29tM1l4SDVEY3VOaWJ0QTc0d3VmdHZWY0NTeDVvcXZlaFRSK20zTXI3U0tY?=
 =?utf-8?B?aWk0NW1QSUo1WUxGTVBLRCtXTmdNS2Y0RlNISml2VDBpd3RONnlnNXlQdml2?=
 =?utf-8?B?V0FEa05KYjZCMFRWWWtBb2FadWtqTUhxckxGM1NJWFZ1dnZHbHRhWUF3VSsx?=
 =?utf-8?B?Yk1VdDB0U1hmZWNSRGlHMzdkNGJQaVJidCtDUy9FNkgvczc3YkhqRjlpY3Zl?=
 =?utf-8?B?QkdLQUlJYTc4R1FNRUc5QVFOT01Jb2d3dXZyU1hTZ2UyWThaVzllSTdFclQ5?=
 =?utf-8?B?N09HNUZ6UXpzVXlSb2R0RkEvaUwzZTE2QzlFNGd3SDh0d2czYnN1dUVLT3hP?=
 =?utf-8?B?dU04aEdKS1NnUmdDWW55TnRUTktTQ3BUTlh0UFpKMkllcUNzWld0aDhxSHRW?=
 =?utf-8?B?T1ZKb0tLNm5IQkplR1pvR1hOd3RwNkhVOS83Zy9RVmFCb0psZWUzZi94ZEhN?=
 =?utf-8?B?bWc1d21oQ1VHZHlLYmpHSVIrbmF1S2FhYWdZRDdlUDZnK0lkcDFWMWRZVW85?=
 =?utf-8?B?eFFselNaREVSVHFLRENacjVIY2FILzJ1VTI4SGlEZERjNm1tVHZuMWI0aUVj?=
 =?utf-8?B?bmY3dDVVTUVKSlltTE9VUmFwS2gvYnRrUUJBSFd3c0c3SmYrbTRkTW9pczN5?=
 =?utf-8?B?OUl0NGwvWXk5Y2dDa3NLTjUxL1UyWkQ3REduVjVQVzlHVGsydGxLaTdOekhq?=
 =?utf-8?B?U1U3cFNQenQ5RmE1Y0pDYUxCWFdWYkM3ditGOUE3ck9adG1oNngxUFVSS0N4?=
 =?utf-8?Q?D3XivZebOqUFXFPJK3Kp3R2p2XbGELrOb9d7kePu/hkJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72c3027-716b-4abd-aa04-08daac1aec85
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 06:28:06.5375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2o3ccLIWyWRwPByka91AesemngNwCijRaPHtQYJGZ87Ij3B+3mvJX9wL1/1wzsoz/t7e3/o7mteTvL4y8AgXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8852

On 12.10.2022 04:42, Henry Wang wrote:
>> -----Original Message-----
>> Subject: [xen-4.15-testing test] 173498: regressions - FAIL
>>
>> flight 173498 xen-4.15-testing real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/173498/
>>
>> Regressions :-(
> 
> I think these regressions are from the backporting happened yesterday,
> see below...
> 
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  build-arm64                   6 xen-build                fail REGR. vs. 172547
>>  build-arm64-xsm               6 xen-build                fail REGR. vs. 172547
>>  build-amd64                   6 xen-build                fail REGR. vs. 172547
>>  build-armhf                   6 xen-build                fail REGR. vs. 172547
> 
> ...The arm/arm64 regression is from the backporting of commit:
> xen/arm, libxl: Implement XEN_DOMCTL_shadow_op for Arm
> 
> The issue is:
> In 4.16, commit
> 2107cc76db3a libxc: split xc_logdirty_control() from xc_shadow_control()
> changes the prototype of xc_shadow_control(), and hence the calling of
> xc_shadow_control() in 4.13, 4.14 and 4.15 does not match the calling of
> xc_shadow_control() in 4.16 and after.

So did I commit a wrong patch, or were the patches for the older branches
wrong already in xsa.git?

>>  build-i386                    6 xen-build                fail REGR. vs. 172547
>>  build-i386-xsm                6 xen-build                fail REGR. vs. 172547
>>  build-amd64-xsm               6 xen-build                fail REGR. vs. 172547
> 
> I think the x86 regression is from the backporting of commit:
> xen/gnttab: fix gnttab_acquire_resource()
> 
> As the error message is:
> make[5]: Entering directory '/home/osstest/build.173498.build-amd64/xen/tools/tests/resource'
> test-resource.c: In function 'test_gnttab':
> test-resource.c:74:19: error: 'gnttab' undeclared (first use in this function)
>          (void **)&gnttab, PROT_READ | PROT_WRITE, 0);
>                    ^~~~~~

Hmm, I'm pretty sure I did a local build test of tools/ with this in place.
I'm not in the office today, so I won't be able to do anything about it
right away.

Jan

