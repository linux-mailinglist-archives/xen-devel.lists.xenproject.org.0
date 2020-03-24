Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4312190D46
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 13:22:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGiW0-0004WP-PH; Tue, 24 Mar 2020 12:18:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gj1N=5J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jGiW0-0004WK-4f
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 12:18:40 +0000
X-Inumbo-ID: 97435dc3-6dc9-11ea-83df-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97435dc3-6dc9-11ea-83df-12813bfff9fa;
 Tue, 24 Mar 2020 12:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585052318;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WYqPM8sR0iunmGJkkCrbOGulG9JiaeYlt1R596h8GFc=;
 b=c+Nui0wIBRqpkpdCghI4EQeFgJJm+iaZ5sY2XsPBbt2KB06gVvNta1wS
 HJXW0SXrla3uQ2qTCtda2xbGa184xYmyZ1prdvk8oC4uewZ8X9QXNpfwT
 aGvMz556pnxRChP0EFc8svqiwIWDi6XvIz0LhYk7qdqzsU+bS37KzCfAy k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Pf2VzvbJ4inKMAGR0CLRbaQYx0E0MH3Y0jkh4rxfg3yK91bC2SNK4ogApxJ1236e0ly+4iuLEF
 /A74oOE3KXPPoGYJ1Qb8t2+6CLdge/bDmwpY2LVHMqp0Of+IaPfDK6F1loU/py1Wm8WghAZbWY
 HE2dC8FUWdXf9jh0xWpoC+I05HTOrsrVccJycXmb8yNAStthuFHzGlmAXLimiLJeoSeugMu44Z
 jVLSnvUYLTStWmgz74RJbclHbUJGf9OLPtFnCL94RMx+iwvlkFTo8Jq6sSSqgU054ZPMrzhGTH
 l4g=
X-SBRS: 2.7
X-MesageID: 14944102
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,300,1580792400"; d="scan'208";a="14944102"
Date: Tue, 24 Mar 2020 13:18:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20200324121831.GL24458@Air-de-Roger.citrite.net>
References: <20200320190737.42110-1-roger.pau@citrix.com>
 <20200320190737.42110-3-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5B44@SHSMSX104.ccr.corp.intel.com>
 <20200324095052.GF24458@Air-de-Roger.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E604D@SHSMSX104.ccr.corp.intel.com>
 <20200324112237.GI24458@Air-de-Roger.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E629A@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7E629A@SHSMSX104.ccr.corp.intel.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/3] x86/nvmx: clarify and fix usage of
 nvmx_update_apicv
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Mar 24, 2020 at 11:33:00AM +0000, Tian, Kevin wrote:
> > From: Roger Pau Monné <roger.pau@citrix.com>
> > Sent: Tuesday, March 24, 2020 7:23 PM
> > 
> > On Tue, Mar 24, 2020 at 10:11:15AM +0000, Tian, Kevin wrote:
> > > > From: Roger Pau Monné <roger.pau@citrix.com>
> > > > Sent: Tuesday, March 24, 2020 5:51 PM
> > > >
> > > > On Tue, Mar 24, 2020 at 06:03:28AM +0000, Tian, Kevin wrote:
> > > > > > From: Roger Pau Monne <roger.pau@citrix.com>
> > > > > > Sent: Saturday, March 21, 2020 3:08 AM
> > > > > >
> > > > > > The current usage of nvmx_update_apicv is not clear: it is deeply
> > > > > > intertwined with the Ack interrupt on exit VMEXIT control.
> > > > > >
> > > > > > The code in nvmx_update_apicv should update the SVI (in service
> > > > interrupt)
> > > > > > field of the guest interrupt status only when the Ack interrupt on
> > > > > > exit is set, as it is used to record that the interrupt being
> > > > > > serviced is signaled in a vmcs field, and hence hasn't been injected
> > > > > > as on native. It's important to record the current in service
> > > > > > interrupt on the guest interrupt status field, or else further
> > > > > > interrupts won't respect the priority of the in service one.
> > > > > >
> > > > > > While clarifying the usage make sure that the SVI is only updated
> > when
> > > > > > Ack on exit is set and the nested vmcs interrupt info field is valid. Or
> > > > > > else a guest not using the Ack on exit feature would loose interrupts
> > as
> > > > > > they would be signaled as being in service on the guest interrupt
> > > > > > status field but won't actually be recorded on the interrupt info vmcs
> > > > > > field, neither injected in any other way.
> > > > >
> > > > > It is insufficient. You also need to update RVI to enable virtual injection
> > > > > when Ack on exit is cleared.
> > > >
> > > > But RVI should be updated in vmx_intr_assist in that case, since
> > > > nvmx_intr_intercept shouldn't intercept the interrupt, as it should be
> > > > handled normally.
> > >
> > > As we discussed before, vmx_intr_assist is invoked before
> > nvmx_switch_guest.
> > >
> > > It is incorrectly to update RVI at that time since it might be still vmcs02
> > being
> > > active (if no pending softirq to make it invoked again).
> > >
> > > Also nvmx_intr_intercept does intercept Ack-on-exit=0 case:
> > >
> > >         if ( intack.source == hvm_intsrc_pic ||
> > >                  intack.source == hvm_intsrc_lapic )

I've realized that nvmx_intr_intercept will return 1 for interrupts
originating from the lapic or the pic, while nvmx_update_apicv will
only update GUEST_INTR_STATUS for interrupts originating from the
lapic. Is this correct?

Shouldn't both be in sync and handle the same interrupt sources?

Thanks, Roger.

