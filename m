Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE826429F5D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 10:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206841.362503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maCnl-0006NT-8C; Tue, 12 Oct 2021 08:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206841.362503; Tue, 12 Oct 2021 08:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maCnl-0006LD-4R; Tue, 12 Oct 2021 08:06:21 +0000
Received: by outflank-mailman (input) for mailman id 206841;
 Tue, 12 Oct 2021 08:06:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maCnj-0006L5-Nm
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 08:06:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a864fbbb-e334-472f-be78-5b6289200caa;
 Tue, 12 Oct 2021 08:06:18 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-iUoBeIg7PcOu5RhIdwZHug-1; Tue, 12 Oct 2021 10:06:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3119.eurprd04.prod.outlook.com (2603:10a6:802:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 08:06:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 08:06:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0391.eurprd06.prod.outlook.com (2603:10a6:20b:461::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend
 Transport; Tue, 12 Oct 2021 08:06:13 +0000
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
X-Inumbo-ID: a864fbbb-e334-472f-be78-5b6289200caa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634025978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ekSHirgG27bQ0QufMpRD9KcZLOUJTkvIRdDFX8JC+/I=;
	b=cZjVkPAhJkCh4zrKpwYtCs4AsahY96m1QvF1BWX/5kojUX+rQrvPimlAVBXUJ0KKjNmjPW
	OPUS+qULRuI3dS22jlMdSCnF6nPZ4QHTwb53seSBReCbhG3HpLEXPPj1EtGlY3PEzqnQZD
	j5JuMpWmmnkAQX4y06A+dio83z49eac=
X-MC-Unique: iUoBeIg7PcOu5RhIdwZHug-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFLarFLhQXt+IKAHcdBnxPwN+s/9r9lUXquaOFCNQVg/CwHvG0GjkDX9Bal6Cz8kYJsGg2Eb74yGDKw9bUQJaYFqsRuj8mMhACp7DQ14N5xZcHgBielYQr4hXdDrgfQXCzUBcrV3meS5Dfq0SZBoHe+xXOE572kPbTMyNG7mgaXtI7hssRRzPsnbQk7j3g4iAz4+CzLdDfDlgg5XKPj2daLf3Q+Xvc7D54UM6ar0BJhKuq6uDuxTotQ29P+w7niPSOi602xGb2h0wVdQSOrrEewIIxMdoHktqk6IEvWThHCDLNxArheCe6eXfb9NANCUDp+xBPNcCkwBd792xbnt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekSHirgG27bQ0QufMpRD9KcZLOUJTkvIRdDFX8JC+/I=;
 b=M3QVcGZEhgZmGdmhMHaGCPDoaf8AjQF7JtO4cCQoaYGKz5rLRXr6yQubjMJqE9hVdnMAfUz7G5mXo3FbFDNg/j8ILrSNo5P4ZJ3v+FAOH3sv9LxtMY3KIfBpoFMOTwTLDQRBYCH83jYIvhfKFXsrh1ZXdP1GCIeLyrvMht3fMPWqza7C7O8TIMEvyTtql4wtJHtatw2q/W9+u4/1Bh+F6HnKysr8/bSzvQl0S+qGd5gZkb8WzJ5usPX/2HeSo5V4bn/ye01snyYGmhbA2JrvzCSyu6Mt+PR9u7XPRvFEC4GCOgEOSWRYFk8bNAc/vdTRX6hv40GWOtRJEP5U21TmyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 20/51] build: avoid re-executing the main Makefile
 by introducing build.mk
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-21-anthony.perard@citrix.com>
 <87036d63-b5d4-55bf-0bb3-9b981a147f15@suse.com> <YWRRFxlvmDMu8nRZ@perard>
 <b30bff47-226c-6f82-5f59-81d17b191ab4@suse.com> <YWRvRlh5MlX1eMz+@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d58430c-5c78-7379-7a02-7505342bff29@suse.com>
Date: Tue, 12 Oct 2021 10:06:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWRvRlh5MlX1eMz+@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0391.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bc43ef0-991d-4531-599d-08d98d572915
X-MS-TrafficTypeDiagnostic: VI1PR04MB3119:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3119717BF0948C22C8F7D1D6B3B69@VI1PR04MB3119.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P/zrGfOTwsCPiaeXRTc5X1pOgX8R7WrfFRudKsPd3q7CTJTY+o30Mc5QgWTAP1LOul7hhaye25DOE5pc32sk3drVpi8teBZ6O6o+KwH0gmmLnbbmKaALQs36r6d9wRDl2eLo/au/4vBp/3b1JT2IupvA79RaiO8T4JkG/qr6FJzcQ79m1dmYCh42AbG8YC0WXtDdJ5Fj3+BoCjFOaJ8I6imp+XPwQ7FjJbDjow5LXWqTJWzcDZ4Om03yo09sqe3DALi0trBfYy8xMmbS4bZ8huV2CEuk/5oLmlc/N0B1orlLu/H20ZsXEzmjpuVUYPuqLQ0rTPh9hG9NNeOLSfendU4ey8TDxjFsm1vpRc9QChaCRd1Tc7IaiVNfkPNxzHP4oJ+Xv+9TD1lX6wogc3oyh79tlgBP08BVS1rqvDcCGaIaVE+DVoIdI4XHjsl91KjvjyZPypgVfqT1xicADgOY7Ih9ea8J9YGBnklv+VIS7y/84+VOlLD0Tmlbg7ZpprwUrD5WfXGCuv0Vu+q7uiCtLlsP+dKgZQmTg0bvqWo6b4ywdrPXxBnW/Du7dYbGgHKkbZhV/GyKJYc8c5aWNO26lbDps9sAKuJ66p8NrUoRaSnYRsIeOrYdI2nGtn5BSK1UZQPh1AR/FovwogbFm332IKrsavDy+PduHej+tzDdTSpzQJv8TCEAxhmdQHBArE2Kli7atE4Bg8VvNir+u43iwXfj8lDwZZYfRyoxOVJgkD4jbr/qcsWhfQdNR9EY9ljM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(956004)(6916009)(2616005)(31696002)(2906002)(54906003)(5660300002)(83380400001)(38100700002)(31686004)(316002)(36756003)(8676002)(86362001)(26005)(6486002)(508600001)(66946007)(4326008)(66476007)(66556008)(186003)(8936002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUc4TVV0UlBKUHNzRGk1aXNHQU1GNythdFMvZkFpYmFYTWFnTHB0SVRvcDRD?=
 =?utf-8?B?VUxjYTQzYjIxK3A0bzh3eTBtemd4Sm5RRmlsOXdCVTNDc3pkUG1hUXJ1RDJZ?=
 =?utf-8?B?aTFiZHcxK2x4azNWczJTb0JxcnhLcEZuVVdKbVRBL2prcHZaNzVrdThrMENz?=
 =?utf-8?B?eFRsbzRXREhrZ2ZzV0lIVldxbWJ0MCttazhUenpKalBZNCswTmk3ZjBQbnpj?=
 =?utf-8?B?V3orVGlpSkY5QXlkbnVHbi9oOGVVNjJMSkpNT1BPY2dhZllaWGsvbVppZThC?=
 =?utf-8?B?Vjh2VnY4NThWSzhzdmVxcjdBR0dqRHhDTnFsUnJDODVkQnhZbGxubTZLbHZL?=
 =?utf-8?B?VkRxK1JZUUJ6TWtTbHZBenF0bEQ3M2FURHlVM214UENjWnhjZmtSRzNhTGxU?=
 =?utf-8?B?c1hkY3ZlOG00VmxaMFJaR0I0UEIyR3JLT2M4UWtSS1JIZ293N2JVWGtBRkU1?=
 =?utf-8?B?R1hzcUNReFc3d3NHbnh6eDYxOVJVam40TnY1SVFQY2RySUJGUkxFRG41Q2Ja?=
 =?utf-8?B?cjVRSVRwMFhaWGg5ZXkwNWRnK3NjTnFFK3BlMVptenhDeEtNNnRrdGwwS2Nr?=
 =?utf-8?B?RUVrUGFRbUpLN1duUkRXL2VkWnh5dndzbk5jZlJDcHZpdjdxRWNQTGZwUWlH?=
 =?utf-8?B?c0M3ZHpKbk1zd3BOaURVaTdRaHlURng2ODN0Vy9DU2lxbTVISDJtUDdVd1dI?=
 =?utf-8?B?TXUvWGsrdjFEZzRIaW5BTWt3cnczOTBNVjB4cVFwYnlzUk94VTRyVjdZMnIr?=
 =?utf-8?B?UDlpWUgxVUMyZXNHTExndWdJbnpWeVF6UnN3ZHRmU3pxYUlRQk45Qk9qK1pw?=
 =?utf-8?B?aEhrbEloa2VmdDdoK0Z4ZFhDUGEzWEdjejlwaW9qTWJndlVXaVIxcGJwTnc0?=
 =?utf-8?B?OHJ6MmZjZ0p3Tll5cmdvYW1tSXJBZHBKSjYvRktiUDJzMjArWG1yK1lMVi9p?=
 =?utf-8?B?L1ByckRvMklFUkplRmJuZHdjdklTdk4rNEtmZ2R1L1RBUlc5RXU3NlBZR2xG?=
 =?utf-8?B?aTUvd3pJSGJiSmhsTzZpQXBKcVV6ejJjeC9udDdGQXFtOFRkdlRFeFZIRm90?=
 =?utf-8?B?Ti80NzE0Skltdi96U2k5bjZZK1Z0VDM5U01MbHZIZldKV1ExSVUrdGFlMjVB?=
 =?utf-8?B?L01UVmNZeWNYcjJaTmVVSEJUdENlUWxqZkRabHhBTllsaTNLcXdmd1dWdEVw?=
 =?utf-8?B?Yit3R29hOUYvWFFJWkxoZkppZ2pZSjhnVmpMcSt4TG9mdng3Y0dRTGo0d3d3?=
 =?utf-8?B?MHVkaWVBQkVXYUlJeXcwa3llTm9ZQStldzFpSjEwQk50OFN0MzMrUndSUjBJ?=
 =?utf-8?B?TllLak1nb1I1bXRoWXFvYUcyZlp6bS85eEtOejhRODBlU2VHbE5IYkR0OVpD?=
 =?utf-8?B?M3hEcVRSK1gwZUtRUzhpWWZwR200T1hNS2hNb0oxZDVLZXRjRE0zOVFUZUdQ?=
 =?utf-8?B?T0dnREhjdW52TVBYb2pKWGxaMUlUNWhjRG9IMHE5Zk1iVis3S09xVHRWaEdZ?=
 =?utf-8?B?YnpqcHZVWno1Z2JiVUpBenA1ZEsvNVFTSnFsTS80YTdNZlE2VGtyL2dJeDNx?=
 =?utf-8?B?U1lQZUpTcFg2ZlVOYTlBcUE5a2FoOHhzanRyU2JZQTVpb1FlVmtrWmNIK0ti?=
 =?utf-8?B?alpzVnhtRC93VEIrZVdCeUNMRE5oRUE2bk5INFpXVWlsTDhOeThoVms1SlBJ?=
 =?utf-8?B?cFFkYzQ3WFlRa1A5ZElvbW45VXB6WTlsY2JGVmlJdzRML05qeUE0WUNQSUZs?=
 =?utf-8?Q?R77okmO4dREZG7Hh5lD96nYfODAx38w1p+bzwEv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc43ef0-991d-4531-599d-08d98d572915
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 08:06:14.6198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caSQc7vkxxH5lTC2M2ATGfcNxAFhzNYNkkGKmseTyHQDIrcDyd5e0yg01FQ6ILlu8bfROqJnnkpHvyOTuirDCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3119

On 11.10.2021 19:07, Anthony PERARD wrote:
> On Mon, Oct 11, 2021 at 05:31:08PM +0200, Jan Beulich wrote:
>> On 11.10.2021 16:58, Anthony PERARD wrote:
>>> On Mon, Oct 11, 2021 at 12:56:54PM +0200, Jan Beulich wrote:
>>>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>>>> With nearly everything needed to move to "build.mk" moved, there is a
>>>>> single dependency left from "Rules.mk": $(TARGET), which is moved to
>>>>> the main Makefile.
>>>>
>>>> I'm having trouble identifying what this describes. Searching for
>>>> $(TARGET) in the patch doesn't yield any obvious match. Thinking
>>>> about it, do you perhaps mean the setting of that variable? Is
>>>> moving that guaranteed to not leave the variable undefined? Or in
>>>> other words is there no scenario at all where xen/Makefile might
>>>> get bypassed? (Aiui building an individual .o, .i, or .s would
>>>> continue to be fine, but it feels like something along these lines
>>>> might get broken.)
>>>
>>> I mean that "xen/Rules.mk" will never "include" "xen/Makefile" after
>>> this patch, but the variable "TARGET" is only set in "xen/Rules.mk". But
>>> "xen/Makefile" still needs "TARGET" to be set so I moved the assignment
>>> of the variable from "xen/Rules.mk" into "xen/Makefile".
>>
>> Okay, thanks, this confirms the understanding I had developed; maybe
>> you try to reword this some. What your reply doesn't address is my
>> question, though.
> 
> Which question, there seems to be 3 of them :-). Is it about
> xen/Makefile been bypassed?

Yes, sorry for being imprecise.

> Building anything in xen/ requires to first execute xen/Makefile as this
> is where variables like CFLAGS or XEN_ROOT are defined, and this
> includes single builds or building an individual .o.

Okay, thanks for confirming.

Jan


