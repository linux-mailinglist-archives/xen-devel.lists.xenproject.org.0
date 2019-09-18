Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A206B66FB
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 17:23:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAbka-0002OM-4W; Wed, 18 Sep 2019 15:20:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtMR=XN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAbkY-0002O6-C6
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 15:20:10 +0000
X-Inumbo-ID: cd2208c0-da27-11e9-a337-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd2208c0-da27-11e9-a337-bc764e2007e4;
 Wed, 18 Sep 2019 15:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568820009;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x4KStN9Gp/fA7CZzc7/0ghbqX6An3PkCMsepDr23SGI=;
 b=hYQIWkYCDdxHmHrEhC5vqiRkKouXmFqTNC8j0kzTx0GNUM0kY/CvDmQL
 TF304VGFGFnEP3IB9Hc5uu0RNnBuNp0CeN56mSE4zbRcG/F8Yj1tDK+Bz
 tQCzi1med3C7U2L2rY1bPaIoDUpvQkkHciWkAsOw14jlZhTjwOIdbeWrp A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /V+MQQ/fayCaK4IX40U6fNi33FFNIXTxmUpBGhK8XocB6EWavMwFlZNVRJbkrC478EsNEVWqDm
 gBWUoDHMdsTKFNdSANX9VbhFSZ72ElHp9vYouSCui2y4jJ5U0itSHGmDNghrdJqY+u2XtWcNer
 CC8KyWm35wVs712z78kSJKcp+rDwLUhAbuyY+GRP9uJPoF7xJf2JJjsPHTahesnFK/5VICiyRd
 81dla4FEc/EX60xPvXqP1e4bKOJJthFgSbFmUxhMhMvsUpCO4mBSEp08mtWFJXpP+rzGxKtbqi
 3h4=
X-SBRS: 2.7
X-MesageID: 6047001
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,521,1559534400"; 
   d="scan'208";a="6047001"
Date: Wed, 18 Sep 2019 16:20:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190918152006.GO1308@perard.uk.xensource.com>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <20190918104113.3294-5-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918104113.3294-5-paul.durrant@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v13 4/4] introduce a 'passthrough'
 configuration option to xl.cfg...
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMTE6NDE6MTNBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLmFuZCBoZW5jZSB0aGUgYWJpbGl0eSB0byBkaXNhYmxlIElPTU1VIG1hcHBpbmdz
LCBhbmQgY29udHJvbCBFUFQKPiBzaGFyaW5nLgo+IAo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBh
IG5ldyAnbGlieGxfcGFzc3Rocm91Z2gnIGVudW1lcmF0aW9uIGludG8KPiBsaWJ4bF9kb21haW5f
Y3JlYXRlX2luZm8uIFRoZSB2YWx1ZSB3aWxsIGJlIHNldCBieSB4bCBlaXRoZXIgd2hlbiBpdCBw
YXJzZXMKPiBhIG5ldyAncGFzc3Rocm91Z2gnIG9wdGlvbiBpbiB4bC5jZmcsIG9yIGltcGxpY2l0
bHkgaWYgdGhlcmUgaXMgcGFzc3Rocm91Z2gKPiBoYXJkd2FyZSBzcGVjaWZpZWQgZm9yIHRoZSBk
b21haW4uCj4gCj4gSWYgdGhlIHZhbHVlIG9mIHRoZSBwYXNzdGhyb3VnaCBjb25maWd1cmF0aW9u
IG9wdGlvbiBpcyAnZGlzYWJsZWQnIHRoZW4KPiB0aGUgWEVOX0RPTUNUTF9DREZfaW9tbXUgZmxh
ZyB3aWxsIGJlIGNsZWFyIGluIHRoZSB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbgo+IGZsYWdzLCB0
aHVzIGFsbG93aW5nIHRoZSB0b29sc3RhY2sgdG8gY29udHJvbCB3aGV0aGVyIHRoZSBkb21haW4g
Z2V0cwo+IElPTU1VIG1hcHBpbmdzIG9yIG5vdCAod2hlcmUgcHJldmlvdXNseSB0aGV5IHdlcmUg
Z2xvYmFsbHkgc2V0KS4KPiAKPiBJZiB0aGUgdmFsdWUgb2YgdGhlIHBhc3N0aHJvdWdoIGNvbmZp
Z3VyYXRpb24gb3B0aW9uIGlzICdzeW5jX3B0JyB0aGVuCj4gYSBuZXcgJ2lvbW11X29wdHMnIGZp
ZWxkIGluIHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIHdpbGwgYmUgc2V0IHdpdGggdGhlCj4gdmFs
dWUgWEVOX0RPTUNUTF9JT01NVV9ub19zaGFyZXB0LiBUaGlzIHdpbGwgb3ZlcnJpZGUgdGhlIGds
b2JhbCBkZWZhdWx0Cj4gc2V0IGluIGlvbW11X2hhcF9wdF9zaGFyZSwgdGh1cyBhbGxvd2luZyB0
aGUgdG9vbHN0YWNrIHRvIGNvbnRyb2wgd2hldGhlcgo+IEVQVCBzaGFyaW5nIGlzIHVzZWQgZm9y
IHRoZSBkb21haW4uCj4gCj4gSWYgdGhlIHZhbHVlIG9mIHBhc3N0aHJvdWdoIGlzICdlbmFibGVk
JyB0aGVuIHhsIHdpbGwgY2hvb3NlIGFuIGFwcHJvcHJpYXRlCj4gZGVmYXVsdCBhY2NvcmRpbmcg
dG8gdGhlIHR5cGUgb2YgZG9tYWluIGFuZCBoYXJkd2FyZSBzdXBwb3J0Lgo+IAo+IE5PVEU6IFRo
ZSAnaW9tbXVfbWVta2InIG92ZXJoZWFkIGluIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvIHdpbGwg
bm93IG9ubHkKPiAgICAgICBiZSBzZXQgaWYgcGFzc3Rocm91Z2ggaXMgJ3N5bmNfcHQnIChvciB4
bCBoYXMgY2hvc2VuIHRoaXMgbW9kZSBhcwo+ICAgICAgIGEgZGVmYXVsdCkuCj4gCj4gU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiBSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IEFja2VkLWJ5OiBDaHJpc3Rp
YW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+Cj4gQWNrZWQtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJB
UkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
