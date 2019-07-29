Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301CD787D3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 10:56:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs1Pw-0007FV-Va; Mon, 29 Jul 2019 08:54:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vOtp=V2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hs1Pv-0007FO-OJ
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 08:54:03 +0000
X-Inumbo-ID: 69394ab9-b1de-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 69394ab9-b1de-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 08:54:02 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RKe8iEsIat8Rj4s5ci90alYJUSqWDFX03uDu5jX4om4RWTgaVw07rEtnrOY0bTpAAMRVyenWHs
 7lWkHCTRS0Pj2oekKltP0WU710ag3L2vGSKaYfKFFEHSqF6BZg11NnmhMxw2Llsr8CY4w2wwPM
 6quMEeez1GvhG9iUwU5iEk3BCavNDao6NkXihsGBSRYcotHpz1AR0H+PF8OkQFH7L+61hXtY5Y
 NVnSVCn1wMIdaqrY9ByxGuNjf5Mo8QA1hm2UaZJBxcjOwJhWwBqVgy/xjg+IZaqgV1UUTGb4K9
 eec=
X-SBRS: 2.7
X-MesageID: 3682997
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,322,1559534400"; 
   d="scan'208";a="3682997"
Date: Mon, 29 Jul 2019 10:53:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190729085351.gtfuzyosb3zokgv4@Air-de-Roger>
References: <20190726203222.4833-1-andrew.cooper3@citrix.com>
 <20190726203222.4833-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726203222.4833-3-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/xpti: Don't leak TSS-adjacent
 percpu data via Meltdown
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDk6MzI6MjJQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgWFBUSSB3b3JrIHJlc3RyaWN0ZWQgdGhlIHZpc2liaWxpdHkgb2YgbW9zdCBv
ZiBtZW1vcnksIGJ1dCBtaXNzZWQgYSBmZXcKPiBhc3BlY3RzIHdoZW4gaXQgY2FtZSB0byB0aGUg
VFNTLgo+IAo+IEdpdmVuIHRoYXQgdGhlIFRTUyBpcyBqdXN0IGFuIG9iamVjdCBpbiBwZXJjcHUg
ZGF0YSwgdGhlIDRrIG1hcHBpbmcgZm9yIGl0Cj4gY3JlYXRlZCBpbiBzZXR1cF9jcHVfcm9vdF9w
Z3QoKSBtYXBzIGFkamFjZW50IHBlcmNwdSBkYXRhLCBtYWtpbmcgaXQgYWxsCj4gbGVha2FibGUg
dmlhIE1lbHRkb3duLCBldmVuIHdoZW4gWFBUSSBpcyBpbiB1c2UuCj4gCj4gRnVydGhlcm1vcmUs
IG5vIGNhcmUgaXMgdGFrZW4gdG8gY2hlY2sgdGhhdCB0aGUgVFNTIGRvZXNuJ3QgY3Jvc3MgYSBw
YWdlCj4gYm91bmRhcnkuICBBcyBpdCB0dXJucyBvdXQsIHN0cnVjdCB0c3Nfc3RydWN0IGlzIGFs
aWduZWQgb24gaXRzIHNpemUgd2hpY2gKPiBkb2VzIHByZXZlbnQgaXQgc3RyYWRkbGluZyBhIHBh
Z2UgYm91bmRhcnksIGJ1dCB0aGlzIHdpbGwgY2Vhc2UgdG8gYmUgdHJ1ZQo+IG9uY2UgQ0VUIGFu
ZCBTaGFkb3cgU3RhY2sgc3VwcG9ydCBpcyBhZGRlZCB0byBYZW4uCj4gCj4gTW92ZSB0aGUgVFNT
IGludG8gdGhlIHBhZ2UgYWxpZ25lZCBwZXJjcHUgYXJlYSwgc28gbm8gYWRqYWNlbnQgZGF0YSBj
YW4gYmUKPiBsZWFrZWQuICBNb3ZlIHRoZSBkZWZpbml0aW9uIGZyb20gc2V0dXAuYyB0byB0cmFw
cy5jLCB3aGljaCBpcyBhIG1vcmUKPiBhcHByb3ByaWF0ZSBwbGFjZSBmb3IgaXQgdG8gbGl2ZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
