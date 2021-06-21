Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DD23AE840
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 13:39:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145461.267640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvIHD-0002VP-8X; Mon, 21 Jun 2021 11:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145461.267640; Mon, 21 Jun 2021 11:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvIHD-0002T6-4r; Mon, 21 Jun 2021 11:39:39 +0000
Received: by outflank-mailman (input) for mailman id 145461;
 Mon, 21 Jun 2021 11:39:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f9W1=LP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lvIHB-0002Sz-Pr
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 11:39:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e4ae187-a617-4c8d-a929-c8b651bc30c4;
 Mon, 21 Jun 2021 11:39:36 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-7okBVBkwMeS8GEPwXFYsGg-1; Mon, 21 Jun 2021 13:39:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2607.eurprd04.prod.outlook.com (2603:10a6:800:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Mon, 21 Jun
 2021 11:39:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 11:39:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0056.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Mon, 21 Jun 2021 11:39:29 +0000
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
X-Inumbo-ID: 2e4ae187-a617-4c8d-a929-c8b651bc30c4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624275575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qVvdvaKSlEorf5ozDin6rJuLWD4MJm85bcddg6oLp0g=;
	b=fqIATg0R39+/ybRyaQtXcps/0TNAMKgeRT6iWsUa1gdBEuvSR3O94CLFdwyMSLZXbiQfCW
	opZtpVxq+y/v+IssfcTpyrj9OaIUDdpWa6DyQaUHIQBiT/WpRbOPm2yFJi+yhvDRBTr9V+
	47/2MRb5sN6+YCVFqNKVKN0dOdoKQSo=
X-MC-Unique: 7okBVBkwMeS8GEPwXFYsGg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nf06IVAOSJDPQKbqyMoN2xFWFjUnjK6xTD/QaKwweZiSaGbMpqMac+/0FCjj+rxh1XBdqMrFCp8opPPUQx2BtEz/lXujfOAOW1QaZ+IWnogVyM6OetIx2gkhdr4nqHUusEn5K/us4pULsG8R3///Ea3KolFMgcnbyrOyt1LaTyt5u3ga4EfyEI9o1lxYawX+MlPX8MwIeHzXekp+SK5vtD/hd40KzIZNUHjPwO8K9oi9lNZI5SSvfCKzC1lGn4k1VD6JWy0+CqYeOT+zfqerGFVg2uYRxeDMxId9vAklQbQG7abkafAeH4e+MyvAvcU8hm2b/vV4vDn2V5XZuxi1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2K3k6ILRqsCQVyzQYQIMug8zuW08dD6yZrRB9WIvJ0=;
 b=P/symqb/3Q4ql2LXb/6ALRJHSTSMKWL51PcVbGuw/XBL/dIqIxD9uxEp9zN8rVqzPMfRLRylnnB575TtseoZXXMtKlIyXHwW1OFev/wCq+EsB7/8Q7zLjoqhZjWfMHQD1qYQ2Cs7faYxJMhODA3Mqt3ETleJdMpX7Z0UI11+Oxmpm2WeoR4IR4aecRc9LaGYojjXKZsSVzpkrhelMDreOxOEAYHPbG39o2Z1zeVpjfn6qMfHMzf1I2odEhbLNzeJ/Q/15n0PAee9mzN7lxXCxhkwkS/+RLjL14q4EE7PHZl00wJ1rtNi6ajwCDSosTPBjM2vaNCh+YRAhyPep3MqRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: apertussolutions.com; dkim=none (message not signed)
 header.d=none;apertussolutions.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/6] xsm: enabling xsm to always be included
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-4-dpsmith@apertussolutions.com>
 <c8bd347f-cf14-8b86-81f7-51c035c5c972@suse.com>
 <ff0c9f42-f45e-e78e-35b9-c030011eed8f@apertussolutions.com>
 <6d50efc1-6c13-1481-b70c-0abfa99aa610@suse.com>
 <8a909d6b-e69c-05ce-35dd-0f6be719b5ae@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <51ca858a-b3ca-ed35-9dd3-22bf81ca12e3@suse.com>
Date: Mon, 21 Jun 2021 13:39:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <8a909d6b-e69c-05ce-35dd-0f6be719b5ae@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7f087f3-dfd2-492f-4d63-08d934a93b8f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2607:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26071D323D18CC013C944797B30A9@VI1PR0401MB2607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BlomdypqbRU8AkZZs3vr6PqP/aTC0y3SkDYJF2tMdKT6ZEeP8gvZmFOKbePEVSwAq8XNzgnCs+Ekr+PHX5oOX0kXAdZ9XoCTaVYZaj2tbMb7U2vSeAVriCCOBoWt+CGNonqLCy7dPWxtHXxuQUccmdSA4RRRVyfaQL6IEp2Ly4/36Z1MYCS1MLQh1zhQ6ndYf51btTh3r3C3QxCXp2mt2L4WYaoclQjgTwJaf0UGBEW825zrUU7x0ICUTaKV4UUenE3W0RsZ4DK6JCYQWmDYTWfXZY2+UUZJXyix5EMAolfzLNweqUh82mo6MzPq2yTEYzBvpicMVwNw8SlrlIXH22vHJPdYPblKDzrmyq7Mx2x5YUc3KJ1fbn6Y+AmpoBewuHCRgGOn8Ttd/pHbeVtG4Cskx35xbOgm+M/fOCaUy/mbZMVtE6KQL3Uv85TFkMsuqAvFdL+ccI9xbVyG9PpodfEvIczqSsFHU33aUGyXpT+slsyH31SUdsY2kibQyCIcQrdx9qf3NT3cbNoYV2fHGNA2QAdwhDOjhEuR62roJhENkCz7i1XQ/5UZZXiqCLKe2G/5z9I/muLEfYMCG9KL0Fu/Iz69cqs2QvPhgJOfneEQyXZs+xoh0ESZBJfUPzVff7UdeMv6Flcr9dYEuyhEEA/A7uL3gSKWtHWWXW5g7F0cpVtoNqxEE5YEoFczu0UD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(39850400004)(136003)(366004)(31686004)(36756003)(86362001)(186003)(8676002)(53546011)(16576012)(31696002)(7416002)(16526019)(956004)(478600001)(5660300002)(54906003)(38100700002)(8936002)(66556008)(316002)(26005)(4326008)(6916009)(6486002)(2906002)(2616005)(66476007)(83380400001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MtX0blAMwOr6Fi7DY/ZSCAug1uVRo27EjQA5099HXDdmwkOy5KyBu+DK4TVt?=
 =?us-ascii?Q?uwMvzJrmQSvKC1DAREaVfq75MKreLQiDl6DMHdDALwByoRx2Y9NK+r4+KXQr?=
 =?us-ascii?Q?7HVMWsX4KLmNTEBxHwCO7t05FXBQuSjNNjlCpSIiLTeOZHqBs9jJkE1KcvGJ?=
 =?us-ascii?Q?+cVLDomaMc5A3nuWRGa0/Qjc3UDlQDW6CE//CXDEy+bdWhhZF0XlyCWVAoZp?=
 =?us-ascii?Q?117JyLbleEE87kU4TQ6hf8FnISsa9a6Y+3vllGvOBI00RqavEpD9JPR3E8/Y?=
 =?us-ascii?Q?7FYAtic8FEwydr2FTsyqTcAi/HZ55CBf/EoZqE4lqJizDMeJfyTYoBy2Az8t?=
 =?us-ascii?Q?huNYcnFonPT0qVuaqUUaRm5XMYberTyQELogiuevydKFdFC0TcT/wRokQ9C2?=
 =?us-ascii?Q?62o9wTqlZ6h0ZedgqvVToTuhaRRU+u1/1R84T6963XkmLXDzNJoQvMvmUmXw?=
 =?us-ascii?Q?FhVBOjOaScxKLjvpXAfqSXGn/6U1bS2oSKbiRvy1TS7en6RehWETunRumAyt?=
 =?us-ascii?Q?w/CkFD5z3MmPPm8ZLESDdANMINi9CMJsdBuyLwcEdwXnC5XytOyahBOJV0v2?=
 =?us-ascii?Q?z7pfHm+QiVF7wicpFqwcJGgfIn2y3fvv7EOGekH+zn7SBa9FEiwtFhj+Bvc8?=
 =?us-ascii?Q?tDn09ALc93Af/4AwrNTO7fqfwaudJ03bIssN+u9kOrdCc7GrXZJVp4SgrK3C?=
 =?us-ascii?Q?AFXDGvEGju0TIyw6wXlA1uTf5sDc742wG67q6QFRiNVJzLvMTUbKJBKwdmDB?=
 =?us-ascii?Q?9sQgwpgcCscHECCfulSZaMDLDMpcnGtCuwSLArVYKFV94IlYnTd4l+2K6lZY?=
 =?us-ascii?Q?aplH8YwDlDJwEGxH+bjo+7tvZfKNY4VMepK8z+MKv8wBLEdH3K9DauiT4zPN?=
 =?us-ascii?Q?MYZ/N34ZBW2NXpsztCiz8h5rrdQDI14CP9Oh0dc0eDqPMRvveUbhgAFrNjrk?=
 =?us-ascii?Q?iHCfiZBGGA66fZZOnsARQj1fX63p2Wh4LdG3SWJnPH+EE8xQLpHWLZ9/BlzY?=
 =?us-ascii?Q?6/be+4PyWrks/Y6Tgs3c7THRXDs9seDT0vnYwySpyWFsrYx5goTdE6hHN7I9?=
 =?us-ascii?Q?zl+BXu1spdXPNl5/fBbBEeDjvMj7vIoViPh0sOtOvkoxJ9LcB4nnxkt9EytK?=
 =?us-ascii?Q?rBuXyn4+trFvlFZf2T4twcM7Rx3LXGgxxBlFHtiJLcD8Vplyfe0COZYMqbnN?=
 =?us-ascii?Q?OaGklhaVwSyPaeDM6kAC7atSr+r6XsWclVz2psyJSUjsPNT3Ksghb8uPmE02?=
 =?us-ascii?Q?g+TKTgWhdYHbWm0fOCfahyrCe9zOSuz7il15NxZuaNyCnQyPPQCvQypjKtx/?=
 =?us-ascii?Q?UMGrAIZRi3ITnOmc+p47GTWL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f087f3-dfd2-492f-4d63-08d934a93b8f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 11:39:30.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JcbCBbhUqrssFJl7DoUDD75V8+94UDhPLR2Ev2zxeE228Z0CYUGLmOR7OGdorXwknJ2KrRSbiQirhQzpKefsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2607

On 21.06.2021 12:41, Andrew Cooper wrote:
> On 21/06/2021 07:58, Jan Beulich wrote:
>> On 18.06.2021 22:27, Daniel P. Smith wrote:
>>> On 6/18/21 8:26 AM, Jan Beulich wrote:
>>>> On 18.06.2021 01:39, Daniel P. Smith wrote:
>>>>> The only difference between !CONFIG_XSM and CONFIG_XSM with !CONFIG_X=
SM_SILO and !CONFIG_XSM_FLASK
>>>>> is whether the XSM hooks in dummy.h are called as static inline funct=
ions or as function
>>>>> pointers to static functions. As such this commit,
>>>>>  * eliminates CONFIG_XSM
>>>> Following from what Andrew has said (including him mentioning your
>>>> changing of certain Kconfig option defaults), I'm not convinced this i=
s
>>>> a good move. This still ought to serve as the overall XSM-yes-or-no
>>>> setting. If internally you make said two variants match in behavior,
>>>> that's a different thing.
>>> Apologies that I did not express this clearly. What I was attempting to
>>> say is the fact of the matter is that there is no logical behavior
>>> difference between "XSM no" and "XSM yes with dummy policy". The only
>>> difference is the mechanics of how the dummy functions get called.
>>> Specifically via macro magic the dummy functions are either flipped int=
o
>>> static inline declarations that are then included into the code where
>>> they are invoked or the macro magic has them ending up in the dummy.c
>>> XSM module where they are wrapped in macro generated functions that are
>>> set as the functions in the dummy xsm_ops structure. Thus it is always
>>> the same logic being invoked, it is just mechanics of how you get to th=
e
>>> logic.
>> That's what I understood, really. What I dislike is the inline functions
>> going away in what we currently call !XSM.
>=20
> I'm sorry, but this is an unreasonable objection.
>=20
> The mess used to create the status quo *is* the majority reason why
> fixing/developing XSM is so hard, and why the code is so obfuscated.=C2=
=A0 To
> prove this point, how many people on this email thread realise that
> calls using XSM_HOOK offer 0 security under xsm_default_action()?
>=20
> Having xsm_default_action() forced inline isn't obviously the right move
> in the first place, and I doubt that you could even measure a
> performance difference for using real function calls.
>=20
> Even if there is a marginal performance difference, and I doubt that
> there is, performance is far less important than de-obfuscating the code
> and fixing our various security mechanisms to be first-class supported
> citizens.

What I don't understand from all you say is why you think that having
an as-if-no-XSM build configuration, without any way to switch to an
alternative model (i.e. the XSM=3Dn that we have right now), is a bad
thing. I don't mind the XSM=3Dy case getting improved, but I don't see
(yet) why it is a good thing to force this onto everyone.

Jan


