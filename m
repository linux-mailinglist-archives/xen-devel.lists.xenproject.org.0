Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934253A14ED
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 14:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139345.257699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxgU-0006Vy-R7; Wed, 09 Jun 2021 12:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139345.257699; Wed, 09 Jun 2021 12:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxgU-0006Su-NG; Wed, 09 Jun 2021 12:51:50 +0000
Received: by outflank-mailman (input) for mailman id 139345;
 Wed, 09 Jun 2021 12:51:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqxgS-0006Se-SI
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 12:51:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90b001fe-08ff-4e79-a8a2-2c7f73e42e44;
 Wed, 09 Jun 2021 12:51:43 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-C97BAj0hPLGaNsmDosTIgQ-1; Wed, 09 Jun 2021 14:51:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.26; Wed, 9 Jun
 2021 12:51:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 12:51:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0240.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 12:51:38 +0000
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
X-Inumbo-ID: 90b001fe-08ff-4e79-a8a2-2c7f73e42e44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623243102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6q+ufWXZpdn/YN3zKqiIiK27ddt9J3hNc6NHQMlJ7I=;
	b=d+5vjsFdUEbCN3++UkyoDSQExQoH0iavNxsP8lChILqtvt3RDwXW0907GRoGu/4+EH6AC4
	3epqdmvRVAldsdDjhBFVnQjKLIQFZKCuWbPcdF0CLM6x/XjCJ49Uwt6WV+kSGq1RGq//Rj
	uB73tytjNDvKqDMDuOP2LKW23SQz56o=
X-MC-Unique: C97BAj0hPLGaNsmDosTIgQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HesYu/kJj36lS+u5Vr/6aOXcpJbrCOR0h0W/W+euBeZTHmlCSiLzUN5u5hQO1pxx4XztkVDA0JBiYUuIaQB1nUHTNGx2CjqJzLevW1nQa2ah5zND5EpNyrX3ooXTcyUBjm9WC9GqNbg5uKxWeYvZ4qxFN5wbx+t1J87K7J+i2WNb0YxtQNimYc+ri8/lWsRmTHfIkzni2zOI6ZHZ1/HGgelCrmlO0xTSSPcHvEv2eOBwbSDPsmDg53RRua4V6ActStHliulRNwNjiR6iERcpR4Ra5KkJ0bo9QD6Lj/EOBBQBsFQkIOtq/sT49wykOMC5x+VFcCnqrY8ip5/qA5JCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qzf0kMRXWXR2yll+48rZM819RBLaEPRggM3EAokXNXc=;
 b=S8W49KlXwDJid7/7l6ES4nUnOA5OogTsU2crqxrY3/+i0ItE/430hVxvgmDsWPOUNFTQ8W2Hup6YUQ4TYiYB2M3JjI64JR9oG+0uXwVe9a6cyT7IJCM6jDXkM6aCn+2rxUHOT/ZMwnpTcS0+IYCGsvfj/e97R6EwFShnU27jOAZ5vrkxJyQmjDGlWkoEGgR4+44nZmjZCa6uVrqXQbSv5SvkX0/7qbkWOB+H35qMH+FQnYputbwgEXhOe9cBZSFuxYTCfIvNgnqKsuqffJKOL/qcssEYYujLDbaXGTB/ElHULs/jLDWMwXtooN6U9APAoY20aW3glo5Uy3uEqlV+3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/9] AMD/IOMMU: redo awaiting of command completion
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <1bb49cce-537e-9fba-80bb-82bf502728d0@suse.com>
 <1fcb1140-b9b4-5c0b-de6c-e14d33937318@citrix.com>
 <e3283632-7621-69b8-5051-ec528c6ad8fc@suse.com>
 <4950c000-2984-a9be-d164-ecb65edffa2a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0b38a2df-0cb2-d31d-3733-38285614d154@suse.com>
Date: Wed, 9 Jun 2021 14:51:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <4950c000-2984-a9be-d164-ecb65edffa2a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0240.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c820426-b153-48f2-0676-08d92b4552a3
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6477C16C8345EBBF59E62709B3369@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WoNANj4Mj623Ix59gPK8EAIqCnIscvj1ZGZAv404Bi/RWDpNdUeevmwwrXXqcU0wRZrCsTRVKp70W3tnzBOBSsmoOId+vkogq7S7QrKGZF28PF2Yht/B1zq19wJ1/3Sw6FubwcE7BZtl91BGav+hTaS7FGbYuodEDVNBT3U2QH54loNu4I6Wll9ehKpyHw3AxkYT/nPFojTddIgq1FVG4apj9txB7w6USud9IXc3dHp9JMjewVmUVs4oSgJNV4cIeX5iRWiGMnv8sPXWevg/aTEs0hyaIkfjGEC5IZa4ANVAAbclJzj0C02DuNYTn8ZXKJFd51H1YyNvWAwpHrNLpAExRr+ym3pQfgN8wolAESi4ao81XW1Nf6XeHr5SXs9c+HKfkbSIDpPeB3TUHQct6uVNY58kfsixcsL/UsAwfi1HG4JgXDTDb9rNj0SNmfRlkK4h7iFom8LaqxIFI1VaEzuE+NOPsDrPOFYDkv96fmGhqVDmfORVZTmLpcBdMe2h6lcjoC9rpDDPBBH1v1ZOwxh/RJ4AYoFh8aI8cwOJzmKEQLBdVOB8ZVfVfkKn7nVSOoEhTQ1dQUmgxSHoq39ypiHPA6Gp2nCZQx9bbuVA2ic2S0XEIo/JxL4Aee5YWeyIpCUYg19WcE/ZeNFE+SDej0+inRCacgl/GixyrYqVYXCdOMKLY9txe+NsJ5h5isg9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(39860400002)(396003)(376002)(6486002)(478600001)(956004)(8936002)(36756003)(66556008)(2616005)(8676002)(16576012)(66476007)(2906002)(5660300002)(54906003)(4326008)(53546011)(66946007)(26005)(186003)(31686004)(38100700002)(86362001)(16526019)(31696002)(6916009)(316002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?rZaIf+tIkunjH1BJRxDXGAI9Vay2KfgzTJQEkD7zl9cp8Ur4kYoG4Atvy0qZ?=
 =?us-ascii?Q?jFv8gTjlaIl8WqmWwRCUP0lBwGrhDL9xw7XIUoHhbvsQbZcN8/KHOVYtcS/L?=
 =?us-ascii?Q?j5qKJIU2X/UxLhROT2OFQjOvwIAw4eavs9/FYUpGFjeb1PIccZTijCXpvgB2?=
 =?us-ascii?Q?Ap2LtzPp+OE/TmaffjC1sWDdbk75lQxrS8f5LX061pi8p/LnMy/3N8qPxJHq?=
 =?us-ascii?Q?XGMXsq3fM1Y5DhKLiG/q9cYJruo5ponKI/xr3smTdQ70W5K1tLcoS0RvGrVr?=
 =?us-ascii?Q?1cIcrShdbIUq+/KQwnl7qAzSgw0pBbeqxfccDlZ0SpRZW8KS8Oo0XGvGtFjZ?=
 =?us-ascii?Q?cxGmTmI1dL5LhrQnlE9GfAWKRxeaW+c/EBg+lvBJT5O6BRW4PQVyMDgeXDCw?=
 =?us-ascii?Q?IChKcj9K6H0jjpGCc58BJ5aVIxRtgE6AmTdoHiDzTUzeX64+PWtGj7CtPfr5?=
 =?us-ascii?Q?PF5X44Fg2UCt2FiIix6V136C+UPbetM9VKXIztFw8rYuoXH+PgV+wKd8XSbu?=
 =?us-ascii?Q?j41fTE9k9uQH4UglgqGYWXQfVj8QSxfBU7IMbtpa6zPpvxQ13aNFmUsXcKaJ?=
 =?us-ascii?Q?3n2q1dv1SIVPF5biE2GPMTFzVsb7xCMmM7X8EArcOyFlxXht8dgl1EeEd2JL?=
 =?us-ascii?Q?I+E0BoFTAAIyHsbsEtpxvvrnIFOtf2PNsdojymQUAlD9XqRE8WMdEne+3jQc?=
 =?us-ascii?Q?o4FPISS+zpoPqsj/w2G1dIh6xOnJnKUSjJ3paxZ8Hn5Sfx51cq9VLB0J/WBw?=
 =?us-ascii?Q?z78OGHjLY04JDoxc2eZOiWRjmnOswmN0wGH7ILnLyCBLXx3d6lqLRrce88jg?=
 =?us-ascii?Q?Hh/psky0PsUD1IOV4aMvYSRwqZ0AGyp+pXN3RO7FkhZ0SNnXNn6IafoGQgnU?=
 =?us-ascii?Q?w9B89pWMdVpK7ohor1Geu+Ei6qKEGBk9s6pW+8/pVweHmodl9BtA3B8vBNB8?=
 =?us-ascii?Q?9ExTXsPPfvij8j2xeqrKQ7PtWVDGou9HAipevEm1f173QK4ZzVsLi8kD7L1B?=
 =?us-ascii?Q?7+RR32Cwbz1qAgYItP1FY7JReGLKtqZ6PCUH+qZHOp15cobTnmN/ba7PlAhK?=
 =?us-ascii?Q?bLV7Pke1iDVzt4L3n+F/F89+/y/9P9EBL5XbfwEIw1ViZvgV2KslKHKShSQt?=
 =?us-ascii?Q?qziecIykclZyL5fhJHKomw2x4kdYK4x1PMpir4zdiL1kEqFNDIh7D7NFDHEr?=
 =?us-ascii?Q?Vc5mAGmvMa3/XyhW2xTopogq7u5M01OSe5lBVdBfWXF1p9BWBwhU26pM0+hc?=
 =?us-ascii?Q?xUk0EJSrXuFLfdjimgGP7Axbzo6K2RthAdqK7lW1bhvnyZGoVOlJ8cl07aa3?=
 =?us-ascii?Q?mEJWfCW/tx5joDmfM0/UxaTD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c820426-b153-48f2-0676-08d92b4552a3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 12:51:38.9958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJhOwochN+1gQBmXrnCI+cgF2UoE6v2XDFbvoc60yGCPnfb/UeZKdbsalwDhrlstQQOEhbqKmvTyuxMT29gubg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

On 09.06.2021 14:33, Andrew Cooper wrote:
> On 09/06/2021 13:08, Jan Beulich wrote:
>> On 09.06.2021 12:36, Andrew Cooper wrote:
>>> On 09/06/2021 10:26, Jan Beulich wrote:
>>>> @@ -49,28 +52,31 @@ static void send_iommu_command(struct am
>>>>  static void flush_command_buffer(struct amd_iommu *iommu,
>>>>                                   unsigned int timeout_base)
>>>>  {
>>>> +    static DEFINE_PER_CPU(uint64_t, poll_slot);
>>>> +    uint64_t *this_poll_slot =3D &this_cpu(poll_slot);
>>>> +    paddr_t addr =3D virt_to_maddr(this_poll_slot);
>>>>      uint32_t cmd[4];
>>>>      s_time_t start, timeout;
>>>>      static unsigned int __read_mostly threshold =3D 1;
>>>> =20
>>>> -    /* RW1C 'ComWaitInt' in status register */
>>>> -    writel(IOMMU_STATUS_COMP_WAIT_INT,
>>>> -           iommu->mmio_base + IOMMU_STATUS_MMIO_OFFSET);
>>>> -
>>>> -    /* send an empty COMPLETION_WAIT command to flush command buffer =
*/
>>>> -    cmd[3] =3D cmd[2] =3D 0;
>>>> -    set_field_in_reg_u32(IOMMU_CMD_COMPLETION_WAIT, 0,
>>>> +    ACCESS_ONCE(*this_poll_slot) =3D CMD_COMPLETION_INIT;
>>>> +
>>>> +    /* send a COMPLETION_WAIT command to flush command buffer */
>>>> +    cmd[0] =3D addr;
>>>> +    set_field_in_reg_u32(IOMMU_CONTROL_ENABLED, cmd[0],
>>>> +                         IOMMU_COMP_WAIT_S_FLAG_MASK,
>>>> +                         IOMMU_COMP_WAIT_S_FLAG_SHIFT, &cmd[0]);
>>> set_field_in_reg_u32() is a disaster of a function - both in terms of
>>> semantics, and code gen - and needs to be purged from the code.
>> Long ago I had an item on my todo list to get this cleaned up. But
>> it never really having made it up high enough, I dropped it at
>> some point, in the hope that we'd manage to get this sorted while
>> re-writing code step by step.
>>
>>> It is a shame we don't have a real struct for objects in the command
>>> buffer, but in lieu of that, this is just
>>>
>>> =C2=A0=C2=A0=C2=A0 cmd[0] =3D addr | IOMMU_COMP_WAIT_S_FLAG_MASK;
>>>
>>> which is the direction that previous cleanup has gone.
>> I don't think I can spot a single instance of such.
>=20
> It's actually the other way around, for the emulation logic (which isn't
> used in practice).
>=20
> drivers/passthrough/amd/iommu_guest.c:348
> =C2=A0=C2=A0=C2=A0 i =3D cmd->data[0] & IOMMU_COMP_WAIT_I_FLAG_MASK;
>=20
>>  Some work was
>> done to introduce (mainly bitfield) structs, but this surely goes
>> too far for the change at hand. I can spot two instances using
>> MASK_INSR(), so I can see two consistent ways of doing what you
>> ask for:
>>
>>     cmd[0] =3D addr | MASK_INSR(IOMMU_CONTROL_ENABLED,
>>                               IOMMU_COMP_WAIT_S_FLAG_MASK);
>>
>> keeping the name as *_MASK (and I'd be open to replace
>> IOMMU_CONTROL_ENABLED by true) or
>>
>>     cmd[0] =3D addr | IOMMU_COMP_WAIT_S_FLAG;
>>
>> i.e. dropping _MASK (but requiring adjustments elsewhere in the
>> code). Please let me know which one you'd prefer.
>=20
> TBH, I'd suggest just using
>=20
> =C2=A0=C2=A0=C2=A0 cmd[0] =3D addr | IOMMU_COMP_WAIT_S_FLAG_MASK;
>=20
> for now.=C2=A0 The constant is correct - its just the name which is wonky=
.=C2=A0

But my previous reply was to make clear that I don't agree with
ORing in a *_MASK into a (to become) live value. *_MASK should be
used exclusively for masking, not as actual field values. Any
code violating this should imo be looked at with suspicion, as to
possibly having used the wrong value altogether.

> This in particular will reduce the code churn for ...
>=20
>>> There are no current users of IOMMU_COMP_WAIT_S_FLAG_SHIFT, and ...
>>>
>>>> +    cmd[1] =3D addr >> 32;
>>>> +    set_field_in_reg_u32(IOMMU_CMD_COMPLETION_WAIT, cmd[1],
>>>>                           IOMMU_CMD_OPCODE_MASK,
>>>>                           IOMMU_CMD_OPCODE_SHIFT, &cmd[1]);
>>>> -    set_field_in_reg_u32(IOMMU_CONTROL_ENABLED, 0,
>>>> -                         IOMMU_COMP_WAIT_I_FLAG_MASK,
>>>> -                         IOMMU_COMP_WAIT_I_FLAG_SHIFT, &cmd[0]);
>>> ... this drops the final use of IOMMU_COMP_WAIT_I_FLAG_SHIFT, so both
>>> should be dropped.
>> Well, I can surely do so, but like this entire request of yours this
>> feels like scope creep - there was no intention here to do any
>> unrelated cleanup. And if I remove _S_ and _I_, then surely _F_
>> wants dropping as well, while IOMMU_COMP_WAIT_ADDR_*_SHIFT have a
>> use each in iommu_guest.c and hence need to stay for now.
>=20
> ... this, which I'm perfectly happy leaving to a subsequent change.=C2=A0
> (I'll even do it, if you're too busy right now).
>=20
> What I am mainly concerned with is not using this opportunity to remove
> uses of set_field_in_reg_u32().

Well, when I put the patch together I was thinking of two "proper"
options - keeping the use of set_field_in_reg_u32(), or replacing it
by (bitfield) struct uses. The latter would be a far larger change,
and should imo be one on its own (i.e. no functional change) anyway.
Hence I went the former route. Since you vehemently ask for it, I'll
go the middle route you suggest, but this only sets us up for re-
writing this piece of code another time once we introduce proper
structs.

Jan


