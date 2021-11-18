Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A07045584D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 10:51:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227279.393055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mne47-0003Ve-V4; Thu, 18 Nov 2021 09:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227279.393055; Thu, 18 Nov 2021 09:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mne47-0003T1-RZ; Thu, 18 Nov 2021 09:50:47 +0000
Received: by outflank-mailman (input) for mailman id 227279;
 Thu, 18 Nov 2021 09:50:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mne46-0003Sv-FQ
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 09:50:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fff42ef5-4854-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 10:50:45 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-2JGwg5f2MZ-ZrUeLAs50pw-1; Thu, 18 Nov 2021 10:50:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4607.eurprd04.prod.outlook.com (2603:10a6:803:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 09:50:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 09:50:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:20b:92::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 09:50:41 +0000
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
X-Inumbo-ID: fff42ef5-4854-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637229044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1s1bnXHQ/U7mDJtAs3ALO5YczkL9zL9jPw0QJijRaaU=;
	b=j/PtJJt+GuQAMZ+LBmUyY7sBhesUqH+6pSvtIp4P2lkGD6aZ+A0qN+vUTrxKnFBRrlc0YK
	c49pdGz3CCT0f42mnl95OJWMGwRTmOYg3z34dkEQx11j6bSceZoY6tUj0f0XC0BVTu9bos
	ZoH9gNEk4OsGmoihj8fLfNtKnJEVBKc=
X-MC-Unique: 2JGwg5f2MZ-ZrUeLAs50pw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfFCGRqL4+SqTifRbis6dh9KH+ZoI0SIxqnFUokiL9jiC29UVZId9fCdAR/pK7vmpqPzM38zRI/7i9plCL6b323Gyv7o2yLfq6GS3S5M1N04iHxq/l+h+wtxBsbJa/BPyoRbTeHBCKNUZLv4xT3rDkimrA4pGdV2+kYOMKU9bGbLU80BMTXPwdWUuO7p1fL0fRePbIq5QXT5D0JGS6jX2VZY/jddzXrRd4VQvcaL/nZStqgUdHyhQ8ypxbX2jEm8/ffaPDps8Vki8mhcG8Ar1icvwG8itxIorAm9/TDCFqoa0BLX3Z+mTWMMuDrY69tMMrDH3njrQfv+Qd7ntEsIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKJFd/BdYdio66y0jSOGBawJmr1iTWg0b1pZ60kB3eo=;
 b=e0XFj2ESi2PdIyE4uR9t3kxFx6bMs77GCfyZc4AZ0CGJFV7njYFd9YRGbsSBnXtipqwM7ZeQFlHVGeOQAtMQHKhc5G9L2DbezX7i2y/n85cczMIdraCg8v6L9YdfwclG47P2Bvwjrs3BLwmgDkikMIA6bx1Q0UIWmg72dbYQZRnT0iQ9lmwGSaF4muqvzqK8/WG/06G+N2V9TfZxVgJ1C7gXZBimpyajPRXUkb7hPEMTWXH1VuOmCJdHj+2pQwk54L+PPLHwK2Jq+XzOJBUZFrQYtCTXvS7uNzfHtA3B2cU9HlQ6ouJXcqWljctWPlDzb7WslCnJqQQNtKwIxpca2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9071e678-5d3a-739d-1657-dc8c16183bdc@suse.com>
Date: Thu, 18 Nov 2021 10:50:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16] x86/passthrough: Fix hvm_gsi_eoi() build with
 GCC 12
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
 <77acd9ab-1bf0-cc02-3865-bf9844b3eae2@suse.com>
 <24962.46376.136195.463274@mariner.uk.xensource.com>
 <1950ed44-5b0f-bdad-75f9-b91c66d95fdd@suse.com>
 <67d7cf93-2860-f8f1-9de7-932da7f537e0@citrix.com>
 <2051641d-17f4-07ee-9db2-0234e6ce4c70@suse.com>
 <YZYP3BpugHwOhNuV@Air-de-Roger>
 <def0133b-9eb2-44cd-33c3-39c9d0dca9f4@suse.com>
 <YZYeQ7/feMBrTFSu@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YZYeQ7/feMBrTFSu@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0029.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 328f5907-5b0c-45f5-6644-08d9aa78e22b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4607:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46074BEA9E35488492A6216FB39B9@VI1PR04MB4607.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KRTr04N7h+mIwfIkM/Kd5lrkj9EvvGDcbhKEfKScjFwHKvNvHRM5mi4Pgr4Q7b9PbnddGkeFW0sjzZ9YOh3lq/WWFOLJ72KFPQgQMO1i0vKCKSS6HeCqvFoTvUYiHtYh2p0e7NiS/W8FfeRvQJyaRUyECbfGIAZ2kB8JapriG5LdYQXGOYckbohhGQNKOEDVPiN7DdirwnJKnZFdu2HVrnPxaKL22OiaQWKtM9ffL+xtPC1gk2TdvvPdEtS/xlrGZx1JVHPWqdCTKdMfawBTn9AqVgO2qeGFsg1W7mdwbdqilEaELWZ93PZ6b4RA7hwh+FeoKZy17xz5wmrtwp4Owh48IaEOE8r9bjiNsjqr9Zh8jTEv0SOLiZH+xxT277cC4VOPB/z0PBsNmwqRE8tqmR+npIxnq8y9HsJ9b4RQ6ZD59wj1aFSlxoaJZqr6f6Bq5zZ1d9kyBvdv4ow/i2UlWn1GHyY3ShKypqI06nHUXq0B/3yRVyyNAaeapL1sgaPPjD8t+iIPEewcas+BBX5PgXjUAtYwr5gdZJdm5O6OpUi1ej1+MmDIYRVN8gOxpASM3iD2pIzsnEzCrWHBLMb83dRCQ6jmspFTtQUMZRP7LXn0LjZ01V0bfheUqsJB0EN32WkfmhSuegvyZcvWwpRgxdGIi6ykFcuLQwhfhpo+RUvJIsLDQnV8E5ad/bjDDciqIO6Mwj9q3+Zt0wzy3FltAi0tbHdJYCkDpvwcAu9z7xkPtLGrXyQUXxJMyY0Gs/PolCsmKeSIY62cXEZ+7W90XvCA2lMQ2+7EDzr7EN+nrrvjutJ0JyIajQh+l82yZQhDW4FbkUhpcOrou3k8dAUPWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(16576012)(186003)(4326008)(54906003)(2616005)(66556008)(8676002)(8936002)(5660300002)(36756003)(508600001)(2906002)(66476007)(966005)(6486002)(86362001)(956004)(31696002)(26005)(38100700002)(53546011)(6916009)(66946007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V9rP76q1Oj0FGRHnZevBMhsEShQ32RrK1ug+wdQqE+dIPTY7N7C6LFdii+jV?=
 =?us-ascii?Q?d16qPnGV2nNtL7XqXpZHrzuUUif1WWzJ+XyyVmZyGADZbBlKkgT8KTs960ol?=
 =?us-ascii?Q?dEzcbCIvO4wXW26QCUcwYDfGoINleTcwsYN2AX9PcXWNXC17oDsjdw4PrcTw?=
 =?us-ascii?Q?PNK/f3oYA2EbjDdhLiWYlAnX8nKDr8TFVg0C2GGQfuD+V1bF0ELQc5fTFfcm?=
 =?us-ascii?Q?AmnkPhp0814hm1Ui7K2fJuUUragCYJeLQRpFohXxfwZvjA9SjZwbGTLxqwTD?=
 =?us-ascii?Q?Lg8KoZYJATBsG3CwCE+fwu40ZJpxctnis5mtJ186A0vso6q80XE3YPhcchtr?=
 =?us-ascii?Q?AlOBQY/ukIN2Th0bho9BLXyckzEcld9+iwcxOF9IuqiUTZauYL/PGSmrl6I9?=
 =?us-ascii?Q?qLV2jIPzGBU0vvkeEWmSf74V6FALAnLPbeQeKv/+v59gSCjAqnzN8hqUFzF/?=
 =?us-ascii?Q?HpkkKALycZ4rl74awT8QHhqf5f3EEtU6kjlwuGf03t+YeRQrwAAEOnFDReUb?=
 =?us-ascii?Q?Ri/BnvZBL1S0GGL4whR4CJOMa8uzWI1qFM2zuryleVT0h3On1JLpAMWXn0hS?=
 =?us-ascii?Q?FlxJDnl1VxzV4KCHNLoCvbanHMKEbrtR4pYASdFOZa90O36gixhnRooWOoJA?=
 =?us-ascii?Q?3kav9iGLq3GOOJKZSFOmfZBTEPsWKD6eHTAUCS6auelc1FmAvlxMilqSuuXR?=
 =?us-ascii?Q?42IgbtZGIxUQxvRKTxxIOkVVBQCFdhIzLj0gZYLkXCO4OtXZkkXS1uKsLpiE?=
 =?us-ascii?Q?oeyL3BLGM09qS3dZ5vf1TyJ6xA82kzMvoe6/CFOu6KsGZOq1JElMvbCx5tFo?=
 =?us-ascii?Q?my7gvEA32Bz6t4wWPfq7N8SY6E6Yn4VGZ4UqdCV2BgGGxUHk9vFRABfiJ8sa?=
 =?us-ascii?Q?CC1+1K3mSGviIpHRTVnXp6LrJrBpbxQ5pAYXFb6U7drGP0lNHtgXvFsujElU?=
 =?us-ascii?Q?3yZisuokY2moQhXXp0BN3BDInyZzhNO9wlEPU5H3l5HHuvmr6dwsBgRCJvJD?=
 =?us-ascii?Q?XKiJ57X9RTqYMZWtHww6JsfDOItc8/EP+9zgV3bqp+TkRSRyOPPwnADL5vO7?=
 =?us-ascii?Q?+TuuuwRz3SVh7GHO4HN38VSbMpdEB35HQVoI4Q4d9HYtOSg7aM5vYB1pfoFH?=
 =?us-ascii?Q?Y9HPQj3RKN/Y29YLJYTaNPyfsJRHecgtiMw/w5qDz4hPsTZy307fHaIhlY6f?=
 =?us-ascii?Q?EPDGeem1KAAasdqysKN4F4Mql70HYfviAVhrjmlWlIcH2/v6157d3r2T+Ys4?=
 =?us-ascii?Q?2csNCDD54verrjtHJwqKFtBeTQdVUA8WuFlJDsyXNEm07xjHzN5K6D6zz55M?=
 =?us-ascii?Q?yhr3Y9D2DssyroP/ryhQbDU+JZfZwoPCn2qTnmxfck3vJgX/wsmonUrAtA/E?=
 =?us-ascii?Q?z5NYGGU59ZmeXvwkUKsOmLGOiDxd3KWTY6i5gBhEQVggKuuve2LrnqnU9t07?=
 =?us-ascii?Q?RaDEYIlzWIBveC69z13r2Nt1iy+rhsxm8QaeyCfk5rMR09dlTThcoGAQr54L?=
 =?us-ascii?Q?ccUgdD7MpcRYJOmy4pCCPmIOiEZM7R3hzSwEJPk9ldInoYQCy3m1sIgfVat0?=
 =?us-ascii?Q?yztoB7sEVKj2+i32uckmgdANWuVWgyn3gfGmeppCcqTXmxA1CTszCSW7i7QL?=
 =?us-ascii?Q?Wk2FmhZ/Dw2PvAgIr4SA9us=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328f5907-5b0c-45f5-6644-08d9aa78e22b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 09:50:41.7847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbnKSm6boXVfnjmu3Y51+fCACGeekGs5n6sKmUZRC4RKlIK9jjYdI7wXx+cbCuPzIhIA4vO28uOMK9A2wTBTMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4607

On 18.11.2021 10:34, Roger Pau Monn=C3=A9 wrote:
> On Thu, Nov 18, 2021 at 09:51:52AM +0100, Jan Beulich wrote:
>> On 18.11.2021 09:33, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Nov 04, 2021 at 01:17:53PM +0100, Jan Beulich wrote:
>>>> On 04.11.2021 11:48, Andrew Cooper wrote:
>>>>> If your answer is "well actually, we didn't mean to say 'if a GSI is
>>>>> mapped' in the comment, and here's a different predicate which actual=
ly
>>>>> inspects the state of a dpci object for validity", then fine -=C2=A0 =
that
>>>>> will shut the compiler up because you're no longer checking for the
>>>>> NULLness of a pointer to a sub-object of a non-NULL pointer, but that=
's
>>>>> a bugfix which needs backporting several releases too.
>>>>>
>>>>> The current logic is not correct, and does not become correct by tryi=
ng
>>>>> pass blame to the compiler.
>>>>
>>>> I have yet to understand in which way you deem the current logic to no=
t
>>>> be correct. I'm sorry for being dense.
>>>>
>>>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D102967 is the GCC bug,=
 but
>>>>> the result of it was them persuading me that the diagnostic was
>>>>> legitimate, even if currently expressed badly.=C2=A0 They've agreed t=
o fix
>>>>> how it is expressed, but I doubt you'll persuade them that the trigge=
r
>>>>> for the diagnostic in the first place was wrong.
>>>>
>>>> Well, thanks for the pointer in any event. I've commented there as wel=
l.
>>>
>>> Did we get any resolution out of this?
>>
>> I don't think we did. I'm still struggling to understand Andrew's way
>> of thinking.
>=20
> What about the GCC bug report?
>=20
> Ultimately we need GCC people to make the check less restrictive or we
> need a way to rework the code in a way that doesn't trigger it, either
> Andrew's proposal or something else.
>=20
>>> It would be good IMO if we could build out of the box with GCC 12
>>> instead of having to backport fixes later on.
>>
>> I guess gcc12 is too far from getting released that there could be any
>> guarantee for no further issues to get exposed by that point. It has
>> also been common for us to backport fixes and workarounds when new
>> compiler versions appear.
>>
>> I could agree to being proactive if the change to make to our code was
>> uncontroversial.
>=20
> OK, but unless GCC changes their mind we are likely to have this
> conversation again in the future, so we might be just delaying the
> inevitable.

Yes, but we apparently need time to settle on how to work around the
issue. I was actually surprised Andrew was able to talk you into
going the chosen route despite your open-coding concerns, which I
share. In the course of the discussion at least one alternative
approach was already outlined, iirc.

Jan


