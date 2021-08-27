Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24163F9848
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 12:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173589.316702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJZTP-0003Cu-MS; Fri, 27 Aug 2021 10:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173589.316702; Fri, 27 Aug 2021 10:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJZTP-0003Aw-J2; Fri, 27 Aug 2021 10:52:35 +0000
Received: by outflank-mailman (input) for mailman id 173589;
 Fri, 27 Aug 2021 10:52:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVCk=NS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJZTN-0003Ao-SD
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 10:52:33 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d8ee042-63b9-474f-b6df-963d7fd56198;
 Fri, 27 Aug 2021 10:52:32 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-H9y9Zb9BMC6xhKi_2qdZ5A-1;
 Fri, 27 Aug 2021 12:52:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Fri, 27 Aug
 2021 10:52:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 10:52:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0003.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 10:52:27 +0000
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
X-Inumbo-ID: 8d8ee042-63b9-474f-b6df-963d7fd56198
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630061551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gi1RcGlckvyOgtoWMJztyYQsmUUsZVgUotU089919EA=;
	b=NJhiw99qjizQR6WRu8bXAWn98MiOze2nfQ062bPKpc0uvxG278rusO/YkQ4CkmJ/YjQjCf
	WFLR7QR4e2xZaKWnRQK2JGeLltFSV5PhUzbY0SjojynUtox041TcIBJyPrvoL87cRI5HtK
	2YwI1P586E0/4QoFBofRc6l+3O8bMcI=
X-MC-Unique: H9y9Zb9BMC6xhKi_2qdZ5A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNGIenOGsS+AwECOfspb67idbdq3nvqCnAebUHXkYbV3CCFQpAkDbInBG0fGz1l+szWNdXsqiM4zI4PrUh75y8+P2UiRI5JS590gS/cFxQJrwCJcJo/xK5st2rJJHS/Tjd69r+EEUmOkrgW6jlYKSKF7q0dXs6hsVBWfo7NANevowz1GV/gXm9tc2HIq4SuSfPL5ItzbvKimm9g5A+T/rel0Xg/HhQEcrdJkPHF//70+Vwhyka5xfqIWMHu6eWuJb+QuGYw4Xm5CFpGdiz82LCb9n3T90QGX2GNAXp7m/QUoh7rynhSDYlqFclkVXdRnybLNIkBJx5xRFSWE5egWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tae+1HQVE4uPfCp+5OlovBP1YhJlTviShxSWS1rePY=;
 b=Pz/XW3NdospZNwnd1N+psh2LeGpFZu7WREoroNnCToO7z35BnsKp0KgSbRAtEaTe7gak6h30lLwSGA03wBbmdMOLrZX/NDk00/bFdXH7koTs840nOWKSYD7T5j9ShIxf56RdEyjLf5VOJh8Bu5ydzc/1qfnRGviDoZEt0l+nLpbH6EnhgzjUM0LJIIZnIS8NgL1S8dWPq+Hx8H6ybuIxkRJlN/2GQ56BoYmi0dZS7QVr5sSvpBcFqzITPR1QW5QdXra43J0cfQTjcSiT9IT2ysHKdWPs8Oz0hK3hWQLEUcw8juXK+ZXOjKLE5v6Hri+nYbRfoHpNgjRI0yCAVzBdmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: HVM guest only bring up a single vCPU
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <a1724918-94bf-748f-5c4b-5a3ec176368f@xen.org>
 <781aeba6-5e77-9995-cf58-9dc6fd443ad8@citrix.com>
 <3b2e6fce-98a2-c18f-7068-9ca990b0b95e@suse.com>
 <62ca5392-3d85-0883-8020-287072358cef@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e72b385e-238a-5ae9-332e-2d21b59ac09c@suse.com>
Date: Fri, 27 Aug 2021 12:52:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <62ca5392-3d85-0883-8020-287072358cef@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P195CA0003.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4032f766-ed50-42bc-ca5b-08d96948c330
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26062D91E72E552111D8AD1FB3C89@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hVn2w24xBApTPQMd/EEV4k/z7x+x13fjnb9+aRcmjkavnuKyJibAZI5FSq1L5AmsWMVRXaeoElXSb0KQ4xW9jeHS6FazxWig8CqrmoyE0MzDhoxj9BQHMB2LqFxHgjMecAf1oLwC2UNdWhgniUWZtPsPunkdXguTVYCFb622j6FEiJGiSUjCgmOJIcM99pOHNdqgUwxOD8d8GKveaSTunO0Mg5JImeqEBjCMoQa9DUfi8TWcqTMuqfWNzXg88AXp3XKD9es18naon9EMPcIhwP1X6mAPsNQdZc3jRFOMvEeAJ6svVHybmCo8AEDkVAtS3nFOhCE0dBj771uEcZsr5DdJrjWx0FrusmpXqwSioEsRAXfapLfahqInAEvbMweDcOEkHgRXVGL0V8VUUrHg1Yi1akS2Y8bvbvhAhDDTIEQwhL31bK+jYA5QV6/5LFeCnLFPKNOM9l/eg+ylf0s95PZMUZPRHGWUU4mvQ2K+hr3DBtSJvjubnEH+zjtn2H+UK6c/pk14aES2w17M7dc9I/dvNb2+xcPstwtRAqBldLT99/EL7bJVIiMWSIr5vz2JVzv8me7Gfr/557Zj2kBvINq2VZyIOwxTXujaRYj1FcpbqTKFONzDCsgx6Sn8QWA5DnJWvYkBRawhk90+cDjehsPA3asdx61zBHiamZpjbc34fACUMCfKrH3PL85tN9sRvlA86Yaj+6jmX420gSvRv9W+783kU5KMtsvMiT55YwKSUhVAjyHdc0w2Zdo9sUBdnI4ITRH6LNEVoIy04GJYNV1NpnAxbb+ZSrpydWVkdpgyl1uFgoe7+UaPpW5JPpxw2Dz7nctcgDbjxK8wMrvJnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(136003)(39860400002)(346002)(2616005)(6486002)(66556008)(8676002)(5660300002)(53546011)(66946007)(38100700002)(26005)(956004)(16576012)(31686004)(316002)(8936002)(66476007)(4326008)(54906003)(83380400001)(31696002)(36756003)(2906002)(186003)(966005)(86362001)(478600001)(6916009)(10126625002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wtgc/Fclvole68Kh0gouLPykAXMoatgcrcZVK40fy8BSwpfwISVNtIQIjY+q?=
 =?us-ascii?Q?atZdaTRx470kr4Z819GVQYrcfN2j3HO8CWWD6Tu6UqFUct+7AUf3g6KvqKaI?=
 =?us-ascii?Q?WGx+euDoTx+v//ag5+S4NK1O4+BpBJhrQ6txqlS9gccCSPaCcj+yLKf2B5/Q?=
 =?us-ascii?Q?vXp7AcPp2g2RekwHYfaX9xaIeSxjJfRS5jrTZy7VPqeRXdU1suBqeygF1HDa?=
 =?us-ascii?Q?PO1YsYLgkVHncBg8xTAluRszjNRRiLQycx92HDiLdsR5YYWQN0nz5TLf1qKi?=
 =?us-ascii?Q?MzgGY/jCJ3OVZveYqZEPBq9Fjc+gp3Lq4I366+CYjhONjCsOEIE2LjazttNo?=
 =?us-ascii?Q?+Ve1zgFCS48GjFV6CSlFKX6CADqSKcXzhWCz9ejpa/p/lYU/0dj0a5MGdjTK?=
 =?us-ascii?Q?OMtmeYsC3hxIPv2ZdctzLY/a5HMqoAs+k1Wat/sJCOoi4X26ACOLZ3K27w55?=
 =?us-ascii?Q?4UQxD3aI+zYeD2qby5X9mQOZSEWEuv+Cezbkrk91wiWBAk9motZX7c6QpeoG?=
 =?us-ascii?Q?U1QpIyeohFKb8qISrT/sRxuRPZeoaEpg0Wjca8P4ePNKNJfiQEeVsi/yrRUS?=
 =?us-ascii?Q?aSY3Y6wOCI+l7BUvLG3Z1qnBxpehaLrekbJq+Pph/Jgfa2Kef27UM+ZNGh8f?=
 =?us-ascii?Q?u6ZXJrMn0pvcmF9FOTYD0os3sli+LZgHe5S29+0pOnl2SAgiRNqSQnqyimMh?=
 =?us-ascii?Q?jv7ge3Gqrmz4f/Nj8jaNweBOOzuWgbl0DTOKt8Z1yBjJI0ydT1aTb4F7XhHn?=
 =?us-ascii?Q?pBQlZIJPWMlbDiiA3htM3TuDAWOKoW5fKjQ/4b0GIQwUNIl+3MgRvyZ7YiJY?=
 =?us-ascii?Q?Jcvr+pFhwRkQDQRQhrvWCqpKRXXN4Jea4CllB0AWjwDAnKsKbmY4msf3QLib?=
 =?us-ascii?Q?d6bQ+jCUZEiRMmgW4DmjY1kTZzeOpYtFJV3t0Yt0iRP1QaLsqfiln1Qqn+eu?=
 =?us-ascii?Q?d6KEbToeLlfI/WoebMwQYl1K+ELPXh1czE1zSm1FfV3vi/WYL3EBj6QGRiCa?=
 =?us-ascii?Q?pSbYyGr2YlaNV0MZ0e5dl1jmkHdopqkxP9WTE4QZ0z8oVfh5oTZTx8o1HjUy?=
 =?us-ascii?Q?5U4vEPzxL/z9dRV6dwTMXR5LiCVhXVH7W2qW/sT0GF1UYD+NGMax2Kw8PYTm?=
 =?us-ascii?Q?9Or/iiCsm4n2Qy7wEQKPYXJfQDXpfEoP3z5VpvuXHovcdRORmuyC+1SuUWcS?=
 =?us-ascii?Q?dkPfrHJYpuHcD1OsdoatdhHesonPXh1XnkaI/DWDrv/VzDEgo27uzn85qyPW?=
 =?us-ascii?Q?AMIfoHm7m8ZWVwYOtqeVccaBBiNgcycqKOyRLgYhKutGmEZPnljcj+rlOLI6?=
 =?us-ascii?Q?tNg5uKcVG+ndiYdWJuo1g6ur?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4032f766-ed50-42bc-ca5b-08d96948c330
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 10:52:28.5021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pddON4mfzqPvSaUHo0N8ovZqM6ISgM6U7Md/psJcjCZnjw6z04uZkuzaJTTpQnf2LU5zVsJQjLxV68c/2YnZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 27.08.2021 12:35, Julien Grall wrote:
> Hi Jan,
>=20
> On 27/08/2021 07:28, Jan Beulich wrote:
>> On 27.08.2021 01:42, Andrew Cooper wrote:
>>> On 26/08/2021 22:00, Julien Grall wrote:
>>>> Hi Andrew,
>>>>
>>>> While doing more testing today, I noticed that only one vCPU would be
>>>> brought up with HVM guest with Xen 4.16 on my setup (QEMU):
>>>>
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>>>> [=C2=A0=C2=A0=C2=A0 1.122180] UBSAN: shift-out-of-bounds in
>>>> oss/linux/arch/x86/kernel/apic/apic.c:2362:13
>>>> [=C2=A0=C2=A0=C2=A0 1.122180] shift exponent -1 is negative
>>>> [=C2=A0=C2=A0=C2=A0 1.122180] CPU: 0 PID: 1 Comm: swapper/0 Not tainte=
d 5.14.0-rc7+ #304
>>>> [=C2=A0=C2=A0=C2=A0 1.122180] Hardware name: Xen HVM domU, BIOS 4.16-u=
nstable 06/07/2021
>>>> [=C2=A0=C2=A0=C2=A0 1.122180] Call Trace:
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 dump_stack_lvl+0x56/0x6c
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ubsan_epilogue+0x5/0x50
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 __ubsan_handle_shift_out_of_bounds=
+0xfa/0x140
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? cgroup_kill_write+0x4d/0x150
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? cpu_up+0x6e/0x100
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? _raw_spin_unlock_irqrestore+0x30=
/0x50
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? rcu_read_lock_held_common+0xe/0x=
40
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? irq_shutdown_and_deactivate+0x11=
/0x30
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? lock_release+0xc7/0x2a0
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? apic_id_is_primary_thread+0x56/0=
x60
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 apic_id_is_primary_thread+0x56/0x6=
0
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 cpu_up+0xbd/0x100
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 bringup_nonboot_cpus+0x4f/0x60
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 smp_init+0x26/0x74
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 kernel_init_freeable+0x183/0x32d
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? _raw_spin_unlock_irq+0x24/0x40
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? rest_init+0x330/0x330
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 kernel_init+0x17/0x140
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ? rest_init+0x330/0x330
>>>> [=C2=A0=C2=A0=C2=A0 1.122180]=C2=A0 ret_from_fork+0x22/0x30
>>>> [=C2=A0=C2=A0=C2=A0 1.122244]
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>>>> [=C2=A0=C2=A0=C2=A0 1.123176] installing Xen timer for CPU 1
>>>> [=C2=A0=C2=A0=C2=A0 1.123369] x86: Booting SMP configuration:
>>>> [=C2=A0=C2=A0=C2=A0 1.123409] .... node=C2=A0 #0, CPUs:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 #1
>>>> [=C2=A0=C2=A0=C2=A0 1.154400] Callback from call_rcu_tasks_trace() inv=
oked.
>>>> [=C2=A0=C2=A0=C2=A0 1.154491] smp: Brought up 1 node, 1 CPU
>>>> [=C2=A0=C2=A0=C2=A0 1.154526] smpboot: Max logical packages: 2
>>>> [=C2=A0=C2=A0=C2=A0 1.154570] smpboot: Total of 1 processors activated=
 (5999.99
>>>> BogoMIPS)
>>>>
>>>> I have tried a PV guest (same setup) and the kernel could bring up all
>>>> the vCPUs.
>>>>
>>>> Digging down, Linux will set smp_num_siblings to 0 (via
>>>> detect_ht_early()) and as a result will skip all the CPUs. The value
>>>> is retrieve from a CPUID leaf. So it sounds like we don't set the
>>>> leaft correctly.
>>>>
>>>> FWIW, I have also tried on Xen 4.11 and could spot the same issue.
>>>> Does this ring any bell to you?
>>>
>>> The CPUID data we give to guests is generally nonsense when it comes to
>>> topology.=C2=A0 By any chance does the hardware you're booting this on =
not
>>> have hyperthreading enabled/active to begin with?
>>
>> Well, I'd put the question slightly differently: What CPUID data does
>> qemu supply to Xen here? I could easily see us making an assumption
>> somewhere that is met by all hardware but is theoretically wrong to
>> make and not met by qemu, which then leads to further issues with what
>> we expose to our guest.
> I have pasted the output from cpuid on a baremetal Linux here:

"baremetal" still meaning it was running on qemu, not itself baremetal?

> https://pastebin.com/WvaXiXuL

   miscellaneous (1/ebx):
      process local APIC physical ID =3D 0x0 (0)
      maximum IDs for CPUs in pkg    =3D 0x0 (0)
      CLFLUSH line size              =3D 0x8 (8)
      brand index                    =3D 0x0 (0)

As suspected the field is zero, and hence will remain zero after
multiplying by 2. I suppose the patch sent earlier should then get you
further.

Jan


