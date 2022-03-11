Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A774D617E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 13:28:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289013.490281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSeNO-0007vK-W5; Fri, 11 Mar 2022 12:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289013.490281; Fri, 11 Mar 2022 12:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSeNO-0007t8-Sp; Fri, 11 Mar 2022 12:28:10 +0000
Received: by outflank-mailman (input) for mailman id 289013;
 Fri, 11 Mar 2022 12:28:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSeNN-0007t2-Qe
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 12:28:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b51ce636-a136-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 13:28:08 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-U0j3EKQNOUuZVauAKlrfmw-1; Fri, 11 Mar 2022 13:28:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5028.eurprd04.prod.outlook.com (2603:10a6:208:cc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 12:28:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 12:28:04 +0000
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
X-Inumbo-ID: b51ce636-a136-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647001688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ovrxvzJCrIzbaOGDqozVwtiad8yCZaikFFQCMLG6z+M=;
	b=fE9ogMOpAZ69kCwtq+ON9+7GZ82WqFE1d8jC/7nV7SYu8DIKDfwV/c8JtavHaUxTwixaEw
	OhyuNXV3Y48z14bT/92zsiUi0UAlbB4gjJLvnvWpYd/QwdbWzYWpTmL3DQ7acZyWNbXZdu
	k6wjsNEkE5UPJyDXK/Q1+CbnCvIckms=
X-MC-Unique: U0j3EKQNOUuZVauAKlrfmw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEVaqHMJtWmOsRObqNmUiXKezPs/edKfDbKw2EDuWjvmp3GeH0bnlnynVgid3+0WBKKx+KtD4sLyPnqdc8QOuR//siCT0ulXWhVD6TnrPyzHN+h5HjEeA4D4SS37y1fZyEO4UjJiumdO6wGMAInRgIkgF5zAJXkQqsfD7+TwfOpdjLfPIwtHLu9tE9LvLpgiOjaJmw33+3g/TZg0LHKtZGIHAWEQsg0UcMenz39lz8itsBp2dYUkRT7BedOVBSH3DXYWNpqxpGf/oWhpbYHM2n1Htu6D2RaAB0gove0VJJQm9wnlkzTvVU3E/czStGUhwP5+kQlPNdVJ4rQ/IPdS/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5xjwBOe4g63+TsspZ5O0F0zu3Yh/XSsI5xQ0WkylhA=;
 b=h1bmc5gDG2ryZQzPJzhVWofGHJPZSjQALfnnzL+J2Nl0PwLmHTh0yruLJdkiXxQ69DNKWziEbde/WyuRgKmILM7eYZtLEkywm6XbfVhuKgKY8xi7CgksUoxAvY+MEqQJTI1M7jIWF10wIrpW97ygLgUYAQjvh589I3swrT5Vti2Sa3tKNgsqGxS/1hg88vAGNsHHFTttE77zb1zj7CPWRNxdhG8W84PX9gFYcEeB0JgOhk/iG3aTMjgtlTuZYiPoD2hwsxDHw7F/lElnr0JQLFBfTlYZuecwhcIvkLbQBawoqf6HWbW7amkOZ7Itgx45tWxF3TWXB9BVELziljzmMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <453ae515-d97a-cc0b-7b7d-a505a8904f03@suse.com>
Date: Fri, 11 Mar 2022 13:28:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 4/6] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-5-luca.fancellu@arm.com>
 <378565ed-80d4-e760-2e25-f5d2e4cb9ce2@suse.com>
 <0D3FFA8E-A904-4375-BDBB-2C974C224D14@arm.com>
 <21783c1d-d8c7-b03b-2221-5e34b4bd0fd4@suse.com>
 <26fbe29d-b5d3-2ce5-a16b-ca05329c778a@suse.com>
 <918fd4d8-99d6-3acf-0637-7feda1e08f71@suse.com>
 <509DF3D9-A0B4-4139-8DE8-C4276C16BD26@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <509DF3D9-A0B4-4139-8DE8-C4276C16BD26@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0063.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dade818a-eeee-4889-1898-08da035a9705
X-MS-TrafficTypeDiagnostic: AM0PR04MB5028:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB50285BD9335EBE2CCA33D89FB30C9@AM0PR04MB5028.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	09YFTGPv+RdnD9NGZJEgGD+EepB2CjbnTiPocQOGxyZ7WrX8q4QIZL94pODKIvrg+T/dsfutTCju0ZNgtM5m6hgXLkLu325ektSSCq6f0HPLE6JLSRcX0cpIepxte9VhnpBCuEeuQYW8CMchrJeTs969+MWl8mK6oBQCUujpMiu/Cue9yHwzc1NKZ7X66Iqtd7mmRLoDrJzW9OPSKs0BRQzR/LwJd8vPgzL0n9jxFv+mpD+H8pX9FHJvhLTPkNoyP7JP0DmeB4EqBaGDzU3xj6hYrwhjrJa9rnfT1lGgqB5Q/yoBRhm5M0k8eR8lJTOT6Wnez1dzwnRZSOpsdmrVF05r7pvOQ9s2BvV1QVG6bmRBAZKCXThUWWXXR22rffJM8FYRWswzDDm3tnML+X6MCDLKL1nElbPR7CRNvdev112P/No9iCPCB7bykrMMEJwShcP40V4dXtg5vS/k8F2x/GGcngGFXNU+uZdOghQ2oXcK+thXhMo2Hzxnye/lGOruYFa83ADZuZsR+UF6F9xqOzd2ics8yTIBWMD9D+fZlgIDkJ0SAG0XWs/ZiluO5nUHLnoYSOCi1ZPYRvDRO+7pTa//3V4SKrnhyZB5HJrmJJw40UhfAsmm34ZIPwn1+FbzywFPTQi6b91GKJypnqx/EOzfxWpsNwBKtwqRoo0X9VOtuNic9LAU4jc6ROjl/xJkbuWKOjLKW+UVtOrJ3FX6968WH1Mwxt0VZr03dQBpVYM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(107886003)(53546011)(66946007)(2616005)(6666004)(6512007)(6506007)(36756003)(186003)(26005)(66556008)(6486002)(508600001)(8936002)(54906003)(86362001)(2906002)(66476007)(83380400001)(4326008)(31686004)(316002)(6916009)(8676002)(31696002)(5660300002)(38100700002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kXA8nZz4fHscQ+M2Nl6nmm07ArfMzzp6J7oRIZEJP6EhdjkHwdTboJt0iMz1?=
 =?us-ascii?Q?TVoLiGRuIokIU/jhuovgpaqAng/kj3xGPPUUKMjziuRRoA1jL92pkU/DP7xe?=
 =?us-ascii?Q?c1A9eqAhBQU6fhaNXKApXFMoLuOOfmLW9ra0SKBuT3EjTfsYxELw1C58lCHI?=
 =?us-ascii?Q?E+WfVcEddqt/mSZhT5S4MSz2ku0CghmOEJ6+r8iGQNXmVzxlMecC+/Q8zPj9?=
 =?us-ascii?Q?/xJ22PoowjcxpCh8kwcRhumOpzYw+6KNmJlJk4SKRsNl+i75kehDP1/7/SxY?=
 =?us-ascii?Q?oC7DInUePajbeW5W1Agkc+GpzdISEanUhwOYPVlQ3cDhBRgm0DIAcESaxUIx?=
 =?us-ascii?Q?nshl/ntp4BYc479Iu3CiTPim46igbvflY59XlGxxftT9zrGwlRMydoo+kAke?=
 =?us-ascii?Q?WvPQCySKLjmZhw3vSz2fzeBXpj7HXihab1rZJFyu5Dheydk/wRZQfBX7KWMe?=
 =?us-ascii?Q?DRRwNLO5ENEwUrEVGF0VZRY18UbMu5HEmo1cwFOBgw7A7r/x+hg48qF1xWnc?=
 =?us-ascii?Q?xMJcN5OONycWgjBJqlQFgqd++qOsCEox7qojCQb35QqNy4QNErLeHc40qZPf?=
 =?us-ascii?Q?BucVsNU4duYbl/YNysQhadjOzFxqNpdLw+f+slv3vIS5kN57ZG+FAtwFSNvN?=
 =?us-ascii?Q?+KlrlGuOhfpGc455bK8rPPL2tnYJKaSUnPlFZVPus+cfdev6bwfVzdRqiCpB?=
 =?us-ascii?Q?/JtoWMSzcn0NQGw2oByABGqPKIynQNO4XczR0bJZfhQrxxetK+75g1Ci1GhY?=
 =?us-ascii?Q?XDsp0MkldoY8jjzH/AR7ByhcG9l15sVaibmSFzp57kbmjmgHInBS7WoJBH7h?=
 =?us-ascii?Q?FiWaYsQzFoHZuiLr/4iVrknZu3DcMEunPI7pRvgVDUHTBCi/PwaKnVHn/F0R?=
 =?us-ascii?Q?YQDWMeLBenGPrdboz9pMBf84prQtk776tzQCYB8v/ji8nEUyQavdXPr7xPZS?=
 =?us-ascii?Q?Z1faTypzutvVDoiki8gy/03bGqe03PuWESlj91DBiu0CN3Mf9P7ih+c8HnCd?=
 =?us-ascii?Q?taryTvpZAmGQAEVwIEGuRQri9Y/PIvvbaeWHJVO7YWtJHOoUsF29LvDG/76w?=
 =?us-ascii?Q?szZFuUnVV0CFJuyIYMrfFbmGUT/klqGyi5XJYzm1czJK1wcIAZNmcsuRKtbm?=
 =?us-ascii?Q?TRjQCES6C8LSG60ifaasf5SFzug57zOi19rqlMw1tFsYxWqWxSGHPTcni8Bf?=
 =?us-ascii?Q?+Cb2p063DBajAqmOcz/mujAVdh7IKUe2P+O2qP7yIG111VpVal4MJguDRJW9?=
 =?us-ascii?Q?GwVoyB4sCAF1AUvPQQeHGyqE1baoMb2i75FyArSRKcIEI58vmwzo5Pg55bqP?=
 =?us-ascii?Q?MIeFVujIR6gp3g9LVcOy4z6ihAuz4jttnzMd7tmF4PZpGpuJ0jyrb2iEbft5?=
 =?us-ascii?Q?0e9Xb/USikjIoTaKlPj8dq065W5NbkaItygRD+leUSmLgSnQnrGCY+7vBfiK?=
 =?us-ascii?Q?ygSk5p6CMsuPnwvFnmhD5XUXAz/ngBnA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dade818a-eeee-4889-1898-08da035a9705
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 12:28:04.4479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOyZZsx3S9Ieneki1Jbr7Ql4zib1K1IfgRdbRIj1XqGlIc+1bupfVnIYHdKiadT9QAxg3UCWFEfIboL0fWphiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5028

On 11.03.2022 12:29, Luca Fancellu wrote:
>> On 11 Mar 2022, at 10:18, Juergen Gross <jgross@suse.com> wrote:
>> On 11.03.22 10:46, Jan Beulich wrote:
>>> On 11.03.2022 10:29, Juergen Gross wrote:
>>>> On 11.03.22 09:56, Luca Fancellu wrote:
>>>>>> On 11 Mar 2022, at 08:09, Juergen Gross <jgross@suse.com> wrote:
>>>>>> On 10.03.22 18:10, Luca Fancellu wrote:
>>>>>>> --- /dev/null
>>>>>>> +++ b/xen/common/boot_cpupools.c
>>>>>>> @@ -0,0 +1,212 @@
>>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>>>> +/*
>>>>>>> + * xen/common/boot_cpupools.c
>>>>>>> + *
>>>>>>> + * Code to create cpupools at boot time for arm architecture.
>>>>>>
>>>>>> Please drop the arm reference here.
>>>>>>
>>>>>>> + *
>>>>>>> + * Copyright (C) 2022 Arm Ltd.
>>>>>>> + */
>>>>>>> +
>>>>>>> +#include <xen/sched.h>
>>>>>>> +
>>>>>>> +#define BTCPUPOOLS_DT_NODE_NO_REG     (-1)
>>>>>>> +#define BTCPUPOOLS_DT_NODE_NO_LOG_CPU (-2)
>>>>>>
>>>>>> Move those inside the #ifdef below, please
>>>>>>
>>>>>>> +
>>>>>>> +struct pool_map {
>>>>>>> +    int pool_id;
>>>>>>> +    int sched_id;
>>>>>>> +    struct cpupool *pool;
>>>>>>> +};
>>>>>>> +
>>>>>>> +static struct pool_map __initdata pool_cpu_map[NR_CPUS] =3D
>>>>>>> +    { [0 ... NR_CPUS-1] =3D {.pool_id =3D -1, .sched_id =3D -1, .p=
ool =3D NULL} };
>>>>>>> +static unsigned int __initdata next_pool_id;
>>>>>>> +
>>>>>>> +#ifdef CONFIG_ARM
>>>>>>
>>>>>> Shouldn't this be CONFIG_HAS_DEVICE_TREE?
>>>>>
>>>>> Yes, the only problem is that in get_logical_cpu_from_hw_id I use the=
 arm specific
>>>>> cpu_logical_map(=E2=80=A6), so what do you think it=E2=80=99s the bet=
ter way here?
>>>>> Do you think I should have everything under CONFIG_HAS_DEVICE_TREE
>>>>> and get_logical_cpu_from_hw_id under CONFIG_ARM like in this way belo=
w?
>>>>
>>>> Hmm, what is the hwid used for on Arm? I guess this could be similar
>>>> to the x86 acpi-id?
>>> Since there's going to be only one of DT or ACPI, if anything this coul=
d
>>> be the APIC ID and then ...
>>>> So I'd rather put get_logical_cpu_from_hw_id() into Arm specific code
>>>> and add a related x86 function to x86 code. Depending on the answer to
>>>> above question this could either be get_cpu_id(), or maybe an identity
>>>> function.
>>> ... a lookup loop over x86_cpu_to_apicid[] (I thought we had a function
>>> doing so, but right now I can't find one).
>>
>> It is the second half of get_cpu_id().
>=20
> I was going to say, maybe I can do something like this:
>=20
> #ifdef CONFIG_ARM
> #define hwid_from_logical_cpu_id(x) cpu_logical_map(x)
> #elif defined(CONFIG_X86)
> #define hwid_from_logical_cpu_id(x) x86_cpu_to_apicid(x)
> #else
> #define hwid_from_logical_cpu_id(x) (-1)
> #end
>=20
> static int __init get_logical_cpu_from_hw_id(unsigned int hwid)
> {
>     unsigned int i;
>=20
>     for ( i =3D 0; i < nr_cpu_ids; i++ )
>         if ( hwid_from_logical_cpu_id(i) =3D=3D hwid )
>             return i;
>=20
>     return -1;
> }
>=20
> Do you think it is acceptable?

Why not, if even on Arm you have to use a loop. As J=C3=BCrgen said, this
likely wants to move to some header file. Whether the names are
suitable for an arch abstraction I'm not sure, but I also have no
immediate alternative suggestion.

> I see the current get_cpu_id(=E2=80=A6) from x86 code is starting from an=
 acpi id to
> lookup the apicid and then it is looking for the logical cpu number.
> In the x86 context, eventually, the reg property of a cpu node would hold=
 an
> Acpi id or an apicid? I would have say the last one but I=E2=80=99m not s=
ure now.

Without ACPI it can't sensibly be an ACPI ID. The most logical thing
to expect would be an APIC ID, but then it's all up to whoever specifies
what DT is to supply.

Jan


