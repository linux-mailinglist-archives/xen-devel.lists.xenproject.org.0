Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81560765241
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 13:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571033.893883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOz9y-0007g9-TK; Thu, 27 Jul 2023 11:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571033.893883; Thu, 27 Jul 2023 11:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOz9y-0007cp-Of; Thu, 27 Jul 2023 11:27:58 +0000
Received: by outflank-mailman (input) for mailman id 571033;
 Thu, 27 Jul 2023 11:27:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOz9x-0007ch-C4
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 11:27:57 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2080.outbound.protection.outlook.com [40.107.13.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1c36661-2c70-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 13:27:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 11:27:25 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 11:27:25 +0000
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
X-Inumbo-ID: a1c36661-2c70-11ee-b247-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBGddS7JazcrSuHDW716ap69wrlkkP/Zh9Pl0YeVoBn/Ia9ryB350AaRH4wVc1rnLDtPSG4hxnT8LC0uteLle7EgdQ4+D6miLQpGGkSDLBIJklydBMDFlBJIa6sTyp9skPTE1FAlIbUDsLQyIvdaVacfXUszsleV9/whn7wlCZ9H5474SUplijaHFhvftoMyRAIGG1fZD8sHPkQS3CJEd6qpMXmYlMOmX7+UNfOtKVO2RIsZtn3TyE+y3XFEyE552yaePkYnGfuOXMWct5h8j+GTJO4EwfeIb2YWHXMNqOUqOd37HE323k3Qq68VgDcMv9AfGcEk8hacnEhaQZCf5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyrbDGTEaI8lZX5HsJm7bC/L+4G+KfvaMIdhYnjCcAQ=;
 b=fcVmbdgfcYw800YOKfpkXc0i54xPIgBMybJ9LcwK7or/S8lr3P58WrdQVcmoI32Zqp+kKfcdpDxdsHNI0JC0BBMOvni6VJRxXrUsrDLRFBuoTD0TB8imjLwERnmf0OfoVsSJRTEEB6qwQJPWGE900F3mttYKpbT2IpE0zFLCnMPN94rWJUJzYHT1ld6JLlQCTSaounrFAA930YtVc5Qf26uUmyV5ddV8ixGS4EF4dPVTu8kfYIvcqfAoZbkj0z7O40J19Kw1tpsciOMzJINeRVeBIUxtwTT/0AhS0oiw2gXHHFeDaXFEW1sqoMuqPIb423qZ8oCb3QoiKHcNE/PpKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyrbDGTEaI8lZX5HsJm7bC/L+4G+KfvaMIdhYnjCcAQ=;
 b=3VEKUrdVd07rrEhyzxjQ2Ts+G4etAQM+sX2t97swaLil3CDOEM9iYN4bpj0cKTXGFGkm4lU7RVfGHEj7Tnt1reiwy59IKPGvxPHreMZPub/wE/W9q9LSot2xLjKMMGNPbbpo9nYpgSViObkZ2xSgxFCMY5o++ut46TC8uuq3SmJmMQTJWBsr64HHRUVexlj0E43iYFteSBYyj3R23uQlLRwvpQJVjgFuuwdXmXdpRm0w7U1i86iMnZju/pZ4QsD1vycfIOPLZ9BBvQqSpm28U4n+svt/yTBUoTtPI2jtWu8qh8fQIgkCySIObKVnZr7Hv73cHaUsDCsCLHsfRyW3xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f479517d-10db-4723-65a2-38c85f72d96e@suse.com>
Date: Thu, 27 Jul 2023 13:27:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 2/3] xen/arm: irq: address violations of MISRA C: 2012
 Rules 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1690217195.git.federico.serafini@bugseng.com>
 <a62e88a9c29cf7866c251968b5a5b6865aff4a2a.1690217195.git.federico.serafini@bugseng.com>
 <a81326f4-e018-b461-ebec-9ef2ff5dc4df@suse.com>
 <alpine.DEB.2.22.394.2307251226180.3118466@ubuntu-linux-20-04-desktop>
 <31b72cda-2ef0-2f3c-4e83-948d7b763f19@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <31b72cda-2ef0-2f3c-4e83-948d7b763f19@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf9c66f-21db-4e12-79ba-08db8e9473b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZMe8YdwrD0mKOZLEQaRrEgxHIG93T/TwLHylP86Q2T4KALmprnRe8gV6W4Z16h3MsxzYYSjk4p9ftrAdV4SbVU8EexMo9bor5X5Df0SXM9jyBttgAcKlp+G5dJQXPgCtjli6LTNE5XfHy7054WMXNKV4k5/GM93Gvx8vxHej8BV+Z7JJpoqs2gdGkiYBuenKvawnS34XLcsl9jVCU6W7oDkGRk8WDTZovHx7KYUVv84LPkb20GlkwN9zt1D7Kmwmt6x12aCfw5I7X8b2KLKPy6uE7AL0265r8JDnWcdDIhyUoWHv2SZbVAqZTQ20BOi8qUCankSXrNJz0vlh53IwjEwcIz5DFQDYy0CpoNEhPqhe2ODNqiuD7G5jIDR0vSAWogYaunuqdT4BGSLiRBVHwDuZJl/R5hLE8cAMsEpjVQHDjmuy44DU0eZKpMwJcFE2AWGPEnub/rjfHyARo+pU6s3jAhcAHtDPUns2zpZrZN2ZrUDl7yHe2dkMYxsePjZDyjZo3bBNhWcRiUXeRIIbdWPakKcXLMpG7resm007SOhlwJDBR3hiYPSA/aWaEzwzYxJzEN9YsKZL6YOHQkFkTpAdXJMWsd+8Psovn3LwtqlzXI5mbESGw7/R/OptjGWPzA2NAwzercAEtLcHcOJs+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199021)(26005)(6506007)(54906003)(478600001)(53546011)(186003)(6486002)(66476007)(4326008)(6916009)(2616005)(31686004)(6512007)(83380400001)(66556008)(38100700002)(66946007)(5660300002)(41300700001)(66899021)(316002)(2906002)(8936002)(8676002)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anVzYkRYclRDRVVtVTNxM29DQlJuckhOM0tYSFByOG5hL0RLYzBjYnI1QS9Q?=
 =?utf-8?B?Y1FPUWd5eTZEeVdFblV4RVdSbG1kUkVXR1NiNGZmZmsxOFZobGJKZ0Jhaldt?=
 =?utf-8?B?cWdLZ3B5emxsbHlTYkdaLzN2aVNsZkRlRFJrdXRkZkwvSEZtV2htL04yWmh2?=
 =?utf-8?B?UjFoTllFODArR2J0QWdoUGFvTi9LRDlBZ2g0UWlla1lEdEo0SWpSVmdsdVJT?=
 =?utf-8?B?RnZNQjQ5ZklEYlAvOEljQ0lITGtFSndxcFdNTkpQYmx2Z3Q3a3FpamtaTWhy?=
 =?utf-8?B?RkFIdThxK2J2cEFrSmFmOUQ3MlUvcnZBaUZoQkhJY2JLbGhBQ0t0bVBEMkZq?=
 =?utf-8?B?UEF4UDUvRm9TMjVFWUJDd2gwR0FPSnczVVFxT3M5NDJDNVBQa0ZXT3RoMFlh?=
 =?utf-8?B?aXJuZVlVcDd2VXV0QXpDUitmbXB4Zit4aHhqbWhldzFlSFZBWkxMc2FLVEU3?=
 =?utf-8?B?QzVpeWxRSFV6RzFUZTJscDVTUld1VllmUHBiL0lUYmpBdy9OTlZoRXFVYUdR?=
 =?utf-8?B?dFpKV0F2N3J3YkMwa3JVOWd0aG5kK0N6R0NaeGtCNTY4b3lURktabWM1WGRw?=
 =?utf-8?B?MVBNT0hkRG9SMnArQTQzbXRkS2UxczJmaUZHVUR3dlNuclNraVJ3UlZRRTMz?=
 =?utf-8?B?dis5UFhzN3ZCMy9oWlVReHJTU1drNHZLUENBZk9KU1gvT3dHNlMwVnRMdXgr?=
 =?utf-8?B?UVh1a3hKZDFvU093OUJiL1ZlZTNZTkkzT09YSnA4RmxsUmUyNlZhRndWOHhy?=
 =?utf-8?B?Y3NYVGFhcS9jKzRxMVRmWDlHRUNSNVpDaVJuVk5NWlJxb2ZNakRWUkptOGQ4?=
 =?utf-8?B?M25LLy90ajEwM3JkUk9WWFE2bWIyRHp3UFV5S1RRZjZGUEg5anpkTEJ2eC9W?=
 =?utf-8?B?dFVwV21EWnlVb1JFZHFkNUQ4VmQ2MGJLcmxsT2ZLOU9LZEpIT0VNcjJ5ay9j?=
 =?utf-8?B?RnpFa3lVREZWaENUSzNHZC9TWFhnbld0WHh4ZUZibWlTMVduSzNmcjluczFW?=
 =?utf-8?B?SHphRE5TWFp1bU40dlp4aGQrWVYrdFBzcDBqdWg5dmJFN1AveDBoM3BNN3J5?=
 =?utf-8?B?OE5vR2taNzI4ZHBSdjBLY3lzNFBFc096eXQ1NjZXeDhSRitWeXU1cUllT3FH?=
 =?utf-8?B?Umt6dFE2alN2QTN2UVFTc2YvdlRGSjVqQUltMmdMbURQRmhIb1hsZTIrMjAx?=
 =?utf-8?B?Yjc2QXBma0ZBZ25Pa3IySmdhNzEzT3ZsK280am9JVERpTXN2OERVenYrVmxY?=
 =?utf-8?B?eWoxMzhya2oyQ1luOTNxSWFsRXdWU2ZYK2psYnRxOEtuN3lwQ3QxcjJRNStS?=
 =?utf-8?B?TlFOb3R5UnlLMVJab1RNVDRjQTdiSnkrMWpORGYvZzBqM2pyNlRFb2VRRjhG?=
 =?utf-8?B?eVhxdzBrMWZJZ3pmN3lhWDJJbk5FcG50aENpRU9xMXJpWGJ2SFBDQVV3ak1E?=
 =?utf-8?B?djJDclVrdVA4alMzV21ha3JtVnBwb1FJL2pSekR0bFR0bXFDQWtlbnVJL2pr?=
 =?utf-8?B?aC80WUN3NjFuVjk2Q0RJSlhpSDg4UlVQaXFOU0VOT0lDNlY2M00yWThtdlRX?=
 =?utf-8?B?eFV1VWhZYXJSV1hsRDYvc3d5eDhuZDBrTUtUajBTWDZDMFFZTjhPUmxteHNn?=
 =?utf-8?B?Nkx2Q3FNOGg1QVRicnV0ZC9NSFpsYngvUzkwd2JUWFdmMGsrQW51OXVPaTha?=
 =?utf-8?B?a1hrWEE2QzdqT05MejBGRUlkNHhnYXA1RmpxVmx6OExVLyt4ZllEUk5EZkQ1?=
 =?utf-8?B?VHpNOTQwNG9Uc045Z1Z3cFFmUlhGbzZybzNiVnpVcmJla2E5SFIyS2lDRVdj?=
 =?utf-8?B?aDlnc0RoVzRaTGUvN2RJbEJNa1dCU1pTNVlabTZmWWhvbWhoVzM3YldaY0NG?=
 =?utf-8?B?dElMWUh3akNFS0VPREZoVjJPZ1pQMnlOOEpzOVQzb01YUkc4NmV6eG5jS0hk?=
 =?utf-8?B?U3hMejFnRENBVkhaSThiSllSd2Z2K2VIYjk2WkQ3Y3JZblo4cnZUQXBGU05i?=
 =?utf-8?B?c1V4NmxFdFBUcDE5MzNnYXpXektqSTNzOVhJOGhIRFh4eStYVXp1ZTM0RklB?=
 =?utf-8?B?U1huMk93VUZ1b0RQOU9DeGpzSVRnbFMyOWRKRHlNTVpRZjZFRkFjZCtJdFFq?=
 =?utf-8?Q?RsS8il8W3/CGXvh2f9P3hJuaD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf9c66f-21db-4e12-79ba-08db8e9473b6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 11:27:25.2560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMTVRCXMGL2j0jyy9gkmpgssKuVRZgf0zhHdhe5N5iAQ6rixvjK1hmo2m2RM22p2TIldmf0Ylm8VFHBXpegrFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On 27.07.2023 13:02, Federico Serafini wrote:
> Hello Jan, Stefano,
> 
> On 25/07/23 21:32, Stefano Stabellini wrote:
>> On Tue, 25 Jul 2023, Jan Beulich wrote:
>>> On 24.07.2023 19:50, Federico Serafini wrote:
>>>> @@ -182,7 +182,8 @@ void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask)
>>>>   }
>>>>   
>>>>   int request_irq(unsigned int irq, unsigned int irqflags,
>>>> -                void (*handler)(int, void *, struct cpu_user_regs *),
>>>> +                void (*handler)(int irq, void *dev_id,
>>>> +                                struct cpu_user_regs *regs),
>>>>                   const char *devname, void *dev_id)
>>>>   {
>>>
>>> Before we accept patches, don't we need to first settle on whether to
>>> apply the rule(s) also to function type declarations (and not just
>>> ordinary prototypes)?
>>
>> Yes, in retrospect we should have found agreement on this issue this
>> morning but I forgot to bring it up :-(  Ooops.
>>
>> (I think the agreement was to change the function type declarations too,
>> that's why docs/misra/rules.rst doesn't have a note about this, but I
>> don't want to make assumptions as I am not certain.)
> 
> I have ready a patch for violations of rules 8.2 and 8.3 in
> xen/include/xen/iommu.h.
> I am talking about this, in this IRQ thread, because I think the 
> following two options also apply for an eventual v2 patch for the IRQ 
> module, until a decision about rule 8.2 and function pointers is taken:
> 
> 1) Split patches and submit only the changes *not* involving function
>     pointers.
> 2) In the meantime that you make a decision,
>     I submit patches thus addressing the existing violations.
> 
> I personally prefer the second one, but please let me know what you
> think.

It's not entirely clear to me what 2 means, as I wouldn't expect you
intend to deal with "violations" which we may decide aren't any in
out world.

Jan

