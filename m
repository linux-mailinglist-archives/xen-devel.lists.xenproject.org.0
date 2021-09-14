Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9879340B2C1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 17:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186862.335610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQA8F-0008Do-1y; Tue, 14 Sep 2021 15:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186862.335610; Tue, 14 Sep 2021 15:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQA8E-0008Ao-Uc; Tue, 14 Sep 2021 15:13:58 +0000
Received: by outflank-mailman (input) for mailman id 186862;
 Tue, 14 Sep 2021 15:13:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQA8E-0008Ai-Au
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 15:13:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 664d4aa8-82aa-4b2f-aa87-8e5c825fb0e1;
 Tue, 14 Sep 2021 15:13:56 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-gmrR_YGDP-my1J0cNaWr6g-1;
 Tue, 14 Sep 2021 17:13:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 14 Sep
 2021 15:13:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 15:13:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 15:13:53 +0000
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
X-Inumbo-ID: 664d4aa8-82aa-4b2f-aa87-8e5c825fb0e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631632436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eUEbQ511uBH4HywxbmIrZZ/yrHO5uYXLo2/mlkVIRZs=;
	b=hDmUP210wMIryaLe6Q3jwIxldjYeC2icPwsG3UwHGkYVZixWp69Ra9RsY5OgUCqw7n7bXQ
	VaKao+3s9ItnLnDyXSYeFIgLxxLwi6QbCx6lTHzTuxEhWdQJqiiZZz5N0gdwkPLAIuXUz0
	HqXJbVbXLlPS5NSaurr05BWtht/b0sI=
X-MC-Unique: gmrR_YGDP-my1J0cNaWr6g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDk7/3jEJxafXnInRIatcNCb9ospsr2UZEnP4MNzQgTxNh0Zkn/nRJ8e2ATR2mE2pEs2xoxlw66pAX5aWsTvhN/5Q7bQ6YTfsb+iN9qWgzyoPkbcBnXrqJGxpSIoRoq7IaoH3FCu9CF9wEt0keXfhE6Lw9ehd2EbTz46H4zS3kvTNj+8AxpSYTKOnluAeTII4lTdTj6hRQpM4Hr6OyUrtTQOT0yP8sDh45u0+W1YZ2zY9eX6wAk753hnIbJqTp+BSgE3fdVmnHMTJFTMOPvqmqdDQoot5HCkGEZN6RHS8C1BeZToZuX8yiyNZKlrIhgBZbjXOIfa+6A+kvtGl1Axvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ECD752V6eG6nfPVInGP4QXCeIopzoJTg6NlXkgkzu0M=;
 b=EBgpvGVvMvkHssBLZxzlbx/uL7AW0kM+JS0pHZe+ZxihM6sSiQdIK0vNBR2MMLDRuJcas/insmT2jj2KdOjNkPPNLB0JjFRbAGroHg4VWoqD/fZ6P1kjxQ8jKP94WX4xRYbPivCUhDwF4PZeC5SALD+j1niJujZ3cqEHbUI/kKPAg+XXy3kfMdQTYl3SHj2L0E9I56Cn0GNv2H6Wx296CZRNaS1NQfxPHOgCYJlCX++mb+d4fGZXnnupJAaZkbAOjjic7hbnWrTWLU1W03Gc5mzfeUGNetLd6bDtUhi8UEWcIB9O0g292aLai0XIV6nW1myXLFwkKzHspv0bS/iXVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 0/9] xen/x86: PVH Dom0 fixes and fallout adjustments
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
 <YUBeJLvWXukyGSFf@MacBook-Air-de-Roger.local>
 <050f71c8-227f-4f78-1ec5-394ba9fba9c1@suse.com>
 <YUCEQFpdc+3kUqQj@MacBook-Air-de-Roger.local>
 <40ea4ec8-483b-9191-a233-f2916f22c131@suse.com>
 <YUCYYmqQMR5NCTyz@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <13dd8509-330b-4571-086a-7a3ed9c22c82@suse.com>
Date: Tue, 14 Sep 2021 17:13:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUCYYmqQMR5NCTyz@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM9P192CA0024.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5adbe3f1-dc66-4920-9049-08d9779243cc
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23354197C41F9E71E890D952B3DA9@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	niMXTS/KNXbkB+wjze2R1IVFVOHfeFeUehENw3LpWc34kQZ/uDwbBYDyylTZSHN6Af2CWhGO/m8VaFaHKfzA7OCWPDWqRXw6lHK4EO7/RFfS4m6Q6eNxvjMyZtsnV9QzRAy67M8EsnHX48sMnWS+7gEMbnp4nP58ytzNFdg0d7icj93eucSz40ch4dC/CRMMSVJuGdm8tLmrmB9H3I1lmlQciFBxONE/dJYQd97qUakX1RhJy7kyV5WXzyTPq8hcXc2XioKsg76DKqaY1SeIoJLqfQ81CMBtpiw76HUleOvzWb4Eww9mIL+IBepbm6wQgLmj3t7nB0YNFd9trTpeO16kS3woMCS21xvx90dkaEZLjzzUMziYlnERLwxX8MsyAh/1tOumTIqIrdPCYQo9QcjmyRCq66OkV1oGfWQ3qGInVFSJ/DDALo1ua1E4KDiI00Egw1wGEj2IL5U9EBk/Ub4UU4SE+48V2Dh21CZbiBt9774DIsnc3b5Evms8PpY+9bXMqFmOO/qSICF9/vXwmFzJOZnoZu1g0l08NlR95O4S3w6wOV5pLUtFFB4dFrllJG5HEYOS1wAuhmHKMrYozw18JVlm3hhRTgxBniCtc2wzi/iyPbGWJM50ALMoKV5Sv4ZU/rkZ4zot653pTir4PgvwGRUFKO3R6Z1nEg7Q3sARDvlPYLEsm8pATRJesAWKHWxgWZoUPrmkNVaSQaN8YnXNBwTfJdlXFO1eoFgcZYYFWRiBqqeK5bwtgS/H5r97sRg87q4UB9igWTGL0AATwObzep+6+7b0sXjGCe0yhVQUZXOPvZaXe9G4QC7qWb41vCUUKB/2/oQy9pgYJa4kfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(136003)(366004)(39860400002)(346002)(31686004)(6916009)(26005)(31696002)(53546011)(38100700002)(6486002)(36756003)(45080400002)(186003)(8936002)(478600001)(2906002)(8676002)(4326008)(5660300002)(83380400001)(86362001)(66556008)(966005)(54906003)(2616005)(316002)(16576012)(66946007)(66476007)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?at9P6pCwgpCB5svNX/CO8os8thqC+oDosEeqZhCCWPGnq8Ianqz9YTumYWAz?=
 =?us-ascii?Q?pYfJFotsxwQVWlqDxvdA5qM9/g/xXjC2IJiFkAxGfOoaOglIVdDY66yxkCfP?=
 =?us-ascii?Q?iLKyAxPszcWk58xcg2s5o888Ot86GzyS13EHoaa5Fw86Vl9IydpOSa248ycE?=
 =?us-ascii?Q?0mF4EwCGNmHUEj4zo/5jD9ueHs+UTqmuEC0GZTfpoFKYIIkdmxLEHOt5Rchh?=
 =?us-ascii?Q?3QwgRdjHqUVamepONRBcOB8t/NokX5wgaTIm663jpfUETLAEaU+FCVKB8tUe?=
 =?us-ascii?Q?TIikDlPSFPtecMyApBPMWc1UNEnTQncixpXEcWuw9QoPtxUz7Cm158vQ9tZo?=
 =?us-ascii?Q?qu4WTnaAclCGL4XHb6Pt8yhype4ASP7xXsBWRVGsUrt+kAUkPGM6yChh4Mi5?=
 =?us-ascii?Q?gIvQG39g2f2g+HoLGzZY+49QQgN2FpIY0UKWXFihHoWLg61uVbhP/rRqppwV?=
 =?us-ascii?Q?dX4z7274+N9ER3v44BpTfIpWhsDR8n4ZKh3stNV3wgkKl3qaP3TQYlLCj48C?=
 =?us-ascii?Q?XPTiWO+fqR20RyHWao5/m+DB6l61FIKV9ixOqYIQ6QjAn03U6sE4itryNmLG?=
 =?us-ascii?Q?AJad+hYx6rs9+0icI/5NPGrg+bw1yCGYxtHE55PLUTB3joCwtM4LuZNJYrI8?=
 =?us-ascii?Q?TfEQO36EMMh/Bf4HSlVpVw7013jdjtKpTQxTcSQKulDFdG9oK85AHa5N19uZ?=
 =?us-ascii?Q?A6egGZPeHywWwsP6u9YbsnraixnKliksUxCliL1fRi03rqMwueY5pPC2Skxt?=
 =?us-ascii?Q?QGyjbzoelPs3AZbTQV20gslIMCJZ6Xpr9IMSbbMYJhOQc4H/FedgM1y6vRPR?=
 =?us-ascii?Q?WnSQ4UpfujbGA2Rj3hJ4bfpovykTSr+ifnPLod+WbygwXny3uMN/d9aqQk0V?=
 =?us-ascii?Q?DbWdLxcEHJzEUf/ZrpiMKRADHNNRBNMZ7aLE9WAFAQjY2tVQMpcDt8hmZbmz?=
 =?us-ascii?Q?PHrPklCbKyXXwqkJqw9koiJjTCg6ajLZ+eUY3M+qcZj/wae8X5/hnsb/Y8vG?=
 =?us-ascii?Q?S2bI0/19kswmUucSx60f7xdnSHasM0qs/CURuecuIzce43plvsgkvCS79hWk?=
 =?us-ascii?Q?gZocLPs9OCJMTCyr9oUnvN8SkU2Dd1W1gay3JXC0z514rKjAk/qOelaRAeMf?=
 =?us-ascii?Q?LCn2OIW9NnMhcHINTyqdlifvSrVFREkLFumbUqv4IEf7w8JD5IL+vOnyd7b9?=
 =?us-ascii?Q?h5T/oolHgA5Ypnz5K/fMmP/dP17VfLBEx/LX8cnwLrsb6Z8LR2N3Fr44opTN?=
 =?us-ascii?Q?cOf1ZBlgR0yfaWkYjif+PEsdE6BTJtKyLpGOnMsRXw3QEWY9iU9eQlT89909?=
 =?us-ascii?Q?Z994Ebuoov2NjYtiilYZq/MD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5adbe3f1-dc66-4920-9049-08d9779243cc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 15:13:53.7275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRgwcyn0rXPUAjv56cYjTyvN4jc/Whq6BcRTH2XT8UX/14PdqMPKPyvYJls7GRbkf/0lH+D0IWJtNkSE1hQCbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 14.09.2021 14:41, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 14, 2021 at 01:58:29PM +0200, Jan Beulich wrote:
>> On 14.09.2021 13:15, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Sep 14, 2021 at 11:03:23AM +0200, Jan Beulich wrote:
>>>> On 14.09.2021 10:32, Roger Pau Monn=C3=A9 wrote:
>>>>> On Tue, Sep 07, 2021 at 12:04:34PM +0200, Jan Beulich wrote:
>>>>>> In order to try to debug hypervisor side breakage from XSA-378 I fou=
nd
>>>>>> myself urged to finally give PVH Dom0 a try. Sadly things didn't wor=
k
>>>>>> quite as expected. In the course of investigating these issues I act=
ually
>>>>>> spotted one piece of PV Dom0 breakage as well, a fix for which is al=
so
>>>>>> included here.
>>>>>>
>>>>>> There are two immediate remaining issues (also mentioned in affected
>>>>>> patches):
>>>>>>
>>>>>> 1) It is not clear to me how PCI device reporting is to work. PV Dom=
0
>>>>>>    reports devices as they're discovered, including ones the hypervi=
sor
>>>>>>    may not have been able to discover itself (ones on segments other
>>>>>>    than 0 or hotplugged ones). The respective hypercall, however, is
>>>>>>    inaccessible to PVH Dom0. Depending on the answer to this, either
>>>>>>    the hypervisor will need changing (to permit the call) or patch 2
>>>>>>    here will need further refinement.
>>>>>
>>>>> I would rather prefer if we could limit the hypercall usage to only
>>>>> report hotplugged segments to Xen. Then Xen would have to scan the
>>>>> segment when reported and add any devices found.
>>>>>
>>>>> Such hypercall must be used before dom0 tries to access any device, a=
s
>>>>> otherwise the BARs won't be mapped in the second stage translation an=
d
>>>>> the traps for the MCFG area won't be setup either.
>>>>
>>>> This might work if hotplugging would only ever be of segments, and not
>>>> of individual devices. Yet the latter is, I think, a common case (as
>>>> far as hotplugging itself is "common").
>>>
>>> Right, I agree to use hypercalls to report either hotplugged segments
>>> or devices. However I would like to avoid mandating usage of the
>>> hypercall for non-hotplug stuff, as then OSes not having hotplug
>>> support don't really need to care about making use of those
>>> hypercalls.
>>>
>>>> Also don't forget about SR-IOV VFs - they would typically not be there
>>>> when booting. They would materialize when the PF driver initializes
>>>> the device. This is, I think, something that can be dealt with by
>>>> intercepting writes to the SR-IOV capability.
>>>
>>> My plan was to indeed trap SR-IOV capability accesses, see:
>>>
>>> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e.kernel.org%2Fxen-devel%2F20180717094830.54806-1-roger.pau%40citrix.com%2F=
&amp;data=3D04%7C01%7Croger.pau%40citrix.com%7C35d2502d0128484e229e08d97777=
087f%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C637672175399546062%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C1000&amp;sdata=3DsSeE%2F4wEo5%2Fplkj2yH%2B1kpHi5c15lxJxeUxx6Cby=
r4s%3D&amp;reserved=3D0
>>>
>>> I just don't have time ATM to continue this work.
>>>
>>>> But I wonder whether
>>>> there might be other cases where devices become "visible" only while
>>>> the Dom0 kernel is already running.
>>>
>>> I would consider those kind of hotplug devices, and hence would
>>> require the use of the hypercall in order to notify Xen about them.
>>
>> So what does this mean for the one patch? Should drivers/xen/pci.c
>> then be built for PVH (and then have logic added to filter boot
>> time device discovery), or should I restrict this to be PV-only (and
>> PVH would get some completely different logic added later)?
>=20
> I think we can reuse the same hypercalls for PVH, and maybe the same
> code in Linux. For PVH we just need to be careful to make the
> hypercalls before attempting to access the BARs (or the PCI
> configuration space for the device) since there won't be any traps
> setup, and BARs won't be mapped on the p2m.
>=20
> It might be easier for Linux to just report every device it finds to
> Xen, like it's currently done for PV dom0, instead of filtering on
> whether the device has been hotplugged.

Okay. I'll leave the Linux patch as is then and instead make a Xen
patch to actually let through the necessary function(s) in
hvm_physdev_op().

>>>>>> 2) Dom0, unlike in the PV case, cannot access the screen (to use as =
a
>>>>>>    console) when in a non-default mode (i.e. not 80x25 text), as the
>>>>>>    necessary information (in particular about VESA-bases LFB modes) =
is
>>>>>>    not communicated. On the hypervisor side this looks like delibera=
te
>>>>>>    behavior, but it is unclear to me what the intentions were toward=
s
>>>>>>    an alternative model. (X may be able to access the screen dependi=
ng
>>>>>>    on whether it has a suitable driver besides the presently unusabl=
e
>>>>>>    /dev/fb<N> based one.)
>>>>>
>>>>> I had to admit most of my boxes are headless servers, albeit I have
>>>>> one NUC I can use to test gfx stuff, so I don't really use gfx output
>>>>> with Xen.
>>>>>
>>>>> As I understand such information is fetched from the BIOS and passed
>>>>> into Xen, which should then hand it over to the dom0 kernel?
>>>>
>>>> That's how PV Dom0 learns of the information, yes. See
>>>> fill_console_start_info(). (I'm in the process of eliminating the
>>>> need for some of the "fetch from BIOS" in Xen right now, but that's
>>>> not going to get us as far as being able to delete that code, no
>>>> matter how much in particular Andrew would like that to happen.)
>>>>
>>>>> I guess the only way for Linux dom0 kernel to fetch that information
>>>>> would be to emulate the BIOS or drop into realmode and issue the BIOS
>>>>> calls?
>>>>
>>>> Native Linux gets this information passed from the boot loader, I thin=
k
>>>> (except in the EFI case, as per below).
>>>>
>>>>> Is that an issue on UEFI also, or there dom0 can fetch the framebuffe=
r
>>>>> info using the PV EFI interface?
>>>>
>>>> There it's EFI boot services functions which can be invoked before
>>>> leaving boot services (in the native case). Aiui the PVH entry point
>>>> lives logically past any EFI boot services interaction, and hence
>>>> using them is not an option (if there was EFI firmware present in Dom0
>>>> in the first place, which I consider difficult all by itself - this
>>>> can't be the physical system's firmware, but I also don't see where
>>>> virtual firmware would be taken from).
>>>>
>>>> There is no PV EFI interface to obtain video information. With the
>>>> needed information getting passed via start_info, PV has no need for
>>>> such, and I would be hesitant to add a fundamentally redundant
>>>> interface for PVH. The more that the information needed isn't EFI-
>>>> specific at all.
>>>
>>> I think our only option is to expand the HVM start info information to
>>> convey that data from Xen into dom0.
>>
>> PHV doesn't use the ordinary start_info, does it?
>=20
> No, it's HVM start info as described in:
>=20
> xen/include/public/arch-x86/hvm/start_info.h
>=20
> We have already extended it once to add a memory map, we could extend
> it another time to add the video information.

Okay, I'll try to make a(nother) patch along these lines. Since there's
a DomU counterpart in PV's start_info - where does that information get
passed for PVH? (I'm mainly wondering whether there's another approach
to consider.)

Jan


