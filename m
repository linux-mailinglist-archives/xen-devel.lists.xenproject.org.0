Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C6D78EB84
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 13:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593809.926907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbfZN-0005sw-34; Thu, 31 Aug 2023 11:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593809.926907; Thu, 31 Aug 2023 11:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbfZM-0005pL-VE; Thu, 31 Aug 2023 11:10:36 +0000
Received: by outflank-mailman (input) for mailman id 593809;
 Thu, 31 Aug 2023 11:10:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbfZL-0005nt-3v
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 11:10:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00eacc77-47ef-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 13:10:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9196.eurprd04.prod.outlook.com (2603:10a6:10:2fb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 11:10:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 11:10:31 +0000
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
X-Inumbo-ID: 00eacc77-47ef-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnwsmqH70zCmEaqLIHQmGKEfIkhMp+TBGu4ny6l8s27dl/zpJBM19iEBp7yugIzeZCu8344WEHUz5NNZp4D8lOIZkm/D9kqnSQi8linvtOo5RchByHCZQjukt41qZh+5I16pC0uG7JbuOeyXFKmIWdcFNu/gL9DeX1iAtEqm7nB+fSWp1sYuQMeTXAa7wcpVYmhzP5bEsq7oFEBxdCKlK5uP6VgFRRRJCprcihfHam21oMy18GKZ6e1IEO72PQP9lGrht5zfecsi8Y//+lsaTbjF4VtrSc3ciJbl7n199EEkdVLPv7MC1wMPg+SdDmBrz9jEf+CR4IuT/86jUNAL3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRL3thwZf131cX3oc6B6n8VjvL8CShdV9Y5a+u6UwZY=;
 b=asYDcAA7DJXJd5qPWEuUI/m4oXRZiRR+yasCGp2ktvRPkx+aIevojgX/LfWbWoVXf8Mg35/abDnNUjFoYD6QsZ+7ukOSmk9D5lM8BQXh6uH8SXdTIdFBP38m1xzj4LLoY6Zi2Iqz/TQU8VOuS/mqczze4PIl4FJEQvT0TgM/CXKQL6j82o4Qv+7Ih8AuJ0TY6IOQY4ySgLu0KyfnwICH2RhJnFMP9cp1oBrw7x0ycqrUPwZDJsLYtO3fno1wP9hVXIl7KZbSyQ8N2goslJonBEqux8I05m2/hDG64TeJN64tV9p+zTZD6ZAsxxM6SmUG2U1EaqteM433kAHHVN0awg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRL3thwZf131cX3oc6B6n8VjvL8CShdV9Y5a+u6UwZY=;
 b=PRW6H614lZGeZVdm9d6y4m7go1KHVFZiRBoIiCpqpnNcvg/xJOEHSDWlSoe3pQSgo1voFiydDFmg8yqAXrNUAIcqooG1q5qqyN+7wcz98NTnn0vcYRXYKXSyDn9hyQWbSOuyZ3t+tioZEEmc/LvTvW0ya0Ps/ht2uoRVZR9SS3lR2ag4Xjr2z2ZUt8U4+4n56Dn1lJjEKRPbcBmLNb3VJeEU1oikmOkunjtv4Gk0aPCdZWrweLFhU29Z28gc85UlErnZ/srw5FVAIrnDvYkXfvAKlwFoqK9renFxx16g6UQUXRF+lVwGlqA3DQAAvDzB+6k8hBloJ/Dbu35LjbqdWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00866371-7adb-9cfa-267d-ee78cf14e68c@suse.com>
Date: Thu, 31 Aug 2023 13:10:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 09/13] xen/common: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <fe1768342df0cd9315af87c83cc6d8d09f61b983.1693228255.git.simone.ballarin@bugseng.com>
 <00d67696-7895-f4cd-de0d-0c24f937deb9@suse.com>
 <be7ba4ea-b5e9-cc00-a8d1-0fec82248b8f@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <be7ba4ea-b5e9-cc00-a8d1-0fec82248b8f@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: d5db5c20-bc54-49f8-9415-08dbaa12e3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KYApO2E83QaHAoiqvfGCSoDsoVrZXd/WHqVugdW7RT++hZF6lIB6bTWrHmgaU0OrlXu8tMbMwYxn5HcxSII4Rioi+p1Ubio7k7BQAf6IR/Uw5AkFzqaHF182jBlhPOJ9qp/ab58UGl/uFhJLs+u4lbe/Kr48K3Xx3DHjAEPVRCy4PuP+KdheB6CZr7HHtKkk5XeNig0SNKGMUNQvpkFJwjSDMo1iKkNWletm27+9FuAX+6/2L6iPukiAgKw3Rs2qR62JVhwqjkHJgz79RiMaRov3kVbpTaQX5l+fjWrrdWJvcpIjssXF7daxd4e1nGt2XCp3pHeQTjFypqzFhWwfyfCuVgujpXSf2gmY2+xiP6D00p6MiWWr6kVTZfQjCOSraQ9EEpNuDQvZdaaO9J5AWSw5EpCzS4uWYC3p5x4FDJYRHvRzaxwrmYu7r34ssumAkQzGYD7uw8yi9eLyeGjaSOyDEuGBwMMRHKQyHgRRnZCmIJZ3tQZ0+bnE9VakXzOfgZd/xMpIZkUJagVkB6/K+h/aBLnPLPcPzixFaAO3NsEIdM5em//gEygcKE/jLeBE86uWXwdpGImDYEOTbv9Woxf9HoYxVG8fmDYZod3L+/7FOEPGVObFWJg/KPJuc4CC9/nsEj7BlUblbr/hdfP+NvcJBcUW+9HznJ45XbbmdLHXhl8CbcGyTKwnMiExVHml
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(366004)(136003)(346002)(396003)(1800799009)(451199024)(186009)(36756003)(26005)(86362001)(41300700001)(31696002)(53546011)(6666004)(6512007)(31686004)(83380400001)(2616005)(6486002)(6506007)(38100700002)(8676002)(5660300002)(4326008)(8936002)(66556008)(316002)(54906003)(66946007)(66476007)(6916009)(2906002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OThjaytDaVdWTGZ1WSt2bUY1RVl6eFI3ZXJRUUNlTnZJRkY2L2tGZXVCZHUy?=
 =?utf-8?B?S3lsbENQaXp1aHdNczNXa1oxT0l6UzNCOW9YQWxhcHRWRWpQUy8zNDF0L0gx?=
 =?utf-8?B?REd4L2pkd2JZanQyd25KQXVLQ3Zvb2NNcGltZkNvZHp4WTJnQUExTjA4UTFS?=
 =?utf-8?B?TE5YTTY2eUVZbTFsZlVBWDg5YVNmalJxL2tiRGhTT0ZicjlvallNajNwZlR3?=
 =?utf-8?B?eXRuSkV6ckliUjNaNDVROEt5b2tyQ0dlNjdMVWJoaGx6eUMzdXhMMmNLWDVW?=
 =?utf-8?B?ODZJa25NNUZJUWxQMy9vbS9pbVgxRUtld0FzQWF6ejdJMlI0d0xOSithVE9H?=
 =?utf-8?B?N2FEQ3l6NEFsZ002dHFMdU9QQ24vb056KzBreHJOb3JBYzN2dGRNMlB6Smps?=
 =?utf-8?B?U2F5YklWRXdaaVY5dG5SeFdSWUJNM3JHUkgwYkxVaitHNzl0SC8zN1lzWC9T?=
 =?utf-8?B?Vkk3UGVxRXlZNUlsZXJ2WHp4ajdDRnVFb3RpNzIrVzYreTZJbVpTOGNYbk8v?=
 =?utf-8?B?UXE0d0QxV1RJd1BFL051OExJYmVXd3c4T3kyZE5NVE5uTFVPdEdING04MXVL?=
 =?utf-8?B?SThxVDRleXNyTE9qVXNLYTJxMEllcCtqcEZWUkNJMkcrVEpDOEFBNVNTKzA5?=
 =?utf-8?B?d2sxcXhjVEwweGhlL2lzS0RDQXk2VEZrNllqMlQxdmpNL2czVXc5cWxOODNS?=
 =?utf-8?B?bU1XK05aS09FMXZidHJmWGFXQXRxbGJ1aDJBcFpQSCtmeU5EdjZnS2JTbmJk?=
 =?utf-8?B?d3h3VG9XLzViY21jMWE5V3AxK2tMd3A0MXlodG1objFPZ1JhUTdOcHE4UlVH?=
 =?utf-8?B?SERRcnpBS2Y1dklmWURvZ1JkZmQ5WUtFSEIremdKUXZLb1dtbFplVlJVMnNi?=
 =?utf-8?B?ZGY4ZGJESE1tWGlhdXluKzc2ekpJMjJwWWFQZC8xcTZGNlJiWE16bk41YW1V?=
 =?utf-8?B?K1BnYzBTYi9VL2JBWG5GV2N5MzZtWkg4R01QeGJKSkJta3BVTkpmdkQ1Sy82?=
 =?utf-8?B?Um5jeGFnNVR5RmZydjF0VndocDhHbERRYmk2bEkwbTlBMTZzUzFhdGQzeW1M?=
 =?utf-8?B?TWh1Vk12QnpMY284cVI0QkVQbDdZSExTVldFSmlTY1BHUHdrSE9wcjR1Y09k?=
 =?utf-8?B?c05seXg3V1IvWFRBMGhhd0d3L1VBOVhEK0pGVzI5cjBXeW1YaS9uSndTbUdq?=
 =?utf-8?B?bC81TFFxQVIyQ2piY2gvN08xeGMzK204T3VBZ0FaWkwwTmhSL25XbU45ODgx?=
 =?utf-8?B?M0pNeXp6MzBoTGpwZXlhbEl6S1RwTEoyNHFqWDFEODNZWFFWNENVZCtjcHhJ?=
 =?utf-8?B?NjY4cG1ySzlOcXJYVnFwNFExcVlPd0hQaFFoajNydVRSOWtLc0ptenNjYVlY?=
 =?utf-8?B?OFhYd0xsSUI0djBDdnkyRzZZbU94QllPQXFtZ3Z5N2hrVDhlUmpqUDFiMTNS?=
 =?utf-8?B?RTJiZkpOaFNia2U4d0hpUlQ4N0JVNHVwOThpSEpuYThheTAvMWF0V3JHTGFS?=
 =?utf-8?B?a3gxZ3hxT0lXN3pTeWtvTW1tRWZpZkRPSWVhL1JqQlFlTnpueGZkMWVSWXdT?=
 =?utf-8?B?N2J4dW8wY2JxdE1ISWJhamhtQU5zOW1SNzdYWkFtb2wzY0F1alo1UEdTUEpJ?=
 =?utf-8?B?QllnTGpFeG9LTU0vMFlrZktiTnlUZ0cvMFFFTExrV1c0Y2MyVnZRSnVUZ3Jk?=
 =?utf-8?B?MFNsVTBzc01zcHBNbURqbXlzT0NPZ0IwZEFjZWlZU3l1aHE1UTdrVUgyVEh1?=
 =?utf-8?B?RElLbmMzVEQzTUQ3TUxvcUZRZEU2aStzcHdEU1NPNzVtZ0hNdXBCTnBzd0ZX?=
 =?utf-8?B?QWRheTVEMURkQ05OMWRra2pmZkZsQlh0VEUxTUdwVXNxaU9NSXIvRExlSnEz?=
 =?utf-8?B?bm9zdGFTTDNxakZZTGxhRjdMcVJZejlMV2NscnRucXptVE8zcWU0UEIvY2xu?=
 =?utf-8?B?SDRhS29QSFg3dmRQSDVRMzBXMlgycDJyZy80bXM5SVRrdHFNNmJSVlhnRnU4?=
 =?utf-8?B?MWtmekYrVHZxRVE0Sy9PN1dMSUZ0b0dHblQ3dVVuZERHOVZEOS9EYU56eXBM?=
 =?utf-8?B?SDFjNURUWmhPRStrM2twOUpoQ1JPMGw4UVlpblg4QVhzZGtzWXhmc1N5UmJP?=
 =?utf-8?Q?jK79d2xsHJscBsMgdCLlYCLUw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5db5c20-bc54-49f8-9415-08dbaa12e3f5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 11:10:31.5077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5emaeQrCow+B3e1g9p6QewTDewFTzmI5Ot8eyvEwMEsnlWNAVtUvMNpDIPUhy++0VI1Sx38rG8/jC3CLDMQGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9196

On 31.08.2023 12:08, Simone Ballarin wrote:
> On 29/08/23 08:50, Jan Beulich wrote:
>> On 28.08.2023 15:20, Simone Ballarin wrote:
>>> Add inclusion guards to address violations of
>>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
>>> to prevent the contents of a header file being included more than
>>> once").
>>>
>>> Also C files, if included somewhere, need to comply with the guideline.
>>>
>>> Mechanical change.
>>>
>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>> ---
>>>   xen/common/compat/grant_table.c | 7 +++++++
>>>   xen/common/coverage/gcc_4_7.c   | 5 +++++
>>>   xen/common/decompress.h         | 5 +++++
>>>   xen/common/event_channel.h      | 5 +++++
>>>   xen/common/multicall.c          | 5 +++++
>>>   5 files changed, 27 insertions(+)
>>
>> As already said in reply to another patch, imo .c files shouldn't gain such
>> guards. These are commonly referred to as "header guards" for a reason.
>>
> 
> This is the MISRA's definition of "header file" (MISRA C:2012 Revision 
> 1, Appendix J):
> 
>    "A header file is any file that is the subject of a #include
>     directive.
>     Note: the filename extension is not significant."

That's completely misleading terminology then.

> So, the guards are required if we want to comply with the directive, 
> otherwise we can raise a deviation.
> 
> The danger of multi-inclusion also exists for .c files, why do you want 
> to avoid guards for them?

Counter question: Why only add guards to some of them? (My personal
answer is "Because it's extra clutter.")

Jan

