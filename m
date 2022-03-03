Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9B24CBBFA
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:59:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283128.482042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjAr-0005yq-TJ; Thu, 03 Mar 2022 10:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283128.482042; Thu, 03 Mar 2022 10:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjAr-0005wv-QA; Thu, 03 Mar 2022 10:59:09 +0000
Received: by outflank-mailman (input) for mailman id 283128;
 Thu, 03 Mar 2022 10:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPjAr-0005wn-0T
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:59:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2c39bc3-9ae0-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 11:59:08 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-kBdAAi68PJurWQDpkhuD4g-1; Thu, 03 Mar 2022 11:59:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR0402MB2788.eurprd04.prod.outlook.com (2603:10a6:203:a1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 10:59:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:59:05 +0000
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
X-Inumbo-ID: f2c39bc3-9ae0-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646305147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=be6hoA96UNy0+pF0zqh5gh7Y5OFBByCQ7SvKnQMi2rA=;
	b=ngNvGPUQsjHYJvIgq18GtEmW6oFc/8+ACXS2coS+yL5gn7SCuIgSM0DD1/laGtpFJldVm3
	KHQcQZUSyjjaAds00NJBV9BX5oiS1DCvWAng7BP9ICfG/uHE6Blb/QQGu6mECrPMiRXDEQ
	okOCaQ9e630XhVdcs57/XeOx9gEqe3M=
X-MC-Unique: kBdAAi68PJurWQDpkhuD4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAbboif4A5vGbcNCC7+dF06L0/YXx4S1r4gIg38EWIeWcmnA6ym8082bueQDby1G0KNKfoGdT7trBRwjmKRmopsLL9bXpLNPwPyReQ/8+oiJi06FkANauvTx8Gxe0jLPHKNYAPik1xu4IR9TXJOwpYSujFLveSYCXxNu5vy0WU8GUD4c0ZBOQXXc8kkKrjPB28GkQ368gw2uaOKsQHG6FKrBpCSOSM3dppcugt3iNQ6g6niwWxK2PjXrKjrw5rrCHSW87hGSJck1oIQjEOwDh/KLlVoAjldwXn40xnbUBV1TwT8fTpnEdmlNun97ZFi7/177fmg9FmpVP476h6PPKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1SV8yK9o9QiN0FlhArskaKNPMQh6eQ+kGmJnF2ekOs=;
 b=KQWLHrErhc2vWwVVASJNcMkHjoRsVWR5D8P+NMDp7kFblzxQLlA8ZNPnXr2pGw14hQuOX23UqmnBn2svHWAAH/ieeeH5D1PCma2J0SpR7OMkQhLvL49AKdsNMBBCH5jtaIMFB5D0lV+t1831bRgvDiPW7dLjqWK+YaC2nlZWAtceUvSwkia4P9aDDzi7fg3x5HqMWXzuKVuDi3cLqYnkJiYulV9jt1nsRfcvvlV757jJQCF7Z0jk68iiZwBKW637j7nHT8sCSnWJClr9lcOnLNzLER4qoBMxDGvOwZgNAt8sXiSht8A619mlDIX1ZY/NcXMcy6PGTldOvUqW1l1h2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9de235e1-70bb-9ad1-fb0f-c8c0f76ce765@suse.com>
Date: Thu, 3 Mar 2022 11:59:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 3/3] hvm/pirq: allow control domains usage of
 PHYSDEVOP_{un,}map_pirq
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Alex Olson <this.is.a0lson@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220303103057.49181-1-roger.pau@citrix.com>
 <20220303103057.49181-4-roger.pau@citrix.com>
 <c1fafc74-d4d2-5fc5-db38-c75f076d8405@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c1fafc74-d4d2-5fc5-db38-c75f076d8405@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P189CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1246f9de-c36e-45c8-2dd2-08d9fd04d540
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2788:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0402MB2788DA202B1E6CB2F47AAE1EB3049@AM5PR0402MB2788.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q6A34MVQHU5TO2cPURmYmzHfkWJAKr5YizOH2a1jJf2jwpIRshtWaaM6Yx5QydTm1JxqGMUfOhDFrFSp5TuYOhkE/uszAX+Q0n9Th+/GzxS7bHyVjCnZnuL6JtqRyo+sdOupO/A5RELyHyfmhlJCEjlrkZBugwhw8o9+NeJRkn/SpOlWZke0fnwgNgnqYYNMffMTBe23Tqe6nVOtwfFVwQOtFvLD2qAyV+pNNokWLHevFnB51/KyRAW4/2oC7emQdCWEj1YpFL2y5fjNJiqy4QRH5HaH822FodL/VmcYaDlR8XdEQIEytCb27g8zs0HKUVX6Pyp2VB8HSvzhg6FERQRWT0Cfe/Qy0aFol8hMusbdn2qXZzrK3kXu8EYqJZXCEIND0MauNlgNfqUSJJ3ezCaYHh/Hyz8fEIgaWZ6eCjhIQhjVAESI1HqgVMmnZ1ejzLqTpYH1DFJBPHAgnjCjFKHBOfeXOqyt1zj0kIst0BvCQZ4lhgUKnoLVvb9UAG/Wp0v6cLNfOEuX2faYUgTTAsmXr9nw9cGGIo68SaTf3HKr44/rLAtl137ZlmE780nT5sxjRX7f7bNzDoGOmWpuZfSPRaeXP06YBbRqM35N66zd9v3xgCPOWr3KF8yriif0sgQc9lr0idiIaqXlUgSpoFyS+txwYAz2abHYtaK9B8uRU+HHnpU0mrQd2cnVHa2sYIgeOx7hxjCVVgwtP1WCk79ptMBRQcs75ddn/P9oDPk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6666004)(54906003)(6916009)(186003)(6506007)(6512007)(31686004)(5660300002)(2616005)(36756003)(508600001)(6486002)(2906002)(83380400001)(38100700002)(4326008)(66946007)(8676002)(66556008)(66476007)(26005)(316002)(8936002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nE858wumelsaIz2QsBFBgcXGRdSlcpVjwBNg198TjUNIzrcvu0GVb9q3EP9x?=
 =?us-ascii?Q?6kdQtAh7opJyJwJuGsCOelDzHxBmKSSUtHQv3dW5R+nJboPXByHgeNjBVO5n?=
 =?us-ascii?Q?udEIK5akBeBL0QFvpxP2mZQHTe+Kp+vknIUZwzPInNsIFhZGz0gu5GvJmL6A?=
 =?us-ascii?Q?ERIkImJ4U+AJBk+gXvvTAihbDLMlXJTrqJelCeav2vxZAq3HiDAVvwpU8BG9?=
 =?us-ascii?Q?ef1IPe3++0QjupNogpBHLIWl49B42gTzJ4d3lP18JQQLW4Mht7GAwP6K/I1Q?=
 =?us-ascii?Q?X5ydrx7ynFToC70AZvRFqE03kfHnPZxQQ9AjCzpzZadN/Nygo5sB8p1ybSNO?=
 =?us-ascii?Q?JbaiK0aPcQVTpEOYZ5dHl87atP9UnDpP5s65q0aMZPkPhJisY0Q6DgII5g08?=
 =?us-ascii?Q?5C4467FpQFUozO1EkmFCvC0lTYTkLh6REluDlyBtZRXCPgujAT2aLgoEcqdk?=
 =?us-ascii?Q?o667El4C2RmCKvw/zuJIqPrdCGNR6lDZ6dRcU1kE7lBhR+6gccje7VLTbFPr?=
 =?us-ascii?Q?/FVA0BliclsVrl7xmmEMnRR30vrEkx3vAKKNA91U2qcuBtbm+RpjWDcqbPVU?=
 =?us-ascii?Q?Y9QYW4xQHF8bHaQykyMnTxezPNYahlaGgNCRsP6hARuGxMvby/AEhLmNkY7M?=
 =?us-ascii?Q?lGaP40aXjDXpOV7OGZak3lSbEnQTRuaVge47YGmDwY6f3m0uxBsA+HPesQ1P?=
 =?us-ascii?Q?LHgpyqS+EJ5RTwXY5uc6Ah+UazcrhYYXAF2qhJe/9n1VLYcU64Ntx7XDDkBf?=
 =?us-ascii?Q?KsPCknM18LKS4UQFRLPO1vwEu7KBoF55IrA3/Xl9pSZm9Kx5QlqRYS1Hsg3B?=
 =?us-ascii?Q?i8naO68Y33Mbsp7i/UbKP1WY2kp5kbxGvI3Z/4mLKnhstLJNS8zJXqAKuCRe?=
 =?us-ascii?Q?DDPKNEeNgsqOQsW1dB3uFdcIMp/csyfDYy+I3eWl/CybmdppjyIhIaFLeB4g?=
 =?us-ascii?Q?QakiSv4IR8Rm+Wv2ahhyIRjkooaxOfzBDSE/ruiWWrVhavWsxY6sIltZaUSw?=
 =?us-ascii?Q?b3ytAd8vVc8ThF3b3+9kzYnocCHjY5AIaZYBgACQlTf6Ndle/HcYV727o1h8?=
 =?us-ascii?Q?K6ES5jsVYYdUH5oAZBLLly1jB4Qv5aqvbGdJzSyFIRS31TOIkrtcqvFZC6p8?=
 =?us-ascii?Q?qsG9oUxH2VA/4xNFx35cfvAK0p4s7rWUntDbUhZzWftYdxmqkX85P8Arytv8?=
 =?us-ascii?Q?6OIwMeipebCE3Qb8ns4v6MVO+qIqF2r5ndo0XAb8lhegdzssE2+LBCgJu6x4?=
 =?us-ascii?Q?2kmO4LWBGQKFR1CM0ek3QGFJB5e1mr+LC7zCW8UIa59YFbGjQmmVz73BxW4t?=
 =?us-ascii?Q?xYWJNl8vgtJ7mmgzrz870JqkoNyUZSjuUY0orcoGaQKy/nkO+v4UDhtD7hex?=
 =?us-ascii?Q?GnvnxYtssjP/Rb2VUansTCG4FVB+VAfanJvGCQmEEVAsKNx+EY2uEdYcQ7/z?=
 =?us-ascii?Q?DOWKmaevgtA6iHyxmKJaSoTjuO/zBa4Cu1Pue4fvUms4C/YFxhCginkz+sFD?=
 =?us-ascii?Q?HsaVXpLFlfm/qtuwxmbgfSPRQ9s0zVN0gxaOrt2V+ghMVkyVcHX3NqVFP0MY?=
 =?us-ascii?Q?hPrhV9qejcQ1ylNVhAoME6dPFSecmLi8x1HVhXBIWV9PD85z7BBwiGsvHIU7?=
 =?us-ascii?Q?9fe0gEMfY8g94w3PsEZMed4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1246f9de-c36e-45c8-2dd2-08d9fd04d540
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:59:05.1272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jY5xg/97vMP9UK399IvpVmgTcsx9nXmyfO+XE2J4JIPpkEe3Neu9o1xtRbctloYprmKxqkA+VufedlvTghveQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2788

On 03.03.2022 11:45, Andrew Cooper wrote:
> On 03/03/2022 10:30, Roger Pau Monne wrote:
>> --- a/xen/arch/x86/hvm/hypercall.c
>> +++ b/xen/arch/x86/hvm/hypercall.c
>> @@ -87,6 +87,13 @@ static long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_=
PARAM(void) arg)
>>      {
>>      case PHYSDEVOP_map_pirq:
>>      case PHYSDEVOP_unmap_pirq:
>> +        /*
>> +         * Control domain (and domains controlling others) need to use
>> +         * PHYSDEVOP_{un,}map_pirq in order to setup interrupts for pas=
sthrough
>> +         * devices on behalf of other guests.
>> +         */
>> +        if ( is_control_domain(currd) || currd->target )
>> +            break;
>=20
> Hmm.=C2=A0 In a split control/hardware domain model, then qemu is in the
> hardware domain rather than the control domain.

Interesting. I would have expected it to be the other way around, with
qemu for domains with pass-through devices living in a stubdom.

Jan

>=C2=A0 I suspect this wants
> extending with || is_hardware_domain(currd).
>=20
> Also, the sentence about later safety checks really ought to be in this
> source comment too.
>=20
> ~Andrew


