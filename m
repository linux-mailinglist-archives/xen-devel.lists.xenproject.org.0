Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCD34B8AF8
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 15:03:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274145.469504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKKtg-0007E1-OM; Wed, 16 Feb 2022 14:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274145.469504; Wed, 16 Feb 2022 14:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKKtg-0007BO-LH; Wed, 16 Feb 2022 14:03:08 +0000
Received: by outflank-mailman (input) for mailman id 274145;
 Wed, 16 Feb 2022 14:03:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKKtf-0007BI-Sc
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 14:03:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29e853c1-8f31-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 15:03:06 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-MuHevETQOF2XxfwW6GW_Ow-1; Wed, 16 Feb 2022 15:03:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU2PR04MB8919.eurprd04.prod.outlook.com (2603:10a6:10:2e2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Wed, 16 Feb
 2022 14:03:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 14:03:03 +0000
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
X-Inumbo-ID: 29e853c1-8f31-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645020186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rBYt9WVboXPyNYp43Pn9hYZWYs4NHFJ2Q/3A7YZQ3Ms=;
	b=bNKj5hG8YhiOFGEp8UGcdN/lVRfVslfYhmq6lc66J483l/EhyRyrM5XGAge3SKWyfcbs/q
	/Af+Ybvnm02rC+6W8hQOhle/PpUNKfJxmMcH/T1b+Ug/PXzE6N+/64DGgSt+Gwi/tyNm0o
	W4K5p3pvK9PPReWb+B74o+z8m3JvPhQ=
X-MC-Unique: MuHevETQOF2XxfwW6GW_Ow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEbcTjyCBgs045LwF/kxSh8ZXgPqWxbbPsDSxz+PT1uAwssYOrZJ+2a9Aij2Q7eHENLWgokrEX+zfQjGuS+J7TpfuXmi0SDp6u1SihCLo+vJWR4Dhb5OddJfEOHQP9TpEpp9bnHIztxlahQOEYVjHMWJGcSijFLKOJ6D57P11Zop3EVE9TwZas6OwznvaV+ekxSJdsUGjlD44enHwwFVCbA3Wh66bKPFZtRKpEY4cq/kwkwUHPDlqB8GDpWIVVg6xWug4e6ll2MQuO6noFtRS/nATrZCJ0BwMbNx4Pv4Ff9xrMfy4aAPfrD1UPvZ79aIWDsn1vdjSa2sGbFbiYEWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbHJh9+VpQt+jxKRi6sRQbJmhe/uEsMO9RV0NKUOEqY=;
 b=NLamZC88l6BYl2n4kbMzoR1vlhq4dvGMB2ZqsQv7KSufRloG9jUJy+Hu6i9Crkja71x2dWm5VsuyZfByWwK0dD7/ov7ByDood4nhby5H/BK8evJFS0MROwL3jyAdjKazMN4vl+5f9xn9iM8F5wwOHffinmiyy2jvehKxTRQwkXD3wov6FhWTkZvSQ+U4HCHu4/Dx1oYFg5C9akMkMdUbTrLz0weByVz7Eu+FLzVjsxRGqlm2P8TSL4IBLiLsW+0vamsAhVOH8mMpJ6lVF7oHQYhGDevdOZlTppMuQEnlcTI1Ays5O/hnDbMAWXLHu8jpNpdU+C7cKa2ENfaKqqt6uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <63811bb5-cce4-d542-461e-a24926f01b34@suse.com>
Date: Wed, 16 Feb 2022 15:03:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] lib: extend ASSERT()
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>
References: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
 <35d82770-66cf-e030-5bcc-3c030e4463d7@xen.org>
 <3F58400B-5151-42F2-8F39-109DDF50EE1E@arm.com>
 <a89223c8-f59a-24cc-96a7-e40feb28813f@suse.com>
 <DB014136-7797-4A61-9681-33A7D85403AA@citrix.com>
 <732e8e39-36c4-1651-61f3-9b55caf29fe8@suse.com>
 <46408EAE-5EA4-4B22-B685-BA6D313B5D3A@citrix.com>
 <FEF187A8-0A09-4D50-A0E5-F46E014DB3E1@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <FEF187A8-0A09-4D50-A0E5-F46E014DB3E1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0027.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c394fda-4f32-4999-bee8-08d9f1550c51
X-MS-TrafficTypeDiagnostic: DU2PR04MB8919:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8919402687DB5996C152FD49B3359@DU2PR04MB8919.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dl4RY35k7DE/GRhquLsaA6h8ilvUxbSHB6SUyIcrcb5HnvcQKskv0P4d94QzK1vnjJVgBndVNJxra/8GIFqbc2i/88e4pMP6BeMTOOP2l+J/mS26ylgPTowynI51e2V8fhEoLWWkSHjSpgne/WPB9pJjy85oseE0FLkvdADvZhNsReCS5FDlnnVDZPV4lKfmVBb9qjL/Ld9AJ8pnucl8NuzgMWsa7DjEIVqcr4vFzI3cXDo5S0u+RiPRCM6/EAp8r02AlXj9U4wJzqDlYdwYdjid87R8ZpSpvzA+xVbsHbSK7ZifDrX2Cn9fDCVzW8EonPRHN64NIGx7I3SzvlPyK0QZ+jxqv3LQnRgocjB5yNeUdzv5xsQNP4M1Cu5epNUvCS1coLA9aT5s09oqMU6vtbyADZOl9yTeDZnvJvEtRd/BncGbmB2qOTOz78HIWesjX/gaUlwWMj2szMvsI5QU6OUP2hsCPoLZFyjjttAKUuHeAp58j7PXtgI4m3VR6g0Joxy57BM/GGrj6ovCeu4MpCCJiKHGk9B+X5Bjw8VPKHwQIfGgVlaQoicyOid+zcc7ul/Nq6i8jCJV3XGBczZoEnymHN+IvoyIA6UlZYzDkB7aa54avMQlmBMmoxeoVF1cJWb+zCbAfP35qD3V7gfJ0THHsw5nAjIO2vMBKO+n7Mnnx+fIpUQg0pGLyQA9wFydok3ZGVG4Az0V/BTT8nPWaeD02nWq0IO1ECpfzMcFhG+qUAjsD6G3hYqhIJ0gvYwF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(8936002)(508600001)(31696002)(2906002)(38100700002)(66556008)(6512007)(6486002)(86362001)(66946007)(36756003)(54906003)(8676002)(66476007)(6916009)(31686004)(4326008)(26005)(2616005)(6506007)(83380400001)(53546011)(316002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?it4qhPEh1tZ1n8L5Sq45sTgm30d+bB3NQkrVm+TGAQsZVfDrzFivjwPN5Lpz?=
 =?us-ascii?Q?VyWqwW1QfyVNWsZODqil6wLTKP9FnEbfs98fF+9ygP+0Cf/71M1g9qPTw17y?=
 =?us-ascii?Q?chAioHTdTHObQtf0Q+24kDBilOm5cAAo5b99vqrX6v5pSRJ57ttvRw3Y797R?=
 =?us-ascii?Q?0DEQpZLIX2iwQJ4O0O9AYg8tO9EannG6n4PqPLi/2Bvx9AXCCl+jPrtOTAor?=
 =?us-ascii?Q?3yH4FciFLwV0uLiubaS1DRd4YgcOx1PJY2qrHETG8kMmjveNImXGv3AW99b+?=
 =?us-ascii?Q?GV2RQUl5RFDEJHRWsqcJEOi3+GNI7krJMexy6xzveTdXtpVP59DwtMXhJBIv?=
 =?us-ascii?Q?JANJUTl0DzIiwgrUQ+XrPeUpidiK6hKJSnEYtIHriW9B6/Td+Ah5BLdo48lL?=
 =?us-ascii?Q?2fDdb3ie7jkEa1feSAboYGlhmsFlzTZAW6Uzi/WsiMOAVFOkQz3pX5bqTv0f?=
 =?us-ascii?Q?8qnnE7Ck0Bc3TeiXfYiiU8Wkbt0s/38QvcVXoWIJj/Thyk5JAraz7yfy+X3w?=
 =?us-ascii?Q?qGExbh6s+226Q6zAGAQLYpWSnfeHaMYvMoR9nswO+XwLiwYjaONXdzTnk6B0?=
 =?us-ascii?Q?DcDEictJL/DGBoBJBGdbeQYDxN+KEeGDhcKiZZMPlvnWf/wsDzfl4OH3Q2C8?=
 =?us-ascii?Q?jZYgCsvWXRQhhvyCLnA+gEtNKzk4RP7IjRf692xe9jZza0cilhGHlCNjkSqh?=
 =?us-ascii?Q?zR/fdYReEFZ/F0P+zOl1FNllpEyvXcyjmIqaxM7qwCrfk2paJ73DQlV7WvvU?=
 =?us-ascii?Q?I4sFMVGikiBt9IyQtFAy662pOFiIS2JzHVOhzl/Zzhgf+V/NJzD8zVu8ye20?=
 =?us-ascii?Q?IiJk9Y4ZBqljZkLU3T3UWdi5UYJmlHwI3bjRexhbEe8E97/vcqaF50NVuFg+?=
 =?us-ascii?Q?dKgb6nobORmpve14uOnmJCz0slRU/hlKuKh0XznD1F73VAYfI7MwyEP7ZjAs?=
 =?us-ascii?Q?elad7ZocnHF8Ue3XtN6ZGqDaGFynNWPo92tilIf4Du8wF7T/FWsAfvJ2SuBm?=
 =?us-ascii?Q?XMrgKJs3gAH0y4fIiOZcwMGgHzrORwSuRGB+bjbBBtRxgoTG01SVXK+KvbGK?=
 =?us-ascii?Q?fBm8fFH9940f7uBtqRqCzD0ZGiIdmNgYQbRmoYivgYWfaocCX7lKaSQZSI66?=
 =?us-ascii?Q?Bkkput+AAPd2wlKY11/FQhuV6pLQvK3gfFdAD3kxIjaACThqAQGR7pQvY5MY?=
 =?us-ascii?Q?EmF9l/0pRWhTUqGW5HEBcnIBJ4UAiWQg3NByCzaEs92xEX6vKL+Dsz889Wgw?=
 =?us-ascii?Q?YSFStKwVdBe+hku63GP0LQZ8QdFtICkczZF4RKuyLQtCDKirvlk+xODChrds?=
 =?us-ascii?Q?BCjlpJo0LWTU1NlQgks/WM6xocyYbWOXdv2PTYRMyciNLWuRW6QEtaKe7UGI?=
 =?us-ascii?Q?oRw3c1aZb6Za0D7M78oON+o6Ddd/FxmCT92I7KmPM05oz8hqSvy3ohxcgvLy?=
 =?us-ascii?Q?9KNvM0CN0XHn74afmm2UPHBLyDokipJGue7vYN16Ia8NP9g81zpn+0NkAGvk?=
 =?us-ascii?Q?5yvMCBTgESFWgd4DMNNl3i2itJweCNOL67uNO1NdV3kxS29kYBxhNjK5t7qD?=
 =?us-ascii?Q?oUNIMAqVXikDZeIa5SU/F4bhJ0Qo18KRbnyJcAjUmzn+KHXDwDKRDP3z3llK?=
 =?us-ascii?Q?rtDtpNgswdQe25aqylTQC6U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c394fda-4f32-4999-bee8-08d9f1550c51
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 14:03:03.1927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+UvfIGnAi12Y1eEKxHnnZ2K1cEqdWbVIJEa/v/VR5gU7qjBh0O5bd2ZQJkGKmsVVqxYQy/EBrumQRHqAQ4LHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8919

On 16.02.2022 14:57, Bertrand Marquis wrote:
>> On 16 Feb 2022, at 12:23, George Dunlap <George.Dunlap@citrix.com> wrote=
:
>>> On Feb 16, 2022, at 11:42 AM, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 16.02.2022 12:34, George Dunlap wrote:
>>>> I am opposed to overloading =E2=80=9CASSERT=E2=80=9D for this new kind=
 of macro; I think it would not only be unnecessarily confusing to people n=
ot familiar with our codebase, but it would be too easy for people to fail =
to notice which macro was being used.
>>>>
>>>> ASSERT_ACTION(condition, code) (or even ASSERT_OR_ACTION()) would be a=
 bare minimum for me.
>>>>
>>>> But I can=E2=80=99t imagine that there are more than a handful of acti=
ons we might want to take, so defining a macro for each one shouldn=E2=80=
=99t be too burdensome.
>>>>
>>>> Furthermore, the very flexibility seems dangerous; you=E2=80=99re not =
seeing what actual code is generated, so it=E2=80=99s to easy to be =E2=80=
=9Cclever=E2=80=9D, and/or write code that ends up doing something differen=
t than you expect.
>>>>
>>>> At the moment I think ASSERT_OR_RETURN(condition, code), plus other ne=
w macros for the other behavior is needed, would be better.
>>>
>>> Hmm, while I see your point of things possibly looking confusing or
>>> unexpected, something like ASSERT_OR_RETURN() (shouldn't it be
>>> ASSERT_AND_RETURN()?) is imo less readable. In particular I dislike
>>> the larger amount of uppercase text. But yes, I could accept this
>>> as a compromise as it still seems better to me than the multi-line
>>> constructs we currently use.
>>
>> I see what you=E2=80=99re saying with AND/OR; I personally still prefer =
OR but wouldn=E2=80=99t argue to hard against AND if others preferred it.
>>
>> As far as I=E2=80=99m concerned, the fact that we=E2=80=99re reducing li=
nes of code isn=E2=80=99t a reason to use this at all.  As our CODING_STYLE=
 says, ASSERT() is just a louder printk.  We would never consider writing P=
RINTK_AND_RETURN(), and we would never consider writing a macro like CONDRE=
T(condition, retval) to replace
>>
>> if (condition)
>>    return retval;
>>
>> The only justification for this kind of macro, in my opinion, is to avoi=
d duplication errors; i.e. replacing your code segment with the following:
>>
>> if (condition) {
>>    ASSERT(!condition);
>>    return foo;
>> }
>>
>> is undesirable because there=E2=80=99s too much risk that the conditions=
 will drift or be inverted incorrectly. But having control statements like =
=E2=80=98return=E2=80=99 and =E2=80=98continue=E2=80=99 in a macro is also =
undesirable in my opinion; I=E2=80=99m personally not sure which I find mos=
t undesirable.
>>
>> I guess one advantage of something like ASSERT_OR(condition, return foo)=
; or ASSERT_OR(condition, continue); is that searching for =E2=80=9Creturn=
=E2=80=9D or =E2=80=9Ccontinue=E2=80=9D will come up even if you=E2=80=99re=
 doing a case-sensitive search.  But I=E2=80=99m still wary of unintended s=
ide effects.
>>
>> Bertrand / Julien, any more thoughts?
>=20
> I think that having macros which are magic like that one which includes a=
 possible return and the fact that the macro is taking code as argument is =
making the code really hard to read and understand for someone not knowing =
this.
> Even the code is longer right now, it is more readable and easy to unders=
tand which means less chance for errors so I do not think the macro will av=
oid errors but might in fact introduce some in the future.
>=20
> So I am voting to keep the current macro as it is.

But you recall that there were two aspects to me wanting the switch?
(Source) code size was only one. The other was that ASSERT_UNREACHABLE()
doesn't show the original expression which has triggered the failure,
unlike ASSERT() does.

Jan


