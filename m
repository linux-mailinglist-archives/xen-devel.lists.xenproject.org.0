Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C20B76B91
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:26:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr17h-0003YH-US; Fri, 26 Jul 2019 14:23:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+y56=VX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hr17g-0003Y7-BO
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:23:04 +0000
X-Inumbo-ID: e096e6e1-afb0-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e096e6e1-afb0-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:23:03 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: H8Zn7wHuiKL3O0dyMK5Bt2Nlp/zQeFkaOsi8dcTt/J2cPK+b/IoJPPC0eqaCSQ9y7Td4DRaI1I
 sG82cqn6dPJaimj2dFqOUD59UnWc4MMpbDiJEaJqM8fhiI+31EqU73jn/2gIJIen2f3a0Lm50u
 NsxzSnxR2qX/BGfMJsuEP9NEMYhtxxSebMHc8EyTjnMCTboMOGmSVxKYlXzQ2IcRUW7fX608Ox
 YHaqrHCsp8TscT1q4Of6A7fsKvdJhy5o70jk5lq2OWfaK/shDdsYRb9WZhbgwEKY84hAU0XyOT
 eCg=
X-SBRS: 2.7
X-MesageID: 3516764
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3516764"
Date: Fri, 26 Jul 2019 16:22:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190726142250.d7kxm6g46r56okzx@Air-de-Roger>
References: <20190726135240.21745-1-andrew.cooper3@citrix.com>
 <20190726135240.21745-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726135240.21745-2-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] xen/link: Introduce
 .bss.percpu.page_aligned
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDI6NTI6MzlQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBGdXR1cmUgY2hhbmdlcyBhcmUgZ29pbmcgdG8gbmVlZCB0byBwYWdlIGFsaWduIHNv
bWUgcGVyY3B1IGRhdGEuCj4gCj4gVGhpcyBtZWFucyB0aGF0IHRoZSBwZXJjcHUgYXJlYSBuZWVk
cyBzdWlhYmx5IGFsaWduaW5nIGluIHRoZSBCU1Mgc28gQ1BVMCBoYXMKPiBjb3JyZWN0bHkgYWxp
Z25lZCBkYXRhLiAgU2h1ZmZsZSB0aGUgZXhhY3QgbGluayBvcmRlciBvZiBpdGVtcyB3aXRoaW4g
dGhlIEJTUwo+IHRvIGdpdmUgLmJzcy5wZXJjcHUucGFnZV9hbGlnbmVkIGFwcHJvcHJpYXRlIGFs
aWdubWVudC4KPiAKPiBBZGRpdGlvbmFsbHksIGludHJvZHVjZSBERUZJTkVfUEVSX0NQVV9QQUdF
X0FMSUdORUQoKQo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNv
bT4KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBD
QzogVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPgo+IC0tLQo+
ICB4ZW4vYXJjaC9hcm0veGVuLmxkcy5TICAgfCA1ICsrKy0tCj4gIHhlbi9hcmNoL3g4Ni94ZW4u
bGRzLlMgICB8IDUgKysrLS0KPiAgeGVuL2luY2x1ZGUveGVuL3BlcmNwdS5oIHwgMiArKwo+ICAz
IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMK
PiBpbmRleCAxMmMxMDdmNDVkLi4wN2NiZGYyNTQzIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2Fy
bS94ZW4ubGRzLlMKPiArKysgYi94ZW4vYXJjaC9hcm0veGVuLmxkcy5TCj4gQEAgLTIwMSwxNCAr
MjAxLDE1IEBAIFNFQ1RJT05TCj4gICAgICAgICAqKC5ic3Muc3RhY2tfYWxpZ25lZCkKPiAgICAg
ICAgIC4gPSBBTElHTihQQUdFX1NJWkUpOwo+ICAgICAgICAgKiguYnNzLnBhZ2VfYWxpZ25lZCkK
PiAtICAgICAgICooLmJzcykKPiAtICAgICAgIC4gPSBBTElHTihTTVBfQ0FDSEVfQllURVMpOwoK
RG9uJ3QgeW91IGFsc28gbmVlZCBhOgoKLiA9IEFMSUdOKFBBR0VfU0laRSk7CgpoZXJlPyBPciBp
cyB0aGUgc2l6ZSBvZiAuYnNzLnBhZ2VfYWxpZ25lZCBhbHNvIGFsaWduZWQgdG8gcGFnZSBzaXpl
PwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
