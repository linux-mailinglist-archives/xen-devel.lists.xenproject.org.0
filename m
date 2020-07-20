Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAEA225BCE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 11:37:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxSEW-0005GH-Lo; Mon, 20 Jul 2020 09:37:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UosC=A7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxSEV-0005G7-En
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 09:37:15 +0000
X-Inumbo-ID: 97c2b400-ca6c-11ea-9f74-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97c2b400-ca6c-11ea-9f74-12813bfff9fa;
 Mon, 20 Jul 2020 09:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595237834;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nwPJa3NUFyEUiPP7p8oQoME8KchN1Curaq49nRiJSr0=;
 b=VQ73fMuqmBPOA8o5mFaRv6pB1eXZNN8kMoR9vi282MuqFKIOXiPNamQu
 5zQ4E9EVEGH9f7TtpGMQE3Jwzj/2XvzllMxQbMDi40PjXHG6yMMz06/qi
 yV90KDqbMHyBdy12D84mgjFdhkWq7imujJXztbWYOoBQN0MV4KpoDSFdP c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4hmgLSfnkocyYHfNLmECegraULYWfvgO+2ir3ZYwO5eOasBTEYVWmVfPwW4mzeVVL17AAtcZVd
 bUVOns9d+KznUSTWedAW/WhA4LDQ6fI22ZVr7E0i6W1qt7UqqwxosEHno3/M1gQyUdpcDOjoqF
 Nj70/QuhTm+JOMOwc9sysRtdWdhiTtL0p7pcoHDnQAPgaCsxfhMhr0r+0WqS9xxrS3GSrFbPO0
 NyjgT8OXTOod2Cdp5jysswqlD0JX8QMphFc9cBJwZ90Kl5ucVrm3e0q6KBg1OKyPj5+tG+RRay
 t54=
X-SBRS: 2.7
X-MesageID: 23586900
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="23586900"
Date: Mon, 20 Jul 2020 11:37:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 01/11] xen/manage: keep track of the on-going suspend
 mode
Message-ID: <20200720093705.GG7191@Air-de-Roger>
References: <cover.1593665947.git.anchalag@amazon.com>
 <20200702182136.GA3511@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <50298859-0d0e-6eb0-029b-30df2a4ecd63@oracle.com>
 <20200715204943.GB17938@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <0ca3c501-e69a-d2c9-a24c-f83afd4bdb8c@oracle.com>
 <20200717191009.GA3387@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <5464f384-d4b4-73f0-d39e-60ba9800d804@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5464f384-d4b4-73f0-d39e-60ba9800d804@oracle.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: eduval@amazon.com, len.brown@intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, x86@kernel.org, linux-mm@kvack.org, pavel@ucw.cz,
 hpa@zytor.com, sstabellini@kernel.org, kamatam@amazon.com, mingo@redhat.com,
 xen-devel@lists.xenproject.org, sblbir@amazon.com, axboe@kernel.dk,
 konrad.wilk@oracle.com, Anchal Agarwal <anchalag@amazon.com>, bp@alien8.de,
 tglx@linutronix.de, jgross@suse.com, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 vkuznets@redhat.com, davem@davemloft.net, dwmw@amazon.co.uk
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Jul 18, 2020 at 09:47:04PM -0400, Boris Ostrovsky wrote:
> (Roger, question for you at the very end)
> 
> On 7/17/20 3:10 PM, Anchal Agarwal wrote:
> > On Wed, Jul 15, 2020 at 05:18:08PM -0400, Boris Ostrovsky wrote:
> >> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> >>
> >>
> >>
> >> On 7/15/20 4:49 PM, Anchal Agarwal wrote:
> >>> On Mon, Jul 13, 2020 at 11:52:01AM -0400, Boris Ostrovsky wrote:
> >>>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> >>>>
> >>>>
> >>>>
> >>>> On 7/2/20 2:21 PM, Anchal Agarwal wrote:
> >>>> And PVH dom0.
> >>> That's another good use case to make it work with however, I still
> >>> think that should be tested/worked upon separately as the feature itself
> >>> (PVH Dom0) is very new.
> >>
> >> Same question here --- will this break PVH dom0?
> >>
> > I haven't tested it as a part of this series. Is that a blocker here?
> 
> 
> I suspect dom0 will not do well now as far as hibernation goes, in which
> case you are not breaking anything.
> 
> 
> Roger?

I sadly don't have any box ATM that supports hibernation where I
could test it. We have hibernation support for PV dom0, so while I
haven't done anything specific to support or test hibernation on PVH
dom0 I would at least aim to not make this any worse, and hence the
check should at least also fail for a PVH dom0?

if (!xen_hvm_domain() || xen_initial_domain())
    return -ENODEV;

Ie: none of this should be applied to a PVH dom0, as it doesn't have
PV devices and hence should follow the bare metal device suspend.

Also I would contact the QubesOS guys, they rely heavily on the
suspend feature for dom0, and that's something not currently tested by
osstest so any breakages there go unnoticed.

Thanks, Roger.

