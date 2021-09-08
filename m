Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2A3403733
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:44:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181589.328768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNu7m-000681-9Y; Wed, 08 Sep 2021 09:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181589.328768; Wed, 08 Sep 2021 09:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNu7m-00066D-5Q; Wed, 08 Sep 2021 09:44:10 +0000
Received: by outflank-mailman (input) for mailman id 181589;
 Wed, 08 Sep 2021 09:44:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNu7j-000667-UA
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:44:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ecf7292-1089-11ec-b148-12813bfff9fa;
 Wed, 08 Sep 2021 09:44:06 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-p9xAwkobOOqALHL89s1eNQ-1; Wed, 08 Sep 2021 11:44:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 09:44:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 09:44:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0068.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.15 via Frontend Transport; Wed, 8 Sep 2021 09:44:02 +0000
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
X-Inumbo-ID: 4ecf7292-1089-11ec-b148-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631094245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kYrUvTDOaeHXOQl4F+JcjOpNIyGdYKlDiKPxbowcl2Q=;
	b=feUUomu7lNjCrsNgveMuY2HAId1KSTSKsvN18F6z3MPJQv9RtHP2w9RkVvv7cp6VTCKyw8
	NTRTEupg6LIkaKhZn+w8B75Xn3dFosjASbMPkeBFb6h6LB9UIBHUQRuR9PUbstKLIkAyS+
	ixBKx5BKzR46tWvUrjQuoX0lulsaLNo=
X-MC-Unique: p9xAwkobOOqALHL89s1eNQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJzrp2WC8FcsRVS8SkRMENAVVyAVepLuQEYpi0uJq/6kBn/A58CkoIJG3FU2Ih1QGci+m2N7d9E39kblkCVpAhbIwc78e1V6odyOSR8mwNrPzko7DGr0Fpo3rM9lnBNQqp30e2sS9XT2iwQiHuh1wPXeX6cz2XGaWhlElchc1xMW707wazzOT0PqfZlqME9YcFfJWiJVKKJ2GYfuho4LVpoIzOreS8sft4RHzhDoxp2lbyPwe8ExAj4zeQqKC03oFuu0guFfG+Uz+Ir55gEUGPF5yEKeDE0pxKvN2AqpVu2jnwo7cFOHEGC4aU4+W9UvQFh8rzay2sovj90Zh1F1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4/2nMHtwUkwOJeNn+c/1PSvVLkll4mq/pLnUB8brkF0=;
 b=TK4azVDcKoNqk8E2/AF/Nqek1lbq6kfowYhzQaSDjciL7rGFCp8jaZDCmWpuF5hA25QCGlNiZL8qEm3pYXc2EK581BKcp4bhFGPyxQHX+9rHNCLaXJ7jFS3QfB9X0quKEenvL2ZZmjDmf/4EmEjdeTumUIdj/G2WdXN+mgwyuAm0mBONrRj4kJXXVtBWCeFxhjp2LqqXl+tncTkKMs4GwYm7rkOWzMB51QFJMVZFnjb3oKyROu91xmrebvmZIO1iX6IvNIggbvheChJSJmAwmyOEC4joASdjndhHN4+MJxMhtv0w2HH4sSewcG9RLDMO+iqPhkC9SozLgWnRpaGByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 07/17] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
 <5d6e8360-7ba8-487e-0ac8-7f517e560520@suse.com>
 <42aa8c24-7f23-deec-6103-f2d556e4a9f9@citrix.com>
 <b3db56ae-7a53-ee22-d821-d711b0d0bf3b@suse.com>
 <3f9722e4-704b-8f68-553d-04a3a3189d99@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <48f43552-d657-2600-4503-2eb8626c114e@suse.com>
Date: Wed, 8 Sep 2021 11:44:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <3f9722e4-704b-8f68-553d-04a3a3189d99@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0068.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c9c3f30-2682-4ba7-965c-08d972ad30fb
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB329527837FF767C36362E4B9B3D49@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z6f2bVMSSQty+iXoyRJThmGihcrlm+t8aA2pMwzhLEQe8jONW1ZtdA6n7p8I1+sbcK7BTkzhgLcyKT+E2qHRxBH90PyHMHOOMVeRpm1Q9Ilm57lR6hst9MoGRD08cnzwg1fuqKbFSwDSo3QwSQXVPlTX9FV2p7Fzi/zlQSSZG7Bs0tWrkI2z7aIOhuGXr7TQ6DOiNfLajqz8MWFpnfYBO1hGifZiu2ghk7mlOI5WEIadgfio3116XPV6ebiEuj+wekxpIKM0C445ivi8RsuPNCiVxYg4NDqDPXknoIE4AKbhQopwP6+tW+jpvCCb0orL37k/mqzSrWHV6KH1g579fToUoW3QnTFseKjPgL4ZlyvZmpcIobz4vPSgpGnj1DUpqmlTmeol3ggimm7EqMBjgOgq59oHSMJ7xMu53UANHHyri8zCo8JKwkijrjcnwNQjUiddF7kT3xXcYeGVI8/l7hVWC/VOSfdXkYKrEVB9LPMWoZ4uG3uG0M+5BF9tgid5mTLx1q1dVkx+a4WcEjdv5YjE+Z0byyW4v1kwfzn+PdBN4AE7lfDIJkK+KeBa/18JQIqMFpLs9HBPuaXiRv+E1hzB/0EeAK+8NCErCmywvcGwBuuWJzAYq1FfL5a5xE6AoHl3wxQzUBOOqybqqDqIjKkJEOjRW14No/jsisiNcYsFU3AFkJObwcDJx3wrLtUbbuTowYnp5BNJ29yFQbEQUnmMydstocqWpSmDKg2MMK3dx7v6z4eMJwFq/V3aXJu0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(346002)(136003)(366004)(396003)(6486002)(66946007)(66556008)(8676002)(478600001)(66476007)(8936002)(16576012)(186003)(5660300002)(26005)(53546011)(6916009)(316002)(83380400001)(2906002)(36756003)(86362001)(4326008)(956004)(2616005)(54906003)(31696002)(31686004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kWy3ul4G50CaOH1coO17a3tayFqEtOE5213/ciXaCzmjtHnhWoo4fS3fDnAh?=
 =?us-ascii?Q?4xi5EpAkw89Npwu9KiIkRNty55IQHvKL2N2dizfCY50klTryLaoQRAeX2xqC?=
 =?us-ascii?Q?6SOMRypl1OC8V+eipSBeXl5tm0Y4dy0HsWEKKjQVCVTiA2AyMtloRoLIyjd1?=
 =?us-ascii?Q?bgwXjZma1YG/3fHfMOOYSaMM+ysgZcux+bQ2xTYcyhJkvww0ILYE7yVBNaSh?=
 =?us-ascii?Q?FFupOutZV8O37vy3IutbSxvKxX+LicCgqnhgkqoXD7N4vpZmuDVgZna+q094?=
 =?us-ascii?Q?4kXMpScei1kIeVkgWTJCvDwBWuKHjxoNX7o7CWxSk112JziKJb582B+YdbPt?=
 =?us-ascii?Q?aoLQQokwopjy19f0l1FNR28et/ZQXmDFlwKjQMXuGKEcd4BK7i2pzhr61JjC?=
 =?us-ascii?Q?rz8oEyrdAEkNyjlPXyfBPBgqUuPSCx1qhFSfjSPSy2XyMfAMQ0k5okz2TZ9U?=
 =?us-ascii?Q?Ecm4jvrRxa/c98Am49kfdtWTCk+8M1m2YXiAC8aWfXnOF5lw5N4wA5s0EK/X?=
 =?us-ascii?Q?nx8rAj5tHRy7L/HON+ne6aPkTgMidTK2UdAuOQ5IuqkJRmHrnvA/6E+/KUJH?=
 =?us-ascii?Q?FNBDdvGWzdjdZDKTLYqlV/3yr5IO0hsz8L7l1Aq+0AbhrV1W1vUmyEPNZysP?=
 =?us-ascii?Q?mx0SZPFqJqkznH9lg9yBHZw1xgu3OtrFgEOgdnDoKb8rvtr4ui0EY4pjWKEd?=
 =?us-ascii?Q?TrbOd4fby2aAsEpBSVIz1CrYgx1jshvovgbQruDT+R/7iwciL9x7aVEeIP40?=
 =?us-ascii?Q?QOQeJ7DKULoA6PU79Zn8ycOZjzLQ4+d2TKJUR4xgH+o0KNtdZelLvRR5XmPS?=
 =?us-ascii?Q?PKzkVyVoXUAdq8rT2DC0K4cNL3bPjYPG6ptlm63yTLYEx+fcHCddpqH5UYkS?=
 =?us-ascii?Q?a+4W5EVFNCVWcR1Tnn9zSQ7SunjWOyuLtIt8JI/i4d8dfn64ArwJG2yJveTK?=
 =?us-ascii?Q?n6DZUobRtznEN9In4160nicoshpSWTLsZrrWkh46C9SdpYLVPDZ2QsmOQWeZ?=
 =?us-ascii?Q?0pAgj78To40BHVkzbRFFpZSOQwSdofk2cWTTEjj+nLGh38swEb5gCmy/H9oK?=
 =?us-ascii?Q?k5S+Rlh7/hNMtQJD0YNBxx3xvPhpvFpkeTWYfJSeIPtrx8F4+FEMzxqDxtkO?=
 =?us-ascii?Q?iB+Of2q1MfV2qkxGGmX8yt1KpWbqIZ7YY1lciCPiP2yHxKlWM7v1OspDuw3M?=
 =?us-ascii?Q?v60VivGNEqY7Z4tgD68jrbiuLxIWYW3RwFXKx6AdqFpixCOsL6imrFujfk4Y?=
 =?us-ascii?Q?nUCDgtTPT57jqIq66/GOTFkxK3ilLKbgOp5ojrURUlIDyWKRn0PmGQPQJHUg?=
 =?us-ascii?Q?xcfF1TiQrbdNRzxNseMt5VMK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9c3f30-2682-4ba7-965c-08d972ad30fb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 09:44:02.7618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgGpkXU43xWi461PK6q93CfMyXXMXdtuRVt9vSnjyDIlnywiyC2gfmS70q0m0dbD3tj3jHgPnure0OebRW3O8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 07.09.2021 19:13, Andrew Cooper wrote:
> On 26/08/2021 13:55, Jan Beulich wrote:
>> On 26.08.2021 13:57, Andrew Cooper wrote:
>>> On 24/08/2021 15:21, Jan Beulich wrote:
>>>> While already the case for PVH, there's no reason to treat PV
>>>> differently here, though of course the addresses get taken from anothe=
r
>>>> source in this case. Except that, to match CPU side mappings, by defau=
lt
>>>> we permit r/o ones. This then also means we now deal consistently with
>>>> IO-APICs whose MMIO is or is not covered by E820 reserved regions.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Why do we give PV dom0 a mapping of the IO-APIC?=C2=A0 Having thought a=
bout
>>> it, it cannot possibly be usable.
>>>
>>> IO-APICs use a indirect window, and Xen doesn't perform any
>>> write-emulation (that I can see), so the guest can't even read the data
>>> register and work out which register it represents.=C2=A0 It also can't=
 do an
>>> atomic 64bit read across the index and data registers, as that is
>>> explicitly undefined behaviour in the IO-APIC spec.
>>>
>>> On the other hand, we do have PHYSDEVOP_apic_{read,write} which, despit=
e
>>> the name, is for the IO-APIC not the LAPIC, and I bet these hypercalls
>>> where introduced upon discovering that a read-only mapping of the
>>> IO-APIC it totally useless.
>>>
>>> I think we can safely not expose the IO-APICs to PV dom0 at all, which
>>> simplifies the memory handling further.
>> The reason we do expose it r/o is that some ACPI implementations access
>> (read and write) some RTEs from AML. If we don't allow Dom0 to map the
>> IO-APIC, Dom0 will typically fail to boot on such systems.
>=20
> I think more details are needed.

How do you expect to collect the necessary info without having an affected
system to test? I see close to zero chance to locate the old reports (and
possible discussion) via web search.

> If AML is reading the RTEs, it's is also writing to the index register.

Quite likely, yes. Albeit this being broken to a fair degree in the
first place, ...

> Irrespective of Xen, doing this behind the back of the OS cannot work
> safely, because at a minimum the ACPI interpreter would need to take the
> ioapic lock, and I see no evidence of workarounds like this in Linux.

... as you indicate you think (as much as I do), leaves room for the
actual accesses to also be flawed (and hence meaningless in the first
place). I do recall looking at the disassembled AML back at the time,
but I do not recall any details for sure. What I seem to vaguely recall
is that their whole purpose was to set the mask bit in an RTE (I think
to work around the dual routing issue, and I assume in turn to work
around missing workarounds in certain OSes). For that the current
approach as well as the alternative one you suggest below would be
equally "good enough".

> In Xen, we appear to swallow writes to mmio_ro ranges which is rude, and
> causes the associated reads to read garbage.=C2=A0 This is Xen-induced me=
mory
> corruption inside dom0.
>=20
>=20
> I don't think any of this is legitimate behaviour.=C2=A0 ACPI needs disab=
ling
> on such systems, or interlocking suitably, and its not just IO-APICs
> which are problematic - any windowed I/O (e.g. RTC) as well as any other
> device with read side effects.

I don't think disabling ACPI on such systems would be a viable option.
Things tend to not work very well that way ... Plus iirc these issues
weren't exclusively on some random no-name systems, but in at least one
of the cases on ones of a pretty large vendor.

> I think we should seriously consider not mapping the IO-APIC at all.=C2=
=A0

We can easily do so on the IOMMU side, if you agree to have CPU and
IOMMU mappings diverge for this case. Since the behavior is PV-
specific anyway, there are also no concerns as to differing behavior
with vs without shared page tables (on PVH).

> That said, I would be surprised if Linux is cleanly avoiding the
> IO-APIC, so a slightly less bad alternative is to redirect to an "MMIO"
> frame of ~0's which we still write-discard on top of.
>=20
> That at least makes the Xen-induced memory corruption behave
> deterministically.

It would work more deterministically, yes, but without such a system
available to test we wouldn't know whether that approach would actually
make things work (sufficiently). Whereas for the current approach we do
know (from the testing done back at the time).

Jan


