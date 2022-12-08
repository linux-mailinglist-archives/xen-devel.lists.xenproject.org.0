Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28063646AE7
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 09:46:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456900.714757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3CXH-0006Ok-FJ; Thu, 08 Dec 2022 08:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456900.714757; Thu, 08 Dec 2022 08:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3CXH-0006Mv-CA; Thu, 08 Dec 2022 08:45:43 +0000
Received: by outflank-mailman (input) for mailman id 456900;
 Thu, 08 Dec 2022 08:45:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u3z7=4G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3CXF-0006Mn-OO
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 08:45:41 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b16836c8-76d4-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 09:45:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8587.eurprd04.prod.outlook.com (2603:10a6:20b:43a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Thu, 8 Dec
 2022 08:45:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 08:45:38 +0000
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
X-Inumbo-ID: b16836c8-76d4-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDB8p4k/F1MW6nzpMqd9pj7PCnhDfX9v8i7qc72KWvknKL7EDY8cnfFbghy5e/R+MEXo0Dh2itJtBX4xFy/UldHL2KEIuy1GdZ6pqjDS37wkcWo8AY8SXS8vAtuG9NOYcQpu3yZd1giOUb+qtDWz02ID+bMIv0vE3JOJV0m3CXOa9jYW7KkumJEAB9wItCd+bVjcLYNrElk/LXYw4OfewjLayXDA2WDEjfexwCS5R6GyTzcCMeHiUqlilQ28I2VHfs8NYnpy3mixrr5sPgw5ZFHMr4ysENoIYybuODPzJ0m2Q510Oy+OSVhHPaVFbakWFFDRYgM7Frwc16FXVl8bRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cXfC24BVk9TGe/vnlgXvSOcumKIW/PmZtwKihAIjqg=;
 b=HuOZpe6busqEmr7QLhRp+ZPYhJNhB2DykKKQv2sXJXTYHE/1eUjZ4fiGHA22jSGzpLr8+Tyalmr7E/9XiWu/Z2GgdrGGMLo0DCTtHWlC7f7A7s99BB4pOutwDZxXVXS8/PpMbOpVXs9X7NvKOyHdcAJZHQw2mHmDRqmLVdLl0AQriWZLXOFRC0unOoz9i9m7TAIIsrEXLNeuMg1oZjjK+Eom2/HIzpxiHZhba7Ob5ywQVFUjGIwFhUXgvThYrjgGy9phAGBq3Fnkri7oaAbkbPe2bB23mJFD1Id1qZIJ2BHcPEVhsb4UynoMFj+Ygi84obVzCFWJjtqCiS3Gg3iHCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cXfC24BVk9TGe/vnlgXvSOcumKIW/PmZtwKihAIjqg=;
 b=qoH4R8NEdv+OFS3pyejZPE2RIlW/CrNg6FyICXt0cYx7ClID2I0aBtTpm8QcW/TD8hHl5m7uNT8pM1MUSolGxC+kpU4qyDsVscQ+Q7M2vgHwy4MGCtUBiiheMNo9CWrY2cJC9Mpgt/bGnVmVQsqYmSVE4hP06JE+4xJTDEA6CNZrasphhgG6w6hcCLNoCYO/2pwpc60iQz4fYsxENNgoTRRdIHxYGIwwC0AqPOlVkdhc4FPip4ycUWM1CC9r2I3XMjmwSH636snsvm7Y7pK8UbH9grq3AgT3UIpDCJL4H8O+YLX4ymPL/E84EmJ6rUXuNKETpLe7IC4fTnv6fpZE8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <31c7e7f5-9add-3c77-2d70-4eb2792207d5@suse.com>
Date: Thu, 8 Dec 2022 09:45:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] xsm: misra rule 8.4 fix
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, dpsmith@apertussolutions.com
Cc: xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2212061808570.4039@ubuntu-linux-20-04-desktop>
 <d9ea8f69-8cbe-abda-4ca5-b71b502a3fb7@amd.com>
 <1a1a478e-76bd-2744-4a74-25e8af76d051@suse.com>
In-Reply-To: <1a1a478e-76bd-2744-4a74-25e8af76d051@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8587:EE_
X-MS-Office365-Filtering-Correlation-Id: c214a7bf-209d-4812-bc55-08dad8f894ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+uD/jVLFxq0mP87/187ywGozqs2WvXJ/QPDNX4cdImEmRsYovk2gwj2vgW9sdt2EA0z0ZGI0/CBRcA7wykNeYu69/rZOyYSSHx27ow3kgVy66aD1hoEp4xYHmoEce78LcwzHmgf3lbig1+FiteSeNFHb2gb2Q2tPRdHXh0nQsIEhWO8Jdo9beFIZPgaFRyKzOrbIIHposiQR3LHDUMUvL2eJShlKetZcvW7+7PNz7BRm1NCy0JhgApFEa/2XNRnE6LK07opyQmb1bilTBPaxnK3GBVTd9LDOHbKsNBYDaDPy6EzT8DOEA3tka6E2RlyXmmsBPsSPOMrVeqTnIR2A2I6+1zbipQTLHeaLbf9sI6EMUuQ8hnw0BiJyVZD+NLdfTdKIr1xjbZqTKyCUlm7GkejQvsWg1aeg2gOW8k9lM6JgzCYHyOvTKvKzj3Po+IraucCWrzUzPRMYp0D3EN1Mf5Gsy/8wyF0Zec8foAx8r9W5/9OWGdRkRtMNLKHzAQWDjOw4OGBY/0lhTolcoRW6hwtVlNKGhxWzF57hQ5hUZBtqfJ8upirb7Kp4IrIlvGAN2ZJ/Kp3wMo3393zSWrvrAvUtj7w601sTaRWdjqKC/mqT3XaZQLRGPSDdDafVCmf7bi0+KJKsIUPaKXoBEaxl97IAyD6MaWs5QvYR/0SzdkflzLcwBiPghGZTkuip/Cw4kHxYz5ETf0kdod1k18p3J90sWBXcsSufViReFZQEwq0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199015)(38100700002)(36756003)(31686004)(86362001)(4326008)(8936002)(2906002)(5660300002)(31696002)(83380400001)(66476007)(316002)(110136005)(66946007)(2616005)(6486002)(478600001)(66556008)(41300700001)(8676002)(53546011)(26005)(6512007)(186003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmNIZi9sdWszMWdNL2xaN1U0M3pWVVQwUENCaGdaanBvT1pRKzlmTlFmbFht?=
 =?utf-8?B?TU9ldy9oSWo3OUJ0Zlo3UEpDU1hKMlU3OEVYMWVpUzZBUVVOaGd6cUUvRnNJ?=
 =?utf-8?B?SHN5SFJpVHJ6Q0VtWUFiNUdSRTRvSUFNenUvbVZ2bkJDdi90TVQ1TVhub0lL?=
 =?utf-8?B?T0xCZHcxMWhzaWJiNitIb0FqZTBjSlV3TjRHdHVMTG85bGMrQU5IeGxMdWJ5?=
 =?utf-8?B?K0xVQ3hGVG9weklqRG4yR04waWhUQUtVc3NrMlcvL1JPMFdkVnA2V045clVm?=
 =?utf-8?B?TldSdEJldmdmYVRWWG1XWWRDQ1NLNGUzZUNlOVVTbHJ5RTFYMkpuWk5vMm1p?=
 =?utf-8?B?YkRtY2lSUytOZGY4d0FNQWw1MSsxWmJSY1MxTkFjcUZzS3hQbGpuR2tsQnY1?=
 =?utf-8?B?ZTY1YzcyNUVicjZMWW4zMW1kbHE1Y1dvZE8rSVJJMlVmUmc2SmQvSlQzS2ZF?=
 =?utf-8?B?UFVuZHdqYVlNVUI2L3R1blBLWWdodHRqRkJSR3VXeVZsZUU1U01kZEkrcnZL?=
 =?utf-8?B?aThGaDhHeXhJMzBRL2hMMVo2eHArODZ1SGhDWmlMemFESkR3N0JHcGJ1d3lz?=
 =?utf-8?B?blpJNlRBakg2SURmODR2aWkxZEZJOXpLS0Q3VUd1UTljbUcxMi9XNUtEbDc3?=
 =?utf-8?B?TTlmTklMc1hXZys4QjcxMkhueDRPU3BrOHQyRzFZdlMrVXNIcUJUY3dPQms2?=
 =?utf-8?B?K1d6b2hJSjh1OUFPdXlFRjY3SFp3dXJFSWpSMU1PTElrNzYzTHlTS0pXZzlT?=
 =?utf-8?B?YlZKMzJ0ZE1GRjY0SFZJck5rRFh2ZTFaaFlobkNOclpIT1NoNWZxWGZBOE9x?=
 =?utf-8?B?bklFWDFKcUFtR2F4TldaSG1sL0YveXlFMnFrOU1YUUZxcWsvSzRzSW9Gc1hj?=
 =?utf-8?B?TUlzWExlckI5RmM4OEdRLzdPNkd4dFFMQ2FvSEIvWkJRNjJjWXJtbW5Jckho?=
 =?utf-8?B?cHZBdTBiYXI3M1M5MlNpUFpMVU1Bd2ZBcTRSV1RVNk5JNmJkV1BiSlhmN0RC?=
 =?utf-8?B?SVRaY0YycS9EaHhTTnZ2Vk5UNm15d2xzckR6WWJjbUJLWnNFbGlYOERkOE5V?=
 =?utf-8?B?ZDZvS2VOVGpnSEtrYld4NnZiUlNGL0htMnFxWnZIdmJRNWdQVEtZS3BMSVR2?=
 =?utf-8?B?SGlMUVBqd1BwYXFkWHpDVjMzbGI0Wks4eHVZRkhNcTZJYWFoV0pJeFIzeEh4?=
 =?utf-8?B?NzRUaDBWZlVyb1NoaEFyYmMyVzJvVDJoOXNXSG1yRTlDZUMzaXZGVTJUcHVj?=
 =?utf-8?B?S0g3QkJFOC8xWC84YlhUdjFiZzIwcnpiU3J6bWdIa21qVUpKOXI4eWg2V3JU?=
 =?utf-8?B?cU1KOWhPMWxlVHhYUGN1Nkp0RHE3MFlTN21Va0ltRll0cWlRRk1NMTE0YUFS?=
 =?utf-8?B?SE9UNUp3ZjkwR0x0QjNYMmRPTUIwa205cWJIWTVSbTNtVGIyRW1ZTTl6ZmJm?=
 =?utf-8?B?ampZZnE4Qk04T04zVldGN2FnWmVwN1kwUnA4UWlmdFd3TlpYNDdFKzZ4ZEVa?=
 =?utf-8?B?MmpBanp6TzNKK0ZhQllwWkgzNGRzWG5mQkFWL1F0bUZRVUJpa3pFWVFDNWtK?=
 =?utf-8?B?MFRyM1YycTcxTlByY1hZc0QvV0Z3YlR4RjAxVHBQczNEVk1sMTlGU2JkdUtY?=
 =?utf-8?B?VFh2aGFYUG5VeVdqUzlQOVV3SjJqdjJNd1hjSXRPSCtkRm9qMy9PaFcyc1or?=
 =?utf-8?B?blM4SkNBenAzdEJqOXlodnNYRmgxa0JWUVl4Q0V3V1RwYkRIaFdMdmVrR2Vz?=
 =?utf-8?B?M2NYOWNjQnV3WjZTZVhVeW5Ba1l0dGdVUWd0eFhRYmQzTndhOHZ5UG1RTDFT?=
 =?utf-8?B?TWprNzN3R1hFQjJrSVpCQ1Y1dm9TcmwxWUhURXd4c010VzBoU0RweVlLcWdL?=
 =?utf-8?B?WWZvRFlIcndxMVM5TjlqL09mT1JGRHpDbytweFhFdjd4ZmRWdWxsS0c4R1dn?=
 =?utf-8?B?T0lhVEN6SEl3UGNHRFBkdmhVWnZtSjdyeFlXbEVYL3MvUVpnMHJ0dlAwL1g2?=
 =?utf-8?B?YklxU0s3dUVIcWdJa25oVVN1dnVlb3hBWW5VUkpScno3V2dXNTRyZEMzdWZ0?=
 =?utf-8?B?YVU0REwxWmJHdlA2UUhFbW80QWxvVzBMRzdkVUFLRzhGU0krTnlmMmFGdURG?=
 =?utf-8?Q?9cIjjlxF1eLmZanFFLCCZKV15?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c214a7bf-209d-4812-bc55-08dad8f894ac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 08:45:38.5746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GCvgM4/E9xTDpZnwMHXtRnDhqhBvrgrwUOdupgW/VVlr2XdyBxh0ma/Ncu6KLuNjmwroVGerAF4fzDcjEl1ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8587

On 08.12.2022 09:14, Jan Beulich wrote:
> On 07.12.2022 13:33, Michal Orzel wrote:
>> On 07/12/2022 03:12, Stefano Stabellini wrote:
>>> Fix two MISRA Issues Rule 8.4 ("A compatible declaration shall be
>>> visible when an object or function with external linkage is defined")
>>> found by cppcheck affecting xen/xsm/flask/ss/services.c.
>>>
>>> Fix the first issue by making policydb_loaded_version static and the
>>> second issue by declaring ss_initialized in a proper header.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> cppcheck also reports findings for rule 8.4 with regards to the following functions:
>> - security_get_bools
>> - security_set_bools
>> - security_get_bool_value
>> - security_get_bool_name
>>
>> The prototypes for them are stored in xen/xsm/flask/include/conditional.h,
>> but services.c only does:
>> #include "conditional.h"
>>
>> This include refers to xen/xsm/flask/ss/conditional.h and not to xen/xsm/flask/include/conditional.h.
>> This means that we should also explicitly do:
>> #include <conditional.h>
> 
> And Misra has no rule disallowing such use of two different, identically
> named headers, for being potentially ambiguous?

Actually this is even more fragile than I thought when sending the above
question, albeit still working correctly as per gcc implementation defined
behavior. The further weakness stems from

CFLAGS-y += -iquote $(objtree)/xsm/flask/include
CFLAGS-y += -I$(srctree)/xsm/flask/include

which was added for out-of-tree builds, rendering in-tree builds search for
#include "..." files in xsm/flask/include too early. The only thing that
saves us is that the current directory is searched yet earlier.

However, as per gcc implementation defined behavior "#include <conditional.h>"
is likely wrong to use anyway, as this header can in no way be considered a
"system header"; it clearly falls under "header files of your own program",
where "own program" is Flask here. For being a system header the file ought
to live in include/xen/ or include/xsm/ (and accordingly be included via
"#include <xen/conditional.h>" or "#include <xsm/conditional.h>"), potentially
in a respective subdir there. My view is that these "#include <...>" (there
are more, albeit non-ambiguous ones) all want to be converted to
'#include "..."'. That'll then also eliminate the ambiguity with conditional.h
(as one will then [need to] come with a path prefix).

Jan

