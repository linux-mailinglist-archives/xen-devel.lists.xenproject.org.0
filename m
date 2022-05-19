Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2617052CBD8
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 08:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332693.556431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrZU5-0007xR-HO; Thu, 19 May 2022 06:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332693.556431; Thu, 19 May 2022 06:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrZU5-0007uW-DS; Thu, 19 May 2022 06:18:05 +0000
Received: by outflank-mailman (input) for mailman id 332693;
 Thu, 19 May 2022 06:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrZU4-0007uQ-1i
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 06:18:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 700f30d5-d73b-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 08:18:02 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-q8hJPLqROb-sGL8TjhCrPw-1; Thu, 19 May 2022 08:18:01 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4337.eurprd04.prod.outlook.com (2603:10a6:208:62::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 19 May
 2022 06:18:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 06:18:00 +0000
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
X-Inumbo-ID: 700f30d5-d73b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652941082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWTnE3aXTHVjQN7DWRPrV2r+m4FxudE/Vh3ECcphPDg=;
	b=IT4ZMvXElMCCq0MKnCfurpLx1B604o506CsDmus1DzJryHZjOcmBVnloJ9cRFESgisFUwP
	M2W71hZeukpIfNW8RqQamSnYnh1X4DmLJr1F/5LWlhRlslDxD5DY5yYbSZj5qyyS6Wlg/i
	7QhQQ/xrQrWlA9TJ/EzJWewMX8p3Nzs=
X-MC-Unique: q8hJPLqROb-sGL8TjhCrPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMWxmo2VGINRn2FaRsSK4Ivb8dmLy7FBgGOr+FgRSiF1yYeuoA9CEjZNTlo7oSaktR/2iolefLQlZldtPCv4IFokng/DgKWtfIkyQM/2w8/eg3qgHYI44tklDqBcvGZvtFRKPbkPjKTyrPD34iv7Qm3PdCFVCEmlScsTdX1am+LJhMp+swb31euHlR7LBKrsXPUNPJ4XAUkoQOHjm0iAXA1o51DqWTwYWxeD/b/YTPTdBWWMpAl1IT6FWfqnZDV0TPEycQmA8QsN2fzqX0IQBuB3EdReEBZk2J/fUjA98uQfEQ0kJaPJDmXFPdXbbCrd60re2Lm5DrIYARZ3ZeOkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0WPu9sAXKxQTk+WGl5yre8/RwW5c771AEUl+e2xJQc=;
 b=SGtoniKLCrZmS4zKrVBnFGjOKnBxBwvkPKV1GsgmpGdG8PP2AFG+AurmPTOVpw9k3JofpAZUhUimYUkOrrVSSZMa4mfnqozxJzEOJ7VNEcucPOsc99AYesyNUMABBy2/uufg0qq3w9bMd8rXQ56d8JXVs+u9zJS5Sqd3X+5ms4SX46VPPhHtS0nEIfT2tYgp6qZCYYZDp02eo3aaBnwyWWydJwxW1UYgJXsfIiLto1Rt9z7niuOTQA6u8nU5jLSqO8LRKLms2QzaxNfIdirrQGdGSs2ExeNd8OVmK/RLMGjsh0Kip6ljX8jArRFVUv9SkcA0GgFAeNVfHqff81WGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4dd8521e-b63f-564a-6fff-87e3f1dc6f3c@suse.com>
Date: Thu, 19 May 2022 08:17:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 8/9] xen/x86: add detection of memory interleaves for
 different nodes
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-9-wei.chen@arm.com>
 <f81355e7-cbe2-4772-3799-9e53d15c458f@suse.com>
 <PAXPR08MB7420AF2735B2076F2EF4A9579ED09@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420AF2735B2076F2EF4A9579ED09@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ab43808-05af-4e27-737c-08da395f52d2
X-MS-TrafficTypeDiagnostic: AM0PR04MB4337:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4337844FAC90FC6FEF877A40B3D09@AM0PR04MB4337.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0tfcvtnPH0bxZl8Pjmoo5ZH61QsXkwPtw4Op1DGYzLGpM8g7GFWD8yl0hALolEFCofrucVvx0pYEWrUmmEGwTFnBYUQBGAGh8MbntRiw0ImMDsIvNP/AsjKYNoxbu6XdcobyuDV5qjv0XQC1MyNMytM+/7db9oGob0+/+1krxrezuEYOiASzUyGaBv/OpwfvYcUtgW6sBh+GleQewpFKALuRjd0oRF5ww1drNc6gvlK7EhU42Ae6uVHAXHr0qtolP29Gb3uLU26waFZAXMo6XdfGrCgDCqbZVTzPanwxJdDYxl/iDygd4Ou/oSmAt56RjT/mgzXhsko+/S3VRIx4FEsL2CP/cnAZ0V6qm4nW8XF4XFanozX9TbX9xzQGy6G/b9o5WiFHnmPPInaUju/0p+ltBS4v2A0Q66uMBBVmAPXF9Qr0SOlIRuo9l6/OYKAInaJjTSJDISRi1bnH/utsOSwrxHEi0iqyUHTLrOFW0NT5mBU++YYjmRUiR10B55RBx+uwyTLN7tAfyZBUgS9I2f7f6X2QE84bJR9x2pCqkZQXJBZdb/h0jc6hxkJaVHmqQ4YILnAtc9GsIKPAkofZytUaA8O8EMNy16wXevVDMOruCqc15AMOtGWl/4LqGtAvJydModD4Uv//1x/cuHoUnwwUZ9tS0RfED96H9GoxDhsTqjhVv/7sLt0fBqeiTz1kN6QgVvKw1OxfdJYlLXb3L4stjWVrsTqveivmARK44uk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(8676002)(6916009)(54906003)(66946007)(86362001)(66556008)(8936002)(31696002)(316002)(2616005)(4326008)(53546011)(6512007)(6506007)(6486002)(508600001)(38100700002)(31686004)(2906002)(83380400001)(36756003)(186003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IGWlfnqMDbXFAah8W7ia6aZNnSOqfXBWvxoNf3CXi1ViqRzirfm+PgMh2DUE?=
 =?us-ascii?Q?LgLkV3li/RXJi5cDE8GTR3+9301YVmFchcQFuKVyq1f7/4RS/sgXL+tiv725?=
 =?us-ascii?Q?GhiVjq5ZpQs4vyYmP7K+S+Y1r5HOKPM6fZjQif6dxsUcWkPTp76XTStZ72C4?=
 =?us-ascii?Q?5KmBJltotNLI7AjSRvHwtKJAw3//HHbXeb5sDkqTZIjYLrGA/dy5SXu/Au8h?=
 =?us-ascii?Q?RfBQB8ENs8lXMMcqMu5wxKXRP+SKmFssVHh3ERoEjWQL+SobO/fSs6GGHLd7?=
 =?us-ascii?Q?VB4rV2aLmzHTz07Ym6nQS8uaihHRAo2NUcWiYSGGLa0uH8Er0NIgsUOQ4WGP?=
 =?us-ascii?Q?hg+L6rnqPPhp1sDD8zJY5FudkljhXOqijoc7rDbLzOGfj8NxIzkX/or6Sfnf?=
 =?us-ascii?Q?TIvPEWSHn2CcXlWv43Mgx5aMbnDca1WbUi13BEzmkG8XF9LY9XXMgNenakNx?=
 =?us-ascii?Q?bzr4/BMscaqXlDJyIXmBQBhffG6SktQc1ixAzQWLocwM4Hm3MZgMTF3/BlLs?=
 =?us-ascii?Q?h0yI5UMRqeA99uy+uLlK6cqUpioT23BgVSL+PN2Ar8ouTzBSYrY2RauHuDHZ?=
 =?us-ascii?Q?u3QPeDoYa1QuxEOHXNEFPlsgRL/yK0mWbaq1qy5zat4Qe3GE91FB8geg7SjQ?=
 =?us-ascii?Q?TzWGSKWFdyu1C39pIqMZjZTKC/vqAKWwg0VhBZCy/rLK/i8bJK4QJccb7OJz?=
 =?us-ascii?Q?JB/2cd6vdMx7owOq78FBZhDDlv1bwO+rQ0esoEn/XwqRzEXhWCOtomwx5T/Y?=
 =?us-ascii?Q?rG3xm7YNXo5u5itpS76zn5YsBgyhpF8Ah93frhMmrHL3dEdOhHm85Uz6hWpb?=
 =?us-ascii?Q?NzgCjl3i5Rc+E9C+Zs3smRO5Pp8cjVe1+CIBAdyUyxQzJVfDtgbl/+p+nwHE?=
 =?us-ascii?Q?GwXNR0Bxrb/hGrMAHmj7kNXgg3GGNmlrtLF6XBOGAexerPqqPB9tfiVFn7c2?=
 =?us-ascii?Q?r/KAYCbvH7DGdwU1iQncS22deQKl47NIRdRaaXpBgmnGzT1AsbbkCb14FJhD?=
 =?us-ascii?Q?utqlMTC1Ja6ddPwVIRIAGY73kkQZMi38eurPQyqdiEm/J0vI2zPzTGBPZfcm?=
 =?us-ascii?Q?6uNlXFHC02bkzmEfOXpTYCkyg6oD9Xf6UkhSBZ+W5siHfI9CAdoPnXwdkpwN?=
 =?us-ascii?Q?0TiEzkGAX437UCRvishpkP05GScjOXsIsLhvNfG2R3VCT/4eLW4rhpfEVwns?=
 =?us-ascii?Q?S4o2P8elPQUXhuSxRtiXUfFFMWdG67zQHjuYeUYcw50WlnXkw7QD2fFdXcVC?=
 =?us-ascii?Q?xQ4kpIs0NmS0De8F67FbWPwUvxqYiApl/flF6NOgDPwEk1E5za0Wzw5IL0Ms?=
 =?us-ascii?Q?pXxIJV4YdNkAVPBvBeDdiGKWQq0+0K9Jhwb9bk9XR9ogv7rY5vGGREI49z50?=
 =?us-ascii?Q?TLPaAb3oMwVUWy/H8WXDLLFHX5Ibz/H5btzrbRSc97GtkkepFCbPR77H7bbZ?=
 =?us-ascii?Q?3cjwehL6uOeqEIKibirEM8foC3TURhK5t+ez1HXKsDANn8PsJfX/OZYA3jHv?=
 =?us-ascii?Q?QPf1y0n63lvuHpUSdFvkKnXmLFGXuQSFZVyWwLIvN74VnqWAhxJusjRCIovn?=
 =?us-ascii?Q?yP4jESWrAw63PBydpFAp6I5zUggMe7pjZQ1iVpHxg/AE73jGcAgkpNTQTEDh?=
 =?us-ascii?Q?yVPt1wi/qGlaV5nzM6b2Wv2s0g+/a8qax1FlN37jCVNiD7PemD22wmzZ9IC7?=
 =?us-ascii?Q?gJfmZTjlz4sflbiOWXcRftdevRah3soz4ilTeTyofbIqdCEJgNmhsn4kbl0Q?=
 =?us-ascii?Q?pxaig45yr9Vf7HnTojiEFezOOU0QC5TCiyygCY31Ink40gabY+YjrRG9qilK?=
X-MS-Exchange-AntiSpam-MessageData-1: f65gl4j6+AGTTQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab43808-05af-4e27-737c-08da395f52d2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 06:18:00.2265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMALEbqDkeWAxnufv4eSgJcEPkmiPA6AQiHosmgG05sJjh9uOjsGG9aVgESI2Vqc2q/G0/oQVLlG2RrNk4XppQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4337

On 19.05.2022 05:37, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022=E5=B9=B45=E6=9C=8818=E6=97=A5 21:31
>>
>> On 11.05.2022 03:46, Wei Chen wrote:
>>> @@ -310,42 +342,67 @@ acpi_numa_memory_affinity_init(const struct
>> acpi_srat_mem_affinity *ma)
>>>  		bad_srat();
>>>  		return;
>>>  	}
>>> +
>>> +	/*
>>> +	 * For the node that already has some memory blocks, we will
>>> +	 * expand the node memory range temporarily to check memory
>>> +	 * interleaves with other nodes. We will not use this node
>>> +	 * temp memory range to check overlaps, because it will mask
>>> +	 * the overlaps in same node.
>>> +	 *
>>> +	 * Node with 0 bytes memory doesn't need this expandsion.
>>> +	 */
>>> +	nd_start =3D start;
>>> +	nd_end =3D end;
>>> +	nd =3D &nodes[node];
>>> +	if (nd->start !=3D nd->end) {
>>> +		if (nd_start > nd->start)
>>> +			nd_start =3D nd->start;
>>> +
>>> +		if (nd_end < end)
>>
>> Did you mean nd->end here on the right side of < ? By intentionally
>=20
> Oh! thanks for pointing out this one! Yes, right side should be nd->end.
>=20
>> not adding "default:" in the body, you then also allow the compiler
>> to point out that addition of a new enumerator also needs handling
>> here.
>>
>=20
> Did you mean, we need to add if ... else ... in this block? If yes,
> is it ok to update this block like:
> 	if (nd->start !=3D nd->end) {
> 		nd_start =3D min(nd_start, nd->start);
> 		nd_end =3D max(nd_end, nd->end);
> 	}
> ?

No. I attached this part about "default:" late in the process of writing
the reply, and I did put it in the wrong spot. I'm sorry. It really was
meant to go ...

>>> +			nd_end =3D nd->end;
>>> +	}
>>> +
>>>  	/* It is fine to add this area to the nodes data it will be used
>> later*/
>>> -	i =3D conflicting_memblks(start, end);
>>> -	if (i < 0)
>>> -		/* everything fine */;
>>> -	else if (memblk_nodeid[i] =3D=3D node) {
>>> -		bool mismatch =3D !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=3D
>>> -		                !test_bit(i, memblk_hotplug);
>>> -
>>> -		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with
>> itself (%"PRIpaddr"-%"PRIpaddr")\n",
>>> -		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
>>> -		       node_memblk_range[i].start, node_memblk_range[i].end);
>>> -		if (mismatch) {
>>> +	status =3D conflicting_memblks(node, start, end, nd_start, nd_end, &i=
);
>>> +	if (status =3D=3D ERR_OVERLAP) {
>>
>> Please use switch(status) when checking enumerated values.
>>
>=20
> Ok, I will do it.

... here, explaining the request to use switch().

>>> +			printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr")
>> overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
>>> +			       mismatch ? KERN_ERR : KERN_WARNING, pxm, start,
>>> +			       end, node_memblk_range[i].start,
>>> +			       node_memblk_range[i].end);
>>> +			if (mismatch) {
>>> +				bad_srat();
>>> +				return;
>>> +			}
>>> +		} else {
>>> +			printk(KERN_ERR
>>> +			       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps
>> with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
>>> +			       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
>>> +			       node_memblk_range[i].start,
>>> +			       node_memblk_range[i].end);
>>>  			bad_srat();
>>>  			return;
>>>  		}
>>> -	} else {
>>> +	} else if (status =3D=3D ERR_INTERLEAVE) {
>>>  		printk(KERN_ERR
>>> -		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with
>> PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
>>> -		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
>>> +		       "SRAT=EF=BC=9A Node %u: (%"PRIpaddr"-%"PRIpaddr") interleaves
>> with node %u memblk (%"PRIpaddr"-%"PRIpaddr")\n",
>>> +		       node, nd_start, nd_end, memblk_nodeid[i],
>>
>> Please log pxm (not node) here just like is done in the overlap case.
>> The remote node ID will then require converting to PXM, of course.
>>
>=20
> Ok, will use PXM here. But I have question for upcoming changes, if we
> move this part of code to common. As device tree NUMA doesn't have
> PXM concept (even I can use a fake node_to_pxm to do 1:1 mapping), so
> can we still use PXM here?

This will want properly abstracting once made common, yes. What the correct
model on Arm/DT is I can't really tell. But my (earlier voiced) request
remains: What is logged should by referring the firmware provided values,
not Xen-internal ones. Otherwise someone reading the log cannot easily
know / derive what's wrong where.

Jan


