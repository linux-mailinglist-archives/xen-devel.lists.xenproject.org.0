Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423E64CF371
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 09:19:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285726.484978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR8Zt-0007lG-BM; Mon, 07 Mar 2022 08:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285726.484978; Mon, 07 Mar 2022 08:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR8Zt-0007iI-60; Mon, 07 Mar 2022 08:18:49 +0000
Received: by outflank-mailman (input) for mailman id 285726;
 Mon, 07 Mar 2022 08:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nR8Zr-0007i9-0U
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 08:18:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34c9efb0-9def-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 09:18:45 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-c3HhabaQM-GqYVIbARKbmQ-1; Mon, 07 Mar 2022 09:18:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0402MB2903.eurprd04.prod.outlook.com (2603:10a6:4:9b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Mon, 7 Mar
 2022 08:18:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 08:18:41 +0000
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
X-Inumbo-ID: 34c9efb0-9def-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646641124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=keUYAVxn0TixUeENyrqR/1xBGDV5Z81O92OLPbTk0AE=;
	b=kSw2T8BQz0gwyf5RTxw+tR2/yRtBPcR4ReUk8hOEjGcAi4crkRrihqg20TIrrVQzkZdddh
	D+2zIFXFdF5ZeVwiDIMd1tK1lL63PK1igMrZRDrFpeNLcoK0tQ+bAx9cT+gVwbZaighkY7
	TcpUgi5MCvyU/xbnHk2f32n+hj/tr64=
X-MC-Unique: c3HhabaQM-GqYVIbARKbmQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxaUAFFeJZkzkLlDhYfOa+CfiTZHC0/JS4ASnuoR7GQLQjzqqcRFEwBO8/SWYpB5cuVtGG33kZ0KRqo7zpQWzFHTDLHvEYwqzDjeGEtzGmdOo6AZx8xPeVNTybmG/CUcDD9xEKJZ/U2xCN5O3leQetmf4u+VrfgFZnE9aGqTRxqSdQRQs1n0Cmqwcm4VWcfh+cSRjNEC8hv5uoLV2lYUcyPvU+7y0fBVWRJZgSbdbOg8ca2JyuiVqr9jsP9Yk5rSowcxdhXATsMD8CJ2Uh1fiwUOEWK1x0sh2MS++mbpbklQEB9lUJ0y1whpJ07Lcwtvyfj7zfRilGavda+3rYR2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRm8j4M8EbRAtnLkRmhA7SnytvFW5kJrYtMNz4p1JrQ=;
 b=fz8qoFBSC9zNI7Zq2pRjKMepxF9byCcBXM9wle8ke4yb7hvRZZXD+amS1KmFUeuYdRRLn4Od3UHzjV9Uf69J/j9aB8pvw4tje8/13QBLflQfgGJzJfFsV1TEuThq33xUuKzXt2TisrOx5VkYSleZJs65eLsxpThUuxKjbuCh8W44jmas7+54OTsjcJxlSXfQsF0EzjUG/j+ayjMwIoZYK14b/8oSHlSaU2vsP5pM/BnfuSjlI5IB2lR1c/8XVnzIsEIuVp3Nq0mtreP3nNiTvT+UKdsCwI8wzXIRUZEjO+S533mqHFHPsUkuI30T7Fhy3BkxAaTaUPuvEomp2BwKLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2ebf82d3-3509-7224-6537-acdaad34dcf2@suse.com>
Date: Mon, 7 Mar 2022 09:18:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/build: use --orphan-handling linker option if
 available
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <5c374fd3-017d-3c40-4ded-25a3b1c978a6@suse.com>
 <YiCkUebvg0gaBm4/@Air-de-Roger>
 <3c335ca5-63e3-6389-cba5-b9047a4ce3b9@suse.com>
 <YiDaQY1ToO8G2QYd@Air-de-Roger>
 <abd691c8-9c7e-40d7-3f18-d96f826b8539@suse.com>
 <YiHZpmrYt+QvE7ex@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiHZpmrYt+QvE7ex@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0069.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6145edf1-012f-46e2-6ce3-08da00131694
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2903:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0402MB2903B26F33F666FC53BDEB79B3089@DB6PR0402MB2903.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rRLtjkpdJuTfO6OkvtJ65dKaGoKz6VLCj+7OPR/ZETYO9PdlkUy7bhbInVaoDVOGKsanuet1qW3kUQYnZmJSLPhgpDz4BKHLrI6j1d36O2HCt0sD/brYmui0BKnEf6uoQpabg1OMsIb1Rb/4+Hfwj1Wnk5M7zK02a2wzY7Vd9SkTHWcmwAhIuGLtuSC2GvYpSikyvzx/XBPtJ1jB0HRN1q9PGf7f4zDAJ0VXBbceX/CKcjcADXvmAqrhqlJ7Y6V7UEYCENMFFPHzzU2RnY6av4blHvb2HYow0lQiFIgn6KLwiRlp5pGGM/cNzG92QKQ8MvaP6dwVS2nNqTmHM2XaFpw9S+iUs2NkCbceUxeREBC6Z4cEu2VpNZhVC+B5bLmvRvn4foaYgR9geup8GhONTwej9OlbsTgNl3geOp0ZHb2Ym7l2p3arq4IWFBfqydZiK5eWvuSwUNU39r+nPtbF7e6M888NCWDodJXgwARTLBNFcRTUmHKXvl2+8+WX4g9SUpVmCM5hnT4XtEjfCcT8rkGMQ2Y+JUPlzQg8d+O9b4DpeQKcI5zNYX82eihlH5+whp0PBDHgGKWRL5O78N2h7Mb5dxnMEeev+5K5IFxwQcy20Wr9OIT8HuB4EVjYUm5b/y3p1SsdPj15Wrd1ZRCFntAIpNm6kEllvGWXjQHDAV+MjBGlvpDsRcBwo00q3KsN/MMFGJs0wha97AQlsGuzpcVkuS9VTwksbw8xT4e7FLvceibKVrG2TKi8Xo6x10YnJq1WPt3qBVlJQEFwH5PBjvAFDCkgOKiWRyGazviJ3aAlhp/hDS2I0aHATmiysKPxI4Ht2Wg6AK9y+F8O+UWSGeboMvi8x8U86FmZ++SbE4w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(2616005)(31696002)(186003)(8676002)(26005)(66476007)(66556008)(66946007)(8936002)(86362001)(4326008)(6512007)(83380400001)(5660300002)(36756003)(6506007)(31686004)(53546011)(54906003)(6916009)(316002)(38100700002)(966005)(6486002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NaxPoTODkLp45CDscoCtdr4qEmR/oALejTQK/2PRolPH32mwY/YjWyxQt/aY?=
 =?us-ascii?Q?jAigbnywOfTH7P8Q8KjZxX005nym2vGoGdxJ+Iebv/1iWWEW1t7vYqoVnHZz?=
 =?us-ascii?Q?h/b1r8YmcCexZZPRKKFt/bqqvL6jhbJYP0pe8CHlV75VWOVN+Uk29NxXuqP0?=
 =?us-ascii?Q?BqiZ8eBAj8D8+a2U5U3v2LotKb7mqbWJApl+fsB2FEo9XsUNVtrHpHSLLy7W?=
 =?us-ascii?Q?u1xyEWlbeEkQ6mAflNUnxUe1vRdfqbpmjNRmfGrpCywDiUOo+6UWT0atLPVE?=
 =?us-ascii?Q?pepXGNDvvGw68gRn81n1/LviK4ZNH7T2mV7a0BRetfyk8o/266HakyYrL5qJ?=
 =?us-ascii?Q?reBzS2G9SnSYmqYiFdDU+6HG5Vb3bPfyUECq+qdqfryAmhubAr39XLCT3fh3?=
 =?us-ascii?Q?eqfFnywbj4t7DoBHRJO2aot4ruBqmhVU3dhxL3I/YKMzdiiTEMgIOY5Ll3h8?=
 =?us-ascii?Q?NkzlhyrQl1aV/3pgRZJMXXnmioFkJ8KbpkUI34K3Xd0tvovxok3LKM97Bihk?=
 =?us-ascii?Q?Cv80M5mmRiXodMuhLsbFTxiJm16zzh3Vnscd80I0i2Iy2TdbeSXMIU3l9Z6m?=
 =?us-ascii?Q?O3d/8a65H7JQ8asAFFnt9s1JUjcGKeXoyiz0OBZVRn2S1OKTdpU7mbcRMkF5?=
 =?us-ascii?Q?muB+7reTcKr0C4B6ZmltpjRM5Qms5VRVl+cUXfQw+/YLSuXokSGnE3t0yNBs?=
 =?us-ascii?Q?N2W9+14zmJObkAZ6oRQVTLEja3fK/Cghddohd7JhCGk21HN4/xi72OhAi+T3?=
 =?us-ascii?Q?aRuXAF4nhU/zQsjvcSBKVvio7KZlLfpreUaEiPF+nCy/Vi8etNIQx0WE6jzu?=
 =?us-ascii?Q?seaSBq8G0iyEZN6Q8noS9UVcN5266plAztBUfcafSd8Z8dpJa9LVhMri/4yN?=
 =?us-ascii?Q?u1DiVcS2PnpXGZy+EY44M7gUGdQNxq1xV3qmnk3cy5gvcJ9ipjVhTgTySid/?=
 =?us-ascii?Q?VJXPmVXv3e80OkrptQFV+K3wtUC4sp4crx87E4TWAC28smlmm9W6+pLWF2oK?=
 =?us-ascii?Q?HUQKwKKed1IKIAF/hr5QVXyGvp3GyS9T39J+k7d2EbAs5+0BQMw6Vrt+2Czf?=
 =?us-ascii?Q?3Jr7F19CC4aE+N7hU9FqkaCHZxqTcljJVOfIg4R5UTxy8wai45t81H60dG2+?=
 =?us-ascii?Q?ZUnnH/urCP1rwLjTy+aWTux0OnxgihIwC/jbjsHHQlfzOUx49nA8FovhKp5s?=
 =?us-ascii?Q?VqgDFVLQtYU5K2v6bMO1am8dGnLOJqkifNbUESn30L/ldI753l8eWykCr7yW?=
 =?us-ascii?Q?eR+4+hQgmZJj8sCe40uXpBIcYqczrsNJyFaCCBu6We11L1rNoQ/6AfaYL6f8?=
 =?us-ascii?Q?JW4rKwzgWCdmjfPshLTiyGqR5KVzQNQ956UCOddycaXcyEHAANs0LZP2xuzo?=
 =?us-ascii?Q?saAR5wov/7ctbt5n7VzzoB3udXLDhOJBPhi+jlF+iqZ+fgeakbp4DdSQ07q4?=
 =?us-ascii?Q?CaRvUWgkmZeQ4bb/ByJno4ijxpyjZoBy3PCOjM6SVoJm8j25t4HWX3eu6TE2?=
 =?us-ascii?Q?AuynVAMwz3F7hXNskpLsqeBcJMeiqrCgfhSnSJisD35/16h5bPrUxIL105/3?=
 =?us-ascii?Q?NW2WLntZtif4ohbBneO82KTrewWwtczTwM976Ecs/wjyJl0yGLsL6D6hm8r3?=
 =?us-ascii?Q?f221fikydE+4KqEC5tUDM1c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6145edf1-012f-46e2-6ce3-08da00131694
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 08:18:41.1425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hB4CXgK3f0nZ8VTjRLK6r4nDDC8YtPsPg48bLMcCZmTQRztNme1igrUXPgI/drYeHwSRPvLOCfaLcrrfiC6VYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2903

On 04.03.2022 10:19, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 04, 2022 at 09:02:08AM +0100, Jan Beulich wrote:
>> On 03.03.2022 16:09, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Mar 03, 2022 at 01:17:03PM +0100, Jan Beulich wrote:
>>>> On 03.03.2022 12:19, Roger Pau Monn=C3=A9 wrote:
>>>>> On Wed, Mar 02, 2022 at 03:19:35PM +0100, Jan Beulich wrote:
>>>>>> As was e.g. making necessary 4b7fd8153ddf ("x86: fold sections in fi=
nal
>>>>>> binaries"), arbitrary sections appearing without our linker script
>>>>>> placing them explicitly can be a problem. Have the linker make us aw=
are
>>>>>> of such sections, so we would know that the script needs adjusting.
>>>>>>
>>>>>> To deal with the resulting warnings:
>>>>>> - Retain .note.* explicitly for ELF, and discard all of them (except=
 the
>>>>>>   earlier consumed .note.gnu.build-id) for PE/COFF.
>>>>>> - Have explicit statements for .got, .plt, and alike and add asserti=
ons
>>>>>>   that they're empty. No output sections will be created for these a=
s
>>>>>>   long as they remain empty (or else the assertions would cause earl=
y
>>>>>>   failure anyway).
>>>>>> - Collect all .rela.* into a single section, with again an assertion
>>>>>>   added for the resulting section to be empty.
>>>>>> - Extend the enumerating of .debug_* to ELF. Note that for Clang add=
ing
>>>>>>   of .debug_macinfo is necessary. Amend this by its Dwarf5 counterpa=
rt,
>>>>>>   .debug_macro, then as well (albeit more may need adding for full
>>>>>>   coverage).
>>>>>>
>>>>>> Suggested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>> ---
>>>>>> I would have wanted to make this generic (by putting it in
>>>>>> xen/Makefile), but the option cannot be added to LDFLAGS, or else
>>>>>> there'll be a flood of warnings with $(LD) -r. (Besides, adding to
>>>>>> LDFLAGS would mean use of the option on every linker pass rather tha=
n
>>>>>> just the last one.)
>>>>>>
>>>>>> Retaining of .note in xen-syms is under question. Plus if we want to
>>>>>> retain all notes, the question is whether they wouldn't better go in=
to
>>>>>> .init.rodata. But .note.gnu.build-id shouldn't move there, and when
>>>>>> notes are discontiguous all intermediate space will also be assigned=
 to
>>>>>> the NOTE segment, thus making the contents useless for tools going j=
ust
>>>>>> by program headers.
>>>>>>
>>>>>> Newer Clang may require yet more .debug_* to be added. I've only pla=
yed
>>>>>> with versions 5 and 7 so far.
>>>>>>
>>>>>> Unless we would finally drop all mentioning of Stabs sections, we ma=
y
>>>>>> want to extend to there what is done for Dwarf here (allowing the EF=
I
>>>>>> conditional around the section to also go away).
>>>>>>
>>>>>> See also https://sourceware.org/pipermail/binutils/2022-March/119922=
.html.
>>>>>
>>>>> LLD 13.0.0 also warns about:
>>>>>
>>>>> ld: warning: <internal>:(.symtab) is being placed in '.symtab'
>>>>> ld: warning: <internal>:(.shstrtab) is being placed in '.shstrtab'
>>>>> ld: warning: <internal>:(.strtab) is being placed in '.strtab'
>>>>>
>>>>> So seeing your mail where you mention GNU ld not needing those, I
>>>>> think we would need to add them anyway for LLVM ld.
>>>>
>>>> Hmm, that's ugly. How do I recognize LLVM ld? I can't simply use a
>>>> pre-processor conditional keying off of __clang__, as that used as the
>>>> compiler doesn't mean their ld is also in use (typically the case on
>>>> Linux).
>>>
>>> Hard to tell, `ld -v` for LLD will typically contain '^LLD' I think,
>>> but I don't really like matching on human readable output like this.
>>
>> Same here. But Linux'es ld-version.sh looks to be doing just that.
>=20
> OK, so be it then. We can always improve afterwards, as I don't really
> have any better suggestion ATM.
>=20
>>>> I also don't want to add these uniformly, for now knowing what
>>>> side effects their mentioning might have with GNU ld.
>>>
>>> Wouldn't it be fine to just place them at the end, just like it's
>>> done by default by ld?
>>>
>>> Are you worried about not getting the proper type if mentioned in the
>>> linker script?
>>
>> I'm worried of about any kind of anomaly that could be caused by
>> mentioning sections which a linker doesn't expect to be named in
>> a script. That's hardly something they would even test their
>> linkers against.
>=20
> I've raised a bug with LLD:
>=20
> https://github.com/llvm/llvm-project/issues/54194
>=20
> To see whether this behavior is intended.
>=20
>>>>>> --- a/xen/arch/x86/Makefile
>>>>>> +++ b/xen/arch/x86/Makefile
>>>>>> @@ -120,6 +120,8 @@ syms-warn-dup-y :=3D --warn-dup
>>>>>>  syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=3D
>>>>>>  syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) :=3D --error-dup
>>>>>> =20
>>>>>> +orphan-handling-$(call ld-option,--orphan-handling=3Dwarn) +=3D --o=
rphan-handling=3Dwarn
>>>>>
>>>>> Might be better to place in xen/Kconfig with the CC checks?
>>>>
>>>> Well. I've tried to stay away from complaining if people introduce
>>>> new tool chain capability checks in Kconfig. But I'm not going to
>>>> add any myself (unless things would become really inconsistent) up
>>>> and until we have actually properly discussed the upsides and
>>>> downsides of either model. Doing this via email (see the "Kconfig
>>>> vs tool chain capabilities" thread started in August 2020) has
>>>> proven to not lead anywhere. I'm really hoping that we can finally
>>>> sort this in Bukarest.
>>>>
>>>>> I'm also wondering whether we could add the flag here into XEN_LDFLAG=
S
>>>>> and EFI_LDFLAGS, as those options are only used together with the
>>>>> linker script in the targets on the Makefile.
>>>>
>>>> Not for XEN_LDFLAGS at least, and undesirable for EFI_LDFLAGS. See
>>>> the respective post-commit message remark.
>>>
>>> But the calls to LD in order to generate $(TARGET)-syms do not use -r,
>>> and are all using the linker script, so it should be fine to use
>>> --orphan-handling=3Dwarn there?
>>
>> But XEN_LDFLAGS is also used elsewhere together with -r. (Whether
>> that's actually correct is a different question.)
>>
>>> Could we do something like:
>>>
>>> $(TARGET)-syms: XEN_LDFLAGS +=3D ...
>>>
>>> And similar for $(TARGET).efi?
>>
>> Yes, this ought to be possible, but would again lead to the option
>> being passed on all three linking stages instead of just the final
>> one. When there are many warnings (e.g. because of the same kind of
>> section appearing many times), it's not helpful to see the flood
>> three times (or likely even six times, once for xen-syms and once
>> for xen.efi).
>=20
> OK, I think our build system is already quite chatty, so wouldn't
> really care about seeing repeated messages there. We can find a way to
> generalize passing options to the final linker step if/when we need to
> add more.
>=20
> I'm fine with doing the LLD fixup as a separate patch, so:
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks. However, something is wrong here. Unlike in my local builds, the
pre-push build test I did after committing this triggered a massive amount
(tens of thousands) of objdump warnings:

CU at offset ... contains corrupt or unsupported version number: 0
Invalid pointer size (0) in compunit header, using 4 instead

Helpfully it doesn't say whether that's xen-syms, xen-efi, or both. I'll
have to investigate and fix; I can only guess at this point that this
might be triggered by a difference in .config, or be hidden by some
other change I have in my local tree.

Jan


