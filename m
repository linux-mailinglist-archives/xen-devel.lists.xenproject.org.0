Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2CE632790
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 16:14:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446707.702448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox8Us-00065S-43; Mon, 21 Nov 2022 15:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446707.702448; Mon, 21 Nov 2022 15:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox8Us-00063O-1B; Mon, 21 Nov 2022 15:14:10 +0000
Received: by outflank-mailman (input) for mailman id 446707;
 Mon, 21 Nov 2022 15:14:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox8Uq-00062w-8t
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 15:14:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7d00::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2396db6d-69af-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 16:14:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7768.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.13; Mon, 21 Nov
 2022 15:14:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 15:14:03 +0000
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
X-Inumbo-ID: 2396db6d-69af-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFwaQB3Td62GETRX8wOnNzZuX0d+l4LOuxfX6SjJN5sCH4jcYg8McWwrg05Pj60d1+eNgud2VASXR+L/CBOd0cxVkZMXL+u8gy8dAiFdjwbMyhUEYJphd2J5fdfuilrZchSu2FymvipI+Kq44vl0P5fvnibZhh7Lz0dL0IC7pOFRaCGUY1vVqYjwf6ESk5o8NrSdpbv+A/qdO1eOwzvSfMXd++zZn2UfOenA01+xNQD02RFEcDHNQBABiIYvaZVUn2wAtsK6Vax6J52awBbXJYCmA3ArAuL6FV0Kzn0Vm9OQD8r660HHLfu1FDHPSyLg71SpApFWxh3t/mVtD6Yhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1l+5WKkemKXygWG0sUNz4ML3UDsCgcH/FILormivZg=;
 b=PNRJrWkrw6TRWNnD0DVxJbRtMvSrbaSjMSioqVtcK34gOaJieQ51Bdnrk7wy80Gmtw/ZzSIR2JnHit2uksJt/vRCOYOkeUGoc3rOIT+v7y6hBYhP8G1beVdmgxjaA0x+wq9zl5F9l57Pul31kmoC8xzj5m4W4uf2i5mQ7eQXqEoONARjUvCGzFggZyjnaeXesnLETf2ZfRbOlA2qG+cdvXl6yRtMKR2/Q4zwlaZ0rUBcjJ3ak+wkKMMy/iO2LIbXkRcjTfjCI1o7Yn2Qnrwz8azOb1jlH1ErwkQxznkpMCnLVcoSNXMww9paal4gq8wf2dCqzQkb93wMNFthn5AiNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1l+5WKkemKXygWG0sUNz4ML3UDsCgcH/FILormivZg=;
 b=t8wcPfwuRjk7taTFzRB2/IBS5s9j0ANH4Fd7+vUjlAUtEfxiNKSv1akSfcWFqdAfJd4g1geI38iNF2qi5NMtN+BkN5GGy3izFe1N2sdqke0Yn8s644qbLgT17KXAE+v/taTmFC8R+vC92PEXv3x0lD1y9lLKrGB0phzv26qI0ghG8Z56xf0JyCsXv8u7iitGhBeMIn/O7P8q04xV60Y2Q3Pw2wdhAfunEkvAWJBFPcPCIvd9oIfZljN7Fum2PC03p1dcHQ4CxVgJZr4aaNxAAcDrLKpmzVNqFf2moW4gssu4b35k72rdFhklNdRm5tw0LBRGJSREp2hpXcSmYuzrvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e6c8d81-01d1-81a1-8fd4-4385e46befe4@suse.com>
Date: Mon, 21 Nov 2022 16:14:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/9] xen/arm: add cache coloring initialization for
 domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: marco.solieri@unimore.it, xen-devel@lists.xenproject.org,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
 <20221022155120.7000-3-carlo.nonato@minervasys.tech>
 <CAG+AhRU8zrHaxrNQqyu-c4niB2DWXcQRmvsit_samXtDa2LpfQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAG+AhRU8zrHaxrNQqyu-c4niB2DWXcQRmvsit_samXtDa2LpfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ec724a-5b69-472a-80bf-08dacbd30695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bMt0u8OgfPWSS9VRCoOGAG442tT2c68toPrh0kugEAM7+KJGRiUFibNsgKWvt7aSfWjIL8GULDZJ3wwnVHmQ8fxUHcM8tcIthNyEHz10GjEoEQUTMFx8mAdG9gv1xNVPAFG5rQ33KA0D8zE1g+RQ3jG57pVEQIywCQMozxEKY8ox/oPmBu+Ljhl3vdad228YSivmO/4l8cGvZxH1cZXSuPIAvJF2OjMTM64ilvb5OlA0LkYH4uszoX1wG7B4eHHapJdV3COadJRPyz+nL4x/lEg5dI30OS+LN1af79qISA+Ixb3tVRGDoJnW8ANq1CBnRq9BTFDDLa5YhR/is1QrNdNH2qRzhHdY+bmUv9hxCKWvWB87LUutuy67dDNH2sAbD6TF34WStM0/uYwPag+OwbbJMLUjXO0IK1s7Vz8VtSbyqhhLV1nYPhxEpjGAysJbJjYFNzKpRSUYEgK8Yo8kzS+TsVK8mBFNWu/DJurGgAiFV7lBz0Ndn+LHeLsZQzdWZMZXcJoBF/jxx1VXWClCZIoPysnE11Nsq3DEoo0ZLMAYeVbcuu9hKtP9k7tRk4O50onv44f7rpNl5LRmCnKH/HHnMC8OZgKEzqwJHon4LN+usRQ/WfaulE49zSbvWXZUWLTGejj+DIev/2D9DrADKLv7C/Lw4yLSs9oH5MY8mV+xpn4xSC59IfHZk2FLNYtcdbwV8BkQiUCXWwZZG3wl9XOsVyOkGe4xKM506wr1Zn8l590MniX4BzxWLGsiV+LN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199015)(41300700001)(7416002)(8936002)(66556008)(5660300002)(4326008)(316002)(54906003)(6916009)(66946007)(66476007)(31686004)(8676002)(478600001)(36756003)(2906002)(2616005)(6512007)(966005)(6486002)(6506007)(26005)(186003)(53546011)(38100700002)(31696002)(86362001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWRTMVZGdjBBSHZKZVl1QUxaSnk1Ly9mOERNREd0Z3BjcTVsL21DRkIzM21r?=
 =?utf-8?B?cGpOWWp0MWFxY2NzU3QxR2Z4U0ExZDdRVDRUYW0yakVXSFVURi9Pa3k4a25E?=
 =?utf-8?B?K2VQd0pSamx3R0xqZXlTbnk5MldLcysvSzhBUHVWUnZwTVBSNmpwQWFCQjdi?=
 =?utf-8?B?M2dvampKVVZxZXNzSkZJV2NjUGdDOXAwMy9IUWhXbkpVWXhtMkRaTFl5SFRL?=
 =?utf-8?B?ZEk4YTRXQm5mTUl3M0dwcVdVOFEvblhwZ2loOWJOYmMrQ1lOSWlBcnVaS1NP?=
 =?utf-8?B?TVFvbWJhcjR1RFFwUU1wSDZiSzk1bTJseG5rR0lwcmZzUHJaSERNRFA3TjM2?=
 =?utf-8?B?ampnamlWdHBvM2hVOWpiSDM5bWxpU2RkWVZGSFRZdVRWTDlDakpuZU5Ic20r?=
 =?utf-8?B?TE1vNjRVMTZNTkI1eTc2MTNKYzZ0ZkVLWkh0anJaS0tsK3BsYk9SN1MrdFZF?=
 =?utf-8?B?N2REdkNlVlc2dk95ZDE2Z1FoQUlmYU1neEhrWWVPaHl0elIzVUNnVjJaSGls?=
 =?utf-8?B?RFVNN1R2dEFYL09GZ0tBaTJlN09BRkxsWDdNNGUycXA0a0owRlRWZDF0MHZS?=
 =?utf-8?B?eVc4eHFYQU9xbldxdjJ1TUwrczBOdU9qa2dFbHZsZ1NMOTlOK2pETlIyRmFw?=
 =?utf-8?B?NmlMVmxiUUR2RkxFK2diRE03cEgvME1kUjZUTVlOajBpRFNZeWtKUzlGdSsv?=
 =?utf-8?B?T1lCWXpUaXMyUDVRclZhOGlXY1JVTW5xTGpERU1KblZTRUxvNXh1SmM1QzRj?=
 =?utf-8?B?a3Zwdkc5S3FYMjNNREpNWGhXSy82cEEwS0orR2s3bHFzY3kwTWsvN2Fmd3Fv?=
 =?utf-8?B?WlpwSVZQMmVlK29MUGM0RFV3SGpUbVBMT0lmbXM3OVZtMW9qUzlIZkt3NDI2?=
 =?utf-8?B?a29IQ2Q0QlU5UUJldVdqUVAwMloydjBQamtPQ3pJZkFXRFQ4RmltZ0ZKWDFY?=
 =?utf-8?B?QW5uOXNvNFQ5Mk5sT21KMzQ2ZEJDUnAyM3VKQ2YyR0FNZUxrSEduTzVaREdP?=
 =?utf-8?B?bHlUWDlzYUxDS3Q1NWdUR0RaR2hYZVZZb1ZENDF4RzUzb2ttR0JZMGd3V3hK?=
 =?utf-8?B?TTJsNFlOT2RQZDA4NFhEd0VGWlBnUTVZNWtnRXRnRXcrbnZZbm5pQTd4OHYv?=
 =?utf-8?B?dlk2MXA1MnF2aDJsMjBVRmM5ZXVLWUdTaC9jUE1aVXJhOTZZYWdkVUNpbmlZ?=
 =?utf-8?B?QkZrcGgxUGpXWUpNTjlLUy9UREdnRVpRSHpOM0w0UUNXaXRlSWY1N3JRTklr?=
 =?utf-8?B?NmFXa2krWkRpMko5OU5YKzV3UWlHMS9UVUlZK0tjNHV4YTRnQjloT1laalpR?=
 =?utf-8?B?KzFuRTdnYkRNT25GSG1PdDJCTEFjVjkxQ2NYQUhRTXZ6RFlQTGowVHlxR0dn?=
 =?utf-8?B?aFd2UmJoenFFL0RQZ0xLSnFnM3ZpcWV1QWhYVUdmVXpJRlFXY1JCdnlUQWJm?=
 =?utf-8?B?aXFTRmZhTllLUDFzQmUra1ZPOG0zUHNTZlF2aUlyTytTS3JrbTl5VmU0V21x?=
 =?utf-8?B?RVZwSUJnaFE0aUJBTDJtcFVqanBWSUhWZjhsQjBoR1BVc0t0Vmc3S05MYzls?=
 =?utf-8?B?MGpGS0tremRiVG5ML29aZVl6bVZjblgyV1c2anptc2h6dnFPa21uNm1TS3RI?=
 =?utf-8?B?bC95RmgwMndrSVgvRDRNRk50QWRWTnM4d2hlVTMxVi8xdW5ZMFhIVk9PVXZW?=
 =?utf-8?B?YWRTa1hQbUkwN3ptczh1TmFKVWR4S1g3Ui9aVU9yTlIyWFRLcGtodjlwQklo?=
 =?utf-8?B?VFBXS1gvUHFMSlJTV1lJRG5ZcTVEMXk4Mkx4b0dUd0Z0UjVHUVJwQ0o3NmE0?=
 =?utf-8?B?dVV2eDViNWRUUUpBeGQ5cWNPaDg1RDA4OWNpOXNlNU1xOG9uQzdEekJ4VG1U?=
 =?utf-8?B?dHg4b0h4bmNvbXg0bGJQc0Z5R0lKZGQ2UjIzdUt5QzV3N0I3b3JJNmZmZk5n?=
 =?utf-8?B?UUdCS0hXNlJYd1ZaNmd1YnBZSFp4UHdxQWRJcVo2eWJxSFM2TEk1NFE2NnZE?=
 =?utf-8?B?eHpBVzBYWTFyajl4ZStJYkd1RW00VWtEZlBaaGNLclRzbGExSkhUeElNclU5?=
 =?utf-8?B?SmN1N0U3bkxkS3RNaTU2RGZ1QzhHNkVkS1d5Ym1FVnNyR2RCV2xnK3R3VWVF?=
 =?utf-8?Q?/d0JzwuZ00cfxRiO9nPVne92r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ec724a-5b69-472a-80bf-08dacbd30695
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 15:14:03.6283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjnD905Gd8qn++jEtzilWLMMu2T8S6mZBUD4OX8UcRhXYaVoatCLSTvUUzu+jDvIzP86tW6dAVVglmDaVU8pJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7768

On 21.11.2022 15:50, Carlo Nonato wrote:
> Hi x86 devs,

Any reason you didn't include Roger?

> I want to ask you some questions about this patch because in the previous
> version me and Julien have discussed how cache colors should be passed in
> domain creation. You should be able to read that discussion, anyway here is
> a link to it
> 
> https://marc.info/?l=xen-devel&m=166151802002263

I've looked at the first few entries, without finding an answer to ...

> In short, using struct xen_arch_domainconfig works fine only when domctl
> hypercall is issued. That struct contains a XEN_GUEST_HANDLE so it
> should point to guest memory and must not be used when creating a domain
> from Xen itself (i.e. dom0 or dom0less domains). The easy way to go is then
> changing the domain_create() signature to require also a color array and its
> length to be passed in for these latter cases.
> Are you ok with that? See below for more comments.

... my immediate question: Does supplying the colors necessarily need to
done right at domain creation? Wouldn't it suffice to be done before first
allocating memory to the new domain, i.e. via a separate domctl (and then
for Xen-created domains via a separate Xen-internal function, which the
new domctl handling would also call)? Or do colors also affect the
allocation of struct domain itself (and pointers hanging off of it)?

> Another question is then if xen_arch_domainconfig is the right place where to
> put the coloring fields for domctl hypercall value passing.
> See below for more comments.

I think I said so before in other contexts: To me this coloring thing
isn't Arm-specific, and hence - despite only being implemented for Arm
right now - would preferably be generic at the interface level.

>> @@ -232,6 +233,62 @@ bool __init coloring_init(void)
>>      return true;
>>  }
>>
>> +int domain_coloring_init(struct domain *d,
>> +                         const struct xen_arch_domainconfig *config)
>> +{
>> +    if ( is_domain_direct_mapped(d) )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "Can't enable coloring and directmap at the same time for %pd\n",
>> +               d);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if ( is_hardware_domain(d) )
>> +    {
>> +        d->arch.colors = dom0_colors;
>> +        d->arch.num_colors = dom0_num_colors;
>> +    }
>> +    else if ( config->num_colors == 0 )
>> +    {
>> +        printk(XENLOG_WARNING
>> +               "Color config not found for %pd. Using default\n", d);
>> +        d->arch.colors = xzalloc_array(unsigned int, max_colors);
>> +        d->arch.num_colors = set_default_domain_colors(d->arch.colors);
>> +    }
>> +    else
>> +    {
>> +        d->arch.colors = xzalloc_array(unsigned int, config->num_colors);
>> +        d->arch.num_colors = config->num_colors;
>> +        if ( config->from_guest )
>> +            copy_from_guest(d->arch.colors, config->colors, config->num_colors);
>> +        else
>> +            memcpy(d->arch.colors, config->colors.p,
>> +                   sizeof(unsigned int) * config->num_colors);
>> +    }
> 
> Question 1:
> Here is the current hacky solution in action: using config->from_guest to
> decide whether to call copy_from_guest() or memcpy(). This is a no go for
> Julien (and also for me right now). In my current work, I tried to get rid
> of this field simply by calling copy_from_guest() only in domctl.c, but this
> solution still isn't easy to maintain because the config->colors.p field can
> either be a guest pointer or a Xen one and mixing the two semantics can be
> problematic.

You simply cannot expect copy_from_guest() to work when the source pointer
is not a guest one.

>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -314,6 +314,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>  #define XEN_DOMCTL_CONFIG_TEE_NONE      0
>>  #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>>
>> +__DEFINE_XEN_GUEST_HANDLE(color_t, unsigned int);
> 
> Question 2:
> This color_t definition is employed because the guest handle for
> "unsigned int" (uint) is defined later (public/xen.h) and (citing Julien):
> 
>> Hmmm... And I guess we can't define "unsigned int" earlier because they
>> rely on macro defined in arch-arm.h?
> 
> So the solution could be to move everything up a level in
> xen_domctl_createdomain, where using uint wouldn't be a problem.
> If this goes to common code then should it be guarded with some #ifdef
> or not?

As per above I'd say it shouldn't. But then you also shouldn't use
"unsigned int" in any new additions to the public interface. Only
fixed width types are suitable to use here.

Jan

