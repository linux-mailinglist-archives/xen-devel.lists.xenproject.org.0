Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B293D3CB24A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 08:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156983.289700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4H9T-0002cm-DQ; Fri, 16 Jul 2021 06:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156983.289700; Fri, 16 Jul 2021 06:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4H9T-0002aR-AE; Fri, 16 Jul 2021 06:16:47 +0000
Received: by outflank-mailman (input) for mailman id 156983;
 Fri, 16 Jul 2021 06:16:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aN3H=MI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m4H9R-0002aK-U6
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 06:16:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63eec616-e5fd-11eb-894d-12813bfff9fa;
 Fri, 16 Jul 2021 06:16:44 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-756F38GSMUOcE_tjOLaATQ-1; Fri, 16 Jul 2021 08:16:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 06:16:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Fri, 16 Jul 2021
 06:16:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0242.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 06:16:38 +0000
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
X-Inumbo-ID: 63eec616-e5fd-11eb-894d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626416202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=okRwA0kJrc3+ZvHsGaTbzeIZG24snsS9Jrz4dHUgxN4=;
	b=E0u5DILOi/uTzT8o9X5aQIJVuJJ/7QUYbKP0zDyDgRslq5R8sk2uePX8aks5yFibkXX0Ft
	6qy5ME15xv+2ZK4nV0dPxh1/4RZ01HYZV1vtjDn4Ygxa+iwWPjxdnmJNh4EM0mOT4rFoB2
	rA+eIpWR3HyEGPcRV/4/a9K2dS6ull4=
X-MC-Unique: 756F38GSMUOcE_tjOLaATQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRlbv9IbbhlfwLR8RRCAL02DE0j08IYgRVv0UOQkOQstFISGcDVwFoKYD+NU0KYEOkkNw3XcvFf54VTC+ZEL1wDh1fUuJ1ENRtBOMSzJ+bQsovbzZw56BzHeOoVXgFvg523jaNZ3X6TArJ+p5AhWk5gewDkhqP0UYF5+euBSLR+9+qpaCuNDjtAYe9/bizhxnObMVTZIcYzul2jWX9UyzNQSaLVFex/hwOoA6MrUSGPozGN/C+IOmSRdx0siMyQxGvo0jNi8NGabFUN0XHcD/SxVfmZi51CUSKMd0oRyPVm3jq0eVi/z4XUdCUkZQyaQia/I9dqY7ghNWxuOnfYjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfJpp0K1fMU1G9vcr87o7TTVTssxVrLdUkzsRyMWPRI=;
 b=E3clQHMxQ9bK1oEhWI8AnP5JIq2Xte9SjMac6KEr5wshG36XtEChNVAHYw/QBdewMeUblz7Oboons95sfmzHJPM9kOKkxQtSteLZskYJDmGaIvzomk37Xvkd6bi8rb3u7GHJaRej2ShRg4Zcn29fw3R+8KTlmhH9ReUH5rBycddBoXk7B/fHW4KZ4ffIabLUl7396dDA0rGwPjuilTV3rXKGfjfEYAMdEu0GPeWdZaDFO/nS1YRp427lNubN36mHU1Az5+H8EhnVyRe6AEet0kvL0CXp51OzcMOrWyDYaYPKv0fu0LZdpQh99jfhy3ndEsXGSLA9tVyzUeaZkQWhTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: preparations for 4.15.1 and 4.13.4
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
 <8324f959-924b-d196-149d-2fdad95da8fa@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33925d95-163f-e893-8622-27c45ca30c62@suse.com>
Date: Fri, 16 Jul 2021 08:16:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <8324f959-924b-d196-149d-2fdad95da8fa@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0242.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::14)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff065343-53b8-489d-e739-08d9482145b1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445361551313A3F03D91B7FB3119@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a+QEP6njXxwyGWr6CAPyIB7JOX1GFU4LkuX4WnJsM/V7//Nxz1qNwH8ChYnpswb2E3/ZOL8Fg2MtHDpbO2TEimNOnoj1m7rE7mCR9FMyg71v8AC5pjOBSeBdLExRC3EwT+20au47O0lW4ZxmBcpJr3Wn8ZCCbrjDtiZZ1LnKXZG6ZCPoPxgYV8F2IW8t9ciegCkjEZ1t1AXHewBLhdyZnjzJgTcs2NfVJmvKhw5AFGWB/Gkrqr9BZMxRis4n2F8DMGrg+H9JfQGVHk/7kQkcNf+p+eL65sfBHcGEbwAU62xbJufLuCJyUXXrC5Llm+NO75Hwzw8PCFhHE50brGbW6ZNidYWzMm2ljOztpPcTbaQj5yoSWxmYTVomECpyJhuVMHqyZ6End0eBZNQ3Y5FMiFWx/62bBZ+1Wg99r7LwTDW/xFsuftfr5tf8PcVGxT+44E+oKYmM1Una4KuIz5Q34ptiBXwQZQ70CwmdxhcpVqqx/pe7wjCjRYevXgpk4/n/0fG/jWUkIOrh6LkltJltVYIjq42E0VIFbHN/ZllZV5K5RA1r2y4dbkIC3HSSVzX2ZZeAclIy5jkAw9nDsmJ/RFAPVz1MLdpvfmNC4DVLOvZPMxRNU60EqN76GBlfv1GJ5ma7WnvCK2XEt2P5+tFPXC+QrxlL62ESxeYR5SVR0Op0dcJs0KZ8Cgm6YM4IHKEhFd4qiZjVt5HH/nEdHhiTQN8DYxMDLbu7Zon9gP2HfgU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(346002)(396003)(376002)(366004)(478600001)(26005)(8676002)(316002)(6916009)(16576012)(31696002)(54906003)(186003)(8936002)(4326008)(53546011)(83380400001)(86362001)(5660300002)(66946007)(2616005)(956004)(31686004)(66556008)(36756003)(38100700002)(2906002)(6486002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Z7p27c/wI6k8vuc9UzRCL8wjnBPGqDOojoWa+4TCgYp50Fb1A/b1kLovPIf?=
 =?us-ascii?Q?PG+9gKTNqyzSFLW3V1V3ZAg3uUUeJ8CtTDe4wZpQfclEeK9dbsLkevUynJr0?=
 =?us-ascii?Q?TWbGECBeXM2neL7nmtPBwBzaBnzTcFyV/7ca3X8DcbXGeP9CliCzharJEKNA?=
 =?us-ascii?Q?pxuSZq6VO/v6RjXfoCXshvqcwanvgKBuMl/nuucnlxeitSKb84N2BscgzM4I?=
 =?us-ascii?Q?ZQMxvM3l+Ei8/FLStybwkwMgBc9pRvocmjKNZvvSQHl9580vwf27jk+s0Biv?=
 =?us-ascii?Q?eVYhGHFdxN2/eT1uGxttYKoliZfQ9P3YnKgu65BjYJYgug/ZmL7+sSkoBc7P?=
 =?us-ascii?Q?GRX72bXx5WSTzrzs3vnzbHUMf1sInHXVIgtH+T5/yh3Kvdp9D6ArhrHkgHvt?=
 =?us-ascii?Q?6VMoSmN7fkMr/ODLrEtgdSOy0xL6py07qyMh7azdfiwzEp4EewcBfs0RC7y/?=
 =?us-ascii?Q?ihPgOqWrLqYdMA8ajoxY8szI2jwpooG7ZG2UfGcFfEWvA09u1fy0Bc3V8Xm7?=
 =?us-ascii?Q?IlNyw9Pv6clcKnqsfNfVlZx9hQoaGz7SEbiBJUiQq+trV6JrEbgRWbm8MNui?=
 =?us-ascii?Q?gWgT1lNVQlENhJ+whApJq/UFnLRQXwZsCuaqAOdeU2wU0UNs4DmJ3ZbJTF8J?=
 =?us-ascii?Q?YtunwgRQ41jy5MQ+F4XR6MRnNF3uCDmZD2FeWshJdWsqjuPQYgLbE+z7o/Rq?=
 =?us-ascii?Q?oKKCaOTZXCcZ9RznZGSthNCvxdAAHcOm9e50/M04TgR4OlbfUwmNlracHK3Z?=
 =?us-ascii?Q?OGo75DLPIkUGbanc6KV/UiHfpq3FRG74SOgX8L87+oOjIC6iMTHqLbM2emum?=
 =?us-ascii?Q?4aD23lJ77+UvyeUKGG08e7xFyWYFSHFrmHCtPKXu/v1fLWe6gJnaIJh0PZ90?=
 =?us-ascii?Q?YRYhAlmNiRSoJVB/fniKt+8XAO9tfHQtHfLBqdZji1EvLDmZSKc7UZbsiV7Z?=
 =?us-ascii?Q?CCSTFiZ8cSsHIv/0xUezLO09AyCfEpye313R4DavIs2YAzdRxuH9To/c678u?=
 =?us-ascii?Q?baZ1xjxtbTA4L09e5JWoXe/qsRP+9Ngf9+Q1PyeMNFpHP3Gbxt9zLFngAxKx?=
 =?us-ascii?Q?tzzZ/UXiV+9oBuqnAgiFAqjovcb6FfaME8u1hWMMb9czC/Odqd04qCUgqRJ5?=
 =?us-ascii?Q?HdJ2gpRh4yORs21bQ1NIpYtU299DVV9NSZNbNWT6hz4WdJ1oqV9ZVvlyVpjH?=
 =?us-ascii?Q?g/EiPXCg/pT2EcYwgMD9U0squ7LLOiwlg8fyy8Jd/7f0rvXd3u8GFM80Zl+b?=
 =?us-ascii?Q?mpoPmTvnwg9RJLbXE6xXxgylFY93lzaF7aKNeNpw7f15uLi0xDYMuCNtwR/W?=
 =?us-ascii?Q?oXASn8MS1qzZA73XChQGdRHC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff065343-53b8-489d-e739-08d9482145b1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 06:16:39.1342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMgh2uuTvbWEJPvz0wtV2OWrPhWJDtXTyLufnUBXexxlHVI4ruwoH1SR0HJ0Zs11LGIzW4Cs/o0F2bVzvfFo6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 15.07.2021 19:16, Andrew Cooper wrote:
> On 15/07/2021 08:58, Jan Beulich wrote:
>> Beyond this I'd like the following to be considered:
>>
>> 6409210a5f51 libxencall: osdep_hypercall() should return long
>> bef64f2c0019 libxencall: introduce variant of xencall2() returning long
>> 01a2d001dea2 libxencall: Bump SONAME following new functionality
>> 6f02d1ea4a10 libxc: use multicall for memory-op on Linux (and Solaris)
>>
>> If those are to be taken (which means in particular if the question of
>> the .so versioning can be properly sorted),
>>
>> 198a2bc6f149 x86/HVM: wire up multicalls
>=20
> We can backport changes in SONAME safely so long as:
>=20
> 1) We declare VERS_1.2 to be fixed and released.=C2=A0 This means that we
> bump to 1.3 for the next change, even if it is ahead of Xen 4.16 being
> release, and

Right. A matter of remembering at the right point (if need be). That's
where I think the risk is. (And of course I understand you meaning
VERS_1.3 and VERS_1.4 respectively for "fixed and released" and "bump
to".)

If we did so, what I can't tell offhand is whether any ABI-checker
data would need updating then.

> 2) *All* ABI changes up to VERS_1.2 are backported.
>=20
>=20
> The ABI called VERS_1.2 must be identical on all older branches to avoid
> binary problems when rebuilding a package against old-xen+updates, and
> then updating to a newer Xen.

I'm afraid I'm less clear about this part: There shouldn't be any ABI
differences in VERS_1.2 in the first place, should there? Or, if the
number is again off by one, the sole new function would be identical
(ABI-wise) everywhere.

Jan


