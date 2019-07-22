Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019536FF09
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 13:54:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpWoq-00009i-RX; Mon, 22 Jul 2019 11:49:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PbCh=VT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hpWop-00009d-6z
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 11:49:27 +0000
X-Inumbo-ID: be68c3fc-ac76-11e9-a781-f70dc11b088f
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be68c3fc-ac76-11e9-a781-f70dc11b088f;
 Mon, 22 Jul 2019 11:49:21 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1mCTpT1ERQMi59VucTeNhVPzFqQx5gL8OG7pOcgGfV1z6MKf+1dh2TqG04v8tq0PwVLFPOMMcE
 E68Cz5p57JwOxF33nMWxBhQpbENTv6pMycP+PlWiYuOd90hGEpVals8XfGUdeF8+QTYYdazMxT
 Jwtzbpjt4LQWXi/HI244TTdW0zUqtfP62+biOr2Bgnsof9r8kRHRRtWWdFjkQuQYIq+qBcI5US
 sDQujKwK8kR9sXn+0Oa+baE/hxMo68lwUfLp/pLoacewt9o6gVtbpnbS2h6ypQgurSsKvN5I9Y
 r/8=
X-SBRS: 2.7
X-MesageID: 3338118
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,294,1559534400"; 
   d="scan'208";a="3338118"
Date: Mon, 22 Jul 2019 13:48:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Roman Shaposhnik'
 <roman@zededa.com>
Message-ID: <20190722114859.dtm4w5ff75uedu24@Air-de-Roger>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <CAMmSBy8CcG08-+-F6fvwmH1oEKpsV8OGEco94g04dZcyyFWKbw@mail.gmail.com>
 <b2e4ed0b178e41ebbc8f1db622ecae95@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2e4ed0b178e41ebbc8f1db622ecae95@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDg6MjA6MzZBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBbc25pcF0KPiA+ID4gKFhFTikg
RG9tYWluIGhlYXAgaW5pdGlhbGlzZWQKPiA+ID4gKFhFTikgQUNQSTogMzIvNjRYIEZBQ1MgYWRk
cmVzcyBtaXNtYXRjaCBpbiBGQURUIC0KPiA+ID4gOGNlOGVmODAvMDAwMDAwMDAwMDAwMDAwMCwg
dXNpbmcgMzIKPiA+ID4gKFhFTikgSU9BUElDWzBdOiBhcGljX2lkIDIsIHZlcnNpb24gMzIsIGFk
ZHJlc3MgMHhmZWMwMDAwMCwgR1NJIDAtMTE5Cj4gPiA+IChYRU4pIEVuYWJsaW5nIEFQSUMgbW9k
ZTogIEZsYXQuICBVc2luZyAxIEkvTyBBUElDcwo+ID4gPiAoWEVOKSBbVlQtRF0gIFJNUlIgYWRk
cmVzcyByYW5nZSA4ZDgwMDAwMC4uOGZmZmZmZmYgbm90IGluIHJlc2VydmVkCj4gPiA+IG1lbW9y
eTsgbmVlZCAiaW9tbXVfaW5jbHVzaXZlX21hcHBpbmc9MSI/Cj4gCj4gVGhpcyBpcyB5b3VyIHBy
b2JsZW0uIEluIHZlcnNpb25zIHByaW9yIHRvIDQuMTEgKEkgdGhpbmssIGFuZCBjZXJ0YWlubHkg
NC4xMikgaW9tbXVfaW5jbHVzaXZlX21hcHBpbmcgdXNlZCB0byBkZWZhdWx0IG9uLCB3aGVyZWFz
IG5vdyBpdCBhcHBlYXJzIHRvIGRlZmF1bHQgb2ZmLiBJbiBtb3N0IGNpcmN1bXN0YW5jZXMgdGhp
cyBpcyBmaW5lIGJlY2F1c2UgdGhlcmUgaXMgYSBuZXcgZmxhZywgaW9tbXVfaHdkb21fcmVzZXJ2
ZWQsIHdoaWNoIGRlZmF1bHRzIG9uIGFuZCB0aGlzIG1ha2VzIHN1cmUgdGhhdCBhbGwgZTgyMCBy
ZXNlcnZlZCByZWdpb25zIGFyZSBpZGVudGl0eSBtYXBwZWQgKHdoaWNoIHVzdWFsbHkgY292ZXJz
IHVuZGVjbGFyZWQgUk1SUnMpLiBZb3UgaGF2ZSB0aGUgb3Bwb3NpdGUgcHJvYmxlbS4uLiBhIGRl
Y2xhcmVkIFJNUlIgd2hpY2ggaXMgbm90IHJlc2VydmVkLCBzbyB5b3Ugd2lsbCBuZWVkIGlvbW11
X2luY2x1c2l2ZV9tYXBwaW5nLgoKSSB0aGluayB0aGVyZSdzIGEgYnVnIGluIHRoZSBpbml0aWFs
aXphdGlvbiBvZiBpb21tdSBmb3IgYSBQViBkb20wLAp3aGljaCBsZWF2ZXMgZG9tMCB3aXRob3V0
IHJtcnIgZW50cmllcy4gQ2FuIHlvdSB0cnkgdGhlIHBhdGNoIGJlbG93CmFuZCByZXBvcnQgd2hl
dGhlciBpdCBzb2x2ZXMgeW91ciBpc3N1ZT8KClRoYW5rcywgUm9nZXIuCi0tLTg8LS0tCmRpZmYg
LS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvaW9tbXUuYwppbmRleCA3OWVjNjcxOWY1Li45ZDkxZjBkNjMzIDEwMDY0NAotLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2lvbW11LmMKQEAgLTE4NSw3ICsxODUsNyBAQCB2b2lkIF9faHdkb21faW5pdCBpb21t
dV9od2RvbV9pbml0KHN0cnVjdCBkb21haW4gKmQpCiAgICAgcmVnaXN0ZXJfa2V5aGFuZGxlcign
bycsICZpb21tdV9kdW1wX3AybV90YWJsZSwgImR1bXAgaW9tbXUgcDJtIHRhYmxlIiwgMCk7CiAK
ICAgICBoZC0+c3RhdHVzID0gSU9NTVVfU1RBVFVTX2luaXRpYWxpemluZzsKLSAgICBoZC0+bmVl
ZF9zeW5jID0gaW9tbXVfaHdkb21fc3RyaWN0ICYmICFpb21tdV91c2VfaGFwX3B0KGQpOworICAg
IGhkLT5uZWVkX3N5bmMgPSAhaW9tbXVfdXNlX2hhcF9wdChkKTsKICAgICBpZiAoIG5lZWRfaW9t
bXVfcHRfc3luYyhkKSApCiAgICAgewogICAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
