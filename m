Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7C34444F7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 16:52:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221048.382557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miIYP-0003zi-89; Wed, 03 Nov 2021 15:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221048.382557; Wed, 03 Nov 2021 15:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miIYP-0003xc-4Y; Wed, 03 Nov 2021 15:51:57 +0000
Received: by outflank-mailman (input) for mailman id 221048;
 Wed, 03 Nov 2021 15:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miIYO-0003xR-CZ
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 15:51:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7ffa577-3cbd-11ec-9787-a32c541c8605;
 Wed, 03 Nov 2021 16:51:55 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-M6qxaZtkM6me_bZ-Ncokuw-1; Wed, 03 Nov 2021 16:51:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 15:51:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 15:51:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0093.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17 via Frontend Transport; Wed, 3 Nov 2021 15:51:50 +0000
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
X-Inumbo-ID: f7ffa577-3cbd-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635954714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5MRNv+cCbzUmabZNV9/s5dxpqnegWYp4UZvGdZrHVTU=;
	b=LUhAgyFH94Z6G0Js+lfzQS9RAoZOLNI0tgGym2wZSgb5tk7oEA51lJh2NCim8L/haiCwaY
	7i7T9gDYMoU46edx11ClYrLfFIJR91T16QXr22+SF3SEbd4eY0OVBtHdboJtwZtO0/Fqcn
	zeGLkOLjbsa6EHPl1OixIa1WJqrF3Ro=
X-MC-Unique: M6qxaZtkM6me_bZ-Ncokuw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlmDrA/ihrBKdIZoZ4jY9bRYxr0YfW+AIXPFQxnegJ0hiGr0fAFC/bGtC+bl4GILIf5eeRedKdM86X7odN7wbkQtr6GDIRKpEkVmFNVLHye+E1HIPU0KPf3XpvgD5z2EVwXkLsDK5Xubn5IMZLxL5+l+s0MGZxXdSjv72+/xoAZ2TMPIifIFvCnekCcWmpp8zsYdbbfd9nr1BKrYkUrk98luktpXYjvWuHusDcjVaQbsRxjC+pliQSlRbiNn020QSXOVqa/t3fvgfCLjTibll7FlhexpD6IP021ox7WdHQW3rizkFfDXrUxGsYzSAOxiI7Aa/hQwV2FZ7C4FNi2evQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tp2ISfa1P3TzZiECREYeCD1RoG6lu8ZqAKaghY6uewM=;
 b=iAr+pZj/yHQVrpwjwJMR0isOzcEx918zQjxI/fDWa4pG79mGuqmb/AYKiLSZo7Fc44cQeEz6DUYMVdIueWrds+hH2zkfGeOsiUn6wYLXCRuCrwkFRJn3gHPBEa1V/0seAggdUg6w1Fg+IKysPkzTY6TX+VxAil3fYK/biyUS3+xGZpSIkt7XTI/llZ0SIrNW0Lkl4d0L/FC0uwjKqJeCvC8mKnXV34ftgmM3f+P1H196ephEpVq/LmNGCFcG8FYD8ul3Qx9Cm2kL0M9XOD9eAafZPRPEx2eE9j1iRUWJDPRPBWY0uPTAvene2s9dUnxJLwg3vUemnXj31vaITxqw2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9729d03e-efae-d862-d685-0308608c3771@suse.com>
Date: Wed, 3 Nov 2021 16:51:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] xen/efi: Fix Grub2 boot on arm64
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>
References: <20211102140511.5542-1-luca.fancellu@arm.com>
 <5290fa91-9470-be1b-47e4-a8de911b4fb3@suse.com>
 <6F65B5FB-A511-4553-AA17-B144C3DB70CA@arm.com>
 <6a8ecb5b-7ea4-7dd8-4acf-587b51862aed@suse.com>
 <845D8368-B9DA-4A5C-8F8D-6AAE55E326A0@arm.com>
 <16c6757d-1bb3-361f-a41f-26b9bc89a2b4@suse.com>
 <83E4F969-892C-4AA2-829D-67C02B4B5885@arm.com>
 <ad621757-afac-f36f-0b3c-7fe1ddb83a66@suse.com>
 <AB5E1F4C-36BC-413B-88DA-487BA573BFCC@arm.com>
 <b3d140fa-019e-a469-be16-47b6e42e124d@suse.com>
 <AB3CD75D-3E18-4802-91E5-7FBBA0734170@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AB3CD75D-3E18-4802-91E5-7FBBA0734170@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0093.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c434169e-d47d-45e1-9fae-08d99ee1d9d0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2702563203C322CFD3E2CC64B38C9@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jkWAXWPM2GGD+ycqhqWRlXx7YS3RqNTwJeWYCAOPFHR/iABHVG4MYjdyWSCITkOifAz6E2II9aesBROzrTms3meMfcXn5SV9luKMujKkvyekOYbbKzPqH1rMgb2sYhCMWZW89ZntP0Skv2YABZ6vPqsfJzxheRM/kG9HsDNuOWQYVOo9ZSWgH0iLfpAW6Qsj8wbi1JEDEz/vhLzmCnuwjjOOtWmTV7bet7oF+bOhbMeMI81iQAA7NeLE3muQurpWSaj8QjrcqeGuJiMOlc1Ai7htoIe+NRWPoj6v+OhUl7iV7tEaSR/5LfuK6nRp0p36m9yPeQcROT/qgLBPlF+INCXVoVfBl6GoZsq5qXGPSdciK7ZMNS+WGODf/f3y82WxY+YrfzJ+unsva6x9i/BbS0R4TEV7WIQGNOAlR+CqhQMG+4zN0L4N1ltuJ8xhPFXOcxC+emJxh/zQAu/phv26HRk38N78HAbBvG3ukb8vBCa/HHuGe5JFnemnZXtc4CAN+chOuMlN0Vj4uEIeXhhPvyoXyHotPig6dYOPFODYLWumDJsKOntjWPCFAUlDc+1CjRflmrcERhrmYndbIpm35akPwDGeHryaS8ee5F/Tnt9EYj7o9qFVEC4nj1jjgvdrZFgAzRxc34s2oBMCfpOqNxIMyEfm/ZrdtusCcWQRGhTAsnozoAweYf+7bd0pkCazyUNoYMJ0sjkMJz6mztuA5XTuxH1B//+QCmT1T1iysKaDcj9/xBhIvEcMMHuqfWvA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(956004)(2616005)(26005)(31686004)(186003)(508600001)(38100700002)(31696002)(36756003)(54906003)(316002)(16576012)(4326008)(6916009)(8676002)(8936002)(53546011)(5660300002)(6486002)(2906002)(66946007)(66556008)(66476007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rdga/YT5ZAFr5hePflfKO9s9wMbnWwGZ/2J6YUwdMf25Y0xck0BoYSlrJMzw?=
 =?us-ascii?Q?KNm/gVpx5aHFqq/Up1l7v48CqNCvZog8t46yTgH/LtricqnwCLLaWN6adz0h?=
 =?us-ascii?Q?AKWt/q5CYRQPmKN/P5DPd6oFWB7r+MNsS1UvHP6WwIwLvog/EvlHTPsd1G2E?=
 =?us-ascii?Q?K4dC1p3PPg8l+6ozu76IM+bZM/TsrgDhQ/4nG2S71TFTLS67BY3sutVjuzty?=
 =?us-ascii?Q?DNzBNP3IFwRprVNHu01ZOSbrR1U3cNVMrQQMtv+XRvMYHWw7vB9PiDpFmQND?=
 =?us-ascii?Q?YlmdcahKQ5+W6JFWSZMOBCTWYuA0oGis/hVERMniDz9Vc4WRGw6YIOKw62dx?=
 =?us-ascii?Q?VxVgw8B6FPQqLVlzcaw2FxsXgpepwASVDQfr3WrjQWwoC1C9E8YP/jcS4msw?=
 =?us-ascii?Q?dTTj6vi6KCk/PfrPgKAKQMDlJY44Rs7O1uMBX2Y13uw5A81umbV/B33N7y9B?=
 =?us-ascii?Q?9rSrcvwCsXQCjyyYRrKtbIFuAjbvvNrj56mixqDgUupNxs/n8UFJi8w2s/bc?=
 =?us-ascii?Q?WIYzEXo4v/BqnCDSbFwg7mUBwU2V0S38g/YokWAo9pOJAC0TvLiE4XoCCX5I?=
 =?us-ascii?Q?+0Dxs1HojNK+Ht0ofOQa5d4OM7N2alZzeaxM3pEYIVbVWbZjf66e0du0yX7v?=
 =?us-ascii?Q?yjsGdJQF8a15K4rQusm+D7b4jfCoh/8A/2cyCv91zaDiw3kGE9SLNAlTVuM2?=
 =?us-ascii?Q?Ya4HU4WW2WTHvk19HHN5SVGFSrpGTVxpwlHa2HWP2l3d/Obu4cus6AzHobWm?=
 =?us-ascii?Q?Q3g4Y2P2fY8TmWkmrB9lEjrtlew3PvtqrsW6mv3CUvtNMw/id6xred+AaOuf?=
 =?us-ascii?Q?XyaftRbX+zjE4Bn0bV1Xgd7OrFW4W/MyQlNvAYpMtWYYXN07vbqGhc+SQXNt?=
 =?us-ascii?Q?mLDjbzXk/v37Wc6iyX7TmY4eH4KnCAfizBbgzN/i2jTXVkShnjtn8SvI/7PQ?=
 =?us-ascii?Q?dtKSV80MUNzEuOvAM8pKFhVqzfHiUQc4CGok7KoRTAujE4IaIMyYuTWmRIuO?=
 =?us-ascii?Q?vrIJedILU9W/0FEibhdGsQNUzJ/lGSu9IkGOVQ6b646HrCCGkVp7csO+EXxi?=
 =?us-ascii?Q?BWZc6oXwyCqJ6DzvSfi7MHhbHJTUQ3k2D8yUgO+AevzRxVzm/ncRCV9Ggy3O?=
 =?us-ascii?Q?hWUUHiF7HbMcfPWoWj9fOd+pNboo1hzAD3zUTz2lhlkUexR7YyQzW66E0Kt+?=
 =?us-ascii?Q?0lag74PgvlLwRizozApOXZK1S2IMhZBXBJXpignqmekEYvP1cY4kaU63W0dN?=
 =?us-ascii?Q?fIFfuHNDT+Q/XYs+7aXHtXH5XT89oO2AO2WkMAZK3CsGv6y7QXx/cnC4rZJJ?=
 =?us-ascii?Q?5LB2Znc9nI8QcYLCBaEtwDtGMhF19tG9uuu5Ev8naCEDl8r3tcx7bCGHzeki?=
 =?us-ascii?Q?qC0kuGMp/bPauOI9So+cPb6RP2fURy2PZXRfEmMefn1IySSCURp8BFv3MQ0z?=
 =?us-ascii?Q?yWLtoSdkVhkUiy3yZeQ91h2FfGdddafafZQM5mETE6P+QFozxhK/Yw6DkMFQ?=
 =?us-ascii?Q?MVLk2fXr3qi7bDeoVD8ATWcero9td0uizh3jRFDAPkdgGwMnjapghpmklJxP?=
 =?us-ascii?Q?OtsFjV/Fj6MWvvfoGbOE+iJeewUSaqjfZsEYtoaIsxyAWMWfVnSblT1Ni4ip?=
 =?us-ascii?Q?U7BGdQsE8m24JJ9Af0d++U4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c434169e-d47d-45e1-9fae-08d99ee1d9d0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 15:51:51.0333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwxihLwlZ1cUdZCeNxWu2a4lzJqneY9mSkbnKD8zqALIh3Gs2oJT0VirguKJxaG6/OBPjvCvxUJNhixOymeMSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 03.11.2021 16:41, Bertrand Marquis wrote:
> Hi Jan,
>=20
>> On 3 Nov 2021, at 15:30, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 03.11.2021 16:16, Luca Fancellu wrote:
>>>
>>>
>>>> On 3 Nov 2021, at 14:30, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 03.11.2021 15:09, Luca Fancellu wrote:
>>>>>> On 3 Nov 2021, at 11:28, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 03.11.2021 11:20, Luca Fancellu wrote:
>>>>>>>> On 3 Nov 2021, at 08:20, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>> On 02.11.2021 18:12, Luca Fancellu wrote:
>>>>>>>>>> On 2 Nov 2021, at 14:45, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>>>> On 02.11.2021 15:05, Luca Fancellu wrote:
>>>>>>>>>>> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214=
fd9b882
>>>>>>>>>>> ("arm/efi: Use dom0less configuration when using EFI boot") is
>>>>>>>>>>> introducing a problem to boot Xen using Grub2 on ARM machine us=
ing EDK2.
>>>>>>>>>>>
>>>>>>>>>>> The problem comes from the function get_parent_handle(...) that=
 inside
>>>>>>>>>>> uses the HandleProtocol on loaded_image->DeviceHandle, but the =
last
>>>>>>>>>>> is NULL, making Xen stop the UEFI boot.
>>>>>>>>>>
>>>>>>>>>> According to my reading the UEFI spec doesn't (explicitly) allow=
 for
>>>>>>>>>> this to be NULL. Could you clarify why this is the case? What ot=
her
>>>>>>>>>> information may end up being invalid / absent? Is e.g. read_sect=
ion()
>>>>>>>>>> safe to use?
>>>>>>>>>
>>>>>>>>> My test on an arm machine running Grub2 on top of EDK2 showed tha=
t
>>>>>>>>> when Xen is started, the get_parent_handle(=E2=80=A6) call was fa=
iling and stopping
>>>>>>>>> the boot because the efi_bs->HandleProtocol(=E2=80=A6) was called=
 with the
>>>>>>>>> loaded_image->DeviceHandle argument NULL and the call was returni=
ng
>>>>>>>>> a EFI_INVALID_PARAMETER.
>>>>>>>>> So the parent handle can=E2=80=99t be requested and the filesyste=
m can=E2=80=99t be used,
>>>>>>>>> but any other code that doesn=E2=80=99t use the handle provided b=
y get_parent_handle(=E2=80=A6)
>>>>>>>>> can be used without problem like read_section(...).
>>>>>>>>
>>>>>>>> I understand this. My question was for the reason of ->DeviceHandl=
e
>>>>>>>> being NULL. IOW I'm wondering whether we're actually talking about=
 a
>>>>>>>> firmware or GrUB bug, in which case your change is a workaround fo=
r
>>>>>>>> that rather than (primarily) a fix for the earlier Xen change.
>>>>>>>
>>>>>>> The issue was found only when using EDK2+Grub2, no issue when booti=
ng
>>>>>>> directly from EDK2.
>>>>>>> This is a fix for the regression, because without the EFI changes, =
Grub2 was
>>>>>>> booting successfully Xen. Using grub2 to boot Xen on arm is a very =
common
>>>>>>> solution so not supporting this anymore could lead to lots of peopl=
e having
>>>>>>> issues if they update to Xen 4.16.
>>>>>>
>>>>>> I'm not objecting to addressing the issue. But the description needs
>>>>>> to make clear where the origin of the problem lies, and afaict that'=
s
>>>>>> not the earlier Xen change. That one merely uncovered what, accordin=
g
>>>>>> to your reply, might then be a GrUB bug. Unless, as said earlier, I
>>>>>> merely haven't been able to spot provisions in the spec for the fiel=
d
>>>>>> in question to be NULL.
>>>>>
>>>>> Maybe I can rephrase to be more specific from:
>>>>>
>>>>> The problem comes from the function get_parent_handle(...) that insid=
e
>>>>> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
>>>>> is NULL, making Xen stop the UEFI boot.
>>>>>
>>>>> To:
>>>>>
>>>>> Despite UEFI specification, EDK2+Grub2 is returning a NULL DeviceHand=
le,
>>>>> that is used by efi_bs->HandleProtocol(=E2=80=A6) inside get_parent_h=
andle(=E2=80=A6),
>>>>> causing Xen to stop the boot getting an EFI_INVALID_PARAMETER error.
>>>>>
>>>>> Do you think it can be ok like this?
>>>>
>>>> Much better, yes, but I wonder what "returning" refers to. You want to
>>>> describe the origin of the NULL handle as precisely as possible. And
>>>> considering this turns out as a workaround, in a suitable place you
>>>> will also want to add a code comment, such that a later reader won't
>>>> decide this is all dead code and can be done in a simpler way.
>>>
>>> Ok I can write the issue from the beginning to be sure:
>>>
>>> Despite UEFI specification, EDK2+Grub2 is returning a NULL DeviceHandle
>>> inside the interface given by the LOADED_IMAGE_PROTOCOL service, this
>>> handle is used later by efi_bs->HandleProtocol(=E2=80=A6) inside get_pa=
rent_handle(=E2=80=A6)
>>> when requesting the SIMPLE_FILE_SYSTEM_PROTOCOL interface,
>>> causing Xen to stop the boot because of an EFI_INVALID_PARAMETER error.
>>>
>>> Regarding the comment, I can rephrase this comment:
>>> /*
>>> * If DeviceHandle is NULL, we can't use the SIMPLE_FILE_SYSTEM_PROTOCOL
>>> * to have access to the filesystem.
>>> */
>>>
>>> To be:
>>>
>>> /*
>>> * If DeviceHandle is NULL, the firmware offering the UEFI services migh=
t not be
>>> * compliant to the standard and we can't use the SIMPLE_FILE_SYSTEM_PRO=
TOCOL
>>> * to have access to the filesystem. However the system can boot if and =
only if it doesn=E2=80=99t
>>> * require access to the filesystem. (e.g. Xen image has everything buil=
t in or the
>>> * bootloader did previously load every needed binary in memory)
>>> */
>>>
>>> What do you think?
>>
>> Largely okay, albeit you don't mention GrUB at all (which isn't really p=
art
>> of the firmware, but which looks to be the culprit) and it gets a little
>> too verbose. Provided the facts have been verified, how about
>>
>>    /*
>>     * GrUB has been observed to supply a NULL DeviceHandle. We can't use
>>     * that to gain access to the filesystem. However the system can stil=
l
>>     * boot if it doesn=E2=80=99t require access to the filesystem.
>>     */
>>
>> (and it's up to you whether you include your further "e.g. ..." then, bu=
t
>> if you do I think the parenthesized part belong before the final full
>> stop, and the last "in" would want to be "into")? It's still dubious to =
me
>> how they can get away with such a NULL handle (and why that happens only
>> on Arm), but I guess it would go too far to try to understand the
>> background.
>=20
> This might not be a problem in Grub but actually in EDK2 or due to the fa=
ct that
> EDK2 is starting Grub which is starting Xen. Grub is not modifying this e=
xplicitly
> from what we found during our investigations.

Otoh Luca said that there's no problem without GrUB. So maybe "GrUB
in combination with EDK2 ..."?

Thinking more about it, this may also be partly related to our
limitation to loading files from file systems (and not e.g. networks
or RAM). Yet even then I couldn't see how a NULL device handle could
be used for anything.

Jan


