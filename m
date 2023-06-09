Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11472996F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 14:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546012.852602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7b4V-0005FU-P2; Fri, 09 Jun 2023 12:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546012.852602; Fri, 09 Jun 2023 12:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7b4V-0005DF-MA; Fri, 09 Jun 2023 12:18:27 +0000
Received: by outflank-mailman (input) for mailman id 546012;
 Fri, 09 Jun 2023 12:18:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q7b4U-0005Bq-NW
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 12:18:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb734612-06bf-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 14:18:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8428.eurprd04.prod.outlook.com (2603:10a6:102:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 12:18:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 12:18:22 +0000
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
X-Inumbo-ID: bb734612-06bf-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyMbpwGwX0oxnY/zjzt92U6skBLv/FsIFQLBmWqX0TGiRL8HxYmIAJzI/54yH5+6C2UlBGT8uAn6PybjInUgChoPsRN1lQ39LXKTGFuL8Ekx3a3qMWk+k6egclE3hlXshhGQe2UhMelFd+njI+K0QXNkykh5FSFPkYOAJTtWyBzv8DkDNKPg+GCQ6RW9DM3E3THI5L4dJxml1hAkkmxKIbXaK2wY0oH087ZwmLkUzi/y/636gWWa4JBPvFUEjdwbWPXtFV8dJXOxK+VtAppTYZpFfJZaTAPJ2ML3JOMPHgjR+QQRbjU7l8GWcgAjdrYFa1OhIKnwelkvJrTz+guyjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ObMLwA7V1HyG/B2tHduxJWUbzB50EudVKLfou/mcIU=;
 b=ntyn/99FPalzpROdogbI/3L43PpWORSF4iJDaKbgO965UxRFNu4flrLczWGQCK1g6PtYaPGrbG0GXjqoFJwfXcGg1Z6wQMyzSwK8NEUqdTtOq4xjX3O5OMPdt8A5txECl+58e4goOu3/THbQLpXSMmNDeQIGcJy7FiY5uYdfY5aR8eIOx/G985HKblcUD+1e0400dcIXXmKSnwJywZUaR6gMvU0OlADpr7TK7D9BSWqD6OLFxs2x3Y7UyU2GKKkchH45rxdUNEP1p3xn/j/kpDFM57vLel5I3NQGKRdGjV7C/2ED1zSe5sVyusOy0+7nJa8iHQMzb5ENXwitUgYlfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ObMLwA7V1HyG/B2tHduxJWUbzB50EudVKLfou/mcIU=;
 b=yrzqxSaYOfnM0UUPpfiKxcBZ5qD8lPPvH8+zq3kyPIYFdrE5Hpml5+uNy4gxH+Aro8ftbyZR4NKURhrYS0E/vOOhjXE/PxOsEd+uHYX72jxkKMD61EOJhKBuXYJH9YsjFXhOHTUpj8mvBVhS7qJIpJSEIEpZh0gEH0Gddo+UlNp/JKz6BpI70x723PAJizpeNjn2U060l1RCHmZiWL2mP6v1cZWcgstR6cg4MXZIGMnNHBxJf9o//FQAQKnJ9zYzbnzf+la6VafCA/d/T3LluIAgy9smIyaTYEFfgdAYnCDJ9F0P6X5ZvBEFElyD9stDYelkaKA0/hW9aEViPXUSyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35c5fc05-a365-2f95-3528-1d80fbd229be@suse.com>
Date: Fri, 9 Jun 2023 14:18:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Xen reliance on non-standard GCC features
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Roberto Bagnara <bagnara@cs.unipr.it>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
 <8314e0fc-4ead-40fa-ef7b-4da8ce0655b4@suse.com>
 <80a512ac-d90e-930a-7ef7-8ebb5a80e801@bugseng.com>
 <968ba799-8fe4-e22f-b678-64e52f789026@suse.com>
 <9df8560d-4b06-2ab4-b09a-30241dd19676@cs.unipr.it>
 <4f5e33e7-9606-2cc7-79ec-c03cc724b6c6@suse.com>
 <8efd91fd-bb36-9073-654f-fef32d0da443@amd.com>
 <13d13f3a-26b7-ea99-8ba3-f868cee1e3ac@suse.com>
 <95de848c-8bcb-c16c-b196-d979f1ce0db2@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <95de848c-8bcb-c16c-b196-d979f1ce0db2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b680992-fb83-4b7f-2ade-08db68e39deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ULAFUIxfVkDfvJjpa48L4DsNiXR6WThf+QJKrN1QeWHutfanSMjeLoRd9Iz5tSfvcZL+CzvzvNn92HcKic3hUZwZVD/qn71njNnTQVqqeN2KD33CL4BVlTt1t7MlztvnA+TEMVKladpkYP1G41HKJbn0E02znQeZOed237r48TgX63Cilv/JM0UOYDjQYbzmC9Z5m31i9LmdibM7ccO9uI65o0YeqTSF2bgEBn3wmp/e0nZiTveS0ByRB4W39yfcKVT7A9nqOA0Tm8PE39DA4p6XLg+cn7Vlp6ysf/d1k9Qd4FljJj3Tt0wjKT8plgNsJwtPBBxotEkHTHl5yQVuUBKp94hsowTk0vbyJdOwO0nbTI49W91AdIP+UBmHVVZf+eKWD3wZ1HSO4p+w7ZZKlMjEMFFWYWvs37IxJd81vTQv1dkl12H0Zb+5ET76GcJPAjleEm1RwDOl6KzW4XBHA1t6g2xe4A+vpNiF8s4mJJdOtV7Z7phGzblLXq+gxAoqMclGyapZqh3GhqdYczI2teifl3ge0FfY6r4KHcgBhszTxm1zz7SB4567lS0nVsxuslwo8Tpc1z4004ZgCCE3wuJbyTWc5SAVbyNgKO8DePGucO7eDmenJ8msi7LfJfQ76aa5ScbrzrGYYpfTvXdYiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(54906003)(478600001)(8676002)(2906002)(8936002)(5660300002)(31696002)(36756003)(86362001)(6916009)(66556008)(66476007)(66946007)(316002)(4326008)(6506007)(41300700001)(2616005)(38100700002)(6512007)(53546011)(26005)(83380400001)(6486002)(31686004)(186003)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFNLWTVIMVBWRk4ySnRFRjhaVGMxSnE0eXVJNzVOMmtHN0IwcEJ2MHZVK1FS?=
 =?utf-8?B?N0tNY2lFVlMvZjY1dnZKR01ha2pLcGEvZFI1bWh2SWVQVmRMRS8vRUZvYjFs?=
 =?utf-8?B?WmxKMS9DQkZZRmRISnhPQ1NEdkxyU2YyV09MOU5ISElERzZselRENHNNdGQ0?=
 =?utf-8?B?eUFzRUV5RHVhVTYzdUs3Y1JVdUN1ZE80NTA3T24yeU5RMHJMUVM2eFlaYkFs?=
 =?utf-8?B?bzRveDUrTEladmNsT0JpdmIwY3lCNDBsQ2N4ZDRhaE5UUWVYdzlXSFJlKy9Y?=
 =?utf-8?B?WVhnYzUzSWNkem40MWRUL0xCTzJBVzNlR29haHQwSVVXM1MweHA3MVRTcTQx?=
 =?utf-8?B?WEFPRk5na0M0L1NYWklWMHhXc21XSXZ1SWVwdktHcXdQY3ZtYzlJMHgxZzc3?=
 =?utf-8?B?TzdOaUlTOUVqajhPWmNrTkV3KzdCZG1IUU5uWkJ6NTJFOXZJSXZWQk53c09G?=
 =?utf-8?B?LzRpeGhJQ1Y3WkNjVm5WelB0bFRUdTYybDNraTZFMXZSTmFLcWg4Tzk1cjYw?=
 =?utf-8?B?RTZzOWlBME5Pby9TRS80RUp3YkdYeEowRkVmSGdEU0czRnNUckdwY29Ib1hj?=
 =?utf-8?B?QkQvTGVUSWd1WlpJcUVzdkt1MEdOSlpGSHV3OVlhVE55aE4wM283MXVkZUxM?=
 =?utf-8?B?ZmdyczZCd0lDUkppbStsbFRRVkF4N3N1MkRxWkdiVjhiaHduNjBqQmxBdE5H?=
 =?utf-8?B?a0prbUoyMWxSNForQlZrZXhTQm9oRlhpRUVZaDBlU21IaWh4OUZYOWJtMHdp?=
 =?utf-8?B?RW15N0hqRDQwYzV3TXN2V2gyZ3FQTlNYaExZSkd2dXo4enBwTzA2Z3Q2Qm5I?=
 =?utf-8?B?QVozMmVZTWV2SS9SaFBOd2xHMHZqQ2tZWUxOQkYyQkk3bk4zZ1RIbzdGcHFm?=
 =?utf-8?B?RE1IaHZjRENKcjAyUmJXVGk4Z1FlZ0NUbmxWaFRRL1NSU0tSWUVhdzJtYitP?=
 =?utf-8?B?ZWlrT0FEMWwrRnJlOHppaVh1MFRyT2tvN0QwUWljSEYvY1E2Q2ZpZVhxMkMv?=
 =?utf-8?B?OG9RQ1JKM1RldnR2c0g0QnBPOElURnpxM0JwUkc4QmRkNmNSN0xNcW1BWVlL?=
 =?utf-8?B?Wm1lY2RmT0gvT3NrZmJtUFRvb0ovQUdmYW9TTFRoZjU3NWlUTGdXVHprTHlr?=
 =?utf-8?B?VUVoRiszTXBUODA5MzJiOW9vMHo0Z2s3VzEzUzRVZFBkSHFhK0o2ZmhsOVpQ?=
 =?utf-8?B?THd2bmc3SFlCSlV1U3lYYmNOczRmaHh4V0ZGOGNmVUlBWVdSaDd1am5OYVdD?=
 =?utf-8?B?TzRpVUxlVmxyajZ3SnFGd0s5SlNrSDlYTkJIeXIzeEFWeG80QzlYM1c5WnJL?=
 =?utf-8?B?WElBSmNxNHZENjBSbkxmTnFKU0ZEYk4xSGFpTkZXV2t5Y1FCM1lQVWx0Mk04?=
 =?utf-8?B?NUZMWXpZUGhqQnJyVldqMWF6aGRaSEVVK2cyR29CWC9SZi8vcTRneDF2UmMr?=
 =?utf-8?B?Tnl5eHhBYTFFblpvUy9uZ085T0VWa2YycVdqck9ya29jTWlCdE5VSlp1emJw?=
 =?utf-8?B?SVRoemptWmVjMVZtRlBsQW96Zks4Q0NJeThDMnp4TXVPWG94Q2RPYUdLaHI4?=
 =?utf-8?B?SDIreW5KT3dES0l4OENFYW0rNmFSY0xGSkd1RGFpbnVTV3NpYVhqSWJTL0dR?=
 =?utf-8?B?WmNUaVJ5cDB2Tm83RHVMQ0Foc0VIUlFMbHpNblhodDRwQk54R1c3bG1ITHZi?=
 =?utf-8?B?bndTRkJ2V2pYSXBETkJBOUJxb1NYenlUUmZnMGI5Zlc0YUhFbUYxQUc5dXNw?=
 =?utf-8?B?VFpCV1NJWHZFbUF5amNybC9Sa3duN1NQZm5WWjJPMXU5bFI4dlR2SjJMMENR?=
 =?utf-8?B?bmVweC9mR3BadWEwUTEyYVJPRVRybVpLSTdDdmc0SDNZQmdiVUcybU4wOHBJ?=
 =?utf-8?B?UHBaSndTMExBVDBmOG5pV2ZpUXZ1RGVsK3RmQjNiY0N6U3VBWDg0L0V1WnlI?=
 =?utf-8?B?MEFNTzZZdTNDSFh4WUZXSHcwVWp2N0pqZS9RdmRCK1FjSStWMVY2eXNaa3lJ?=
 =?utf-8?B?VUdSczZSKzlueGMwOGlLUWMyWHdPU2xhbXVYVFo3cnIrZVphMjNURGl1cHR3?=
 =?utf-8?B?a1BiWDJnUVY3QmdaY0V1dURLSktCdXVnM1dianFJNEpuQVZSUTUzaW5rakln?=
 =?utf-8?Q?fX/l3pfNJzIzMILu/6lJVsh3Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b680992-fb83-4b7f-2ade-08db68e39deb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 12:18:22.2602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPMtBrsReUbn5+D5bdEZoXBbhujh9EzdqdAh/ev4Axup24gtGbaH6XyAsL2kQIyPX0/Ahf8aOZ919uoOd0jzDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8428

On 09.06.2023 12:12, Michal Orzel wrote:
> 
> 
> On 09/06/2023 11:47, Jan Beulich wrote:
>>
>>
>> On 09.06.2023 11:36, Michal Orzel wrote:
>>> On 09/06/2023 10:54, Jan Beulich wrote:
>>>> On 08.06.2023 14:18, Roberto Bagnara wrote:
>>>>> On 07/06/23 09:39, Jan Beulich wrote:
>>>>>> On 05.06.2023 15:26, Roberto Bagnara wrote:
>>>>>>> On 05/06/23 11:28, Jan Beulich wrote:
>>>>>>>> On 05.06.2023 07:28, Roberto Bagnara wrote:
>>>>>>>>> U6) Empty declarations.
>>>>>>>
>>>>>>> Examples:
>>>>>>>
>>>>>>> xen/arch/arm/arm64/lib/find_next_bit.c:57.29:
>>>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>>>>
>>>>>>> xen/arch/arm/arm64/lib/find_next_bit.c:103.34:
>>>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>>>
>>>>>> Looks like these could be taken care of by finally purging our
>>>>>> EXPORT_SYMBOL() stub.
>>>>>>
>>>>>>> xen/arch/arm/include/asm/vreg.h:143.26:
>>>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>>>>
>>>>>>> xen/arch/arm/include/asm/vreg.h:144.26:
>>>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>>>
>>>>>> I'm having trouble spotting anything suspicious there.
>>>>>
>>>>> The macro expands to definitions of inline functions
>>>>> and after the macro invocation there is a ";".
>>>>>
>>>>> The preprocessed code is then:
>>>>>
>>>>> static inline void foo() { ... }
>>>>> ;
>>>>>
>>>>> where the final ";" is an empty declaration not allowed by
>>>>> the C99 language standard.
>>>>
>>>> Oh, I see.
>>>>
>>>>> Removing the ";" after the macro invocation is a possible solution,
>>>>> but other possibilities exist if this is strongly unwanted.
>>>>
>>>> We have other macros to instantiate functions, and there no stray
>>>> semicolons are used. I think this wants doing the same way here, but it
>>>> being Arm code the ultimate say is with the Arm maintainers.
>>> Apart from vreg.h the same applies to TLB_HELPER of arm32/arm64.
>>> I think also TYPE_SAFE would want to be fixed.
>>
>> Indeed. For this last one I wonder though whether it wouldn't be better
>> to continue to permit (really: require) the semicolon at the use sites,
>> by putting the typedef-s last and omitting the semicolon in the macro
>> definitions.
> This would be an error I think since the functions are defined using this type
> so it must be defined first. Unless there is a way to forward typedef.

Well, I didn't make the suggestion without first checking whether that
would (likely) be possible.

> All in all,
> removing semicolon at use sites is simpler.

Simpler - yes. But syntax-wise I think it is best if, except in special
cases, kind-of-statements and kind-of-declarations ended with a semicolon.
Special cases would be in particular ones where macro definition and
macro use are next to one another.

Jan

