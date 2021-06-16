Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810663A9D47
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143256.264083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWJH-0000W6-5h; Wed, 16 Jun 2021 14:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143256.264083; Wed, 16 Jun 2021 14:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWJH-0000TZ-13; Wed, 16 Jun 2021 14:14:27 +0000
Received: by outflank-mailman (input) for mailman id 143256;
 Wed, 16 Jun 2021 14:14:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltWJF-0000Su-Er
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:14:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe451f7d-69d6-4e76-a4ef-2c76837cc788;
 Wed, 16 Jun 2021 14:14:23 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-SLhuHx12PT2w6btFnya4Uw-2; Wed, 16 Jun 2021 16:14:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Wed, 16 Jun
 2021 14:14:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 14:14:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P195CA0004.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Wed, 16 Jun 2021 14:14:17 +0000
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
X-Inumbo-ID: fe451f7d-69d6-4e76-a4ef-2c76837cc788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623852862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m4XZ8CwSmaHJ9zvm22v9sTxmImBIwuzWpl7px+1Svp4=;
	b=M93q78ElqrIkblPHC5CT8OsqRJhivTV4G+LOBI/9Hqo3R3vOonOKZ4nR5Sjqa1CESQ1NI7
	eIk0DeET6YIBUPH+0bYezAvzgCx9f9rqQF3LY2erwWn9OrZLoOC6Q1RZM18tLxocoN7agj
	UIH+OAVRoOM2W6vaBOVte3IKK+dbdJo=
X-MC-Unique: SLhuHx12PT2w6btFnya4Uw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRElto/ZisgzpoUO14o1GrsioCGUFnLecs1EQ0+FxoWQwSKQ3kPQSBmZ/4ErIE1YTHIwT2XFw6COnGYP5DdjQ4kSq9fisJhTjLZ5bacWFEPuOIN8dhBQcp39POYHI3ht1jFuWNKrvQnPPysTZKZQlF4+vAQqdQ2UXsbz/mHDz206+fA04RmuCL6FRG3NmU9ccjaf9hb9CI5NB+8ichGmUs6IIT1sae6r3Hjc115bpPv3+mOhTp3Jd5r2H4tPVzbKkNG+5bH2pUXnqwtUOPFbJaCrDQWghraEVADZoC/vvUEfZab1ZTQkWPrrdUAQ5fTiGg/h95VZhSnWH52bWjr50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2tpvVs5LBonr6F4loQtC2jEdHbJJ3jKJIJ2pWSo1qw=;
 b=ZXV5mzueSi1hp3eQuwVx19rr5yii74dtTcbXiIXss3+0OYPDnU7zligMQOuacdGPaNK78SGwaF9VI1V00vuyFqo56QbONxV7ybyuuUATtAIPt/nQ5XEqeBiLzMTZeAO1C0td7ymFeulg9PoKnyyP+Vg24wMz1srPaANCPAv7Z066lBwEdpFTEgJQxLUVCQU61NB2VBhDxq+SqgAMUdQtJpxDe7NJ038fOf4MrZtBdjUIpwK75Vi7YvBxJdka9kbcDHzNI4wgLSBs4dA1pjtq8aumJFRofLY56OsRgaRKYsAWaSlnG+Ib5e66axvteamZrxzYJ2F3D1v+owlLwKS/xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 0/5] tools/tests: More cleanup for automation improvements
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210615161905.9831-1-andrew.cooper3@citrix.com>
 <5b0de61c-0276-cf06-4eeb-cda9ca990940@suse.com>
 <5f786fa7-80eb-ea66-3fbc-2b556c1d3a73@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5f44c856-635c-cf46-2504-75451b1abac4@suse.com>
Date: Wed, 16 Jun 2021 16:14:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <5f786fa7-80eb-ea66-3fbc-2b556c1d3a73@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM9P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe60a59f-6d90-4693-f234-08d930d1073f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2334E8BE4E5CEC964E2F8F67B30F9@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	khX7C8kM6nHyrJat9LzE/A9FpX3aG+YlXX5tqgaIzy041Kdq3zZu1XB8QBTGSOVEflX/z+SASGrssPcEUjK+jxsmZomJrrc7wE61tmg9Wqw6VvfltWlVduxpcahWBBwo+rofzsi7SdOwjEHgc+73+ggU1aAzBHYb1eiFXNF6S1RuVlAq7HbJtthtcqzVDsi2Cs4bVZL82JQ/+haHqTghyUNttr1I/pHuOMpvyorHP/24qp0oEp9uWp9IXq0kqzwLG6f/h5jUVAYErO+RJ0jbxhsRmO1FM5y8fDJpd1HG5rbHGV6HDGbbp62EXbUcxLnZnBWhHDqDhvmcduNdiMfpbGZ4ahmdJZrgklG32iksPJGsqH9vajfiM2txn3kHrHwcwaSL4bCwaKhGLNQkINL/Zac3bhnb8jkR7R+i3xtmxxcpYVFAHClIlXXbg6BZTJ/QKkqwBa3zopaeGzk3mYBo4nvwsC9RrETz0Xryi50Wo9Nurd+F9vK/kbU/awRMabDpov51DcO/W1n7cEOIVN6RxsPHkrctRJzcv4XZwsXJxKF7R+FY+Rt9wMV0jGBtmXnaZbsqqXHtQfMMXa/lbEFaJ8qGkkFrj/Kn8K+w/VNRL4JP2agELsrjBTVl+CFGhbU62GLwVpw8mlf53/2I11VoS33nIOe42ZewlpByzjGY6L2NrmEqaXkoNDI0JauP+e83
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(396003)(366004)(39860400002)(376002)(956004)(31686004)(83380400001)(2616005)(86362001)(16576012)(316002)(6916009)(478600001)(8676002)(8936002)(54906003)(36756003)(31696002)(2906002)(5660300002)(26005)(6486002)(53546011)(4326008)(38100700002)(16526019)(186003)(66556008)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+fpOuI9oqcacwn+AJGqaZrLwKxBWFHuaUbZ7BeWA5jYbzzHp/trsAlbPIJri?=
 =?us-ascii?Q?yIu6i7StUu8/MW1d0IKuGYK2+6yoCgohAuU/YohGUzAdiIw7R1EEJak3yR8F?=
 =?us-ascii?Q?47CwNbNf5F++JspPQH1IuB6rM0cI7MZe1iLVt9t07w0B1be6D8OYqD76QmKt?=
 =?us-ascii?Q?mSqNWU8YtQnJ7+n8xvZS6ovcZ8Az6qLIg/oE3Wwfabyz31l0sU97u9PJDLrM?=
 =?us-ascii?Q?z3kYs41qDhY2UaC2HaaisJkz/kQb4LSbFRkjojbHE33al59p6pYdeCQ/UiVm?=
 =?us-ascii?Q?qbqIjR0tC/WsdR6FEVljFvPwJa7WTnHvCbMlPDoz3TUbepAmfTtyrl411YCn?=
 =?us-ascii?Q?dTJT9py4cD4r5ub7ozb5pT4Zk5J2GsCEEiPuXC4aJe1nWGKaOJ/ugWWfAtsO?=
 =?us-ascii?Q?YJeaRtt8YaMmst1NuN74NDDhuH2vyIjcGo2KeNQxSXdXYAIa7eiBrz/EyH9B?=
 =?us-ascii?Q?jlNysxa6hTm70D1r66aOccUONufmVmQBP1JkNSofoE3bErGiOUAqkddgqqXn?=
 =?us-ascii?Q?V/spmKYBnFhMoULW+VBcpzartFpmGLa/ymZRT60rvYn8Gv9ejEY9qtNb3Xgh?=
 =?us-ascii?Q?2/eozf4B/Iw0JKxxjCYKUTzDK/fygrm+P0h6Qg2oqqetixFvOaxKG87MHEcc?=
 =?us-ascii?Q?WeSxujdjFurx9Iv4Xa4ySL710NWoZ3ywhh3c6W3S7M0nbqdPrExNMxwsw+pp?=
 =?us-ascii?Q?q7cKXtnbmrMei51kzcT84jblbZ9pwJxNTaeOTOfQd5G3h885mo5eJXgU6lq2?=
 =?us-ascii?Q?ybABJGgPcUkbSeSwCSIlUKNQ41e1/M50biPaFOp1VdRJ+rzjgqrdDxkPz0DO?=
 =?us-ascii?Q?FiNdTvNxqSjFy/quAJzNM29L+E7sD2O0QmwGnG+vB90ISm7//aufF6Z3IMSb?=
 =?us-ascii?Q?OwdfnEhONfxZ2TSUNvfwZtvgyUOzJQzqmB8VGwmJzYlw7hBVFUdmqNo8vFLo?=
 =?us-ascii?Q?sqmwqs7JTb1kRDdTY1HKI9uvpI8pEHpAO8B7Q5oBAjkjfzKi+UP/0K00ros5?=
 =?us-ascii?Q?uR1w8CXcmzKvkbQNBq7oxy8G77IEmVLsyS7awEjXPLjR6J4eK5GPi95MJ+hj?=
 =?us-ascii?Q?egBgxyFhqxcWZb1qwF80pBWWIOe9VaxaImsDc1cb7x+hKaD+jDmJo/J6JZ+P?=
 =?us-ascii?Q?7tdOIUHQnLnGW/wcx2xaGgguTErNIAtcMC1pQ7fYRDL1eqREs4lyz+2vjaDY?=
 =?us-ascii?Q?6ajqPll3zZQMo+wXX14xc07+Q6F5pCGMJsfOMZRTYbbGxdxiB+HhPNzfLZsJ?=
 =?us-ascii?Q?rfdx7NvJpY4+yLmnOonKM7BbOoZXnvjKywfhy3HGPYGFi/2AIciWtu0gRqfv?=
 =?us-ascii?Q?fpgs/Zj5fXvjkfdGtR+DOOzh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe60a59f-6d90-4693-f234-08d930d1073f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 14:14:17.8314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmfAPUxmzVXCuUN+UmqsypomZ2a8uvmgKBGZNnFwBh7aQVEcKTz9CaqFEFyBAs/0Ze7eiI9yt+hQ3yO/WK+DMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334

On 16.06.2021 15:22, Andrew Cooper wrote:
> On 16/06/2021 07:38, Jan Beulich wrote:
>> On 15.06.2021 18:19, Andrew Cooper wrote:
>>> Jan/Roger: x86_emulator and vpci use $(HOSTCC) not $(CC).  While they a=
re unit
>>> tests, we still potentially want to run them in dom0 rather than the bu=
ild
>>> environment - particularly for x86_emulator which is heavily CPUID base=
d and
>>> wants to run on a wide set of hardware.  Any issues moving them off $(H=
OSTCC)?
>> Well, yes, I'm afraid: If anything, we may need to build two binaries,
>> or build the one binary two different ways: The "run" (and "run32" for
>> the emulator harness) target wants a binary built with HOSTCC. The
>> install target (which prior to your series does nothing) indeed wants
>> building with CC. So maybe we want something like
>>
>> install: HOSTCC:=3D$(CC)
>>
>> plus suitable detection of whether the opposite set of objects are
>> presently in the build area, requiring a full rebuild? (Of course this
>> will work only as long as HOSTCC isn't used for any build time helper
>> binaries. See "x86emul: test AMX insns" for when this starts not to be
>> the case anymore for the emulator harness. So we'd need yet another
>> variable to express this detail.)
>=20
> Having slept on the problem overnight, I'm going to argue that HOSTCC is
> conceptually wrong to use here in the first place.
>=20
> In an arm64 environment, cross-compiling x86_64, this will explode
> everywhere, and the fault is with using HOSTCC rather than CC.

In principle, if there wasn't the massive amount of inline assembly,
and if the emulator wasn't just re-executing the instructions it is
asked to emulate, building all of this on Arm ought to be possible.
But with the code we have this simply makes no sense.

> HOSTCC is specifically for compiling utilities executed as part of the
> build.=C2=A0 Tests, and particularly arch-specific ones like x86_emulate,=
 are
> not in this category.

Hmm, right now they definitely are. Running them directly (which is
their only purpose right now, with the install targets doing nothing)
from the build tree puts them into this category. But they aren't
anymore as soon as you want to install them. Hence the need to have
two modes here.

>=C2=A0 Whether you happen to be able to run
> test_x86_emulator in the build environment is a property of whether
> you're cross-compiling.

In a way, yes. I'd consider the run32 target to also be cross-like,
yet that binary can then still be run from the build tree (if the
distro supports 32-bit binaries).

> For a non-cross-compiled builds, HOSTCC and CC are largely
> interchangeable, and won't impact the ability to run the binary in the
> build environment.

Not exactly, I think. If I override CC but not HOSTCC (which I do
normally), I still don't need to worry about that other CC finding
all the bits and pieces it needs for building a host binary. For the
C compiler this may not mean much, but the C++ compiler (if we used
it and hence would need to treat it similarly) wants e.g. its own
copies of the headers, which may not be readily available. I will
admit that my environment may be pretty non-standard, as I run non-
default compilers (and binutils) also directly from their build
trees. But things have been working fine this way for all sorts of
projects, so I expect the test harness here to not break in this
regard.

Jan


