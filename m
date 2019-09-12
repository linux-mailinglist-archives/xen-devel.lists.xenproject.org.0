Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39503B0D09
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 12:37:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8MRA-0005Ht-FN; Thu, 12 Sep 2019 10:34:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1F3=XH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i8MR9-0005Ho-BR
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 10:34:51 +0000
X-Inumbo-ID: f1c89dc6-d548-11e9-83e7-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1c89dc6-d548-11e9-83e7-12813bfff9fa;
 Thu, 12 Sep 2019 10:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568284489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=j7N56ZXuaUTuvSCN+xPUjx88r3bI11ahuLtSM1mvcuo=;
 b=hogY4HDzp4VYalcqecCNCWeMeL4jf2O0HhdJ8/zrsKonW0CQlddriZT1
 +tCS4pS4qXOBNZYOOGVBd+pCSJSM0HMbxehd1QVBX/J1ze1mqHpCWj2WQ
 49Rg9VO8EK3ftKFkMwPvPpx8mFCLTo5IvUxHocI8zC9Nny4KUhzIYvn0l E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: s0i6D4twckBA5s4O25HEIf67spaU4LucTLkpv3+z1Pr+XeU6tzCs3u+hHzDUOSQXzaRarzyINc
 jbtdfRRBHD7JMdNzLyVsDa1EaSd0+QTSCsGkJ/xj5fO+2JbIW+0pE2gfZ9lOW0QsIgOulOAcfw
 WrthLIl6audaZ9ZQLxW1jnkMkWpAxrWpQnDMO50rnWDTqLpRNQK+zVxd3qL3eryu6qH5d4Z6g5
 rRMa43IDsEW6VbkydL6QOgYu6YQ2LFC1saFNCwqUpFnk+NgCGvpQB3X1VHMLOa+mIv3SefAupP
 8zU=
X-SBRS: 2.7
X-MesageID: 5474281
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5474281"
Date: Thu, 12 Sep 2019 12:34:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190912103441.le4zets5ey73uxwl@Air-de-Roger>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <f58f9215-4005-9c1d-0701-1e7fe705b786@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f58f9215-4005-9c1d-0701-1e7fe705b786@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 3/9] x86/mm: honor opt_pcid also for 32-bit
 PV domains
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDU6MjI6NTFQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSSBjYW4ndCBzZWUgYW55IHRlY2huaWNhbCBvciBwZXJmb3JtYW5jZSByZWFzb24gd2h5
IHdlIHNob3VsZCB0cmVhdAo+IDMyLWJpdCBQViBkaWZmZXJlbnQgZnJvbSA2NC1iaXQgUFYgaW4g
dGhpcyByZWdhcmQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKVGhlIG9yaWdpbmFsIGNvbW1pdCBtZW50aW9ucyB0aGF0IFBDSUQgZG9lc24ndCBp
bXByb3ZlIHBlcmZvcm1hbmNlIGZvcgpub24tWFBUSSBkb21haW5zLCBidXQgaXQgZG9lc24ndCBt
ZW50aW9uIHdoZXRoZXIgaXQgbWFrZXMgcGVyZm9ybWFuY2UKd29yc2UuIFRoZSBjaGFuZ2UgTEdU
TSwgaWYgeW91IGFyZSBmaW5lIHBlcmZvcm1hbmNlIHdpc2U6CgpSZXZpZXdlZC1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9wdi9kb21haW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4uYwo+IEBAIC0xODAs
NyArMTgwLDI0IEBAIGludCBzd2l0Y2hfY29tcGF0KHN0cnVjdCBkb21haW4gKmQpCj4gICAgICBk
LT5hcmNoLng4N19maXBfd2lkdGggPSA0Owo+ICAKPiAgICAgIGQtPmFyY2gucHYueHB0aSA9IGZh
bHNlOwo+IC0gICAgZC0+YXJjaC5wdi5wY2lkID0gZmFsc2U7Cj4gKwo+ICsgICAgaWYgKCB1c2Vf
aW52cGNpZCAmJiBjcHVfaGFzX3BjaWQgKQo+ICsgICAgICAgIHN3aXRjaCAoIEFDQ0VTU19PTkNF
KG9wdF9wY2lkKSApCj4gKyAgICAgICAgewo+ICsgICAgICAgIGNhc2UgUENJRF9PRkY6Cj4gKyAg
ICAgICAgY2FzZSBQQ0lEX1hQVEk6Cj4gKyAgICAgICAgICAgIGQtPmFyY2gucHYucGNpZCA9IGZh
bHNlOwo+ICsgICAgICAgICAgICBicmVhazsKPiArCj4gKyAgICAgICAgY2FzZSBQQ0lEX0FMTDoK
PiArICAgICAgICBjYXNlIFBDSURfTk9YUFRJOgo+ICsgICAgICAgICAgICBkLT5hcmNoLnB2LnBj
aWQgPSB0cnVlOwo+ICsgICAgICAgICAgICBicmVhazsKPiArCj4gKyAgICAgICAgZGVmYXVsdDoK
PiArICAgICAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4gKyAgICAgICAgICAgIGJyZWFr
Owo+ICsgICAgICAgIH0KClRoaXMgY2h1bmsgaXMgKGZ1bmN0aW9uYWxpdHkgd2lzZSkgZXhhY3Rs
eSB0aGUgc2FtZSBhcyB0aGUgb25lIGluCnB2X2RvbWFpbl9pbml0aWFsaXNlLCBpdCBtaWdodCBi
ZSBnb29kIHRvIHB1dCB0aGlzIGluIGEgc2VwYXJhdGUKaGVscGVyPwoKPiAgCj4gICAgICByZXR1
cm4gMDsKPiAgCj4gQEAgLTMxMiw3ICszMjksNyBAQCBpbnQgcHZfZG9tYWluX2luaXRpYWxpc2Uo
c3RydWN0IGRvbWFpbiAqCj4gIAo+ICAgICAgZC0+YXJjaC5wdi54cHRpID0gaXNfaGFyZHdhcmVf
ZG9tYWluKGQpID8gb3B0X3hwdGlfaHdkb20gOiBvcHRfeHB0aV9kb211Owo+ICAKPiAtICAgIGlm
ICggIWlzX3B2XzMyYml0X2RvbWFpbihkKSAmJiB1c2VfaW52cGNpZCAmJiBjcHVfaGFzX3BjaWQg
KQoKVGhpcyBpc19wdl8zMmJpdF9kb21haW4gaXMgYWxyZWFkeSBwb2ludGxlc3MsIGlzXzMyYml0
X3B2IGdldHMKdW5jb25kaXRpb25hbGx5IHNldCB0byAwIGp1c3QgdHdvIGxpbmVzIGFib3ZlLgoK
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
