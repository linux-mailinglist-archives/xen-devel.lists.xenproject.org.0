Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884B276BCD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:41:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1Mv-00054d-9H; Fri, 26 Jul 2019 14:38:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+y56=VX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hr1Mt-00054Y-8e
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:38:47 +0000
X-Inumbo-ID: 118ef346-afb3-11e9-ae25-1be8a8111f16
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 118ef346-afb3-11e9-ae25-1be8a8111f16;
 Fri, 26 Jul 2019 14:38:44 +0000 (UTC)
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
IronPort-SDR: UrAH2+RvkuKjOcEUzVLN8TNcDqNHxXjdnvckEjosbifmeKWh/Zy/EF1HYJmcPbQlI4k0SbKbyN
 uHyoFvFJqe9+6PPz23KuRR3a8KF3Ox8LIIGlGKxLrHLnt78RLxFBLYfTLIxAxD7dMmyi5tGZQs
 Y8XDLgl/Ef2TssrLEoMGzPmHihJRRjH8lzEGFHvu6LSk0aTM2JhQZI2JMu5AIOZ3KWaeSk3tVN
 Xiu/BmKDe/711PHVHpi1BwO6Mb3Q1avLFw+VLst8C97wuemhsozjkZ4FDBQH6NrKO11QzwqUek
 b6I=
X-SBRS: 2.7
X-MesageID: 3614605
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3614605"
Date: Fri, 26 Jul 2019 16:38:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190726143829.umusp5ox7urpvkrm@Air-de-Roger>
References: <20190726135240.21745-1-andrew.cooper3@citrix.com>
 <20190726135240.21745-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726135240.21745-3-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/xpti: Don't leak TSS-adjacent
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

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDI6NTI6NDBQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
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
Y29tPgo+IC0tLQo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgICAgIHwgMiAtLQo+
ICB4ZW4vYXJjaC94ODYvdHJhcHMuYyAgICAgICAgICAgIHwgNiArKysrKysKPiAgeGVuL2FyY2gv
eDg2L3hlbi5sZHMuUyAgICAgICAgICB8IDIgKysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9j
ZXNzb3IuaCB8IDQgKystLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVu
L2FyY2gveDg2L3NldHVwLmMKPiBpbmRleCBkMjAxMTkxMGZhLi4xYTJmZmM0ZGMxIDEwMDY0NAo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMK
PiBAQCAtMTAwLDggKzEwMCw2IEBAIHVuc2lnbmVkIGxvbmcgX19yZWFkX21vc3RseSB4ZW5fcGh5
c19zdGFydDsKPiAgCj4gIHVuc2lnbmVkIGxvbmcgX19yZWFkX21vc3RseSB4ZW5fdmlydF9lbmQ7
Cj4gIAo+IC1ERUZJTkVfUEVSX0NQVShzdHJ1Y3QgdHNzX3N0cnVjdCwgaW5pdF90c3MpOwo+IC0K
PiAgY2hhciBfX3NlY3Rpb24oIi5ic3Muc3RhY2tfYWxpZ25lZCIpIF9fYWxpZ25lZChTVEFDS19T
SVpFKQo+ICAgICAgY3B1MF9zdGFja1tTVEFDS19TSVpFXTsKPiAgCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni90cmFwcy5jIGIveGVuL2FyY2gveDg2L3RyYXBzLmMKPiBpbmRleCAzOGQxMjAx
M2RiLi5lNGI0NTg3OTU2IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni90cmFwcy5jCj4gKysr
IGIveGVuL2FyY2gveDg2L3RyYXBzLmMKPiBAQCAtMTA4LDYgKzEwOCwxMiBAQCBpZHRfZW50cnlf
dCBfX3NlY3Rpb24oIi5ic3MucGFnZV9hbGlnbmVkIikgX19hbGlnbmVkKFBBR0VfU0laRSkKPiAg
LyogUG9pbnRlciB0byB0aGUgSURUIG9mIGV2ZXJ5IENQVS4gKi8KPiAgaWR0X2VudHJ5X3QgKmlk
dF90YWJsZXNbTlJfQ1BVU10gX19yZWFkX21vc3RseTsKPiAgCj4gKy8qCj4gKyAqIFRoZSBUU1Mg
aXMgc21hbGxlciB0aGFuIGEgcGFnZSwgYnV0IHdlIGdpdmUgaXQgYSBmdWxsIHBhZ2UgdG8gYXZv
aWQKPiArICogYWRqYWNlbnQgcGVyLWNwdSBkYXRhIGxlYWtpbmcgdmlhIE1lbHRkb3duIHdoZW4g
WFBUSSBpcyBpbiB1c2UuCj4gKyAqLwo+ICtERUZJTkVfUEVSX0NQVV9QQUdFX0FMSUdORUQoc3Ry
dWN0IF9fYWxpZ25lZChQQUdFX1NJWkUpIHRzc19zdHJ1Y3QsIGluaXRfdHNzKTsKCkNhbid0IHlv
dSBidW5kbGUgdGhlIF9fYWxpZ25lZCBhdHRyaWJ1dGUgaW4KREVGSU5FX1BFUl9DUFVfUEFHRV9B
TElHTkVEIGl0c2VsZj8KCiNkZWZpbmUgREVGSU5FX1BFUl9DUFVfUEFHRV9BTElHTkVEKHR5cGUs
IG5hbWUpIFwKICAgIF9fREVGSU5FX1BFUl9DUFUodHlwZSBfX2FsaWduZWQoUEFHRV9TSVpFKSwg
XyMjbmFtZSwgLnBhZ2VfYWxpZ25lZCkKCkkgaGF2ZW4ndCB0ZXN0ZWQgdGhpcyBUQkguIEknbSBh
bHNvIG5vdCBhYmxlIHRvIGZpbmQgaG93IF9fdHlwZW9mX18KKHVzZWQgYnkgX19ERUZJTkVfUEVS
X0NQVSkgYmVoYXZlcyByZWdhcmRpbmcgYXR0cmlidXRlcywgYnV0IEknbSBxdWl0ZQpzdXJlIGl0
IGtlZXBzIHRoZW0gb3IgZWxzZSBsb3RzIG9mIHRoaW5ncyB3aWxsIGJyZWFrLgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
