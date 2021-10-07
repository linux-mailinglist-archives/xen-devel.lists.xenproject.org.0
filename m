Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24578424DF7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 09:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203305.358402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYNcf-0004ic-Fl; Thu, 07 Oct 2021 07:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203305.358402; Thu, 07 Oct 2021 07:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYNcf-0004gJ-Cm; Thu, 07 Oct 2021 07:15:21 +0000
Received: by outflank-mailman (input) for mailman id 203305;
 Thu, 07 Oct 2021 07:15:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYNce-0004gD-C8
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 07:15:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76efffc4-66be-4313-865a-752a5b960aea;
 Thu, 07 Oct 2021 07:15:19 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-UsbZH10rP7Kf4fG1wvppcQ-1; Thu, 07 Oct 2021 09:15:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3391.eurprd04.prod.outlook.com (2603:10a6:803:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 07:15:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 07:15:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Thu, 7 Oct 2021 07:15:14 +0000
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
X-Inumbo-ID: 76efffc4-66be-4313-865a-752a5b960aea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633590918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NQlA0YVJ/yC7+c0exeig21OlNsmuWay0KQELO8S3tLQ=;
	b=EkPKvgTjaa5/HAKXxdDmJ/PisX28yX6JZtA4w4OCjpTMqSGUfD4Lr59bbmJEXsBHfTX1nK
	dBG3hZsjpRf3FE/HhFiEYMHT6oIHNeUoSBD/BddqhyYXAX21mu/WJsDo4Sp8aiv2ImnV52
	yFOFTzqEsl35SZt5DJ2VyKn5qVWckUY=
X-MC-Unique: UsbZH10rP7Kf4fG1wvppcQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiW3rrFxcdv4Qe15sAzPApjeOd0MSQoA3KwUY+/CyAEW/BhzL0593l4Qb7+MGyJFds6z0Cwtzb3kbtJHtf6ALfBVhcS13zYxAq0RXBfE1Ozi+XwzlxQ0Vm+plMAKVsStJWmdliHa6JV2VB05cgzHXwQZ6NYo6IIaP8X1h+cX0xP/x6SoJwmXG9AdTRx22NWzMmc0iC4SmK7gB0eEsOF2D9LNS5ZbiWqOEcpddjhzbDo7lvlwVRzXUSXVr8uYxTxHbud7P5wf+G8Ppa5Xnoj6byieSUBHx10jowQfFOPCSsyME1Uqs/pzrMWCq2r8Y1r3rfF1xrbwx79IVdSSsXQDig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Jf4CdjZAvVVn44BTSBs4eFZdi/nAtCGtwAbF5bgeUQ=;
 b=nlw81IOl99V+JFqY1XJzKDIEkRHySt3sqz0S7BhMId8q7ZBJRPso7xMzsGA7aKA+FThOVhB/S8gJQfD++5NUiJoONPzdxiZRk/HEaS7YF9mTNz1gjtZrn7AVxA1zeYdPq1j28WSRx9wuIflxWg1NniNKyCwEFEX9+r36M8wDftDVewrOM/Dq3EOiL7lxFEfzypr97BaKc7J1HDstBOK5wpavLHB12PbL/bb4b+rw1aJYSWsLrQvdPDdkBqtSvW+ES0J5zh5JzJDnNhq4o4VVnyHpSA5aeewga8woSEMNirZK1zXRbMGbSUpn269mSaKyFsEEbGf3b2JdoQr5fQK2EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 2/3] arm/efi: Use dom0less configuration when using EFI
 boot
To: Luca Fancellu <luca.fancellu@arm.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210930142846.13348-1-luca.fancellu@arm.com>
 <20210930142846.13348-3-luca.fancellu@arm.com>
 <2fa4be34-9c69-21cb-632f-f566caf622ca@suse.com>
 <6DFF05BA-8250-4C6C-86DF-67997F8DAD46@arm.com>
 <ce8e7fda-4d74-4bce-78bd-387f9b7a395f@suse.com>
 <55D6C05A-C0B4-4503-A7F8-D0BA11E0779B@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00328991-2c85-fed8-40d6-c33ecac7e1e8@suse.com>
Date: Thu, 7 Oct 2021 09:15:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <55D6C05A-C0B4-4503-A7F8-D0BA11E0779B@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5ea18d4-cf74-4021-f434-08d9896235c0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3391:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33912CB8C65ABC511FF2AB45B3B19@VI1PR0402MB3391.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d/DuqHrz4bJ14q6IZ9NA/qLWFIOGrC+EUhxrLytw0j3vaJ7fsYQDCNw8P5xvVW5TJ2FS5tinnQbXXAysOnSTG/CVKuWsFNTeJQ1XB93lDKsJL30ZQEkcJIjqG0zG/fNUZs6raxklnk8Ftsti/XKZCDS8CLX0F/SAmcPR59hl9za9h0AeF+fZREOzkCpYFzjbvDNamJUsDqnIjMjSXo/un4SQeyw4q4izB7drUccO3l7S8rrxO+So5QP5DoiXs62LNzqhN9JahbSOiPywEVG476NoAVtUP+ZhpIeTAFajKdJIU644fV8TN25ikChXTcT284NNlluCu017n5REvVKIldeNvkm+l1KdWKE8pCcLxQnIfl+ZsPnFTUn2k+zVSJkin7w9Dk8qiHIFeWUXrguhUmnPkxd5i8HFl8U/+zUY0is+2/BWIuSdIbDMNs2owP4Lce26Zh3Q/uX80QqlfiBLBrtJLR4Fe4fJY0j2JKjbjFfXHBwM5DfIJ03pKXCitnnP062qVA2hY8viN8YFq/Wmo43LD/bUX6M7cq/jgHsOrHkcTxqdEU338X9G97o71nKLXGeo4k21xP7gvm31Uh3mrkw41OkWcXU1cxMR6+PoHgJsjpIj3AfvoTJTXaWV0SnMaZlJg6H4QNCSayT7RoQzLT5O/kki7AzI0UJYE0V+TNhevFNaKCR0HyXLP4Xzecr8RlNSpKTvmEtHXYL7IA0vbVzydifUoOD55LbBzxgm0i05AG8yDcvL1pxSe0PepbuEA2oogQzGwK6gWBxozAX5ng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(4326008)(8676002)(54906003)(31686004)(8936002)(38100700002)(6486002)(5660300002)(956004)(2616005)(6916009)(16576012)(66476007)(53546011)(83380400001)(66556008)(316002)(36756003)(31696002)(2906002)(7416002)(86362001)(186003)(508600001)(66946007)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YWtketlaTTT/QRZEw+Ii/+G+V2+QouqQ8DIvVOpJZ1XndjfORiZUD3reE2UM?=
 =?us-ascii?Q?NFnscEvYGKhGTMmJlMidZ7Xz5Wmc0tB4mOkuOoJmC9SfI13xCLdlAcSNlqNM?=
 =?us-ascii?Q?Bcm4Mi3ydWmnZewlsqdn2A5WShUdfb6g5epnhUyE+ZdPU/1DrGDywSi4Umx5?=
 =?us-ascii?Q?b6SyeiGSPocfuPCFUOA/v00H/4Ko1lL9OBy92mkZHoMjw0Elg8PyFaBQIxLk?=
 =?us-ascii?Q?VhLH7NOV+2rn2waS/3eFVpaDgSMEPp+SFKCjt5SCkdBgnbvlKOBloV+4Wy6d?=
 =?us-ascii?Q?dWOnrt3J1nrBsfqtKB6luvBdZRIwHMsEfYL/xjp1RAoCWxo7gBhQyMMwLIa8?=
 =?us-ascii?Q?z1JLkbYl850n7CMKaG9tCwp4r+wao4oB4O2YBF0tOvEwjwN8WeLz913b9lEm?=
 =?us-ascii?Q?KygLtsqbP+b6LhvOlaQqkX6vkt3U8u0hSn7r8kWa5mBoG87ZBxhShE/7gt55?=
 =?us-ascii?Q?X9mcwbDDH7r+geKt0O22ofIW9QThPzJeiJyMu2PkWft7qyW2inToqVZ1aTkN?=
 =?us-ascii?Q?c02+Ta0q1F17T9c4eHqVFAqFI1bvZCkLdB+XSMArKozsMjojn6lAnqp1mZwz?=
 =?us-ascii?Q?18VWeQkwHCQf3Z7gFSSrfJj4Z26UmS6QhOgcdXbnf3CSq4IjSQCJYWFxYl9o?=
 =?us-ascii?Q?e8YqWUN5Pki4DdI1sB5Rpv3wYQapwsu1QvzVY2+gOtJ7sSSNKb+lI9W7uwbM?=
 =?us-ascii?Q?qYb2y2xERI9rhX/02+MSN9aYwUgXbOCMSHJbkcZ7uRL2HyxcZw8J4VJpRx18?=
 =?us-ascii?Q?2fyIoATGwFR/Z2Bgm8im2F0c8iWh4v0EhxgQP56UxrXjXGDqOPNmLs7O0qB6?=
 =?us-ascii?Q?d5j5GJs+F+A2vl8nRh02XlpJGtZgSFkDNMbDyGw9LTJsoWl/eezhc4CE4tmV?=
 =?us-ascii?Q?iR+EtiOI6OV0X74h1VrtBTTvnIVNuOG1N6A0UA0S8PTBAIj+ZPx7zOXU2k4E?=
 =?us-ascii?Q?yqxm7E+sZPV2havkvz1Qq++8qvO8EOzKNFwECWGuV15cz/jvZ7ITILI4j2Jb?=
 =?us-ascii?Q?OMdypKF97kTCk3f4EDCM/F8jjkeLkAYL3fY5kAz9/4gQvWu2TB+M4olI9MZu?=
 =?us-ascii?Q?Useay6FYkbPN58kD8S7AroGUBae8WjNFa+1RcUMPgwlaiT/iySCSNBnVHLcV?=
 =?us-ascii?Q?c+gYxSIe8bUl2uIKhFVxJ1uULV4pN8uRzMT8zOjNKBEaalReHOOsX2AQIJm+?=
 =?us-ascii?Q?FGeDaXbZYRuYm6Goaw9Id3TxbsHEsXD+WB+c8WRsEOpxtaZSeZCX6GqKphiV?=
 =?us-ascii?Q?ML0MWRzCPRDTWlG/+rhR2a7jObeHhicmlhlRiL91v2ds03+70CZyKRt+h8JW?=
 =?us-ascii?Q?nDjA+Lj0GNVwYJm3FTEnHZ/J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ea18d4-cf74-4021-f434-08d9896235c0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 07:15:15.2473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdHIP790Rzgas7+MLZR3KXWLCYV8tKMhm/dJyhFK05XcLKqqM6pGhQZY8v+lqfpEeLancAufEHGDVcvI9XsXTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3391

On 01.10.2021 17:13, Luca Fancellu wrote:
>=20
>=20
>> On 1 Oct 2021, at 15:22, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 01.10.2021 15:55, Luca Fancellu wrote:
>>>> On 1 Oct 2021, at 12:02, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 30.09.2021 16:28, Luca Fancellu wrote:
>>>>> @@ -1361,12 +1361,30 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_=
TABLE *SystemTable)
>>>>>        efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>>>>>        cfg.addr =3D 0;
>>>>>
>>>>> -        dir_handle->Close(dir_handle);
>>>>> -
>>>>>        if ( gop && !base_video )
>>>>>            gop_mode =3D efi_find_gop_mode(gop, cols, rows, depth);
>>>>>    }
>>>>>
>>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>>> +    /* Get the number of boot modules specified on the DT or an erro=
r (<0) */
>>>>> +    dt_modules_found =3D efi_arch_check_dt_boot(dir_handle);
>>>>> +#endif
>>>>
>>>> So I had asked to add a stub enclosed in such an #ifdef, to avoid the
>>>> #ifdef here. I may be willing to let you keep things as you have them
>>>> now, but I'd like to understand why you've picked that different
>>>> approach despite the prior discussion.
>>>
>>> There must be a misunderstanding, your message in the v3 was:
>>>
>>> "Every time I see this addition I'm getting puzzled. As a result I'm
>>> afraid I now need to finally ask you to do something about this (and
>>> I'm sorry for doing so only now). There would better be no notion of
>>> DT in x86 code, and there would better also not be a need for
>>> architectures not supporting DT to each supply such a stub. Instead
>>> I think you want to put this stub in xen/common/efi/boot.c, inside a
>>> suitable #ifdef.=E2=80=9D
>>>
>>> So I thought you wanted me to remove the stub in x86 (since it doesn=E2=
=80=99t support DT)
>>> and put this call under #ifdef so it won=E2=80=99t be compiled for arch=
 not supporting DT.
>>
>> So FTAOD I'll repeat the crucial part: "I think you want to put this
>> stub in xen/common/efi/boot.c". There was nothing about removing the
>> stub altogether.
>=20
> Oh ok, now I see, so in your opinion this is a better idea:
>=20
> #ifndef CONFIG_HAS_DEVICE_TREE
> static inline int __init efi_arch_check_dt_boot(EFI_FILE_HANDLE dir_handl=
e)
> {
>     return 0;
> }
> #endif
>=20
> But I would like to understand the advantage respect of my approach, coul=
d you
> explain me?

Well, to a degree it's a matter of taste. Your approach may lead to a long
series of various #ifdef sections in a single function, harming readability=
.
Having stubs instead (usually placed in headers, albeit not in this case)
allows the main bodies of code to remain more tidy.

Jan


