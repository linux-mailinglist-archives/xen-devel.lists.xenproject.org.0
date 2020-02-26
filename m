Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1EA16FE0F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:43:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6v3s-0002sc-A0; Wed, 26 Feb 2020 11:41:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6v3q-0002rx-Qo
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:41:06 +0000
X-Inumbo-ID: df8c658a-588c-11ea-a490-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df8c658a-588c-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 11:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582717267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CgqtPNdj3Dl7hyOtfntE04Kdu5PkFy1yAtmPoJq5ApA=;
 b=XYBhg+R8BxMwWQ4qc+ihGsvEWe0dg1uPi6ytxiVgCHgiaTuDAXsXkKAj
 jeTSB9Eg5ohy6cmKSenvnz+O02laIPGlAEr24bCzavAOEl6QgsEqJImre
 MokfXjhvsgiTjugGbzMVSpCzDdHEvgC+cTa4PnZJ0WNlwP/cCl3Yt51i0 k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AetCv0TGQ5Zx2JsD6BVOR0tcUMLdZuaz0pl+3ajTcyztKcpWKMQl9qazH3ftVWIre0q3goZc7M
 bj+XQ2+d4GNyf2SgqOADpk3mk9r0nR3X3EdR7zc5QNsrFmTEBkO7FR2Qy5uOdazmSIQ4TLjfSd
 Sc065fln3YhWje7rls726pTd3H29lV2NVB3bDhlZIgWf84KIm5eZ9gfbc0Dp3ND85qpDBLmi5b
 ksFLGyc8jiXvh7PY8o8aYI4mP0r1bLMdBwSwHsTXbcQzGppCdXAHWjS+TvNykvA7p6Wfh36zLP
 MlQ=
X-SBRS: 2.7
X-MesageID: 13211249
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13211249"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:54 +0000
Message-ID: <20200226113355.2532224-23-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 22/23] xen,
 symbols: rework file symbols selection
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
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmV3b3JrIHN5bWJvbHMgc28gaXQgcHJlZmVyIGZpbGUgc3ltYm9scyB0aGF0IG5hbWVzIGFuIG9i
amVjdCBmaWxlIHRvCmZpbGUgc3ltYm9scyB0aGF0IGhhdmUgYSBkaXJlY3RvcnkgY29tcG9uZW50
LgoKQnV0IGhhdmUgc3ltYm9scyBzdGlsbCBwcmVmZXIgdGhlIGZpcnN0IGZpbGUgc3ltYm9sIGlm
IG9uZSBvZiB0aGUgYWJvdmUKaXMgdHJ1ZSwgb3IgcHJlZmVyIHRoZSBzZWNvbmQgZmlsZSBzeW1i
b2xzIGlmIGl0IG5hbWVzIGEgc291cmNlIGZpbGUKd2l0aG91dCBkaXJlY3RvcnkgY29tcG9uZW50
LgoKSW4gYSBmdXR1cmUgcGF0Y2gsIHdlIGFyZSBnb2luZyB3YW50IHRvIHJ1biAkKENDKSBmcm9t
IHRoZSByb290IGRpcmVjdG9yeQooeGVuLmdpdC94ZW4gdGhhdCBpcykuIFNvIHRoZSBndWVzdF93
YWxrXyUubyBmaWxlcyBhcmUgZ29pbmcgdG8gaGF2ZQp0d28gZmlsZSBzeW1ib2xzLCBvbmUgd2l0
aCBhIGRpcmVjdG9yeSBjb21wb25lbnQgYW5kIGFub3RoZXIgb25lCndoaWNoIG5hbWUgYW4gb2Jq
ZWN0IGZpbGUuIFdlIHN0aWxsIHdhbnQgdG8gcHJlZmVyIHRoZSBmaWxlIHN5bWJvbHMKdGhhdCBu
YW1lcyBhbiBvYmplY3QgZmlsZSwgbm8gbWF0ZXIgaWYgaXQgaXMgZmlyc3Qgb3Igc2Vjb25kLgoK
QW5kIGJlZm9yZSBydW5uaW5nIGV2ZXJ5dGhpbmcgZnJvbSB0aGUgcm9vdCBkaXJlY3RvcnksIHdl
IHdpbGwgYmUgYWJsZQp0byB1c2UgdGhlIHNhbWUgcnVuZXMgdG8gYnVpbGQgdGhlIGd1ZXN0XyUu
byBhcyB0byBidWlsZCBhbnkgb3RoZXIgJS5vCmZpbGVzIGZyb20gJS5jIGZpbGVzICh0aGUgcnVs
ZSB3aXRoIHRoZSBvYmpjb3B5IC0tcmVkZWZpbmUtc3ltKS4KClNpZ25lZC1vZmYtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHhlbi90b29scy9zeW1i
b2xzLmMgfCAyMiArKysrKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vdG9vbHMvc3ltYm9s
cy5jIGIveGVuL3Rvb2xzL3N5bWJvbHMuYwppbmRleCA5ZjllMmM5OTAwNjEuLmI3YTAwYjRiZTQ4
NyAxMDA2NDQKLS0tIGEveGVuL3Rvb2xzL3N5bWJvbHMuYworKysgYi94ZW4vdG9vbHMvc3ltYm9s
cy5jCkBAIC04MCwxMSArODAsMTcgQEAgc3RhdGljIGlubGluZSBpbnQgaXNfYXJtX21hcHBpbmdf
c3ltYm9sKGNvbnN0IGNoYXIgKnN0cikKIAkgICAgICAgJiYgKHN0clsyXSA9PSAnXDAnIHx8IHN0
clsyXSA9PSAnLicpOwogfQogCitlbnVtIHN5bWJvbF90eXBlIHsKKyAgICAgc3ltYm9sID0gMCwK
KyAgICAgc2luZ2xlX3NvdXJjZSA9IDEsCisgICAgIGRpcl9zb3VyY2UgPSAyLAorICAgICBvYmpf
c291cmNlID0gMywKK307CiBzdGF0aWMgaW50IHJlYWRfc3ltYm9sKEZJTEUgKmluLCBzdHJ1Y3Qg
c3ltX2VudHJ5ICpzKQogewogCWNoYXIgc3RyWzUwMF0sIHR5cGVbMjBdID0gIiI7CiAJY2hhciAq
c3ltLCBzdHlwZTsKLQlzdGF0aWMgZW51bSB7IHN5bWJvbCwgc2luZ2xlX3NvdXJjZSwgbXVsdGlf
c291cmNlIH0gbGFzdDsKKwlzdGF0aWMgZW51bSBzeW1ib2xfdHlwZSBsYXN0OwogCXN0YXRpYyBj
aGFyICpmaWxlbmFtZTsKIAlpbnQgcmMgPSAtMTsKIApAQCAtMTI1LDEzICsxMzEsMTkgQEAgc3Rh
dGljIGludCByZWFkX3N5bWJvbChGSUxFICppbiwgc3RydWN0IHN5bV9lbnRyeSAqcykKIAkJICog
cHJlZmVyIHRoZSBmaXJzdCBvbmUgaWYgdGhhdCBuYW1lcyBhbiBvYmplY3QgZmlsZSBvciBoYXMg
YQogCQkgKiBkaXJlY3RvcnkgY29tcG9uZW50ICh0byBjb3ZlciBtdWx0aXBseSBjb21waWxlZCBm
aWxlcykuCiAJCSAqLwotCQlib29sIG11bHRpID0gc3RyY2hyKHN0ciwgJy8nKSB8fCAoc3ltICYm
IHN5bVsxXSA9PSAnbycpOwotCi0JCWlmIChtdWx0aSB8fCBsYXN0ICE9IG11bHRpX3NvdXJjZSkg
eworCQllbnVtIHN5bWJvbF90eXBlIGN1cnJlbnQ7CisJCWlmIChzeW0gJiYgc3ltWzFdID09ICdv
JykKKwkJICAgIGN1cnJlbnQgPSBvYmpfc291cmNlOworCQllbHNlIGlmIChzdHJjaHIoc3RyLCAn
LycpKQorCQkgICAgY3VycmVudCA9IGRpcl9zb3VyY2U7CisJCWVsc2UKKwkJICAgIGN1cnJlbnQg
PSBzaW5nbGVfc291cmNlOworCisJCWlmIChjdXJyZW50ID4gbGFzdCB8fCBsYXN0ID09IHNpbmds
ZV9zb3VyY2UpIHsKIAkJCWZyZWUoZmlsZW5hbWUpOwogCQkJZmlsZW5hbWUgPSAqc3RyID8gc3Ry
ZHVwKHN0cikgOiBOVUxMOworCQkJbGFzdCA9IGN1cnJlbnQ7CiAJCX0KLQkJbGFzdCA9IG11bHRp
ID8gbXVsdGlfc291cmNlIDogc2luZ2xlX3NvdXJjZTsKIAkJZ290byBza2lwX3RhaWw7CiAJfQog
Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
