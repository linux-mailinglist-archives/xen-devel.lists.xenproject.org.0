Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE299AE49
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 13:41:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i17uR-0004ia-GJ; Fri, 23 Aug 2019 11:39:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SWQP=WT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i17uQ-0004iV-0E
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 11:39:10 +0000
X-Inumbo-ID: 9e1fedc3-c59a-11e9-ade4-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e1fedc3-c59a-11e9-ade4-12813bfff9fa;
 Fri, 23 Aug 2019 11:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566560348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CwaJUEGyoqRriarNNzM6FWZ72WJYkA7tBpnpcRw3G9Q=;
 b=PadJ9nle1egazrF+7e7mVlQ5l3cVyWpltbXPvmTdBlo5M+tGNuhMlo41
 KocOskksl10eS6Ata6N/8UjVaJjuBEvuz5u02UrMfHNvaOrRf5WzyfRal
 xWP0Buu5YfFHDib9neC6Hp6DCHrG8INMYy8ZpBxsYBUWiyEPdIVDtnkYT 0=;
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
IronPort-SDR: Zz8QPGAYo91sfK2BBw5+B0ap7YsbbDClRZpkuEnF4SsGrpFVnxdRdLUtb+zpJxpzuIiJUfZuja
 Xd0neBcYTBCCiN53J8/lt0g7SpLxxpaNOYPlB1bgKBCSgbQhS+JxAYTAac3idhNnOttRh2T6rD
 mvNqJCKugda9MiEqF2FDl7VCfNYnhdwsDdLi3AXWF0S2EP6UeEc1QhvxtbIf+ThfHZ/xe2i+pf
 jPRWoLxOYCuR9Z90avZLfzaDzzoGFsk1+2vq0q0P7+5+GHOT4iBPtsuGdgblKZh0xwWQs6SB0B
 8Gc=
X-SBRS: 2.7
X-MesageID: 4887659
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,421,1559534400"; 
   d="scan'208";a="4887659"
Date: Fri, 23 Aug 2019 13:39:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190823113901.tgo253t3rxftvwnk@Air-de-Roger>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-10-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816172001.3905-10-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v6 09/10] iommu: tidy up iommu_use_hap_pt()
 and need_iommu_pt_sync() macros
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
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDY6MjA6MDBQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZXMgbWFjcm9zIHJlYWxseSBvdWdodCB0byBsaXZlIGluIHRoZSBjb21tb24geGVu
L2lvbW11LmggaGVhZGVyIHJhdGhlcgo+IHRoZW4gYmVpbmcgZGlzdHJpYnV0ZWQgYW1vbmdzdCBh
cmNoaXRlY3R1cmUgc3BlY2lmaWMgaW9tbXUgaGVhZGVycyBhbmQKPiB4ZW4vc2NoZWQuaC4gVGhp
cyBwYXRjaCBtb3ZlcyB0aGVtIHRoZXJlLgo+IAo+IE5PVEU6IERpc2FibGluZyAnc2hhcmVwdCcg
aW4gdGhlIGNvbW1hbmQgbGluZSBpb21tdSBvcHRpb25zIHNob3VsZCByZWFsbHkKPiAgICAgICBi
ZSBoYXJkIGVycm9yIG9uIEFSTSAoYXMgb3Bwb3NlZCB0byBqdXN0IGJlaW5nIGlnbm9yZWQpLCBz
byBhdm9pZAo+ICAgICAgIHBhcnNpbmcgdGhhdCBvcHRpb24gaWYgQ09ORklHX0FSTSBpcyBzZXQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNv
bT4KPiAtLS0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBHZW9yZ2UgRHVubGFw
IDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgo+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+
Cj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDYzog
VGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ2M6
IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4KPiBDYzogIlJv
Z2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBQcmV2aW91c2x5IHBh
cnQgb2YgaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZl
bC8yMDE5LTA3L21zZzAyMjY3Lmh0bWwKPiAtLS0KPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
aW9tbXUuYyB8ICAyICsrCj4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaCAgICAgfCAgMyAt
LS0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5oICAgICB8ICA0IC0tLS0KPiAgeGVuL2lu
Y2x1ZGUveGVuL2lvbW11LmggICAgICAgICB8IDExICsrKysrKysrKysrCj4gIHhlbi9pbmNsdWRl
L3hlbi9zY2hlZC5oICAgICAgICAgfCAgNiAtLS0tLS0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAxMyBp
bnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMK
PiBpbmRleCBkYzdiNzVmYWI2Li5iMjRiZTVmZmE2IDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2lvbW11LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21t
dS5jCj4gQEAgLTEwMiw4ICsxMDIsMTAgQEAgc3RhdGljIGludCBfX2luaXQgcGFyc2VfaW9tbXVf
cGFyYW0oY29uc3QgY2hhciAqcykKPiAgICAgICAgICAgICAgaW9tbXVfaHdkb21fcGFzc3Rocm91
Z2ggPSB2YWw7Cj4gICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJkb20w
LXN0cmljdCIsIHMsIHNzKSkgPj0gMCApCj4gICAgICAgICAgICAgIGlvbW11X2h3ZG9tX3N0cmlj
dCA9IHZhbDsKPiArI2lmbmRlZiBDT05GSUdfQVJNCj4gICAgICAgICAgZWxzZSBpZiAoICh2YWwg
PSBwYXJzZV9ib29sZWFuKCJzaGFyZXB0Iiwgcywgc3MpKSA+PSAwICkKPiAgICAgICAgICAgICAg
aW9tbXVfaGFwX3B0X3NoYXJlID0gdmFsOwo+ICsjZW5kaWYKCkkgd291bGQgcHJlZmVyIGlmIHlv
dSB3b3VsZCBwcmludCBhIHdhcm5pbmcgbWVzc2FnZSBpbiBpb21tdV9zZXR1cCBpZgppb21tdV9o
YXBfcHRfc2hhcmUgaXMgc2V0IHRvIGZhbHNlIG9uIEFSTSwgYW5kIHNldCBpdCB0byB0cnVlLgoK
VGhlIHJlc3QgTEdUTS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
