Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF6042F05A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 14:18:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210447.367322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMAb-0004Mc-I1; Fri, 15 Oct 2021 12:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210447.367322; Fri, 15 Oct 2021 12:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMAb-0004JE-F0; Fri, 15 Oct 2021 12:18:41 +0000
Received: by outflank-mailman (input) for mailman id 210447;
 Fri, 15 Oct 2021 12:18:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbMAZ-0004J8-Sc
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 12:18:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06391e48-2db2-11ec-8233-12813bfff9fa;
 Fri, 15 Oct 2021 12:18:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-eouw6wRvN82ajG1vlupPPQ-1; Fri, 15 Oct 2021 14:18:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 12:18:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 12:18:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0027.eurprd08.prod.outlook.com (2603:10a6:20b:c0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 12:18:32 +0000
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
X-Inumbo-ID: 06391e48-2db2-11ec-8233-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634300317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gBLt3FjmvUTpXFBaKSKWoslIsmUk90v9LPziO8f2KyA=;
	b=XhdcgMtDNoy07+4DD3JL1HdDf3sB+irrpT4jaeLmvwe6XAqojFAXkMBoDKoslKm/YhOeKI
	RjcH1hmXJ8xbdgSzmvx34klJg/MK3Rbu75nZeIIxotUeYwzconj8WVlMbFoKBj/bNuvVDF
	IREZNpfTsFakXWiPtXezsPKAyKhc2w0=
X-MC-Unique: eouw6wRvN82ajG1vlupPPQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qykf3TF14UqtbOwltVxevPwZjgU42m/HDK1pXSa+dlOPp07M/wt3PoyU5kP11OYg2Z/oVFwnstyzsAe+OCbrqYMWjGQkuAePThBCx2d3Xu1Ll3Ryna19rdikN4TZJX6MSb2tEBrUbn00PZ8zH+g5r64haTGmgdq6T2fCkH3NQvq8hJadY6MOQex7+kpVe+gpj0zXKzdxd8cQ5cTaNU+B+WGBavs7sUaJb9TWKssOypgECXZ8NDoUV406y6FJUe7U0Jjad2nrpJ+Jbw1vHiy2E+DzmL+x/hvC9wGJOZmBY18HdVsVOuOSxn+x/Oyu4cH+WQf+uGuWNWyBCzCXWLhFwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIrenqwBTsZZYWTwlnlT9zUDNrK0dtDQqKf+P3ZijvE=;
 b=HM+/3CSnjgyUQVeormfJx7PrmXZiHqYPeXoQeWqo7/+SRds7QIOwjunqW+oarBPc05YqPhCwvpK1LtN1/GBkM6u+Ad1OKKAgqE/TjWZ21H3s89KTDO5oyeq/MTaC+bdFuQvuhHo3yAdZ9psxkhnHXGAyNoQ9gUxCgmHa1bwAJKiw8sPa8D+m26heddBVroMlei0lLLreGU2HcY5r/Fk6UZf57Ea/xZ0hoaxuHuUOTL4JeDaw5+3CM2jElO8JbUYUJ3VQcBq8Wr5ARaHiUpR3m33+YdUHzaGJCxq82dq/JP+McNkrc9ziKuUnYotIFtYg8EtKi/ADHc/VKW6ry9mG0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <f41f59f7-69ed-e2fe-dc17-434b456cf693@suse.com>
 <57A39480-34DF-4BF5-9B0E-802D30F94BBD@arm.com>
 <24937.21631.538303.29471@mariner.uk.xensource.com>
 <b8fc68e6-2bba-ef11-4c4a-50c2046ecb04@suse.com>
 <YWlnc3b0sj4akUWa@MacBook-Air-de-Roger.local>
 <A2AAD333-35A2-4250-891C-E8FB885D5660@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <887d99e8-bcc5-f854-ceed-a38701e1ad1d@suse.com>
Date: Fri, 15 Oct 2021 14:18:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <A2AAD333-35A2-4250-891C-E8FB885D5660@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0027.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a47baf78-a9a5-4ede-57a4-08d98fd5e822
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70872B1FF2C29ADD0D9D0645B3B99@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6ovk9tetiSsHpp3l6VxnVrp+RLRwPE3EBEb2q0ItFWKAOo5ZxiEcgykSVKtZNAwYrm3Wd18rxNk/WV8bJHjJZUhHfwrbngJwvW+heBwSks7rZqyitSpD9GjXwd+wF7K3+ZI82/rhKC/IX3PVklKtCjmElF1qBLVd8cEBmIfY1lN9vRKsz5nE4MSShjV27HMmILKXpx85v+NKo8aBPUntv98qBH6q9nMRhcUNmQDECYh+bk27a16Iy/Xdu+aI3tly3Q3cOZJZ/Z/ceMA1sYnIyzN3UnnooW06ZWUw4UkIeJ8TN/rK0jijRcgeRRKsNqixmuIqktxUY0Zj8lbqimjC+YsR8ENXpe8gwVnMVauQWiW9AzzEAOGnqBkQbIdO4jg1Q/9V/latFP8qmbQnjmW+VhcKN/mMcD8M/FI2U3u/shNdQ7Vidnqtn9awUadpPco30YTGws9sUL1bX8bRNwyxdAQiSrVYuJ5rqLxGzU4XXr5cjo42s0NrKSLLjkJ1SyFr4+9R+2N9ErFqwxRbuHmVfEANtjB7cdN9EqIYV1O9lOoVz8kBoVH72Y8px7LTG3KCrwNAGMjZ0VFsOE94q2vlKaiUtp+T0EC8xH47kLLHLFsrw/iCXODJJZx1+h4ZN1u6whc2fCJ4XMwxqM6aWSbgCQJZsg/t38YpAZ1QvYWodZsIM6WUMhLCuchbDhKcwzoEfAUzJwKcQKz3/brBnOQobrNJu+AK2zvGR++4oc1BFep94MfxSpdRrwhSAxAMyut3JacZuv6BYIA0Z7fthgS1jatqvQqEM7BUjy7T1SIiu02CwpIs6CiQ87TuXuwohpZYJzzL9LlUf2A1DGzpDuiGeA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(2906002)(53546011)(966005)(6486002)(66556008)(66946007)(66476007)(38100700002)(31696002)(31686004)(36756003)(8676002)(7416002)(16576012)(110136005)(54906003)(316002)(508600001)(5660300002)(956004)(2616005)(86362001)(186003)(8936002)(4326008)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lWQIz7D9MuciFgtkCWYtt3ObOlwUv9mvom7Q4fdrV7pNBwUlsmHME/yatlEp?=
 =?us-ascii?Q?ZlwVIgncldWrvbKZEE6WN81mvMUKZdwCBm7SMeDY5ApQZmmljwnu3W9rYHzX?=
 =?us-ascii?Q?N1yHGTGviEqc46s7Rl7aHBlIQGKCu2RO57GdMl1nUwYC+JAFH0BCNzlQRfcH?=
 =?us-ascii?Q?2PmWfimhQuF+g5ZF6YlJ5gdggFSu3wLkZ26v0r+pmA8iuZ5FhiyqQfktsXqV?=
 =?us-ascii?Q?WMziafpR1VckV6buMbufzCCJk7q25YYuYITEmp+GumtR+aV9mDAt1c5pb3/g?=
 =?us-ascii?Q?dSVnyUbgfrHaV9+n9gAwn0RMLKSe3VqG6pLxpSMnRq/qOhym9MSCeoje+Xei?=
 =?us-ascii?Q?bLO1VxkupWgeORI2CY4wI2TmSL4LIhkJxqGJygRkFXDTJzQujdbCziLus9qb?=
 =?us-ascii?Q?sD3FcQKP5T3wfcc1+8x8nFzYnsJjZ74QbymyOsDLGJPE3Dqpv92IiLk8SPZR?=
 =?us-ascii?Q?uhOBqycveIuOKp/Mq8f77sQOTVOJXg1y7Go1PY0E2XlZudDHdwxy09BJCOfU?=
 =?us-ascii?Q?nFvR57+5oxvyrCQUJN50pmKM+EF0HDMR5PAfMN/fvAcv2KvkunVIg+XDNN3s?=
 =?us-ascii?Q?CvXkswMBTrTfgCmaM2PK09knXXM9AfgaQraQsPZCM/64idfFR9FZ49+GgIll?=
 =?us-ascii?Q?hjnB6d7/BrUokp3B8Fj5bcOh9X62Y4SOBMQevUfJl7eaFr6M8CoePsh0avRv?=
 =?us-ascii?Q?8AO22rpbkOVEGzIyx8bxW/pl+HdcX0/vb3D7Lkfymq1DYfSrfYTDpe6m3yha?=
 =?us-ascii?Q?I2E6I3uescth+xHtfSp571z2KBvwd/EFBUQZLfJBGf0WtKXois6pgorfcPxx?=
 =?us-ascii?Q?MTMsGuGNUozy9SnYO5mE9a2fi9h+rjqhZHEZcCxulVISIp5Ia3AceBgEIFuk?=
 =?us-ascii?Q?UAOrjZlsdE14WzBJlNLQ6k/+Kp42cZiXzjm+oYBX8b3wJ9DLPtt/V1fdKW9C?=
 =?us-ascii?Q?ffgEBmqBMabihawJ9vHFkSKa54FzVvtPBTXatABr1Kn//WIZ9uu2Wf5k3hw2?=
 =?us-ascii?Q?VeBJ4MeTxOFlfGEfHLvpAgL3l76DAs8RBKp1H6SLETJ/QT4mmavTBewE9h8Z?=
 =?us-ascii?Q?QGPiC9G+6kymKmsMxUiNas1fZWaKo+0S62k8iAXF4oxFL+0iRykyitChs5Qg?=
 =?us-ascii?Q?60+RG7nv0gq8Jvuabrihps0DvdfA4r/tDAGUQVmKPLNFPcnqSxJTpQalfan+?=
 =?us-ascii?Q?dRbFetnskw7HtW86dGFQ6QVhext1tBa342glJ/2royq9Lww4wLjqM/NsluPM?=
 =?us-ascii?Q?U/Y7E6bUALTezP4CinTy6qAKPJN+s8RLJ+Sf8dxNqV3aJieuAXpUZxpJnwu5?=
 =?us-ascii?Q?+xprVHq9rmpKhX6Ir+oLjIdV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a47baf78-a9a5-4ede-57a4-08d98fd5e822
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 12:18:33.6315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26BJff3PfExzXG8v9KlPwnJKyMIOFHcFKiaJvxAgjOXeK5BzBtQj/P22gn4dcZPDUfRKZUE0Be/qwDlV74Syug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 15.10.2021 14:13, Bertrand Marquis wrote:
> Hi Roger,
>=20
>> On 15 Oct 2021, at 12:35, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wr=
ote:
>>
>> On Fri, Oct 15, 2021 at 12:18:59PM +0200, Jan Beulich wrote:
>>> On 15.10.2021 12:14, Ian Jackson wrote:
>>>> Bertrand Marquis writes ("Re: [PATCH v6 2/3] xen/arm: Enable the exist=
ing x86 virtual PCI support for ARM."):
>>>>>> On 15 Oct 2021, at 09:00, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> The latter is fine to be put here (i.e. FTAOD I'm fine with it
>>>>>> staying here). For the former I even question its original placement
>>>>>> in asm-x86/pci.h: It's not generally correct as per the PCI spec, as
>>>>>> the bus portion of the address can be anywhere from 1 to 8 bits. And
>>>>>> in fact there is a reason why this macro was/is used in only a
>>>>>> single place, but not e.g. in x86'es handling of physical MCFG. It
>>>>>> is merely an implementation choice in vPCI that the entire segment 0
>>>>>> has a linear address range covering all 256 buses. Hence I think
>>>>>> this wants to move to xen/vpci.h and then perhaps also be named
>>>>>> VPCI_ECAM_BDF().
>>>>>
>>>>> On previous version it was request to renamed this to ECAM and agreed
>>>>> to put is here. Now you want me to rename it to VPCI and move it agai=
n.
>>>>> I would like to have a confirmation that this is ok and the final mov=
e if possible.
>>>>>
>>>>> @Roger can you confirm this is what is wanted ?
>>>>
>>>> I think Roger is not available today I'm afraid.
>>>>
>>>> Bertrand, can you give me a link to the comment from Roger ?
>>>> Assuming that it says what I think it will say:
>>>>
>>>> I think the best thing to do will be to leave the name as it was in
>>>> the most recent version of your series.  I don't think it makes sense
>>>> to block this patch over a naming disagreement.  And it would be best
>>>> to minimise unnecessary churn.
>>>>
>>>> I would be happy to release-ack a name change (perhaps proposed bo Jan
>>>> or Roger) supposing that that is the ultimate maintainer consensus.
>>>>
>>>> Jan, would that approach be OK with you ?
>>>
>>> Well, yes, if a subsequent name change is okay, then I could live with
>>> that. I'd still find it odd to rename a function immediately after it
>>> already got renamed. As expressed elsewhere, I suspect in his request
>>> Roger did not pay attention to a use of the function in non-ECAM code.
>>
>> Using MMCFG_BDF was original requested by Julien, not myself I think:
>>
>> https://lore.kernel.org/xen-devel/a868e1e7-8400-45df-6eaa-69f1e2c99383@x=
en.org/
>>
>> I'm slightly loss in so many messages. On x86 we subtract the MCFG
>> start address from the passed one before getting the BDF, and then we
>> add the startting bus address passed in the ACPI table. This is so far
>> not need on Arm AFAICT because of the fixed nature of the selected
>> virtual ECAM region.
>=20
> At the end my patch will add in xen/pci.h:
> #define ECAM_BDF(addr)         (((addr) & 0x0ffff000) >> 12)

Since you still make this proposal, once again: I'm not going to
accept such a macro in this header, whatever the name. Its prior
placement was wrong as well. Only ...

> #define ECAM_REG_OFFSET(addr)  ((addr) & 0x00000fff)

... this one is fine to live here (and presumably it could gain uses
elsewhere).

Jan

> Now seeing the comment the question is should those be renamed with a VPC=
I
> prefix and be moved to xen/vpci.h.
>=20
> So far ECAM_BDF is only used in vpci_mmcfg_decode_addr which is only call=
ed
> before calling vpci_ecam_{read/write}.
>=20
> ECAM_REG_OFFSET is only used in arm vpci code.
>=20
> Do you think the current state is ok of the renaming + moving should be d=
one ?
>=20
> Cheers
> Bertrand
>=20


