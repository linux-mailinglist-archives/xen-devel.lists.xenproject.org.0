Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256933A1485
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 14:34:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139287.257602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqx0y-0005h2-EB; Wed, 09 Jun 2021 12:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139287.257602; Wed, 09 Jun 2021 12:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqx0y-0005ev-B5; Wed, 09 Jun 2021 12:08:56 +0000
Received: by outflank-mailman (input) for mailman id 139287;
 Wed, 09 Jun 2021 12:08:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqx0w-0005ep-JM
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 12:08:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 761ad142-23e2-42e6-a145-6983d95b3aa7;
 Wed, 09 Jun 2021 12:08:53 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-fOMUf2AMMhGzyFXQkGEGIw-1; Wed, 09 Jun 2021 14:08:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5167.eurprd04.prod.outlook.com (2603:10a6:803:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Wed, 9 Jun
 2021 12:08:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 12:08:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0075.eurprd07.prod.outlook.com (2603:10a6:207:4::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.12 via Frontend Transport; Wed, 9 Jun 2021 12:08:49 +0000
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
X-Inumbo-ID: 761ad142-23e2-42e6-a145-6983d95b3aa7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623240532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQNawxGt/NbMZEli/PIGo203LGEWeiLL6Dc3t+HZrxQ=;
	b=E5qDWwtOy43VbZqrLz+gspd+yYDU5TNra+8icRc9UmzR+U5QvxdaS/SgN7yJwPDw/M5f2v
	DMc2oZkVYb6ZKkerzQ53tgTvTRxTMr/9JBDWCPoPaBhc8nhb5ZKWD+kTJdVOW/lTgAtHPL
	vzHI5XIMcwtRtXG3bHf9dqY+NgoVwmY=
X-MC-Unique: fOMUf2AMMhGzyFXQkGEGIw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5QK2tePcHWj3ZfA6wEhe9pvHsUsAhQBAHE2f+8rXg/Xva+xKsBlzMLAZz6N5El3/HMSpsHa+sdJy3iHw9NcSGfZokXhm63lttxmD4LeINPeixHwrESPEAS/NyObl2WSPMOCQhYV6akT70rPE6TiFEpi6iaILUUhT3yCdPRQHk7WL+JoNFI2UHKEeNS3ueeg1UhiOXAott0637fh5CjLHtbSOoRPRGFi0p0mhriEQtcyEVPJR+QqZY/qxYxAKD3Cbg6IsNsv5sOb3Npr2r6Rl0WJir/xxY/urtJFvSspcCLZSoiaQLiCvd2GOTnhFafPZULctzx1LwHv5xa5Aiiwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xv+J29O4fJpEa2bYbUhjPq0Db6awz6u4S6/r+tHcL9E=;
 b=SlkZqxgiQNujIYxttsnmRcy+P6uO3AGkvCWlpJX/TIX6UH4PfvEl1JTGZ2bRrLN4kot9aMgzq9olyE4aUcvgMXEAM+V/FpmmDqi9JZv7cwQQGoPFy3Xvd9Cai8qe+XvChmmHpgxg++wIwzi+CcRIKEhvpfqrCyXST9X2R1kc09hLsyWyPuX54uHA1TKbF64kJeZW0fCKYyNfOUQdD9Ae6J9jihJKOgC/qt+09u6GuFSqfwzC0GcuRBrT5j4jbSJAHdmWrMSU9rWD+9gOkWfvbN2Tjx1kwC9IyVcs9+avLZzw7u4H7jMWOxSzHH2A5FmS6td1JTK8cfRZQo0Dd/ZbfQ==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e3283632-7621-69b8-5051-ec528c6ad8fc@suse.com>
Date: Wed, 9 Jun 2021 14:08:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <1fcb1140-b9b4-5c0b-de6c-e14d33937318@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM3PR07CA0075.eurprd07.prod.outlook.com
 (2603:10a6:207:4::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6145250-09c7-47c5-4784-08d92b3f571b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5167:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5167D3A9C0240C8B511E6CE3B3369@VI1PR04MB5167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	blgNiwI9mG0wo1lncVwwa5OOdoI6sFUDXv0HuD1hq0x2qX97FiCc/h6n+idaiHY4dkpfR3rjnN+YNfgYAAUZ+ERmuKvP7BAs6Wc3oxzXSGo15ADz4HuBqnfBwcHVOvS6VeXe7hVwzqQmsf6evF8YLFz1RIR+7d4PDAvf3JA9eJb3CoWfX1tRhZWSJTGI6hmgkEiipytCRReH1QihWbe0XmVz6ZZXXynpvvkbgdwFcEMokffVVIgnui9D8hTdr2TCxvUP9zm7GaALqO6IXzUS8dqZlH9OIF7KzIEcCIx0yDa3bKsYXMacZ8LmBcS0PglBg7V/EtjuXfAojynkz+692/ZGbhklYb/akBnVcx+xtX1B9PDAqGf2OFWZNvP88sBNB4kBMIGg7YPVEw/AmQpZqoHO1jk1FuDLnZgphG8rFCtgL/8tq3ewvRheGHNtSd2dvfsH2+ZjlKcbX6GEY5iPIq0iBe06nKnLKYrb0+gUqdkFXYHDJ+R+iapyHSvQyVM10vqzr8PhhjcByxI2bqFbCmApGuy51seFb76kRHG8F5Y12M/htwhfndrrGBRgI50kjjde/4sXQpfPme8aiuzdzot+OAvlP4EyUGsD/QQPerzKC0sXRotGR7RAjZyhPG3IGQW5HWFlDlFhQf+a3H5y9647+oDBEdm8Oi8m00uzaE4fIXkF9i3YKXGo1CrjEJ0N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(39850400004)(366004)(396003)(2906002)(5660300002)(36756003)(16526019)(66556008)(186003)(26005)(478600001)(86362001)(54906003)(8676002)(6486002)(83380400001)(53546011)(2616005)(16576012)(31696002)(956004)(6916009)(4326008)(66946007)(66476007)(31686004)(38100700002)(316002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?TNDHEFpChQ6T791zJFZslFgpsbLtejh1hYFuLU1fvV0qtKOMlQjXrzqV7xSF?=
 =?us-ascii?Q?t4ZWKQJn8ZY6csRbyDDcv7hqk6V1WVJueFd+swACAQaGLqv5lT1J8IXrhoQL?=
 =?us-ascii?Q?dvup0t55CmHHdoIALSjbGkMn491Jf2qyR6dIsJd0v43nF+ctvM0rIIcp/lnI?=
 =?us-ascii?Q?KR5pvwU8Rh3AkzvoHbuV5jyTyuNcakn6bghsMXkQIlfhFMptVU/j2Y77+fgz?=
 =?us-ascii?Q?ark7f4FJ2Di+ag66IBzei11JzpVQh048bwTaqmTpkpYoGZcPn18SpgMJI30S?=
 =?us-ascii?Q?IVn9YO4FS4RrJ9j68o1NEZQDEYmgOfNhnxkognXQ9vW03sGr2FlwBsv1H1+M?=
 =?us-ascii?Q?A6xYPv4Cug2XV94M4OtAtUGboQ89WDE0jJfOWaTltRFt2u8j/BKYbWFC+YxG?=
 =?us-ascii?Q?feLh1A2CXLV70RXVT7PMQmCJ9aUc/N8CK2d9tJ/r/PQta2bV9J6WG/a/+Wp/?=
 =?us-ascii?Q?R03fK/t98qzxX3tQ85/Uszq4Z6zkwuRsErT37+L74h1OyEfNCKvupM16Sp2J?=
 =?us-ascii?Q?19KLpU/oKIZ1r+6yz6TYBrfnJq/85xhoIFuNYOlwol9GHCZI9RSIruMJETtj?=
 =?us-ascii?Q?ahGXf6bWsmGeA37qgCH5vFXYEEqrmUED066VygyicIxgHIwoTUI7W2EIYeX1?=
 =?us-ascii?Q?BgfbNp4E2eh53obgGQM5d8NGOyvjjVS4Kyh8u7B2NK3C/8odgqS0PlxmMTdn?=
 =?us-ascii?Q?4QVnkvRna73XlgntAtHoJ53tVHnM6ee3Ow8X0vh0FiVJBJCjQRj4tCg7ukRF?=
 =?us-ascii?Q?d6p7fMWmcZG8r6l0wXwhUpNrlppUCvryaSH4zMQQxTGNsi8L5Dh7s+S7qjjh?=
 =?us-ascii?Q?0fZyVaUhE8MGusqxUFHc1T5IXhGC2993Q9QRTvyjAwl4MBbR6hYD+VxHToVF?=
 =?us-ascii?Q?MTwiylLTFfQXmkxRxwbpvs/nPS46qAFQOLYA3JdKVA5HLFrZBpw3zwClHcU/?=
 =?us-ascii?Q?qzKSnR0Mo/2vReD6RO+475jQiRmRzhWZSpX7CtY7GQcorD/FFXelA0R+lVoG?=
 =?us-ascii?Q?uNB1x+tVB9rYcCJz877+fkeoqno8+5FaKA1TiT72OVSG/K1kkkRNrb97+dLe?=
 =?us-ascii?Q?j981DcUsSEqukFj6OM9wsuoYk389yh6/egpNwYn3MdOmAe1wwj1uefbshWB+?=
 =?us-ascii?Q?Vb2e39Vc3knZqFgusgy7qqfQ7tI/xV9/z2xSq2OLjFF202Oftly0Bw/M696g?=
 =?us-ascii?Q?L+1lQzrekMUcXHd/8n+qJeCYsPacbUcALD16z0g1yNFAgDL2y43suT8Riian?=
 =?us-ascii?Q?8ctSAW2yZlBE1I9SjedkvtnuhOzd5wdXJ6quEhcCKzc52zr0h4PMhBql3EYW?=
 =?us-ascii?Q?lAAYTDOHPvYtqYdHCysLGYXz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6145250-09c7-47c5-4784-08d92b3f571b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 12:08:49.5174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrtSQbl5ZzXDwD6A/NnMrGhUoJND8DElCUKXgXtN3o0TYoN7xov1cv6dMHNBnnGhaC9wfz5cdG22POvBfAESuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5167

On 09.06.2021 12:36, Andrew Cooper wrote:
> On 09/06/2021 10:26, Jan Beulich wrote:
>> @@ -49,28 +52,31 @@ static void send_iommu_command(struct am
>>  static void flush_command_buffer(struct amd_iommu *iommu,
>>                                   unsigned int timeout_base)
>>  {
>> +    static DEFINE_PER_CPU(uint64_t, poll_slot);
>> +    uint64_t *this_poll_slot =3D &this_cpu(poll_slot);
>> +    paddr_t addr =3D virt_to_maddr(this_poll_slot);
>>      uint32_t cmd[4];
>>      s_time_t start, timeout;
>>      static unsigned int __read_mostly threshold =3D 1;
>> =20
>> -    /* RW1C 'ComWaitInt' in status register */
>> -    writel(IOMMU_STATUS_COMP_WAIT_INT,
>> -           iommu->mmio_base + IOMMU_STATUS_MMIO_OFFSET);
>> -
>> -    /* send an empty COMPLETION_WAIT command to flush command buffer */
>> -    cmd[3] =3D cmd[2] =3D 0;
>> -    set_field_in_reg_u32(IOMMU_CMD_COMPLETION_WAIT, 0,
>> +    ACCESS_ONCE(*this_poll_slot) =3D CMD_COMPLETION_INIT;
>> +
>> +    /* send a COMPLETION_WAIT command to flush command buffer */
>> +    cmd[0] =3D addr;
>> +    set_field_in_reg_u32(IOMMU_CONTROL_ENABLED, cmd[0],
>> +                         IOMMU_COMP_WAIT_S_FLAG_MASK,
>> +                         IOMMU_COMP_WAIT_S_FLAG_SHIFT, &cmd[0]);
>=20
> set_field_in_reg_u32() is a disaster of a function - both in terms of
> semantics, and code gen - and needs to be purged from the code.

Long ago I had an item on my todo list to get this cleaned up. But
it never really having made it up high enough, I dropped it at
some point, in the hope that we'd manage to get this sorted while
re-writing code step by step.

> It is a shame we don't have a real struct for objects in the command
> buffer, but in lieu of that, this is just
>=20
> =C2=A0=C2=A0=C2=A0 cmd[0] =3D addr | IOMMU_COMP_WAIT_S_FLAG_MASK;
>=20
> which is the direction that previous cleanup has gone.

I don't think I can spot a single instance of such. Some work was
done to introduce (mainly bitfield) structs, but this surely goes
too far for the change at hand. I can spot two instances using
MASK_INSR(), so I can see two consistent ways of doing what you
ask for:

    cmd[0] =3D addr | MASK_INSR(IOMMU_CONTROL_ENABLED,
                              IOMMU_COMP_WAIT_S_FLAG_MASK);

keeping the name as *_MASK (and I'd be open to replace
IOMMU_CONTROL_ENABLED by true) or

    cmd[0] =3D addr | IOMMU_COMP_WAIT_S_FLAG;

i.e. dropping _MASK (but requiring adjustments elsewhere in the
code). Please let me know which one you'd prefer.

> There are no current users of IOMMU_COMP_WAIT_S_FLAG_SHIFT, and ...
>=20
>> +    cmd[1] =3D addr >> 32;
>> +    set_field_in_reg_u32(IOMMU_CMD_COMPLETION_WAIT, cmd[1],
>>                           IOMMU_CMD_OPCODE_MASK,
>>                           IOMMU_CMD_OPCODE_SHIFT, &cmd[1]);
>> -    set_field_in_reg_u32(IOMMU_CONTROL_ENABLED, 0,
>> -                         IOMMU_COMP_WAIT_I_FLAG_MASK,
>> -                         IOMMU_COMP_WAIT_I_FLAG_SHIFT, &cmd[0]);
>=20
> ... this drops the final use of IOMMU_COMP_WAIT_I_FLAG_SHIFT, so both
> should be dropped.

Well, I can surely do so, but like this entire request of yours this
feels like scope creep - there was no intention here to do any
unrelated cleanup. And if I remove _S_ and _I_, then surely _F_
wants dropping as well, while IOMMU_COMP_WAIT_ADDR_*_SHIFT have a
use each in iommu_guest.c and hence need to stay for now.

> As for IOMMU_CMD_OPCODE_SHIFT, that can't be dropped yet, but it would
> still be better to use
>=20
> =C2=A0=C2=A0=C2=A0 cmd[1] =3D (addr >> 32) | MASK_INSR(IOMMU_CMD_COMPLETI=
ON_WAIT,
> IOMMU_CMD_COMPLETION_WAIT);
>=20
> in the short term.

Can do (using IOMMU_CMD_OPCODE_MASK).

Jan


