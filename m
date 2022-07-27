Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F1F581FFF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 08:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375902.608374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGaOf-0007qL-S0; Wed, 27 Jul 2022 06:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375902.608374; Wed, 27 Jul 2022 06:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGaOf-0007mr-P6; Wed, 27 Jul 2022 06:19:53 +0000
Received: by outflank-mailman (input) for mailman id 375902;
 Wed, 27 Jul 2022 06:19:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGaOd-0007mj-D5
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 06:19:51 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140084.outbound.protection.outlook.com [40.107.14.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e63763b-0d74-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 08:19:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6314.eurprd04.prod.outlook.com (2603:10a6:10:c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 27 Jul
 2022 06:19:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 06:19:45 +0000
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
X-Inumbo-ID: 1e63763b-0d74-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzc2ua35zDz76mr9gG6Q7Ac/6joC0x3KFw1DCoqEeBsd6HkKEeZSFKmGmjQYbI1JmxtZNDzU+9ZjWnyU7IuAIRUDiWGeYfcxkUrHOr5r1Qv1IqDDKJRdoNhT2BdvV9r5MzJkJl34NjHlvW9W+5qfrfm0JbMIp/h5JGZEeYoYY1wYq0eVJG0x4hzYfi+5XOqwJZoVwECMNwgoYaa4uoCcXbJOjcWSjBH/uXJOPSna99WnUSEKtfeJEoQbLiQvDC7zUxNOU2FhTovIU8tBcZXB0PNNPMUMX3yncBCVAp2WlZlKXOEN7CUOf7IHtz9FMxeFSb0w9eXFv8B93hF1y+TVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfFdOSv5zxRvwJrqNP27myQOEUmuP3OpZqLriS7N3VI=;
 b=kvwFTP8m8XNPbkGe0riOFTXQMqBSIh5gU0upsOUnhJohU4dl4hZSwSJlpRNAxz3ZJpwwAm+7gpR+uqIw+UzWYBD+xJpzI4q5FLCA4wtEVpzXHjFbrffmqR+uyrlECHq8ODC1IxDdu9jrSrtmpIl3v5x4798hOkwjHSua4UvwstJpSzmcV+QF1zAR8SSrFEwtpYiy6SJaiZsvN3WlcJCjOHJuIEzZSduZWGt2aCYgnnStxuvfDJ3KWyqGKRjNjdwo0eZodYRqlDlHjoZ774FwelWyjrT6qCdBCZxCLHcRmRbTtfaizLklGS/0Oa+ADjE0fTUXK/dQza0vaHf/TwThzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfFdOSv5zxRvwJrqNP27myQOEUmuP3OpZqLriS7N3VI=;
 b=4fQTOW7d1L8eUTs6hUjFv0VLs/ctsYS1Cbc8L9uDjUHb31gHbPQrcBt0GI1Gmh1h8OGEQ2E6b6mrUrb0QGnt/IDOfwruHambvntIzOiqLR+cQm9RmUF8cbJdzh7GjyfHc5xlZEzCLGPz+iVKscJZiisWev2ThMdLZPiUcUz1KEgHmTe/38boXy/1WDhjLv/u0BD7icC/S4Y/P1HbJnntBGXm92cBom1k6IhKFUEMYBweWkkICXS0OqBOAc7JqNE0Cxg6x97S9GeEjOBa5DdPCcYGAePd4DstYf/vi05hMrSlLnahApOMq+BWxGC5/2axQQKYM55KxfVR5fzR19AXTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c810532-8d2f-58ce-ca6b-a9f70ea083ca@suse.com>
Date: Wed, 27 Jul 2022 08:19:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86: make "dom0_nodes=" work with credit2
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>
Cc: "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "ohering@suse.de" <ohering@suse.de>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
 <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
 <b41009b4-fea4-826f-f36f-7dd9f4edd1bb@suse.com>
 <30ac2ce8cca7217775eaa704aab45a62deb1272e.camel@suse.com>
 <e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com>
 <35599105-b441-96cf-7537-ccf9dfac0934@suse.com>
 <fd07c28fad352a476544258f2ac4d652062b2701.camel@suse.com>
 <85c55676-b21f-1eb4-0471-19ca9b6de39f@suse.com>
 <a8ce120ee64165ac7b08de90e6786bb871541af3.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a8ce120ee64165ac7b08de90e6786bb871541af3.camel@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57e6ed81-0ec0-41d4-ca00-08da6f980034
X-MS-TrafficTypeDiagnostic: DBBPR04MB6314:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s9HvUZaP4l/qtedRLzT3aDJRLdU0x4l0kJyLp8wQwwow+ZlTwDMCQMXpDmytMz4JPRDSxZkRkypKmFFqDbCmF3rtTnDE6P8/3ALqRzmn5P46gB7PCRnMI8YUGoBC0hsCH5q3c40mVp0juCe3HLxOjN57bQq+h7nXOHMYQ/Dxo9HglARWgAEP2lniwhVxSqXnNcoMi1qdH4nq7MofsEwLtWlprDfrj+plbUdkrKFhleo4R5RCi2deYSEZOvpTH3DDemkDIxSnlFa7/QPIQjtxPjNKJ+jKjsUGHDo4UH7elQA8VJPPNblLXmP1SxA/bU7RsJ7XoyYnWaUO1rz2UFFkmlHId2ZeUoSHdAB2v4EIfvOGcix7GX/NYPR7D+6IDwQx+PAo84XglI5C64EWOoUORk+WIWQmyOcD7Gz+HEb92x5F0zFUWyzazpGj4s8EfVZEHzeS4gyF+taX5L6+EyJ+jF6HJN8IcEZdeSL1V1xPwT8C9LdGLbQQig34it6LXPf/OBuELjrTDCrZPWsC5Q5+mmCyKkGXX0be9SK2LGJZRSn+VSIrW/mtXPwGNxfbEGUXVacv2N7EYQfNih1V5jRnniam7I9dSWZ9+vu7Bd9rUcOrKVnw8cXoLfPPrX92GARxmHi7Gc7NdIelNS6gSHi92S7OGpTFvlBLF5XpWjeSZnjeVX4EXMsYfWwGVSB/qS1pmRqct68NIZz8V8/2DxAR499CNOdrev3sqSF+4J+sVoEEPAGy13UCCMAYp1Ba6+wewPBQjT8CLwkkzy9v+jJ+g+QI0DOcywNr8NpV4wgGHubi037vMWmMLama2MgzxxtSrMyLOYMj6tGgm0VeNS5YAnWrC62YTsfr/lZisT9evugOUse6GzexxqL1Wbknqlqi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(346002)(396003)(39860400002)(366004)(6862004)(38100700002)(86362001)(31696002)(8936002)(5660300002)(478600001)(316002)(6486002)(83380400001)(66476007)(54906003)(4326008)(37006003)(6636002)(66556008)(66946007)(2616005)(6512007)(186003)(31686004)(41300700001)(8676002)(2906002)(26005)(36756003)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUI5UjUvZy9zczR1TlU4b0hqdWRCRUY2bkF5ME5TK2hpNWdmT1o5T3UwR2xJ?=
 =?utf-8?B?Vkg4OXg5bXFDd20xT09VUDlIZ0ZQYVN4a1BTR1BhMTdTOXhzUUFuZjA2UzFq?=
 =?utf-8?B?cFE4RVBsTURHVGdRZHNQTFFwL2V0eWl0ZHNkMlJMZ2NWTWZINXVDallZWE16?=
 =?utf-8?B?L3ZybHM1MjZ6Z3R5SU9CcVFyS0Z3N3pGSWVTWjQxZFhvNzF1R2xCaHlYSEV6?=
 =?utf-8?B?WWVhWk04T1hodysycnBxblQxYlBEMDVJRS93LytHMXVMSWVjaEpNMzIwSm1n?=
 =?utf-8?B?dnZsMkdyQWlaRnUwRGRSU0xQcXd2ZGhjUCtkQVIxWkRoSXc4YXZmYzRjQ3k3?=
 =?utf-8?B?aEJUZWhUTkNuamhKakhWUDA1YVp4UUdDV2xNL0Y4Y01MOUNHOGJXbzNxeFp4?=
 =?utf-8?B?eHJKaVBISVB2VGtzTW9abW1tMU8xNjY3WFYzaXpEUVhKOW9nYWJHM2JDMHBF?=
 =?utf-8?B?N1I1d0pUMzVYMjIvVDg3ODQvM1hsNnh5ekd0c2RLSW5JNmg3RkwyTHVsYUxt?=
 =?utf-8?B?RG92VFVWOTU5YmVtVGJFTjJqRU5BV3NIZ1p0TUFYbG9CM3R4U094TUp4Z25N?=
 =?utf-8?B?M2g4R0VSK3hvaExLeUNZbkhIUUl3QXlaZG5aUmhmaFJCVEptRjNBYk93L3Bt?=
 =?utf-8?B?R2pMbEpHUS9lQUxqWWdFMFMvV1NWUFM0YkI0b1ZqbVNPUTkybWVwT1pFamJB?=
 =?utf-8?B?azNDaFdpeGt2ZzZlYStBcUxmOE54bWlGSTBHaXpRUFpQbnE1Ulh1a2c0WkNB?=
 =?utf-8?B?S2YyVjdnT01rTjRZaWhQM04vQlo2OS85R2dNVVZLbmVDWndzS2I5aElJZk9E?=
 =?utf-8?B?VTdWVXE1dGdsU1FNWGllWEo3YzBZYkFnVFE4NHB5ZERGYU01azJ3MTBZOU9F?=
 =?utf-8?B?T3NjOXY5R0RaTXVRQTJEbHp2RE1SejhPMjhCQzZJbHNRL0k5QWM4MTYzRGNz?=
 =?utf-8?B?K1lBcStkMDRNWHFuRy8zQVk4UkxJeTgrUzBpeWJBSDRWTkhaN1p1aTF1SjJ3?=
 =?utf-8?B?SUxmRXlsWENaZmFDN0FCZUxjWVo0enJFcnNlOFQ5ZHBQZWc1RElEekVKQ2ln?=
 =?utf-8?B?T3Vaa2ViM1lXM3pvS2VlQVpubExjUHNEOWszdEsySjBCUUFhZHU5NkJWQnpY?=
 =?utf-8?B?NC9NYzN5RUxGWGEvZWFzK2F0MHV6eDhiUnArNTZwZ2w0VCtaaG9HTEE0eEk5?=
 =?utf-8?B?akVkZzl0SlBoSFdNc2JJVFpQWllxTG5xRTJSd2EwR2xLSVpSamxuNG11SXJq?=
 =?utf-8?B?c05QcVF3VU0wNElla2E3SzI5VWt0cjNidFdrbTcrVHdGeFl2bVkyY0xSUzBJ?=
 =?utf-8?B?bmo4a0pheTFxTlpIb01rcU16eFNEa29RdGp5elRsS3JCdUFmeE9oYlM5N2Zq?=
 =?utf-8?B?bjVGTGgzS0hFcTVsa0FOSU4xTnJCd1BwdkJhWFhlSTZGSkNlbC85YW5Zb0F0?=
 =?utf-8?B?VU50QjAvVFJPL1o2N04xSTYyNzF4cUpZT2oreCtqT0lkeHlwbXBHYnlERU93?=
 =?utf-8?B?OTJuL2R6SnExNC9OazVRSllUMTZHSVk3b0Q0bU53RnNETTVLN3RIZXoxOTRC?=
 =?utf-8?B?Zy81Yk9MKytLdUVlTUNyT090aWNWejVkT1J0OUtuZWNaT29MZ0JlcEhnRjl1?=
 =?utf-8?B?Q0czN0g4dEhSd2NIa2hubHJSVkpkcTN1bHUyemY4RzAwSmhHQjZRdFgvNGlJ?=
 =?utf-8?B?ZWR6QUpIR0RJaU0xdDl2STNTRHFpTW0yZmRNWVJGS0ZzdkJKaEVFZ2FJQndY?=
 =?utf-8?B?Kzk5b2NMdmlXZ0JpVlk5b01Oc3VaVTZlRDZkRTZNbDhoK2ZLdmtyc2tqL1dX?=
 =?utf-8?B?U3d3bVYxUVVwaEZDU0h5Y2drTEY3VFMrZWdkWnJieXc4c3ZWRVF5T1ZFSm0r?=
 =?utf-8?B?bk8yUTBkMis2L21xcWFmNnAvcitya2lKWk1OY2dKWmMzSnZZeFR0OW1yU2lO?=
 =?utf-8?B?YUZrUXAwb3NmUmlOVVBBVHp4c0hCaEZXazA1VlhJTk9qS2RvOVhHeVo2aUVk?=
 =?utf-8?B?SUc1SXo0VDRxVURCYTN4bENCVnBtWGlGN0lLWldRSkFORUVjQ2lMUWxhZ0Uw?=
 =?utf-8?B?UnRZcENXSnY5aTc3aWtyUjN1ckJEN2xUdzNCNnJZbldpMVhiYk1vYXQvaFIx?=
 =?utf-8?Q?f13zo10YY5Vsri2+jGgJtWP4H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e6ed81-0ec0-41d4-ca00-08da6f980034
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 06:19:45.8330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4E+is1ENrNboS1sZXf2QjqPzjqZyDeBA5mUV1bzMApmePh5a/7aSxiJTC8Q5vNh5KvH9Tzt1MqaUmjl+BwK/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6314

On 29.04.2022 16:09, Dario Faggioli wrote:
> On Fri, 2022-04-29 at 14:16 +0200, Jan Beulich wrote:
>> On 29.04.2022 12:52, Dario Faggioli wrote:
>>>> Is that mainly
>>>> to have a way to record preferences even when all preferred CPUs
>>>> are
>>>> offline, to be able to go back to the preferences once CPUs come
>>>> back
>>>> online?
>>>>
>>> That's another example/use case, yes. We want to record the user's
>>> preference, whatever the status of the system (and of other aspects
>>> of
>>> the configuration) is.
>>>
>>> But I'm not really sure I've answered... Have I?
>>
>> You did. 
>>
> Ok, great! :-)
> 
>>>
>>> If dom0_nodes is in "strict" mode,
>>> we want to control hard affinity only. So we set soft to the
>>> default,
>>> which is "all". During operations, since hard is a subset of "all",
>>> soft-affinity will be just ignored.
>>
>> Right - until such point that all (original) Dom0 CPUs have gone
>> offline. Hence my 2nd question.
>>
>>> So I'm using "all" because soft-affinity is just "all", unless
>>> someone
>>> sets it differently.
>>
>> How would "someone set it differently"? Aiui you can't control both
>> affinities at the same time.
>>
> Yeah, the argument here is basically the one that I put below, and that
> you say you understand. I guess I could have put it a bit more upfront,
> sorry about that. :-)
> 
>>>>
>>>> Hmm, you leave this alone. Wouldn't it be better to further
>>>> generalize
>>>> things, in case domain affinity was set already? I was referring
>>>> to
>>>> the mask calculated by sched_select_initial_cpu() also in this
>>>> regard.
>>>> And when I did suggest to re-use the result, I did mean this
>>>> literally.
>>>>
>>> Technically, I think we can do that. Although, it's probably
>>> cumbersome
>>> to do, without adding at least one cpumask on the stack, or
>>> reshuffle
>>> the locking between sched_select_initial_cpu() and
>>> sched_init_vcpu(),
>>> in a way that I (personally) don't find particularly pretty.
>>
>> Locking? sched_select_initial_cpu() calculates into a per-CPU
>> variable,
>> which I sincerely hope cannot be corrupted by another CPU.
>>
> No, not by another CPU, hopefully.
> 
> And this is probably fine, during boot, when there should be no (other)
> scheduling activity. However, during normal operation, a vCPU being
> scheduled on CPU X, or in general having X in v->processor, could be
> using the scratch cpumask of X already. So, if we use it without
> locking, we'd risk using the wrong mask.
> 
> Therefore, we require the scheduler lock to be held, for playing with
> the scratch cpumasks:
> 
> /*
>  * Scratch space, for avoiding having too many cpumask_t on the stack.
>  * Within each scheduler, when using the scratch mask of one pCPU:
>  * - the pCPU must belong to the scheduler,
>  * - the caller must own the per-pCPU scheduler lock (a.k.a. runqueue
>  *   lock).
>  */
> DECLARE_PER_CPU(cpumask_t, cpumask_scratch);
> #define cpumask_scratch        (&this_cpu(cpumask_scratch))
> #define cpumask_scratch_cpu(c) (&per_cpu(cpumask_scratch, c))
> 
> And sched_init_vcpu() (and hence sched_select_initial_cpu()) can be
> called during normal operation.
> 
> In fact, sched_select_initial_cpu() does pcpu_schedule_lock_irqsave()
> before starting using it.
> 
>>
>>> And again, soft and hard affinity should be set to what the user
>>> wants
>>> and asks for. And if, for instance, he/she passes
>>> dom0_nodes="1,strict", soft-affinity should just be all. If, e.g.,
>>> we
>>> set both hard and soft affinity to the CPUs of node 1, and if later
>>> hard affinity is manually changed to "all", soft affinity will
>>> remain
>>> to node 1, even if it was never asked for it to be that way, and
>>> the
>>> user will need to change that explicitly as well. (Of course, it's
>>> not
>>> particularly clever to boot with dom0_nodes="1,strict" and then
>>> change
>>> dom0's vCPUs' hard affinity to node 0... but the user is free to do
>>> that.)
>>
>> I can certainly accept this as justification for using "all" further
>> up.
>>
> Good then.

I notice this issue is still open. May I ask what the plans are here?

Jan

