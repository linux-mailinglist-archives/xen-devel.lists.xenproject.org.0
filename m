Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C0D6A05C1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 11:12:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500146.771379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV8Zi-0001dc-CM; Thu, 23 Feb 2023 10:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500146.771379; Thu, 23 Feb 2023 10:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV8Zi-0001ap-8Y; Thu, 23 Feb 2023 10:11:42 +0000
Received: by outflank-mailman (input) for mailman id 500146;
 Thu, 23 Feb 2023 10:11:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pV8Zg-0001ae-5M
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 10:11:40 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe16::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75ed61ae-b362-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 11:11:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7664.eurprd04.prod.outlook.com (2603:10a6:102:f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 10:11:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 10:11:35 +0000
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
X-Inumbo-ID: 75ed61ae-b362-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGEghjvPXbk0mqv07lyQXbwZrJCUrOoBhh4+B/m4zk886BqvQEdyXxb5Ty0sdt03ldMJQWDnh6dS6eBXnkQngFPuEvRtELJuT5YFcDKczkmQleCUVfJMNxtWT4rUUPJigZpNtZEE8ljPwBSlqyc6m9TWigWjiBSWyNtVIMkylmTGfiKizGZkLzLV+IWO1A4rOLzdLzWXRdbE6xj4eEUFPQp/O/2tIgEjwKftbbf2qY4c65HmRqDXVGzCkwILjyNgAzjPGClKk/v/Xt0xQMpd4AMPkOQ/scvN/lVqqOWwsRvproykvcB/rH9ovrF5OE9QCNJ9tMXVNGp0qUuiDysG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BPHwQK6RhV39CQbmdTgVpoLkkPcki07C1OWjtIF+mo=;
 b=IsEyTf+56CC9tKJbs0dxWpDC+gHOwVm63NrFyxt/fuXOHx3e2T1+JsijFBSs9FkiIOESiQROOJUZRSLicTAkbQrhJsAvwkvNAHJCUns+EVlkZ8b2rynUJ3uxCCGwM6rZdKmOZsQ144BEfAXTcCzPC6EB1JfbLBqJdacv6u8VTJmyx1VS56QxbJGYTFhlF88yobsKJlN8HxXPLpoV9cpy6Y9DLR9Nj+IEL0QWarVbC7Vx5Dpj2gxmyMYRAHXFqPn9NQJfmtnzz1wiFec3BVSuKJS8f82VOH9iBFjCk/c+EpTqkYdldOKCB0GFY+knY4Ym/soDOZEVLdxteXSNlkSSbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BPHwQK6RhV39CQbmdTgVpoLkkPcki07C1OWjtIF+mo=;
 b=wuEIxtGbDDibI/pcQAfkoylIoz6JShwh3YdYY4XtAGv1w2SZoXn582mhObuNU47F05rvDCgJ82cuRAPKgRMvFpvWFlUir6BpQu1MwIjp0HNqrBMJ8gJUbA9XA8QyoVIiA9+jifMFEGhYBZ2I0ZBWOemlNXFEF1MlvNXfEnrn4E7EIzuz0rU+DKTzs40NFvPEkKHaxIbOMf/w2EuhClcbtKTKjAN00jVCru2JMlqcQ4L7YyN59v6c1R55idxMfBbDQfneGNRWNNq7zVI/u7aahoFfNLx2DKTqT0uj6MHdSw0wwmMjJKl4Jx2f/veE1rweeMokxvWKk9vl2wTCogCkWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3764453-8a11-416c-e97b-eaaf0a305e67@suse.com>
Date: Thu, 23 Feb 2023 11:11:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1676909088.git.oleksii.kurochko@gmail.com>
 <aa0d3704921f5ec04b66c8aa935638a64018c50b.1676909088.git.oleksii.kurochko@gmail.com>
 <214973b0-5fe7-9208-2cfc-dd2884583157@suse.com>
 <f28da3fa9266f32664280326dca610c67a733195.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f28da3fa9266f32664280326dca610c67a733195.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 707d94c7-8afe-46e6-3c3a-08db1586584a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3aiIYkaWknBvtkezotQPHWT4i6HWIFJtKUJAkcNP1ol5Xcbimx6L5+F7EpGdRuNXGeJQafJTDdsCxqwIhgbarJbm8apPZjtOmC+6i43qd2lKOmKlTBplcsG7Co6zdrSGOVGFMGp+gaSCMRbS4OmaV8DxsldLrIk9YVZf6EshQhqBWZelhl8+pCleXOSyiy28nAAwD1qgIj79xAaOj1VQBeOjIk6l2JIQOhhntAZVarr99KfyJ5G0UoKqPUbgCj9C5f8bcoIFVSa4xPCqFQCPcwffiFo77gWQISxWiQIsH9sCMQx8XTE9at2o/krx6Erhhp3JmbwOMCo96E8p71XLjIIAlye3tpSQDsEH7zOxYC4gjFGuILPqfLbIorfta9oXYv57IbQCxDR5DzXY21un6bsZBFoLFwu9YxsxHQJtAYsB5FDLAsogR7wPhnnuE+yQYOEGe77bK0nZZq2RVInpRMcq/lS+YAIVo37rWaZCNhu4eA2jMTES9JKpYuY65teXRr+KkU1mkLXC22dhhXonBM0rGzcgE17nH+J9/PlJCieu19rzcz9/bRZMElV5UBi3QLK1+IXmQKZChV7+ITq5K+c1R+5aJkjl6aJVXUSYJUjVZl+++KuFvPFmPq3uh14kZgL1oHaPT9vUT4Z3uYQpyMAxzY+6P8oYIyEZXBety8nkSksvgvCLjhzUvEJFzfu+8CNY9Gtpq9roQJeMa/rbNIEomLy/WAiIr+uCXZ7l8dFt4JSfVZRzvSAvnw+L6LKMibYRLfDs63A/0coRNulhbfCDZ7/036RlDE/12wCE5fE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199018)(186003)(26005)(31686004)(5660300002)(2616005)(966005)(6486002)(6666004)(6512007)(6506007)(54906003)(53546011)(478600001)(316002)(66476007)(4326008)(6916009)(41300700001)(8936002)(8676002)(66556008)(66946007)(38100700002)(86362001)(36756003)(2906002)(31696002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXhrWnF1YWtMZklPMEk3UTNzc2NUWWtGWThIVlhEcFl4TjNpY3FzT215OFgz?=
 =?utf-8?B?QllGb1R1NFpla3d3WlBZTDVweGFlM1YzRWlVWU5iOGFyZWVib3haVHUxT0c5?=
 =?utf-8?B?djZFUnRhY3hFOEJRN3pOb2hQcUVLRkpqV0ZJMVFiWGFLV1JORCtnd3VGYVVT?=
 =?utf-8?B?S25LV3FENmFQNFduS1JRR1BhaXp1YjBlZG5JblhIL084VmVmV1phTGpGSTdo?=
 =?utf-8?B?c1dDV2hPbzg2c21LcTQ3MGxiT0lyT0FwdFV1Z3NXRkw2VThHNWNPSHgrNWFl?=
 =?utf-8?B?NXIvL2FTczRZZmkweVdrdkh4R2IzNzhvdW02bldXY1FKUnBrVHF6UTJQSXpL?=
 =?utf-8?B?bk11UW9RbmxKaDl5WVZGMGM2ZVVqTGxINUlMbHdsd0pmVWhZTm5RT2ZUci9H?=
 =?utf-8?B?UmZaTHlHYXZKdC9EaXZFL2JJUy9WZlMwZ29tcGNrWHRzM0FWdDRwMnZZVVdD?=
 =?utf-8?B?akRPaVg3QWJyWUR2TktoSGI5cmdIblZLb2JkRURONWVkM0VjSW1UL24xZGdj?=
 =?utf-8?B?OGl3eE85YnZPb2I2L3dXWGRSTzcyajBSQjhQQk1FMHptWHhmTGRjUXhabVh2?=
 =?utf-8?B?YTdEbTl1c09sajdPeGdzelIwNE1nbndnd0trYkxGd29DTVBIY2w2WW9OTloz?=
 =?utf-8?B?NmVFK1FFOW1Md2txVGlrYWpWTEVDQzQ1eVQ2WHczRUt2NFVkc0JXcWZCR2Qy?=
 =?utf-8?B?UlZEQzdTUGxrVXFlVHRqSG5ZSTc2ay9TbVI1SStscEh1UFFsRXpQcS9TYjJZ?=
 =?utf-8?B?RkNjSFYyTFJPLzFocUpOL1dTTnVQMWtubXZLejJjT2hWUERpdFRFQTZlbFU1?=
 =?utf-8?B?dzgvTldUWlJabGJoNG02Mm1CcUV0WlZybkNtZWVsWWFzWGVlU3dqNUx0L3Vt?=
 =?utf-8?B?M3dla0dLVFo4aGVFZ0dGeFprN24xNEhuUjc1M1VnZTlseGh1ZHdFajc3ZUla?=
 =?utf-8?B?Q0xhSnBXaU5xUGxNcG9xUHF1NXgzS0xuVGlPQkhOVFVtSW9LK1ZVYWx5MjZ2?=
 =?utf-8?B?RjY1Q25hSzVPLzRCeVRRdjRucXhOREhmSlBmc3kvVk9sYm1sdlBqbFgwa2Rq?=
 =?utf-8?B?cjJJbjBueENDWlJHNmNlTENwQ1Q3S3BLWExORjE4R3JVVk12WXBtTmN0Qi9Q?=
 =?utf-8?B?L1lvU1hhUWJhOTZFUkk2THlld2RJdzNvQmVudEdCVjlFcUI5OWZmQThpWmdn?=
 =?utf-8?B?VFhIbTlQRnBLYVVSOFRuTktLd1g5TUoxanJxamY0aEtkK0lGZTVjY092enBU?=
 =?utf-8?B?RmlyaWl4dm9CVWllL1UwWVRVTjRZSTIzLzd5dDdwaW00ODV6RklsVXJiNmcv?=
 =?utf-8?B?M0tPcUkvK3c5ZnR0Si82aGRyYUhnbnNpKzFiTXQvekNySXhzYkVvYU9OK2Nh?=
 =?utf-8?B?TS9DQkNJTzArczBjZ0ZrdWliWGZ6WHJEZ3NieGNCdUpxbDdYZ3FDUzlpZnJS?=
 =?utf-8?B?bnB6MFozN0c0SWlEeG9ZV0NYVUNJaXJnL1NXYStaNzhiZ2lhZGxwQ250QVJ0?=
 =?utf-8?B?eVdUeEMvSWpZeWlUaTRuS1IrQ1VHbUd6QnZxUndmcWpLL0JHd1k2eGRVQUU4?=
 =?utf-8?B?TzA2Y1hVSnR6WHNwQU9BbEtIc3pzUFQ1ODVJc2Vmbk5OcklpZVk5cWRxTFJI?=
 =?utf-8?B?b3VkcWdPMjAvUm85ZkJvdXE3czFJTURzNXdQMDlPZ1kyQThtMm5iemQ0SW14?=
 =?utf-8?B?L2hUcWF6cmEwTHZhWk84d05McUFydWtiRjR0NVZOWlViRXFpRmFTdkZmWEtX?=
 =?utf-8?B?aHArVmZWZDBZL0RJaDZkbCtmRHlhNzRualEyc2QvNGRqNUdHMURoaTI2Mk1w?=
 =?utf-8?B?bW5MRGtzSFdsdVAwK3B1cGgwK3RvbC9CUTllTDFOa2psUG1sNkk3TXh4MU9k?=
 =?utf-8?B?a2ZkN1MyMWZqWExYbkNaWTY2RUJIcEdJSkhSSVNNZHRWVzlmOFoyNE96Zmg3?=
 =?utf-8?B?ajZUK0UzQkhiemNxbFIzTjRJZ0lBR0U5M004ZVl4UkpKVm1mYk5HTFZNaHU3?=
 =?utf-8?B?VzFDN281S3VCSzkzQllRSmxTckIxVUZ1TUxCUjFDM1FZR2tBVDh2d3ZpSEc4?=
 =?utf-8?B?YnBiTlgxNmVlL1YybUdOSFozMzFJMDRmSE1ha3FzcWRZWHU1SDI4SUQ5R3Q4?=
 =?utf-8?Q?EX2PpRC6tb30ofk3KxhGPNFb9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 707d94c7-8afe-46e6-3c3a-08db1586584a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 10:11:35.5836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOTCA/yX7qzNaqkIbftQyc7vRvv2OtMq+s3UPuybqVUd4hbT+j4VndJXln5HaBcZhiwyRb+36I7kGjtHJptzOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7664

On 22.02.2023 17:16, Oleksii wrote:
> On Wed, 2023-02-22 at 13:46 +0100, Jan Beulich wrote:
>> On 20.02.2023 17:40, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/common/bug.c
>>> @@ -0,0 +1,113 @@
>>> +#include <xen/bug.h>
>>> +#include <xen/errno.h>
>>> +#include <xen/kernel.h>
>>> +#include <xen/livepatch.h>
>>> +#include <xen/string.h>
>>> +#include <xen/types.h>
>>> +#include <xen/virtual_region.h>
>>> +
>>> +#include <asm/processor.h>
>>
>> Is this really needed here?
> Yes, it is.
> 
> Function show_execution_state() is declared in this header for all
> architectures and is used by handle_bug_frame().

Ugly, but yes, you're right.

>>> +const struct bug_frame* find_bug_frame(unsigned long pc, unsigned
>>> int *id)
>>
>> Is this function going to be needed outside of this CU? IOW why is it
>> not
>> static?
>>
> It's not static because there is not possible to use do_bug_frame() as
> is for x86 as x86 has some additional checks for some cases which
> aren't in generic implementation:
> [1]
> https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/x86/traps.c#L1217
> [2]
> https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/x86/traps.c#L1238
> [3]
> https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/x86/traps.c#L1259
> 
> Probably to make generic do_bug_frame() more re-usable for x86 we can
> implement as stubs fixup_exception_return() and debugger_trap_fatal()
> under #ifndef X86 ... #endif inside common/bug.c.
> 
> Could you please share your thoughts about that?

Isn't all that's needed a suitable return value from the function,
for the caller to take appropriate further action? (Maybe even that
isn't really necessary.)

That said, debugger_trap_fatal() imo may sensibly be generalized,
and hence could be left in common code. Arm may simply stub this to
nothing then for the time being.

>>> +{
>>> +    const char *prefix = "", *filename, *predicate;
>>> +    unsigned long fixup;
>>> +    unsigned int lineno;
>>> +
>>> +    if ( id == BUGFRAME_run_fn )
>>> +    {
>>> +#ifdef ARM        
>>
>> Who or what defines ARM? Anyway, seeing ...
> it is defined by default in Kconfig:
> https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/arm/Kconfig#L13

That'll be CONFIG_ARM then in uses in C code.

>>> +        void (*fn)(const struct cpu_user_regs *) = (void *)regs-
>>>> BUG_FN_REG;
>>
>> ... this, wouldn't it be better (and independent of the specific
>> arch) if
>> you checked for BUG_FN_REG being defined?
> If I understand Kconfig correctly than there is no significant
> difference what check. But probably BUG_FN_REG would be a little bit
> better if someone will decide to change a way how pointer to function
> will be passed in case of ARM than we will get compilation error and so
> won't miss to fix the line in do_bug_frame().

Indeed - #ifdef like this one generally want to check for the precise
aspect in question, without making assumptions about something implying
something else. (Pretty certainly there are exceptions to this rule,
but it holds here.)

>>> +    ".p2align
>>> 2\n"                                                          \
>>> +   
>>> ".Lfrm%=:\n"                                                       
>>>      \
>>> +    ".long (.Lbug%= - .Lfrm%=) +
>>> %"MODIFIER"[bf_line_hi]\n"                  \
>>> +    ".long (%"MODIFIER"[bf_ptr] - .Lfrm%=) +
>>> %"MODIFIER"[bf_line_lo]\n"       \
>>> +    ".if " #second_frame
>>> "\n"                                               \
>>> +    ".long 0, %"MODIFIER"[bf_msg] -
>>> .Lfrm%=\n"                               \
>>> +   
>>> ".endif\n"                                                         
>>>      \
>>> +    ".popsection\n"
>>
>> I think I said so in reply to an earlier version already: The moment
>> assembly code moves to a common header, it should be adjusted to be
>> as
>> portable as possible. In particular directives should never start at
>> the
>> beginning of a line, while labels always should. (Whether .long is
>> actually portable is another question, which I'll be happy to leave
>> aside for now.)
> I am not sure that I understand about which one directive we are
> talking about... Are we talking about .{push/pop}section and .p2align?
> Probably you can show me an example in Xen or other project?

I'm talking about all directives here. Fundamentally assembly language
source lines are like this (assuming colons follow labels):

[<label>:|<blank>][<directive>|<insn>]

Both parts can optionally be empty, but if the right one isn't, then
the left one also shouldn't be (and hence minimally a blank is needed;
commonly it would be a tab). Directives, unlike insns, start with a
dot in most dialects. Labels can also start with a dot, but are
disambiguated by the colon after them (yet more strict placement of
items is therefore required when labels are not followed by colons -
there are such dialects -, which is why it is generally a good idea
to follow that simple formatting rule). Also, ftaod,
- <insn> covers both actual insns as well as assembler macro
  invocations,
- there can of course be multiple labels on a single line (iirc this
  requires that colons follow labels).

As to examples: I'm afraid I'm unaware of arch-independent assembly
code anywhere in Xen so far.

Jan

