Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085FF447D20
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 10:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223165.385736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk1MH-0006cU-N8; Mon, 08 Nov 2021 09:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223165.385736; Mon, 08 Nov 2021 09:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk1MH-0006ZO-IK; Mon, 08 Nov 2021 09:54:33 +0000
Received: by outflank-mailman (input) for mailman id 223165;
 Mon, 08 Nov 2021 09:54:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mk1MF-0006ZI-Si
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 09:54:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de394ae4-4079-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 10:54:30 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-L_DuJy4oO4yFau81UPZHiw-1; Mon, 08 Nov 2021 10:54:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 09:54:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 09:54:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:20b:6e::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Mon, 8 Nov 2021 09:54:26 +0000
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
X-Inumbo-ID: de394ae4-4079-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636365270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQsEs9QIqEZ9vZQCo8yWSRcrK9Zq+jN89Lz25C82ctI=;
	b=i9e24Z9yRdp00CRaGMlLQF9f6FKT8zlH6/SU4LuWz4lYON2MpZGO7cefOQ0h+fGz0YeSIN
	hlZmsyuOsK4thP8sV2ne80Hc6oy0jqWceLlJL3QVPTX4KYZhYOrxaSZv4Kwf9NL3EWscEL
	N/Dl87qXl5mlSWjP2B6EzRUAMRAh0c0=
X-MC-Unique: L_DuJy4oO4yFau81UPZHiw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/vA1xDm2lYE/M8sGh8KmDV1JmOWHX0NFk87p0tWVQOHAadsNNCAXfxkBBH9rAVNKnuX7dOgzf5ZNkAXFR1pIIg30QZYE1epQkrhn3Zzf9Wp35ZZGvXjB5h9McQYfzuPiObmaeF4bV/0fMaKdGQ71GQWouLfeZDpw5ECMhciDCvq32G3POQXSXjkaz6P1y+Zjwi2LkGjo8koTgk4s/KePddMw30EnuYaZwD9s6NPQuf2ZQDvKaxiAA5sUL2eLUVkR0mHaN8nh8ereSxSQ1Tq+T1cbl+x/daUnXD8JOIsQgWyqWZtSgkJr8A9A423uS4Nzq+qXhEUHGd4mb63gtrnYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqwVs/5fGqS3lDILpvrsk+5eS7mZXtzUWMNzPFbpLb4=;
 b=K1eJfeZz1DgjxOzru0LeIGq/lwuACf9qqp2HNuUS05pQas/bauZU95ySLlZ/mDSnk2TrFPG3/QQlFGrhSHNUjqLIl/WuWXjDF5rlw8V3FN/8R76vxxGZ4qAMaBGDjO1dDVeoIdSlwUQwECsQwPOziNcuLSzSz/TrMeXjDw1sEkuM/e1ABgXupbnsLMdPBuBn/FhTwf3zDgmJI9iHXynFk8Gr83kZhmk59F9sNbupS2nNQHsdyCxsi6y0MGahcZzPK2e1iIxZZ5YXVQ6D0EoLoEsVC/AUkr4M4ahvn5XzgHZWGKRgHf0zH885NfUUhqAmcPOpcyWJRgbPCif4YH5Lmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <05d06abc-e52f-4e8a-8999-950712ce5508@suse.com>
Date: Mon, 8 Nov 2021 10:54:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU
 ACPI table parsing
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@FreeBSD.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
 <43d8cc88-aae0-5a82-7b4b-756dd54dd223@suse.com>
 <YYVQAH7OYmFSVOei@Air-de-Roger>
 <af235a71-2916-2498-b19b-4759a9e6fa95@suse.com>
 <YYjvmy3BCnogsaBL@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YYjvmy3BCnogsaBL@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR02CA0017.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 984054d3-4f1b-4269-9583-08d9a29dc080
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB311882A08D253033DE59C780B3919@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ve1e4jqMSae5zoHGYnejFSE4QiY4amjamwCCk5ytGxFzmzfRH6jkMPP1NIIJ5IA9JaRIhV5uq9VdB1ExLdlCoPYX4j8DeTPti5bCEuzEk7VXePpcU6MK7SkjxLz70wyiU5Mc8Jer1VpK9kjubiBIX5Jz9nZVeWlfC/SIxk6r1V6CErZbUl5FfZgV4exR6jsLJMbZ1BaHFSZuwCdwpnckletyLQ3sK7jK9CaTU6KKLAzq8L5qmZPbUx3A4yPL4V8wE5HDzWQcJBPOiFy4fjrDe7gOg8Dm7fDK+3mqgQnYHBBTQXZGG1pJx9X7O3VmhijHQBBMvTNA+jko1KoZS9oFScIlBeSqpBeC7Xl8K7Oriw1ci7dopzaVkYINP2u0xDj5WPKu+piLiohpzRmjW7Ep0VcEjjJLSMBcDzr7ht3pDvTwINf9tDnR5DSqzbqi59RHZG4tZtRbu7gGFwiiARnghfqv6JFn9RwB5kyjXrxPTCPX4JVipbkU7Ds11otxFtxoxvNnBNjZwQmRnNiL242RMjvgNferY6p4NCSyeV5y7fW0ygZtCzowVHWxb/B1hUeCk5c6oVRFYqZvYB7Vh+xOufBumw9qmmjqcdPoaK+3gk4UAt9+aR0EjQtB64ywkxyTG7sFVUAhLpHfuDRO8r1+lDLLPWtgSCGt4LLEMvAGVMcCaKyp8427ckendbEzER+RvDyEuq3O/osyQaM4TO0lFOUauJfBry4hKzroKLSPgTZTNLqKCTJDXru85WAgnONQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(508600001)(38100700002)(8936002)(8676002)(36756003)(956004)(54906003)(16576012)(2906002)(31696002)(316002)(26005)(66946007)(83380400001)(2616005)(86362001)(66476007)(53546011)(5660300002)(66556008)(6916009)(31686004)(6486002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zTVTOx1pycEOTmYhha+WTeNSF93brqvggrECP3i2hAM19/eUIJWOk8RdLfxK?=
 =?us-ascii?Q?hgK+J5QurMiCOL4SttYJGYbh63eU8xjWPvPKH1Qr8Aqtxjg3Rs7H/T0zdrnp?=
 =?us-ascii?Q?H0gHxp/t7/BCUO9pjqENdYePIi+yCRzL4yRBnUm77XWDzLvt7+gkyvAcye7E?=
 =?us-ascii?Q?PpREG5IN+OtP5kT63DzM6zeXCafccOQyLa+udp79ovnx2HTNnJh2eCMOE3IS?=
 =?us-ascii?Q?t518KVYmMrvw7rqHVkcLDndv7aWOu/yh8jlzTLIHxLx7txL89A2LpcKD368D?=
 =?us-ascii?Q?FrqjImMK0FBpcel4OyuWHo5ZpX6206h204vxw3DrJ+sWzP7513O3+I71ssyC?=
 =?us-ascii?Q?ePZ+1zYQVtRAH9wyWtU45A5AA7hPzOgh12HlVYK2ctwOpkV8Sy1in3HBCMfV?=
 =?us-ascii?Q?AWESoHQdjSm/cSEh6fZpGY9NVLNmW/KTmu1NUeWXOevmjN9OO7JhkLytK9/d?=
 =?us-ascii?Q?VHgOe+uBV08OMAg0rpwVhWzxKFOKeZ4C0A6su5FKQRFKGHQRWrE3OFP0Cqlj?=
 =?us-ascii?Q?bdlIkJugfAhowG/M2065PKlq+7Yc3OjUuMZttX3PqlEOZ5zxY9iBqrT4qvLg?=
 =?us-ascii?Q?24tHAVoldpZANXD/cLeCBCLnse4mq7YqEj+SNeb3JFX79ajykZ7GiPNCjFqg?=
 =?us-ascii?Q?H9S7RuEuSGJcoTV2dFkGbx+vbfmU4fPb/VzSIY95S7RJ97++oS/DQfWaEMjK?=
 =?us-ascii?Q?HXxORBRo2k7wFJPIP4Qn4EwzuRoLt4fgC+4RKWlPcl17Cx6ZgKlOPfR8ZGTI?=
 =?us-ascii?Q?PYB5RaXFKUpnMIEdvlczg+ftBtnrl0Vb4bdNme78tarjhg7/n2aZz0D0dE3B?=
 =?us-ascii?Q?WWhMaqW89etay5C+iPA6m7+PxrggsKQ/OJFoqdIrDZUiWE5kOuEjG+VioIFp?=
 =?us-ascii?Q?PpCP6LIe726EirOjchWxqjwmN3ZagOSYj7/zFvMlYFujqIvA+vh84WfhrOwQ?=
 =?us-ascii?Q?VX9g1mKdUf6ov2J+MSxoc9DIuQLCJajZOt1fl+WPDhj9SBf9+7KeWOUsQQWy?=
 =?us-ascii?Q?k7dA4oezIZP8bqX7LNcECzaN45TMqS8dD7uTg9KBfr+Fxfu4t+V9pkTBvwgH?=
 =?us-ascii?Q?ViXRGJJHNDnPtVuUiVsauE8ZmiVVIC9VuwRTWp7JWE+xy7vrmv74G9dT78eR?=
 =?us-ascii?Q?gMcStIHKxqRQwpRjowyxuKffuVAlufXfv6P05jpn5bzMGP8i8YbfAif9MgxG?=
 =?us-ascii?Q?SsomXxpxSUIDReSPA4XASjoKVMx0uqz3g5wVL0RtKSopv1dw2CpMT1aONOeB?=
 =?us-ascii?Q?iAIR0Nkn5RYbhHhDY/dqYEHYt2LRmDsWzgnTqgp1M5+y9OUYibYqjSzyCRfd?=
 =?us-ascii?Q?Zc1cxBYxWGX6fyEfbivsmIg0yfDCkLL/nwoYtZInYZr30qoDE0G+QBHTfMtF?=
 =?us-ascii?Q?hcgQaWJDd9CJopywSjwu6oApNyh7My9B8uoGKAbCuctud/QKx4f1Vj1j7T8Y?=
 =?us-ascii?Q?2GFR36ITjtIeH4uVMwKXMpdLAr4Gl0EqANvLMgZk5oaK7MzTafjUz6n9S7Ug?=
 =?us-ascii?Q?fQDix99PtVKK2Kge8hQIZ5rChD9Hm3PzkeHvqn9vDGKtammjY9O07Q801ALT?=
 =?us-ascii?Q?xQyPO8xo3vT3+HnLU7lQNUP0AKQRV5YvHjg1jwS1i5DbF0l8mDiRMBzHF4uM?=
 =?us-ascii?Q?UF0E/AQS2Lj29a+ayB7MOk0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984054d3-4f1b-4269-9583-08d9a29dc080
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 09:54:27.4552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssyWcrqQnqAph3KC2wKbXhrUh07LET3Wxq8HxIWWoXvYFGk+nPoq4jRB0K14lV+FT3d47c1yMUk8IC8IhJpLRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

On 08.11.2021 10:36, Roger Pau Monn=C3=A9 wrote:
> On Mon, Nov 08, 2021 at 08:40:59AM +0100, Jan Beulich wrote:
>> On 05.11.2021 16:38, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Nov 05, 2021 at 01:32:18PM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -1699,6 +1699,13 @@ void __init noreturn __start_xen(unsigne
>>>> =20
>>>>      dmi_scan_machine();
>>>> =20
>>>> +    /*
>>>> +     * IOMMU-related ACPI table parsing has to happen before APIC pro=
bing, for
>>>> +     * check_x2apic_preenabled() to be able to observe respective fin=
dings, in
>>>> +     * particular iommu_intremap having got turned off.
>>>> +     */
>>>> +    acpi_iommu_init();
>>>
>>> If we pull this out I think we should add a check for acpi_disabled
>>> and if set turn off iommu_intremap and iommu_enable?
>>
>> Hmm, I should have added a note regarding this. If we want to exactly
>> retain prior behavior, acpi_ht would also need checking. Yet that has
>> gone wrong long ago: We parse way too many tables when acpi_disabled
>> && acpi_ht, and hence while correct wrt to prior behavior I'd consider
>> it wrong to (re)add a "!acpi_ht" check.
>>
>> As a result I'm of the opinion that checking acpi_disabled here also
>> isn't necessarily appropriate, and instead IOMMU disabling would
>> better be solely under the control of "iommu=3D".
>=20
> I haven't looked very deeply, but will the acpi helpers work correctly
> in that case? As acpi_boot_table_init will be short-circuited if
>  `acpi_disabled && !acpi_ht`.

Oh, that's a good point you make.

Jan


