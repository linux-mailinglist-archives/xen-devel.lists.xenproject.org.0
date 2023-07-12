Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F177505EF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 13:24:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562417.879089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXwh-0002oG-KJ; Wed, 12 Jul 2023 11:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562417.879089; Wed, 12 Jul 2023 11:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXwh-0002ma-GB; Wed, 12 Jul 2023 11:23:47 +0000
Received: by outflank-mailman (input) for mailman id 562417;
 Wed, 12 Jul 2023 11:23:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJXwg-0002mU-0x
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 11:23:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f54b7d3-20a6-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 13:23:43 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB7543.eurprd04.prod.outlook.com (2603:10a6:20b:29b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 11:23:41 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 11:23:41 +0000
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
X-Inumbo-ID: 8f54b7d3-20a6-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAekG3TQtwH0dkcnbtNeiJw9rcZVG9h3pmNYZ/hioXq43AmwBoehGn0PGMbf1/JCRhs3DkWLzz7g11G1NPT05/VkO6h23Qtj1lQcwdVn0R9NEVnKoshn/LrqHThhbG8gr8O8qvpoq+wcLyNlj0Jkwa9x0epcK1MHBfjZoKHF9X0l+hBtRpBnTKXLCBGfjvC8tVeQFH4CDM2CxW9v1QgGIPddiCZ1rvtP3NMBJnIE2gbm4P9xLC2+taig46soCn826IMkfDZUq/Q4fPGnfooPqEMhJO1sgFpzikBLEGlGQIhy0e/TuSj0TXLahg6BGPmHJRK8rk4yyESTX1q6Z0th5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDtPm9QkeCo50XZePz2iRaGDHxRvfJHfslIqfxv1a/0=;
 b=KARu8srMsBJ7ribndubHC4KQkKAK14SHzO5hFWELeSd1DKC25zk8Bc8Im/s/5ihjSNCOVivv+ISyLouiGwGm5emY5tmu+Y44wLC4AMXdMrckH3snWQee8nbDwL2IC4d4UPZZ9/uWeWfPKD6vnF73oa5PY6m1uI7szcNoHNi0/SWwDQfoH0Z3HGgEWxio+Up9W7DgbzNNe5AZbJZXuI6te2DEy6pHuIMWq66Agog42HXPgYuctFtidLR7iPsJ0GGN2kPhOfNqnoYVmS+qS1ole0wPb5pwgREFaNaMV9xSmYVzh5+pp1fYT9Nztjf9RAl9SvB1WvzHqqZQakgyRK9mJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDtPm9QkeCo50XZePz2iRaGDHxRvfJHfslIqfxv1a/0=;
 b=kVPBeMdj/Rq+Xt23NJPX0GsJ0hOxSQWUYL3QKpA+Ijbwlqe+HTBJpZN3rJVGpbp5zZdfdyYJVAycf6jorfXWMOlRO5jfFmmXDCAtiTWLQFSxkbvXnpknCdR1aWCSkexRoM4axhXE9lVDFexvWrAH3+IpMTKhSbgIUYDGKq+mBYi9TZkWk6XOum4qgQaiEw9Ms+9rGefoQEzDRXzCGomldazR/XHqW2Rj/TMci7RMDACSqS8WEW+ZvhkvpMcMctNaHcZodlduhz/qmslwJgdTHhSlXipC+X74tIXdo1GST8HBCJu4pkwiVz3Ix8iuoLEokTcGIhyiX8ktuLKSEHEMDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a823789d-7bfb-1824-7d85-f68d3152d3bb@suse.com>
Date: Wed, 12 Jul 2023 13:23:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] pci: introduce per-domain PCI rwlock
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230711004537.888185-1-volodymyr_babchuk@epam.com>
 <e6ca0ef1-fb66-d923-388f-79cfc20d1626@suse.com> <874jmagulx.fsf@epam.com>
 <c0ba8144-3e3e-1f98-a719-ea03e9f29495@suse.com> <87wmz5fktl.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87wmz5fktl.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::16) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: d12a3519-59a1-4e3b-52b4-08db82ca721a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NcNOx458l8XJ5ooMTStLUkuevJWpJUNPk08mgo6tqOFvaCX9BWeJLHC0OzlLKJYb4Bkdmqk6iZrBltxMPH/0fHwm/xFK6BDo3vY9i8zXnhb5oxDC/Mfesur0MDvNVkE8gGHSMMlRiz/BJTyBACnCSVjP3ULzo8zi7ZMNtAHcb3WyJ6pemT97y1SZYYBEnIbeBTCzk70e0+AtE5RoQ8JpKLxyzHZUTo3VidQO6bKaQedEZmWffbnxF/0p5f8DNEhyfqqUm3fjTo51R9ZqOzRzWaZzUDh2hO/WuFn+ADcnd5W9eBkH2NeQaaYTyEszT8fQhNHVpVHCtIhKGSc+EDslNI2gtonAykATYqm9pgljoTnSKMWvr93/3a/PSFUbwx7aKuQ5OJ0E+uBa99EBNxRaYd1D1XVWKdgyz2EOfryhM0o86ShKBG8pWYkKmG6sKsaIs0j3u4YoxImusWNoosGxRcEXnk1jA12CVjMXS76797qpQFN2t3jMS/WssP4KcF0On+vFRmsY9TjU7EzWSOEJ8UggVf9wFefbcR9SAt5FHtVb2sya1eO1YIEgF0xBJF5V6UzUSW6RNeHwoZAC0kU0GO6nGgvLdoBn10r3Mf5GlR3gjeGWE0/2Efo8UibIWlrpLMhADUM9NC21/yTDDn5VrXi9/YuUdovlnbSOCUUTc9nU7V8Ww0Sm3CA+iocaWm3L
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199021)(41300700001)(2906002)(2616005)(186003)(53546011)(6506007)(8936002)(26005)(8676002)(6486002)(316002)(36756003)(7416002)(966005)(6512007)(38100700002)(31696002)(54906003)(66946007)(66556008)(4326008)(6916009)(31686004)(66476007)(478600001)(5660300002)(83380400001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2loekJLTkQ5OVdnbkJvUW9CRzduU25UWTA0STdLbHZ2RmlRVURmdjkvWjVS?=
 =?utf-8?B?TjdjTWlIQzVZb2M1a3crcXUycVlyeXVNQ3cxSlAyM3lzSnV4ZExjUEF3MTdJ?=
 =?utf-8?B?K1FEMzJOT3poQ1d4VHZ1NmRzZGRPVWp2elBSSGVzbklaWGoxWnphakhVOHlS?=
 =?utf-8?B?Z09heEUrVTZkTE1QMXpZSnJaTFhBWmMwL1Y0dm1QZ1B6U2lISVBlK3A3MHlT?=
 =?utf-8?B?bndQaE9uSzQ4TG5Od1RJNDRrdy9RUU1OMUVUUlltYzBPRVFyKzduVzJFOW9u?=
 =?utf-8?B?V1BUa2xoNUNkbEZiaXFjQkJUd1lyRzIrRzRGRDdHa2xGUWQ3eDBPdHR0a3RQ?=
 =?utf-8?B?Q0krMkVHeVlvWjNpS1RTMUl0QzRuZENZZXc5NlZ2eXpQMGR6aGNPckd4MXox?=
 =?utf-8?B?QzBBc3kvZGp2RDIwV0pMTDlBNkwwb3owOVJ4cGpWQ2psV1FqdStUeUVkU3k3?=
 =?utf-8?B?VXNBTm9GOVVZdUZiV0FZZ1QzZmRVTm1wWEo5eDJLS0FLQXBkN1NqYzc2ditK?=
 =?utf-8?B?ZllmYTRZWDZwd3lVZHRVbkFqajBBNThkbWU0Zk9DUGQyTnRhWENVTWxWa2c1?=
 =?utf-8?B?MDVVOS9hOUVBMlUyeUlyL290NEVtNU0rMEFKUXkvZm9ob1F5dG5DdU45MUU3?=
 =?utf-8?B?UXk2SG4zcjlmd1QxYnFQSXVFYjRuVmE0NkxBWUtkQnBHU0lyYUlxSlR3VjRE?=
 =?utf-8?B?VjNRUTJrcVE1RkZ2VU5Jc3llREVGZ3BBN3RpT2Z0Q1lHWkN3R2kxMkNsdVJR?=
 =?utf-8?B?QWVyN3cxbWlJVEpxT2R2Ui9WNFhvdkJKcXZrYUtySTNaRi9tWkVYMVV2UGlU?=
 =?utf-8?B?VzZYYVhaTHJVMzNuZ0tIUE82cmNLRmk1amdTWFd3cGlmWVE4aEp6T2JhSkxn?=
 =?utf-8?B?bmdhUEVTSGY3MDlub2JvMytmWnJIMkJFQ0R3a3h5NUNKTjA5TUhXamFmaEs2?=
 =?utf-8?B?OEx3d25QTEE4TjA3UCs1c2ZRaTNOU1FidndOL2htM1h4d3Y3MUFFNGRjamRQ?=
 =?utf-8?B?ZUxlOXRCTnNiSFZlQlhMUWFWMGxJVThHWnp5RVZBbEtLVElzVEdYRThWVm9z?=
 =?utf-8?B?WkFlSEZST3B6TS8vcGRvOE1va2haaHkrZDBodmtZSW96ZE45Q0lKa09WazNP?=
 =?utf-8?B?ZkRYOEFFem11djR1bDBQZlpucFRMUG9RYTZBUW5LZVNsVzhMNXRvQ3d5alF2?=
 =?utf-8?B?aUdqMUJwbWp6NjJJSVNXMHg4SHZzMnc3SjZLNnFkRmNta2k4NHN5eHk1RGdZ?=
 =?utf-8?B?ZnlBcnp3L1Zka2ZGNUhySTZHQjJqcEpieXZqbmJtYXI4d2xTdXEvZFFqR0Fm?=
 =?utf-8?B?ZWk3ODBiY29SS2EweVFSVmFDRmE3M3dhek1QeUdkR0FacXd6dFEvMDA4NFlL?=
 =?utf-8?B?V2NaNHBPT2VCMjR0SXF0TktSNmczajdPWklHOHNIR3pXQWRydnBBMzlQZ2xl?=
 =?utf-8?B?Yko1bjFBUCttNjdjM05HdHB0dlRqZGJ0MzNjanc4Q3FFeUo1S1VRemtvd3kx?=
 =?utf-8?B?eVlId1JpWk1qOGJpS1d1a0oxRlliRXRyNGx2OXZ5cGpVYlZlSG56em1qdXZv?=
 =?utf-8?B?bDRFS2RzcmVVM2E0T3o3eDdjQzBaazhFUlFKcXhsUElRNVlyTytPUGVxaXYw?=
 =?utf-8?B?cTZIaTEvOW0yclJuekNvMTNCa0tXa2R2L1Yra3RRWHB4NmtFSXZrOHZHVVRu?=
 =?utf-8?B?T1VzMzRZcEVXUzJHdEs4d2t4Y0xQV05lWHZQSnNtZjlTK0tSa1A5cmxkK0Nw?=
 =?utf-8?B?d3NqcU5RZ210akpZQjByVmpDN3NaZ1RJa0RnNFpQdUFaYzNNM2xXRWUzTkty?=
 =?utf-8?B?eldEN2drTGt3MjBiWnQ2M2ttUFNnLzBLK1lsUXNCZVpuYXFOT2ZwaHhObUsx?=
 =?utf-8?B?bTQxcU5ENExBZjFiZE5iUWYwL29KWXVGNHhZRjkzaHpEeTBWa1VmRXdjcWFM?=
 =?utf-8?B?RkR5clZDRmFzcE9yZTUraGN1S004b1ZoMDhwcXdJbzdTaG1XN3JSVVlXTm9r?=
 =?utf-8?B?L3BoQ21NSGtGUHFkZ1F4UFRzY1gyTjU2ZHh1cU0vaXg5K212RUlkNzFvVTZV?=
 =?utf-8?B?M2l2Y05iTzlHd1pSMGFUTHlmclVLaFZ6MmNEV2x4cWc4Y3VhWW5RaFUvT2VU?=
 =?utf-8?Q?VXZDXmLLMAL9l/dk+7HrWVWRb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d12a3519-59a1-4e3b-52b4-08db82ca721a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 11:23:41.3520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cer6kgNuZ0ZOVkW3tchtzBsMip5sxRo5yregxD2vL0ktg+KRxoajORCYX2vMjiM6qFeAj/1zeA4f2b6xGLEYQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7543

On 12.07.2023 13:09, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
> 
>> Up front remark: I'm sorry for some possibly unhelpful replies below. I,
>> for one, am of the opinion that some of the issues you ask about are to
>> be looked into by whoever wants / needs to rework the locking model.
>> After all this (likely) is why nobody has dared to make an attempt before
>> the need became apparent.
> 
> I have no great need desire or need to rework the locking model. I was
> perfectly fine with much narrower vpci_lock. As you remember, it is
> Roger who suggested to extend this lock to the include the whole PCI
> device.
> 
> I already tried something like this as part of the another patch series:
> "[RFC,01/10] xen: pci: add per-domain pci list lock" [1], with the same
> result: it was considered very hard to do this properly, so I dropped
> that effort. I am not so familiar with x86-specific code as a whole and
> IOMMU drivers in particular to be 100% sure that I am doing correct
> changes. Without support from x86 guys I can't do proper patches and
> looks like x86 guys are not interested in this.

That's not the case, no. The problem is time: I don't have the time to
take on this effort myself. I'm willing to help where necessary, within
reasonable bounds. But I can't realistically do large parts of the
analysis that is inevitably needed. (I'm also a little sick of doing
code audits for other, unrelated reasons.) Hence that earlier "up front"
remark.

> So, this is dead end.
> 
> Roger, in [2] I proposed another approach to fix ABBA in modify_bars():
> store copy of BARs in the domain structure. Taking into account that my
> effort to introduce d->pci_lock basically failed (again), I am proposing
> to return back to d->vpci_lock + BARs shadow copy in the domain
> struct. What do you think? And you, Jan?

I support Roger's earlier request, and I think that doing what you
propose would move us further away from where we want to arrive at some
point.

I'm sorry that this is all pretty unpleasant.

Jan

> [1] https://lore.kernel.org/all/20220831141040.13231-2-volodymyr_babchuk@epam.com/
> [2] https://lore.kernel.org/all/87ilbfnqmo.fsf@epam.com/
> 


