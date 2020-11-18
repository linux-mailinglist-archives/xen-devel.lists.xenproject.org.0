Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBC92B7AD5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 11:00:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29694.59307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfKGT-0002Fk-2f; Wed, 18 Nov 2020 10:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29694.59307; Wed, 18 Nov 2020 10:00:37 +0000
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
	id 1kfKGS-0002FL-Vg; Wed, 18 Nov 2020 10:00:36 +0000
Received: by outflank-mailman (input) for mailman id 29694;
 Wed, 18 Nov 2020 10:00:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4dya=EY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kfKGR-0002FG-8Z
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 10:00:35 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60d9740a-35c7-484d-9f5c-46ec809fcdbf;
 Wed, 18 Nov 2020 10:00:33 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4dya=EY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kfKGR-0002FG-8Z
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 10:00:35 +0000
X-Inumbo-ID: 60d9740a-35c7-484d-9f5c-46ec809fcdbf
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 60d9740a-35c7-484d-9f5c-46ec809fcdbf;
	Wed, 18 Nov 2020 10:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605693633;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gxlA9QrutNsxyLA42SCeHR37Ba32Z0+s/J5ZFSr+UwQ=;
  b=hcvQ9kKdXo6eaz3nTN7/nMGaCUju0ga0jfbGIJL8qEinJx+EqMi/EqJu
   6tcda6P5K9hDv+jG9szRYbu+9mDNVeRRZI7aU2R0y+SDugkEOfQEzugUy
   w4pLukj3y82IFIL99zrilFMvi3oIFV6lhA5dRxB6L8wr1JnVtRgbkR7wC
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: N40f+M0a68KvLHsb1kObzbG6XV4Y2vkW+MlNxAA70/U7kmO6lhqwJTDLG+R2t1Nntobr7GbWII
 jbJJc20jZZhGGdvoJVq/kKUbtIP2C8kewAnQUNZtnJkl8EUFnYa8lc7ISJ/koZJDz7CJmzti6X
 XPFMBYCPu2dkuPhrMrWNl+5+5lymHEqhjzwURc+/YjCqkEx9/aKAs2yJYGmYADfT1Ye99U4EG4
 cT15XAc42EUWEevcDBomeyFGcHpgCQT4uRToZ/yUZ82Ztq03152IcbfClanfsVUwNw6E5QkjTp
 Eiw=
X-SBRS: None
X-MesageID: 31755251
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,486,1596513600"; 
   d="scan'208";a="31755251"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCIJY4sk+KUz3bdEuUk97Qeo50zU7NZO4d8AuL46H6FBFJ8XGv2v622lR4aewcQlgVlu1f2NqkHLy44j6WC3VQDkDj0RNFar9055x5DxORds67fhoyQpQuVyPn4ksw1utyFpvgUBmDpNrOGbu/C+oYzZ2cMiWR7faqq+KwpfCc+cnFv/cF/LwFIiAD0NO4SDLVoYq+V2F3Q0l8wYtGJVtazeFaEPHmOWoJUOwJ3EX/71iMJbyjWG+Y3fH62Isqpip6d4EPHsYDkQkEIiZAQWf43vopjNu/yRxEYjt8UYg1Y+OaLAzBOivy/mlaTTsQosP2o0aofmUUMVjow8eFlh5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkOofeLWJnU1vVNmEllAyVXQXCX4Pxltzv4G56p6x0o=;
 b=atJ9+7UQr9MQWMzlNJTfFutg5JnkHN5qtNBygS7aaC5aJN46fnP7LkaJUbFTiUbNE4I7nEmbXU3qrMkUIsJOs14hX7kG/WXizAD6AwJbb6CHgJj1Z2WDCDALnNuNeoVsWVuL3i++2CXJsGX2kVuA1RF4pxdVpCbH3fBSlTDuMkccqx8VLdRQgHJ6Ow2q1SSKn1R+wJXd9A9CT8kVzewdQP+yCxLWi3N8IK3T0tHURVS+y5wWwDwzwnCBAyXAhHz1iHN3pQBTmc8h5cSBH2DM8CNpkjjLCyrcxSd6ab1dWdvLLu/aObRFT0FKIeOxzYOrWpPSP5KOWPELF46/frKxiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkOofeLWJnU1vVNmEllAyVXQXCX4Pxltzv4G56p6x0o=;
 b=cOBQo/VtiF6YTXCoBqnT2VDjpvjAjRAp5ZWrDCQgM045UcAFJqoEubuXLwB2nl2Kur1v3ZOkpLkAsUVA/KCwYhBPJwWa2RoVSjmlJuo89eKIW62zNr00YPpNz+dwk3r81NAtT3oShUArKGFffTm/CtFmlHu3TQpNwMccXVtdWM8=
Date: Wed, 18 Nov 2020 11:00:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201118100025.ic7r3kfsbdnr6muz@Air-de-Roger>
References: <20201117150949.GA3791@antioche.eu.org>
 <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
 <20201117164033.GB3093@antioche.eu.org>
 <20201118085738.wpnfmjagxjf6cofp@Air-de-Roger>
 <20201118092425.GC1085@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201118092425.GC1085@antioche.eu.org>
X-ClientProxiedBy: MRXP264CA0024.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20f0d76b-b283-4380-589e-08d88ba8c85b
X-MS-TrafficTypeDiagnostic: DM6PR03MB5065:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5065E902A79BB44F5588256B8FE10@DM6PR03MB5065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Gt2Ei7Qz90Y1+VJihlmrWLhYoGPOCkZxN94X222XfhFJ+TiN12OnapV5WM3MzJC3nNetxO8VYjZmKf6aiaFuLYl6R64/CtoAOD5tES5Z5ajZsSVdUyUdkxiY+7YIm+sAEMBv3CD9jzHWWrZf1UCq3y4sR53FLeAmolO/7B76/PfsOCrz0yuxiJyq2Iv/EVsxkG3s3xhO4vXYP2qiEDVscj+A3KiN3Q8MZqR45xQC8S3PjDi+n4WaEGS9JWzOmcYrMcCqDaNIdYzMmtXp7p3PYnaJMY71Z3R5ON2tt7Hb9Ox7U8IY3YDu3gCIQLRFRkKgibpnTQVwwfqwW5DnAIhHnD7unPvnQ5wumFwtdrhPMxivHegNsAXXQe5u+FfYYkHwYtaW1Gm2B2h7xgnHrt3qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(136003)(396003)(39850400004)(376002)(346002)(33716001)(6496006)(4326008)(966005)(26005)(6486002)(85182001)(956004)(8936002)(8676002)(1076003)(66476007)(66946007)(6916009)(66556008)(478600001)(316002)(16526019)(2906002)(6666004)(186003)(5660300002)(9686003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: uED3n24G0RmCfxubYi1YGEJucgCLOMTHm19pqrc0Rn+WpsPAO2picLDuJiCNi4/3UUekW3L+vZv35cp7CgcnD9tYs8faMmHA/MaQCCVwUue6DSxenju6jtobwxDNHVNHmSq4XEiUrC/MrilKwEwOlh3oA7a5juJJC/K9iGn0GFuZK74XRlSmhMD+MSE0Nqpib0SfmfAsz8ocsQ8Ypx7UE+XyPCODEFStHpH0hnigajSicB1uQRghlW9mW9iQzRHz5IHD5612ZN648WDm4oOC4jxFa5koZCd3P8/7isEr0IC501X2KWYE6eb8vLOsQMXy7dWp+YPt8/L2Y7oUg+eQUzu/7fNi1+ABt3eeMvjxPdTCMCu5QgYuzGzzz7Gtg9niIp3FPA0LYF/gW4b3Zcn9n8v62J46xjaOM9Agw7AxBYv3AjUWQNtTMQnSUnRjFee+B4WUNHwgsAeRJtMlvLtjKKHnpHQQHohAy8MQsZGCOrG7TfB5kXS6JptQIRiG/ZiP2NiIM5Adm1N9E3UJhnSAOq9LwzmRLdRRes0mgppPwT58UJXCMxVDXMYCWx81pKY0VGpSdGVGz+bh1YcbQF+pkLYIQKgCnLZtKMf5+HTGqNoaAEvwMnGcVAs770WWI4Tfp5PcIHrr9eIGKMmE8LrY9DdbnIN9D+eHvRdGxTMPRz7HlC0xBOlr9GOvaa49txsfj65fcPssp/tdWZxj07fGJLi07jdA/4fACHl5RV2gANZZvCw/1w7vIVH699RnM05T0r9QXldmpFyU8WvDmuweUD45B0BWU3qrLqVBHdy7Ffh+PmTOBVUvKF5Bsd5qbMLBad/6uNLdoGfGv/40z9afu7BY+D5c/kld3AtTOgIREcd4gNzzfhdFnMoxQoscKy5K3smpVxA+zXzVTIa/lPLVhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f0d76b-b283-4380-589e-08d88ba8c85b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 10:00:30.7052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJHhzOCZDLtbKgFddl5VDXVKHi9lkQ7ch4ZAJAKeSHHhxwf25SWIdqZD8cZ+W1NCK94U0ec+9NCcKBKEoGMthw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5065
X-OriginatorOrg: citrix.com

On Wed, Nov 18, 2020 at 10:24:25AM +0100, Manuel Bouyer wrote:
> On Wed, Nov 18, 2020 at 09:57:38AM +0100, Roger Pau Monné wrote:
> > On Tue, Nov 17, 2020 at 05:40:33PM +0100, Manuel Bouyer wrote:
> > > On Tue, Nov 17, 2020 at 04:58:07PM +0100, Roger Pau Monné wrote:
> > > > [...]
> > > > 
> > > > I have attached a patch below that will dump the vIO-APIC info as part
> > > > of the 'i' debug key output, can you paste the whole output of the 'i'
> > > > debug key when the system stalls?
> > > 
> > > see attached file. Note that the kernel did unstall while 'i' output was
> > > being printed, so it is mixed with some NetBSD kernel output.
> > > The idt entry of the 'ioapic2 pin2' interrupt is 103 on CPU 0.
> > > 
> > > I also put the whole sequence at
> > > http://www-soc.lip6.fr/~bouyer/xen-log3.txt
> > 
> > On one of the instances the pin shows up as masked, but I'm not sure
> > if that's relevant since later it shows up as unmasked. Might just be
> > part of how NetBSD handles such interrupts.
> 
> Yes, NetBSD can mask an interrupt source if the interrupts needs to be delayed.
> It will be unmasked once the interrupt has been handled.

Yes, I think that's roughly the same model that FreeBSD uses for
level IO-APIC interrupts: mask it until the handlers have been run.

> Would it be possible that Xen misses an unmask write, or fails to
> call the vector if the interrupt is again pending at the time of the
> unmask ?

Well, it should work properly, but we cannot discard anything.

> > [...]
> > On a maybe unrelated question, how do you setup the event channel
> > callback, is it using HVM_PARAM_CALLBACK_IRQ and
> > HVM_PARAM_CALLBACK_TYPE_VECTOR?
> 
> Yes, the code is at
> https://github.com/NetBSD/src/blob/f9a54eaecfb47bce597f72f6cae8861f4d486eb4/sys/arch/xen/xen/hypervisor.c#L457
> 
> > 
> > Are you EOI'ing such vector on the local APIC when servicing the
> > interrupt?
> 
> I think it's OK. the code is at
> https://github.com/NetBSD/src/blob/f9a54eaecfb47bce597f72f6cae8861f4d486eb4/sys/arch/amd64/amd64/vector.S#L770

Yes, it's fine as you also have support for the newly per-CPU vector
callback which does require an EOI.

Roger.

