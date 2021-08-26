Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92C33F8829
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 14:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173022.315707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJEux-0005eJ-K7; Thu, 26 Aug 2021 12:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173022.315707; Thu, 26 Aug 2021 12:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJEux-0005cO-Gv; Thu, 26 Aug 2021 12:55:39 +0000
Received: by outflank-mailman (input) for mailman id 173022;
 Thu, 26 Aug 2021 12:55:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJEuw-0005bz-42
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 12:55:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f36417ee-3a3d-4e7a-a283-36ad6bde7db3;
 Thu, 26 Aug 2021 12:55:37 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-ZeljclqmMsmI7IYbvxLs-Q-1; Thu, 26 Aug 2021 14:55:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4941.eurprd04.prod.outlook.com (2603:10a6:803:5a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Thu, 26 Aug
 2021 12:55:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 12:55:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0030.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Thu, 26 Aug 2021 12:55:33 +0000
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
X-Inumbo-ID: f36417ee-3a3d-4e7a-a283-36ad6bde7db3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629982536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wXgZRvA0rt228zTeZgJd+qZAyl3Ol/JVaRiZUouKD3M=;
	b=JhrgjV+rjCWFth2Bvj1N3spqKPmrEXGH4ZXN8l2mnkldGIOSyjKfR7ZR5mG5mVwMOgmCPy
	DymgsJgo0YooLNa7pYaOYhVXcfcHzZTfr+UfLbiprBq0IOr4uSW8aH8K8m+BPsE1XHcdYu
	4WspRZFgB/jtsb2pDZ8FvH62cPYZeTQ=
X-MC-Unique: ZeljclqmMsmI7IYbvxLs-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRGYqXVy3CW0vOCwniPUZucaUNCb17UJSaHhIPjbfJ0e9c1S06H6n+KMzUBKl4+gdgcYbjaGcni63zKNUZmWDZsRsfTJSYnF7vYOKmc8MaQXZTttUmuuQwPXGVt9qln6JMkKmHYBnO6oI7JJ1cvEqBba4R+beHZL2V66hfYZS5LN0zQHnMpgN4e7yUfngobjR+RBTy3dSqa1l8U/mvYYgGd5zK6XZqT4mYH4dY5HIdgMGHD3KVDlZJUZgRmNBUNlwxC4Yj4+LLLsAGrgcjRkMJ6mHqtL1VILUcZRn3En5DH8N1ks0cDexDrf1ZuNNK3IVcADXZZEXWIFtORi0gWu/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkdarjXc8B8bFHYz96Y6As4hYdJunFAUoysTUjn4Pmk=;
 b=bGZp8KDtbMuoCmADpaOFifcpnj4JS83cDAYpKvffhKpAKLUunqnwLciUN9MCKJizSYyDepMGBD2uVcJh5Z8Azk80neHJNHpxwdI7ZyuEI9OcFdHR76Szx8fpT5w5W2uSCQtGMk8F2FnEakB7CnGy1FtpHZMq9v13WbGcdGvo8MQJ/5pCKXtK6A1vJh/7gwUQRNBALSdq04wQJlpWiAfTA5fTHylvQCu9iSWNxl3pnhYn9UeQEcbxOTEZrg0kBFoHHaOASP/1KxjC1/5bZvZZ+o1GWULuY7Dp5qJ9qJHVAgid1IOg/s+tBdAp0uhWU7Tx+5CPpCv3WO/8ljlUygmrZQ==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3db56ae-7a53-ee22-d821-d711b0d0bf3b@suse.com>
Date: Thu, 26 Aug 2021 14:55:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <42aa8c24-7f23-deec-6103-f2d556e4a9f9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR1P264CA0030.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2cd3bb2-8854-4ade-811f-08d96890caea
X-MS-TrafficTypeDiagnostic: VI1PR04MB4941:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4941FCE90BD1A19F8AF3C41EB3C79@VI1PR04MB4941.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IdtCS5EbPtzqoNHGPH/OCRXzf1N/n8jYegwQOumrZ8l7GYjbToutO+JReNFhMCp+TR42UO5CkoKgkXzeSGUnBrAPt8DewDRSYtU186vQBAssqN8nIdhSXKpNvlHM1IOA3yd2IcZVFJ4atXbnttCD4vIfbMoPWVaKBhTIJhS6btdfqaM80lC2FQx0rPfPacJj/S3pno7zrKulVt5UHIxg3ZHu3LJ+NR2V6APs2vQwtKLxnXBr4XwzjDBmBhCgRtZtfT20MyRdXKd8M+nzt32Ho5RW7oqHOG6C7966uo8TOu2tOzQbvuv/Hq1OsxEvfnWO5oMlSpveYgAX7Q9sGs9NLpi4VVhuyEeNE6kaBczRxvBGbvEcYzkTuQGjfA/0YxmeCM0TK4kU2FqTqV6nLGbOAv1J0T1w28fgDJb5MFXPdp8G1Q5cthiDmObIVOUAxrDeYb2HZdUbxQumbt+iPFdWsEjnlVtBRQri/Lz+iefy0n2fwcaDyzQxnbxlO1lBVhVsBLZNlS3nmn37ogEWvDw21Zm8rO/YkL+FeztVjraL5j5lKzjmm2SM5NA8cdMHpiIxcLU5RFi8CawOEWWdWs032jk8PXpLUrBqzqQI7UgGpnw+V1Jb7z7eFdkiTWyyZ+cTUxUXr7xyB1hqYcov1YXzwCCbbXMjqMWhI92K55Wc4ukX0Bi/Dr0eodlkVLb21FLdL9X1Y7zavJ4EsSkG7DVX7N0/K4mB7aYqioSaG4de634=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(54906003)(8676002)(316002)(66556008)(5660300002)(6916009)(508600001)(66946007)(66476007)(83380400001)(2906002)(6486002)(86362001)(31686004)(31696002)(2616005)(186003)(4326008)(38100700002)(36756003)(8936002)(956004)(26005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CLAziMK7cY2tJH/ba7dRaJaWsylAzHuvRYCdD9XojV6GGOBqTLbSoxEkmWA2?=
 =?us-ascii?Q?rBNwAGmgK/SEiuRP25u+BMtSNhlUOyRl7wWhNDZD6CxZmSNhmTSE4IOMjlQ4?=
 =?us-ascii?Q?R85H4OGMVKhJpcT6U9qgVZofaFi+RG1LnDANbnUXfhLvmpylM16J5jIsJwJK?=
 =?us-ascii?Q?tIUHxxEGVa8KwTEJ9l6DLkcsD2uRy9FnhY/W0Y1EgR/yDt61jpHFO09rcP7y?=
 =?us-ascii?Q?332kx+stZsvxiWDmD2XKFE8O9N6txj+fycvUf6cn4QteM571kfThek134BN5?=
 =?us-ascii?Q?p8aSrRbXDs6mEPKeluwMgiqBsOo2VkRIqLbVBIOfTRepphderToIKDKGuvI8?=
 =?us-ascii?Q?15m7LkbKzzD6++E1a9POAwb1i2zFGEuDrk7NW/gMz5mkcFx/4HFGmQoJCVkO?=
 =?us-ascii?Q?bBm6U5K7hmGstIneOQ1dhf4ao0tJddyA9/gXq+mSPy1OXcKvtwaccaiXdxxN?=
 =?us-ascii?Q?7OAp2wBtgSPFF2yzRHKGWBRjJ7gb9eZXOVIH3C595ncDvIbvWhk1cs2AR6Ej?=
 =?us-ascii?Q?I9b6JpZ2j1G/Jmd6JJ/0q8L1Jg3f1Yi64fWssJ13HtCS+EShQXosMyjGltY7?=
 =?us-ascii?Q?2RXU4Mhmlj4yDHtCQYcwKrDolWqKJvjla/4g/eOLjHPPTQnch7KK3eoZHsBO?=
 =?us-ascii?Q?MDcTSLjLX4D11RfjQ86hZXx/ZcRKqFQpicWwS0x72gpWrNr/GlvLWn5fE9gw?=
 =?us-ascii?Q?4FY7gsS2OEe7u/YIJvIblzW+1+DGk8MsPlIwxJlVL3j35B23qskCND2JdZ5/?=
 =?us-ascii?Q?Iyq6RJVVqSe3iqP/KX9r08EYLnGDDBs5CGlqNeCZEKwStQMDkWoImBXYkDZi?=
 =?us-ascii?Q?Z1JaGXQQ8IK7UARq+vrImzvQAdIezYQnp+loswCPIEcBkQQJuXvQ8xR6yrud?=
 =?us-ascii?Q?m3wL3w5VK+iV1/E936dHmFwXWtk0z4g9wRm08Z1JW4t1SEsrXGlCwwekaijh?=
 =?us-ascii?Q?4v1J4iGoNHYAwH2o5jI18SONFQIXKTG7IIFpY2CXtLa2y7rTDpRbadD0sbrZ?=
 =?us-ascii?Q?5vPgAsdwIhxGwTUvrxcDWyi/WmhcqHyQRtT4wbn0ThhVGTzw3oXBoUjxVtjb?=
 =?us-ascii?Q?fzWfL93qOKhgRqHRYD9UYfGEX3Nu4worRoQZEqF/hgJaRX9MU0KcXbKv/B7z?=
 =?us-ascii?Q?hVLRylfDZOKTx/p8qv8810otWK3zWwdEN4Ilb7+iYjvC9qtwCb62sPtjYOdM?=
 =?us-ascii?Q?eg1rEsSXu63nz5y3a0rjRr1CMjuoqLd3nfN8lTWFrewob6P5ZqgDN/i+ZEYx?=
 =?us-ascii?Q?2YtUecSi5Ut3rEa5hse5cPyhSe9Rdq2vs7NIvpZaUpSe1uQx+XLOk2ysEM0v?=
 =?us-ascii?Q?HlVgi+PShwvt+QmlHw2M5acZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cd3bb2-8854-4ade-811f-08d96890caea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 12:55:33.9830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EikvZFR9EQCBek4wD24Rk+UKiRWD5K785P1M2Q6FnyYU5aJuPwJ7ClOIJPLuOVi5qdRHYOaRWQxMj9qENet3Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4941

On 26.08.2021 13:57, Andrew Cooper wrote:
> On 24/08/2021 15:21, Jan Beulich wrote:
>> While already the case for PVH, there's no reason to treat PV
>> differently here, though of course the addresses get taken from another
>> source in this case. Except that, to match CPU side mappings, by default
>> we permit r/o ones. This then also means we now deal consistently with
>> IO-APICs whose MMIO is or is not covered by E820 reserved regions.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Why do we give PV dom0 a mapping of the IO-APIC?=C2=A0 Having thought abo=
ut
> it, it cannot possibly be usable.
>=20
> IO-APICs use a indirect window, and Xen doesn't perform any
> write-emulation (that I can see), so the guest can't even read the data
> register and work out which register it represents.=C2=A0 It also can't d=
o an
> atomic 64bit read across the index and data registers, as that is
> explicitly undefined behaviour in the IO-APIC spec.
>=20
> On the other hand, we do have PHYSDEVOP_apic_{read,write} which, despite
> the name, is for the IO-APIC not the LAPIC, and I bet these hypercalls
> where introduced upon discovering that a read-only mapping of the
> IO-APIC it totally useless.
>=20
> I think we can safely not expose the IO-APICs to PV dom0 at all, which
> simplifies the memory handling further.

The reason we do expose it r/o is that some ACPI implementations access
(read and write) some RTEs from AML. If we don't allow Dom0 to map the
IO-APIC, Dom0 will typically fail to boot on such systems. What we have
right now seems to be good enough for those systems, no matter that the
data they get to read makes little sense. If we learned of systems
where this isn't sufficient, we'd have to implement more complete read
emulation (i.e. latching writes to the window register while still
discarding writes to the data register).

If we produced a not-present PTE instead of a r/o one for such mapping
requests, I'm afraid we'd actually further complicate memory handling,
because we'd then need to consider for emulation also n/p #PF, not just
writes to r/o mappings.

This said - I'd also be fine with consistently not mapping the IO-APICs
in the IOMMU page tables. It was you to request CPU and IOMMU mappings
to match. What I want to do away with is the present mixture, derived
from the E820 type covering the IO-APIC space.

Jan


