Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FAB74EED1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 14:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561753.878265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJCV1-0004Tp-UX; Tue, 11 Jul 2023 12:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561753.878265; Tue, 11 Jul 2023 12:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJCV1-0004S7-RY; Tue, 11 Jul 2023 12:29:47 +0000
Received: by outflank-mailman (input) for mailman id 561753;
 Tue, 11 Jul 2023 12:29:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4LE=C5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJCV0-0004S1-Dk
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 12:29:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c48d1c8-1fe6-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 14:29:42 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8702.eurprd04.prod.outlook.com (2603:10a6:102:21d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 11 Jul
 2023 12:29:38 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Tue, 11 Jul 2023
 12:29:38 +0000
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
X-Inumbo-ID: 9c48d1c8-1fe6-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzojWCzNAN48CUvcxGTjnOA2SG3Z9dhXLYcXyiVyhLm14Qi7cYDDDudrS60Nt9QX9yYswAVljOHV2tDOY+u/0yeevttDE00sHx7hSGgiV1rT/KmQlUTyIBR6FzSLzvFJT+RnIoYFgZwzZrdea63+mPybmx+EDFqJW3n4uvS6DzPY89MbGIFDMf0xVz80XCG9RI/CnJqh87sqxjglVueGTaMkydssLwMabniFMeSpChaTtW2Ik54581SE8sPFydsSCSi49st8FFPXB5zBU9RgGjm8aIUPw5/dGwehkO5WJRw0cCCQ0KncRee+Ovw+/kuAzIpzN7QwbNWLvUaKdc8PXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syXStTI23O0+gCg0sti8utaiolLVGzGb5ZTsLDaYJrE=;
 b=lRRChI6etqlRmJtS/K38Fg3e3SqDPPPWSNukBdaRt3t7GGgfjzIh9O76wvs/axRZVcBfJmas9mCYVN4OtfQAFO6dL2gJ49NX2BtB8gS9gCEnWu81i+Z62Z6mzjHORGq16S3LkGSaJ3wTmwyFEnA4nD7wOLLYc5403dpBbpZ5rrpEkn8OTotvXIDEJeU6vTBiTzpgqCghrkJ52O8tVhro21dmuKuXiToIUg4Qm/eSQ+e27BvNj3QY3NjQ627zv+ZOtY2fx0vHB5hfJUrNxGcuKYQBBxGBOVbsh3MGfiTaOISIkzQgCBUGBQjjzh3n7MsBj9LT1JX5sf1tVFZaWa9eEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syXStTI23O0+gCg0sti8utaiolLVGzGb5ZTsLDaYJrE=;
 b=nt8XB4GIOIIZ6Ox+/ZpEJgRxo3coI4Au2qqgixeSqdu9dpsGPK6IPpbZ4Iw+0dRTxgaKbn4/F19jfYDRQ9uWkIKhlFE6c87MD9fPtJNIZ9Gr/7AZuzuZh+xmcmDsagiOrfx8fDo0EAYbsv66RdnTfLNVd/5smRXWVNXoCg91L8V1BI38Ysm00qtuXxLQrL4mR9FRamKUgiEA3SZ54qr40Jf/p1RK/qqq4fkd/U2qDYcaaLBNSmNhNmux8XpIMRpOnKhLE3vHyMGa3cVzWoQmr+QaYguuLfYQS4RLCEZ9BncTsYoUfJYvNZlbwrm6o1vvC6Q8TJQpe0ewoMcvlT0ruw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8cdf9179-7b3f-5a52-ff02-8ededbe03e0c@suse.com>
Date: Tue, 11 Jul 2023 14:29:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] restrict concept of pIRQ to x86
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
 <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
 <0cd9d94b-0a8d-a3e1-d683-04fac1572750@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0cd9d94b-0a8d-a3e1-d683-04fac1572750@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d666d7c-89a4-48e0-07e9-08db820a7e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C3Fh6WMvFxDwx0dG231K1lMyORKMYr2+x/zB6btsC+8iBOkfVhXTloqvoOSUZdJaxPDSrUTh0oGrc6p+YS7mswJOyV3c2pFEPrydtArp2CTiIFdidOZksB+bBusXb8oqtORs7qLrASw1pqgXyzrtpLqx600Cz3e/ipnOhDG6RI8imasqfqzCAkfRH/IJhuSpPriqxn8HZ58Zp/Anez+YjAM2uhAaAEfuVccHWR0muyUb6rKtZMlrIGhmVjVHN/0iPdXFyR9GqfBV50w9lLSbkW77aJmp43By7qdSXcNumPqQpvpSGlgYtmA/DhZgqniBoE+BTqtAv8Qi4lSkNWFbohH9RgyIJNuLzSD2kOrzcKMAZdImJA+NM+Bhdj74XAbwCemGJpmkrQ9yZPBmCqFMIYwc2ZL5xg+n5zy9nGJgzVgiwHUmYd/VD+iZNHRWyiDndXvCrG+yceO3novq9kqNtMZXwYOn3pXcCKmcKl7ayqDPsm9VXB2EHbKXgh7GMv5ENMameDS2Vazy1nBowDPxeF1gxKz1pDfYo8x5FSDmlLgEnBIgbzLN2hqi0BQ0DZVMZ2anxiI3J2/yo3S3ffPZMdoostJySZrLdFHz9FH5QpQIM2iHKNpZSOKdXyMqQqz22ss0KMZoN1M3XM4G/QBRLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199021)(41300700001)(2906002)(5660300002)(8936002)(8676002)(36756003)(478600001)(2616005)(31686004)(26005)(6512007)(6506007)(186003)(6486002)(86362001)(6916009)(4326008)(66556008)(66946007)(66476007)(54906003)(38100700002)(31696002)(83380400001)(316002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1dhYy9rQnZRR3dURERzR2cwNHo4Ty9CczFQMmtDLzRBQ1hoMDJxTlF4Qkxj?=
 =?utf-8?B?c1JxMGZVN2xtQ0kwelBXZTAzTDk0ejBnNFQ4S2JDV0UyQko2QXdmSUZqWkQ5?=
 =?utf-8?B?a1ZBcnk0eXozazVVUjZRd2FleFloREVySTRPRm45UE9nNkVocnVYelYwUFVi?=
 =?utf-8?B?OUNOcVpNcjhCY1NXYUdINlB2T2kyWGgwSGlSUGxuVGk0dEVrZEhFck9CL05p?=
 =?utf-8?B?bnlyN3VqV1I5UmZTV20wNG53dmdVN2ZSL2FMaUxSMWZUejNOT3FIcm4xYW9S?=
 =?utf-8?B?ZkFlZXNpRGJ4U1RjK0NVV25sWlZIbEdTanpmODV5MTJEa2pEWTh4Z2JjaFVR?=
 =?utf-8?B?RzF6N3M3d25UQmVTaG5RWnZhL01zeExKQU1aR1VuOW1pQ1JwZjBRWWY5OU9t?=
 =?utf-8?B?Y01zVGVWMHNXNmY3NGlvS002MitBMDNwWks0Zk8yVTd3MjNvQUdEVXBlOXNU?=
 =?utf-8?B?dXFSRTkxaGpsYWRQQkhSZmp6VnZUV1FpeGxOd3hITnBnaTdEMXN2K0VtNTZo?=
 =?utf-8?B?QVptRVhUcmllRTV2NG1IMEdkQzdaTXN5ekcxSnA5dlM2ckxxdFVJSitNTFcx?=
 =?utf-8?B?bGlpUVRmYXZrRjEvQnNtVWN4cHIrTVJqVWgyclNOUVY2dzdyamJ2Ylp3S3hu?=
 =?utf-8?B?RisvVUVGbjlFZmplaTVhV09ZRU5SMU93TTYzTFJPejdpRXJYaER4QVZDemIz?=
 =?utf-8?B?VnpQQW9IQjd1MUxPa01pVWZnSHZZUEo3ZjFuK3ZnQndueHJweFgrWWUxMUJU?=
 =?utf-8?B?K1h3d2NuVkpXTjFZUVBDaklhZ0JMTzEvd1FJaEdPYXBXWjJNbVlCZVh5Vytp?=
 =?utf-8?B?NThQZkFXWjNFNE9RN2F4N3B4My9oMWRLYVZTampkSkFsRlQzZm9taHRocDMw?=
 =?utf-8?B?a0VwU0MrbDBSMFVoVTRXaVkrckRoTmZUZmw4RW5qUkoxUi9xcVhoeWFFQUdX?=
 =?utf-8?B?L1c5VU1CRkQ0ZDl0R0xhTnptZi9xVE5uSXVVWmtOM0VNOTBmQUZOcTBweG1K?=
 =?utf-8?B?TnVPYnNKOVF5WTBBUlZPcXhWQmxlRUFGSmg1eDhJRi9hUGliN0RmaHducG82?=
 =?utf-8?B?cHlSRmVmSFNSNmVDUWVZWDkyUUFaWFI5Q01Da2RGZGNHenA5N0MvZzRmR3A2?=
 =?utf-8?B?Sy9obEdJZUZGSEI5NjBMQktqMDFjN2tSU0RrdGEvcTNKUUxBNzRvS1VZbzhI?=
 =?utf-8?B?TnZ0Ti9yZjM3SlptaDRyckF1SFlGS2FyTFpoSENpZFZqZkFYZ3FXQVZvek56?=
 =?utf-8?B?VjViUkZGd2RQN3Y4NmVNZ2V5YTBJMXdobjBwNm13b3dhR3RGdUFtZFVyT1NS?=
 =?utf-8?B?NUhNdDIveWdQNFJVaDZBb0JqNmJLK0d5aUxTcjhBRUdIaXc4VUdVc0ZabUhV?=
 =?utf-8?B?eDRlTGFMeG41aUdGRW1MSnVHcTY4cG1MM0xkY3hWdVN3SEVVaTZvSHBNeEE4?=
 =?utf-8?B?L3MzMmxFT0MrbDFZOTNzTnRJUk1BNExLSkVpVU1HNlZ0YW41N1JVUjlDT1or?=
 =?utf-8?B?M0FGTXZPRWZNTWRjSVg3QkhZQzk1eXBzN2RSMkdHU1VkRVlrdW1ZN3FOamMr?=
 =?utf-8?B?YmN4NjNzZk5zVXlaTVhoQ1JZNUYwTmR5VWpYQ2trYlBCaFYzU1dESW14c0dN?=
 =?utf-8?B?Z2pFTml5dzB2NUR4YXJpQlhxeUJiMnJXck8zMkFYQmhBMU41a05abDRtbWxp?=
 =?utf-8?B?YTVFVXpsV0lneFF0QmJualJzTGludGhCRUFqY2hUQTkzY1VMVXY3c2xZMkdv?=
 =?utf-8?B?SG5rY05RR3E2U09sNDl0U0Q5d2pGa1VBNlVhbXJrNVgzSm9FT2ZjUUVxSjZh?=
 =?utf-8?B?T0hCYWROSG1WR2hDK1V4QjVXSkZ2bWpRNWFPK2hncElEeDFKVHVNV0EzeW54?=
 =?utf-8?B?dFZGazEzRllGcHNGYVY0SU5Lb0NoVi9ORkJ3NGxQNi8veWZiNlhKVXhhZE52?=
 =?utf-8?B?blEzRnE2Z3dsMUdIMWdBaFNjbzhBb0cwYjF2NXJza3BrcVYzSXVyMnVSb3ZW?=
 =?utf-8?B?YjQwMVY4YXVmdUZVWkNNSHloSGhuZGtuYzFOSm1jUHh0SXhJNDJ6b205ZnFW?=
 =?utf-8?B?RmsvWUlrWkdRNzdFb2pmeUgrWlRuSEtINUY0Q1lwdnEzWHJYb0F4TTNFcUxW?=
 =?utf-8?Q?SqU+aXk5afSywKdnbSlzki+pZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d666d7c-89a4-48e0-07e9-08db820a7e8f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 12:29:38.8542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FqU6+v7kmY0mirzJGgilZ0aeXeiMlx64W7K6OlfODL+IRETQzGP9tx8+/09NvQdTyNCZ4eW1lq1q3aJzLjBmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8702

On 10.07.2023 22:59, Julien Grall wrote:
>> ---
>> I'm not really certain about XEN_DOMCTL_irq_permission: With pIRQ-s not
>> used, the prior pIRQ -> IRQ translation cannot have succeeded on Arm, so
>> quite possibly the entire domctl is unused there? Yet then how is access
>> to particular device IRQs being granted/revoked?

(Leaving this in context, as it'll be relevant for the last comment you
gave.)

>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -350,6 +350,8 @@ static int late_hwdom_init(struct domain
>>   #endif
>>   }
>>   
>> +#ifdef CONFIG_HAS_PIRQ
>> +
>>   static unsigned int __read_mostly extra_hwdom_irqs;
>>   static unsigned int __read_mostly extra_domU_irqs = 32;
>>   
>> @@ -364,6 +366,8 @@ static int __init cf_check parse_extra_g
>>   }
>>   custom_param("extra_guest_irqs", parse_extra_guest_irqs);
>>   
>> +#endif /* CONFIG_HAS_PIRQ */
> 
> NIT: I would suggest create a file pirq.c and move anything PIRQ 
> specific there. This should reduce the number of #ifdef in the code.

I did consider that, but it looked quite a bit more intrusive to
me than the few #ifdef-s added to this file. (The ones in other
files would be yet uglier to eliminate, if that was to be implied
from your remark.)

>> @@ -1864,6 +1874,8 @@ long do_vm_assist(unsigned int cmd, unsi
>>   }
>>   #endif
>>   
>> +#ifdef CONFIG_HAS_PIRQ
>> +
> 
> With this change and some others, we probably can remove 
> alloc_pirq_struct() & co. I will have a look to send a clean-up patch 
> after this goes in.

Right, there's likely further cleanup possible.

>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -683,11 +683,13 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>>           unsigned int pirq = op->u.irq_permission.pirq, irq;
>>           int allow = op->u.irq_permission.allow_access;
>>   
>> +#ifdef CONFIG_HAS_PIRQ
>>           if ( pirq >= current->domain->nr_pirqs )
>>           {
>>               ret = -EINVAL;
>>               break;
>>           }
>> +#endif
> 
> This #ifdef reads a little bit strange. If we can get away with the 
> check for Arm, then why can't when CONFIG_HAS_PIRQ=y? Overall, a comment 
> would be helpful.

As per the post-commit-message remark first of all I need to understand
why things were the way they were, and why (whether) that was correct
(or at least entirely benign) for Arm in the first place. Only then I'll
(hopefully) be in the position of putting a sensible comment here.

One thing is clear, I suppose: Without the #ifdef the code wouldn't
build. Yet imo if things all matched up, it should have been buildable
either way already in the past. Hence the questions.

Jan

