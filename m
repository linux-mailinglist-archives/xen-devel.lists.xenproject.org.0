Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEFD2F4BF8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 14:11:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66495.118121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfve-00019K-If; Wed, 13 Jan 2021 13:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66495.118121; Wed, 13 Jan 2021 13:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzfve-00018v-FX; Wed, 13 Jan 2021 13:11:14 +0000
Received: by outflank-mailman (input) for mailman id 66495;
 Wed, 13 Jan 2021 13:11:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nR66=GQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kzfvd-00018p-0l
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:11:13 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 428cfae7-f51a-4d9a-9bac-caa144305c35;
 Wed, 13 Jan 2021 13:11:11 +0000 (UTC)
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
X-Inumbo-ID: 428cfae7-f51a-4d9a-9bac-caa144305c35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610543471;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tKMMWSylrVgXiU2MAhDLL+hJ+gVdxxrSC6DRlviiTsQ=;
  b=N97azVUU/DMBDp0ytCBz4yiBpvHMBWdRFvgvcNfQET5s/r29ZsBXijBd
   pGQni/B2KwQ3QTzxLNxdWViHIBSRh79OCCdB2E9Qt4OUpRp20ypl05fMn
   4DOe0Xk/2UfxzCyO9aHQxZW4cxM/UpE2zOzGtIr8r9H+Rfi9mFybHtruS
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 52FpCBmqnwjHpmKdIcBfqijEASD613Qi6iHYgMTJCuEermEkPAQyQpfdR0KnKn2HBblpLmDjA/
 Czw41dtGYpEvPd5nXBLtLvHD/zgP+H5CY+7HlB4zvknnabeV8higqvdXK6H/nj6XHDg28cWO4x
 a2f/pZ2T59b732IKjyWEFhIRheawpyd34h3nNSP0DjLiNmQq15OqgXEGhgtTBxB5+P6YKFxsBL
 iW0JvYMv8u75SgeflwSuLL0Hul92j80EdINrrP25QLh/I74rdWeofkmMHa4gXXvoAWyCD7LCZK
 4uo=
X-SBRS: 5.2
X-MesageID: 34986811
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,344,1602561600"; 
   d="scan'208";a="34986811"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EshERDNc3KoN89ar/cvufPTA8LPCre8nXIBd0UW8LJ/jSXRqLCN2Ru3ZTzL6EO+F1hmVxO+mHLZb1D5gbE4ZRXqRGx0PYkMRBzWWPalVk2nJkIO5VpnaX1dJYQBGxGG6EzRnKnQejGVEvjsHMyjikV96yHSIh6AYAQbDoAkARfkT9liVmzQZxea2MiuNghHdhoYKyh1DXSwsl8AAA6kLjL3L31oEG0zNrEShioDywBVvdokDhvFkDNJ72YR0YrrmxloHyACs/nca6Szd128BfIL8BEPRTDhhgOfuNn8ol06GZuaRmUobaxa5yV1wYoQ38wRNptvK/6+8NLrruEK0DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/AOWbh+OIpUw2RgLNucpUtTGLIMnXCQN7+S5oqLRaw=;
 b=OZSu7BWkuxEAyyiWGeoW6Jz/QPVBEyaOqRSuqEjm+h+lk2+k71YdqcMnrs/IJHJc0Ifg5BQ1PM1KdWB63BrrVmIWQF+BOCCkzaV/7yTxfymplDfmVqamut/Bw+EhN7XHUUsN3KjO2RiViMcKkOeL1pxQHWxNPzGeW1fN8gbuijs+pJECwp5Y9Xhvha7LcDtu5ibJb5/DpUOi/nJtmkFM0CqocqtdVPXyJUZU/kfFkn62zvbh42druLGKeGnHWXy3VdBUhO1lv6NlgKB+yK9nv2BfeAy2VV8C6NMGzkkCDNTwYEmCKY2Kl5RQv0eeXmiV8Y08nRTIw61FsKTMFTj7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/AOWbh+OIpUw2RgLNucpUtTGLIMnXCQN7+S5oqLRaw=;
 b=nv1HIge1iN+2O9rwGK4BCyyu6bU5S16wgKjJHuNkK2J0voWaOvYgpHd9TmSiOGhXZSlMK5ePBFikHmQCuTeI6YEq1cOB41RZHLJF5mZnnatS2jtcV8c4/9fEB7maO+Z77LFW5HNpeBscyVzf2YvKflqDGjcRrUrUy6xcNfoWONo=
Date: Wed, 13 Jan 2021 14:11:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
Message-ID: <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
References: <20210112173248.28646-1-roger.pau@citrix.com>
 <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
X-ClientProxiedBy: MR2P264CA0110.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2b98c8e-cc7d-4289-7f99-08d8b7c4afd3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4395:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB43950BF37972B543D9D477AE8FA90@DM6PR03MB4395.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 24NiZuNJfOouPR65Krd3Caxymv20N/jb2emySeuePGSBy0/2lQWy47xWtTtmyrMD0qaVOb1QnXoopmq914hPo2wIRrQXyZ8NeiZaKShMMteJyWBn+WzJ+IeSoi+6AWFUr5737D9QIVAsP94IE91tiipEZU2vO+u7H9ZGurgnZnrwThMnM7nZ7NLSWGVnfj/ueYYvt954iJyHG+VylTIGj0hPeTYqygA6ZLFuysc3mfXIb8gOLmlfoBAyI3lT7jFISyWQFcEq+tzYzMQVPHVV0Z9N3FDuY/5sNB4PBvetHQE0KY1J7jqHwlH9LuYzlI3SQYNKzF3jNrhbfjhDeHJ8J6JhKiAUlYjtjke5xWPSaiJ9TnC+afVighXQo1KPAUWq5gayMgXiplxqoEjceYYk7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(346002)(136003)(376002)(396003)(39860400002)(6916009)(5660300002)(6486002)(956004)(186003)(83380400001)(8676002)(16526019)(1076003)(26005)(66556008)(4326008)(6666004)(66946007)(66476007)(6496006)(478600001)(33716001)(86362001)(8936002)(2906002)(54906003)(9686003)(85182001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Skl5V1lvZWFMdUEwMXBDYXVxcjdaUXNPOCtOQlpFV1Z2alV6dG4rTUVTV3pm?=
 =?utf-8?B?NUNqWmY3WWhkVi9vOVRtK3FoTjVpeXIvUThEUjI3ZFB6TER0YWg1aTRjNzZ3?=
 =?utf-8?B?QnZnejFFVjNaOGFVL2Z4d1ozN2NEdzNGeTdHUHZndnlhaWxtNzZwMmUxdFdC?=
 =?utf-8?B?b3Uvd1JvRjNYMFk4b1M3VklrdDhuYkNZNUFzSW5NRytHVWtudjFUbG13VWFh?=
 =?utf-8?B?ZDdQODI4YmlGWG5rUlQ1OTNmM2VqMmZpYzEweUlhU1JXTGVtWGJya1dRQUJE?=
 =?utf-8?B?MEJCY2FIdFNpOWJjYlh3VkZybUlRa1R3VTJ1ZmpSZHgxZ2Z6YzViNDlmTXJE?=
 =?utf-8?B?QWxBeTVwSDhyMW80dTBvTjhVSDNTRXhQK3U5akIyWmJaNzg4b2t3dWxWMitp?=
 =?utf-8?B?YlJCVXBBcktoMXVib1B0ellxcWlTcTg3NnQyZHJpSkNHNXAxMUZ0UXRBQlB2?=
 =?utf-8?B?YlRmRERSTHU2VmFiTnhqYUM3aXJCVVAvSkhndU5iSkNhVmhCL3dscDAxRW0v?=
 =?utf-8?B?S0hHVld3RFE5QzBLQ1FlNUt5c0pPTWI3RU43TlN1NGtXYUlENkRlRXZrbHFZ?=
 =?utf-8?B?a0JpQkRuaWxBaVFoQWd6UlVLaHhWaWVrY0tLQTY3ZVFTWHVhV0t5N1YwQUNO?=
 =?utf-8?B?WXZHcVhDWmdiRnRSa1hFSnplV1Y1YjR6YURYemxIV1hkRWJ3L3RDK0xOL28v?=
 =?utf-8?B?Z29rdTVYbDNkYWZaWVRzM2FRb0RwamZLREVUWm9PcitRd0JadEY4NnRDM3Js?=
 =?utf-8?B?aW45a2Zadm1sQnpSbjUvY0pYbVVrZlRqVEZmUnhPeHptRWVYajJtQVFTWEo0?=
 =?utf-8?B?M2VMUmVZUEpIMStDNStLQ2Y2VTVBcy9jbms1VFhqS29JdTUxcWo0MUxwZlRF?=
 =?utf-8?B?QVVJUzZ1eWpTSnpKYmdtZzQ0SWdWOUhBaTZHeDJLcTdzQS9XNnBSTHRxaU5O?=
 =?utf-8?B?Q093RC8wU2VoOHdUYkQ2T01JbTJCS0Z6eG82NGJERkptVUM2ZUszOWJmZ2FU?=
 =?utf-8?B?QnBtOGJKYWw4cXBxUHJPRmJKd0V4ZE5tdHZtc0V0VE10ektNUllLQ2VKaDlF?=
 =?utf-8?B?VTZhby9BeUF3dVBRNFhqN1YvRWN2bzlwRnBEc2xwMDFUWklHZWNaZUh1Mmhv?=
 =?utf-8?B?cytJUTgwU2JpV0V4b2RwM2QzV0VRVUJydllMSXFHajhuZitBV1hDUEFLaVU4?=
 =?utf-8?B?ZVM4SFI4NTREbE1lVEtZTGdHaExGWmc0ZWtMa21Yc0FQenVpZkJNVTcvbUlX?=
 =?utf-8?B?a3BEV25sVmF4RHphRGEvMndQazNwb2xvTUZ4cjZOaGcxaDJMUWlqWGl4Ulow?=
 =?utf-8?Q?muJukZEXIdfm8A/EmLMXZSnQUuYLDItMyb?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 13:11:06.3525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b98c8e-cc7d-4289-7f99-08d8b7c4afd3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaEkurnKW0B2TSuH8kO6esJP1su5NQennH7aHhQyqWkZMH7Gn8vzOeH7h51hkk3C8K1itnIGsFUH2mVE5bQS6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4395
X-OriginatorOrg: citrix.com

On Wed, Jan 13, 2021 at 06:21:03AM +0000, Tian, Kevin wrote:
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: Wednesday, January 13, 2021 1:33 AM
> > 
> > Current interrupt pass though code will setup a timer for each
> > interrupt injected to the guest that requires an EOI from the guest.
> > Such timer would perform two actions if the guest doesn't EOI the
> > interrupt before a given period of time. The first one is deasserting
> > the virtual line, the second is perform an EOI of the physical
> > interrupt source if it requires such.
> > 
> > The deasserting of the guest virtual line is wrong, since it messes
> > with the interrupt status of the guest. It's not clear why this was
> > odne in the first place, it should be the guest the one to EOI the
> > interrupt and thus deassert the line.
> > 
> > Performing an EOI of the physical interrupt source is redundant, since
> > there's already a timer that takes care of this for all interrupts,
> > not just the HVM dpci ones, see irq_guest_action_t struct eoi_timer
> > field.
> > 
> > Since both of the actions performed by the dpci timer are not
> > required, remove it altogether.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > As with previous patches, I'm having a hard time figuring out why this
> > was required in the first place. I see no reason for Xen to be
> > deasserting the guest virtual line. There's a comment:
> > 
> > /*
> >  * Set a timer to see if the guest can finish the interrupt or not. For
> >  * example, the guest OS may unmask the PIC during boot, before the
> >  * guest driver is loaded. hvm_pci_intx_assert() may succeed, but the
> >  * guest will never deal with the irq, then the physical interrupt line
> >  * will never be deasserted.
> >  */
> > 
> > Did this happen because the device was passed through in a bogus state
> > where it would generate interrupts without the guest requesting
> 
> It could be a case where two devices share the same interrupt line and
> are assigned to different domains. In this case, the interrupt activity of 
> two devices interfere with each other.

This would also seem to be problematic if the device decides to use
MSI instead of INTx, but due to the shared nature of the INTx line we
would continue to inject INTx (generated from another device not
passed through to the guest) to the guest even if the device has
switched to MSI.

> > 
> > Won't the guest face the same issues when booted on bare metal, and
> > thus would already have the means to deal with such issues?
> 
> The original commit was added by me in ~13yrs ago (0f843ba00c95)
> when enabling Xen in a client virtualization environment where interrupt
> sharing is popular.

Thanks, the reference to the above commit is helpful, I wasn't able to
find it and it contains a comment that I think has been lost, which
provides the background on why this was added.

> I believe above comment was recorded for a real 
> problem at the moment (deassert resets the intx line to unblock further
> interrupts). But I'm not sure whether it is still the case after both Xen and 
> guest OS have changed a lot. At least some test from people who
> still use Xen in shared interrupt scenario would be helpful. Or, if such
> usage is already niche, maybe we can consider disallow passing through
> devices which share the same interrupt line to different domains and
> then safely remove this dpci EOI trick.

So the deassert done by timeout only deasserts the virtual line, but
doesn't for example clear the IRR bit from the vIO-APIC pin, which
will cause further interrupts to not be delivered anyway until a
proper EOI (or a switch to trigger mode) is done to the pin.

I think it's going to be complicated for me to find a system that has
two devices I can passthrough sharing the same GSI.

It also makes me wonder why do we need to keep all this internal state
about virtual lines and assert counts. Such virtual lines will get
de-asserted when the guest perform an EOI of the interrupt, which also
clear the PIC pending bits and allows further interrupts to be
injected. Wouldn't it be enough to simply try to assert the guest
irq/gsi, and let the interrupt controller decide whether it needs to
inject another interrupt, or there's one already pending?

vIO-APIC has the IRR field which I think it's fairly similar to what
Xen achieves with all the line logic: prevent another interrupt
injection until the current one has been EOI'ed. The i8259 doesn't
have such field, and might indeed end up with an extra interrupt
queued in IRR while there's one still pending in ISR, but I don't
think that would be harmful to the guest.

Thanks, Roger.

