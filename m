Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC711548BB
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 17:03:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izjYq-00008V-1A; Thu, 06 Feb 2020 15:59:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CJ3H=32=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1izjYo-00008Q-J5
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 15:59:22 +0000
X-Inumbo-ID: a2bef8fe-48f9-11ea-b2cb-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2bef8fe-48f9-11ea-b2cb-bc764e2007e4;
 Thu, 06 Feb 2020 15:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581004762;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MVFpMuQ4LMfEM2+s+b8erXKn6Reo443PjXL1bd+ziFs=;
 b=e1+uXhOwLpYcGOgzriqWD5EVJ8stkb2M7aUo+tnHzSsFrYthinOQ0+mi
 lWFpIMw9avcmFzPt2l946D4S89ducKeY+COFcSCva4khprwbP6O3OpAfd
 hoPRPGMHsT3PRsQzZSRm80ZuvZtAvHQDehyKfZAC96coz7HUzkqlwebPs k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dLRhJgQoLgVbr+geqA2IoBSpnG/uZt3vfZJGYJGlMrMvPkoJqrTQ+gGVX6s8JCYag1SnUn3wH+
 zxmxgMSO40B8NDjjHY6dqyFKT2kJoIdL3L+ynzIIZac+loIMyV9pVoye4XuvO2KDNsdpabD2wn
 UWL2t48qXSyfXJEDq0QAlWrKlmscHZYKpi3AdsSTkymlaX6GA4Xu6ewyJpzIpAJGfNjI3PvqDz
 Os497/0XrpauINXPkkzCJfFgRukwQXLD0SeV/ApmUDuMDpfal3Z3xhVzp1IezGadWziwPl0zFw
 /co=
X-SBRS: 2.7
X-MesageID: 12065634
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,410,1574139600"; d="scan'208";a="12065634"
Date: Thu, 6 Feb 2020 16:58:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200206155853.GA4679@Air-de-Roger>
References: <da353fee-b7f7-73ab-9ebe-632b4ea4152d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da353fee-b7f7-73ab-9ebe-632b4ea4152d@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/p2m: drop p2m_access_t parameter from
 set_mmio_p2m_entry()
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMDYsIDIwMjAgYXQgMDQ6MjA6MDJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQm90aCBjYWxsZXJzIHJlcXVlc3QgdGhlIGhvc3QgUDJNJ3MgZGVmYXVsdCBhY2Nlc3Ms
IHdoaWNoIGNhbiBhcyB3ZWxsIGJlCj4gZG9uZSBpbnNpZGUgdGhlIGZ1bmN0aW9uLiBXaGlsZSB0
b3VjaGluZyB0aGlzIGFueXdheSwgbWFrZSB0aGUgImdmbiIKPiBwYXJhbWV0ZXIgdHlwZS1zYWZl
IGFzIHdlbGwuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaWl0cml4LmNv
bT4KCkNhbiBiZSBhZGRlZCBiYWNrIGlmIHRoZXJlJ3MgYSBuZWVkIGZvciBpdC4KClRoYW5rcy4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
