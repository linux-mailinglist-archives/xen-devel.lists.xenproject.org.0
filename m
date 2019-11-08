Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDE4F44B5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 11:37:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT1cL-00052f-8g; Fri, 08 Nov 2019 10:35:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7Az4=ZA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iT1cK-00052a-I2
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 10:35:48 +0000
X-Inumbo-ID: 86542b12-0213-11ea-adbe-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86542b12-0213-11ea-adbe-bc764e2007e4;
 Fri, 08 Nov 2019 10:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573209348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9gD4XKmGu/aKgvDBkg3s3DOK6htDhqkUh/DCbLrxLxM=;
 b=UC4RGozDNT2TyHlz/uK6r0O7JonvQ9iPAgXnYffeNilFWjiHEu3ZYazL
 TSuCHVXpUSPxj6ZVuPved0aYQIBZpsGfroDABN+i/RYRpf39S6bDiG0iN
 noqP3NSrLBmdwyYjkCvOkS/vMVl4VF+pGMSG+Z7R98HNaJlDZgYcr0tcw I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ahr4P28V1CF+wBrq1WV2yECsK5S1o0Chf0huP53vhVYXc6V0Q2ylPLOX8HfBURlJKjFpyruG6w
 J02OsNL9tkI66l8z63KunasWnHCI1xgQuXz5Awf6v3Mxlc7SKxm8AxxHJic7DXAvDZaB/ZXegM
 jn1WhmBLjH6sAheA1ezb63DM6S+YkVXbobkP//GP0ffUPuEgY0pFNTUuYIrpa53R7I7F6cbJKz
 y6XJpOUJhj2QiVBFSsG9KEQJNOR69JcpmeUf8X1cHSxz4CVkJezHM+e2p7hqL89/NiyjibfJk7
 8mw=
X-SBRS: 2.7
X-MesageID: 8053387
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,281,1569297600"; 
   d="scan'208";a="8053387"
Date: Fri, 8 Nov 2019 10:35:44 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20191108103544.GH2381@perard.uk.xensource.com>
References: <1573145894-13305-1-git-send-email-paul@xen.org>
 <20191107185200.5uw4nz3lqiguuyhl@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107185200.5uw4nz3lqiguuyhl@debian>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH v2] tools/hotpug: only attempt to call 'ip
 route' if there is valid command
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, paul@xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDY6NTI6MDBQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIE5vdiAwNywgMjAxOSBhdCAwNDo1ODoxNFBNICswMDAwLCBwYXVsQHhlbi5vcmcg
d3JvdGU6Cj4gPiAtLS0gYS90b29scy9ob3RwbHVnL0xpbnV4L3ZpZi1yb3V0ZQo+ID4gKysrIGIv
dG9vbHMvaG90cGx1Zy9MaW51eC92aWYtcm91dGUKPiA+IEBAIC0yMiwxMiArMjIsMTYgQEAgZGly
PSQoZGlybmFtZSAiJDAiKQo+ID4gIG1haW5faXA9JChkb20wX2lwKQo+ID4gIAo+ID4gIGNhc2Ug
IiR7Y29tbWFuZH0iIGluCj4gPiArICAgIGFkZCkKPiA+ICsgICAgICAgIDsmCj4gPiAgICAgIG9u
bGluZSkKPiA+ICAgICAgICAgIGlmY29uZmlnICR7ZGV2fSAke21haW5faXB9IG5ldG1hc2sgMjU1
LjI1NS4yNTUuMjU1IHVwCj4gCj4gSG1tLi4uIEkgdGhpbmsgd2UgbWF5IG5lZWQgdG8gcmVwbGFj
ZSBpZmNvbmZpZyB3aXRoIGlwIGJlY2F1c2Ugbm93Cj4gZGlzdHJvcyAoYXQgbGVhc3QgRGViaWFu
IGFuZCBBcmNoKSBkb24ndCBpbnN0YWxsIGlmY29uZmlnIGJ5IGRlZmF1bHQuCgpBcmNoIExpbnV4
IGRvbid0IGluc3RhbGwgWGVuIGJ5IGRlZmF1bHQuLi4gc28gdGhpcyBzY3JpcHQgZG9lc24ndApl
eGlzdC4uLiBzbyBpdCBkb2Vzbid0IG1hdHRlciBpZiBpZmNvbmZpZyBpcyBhdmFpbGFibGUgb3Ig
bm90IC4uLgpJdCBpcyBmaW5lIHRvIGRlcGVuZHMgb24gJ2lmY29uZmlnJyB3aGVuIGluc3RhbGxp
bmcgWGVuLgoKQW55d2F5LCBpdCBtaWdodCBiZSBhIG5pY2UgaW1wcm92ZW1lbnQgdG8gaGF2ZSBv
bmUgbGVzcyBkZXBlbmRlbmN5LCBidXQKaXQncyBub3Qgc29tZXRoaW5nIHRoYXQgbmVlZHMgdG8g
YmUgZG9uZSByaWdodCBhd2F5LgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
