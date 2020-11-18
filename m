Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 801412B79B1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 09:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29524.59019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJHk-00016y-MF; Wed, 18 Nov 2020 08:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29524.59019; Wed, 18 Nov 2020 08:57:52 +0000
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
	id 1kfJHk-00016Z-J9; Wed, 18 Nov 2020 08:57:52 +0000
Received: by outflank-mailman (input) for mailman id 29524;
 Wed, 18 Nov 2020 08:57:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4dya=EY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kfJHi-00016T-Q9
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:57:50 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64f7b839-0192-43fe-bfc3-a9e6fc551746;
 Wed, 18 Nov 2020 08:57:48 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4dya=EY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kfJHi-00016T-Q9
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:57:50 +0000
X-Inumbo-ID: 64f7b839-0192-43fe-bfc3-a9e6fc551746
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 64f7b839-0192-43fe-bfc3-a9e6fc551746;
	Wed, 18 Nov 2020 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605689868;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8p1jbKECG05hKPmf6OWYk4c/EC4zZYo57jRnvqOXXUI=;
  b=X3Za9aYnp70K01uzcHg94G0D7FuwD/twi5K+iOPllD79/HzLz5Xh5Xf0
   9hUZG/FGlTAXSOCOGgw9KUvWc7ssPglFXBgLiFuykFo0NP9lFwh+lUpmU
   dRo5irTBfva950x8sldp100Gdf8zSW0ZX+/5xfE0tHIHZMUXk7g2SKC6x
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: a2oQwtXcury+NJZQnQ7pVs1ZV5oxcEWUcD96KIWa5dxDZWOi1qk79yiAK+aoAqmdmlVGauPDQt
 FXkgargbkQmgm5JgFrYvHD83jz0AAuzA3Jz01ByAXHlQFo5iuFtgspZSkq1e8f3xJwdfVDc45Y
 7K1oOvGa/eh4+5POydf0POk5whYWAQRaVjDhJvX2iDrS+aFHJa2o4feMzOFLFm1deBAc7hJoqO
 7AIcaZgpfvj0cDdvJefRel5BiQFNUauKPo8M96tq2gS2xA/RXRoDefrmdRfetNwEEPE7dxrcjT
 XUc=
X-SBRS: None
X-MesageID: 31380212
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,486,1596513600"; 
   d="scan'208";a="31380212"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRjcTJFbVnlFs/oF0VEbwF9Bnpd071Dj0N+PkunByx/HHPzdYHIt+QOoO/xDfbzQ/YHuTdLhf/D56nb8wk2hOa0TUI6NCPLbrpaBPFAyfZHB2xM5ey0eJK5j6x29MvjPWnb6Dm8WVgDE1iDxsWV9taXcdWWCCUPmAbTYMyaJoWt7vZBmJD9ZQFt7lwr+DP0Gw9vbIhktolNoio4sx42mlzJVmvdthZAMbC+5m2Dap4PmzNLKbBaeExkExlcQLKFMkYnuHzM/CSxE30liifDlPKzKOL0wfHv/49mVCNXRELI+hp7BqNMPWpMJUgp2DdRREJhtvnFA3w1NtZ+sPzhE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIKlsQmdtLHf5IqZKe8dJqMJBLrKcdtfuwQUc3PNPI4=;
 b=PtYBk+0yTdwHGZNgkhEZlDwFKMGSxzVHhm1P7PP9Ku+C2rIg3F/7L7N2WNAeiix1sJgF1PmSXrltufbpf92SlLXWhbqXV2vUtmiTKu/Vsg4uaWIpWvaeUw3oQIMmjkB2Al7elzOCKiOLYrQcBK2jwvf4eBlC4NApoutPdGa8FDA5+INNxh7yVnW88l2JRvlPjszomZTqGUyJmT2wTWPc6V1l/E4dL9QVR63Zbv6EkqYmK/zBxsTD8s+X3K/atYs3dMc/RWaFExGOKMlRkFgxRhXm4lCGddEq5b7bqyZB1+uPx1ZEeVABriZ+VoDi0SoAUQNYu5BUeBwfrV0BUd6dEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIKlsQmdtLHf5IqZKe8dJqMJBLrKcdtfuwQUc3PNPI4=;
 b=iv8GF6mTyicjuzkVcdTF0322jjzLP2q8KcbV386Q04/CGoqmcP/zE+yMHMrUdyDpRFUloC7qVinPmHTC4DpkNMt4O8P26pB0TQ4V8JpVZrCum14HDDdrs5v0g9b/3WGpWOc2fvg9LalgjACpt9gxa7z6Gg7Cqjyq5PB/PUPOLm0=
Date: Wed, 18 Nov 2020 09:57:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201118085738.wpnfmjagxjf6cofp@Air-de-Roger>
References: <20201117150949.GA3791@antioche.eu.org>
 <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
 <20201117164033.GB3093@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201117164033.GB3093@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0144.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5b55284-52a0-4f09-15e0-08d88ba00390
X-MS-TrafficTypeDiagnostic: DM6PR03MB3916:
X-Microsoft-Antispam-PRVS: <DM6PR03MB391674D29A01E06EF1F9EDD78FE10@DM6PR03MB3916.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +/0Y/dl5/oFqKccUPKsaQwtIewof6oaxqlrSchR1xgQ76C2TS6tLKPl0sBLAPcDAoL9TY2sVjckonudK9yclbm1gMtr9hqJgHDSyHCc1I7pUE+B0rbo6pwFE3cO5UpH9Tw8Fd3h9PxZjZo5wJVhX8HvYuBZ7+maSE4HDB1/UclJqIoKFEOLvpmVsTInaKLuvDrpPGwT1nip3fC8fzpr1YiyqOPCbTsoj7+u1d1cjlm5zWfcwki/Y3VJFC3BFqx26a4lywPdJsLncE+RVOBJPoCOWVFEE0yXKJX7IgG9ibpodROWYVLNAnj3PXzW/LEWTtXwyed8+CxcUOoqgwTZn/Rojk3d9pdJBELDobXiswvpKME1JZD5QkNEnhNmdXQsSrYE85xFL1d6oHAv5MclPTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(396003)(346002)(366004)(136003)(39850400004)(186003)(66556008)(16526019)(26005)(66476007)(33716001)(85182001)(6496006)(1076003)(6666004)(66946007)(956004)(5660300002)(478600001)(86362001)(966005)(316002)(8676002)(4326008)(6486002)(6916009)(2906002)(9686003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 0RuYsOKePLhOmB+Xkt750O5M6cGihm2Gu9lfZoA3FiP8NppMg1HpZl++gKV/0IIKhPezPxIZY9ahnW8M24UqAOyCC0qbwBpNzN0us3nUcAowUQamcZEMPICuidGCrbvo3eqI1Wpm1hhC8opHkH+CiLgpQoeneFEGuNPQKFqGHg9Ovzkj535QhEJxhATq1mUGOjUhNyIHkMWr4gwP16ZTo5WqSWM0slsVZDGKYP+6yx4C77nvqf8g4kOtK/7lWL6jG3/1bxnYMft3rL+UCzBAIQhBCwnX5O4SIPUinFvcgPjBTZh8krwx4StP1lovhL0XG76i+Leh2YnkPEslu8Rx/6J6qpsGEgXOSIGNMo7dxcmC4Nq+kgXmDn2LyqwrvNKhbtpyo6IxaoznlkyM7WAErEzQmhcE65V5gxOJoN44hRE6KoQpvh9kF149Q7WFivmzftyjVwKNIfXT14h30fHd+Zam/fewj3Izz5udIqCX3WvXO9mNI5SKVif2Ky9mtAvsLM5qianKIGlDlnM0V5ePyveqJcQgEEPrW4kvdUqo7LMx7DVTGMcWIhAOIjZlt31FZ601FueeTpD4zhjwaQoQIHDCGXAjUttN4Zy+1OmmpVLT91ph0e258nRPcJwDI2KcQeohz7hKfk38J86nNd6PHfqd8q3+6se/bjlA1HZpVTFmXNKHUEUYYf8VXVpr2MlNEzpgrkR7HN+AusaLkkgeE7EmTqt9OOSORVdpSszS/mg51iACNOr88j77a1TqcWwKuekJA31kR5axxWJoHFSlOYaWdcvZDQM/0BnD2MHGMvCrILYDiDm9qLNiyfKH6AVfSy8hLnl6qCmAUgqdqfNgkCk71yrgYuQV3Iz0HTkQhJ/EASxq3Pkh7KrdLMZROvXPgMOxT9nIxQpraQ6GEI72Vw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b55284-52a0-4f09-15e0-08d88ba00390
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:57:44.5798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwTxbMf0qstXgou0pmxN4iswVh0C/2ZkzveoDATI+jiyzD3aY6UpiIyyn8pMbpid3ee6KIHFO4doPEQ413kb3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3916
X-OriginatorOrg: citrix.com

On Tue, Nov 17, 2020 at 05:40:33PM +0100, Manuel Bouyer wrote:
> On Tue, Nov 17, 2020 at 04:58:07PM +0100, Roger Pau Monné wrote:
> > [...]
> > 
> > I have attached a patch below that will dump the vIO-APIC info as part
> > of the 'i' debug key output, can you paste the whole output of the 'i'
> > debug key when the system stalls?
> 
> see attached file. Note that the kernel did unstall while 'i' output was
> being printed, so it is mixed with some NetBSD kernel output.
> The idt entry of the 'ioapic2 pin2' interrupt is 103 on CPU 0.
> 
> I also put the whole sequence at
> http://www-soc.lip6.fr/~bouyer/xen-log3.txt

On one of the instances the pin shows up as masked, but I'm not sure
if that's relevant since later it shows up as unmasked. Might just be
part of how NetBSD handles such interrupts.

So taking a look at the information dumped:

(XEN)     IRQ 34 Vec 81:
(XEN)       Apic 0x02, Pin  2: 5vec=51 delivery=LoPri dest=L status=1 polarity=1 irr=1 trig=L mask=0 dest_id:00000001
(XEN) ioapic 2 pin 2 gsi 34 vector 0x67
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 1 IRR 0 trig mode 1 mask 1 dest id 0
[...]
(XEN)     IRQ 34 Vec 81:
(XEN)       Apic 0x02, Pin  2: 0vec=51 delivery=LoPri dest=L status=0 polarity=1 irr=0 trig=L mask=0 dest_id:00000001
(XEN)   delivery mode 0 dest mode 0 delivery status 0
(XEN)   polarity 1 IRR 0 trig mode 1 mask 0 dest id 0

The state between the physical IO-APIC and the emulated one seems
consistent at least.

On a maybe unrelated question, how do you setup the event channel
callback, is it using HVM_PARAM_CALLBACK_IRQ and
HVM_PARAM_CALLBACK_TYPE_VECTOR?

Are you EOI'ing such vector on the local APIC when servicing the
interrupt?

> You'll see that I did hit 'i' 2 times to get the NetBSD kernel to boot
> multiuser.
> 
> > 
> > Can you assert that you properly EOI the vectors on the local APIC? (I
> > don't have a patch to dump the emulated lapic ISR right now, but could
> > provide one if needed).
> 
> Reading the code, I think it's OK (assuming I properly understood what
> you mean too). Wouldn't it cause problems on real hardware too
> if the vectors were not EOI'd ?

Yes it should, just wasn't sure whether NetBSD would use the same
handler code when running under Xen.

I was mostly asking because Xen has a weird semantic with the vector
callback when using HVM_PARAM_CALLBACK_IRQ, see above.

Roger.

