Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E923140F41
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 17:46:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isUjo-00008j-JL; Fri, 17 Jan 2020 16:44:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DzQF=3G=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1isUjm-00008T-S3
 for xen-devel@lists.xen.org; Fri, 17 Jan 2020 16:44:46 +0000
X-Inumbo-ID: a8a313d8-3948-11ea-b595-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8a313d8-3948-11ea-b595-12813bfff9fa;
 Fri, 17 Jan 2020 16:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579279481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=JWC5+jO7uH6+ccpGtpPe5yjY49WkzsNBd6+b9VfD80E=;
 b=ad34LTcDWDblYs0nTznxF163zA2EJTVsC9nTXeCkWHjz6XoQrJujpK7G
 4uuDwhgYgDq+rUja2pI2twY4bz0xJ0Tk21a0TTeIJB4ONVL8AVigplIAd
 YwqTD7otA3X/4C5q1LrGYDZbMnQgSSVeMpyFWd8dnhXIie4IV1uABOpjp o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LzXYQFr7p7IzZly5MCi+A4hWdeGV5sEBAtKcHIA6ubb3XjpfQyHbQz0HLGFdfjcF3vg+ZioM6O
 fdM679mV1uuqUVBQQ6tsRmBtqCC8U+zPrt9GAkWTl/kH597NuZ4uLt8/HqSNMxGx/e1a3qfIFj
 twEQBFXHDfRpC6FGSqeDkS1EIglTbD0vlBR4ixSw4WfTbIM2cv8VuB91+67G+xGZD9pknsggvx
 wCYM/c9x+qOgPS/HVWcnfS34VeTWIh+u5KJ0yDoFmYfAJNkAJ7Fvcgc1nunNNoAVSiZQe15UD3
 jDk=
X-SBRS: 2.7
X-MesageID: 11515042
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11515042"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Fri, 17 Jan 2020 16:44:32 +0000
Message-ID: <20200117164432.32245-2-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200117164432.32245-1-sergey.dyasli@citrix.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGlkZSB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uIHRoYXQgY2FuIGhlbHAgaWRlbnRpZnkgdGhl
IHJ1bm5pbmcgWGVuCmJpbmFyeSB2ZXJzaW9uOiBYRU5WRVJfZXh0cmF2ZXJzaW9uLCBYRU5WRVJf
Y29tcGlsZV9pbmZvLCBYRU5WRVJfY2hhbmdlc2V0LgpUaGlzIG1ha2VzIGhhcmRlciBmb3IgbWFs
aWNpb3VzIGd1ZXN0cyB0byBmaW5nZXJwcmludCBYZW4gdG8gaWRlbnRpZnkKZXhwbG9pdGFibGUg
c3lzdGVtcy4KCkFkZCBleHBsaWNpdCBjYXNlcyBmb3IgWEVOVkVSX2NvbW1hbmRsaW5lIGFuZCBY
RU5WRVJfYnVpbGRfaWQgYXMgd2VsbApmb3IgYmV0dGVyIGNvZGUgcmVhZGFiaWxpdHkuCgpTaWdu
ZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Ci0tLQp2
MiAtLT4gdjM6Ci0gUmVtb3ZlIGh2bWxvYWRlciBmaWx0ZXJpbmcKLSBBZGQgQVNTRVJUX1VOUkVB
Q0hBQkxFCgp2MSAtLT4gdjI6Ci0gQWRkZWQgeHNtX2ZpbHRlcl9kZW5pZWQoKSB0byBodm1sb2Fk
ZXIgaW5zdGVhZCBvZiBtb2RpZnlpbmcgeGVuX2RlbnkoKQotIE1hZGUgYmVoYXZpb3VyIHRoZSBz
YW1lIGZvciBib3RoIFJlbGVhc2UgYW5kIERlYnVnIGJ1aWxkcwotIFhFTlZFUl9jYXBhYmlsaXRp
ZXMgaXMgbm8gbG9uZ2VyIGhpZGVkCgpDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KQ0M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNv
bT4KQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDQzogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz4KQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ0M6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+CkNDOiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8ubnNhLmdvdj4K
Q0M6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS94
c20vZHVtbXkuaCB8IDE1ICsrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveHNtL2R1
bW15LmggYi94ZW4vaW5jbHVkZS94c20vZHVtbXkuaAppbmRleCBiOGUxODVlNmZhLi5jMDAxODZk
N2I2IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94c20vZHVtbXkuaAorKysgYi94ZW4vaW5jbHVk
ZS94c20vZHVtbXkuaApAQCAtNzUwLDE2ICs3NTAsMjMgQEAgc3RhdGljIFhTTV9JTkxJTkUgaW50
IHhzbV94ZW5fdmVyc2lvbiAoWFNNX0RFRkFVTFRfQVJHIHVpbnQzMl90IG9wKQogICAgIGNhc2Ug
WEVOVkVSX2dldF9mZWF0dXJlczoKICAgICAgICAgLyogVGhlc2Ugc3ViLW9wcyBpZ25vcmUgdGhl
IHBlcm1pc3Npb24gY2hlY2tzIGFuZCByZXR1cm4gZGF0YS4gKi8KICAgICAgICAgcmV0dXJuIDA7
Ci0gICAgY2FzZSBYRU5WRVJfZXh0cmF2ZXJzaW9uOgotICAgIGNhc2UgWEVOVkVSX2NvbXBpbGVf
aW5mbzoKKwogICAgIGNhc2UgWEVOVkVSX2NhcGFiaWxpdGllczoKLSAgICBjYXNlIFhFTlZFUl9j
aGFuZ2VzZXQ6CiAgICAgY2FzZSBYRU5WRVJfcGFnZXNpemU6CiAgICAgY2FzZSBYRU5WRVJfZ3Vl
c3RfaGFuZGxlOgogICAgICAgICAvKiBUaGVzZSBNVVNUIGFsd2F5cyBiZSBhY2Nlc3NpYmxlIHRv
IGFueSBndWVzdCBieSBkZWZhdWx0LiAqLwogICAgICAgICByZXR1cm4geHNtX2RlZmF1bHRfYWN0
aW9uKFhTTV9IT09LLCBjdXJyZW50LT5kb21haW4sIE5VTEwpOwotICAgIGRlZmF1bHQ6CisKKyAg
ICBjYXNlIFhFTlZFUl9leHRyYXZlcnNpb246CisgICAgY2FzZSBYRU5WRVJfY29tcGlsZV9pbmZv
OgorICAgIGNhc2UgWEVOVkVSX2NoYW5nZXNldDoKKyAgICBjYXNlIFhFTlZFUl9jb21tYW5kbGlu
ZToKKyAgICBjYXNlIFhFTlZFUl9idWlsZF9pZDoKICAgICAgICAgcmV0dXJuIHhzbV9kZWZhdWx0
X2FjdGlvbihYU01fUFJJViwgY3VycmVudC0+ZG9tYWluLCBOVUxMKTsKKworICAgIGRlZmF1bHQ6
CisgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOworICAgICAgICByZXR1cm4gLUVQRVJNOwog
ICAgIH0KIH0KIAotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
