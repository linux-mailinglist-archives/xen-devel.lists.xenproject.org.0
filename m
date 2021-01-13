Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB5D2F51AA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 19:06:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66666.118496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkX5-0006ul-7t; Wed, 13 Jan 2021 18:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66666.118496; Wed, 13 Jan 2021 18:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkX5-0006uM-4I; Wed, 13 Jan 2021 18:06:11 +0000
Received: by outflank-mailman (input) for mailman id 66666;
 Wed, 13 Jan 2021 18:06:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nR66=GQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kzkX3-0006uH-9A
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 18:06:09 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edfd7e55-4e6c-47e9-9a78-f8ccbf0160f3;
 Wed, 13 Jan 2021 18:06:06 +0000 (UTC)
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
X-Inumbo-ID: edfd7e55-4e6c-47e9-9a78-f8ccbf0160f3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610561166;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9OFxgEPPDm4yCJbyIyFnGHd6DhJFG92bJ7v9fma9j1Q=;
  b=JbDsCX13rPVWYOhIJl6dkAIpxAcjyu28F4gc9ugMEnQw27sMG6s9ZJEm
   7bZ9T7Rdo4HAtmYFMKJthTka0OFvTodT1wxwmuklt0O6pF15/NOLOCA7k
   OeA12Xh73FVh/9ydEQa7qRCEYvFOJIox9I5aa2HyTrOK8yzFxhZBipcI0
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pFOwDNLCYBIfopZu1KqNxqGaJo4qtNeeszR3oX4r0B/fvvb65dNFF1Tza3FGM7bB+3OUbigVWF
 VSWWqzCfGsGSpwXBno+zwf7bRHGOD4YkVK8nx7V1W8KzEOw2SJ1kazp2mHvTd6MkIq6HBa8ugD
 hqD4T9epSFCBpCCGH0MJUWulxKcQQkKwD9Sx+C1Zp5hiPfbIFMHR+iQCBrZXSrJHCsVe+2i0ZT
 2tu7AFsu6Xr2QkrLRv64yaYr7fnPioR4t5wKQfruMjbSJ/RkQIRlHXGQCg5YKyUHAf8XBHl1+G
 9tE=
X-SBRS: 5.2
X-MesageID: 35397185
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,344,1602561600"; 
   d="scan'208";a="35397185"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpF0hp9n48108e2Cx+0k77Imav3Ks/IhC94qR9kgNqphMYCHxIQ1KWKijvfH3+Sg48CRshRc6wG8ipvNmvUqS87jrqGYCoUXYrwo3FeI5gmuobC4Xtzc1Zv6u3OXtz5oq7539JBUn/M6FRguBhsxlTaE/or15F2EvI4HNhu4m8bpc/QCAImyl575i8LObrAeYLS1YfEwX1y7cWtqwwBD4B8ZJP9JWUWgKP12RvJJTfeCIaIPzAKwkOj6O7INcreVRtx2AZxlAMsZ70p0GZBGG7DT5NbeLKZy/sirF+LP470A33uFDLlVvSLAiWMoITMs3VGBC3PIUQiYdsv8ic3Amg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oduB2t2cSaRvo/s3/16JM3AYCdxaFqjijJnA4rDv0s8=;
 b=ejb8R3DFTtSsiFO7jdYnkBlByyBMiuI1bEDzqGKbWjJh3KPBM7Zlwzr+DikjSARQzq4ZRtE9lXpQ1oZ5pBZtUd2YZQrcgTNYrsCxsmpu310yan9Vc4PpysfiTsOHGqYE/riifct6gyYkJGjDZcsh3zfco1HTpcaAg3SRdyzDG8GrnGwPBf5ZkvphdlPwqA0jR1cH3vstYWt0/39pyLPdx+AoKcLlX3ARUkxW0Ps6lHsZ3E1ktpR/wDvSzV9Bm8LxHr8+5e0WEUUveZneGtNM1gKkbQ89FJ20v4JmGNmjpIq2wX9YuX6lPoq67jv/xC9LaSe8/wlO+0lG673VSzMW2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oduB2t2cSaRvo/s3/16JM3AYCdxaFqjijJnA4rDv0s8=;
 b=NLxxN3NIkN5zRFIVeh/KfWSzPpFKnlRCAm630D1o6q4fGrQUNZpDhjlFB23pG7sEy6bR+Q4f0GoQDuB5OjIHzdod1Ktb9LsASSbuVqSSZv6r4NqZzp5L671/SdqeNMGIDlsLJTBpUgHnCPzhcA70dmCekPYi3+EUm5CGWxUni3A=
Date: Wed, 13 Jan 2021 19:05:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: "Tian, Kevin" <kevin.tian@intel.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Paul
 Durrant" <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
Message-ID: <20210113180558.do2xq4iaur6kyuy4@Air-de-Roger>
References: <20210112173248.28646-1-roger.pau@citrix.com>
 <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger>
 <CAKf6xps-GOMSsYzDHf9wgyjDes0X4hnaq9vBsn02rCv-DadW8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xps-GOMSsYzDHf9wgyjDes0X4hnaq9vBsn02rCv-DadW8A@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0130.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df8a9030-339d-4729-2a24-08d8b7ede42a
X-MS-TrafficTypeDiagnostic: DM6PR03MB5065:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB50655B846BD7EEB773E06E438FA90@DM6PR03MB5065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Al0b0Yf91gUWIW5F7rf7FYISX44P35iy0nYNMXlrBEuA9BAh4ekIG+WibDM0P9K7RpX3wfO/C6tjHKfK+i3nFFmRIkUXkC5Pa2jJfDv6cOmW7MjuPu7YW7gkVxxPeW9xWPPt+XeMUCTyfmu0OfvGv8JnoN5CAIXN5oBs7rhAelof7OUIZpYROmjmkuh97zpsdCYNou70ONpVNx2vP5rcySXppzAaG2CGh3lOM2CRdLVcgAOBgwaEi88uomPdD6a6c5phIyemp9d8pSi1hdgucSABtg9hdp/2RxdPQws3lnLgOGF5VcbDAoRZLGSbqjA576GW2/i4ErochXB7hf4qrpAf/JF8qALQYoFOb03kU/VvK76hWXfK0XCkg++bk6cdZYyfqZw6MAP/G3RkVWhb3KPY63/k6sMkugUrY0ereSxkdPu+AqnhcbIxPI3lVHOJ8V7ko+Kv/BlQJDpvVcXtcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(66946007)(66476007)(54906003)(66556008)(6486002)(26005)(53546011)(83380400001)(33716001)(316002)(85182001)(16526019)(5660300002)(1076003)(86362001)(6666004)(966005)(478600001)(6496006)(186003)(8936002)(2906002)(9686003)(6916009)(4326008)(956004)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TXpIUThON3F4ckRxdTYwOXFkamUwSlloVjNmUDhzbVhNbmw5QUgyWksxT1p1?=
 =?utf-8?B?eXJ5bmRmZzgxQ09DejlsQUJqWW9mYk43V0VhL0FCSFVIZE1FbWlIZ1QxQkUw?=
 =?utf-8?B?cFFPa2p1OTdrdFQ0MXhiYlByelIxOXdwdTBIL1d5dEtNWlR5Sm9TVUNCUUdu?=
 =?utf-8?B?Mm8zRnI1eDBncVorMEZqT29pc1kvYnRZekpLNWVzVTl1WXVCakVPL0FxQXp0?=
 =?utf-8?B?QVB5Qk5EcWxsWHdNZkRudHphRVpnd0c4SXN0NTRQS1lTQ0lYUEo5MW9TQUZn?=
 =?utf-8?B?SHJIWUk1bTFWdWpyaTNnYzh3SW10WmdDN1R2QUFBSStiSzI5ditHVG16bDJq?=
 =?utf-8?B?K2VjZDFBNGRPaEY2ejc4cm05cWhrakQxejBzR09Yb3lxaFd3M1o0UTc2dUlk?=
 =?utf-8?B?M09jb0EwREVHQ0dLU2VzdjU3ZFpLdzlCditpMHdTMERpa0prbEJBUStrUDUr?=
 =?utf-8?B?dEU0WG4rMTU3Yjg0UE5LT0QvcFNLNTNzelJrdzcyaElaZThvMWh1ZTQvcW8r?=
 =?utf-8?B?SlcrcU9CTFNpeVgvRlVlOFpwUTNMS1NHL0MxblE3VDBUMDVsK01OVkg2RXF0?=
 =?utf-8?B?YVBHUlNTU3doTmNlM2J5a282YUdrZVBYZHJSNngwOWRIYlNpVWxjbmVlejVn?=
 =?utf-8?B?SXA0MkpzaWx3OXR4MWRvbG5yek9wanhEUlM2aHZoNVRPeTd3bTVuMFZyRjBH?=
 =?utf-8?B?RUZsS2c5dDQvUnZDd0xqZUovczBqZm5DaUpaM1hHN0Fya2FUelM1cmVSVEZa?=
 =?utf-8?B?eHFac0VwalJnTHl2WUYvY0ZuZTFTR0RNWHJGQW5EUjBtVUtwWHZuaXR0c2lp?=
 =?utf-8?B?K3BzalUrSjhPaTR6M1hYMkJGeDI2dWxZNHZiNVZod2wxQ0ZZdjlLR25vRTZi?=
 =?utf-8?B?Q2tUL29mVmFCbEpGUnk5U00vUDhTVTFZUzlPOVdjeFc2aXNIcnBwc3YvUmtX?=
 =?utf-8?B?SUtXekJ6NkZrRm8yVDNWVzV3aE0zb0E3WjRGNDRTYmRkUnp4M0c3bWk2d2Fs?=
 =?utf-8?B?SExaQlQzNk5aaHpnbTM2VXdzMWs4V1hrSWVJS1hKWWw5cXlrMytzelJxYU1o?=
 =?utf-8?B?TXhKUzB3TVUxZTM3VTNuQmMwV3QvdEVYbG5tQVlXcnltNWJCcDBadW9NYU92?=
 =?utf-8?B?MXg1OVVwd25SRXRIdVdjQTFjYzdUdXdFWkdOS0VHaUh4TWw5S2tRSnRTK1BY?=
 =?utf-8?B?ZG9rRGNDbzJCQ0hmVzdXajA4MjUxQjQ4U3hnL0ZUWnJhdU1DbGVzY0FidXEv?=
 =?utf-8?B?bXFibVN1d0ZkYitLOEZ6SHQ2d0NOWkFkTlNscXFSS2dmcXVNTnpyV1VNd3Vt?=
 =?utf-8?Q?Gb5dDxZStkGnECjAiMdyg4bW0xvdj1ySsv?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 18:06:03.5259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: df8a9030-339d-4729-2a24-08d8b7ede42a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mbuamz7VhQxUxQ+pwktKH2OykknbwxSXBMG8TPWWhb6vpAhffD2WTynQvsBw4sG0E4Td2owpSxpLUMQIc75KHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5065
X-OriginatorOrg: citrix.com

On Wed, Jan 13, 2021 at 10:48:52AM -0500, Jason Andryuk wrote:
> On Wed, Jan 13, 2021 at 8:11 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Wed, Jan 13, 2021 at 06:21:03AM +0000, Tian, Kevin wrote:
> > > > From: Roger Pau Monne <roger.pau@citrix.com>
> > > > Sent: Wednesday, January 13, 2021 1:33 AM
> > > >
> > > > Current interrupt pass though code will setup a timer for each
> > > > interrupt injected to the guest that requires an EOI from the guest.
> > > > Such timer would perform two actions if the guest doesn't EOI the
> > > > interrupt before a given period of time. The first one is deasserting
> > > > the virtual line, the second is perform an EOI of the physical
> > > > interrupt source if it requires such.
> > > >
> > > > The deasserting of the guest virtual line is wrong, since it messes
> > > > with the interrupt status of the guest. It's not clear why this was
> > > > odne in the first place, it should be the guest the one to EOI the
> > > > interrupt and thus deassert the line.
> > > >
> > > > Performing an EOI of the physical interrupt source is redundant, since
> > > > there's already a timer that takes care of this for all interrupts,
> > > > not just the HVM dpci ones, see irq_guest_action_t struct eoi_timer
> > > > field.
> > > >
> > > > Since both of the actions performed by the dpci timer are not
> > > > required, remove it altogether.
> > > >
> > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > ---
> > > > As with previous patches, I'm having a hard time figuring out why this
> > > > was required in the first place. I see no reason for Xen to be
> > > > deasserting the guest virtual line. There's a comment:
> > > >
> > > > /*
> > > >  * Set a timer to see if the guest can finish the interrupt or not. For
> > > >  * example, the guest OS may unmask the PIC during boot, before the
> > > >  * guest driver is loaded. hvm_pci_intx_assert() may succeed, but the
> > > >  * guest will never deal with the irq, then the physical interrupt line
> > > >  * will never be deasserted.
> > > >  */
> > > >
> > > > Did this happen because the device was passed through in a bogus state
> > > > where it would generate interrupts without the guest requesting
> > >
> > > It could be a case where two devices share the same interrupt line and
> > > are assigned to different domains. In this case, the interrupt activity of
> > > two devices interfere with each other.
> >
> > This would also seem to be problematic if the device decides to use
> > MSI instead of INTx, but due to the shared nature of the INTx line we
> > would continue to inject INTx (generated from another device not
> > passed through to the guest) to the guest even if the device has
> > switched to MSI.
> >
> > > >
> > > > Won't the guest face the same issues when booted on bare metal, and
> > > > thus would already have the means to deal with such issues?
> > >
> > > The original commit was added by me in ~13yrs ago (0f843ba00c95)
> > > when enabling Xen in a client virtualization environment where interrupt
> > > sharing is popular.
> >
> > Thanks, the reference to the above commit is helpful, I wasn't able to
> > find it and it contains a comment that I think has been lost, which
> > provides the background on why this was added.
> >
> > > I believe above comment was recorded for a real
> > > problem at the moment (deassert resets the intx line to unblock further
> > > interrupts). But I'm not sure whether it is still the case after both Xen and
> > > guest OS have changed a lot. At least some test from people who
> > > still use Xen in shared interrupt scenario would be helpful. Or, if such
> > > usage is already niche, maybe we can consider disallow passing through
> > > devices which share the same interrupt line to different domains and
> > > then safely remove this dpci EOI trick.
> >
> > So the deassert done by timeout only deasserts the virtual line, but
> > doesn't for example clear the IRR bit from the vIO-APIC pin, which
> > will cause further interrupts to not be delivered anyway until a
> > proper EOI (or a switch to trigger mode) is done to the pin.
> >
> > I think it's going to be complicated for me to find a system that has
> > two devices I can passthrough sharing the same GSI.
> 
> I have some laptops running OpenXT where the USB controller and NIC
> share an interrupt, and I assign them to different domains.  Qubes
> would hit this as well.

Is there any chance you could try the patch and see if you can hit the
issue it was trying to fix?

It would be good to be able to reproduce it so that I could work on an
alternative fix that doesn't require having two timers for each IRQ in
flight.

> (I hoped MSI translate would help me sidestep the need to XSM label
> the shared PIRQ, but as the other thread mentions, qemu-upstream
> doesn't support that.  I started using this instead:
> https://lore.kernel.org/xen-devel/20201019200318.103781-1-jandryuk@gmail.com/)

MSI translate is also on my sight for removal, as you have seen from
that other thread :).

Thanks, Roger.

