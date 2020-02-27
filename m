Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D81B171855
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 14:13:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7Iv1-0002LL-Hc; Thu, 27 Feb 2020 13:09:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3dSL=4P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7Iv0-0002LG-LC
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 13:09:34 +0000
X-Inumbo-ID: 657094de-5962-11ea-967b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 657094de-5962-11ea-967b-12813bfff9fa;
 Thu, 27 Feb 2020 13:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582808973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=T2rtAigrlyMNcHdDkCrxsChHo5Pvb4R1bEspv/r2UFY=;
 b=JnWxegi1gseIu/5V/o1KqTaTCXZCCwer0ClqAPPWAAcOf+LQlkiJhPWa
 ds6bDZdiCKGmY8TA0Cd/3KQAXad1v3w15OSNh5MEVY5yl5gJ4lQyn2/cU
 xN9aww3jaffzvwaJz37UhRPIzKH9xtpvGXad/J5wFUYx1KIXzVhuno7qz 8=;
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
IronPort-SDR: Gii2cJwAMneP0k5VmH9781jIaGann1zhAXWzr1SyRtz9oGItlqT7GTUlGRB/KLvCpL55EepjBM
 /kx7beUymOK3ZtCAs6UJ0Cb8mSsddwJDRdvUZJjJbszUxBv4dN+UjyQkcenqKmLt4kPa5j2aFD
 QITpXSwc/IvV53AQIiuoNbDzaqpGaTaAnnb243dH+oioqLcAI/HgyzNoAne3TFo7CsAh7hL4qZ
 THMDLb8PCEO/1D6WCFMfDRErwdBKxpkb8pd0XUdKy3OLreR1c0opfqST9j9Cqt6h+Qnz7aNutV
 oMA=
X-SBRS: 2.7
X-MesageID: 13450608
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,492,1574139600"; d="scan'208";a="13450608"
Date: Thu, 27 Feb 2020 14:09:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200227130925.GO24458@Air-de-Roger.citrite.net>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-18-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226113355.2532224-18-anthony.perard@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [XEN PATCH v3 17/23] xen/build: Start using
 if_changed
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMTE6MzM6NDlBTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhpcyBwYXRjaCBzdGFydCB0byB1c2UgaWZfY2hhbmdlZCBpbnRyb2R1Y2VkIGlu
IGEgcHJldmlvdXMgY29tbWl0Lgo+IAo+IFdoZW5ldmVyIGlmX2NoYW5nZWQgaXMgY2FsbGVkLCB0
aGUgdGFyZ2V0IG11c3QgaGF2ZSBGT1JDRSBhcwo+IGRlcGVuZGVuY3kgc28gdGhhdCBpZl9jaGFu
Z2VkIGNhbiBjaGVjayBpZiB0aGUgY29tbWFuZCBsaW5lIHRvIGJlCj4gcnVuIGFzIGNoYW5nZWQs
IHNvIHRoZSBtYWNybyAkKHJlYWwtcHJlcmVxcykgbXVzdCBiZSB1c2UgdG8KICAgICAgXiBoYXMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gdXNlZAo+IGRpc2Nv
dmVyIHRoZSBkZXBlbmRlbmNpZXMgd2l0aG91dCAiRk9SQ0UiLgo+IAo+IFdoZW5ldmVyIGEgdGFy
Z2V0IGlzbid0IGluIG9iai15LCBpdCBzaG91bGQgYmUgYWRkZWQgdG8gZXh0cmEteSBzbyB0aGUK
PiAuKi5jbWQgZGVwZW5kZW5jeSBmaWxlIGFzc29jaWF0ZWQgd2l0aCB0aGUgdGFyZ2V0IGNhbiBi
ZSBsb2FkZWQuIFRoaXMKPiBpcyBkb25lIGZvciB4c20vZmxhc2svIGFuZCBib3RoIGNvbW1vbi9s
aWJ7ZWxmLGZkdH0vIGFuZAo+IGFyY2gveDg2L01ha2VmaWxlLgo+IAo+IEZvciB0aGUgdGFyZ2V0
cyB0aGF0IGdlbmVyYXRlcyAuKi5kIGRlcGVuZGVuY3kgZmlsZXMsIHRoZXJlJ3MgZ29pbmcgdG8K
ICAgICAgICAgICAgICAgICAgICAgICBeIGdlbmVyYXRlCj4gYmUgdHdvIGRlcGVuZGVuY3kgZmls
ZXMgKC4qLmQgYW5kIC4qLmNtZCkgdW50aWwgd2UgY2FuIG1lcmdlIHRoZW0KPiB0b2dldGhlciBp
biBhIGxhdGVyIHBhdGNoIHZpYSBmaXhkZXAgZnJvbSBMaW51eC4KPiAKPiBPbmUgY2xlYW51cCwg
bGliZWxmLXJlbG9jYXRlLm8gZG9lc24ndCBleGlzdCBhbnltb3JlLgo+IAo+IFdlIGltcG9ydCBj
bWRfbGQgYW5kIGNtZF9vYmpjb3B5IGZyb20gTGludXggdjUuNC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgeGVu
L1J1bGVzLm1rICAgICAgICAgICAgICAgfCA2OCArKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLQo+ICB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUgICAgICB8ICA0ICstLQo+ICB4ZW4v
YXJjaC94ODYvTWFrZWZpbGUgICAgICB8ICAxICsKPiAgeGVuL2FyY2gveDg2L2VmaS9NYWtlZmls
ZSAgfCAgNyArKy0tCj4gIHhlbi9jb21tb24vbGliZWxmL01ha2VmaWxlIHwgMTIgKysrKy0tLQo+
ICB4ZW4vY29tbW9uL2xpYmZkdC9NYWtlZmlsZSB8ICA5ICsrKy0tCj4gIHhlbi94c20vZmxhc2sv
TWFrZWZpbGUgICAgIHwgMTcgKysrKysrKy0tLQo+ICA3IGZpbGVzIGNoYW5nZWQsIDg0IGluc2Vy
dGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vUnVsZXMubWsg
Yi94ZW4vUnVsZXMubWsKPiBpbmRleCA4ODA3YTJlMjFjOTQuLmJiNGNlZDVmMGRkNCAxMDA2NDQK
PiAtLS0gYS94ZW4vUnVsZXMubWsKPiArKysgYi94ZW4vUnVsZXMubWsKPiBAQCAtNTIsNiArNTIs
MTggQEAgU1BFQ0lBTF9EQVRBX1NFQ1RJT05TIDo9IHJvZGF0YSAkKGZvcmVhY2ggYSwxIDIgNCA4
IDE2LCBcCj4gIAo+ICBpbmNsdWRlIE1ha2VmaWxlCj4gIAo+ICsjIExpbmtpbmcKPiArIyAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KCkknbSBub3Qgc3VyZSBhZGRpbmcgc3VjaCBkZWxpbWl0ZXJzIGlzIGhl
bHBmdWwsIHBlb3BsZSB0ZW5kIHRvIGZvcmdldAp0byBhZGQgdGhlbSBpbiBuZXdlciBjaGFuZ2Vz
IGFuZCBpdCBlbmRzIHVwIGJlaW5nIGFsbCBhc3ltbWV0cmljLgoKPiArCj4gK3F1aWV0X2NtZF9s
ZCA9IExEICAgICAgJEAKPiArY21kX2xkID0gJChMRCkgJChYRU5fTERGTEFHUykgLXIgLW8gJEAg
JChyZWFsLXByZXJlcXMpCj4gKwo+ICsjIE9iamNvcHkKPiArIyAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiArCj4gK3F1aWV0X2NtZF9vYmpjb3B5ID0gT0JKQ09QWSAkQAo+ICtjbWRfb2JqY29weSA9ICQo
T0JKQ09QWSkgJChPQkpDT1BZRkxBR1MpICQ8ICRACj4gKwo+ICBkZWZpbmUgZ2VuZGVwCj4gICAg
ICBpZm5lcSAoJCgxKSwkKHN1YnN0IC8sOiwkKDEpKSkKPiAgICAgICAgICBERVBTICs9ICQoZGly
ICQoMSkpLiQobm90ZGlyICQoMSkpLmQKPiBAQCAtMTYxLDI5ICsxNzMsNDcgQEAgZWxzZQo+ICAJ
JChDQykgJChjX2ZsYWdzKSAtYyAkPCAtbyAkQAo+ICBlbmRpZgo+ICAKPiAtJS5vOiAlLlMgTWFr
ZWZpbGUKPiAtCSQoQ0MpICQoYV9mbGFncykgLWMgJDwgLW8gJEAKPiArcXVpZXRfY21kX2NjX29f
UyA9IENDICAgICAgJEAKPiArY21kX2NjX29fUyA9ICQoQ0MpICQoYV9mbGFncykgLWMgJDwgLW8g
JEAKPiArCj4gKyUubzogJS5TIEZPUkNFCj4gKwkkKGNhbGwgaWZfY2hhbmdlZCxjY19vX1MpCj4g
Kwo+ICsKPiArcXVpZXRfY21kX29ial9pbml0X28gPSBJTklUX08gICRACgpJTklUX08gc2VlbXMg
a2luZCBvZiB3ZWlyZCwgbWF5YmUganVzdCB1c2luZyBDSEVDSyB3b3VsZCBiZSBPSz8KClRoZSBy
ZXN0IExHVE06CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
