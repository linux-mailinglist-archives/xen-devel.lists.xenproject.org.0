Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F18C94935D0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 08:50:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258742.445979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5jY-0001Jy-QV; Wed, 19 Jan 2022 07:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258742.445979; Wed, 19 Jan 2022 07:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA5jY-0001Gq-NN; Wed, 19 Jan 2022 07:50:20 +0000
Received: by outflank-mailman (input) for mailman id 258742;
 Wed, 19 Jan 2022 07:50:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nA5jX-0001Gk-DI
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 07:50:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71d3efe4-78fc-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 08:50:18 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41---kyqnXaNvaFeyveHSGepw-1; Wed, 19 Jan 2022 08:50:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5351.eurprd04.prod.outlook.com (2603:10a6:20b:29::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 19 Jan
 2022 07:50:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 07:50:15 +0000
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
X-Inumbo-ID: 71d3efe4-78fc-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642578617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PgtqKpFuc92UFqln487rkGHNVxVYGaArOtELtpcxTOM=;
	b=mb8/BGg8GdRLZ4ihyixZEk4qJFQusMb96HNtA9hLmUWFIee1mSOsNJL6t7CmO1PTqhWc3M
	J4YKjQ9NL5LCrzaiX5NBwxEp9SkP5h95f5c21hczNigCwJwLj1QtZ2KJbIcg4TtcDc5yeJ
	LqVsGWGI49RxH3mIDE2ETVt+/upAVS0=
X-MC-Unique: --kyqnXaNvaFeyveHSGepw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyfbYjWZuhDOoYFtbm/vLtvnjAdjQGwOL/WK8SgwAlVureRK5dmjtU/l+N/vpHMUpopbXSls6uyp38KWPIH6iElpZMeCLkNDuPRCxjVqX308ZoHCjOh0Q/jZX68RGdjosXQi+nKk2WOfNN8RFw8PO30rlClf8joDBL/oOgMFymk390uDdV8nAtp4ICfBWDjJVISLl2+TgFUni+09J2MnrQkfOsQ3n5n879hrSj1dUY4pneMm8I9kybUdlqo+DTwRXz3B0TBVkvMck2L0ewXP7hGlzEWQFhqJD5aBO4gORJp9r6LpNcRUnVo7jFoe0xi4oWq6xaJ3xpltkA+M2aQxfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTnud6A1IA2hwuRO4p/GXZP+Kz5qqVc+gGNkYw3vgWo=;
 b=XX5cNzviWxo4Cp4TYPppFzHQPTvJ7j4NKpKhMfg8E2XRMg5YXEZYqr9wbpx6uDOkVTkZmJ743TFjpxl6RMomDlmVpCshNkGdMB6FbSEY8j0UN9az58fQdj+CU6jox2gPQqhxCNGU/NUmTMU9x15529FB0HouLRONsWfFXCAgOZQTsohv4MA8t8jGm80Uhp+KfIANqPFjgOeKP4LPmCMGI2xASz+RHQF4G8/JClm2DO070d8E3RTKdAXwycAqbhG7WiX16Gs7qqgNF8eXUyelr2oznKYszfNkbhoCphZU6rpqwBlPljcB3qNW8rOcLhKwJe8JNyuxa0CEYrbA+ijeeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22c2134d-40b2-fd5f-aeec-edabf6151ce5@suse.com>
Date: Wed, 19 Jan 2022 08:50:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/37] xen: introduce an arch helper for default dma zone
 status
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-5-wei.chen@arm.com>
 <345944c4-78dd-8009-6f64-f9c7901a5497@suse.com>
 <PAXPR08MB7420CD3B7CFB4D2D81019F479E589@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <378fcc9b-abfe-28f2-ee67-f5510e99436c@suse.com>
 <PAXPR08MB7420FE209E822108AB1B41E19E589@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <fd328410-caf0-274e-08b0-f775a6c9a08c@suse.com>
 <PAXPR08MB742030298FE53A7B5AB5D1499E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB742030298FE53A7B5AB5D1499E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0076.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12fb2461-e0af-4cbe-3c7c-08d9db205480
X-MS-TrafficTypeDiagnostic: AM6PR04MB5351:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5351901293699EC5E9E43B39B3599@AM6PR04MB5351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9scTcpNVnV1V5xjUHZjRpBP2EN6Bqys/JATtXlCLGV++vZSoDZ9R2QCbe7C8CpH+/PrKbMHPhN7ZXdLqkCRXBDA/VdobM1taAoHO08VJQrnsFv3qGm7yg3x8uQxjrB0DJ3MJqnBL+pQQAajFKX9lQ2LooPv2BVK4ezCi2RiBlrLVcJVV5TT1akuKEJa0WHUoFUDkKInsqbgB+13QdaNvAu3UesqdU+I52mzJj2+CrY5ryXgCSkywIQVBKnFsfpQ5xdPQPCPZGQD5BjsLAuSlwYZAOFLpq0R8HdjwKNJz6KVo2NBPSdHASfKT8JCJgNUaAUHub/p9dUNsOPUtuG1LKzsVzSjSLYppw3/ZB7dJxOufe9Fbn5MYpjZkjVdDYt5WZdd4sdwBgC92aUm5GKOpE4PI488D757QMyns20an0Om6kBwVip7cHeDKQM+BoTmMBhVltQozvTFWG9u97AKpID3naSHdf7wyw+qKTQ0+nsbrIkmN65sxXTPWr+WpvSB2MHvqnUzD3tfeQabiXd/ARvAKb63O7Iio4eBXso8CEW5XfRb5j5nEsC84YqpahiAnp1tkUqiALR72/qKuYP3Cwyhsg0L2V5aVdOyAdWG//7wkgbj/awSmzNH0GIqVmD71BQ6e0snkqYJyHFwY07PBt4JLybDgkoT2SH0ULhp++qbpfpowYpUWDsldA7ZhDsgIcID/R8oyfgZFUb/krrHcUOJEV/dPD1ug+meIGv9fdaEwRmf8DTeJWeEaxltPy26U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(6512007)(2616005)(83380400001)(8676002)(8936002)(66946007)(6916009)(66556008)(26005)(66476007)(6666004)(6486002)(5660300002)(38100700002)(2906002)(86362001)(31696002)(36756003)(53546011)(316002)(508600001)(6506007)(186003)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WE4GBgexZz7opydsXr18KkKk15rKR7yu/CBOUWfIPL9pJIvVuhX+htHk1TXr?=
 =?us-ascii?Q?uChg53KOsH6guC63YkispliQHKS7qTIG/pVd8nhJMemEzWLmyacxAgoOH6kM?=
 =?us-ascii?Q?DL3aHwwq8yPYw9jISo3twK7i/K1T6se3uhe1SrpYpQM8Z1WMsMtJ0+Zek7tH?=
 =?us-ascii?Q?9gMJ4yNowFcUUowkLZw1drrXYsO4ub/E09SWI+TUPPeMKBZ6PCBNg/uvuowG?=
 =?us-ascii?Q?irXotMpUf63+guC4AWK4hz5zdMOfTYDNWq9YauciEtT8V5w976AReyBPLQkf?=
 =?us-ascii?Q?az6WbiwFsd9enAsBKcf3380jU7q0tWT73GkNhLNKTmaLETUKqb+qwiJAAxCH?=
 =?us-ascii?Q?Fwp/n3tjN3Ct6HuonismTwv1XCo/a0+QNSajZswHeUqRYTt8Sw61DUXYlBKn?=
 =?us-ascii?Q?LZbhxwjlknLCyU4o8QjAzo+cjtVGgrPJFtvswidPX0EBdvxGcY76gnqm9QaP?=
 =?us-ascii?Q?SJB3IeUwhA+ZhsV6eyrBzDnmnaIHv4Ht4VAM7HLZLp4I0EbU/rZqEr9EfTMi?=
 =?us-ascii?Q?RSHGw0Qg8MASG5ydOuXaMRuP49FMMSSN8JeZPmT0nCSQt5ImlIywjmHyZ33v?=
 =?us-ascii?Q?IWdEXwUjx9AYy/mA5glBNCmkow5oE755ICySrVJ8DK1wcOYH+rlmF7KXAOtk?=
 =?us-ascii?Q?IrXS6yxcxDBJUSglQpPWUaZoV+hmDGzymaQF4uaWBX6kcheY09FE3crncrgy?=
 =?us-ascii?Q?0qxV3Z7YPaKmnJMr23g6XsuKO6RR74BJR939jS2bopzkZhA0MVAPD1cVwqKi?=
 =?us-ascii?Q?mhNCScAj0HxzYSPOdZ5sHhAe29lBILccCIBAvmtQ8U3DebSTC7mx2iqpta4X?=
 =?us-ascii?Q?HRljMo3QZr1GEqNaDJM2daU9uxvPgnYhA+GN29zSPF2HKNeX+gH0uZwJ4kft?=
 =?us-ascii?Q?c97t6AQI4EuyHqIwz1vngN89hN7CEIQNfxPdP0qUMs4FW0ZfhcAvTM0eNMEu?=
 =?us-ascii?Q?Ppa0RcmrrNOTgA6kyq0oFJqpwRCy7ViVzYvuVwcFAYil/wrzpXQIDAcPxIWO?=
 =?us-ascii?Q?bTvCiRJ6wCTekXX8WPgYPbniutR5Q5CWg79ri/4EEf6pRw1Y3hJUnKQKYz7e?=
 =?us-ascii?Q?VSDGZiFu3HilXoAd9Zn98Dkzcd2yXSMd4+8whsp0wQRPUr3a85Ul7YMrqOG5?=
 =?us-ascii?Q?B35a8xP4wYjQ7bmjF0skZ556STtcxYPUkzHtoDSEMoxbeSew/V+AUEhs8zCy?=
 =?us-ascii?Q?OhpP45/CyJQHwP7qLAUqn6yiu6GewrvVwYbXneIpUxUPAFWIzbuYV+stvsgo?=
 =?us-ascii?Q?oXXpd38/Dfy2YSL5Xa6KizAGLfL/1XcWe9CRPq9PSKoSvMz6kcfqmBiOVJ+P?=
 =?us-ascii?Q?odMmNdDRTzlyVzFM8zkoS2IX45jgXaU6fBeVh62q6nElrJQIsg2M45sCkps7?=
 =?us-ascii?Q?c+jYLFd4VC4y6T/0OyBjY4S9+XViHSwSji5HXSGYg7xjMO6B1R6OAr9pgafW?=
 =?us-ascii?Q?L5YTZFAmoufyD6k21/xAJeHJ0DADlf5rKduijqw8MsPN97UyXgsiUs412JAc?=
 =?us-ascii?Q?S+wcHIqaGBB5zc58v07DUF01e5PSrFJ7HD6ggSe0rUX9AapSIiidDIIcUgc6?=
 =?us-ascii?Q?lqCu4Ae9y4yXBVVVWE3/vwnVnNyJcA3QhC0UrVAVHx5ru8CxUopQHTGaFFSp?=
 =?us-ascii?Q?hBATg3XnLKSqoaS62yPVze4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fb2461-e0af-4cbe-3c7c-08d9db205480
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 07:50:15.4191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pn43WuHpFjFsJRYnd068ClXOhUxWl0DKuAhG59mjVVYIA8cBQ+8dCFneoSdd3aX7Zg0QkxpIw6YjDhjxcYrkLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5351

On 19.01.2022 03:49, Wei Chen wrote:
> Hi Jan,
>=20
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B41=E6=9C=8818=E6=97=A5 22:16
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; xen-
>> devel@lists.xenproject.org; sstabellini@kernel.org; julien@xen.org
>> Subject: Re: [PATCH 04/37] xen: introduce an arch helper for default dma
>> zone status
>>
>> On 18.01.2022 10:20, Wei Chen wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 2022=E5=B9=B41=E6=9C=8818=E6=97=A5 16:16
>>>>
>>>> On 18.01.2022 08:51, Wei Chen wrote:
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> Sent: 2022=E5=B9=B41=E6=9C=8818=E6=97=A5 0:11
>>>>>> On 23.09.2021 14:02, Wei Chen wrote:
>>>>>>> In current code, when Xen is running in a multiple nodes NUMA
>>>>>>> system, it will set dma_bitsize in end_boot_allocator to reserve
>>>>>>> some low address memory for DMA.
>>>>>>>
>>>>>>> There are some x86 implications in current implementation. Becuase
>>>>>>> on x86, memory starts from 0. On a multiple nodes NUMA system, if
>>>>>>> a single node contains the majority or all of the DMA memory. x86
>>>>>>> prefer to give out memory from non-local allocations rather than
>>>>>>> exhausting the DMA memory ranges. Hence x86 use dma_bitsize to set
>>>>>>> aside some largely arbitrary amount memory for DMA memory ranges.
>>>>>>> The allocations from these memory ranges would happen only after
>>>>>>> exhausting all other nodes' memory.
>>>>>>>
>>>>>>> But the implications are not shared across all architectures. For
>>>>>>> example, Arm doesn't have these implications. So in this patch, we
>>>>>>> introduce an arch_have_default_dmazone helper for arch to determine
>>>>>>> that it need to set dma_bitsize for reserve DMA allocations or not.
>>>>>>
>>>>>> How would Arm guarantee availability of memory below a certain
>>>>>> boundary for limited-capability devices? Or is there no need
>>>>>> because there's an assumption that I/O for such devices would
>>>>>> always pass through an IOMMU, lifting address size restrictions?
>>>>>> (I guess in a !PV build on x86 we could also get rid of such a
>>>>>> reservation.)
>>>>>
>>>>> On Arm, we still can have some devices with limited DMA capability.
>>>>> And we also don't force all such devices to use IOMMU. This devices
>>>>> will affect the dma_bitsize. Like RPi platform, it sets its
>> dma_bitsize
>>>>> to 30. But in multiple NUMA nodes system, Arm doesn't have a default
>>>>> DMA zone. Multiple nodes is not a constraint on dma_bitsize. And some
>>>>> previous discussions are placed here [1].
>>>>
>>>> I'm afraid that doesn't give me more clues. For example, in the mail
>>>> being replied to there I find "That means, only first 4GB memory can
>>>> be used for DMA." Yet that's not an implication from setting
>>>> dma_bitsize. DMA is fine to occur to any address. The special address
>>>> range is being held back in case in particular Dom0 is in need of such
>>>> a range to perform I/O to _some_ devices.
>>>
>>> I am sorry that my last reply hasn't given you more clues. On Arm, only
>>> Dom0 can have DMA without IOMMU. So when we allocate memory for Dom0,
>>> we're trying to allocate memory under 4GB or in the range of dma_bitsiz=
e
>>> indicated. I think these operations meet your above Dom0 special addres=
s
>>> range description. As we have already allocated memory for DMA, so I
>>> think we don't need a DMA zone in page allocation. I am not sure is tha=
t
>>> answers your earlier question?
>>
>> I view all of this as flawed, or as a workaround at best. Xen shouldn't
>> make assumptions on what Dom0 may need. Instead Dom0 should make
>> arrangements such that it can do I/O to/from all devices of interest.
>> This may involve arranging for address restricted buffers. And for this
>> to be possible, Xen would need to have available some suitable memory.
>> I understand this is complicated by the fact that despite being HVM-like=
,
>> due to the lack of an IOMMU in front of certain devices address
>> restrictions on Dom0 address space alone (i.e. without any Xen
>> involvement) won't help ...
>>
>=20
> I agree with you that the current implementation is probably the best
> kind of workaround. Do you have some suggestions for this patch to
> address above comments? Or should I just need to modify the commit log
> to contain some of our above discussions?

Extending the description is my primary request, or else we may end up
having the same discussion every time you submit a new version. As to
improving the situation such that preferably per-arch customization
wouldn't be necessary - that's perhaps better to be thought about by
Arm folks. Otoh, as said, an x86 build with CONFIG_PV=3Dn could probably
leverage the new hook to actually not trigger reservation.

Jan


