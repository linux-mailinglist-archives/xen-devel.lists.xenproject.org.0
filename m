Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CAA2B7FED
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 16:00:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29952.59637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfOwK-00087i-Sk; Wed, 18 Nov 2020 15:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29952.59637; Wed, 18 Nov 2020 15:00:08 +0000
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
	id 1kfOwK-00087I-P5; Wed, 18 Nov 2020 15:00:08 +0000
Received: by outflank-mailman (input) for mailman id 29952;
 Wed, 18 Nov 2020 15:00:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfOwI-00083Q-W2
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:00:07 +0000
Received: from de-smtp-delivery-52.mimecast.com (unknown [194.104.109.52])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6ae07c7-9359-4927-8225-eb3673a89ab0;
 Wed, 18 Nov 2020 15:00:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-z_sTIsAbNCq5bfKbnMzdZA-1; Wed, 18 Nov 2020 16:00:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 15:00:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::6882:d72e:9dfd:349e]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::6882:d72e:9dfd:349e%5]) with mapi id 15.20.3541.028; Wed, 18 Nov 2020
 15:00:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0302CA0023.eurprd03.prod.outlook.com (2603:10a6:205:2::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 15:00:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfOwI-00083Q-W2
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:00:07 +0000
X-Inumbo-ID: f6ae07c7-9359-4927-8225-eb3673a89ab0
Received: from de-smtp-delivery-52.mimecast.com (unknown [194.104.109.52])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f6ae07c7-9359-4927-8225-eb3673a89ab0;
	Wed, 18 Nov 2020 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1605711604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcKlYpifA7sWwZ+E6tA7roktScVd1B73kZOHhF0T69E=;
	b=CKy5/Rcue9G/IjmFxXF4JNw7HYG6znWbXoNyZp7jgq9GROGDTe4rP+hovng9gTc+9MKOJo
	hs8PD6gv/8Fo7npZPaHPTiJyEPqndOny8lKEF8aGkFZ84a226tFOHywA4cX+3Ll0zqrj5c
	teoF1zPUms6H7ClYfvIBoTzdXR0RlTE=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-z_sTIsAbNCq5bfKbnMzdZA-1; Wed, 18 Nov 2020 16:00:02 +0100
X-MC-Unique: z_sTIsAbNCq5bfKbnMzdZA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kz7O+S5I6B6DrLJVEKstklsqcBLZ1OEUE5+5XHm3V2P4vnqiWszrEyuloxRqgaADXVEldEXCQ8OKO8za+NcZRxbJ1ajWiPIuv/hFAwRpNpO9D3e01fpFtf2QCx6RqIjoR1VQpQ4Ggw/roQ1u+/gv1r7y74D4pe4FONb5+scsX2T1/fyXc9n4b363fYsXrknWR2P59IOgQdFE2GVbLqwndJhnbZ9OFv51MjYwiP4si7dPBLrsSh7u1ovxIYpCEbP8wXpYMx6AStiPfJ1pxwbVEaojWGeI+HUCL95ZNwJueCAQ74ih1YIT/UlR+/IyTuXIBWdqIcwV8/TAwcfZhj3ngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTRar5Ln38uVXsmBvVyLeFY2UisNGPtpkLSVX7oZtx0=;
 b=N6N9QX+4UOqMa7UPjjJiZillS+XEZutwZmLBCezdtK/WxXWujFZ4kBgu8Ne7N6RiD2f96qdyegNd1yEsn2GMZiKoTiO8bjsVwpxnZMFHGQ/EMSTHYZHrXoCbdyEXy4D7kYvsQxKIyZR3Bjv+2ITKH6IJBMsY7j2yZtK8KHSrvNfvPrmgWW+eE6Qpb6O6I8g3tYl7DTQ55HTac/U9+Fxge4jBjEfv+ax+wtJ1bidAq0jV2wafp77g+xTylU+NQX3E9kgLxh59ZcaBK9Vv/tGngQMAKf+VNtl5nhTWLdETJ3czKON3MJlPYfXwalA66esTywcklhOE1Yfq0xpnyiZ4vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: antioche.eu.org; dkim=none (message not signed)
 header.d=none;antioche.eu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 15:00:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::6882:d72e:9dfd:349e]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::6882:d72e:9dfd:349e%5]) with mapi id 15.20.3541.028; Wed, 18 Nov 2020
 15:00:01 +0000
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: xen-devel@lists.xenproject.org, Manuel Bouyer <bouyer@antioche.eu.org>
References: <20201117150949.GA3791@antioche.eu.org>
 <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
 <20201117164033.GB3093@antioche.eu.org>
 <20201118085738.wpnfmjagxjf6cofp@Air-de-Roger>
 <20201118092425.GC1085@antioche.eu.org>
 <20201118100025.ic7r3kfsbdnr6muz@Air-de-Roger>
 <20201118121403.GC3126@antioche.eu.org>
 <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb2b6182-f3a6-61e5-ee70-90a65ae56435@suse.com>
Date: Wed, 18 Nov 2020 15:59:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
In-Reply-To: <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM4PR0302CA0023.eurprd03.prod.outlook.com
 (2603:10a6:205:2::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.236] (37.24.206.209) by AM4PR0302CA0023.eurprd03.prod.outlook.com (2603:10a6:205:2::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 15:00:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cbe1a92-2a6f-4213-3ed9-08d88bd29f84
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70393CC35A7071C7207A50D8B3E10@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SFhJYGuKHqAg8rPgcw0CKl7nvLlkHheRryM9QOVtK7SuAcFUwqVkT6Y9MVg0M8H4dyrf3asKacKVcM9ti0+CAhTTtVo4NA13GqbUnQ8Uvml9mJFhviooZ/SUhcPOafytGDzA+s5tkDRHvlUm/EuVnhDBgVbFvlFKgLGSrEyJMb9+lRHKNzwRG30oZ7srJuHxkYHhSPdzkI4cZbYf7Rx8lAl0MqdPjYbUTkljZBXgPb2FfLoUkZunRDQApbPJlVoe5TJuy0mQtrQ3O08utbO8mStMwU3WsGXEYjSyjvJtE2V+1/RO+GcJiwtzX1PWi4lgh5OJZMdcMuiyjXvbHNtN66TTX8+Sgjg4nmfaSCLHxNzQG223IxcO/mPIhJll/i+Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(136003)(376002)(366004)(346002)(6666004)(8676002)(31686004)(6916009)(4326008)(16576012)(26005)(6486002)(316002)(186003)(66556008)(16526019)(66476007)(478600001)(66946007)(52116002)(8936002)(2616005)(86362001)(956004)(36756003)(31696002)(2906002)(53546011)(83380400001)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	e9uZvB2m5vqpQRRLYMQLqERxyYgja1xZTDQvKTVuvIv8jh2uYQ39A715dsKtx9LKHtAx8KUEqEmIuI6cQXscz/5wIZgC6hfh7rO0neOGarlttzjtTbz980RASGOwRAq62hGf7RaS2GzZ+HWVjn8NVSmLWiKS0+rhVRPMGc1vM77amT0LuKOLsjAcjb4TpN7I2ETyh236AOyObU1adw8xog4bN4iLUQ2JeqUO27eWs5DPUwb/PAm9QFWm5cBjFDQxRflydJZfapKFiA/ScMgoOD6+oxipjEdC084wEt9SHZvnAAZsdYpTxLY9NbBGYwIHzte81It0QOUavZYsTt4UaCP/0Ig67ziuSZZZspeOw5ezplGLVzp/Mb32+0j7kjFXz9EeIXiR2rjMS3hHyIVEBMdefPoN/4BZ8CQwES96RBozBmqYh4lVB0JGXmtqVkvxrh1ic82byOXdy4ZfVpRDwfRYozxl6eyqvQ3g+7dGvyJS0hdHy+4MiRGBEKFexN4wr68xf6U1B9eZvRS4TQ7Y3QycCPGtoVHwZJINkz4/8Cebtjd7dzetGiqqWKUHQwSGopquAI8jYRtB+R6aWZhC9sGr84/+CoiJfpN8Z4Z6v4YpZGpZxnilzz8WgEo8oXeRq0WgInI5zvd2qWXcuQdHXu3e3pd95r0fHlitG6Q3XWZNTNsqBENma+pHsC6t/hITZ1NCned8QWieO6G2EeYzXvaYw8zDQjl5SNttaN3tU6enjOEVkbCBZ9f3CUD5nhbZgFY1GobIBfeoZB8PKnaj2OscwTxxIkEyGS0Z3leobtnWvaxL1e900zZ4i28oLaBD3aYTvDDWdMMnQvqjhouh2oyn1QAbftMIJ2iPgFh9h+oOHc/dm/iBb3RCm6LO8Nu2nSxbCw2R16hlCp4Drd95bQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbe1a92-2a6f-4213-3ed9-08d88bd29f84
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 15:00:01.0221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmJahtt9ySAoqMRqa5jSMlUEH7I5l8ehUZjEnovoJ7j6aP2fbHUqAeT/aN5sj/Gn2xZYB0UHbYQZl83wovBvlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 18.11.2020 15:39, Roger Pau Monn=C3=A9 wrote:
> On Wed, Nov 18, 2020 at 01:14:03PM +0100, Manuel Bouyer wrote:
>> I did some more instrumentation from the NetBSD kernel, including dumpin=
g
>> the iopic2 pin2 register.
>>
>> At the time of the command timeout, the register value is 0x0000a067,
>> which, if I understant it properly, menas that there's no interrupt
>> pending (bit IOAPIC_REDLO_RIRR, 0x00004000, is not set).
>> From the NetBSD ddb, I can dump this register multiple times, waiting
>> several seconds, etc .., it doens't change).
>> Now if I call ioapic_dump_raw() from the debugger, which triggers some
>> XEN printf:
>> db{0}> call ioapic_dump_raw^M
>> Register dump of ioapic0^M
>> [ 203.5489060] 00 08000000 00170011 08000000(XEN) vioapic.c:124:d0v0 api=
c_mem_re
>> adl:undefined ioregsel 3
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 4
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 5
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 6
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 7
>>  00000000^M
>> [ 203.5489060] 08(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioreg=
sel 8
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 9
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel a
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel b
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel c
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel d
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel e
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel f
>>  00000000^M
>> [ 203.5489060] 10 00010000 00000000 00010000 00000000 00010000 00000000 =
00010000 00000000^M
>> [...]
>> [ 203.5489060] Register dump of ioapic2^M
>> [ 203.5489060] 00 0a000000 00070011 0a000000(XEN) vioapic.c:124:d0v0 api=
c_mem_readl:undefined ioregsel 3
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 4
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 5
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 6
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 7
>>  00000000^M
>> [ 203.5489060] 08(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioreg=
sel 8
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 9
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel a
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel b
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel c
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel d
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel e
>>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel f
>>  00000000^M
>> [ 203.5489060] 10 00010000 00000000 00010000 00000000 0000e067 00000000 =
00010000 00000000^M
>>
>> then the register switches to 0000e067, with the IOAPIC_REDLO_RIRR bit s=
et.
>> From here, if I continue from ddb, the dom0 boots.
>>
>> I can get the same effect by just doing ^A^A^A so my guess is that it's
>> not accessing the iopic's register which changes the IOAPIC_REDLO_RIRR b=
it,
>> but the XEN printf. Also, from NetBSD, using a dump fuinction which
>> doesn't access undefined registers - and so doesn't trigger XEN printfs =
-
>> doens't change the IOAPIC_REDLO_RIRR bit either.
>=20
> I'm thinking about further ways to debug this. I see that all active
> IO-APIC pins are routed to vCPU0, but does it make a difference if you
> boot with dom0_max_vcpus=3D1 on the Xen command line? (thus limiting
> NertBSD dom0 to a single CPU)

I too have been pondering possible approaches. One thing I thought might
help is accompany all places setting remote_irr (and calling
vioapic_deliver()) with a conditional log message, turning on the
condition immediately before the first "undefined ioregsel" gets logged.
(And turn it off again once the last RTE was read in sequence, just to
avoid spamming the console.) From Manuel's description above, there has
to be something that sets the bit and causes the delivery _without_ any
active action by the guest (i.e. neither EOI nor RTE write) and
_without_ any new instance of the IRQ appearing. I have some vague hope
that knowing how we end up making the system make progress again may
also help understand how it got stuck.

Jan


