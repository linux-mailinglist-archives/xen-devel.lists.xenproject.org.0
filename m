Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8354A13F1DC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 19:31:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is9s5-0005nr-0r; Thu, 16 Jan 2020 18:27:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M+HB=3F=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1is9s3-0005nm-LP
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 18:27:55 +0000
X-Inumbo-ID: e3baf438-388d-11ea-ac27-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3baf438-388d-11ea-ac27-bc764e2007e4;
 Thu, 16 Jan 2020 18:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579199266;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=IEW4+3OUqZwvf22eW3SdQoN/VwhM1i5B/aYVc/sMi34=;
 b=HRmRiSr1rHQaYAgKXMu3xyDvTAq0pL0lJLDbb7GVj5IW/yhEL7XWdVBR
 KQyLJAuoPzUM1KsltbhCdzJtLLy3PjkBd1+gkpGXpir1snpV0a00cESJD
 ANxAFDs3WPXsNVbkliIglR6/2Drf7kwzScLvGSRbc17SDaogndSb3cp34 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZKtdjLVWi456NmAAW0z5sthsac24eLT09XLnahpXoZeY1aDz6kIty6AeyICfQgYqmeVvCZLms2
 ryayV7w7eZKVE+bOiW26LU7sX4E9D5ztX37eeHx5z1PuAjtfF7C3wq6Lky2k+mwUlyLIpoSG/i
 P6cUniiJCKjzC9kYP84ilg+9gSrnUlT8kJCdv8UsdTaGOLk2HyjTUw0LgTARtk37HnsXLIuDbA
 HsBJZS+JyMUIlY7XFny0ZWP/uWKIPtykVZdBAx0PiTJzeh/ExSK5SnFoApe+dNnds7VBXX9Q7g
 iZU=
X-SBRS: 2.7
X-MesageID: 11626569
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,327,1574139600"; d="scan'208";a="11626569"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24096.43806.179846.885653@mariner.uk.xensource.com>
Date: Thu, 16 Jan 2020 18:27:42 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200116093602.4203-4-pdurrant@amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-4-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 3/6] libxl: add infrastructure to track
 and query 'retired' domids
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmtzLiAgSSB0aGluayB0aGlzIGlzIHRoZSBhbGdvcml0aG0gYXMgd2UgZGlzY3Vzc2VkLCB0
aGFua3MuCkkgaGF2ZSBzb21lIGNvbW1lbnRzIGFib3V0IHRoZSBpbXBsZW1lbnRhdGlvbi4uLgoK
UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2MyAzLzZdIGxpYnhsOiBhZGQgaW5mcmFzdHJ1
Y3R1cmUgdG8gdHJhY2sgYW5kIHF1ZXJ5ICdyZXRpcmVkJyBkb21pZHMiKToKPiBBIGRvbWlkIGlz
IGNvbnNpZGVyZWQgcmV0aXJlZCBpZiB0aGUgZG9tYWluIGl0IHJlcHJlc2VudHMgd2FzIGRlc3Ry
b3llZAo+IGxlc3MgdGhhbiBhIHNwZWNpZmllZCBudW1iZXIgb2Ygc2Vjb25kcyBhZ28uIFRoZSBu
dW1iZXIgY2FuIGJlIHNldCB1c2luZwo+IHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZSBMSUJYTF9E
T01JRF9NQVhfUkVUSVJFTUVOVC4gSWYgdGhlIHZhcmlhYmxlIGRvZXMKPiBub3QgZXhpc3QgdGhl
biBhIGRlZmF1bHQgdmFsdWUgb2YgNjBzIGlzIHVzZWQuCi4uLgoKSSdtIGFmcmFpZCBJIHRoaW5r
IHlvdXIgdXBkYXRlIHByb3RvY29sIGZvciB0aGlzIGZpbGUgaXMgd3JvbmcuICBJbgpnZW5lcmFs
IGl0IGlzIGEgYmFkIGlkZWEgdG8gdHJ5IHRvIHdyaXRlIG92ZXIgYSBmaWxlIGluLXBsYWNlLiAg
RG9pbmcKc28gaXMgZnVsbCBvZiBnb3RjaGFzLiAgKEluIHRoaXMgcGFydGljdWxhciBjYXNlIGZv
ciBleGFtcGxlIEkgdGhpbmsKYW4gaW50ZXJydXB0ZWQgYXR0ZW1wdCBhdCBjbGVhbmluZyB0aGUg
ZmlsZSBjYW4gcHJvZHVjZSBhIGNvcnJ1cHRlZApmaWxlIGNvbnRhaW5pbmcgbm9uc2Vuc2UuKQoK
Q2FuIHdlIHBsZWFzZSB1c2UgdGhlIHN0YW5kYXJkIHdyaXRlLXRvLW5ldy1maWxlLWFuZC1yZW5h
bWUgPwpJZSwgdG8gbGF1bmRlcgogICAgZmxvY2sob3BlbigiZG9taWQtaGlzdG9yeS5sb2NrIikp
CiAgICBmb3BlbigiZG9taWQtaGlzdG9yeSIsInIiKQogICAgZm9wZW4oImRvbWlkLWhpc3Rvcnku
bmV3IiwidyIpCiAgICBmZ2V0cy9mcHV0cwogICAgZmNsb3NlCiAgICByZW5hbWUKICAgIGNsb3Nl
CgooQW5kIG5vIHVzZXMgb2YgZnRlbGwsIGZvcGVuKCwicisiKSwgZXRjLikKClJlYWRpbmcgY2Fu
IGJlIGRvbmUgd2l0aG91dCB0YWtpbmcgdGhlIGxvY2ssIGlmIHlvdSBzbyBmYW5jeS4KCkkgdGhp
bmsgdGhlcmUgYXJlIGEgbG90IG9mIG1pc3NpbmcgZXJyb3IgY2hlY2tzIGluIHRoaXMgcGF0Y2gs
IGJ1dApzaW5jZSBJJ20gYXNraW5nIGZvciBhIGRpZmZlcmVudCBhcHByb2FjaCBJIHdvbid0IHBv
aW50IHRoZW0gb3V0CmluZGl2aWR1YWxseS4KCj4gKyAgICBmZCA9IG9wZW4obmFtZSwgT19SRFdS
fE9fQ1JFQVQsIDA2NDQpOwo+ICsgICAgaWYgKGZkIDwgMCkgewo+ICsgICAgICAgIExPR0UoRVJS
T1IsICJ1bmV4cGVjdGVkIGVycm9yIHdoaWxlIHRyeWluZyBvcGVuICVzLCBlcnJubz0lZCIsCj4g
KyAgICAgICAgICAgICBuYW1lLCBlcnJubyk7Cj4gKyAgICAgICAgZ290byBmYWlsOwo+ICsgICAg
fQo+ICsKPiArICAgIGZvciAoOzspIHsKPiArICAgICAgICByZXQgPSBmbG9jayhmZCwgTE9DS19F
WCk7CgpJIGxvb2tlZCBmb3IgYSB1dGlsaXR5IGZ1bmN0aW9uIHRvIGRvIHRoaXMgYnV0IGRpZG4n
dCBmaW5kIG9uZS4KSSB0aGluayB0aGlzIGlzIGNvbXBsaWNhdGVkIGJlY2F1c2UgaXQgbmVlZHMg
dG8gYmUgYSBgY2FyZWZkJyBpbiBsaWJ4bAp0ZXJtcyBiZWNhdXNlIG9mIGNvbmN1cnJlbnQgZm9y
a2luZyBieSBvdGhlciB0aHJlYWRzIGluIHRoZQphcHBsaWNhdGlvbi4KCkkgc3VnZ2VzdCBnZW5l
cmFsaXNpbmcgbGlieGxfX2xvY2tfZG9tYWluX3VzZXJkYXRhLCB3aGljaCBoYXMgYWxsIHRoZQpu
ZWNlc3NhcnkgY29kZSAoYW5kIHdoaWNoIGFsc28gd291bGQgcGVybWl0IHJlbW92aW5nIHRoZSBm
aWxlIGluIHRoZQpmdXR1cmUpLgoKSSBmZWVsIHJlc3BvbnNpYmxlIGZvciB0aGlzIGluY29udmVu
aWVuY2UuICBJZiB0aGlzIGlzIHRvbyB0aXJlc29tZQpmb3IgeW91LCBJIGNvdWxkIGRvIHRoYXQg
cGFydCBmb3IgeW91Li4uCgo+ICsvKiBXcml0ZSBhIGRvbWlkIHJldGlyZW1lbnQgcmVjb3JkICov
Cj4gK3N0YXRpYyB2b2lkIGxpYnhsX19yZXRpcmVfZG9taWQobGlieGxfX2djICpnYywgdWludDMy
X3QgZG9taWQpCj4gK3sKLi4uCj4gKyAgICB3aGlsZSAoZmdldHMobGluZSwgc2l6ZW9mKGxpbmUp
LCBmKSkgewo+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgc2VjOwo+ICsgICAgICAgIHVuc2lnbmVk
IGludCBpZ25vcmVkOwo+ICsKPiArICAgICAgICByb2ZmID0gZnRlbGwoZik7Cj4gKwo+ICsgICAg
ICAgIGlmIChzc2NhbmYobGluZSwgIiVsdSAldSIsICZzZWMsICZpZ25vcmVkKSAhPSAyKQo+ICsg
ICAgICAgICAgICBjb250aW51ZTsgLyogUHVyZ2UgbWFsZm9ybWVkIGxpbmVzICovCgpJJ20gbm90
IHN1cmUgd2h5IHlvdSBib3RoZXIgd2l0aCBmZ2V0cyBpbnRvIGEgYnVmZmVyLCB3aGVuIHlvdSBj
b3VsZApqdXN0IHVzZSBmc2NhbmYgcmF0aGVyIHRoYW4gc3NjYW5mLiAgWW91ciBjb2RlIGRvZXNu
J3QgbmVlZCB0byB0YWtlCm11Y2ggY2FyZSBhYm91dCB3ZWlyZCBzeW50YXggd2hpY2ggbWlnaHQg
b2NjdXIgKGFuZCBpbmRlZWQgeW91ciBjb2RlCmhlcmUgZG9lc24ndCB0YWtlIHN1Y2ggY2FyZSku
Cgo+IEBAIC0xMzMxLDYgKzE0NjIsNyBAQCBzdGF0aWMgdm9pZCBkZXZpY2VzX2Rlc3Ryb3lfY2Io
bGlieGxfX2VnYyAqZWdjLAo+ICAgICAgICAgIGlmICghY3R4LT54Y2gpIGdvdG8gYmFkY2hpbGQ7
Cj4gIAo+ICAgICAgICAgIGlmICghZGlzLT5zb2Z0X3Jlc2V0KSB7Cj4gKyAgICAgICAgICAgIGxp
YnhsX19yZXRpcmVfZG9taWQoZ2MsIGRvbWlkKTsKCkkgd29uZGVyIGlmIGEgYmV0dGVyIHRlcm0g
dGhhbiAicmV0aXJlZCIgd291bGQgYmUgcG9zc2libGUuICBJCmluaXRpYWxseSBmb3VuZCB0aGlz
IHBhdGNoIGEgYml0IGNvbmZ1c2luZyBiZWNhdXNlIEkgdGhvdWdodCBhIHJldGlyZWQKZG9taWQg
d291bGQgYmUgb25lIHdoaWNoIGhhZCAqbm90KiBiZWVuIHVzZWQgcmVjZW50bHkuICBNYXliZQoi
cmVjZW50IiwgIm1hcmsgcmVjZW50IiwgZXRjLiA/ICBVbHRpbWF0ZWx5IHRoaXMgaXMgYSBiaWtl
c2hlZCBpc3N1ZQp3aGljaCBJIHdpbGwgbGVhdmUgdGhpcyB1cCB0byB5b3UsIHRob3VnaC4KCgpJ
IGRvbid0IG11Y2ggbGlrZSB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGUgdG8gY29uZmlndXJlIHRo
aXMuICBJIGRvbid0Cm9iamVjdCB0byBrZWVwaW5nIGl0IGJ1dCBjYW4gd2UgaGF2ZSBhIGNvbW1l
bnQgc2F5aW5nIHRoaXMgaXMgbm90CmludGVuZGVkIGZvciB1c2UgaW4gcHJvZHVjdGlvbiA/ICBQ
ZXJzb25hbGx5IEkgd291bGQgcmF0aGVyIGl0IHdhcwpoYXJkY29kZWQsIG9yIGZhaWxpbmcgdGhh
dCwgd3JpdHRlbiB0byBzb21lIGNvbmZpZyBmaWxlLgoKCkZpbmFsbHksIEkgdGhpbmsgdGhpcyBw
YXRjaCBuZWVkcyBhbiBhZGRpdGlvbiB0byB4ZW4taW5pdC1kb20wIHRvCnJlbW92ZSBvciBlbXB0
eSB0aGUgcmVjb3JkIGZpbGUuICBUaGlzIGlzIGJlY2F1c2Ugd2hpbGUgL3J1biBpcwp1c3VhbGx5
IGEgdG1wZnMsIHRoaXMgaXMgbm90ICpuZWNlc3NhcmlseSogdHJ1ZS4KCklhbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
