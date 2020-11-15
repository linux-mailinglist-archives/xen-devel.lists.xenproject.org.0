Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5497E2B37BD
	for <lists+xen-devel@lfdr.de>; Sun, 15 Nov 2020 19:25:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27561.56200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keMhS-0000vG-T4; Sun, 15 Nov 2020 18:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27561.56200; Sun, 15 Nov 2020 18:24:30 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keMhS-0000ur-Pb; Sun, 15 Nov 2020 18:24:30 +0000
Received: by outflank-mailman (input) for mailman id 27561;
 Sun, 15 Nov 2020 18:24:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMBr=EV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1keMhQ-0000um-4M
 for xen-devel@lists.xenproject.org; Sun, 15 Nov 2020 18:24:28 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a54f419-9bdb-43b4-9f27-aa342aa68d22;
 Sun, 15 Nov 2020 18:24:26 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uMBr=EV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1keMhQ-0000um-4M
	for xen-devel@lists.xenproject.org; Sun, 15 Nov 2020 18:24:28 +0000
X-Inumbo-ID: 2a54f419-9bdb-43b4-9f27-aa342aa68d22
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2a54f419-9bdb-43b4-9f27-aa342aa68d22;
	Sun, 15 Nov 2020 18:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605464667;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=rfb4s4OQ7p3lwNBnAE6SpE1vfV+c7yeIlJBVPfXOURo=;
  b=RxUXY97b/TGmy3YIUU0SNGrYFluAvws+4kWlJgBF9BH4lHy24SFoNZCX
   sLvAvMFRgYUwdXIou2uYwZEZm2thd3G2gzA8o3qhhdbF7F5dq3kYx4ti9
   zji3OAqPl7x5Bh/4/9sqy5Z7P8Ms52xW81yeEUZ/EvFt/dZ0SBGyJTjUO
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wHN3Na1BouZutdlH/fyud1HNrusBFdhIwzQ+RuLLL0ivWv+0I1/AedbmSN/lreGObPEtuxeoNR
 IHGjw5fc3BfagbcXp36oYXNRenTRzGqstQkUBG7uWvL84+ZYAZ/RcKR6t06Z01ci5JQbfEyRCx
 U8DyQDxr1l/97uFcqC2dofZIyzhbXpJWcj6UnxW0tOVd0bI//APMpGElcRL7yN1bK8MgRfW977
 eb4yxUNDIkrChg3LykJwJGMsnC+8Ee/fb5FT3oLK9fQUFV1Oe3Xj73s08pv0Jy3tQU3pq5H97r
 JxU=
X-SBRS: None
X-MesageID: 31551867
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,480,1596513600"; 
   d="scan'208";a="31551867"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuhO3K6q+lYqaKX2of4HCH+xd9MKWa5shNV+eIv07/riv7CuzmlpPFpoFNntZ8775LfPDatUFuWdEiDLs4dS/wVEat/B4fN4OQ5zcbI3JapEFTKMDjMnpBrDm5SZGfMypmKZ3FYD6mGgnXlNxuX45SV52QDQeVXmtgb1Z6jBSKrVFh4VLnOrx58K92Fakscct36E8LvzPxTqaESIUJM6nzpjUdcgOTBeAn9RuupIgPP00c7el+16yB8WDFvVKM8WlTDQ1+7guyaVekL+wa51KQn1Hd0/YFIjo5RS09oVYIrc4GZw7X028nh94nDcX/JQiJU1DFivSI9OhCwYRXjDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfb4s4OQ7p3lwNBnAE6SpE1vfV+c7yeIlJBVPfXOURo=;
 b=huO/haIr7VzggGY5KM9SbcpSm5vSfFBx/VrAkGxQVNE3XzrBtO6qFq9ciJMoAen1YjUj2u1MDzznpB1DSyJoLOpKjI4GYVoDdWaCaXfTpvhhRWS4KBoFMrFTnkgD8diW+QCu23mqTLxyhR/We877tIdoDtaCKoEZc5E1yLBX5w8ZaTSSpc6IWBBvGS24/YrgrbnW6zBCAInru0F9vz4BO8DTwUzJ3g7BqVw9JLTgfOSnMAxr0wD9QbGVqoFHU19ryfqgaOMin5DK9Vws2FLiGZh8RKBlukkW4OHfaeN3MO9GryEs1WDd8WnrLu5ZxSWi9g5bEUYCxnwCOeGz5HekZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfb4s4OQ7p3lwNBnAE6SpE1vfV+c7yeIlJBVPfXOURo=;
 b=Og46QWQz76f+T0t7p2d/bDEy3bYIWKj0GriR/gG8Beu6tg0O8BuneHzM1pcawLy8kpDdfK2wNgMnEhVkUWFm/RkoZw8xXxw0aZvBS6aeLBnwRlBevTRZsCGF/bP00GXzvftWSYcH8a1Ex+w//PV6I5WU3gkGttJIYd9TLAihJHw=
Date: Sun, 15 Nov 2020 19:24:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: netbsd PVH dom0: xen clock event stops
Message-ID: <20201115182416.GA30231@Air-de-Roger>
References: <20201115174938.GA3562@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201115174938.GA3562@antioche.eu.org>
X-ClientProxiedBy: LNXP265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 120b405e-47ed-4f8b-6a0f-08d88993ac97
X-MS-TrafficTypeDiagnostic: DM6PR03MB4139:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4139991C7F5B9721472061728FE40@DM6PR03MB4139.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QTM9JTpxyy4Dzahk7ufjIOPc6oRf5O6KSJDtx1C5zR8TjComs0EzEQZDuf/Eqtvr08rViLp281YaDlIZYYuPGJjz8FPMwPczLRxDX3Octg4yr8BhNga8mz+rtB7U4q96uEjXxV4XKrAGZ8PScFtZ/bPlBQzLptPW+b8vpI38OxduugaEsGEbR65JtAq9E4zJiCi8sPQnHcytKwEgJvMfrmbsmaa3jxFHUIOv1tdvAm5Qh+AY7/e1n7PCSNnN4yqdqtntJAMrHUmQ4VweRVIZ8ndg6xjDvxanz8EMLIyOXUREdNoymuvvK5uje9lYeuJF659PIkaTM6OM2kyAyrI6gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(376002)(396003)(366004)(39850400004)(9686003)(6496006)(2906002)(478600001)(16526019)(33716001)(5660300002)(8676002)(956004)(316002)(1076003)(66946007)(4326008)(8936002)(33656002)(6666004)(6916009)(86362001)(66556008)(66476007)(186003)(6486002)(83380400001)(85182001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: +lsTnn4IUN6slALSdYmNsd1JQjnsfnKDZqlPul3wTDSXGxRmwG4aPdpTvj5IuBA+Joxmula2y8CavhbNnTm8myf4cukVvPmmYF5uFYyEANp13lOkShq+2oZrFadVo0CG+SLhHOYpGWp2ndrtHs1QkBR9gu5WRKxfgWz7C3qmMmNBcWuMyrJXKH7Nw6fKXuACnWGg6euceEksmLUpiKaQTgFL+0uek7QK3DCanN9FOayH1oumNcG8unmdUQ4YEnLRHkJf7xfga12T/2aerakokKkPewiKP+WQygsUqZz+ut+qtZiVJHAw6Dfks5cX7Q3rnAHjhgIJU7PYvg6Ms6kmcMRXTIi1Ek7a792mKVWEN8RMsp2Opd7wzC7h8gp5stkpZmoTc2Md901zZLtCYWsK5o7dbNkB5S2DFCGtdMsvSMcr+fyUi+uKqTjWNzzzrqmBRM+ifY7zpMGxy1g9jT45+8foIna5tWBoC20t0MCJ49icTu0gOKD4InzJjmtbks5ec8qdz4RVi/IQVV1ww20GHSiKw4w1B1E80gJF4fks0vRJyMdJO9YdliYdlEDnhg1SYQvQM3GXIwk7SjdReO5jqy2+KMw9JZ6688rpRs45HqNF0jQiizhUq82oZ/8eNuc9OVYFKBWRcuBmmt6nSmk2PNp3UmdvVHeJ2rYaON4b3XJoAYhdw/lsGXW8mKTMBHWvZ6jfaz0JXHKMwCALcKxh0JV+uxdoRSlQ3OYnzX6JhOnE8L5QW/zM8UNYQCv6cTZ1s1T81VGR/BUS8rbvbKrz+qYKKbJHwoKgg+5Le4n+tgbKeGwyp4TUnj64yFzFguvdvSl5HSKISrdt276yDoku6QQ+OKyGPFir+6THqM83Fd/8UUuG3VEZTkxyJVJ6ojaQG+/gMijP9OHdcvIXUzWBSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 120b405e-47ed-4f8b-6a0f-08d88993ac97
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2020 18:24:22.4126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/SoYp5oSKHfx8pZ1mHOgGpfyo/1pRkZhGaVKs15jjd0t1aRveArte1vZLE9fb+AL92+pGIQYkv5VbRP1f0Kkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4139
X-OriginatorOrg: citrix.com

On Sun, Nov 15, 2020 at 06:49:38PM +0100, Manuel Bouyer wrote:
> Hello,
> I spent some more time debugging NetBSD as a PVH dom0 on Xen,
> With Roger's patch to avoid a Xen panic, the NetBSD kernel stalls
> configuring devices. At first I though it was an issue with hardware
> interrupts, but it more likely is an issue with Xen timer events.
> Specifically: virtual CPU 0 stops receiving timer events, while other
> CPUs keep receiving them. I tried to force a timer rearm but this didn't help.
> The event is not masked nor pending on Xen or NetBSD, as confirmed by 'q'.
> Others events (the Xen console, the debug event) are properly received
> by CPU0. I don't know how to debug this more at this point.

You could try to use dom0_vcpus_pin command line option and then dump
the timers using the 'a' debug key, this way you can see if CPU0 has a
timer pending (which would be the vCPU0 timer).

What timer is NetBSD using, is it the PV vCPU single shot timer, the
periodic one, or the emulated local APIC timer?

Depending on the timer you are trying to use I would recommend to add
some printks if needed.

Roger.

