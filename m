Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465A14D5EBE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 10:47:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288882.490007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSbrP-0004pL-Ja; Fri, 11 Mar 2022 09:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288882.490007; Fri, 11 Mar 2022 09:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSbrP-0004mk-GJ; Fri, 11 Mar 2022 09:46:59 +0000
Received: by outflank-mailman (input) for mailman id 288882;
 Fri, 11 Mar 2022 09:46:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSbrN-0004me-H6
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 09:46:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30092247-a120-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 10:46:56 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-zs8btPepOr6MY3qK2X0wdQ-1; Fri, 11 Mar 2022 10:46:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6799.eurprd04.prod.outlook.com (2603:10a6:803:130::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 09:46:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 09:46:51 +0000
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
X-Inumbo-ID: 30092247-a120-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646992016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GC2zDr7UR7aIBiPkvxzEq6mypUYB0YYi4fynC7MtBhc=;
	b=idAgvm8e8rb7xIGcfdpnTP2tCumB2EmcaG/Zp3v8PnZ5L9R7LZWVE0XnE5QFwRMy0x3trz
	K6k3mH6LlygxzJNB6rTsdS0IsdJNRQ7BxGXZg4vqQVyOQoEnstngBY/u7/So6GmkYApFhx
	epIs99Mc43735hhVLB34QF82frnQ2nM=
X-MC-Unique: zs8btPepOr6MY3qK2X0wdQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZMMmcigDDsov/Wc97RRVrJ79I0Mt88pUOHw4LTvqKpozJtFBHYkhPo2T13DF+/XhoZigBNF+vbyKuNc+3tEq1ZGHtqnsR7j2njC//FqegzpXhtU1YsevP2ZShtnjJv/UAgtqN0/dAXv/DfoFL/rVOURbOvNyACvJww/naB+2ayun6biUVyeRD5MYTxw6n4c+B/WYK4y25Fzg8zdmEPdgxgSPhkTb4xomOUWq0/dKyZSwVz0hgKCG3Xq8iXF5/D27PmeP5FUo6YDPJrbH45HsfGAfDQ0r2pn31pTDvx7yeyZcxROd8S97oYqWZq3/ydgaHIxUzyMCIGQ7DWz8KIsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sadzFknVB08MeOjW+HL4UeJqEuTAHjGcpcSpPOCsao8=;
 b=dEW20dGzS8hXTR4LcymUlUnEqVrsEyWcKuOBmnu5p6BHn8NasWj7CswQ+dgGCXO3R/XqxDpTpwPZQEUkjMT8FnZ4KFtGSdgvbftBnm2WQHc+hyqKegV/idiKoWWx1Eq2IZS2fLpUQimAAXjcdgjl4SpAu8zEe/jU8E8a+KS7KbFHsNFumMO6nXMC3p3Ntd4rlGJQOacaHD9PJ+jJbvQbDvEPh8APN3tt16QwYS4RJQHjujXePpV8xu8lHSU9eZ1mlvqFqnoNRQiHyQIzrmNz2H/IA1UXVcfB94L9KgKoRC+7huK1WQRr56afTm3BIbYWq7/0zVLermEeYKLpqT9D5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <26fbe29d-b5d3-2ce5-a16b-ca05329c778a@suse.com>
Date: Fri, 11 Mar 2022 10:46:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 4/6] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-5-luca.fancellu@arm.com>
 <378565ed-80d4-e760-2e25-f5d2e4cb9ce2@suse.com>
 <0D3FFA8E-A904-4375-BDBB-2C974C224D14@arm.com>
 <21783c1d-d8c7-b03b-2221-5e34b4bd0fd4@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <21783c1d-d8c7-b03b-2221-5e34b4bd0fd4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0070.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb4b7d81-d8c9-43f1-b551-08da0344116b
X-MS-TrafficTypeDiagnostic: VI1PR04MB6799:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB67990A198E3315EEF81904BDB30C9@VI1PR04MB6799.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dkkezmcVFR5ZP+s8SaS+nVvCMtpP1qFRHCrwhoS753EglQPRi44/MGb+4SFpDEUSFEaU06O80YhK4PCbwP/g2XjdmCTv2r3QL+lYT56Qhywj3jW9wZBMY5PCQKDrzM4sPM52aBc1/wSprAVT429rgn766lscW8mCOIiv3PvZPaojblygfIf7h/YYnURcrIDIF3wmMGexBkd4oK2x1KiLiDnE3mt1uDhHBpfakyJ8ddrFNlXQIfASM+nu5UNzR5Ko3LUvuUxXdkwBkO26OZiNDoAaS9gzkUpMuUUTqQ88wFhScdEYwDsRwM5b+UGUK8FY778zR/T9AmA14gWg1+p63KxlZ4Ib9UaVlbwxZxEtuNO5RBm14oKYklceoL+HhJyAKAH6lBnS8PLMOx3OpLIpb/xLdDYuCiHJ1hPogqLZqtsz2yXDnL08o4uWQjWy546lPnZhrKNvTKOUaD2B+0DTGlt3PlD8vUqQmpu7C1cakq8VMgX5JSLHz2LPEvYfAZdALDS8d5oopV3B4jqd0WpGdFHWzaUl2ECHi2FtLmOED0JLqKy4jrqgkynCwaSJYqwdVN+8qmSmhI/c6fisWQRSO8HahE1HInm7/f9b4rC4lwnH9j8S5RJqy4lNw18JxOGdZlTUD6ykZfEXGSTw8jOKBOX5W3qsocTVEElFpmd092TCRSj78Lz75mH/v2mSharKKmbRa84gBSsj7OnKrMhpvfVIGZaDW3joK7cL+5w3yI8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(54906003)(110136005)(26005)(107886003)(186003)(2616005)(508600001)(36756003)(31686004)(6486002)(31696002)(7416002)(86362001)(4326008)(66476007)(8676002)(66556008)(316002)(66946007)(6506007)(6512007)(53546011)(38100700002)(5660300002)(8936002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uH2xkCh+jqqcghuOjgiLR5gA72ve0JfwIIvBufahNbLaNDEBNWuLwPMjaYL+?=
 =?us-ascii?Q?Kd8DPf7d3Ne40AjCaFiSOoSIQDA1Vz0R8Jvy1SnxjrLb+kbpBQQGEbpe0nAC?=
 =?us-ascii?Q?uxHLlSr45jFbM/j7uVvROKYUkGWMKAuE7OedWCiVK0vhK0T2cXYAtI4HV6Pc?=
 =?us-ascii?Q?qqMWeZN7auJSBsFAUmM9EMCbt1PwGBm0+BhGZvsxnOwSZOU03isomXp93MfA?=
 =?us-ascii?Q?3AU5QWxhyZ02V3bn0F1GabFoeK5P/kU1XqVEV1MolYiEOeiRz9Qes/SrnDOK?=
 =?us-ascii?Q?yDumqQ13IqSPBSp1H1XxT+jY0hAqusq+uD9RR29/5ZTRV5Uyq1AgzncSnGl9?=
 =?us-ascii?Q?nK0v3GTYsh8QJqCMLoiEaBQya/ls8I5G7AB8DBDiFXS47R/k9tKRUc3KxjV2?=
 =?us-ascii?Q?/6NRXykrwB7ZQXwd/RcZBTpa2BBzWRaBgnl46DTqp7Ss3jMzFR0rjPXHrTsD?=
 =?us-ascii?Q?o/NqvzUVosxCq+yfkshhPjp3JhspxJI4QnKeMH6RUaTOpWDXE1L3GLiQ0V35?=
 =?us-ascii?Q?UjaSnGIa16U3GGfVPx72lnEN05Yaa7fRsdDAjIia+XHvCJNjDUYMTHLZ14PA?=
 =?us-ascii?Q?Bc3bja8xjJT+msRi4TKln5LFwq2RNeddp1lOKFOB5Suub5R+43WTeF/zrKKV?=
 =?us-ascii?Q?4YJCvKXcNtxj5r2/ilXvApHOkaix/O8T/Vh4B95BRv1c87EqFSe2yN5OLo4s?=
 =?us-ascii?Q?4NauOZvywYRbL+BJmsOWcDcMmqLcfMxaxdQO0nRhPsI62262sZUjFsy8vKwp?=
 =?us-ascii?Q?z+B09htn70LhrtgWx/ADYHrblCUg8S/PUtCw3bBauscUD6n8+HSIsSj0JKhR?=
 =?us-ascii?Q?WBz5CiebC8TsxPgzr5v2skjWXy6P4VXQSmA9GbNJEgLqpaJ3OUne1LVcjWtJ?=
 =?us-ascii?Q?vRi58byDNH9cAP5PGmtSZzsvbe2u+qBnN4ZXKuzn+gm5MXRfZFva0MlZPoOE?=
 =?us-ascii?Q?SSeirYHjxrEJ6H2J4cdR4SM99oIKgtx+qB6xdN/Wj2k3iAi33cX68qftVyJd?=
 =?us-ascii?Q?8lwwLX2u7kaojjjcGNz+WMIIj1FnzsLhsu4hB8iy6CrNVIdXIenT1iSPCA7Y?=
 =?us-ascii?Q?R2RAD9m5LHM+BMQ5Nj5NGp/CPQvktBNl5ZX7QBPpH3QUJroLNrWCO4eBs0yC?=
 =?us-ascii?Q?FAc2NRUVCjsRvGb6hONuzVLpH6Rswq8WpCa/Wqt50uX6oz0Ty94T6fr9f4HI?=
 =?us-ascii?Q?j4K5/AJTrgAWWjEJJVL0YeujVlIUbJC6OztIFSALtobogkwU05qFQETRafuO?=
 =?us-ascii?Q?xWWKTUYfK/D1G2ec6SFvcpyMW9lM9ryqGjhXYaayPXOlYK+jUpaeF6ofEwJ9?=
 =?us-ascii?Q?2EE6iJqNPgClR+TRt57FCuzhkn5kV/4Y5TjNJQCUoC2VOU+xwsIggkJj2xXk?=
 =?us-ascii?Q?dXd+EyGvZ7JEw9vlKPBmRS7tOcgGe8iBQi4TeyTNlf3R5XdqgDZcGFsyi0mk?=
 =?us-ascii?Q?yiii50n1XWR3drsJ7eVHdxBDpTYfhx8e?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4b7d81-d8c9-43f1-b551-08da0344116b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 09:46:51.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8yDks3fRTkskZ7oo1x7Gw5cdgL/ncyfPTxDlTtM2ifdjh1ZHAWfbU7WtfwNKT7MaK+czYEAELDsCQgjMIywag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6799

On 11.03.2022 10:29, Juergen Gross wrote:
> On 11.03.22 09:56, Luca Fancellu wrote:
>>> On 11 Mar 2022, at 08:09, Juergen Gross <jgross@suse.com> wrote:
>>> On 10.03.22 18:10, Luca Fancellu wrote:
>>>> --- /dev/null
>>>> +++ b/xen/common/boot_cpupools.c
>>>> @@ -0,0 +1,212 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * xen/common/boot_cpupools.c
>>>> + *
>>>> + * Code to create cpupools at boot time for arm architecture.
>>>
>>> Please drop the arm reference here.
>>>
>>>> + *
>>>> + * Copyright (C) 2022 Arm Ltd.
>>>> + */
>>>> +
>>>> +#include <xen/sched.h>
>>>> +
>>>> +#define BTCPUPOOLS_DT_NODE_NO_REG     (-1)
>>>> +#define BTCPUPOOLS_DT_NODE_NO_LOG_CPU (-2)
>>>
>>> Move those inside the #ifdef below, please
>>>
>>>> +
>>>> +struct pool_map {
>>>> +    int pool_id;
>>>> +    int sched_id;
>>>> +    struct cpupool *pool;
>>>> +};
>>>> +
>>>> +static struct pool_map __initdata pool_cpu_map[NR_CPUS] =3D
>>>> +    { [0 ... NR_CPUS-1] =3D {.pool_id =3D -1, .sched_id =3D -1, .pool=
 =3D NULL} };
>>>> +static unsigned int __initdata next_pool_id;
>>>> +
>>>> +#ifdef CONFIG_ARM
>>>
>>> Shouldn't this be CONFIG_HAS_DEVICE_TREE?
>>
>> Yes, the only problem is that in get_logical_cpu_from_hw_id I use the ar=
m specific
>> cpu_logical_map(=E2=80=A6), so what do you think it=E2=80=99s the better=
 way here?
>> Do you think I should have everything under CONFIG_HAS_DEVICE_TREE
>> and get_logical_cpu_from_hw_id under CONFIG_ARM like in this way below?
>=20
> Hmm, what is the hwid used for on Arm? I guess this could be similar
> to the x86 acpi-id?

Since there's going to be only one of DT or ACPI, if anything this could
be the APIC ID and then ...

> So I'd rather put get_logical_cpu_from_hw_id() into Arm specific code
> and add a related x86 function to x86 code. Depending on the answer to
> above question this could either be get_cpu_id(), or maybe an identity
> function.

... a lookup loop over x86_cpu_to_apicid[] (I thought we had a function
doing so, but right now I can't find one).

Jan


