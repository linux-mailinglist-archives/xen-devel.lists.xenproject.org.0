Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD0D1623D3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 10:48:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3zRo-00084e-5E; Tue, 18 Feb 2020 09:45:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NVht=4G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3zRm-00084Q-MD
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 09:45:42 +0000
X-Inumbo-ID: 6ce5c74c-5233-11ea-ade5-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ce5c74c-5233-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 09:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582019141;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=A/ix7XLusE3lvnc/JBeXp8KQ2lTH9s4eSOjfTwDNmiQ=;
 b=dIeY/N64jzSbdE/IuzgR8FXoipgeAa5JzpNqUjvek0VD93cnQ5Oyw8uc
 xZ1Tydf5wDVY1YEv643vjc7+FZfBClCq8V+FR1iXxVZNtcUuFbtfVKns1
 I409O4XoddJqIbzftk/UDNhwj/cKHkHVfgdCVsi5lvpY9L1f91jIqVBtB U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cSFvO5q27Jal1F7PuGJFrep/I3qC+G3TU02KOgI16+/CR/8ZqZ1RzjjA+dAdS5j3oVqlqxhREy
 V2arq/S3lYzZwTAiZgt8Du17O+rgqUFjUZ1Gh6UEzt6HDj4LTFuCyTkucJBZ+xG+fyseXSKP2p
 gCZr7stR3jiFBXzaqdeygFRqjxta9V4ty5cLMxuao8lFv3gaLNW5k12I68FKh8Z3uczzzyfXMh
 PPFKnOMzV/ZK9fB9BUOL+1wgp7xxQ5zxyif14V6gSnDXoes6WFE0RQALwyww3GMDq6PeK3LdD0
 zWw=
X-SBRS: 2.7
X-MesageID: 12968617
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12968617"
Date: Tue, 18 Feb 2020 10:45:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200218094534.GO4679@Air-de-Roger>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-4-roger.pau@citrix.com>
 <69fbdc2a-e64b-ff93-6392-661ca71a88a7@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69fbdc2a-e64b-ff93-6392-661ca71a88a7@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 3/6] x86: track when in #MC context
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMDc6Mjk6MjlQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIFJvZ2VyLAo+IAo+IE9uIDE3LzAyLzIwMjAgMTg6NDMsIFJvZ2VyIFBhdSBNb25u
ZSB3cm90ZToKPiA+IEFkZCBoZWxwZXJzIHRvIHRyYWNrIHdoZW4gZXhlY3V0aW5nIGluICNNQyBj
b250ZXh0LiBUaGlzIGlzIG1vZGVsZWQKPiA+IGFmdGVyIHRoZSBpbl9pcnEgaGVscGVycy4KPiA+
IAo+ID4gTm90ZSB0aGF0IHRoZXJlIGFyZSBubyB1c2VycyBvZiBpbl9tYygpIGludHJvZHVjZWQg
YnkgdGhlIGNoYW5nZSwKPiA+IGZ1cnRoZXIgdXNlcnMgd2lsbCBiZSBhZGRlZCBieSBmb2xsb3d1
cCBjaGFuZ2VzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gICB4ZW4vYXJjaC94ODYvY3B1L21jaGVjay9t
Y2UuYyB8IDIgKysKPiA+ICAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJkaXJxLmggfCA1ICsrKysr
Cj4gPiAgIHhlbi9pbmNsdWRlL3hlbi9pcnFfY3B1c3RhdC5oIHwgMSArCj4gPiAgIDMgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvY3B1L21jaGVjay9tY2UuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5jCj4gPiBp
bmRleCBkNjFlNTgyYWYzLi45M2VkNTc1MmFjIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2
L2NwdS9tY2hlY2svbWNlLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5j
Cj4gPiBAQCAtOTMsNyArOTMsOSBAQCB2b2lkIHg4Nl9tY2VfdmVjdG9yX3JlZ2lzdGVyKHg4Nl9t
Y2VfdmVjdG9yX3QgaGRscikKPiA+ICAgdm9pZCBkb19tYWNoaW5lX2NoZWNrKGNvbnN0IHN0cnVj
dCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+ID4gICB7Cj4gPiArICAgIG1jX2VudGVyKCk7Cj4gPiAg
ICAgICBfbWFjaGluZV9jaGVja192ZWN0b3IocmVncyk7Cj4gPiArICAgIG1jX2V4aXQoKTsKPiA+
ICAgfQo+ID4gICAvKgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaGFyZGly
cS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJkaXJxLmgKPiA+IGluZGV4IDM0ZTFiNDkyNjAu
LmFmM2VhYjZhNGQgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2hhcmRpcnEu
aAo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJkaXJxLmgKPiA+IEBAIC04LDYgKzgs
NyBAQCB0eXBlZGVmIHN0cnVjdCB7Cj4gPiAgIAl1bnNpZ25lZCBpbnQgX19zb2Z0aXJxX3BlbmRp
bmc7Cj4gPiAgIAl1bnNpZ25lZCBpbnQgX19sb2NhbF9pcnFfY291bnQ7Cj4gPiAgIAl1bnNpZ25l
ZCBpbnQgX19ubWlfY291bnQ7Cj4gPiArCXVuc2lnbmVkIGludCBtY19jb3VudDsKPiA+ICAgCWJv
b2xfdCBfX213YWl0X3dha2V1cDsKPiA+ICAgfSBfX2NhY2hlbGluZV9hbGlnbmVkIGlycV9jcHVz
dGF0X3Q7Cj4gPiBAQCAtMTgsNiArMTksMTAgQEAgdHlwZWRlZiBzdHJ1Y3Qgewo+ID4gICAjZGVm
aW5lIGlycV9lbnRlcigpCShsb2NhbF9pcnFfY291bnQoc21wX3Byb2Nlc3Nvcl9pZCgpKSsrKQo+
ID4gICAjZGVmaW5lIGlycV9leGl0KCkJKGxvY2FsX2lycV9jb3VudChzbXBfcHJvY2Vzc29yX2lk
KCkpLS0pCj4gPiArI2RlZmluZSBpbl9tYygpIAkobWNfY291bnQoc21wX3Byb2Nlc3Nvcl9pZCgp
KSAhPSAwKQo+ID4gKyNkZWZpbmUgbWNfZW50ZXIoKQkobWNfY291bnQoc21wX3Byb2Nlc3Nvcl9p
ZCgpKSsrKQo+ID4gKyNkZWZpbmUgbWNfZXhpdCgpCShtY19jb3VudChzbXBfcHJvY2Vzc29yX2lk
KCkpLS0pCj4gPiArCj4gPiAgIHZvaWQgYWNrX2JhZF9pcnEodW5zaWduZWQgaW50IGlycSk7Cj4g
PiAgIGV4dGVybiB2b2lkIGFwaWNfaW50cl9pbml0KHZvaWQpOwo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3hlbi9pcnFfY3B1c3RhdC5oIGIveGVuL2luY2x1ZGUveGVuL2lycV9jcHVzdGF0
LmgKPiA+IGluZGV4IDczNjI5ZjZlYzguLjEyYjkzMmZjMzkgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4v
aW5jbHVkZS94ZW4vaXJxX2NwdXN0YXQuaAo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lycV9j
cHVzdGF0LmgKPiA+IEBAIC0yNiw1ICsyNiw2IEBAIGV4dGVybiBpcnFfY3B1c3RhdF90IGlycV9z
dGF0W107Cj4gPiAgICNkZWZpbmUgbG9jYWxfaXJxX2NvdW50KGNwdSkJX19JUlFfU1RBVCgoY3B1
KSwgX19sb2NhbF9pcnFfY291bnQpCj4gPiAgICNkZWZpbmUgbm1pX2NvdW50KGNwdSkJCV9fSVJR
X1NUQVQoKGNwdSksIF9fbm1pX2NvdW50KQo+ID4gICAjZGVmaW5lIG13YWl0X3dha2V1cChjcHUp
CV9fSVJRX1NUQVQoKGNwdSksIF9fbXdhaXRfd2FrZXVwKQo+ID4gKyNkZWZpbmUgbWNfY291bnQo
Y3B1KQkJX19JUlFfU1RBVCgoY3B1KSwgbWNfY291bnQpCj4gCj4gVGhlIGhlYWRlciBpcyBvbmx5
IG1lYW50IHRvIGNvbnRhaW4gYXJjaC1pbmRlcGVuZGVudCBJUlEgc3RhdHMgKHNlZSBjb21tZW50
Cj4gYSBmZXcgbGluZXMgYWJvdmUpLiBUaGlzIGlzIHVubGlrZWx5IHRvIGJlIHVzZWQgb24gQXJt
LCBzbyBjYW4geW91IG1vdmUgdGhpcwo+IGludG8gYW4geDg2IHNwZWNpZmljIGhlYWRlcj8KClVo
LCBzdXJlLiBTb3JyeSBmb3Igbm90IHJlYWxpemluZyB0aGlzLgoKVGhhbmtzLCBSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
