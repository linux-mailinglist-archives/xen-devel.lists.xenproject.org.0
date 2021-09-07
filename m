Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C672402819
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 13:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180882.327748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZhi-0001If-Fd; Tue, 07 Sep 2021 11:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180882.327748; Tue, 07 Sep 2021 11:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZhi-0001Fq-Bf; Tue, 07 Sep 2021 11:55:54 +0000
Received: by outflank-mailman (input) for mailman id 180882;
 Tue, 07 Sep 2021 11:55:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNZhh-0001Fe-2m
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 11:55:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a85566e-690e-437c-8ed7-ea38d3ad4bf0;
 Tue, 07 Sep 2021 11:55:52 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-Q2S6YrQtPACFdjbFEOxWlQ-2; Tue, 07 Sep 2021 13:55:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 11:55:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 11:55:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 11:55:47 +0000
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
X-Inumbo-ID: 5a85566e-690e-437c-8ed7-ea38d3ad4bf0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631015751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=02K8jo5kY9f/H13Wdg3xSQKXDLNPqJIa9jSlnKCW1tU=;
	b=NYv0fS5he8IRkXNPWvA6fjvumZMr/MMmMZvGybOOHntDisUJgixvhBveDw/6KdfXpwGjtq
	2KnM+aSdsYcA2T9/+zvBXwq54U2ps5/g4P7iXMEnGY6qigmDHAE7c3iaLxS7LUQbPdCdBL
	CbyRKdPQfebLTOXIavtrBHfh9S58PB0=
X-MC-Unique: Q2S6YrQtPACFdjbFEOxWlQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNtz/WSoQrRC2vFAqRm/r0p0w0pmeSD8daRRk8vzoeWxNrv7J7tsSCT2H5AtPrqJQMjyJltfYhSZap01pBZQg1WglzcgJofInP2LnWCGtOCbZT9co6YQQSCLzgHwZdBGhnnDWloBxm0U/70rb7oo+wkbs2BLG3qKUhHv272T4xrbAACMancs4SZR04xM6Mw7scLwdn5h+dRcmEs0QBBfLAwHJZPeVH+HxrFSV3Lg1GhOZfE1x5if3WDzyv08WYDiUfPwC1ZgBN5Nt/4KkKLiSAp9SzC6YvpGWBOz9HbCVqxzVusY6gu2PLT3PjL/BmpvfpqVQDVjsLSMt60ZyiiF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=El/+PteE+bpQXJfC9/uVNmt0qBNzA8BbA4wrelc4lus=;
 b=ZTLQm2R56q9GPneKd1KXybi6fdmqRkxgmTxi3UJzLhRXBVJQxKj/wdF55BuNUfs/qKomxV6iRspV4ulSLh9hD0yUgI3IzQ91k6Eq5Ug4iWua26UP0CmFiJ7+V+hH5Sdu8/BkeYI0HrRe0U4LPwKsRz4HQBwWnxQ9J6Uy2kc/1K+OfZueC+I1xZaakpnT4mFM5YRDmgrdthJIbxktvLv2opkk+KD3uEkmQaIrr/y7h6utFoKzlLgMK/molJ2TNkrdp4LZZBJpOO9XIvUTCXak/h4uZuzVhoWZV8oNtFRD5trg0v/k3wfbG0axYKkzEbmADPEXIwfsnzK/HKNSEJKQ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [RFC PATCH] xen/design: Add design for EFI dom0less system start
To: Luca Fancellu <luca.fancellu@arm.com>, Julien Grall <julien@xen.org>
CC: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210907065228.21794-1-luca.fancellu@arm.com>
 <4bab7902-0268-5705-5462-fcd7571d7492@xen.org>
 <7BD59287-75ED-4D4F-B892-F6B04583A986@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bbf8a6fd-0f7a-aadb-a419-3776e90b879d@suse.com>
Date: Tue, 7 Sep 2021 13:55:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <7BD59287-75ED-4D4F-B892-F6B04583A986@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P251CA0008.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c66c567-e819-4fdc-7aae-08d971f66e6e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6176DAA416A1C8D6A7D90C38B3D39@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CdFi/uHpxDnHVJmp3Q1zeAmg8B6MH4G4Dvc99OlQfLqxIF0h3Jvykold5TBHhuVJxMax68yggwe+pxll52BC7/nZ/ZodtmscZYO/N/vWJT+GzN9FnJYlDjB3hDB9HKfDVznwIJ7mapElhU6s07ApKwf6Aow5hDFaSHdbJbqLuazMgKKUBjtwMJWHndIQ2ji798PQJ+fqwVYGjdIIeggt9g7DqX3VvycQOBYRnw+9vm1puPo4ZJiIYyhYCxl8QpULktJu2CY4M1b5o1AJds10kACb7Sw/Os+yFWNv/HVF29wJVuVVYWG+9mQK+AsYTA7c042ejHWSDUOD5/SVT3eQmBLiB1Tq258ROV/y4NO9iaYAvmO7wWVoCe2s7ReaSRlmKyDhjnO9hCUfsrlJgpo8ay/dbtcNDM927ORa4UpDlIJq6DrFWZoy3g92FWeuBVm9xUGfylOznRCY+jcs0FBq9qKPAwkDCpIIQheP7qD+ZFnxFoGr8685TJAtRFvwue4CC+5aO5ZRnDB2xTuwU8jcf/vaiE0L3yTv9pyyPoVRg1T9sV9VvXYYmmPk2yrY9oF7KFaKIPtbjr3HxhDz8L1ZoqpJ2J7M2qQlf3bpPPDWWN5hlOk4cp4S3NaZe02vnNzngTReC4/yDbiOF9ZqM0vmGL+GHmvaycMkTPMKoILQt4A2m3JMxiY8tqOQAVyhl2cbla/Q6xbG3zh4EnY4K6lWO16V3cuHjsRIWjobDxSBGWw7Qz/gFtLDRX5Fr9kCakSO77XoCyGdMfc50ohT03LRig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(39860400002)(136003)(376002)(366004)(38100700002)(6486002)(8936002)(31696002)(4326008)(186003)(31686004)(66946007)(36756003)(956004)(26005)(5660300002)(2906002)(7416002)(316002)(110136005)(53546011)(16576012)(478600001)(54906003)(86362001)(2616005)(8676002)(66556008)(66476007)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SsQ6jAed8bPbD8QH5WQVPr/p5FflCdooBjaFm9LJ7uDaBq//pWNKoGpPCplX?=
 =?us-ascii?Q?2Cw+hQ+Vy7QD8wC/15xbTZyvxIFDwUoHtQzixp0sNZAK8Y0ZZ29c+T9uA6iC?=
 =?us-ascii?Q?BFfnT2YrVOLDjGbjdUzKmMb20i5NCh/mNxYOFAItba1ak1qYXSVM7+Akdvxx?=
 =?us-ascii?Q?SY9d55DOx78Y4y/b2wWzg12I7i0LSf80+Cbqtr9oJvo9OuGpsiSXPK5RSk6b?=
 =?us-ascii?Q?/yJqGy45FyzO2BiVH/MXiq6ZOlzyMuksgfVWKqBaIw4Fwv1Yj7hZqo/O/wt8?=
 =?us-ascii?Q?vwI7wEf2JKk8Sm48/A4xEFn1R0WAFr0kzyH9GA4mvDaAKuGzLEUkP6yu/Su/?=
 =?us-ascii?Q?f5M55aQz9cwGTwl6ce/GGIqQNO8OpU6f+qYMjJBis4yhrTqG+NdUWJnApLVt?=
 =?us-ascii?Q?nSL2Bp88dKigcK/KXY1kzvH3vx99g0bSeCMnJfxhDs1Ose+7YOA/ZCCOzrfh?=
 =?us-ascii?Q?eHcIOAX+V13pf8SY5GTFfsuRqVqF47/cZbiM1d9pc7Wigbr/Mz5QmiZFicxN?=
 =?us-ascii?Q?UOchiaPGi1aEhY16eDDEZW+PatXrvlOPWQC6ue/PDqTXMH8MUD7ZQu4vrmT/?=
 =?us-ascii?Q?Tw7b62VDg6G5lIdy/D0mgNcS8nkRTRRMkTNiH7kX8IZzbpf9Lo6inr/cghk5?=
 =?us-ascii?Q?9pPtfZGUPojaY7gs1CFykyucpNlhYizbKLsUh6lVs9TyMJus/40EizPwVp+Q?=
 =?us-ascii?Q?xBfGswDdPpCEZEQ5mMRg/JEpABayhc9qG95mVpmS80wG8Y6zgn3MDXwlwboF?=
 =?us-ascii?Q?bXuAhjuiD/gyrnrB6VZfFo9MXWV1PyJbmUn3jPY4BBA963ZwYPn1R7uNyezZ?=
 =?us-ascii?Q?ZNIEUR23d7iQRkSx/Q2+y3kqDPeXsFVYnHh/5FapumCCPeUIGUsUEkfYUmdQ?=
 =?us-ascii?Q?nF4ixnK1sSfyprDK/DK8yZslFMTS8RiqhEhEMr7lG2lK0qdOl5INrXykLZ5c?=
 =?us-ascii?Q?8aDfuWdD7L6gkIERLhboFirDjBcNhM8wFr2hyuxmxItdROT+Q9ahnZXwkrfA?=
 =?us-ascii?Q?3HcszgszQKReSTH8580A8g+BXwv0wsH0N0fFagAwBPI7fX+3b5Yu2mYRAPtj?=
 =?us-ascii?Q?iLRquNTCaVczU6gzcvGKlw1zMNoC8IEKCQHGgMYFjDP32UBKADfDrb2FNObg?=
 =?us-ascii?Q?t623vCadsyjUd5cZhLEKTr5FuVaMPgAkOBu7ZB+OMOSvVENMppsLCXeshDBU?=
 =?us-ascii?Q?5SEsWvaBkaA/Lab6L9qAYTAYewIVCL/TvRDmjxzT3RIq3pTQXdbgrSqcKu4u?=
 =?us-ascii?Q?dP8HG7M6PiZua7pGu6qqYozJRsvjNnO5VFikMHNJ+JfNz2I78XSOw0Vf+tPk?=
 =?us-ascii?Q?xZUnbp9IxMuvqHBmsLsr6PiW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c66c567-e819-4fdc-7aae-08d971f66e6e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 11:55:48.0282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSXzZXGr57trJ+4EkwnboSNC0e2kIkQyV3VcdtdTsGZ4QWjMaSP9c1/qM5i2RGWzjZSqhuy/ckxVYgvHpk5dKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 07.09.2021 13:51, Luca Fancellu wrote:
>> On 7 Sep 2021, at 10:35, Julien Grall <julien@xen.org> wrote:
>> On 07/09/2021 07:52, Luca Fancellu wrote:
>>> --- /dev/null
>>> +++ b/docs/designs/efi-arm-dom0less.md
>>> @@ -0,0 +1,105 @@
>>> +# Xen EFI configuration file
>>> +
>>> +The current configuration file used by Xen when it is started as an EF=
I
>>> +application is considering only the dom0 guest and doesn't have any
>>> +property to describe and load in memory domU guests.
>>
>> From my understanding, the problem is less about properties (we already =
have them in the Device-Tree) but more about where are the binaries located=
 in memory as we don't know in advance.
>=20
> I think I used the wrong word there, I meant =E2=80=9Ckeyword=E2=80=9D in=
stead of =E2=80=9Cproperty=E2=80=9D because I was referring about the
> lack of keywords to describe a domu guest in the Xen EFI configuration fi=
le.
>=20
> I agree with you that on systems with static allocation, the kernel and r=
amdisk binaries must be at certain locations
> that are out of control when we use the EFI boot services, the thing we c=
an do is provide a keyword to specify the
> addresses and then use the CopyMem() function to relocate the kernel/ramd=
isk in the address we want.
>=20
>>
>> So I would like to propose something that build on top of the Device-Tre=
e work we did. Note this is early thoughts.
>>
>> The problematic nodes in the DT are:
>>
>>        module@0x4a000000 {
>>            compatible =3D "multiboot,kernel", "multiboot,module";
>>            reg =3D <0x0 0x4a000000 0xffffff>;
>>            bootargs =3D "console=3DttyAMA0 init=3D/bin/sh";
>>        };
>>
>>        module@0x4b000000 {
>>            compatible =3D "multiboot,ramdisk", "multiboot,module";
>>            reg =3D <0x0 0x4b000000 0xffffff>;
>>        };
>>
>> In particular the property "reg" cannot be known in advance because the =
UEFI stub will be responsible to load the binaries in memory.
>=20
> Yes that=E2=80=99s true, the UEFI stub is using from the UEFI boot servic=
e the AllocatePages function that is giving back an address out of our cont=
rol,
> then using another function the binary is read from the disk and copied a=
t that address, finally the UEFI stub is writing the node in the device tre=
e that
> will be used by Xen later.

If you know the intended address is available, AllocatePages() can very wel=
l
be given a pre-determined address via the AllocateAddress allocation type.

Jan


