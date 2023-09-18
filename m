Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10437A4798
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 12:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603907.941042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiBrI-0000lo-FL; Mon, 18 Sep 2023 10:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603907.941042; Mon, 18 Sep 2023 10:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiBrI-0000jP-Bf; Mon, 18 Sep 2023 10:52:04 +0000
Received: by outflank-mailman (input) for mailman id 603907;
 Mon, 18 Sep 2023 10:52:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiBrG-0000jJ-Ts
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 10:52:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2079.outbound.protection.outlook.com [40.107.7.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63eb2d48-5611-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 12:51:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 10:51:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 10:51:29 +0000
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
X-Inumbo-ID: 63eb2d48-5611-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IegZBPupIogUuqonH1rOUDGB6uJJtiyaBtoqcEnoLUSiq6AJhvclgNpdgag1jg27ZIobIn+BIPocSBvJjaVICO6Sr3Ywf7gJcLBEQPsndlGkPYCmEKUk5y7l/eDWQ74w5WJywrvXvEo41Om3/WYThoEPh1lI4F8GPMVW0P0g1TtyXHDxoO2aCLG9U8tXFYHBp06USeMtIrlsXpDS7ie+AU4IRg0xSrInGBZySwvoNhSdzWML9/9WDMceBqyJzNQ5WxhVL3jHHS/+4ERkKpckEnyqL1VAukqxOuP6sJ2i11Awydw+yhZ6LfNG67m2tyX3+ibVmSVWCzMZ2ceIr/vGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vH0Y9SSwVu3q5r397urDHgTrlVwifdC/Yj0+Vy7Gxis=;
 b=imnUmWFKeS19LIx3nq4zi5OPLnXd5ZxIg7uBgHr0xKXICyXAOzTkvxuRNfEbZpawK0L/67NOQyJDyz7R3kEixv43AUMqlnzg4gBL8QGYvfeeF51o5MtgDQHVcgLZPstDqVBTnUdJRDZ+7V/Aw8YiDUlNeltiQUEeHgS0pyIYK7uIK7UnBsfxipJBUpJgsiZvEkvjhuagI0lPEQnKpMYjW1A1HGgnwYZ/I92GojY7dtJoogG16Elt3LczTK2HdwX8PmGLo46SZ9JJlagN6ObEr6cnVodd7JbJ9myW49/uTOXOabj5WIdTTLbprlyU+d+3aN2bbR4Q0cJF6K1nU7A8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vH0Y9SSwVu3q5r397urDHgTrlVwifdC/Yj0+Vy7Gxis=;
 b=Js526OB7msGFu2YUu0qaV6Hys7U4Z3AsSX4uAFsl+YNZbyJW5x6Qz0lXtzGmXDB9GTSiC7Z6uBUcClURVX0nz52thWzgK8wM79jDl9XwmSdbILdVyt6l5mYNRITHFXP9lU29LdcRZg58B7ob/Q0l9/Fv6q/RSnNffMLMC+VGkX1QSFJrSGZeOs7M3Od3Up8tR4L4inQ05CnycVH2SIR/EJpnHm2AxKDnT4iuduUjbPqrDAWcnsaesEn1rR58ApVirHD4K/eZDxFo3HDcpLVCLnIHGMoNQTdA0gkPippcGdPCK+P88h7KZtX7FVV18dOFC6O0eAyTIDNld1XpDrLIGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <adcffca2-e8c2-6c31-2f88-72bb2648abc5@suse.com>
Date: Mon, 18 Sep 2023 12:51:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 1/8] common: assembly entry point type/size annotations
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
 <8ed43968-311e-263b-4dd7-9f8a49a394dc@suse.com>
 <7b1582d2-8c1f-4694-995c-c92e83590b3a@xen.org>
 <c49be18b-256d-76b6-7d73-800ba40c313f@suse.com>
 <6acaf6f5-7c55-4165-91f6-a912c058746e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6acaf6f5-7c55-4165-91f6-a912c058746e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: 399f8451-84c5-4a1a-3eae-08dbb8353669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tc+pNDLGPjkz2H2n/dBnz9J3hAMpNsxIhVpFy7/qYgYmRiReJuDr6e0++e1A7nQAAmFKdKRh1fQhJB6/f1fhU+0W/CFcERup9JSSPtBvLd5ID0DEGRZlPJujENX2yVaO+m8O+J0Vrhh2egkxOQJ6zzmizTt4A4vPruX46p0Zf4m7eSBQH/paylICEu9Lmz3FceeatDABJ4LmB2jykP5CxCspDI92uRqD/KAx3B8mOnblG/yQpB81X81cmOAO2OiUJ4pVU0Av2VHT04wXydXqAwwvnQe+C6k8fNT8WAn5TJXbt/3Ptd6kOobd15Ka1wBMqbnSriMGPPzNQ7Ap3KLYSEN64y9AOAnaqb/Se2+Gw2eR+/wlDKuhXvNoTBf68jxTFfGRC0VdmwNJ7Poil2sJozM0mC2vKeKV2YRPwPDui5eTALK4z4ZhxQMU6NJR99nh2h6XoHObBMaU5KH3vFuLKeJo+oiNV45u0Zx2XURGUQZxXZqo907Jnuq8lUoYB1o+wHcAiOt3Pf6gVIVnJm5vBbTsaKz0QwWP8uHkWnBDOS6kvd+9f5l4fK3XNFDGgrS/VTjd8PdJ6u5mo3/gpMVDTKYSogDSkUhPvYy6LRtUFKGMjqkOadlXsN/J9+f994LTgKEuZfGfAlAiqXX7rRJSGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(346002)(39860400002)(1800799009)(186009)(451199024)(4326008)(2906002)(8676002)(8936002)(26005)(478600001)(41300700001)(31686004)(5660300002)(66946007)(66476007)(66556008)(54906003)(6506007)(6486002)(83380400001)(6916009)(316002)(38100700002)(2616005)(53546011)(86362001)(36756003)(31696002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0lldEpKZ3hEVFBEaGJPdGQ0MEpqQ3NESzFiMjJtZkNUN2FuSjBvMHhYY1FY?=
 =?utf-8?B?TFBGMzZReUJxMUV2N2xiU2tla1R0T3JlM2hHdHNpU0wxdlJOZWlzTXUwUnVo?=
 =?utf-8?B?SnZmODQ2bVpRUlNKRkV0TWxoNG0vNnlNT3VzUndnKytWamhncnhBQXVUYmpP?=
 =?utf-8?B?NjNsSjhrNFFtMDZzSHVPN2czU2VwUm1xdDNET2UyQ0JrQ2N2OGpVd3ZGRGFD?=
 =?utf-8?B?TUpYZGtmSlB3WGRvMWYzc1ZZaXM0S0xTckx2NzNKUXNJcWZmSVY3dmlRR0wx?=
 =?utf-8?B?SGRVajF1T3NIMFE0WWNaTzJ6cmUraEQrbHIwSVl4M3Z1ay9nN21kbkNkY2pB?=
 =?utf-8?B?TnNPTHFrSmhyVTBTTzBXanQrZ3FSRGxreHVtdks2SkZ5c2lnMVJucDhESTFy?=
 =?utf-8?B?QXk2VENpUElhOTdXd0YwSHI0ZkVRMXIzZzF0bTFrQlozanZmNDNQVmR3d3dH?=
 =?utf-8?B?OFQ0Y1lNNTJBSUwvNzNoM1FXRzNpOFpuenlqYUFER1FTbGtzeUFEcDV3N3E1?=
 =?utf-8?B?N1JiUnNhMTZ6dHFuekVCYitkSnZvaU5nbUxKZ3JNMHB3RmoxZTQrV0poRmYz?=
 =?utf-8?B?dXZ5OHlzbS9wQVUzYmNaVVRSaGFNbVpMUmdSdXBQWlU2TnFCWFllZExMOVg2?=
 =?utf-8?B?OXM5RUJtRlNKTkNvQ1E1Y0pyRkZZSFVnOFR0Q3ZKOExqeDhFcnF5REo4MWti?=
 =?utf-8?B?VEgxR0R0WHViQlhReFpXZ05acTZHcUZ5c2lzeGlJcVNqbStyUnhneFFqQXBV?=
 =?utf-8?B?a0xWVDhGS3JtMmd4MmpuNlBaaHQ3RGdKa2NISkZpcTltUVQ4UnVvL0gwVEtu?=
 =?utf-8?B?eSt5Rzd5MWs5d2dBVWQ1bnNPV0dTN1BpL3ZGWGlyVUFYWkMvU2gxUWpVdmZ2?=
 =?utf-8?B?Z0JlUHpNcktjSmJtVXVsVDZ5eGZxbm92MlhHcWxybFRnVEZwamhQMlFPcHpm?=
 =?utf-8?B?dGdZOWRMTU00RTIvbkYyRHZucmpSNmcwd2hTNGI1a2NrNU9La3ZCdTBkQ0tl?=
 =?utf-8?B?SWwyQ2Fwb1doMW44Sm83ZUN4M241bjBNV0VDZzQzcGU4anVObko4aGRtcnRJ?=
 =?utf-8?B?U0Y4emFhblB6MnRjMEc5L0ptcWxWYjExV1d0cW5nUGhnaFZtRHBTMjA0Mi9Q?=
 =?utf-8?B?a0tqcjY5UjR0ejFSejFjM21YRm5nSDZiVDdibXZSNXZHT1pJTHVzaGZXNnRV?=
 =?utf-8?B?KzRCNE8wZG1keFhXYWRaQnVqak1yV01WRWk4ZFpGU1U4ZnBDYTJObU5oNytS?=
 =?utf-8?B?aHZNZlZuMHB4RWpYTG5taEhycXF4ZmlmcmFOcmdkNU1lRTNTcTU2NG84Mk9M?=
 =?utf-8?B?c1NidFFRcTgrUjVTZmlMOFFZRW14aVAxaE85Zi9EUSsrMjluc0JIdkFHNGhZ?=
 =?utf-8?B?ZXdJVEpNbDlMc0RIM2tvSGE0VXZ5OWxBaWMxSUtaVlVhUWN6T3BHUWdhbTU5?=
 =?utf-8?B?TGl5VVVLVXFZbFpXZDdlSVhkaS9GbWxxeGExVFpMc1R3WTFoOUNiRnExbVly?=
 =?utf-8?B?di96M3hmcDJNREZyRWRyd0xFaGR6ZXBqbWlId2tZTUlsZlZuOXBZMndJVjYz?=
 =?utf-8?B?ZFVzS0psa1ZHK2IveDlkQVFsNDBidkFyVkpiQ2U2WXF1a2l1b2JQY0p3ODE3?=
 =?utf-8?B?TTA5T0NCSUN4WG5INU15NDhlSlQ2RU1aNEJrTk8rSXIzMXBTVldWbXpMS2JJ?=
 =?utf-8?B?Vm1Xa1JHc2pXY0svbGhJYlFQeE1yUXd2b3JkcU92VWlZZ0hmQ09maElVdE5N?=
 =?utf-8?B?YWtwbFRmT3VzUVo3T2N6TTZKYnpvSFo4ZWFYOWEza2F6NU9kbC9JTFZZUGdv?=
 =?utf-8?B?NnREcHY3OU0wcVowdkgxTmthREpRTTZ2Z2Fvb1VIa1lJbU15YjA2TmxSbU83?=
 =?utf-8?B?cE5RdWdxT3JwejY1UHlMdXBDaExFc1dYakpUZHFvSHpvTEZ3S21CRWFxZUhz?=
 =?utf-8?B?QVJuc295eHBESW85WFNxeElEdUJ3VHNyY1VzTDlyNEUyMm40b1VGVHZRaUtz?=
 =?utf-8?B?MHdRclBkQ05KaGZmaUxSdWRyNWZVekdRRkZmVFgvYmpuWHhYbjNyYkdqdHlz?=
 =?utf-8?B?cEZ4dUd5MW9VTHVRVTlpZmo4MEI0ZjlSYXA5Q2F5cUdGajQydkdYMWNKYytQ?=
 =?utf-8?Q?ljcCJrn72i1v8PEzZYwBPBe82?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399f8451-84c5-4a1a-3eae-08dbb8353669
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 10:51:29.0360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikwor0FAZSto93ZEiMs34N3Bsk+avyYcyxdOv4nqV6lTdLoixEDlu68QnwY5R7whTkm5HD3vK5QhtxF625UDRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9422

On 18.09.2023 12:34, Julien Grall wrote:
> Hi,
> 
> On 18/09/2023 11:24, Jan Beulich wrote:
>> On 14.09.2023 23:06, Julien Grall wrote:
>>> On 04/08/2023 07:26, Jan Beulich wrote:
>>>> TBD: What to set CODE_ALIGN to by default? Or should we requires arch-es
>>>>        to define that in all cases?
>>>
>>> The code alignment is very specific to an architecture. So I think it
>>> would be better if there are no default.
>>>
>>> Otherwise, it will be more difficult for a developper to figure out that
>>> CODE_ALIGN may need an update.
>>
>> Okay, I've dropped the fallback then.
>>
>>>> --- /dev/null
>>>> +++ b/xen/include/xen/linkage.h
>>>> @@ -0,0 +1,56 @@
>>>> +#ifndef __LINKAGE_H__
>>>> +#define __LINKAGE_H__
>>>> +
>>>> +#ifdef __ASSEMBLY__
>>>> +
>>>> +#include <xen/macros.h>
>>>> +
>>>> +#ifndef CODE_ALIGN
>>>> +# define CODE_ALIGN ??
>>>> +#endif
>>>> +#ifndef CODE_FILL
>>>> +# define CODE_FILL ~0
>>>> +#endif
>>>
>>> What's the value to allow the architecture to override CODE_FILL and ...
>>
>> What is put between functions may be relevant to control. Without fall-
>> through to a subsequent label, I think the intention is to use "int3" (0xcc)
>> filler bytes, for example. (With fall-through to the subsequent label, NOPs
>> would need using in any event.)
> 
> I guess for x86 it makes sense. For Arm, the filler is unlikely to be 
> used as the instruction size is always fixed.
> 
>>
>>>> +
>>>> +#ifndef DATA_ALIGN
>>>> +# define DATA_ALIGN 0
>>>> +#endif
>>>> +#ifndef DATA_FILL
>>>> +# define DATA_FILL ~0
>>>> +#endif
>>>
>>> ... DATA_FILL?
>>
>> For data the need is probably less strict; still I could see one arch to
>> prefer zero filling while another might better like all-ones-filling.
> 
> It is unclear to me why an architecture would prefer one over the other. 
> Can you provide a bit more details?
> 
>>
>>>> +
>>>> +#define SYM_ALIGN(algn...) .balign algn
>>>
>>> I find the name 'algn' confusing (not even referring to the missing
>>> 'i'). Why not naming it 'args'?
>>
>> I can name it "args", sure. It's just that "algn" is in line with the
>> naming further down (where "args" isn't reasonable to use as substitution).
> 
> If you want to be consistent then, I think it would be best to use 
> 'align'. I think it should be fine as we don't seem to use '.align'.

I think I had a conflict from this somewhere, but that may have been very
early when I hadn't switched to .balign yet. I'll see if renaming works
out.

>>>> +#define SYM(name, typ, linkage, algn...)          \
>>>> +        .type name, SYM_T_ ## typ;                \
>>>> +        SYM_L_ ## linkage(name);                  \
>>>> +        SYM_ALIGN(algn);                          \
>>>> +        name:
>>>> +
>>>> +#define END(name) .size name, . - name
>>>> +
>>>> +#define FUNC(name, algn...) \
>>>> +        SYM(name, FUNC, GLOBAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
>>>> +#define LABEL(name, algn...) \
>>>> +        SYM(name, NONE, GLOBAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
>>>> +#define DATA(name, algn...) \
>>>> +        SYM(name, DATA, GLOBAL, LASTARG(DATA_ALIGN, ## algn), DATA_FILL)
>>>
>>> I think the alignment should be explicit for DATA. Otherwise, at least
>>> on Arm, we would default to 0 which could lead to unaligned access if
>>> not careful.
>>
>> I disagree. Even for byte-granular data (like strings) it may be desirable
>> to have some default alignment, without every use site needing to repeat
>> that specific value. 
> 
> I understand that some cases may want to use a default alignment. But my 
> concern is the developer may not realize that alignment is necessary. So 
> by making it mandatory, it would at least prompt the developper to think 
> whether this is needed.

Forcing people to use a specific value every time, even when none would
be needed. Anyway, if others think your way, then I can certainly change.
But then I need to know whether others perhaps think alignment on functions
(and maybe even labels) should also be explicit in all cases.

> For the string case, we could introduce a different macro.

Hmm, yet one more special thing then (for people to remember to use under
certain circumstances).

Jan

