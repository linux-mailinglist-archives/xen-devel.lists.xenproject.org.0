Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B002B7F92
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 15:40:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29920.59607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfOcb-0005D8-Jn; Wed, 18 Nov 2020 14:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29920.59607; Wed, 18 Nov 2020 14:39:45 +0000
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
	id 1kfOcb-0005Ci-FW; Wed, 18 Nov 2020 14:39:45 +0000
Received: by outflank-mailman (input) for mailman id 29920;
 Wed, 18 Nov 2020 14:39:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4dya=EY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kfOcZ-0005Cd-9A
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:39:43 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab6944e4-dc16-45a4-b4bb-ade02a3dfe0b;
 Wed, 18 Nov 2020 14:39:41 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4dya=EY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kfOcZ-0005Cd-9A
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:39:43 +0000
X-Inumbo-ID: ab6944e4-dc16-45a4-b4bb-ade02a3dfe0b
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ab6944e4-dc16-45a4-b4bb-ade02a3dfe0b;
	Wed, 18 Nov 2020 14:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605710381;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=o32XTEYz+UdwXFT176XyzgPdt707U6PPWV4Bo9JcwOI=;
  b=SAgxIx/x4yNCJoQpn3XjWPhn9mkOrYpsHnsMjJ+vV0aloeuPv4MfHjcs
   2er6bph3XW7QX/DGoeUJ22o5x6Y15f0tFeizFqo9oXQUhOsmijl85l/qu
   KxfgXRluRyiok1nU8tO1vcbTuNhDlXVxPn31ev2H1oF1KVuFfLFpovvNy
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CtzrP1/SJIy5vSGrdJAm2PP4+dbtT3duhD5qGlDJUlgwERwIT0GDgMNfiN8qCeYkUm9PNxOSEV
 SBrK7At5tW0uVxww1zAx1zPKBXBSZnJhEIBPXD8x7b3fGqHdyeyDwGJHlF0YCRDTLbnmWDXTGY
 kgK7TbvK9jt0rDhjdGl6A8PgtGNHtfNBLK1MwmaufYQd0MIAFOWDx5L1iwr6U745o39Bo6uuJA
 WiQJrax7vZ6/IUNfPPsQxxV1Vk6NuDDIEegPNClyoyAQQKBlmCTFD7QBghF2BHpx11LOnQddXf
 HLo=
X-SBRS: None
X-MesageID: 32576358
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,486,1596513600"; 
   d="scan'208";a="32576358"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oN/fAuJk4pwCc9/AH/2CmUy8IuwkNjcYTk7iUczi3yG2q+NxzwY0Jhk1YYfhZMLvoL+f48qXd2WJocVL7h5PbAQIP3v7eRTOCuvE7KHYXaB9cP6oyFDQnwMTz/r9/Vw1CgftAZARhbqJ95O/JtokkwKMsBKFc3hzA1By8TmK7vUiZFaZCvbXjE71I+81aR1BZ3qDSrZ3zezlNzE3Yj7vvmcgeP4RuqqZFWR0PS7SlLoMpTjM5KjYVtUt7so0lCr3vEf6/Iw/Y5EgzAdvqFdmQfDItPVu6fxglLKJaNq+8bVb0QIEoOLVjpzaqZIicITBgpuIC5w4AOQV6ECA0Y9Wjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKgcvU4jHaNyhyd0ZRWsY1Jcj+fW3JM7a14qDrDkDRs=;
 b=WsC86ZgwlbnyupiQvJ4ZDegfJPBpQY0wozTl6FOvfFdnYRI6+TckdSddnJUnaWQugvacUxkKaOmIkX87vTlXgq0Udqn6PY5FBzkE93hR1mqMAPXMyVxhVx6KWeFblSFCx7Xa6aqZc8wRJIKMeMK38cR/b+5y3zo4PiyAfjbQQ/K5rON5VAUkRIumAU3DHMuClq8YXPc7nK2/JvpOK4h2Agfv/97Vogg+U2atWk11lKHlcd60SN/u2mrw1KftjUmzGB7ErcU2//1YBOmngwcljUGfI85LlY4BG62HTVZkIE/P2LHy3jMyGeagaJVJqXK1GGLKr4Oyg0+u8gzWZ0p8Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKgcvU4jHaNyhyd0ZRWsY1Jcj+fW3JM7a14qDrDkDRs=;
 b=IzwxtFlWl7xlg/BuP5VSfMrcadlyzZ6Goz/DnuZnaVPEvnHHoVJ20Sch7MGXDrcUcEPP7q0zmvB6VGWanGlvSvfxKx87/CceM5DHmgkxVw2LSdqTmvaJ8BDPFw0ufJbCpO02x1geZgEDgifVvMAV5I3SecLV1RdB6rSehX2pZsM=
Date: Wed, 18 Nov 2020 15:39:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
References: <20201117150949.GA3791@antioche.eu.org>
 <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
 <20201117164033.GB3093@antioche.eu.org>
 <20201118085738.wpnfmjagxjf6cofp@Air-de-Roger>
 <20201118092425.GC1085@antioche.eu.org>
 <20201118100025.ic7r3kfsbdnr6muz@Air-de-Roger>
 <20201118121403.GC3126@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201118121403.GC3126@antioche.eu.org>
X-ClientProxiedBy: LO4P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56e3f814-47ac-4606-68bd-08d88bcfc3b4
X-MS-TrafficTypeDiagnostic: DM6PR03MB4476:
X-Microsoft-Antispam-PRVS: <DM6PR03MB447667C437CF6D17C8AFE8238FE10@DM6PR03MB4476.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K5plJef88AEdBE249eLjVQ9aJaJq6qJshA3rblv5TG/jzHbZ6s05wIvjCGVkKnLlBX/BbrGVthZcQB6s0j29jRjYVb12C6r4X95vl4MF6VaLe60OCK+6LMZe5AHNOyGerFx4L8mZ31bOyeqGfTXIsJ4g4GytrHBuvrhen7WpTZg0/zrfpDuVfhyB+kIXk7v4B8UnR1P7EFj3IcneDc+41zCfoifCLnipx6vPTBjAKtX9TWc64NwyEEy+fqOHBMGk1yEUf/mT88V+8WEYl47sOgQNmZpbtdJipPn7ccRYMntfzsfvqDxtL+JR9B6juOD73oN84473yH491I7uWQDQnENBeLlf6BbnebA3PsVaWCOnnIvkFgC9qRsRt3NXc2pZrytzqv1VaspsFZqMkdtL9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(33716001)(86362001)(66946007)(26005)(6916009)(956004)(478600001)(6496006)(4326008)(316002)(1076003)(6486002)(2906002)(85182001)(83380400001)(5660300002)(16526019)(186003)(8676002)(6666004)(9686003)(8936002)(66556008)(66476007)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 2jjCaBF+V6r8HRPBY++80Tszo3tu2s+cGY1nbDpzIpjEldUBz8U4xOGsBcNkuK6a86aEz4Wf7CZiOIg3yIBjaAgOb+nwxJq37vhOdm8j1vsCxtKFGrB4kag6DHvEbUQfLJR6bDKQWuZPRLcZQGh5adlMvAlNVrdQdmxlQTv7yp196Hg3P/7K2NEk3UONTEbZlh6kCs07Zn7SCjgCcoGg74tcTYflBgJiJkeHBzUSBPXsC4Ypt8uFZ4EnAaA1djan9Mnq58NbLykWYcUI7Q8BrIp/kZYS7lJMuojo576TrOdk/hqBEa90fwDIix84JrzHSYMoEczhuHG7hSj5sk9dMGHUmiPQvMuHgoY+I98GJ0cQUtjMUncBKKLOnKIYU+iRMTj0YqyqpV/gQC4ZkPAyiFWjiYV08UiTY7rsmF5ERqzkpgL68EWihzWOakG3042v9GQeQj+CMPmcv8tRE2z9MWAgUx+5yspJR3hbRM+b2LwnNBnGEnxP2MJa/FEuIxQlgiuuo4eTFRDeYxOwnXXFwTukkUvRPTEjOSPj6ENYLB64jg602tDI14dbiJjUzh9EjokE+O/8XbOpdzySv9tf0hJ9W+SRTi9abJTslSp7wOjLJmjAn9iJFbbdFAwfjOJ9Au3gz4bBepj7RuhcYfTVP2xtUpodoUYkfGhm7WgJMhqyKmQlxUcj6GPRtOguvWzQJcP8GKx/qkouXjd6r9gcnAFBshDqYiEVLLjTjNMKhIHkS0Gc9vMVfGX50YHBdF9u7OLi+jPOcFyW9Tki4roMd+97b5DHFcY8vEgC9QcP3qkkujaJ4XggNtX+5gFT3uikhq3cylhahnMI6dAzbylyvqxPp2NrN4MZEFTRqt/m2e5Q/zfSCbeFtFNpBeSnAeW004rw8fddpWnqlU5a34L9vw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e3f814-47ac-4606-68bd-08d88bcfc3b4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 14:39:33.2708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxD+nzUDLXtGn8e+WIOtFtKSyaw/Uk9ursUsizSXAP2c5E58FgXOJm9Rngm9pEVAzEyW+zGWLblFiAR2A06SOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4476
X-OriginatorOrg: citrix.com

On Wed, Nov 18, 2020 at 01:14:03PM +0100, Manuel Bouyer wrote:
> On Wed, Nov 18, 2020 at 11:00:25AM +0100, Roger Pau Monné wrote:
> > On Wed, Nov 18, 2020 at 10:24:25AM +0100, Manuel Bouyer wrote:
> > > On Wed, Nov 18, 2020 at 09:57:38AM +0100, Roger Pau Monné wrote:
> > > > On Tue, Nov 17, 2020 at 05:40:33PM +0100, Manuel Bouyer wrote:
> > > > > On Tue, Nov 17, 2020 at 04:58:07PM +0100, Roger Pau Monné wrote:
> > > > > > [...]
> > > > > > 
> > > > > > I have attached a patch below that will dump the vIO-APIC info as part
> > > > > > of the 'i' debug key output, can you paste the whole output of the 'i'
> > > > > > debug key when the system stalls?
> > > > > 
> > > > > see attached file. Note that the kernel did unstall while 'i' output was
> > > > > being printed, so it is mixed with some NetBSD kernel output.
> > > > > The idt entry of the 'ioapic2 pin2' interrupt is 103 on CPU 0.
> > > > > 
> > > > > I also put the whole sequence at
> > > > > http://www-soc.lip6.fr/~bouyer/xen-log3.txt
> > > > 
> > > > On one of the instances the pin shows up as masked, but I'm not sure
> > > > if that's relevant since later it shows up as unmasked. Might just be
> > > > part of how NetBSD handles such interrupts.
> > > 
> > > Yes, NetBSD can mask an interrupt source if the interrupts needs to be delayed.
> > > It will be unmasked once the interrupt has been handled.
> > 
> > Yes, I think that's roughly the same model that FreeBSD uses for
> > level IO-APIC interrupts: mask it until the handlers have been run.
> > 
> > > Would it be possible that Xen misses an unmask write, or fails to
> > > call the vector if the interrupt is again pending at the time of the
> > > unmask ?
> > 
> > Well, it should work properly, but we cannot discard anything.
> 
> I did some more instrumentation from the NetBSD kernel, including dumping
> the iopic2 pin2 register.
> 
> At the time of the command timeout, the register value is 0x0000a067,
> which, if I understant it properly, menas that there's no interrupt
> pending (bit IOAPIC_REDLO_RIRR, 0x00004000, is not set).
> From the NetBSD ddb, I can dump this register multiple times, waiting
> several seconds, etc .., it doens't change).
> Now if I call ioapic_dump_raw() from the debugger, which triggers some
> XEN printf:
> db{0}> call ioapic_dump_raw^M
> Register dump of ioapic0^M
> [ 203.5489060] 00 08000000 00170011 08000000(XEN) vioapic.c:124:d0v0 apic_mem_re
> adl:undefined ioregsel 3
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 4
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 5
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 6
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 7
>  00000000^M
> [ 203.5489060] 08(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 8
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 9
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel a
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel b
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel c
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel d
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel e
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel f
>  00000000^M
> [ 203.5489060] 10 00010000 00000000 00010000 00000000 00010000 00000000 00010000 00000000^M
> [...]
> [ 203.5489060] Register dump of ioapic2^M
> [ 203.5489060] 00 0a000000 00070011 0a000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 3
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 4
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 5
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 6
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 7
>  00000000^M
> [ 203.5489060] 08(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 8
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 9
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel a
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel b
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel c
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel d
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel e
>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel f
>  00000000^M
> [ 203.5489060] 10 00010000 00000000 00010000 00000000 0000e067 00000000 00010000 00000000^M
> 
> then the register switches to 0000e067, with the IOAPIC_REDLO_RIRR bit set.
> From here, if I continue from ddb, the dom0 boots.
> 
> I can get the same effect by just doing ^A^A^A so my guess is that it's
> not accessing the iopic's register which changes the IOAPIC_REDLO_RIRR bit,
> but the XEN printf. Also, from NetBSD, using a dump fuinction which
> doesn't access undefined registers - and so doesn't trigger XEN printfs -
> doens't change the IOAPIC_REDLO_RIRR bit either.

I'm thinking about further ways to debug this. I see that all active
IO-APIC pins are routed to vCPU0, but does it make a difference if you
boot with dom0_max_vcpus=1 on the Xen command line? (thus limiting
NertBSD dom0 to a single CPU)

I can also prepare a patch that will periodically dump the same stuff
as the 'i' debug key without you having to press anything, but I'm not
sure if it would help much.

Also, does the system work fine when you reach multiuser, or it also
randomly freezes and requires further poking?

Roger.

