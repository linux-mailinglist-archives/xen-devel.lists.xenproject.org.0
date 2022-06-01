Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E81E539D41
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 08:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340234.565214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwHuI-0002EU-BW; Wed, 01 Jun 2022 06:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340234.565214; Wed, 01 Jun 2022 06:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwHuI-0002Ci-7K; Wed, 01 Jun 2022 06:32:38 +0000
Received: by outflank-mailman (input) for mailman id 340234;
 Wed, 01 Jun 2022 06:32:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwHuG-0002Cb-9Y
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 06:32:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f6b7f4b-e174-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 08:32:35 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-44-MoKtNdhzO8eQRAQL_zO-7A-1; Wed, 01 Jun 2022 08:32:32 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB5685.eurprd04.prod.outlook.com (2603:10a6:20b:a4::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Wed, 1 Jun
 2022 06:32:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 06:32:31 +0000
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
X-Inumbo-ID: 9f6b7f4b-e174-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654065154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fd1Wr6W9tvg65teYXj8XuYJ0ugxs7y10RMYAOvZz5Hw=;
	b=flN7z/O7CowDkQmwTKM4Q9NNU0A/pvD4u+q3j1sV09HD/rvC9NXcXzFmQdlWTG5eMV1tM8
	TagM/QpSlkIltiMRpaJPx5CFGGKjkvEW/wtqoQ41gnr/IhbsXYfPQAruKOZCdQUu3rmJZP
	ywuE+UC7XcF5g5go/mnEF9EUg6xRUNo=
X-MC-Unique: MoKtNdhzO8eQRAQL_zO-7A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5M+LNrsZSJheS4i+U2AuRbRAyFg939Parm2k3GMqykzIwCaH/cscCJpo7OhkmcHvXdEV1KGQ1bgk00TizGq1uIQgPSZSpGFo1BRzalx4sReoToFSTJnJg/5moODMBB+dDxWRch3XiADF2P47fISHBw1flkgVtwab3QEmfwFdS+6bqFGMdQ19JJEfLs5tLTpqZxcx278uBbkSiaqsZy6wHyQM/7P7wRuiLqpZU61sTFUzsu+IwzbxZp6/BPxW7TvZCtmAyDk0i4zF6RCWrc4Z5C2jsAkQSTnjMkT+FALFLPhMPDA45M4HqTJ6ACE9HOM6dOnNhDnjMlTAURNwVZcfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nTLkMXITaCeRO+Z8Svw8f9/n5YbDmt/UYi99ABZAJA=;
 b=GY+ZOMcGbjba7tMhS/CDSibk4E8ucYfQIKVshJTMwiMZ1ZbyYb6d2mO40gxvC83goARhf1NQfoB29QG2/fXKjaX4p0ZGMi5z1gKLy7fJYnKFeA2R8/OvKSliQEUofJ8X05gS+CBIAapKIoPUrwxRDzSc+BweLhghkbe7LdvaMaublCWC+qjLOsbFgj/2eqd6ucmKJ0heiDBwbJpw1os1uWkEv2tih4LAFGaAOdp53TiNyK5Osrxn6xYbrDdS2HfDe+hhvDFltC17p+UXagFSdUYI9MdsIr/PDlHsZMzkT1U6D8Q2PzJclxNSLcOS4NglaGD/yuYhv7ZVMDKQlVTxEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc158225-73d0-498d-8b30-ade1078edd51@suse.com>
Date: Wed, 1 Jun 2022 08:32:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 7/8] xen/x86: add detection of memory interleaves for
 different nodes
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220523062525.2504290-1-wei.chen@arm.com>
 <20220523062525.2504290-8-wei.chen@arm.com>
 <6003b7a5-63c5-9bd3-03db-a4bac5ba8e00@suse.com>
 <PAXPR08MB7420F087CC36C8E8DB8DFF7E9EDF9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420F087CC36C8E8DB8DFF7E9EDF9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0015.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a57248b-aae7-43f8-760a-08da43988152
X-MS-TrafficTypeDiagnostic: AM6PR04MB5685:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB568592FA2534DCE10745E7F4B3DF9@AM6PR04MB5685.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ABVzi1vtizstXLEhlkSySRvYpmLrKzwUBtfwyGthBqVvnttb6hxpOeaZwd1kcWWaYGpPjHgDWfoIHjDK1QgtrAEhX828RBvfgaXVRhALXKTdsJZOVSmMi5mmSqozgAw6BdILKAKC34vFt1isgwh7GfBzUsuN5Nlnm7h0jzwEUPG0g26Jx/vYO+K0oYJjRz2IaJM5TIVSNOVi8PSzpM6907gMmi9FgXfiVBynrqve/iLLRFggtjme+t09hRpRTfe1wnGLGFHJWR4DbT2pL02iUHz+NBd6PrSQ888WpQkUx4w9FuMgEEJ5kwUmwCYlbWAvYodk+cM9E0AG82zszBOoT9n1D5skOVFqNGG5NwoQKtL3aSQyeU7ULud+G37B/blEiSCP4BhDFE+NnCn5SaPyPNUE3MSXR2i+Yr2rU0Vw02J7A3kmm5P50AO+E178M9VetwXJNfo1s6M5BvwvDEQF273nSGUDA9Y3s2Gv8v27y9JD0Sa1rgzer6MDfrL5O24N/yGJJHJTP2Eyb+lXYPsx3F6QCT7M9VeqL7vLHMZ/KB4uTkhZIvhdUrfaeNycqpvRKqzuKawP3x0D6iD9HFrp0VrCd8Ttq47OLJ/GFfC3tJCjFG2NVRzYX8RiFfKAR4v+epp3dOhFPRDOJ57Cp0IOTjTuNwB6Jiim4GvCEUQm2Mu2hjXHjOuAYA3Coas6T4RsFsAkFCcawOzSgnSatb9lKgz37XXPBz2R3eauwVXcmA7dgqvvekF2O1dUHlTIMpMp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66946007)(2906002)(66556008)(6486002)(4326008)(8676002)(508600001)(31686004)(53546011)(6506007)(186003)(8936002)(26005)(6512007)(2616005)(86362001)(36756003)(31696002)(6916009)(54906003)(38100700002)(316002)(5660300002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KBRjZrsdSfehOVjzrg9ZKa4J4I56UUj84BO92hi7foQnTYMp8+o7qdpq7x//?=
 =?us-ascii?Q?/f2MXh+NXzClAGcvCMoqCFC5Bnm28l32x1M5SOTCpDoVJb8aViaqfTtnu3lE?=
 =?us-ascii?Q?KkVJEOKk4BTbR/ZAJ+Hc1lwy9dq9FiiN736vZQoIbtuOFyd8zvAID3gnhzqQ?=
 =?us-ascii?Q?uHsBxgaYiPtQrh+snX8HOQBnQplaVK+k92BW21CRoro9TXtdaLa4DzvcLbye?=
 =?us-ascii?Q?FgZ4igyxZDAjgiFT1iRw4NVRm2jZahE8mLrhC39p2blO9wE4WqRTBQjxqVBn?=
 =?us-ascii?Q?zhLNGmyzi3nICFgDznK+9DzieL1DbOUcv5sqfar3p3lSTj6W+nhy9R69bj9P?=
 =?us-ascii?Q?vw0BrzoCLGoRB82y11GHXjyvsPEiuuRjrunvgqQZjtZ+HHrbescL/uwZIPP5?=
 =?us-ascii?Q?eYA021ZHgItQvmTonAsqstF9METVHurVyUITZ+T3AKousB310dWsqmSMPG+d?=
 =?us-ascii?Q?85LxqcnEVmLUvdY0Ybw4HsGMYpzQvcQ+DDtScr9iSQDOSzv8sCKamT+oo5OJ?=
 =?us-ascii?Q?CNV/PMmhvXKpBOx5D40cTjNn/jE7RuQIH66O4F07Pq1ANettdA6c2G81oA2C?=
 =?us-ascii?Q?HVDaYzPTkbqDQzjpMM5exg+jBcSuK5u8Lv7wTWgXT5biK3hJV/gifa/PkmtO?=
 =?us-ascii?Q?mJnCrY2hU4u4NWoTeojr5h52EtRTk8d2LaKIJwa+Cmis7LZQ0qNtmwdYUr9/?=
 =?us-ascii?Q?ljLp2Gf8b9oCkvSJJZKw76pnA4enix3uqTX2u/7QHZBHbp8sCVjAfVbjmW6M?=
 =?us-ascii?Q?YJXwIn/nUsmiPtJKpIutpUIBQz9BhVNfjXkClAJphwb4SKea1RD3ZrWYmfBG?=
 =?us-ascii?Q?Iddz+XtYLVKaJ56g1oHxjgRau9c6PvAJEkMQP0wjVM0h+pcY0frTRuT2zMSp?=
 =?us-ascii?Q?ky9R9rwRHt4TaRAvhYIAHkIVESIWpXNoivUa0o4Tmf2GWUDJmzvT6Z3sKG21?=
 =?us-ascii?Q?obi9TfFhLc+i+9zl8JonfDsVGj1F5NZ8Ux+PkwGWoSccUbV3cLJbRYwcc9ww?=
 =?us-ascii?Q?G38bLTa4L0qnDzHHvcBRsCZneFxjKIsCw9zB2eeMd5v4TlvbVA2kxxTor3pl?=
 =?us-ascii?Q?1mOzvb+Eu+l35/Eq59WocXybBIPuBNtt+F00QQlktauhMkKLJ0wn5scUyKlU?=
 =?us-ascii?Q?I52aefRPYSSo6GPOGPXgFFopMca7MtIacmY5MDTigZnbPeaKBwnxlyiSIF14?=
 =?us-ascii?Q?1ImbTa1JLbIeSketqeRFs/u6JhK4AOkNsWzaXyHJwcVKYRIv3ATad8s3fAwl?=
 =?us-ascii?Q?DnYsdLjGDyh1/K4b9u0MiAM4tQIvRjf7bMnwDb/iZJBVy6z1FwlJpDifhIDr?=
 =?us-ascii?Q?YTPHpXlNB0xcCJ1+t3zuOwZkU4aFjOyIZ+6qPhXiMvpia7DplwqJMMMF19Ze?=
 =?us-ascii?Q?0J3ezGAKe4spw4flpwHsWjrmQ+X/g5tkk6+KVDNJ1tak8d6bjUATArFe6PVf?=
 =?us-ascii?Q?lgr2BjaxxTZv31NM+1+/r8ofsV4Z1ek1VEvqj5DFyGpxo4yVIKWlXsa95vqi?=
 =?us-ascii?Q?4vpHAFh4IfYX0ZMkYtfATdENLmw2brD3Q5n54tfk2yNOhurD1bhaeWhGoJbI?=
 =?us-ascii?Q?ZOhC/yiQ+gdjcENNHScK4GlxN8UbxCo7qaz/hdu4FZW/2NIHPUOtMkzu/Txy?=
 =?us-ascii?Q?YbpBzgCHNFOzUDOm3YEzOG6zgvynLBigG7HmPNW2NRxoTw1BxkR8FmsRQsQf?=
 =?us-ascii?Q?0+2gJtkX2NavMbaS/zvoRVtNkZK0DQg2Je6ka9jlq+nCEvuHHzUvFysLkVks?=
 =?us-ascii?Q?30y+xQa0xw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a57248b-aae7-43f8-760a-08da43988152
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 06:32:31.1976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9yxBl0AprWwpLQL029JQHs+hbTffWf1BGDnd736R98UlQyIR3qp29naWQmvbS3zb5g33Ju/gvQSfrKu9ky0Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5685

On 01.06.2022 04:53, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B45=E6=9C=8831=E6=97=A5 21:21
>>
>> On 23.05.2022 08:25, Wei Chen wrote:
>>> @@ -119,20 +125,45 @@ int valid_numa_range(paddr_t start, paddr_t end,
>> nodeid_t node)
>>>  	return 0;
>>>  }
>>>
>>> -static __init int conflicting_memblks(paddr_t start, paddr_t end)
>>> +static
>>> +enum conflicts __init conflicting_memblks(nodeid_t nid, paddr_t start,
>>> +					  paddr_t end, paddr_t nd_start,
>>> +					  paddr_t nd_end, unsigned int *mblkid)
>>>  {
>>> -	int i;
>>> +	unsigned int i;
>>>
>>> +	/*
>>> +	 * Scan all recorded nodes' memory blocks to check conflicts:
>>> +	 * Overlap or interleave.
>>> +	 */
>>>  	for (i =3D 0; i < num_node_memblks; i++) {
>>>  		struct node *nd =3D &node_memblk_range[i];
>>> +
>>> +		*mblkid =3D i;
>>> +
>>> +		/* Skip 0 bytes node memory block. */
>>>  		if (nd->start =3D=3D nd->end)
>>>  			continue;
>>> +		/*
>>> +		 * Use memblk range to check memblk overlaps, include the
>>> +		 * self-overlap case.
>>> +		 */
>>>  		if (nd->end > start && nd->start < end)
>>> -			return i;
>>> +			return OVERLAP;
>>>  		if (nd->end =3D=3D end && nd->start =3D=3D start)
>>> -			return i;
>>> +			return OVERLAP;
>>
>> Knowing that nd's range is non-empty, is this 2nd condition actually
>> needed here? (Such an adjustment, if you decided to make it and if not
>> split out to a separate patch, would need calling out in the
>> description.)
>=20
> The 2nd condition here, you meant is "(nd->end =3D=3D end && nd->start =
=3D=3D start)"
> or just "nd->start =3D=3D start" after "&&"?

No, I mean the entire 2nd if().

>>> +		/*
>>> +		 * Use node memory range to check whether new range contains
>>> +		 * memory from other nodes - interleave check. We just need
>>> +		 * to check full contains situation. Because overlaps have
>>> +		 * been checked above.
>>> +		 */
>>> +	        if (nid !=3D memblk_nodeid[i] &&
>>> +		    (nd_start < nd->start && nd->end < nd_end))
>>> +			return INTERLEAVE;
>>
>> Doesn't this need to be <=3D in both cases (albeit I think one of the tw=
o
>> expressions would want switching around, to better line up with the
>> earlier one, visible in context further up).
>>
>=20
> Yes, I will add "=3D"in both cases. But for switching around, I also
> wanted to make a better line up. But if nid =3D=3D memblk_nodeid[i],
> the check of (nd_start < nd->start && nd->end < nd_end) is meaningless.
> I'll adjust their order in the next version if you think this is
> acceptable.

I wasn't referring to the "nid !=3D memblk_nodeid[i]" part at all. What
I'm after is for the two range checks to come as close as possible to
what the other range check does. (Which, as I notice only now, would
include the dropping of the unnecessary inner pair of parentheses.)
E.g. (there are other variations of it)

	        if (nid !=3D memblk_nodeid[i] &&
		    nd->start >=3D nd_start && nd->end <=3D nd_end)
			return INTERLEAVE;

>>> @@ -275,10 +306,13 @@ acpi_numa_processor_affinity_init(const struct
>> acpi_srat_cpu_affinity *pa)
>>>  void __init
>>>  acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma=
)
>>>  {
>>> +	enum conflicts status;
>>
>> I don't think you need this local variable.
>>
>=20
> Why I don't need this one? Did you mean I can use
> switch (conflicting_memblks(...)) directly?

Yes. Why could this not be possible?

>>>  		       node_memblk_range[i].start, node_memblk_range[i].end);
>>>  		bad_srat();
>>>  		return;
>>>  	}
>>> -	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
>>> -		struct node *nd =3D &nodes[node];
>>>
>>> -		if (!node_test_and_set(node, memory_nodes_parsed)) {
>>> -			nd->start =3D start;
>>> -			nd->end =3D end;
>>> -		} else {
>>> -			if (start < nd->start)
>>> -				nd->start =3D start;
>>> -			if (nd->end < end)
>>> -				nd->end =3D end;
>>> -		}
>>> +	default:
>>> +		break;
>>
>> This wants to be "case NO_CONFLICT:", such that the compiler would
>> warn if a new enumerator appears without adding code here. (An
>> alternative - which personally I don't like - would be to put
>> ASSERT_UNREACHABLE() in the default: case. The downside is that
>> then the issue would only be noticeable at runtime.)
>>
>=20
> Thanks, I will adjust it to:
> 	case NO_CONFLICT:
> 		break;
> 	default:
> 		ASSERT_UNREACHABLE();
> in next version.

As said - I consider this form less desirable, as it'll defer
noticing of an issue from build-time to runtime. If you think that
form is better, may I ask why?

Jan


