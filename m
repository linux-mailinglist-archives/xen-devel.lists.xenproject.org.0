Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC634452D6
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 13:18:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221507.383255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mibgv-0006hh-IA; Thu, 04 Nov 2021 12:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221507.383255; Thu, 04 Nov 2021 12:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mibgv-0006fr-ES; Thu, 04 Nov 2021 12:18:01 +0000
Received: by outflank-mailman (input) for mailman id 221507;
 Thu, 04 Nov 2021 12:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mibgt-0006B1-8z
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 12:17:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3eaec08e-3d69-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 13:17:57 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-nhwbFiGvNqabzfWquvoDkw-1; Thu, 04 Nov 2021 13:17:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5472.eurprd04.prod.outlook.com (2603:10a6:803:d3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 4 Nov
 2021 12:17:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 12:17:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0018.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Thu, 4 Nov 2021 12:17:54 +0000
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
X-Inumbo-ID: 3eaec08e-3d69-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636028277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c7bKtW6Hg0jWQkd+9REPQtpu4R77WSF3SKCWNIjGn4s=;
	b=GsiZwwiquTMlQZAHc9Qw6u8QdRqX+O3t5uWakBhT521/uqZFztFLzEymM9+CZcAeaQwAO7
	tzkdWKGr8BOWQnJDRm87/f1FhW+JY+8CKj6Xaw8V4ljUQOrBcRDtdygOPGW9Z68JsZcJ2v
	zqW9QHbDhvrBtPmdo2tUzeln/do6HJ8=
X-MC-Unique: nhwbFiGvNqabzfWquvoDkw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQ2lUX8JiXnn8c53mXnY6W9cmoShF2nvmP3QPqRmLXpq+uUsgNvo3MWCLJc2rEz/8zp4z3/lSXT5lDUmehc45BZD+o2jIekZV90JcSz+oi4qWOrp67sbBZyR57DajdLShSfabg3Se6n+1l1IsU0QMpgbjfPpP9vw1ON8qEwEJRCQj/Tc6AqXgiEKtNEEcqSRDLgJDNiVQgwEDWbi46LDkvPF7tgvBoASuhZesE0O8h0VHNRHKyC5l/xszVCEf5vq/lRSAygwlO+DsihYq8hv4TkXn/dr2RsHOIEza0RwYEnZYpEyPEyib5xappEzlp4fXEBPWghL/yW19ZKAZr/x+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXBvy/wr+tafUqj75IgbeseJvLJptr9zNkUk78xP2Ys=;
 b=enbxtGrYbZjiEaSuhbnETCqMvasQAwHn5yHjdfPnZ9qQl0tpjfMQ9xTnFc8TXPJaSr2MVeWVUQn3ZZRyqqFvSJ2AYxUiTHaNhHamgQ/3el+y4T3/KN2MLj+NG5UCrUQKPDaYUj2SVaG5U2kKqhsYYyzbGpV1DdxARQbHDjJ0Q+Dq1oEXlOE0JTZ4JxQ7Q1113mgfBezSAgQ0nQFeSE5MGoKiOQcCSsIAMfJTIlU0kBX/GOgmpvPQk8484B1+h+uQaMEM7BIt7Yc2pPvLmIQLNEuarvCmBrnLvSsyCE2P0WfhvG40phgkcZvjsOvqdRA0kcRDBxUyrVopW1hPL3X7aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2051641d-17f4-07ee-9db2-0234e6ce4c70@suse.com>
Date: Thu, 4 Nov 2021 13:17:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16] x86/passthrough: Fix hvm_gsi_eoi() build with
 GCC 12
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
 <77acd9ab-1bf0-cc02-3865-bf9844b3eae2@suse.com>
 <24962.46376.136195.463274@mariner.uk.xensource.com>
 <1950ed44-5b0f-bdad-75f9-b91c66d95fdd@suse.com>
 <67d7cf93-2860-f8f1-9de7-932da7f537e0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <67d7cf93-2860-f8f1-9de7-932da7f537e0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0018.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d388094-2abe-44e2-0f48-08d99f8d217a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5472:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5472E4D2D994B7AA9FD5F685B38D9@VI1PR04MB5472.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vLDr6JJCKgvBb08HV81I43Oq8K9G5eiHjCzcHq0xBwagPR1FgPHXl3eh0DyafxAdHPgaiFVRx9vvZefwH+k4uguG0Zy3j/z0uE8bm0pDM0l8sHIY4A7RWVPOhlDnXyT+pCX+tlng+gqDjr0fBEfT1KW0tviMiNkr2neg7Ybv6OaL2tzx/loQg+caVpBzA7Ix2qurqoXlbaFJ3NENMk/KEIE/8BeRVWsoHpgtIdjcxnqWfVvYAK2oKIGDa+MSo2zHFaxGaehmEEH7tNg1zHlzRp2e91BhR9RvDr4CVtEsWnqsXgzb/UUHdxfKteEELyhZcQXR3wXTV2zMpM8UrTuhQjLOpdl2U/Cl1xH+TvcAGttkQrgIKv7CIj4fpeGmpNK5u2TVzq2sq8Pa5KsnOmPF5KWr9vgdK5fmDeYKL6VX9kUu+7yEQjCf0AhKYN09yJ+9eei9nMy931QVN2oqJRRCwZAwR3p87MJTZuMbi5FkL4AnfdPtKyZ5Fhwug17C4SSGK5TTEevVbTz10m42HQoECtL/opoBMLlrOmjirBRH3Y3v1M9+F1GITAkB+K0JVI2PuHf6T193vj/lx1Tt8y1DsZDEBWiYPxIfL/V5nt9FPvowVUdd3Ckjs8vEz+n2vrpiDTjYQxjxJhTw6ZqkkhYZKcXcga3NT9LZW/cMr8JuK5ESywKZp4gZn7lrgQvevubOeL/2Z05/3a4SOa5tUI4PNU0qXBZ/va+HpMlGN1giOkGqd4ifOqZzqbW7++jKQRhz5W01PFJGBiFttVW2u8GI2/WJzROXoYtZZ6aL6mPVB67Z0nRYW4BMdGo8bsWIiPEI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(31686004)(508600001)(6916009)(86362001)(5660300002)(83380400001)(8936002)(8676002)(2616005)(54906003)(966005)(4326008)(26005)(956004)(53546011)(36756003)(66476007)(66556008)(66946007)(16576012)(186003)(31696002)(6486002)(2906002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m/HlhoPaucTZCFWoc+fzG4FB4ZZQL9puCFdw2wDxN14hOHSaKoRMWvWtEvR7?=
 =?us-ascii?Q?qpj5ta0msZLjapKVcTvN3IfeGOm6eMLrcyN+JKIRECIjnW38pNfH9mt70Y6x?=
 =?us-ascii?Q?Lg7KJgRHBQw4pi9O8iP2OHQ34BfWUu93qozc3Qqw7xbmAb66Rtwajjd5cB/N?=
 =?us-ascii?Q?TkULKPHiV8MJf/r1oGJWdqPK/j+Hrbfhhb2sYJdIb3Z0vCFWajb4W9Aena4y?=
 =?us-ascii?Q?wz5jzy5/HwxASpRN/ZOOrSPJheEahSzbbsxjLSfiy8jpiLiNRmiGqdCHDK0f?=
 =?us-ascii?Q?k4HE+3NPv4QKwViRdQQUWSRK+vG5hFrKEVk3amspGRN//odOhj39tsbZz9R9?=
 =?us-ascii?Q?G8tHN1UwqQvh3Sju0UF5CFe8je/9vHrMxNNovR8o5JVqglPv1XtQJB7yWQwM?=
 =?us-ascii?Q?4pxk6zqfVdngoskGPY199rW4cifUcylYkudUBcPM/2ioyJkpjHgb3XgnYRJo?=
 =?us-ascii?Q?sn818kiV8wp0UIor6gEQXyzqWmglTZ4boM+OaStL9zIZk7efAkBdEelCeszH?=
 =?us-ascii?Q?KTPUgJOf05U/2td+t16C1JuE4uS/f8H4ccxvK25Zpfkxn6ZqpEARXCyjcTln?=
 =?us-ascii?Q?00Vh6F8IOSw7bce5OrzMsJiJBuDAud2CTmmO1Vs8NjhTGVcahVSxZ8RgQPyt?=
 =?us-ascii?Q?LXqymM1uHWj0FYkQtAmqgVRHM0DZrDfeL3EMUf9mCBm6mWaQXqjbAGE5z0dx?=
 =?us-ascii?Q?aE2yDRpVXX2Vu1FcwJQUCKgYwWeGJ54Emvv7l8avSfDex1EppM5lVMliu4ui?=
 =?us-ascii?Q?jRNJA0kjKc0E4ym1ZgZozJvT8QJfwzuyX5e8F4HsPynHjZX4GAZwpEESdxDK?=
 =?us-ascii?Q?vWjRqTgqOOCmXUy/ADhy4WN3FJxsZSwlJCEnppiqgKwK2Q6Dj1ZpyDqc8rCV?=
 =?us-ascii?Q?MpAs5Ev1Q1TCyF5lMYSJW8EqXbSUUmhGC9r/7vIDq4Q3PcKtHVZX9uSYlax/?=
 =?us-ascii?Q?rm4xhq2lc9YhntIqwBWTYZMjmAUlSAnqfb+WOtIKnNsQ+Zq/LhFMO+C7xl0/?=
 =?us-ascii?Q?qoR7HmDXQmdS2YaVUxj3GM43xciEfqVpk8PGEi15/hpXoriSSE5nZDz+eqlT?=
 =?us-ascii?Q?iH93ysZbW4to2+JYyZcE9ZJrhfC2u3KyLW70iIANgwH98sAnp46kqsTaZRJk?=
 =?us-ascii?Q?mlbY0p0pB3h6mT7gThLwFU/sNfTkONq2Ln66ijW7g6+p9pBy8yj74cyn5ONb?=
 =?us-ascii?Q?TShWrEHXDiNDfEyo/tuTEXVBmqfMpG/3xvRJLKLd71C4bT6ODuVqMh9PJs93?=
 =?us-ascii?Q?reUt/QzVDi7SlOWDgX/h01xqfzv+6oUheQ9TzrjrQuq1E0s4ymDudGWgqyPl?=
 =?us-ascii?Q?RnHqOD90GNGqxF0DjYEkMRqDRIWP0h4vwXNdHgv2deaMydrbtXk8JjYgnrB8?=
 =?us-ascii?Q?umq4FHZ6y6fUQuto77ofQKwWMCZu1D8HS5La8WtisByDcTRgdGJgYgnkxilN?=
 =?us-ascii?Q?SnxzYcGNhYUD+y6EEiMMFZqlDpbVSv/vav6o7X9L2h723gL9KxmWwes0UhGP?=
 =?us-ascii?Q?BxoWRynwT2moR5dTu2TPN8WrkTKNd3rBCp99Vck8SPDO4nekYOnoR7j5umH3?=
 =?us-ascii?Q?E2na8URTFMVNARf6or3XSFoTMImFqJxF+SRjCytJSg5ZlVsVOtiQLEbqoZNT?=
 =?us-ascii?Q?msrJVOQ9UJhVpx8nnYNwZRA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d388094-2abe-44e2-0f48-08d99f8d217a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 12:17:55.4186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkMvsvyneA+m8yaATpGHI1fQte3LQJ6R47QJzkHcVf+UE3eGirNFr2tDVhwFhcQh1M3kmkuGvAxCVOmDKJh24g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5472

On 04.11.2021 11:48, Andrew Cooper wrote:
> On 04/11/2021 08:07, Jan Beulich wrote:
>> On 03.11.2021 17:13, Ian Jackson wrote:
>>> Jan Beulich writes ("Re: [PATCH] x86/passthrough: Fix hvm_gsi_eoi() bui=
ld with GCC 12"):
>>>> On 27.10.2021 22:07, Andrew Cooper wrote:
>>>>>   if ( !((pirq) ? &(pirq)->arch.hvm.dpci : NULL) )
>>>> I disagree with the compiler's analysis: While &(pirq)->arch.hvm.dpci
>>>> indeed can't be NULL, that's not the operand of !. The operand of !
>>>> can very well be NULL, when pirq is.
>>>>
>>>>> which is a hint that the code is should be simplified to just:
>>>>>
>>>>>   if ( !pirq )
>>>>>
>>>>> Do so.
>>>> And I further agree with Roger's original reply (despite you
>>>> apparently having managed to convince him): You shouldn't be open-
>>>> coding pirq_dpci(). Your observation that the construct's result
>>>> isn't otherwise used in the function is only one half of it. The
>>>> other half is that hvm_pirq_eoi() gets called from here, and that
>>>> one does require the result to be non-NULL.
>>> Can you (collectively) please come to some agreement here ?
>>> I think this is mostly a question of taste or style.
>> Personally I don't think open-coding of constructs is merely a style /
>> taste issue. The supposed construct changing and the open-coded
>> instance then being forgotten (likely not even noticed) can lead to
>> actual bugs. I guess the issue should at least be raised as one against
>> gcc12, such that the compiler folks can provide their view on whether
>> the warning is actually appropriate in that case (and if so, what their
>> take is on a general approach towards silencing such warnings when
>> they're identified as false positives).
>=20
> This isn't opencoding anything.
>=20
> The compiler has pointed out that the logic, as currently expressed, is
> junk and doesn't do what you think it does.
>=20
> And based on the, IMO dubious, argument that both you and Roger have
> used to try and defend the current code, I agree with the compiler.
>=20
> pirq_dpci() does not have the property that you seem expect of it,

Which property is that, exactly?

> and
> its use in this case does not do what the source code comment says
> either.=C2=A0 A GSI is mapped when a pirq object exists, not a dpci objec=
t.

As per my earlier reply on the thread, I view the check as a guard
for the subsequent call to hvm_pirq_eoi(), where _this_ pointer
(and not pirq) is assumed to be non-NULL (while pirq gets explicitly
checked).

> If your answer is "well actually, we didn't mean to say 'if a GSI is
> mapped' in the comment, and here's a different predicate which actually
> inspects the state of a dpci object for validity", then fine -=C2=A0 that
> will shut the compiler up because you're no longer checking for the
> NULLness of a pointer to a sub-object of a non-NULL pointer, but that's
> a bugfix which needs backporting several releases too.
>=20
> The current logic is not correct, and does not become correct by trying
> pass blame to the compiler.

I have yet to understand in which way you deem the current logic to not
be correct. I'm sorry for being dense.

> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D102967 is the GCC bug, but
> the result of it was them persuading me that the diagnostic was
> legitimate, even if currently expressed badly.=C2=A0 They've agreed to fi=
x
> how it is expressed, but I doubt you'll persuade them that the trigger
> for the diagnostic in the first place was wrong.

Well, thanks for the pointer in any event. I've commented there as well.

Jan


