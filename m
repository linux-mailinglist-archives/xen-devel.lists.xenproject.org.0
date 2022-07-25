Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CD957F976
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 08:33:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374401.606432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFre2-0004s5-8e; Mon, 25 Jul 2022 06:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374401.606432; Mon, 25 Jul 2022 06:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFre2-0004q9-5j; Mon, 25 Jul 2022 06:32:46 +0000
Received: by outflank-mailman (input) for mailman id 374401;
 Mon, 25 Jul 2022 06:32:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oFre0-0004q3-09
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 06:32:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60066.outbound.protection.outlook.com [40.107.6.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95c9d749-0be3-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 08:32:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6995.eurprd04.prod.outlook.com (2603:10a6:208:18e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 25 Jul
 2022 06:32:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 06:32:40 +0000
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
X-Inumbo-ID: 95c9d749-0be3-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tz+yJLbimhojX5eswuLVT6xT97tGSaYiiEKBMzEPw7/WsLJxwuF/LDWk5BD0g4GeE3/IcrFkHoepqKpg8TfP7Ar55MLnmXtnTueyQb6WjusM/FvDjHf+0qNbR38Dj00t+upO9Ib3j7ljhiIsZzA/o1DYotFDALSIVBzcPRtCyr1huneGw6LWKrg//KBS8UP5/OGp/ApYtSOKOBLBO260BFXadrq2PTKfFeQm0vODq/7LK7IPp3zgpk95fOc06A+LJksu7Xa9Jxic7yrPdEqXT/RMZHSDW8Hyr02/OjrQZeb9qWPGZ2mVDTUxqepKIqFhwwpzDyZTU4lx3uGQWQ73vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEMI1NFGV6V7jkH+IAFDlcLl0okeZTCi4Cw6X6lc1MY=;
 b=UlCFlntDWFZ1+chK77SBfTd2BIxJqgUk9JvEQgaORGqnSubZGS7P5i0BhFITLJvqVACKS5wWswf7QjEhb4dDy8nida4b5jBjvVcvY8ktlEgI/KVdGLBRfijUTWmdqKWhrZmBX57UsPpdsCDW6FhIh1PIR4Vz2dmPWI9uxP+huoaGX2/ar6INOT4sRBmIFrBFNkcpzLSJlmCdwZ6Dq69FO+sczlI4jcclmXGPhmzLWAxl8IA4f+JwzsPle2asOyexlqlEmpy4D1UmHfH2R14kgk46/vnGjhlvvL8UFjR/YLljrI2W/5XuDrgqt/3m+BncP+QyR20h5vp2k1eKqFzK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEMI1NFGV6V7jkH+IAFDlcLl0okeZTCi4Cw6X6lc1MY=;
 b=dmyYWowDpqG8REWhAG60TmZNq8aAOMHIhj5e0WriZYpnxpUfyN4xcVFLOAxQeMtS6Ii77qriOA1+n3x8D7+UCjUbqdlnR9s+ti80jJgou2FC3rJDMgfcTgNKrtPQG1NoPXHlVmpuuPFcdyHd+FPu1LiMXu+RI5QxupiYV8kszjCxR3IbAMxMg3XMRlEvKeRBfpGmY7xssgbkGt/uXp7BrpUUuL7QHFRaFv+RB1kLYu6NO+d32eBsG6Lj4MqEvPwGBW8vW4xTBuXy0iQ3vw6bR5vB/lFx5ARzVv+aMYAhUes3468cMSyJfrwliA5S6PL+FQDn0LFgliuJFfC2h9+KgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <99d585dc-9bee-b0a1-7f5b-db67b2ea0944@suse.com>
Date: Mon, 25 Jul 2022 08:32:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-4-burzalodowa@gmail.com>
 <115c89bc-259e-8ca1-5533-49c98f637a0d@suse.com>
 <3f4c9270-56e5-f9fe-6de8-01c997ad2ddb@gmail.com>
 <910119aa-69c6-6736-49f1-3b51da1c4fb0@suse.com>
 <e0a05c63-dc0a-6898-3e73-c327ff7514e2@gmail.com>
 <d4002ba3-e5b2-b732-66fb-ad6d674afe25@suse.com>
 <e0b98949-8bb4-5c58-1e96-0675a144694e@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e0b98949-8bb4-5c58-1e96-0675a144694e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f3474a0-f370-43ce-4213-08da6e077929
X-MS-TrafficTypeDiagnostic: AM0PR04MB6995:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WIw3IwlqLfM+wib8/xppD171/x47GtkUmHZmm1LcV7u/Kjy35hgLnMXjAAogl9sZEsE9aPez7BxFuPk68OvQ073Z6cY9dvRKEk4etX21aZv7b6mCblJzp+K6tVMM6O2a82TsgnSPsZ8fimBX5CZI3tebTkuWUKJpk2DNPhWR8oIu+7s803qGNnHWBmHVRF/H8YF0Xf9cSBUDBRawS5InsUKQEpCEYSl3THuUzFuc9eDsKqF55Hl54pta2tSglyjukzbNtztsQDINT0DFVjtUtH1dRf+j7jQz0M6yGT3xeHQnK2Ra79n1/Qy9WYB8rrkSDZbE0zq0Ha7RaE5Oq1T69vnqx5SHEwYDealH9mCEo3TXjqBc4U5dZFjvbevLIcvjWWni/EWjVGNJREYN3Jf8Jc+dOyi3/R6jgn0QtYy7kJnjiDvw8Vd1lGDJH28eK6gpiTChpcmp3RJNbiQeJv1PpiCIktEKGzaBQ8R5mlFLVjmc19ajc2kNplPnVyAWSt/f9DiYIyTE7GqMtJ11TiR7H7/rHJqrQYV7oxcZOA3Bm68TOtaYzMfQGncpg7Hq1vvt0GRLvld8y/1XATfqD3JpSDZBI1bAmGlXiPrMQWwEUdugJTBtGtk1fio/uBJ2yry4Moj2JP6aONjaIsfoVxXr8vzgFsbOlLp5VdIJ7gzwN6e9vznETCDhQpVDt/+aSctiSFnhJs3Lr7dPNsuEsawY4PLK/1c6rbjFSoOueV4H8D5RMKCd8/kGM8HakWseAHoXOELqhZkbxtpFUnsTHqtQvL7O5XX7ZMCP5bvh1UWGjb7hrgCy9b16tqJ83lJIKOQf0it/j37WQPlrelId4OapHw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(366004)(136003)(376002)(346002)(396003)(6916009)(8676002)(38100700002)(66946007)(4326008)(36756003)(66476007)(86362001)(31696002)(54906003)(66556008)(316002)(5660300002)(8936002)(41300700001)(6512007)(478600001)(31686004)(83380400001)(26005)(2906002)(2616005)(186003)(6486002)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTkyNkszeDZDeVU3ZVgzM3hpdTRwOERlWWlxekRlaHc3T1pwMjZMeGczZmFY?=
 =?utf-8?B?SjJpbXNwWUozcDJuMUhpczhsbUxnaW5SNUdONHliZnpNdFh0RkdpM1hSbVBq?=
 =?utf-8?B?V010anhtS250ODV1bDZqUzB0cUoxcTdVRE5SeDlhRXQybmVqbXlzKzBMNElT?=
 =?utf-8?B?YkJEbzhFZDdIaUFwbGFTWGFwT3dQNHVsZVhrWEZQaTNuYzg4dFdsZWRkZUVi?=
 =?utf-8?B?TFJGYnVKbDB1VXNHYUkyTERlUjM4cGdzL28xNlpHbUplYlRwYit6VytaYTZN?=
 =?utf-8?B?K2hKOWwrcWg1WlB1RFhJK3hYSVZleUltUFpTRTd3ZTNEVWQ2ZG9nYVI1bGpv?=
 =?utf-8?B?SFNZZm5DaktMUG0rdzJ6YnNONEw3aXZmRUFBN1lZbU1Ia2lwdi9jbDdETkJh?=
 =?utf-8?B?MjRHa3p4aHhUcFRtSUJUdnZJUEk2N3ZQakxROTRPL0pHa2tOaVczZkg2TXNQ?=
 =?utf-8?B?RlBSaVhzb3lORE0xQXIyWmxKRVFlc3JPZGZ1N1FON2FFTktlOE1tdjRjMTN4?=
 =?utf-8?B?YURueHpxUDNPcDl4ZzJXZmVhM0F2WEF1VXNzUmdQS3hJMFhuOXpMNVY0Nm9L?=
 =?utf-8?B?Q1RWMzhnR29HRE1hTG9GTTg1MzVTczJ5UWNydWo2dHIzTS9nM3R2ZlJVdFAr?=
 =?utf-8?B?S3l5R3ZaaXlUR211YlEwNHNvcUlaSkVRMkhWSTEvM3hiZWJYd1o0NU1QSEdz?=
 =?utf-8?B?V3NxRFVJakEyUTVUc245MWFsQ2hLSmh6aVFSRldwQ25Sb3BGdExidFJqNUNB?=
 =?utf-8?B?VU5ETTRMVHRWTTRLTEpmUnVGeE90VmpzYklRdE43RnRxWDFvbUIyN0V3SVY0?=
 =?utf-8?B?NEtWa2FDbU5wK2hJcXdEYTE1MDNoTUZHTEZUdVAwOXhqQVl0TmQ5Nm5zcnBp?=
 =?utf-8?B?UlA5NlZ6RVFISWVZN2pmVFYwVnBUcXUwa250SzdQK21neVMwSUpSTG80cmpj?=
 =?utf-8?B?RFd5cG53MWVwWlR6VTJ2RnJGdnU3TlZ3VGRVMXhRL1FmQUdFdmpzYU5rR3Zr?=
 =?utf-8?B?cG1XdUttVW0xZ2tQQzRDaFhUSmo1RGFINVc0c2xSSjAxR3d2TFRYZFBudGRO?=
 =?utf-8?B?d2FqVFp4Skdob2N6QnVaSFN2Ujh0MlJjVnM0T0lxMUJBL2psWU5YY0xWOVdG?=
 =?utf-8?B?SFBhdytxV1I5ZFhUSnRid1hISDdFWHZvdWFRYXlHS2g4bzkyc0NjdkxJcVdo?=
 =?utf-8?B?Z0JOL3JoZVZKL0pEbXNSYU1hRVJEOFFKL0hLY1hzQ2dkb1JJOXhTdkJCNW1n?=
 =?utf-8?B?MXIrcTJuUkxrQWNmK1N4ZEdwem5qZlE5OHFPZllwaWZScTA1d2pxM0t5SlBp?=
 =?utf-8?B?bmQ4SmJSMW01blF2VnVmY29zUXpHdUNXS3dMVWRLNjVjZDJhZjI3OUZrbzhu?=
 =?utf-8?B?b0d3RnFoTHltZVFqV3FWWCtUcEt3VjRoQXlGVkVtMElrdmc4K09jb0F2K2Ft?=
 =?utf-8?B?R3NTWnY5djFRbDRCMU1QSDBrWmlUdldsRko4Qkp1ZzZsTnJPL3VqT3YzU3dm?=
 =?utf-8?B?SUp3UlpFVXJJajNkNXNqRzh1QldnaTRiMXp4Ym9JNU9yU2JaTFdwVXJ6V21Y?=
 =?utf-8?B?ejZXNlFrT0FNbVdpd0QrRjRJVzBXdDVZUUJudmV0YzN4TTZ6OEVFWmhKUTZ4?=
 =?utf-8?B?WWtweFlKaTdEVmRhdUNDSFhnY2E5SXdPbVkreE01UmFmekR2TjZ1eFBrZldm?=
 =?utf-8?B?ZzRiQ2RwNkNCc280R2cwc20wa2xEdks4a3k3Tnc3ZGlsbHl5aytJMFAzMWw4?=
 =?utf-8?B?YVRHMi8zNHVmNDZkYWZoN053OXA3SjRiVkNRaWdNRzY1MXlCTDR3U3Yvcng5?=
 =?utf-8?B?blhWa2hxU0pRUktCTk9uQmN6cXFvdzJvTWF4eE5KSFU0WlJ2Q0NybFg2Z2p2?=
 =?utf-8?B?UXFYVzIwL1JSdi85bzF2NCtURVVSd3Q2QWFvMk1rOEpqbmJWUTlXYnErYjdx?=
 =?utf-8?B?RHJlV3d2NWN2RktoQlppRDF1cDVVTzFRdXV4V2pBY01jNlp6YjdHQWd4V1Np?=
 =?utf-8?B?M2I2TEU4Y0REMkREeSttQVNiSWdudDY1TXJBcEFKalJ6Y3NHM05SSjhYZm45?=
 =?utf-8?B?SFFrSHZrMENrTE9PQXY4L3lFdTYycTZiUVJ1QjZaeG80TlZwaWMweHdwVTRy?=
 =?utf-8?Q?NSKF98u2o2+ycSZ0p3Hlh/9Vs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3474a0-f370-43ce-4213-08da6e077929
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 06:32:40.3857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWwNZamJ5hXAybJDn3qLPT5YLgHqU5+6d0ATgo/JRlJTJ1+/cT5T60dz7EuyiMePxFtJhwragoLiot1hbfrRTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6995

On 24.07.2022 19:20, Xenia Ragiadakou wrote:
> On 7/7/22 10:55, Jan Beulich wrote:
>> On 07.07.2022 09:27, Xenia Ragiadakou wrote:
>>> On 7/6/22 11:51, Jan Beulich wrote:
>>>> On 06.07.2022 10:43, Xenia Ragiadakou wrote:
>>>>> On 7/6/22 10:10, Jan Beulich wrote:
>>>>>> On 05.07.2022 23:02, Xenia Ragiadakou wrote:
>>>>>>> The function idle_loop() is referenced only in domain.c.
>>>>>>> Change its linkage from external to internal by adding the storage-class
>>>>>>> specifier static to its definitions.
>>>>>>>
>>>>>>> Since idle_loop() is referenced only in inline assembly, add the 'used'
>>>>>>> attribute to suppress unused-function compiler warning.
>>>>>>
>>>>>> While I see that Julien has already acked the patch, I'd like to point
>>>>>> out that using __used here is somewhat bogus. Imo the better approach
>>>>>> is to properly make visible to the compiler that the symbol is used by
>>>>>> the asm(), by adding a fake(?) input.
>>>>>
>>>>> I 'm afraid I do not understand what do you mean by "adding a fake(?)
>>>>> input". Can you please elaborate a little on your suggestion?
>>>>
>>>> Once the asm() in question takes the function as an input, the compiler
>>>> will know that the function has a user (unless, of course, it finds a
>>>> way to elide the asm() itself). The "fake(?)" was because I'm not deeply
>>>> enough into Arm inline assembly to know whether the input could then
>>>> also be used as an instruction operand (which imo would be preferable) -
>>>> if it can't (e.g. because there's no suitable constraint or operand
>>>> modifier), it still can be an input just to inform the compiler.
>>>
>>> According to the following statement, your approach is the recommended one:
>>> "To prevent the compiler from removing global data or functions which
>>> are referenced from inline assembly statements, you can:
>>> -use __attribute__((used)) with the global data or functions.
>>> -pass the reference to global data or functions as operands to inline
>>> assembly statements.
>>> Arm recommends passing the reference to global data or functions as
>>> operands to inline assembly statements so that if the final image does
>>> not require the inline assembly statements and the referenced global
>>> data or function, then they can be removed."
>>>
>>> IIUC, you are suggesting to change
>>> asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) : "memory" )
>>> into
>>> asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) : "memory" );
>>
>> Yes, except that I can't judge about the "S" constraint.
>>
> 
> This constraint does not work for arm32. Any other thoughts?
> 
> Another way, as Jan suggested, is to pass the function as a 'fake' 
> (unused) input.
> I 'm suspecting something like the following could work
> asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) : "memory")
> What do you think?

Well, yes, X should always be a fallback option. But I said already when
you suggested S that I can't judge about its use, so I guess I'm the
wrong one to ask. Even more so that you only say "does not work", without
any details ...

Jan

