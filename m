Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 596D9428C1B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 13:35:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205850.361263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtaY-0004aF-Mr; Mon, 11 Oct 2021 11:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205850.361263; Mon, 11 Oct 2021 11:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtaY-0004Y5-If; Mon, 11 Oct 2021 11:35:26 +0000
Received: by outflank-mailman (input) for mailman id 205850;
 Mon, 11 Oct 2021 11:35:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZtaX-0004Xz-KQ
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:35:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b535b19-9ee4-4ec8-9b4b-9875c4bb7bc6;
 Mon, 11 Oct 2021 11:35:24 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-U2IVKeUZOfSsx3grnKGhzQ-1; Mon, 11 Oct 2021 13:35:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6303.eurprd04.prod.outlook.com (2603:10a6:803:f2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 11:35:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 11:35:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0315.eurprd06.prod.outlook.com (2603:10a6:20b:45b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Mon, 11 Oct 2021 11:35:19 +0000
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
X-Inumbo-ID: 2b535b19-9ee4-4ec8-9b4b-9875c4bb7bc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633952123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2Q/kNKt7Wg1wN6se+T+QoqpPsh2IyrVKNwyiWmatMM=;
	b=Rd9S93OEjLg+8Yvt5VF2uW4iTZBKI6ltr39DRusXEAimDU+HQ0DWgpWimmn0kZ1dAMwGtI
	jOW2OqLihauLK+/xKFy4mKbEiOX78jIMEd/h9rziSkEYOnoFOXGBLIGSjAWpGdFP33YOkE
	m4AC3GmOEQi3uRG8vxP4Ut4Lj+W+HOE=
X-MC-Unique: U2IVKeUZOfSsx3grnKGhzQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mb7Ro0R2F28bcKFKq9g+CeWrqWJB2nd8GCIZQiqRmfU9Tf/89abxrVg2scL97wSJv6Ypmh1b8MiFpG5/YkTYv7v9rxmLmhFVi42tcg3WtRhB8wR4ibZjBI+DQtvADVqNNz788+tB1hnlvSTmWntnHLb7yaOhxMX87SRxSJIP9+3hz+I7oSsEOkNc8gF9o/ZZSXphq4Fb2qJGF7rf7xq6Bz9JKNvjC0pOcCSiKccsoWFsapP1ikksZF6todYcZRX4hx0lAhirPIBdL/LlZxHePvEae8ocCYoiX94xpyQAY+Dkyb8TuxyRKUuPw8i7kR365u8aZsQ0cZhA0DkeGqtt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCklJSUC56Ik8KCpGdECY9v5W0ppVbf9FfW0FeP/AQ4=;
 b=J8FquphSZg5L+ODVzJj1EFedUTIn5KS3bIUoZpUydan+bcGno0ZZlRtPgIVeXZm97yYSxLy8TQ5L0HKswBktZGrsIouelyAnZFrnrpQ4vIRzrHRpxuq59BgozBTNI7vQlYkkgHhOWWBgbd+bMrHha1nRp+wn9qajLPgZlMTec+6IlQMWB2+x1dRxw6rTJb3nX5socnLs61RH3emxVew4ol515ekcjLfzBtrV+HeGrkXJW9+iq//78OTo1O4tYhT7Aob9ZzRfrRRqWpjmjcSXJHfX0ELs3X2VAE429w1ohDfMnRrNa8bMqiamYbW8JHlrQ6b+2/XYBYdFyHh3aDkYEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
To: Michal Orzel <michal.orzel@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <548fa153-b2e3-7f91-c7c9-a569e13b5809@citrix.com>
 <CAJ=z9a2kYdYB9fSXX8NhLk90px03z8+D-YE5AQKW9uABx9kvrQ@mail.gmail.com>
 <alpine.DEB.2.21.2110081433110.25528@sstabellini-ThinkPad-T480s>
 <8a58a981-f474-cf6d-f16a-46805384a776@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b084240e-cba5-4b20-5eef-f21915cfce2a@suse.com>
Date: Mon, 11 Oct 2021 13:35:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <8a58a981-f474-cf6d-f16a-46805384a776@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0315.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82ad1dc0-2a19-4255-739b-08d98cab34d7
X-MS-TrafficTypeDiagnostic: VI1PR04MB6303:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB630325B639190BF7E8228AC1B3B59@VI1PR04MB6303.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kjhNwCC5LF8PKI/uDRPRwoBk7h7wT8Rf7Yjlak9aORwafpoG/RO81bYvCkVpzPdBD72vm1uMuPCUs+tAhLOFAuy5Xv6zjQSIeBCfiZrtCx4TepJFE0eW0wYkiaFKd4O4YAqSCbGwlVC4Lc4813sR2Y/kyylJv6BOcioJmr8793tIYzuLZT18ILA9uUdgly+mtxcf2xDnEk5qYgnLiLAsVKADGJYz+jW9Xo91BeesSOoBy+na4qSqh3hWwOgfk0U0YSIKmry6mONV/QJGgrRTCSWyU6EJ9xt4KWBQgjJm4c567pfy2cjLg8L5gGu1kDd7sBYlFcUZGdNm1Br5sH6/bjrGl6OSWVspWCjeJQD53B7WfVHlXyqgh3oTDSTcQ9nle9aFNIrbdbj7/CQmFPGfCMGZSLOEBav8LziVE3qS2BEIJ/+CeMlpdOF2sbWDrlAQ2NAh7ySBrZvpeAtl+DFOGVTzftIJb3oGEaV6C9OLnaFLInNrP7auo+5XkHmxozyZS6OdI1bnoyWTmfKQ/ODSzgQTsjVvsesCwH7DoUXPtsP7V1eGuocsiJ1EEzANO5ivvBYTxTJYyMfAI2G5yO/QVzfI20Iygsx5C3pD0UjTPi+aoUH7wtFp74vfhNGJFPrbc2ndFe+zou7BawPbsVLWhWB74xHgM7XurhrZtJKGL0vnXrZ1oM0PFlYEunIxxUlkYHDcW7u+dB8a9T4w7EA9M0JkiSJSyHZy6J8mHm2PPDr3qDe2wer5fgpKQpNY45cH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(7416002)(31696002)(83380400001)(2906002)(5660300002)(4326008)(36756003)(8676002)(16576012)(66946007)(86362001)(66556008)(508600001)(6486002)(8936002)(186003)(110136005)(66476007)(31686004)(54906003)(53546011)(316002)(956004)(2616005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r2rDP+j5InLsQjliadar+JbX0RKI44oGA6Awyl/mAe0XPmwPgBcAKtIJteNE?=
 =?us-ascii?Q?QXXw+NGkAY5FrvLj7yANRiObVb98dui1xIx3+IFVTq0nScFvX+3KkBOuxSnb?=
 =?us-ascii?Q?VgXgeM+JE6ZIABhyeImTaJimTuFx4IY7uLBrbdPynEir8eg0eOePJexpq63W?=
 =?us-ascii?Q?7jxk/jDDZMAMO6FIdE2I7kKbJZWzjzaCseLOH3fVEjo4gAelzsShKZyPuxdD?=
 =?us-ascii?Q?ZQAfyYMw0rGcFYMsWKs9CHf59WNLFIDPaZxlltqIALJr5ckbjz0v1ojzzIY6?=
 =?us-ascii?Q?Ji7C6OM/yiqaQfhRYHdw85aWLJ/5A+01WIqqZXbzUYyePiQ+xjJcaTXryZds?=
 =?us-ascii?Q?ICxLvi5x4zLvMmlQMC89/qZDIscI/Uh9fq7Ik28R+ODZ/3N67gYWBvkvuLEf?=
 =?us-ascii?Q?3VsNa7Q9rcym/2Rct1xMwC7dkWFS9klqztL68lxJtCN1V0mtcVT03WZFBj9k?=
 =?us-ascii?Q?I78hq+6BxmFjCP403wgWwyF09+UzPv7rhb3iH7Z1rMDBdKW746kQJ6DqjvUS?=
 =?us-ascii?Q?bRdRlwC3mYpO5q86TrdceHWRyUcISWRlq8FKpS5uhWcPTaQYN3vohyPRSgIM?=
 =?us-ascii?Q?MtPfIqTCHGlLwFNyQnkXMJQX3mAK45b5rfO3Q8GRQQrhuDqc4RffD0UPhnIo?=
 =?us-ascii?Q?8CLwqMN24ELCCa4GcN8Rr/ynP47hh4+Mf6ix1K+3oEeeDIIIH2TNw2yPcNT9?=
 =?us-ascii?Q?QF7SsXRE457PNnXn2nLc8C5EAhiOiwWspLRipHVqZKgJONdVp3mqDZkECM5F?=
 =?us-ascii?Q?D6AjhgG+dQF1JS1Pcze6HXG0s+U/32FisPoCA5zwyc6/emEhroqXeSsybHsk?=
 =?us-ascii?Q?HjkiD1cD6FDyJjX8T2Q70+cadZf/Ao2RQw+rvAVBU3JVj50yrOtMPFeAzxlH?=
 =?us-ascii?Q?eu6lLPrZhJy8FEarpbk+kJbqlL9xwL/feOtsRc5NbpBB8oQ/iQDR+hkb6nbA?=
 =?us-ascii?Q?Z7rEsRtq1q6JH0tUnvpc8gXvtlFCfyiG0s9KDEbVP2cQJ9AARd7zxuDQXg4/?=
 =?us-ascii?Q?49B2ddMsJ6//4qq1dvvsLPkiVT9XjX+Axe+XY+WMm2TfHH5KCDDDDB2badzY?=
 =?us-ascii?Q?xMOxDKOmwJcoX6aJMuCs4dTvbsZ+5CACZgLr4U9cBDvQpxE9ukVEcFsXGxiQ?=
 =?us-ascii?Q?wvoG7D57jzXpNQZ0YGOw3SXnFKLjjjI+LG6XiIIAgpBndli11/uSpsKq8r37?=
 =?us-ascii?Q?9SGsmJleaWzeGGm/P9hHRI7F7+VVZjFfRlcbNOTulak2Cm39wHuKA941xVeA?=
 =?us-ascii?Q?h8BNekGTZFywCQE1iOT2fGglgMNN4plqPmuG4VIzJti7I3fGIzwn9LFkaWR3?=
 =?us-ascii?Q?eoc+vBUm8TZsNKNVKaoYNrAG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ad1dc0-2a19-4255-739b-08d98cab34d7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 11:35:20.4656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlZWim/G8vjLEjHz2hqqgflKzdeJ9m3KAH/6BflwMN0857Jd7GTJ1v32qDIQVTlLqXmwanndLlXTthq80yeLlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6303

On 11.10.2021 13:29, Michal Orzel wrote:
> On 08.10.2021 23:46, Stefano Stabellini wrote:
>> On Fri, 8 Oct 2021, Julien Grall wrote:
>>> On Fri, 8 Oct 2021, 20:07 Andrew Cooper, <andrew.cooper3@citrix.com> wr=
ote:
>>>       On 06/10/2021 18:40, Rahul Singh wrote:
>>>       > Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XE=
N.
>>>       > Reject the use of this new flag for x86 as VPCI is not supporte=
d for
>>>       > DOMU guests for x86.
>>>       >
>>>       > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>>       > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>       > Acked-by: Christian Lindig <christian.lindig@citrix.com>
>>>
>>>       I'm afraid this logic is broken.
>>>
>>>       There's no matching feature to indicate to the toolstack whether
>>>       XEN_DOMCTL_CDF_vpci will be accepted or not.=C2=A0 The usual way =
of doing
>>>       this is with a physinfo_cap field.
>>>
>>>
>>> I am slightly puzzled by this. I am assuming you are referring to XENVE=
R_get_features which AFAICT is a stable interface. So why should we
>>> use it to describe the presence of an unstable interface?
>>>
>>>
>>>       This flag needs using in Patch 10 to reject attempts to create a =
VM with
>>>       devices when passthrough support is unavailable.
>>>
>>>
>>> May I ask why we can't rely on the hypervisor to reject the flag when s=
uitable?
>>>
>>>
>>>       Ian, for the 4.16 release, this series either needs completing wi=
th the
>>>       additional flag implemented, or this patch needs reverting to avo=
id us
>>>       shipping a broken interface.
>>>
>>>
>>> I fail to see how the interface would be broken... Would you mind to de=
scribe a bit more what could go wrong with this interface?
>>
>>
>> After chatting with Andrew on IRC, this is my understanding.
>>
>> Today if pci=3D[] is specified in the VM config file then
>> XEN_DOMCTL_CDF_vpci is added. If Xen doesn't support it, Xen returns
>> an error but libxl/xl won't be able to tell exactly why it fails. So xl
>> will end up printing a generic VM creation failure. Andrew would like to
>> see something like the following in libxl:
>>
>> if ( PCI_devices && !cap.vcpi )
>>     error("Sorry - PCI not supported")
>>
>> So that the user gets a clear informative error back rather than a
>> generic VM creation failure. Also, this is a requirement for the stable
>> hypercall interface.
>>
>>
>> I think that's fine and we can implement this request easily by adding
>> XEN_SYSCTL_PHYSCAP_vpci. Rahul or Bertrand, are you guys happy with
>> doing that? Otherwise I could take it on.
>>
>>
>> As a side note, given that PCI passthrough support is actually not yet
>> complete on ARM, we could even just do the following in xl/libxl:
>>
>> if ( PCI_devices )
>>     error("Sorry - PCI not supported")
>>
>> or temporarily remove XEN_DOMCTL_CDF_vpci until PCI passthrough gets
>> finalized.
>>
> As Rahul is on leave:
> I'm ok to introduce XEN_SYSCTL_PHYSCAP_vpci. I did the same for vpmu so i=
t's ok.
> However the problem I have is about setting this cap.
> On arm it is easy as we are not supporting vpci at the moment so the cap =
can be set to false.
> But how to deal with this cap in x86 code? I'm not familiar with x86 so I=
'm asking for advice.

As the sysctl is mainly from tool stacks to drive guests (DomU-s), I'd
set it to false for x86 as well. Roger - do you see any reason this
could be needed to express anything Dom0-related?

Jan


