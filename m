Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F5C65FBCC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 08:17:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472337.732523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDgyf-0005dp-63; Fri, 06 Jan 2023 07:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472337.732523; Fri, 06 Jan 2023 07:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDgyf-0005aZ-2p; Fri, 06 Jan 2023 07:17:21 +0000
Received: by outflank-mailman (input) for mailman id 472337;
 Fri, 06 Jan 2023 07:17:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ggnj=5D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDgyd-0005aA-Ur
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 07:17:19 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2065.outbound.protection.outlook.com [40.107.241.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2763f03c-8d92-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 08:17:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8560.eurprd04.prod.outlook.com (2603:10a6:102:217::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 07:17:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 07:17:16 +0000
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
X-Inumbo-ID: 2763f03c-8d92-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emMJ+JXQB9LtxGhdEY6eeX0ouxEramrc6DiI9rAefvPZ6JJ21UsUaeWH6KWZqjKltX52nUuQ+LxLyOLSmDZXuT1mA/XabV0RvvttQceWvKr30WSTPw/ZOwAbEGynxonUAGYhanJSeYFhWJnwNUF221Q3MCcybctWYmDmo6WmoEFTqIKDAmZz8KzUiPavc27aVf6FAvuSUOJqtnzX/9ui/kVNY7adhJ/u8W9Y1ekm31c7BeUNuTqnGI2hLXet9UtByWqS0SphUyIypU7UMidVecOt1VJ6wRbOd0c1UwJ5Z84Fizd/gHG3ohANOwWRPCCI0CFwxj1yevU/iqXcpNbD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hB0wHVv2g8VFNrzjAIujsFumyNKGcqZkk2GyhZB67bk=;
 b=F+Qj9PZvQBf8haBY9WkgIU7bRjlJ3/puJmXz0WrtFmcYu1RGGlECIFvW889r3yGDk3/0PlbKdKt+bWcSaFoQRveP4kXm+HL+R588OnS8kSOPoX/THVTSyazntg18Uwfb8HVF8ZaFe/4OZU4N98YiIwlkCjmHg5QkPsYcBCrUc1WKLs2szgev346nlkgujVaYnFFM/HL4SEpngOi5bTj8yVep0TF6HwIX+k3WAPLMXpC1wkBCp54ZwJkppCMYtfIWOtQN7C6eB7ssYdb7bVdr8LYPeESPKZOm9MZatWung6QCoF8HhXXK6s823zZNGbOFGA0WrR3yMYO5qN67FD34Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hB0wHVv2g8VFNrzjAIujsFumyNKGcqZkk2GyhZB67bk=;
 b=BTIX3zUFGTfctCPFHiF1JOJEtpglgEvrGDfMBgnI38+nk37tzA4rQEe0v1Lanym98J5ZBxUrxprnOYXrx4N4RI+HpLg2mfMpJB3w/Kx2i1WdYOyymdHw93mWw91wwgdAVDDiA2Gfp0ogVVXpi0/vcwcgXCm2GBxXiumT6fU4vAQSzqfQyFXO1pATGTZ//yPX2uO3h/PQBxkBmBBTWWCJXInXoBrq6X8GsrY8GUhM7/Rai+IcjXpDB56rzKjyMyZSbDvl7MzmggYhlASx2J6njdMy/Tf6l2Ch/eV/6rVONwgSAqCh00SK4RxRXPDyvVyQQx9wFKn4hVLPKzLXDwnrmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a673fd59-7506-9459-a0b2-2da7972b9b82@suse.com>
Date: Fri, 6 Jan 2023 08:17:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 13/22] xen/x86: Add support for the PMAP
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-14-julien@xen.org>
 <84a96972-3c41-ec94-3513-9944467d9e1c@suse.com>
 <924abe0d-6ba8-5d64-d74a-c2e1894d4f64@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <924abe0d-6ba8-5d64-d74a-c2e1894d4f64@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: a0691bbb-a53b-458e-7fea-08daefb60a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+DVBXwMDZKPb2T8SIq95pVc6B3p4a+ie6p2lEuCjLHPzFlJI8OdgVdNoKMPoIOCiUAK7hDHNVw1ydS6nBx/B9P8/YmtVN58EOlg6cKF/BbbNPWlmtbyALdoG022RnAVdlfMBKDm/DBcaueHAWXa8qjElHMOo5HQFqJfAYSezpn2nMUK+7RJ+hXqIjSfvCOVrmkFaMMD72yPyqk7PUNvFGR7PzGybRcYEEiXpt9EXOTP6KG51MfeVykISyOIHx7PoPIJUL6F7zKRUYzFeSyqYfIXhjpHGGh61JXSJLfrz9z1nz5+bnWhuAPOtCdCXHfZCunRtzqra7D5zz1ND5rQ4h8ycDur/WaKXwoIksgUpE9Uu/jfJfm7MXygLVXckIsqEEw63jqm74EuGdlDZgf2CIxmImGAPkoQOA3N9egyo2tui+9OsHsqATK+oViP22QH8hsrTeOMIen+P2dz93kjjDJRcfqRdxJIv1nqVfWXFf3yamDLkPnQh5yzVM8hnNJMWzzTPEDKk/9kmRzyg7SMKjfp4cXRldhnlNk3NGZwJm9KuUgjsyawPqlqsVbaKNU0Oz37nkVyr5pG70VUSqmqOrF4RlRBQIglB+ehEI+/eU5WSxebj3FRTCqMUyhd7R6YmPzrXkHUxSC2KFkQ5P1XqCW2XsNeKnaEHqaU7gQqNMJtX6o9yieue2fh9y8npLxdY/pq5vbYmU2At85rmkGi6ocqAri4OSvOA0qSxIMAlyvOzWMuRfWTQGRaIxtVlyXf9juQrBabB/Y2Ji3fNn3sVCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(83380400001)(86362001)(31696002)(8936002)(2906002)(5660300002)(38100700002)(41300700001)(478600001)(2616005)(8676002)(53546011)(186003)(6506007)(316002)(6512007)(66476007)(4326008)(26005)(6916009)(66946007)(6486002)(66556008)(54906003)(31686004)(36756003)(45980500001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHp0L0xVNlB0amQ5MmZNTURjOTJyV3QrbkZHc2tUMmhCM2dqOHd0azY1MGdj?=
 =?utf-8?B?NEhjalJMbzJqUEd6RXZaK3pIY3NHdENpeFNCaHoxV2tvRXNsT3NCd3RXdTMv?=
 =?utf-8?B?SzRYTnZoRG0wYXBRR0Q3L0t4K0JVSGxJb01KbEZnNzh6aFd3QzRKZXJkWXha?=
 =?utf-8?B?U1ZrTDV2MzVtRzJ6S3hVRWRvZlhDQmtQT2o5S3NzK1Q5dTBkQlBYS1RWYTVY?=
 =?utf-8?B?VVBJYnFOSkV2MzFsRE43UjV3eFZMRkpCeHM1SWxNTGxwVkRJa0h0K2xRcHNW?=
 =?utf-8?B?akhFZnRNZHI5R042c1JCL09CZTY3RUp5TEhRMTRqMmtTQjdnNlFsNkpUT3Rm?=
 =?utf-8?B?WHA4ckxqWTRBSVdDRHBlSkR2aTN6RWljcU5tZDF3ZmpaNFAxdDllazhqLzNs?=
 =?utf-8?B?OG5SQU1VQjNma1BleERyZzBQVFBrZDMrUERIZWhHOVNJN2pRcjJRT2RrbnNI?=
 =?utf-8?B?eHJSY3dWOGJscHpNYVNWQmUwdlp1M1hEMjNzYVN5K3VaZ0JsN3c2clBWSEpP?=
 =?utf-8?B?dVJ2cDlNd2YxV3lzcnAza0NlQWVOQnpHSWdFT3BKend5bzhwNU16TWdFWmVJ?=
 =?utf-8?B?UE5xMDRwQUtva05VbjFqc3NOdFFkSVloTjVMZGFUbWFNWVR2a0pQcEhSaUw1?=
 =?utf-8?B?QllzTm1jVnJleXNidlYzUjBCSnllamRzeENhcW1KWG96M2xxNk4yS2hCZGxG?=
 =?utf-8?B?L3FERW5uYlFXTCszNGJJeG9LTkkySmNZSW55RldVNk1xV3Z3R25GOU9MUlkr?=
 =?utf-8?B?WnRJeXhjbFVQZ1k3eVh5UmFkYnhhbGdyQzBqY1lwYmZ1QUxRcVVuYXhzMHJK?=
 =?utf-8?B?aElxZ292cUtERmVaTmkzWGx6OExVWFlMRjRZRDkwV1BUcEtCWGs1SlpXSFlM?=
 =?utf-8?B?QVdxQnJKbFFEWVl2YVFwZ2pxT0t2LzJndTFuWTR5K0lRTGQveUMvREJKMmtt?=
 =?utf-8?B?eWxkT2ZPNFNJSkFOOEtoS2xlNEtuWXpqS2pGcFoyUkp2YzExY0RSelA4MEdP?=
 =?utf-8?B?YXFhbXgrdko1YWxKbmQxRjQvWHlhVTlzY1ZHNVdGU1hyeDViRjQraXhmdGo4?=
 =?utf-8?B?Q0pldGxKS212NC9KaHJvVy9NL2JNeXU5ZjBrSjVneHErT2VqZjdYSWFlaXY1?=
 =?utf-8?B?VzliVzQwQk1TdlJRWEljS0J6akdPNHV5V29BanFKUHREREZpK1VwUmFLcnpw?=
 =?utf-8?B?aWZXRG5ZMDltRWh6NlI1aWtnQkk3SnhJOVllTjJrN3M3azYvR3h5ME9CSFhE?=
 =?utf-8?B?Zm5sS3J0WjNkdlVkNkdVMXRNb2pIeHQvZzZxMm9vcGxJVUhrbktFYlpyeVNu?=
 =?utf-8?B?NGJBWXBzRnlRMjNZKzhQOWM5ZE04d3B1S25LcnpPRTNhdXdtTTB0ZWh0L1ZD?=
 =?utf-8?B?Z1NycDBJNGQwUnFWbFB1L1lWdHdrZEtSMGFyNVlmNmRZQ3dPSkVlejNQRzFw?=
 =?utf-8?B?YWNXRE5acFp5Z0FmM1dzZ1NOMkR5SzlxV25pTjhiRHQ4a1RnUjlNSEluTjBr?=
 =?utf-8?B?bmx5YkIxeHZwZVBKOVh5U091bk1YMlNzT3FHMFZuM1VKVlhwb0poMU51dXpK?=
 =?utf-8?B?eG50QWZDcUFBU1psMkcyVW56cUE3VGgzSENmWGJyc2JidENJUUJvM1BJRXNJ?=
 =?utf-8?B?U3VGcFEzaGhEa3JReSsrV1NTYXVtN1ExR2x1SGNZVzNVTWdtMVdNZW1kK011?=
 =?utf-8?B?UlMyRDRvT3Q0dlJJRHN1VGt3WTVRSGNscCtuYStXc2l5aTBUc0xkWkRJOUtY?=
 =?utf-8?B?L09jNi9oL21tZjE0cGdOdm5JYUZzTnB3bWw4YWVHTERDS0lKdzdHOUxtMW4z?=
 =?utf-8?B?Z0pFRGhlZDlQN2ZIeHNJWEVwOWdycm5kV0NTYlZxL01kakhWaGdGbzRHZjhF?=
 =?utf-8?B?d0VZY05Cc2dUUFNaYmFmMEdFTW9mQ2tTTnphNmVhcmg4WEhqYWRCMmRLQXMy?=
 =?utf-8?B?OTNHUnAzUVFLR1RKTG1sU1ZSQ0lSNjd4ZC9CNHRvdFRzQVA1MkROcGlJNzZa?=
 =?utf-8?B?LzYralYxQ3A3R1NIUVhNZEkwR0g5aHEwUG5Ib05yUzRVOTVqNklGTTNMb1hy?=
 =?utf-8?B?QXNZS3RSOGl6VVhBOGlxbW05V0I5aE5IQ1c4S1FuaGhZSjlkdmVtZ2wzNGdS?=
 =?utf-8?Q?kg/ZSCihAZzcsGYxVQqJ9qFkz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0691bbb-a53b-458e-7fea-08daefb60a60
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 07:17:16.5091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwHgQklrxSGgTefBzzFmpZhe5sL6EDxTHSJ8BFMhrr9+v3DLz5pbZRfjrlNkffflr4UCrMJs9gh+nZbBIKG9Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8560

On 05.01.2023 18:50, Julien Grall wrote:
> On 05/01/2023 16:46, Jan Beulich wrote:
>> On 16.12.2022 12:48, Julien Grall wrote:
>>> --- a/xen/arch/x86/include/asm/fixmap.h
>>> +++ b/xen/arch/x86/include/asm/fixmap.h
>>> @@ -21,6 +21,8 @@
>>>   
>>>   #include <xen/acpi.h>
>>>   #include <xen/pfn.h>
>>> +#include <xen/pmap.h>
>>> +
>>>   #include <asm/apicdef.h>
>>>   #include <asm/msi.h>
>>>   #include <acpi/apei.h>
>>> @@ -54,6 +56,8 @@ enum fixed_addresses {
>>>       FIX_XEN_SHARED_INFO,
>>>   #endif /* CONFIG_XEN_GUEST */
>>>       /* Everything else should go further down. */
>>> +    FIX_PMAP_BEGIN,
>>> +    FIX_PMAP_END = FIX_PMAP_BEGIN + NUM_FIX_PMAP,
>>
>> ... you've inserted the new entries after the respective comment? Is
>> there a reason you don't insert farther towards the end of this
>> enumeration?
> 
> I will answer this below.
> 
>>
>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/pmap.h
>>> @@ -0,0 +1,25 @@
>>> +#ifndef __ASM_PMAP_H__
>>> +#define __ASM_PMAP_H__
>>> +
>>> +#include <asm/fixmap.h>
>>> +
>>> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
>>> +{
>>> +    unsigned long linear = (unsigned long)fix_to_virt(slot);
>>> +    l1_pgentry_t *pl1e = &l1_fixmap[l1_table_offset(linear)];
>>> +
>>> +    ASSERT(!(l1e_get_flags(*pl1e) & _PAGE_PRESENT));
>>> +
>>> +    l1e_write_atomic(pl1e, l1e_from_mfn(mfn, PAGE_HYPERVISOR));
>>> +}
>>> +
>>> +static inline void arch_pmap_unmap(unsigned int slot)
>>> +{
>>> +    unsigned long linear = (unsigned long)fix_to_virt(slot);
>>> +    l1_pgentry_t *pl1e = &l1_fixmap[l1_table_offset(linear)];
>>> +
>>> +    l1e_write_atomic(pl1e, l1e_empty());
>>> +    flush_tlb_one_local(linear);
>>> +}
>>
>> You're effectively open-coding {set,clear}_fixmap(), just without
>> the L1 table allocation (should such be necessary). If you depend
>> on using the build-time L1 table, then you need to move your
>> entries ahead of said comment.
> 
> So the problem is less about the allocation be more the fact that we 
> can't use map_pages_to_xen() because it would call pmap_map().
> 
> So we need to break the loop. Hence why set_fixmap()/clear_fixmap() are 
> open-coded.
> 
> And indeed, we would need to rely on the build-time L1 table in this 
> case. So I will move the entries earlier.

Additionally we will now need to (finally) gain a build-time check that
all "early" entries actually fit in the static L1 table. XHCI has pushed
us quite a bit up here, and I could see us considering to alter (bump)
the number of PMAP entries.

>> But independent of that you want
>> to either use the existing macros / functions, or explain why you
>> can't.
> 
> This is explained in the caller of arch_pmap*():
> 
>      /*
>       * We cannot use set_fixmap() here. We use PMAP when the domain map
>       * page infrastructure is not yet initialized, so 
> map_pages_to_xen() called
>       * by set_fixmap() needs to map pages on demand, which then calls 
> pmap()
>       * again, resulting in a loop. Modify the PTEs directly instead. 
> The same
>       * is true for pmap_unmap().
>       */
> 
> The comment is valid for Arm, x86 and (I would expect in the future) 
> RISC-V because the page-tables may be allocated in domheap (so not 
> always mapped).
> 
> So I don't feel this comment should be duplicated in the header. But I 
> can certainly explain it in the commit message.

Right, that's what I was after; I'm sorry for not having worded this
precisely enough.

Jan

