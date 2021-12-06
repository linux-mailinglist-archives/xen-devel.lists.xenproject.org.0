Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5729B4695AA
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 13:28:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238838.413910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muD61-0005ri-KD; Mon, 06 Dec 2021 12:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238838.413910; Mon, 06 Dec 2021 12:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muD61-0005pc-H6; Mon, 06 Dec 2021 12:27:53 +0000
Received: by outflank-mailman (input) for mailman id 238838;
 Mon, 06 Dec 2021 12:27:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muD60-0005pU-1i
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 12:27:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed5e31d9-568f-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 13:27:50 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2057.outbound.protection.outlook.com [104.47.10.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-glmvmHS7PY2dKppgkBvBYA-2; Mon, 06 Dec 2021 13:27:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 12:27:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 12:27:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0402CA0021.eurprd04.prod.outlook.com (2603:10a6:203:90::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Mon, 6 Dec 2021 12:27:46 +0000
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
X-Inumbo-ID: ed5e31d9-568f-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638793670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsTyoy4yZVHRzzrvmZ5OyK1yJBPZbg00HhNofeXOFyc=;
	b=Luy+R5N272hX5fUuhD5Pqv6IGCGv6CRQMYZiNsT7pObOWydPtERJCzNf2ERqKB7RuEaA6g
	7JB7iRRZTuRGBOW7QWN9FbVgDJqlsUjQ54jiu9uwkBYzNZHqeeq+85c4w8VwutZRbCuozj
	gmsOlK7XuY93kuUn1TRsRpHQLmK0kJ4=
X-MC-Unique: glmvmHS7PY2dKppgkBvBYA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxIhRzQ68umEirBQqvEZBVb2TGNPWbasH7CQ3OI859J8UtwHg8bxPZ9qccwjddg2YGZYrU1b/knJvBSeeLBkofhbELIb04y4q8XHVjJhvEM/RYFLbGh93oq6S+nulXbr428dexsiWZi9tpuIi0/pXkf7Icsjs68TBREt7hdvnzwumA3vOIVWAt6rafrqytaIGbZTKeANRYETacde8iycZ6D6936z8+Xip43wd5gbYqyDb2ZWl6Ny9e3tYPwRMLRUUvOyhDtqsMr15pV4Go3wPfFfuQk91/4T3vWHLmWC5s1RwDmrQF7rN8Z3cYRNzZVXb9y2J/hhIGE+98mvsy1DLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4hU1cqEC3U1hgiryBGOPyCMWJsqTZwA50OnsF9uySw=;
 b=dBnft2/pVRA8DBOm1f8zB5cd+xpCM9Td6Lk197fhN+T9/cZoyI/PCLybGL22C1fOuti8bSaUlIY9jbhG8bSGYJKM2rfrqPm7xRkW+Ubf8D5ngh16blxJjJ+stlLgxQMjk1qdxqAL/NRH1YOoC62fyS3w7So05bPkbwFGSgGjEoTUsiqXhDWL5v8VgHvyHT1XMOy25emAakWSstTYSaLEG3PTxf4hw5hcuX2vC0ji4ttKLjbGgVPVxh3G7fdfxmagqDCj44hDTlrU1PtL6ikok1+KxoR/vpyHibIz6xxkKmRfxUAGBCjP2xmaQnRx9shwFgTixz40HjFizGpL3nCqjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe01dfb7-d762-3960-1d02-738a88e6e626@suse.com>
Date: Mon, 6 Dec 2021 13:27:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 62/65] x86/entry: Make IDT entrypoints CET-IBT compatible
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-63-andrew.cooper3@citrix.com>
 <a64a40ef-82f7-2264-5656-aaa5c94384f1@suse.com>
 <a96abdb7-cdf7-2b24-d293-d3d2c6c77c78@srcf.net>
 <22317ebe-4e21-5515-9061-33b21eefd4ae@suse.com>
 <21f914a0-3d20-6ce2-cc4a-b3bfe26284fa@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <21f914a0-3d20-6ce2-cc4a-b3bfe26284fa@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0402CA0021.eurprd04.prod.outlook.com
 (2603:10a6:203:90::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 964b9c00-43f2-49cd-8e39-08d9b8b3cf70
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384A07D0CC00D0C0F811848B36D9@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GL5CimTKfW+vZFC+PeOvWFHv/tulMYLpRTbxf3GYdoFR3QfK1osqwVyZ2DXHxqhqOh/M0iZs0ceKYoJEycqqrohiS3eUe2HdbV8RGCUbjTXbu8X5YMMyA27sPjjP0nSkymiXvN6nc09UKMpVta56EKVK2ibut3n9CN2SLKoWABvQYBGt1o4EAUO9U9Remu5mbneSgNER4aYwX/5B0saecIKPhz4su9zvXOltkao9vVjvaVlKvsS7KRrZCm/OA5O2Ac0MqfFkfaJKiBL/9arEqZj2S4VWy2bZXyyvZoKzVEdoHxtAV86HDUL/kJ1yNdP51CBdGNglGkQ1Lv5F4cJlmMgT0dWlSakDBFm2PosXZEeySdoB9hXjgHoGrTicVA78ZYyad32eWY4Y23g19rO4iSv85YKb759U2cG9ybFmnd9rP0mXcgwZOa2ogN9xFy3qeeR5TPFqRM2QCRPx2mY/s+uLHCfXWlIGhwhyS+1TSvqysEf4s5uM7TMV3QPxFc2vFPQ6//AqNIg5STIhodFa0U3YEMAlRspFRfqsMn+2g0VkH62d8lDhhVS/akJQZAt3C+mn2b6lJvIhoSpeGhThGISb9ZjZ51iw2xyQa8JVo8lLMrXkT/Q6PTlvKMioCAv24ABIjfT6Ea8NYD9G5kziP6SNiGAplqZ7yCpMCwEzkwE3olLyXB8OPOVmYYsIqRg+vaIKX3+Rjz/FhXW2T7rLAH5pzpNTuDHGABnPGqT3UO8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(4326008)(26005)(6486002)(16576012)(508600001)(54906003)(8676002)(83380400001)(53546011)(31686004)(956004)(38100700002)(31696002)(110136005)(2906002)(2616005)(66946007)(186003)(86362001)(66476007)(66556008)(36756003)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ji4ZQF8RZDI9Lr6soJb03MYOcGKzifJmSfov8dj1Rl53NK66JRl9e9rYeaIO?=
 =?us-ascii?Q?u/lxUETWlS1ecYuSKZYbXSwj2nNpgdvTwoTGR1Ra6zYt0rTMJLX5IUGG4Ryo?=
 =?us-ascii?Q?TBKrempoYoMF+Ur+QLhPEp6sz8/WxiSbzzFQNXVyRRoOJJ7Gygfjy1P0TaEL?=
 =?us-ascii?Q?jd/KzrINLNULLQEnTr4SfKFYMD0FXJ3FEo7UISg8pqVM7Gx+fuvInB3hLnbS?=
 =?us-ascii?Q?KhO4Y5IOdQbhJOxxJPZ4b3+vijsBw2pp66mw250qXMmtOSXIYzXzdxwLzgl4?=
 =?us-ascii?Q?YfCX3U7CSp+KC3RqFAMLneoVE163XvMLPasLvv645zsUKEHKj81DtKu/LRrp?=
 =?us-ascii?Q?TfB2cwpxJsYHeOPbgHU3+95qy9DZAqRbm4EOn5LvGUlAjmrHBO50KOmhJlTE?=
 =?us-ascii?Q?YY2NW36oZ+QJUVHETomqKLPTIuXBdKv34iSCvwMqcgdWCw9ZoYgfou37z4no?=
 =?us-ascii?Q?zaUaEioOX7SSf1xAu18RYuXDvsTp/wUKcrn/VioS9CSNNG1oYnkA/kmdvAAs?=
 =?us-ascii?Q?tZLv8fFSlDP2fuaiGLwXNIRECyvhWg+vIXMX6cO1P6yVwJF4sw35+C3EDqTC?=
 =?us-ascii?Q?TqB6nfFLgCp8YdkoFSZomIrdlz5d9bH7C3+oZ8shk7JZpOOQ6ZMJy+1RNtNM?=
 =?us-ascii?Q?eCsqnjjECq7VQDcG/TVzUwxwiGwvyO6xzZ/PmcwauZpV7vYklU2mQiSkZHcL?=
 =?us-ascii?Q?1jVS3hHXNU8DnC22fFBUY1Oqz4meG3fayysPiRBt1r4BmghXuc148nkyGYNK?=
 =?us-ascii?Q?D38TAsbQjidK7l5fs/j7LbgXahOQofeW8Acx1m0PzM+VWMdJaxtius6by1ns?=
 =?us-ascii?Q?mN2Xdls3bZy0zdWWbl+2vbDov/ZpCbsAiO4IxEgqjzuCY0J4avM6SAVLN3iz?=
 =?us-ascii?Q?8BEh4HKhehKSNyPK3R7j9jo14tZnpD6SvrVJlS8/XCn0ftQTojeeTYzF4bqB?=
 =?us-ascii?Q?mEdCFSqzL7IkUtRqibJa3GzmrWz5qt1RCFm4Em6K31+S08fJrXF4c/MMJjUv?=
 =?us-ascii?Q?Vh+latvqeuzPqpRk7keooyXzEWtR0mOkkrVLSj/4PYijnQyYlAbmOUqIWzCT?=
 =?us-ascii?Q?7ow8Kzdf4siDE7fceV+4grUw35wSgLS4G2IVIbYJ9yhVEVzmRvD40LO0Bliz?=
 =?us-ascii?Q?p3ozYIG00WrepA1Xfax5eih6aUnHGlf9L7df6uSqwD9Mfhxwbn6mX1leIULE?=
 =?us-ascii?Q?Ci8mIjBQhomXEIUKTlxmZPBUwJcpMZmd24Cy+dMja9TKE6AHGv1MALCMdGbO?=
 =?us-ascii?Q?wfCijcrcqMrh4QntbHvxpBvaNyV1t/BnyRSXMIxTsBv20D7ugqIZlveQu/0I?=
 =?us-ascii?Q?Cb7gpUemaK6JFRCYcA4poe+9GcpQNDvy2nk+QrzosXlowoLYh1m1Wt5miQpH?=
 =?us-ascii?Q?MvCZUBcXhwi/uDFCE3gWlW5EpEAbSJhA2EEBOnlyMTRxPBsD38sERTXveKc5?=
 =?us-ascii?Q?hIzuX0IrE33uBsZeUJnRM0SN81ScspjzXJKlMugfXX62NSGUdhxezUwr8PSS?=
 =?us-ascii?Q?G3aTddH0ex/7s32KugnmAx5jfBWPxqeG8van2Z8vy6Gi0s6LTJw9DbwRDZDM?=
 =?us-ascii?Q?gMazIPd5tTF9nYNXmoXqOyok2GWWHT5ODgLbjkGtyrjPv0izLT5o5kWUW7KB?=
 =?us-ascii?Q?rJcsx/IS6TTwS2M2sbWOkgo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 964b9c00-43f2-49cd-8e39-08d9b8b3cf70
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:27:47.0631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhDR5FWCwbiKnOS00wwQQRcVKsEUneIVniWi9HKa8soGdALelrkfdguDzWuKmNTvQZDxZ0H8OT/AaNQNIAP9mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 06.12.2021 12:38, Andrew Cooper wrote:
> On 06/12/2021 09:42, Jan Beulich wrote:
>> On 03.12.2021 16:30, Andrew Cooper wrote:
>>> On 03/12/2021 13:32, Jan Beulich wrote:
>>>> On 26.11.2021 13:34, Andrew Cooper wrote:
>>>>> Each IDT vector needs to land on an endbr64 instruction.  This is esp=
ecially
>>>>> important for the #CP handler, which will escalate to #DF if the endb=
r64 is
>>>>> missing.
>>>> One question here: How does this work?
>>> Honestly, I'm not sure.
>>>
>>>>  I don't recall there being any "CET
>>>> shadow" along the lines of "STI shadow" and "SS shadow", yet there's
>>>> clearly an insn boundary here that gets "skipped" if the 2nd #CP gets
>>>> converted to #DF. And fetching of the first handler insn also isn't pa=
rt
>>>> of exception delivery (and could cause other exceptions first, like #P=
F).
>>> I can't make my observations of real hardware behaviour match the
>>> description in the spec.
>> I haven't been able to find a description at all of exception behavior
>> when the exception occurs in wait-for-endbr state. There is text saying
>> that #BP and #DB can occur this way, but I couldn't find anything about
>> the tracker state changes in such cases. While I could see the state to
>> remain engaged (requiring an ENDBR at the handler's entry point), I
>> cannot see how the state would get re-engaged upon IRET from the
>> exception handler, unless the return is back to CPL3.
>=20
> Critically, there are two wait-for-endbr states.=C2=A0 One in MSR_U_CET a=
nd
> one in MSR_S_CET, and the active one is dependent on CPL.
>=20
> Interrupting CPL3 does leave the state visible (and frozen) in MSR_U_CET.
>=20
> Interrupting CPL!=3D0 does not.=C2=A0 The interrupt/exception delivery
> microcode forces the wait-for-endbr state which is why the entrypoints
> need ENDBR64, and while I haven't confirmed yet, I'm pretty certain that
> a WRMSR to MSR_S_CET which sets wait-for-endbr needs an ENDBR64
> following it.

That's my expectation, too.

> IRET does not alter the wait-for-endbr state, but does switch which of
> the two trackers is active, as a side effect of changing CPL.

Well, it only really _switches_ when going from CPL<3 to CPL3. Otherwise
it leaves what is there, meaning wait-for-endbr disengaged. And hence
an interruption at the target of an indirect CALL/JMP will squash the
requirement for an ENDBR to be there. Perhaps a weakness that the
architects considered acceptable and "better" than having to add a way
to save/restore state (where at least the restore part would necessarily
need to be part of IRET itself).

> #CP is a decode-class fault, and takes priority over #UD and #NM.=C2=A0
> However, the #BP/#DB special cases are specific to the INT3/INT1
> instructions, to specifically permit putting a breakpoint on an ENDBR
> instruction and to take the breakpoint exception rather than #CP.=C2=A0
> Critically, #CP has higher priority than General Detect #DB.

That's what the text in the spec suggests. Yet why would #DB / #BP be
any more special / important than, say, #PF?

>>> Given what a mess it all is, I wouldn't be surprised if the exception
>>> delivery microcode has a special case to escalate this to #DF.
>> I am meanwhile wondering whether any exception in wait-for-endbr state
>> at CPL < 3 would promote to #DF, for loss of state. Albeit there must
>> still be a distinction between CALL/JMP induced state and that
>> resulting from interrupt or exception delivery. Yet there's no
>> architectural (or shadow) state expressing "first insn of an exception
>> handler".
>=20
> Architecturally, no, but there is internally by virtue of the fact that
> all interrupt/exception delivery is organised by microcode.
>=20
>> I'm not even convinced the aforementioned statements about #DB and #BP
>> are actually meant to cover more than just CPL3, or at best ENDBR at
>> normal CALL/JMP destinations.
>>
>> While for Xen's own use we may get away without knowing how all of this
>> actually works (perhaps accepting the fact that one can't set breakpoint=
s
>> at exception handler entry points, depending on whether their delivery
>> would promote to #DF), as soon as we were to support CET-IBT for guests
>> we'd definitely need to know.
>=20
> I'm afraid I don't follow the point you're trying to make.=C2=A0 INT3/INT=
1
> are explicitly special, to let you breakpoint an ENDBR instruction, and
> that really ought to mean everywhere.

Maybe. The point I was trying to make was the more general case of an
exception of the ENDBR at the beginning of another exception handler.
Perhaps there indeed is merely a special case for #CP. But that wouldn't
help with e.g. #PF occurring on the #CP handler entry point and the #PF
handler lacking ENDBR. How these cases are meant to work (and which ones
have special treatment) is necessary for us to know the latest when we
want to allow guests to use the features. There, besides getting things
to function correctly, it would also be relevant to know to be sure
there's no XSA-156 equivalent lurking.

Jan


