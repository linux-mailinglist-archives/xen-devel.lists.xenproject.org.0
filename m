Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA1426C9D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 16:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204755.359920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYqeE-0002yQ-KM; Fri, 08 Oct 2021 14:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204755.359920; Fri, 08 Oct 2021 14:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYqeE-0002vd-G4; Fri, 08 Oct 2021 14:14:54 +0000
Received: by outflank-mailman (input) for mailman id 204755;
 Fri, 08 Oct 2021 14:14:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aYfl=O4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYqeC-0002vX-Rz
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 14:14:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b84eefe-8420-4641-9eea-92f06ea89abf;
 Fri, 08 Oct 2021 14:14:51 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-19Achb4rP0-6blozhCCc3Q-1; Fri, 08 Oct 2021 16:14:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Fri, 8 Oct
 2021 14:14:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 14:14:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0071.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.21 via Frontend Transport; Fri, 8 Oct 2021 14:14:44 +0000
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
X-Inumbo-ID: 6b84eefe-8420-4641-9eea-92f06ea89abf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633702490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMEqGFS5y5vLOLSi0f8sG/F5xvIv5BI8oOWW4fXAJMc=;
	b=P7Zcba1ByuHT2+Y8mvQJiZutvTW39fUjkGHmJzcsRxsQz517BL81C8VjU3wZrgtWbCt2jg
	qFgEyK4zhcW63EOseqrgxVm7xS/ndMGpKng/5bUw4Kf3eF6vSAAXCzz9Ob+IRrCG212rTl
	mF3JLb2vRDghhDaWJ5tKLKSCQwPFeEM=
X-MC-Unique: 19Achb4rP0-6blozhCCc3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUYQN6gTACL1wpowQg9tnuPeMCkMMTpJOJP3wZ7SDFcUb6yZgshCR+neA7do7rllP1X1+vmpyLUZaeSCeRcEV1G4rYhMQZLmoJvxU8XRsn84xMHSsydLE6+NYxOxqDcA987jxmJxwOfSWlqH5ndgvkQZvYQC/5aOo/BZzB6F8nvuvnhiE+V5ri95tWL4V1/x3kKcZXli6yO9vegN4eM4Pi3zRJ76Ix+MpG+iCutUAFhgYAAn4lN1KJ2jYBXTUs04KYCXQNQcRQ9TwNdchUQm1JdhmlDj1VwFsy+URHEE/zkw6P+PHuyQSyMfIKp0jfNS/Sw5lEr5cu7001YGbwyjJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXv1ERi9cd99hYeUcIgKcsjZuWenVVS8l730ZkjOxsQ=;
 b=GZkIEnlZoyKv+1VAm1/LMgl01K3SKtL1sKOTVc2kcXgnBHTkqSABf9RnOgBU5v/mozGD59Su4g0OrUHBr9isHpyyJbwzOpDGALAidiWWLegYw1YCgnSVmGqhwxoOR+rTWoFDy/laq8nRPhD96A8zDm6XTy9O4TCe6lGGqUoLtDjhPMynyJwawBCsmmhqsICcrko9wyZMPQu+1Mb7O+jFGfzh9zCpF0oCWdYfRhwlvL9fIXfZ45mrCCHrOZev4yxk0ouYGVdWVvKPBj9fU5NqX2h6CH1UzhK/bzfGPYubFKPk+YnIdc+Erfy7bNEr7ssM8eHjdf5c/w2JGzRWJGbsxQ==
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
 <00328991-2c85-fed8-40d6-c33ecac7e1e8@suse.com>
 <EA18C41E-43FD-4C21-B11B-E776DC260974@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bbeb5e61-665c-0c3d-cab0-a79b04af80bc@suse.com>
Date: Fri, 8 Oct 2021 16:14:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <EA18C41E-43FD-4C21-B11B-E776DC260974@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0071.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a65a845b-a289-4045-9325-08d98a65fa78
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23368AC8A9DAA2D3FBF17627B3B29@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dP4hzswDVlqF9Sq5B+/CWBWmKH8ulV/Jyk+7Hg+zMiuP9JwqcLfMSC8PURg7GkDjC/gTImZ3MdXYFi1LXq98dgE7qETBELefQqu3hElINhUH7Fb3FH7vbDsM0CpNjK8nkMA1kvLPbhIui3AKllyYcFp6L/Ip6Dj6ohAaU9Pw1FtWDbP4ugdtV8EmgV/LPVszEtY8VEJFPCUXQD7j/xcwEiaBDLXCUXszjrdgLbxzF0vpnqrbtfhaeGPabcRp6+qIKqGYzNPZQgOtjxTu70OrgbfhyX2GTcFKgoOvRtrN0R0ZDMCLpCq6gOkBuusaLw2ZE0IiH0FbKY3YMqMMXVjwsqklovIHSsn00OnJUR+O2Lz0QW0NKexyI5Pfbl321YCYmHYmhV15N7GJmLJYLKoKliO4LfXSG7/sMRz5ZIyp9tvrMHXVb6ubyWgftPK8nDOgMSITH9AsFw4KHOF3QlQ6qKhTNIJl8WO9QIVSEI+XHcMZWVpsR1wUc6AAF/sdtDz5us6S+E0VZOWmpMpY6ILXe7Vr6YHL3VW2j8rLjzmUN18GX0c7dyxcD3kucTzY5t0uEnCBEsXgIXSM02udmYWzbMA/YOuuQKIk9YZIzTK5qyZuYyag6mo70y9mNNCULH4DpczEsoVkxzQMf/dTIMZUk6rKaUqxIymH1KlVq4YQmir8svkZxXqVf/XF959hp354zX31zxh4g2a/w2IW1Pd7mtuocT0hue7DEduBrPC72158mMFSkr1ZKtVacHcqBWHOlN8FiFmtIn3bxGGBnFrCww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(2616005)(66556008)(86362001)(36756003)(31686004)(26005)(6916009)(16576012)(956004)(54906003)(186003)(8936002)(4326008)(6486002)(316002)(38100700002)(83380400001)(66476007)(7416002)(5660300002)(66946007)(53546011)(508600001)(31696002)(8676002)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oofi9wTOfm5CsKA+HAYiQpkzWCuOHPDbkwJYQ11wPcY3PSlYcPM1OMKhD6oV?=
 =?us-ascii?Q?dtPW6B+ZOF4NRSZHfae6k/NO+NxvCopzcbHugmtwawALLTPOHt+wN3baEXNI?=
 =?us-ascii?Q?ugGIOKpVx6Nnq+VWpIvGKFlEPc1cISYWUnSid8Ijm6v794sAa21X6kODn6KV?=
 =?us-ascii?Q?6O9iwGK4D1KnPAP+C/f01Udpt9I1UAxoOZ0mEFDTdKMzY7T2GglXbLAM5lKZ?=
 =?us-ascii?Q?oOn6r4tPo8eUj2TGt9sExARNMk6mgSYt2cfXZrJcaBYHkiuSEQsxIMLvNQgo?=
 =?us-ascii?Q?cIpYFI54eV6OZAcFPHX/bT7Sh2kgujTw/DPoMm1MIeUqYthI2lfIbKxft0E/?=
 =?us-ascii?Q?GJWtCfJ1Fq0sdHAhSZkhjAZQ8AHxpZB6BCSXs6E6OkQuFxmmPlA3YUldqhju?=
 =?us-ascii?Q?iVdj57VLRwEavkBsxLv9aZBvMgRoWo7GpClzCvgNLoe5vCw/CfZMt7HHirit?=
 =?us-ascii?Q?gY2RnXKJrnNzlyESS8exx6drUnal3/NfFkZiuWobtd64bYusIbenSA7SftME?=
 =?us-ascii?Q?OtkN2W1P2NfJITAMvLuVZZfwP/+8X2/yvroeIMjG6KrrloQUL7/jmcYAfX8U?=
 =?us-ascii?Q?RmD4JPDO750qxO50NM4wzf5wJEHotLkW88iKGOYmMVsU42fsCcMZfZdRnt7t?=
 =?us-ascii?Q?qX5vcwQSczbJQfP2nKMbfdsklf0xIOk02D+4L2YvUfc9ZANyk4BWotMnMbmq?=
 =?us-ascii?Q?IvrC9NWXzHPtHoJDtnHqYzd9smi13+XaO/LEz8klCOIIxInwl3863fG7Lus5?=
 =?us-ascii?Q?SNS0uouhNmhXYzto6nlpFsJXLjsQvYpHwY3jWyDnvRYrNHLnn7y0Z5+O8XI3?=
 =?us-ascii?Q?Bl0bwpEguHp+wVZGb1Nn4+I/1nDRbhLAJI48J+g28K9+/99m3G0UNMrSSL6f?=
 =?us-ascii?Q?MU/HL/+MPopCnI7ans7KhI4PuGCEwowa0PnC4zQvLwhkjWDXQ1odPn8jl/TY?=
 =?us-ascii?Q?JpmDYZffIXIw0vEyvYMSNjeSKHy1kQJVQuXztZ/fV0sBSyqGLLHwTN4gpAQ9?=
 =?us-ascii?Q?dnPmJkTbCY5RX1HlTP6fqxEM0kucjrcL3zPAVyI4Vss5wscDE0j+YBs20T9q?=
 =?us-ascii?Q?c85P/slKeWZK82r7ms7IkaibV2C20dTw05eZ2+V5OdlHxNBexyBG1CEF74CU?=
 =?us-ascii?Q?DXtOKsKiKJFv9QRf5afWDXIZm5uurc9TGGG2SzqUvJV2+2PK/rSJn/Yu2rjr?=
 =?us-ascii?Q?wko688eSSI7SjqS9vkp2mBNUnO6bZ981nLg5AA3kBI/jOqaXGb4VQDzz8PxV?=
 =?us-ascii?Q?VUu79BPoxCq55H8JSmluuM9FOOScGeuw4Z5ttP6rgY7GU1VGCr5bX4AmtVam?=
 =?us-ascii?Q?UKTBhwaqNe1GehSL9nY86Gkh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65a845b-a289-4045-9325-08d98a65fa78
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 14:14:44.9521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tz5XuOtbDc5I3WHfzUEl8WS4OnjKcToMQgbza2IHJjuujl4IAcZmnHFf4++NhiLDyhZdnhlfodeFeYZ/sC0ZHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 08.10.2021 15:38, Luca Fancellu wrote:
>> On 7 Oct 2021, at 08:15, Jan Beulich <jbeulich@suse.com> wrote:
>> On 01.10.2021 17:13, Luca Fancellu wrote:
>>>> On 1 Oct 2021, at 15:22, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 01.10.2021 15:55, Luca Fancellu wrote:
>>>>>> On 1 Oct 2021, at 12:02, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 30.09.2021 16:28, Luca Fancellu wrote:
>>>>>>> @@ -1361,12 +1361,30 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTE=
M_TABLE *SystemTable)
>>>>>>>       efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>>>>>>>       cfg.addr =3D 0;
>>>>>>>
>>>>>>> -        dir_handle->Close(dir_handle);
>>>>>>> -
>>>>>>>       if ( gop && !base_video )
>>>>>>>           gop_mode =3D efi_find_gop_mode(gop, cols, rows, depth);
>>>>>>>   }
>>>>>>>
>>>>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>>>>> +    /* Get the number of boot modules specified on the DT or an er=
ror (<0) */
>>>>>>> +    dt_modules_found =3D efi_arch_check_dt_boot(dir_handle);
>>>>>>> +#endif
>>>>>>
>>>>>> So I had asked to add a stub enclosed in such an #ifdef, to avoid th=
e
>>>>>> #ifdef here. I may be willing to let you keep things as you have the=
m
>>>>>> now, but I'd like to understand why you've picked that different
>>>>>> approach despite the prior discussion.
>>>>>
>>>>> There must be a misunderstanding, your message in the v3 was:
>>>>>
>>>>> "Every time I see this addition I'm getting puzzled. As a result I'm
>>>>> afraid I now need to finally ask you to do something about this (and
>>>>> I'm sorry for doing so only now). There would better be no notion of
>>>>> DT in x86 code, and there would better also not be a need for
>>>>> architectures not supporting DT to each supply such a stub. Instead
>>>>> I think you want to put this stub in xen/common/efi/boot.c, inside a
>>>>> suitable #ifdef.=E2=80=9D
>>>>>
>>>>> So I thought you wanted me to remove the stub in x86 (since it doesn=
=E2=80=99t support DT)
>>>>> and put this call under #ifdef so it won=E2=80=99t be compiled for ar=
ch not supporting DT.
>>>>
>>>> So FTAOD I'll repeat the crucial part: "I think you want to put this
>>>> stub in xen/common/efi/boot.c". There was nothing about removing the
>>>> stub altogether.
>>>
>>> Oh ok, now I see, so in your opinion this is a better idea:
>>>
>>> #ifndef CONFIG_HAS_DEVICE_TREE
>>> static inline int __init efi_arch_check_dt_boot(EFI_FILE_HANDLE dir_han=
dle)
>>> {
>>>    return 0;
>>> }
>>> #endif
>>>
>>> But I would like to understand the advantage respect of my approach, co=
uld you
>>> explain me?
>>
>> Well, to a degree it's a matter of taste. Your approach may lead to a lo=
ng
>> series of various #ifdef sections in a single function, harming readabil=
ity.
>> Having stubs instead (usually placed in headers, albeit not in this case=
)
>> allows the main bodies of code to remain more tidy.
>=20
> Yes right, in this case I did in another way because declaring the stub i=
n the .c file
> was (in my opinion) not the right thing to do, since also the name (efi_a=
rch_*) recalls
> something arch oriented and so not to be put in the common code.

Feel free to drop "arch" from the hook name.

> In this way any future architecture supporting DT, can just provide the f=
unction (or a=20
> stub) and we don=E2=80=99t have stubs in architectures that won=E2=80=99t=
 ever support DT.
>=20
> In your opinion that solution could be acceptable?

Yes, but not preferable.

Jan


