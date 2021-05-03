Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCCB371806
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 17:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121695.229518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldaV2-0000DG-2y; Mon, 03 May 2021 15:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121695.229518; Mon, 03 May 2021 15:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldaV1-0000Cq-Vl; Mon, 03 May 2021 15:28:43 +0000
Received: by outflank-mailman (input) for mailman id 121695;
 Mon, 03 May 2021 15:28:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iacE=J6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ldaV1-0000Ck-7Y
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 15:28:43 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82232526-6643-4ab7-a553-bbd658b7cb7b;
 Mon, 03 May 2021 15:28:41 +0000 (UTC)
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
X-Inumbo-ID: 82232526-6643-4ab7-a553-bbd658b7cb7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620055721;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=plHT/ZbeA2q4S8yeyFDmeWxNsyplZG8zxUVEDKzOtEo=;
  b=X2juJqqwBA9XIe49DI6z0U+7QbkoQgy8eY9MeFAi8SY+qoXqFrxRvp0f
   PjNRQGPnMDMvq22x2vaSmmMpYiZl/gTF8QjfjLk9PRPmrygnUIly9RVSG
   c7Ee7OnhHogg5KBHO2sTAMbCUPIGWDmK4YSu4kQoH6bG51SNytXupBfAk
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sDQlIzEfZ3vCDX/WOgyflaOEnAEMH5Qa1Z3iUmO9h04GBVwLe+NB1JpORXuEFcUijyjOZHgS44
 NZI28NWPh6+bb/Ov/fdw2MhAsGECzwc6hLBt/1UOLxtQFAnPtuVYSzw5rmC9CNpPPdU2joNVRO
 NnQrH7ZvE74WBLDjtfw+PgHgFgkZfU4TMbEaMt42FIe2zK0WMx2zvqL1JzAp2yQGMsYhRiOqx2
 bOIcrYUjVy549SYNw1pVVKLPTsX3WvOh8S15foMkkiz1/CV7UN3WYv3HxIY/hdLmp4dIOVj9nh
 Dp0=
X-SBRS: 5.1
X-MesageID: 43331329
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
 rE6kp7y3OEo/SGN72A
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="43331329"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZcZlzw84weuAw9tVkhfFQPBKZCMw2m7S3OmByeWaTiIYMVKkGp/x5UlfFRSyZ2AxIZeeVLoEpuy0yN9fRsKgEHsgDR/u+BrKnzTnX2mvUTdog2i4jho1lxBGd4gioxOgUsiak7B55yxiyJXpXvsia0YQc+ZCjG01XQ1RoqH2lm6SmE6ps74yeuc+C5LecZtVz+O7uo9y55c1RnQisBHRVpVVfd5D0RbEJQO4LvHRIWj73FZu4SZ+gQg5R5NJK6llafRYXnx7hyH8YnbFKbIOf9yty5MRnSH7TfeM/rVJRc61k3OcmUBci8APyoufg4+mb6jLSuMizd0suqg0D32kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAMc5hSBMfRqYV0YGowPbt7DF330QlwFYiNWmD4EVMs=;
 b=I54hWQauDjOnnzFZXsLHxXvxYYyYPjFht9KPhIZTOWZJAMIETDixfQQIvJxYr4SsRd41xI8sQIPMoqOb99o0c8+yIH+pr8QjxF2Ymf2Bw6kPCJxYh55VsDlulo+icTxF056TooOu4moFw/VyzyOfkeSAbmSAPCwxpy+VhLcJjS9Lc4xn///GMZegjgOevbOYzbS7r9FBJzQ9sHhIwFicMpdotO3lwORiEuoKFaTbrYsjrUNe01VMlzMHQg8uxOt+OIHSsa8dtDOouqyOupgEwbblViJ1A7ui1H8B3V24us6m4QKzL21fVIwhnr0Dx7WczZ9wrywXOEKh4R00iF9bUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAMc5hSBMfRqYV0YGowPbt7DF330QlwFYiNWmD4EVMs=;
 b=c3H/cyWq560CEJgI00gEVJo8fA6lYbSf3f5gbKPOQ3dIOOr6EGGmngopLALN45X6ntR3q5d0IQ6qxaS8wDSH3aIiYY6qsgizBdy4UCwQLhKEdwzRT3ZJvKz7T7lbTRz2vYTx6ogt4PlWomckwUK2+KElZ+UR64if8sEG4fnRRXo=
Date: Mon, 3 May 2021 17:28:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 01/12] x86/rtc: drop code related to strict mode
Message-ID: <YJAWmGCtaTktGRG0@Air-de-Roger>
References: <20210420140723.65321-1-roger.pau@citrix.com>
 <20210420140723.65321-2-roger.pau@citrix.com>
 <f282a2a2-e5cb-6a65-690a-b9c27c03089a@suse.com>
 <YI/CSKpqWrilNKi8@Air-de-Roger>
 <5b06565e-1f2e-3498-c18f-e7eac0042761@suse.com>
 <YJANG3LeuA3Ygt/Q@Air-de-Roger>
 <d8ed89e8-d13a-9ed6-e92b-fc7072b8382e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8ed89e8-d13a-9ed6-e92b-fc7072b8382e@suse.com>
X-ClientProxiedBy: PR3P191CA0058.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b2097a8-0f7a-4668-6f44-08d90e481d4a
X-MS-TrafficTypeDiagnostic: DM4PR03MB6000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB6000190FDA8B8D3E15FDA22F8F5B9@DM4PR03MB6000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qkdZyMG4zJSaUvDkTjN3uSI/k/86NgYzZT5iEpUMa8E/kDb/xZepBpW2/MCqRaJ04yYwyvJx+UKCPhzhG0f2+S8xnalEbG/epkSDeXAl1l5xmvO54jP4Am//Q6nspRvR6gd755i9eVMoyQRiP4deY6Gz1ie9KicGTcLjwx/xLBKaSfGHwvgqwJRIaLPommrFHWQdJunKOFwseKB9Crp8ArFhyYJR2ag0j6+IzABO4vaHUx2p8osLJSSJjYLMYJkzIZ1Qk5Evlo1Y1EBG4xs5ezwI+8lnPx6UrUO5nmMoPoITsaO77aTJhLILoUoQWy51VOtXpVHUj3kjHdfmheczJS8iRKXOi8+ibf9bgJVV48PXDtx/GkdQE0oAbkIy8tHlfLSEcw2HTp6UepkHRFcS41fAqftYsOe/HYDPEvCepu9VSxq276hgCd0TowELrSLkHJIyZxJ1DAFwQsoqvB8Huxga8vQRHlMiHACmzVu/8xlGtb2VPDfjdHH2+5TLt/jY7VeQpQmqmLjpCEKaRy4f/ptVCaoxa4hvAYNgnH7rKoTq845QCxVmxgdJgVMX5kX0vW7y+ZA9BtFWCAMEEMy44GOgvUzgWaZghDaDLDIUp5S79EB5CSDOASoz5ECBZf8JrcExRbsalJy0a9kAJsCion6O/27Js0AXn8DsHGYqCuE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(376002)(366004)(39860400002)(346002)(38100700002)(54906003)(33716001)(8936002)(6496006)(5660300002)(8676002)(316002)(956004)(2906002)(86362001)(478600001)(16526019)(6666004)(26005)(966005)(9686003)(53546011)(66556008)(45080400002)(83380400001)(6916009)(4326008)(6486002)(66946007)(66476007)(85182001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M25IRHYvSVhxM1V6bHVnakZXZGtOUkNWWklHUnJkdGJHOU9RenJyeWxVZ3da?=
 =?utf-8?B?VEdYdjlqSS9rMVVTeDRSYk9MZDAvVVNZS1o3amk3YXZ3MjdVd0ZwckZHKzFI?=
 =?utf-8?B?cndhRk9NNi85eGRVdlR5RTQwZ0JuOERUdTZsUlBDbWdVVEdJWVNlUjRYMVZZ?=
 =?utf-8?B?UWhFSFdBRWhhMVdxV0J5b2NOVGtQWnRXL1VEbzR2dUo5NzMyS20vL2NFNkc1?=
 =?utf-8?B?SVRQK3ZFa3QwM0pia29heDhkS1B6bHQ3SzhsYkN1UVJlQ0JkUnRwRnJOTHlh?=
 =?utf-8?B?V3pwT0dmanBHNGVBbnFPTGVFVk9tK1JGQ3N1UndoZC9GeDdncThRS0M2SVlr?=
 =?utf-8?B?b0hiSHg2VzhBQTFSTzh5Z1FLaFB6TWxlbCtKQVJiY3B0UmFWbGs4YkdFWkdE?=
 =?utf-8?B?R0lsUk5JTGpKWFZoMU5xYUJzRzJBS3BXVXNlR013bGhmcW1UUTJnU09OWnZK?=
 =?utf-8?B?MFBXR0VsejJBckxaRzlLbnVwTHQ1dUZuRS93K2ZTR1ZuVmQvR3NuY1VTeGRo?=
 =?utf-8?B?R2hzUnM2QTluUzcrYWhoTFpJaFVFcmpRVWQwWk1YVWt0bDhwcThGbkpGc2lT?=
 =?utf-8?B?QWh6Q3IyeWcxcE5WZXQwc1BOdHBDVHZibXNBdFF3R1QxbFRuOHZPaFFidk9a?=
 =?utf-8?B?ZVI0amZhbm0zTElXVU96Sm81UmJRY25nNEpBR0RaZ0V0bjZWZWRrM2VzSDNj?=
 =?utf-8?B?bm1ZSnBFU0ppVmdESGNwV0NoUEVwZEVEOER3YnUvdm5JQ0o5QkFFdExwWlRI?=
 =?utf-8?B?eGplTlVsQXFSU1dQcm9NWkpjVlJndVVMUU82WWRZUjRjS29VZTAvbHN4VXlL?=
 =?utf-8?B?RGtGTGtheG5Ua1NPTXo4WDBoVExha2t5dW9KT0t2TkphcDY4N1FGeWh4ai9R?=
 =?utf-8?B?MmJmVEg0TnMxelZFMGVETzdTNU04SjBReDlBQjAyMW5yVTNaQUdnczhadHpq?=
 =?utf-8?B?T2J2VCs3bzJ3WThDejUxbkRMVTJOMVhhODcxS1JvbnRvWmwwU3N1NVRrVU1o?=
 =?utf-8?B?K1E2bHlLUEZQMnZuU2wvWnpad0RzeDFLVHBYQm9TOWJMY1BFNjBnbzlFM2ZP?=
 =?utf-8?B?KzJxdjJKSHYramRIMTZhM3NxWUhTRlRiazkzanhsdkNDM1o5STVDS1NTV2Y1?=
 =?utf-8?B?ZmkrTFFlOUpqK2lwNXpJb0RKc2xGaWZZUTRXbkZzSG5qbzJBaXFVV3VnUStN?=
 =?utf-8?B?cmhPQ2k1aXBZUXZYTjFOUU1ndDdRRE9mRDQxTnJmYm5Ub3ZWeVh3SmE1SXFK?=
 =?utf-8?B?c2JpOEVyODlzbmY4NHhtdEw5cjM3TDhvZG9Xb2JnRTlQZENPdWlxTWtxbitM?=
 =?utf-8?B?dzBmSk54cG8wUTVnM3ZpU0dWa0ttUDVGaG1YbUhudlRxaWtzcGZkdHZZSXBB?=
 =?utf-8?B?NEJpZHQ5aXR6OUE4OHloOTBmdzYxb1ZONWMvQllqREpjRytxd0xYTmw4Z01y?=
 =?utf-8?B?bVdheDV5Tm9ubHhLdm5iUVd6Q1F2YUowWHBWWUVreDMrNkZEZ1ZoakFLWUpG?=
 =?utf-8?B?citmV2Q4ZldMbUlra3R6V1VZbThsL3pNRDJxbEt4a3kzNWJnNSt2M0ZLY1ZB?=
 =?utf-8?B?RUxjaG9YUkI3eVBLRXRFcmhWWmJuenVpRUpPdGhIbmFzenh1Y0d6cVJsWCto?=
 =?utf-8?B?UUJCelZFNjBpTEtGYVRGSDVwQkFZaE13ejNnRmNnUnpoMXlrRVg2UlVzZHk3?=
 =?utf-8?B?eFZjRk5MNnhtTGNhZUcyU3NQd0dJQzMvempFL3FyR1JRZUxQMmYwVVVrNDh0?=
 =?utf-8?Q?FjD8p46rQETyk/B4yahBniiuWgzF3BVHgTBLY0P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2097a8-0f7a-4668-6f44-08d90e481d4a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 15:28:34.2473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0I1zV627oAOVqDhytby4LxtuFE5py6MNppm8/WdcXi3h/Nz2x98oQVBNBXh7/f18geMY7iag9e1NXyr/MjCDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000
X-OriginatorOrg: citrix.com

On Mon, May 03, 2021 at 04:58:07PM +0200, Jan Beulich wrote:
> On 03.05.2021 16:47, Roger Pau Monné wrote:
> > On Mon, May 03, 2021 at 02:26:51PM +0200, Jan Beulich wrote:
> >> On 03.05.2021 11:28, Roger Pau Monné wrote:
> >>> On Thu, Apr 29, 2021 at 04:53:07PM +0200, Jan Beulich wrote:
> >>>> On 20.04.2021 16:07, Roger Pau Monne wrote:
> >> (I've also not seen the
> >> flag named "RTC good" - the ACPI constant is ACPI_WAET_RTC_NO_ACK, for
> >> example.)
> > 
> > I'm reading the WAET spec as published my Microsoft:
> > 
> > http://msdn.microsoft.com/en-us/windows/hardware/gg487524.aspx
> > 
> > Where the flag is listed as 'RTC good'. Maybe that's outdated now?
> > Seems to be the official source for the specification from
> > https://uefi.org/acpi.
> 
> Well, I guess the wording wasn't used for the constant's name because
> the RTC isn't "bad" otherwise?

I guess so, that's the name given my Microsoft anyway. The
descriptions speaks of an 'enhanced RTC', so you could differentiate
between plain RTC and enhanced one :).

> >>>>> @@ -337,8 +336,7 @@ int pt_update_irq(struct vcpu *v)
> >>>>>      {
> >>>>>          if ( pt->pending_intr_nr )
> >>>>>          {
> >>>>> -            /* RTC code takes care of disabling the timer itself. */
> >>>>> -            if ( (pt->irq != RTC_IRQ || !pt->priv) && pt_irq_masked(pt) &&
> >>>>> +            if ( pt_irq_masked(pt) &&
> >>>>>                   /* Level interrupts should be asserted even if masked. */
> >>>>>                   !pt->level )
> >>>>>              {
> >>>>
> >>>> I'm struggling to relate this to any other part of the patch. In
> >>>> particular I can't find the case where a periodic timer would be
> >>>> registered with RTC_IRQ and a NULL private pointer. The only use
> >>>> I can find is with a non-NULL pointer, which would mean the "else"
> >>>> path is always taken at present for the RTC case (which you now
> >>>> change).
> >>>
> >>> Right, the else case was always taken because as the comment noted RTC
> >>> would take care of disabling itself (by calling destroy_periodic_time
> >>> from the callback when using strict_mode). When no_ack mode was
> >>> implemented this wasn't taken into account AFAICT, and thus the RTC
> >>> was never removed from the list even when masked.
> >>>
> >>> I think with no_ack mode the RTC shouldn't have this specific handling
> >>> in pt_update_irq, as it should behave like any other virtual timer.
> >>> I could try to split this as a separate bugfix, but then I would have
> >>> to teach pt_update_irq to differentiate between strict_mode and no_ack
> >>> mode.
> >>
> >> A fair part of my confusion was about "&& !pt->priv".
> > 
> > I think you meant "|| !pt->priv"?
> 
> Oops, indeed.
> 
> >> I've looked back
> >> at 9607327abbd3 ("x86/HVM: properly handle RTC periodic timer even when
> >> !RTC_PIE"), where this was added. It was, afaict, to cover for
> >> hpet_set_timer() passing NULL with RTC_IRQ.
> > 
> > That's tricky, as hpet_set_timer hardcodes 8 instead of using RTC_IRQ
> > which makes it really easy to miss.
> > 
> >> Which makes me suspect that
> >> be07023be115 ("x86/vhpet: add support for level triggered interrupts")
> >> may have subtly broken things.
> > 
> > Right - as that would have made the RTC irq when generated from the
> > HPET no longer be suspended when masked (as pt->priv would no longer
> > be NULL). Could be fixed with:
> > 
> > diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
> > index ca94e8b4538..f2cbd12f400 100644
> > --- a/xen/arch/x86/hvm/hpet.c
> > +++ b/xen/arch/x86/hvm/hpet.c
> > @@ -318,7 +318,8 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
> >                           hpet_tick_to_ns(h, diff),
> >                           oneshot ? 0 : hpet_tick_to_ns(h, h->hpet.period[tn]),
> >                           irq, timer_level(h, tn) ? hpet_timer_fired : NULL,
> > -                         (void *)(unsigned long)tn, timer_level(h, tn));
> > +                         timer_level(h, tn) ? (void *)(unsigned long)tn : NULL,
> > +                         timer_level(h, tn));
> >  }
> >  
> >  static inline uint64_t hpet_fixup_reg(
> > 
> > Passing again NULL as the callback private data for edge triggered
> > interrupts.
> 
> Right, plus perhaps at the same time replacing the hardcoded 8.

Right, but if you agree to take this patch and remove strict_mode then
the emulated RTC won't disable itself anymore, and hence needs to be
handled as any other virtual timer?

I will submit the HPET patch so it can be backported to stable
releases anyway, just wanted to check whether you would agree to
remove the strict_mode, and whether you then agree that the special
handling of the RTC done in pt_update_irq is no longer needed.

> >>> Would you be fine if the following is added to the commit message
> >>> instead:
> >>>
> >>> "Note that the special handling of the RTC timer done in pt_update_irq
> >>> is wrong for the no_ack mode, as the RTC timer callback won't disable
> >>> the timer anymore when it detects the guest is not reading REG_C. As
> >>> such remove the code as part of the removal of strict_mode, and don't
> >>> special case the RTC timer anymore in pt_update_irq."
> >>
> >> Not sure yet - as per above I'm still not convinced this part of the
> >> change is correct.
> > 
> > I believe part of this handling is kind of bogus - for example I'm
> > unsure Xen should account masked interrupt injections as missed ticks.
> > A guest might decide to mask it's interrupt source for whatever
> > reason, and then it shouldn't receive a flurry of interrupts when
> > unmasked. Ie: missed ticks should only be accounted for interrupts
> > that should have been delivered but the guest wasn't scheduled. I
> > think such model would also simplify some of the logic that we
> > currently have.
> > 
> > In fact I have a patch on top of this current series which I haven't
> > posted yet that does implement this new mode of not accounting masked
> > interrupts as missed ticks to the delivered later.
> 
> This may be problematic: Iirc one of the goals of this mode is to cover
> for the case where a guest simply doesn't get around to unmasking the
> IRQ until the next one occurs. Yes, it feels bogus, but I'm not sure it
> can be done away with.

Well, an OS shouldn't really mask the interrupt source without being
capable of handling missed interrupts. As even when running native a
SMM could steal time from the OS and thus miss timer ticks?

> I also can't seem to be able to think of a
> heuristic by which the two scenarios could be told apart halfway
> reliably.

I've tested with Windows 7 limited to 2% capacity and seems to be able
to keep track of time correctly when masked timer interrupts are not
accounted as missed ticks. Note than doing the same with
no_missed_ticks_pending leads to time skews (so limiting the CPU
capacity to 2% does indeed force timer ticks to accumulate).

Anyway, we can discuss later, once this initial batch of patches is
in.

Thanks, Roger.

