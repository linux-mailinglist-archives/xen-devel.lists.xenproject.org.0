Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D362447B4D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 08:44:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223084.385622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjzKV-0004qB-PL; Mon, 08 Nov 2021 07:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223084.385622; Mon, 08 Nov 2021 07:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjzKV-0004ni-M6; Mon, 08 Nov 2021 07:44:35 +0000
Received: by outflank-mailman (input) for mailman id 223084;
 Mon, 08 Nov 2021 07:44:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mjzKT-0004na-E1
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 07:44:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5fb0710-4067-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 08:44:32 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-MtLzVd2GNsuDGjE9w1q8yQ-1;
 Mon, 08 Nov 2021 08:44:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Mon, 8 Nov
 2021 07:44:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 07:44:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:20b:92::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Mon, 8 Nov 2021 07:44:28 +0000
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
X-Inumbo-ID: b5fb0710-4067-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636357472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OVweTEN7KxIselixCClr2YKYnI99RNoTp3bwVVyJftI=;
	b=YvCmSsU7YqUIVv3nE4vaoDAm7Ku4Bv+ule4Uyjgv72TNp3qsu2fKOnfBftC2ZRO1Be3wKu
	kgVJvBIqCtfQpcQ2CRBLlj/LAtqNor3LexGetOfylu6EVXZDcIiyc12Ij2Ho/D32l7kcH/
	1WsiTi3Q3phtdP94xPtUfuf7GpZjg5A=
X-MC-Unique: MtLzVd2GNsuDGjE9w1q8yQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lh5vP2bjxOIeIfolPjiDVfb2qYrsIP6KBoUxNpxenWjPtOn4dpFgmPtQx9YHmhnEWoSawPiAvgimL8TcztFUClHT3LnIju/sOJC1/XvbdQ+pQ22b6pe3Fa5W791b/+nuGqO6YC2bGMAsNkKYojIh5xUEVQcAdaLrYuI51vo/9Xjjsa4KoO9Y7d3Rm1QGldZYF0dDLWkgJuSOAqbOGlLQSwwZiGGmw2vbBi+APlcE+tkEmFUzJPurBNCarcILmavnZtC83WD91VP1/aK09oSUGDqMFsd6X9hyIElw8LDpunP+f7FUKrXj4BqYVObVFh5QZ/5hkSFXRQRQ3wHBNXWbFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmjmGHWPIPLIQqbFK1Td037co0FrTMJ0kMBRKyOa4pI=;
 b=E1tWJyeptoCtePH8kcEl+MIsBNTigRVqOt/I/QGmZHjF12y5xjqkrzXuEJJ29RbPEXX/ZQksfE+CHn+2N2Vxz1HU7WE9O2XSx3uBrzkGJA372X/GlIvIjbkUDpdS2hCu/wVnQbO5e8MqJce9tdvuiNfDTcnfqMr1m8NSKg0L8SMDqxHghenE3wK9Tn2jGlwyp2eOGDiYoVofNktbWjaWN4qp1kS39Yvq944rP17nJz/0gsz+L7MyFOrSbhCCi99oh02YX/I8jSRZ9GZpYuNd0QgKL5/Ikqa4IlqAQc3N/T/THAUqPWkUYHqpHjgxevpnUA2dO5sCgomb+Rq9BDns2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <89eda99d-67da-ad97-6040-db79702636bd@suse.com>
Date: Mon, 8 Nov 2021 08:44:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU
 ACPI table parsing
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@FreeBSD.org>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
 <43d8cc88-aae0-5a82-7b4b-756dd54dd223@suse.com>
 <YYVQAH7OYmFSVOei@Air-de-Roger>
 <24965.21029.795504.152439@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24965.21029.795504.152439@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03a5dfee-7bae-4138-3df8-08d9a28b980a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3293AF90D7CAF20DF2F91201B3919@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yEpJopSMCfh9EvXgwv0S43WVBASpzntb5+JHfdYvq3fTV5GuuTpAnupJWIV618Sjjdg1MNrnTp3SS1sBxX/nXObAN8LR0FinP0w8SR6MQ5kyIqJn/Ylj+XCnKMWLSNrwqmIcHl974/T6V4mwqDtvBrqu476LNx4W7siatoaVc2gdJUBS+CaVYGlG4JyQaeQ2WaSozO3rn3UvV401gmi+iJ7Xz3T0HoEnLNaayd7LsNDbSfHbjkWCqWd708/VIpo336Naa92kc7XQjXsguQmKQBM8Jo+pbBVewbYAYthCBXKUmRLgFFFbKLUweJzw0pXLc21/kRXxtzxpg83MBv1kq7WRx/1USFNTEV7omfpQ+JcKl4QbNrc3bDkCc1JW8i03sLsIRIqAMWOdlIE7oKyiHI7kW70r8433s1YgG+EYvVz55m3wyhg8IhZNFpxviG5uHTAxqXO7UN+M+5gBFjzqfiTKHxLJ7mX3LbPXlkAUB+XlNKWm9TQ9un5wkSy0xRuWX4xkG5nizIM0+xvrKLbj9rwMBOgPIDqHpdRJPaNt4XJKdtdpqixcZ2mjT0cVA7eG4eB3D0OOVXVsjF6v3LpsVJHQcTyw79B/whOJpslP4oqm7sfx2GwINgvLgLTKvkg/rmtX9ToXNqGzAr69gNFhAMUGQa6+hvSpcQGpsfLeKWyibhoVc+JVUewTCd4gD/knTvcOCpH3zv1PkMWNpdUsInaU6GgIEEDYWTsE6SBEREh6p8bkQy+V7ngzakrsi2zt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(956004)(8676002)(26005)(36756003)(16576012)(508600001)(53546011)(31696002)(4326008)(86362001)(2616005)(316002)(66946007)(66476007)(8936002)(66556008)(5660300002)(31686004)(186003)(38100700002)(6916009)(2906002)(83380400001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BERJe1wUTIM4NHgZ/dbUcAhbNAm5bQut3lcuvdFIxP+5jTMhjAZHF7+fCZ8H?=
 =?us-ascii?Q?/Hwkj6G8RYWzRWthAuj1MSfSh2jWXVQ0TiBIh13xmg1pJZvc+mLzPTeLeMZf?=
 =?us-ascii?Q?xHwGrvSfEj7SQx2oHobjQHV4VVG8KbZIZCEUS3st1lIWeFHeVxwb2zz7FS8T?=
 =?us-ascii?Q?Bjm3bxjib48VZ/wz8d9kcpc6KQrMWRoSeU5Tg7b+Nor/TruU05k/LpkAaytY?=
 =?us-ascii?Q?BvkqBowXcEWT80907Pu6uk3G7xWIQ7uOlAipBo0JFIpn85oGrTQZaVMb6/+A?=
 =?us-ascii?Q?6rqxufq386BhP6LgkfWYSs7Qoxifl9fvfBX7olJtXSjcdn821/bHiDubLQq6?=
 =?us-ascii?Q?XOTi+k8BJoSVMi8npwUIpdtV/CH9n1tQE1VGencCjYnMoKfFAklu8mkXV7R+?=
 =?us-ascii?Q?QNbSzK/FqkQE0EGhXMrP2p6ofJGMXNLyyYITV06iprsYLyKH1o+tweftc96M?=
 =?us-ascii?Q?S3tWBMuteM5CUpq2b2ls5fcModwwnBZXlNtM7v+iFvwQWC2yqgfzmwzZjIKQ?=
 =?us-ascii?Q?Perjlr+YnHNaoa2/AsKnh7oKuKYptDsplODSN823LAHa3+fnEXIGN7RanTD2?=
 =?us-ascii?Q?k9/N2pcyu4wqaiQkmk/wG7DRQCdmDeP5bGSnA6+69+NCz2TWwvFq1RUsqKmd?=
 =?us-ascii?Q?Vvsb98Exzg5u9s6pZ74U9+3q9jhXAr2xa41IgCEr1AuHNXDN+3s4iFRoXWLV?=
 =?us-ascii?Q?s0x6jyz026eItDV7c/5AJ0pyrn9TaB88xafpudpZMH3Np98iMD8br/sji6wA?=
 =?us-ascii?Q?QAx6AF9eGtfHiskF4xLG5JqfUqikaTP3860ghibhp9MBiUr0VEqXUyzLnB0w?=
 =?us-ascii?Q?EYZG00coz2oNkZY81InLvqd12CfhHrsDRrXcKEyxvNQRXEHDPAncDHje2Hfo?=
 =?us-ascii?Q?YFjSpS/g9ZPAkq606PSqSQ2pNiRL5U8K6tCZTcJAKd90gxbeyN7kTriKaK7G?=
 =?us-ascii?Q?Fvcmr4y/Nro6PuJvBIAyBHoEh76TiQZfpYhl/LXJ06HXGbD87pcdL5y09rle?=
 =?us-ascii?Q?//muz1046Zx4nLqTqkSNPDlBR1itzEn1P+K5VLBqJh++jq1+zoPvl94stXsh?=
 =?us-ascii?Q?/W5rx+4q6/y44aHkIfmAspJQjZyw6RGmWh4CwZahASUIpUpJCC3C1AdrD8A5?=
 =?us-ascii?Q?N80D9QOrClJ17JNtiycE2jbETj/TkObTCgIG5pKfCeio+TEzHMdrWGclVpSV?=
 =?us-ascii?Q?88P/Ye33TVMXazg/XGNGEzjUx8/Nw4x5fNFGRGOgHnLbVkZLDyPppNp2goqO?=
 =?us-ascii?Q?sS0+jrkU0tQWwyrkTTtzlgVqmDZ/Qm6aBJrxy+xLQAKdaZx6dumAOJJ9b5/r?=
 =?us-ascii?Q?d5R4oSKnGuNmYLqVr4P+9sfLyx+EtohA1Iqsqq5LqKqDA2LjKDL5x59fnZ6r?=
 =?us-ascii?Q?vaECvLZOyJbI3ky0FBUlbayTJXokontx3YGwGeR2/Iza/R4PYAArhO/gazmf?=
 =?us-ascii?Q?THPGUq3BqWtKuxB/oas3zlEqLqfwQfV1A79SmdQgrFx2rtX/OZpsS4yHozdC?=
 =?us-ascii?Q?bczgxs9ONOZwBPfhW0HFQkG3MWJLH06mDDg5aSUszmHglKoLru+C6Vlc628V?=
 =?us-ascii?Q?m21V4ZZuvXTd9kzpEKURVzS/Lvs2hkBOwQjP3J/qnlRq54Oyxf0Y0vjauQKf?=
 =?us-ascii?Q?xL6bJKlRU1UE4yRZggmqgC0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a5dfee-7bae-4138-3df8-08d9a28b980a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 07:44:28.5847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLYMQMYbB1CBIMX4eYsQpH6QGy3WETTiO0vzYatSnkEhIO7MW25dkIoVvvoeqdhEFJ+TPNJMoYVhnrv/5AzRcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

On 05.11.2021 16:47, Ian Jackson wrote:
> Roger Pau Monn=C3=A9 writes ("Re: [PATCH v2 1/6][4.16?] x86/x2APIC: defer=
 probe until after IOMMU ACPI table parsing"):
>>> 4.16: While investigating the issue addressed by the referenced commit,
>>>       a variant of that problem was identified when firmware pre-enable=
s
>>>       x2APIC mode. Whether that's something sane firmware would do when
>>>       at the same time IOMMU(s) is/are disabled is unclear, so this may
>>>       be a purely academical consideration. Working around the problem
>>>       also ought to be as simple as passing "iommu=3Dno-intremap" on th=
e
>>>       command line. Considering the fragility of the code (as further
>>>       demonstrated by v1 having been completely wrong), it may therefor=
e
>>>       be advisable to defer this change until after branching.
>=20
> Thanks for the frank analysis.
>=20
>> The main issue here would be missing a dependency between
>> acpi_iommu_init and the rest of acpi_boot_init, apart from the
>> existing dependencies between acpi_iommu_init and generic_apic_probe.
>=20
> I have been thinking about this.  I'm still not sure.
>=20
>>>       Nevertheless it will then be a backporting candidate, so
>>>       considering to take it right away can't simply be put off.
>=20
> This part confused me.  Under what circumstances would we backport
> this ?  AIUI it would be backporting a potentially-fragile and
> not-readily-testable bugfix, for a theoretical scenario with a
> straightforward workaround.

Well, I've said "candidate" for this very reason: To me, every bug
fix is a candidate. Whether risks outweigh the potential benefits is
then influencing whether to _actually_ take the change. A reason to
take it despite the available workaround might be that
"straightforward" doesn't also mean "obvious" here. IOW once you
know what to do, doing so is easy. But one first needs to arrive
there.

Jan


