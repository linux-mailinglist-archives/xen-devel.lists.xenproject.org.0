Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A44E7D6491
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 10:08:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622673.969700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvYvc-0006Zd-PH; Wed, 25 Oct 2023 08:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622673.969700; Wed, 25 Oct 2023 08:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvYvc-0006Xi-Mj; Wed, 25 Oct 2023 08:07:48 +0000
Received: by outflank-mailman (input) for mailman id 622673;
 Wed, 25 Oct 2023 08:07:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvYvb-0006Xc-5v
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 08:07:47 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 923894fb-730d-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 10:07:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9727.eurprd04.prod.outlook.com (2603:10a6:10:4b1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Wed, 25 Oct
 2023 08:07:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 08:07:39 +0000
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
X-Inumbo-ID: 923894fb-730d-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qfl0tb1slb6cRNlYWgUqGpYZNjojbHtZ80Qf349v/saIeMZvgK9c+kIq71UsbbKL5u5biJ1QO8Yczw0QI8GPVIqXultUeJVLDLqMeb/gHFcnlfSTuCohJINzqhCe0CmJM4rdkie7+4pTi4BFFHOpQc98YgV4cTvZe2Ow/WJCeKSk/J0VcfOYqJR9FLzpiQG5xEjQCyzKlN3tOO2zXQgw2PMqqMeuSx8GUdlyPwkTwfHtOa9OOjQVYGikJvKv2ZiUICd78NdRAtaB+HmvqakKlnkbtnC+ObrHQVHwqYix1ADuR06o3M7p75jCaLAXVxMV08boEkn+s3AyCxg2YEIZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvVdPMyeTrWa4wtX8MkVNbHky8cgJSJqf4FOFEQZ+I8=;
 b=PA7/IPAJRFawVs1VfgSoldcj4iwh/rlGkCfP0bBD/YXNdJkRYqSkC5ppYojDFPk9/r0rqLunQnLXwA8WESBgh9M7fzi5jjkEOq0u7OAsjcmQikxKxxzG/3jokrX8UC7iRxboM+mglc9mYGWv3tRUsm59fw3ti0GjJb2yuyFdL6pMM341ZNAIihjn35gzOIlS3t7mxszz9g/dhWk77CJsExP1Iipd4cnM056zFwUaxST1nSbheEH0zaSnTSwrtJhNKYULYMscNSKXWXXB3Y8kLzuJ2oZHrVX2iBeugz9vWuA08msMZOYWfNAnyD6J92kVaYgJU1tZ0GfNumnWbbq+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvVdPMyeTrWa4wtX8MkVNbHky8cgJSJqf4FOFEQZ+I8=;
 b=QS7SdmRLuoCF/aLoTc93W1ShzWLdRscbwJpKjO2PbnByl1UTy13Y3djADCp9UkK8IFtdG0n6MSuKLR5J9pZ+N29h3HaDiPcZUsbZyUQHfGIP6wgi8vfkBhQmBPBRsRtXrtxh5Rr3Efu3pjcXN5tsgPWofZPQMBXiLPnX0hYk8qAo4LGV/64JWV0blOvWEIyKH9Hoyk/76PUnIBkhDxy+AuspD2eQg/miokmhqqEqLwcnyCmoXN1zY8QEbQ18AcqpSL/tOjZsF/v/jnZu074TqZiAmL5Eq8zdywruGujpH/8yjdfdWymyuBfhl1gtI4Vp/8yUnXTGGwP67f5R7cFyKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e2991d7-b7b5-2fdd-38e0-ee1eff607f0e@suse.com>
Date: Wed, 25 Oct 2023 10:07:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] misra: add R14.4 R21.1 R21.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2310231628500.3516@ubuntu-linux-20-04-desktop>
 <967caedc-3d10-dee4-6614-1b9dcc0c1c66@suse.com>
 <alpine.DEB.2.22.394.2310241753220.271731@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310241753220.271731@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0410.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a8f8ce-3401-4e4f-6aca-08dbd53174de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OhlLvzIkLiYwGcEXCMFHKjc92GnUaNEiynmG28EK/bk3bOluPjr8cuFhwZ2yciDq4hsPDOkqH1jeDaOLqFzJT39qxiAjFC08B42YG8G2UA3U8TPpARb1hUWVLZ78w+WSwaV75JhBmd+Zmbx8HHUF8wnLsLSq9FetEWI83fqf7/EI5iAKSrXj+zF5TufGy3E7uWBwSfjyhW2qpNIJXMEzRL0EAn2e1sBPpQYg+eUx7Kgl1yQwwC9TpNOTO2Xa9wcA3np51uztjpoAZCrjh1GK+b7Pn7+6oz5Nb8TfVn4Mx1+/TNeRlPgSVelStwLWWZFDD90reqps8ohgnGZD8lo+QqBvuEoXCTQHC3GnC6KHkmtzEytSt7lUGqYjkeEMBc/uVGVj+Q/T5B31FV7933sTJ95x1k36MgsmJplSapBSRTMzgsXb36koEg7GEuYZ8mwuajQP/UhKa9BGSuzDpgqSVDi76P+Sz7pjM9WH/zXaFW8IaeOg/+TU6hphOFy4rXYatqhjJ99mIoC+jbbTjm5nNfSW4BuV1A8GwO6/xU0WSs4WM6WhO3EGWwHHLQnm91SNqsuxDBDmcdWVmUwJznDqxvc5EfFZKLhZyyDlXz/o6NUL0MkeCsXIr3sRYR1YT98RsElOWTC8vaO5micmqa+1eQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(31686004)(2906002)(2616005)(53546011)(26005)(8936002)(478600001)(6512007)(6506007)(41300700001)(316002)(4326008)(66946007)(8676002)(5660300002)(66556008)(66476007)(6916009)(86362001)(38100700002)(31696002)(36756003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3dPSjNwWkxjc2QzaDdsSytCd2tNSTJsaStHWFNUL3IrbHBmbjFZTldGMkZX?=
 =?utf-8?B?L2diMmRucmRZOEh5NXRhR2JNVWF2RFlENFZKTjJiMVR4SUNhNkVmQm9WN0RS?=
 =?utf-8?B?NFI1Nk5iWUwxc2ppZGhzMjBXSnFEaU5DQVJPMm1BZ0RVRysxbzN5VGVYWnVW?=
 =?utf-8?B?eVluY2kvME5QL0dFcWQ3VjlwNTJ0SFJBMy9Iam1WK3hzNDFSM0d5R2hWUkxr?=
 =?utf-8?B?bjRlMVRIODNIbTRjdmhMWmpmVUF6Ym12RTZTaVNXMkFpb29tczlkV3ZVVVND?=
 =?utf-8?B?MDFMaFdCQU4vT2tJRUplUzFMb25yVlkxZUFFZmNEdjFyZ2NDWU53QVRlcHFs?=
 =?utf-8?B?QjB3UHEvMzVmK3NHZ1pBc1lNN0g0aVYyb2xzOUVoUlFaRXZIUWVoTEgya05h?=
 =?utf-8?B?M1lpLzNUN1lEQUZtMjZKV1JHSlhZVHF2TFBCKzJuclBhWnBCc0xUUWErYmhV?=
 =?utf-8?B?TTdWN0o2Rzg5TXFoOEI3NUxHcWhzam1Sd1VmSUFDRDBBSXFzenNDeWw2V1dF?=
 =?utf-8?B?clZlbzBUTms2dHJnNkZRZGhGcnp5TE1xZ0FZQURiTGZpRm5meWNGL2QyRU5u?=
 =?utf-8?B?TXNxNHhnYjBXTm9qTnJzLzN4WG1QeWhJc09hSG1ycW1VZVUyaDFHZERNVHF3?=
 =?utf-8?B?N2xZRmRQRjlUZWRnaHo1b3dFUlUxVkUrRU92eW9mcDdlUVBheGcwZUFyMW42?=
 =?utf-8?B?bE40ZDc5cU5MeGU5RmdNUldwRVFsZlZRTzZISU5Fd25hSmtPVkNmRDVyN1B4?=
 =?utf-8?B?TVZ3Yk0yNWtVMmg2NTNjWU1aWGx1WElVc2xqbFdCc0RaUTZtQ0htQ2daRnll?=
 =?utf-8?B?QUlXZ2lSajFGclZWbWhvV0xDME43VTN2Z1dLWlROOWtDb0tYVzZNZHkwd29p?=
 =?utf-8?B?QjVzLy9zNmxzbzhwTTg3dWZkK0EzQlYxZURBR0M2ME5RWEJXQldGYnNYMnBJ?=
 =?utf-8?B?M3FDdGVCald0WnBFOC92b2RFc3U4bHcyMFBNNHJLZ2lKVmRGVlJEbFZ4bU5h?=
 =?utf-8?B?Z3NvT0pxRmJMcnFEK3RBVWRuL3pPbkxzL0I0dE13MitlZ1ROUmJRdnVHNm5q?=
 =?utf-8?B?S1BDOG15VmZiT0V2TDBOSXpVNzI1bmZqS1dJODlabVhJZytGOWtNVlBUdWZN?=
 =?utf-8?B?Nnp0dEhmMDNuNEJPejlsSDg5a09MUkEwcjR4UmtNV0QzTENQZ2c0V1NBekdX?=
 =?utf-8?B?NDZyd0VrRTlmSGJnbUdvdXlmQlRjVlZ3TlJPMWxpVElCc3ovTWJsUU9GcEFY?=
 =?utf-8?B?cnJ1Zk1hZjNFbmkrZXZTN2hKVnRLRkdtSzV2M2Z4VUFEcDh0cDdLREh4emZm?=
 =?utf-8?B?VmY5d0oxM3Z1RldEKy9UUGJlT2swVlNYZkVMbFFWb2FsZlJQMkxUMzJ1TDBv?=
 =?utf-8?B?TXVjUHhQdmIwYU1FcEJINndFS0plWXE1Uk9zdTl3dExEY1RXclo5SjFPQ0RF?=
 =?utf-8?B?NGxWNURjTFFDRWNaSEVMWmxXMHh5VFU5QUtPZk4wU202dlVRMjFWQm5MTm1D?=
 =?utf-8?B?M1VxdVhpbzRBaGZoem9pa0NaYzFXUUZGZzh2L2h0Zk5EdkdtbDMxVCtseHhO?=
 =?utf-8?B?VzFXaXpUay9oYW9YVWJpaWlDWUZ0VUdnTFVmYnJ0REl4aEg5aVNBT042Z2Y5?=
 =?utf-8?B?NEx4TEFRcWpEaEJzbW5HcEwzQVlUQlB5MFVPL2dTUTVGWmkrRHdkSTd0Y1ZQ?=
 =?utf-8?B?bVdSZ21MSllnL2U5NVdDazJmbWd6VFNuVGZVZk5QaURVUURXQzRXNmdXVmEv?=
 =?utf-8?B?K3Q3REJ6N1lvZkVMRGx3a0NMb1NKeDhiLzRaMW1KZzVUYWU5SmFRWnBlUHZZ?=
 =?utf-8?B?aGF5MVAvdm9oSXErbGN2a05hL3lNZU1qTjU3UTZ6S2pVakJJU2pDSEFEL2pB?=
 =?utf-8?B?aC8yeGVKampxRTQ1MXhZNXFPMUE4WnRvOElHcW9iR2JVWERIaFdvK1ZhbzBP?=
 =?utf-8?B?RUcvczBSK1EwMFBRNTFra0xHUUVydzRFNWdlbU03VVJ2UDhoWkVSdTIzSjVz?=
 =?utf-8?B?bTZwOWNsSGJUVWE1V3B4NVZVVDFTcW1IYzVFYml3aHdGRytWYjk3TUxVUEU3?=
 =?utf-8?B?RWptNUV0c1ZTZ2hvc25OcU0vVVNGVzF2UnJqcWZJUTg4SzMvTjJTNnZKczNj?=
 =?utf-8?Q?TWnYpwwMC3p+Kh05e3GvyPUb0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a8f8ce-3401-4e4f-6aca-08dbd53174de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 08:07:39.5357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xQ2JyydxZO6is8UnFse8Gi86+GhYfOBxzZosmIiMbPqtk3gOAvSDzgL/pqg9Tub+4EZCqLTyOci54et0eHOYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9727

On 25.10.2023 03:15, Stefano Stabellini wrote:
> On Tue, 24 Oct 2023, Jan Beulich wrote:
>> On 24.10.2023 01:31, Stefano Stabellini wrote:> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -422,6 +422,13 @@ maintainers if you want to suggest a change.
>>>  
>>>         while(0) and while(1) and alike are allowed.
>>>  
>>> +   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_04.c>`_
>>> +     - Required
>>> +     - The controlling expression of an if statement and the controlling
>>> +       expression of an iteration-statement shall have essentially
>>> +       Boolean type
>>> +     - Implicit conversions to boolean are allowed
>>
>> What, if anything, remains of this rule with this exception?
> 
> Not much, but there is a difference between following a rule with a
> deviation (in this case we allow implicit conversions of integers and
> pointers to bool because we claim all Xen developers know how they work)
> and not follow the rule at all, at least for the assessors. Also,
> anything that doesn't implicitly convert to a boolean is not allowed,
> although I guess probably it wouldn't compile either.
> 
> We could also try to find a better wording to reduce the deviation only
> to integer and pointers. Any suggestions?

Since compound types can't be converted anyway, I think only floating
point types (and their relatives) remain, which we don't use anyway
(and if we did, excepting them as well would only be logical imo). I
therefore see little point in making "integers and pointers" explicit.

Instead I wonder if we shouldn't make ourselves honest and say we
deviate this rule as a whole.

>>> @@ -479,6 +486,24 @@ maintainers if you want to suggest a change.
>>>         they are related
>>>       -
>>>  
>>> +   * - `Rule 21.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_01.c>`_
>>> +     - Required
>>> +     - #define and #undef shall not be used on a reserved identifier or
>>> +       reserved macro name
>>> +     - No identifiers should start with _BUILTIN to avoid clashes with
>>
>> DYM "__builtin_"? Also gcc introduces far more than just __builtin_...()
>> into the name space.
> 
> Yes agreed, but in my notes that is the only one I wrote down. I recall
> that the complete list is a couple of pages long, I don't think we can
> possibly add it here in full and if I recall it is not available in the
> GCC documentation. More on this below.
> 
> 
>>> +       GCC reserved identifiers. In general, all identifiers starting with
>>> +       an underscore are reserved, and are best avoided.
>>
>> This isn't precise enough. A leading underscore followed by a lower-case
>> letter or a number is okay to use for file-scope symbols. Imo we should
>> not aim at removing such uses, but rather encourage more use.
> 
> More on this below
> 
> 
>> In this context, re-reading some of the C99 spec, I have to realize that
>> my commenting on underscore-prefixed macro parameters (but not underscore-
>> prefixed locals in macros) was based on ambiguous information in the spec.
>> I will try to remember to not comment on such anymore going forward.
>>
>>> However, Xen
>>> +       makes extensive usage of leading underscores in header guards,
>>> +       bitwise manipulation functions, and a few other places. They are
>>> +       considered safe as checks have been done against the list of
>>> +       GCC's reserved identifiers. They don't need to be replaced.
>>
>> This leaves quite vague what wants and what does not want replacing, nor
>> what might be okay to introduce subsequently despite violation this rule.
>  
> My goals here were to convey the following:
> 1) avoid clashes with gcc reserved identifiers
> 2) in general try to reduce the usage of leading underscores except for
>    known existing locations (header guards, bitwise manipulation
>    functions)
> 
> However, for 1) the problem is that we don't have the full list and for
> 2) the problem is that it is too vague.
> 
> Instead I suggest we do the following:
> - we get the full list of gcc reserved identifiers from Roberto and we
>   commit it to xen.git as a seprate file under docs/misra

Such a full list can only be compiled for any specific gcc version. Even
non-upstream backports by a distro may alter this list.

> - we reference the list here saying one should avoid clashes with those
>   identifiers as reserved by gcc

With the list constantly changing (mostly expanding), that's pretty
hopeless.

> And if we can find a clear general comment about the usage of leading
> underscores in Xen I am happy to add it too (e.g. header guards), but
> from MISRA point of view the above is sufficient.

But what we need isn't a description of the status quo, but one of
what state we want to (slowly) move to. The status quo anyway is
"no pattern, as in the past hardly anyone cared".

Jan

