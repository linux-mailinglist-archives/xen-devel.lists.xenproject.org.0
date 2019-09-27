Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E2EC052D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:31:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpMJ-0006E6-00; Fri, 27 Sep 2019 12:28:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jwcO=XW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDpMH-0006Dw-DM
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:28:25 +0000
X-Inumbo-ID: 4c9aaf20-e122-11e9-bf31-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 4c9aaf20-e122-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 12:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569587304;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yc2wEIkeuf48+bMzdQmtEpP6Duuldz48Og6d7+EeJjg=;
 b=Jdi8Su31rXIIw+dlHW+RI88fsxTwjXmmKeq14WtghHS+S/nc1E60szgT
 5m1x22MWMyb+2WeE4uHBMOYEHVK1A50SGywknf7T7JHPfEIBowFTK+j/q
 x0YQS8Cmx5BwfDrri4cEf6vOS55acyGgrtoNY2yZbPhm2kkQAMl1bL0Xu 8=;
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
IronPort-SDR: SynCtswvl+aC+1xElJfQJjm8HzsdgioieuWIgKqun9r6iBp/NWnoYt72SXiMtCN1C4GXS7BdmN
 QTkAeA8+dtc6CVRmvFvVOFdrG1ODydv+lCDI3FrRfICtrMsp9+S6cBOBkhPtOROqS6gVSuSu4b
 rVf4po/ckA38eK1QcGTMxYuZZYHiunls8sqUimDFvvH/+byptRV7SJb0N3YjL0dDyvQ0SnEkqO
 +CpIJd69mVmDLd6HC64lXFVBsRIrIPvXs1XhRiIeKoHrXvM58oKfRMbcfbgWxUCLvm+spAXJl3
 Vfg=
X-SBRS: 2.7
X-MesageID: 6236108
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6236108"
Date: Fri, 27 Sep 2019 14:28:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190927122814.rjd4mzj7fohtq47d@Air-de-Roger>
References: <20190927114554.11513-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927114554.11513-1-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] iommu: fix PVH dom0 settings
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTI6NDU6NTRQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFBWSCBkb20wIG11c3Qgb3BlcmF0ZSB3aXRoIHRoZSBpb21tdSBzZXR0aW5ncyBpbiAn
c3RyaWN0JyBtb2RlIGkuZS4gb25seSB0aGUKPiBkb21haW4ncyBvd24gcGFnZXMgd2lsbCBiZSBt
YXBwZWQgaW4gdGhlIElPTU1VLiBUaGUgY2hlY2tfaHdkb21fcmVxcygpIGlzCj4gc3VwcG9zZWQg
dG8gZW5zdXJlIHRoaXMuIFVuZm9ydHVuYXRlbHkgdGhlIHRlc3QgZm9yIGEgUFZIIGRvbTAgaXMg
bWFkZQo+IHVzaW5nIHBhZ2luZ19tb2RlX3RyYW5zbGF0ZSgpIGFuZCwgd2hlbiBjb21taXQgZjg5
ZjU1NTggInJlbW92ZSBsYXRlCj4gKG9uLWRlbWFuZCkgY29uc3RydWN0aW9uIG9mIElPTU1VIHBh
Z2UgdGFibGVzIiBtb3ZlZCB0aGUgY2FsbCBvZgo+IGNoZWNrX2h3ZG9tX3JlcXMoKSBmcm9tIGlv
bW11X2h3ZG9tX2luaXQoKSB0byBpb21tdV9kb21haW5faW5pdCgpLCB0aGF0Cj4gdGVzdCBiZWNh
bWUgaW5lZmZlY3RpdmUgKGJlY2F1c2UgaW9tbXVfZG9tYWluX2luaXQoKSBpcyBjYWxsZWQgYmVm
b3JlCj4gcGFnaW5nX2VuYWJsZSgpKS4KPiAKPiBUaGlzIHBhdGNoIHJlcGxhY2VzIHRoZSB0ZXN0
IG9mIHBhZ2luZ19tb2RlX3RyYW5zbGF0ZSgpIHdpdGggYSB0ZXN0IG9mCj4gaGFwX2VuYWJsZWQo
KSwgYW5kIGFsc28gdmVyaWZpZXMgJ3N0cmljdCcgbW9kZSBpcyB0dXJuZWQgb24gaW4KPiBhcmNo
X2lvbW11X2NoZWNrX2F1dG90cmFuc2xhdGVkX2h3ZG9tKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTog
UGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiBSZXBvcnRlZC1ieTogUm9n
ZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
b21tdS5jICAgICB8IDYgKysrLS0tCj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21t
dS5jIHwgMyArKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gaW5kZXggMjczM2IzMjBlYy4uOGI1
NTBmOTA5YiAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4g
KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+IEBAIC0xNTQsMTMgKzE1NCwx
MyBAQCBjdXN0b21fcGFyYW0oImRvbTAtaW9tbXUiLCBwYXJzZV9kb20wX2lvbW11X3BhcmFtKTsK
PiAgCj4gIHN0YXRpYyB2b2lkIF9faHdkb21faW5pdCBjaGVja19od2RvbV9yZXFzKHN0cnVjdCBk
b21haW4gKmQpCj4gIHsKPiAtICAgIGlmICggaW9tbXVfaHdkb21fbm9uZSB8fCAhcGFnaW5nX21v
ZGVfdHJhbnNsYXRlKGQpICkKPiArICAgIGlmICggaW9tbXVfaHdkb21fbm9uZSB8fCAhaGFwX2Vu
YWJsZWQoZCkgKQoKU2luY2UgZG9tMCBQVkggY2FuIGFsc28gYmUgdXNlZCB3aXRoIHNoYWRvdyBw
YWdpbmcgKG5vdCBzdXJlIGhvdwp1c2VmdWwgdGhhdCBpcyBUQkgpLCBJJ20gbm90IHN1cmUgZXhw
bGljaXRseSBjaGVja2luZyBmb3IgaGFwIGlzIGZpbmUuCldoYXQgYWJvdXQgdXNpbmcgaXNfaHZt
X2RvbWFpbiBpbnN0ZWFkPwoKVGhhdCBvdWdodCB0byBjb3ZlciBib3RoIHNoYWRvdyBhbmQgaGFw
LCBhbmQgYSBjbGFzc2ljIFBWIGRvbTAgd29uJ3QKYmUgYWZmZWN0ZWQgYnkgaXQgKHdoaWNoIGlz
IHRoZSBpbnRlbnRpb24pLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
