Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E95442C4C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 12:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220070.381170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrjY-0005CE-Od; Tue, 02 Nov 2021 11:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220070.381170; Tue, 02 Nov 2021 11:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrjY-00059Y-Ke; Tue, 02 Nov 2021 11:13:40 +0000
Received: by outflank-mailman (input) for mailman id 220070;
 Tue, 02 Nov 2021 11:13:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhrjW-000599-G2
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 11:13:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1502c7f-049a-41d7-855c-e0a3f9307036;
 Tue, 02 Nov 2021 11:13:37 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-XgnQmkSfPe2UyweADxi_pA-1; Tue, 02 Nov 2021 12:13:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 11:13:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 11:13:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:206:1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 11:13:33 +0000
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
X-Inumbo-ID: c1502c7f-049a-41d7-855c-e0a3f9307036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635851616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWgPX7YM7nq+sCJ8G5o8uAn5ekVbrc2u/x8H2qXIMHg=;
	b=IkcTuJ9lnvtVbtKn6J0wYMyMUV30LlGI5Z+aqzamJeW1P6fTOaFX3Ih4NySV0Vf2b2YfVU
	HuKPrJ5MOo+43QAAeXGurHzAaPXKy0aC17aZpBVX6/Lut4TST0g9NbnoNr1qO7c3FYpCnj
	KycHg9bkLC8mUdO58FkFCGw6hyGcwSw=
X-MC-Unique: XgnQmkSfPe2UyweADxi_pA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYO9QX/QviqZIYgt/gXVXUxICf6g80LZJDNz05b5q5rWhjZ6/w6c53AMs6NFZh6QEuuWpytRepc/Lt/4h/LzKvw7Jht+9M1JL4pqIhEqnPCP+lOa97gwmBxlIO80/l0s1/tP722aqTx+3sXZE73eTBcIHnf9IP17oj0vfSYhFPQ+CWY3+eD5ivg8FUD/Q9taOzOFkiZQn1CSHaKDMHufio0YygPp2B8tx2SBWt2Hb+GYJFMzs9G8PcaxrMichZWgNqd51BWMjrhUUATuFQhAEz4Pg9GrP43c8jxrpHRKafe1lggQt9aOpZoi+lOMstJw07MIrYgodWFZY9NSRSQadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsNPAs0wDljFlhgzJ81dflGL8hhCM7MSPduQKSA/N/A=;
 b=lqTykdTv57tvuB5c1GXeIzo53ADEgY5s9+6t8H+H5F8eOOew8ok/6k6HQ+TVxmrwkAwaDKLy7Msi2IQQTd6VH297+c5S1XULKY3CN7GRYhWeKr2nAh5tXZoFYNkEpDs94LX0oAGw+1E7RG80mMIqDZ84WyOkfNGAVWM6fCxM9NAH9kwfdY4I5uuz/Koy50mOwZ1pE0OiOskWveILMNjL3CQiF4tXafpsBQ2T6H4y5RQUhHFWLMGDI2RY5fb3g98rqrTHc6NcgVVYv2B0xQX8qjjyRURalWGQmF5k5IzBWi9L/w3UjoG+HeGMegWo/l4h51FdW/F5J50K+m5LC1NWAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cde52c47-1f8a-499c-7912-0d9a3cbe9fce@suse.com>
Date: Tue, 2 Nov 2021 12:13:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 06/11] vpci/header: Handle p2m range sets per BAR
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-7-andr2000@gmail.com>
 <fc9de674-1000-c956-3401-103d8388d428@epam.com>
 <YXfM9mQh3DS3bpfw@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YXfM9mQh3DS3bpfw@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR04CA0002.eurprd04.prod.outlook.com
 (2603:10a6:206:1::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab83fd74-b688-4e52-59a7-08d99df1cf4f
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70378B9FED73A7FDD74662DFB38B9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cYff6gTvrrjt1L85tIVELW93PCl7TiYZzYPJcml/rXhvxOsKzUgaJK+l+Up+kb4soCLhCs00Vr8Ydaks1uIWJKbTqATB/Gn32ZSUwighka6Ou0GXDUERJ6AnJZDcwvlhusxWhQ+ZM25o5R6cxjB/nqNqUKv7y6MxzsWILc/eeuwWIQXfTNbLsZPHLdptNbtAY+5b7MSpvrVkI/jVFbJ6w3rbshIq3p1JLyFI9HaH5T/5MdtYx8ApvrCVVr46EE2WnGefmo83sxjhGWuG0lNOXYkBgmLL9w6tx8r8hPRKckeGWERBxgLZaI2XhwUO3vmd3jxH3okAIhh8SlPgo1Vye+DI0vgGfF0Zn6uVVWiSI6lg6CjriR8iJ+/MPxWVGhURKzTOC3hr/u9A0DmMT3lWF0q5mEqZ+fUvE7stMIv7BZ0UK3ofIj8kBvB/Chwh5MNTXPe9BLqvkX7kYz10umO7AELbqfjwXybYvilhB6MDRy6G/OdHrDF+FwD6fx1EvIL8YhWnPA4wzpfO+FmtWP3x7oKpyMzFDT4bWLPeFVuc7vENiEcX4PQcNa4ExcKfkyhj5+yWI7VO+BT/DCHwpNG4jmzvPIhtsVZLFPdbkySHp/Jmua/+Xeu8kcz85oSrSSX0ckmEoAAHJwiC1QELY7q2GmrWZieJwtwGH+guc58SR0+MIzYzNtaA/XW8LPsew4ZZf3T1VVyKVqTQcYmiYHkoREzI9ubOIwLs0PMcfaTvowEtH+M4x+Dup27cJa0AlQJ5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(7416002)(8936002)(2906002)(316002)(508600001)(66946007)(6916009)(186003)(66556008)(66476007)(4326008)(4744005)(2616005)(5660300002)(956004)(26005)(54906003)(53546011)(38100700002)(16576012)(6486002)(31686004)(8676002)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IBEDIIdoxG0hmM1xW1M871jWmoI/rgyYJWL+lQ8b81kUJsQDc1K/WNSkADRw?=
 =?us-ascii?Q?qBqxbYb4zHdVw3v5U8orZ3Fw86m+jVxanMHiQPKpzPRFfz/4jqZ4lisZ08WI?=
 =?us-ascii?Q?G7odNyThfq9Huoy331jwxjhSCL8CehrhNHOATFi9/1umt01zdNfNKmNLVKn1?=
 =?us-ascii?Q?Lnx2a3k6VxZfKpEXjarN3nHkbQG3ZMgJmFceCLo4ryrZ1C3PKCaUOmLjOnE2?=
 =?us-ascii?Q?pNTgXvYn//CzQm2OITxY8zy0izpTvsR2GXmulAfRYrIg2aX2nahtite53e3s?=
 =?us-ascii?Q?0fq5geViPZ29hqcEDSJoBwKIdzndp4ZyRKvyMpybHKppBaFUQSXN74daiNBk?=
 =?us-ascii?Q?0otDm5j2GQfg1+G8YB7LuHbU7eI9f6JezQ9WPpjy7h4dl2wnHpfYlAtL2JS4?=
 =?us-ascii?Q?wvOJ5KH8HRTX+THCvHel6kin7Ow6ou5DMlNGzgZz99nfGtuwTsiUe5lG1CPk?=
 =?us-ascii?Q?3/yAdobFIZW/LURwdXmbwEbEqdsul8vjrtsC+dddgNlil7XQrV6Lriv4ifDG?=
 =?us-ascii?Q?TxcByBCl3m0QIQcM1TUQuEUCNjom6Xou8EilcHHpc7ZxxthKV+MOSfRYrmm7?=
 =?us-ascii?Q?84u61GIqNHUmWYsi7TvLqUGgZGdgIzd8KB/P95g4lNElOtZOyG1yCniey0eW?=
 =?us-ascii?Q?nA2WSMdYrdCj6NxUY4o3XJDMWz4g8etfbsnGfBTmR5AaqBR9JvIE/2rRMVtM?=
 =?us-ascii?Q?XQ3Mc8KzCw4NvFeh2wluGfx7nSEe1LPoRHZkNSPjB59ewAwr0mL4cywghcby?=
 =?us-ascii?Q?Wg0LwVgPawH9w/8E8oVQIunAn7TtUPCpjKg4tHCqKBpVs0J/L/AZQFiE1rWh?=
 =?us-ascii?Q?9rfcrNZQD5D8ZOyrgGWl8aVRYANgTwcxfc5TNNPE25HxKQSQ5r/SDWhXn64w?=
 =?us-ascii?Q?p81pAnwk9tJ68kTaSNcQIN/qqDsU/OwTRHtZJOvTIB9HvCO51Hwav01AzKP5?=
 =?us-ascii?Q?HIdVgeG+99s/iSNVIN8wwuHi0yChqs6Lp7h9S2Xf77277j2hPg24HSG9Hryu?=
 =?us-ascii?Q?l6ZctaP6iup/O8aif41cWq/Cifue2dvMZVj+3tjmVqG4kQOBfkdxjIffZyuo?=
 =?us-ascii?Q?UOAv7qGWPqvD9gZllQhBvg2zKNDWOBoP+P2oWSb9CXQjCEWoa69ZZ/Yi8a0Q?=
 =?us-ascii?Q?DoAr7SBcuTDZQPLFZxXSvWcfeedUDMEZ1ptUQ86VvgfqNC36MfDQJNlOU/7A?=
 =?us-ascii?Q?mH5rzYfnObny7C+RMT/GZ34LXHCRyP5m5MneNBn7l0iwgXRWe1MQvJfVRx7U?=
 =?us-ascii?Q?lvlV+Fv8FBfMn9qAJP5IK1hLNpKSbSBUyzOiDqbBGDUfLgXz+JKfPc9oom/S?=
 =?us-ascii?Q?cd4LlhZu+iN1cne9K64XO2cBIwpfn3KYg34faIq9r/eU4cZNLV2hlhpk9l1o?=
 =?us-ascii?Q?jgRrNwf3IetFKSiXEmYbyxhEIPv3EnbN68jy91TUxXJltnPReED5S08DZTtH?=
 =?us-ascii?Q?twErIa/72c3wSsq5BanER+ONUsZ3MELLGpGc6OUfEfdWwQmvuDLgLPTMJNdj?=
 =?us-ascii?Q?qEioEsSpCG/xa8xK2bLNaew5n44es9IvIPo2+jnmACqEofs1yLkaIY0UzJbk?=
 =?us-ascii?Q?2hyC/Vm0iuSBAHgQsE8rPE61R3EGMIBKLEyQz3vQG6M+XmLDsks9qw1GKVPq?=
 =?us-ascii?Q?Bi9qrOgqTaPhnhP8kzHxEsA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab83fd74-b688-4e52-59a7-08d99df1cf4f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 11:13:34.1488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3QX0vHPpEn0NoIjSBh7eEgvd20QPv5enF5E3h1ipmuaKIU1IeRUHLaJho5GWR1hpBC76HjQ9BltxYDztvKn5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 26.10.2021 11:40, Roger Pau Monn=C3=A9 wrote:
> On Mon, Oct 25, 2021 at 11:51:57AM +0000, Oleksandr Andrushchenko wrote:
>> Hi, Roger!
>> Could you please take a look at the below?
>> Jan was questioning the per BAR range set approach, so it
>> is crucial for the maintainer (you) to answer here.
>=20
> I'm open to suggestions to using something different than a rangeset
> per BAR, but lacking any concrete proposal I think using rangesets is
> fine.

The main reason for my objection is that for the average BAR the
rangeset will hold exactly one range. That's not an efficient way
to express a single range.

> One possible way might be to extend rangesets so that private data
> could be stored for each rangeset range, but that would then make
> merging operations impossible, likewise splitting ranges would be
> troublesome.

Indeed, so I don't view this as an option.

Jan


