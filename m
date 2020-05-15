Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A341D4E29
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 14:54:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZZqZ-00035r-M9; Fri, 15 May 2020 12:53:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZZqY-000358-2V
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 12:53:50 +0000
X-Inumbo-ID: 1e007b1b-96ab-11ea-a560-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e007b1b-96ab-11ea-a560-12813bfff9fa;
 Fri, 15 May 2020 12:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589547228;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=h8ROL07qR+cfOqxXmvtq6ZaRiASF5lxplxlfq5bX5jk=;
 b=WGU54Sz4hEg0hrpF9XxDt4YUIbFwwbPovhYbRhqgmDLc/Mn/WGj5vtNi
 Inu5uUcs/wEvWuT3itA6w2YWlvinXXGZJLud+S5VqN0NC68YRbnDIQ+Pf
 /qdzAQQc0UkGJkUtA043jORxNfmAk2q9n5LLRSKyu1hmrT370k/JynrAX A=;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: aoLvq7WzYD3TaCF5sCuANHIgxZEuJUfdZt8Jyk5IStpMgF20mSgo4rhP9IToDgHOvwKzWbq/Js
 WDtAVgbYapqXblyOhd5GfF6JsW+UuEoRIvVu+T9OUc43dMg3LMpCToykiKUPwtRGlKCN1F7rRy
 x0YpFRamh+pAHbAPm5x+la8VIBeOnZx7LnBL/l75mDB5DbJZ3dLEwPIQ8sj4SNI43i8lok6lvT
 LAK13FE6kq7C9gOJbhOnrpiOSIUY1ZbWPEX+DPPhLngoQXVxkrauHToTNsm/wQS089o1+IhqQY
 OUw=
X-SBRS: 2.7
X-MesageID: 17886315
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="17886315"
Date: Fri, 15 May 2020 14:53:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Error during update_runstate_area with KPTI activated
Message-ID: <20200515125341.GT54375@Air-de-Roger>
References: <ab4f3c2a-95aa-1256-f6f4-0c3057f5600c@xen.org>
 <b6511a29-35a4-a1d0-dd29-7de4103ec98e@citrix.com>
 <CAJ=z9a1H2C6sWiScYw9XXLRcezBfUxYz2semj33D5GpB5=EE_w@mail.gmail.com>
 <478C4829-CCAF-495B-860E-6BA3D86AA47D@arm.com>
 <20200515083838.GN54375@Air-de-Roger>
 <d2033adc-3f98-2d14-ae6d-f8dcd8b90002@xen.org>
 <20200515091018.GO54375@Air-de-Roger>
 <93D7EBEF-E3E0-4DBB-A5BC-7D326B7AE0DB@arm.com>
 <20200515100742.GR54375@Air-de-Roger>
 <B0FB86DC-1D4F-438E-B78B-0D9845D13E8A@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B0FB86DC-1D4F-438E-B78B-0D9845D13E8A@arm.com>
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
Cc: Stefano
 Stabellini <stefano.stabellini@xilinx.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 15, 2020 at 12:34:08PM +0000, Bertrand Marquis wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> Hi Roger
> 
> > On 15 May 2020, at 11:07, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > Can you please fix your email client to properly indent replies? It's
> > impossible to distinguish your added text when you reply from the
> > original email, as it's not indented in any way.
> 
> Sorry for that it seems my email client is detecting mail as being in rich text and was answering keeping this format
> Please tell me if this was not fixed in this email.

Yes, this looks much better, thanks!

> > 
> > On Fri, May 15, 2020 at 09:21:34AM +0000, Bertrand Marquis wrote:
> >> On 15 May 2020, at 10:10, Roger Pau Monné <roger.pau@citrix.com<mailto:roger.pau@citrix.com>> wrote:
> >> 
> >> On Fri, May 15, 2020 at 09:53:54AM +0100, Julien Grall wrote:
> >> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> >> 
> >> Hi,
> >> 
> >> On 15/05/2020 09:38, Roger Pau Monné wrote:
> > ... it's hard for the guest to figure out which non-populated areas
> > are safe for mapping arbitrary things. Ie: you might attempt to map
> > the runstate area on top of some MMIO area the guest is not aware of
> > for example if it has passthrough enabled.
> 
> With you answer and Julian ones it is now clear that the only solution is to have the area provided by the guest.
> 
> > 
> >> - Xen maps read-only its own area to the guest at the provided address
> >> - Xen shall not modify any data in the runstate area of other cores/guests (should already be the case)
> > 
> > I'm not sure those two restrictions are relevant, it's not relevant to
> > Xen whether the guest decided to overwrite the runstate area. Xen will
> > just write to it when doing a context switch in order to update it,
> > but it should never read from it.
> > 
> > Or are you meaning to map vcpu->runstate directly into the guest
> > physmap?
> > 
> > I think that's a bad idea as we would then have to force each vCPU
> > runstate to take up to a whole page, wasting lots of memory.
> 
> I was more thinking in putting all the runstate of all vCPUs in the same page (or in several if this was not enough)
> 
> My main point was to have Xen directly modifying this one instead of doing copies as Xen is just writing to it and never reads from it and the guest is not suppose to write to it (but if it does that’s more or less an error on its side).

I'm not saying it's not possible, but IMO having Xen allocate such
memory will be much more complicated than just using a guest provided
memory area and doing a copy.

Roger.

