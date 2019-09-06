Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F1DABA99
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 16:18:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6F1x-0008FS-3r; Fri, 06 Sep 2019 14:16:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtaX=XB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i6F1w-0008FN-0i
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 14:16:04 +0000
X-Inumbo-ID: db6e5026-d0b0-11e9-978d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db6e5026-d0b0-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 14:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567779363;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tSw5rNpIP8cHDbAcDoO+Uqk25VJqqB0pSknbIFjKmrw=;
 b=MKub/K/RFrFea/kvY7slQttmDXgE0WUO9ra1FNDWtfnx6CldyC6b0klB
 QBqBrDHsNJmjblTVFqxq9QJc90BD7jxZoYJRfPEVEE9/LknXxuxbjU6Mz
 /uf+ZG1AZG3k7gNz9fNMrOlPBKxxbBQd2im19SM0oudJNhveYe1Uh+Qwc k=;
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
IronPort-SDR: EFOyIWZYLX7Fb//nTlanvgJvIHdFpStEAmKdZKZbv2cfrFOTdJtUoKCVEazHXXZvo10evGXoJV
 d1PuULZX3A9xDBmqDx6lxU/GNYpDbZTq+weUlPdkGtBrQNHJp2nylqt3RQ7IvwBCQGE2flwunJ
 8lnGfytiYyZuDZSaYXhi+5iH/mSopmEh8IMJbmZN5LeY6wqLp1iPmNw1CV5mwJQHl+c91SG0gl
 p8+JnaLgQMUw6o0jlqRngCOj7ihAAOs8VQAk9nTfnNJJmI0gNTdEi7TvqbbmqfdOWeSO5ZRy3F
 CG4=
X-SBRS: 2.7
X-MesageID: 5515372
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5515372"
Date: Fri, 6 Sep 2019 16:15:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190906141551.pinenzhdzdjmmhlo@Air-de-Roger>
References: <20190905132703.5554-1-roger.pau@citrix.com>
 <20190905132703.5554-3-roger.pau@citrix.com>
 <ca15dc5b2939422889c91e6783f0bbfb@AMSPEX02CL03.citrite.net>
 <e87637a4f50248b8be5f5057223c9cbe@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e87637a4f50248b8be5f5057223c9cbe@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 2/2] sysctl/libxl: choose a sane default
 for HAP
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDM6NTQ6MTBQTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFhlbi1kZXZlbCA8
eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBQYXVs
IER1cnJhbnQKPiA+IFNlbnQ6IDA1IFNlcHRlbWJlciAyMDE5IDE0OjUyCj4gPiBUbzogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwo+ID4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA+IDxrb25y
YWQud2lsa0BvcmFjbGUuY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4
LmNvbT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsKPiA+IEdlb3JnZSBEdW5sYXAgPEdl
b3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+OyBKYW4gQmV1bGljaAo+ID4gPGpiZXVsaWNoQHN1c2UuY29tPjsgQW50aG9ueSBQZXJhcmQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0
cml4LmNvbT47Cj4gPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5j
b20+OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gU3ViamVjdDog
UmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MiAyLzJdIHN5c2N0bC9saWJ4bDogY2hvb3NlIGEgc2Fu
ZSBkZWZhdWx0IGZvciBIQVAKPiA+IAo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+
ID4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPiBT
ZW50OiAwNSBTZXB0ZW1iZXIgMjAxOSAxNDoyNwo+ID4gPiBUbzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCj4gPiA+IENjOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBXZWkgTGl1Cj4gPiA+
IDx3bEB4ZW4ub3JnPjsgQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsKPiA+ID4gR2Vvcmdl
IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPjsgSnVsaWVuIEdyYWxsCj4gPiA+IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEtv
bnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3Rh
YmVsbGluaQo+ID4gPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbSAoWGVuLm9yZykgPHRp
bUB4ZW4ub3JnPjsgVm9sb2R5bXlyIEJhYmNodWsKPiA+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFt
LmNvbT47Cj4gPiA+IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiA+
IFN1YmplY3Q6IFtQQVRDSCB2MiAyLzJdIHN5c2N0bC9saWJ4bDogY2hvb3NlIGEgc2FuZSBkZWZh
dWx0IGZvciBIQVAKPiA+ID4KPiA+ID4gQ3VycmVudCBsaWJ4bCBjb2RlIHdpbGwgYWx3YXlzIGVu
YWJsZSBIYXJkd2FyZSBBc3Npc3RlZCBQYWdpbmcgKEhBUCksCj4gPiA+IGV4cGVjdGluZyB0aGF0
IHRoZSBoeXBlcnZpc29yIHdpbGwgZmFsbGJhY2sgdG8gc2hhZG93IGlmIEhBUCBpcyBub3QKPiA+
ID4gYXZhaWxhYmxlLiBXaXRoIHRoZSBjaGFuZ2VzIHRvIHRoZSBkb21haW4gYnVpbGRlciB0aGF0
J3Mgbm90IHRoZSBjYXNlCj4gPiA+IGFueSBsb25nZXIsIGFuZCB0aGUgaHlwZXJ2aXNvciB3aWxs
IHJhaXNlIGFuIGVycm9yIGlmIEhBUCBpcyBub3QKPiA+ID4gYXZhaWxhYmxlIGluc3RlYWQgb2Yg
c2lsZW50bHkgZmFsbGluZyBiYWNrIHRvIHNoYWRvdy4KPiA+ID4KPiA+ID4gSW4gb3JkZXIgdG8g
a2VlcCB0aGUgcHJldmlvdXMgZnVuY3Rpb25hbGl0eSByZXBvcnQgd2hldGhlciBIQVAgaXMKPiA+
ID4gYXZhaWxhYmxlIG9yIG5vdCBpbiBYRU5fU1lTQ1RMX3BoeXNpbmZvLCBzbyB0aGF0IHRoZSB0
b29sc3RhY2sgY2FuCj4gPiA+IHNlbGVjdCBhIHNhbmUgZGVmYXVsdCBpZiB0aGVyZSdzIG5vIGV4
cGxpY2l0IHVzZXIgc2VsZWN0aW9uIG9mIHdoZXRoZXIKPiA+ID4gSEFQIHNob3VsZCBiZSB1c2Vk
Lgo+ID4gPgo+ID4gPiBOb3RlIHRoYXQgb24gQVJNIGhhcmR3YXJlIEhBUCBjYXBhYmlsaXR5IGlz
IGFsd2F5cyByZXBvcnRlZCBzaW5jZSBpdCdzCj4gPiA+IGEgcmVxdWlyZWQgZmVhdHVyZSBpbiBv
cmRlciB0byBydW4gWGVuLgo+ID4gPgo+ID4gPiBGaXhlczogZDBjMGJhN2QzZGUgKCd4ODYvaHZt
L2RvbWFpbjogcmVtb3ZlIHRoZSAnaGFwX2VuYWJsZWQnIGZsYWcnKQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IAo+ID4gTEdU
TQo+ID4gCj4gPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4KPiA+IAo+ID4gPiAtLS0KPiA+ID4gQ2M6IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50
QGNpdHJpeC5jb20+Cj4gPiA+IC0tLQo+ID4gPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4gPiAgLSBB
bHNvIHJlcG9ydCBIQVAgY2FwYWJpbGl0eSBmb3IgQVJNLgo+ID4gPiAgLSBQcmludCBoYXAgY2Fw
YWJpbGl0eSBpbiB4bCBpbmZvLgo+ID4gPiAtLS0KPiA+ID4gIHRvb2xzL2xpYnhsL2xpYnhsLmMg
ICAgICAgICB8IDEgKwo+ID4gPiAgdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgIHwgOCArKysr
KysrLQo+ID4gPiAgdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIHwgMSArCj4gPiA+ICB0b29s
cy94bC94bF9pbmZvLmMgICAgICAgICAgfCA1ICsrKy0tCj4gPiA+ICB4ZW4vYXJjaC9hcm0vc3lz
Y3RsLmMgICAgICAgfCAyICstCj4gPiA+ICB4ZW4vYXJjaC94ODYvc3lzY3RsLmMgICAgICAgfCAy
ICsrCj4gPiA+ICB4ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggfCA0ICsrKysKPiA+ID4gIDcg
ZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+
ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsLmMgYi90b29scy9saWJ4bC9saWJ4bC5j
Cj4gPiA+IGluZGV4IGVjNzE1NzRlOTkuLjVjMGZjZjMyMGUgMTAwNjQ0Cj4gPiA+IC0tLSBhL3Rv
b2xzL2xpYnhsL2xpYnhsLmMKPiA+ID4gKysrIGIvdG9vbHMvbGlieGwvbGlieGwuYwo+ID4gPiBA
QCAtMzk5LDYgKzM5OSw3IEBAIGludCBsaWJ4bF9nZXRfcGh5c2luZm8obGlieGxfY3R4ICpjdHgs
IGxpYnhsX3BoeXNpbmZvICpwaHlzaW5mbykKPiA+ID4gICAgICBwaHlzaW5mby0+Y2FwX3B2ID0g
ISEoeGNwaHlzaW5mby5jYXBhYmlsaXRpZXMgJiBYRU5fU1lTQ1RMX1BIWVNDQVBfcHYpOwo+ID4g
PiAgICAgIHBoeXNpbmZvLT5jYXBfaHZtX2RpcmVjdGlvID0KPiA+ID4gICAgICAgICAgISEoeGNw
aHlzaW5mby5jYXBhYmlsaXRpZXMgJiBYRU5fU1lTQ1RMX1BIWVNDQVBfZGlyZWN0aW8pOwo+ID4g
PiArICAgIHBoeXNpbmZvLT5jYXBfaGFwID0gISEoeGNwaHlzaW5mby5jYXBhYmlsaXRpZXMgJiBY
RU5fU1lTQ1RMX1BIWVNDQVBfaGFwKTsKPiA+ID4KPiA+ID4gICAgICBHQ19GUkVFOwo+ID4gPiAg
ICAgIHJldHVybiAwOwo+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRl
LmMgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+ID4gPiBpbmRleCAwM2NlMTY2ZjRmLi42
YTU1NmRlYThmIDEwMDY0NAo+ID4gPiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+
ID4gPiArKysgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+ID4gPiBAQCAtMzgsNyArMzgs
MTMgQEAgaW50IGxpYnhsX19kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdChsaWJ4bF9fZ2Mg
KmdjLAo+ID4gPiAgICAgIGxpYnhsX19hcmNoX2RvbWFpbl9jcmVhdGVfaW5mb19zZXRkZWZhdWx0
KGdjLCBjX2luZm8pOwo+ID4gPgo+ID4gPiAgICAgIGlmIChjX2luZm8tPnR5cGUgIT0gTElCWExf
RE9NQUlOX1RZUEVfUFYpIHsKPiA+ID4gLSAgICAgICAgbGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0
KCZjX2luZm8tPmhhcCwgdHJ1ZSk7Cj4gPiA+ICsgICAgICAgIGxpYnhsX3BoeXNpbmZvIGluZm87
Cj4gPiA+ICsgICAgICAgIGludCByYyA9IGxpYnhsX2dldF9waHlzaW5mbyhDVFgsICZpbmZvKTsK
PiA+ID4gKwo+ID4gPiArICAgICAgICBpZiAocmMpCj4gPiA+ICsgICAgICAgICAgICByZXR1cm4g
cmM7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgbGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0KCZjX2lu
Zm8tPmhhcCwgaW5mby5jYXBfaGFwKTsKPiA+ID4gICAgICAgICAgbGlieGxfZGVmYm9vbF9zZXRk
ZWZhdWx0KCZjX2luZm8tPm9vcywgdHJ1ZSk7Cj4gPiA+ICAgICAgfQo+ID4gPgo+ID4gPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIGIvdG9vbHMvbGlieGwvbGlieGxf
dHlwZXMuaWRsCj4gPiA+IGluZGV4IGI2MTM5OWNlMzYuLjllMWY4NTE1ZDMgMTAwNjQ0Cj4gPiA+
IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbAo+ID4gPiArKysgYi90b29scy9saWJ4
bC9saWJ4bF90eXBlcy5pZGwKPiA+ID4gQEAgLTEwMjUsNiArMTAyNSw3IEBAIGxpYnhsX3BoeXNp
bmZvID0gU3RydWN0KCJwaHlzaW5mbyIsIFsKPiA+ID4gICAgICAoImNhcF9odm0iLCBib29sKSwK
PiA+ID4gICAgICAoImNhcF9wdiIsIGJvb2wpLAo+ID4gPiAgICAgICgiY2FwX2h2bV9kaXJlY3Rp
byIsIGJvb2wpLCAjIE5vIGxvbmdlciBIVk0gc3BlY2lmaWMKPiA+ID4gKyAgICAoImNhcF9oYXAi
LCBib29sKSwKPiAKPiBBY3R1YWxseSBKdWxpZW4ncyByZXZpZXcgb2Ygb25lIG9mIG15IHBhdGNo
ZXMgcG9pbnRzIG91dCB0aGF0IHRoaXMgaWRsIGNoYW5nZSBzaG91bGQgYmUgYWNjb21wYW5pZWQg
YnkgYW4gYXNzb2NpYXRlZCBMSUJYTF9IQVZFX0NBUF9IQVAgZGVmaW5pdGlvbi4KCk91Y2gsIHll
cywgSSBhbHdheXMgZm9yZ2V0IHRob3NlLiBJIHdpbGwgYWRkIG5vdywgYW5kIGtlZXAgeW91ciBS
QiBhbmQKSmFuJ3MgQWNrIHVubGVzcyBhbnkgb2YgeW91IHRlbGwgbWUgb3RoZXJ3aXNlLgoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
