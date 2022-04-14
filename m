Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F97B5018B0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 18:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304946.519711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf2QX-0007lz-Ht; Thu, 14 Apr 2022 16:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304946.519711; Thu, 14 Apr 2022 16:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf2QX-0007jg-Eo; Thu, 14 Apr 2022 16:34:37 +0000
Received: by outflank-mailman (input) for mailman id 304946;
 Thu, 14 Apr 2022 16:34:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nf2QW-0007ja-IE
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 16:34:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4f88601-bc10-11ec-8fbe-03012f2f19d4;
 Thu, 14 Apr 2022 18:34:35 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-MfAtopO9Mta76a-O3MdQlg-2; Thu, 14 Apr 2022 18:34:34 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB8955.eurprd04.prod.outlook.com (2603:10a6:20b:40a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 16:34:32 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 16:34:32 +0000
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
X-Inumbo-ID: c4f88601-bc10-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649954075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JqeBv7uNjUwOrelaDS+QCNSnhaBNSrybNsEhnC8M7mQ=;
	b=P/wbW5hwRg/r95i9tzyTnDo6+wLJuQ7YPysfAhavO2BHlE6YKFWUREOOYok4maCk3EOf02
	XH6OLyNO86sZVha0Tb3XOtWCu8QHELUO/L04ASzqEeOPzWM9Ur6ir15fJ6n0FLD5Z5oHTf
	diImV9Dcq+iNCf3ojQHVnWuIPr68IwA=
X-MC-Unique: MfAtopO9Mta76a-O3MdQlg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoBlh6MW1XHft1ebhetNR1kFIjMFhkjvrYgAdyd6bFi5vJ0dJToxR1TLoZKY8sGfraeTU4D9cC/OGjbfnpLG5nnGqq73fQOWQlWW/oZucJlDaIOgCJdJNhj05MHC5T1xV6TYMGwpw56TFgaCHZscbBZp67j9mCLVJZKs/DZulgTTuI9AfmNvF5BL9tcaoyPexi5ZH/DpiP0OlmYA3tLYgRRjOFP+U4on20RGrE1DBss30gK1G5gd1xyv6zQJZUTLO5BgHXduyDFTt4ue6N/cVDRv5Czd87pojoMrfd71bQq1xofdLeKu8BVDOhOospxhXqNCWVtdhFm85q00zqWvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJwdD5Tu+8YeA7HZ1XQVAi4DVCliaFUyUb0bIoJhaHs=;
 b=HGFrkKxkheCHlr4fJDbuW5+IJXXMNqr/gNvI7zA0mBfFBzBoQOudhzXD72yXvIk7L6IFw/giZpWdIe+WjTXdaX1bHOj4b5hr2riM7JQ9fwZBfa3f6JkYjJ7qPzN1BYjs8Ol8bxazuBbuDh6fL3ZQmm9RH5cEpFG6GWhR2cjQvZkNpzkaYpfz62DtGak3154qBlefdTYqaOAuJ2jWc4XdVuvM7ev4x4enxGie/DMqatzyWlSu9vk4kA3PhZFXZbF7oWe0hp7zjHUf9Itmu5sZRrAaZx8lQ5joy1iI9N7hS8mBe6nBROeaJj2HQxXOpt+ZyGzXEKUPVMXVsc0ieKGPhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e248866-abc4-5f17-5ec0-22339c48cf0b@suse.com>
Date: Thu, 14 Apr 2022 18:34:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] x86: improve .debug_line contents for assembly
 sources
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <23509d85-8a73-4d81-7ade-435daf46fcd6@suse.com>
 <YlgWKGmR+u41zSsw@Air-de-Roger>
 <04f9bd9c-70da-0966-afa6-96f81e290204@suse.com>
 <YlgiLhvsKVYKKvrr@Air-de-Roger>
 <2eab851f-0fe3-8462-cdbf-b438dc01ade1@suse.com>
 <YlhFiWYQMbjsOOAc@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YlhFiWYQMbjsOOAc@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0074.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb23c8d8-dea6-46e6-7c71-08da1e34a6e4
X-MS-TrafficTypeDiagnostic: AM9PR04MB8955:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB89557E42D885A7FEFC38039DB3EF9@AM9PR04MB8955.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F5/EcH88xo4itt4ey0tIokLlX7aHtQZdKHpt28t9VREuhSXFGaGE5dNTW1TlJC6rzKhHj8MluwpFVL6/TLAJprdOyY2/cCHUyVpWhtdKNeM1nrnx7ei6BPwfIo25ddH1bbFDXikaKFuJPUfekysurAUl1w9B1R/jY786NbywlL2h66/5gCEKxUh1akIHGfV/EyLvZPjsBbWigOnacmsvBBD61/+MfNR9yITjxr16fxknRHQLD3OG/SUtRhomTR12U2ZrW7uUdaamibL5R29uqAb6drtWIAWLfnyDPddCUhZcsm/Hyr3uOMnpksYGIdlUO4LqvGPaVXGnYxOnFadVOIgatTh3ph/il7yBUaoZsquarNrwA032/5HGWB5vPxs7OeOIWY+gbWvwHSLjf0Ih9O3Gah20xU7DVIN6CJHFrrk108FjWd2p3tCDMI9+R7/iIgOuPzor+MiuDcAVNqEI3kYq4IV7CUUs+oSzQiJGssluJl4O4rTiYcUYUuJJv77s6GX39jXIjPVDMSzuUBcXUT/nC1xS3RwVSpsTypYEKdzP6atIEhxV7mj02EWluOGr4w9hAFc7QgsWL8YmQX0DNmOtS313UwNljUcfQXIuHcR1qfFE34PVCDJPrhnQvONjHDh4gQWzldXpXJDwKAhsgkcxDXBBd9IdRJ7DTjDHdUxyRiAWazIlkYtGnvMxi5EvK/dvgyEZHVvR/Yv+Qj95U+absue/5LZnRR20DKGlfNBrTj9dqeHyOCwhKxPalZ+/Y5P2QgdhA/wLdnqBdlKJVYAHIZn/wATzx0K7dW6NeCYx/eqcVh3WtASMc73g06Y7I45WP2yXGVBRCt0aPusQmgbWf5BRtLfWDhmUpNJqMejPyCy3VTB+NZli3V9fevWss5RIUGZBCxq4aFyUKES4cA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(2906002)(53546011)(6506007)(8936002)(31686004)(6666004)(4326008)(6916009)(66946007)(508600001)(6486002)(966005)(5660300002)(6512007)(36756003)(54906003)(38100700002)(83380400001)(316002)(186003)(26005)(86362001)(66476007)(31696002)(8676002)(2616005)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qjjkynFh2PJZcmUdVzlLOIB5guMzHvTBRU0kEq+3hMqGAR3xxjOMhhMEOQbI?=
 =?us-ascii?Q?lnJIjNFMjNFHEHp08u9D8ekq/Yaiy5ApC34V6iP4j4xgHk9QVK/9QMkT9hzC?=
 =?us-ascii?Q?YVzaaKa29GZJHfPive31cizZOL1SVsxn3Ib6NNQr2pcbVZQUBqgMQJzmTXqP?=
 =?us-ascii?Q?EaiBjfL3zxbPZvtZwAOWolMjTMOEsofvEsXSNhr60jaTQFjgr95K29kp+ORk?=
 =?us-ascii?Q?YMWbnYMSAS+TeHOIra700dsYNYFrkA37A5ezo4aMzCl7cf41iaD+bZllLhPA?=
 =?us-ascii?Q?4nPmKLQUtx/Bh1v7n8lJT8wP5mDT01tJKzyCgD/Gt6ne1u7DvCvDtw221Lqb?=
 =?us-ascii?Q?PjSW4+C4m36xKc8KBpYYfu2fQeaYXqYNjfEMzAnIpH2WBrQm9mXL729ZlAmj?=
 =?us-ascii?Q?909WAYzu9zPWicOg2CXsxQD1jlfmpGPeLTnu9g+do7M7L4Vf5+yHkPgPvoxS?=
 =?us-ascii?Q?nO3B/zxxtyYBnHn5bFnfPQm0GKCRyPtDlZtq8FTVYxDdx9Ap7rzNbXpTfa3f?=
 =?us-ascii?Q?04XAXQuWeE1KoNqo2yWdgiCzSAYHN7BoVA2BEFpbeB36UG3RE9qK2TxZ9DrT?=
 =?us-ascii?Q?nhtzukbmBYGHbEclyJrHWVP+tLuGAg0Z0ktycDPrI9G/7/givyWmjnHjAQ/r?=
 =?us-ascii?Q?RfdftKzqtJT/tfV4ioBfAZhUsQgX+vuoHCFEZh0IBd99pgOH5SipaAFSmH2o?=
 =?us-ascii?Q?AmU589hHCkh013CVX1XiyNe25ScJ1gtNBo64ClbS0HAfvv12tMTg2/9qwQA8?=
 =?us-ascii?Q?G5MzwMDXkCfkVOGwXLNAZJJwR8vYk8xlEB77BnXqvoAh2ctihIWF8IL17T6v?=
 =?us-ascii?Q?IVQ+9XkA5nZhov+S7YESGYm02i/km2waTjyeBNetR0Vcm3awU2E5jfytIrjf?=
 =?us-ascii?Q?2WIKDS4j+oGtJ6UswCykV+eFyYbcRJOVzOOJVdNoH26h7turQPGRQ0qnnd+s?=
 =?us-ascii?Q?bjUFwHlsFqSxgs8PjNmiwujNJUUlVPWb3Gz7bRQGEO20mkXTUf0ghDjYLM0w?=
 =?us-ascii?Q?N92azZ5TP2n9rAx/FI0w7IPXBQIOjAr8AlQYwk1IP84LQYCY5xxWVBBqRhzr?=
 =?us-ascii?Q?vBnjzlddWKaRuTNvfqC6tjrxJN8DlCb/Jb6J0PCpPcw8Wxq23iDAhwYY5R3T?=
 =?us-ascii?Q?aNkL+UBLFDLWwBVTGD53e/SWzgWWHo/d+HXmGWb1Ncl+pFnakhq1nZkti8X6?=
 =?us-ascii?Q?QPnkjqhsxcHbzBzqDaS90HrK/Ux34uTuMKRDbnHha/X/MEUJQkNMFN6Dx0GV?=
 =?us-ascii?Q?llRHMoRajfoErfhnjXg3amvWoD6MEFHtdZHz1sCVQHaRDync/6yx6BDLFKZ/?=
 =?us-ascii?Q?/SgoqXwvtf07zPVqJA5fiof4/CG5Xtb2F2HrLdRGFW/vQODK4wJ5L9vo5l4H?=
 =?us-ascii?Q?MbS8wjiHbwSvprJUUnqxuKvp402Mgtktw8ETtPM0rpWyKwVs28+f0SfoUZW+?=
 =?us-ascii?Q?eK1Bde7Hy5f55rBB26GRYwssDVNj7SyKt161fY2Hao2KdnHbdQw8ysc7jKsx?=
 =?us-ascii?Q?YNOLs1xEjTWv91rgURG76yhCtS/DA4sMnW8IyWb2FPA7N0b+yTuTKhNI6REU?=
 =?us-ascii?Q?OvrCySeFNQRKddpvuzuXYn3yFCWGhX8pBe6/QodqtdA5EjtQx3iHIzK+w4ac?=
 =?us-ascii?Q?K74dw5ERmzpRe9aM62B9LiyS+KHlXOyKwLh94VS3MEid+yPEgCKWe4NBkS/i?=
 =?us-ascii?Q?SE+cMM2c//YgqvzAP8asDYXIwz3M3nrEUra2+LhjJezmF+FA7KvlEmUbz6wL?=
 =?us-ascii?Q?BMFzXvDbSQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb23c8d8-dea6-46e6-7c71-08da1e34a6e4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 16:34:32.6137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10gVCtEGTOvcvARmhRe11Gq0enJnbGCyM+7/HquokMNQ4pmUAeXi/wMrHnY34xINMMyzcm7gw8MDsAXZIEnnLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8955

On 14.04.2022 18:02, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 14, 2022 at 04:15:22PM +0200, Jan Beulich wrote:
>> On 14.04.2022 15:31, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Apr 14, 2022 at 02:52:47PM +0200, Jan Beulich wrote:
>>>> On 14.04.2022 14:40, Roger Pau Monn=C3=A9 wrote:
>>>>> On Tue, Apr 12, 2022 at 12:27:34PM +0200, Jan Beulich wrote:
>>>>>> While future gas versions will allow line number information to be
>>>>>> generated for all instances of .irp and alike [1][2], the same isn't
>>>>>> true (nor immediately intended) for .macro [3]. Hence macros, when t=
hey
>>>>>> do more than just invoke another macro or issue an individual insn, =
want
>>>>>> to have .line directives (in header files also .file ones) in place.
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>
>>>>>> [1] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=
=3D7992631e8c0b0e711fbaba991348ef6f6e583725
>>>>>> [2] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=
=3D2ee1792bec225ea19c71095cee5a3a9ae6df7c59
>>>>>> [3] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=
=3D6d1ace6861e999361b30d1bc27459ab8094e0d4a
>>>>>> ---
>>>>>> Using .file has the perhaps undesirable side effect of generating a =
fair
>>>>>> amount of (all identical) STT_FILE entries in the symbol table. We a=
lso
>>>>>> can't use the supposedly assembler-internal (and hence undocumented)
>>>>>> .appfile anymore, as it was removed [4]. Note that .linefile (also
>>>>>> internal/undocumented) as well as the "# <line> <file>" constructs t=
he
>>>>>> compiler emits, leading to .linefile insertion by the assembler, are=
n't
>>>>>> of use anyway as these are processed and purged when processing .mac=
ro
>>>>>> [3].
>>>>>>
>>>>>> [4] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=
=3Dc39e89c3aaa3a6790f85e80f2da5022bc4bce38b
>>>>>>
>>>>>> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
>>>>>> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
>>>>>> @@ -24,6 +24,8 @@
>>>>>>  #include <asm/msr-index.h>
>>>>>>  #include <asm/spec_ctrl.h>
>>>>>> =20
>>>>>> +#define FILE_AND_LINE .file __FILE__; .line __LINE__
>>>>>
>>>>> Seeing as this seems to get added to all macros below, I guess you di=
d
>>>>> consider (and discarded) introducing a preprocessor macro do to the
>>>>> asm macro definitons:
>>>>>
>>>>> #define DECLARE_MACRO(n, ...) \
>>>>> .macro n __VA_ARGS__ \
>>>>>     .file __FILE__; .line __LINE__
>>>>
>>>> No, I didn't even consider that. I view such as too obfuscating - ther=
e's
>>>> then e.g. no visual match with the .endm. Furthermore, as outlined in =
the
>>>> description, I don't think this wants applying uniformly. There are
>>>> macros which better don't have this added. Yet I also would prefer to =
not
>>>> end up with a mix of .macro and DECLARE_MACRO().
>>>
>>> I think it's a dummy question, but why would we want to add this to
>>> some macros?
>>>
>>> Isn't it better to always have the file and line reference where the
>>> macro gets used?
>>
>> Like said in the description, a macro simply invoking another macro,
>> or a macro simply wrapping a single insn, is likely better to have
>> its generated code associated with the original line number. Complex
>> macros, otoh, are imo often better to have line numbers associated
>> with actual macro contents. IOW to some degree I support the cited
>> workaround in binutils (which has been there for many years).
>=20
> Seems a bit ad-hoc policy, but it's you and Andrew that mostly deal
> with this stuff, so if you are fine with it.

What other rule of thumb would you suggest? I'd be happy to take
suggestions rather than force in something which looks to be not
entirely uncontroversial.

> Acked-by: roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks. Given the above, I guess I'll apply this only provisionally.

Jan


