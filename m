Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF054B00D0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 18:03:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8506-0005vi-5M; Wed, 11 Sep 2019 15:57:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bpM+=XG=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i8504-0005vd-MM
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:57:44 +0000
X-Inumbo-ID: e3406bc2-d4ac-11e9-83d9-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3406bc2-d4ac-11e9-83d9-12813bfff9fa;
 Wed, 11 Sep 2019 15:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568217462;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Oq20SEFc8eJ2d0aNMIjhbBDcqE19jnnLm0fYtGPcNBg=;
 b=MkPFO+oDq6vL9ldhy+ezbJaNKDsAYmZ8w8K4Jy7Fl8ope8JOlKMgxW23
 cuLdLZQvI0oV/40AiFeIq3xV4Fi2+6hcBHnakykiDsqMhr5WOE5srgy+b
 ltJwP2THU9QNgwi4gz8kkPJIXYx8W+FSSUdHwf5FRsTh5DEyZEUPJkqGS s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mLgLGpU8jFnCMgCwfuRd63rsjjvqyKZu3MMf3DQ04O9oFw1Wg1pgjCnlwK+s00T8RMBtkugVZV
 nlQRhK52tA134dFqsShA6ouErRZLvK4vVWXvwqYIU9Q6B7kRVpDSavcyWB0okfFURxPNQBGn32
 Fsy+ZpF0P/D/yPuTK4MpusXKflVhhCI79F9/+Fg72zW4EFh1jk3ARwfOdQx4XtqW9435aqS2Kl
 0NaE8aok5b5FdIfKFXJnu9YRVlI0zIfCX9NG+viQ4uahczgPhflOPTQwF/oe1C+4oGFPfxUCrR
 I/U=
X-SBRS: 2.7
X-MesageID: 5728663
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,494,1559534400"; 
   d="scan'208";a="5728663"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23929.6485.711561.46507@mariner.uk.xensource.com>
Date: Wed, 11 Sep 2019 16:57:09 +0100
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>, Steven Haigh
 <netwiz@crc.id.au>
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <1566956155.3344.0@crc.id.au>,
 <alpine.LFD.2.21.1908151959060.2715@austen3.home>
References: <alpine.LFD.2.21.1908150030150.2807@austen3.home>
 <alpine.LFD.2.21.1908150055060.2807@austen3.home>
 <18fb961102e8da16d1ad9576742bccf2@crc.id.au>
 <alpine.LFD.2.21.1908151959060.2715@austen3.home>
 <114550b6cd3e7936e055a63ebbb2c7a6@crc.id.au>
 <0b7f33b8fd6fbbae86451b5bbdb1f6ac@crc.id.au>	<1566956155.3344.0@crc.id.au>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] read grubenv and set default from
 saved_entry or next_entry [and 1 more messages]
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RldmVuIEhhaWdoIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbUEFUQ0hdIHJlYWQgZ3J1YmVu
diBhbmQgc2V0IGRlZmF1bHQgZnJvbSBzYXZlZF9lbnRyeSBvciBuZXh0X2VudHJ5Iik6Cj4gSnVz
dCB3YW50ZWQgdG8gZ2l2ZSB0aGlzIGEgcXVpY2sgZm9sbG93dXAuLi4gRGlkIHRoaXMgZW5kIHVw
IAo+IHByb2dyZXNzaW5nPwoKSGkuICBJJ20gYSB0b29scyBtYWludGFpbmVyIGFuZCBwcm9iYWJs
eSB5b3VyIGJlc3QgYmV0IGZvciBhIHJldmlldwpldGMgb2YgdGhpcyBwYXRjaC4gIElmLCBuZXh0
IHRpbWUsIHlvdSB1c2UgYWRkX21haW50YWluZXJzLnBsIG9yCnNvbWV0aGluZywgeW91J2xsIGVu
ZCB1cCBDQ2luZyB0aGUgbWFpbnRhaW5lciBhbmQgeW91ciBtYWlsIHdvbid0IGdldApkcm9wcGVk
LiAgQW55d2F5LCB0aGFua3MgZm9yIGNoYXNpbmcgaXQgdXAgdGhyb3VnaCBhIGJhY2sgY2hhbm5l
bCA6LSkuCgpNaWNoYWVsIFlvdW5nIDxtLmEueW91bmdAZHVyaGFtLmFjLnVrPjoKPiBGcm9tIDUx
YTlkY2U5ZGUzZWExNTkwMTE5MjhlMmRiODU0MWYzYzdlODM4M2EgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCj4gRnJvbTogTWljaGFlbCBZb3VuZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51az4KPiBE
YXRlOiBUaHUsIDE1IEF1ZyAyMDE5IDE5OjU1OjMwICswMTAwCj4gU3ViamVjdDogW1BBVENIXSBy
ZWFkIGdydWJlbnYgYW5kIHNldCBkZWZhdWx0IGZyb20gc2F2ZWRfZW50cnkgb3IgbmV4dF9lbnRy
eQo+IAo+IFRoaXMgcGF0Y2ggbG9va3MgZm9yIGEgZ3J1YmVudiBmaWxlIGluIHRoZSBzYW1lIGRp
cmVjdG9yeSBhcyB0aGUKPiBncnViLmNmZyBmaWxlIGFuZCBpbmNsdWRlcyBpdCBhdCBmcm9udCBv
ZiB0aGUgZ3J1Yi5jZmcgZmlsZSB3aGVuIHBhc3NlZAo+IHRvIHBhcnNlKCkKClRoYW5rcyBmb3Ig
dGhlIGNvbnRyaWJ1dGlvbi4gIEkgcmV2aWV3ZWQgdGhlIHBhdGNoIGFuZCBJIGhhdmUgc29tZQpj
b21tZW50cy4KCkkgdGhpbmsgdGhpcyBwYXRjaCB3b3VsZCBiZSBsZXNzIGNvbmZ1c2luZyBpZiBp
dCB3ZXJlIHR3byBwYXRjaGVzLgpPbmUgd2hpY2ggZG9lcyB0aGUgc2F2ZWQvbmV4dCBlbnRyeSwg
YW5kIG9uZSB3aGljaCByZWFkcyBncnViZW52LiAgRG8KeW91IHRoaW5rIHRoYXQgd291bGQgbWFr
ZSBzZW5zZSA/ICBJZiBzbyBJIHdvdWxkIGFwcHJlY2lhdGUgaXQgaWYgeW91CndvdWxkIHNwbGl0
IGl0IHVwIChhbmQgd3JpdGUgYSBuaWNlIGV4cGxhbmF0b3J5IGNvbW1pdCBtZXNzYWdlIGFib3V0
CnRoZSBzYXZlZF9lbnRyeSBzdHVmZikuCgo+IEFzIHRoZSBncnViZW52IGZpbGUgY29uc2lzdHMg
b2YgdmFyaWFibGU9dmFsdWUgbGluZXMgcGFkZGVkIGJ5IGhhc2hlcyB0aGVzZQo+IGFyZSB0cmVh
dGVkIGFzIGNvbW1hbmRzIGluIHBhcnNlKCkgd2hlcmUgaXQgdXNlcyB0aGUgdmFsdWUgb2Ygc2F2
ZWRfZW50cnkKPiBvciBuZXh0X2VudHJ5IChpZiBzZXQpIHRvIHNldCB0aGUgZGVmYXVsdCBlbnRy
eSBpZiBhIHRpdGxlIG1hdGNoZXMgb3IgaXMKPiBhIG51bWJlci4KCkkgbGlrZSByZXVzaW5nIHRo
ZSBwYXJzZXIuCgo+IGRpZmYgLS1naXQgYS90b29scy9weWdydWIvc3JjL3B5Z3J1YiBiL3Rvb2xz
L3B5Z3J1Yi9zcmMvcHlncnViCj4gaW5kZXggY2U3YWIwZWI4Yy4uMjY3Nzg4Nzk1YiAxMDA3NTUK
PiAtLS0gYS90b29scy9weWdydWIvc3JjL3B5Z3J1Ygo+ICsrKyBiL3Rvb2xzL3B5Z3J1Yi9zcmMv
cHlncnViCj4gQEAgLTQ1NCw4ICs0NTQsMTkgQEAgY2xhc3MgR3J1YjoKPiAgICAgICAgICBpZiBz
ZWxmLl9fZGljdF9fLmdldCgnY2YnLCBOb25lKSBpcyBOb25lOgo+ICAgICAgICAgICAgICByYWlz
ZSBSdW50aW1lRXJyb3IoImNvdWxkbid0IGZpbmQgYm9vdGxvYWRlciBjb25maWcgZmlsZSBpbiB0
aGUgaW1hZ2UgcHJvdmlkZWQuIikKPiAgICAgICAgICBmID0gZnMub3Blbl9maWxlKHNlbGYuY2Yu
ZmlsZW5hbWUpCj4gKyAgICAgICAgZmVudiA9IHNlbGYuY2YuZmlsZW5hbWUucmVwbGFjZSgiZ3J1
Yi5jZmciLCJncnViZW52IikKCkkgZmluZCB0aGlzIGZpbGVuYW1lIGhhY2tlcnkgcmF0aGVyIHVu
cHJpbmNpcGxlZC4gIEknbSBub3QgZW50aXJlbHkKc3VyZSBJIGNhbiBzZWUgYSBiZXR0ZXIgd2F5
LCBnaXZlbiB0aGUgd2F5IGNmZ19saXN0IGlzIGNvbnN0cnVjdGVkLgpDYW4geW91IHRoaW5rIG9m
IGEgbGVzcyBoYWNreSBhcHByb2FjaCA/CgpXaGF0IHdvdWxkIGhhcHBlbiBpbiBmdXR1cmUgaWYg
d2UgcHJvdmlkZWQgYSB3YXkgdG8gY29udHJvbCB0aGUKZ3J1Yi5jZmcgcmVhZCBieSBweWdydWIg
YW5kIGEgdXNlciBjb25maWd1cmVkIGl0IHRvIChzYXkpCmBncnViLmNmZy5vbGQnID8gIFdvdWxk
IHdlIHJlYWxseSB3YW50IGl0IHRvIHJlYWQgYGdydWJlbnYub2xkJyA/Cgo+ICsgICAgICAgIGlm
IGZlbnYgIT0gc2VsZi5jZi5maWxlbmFtZSBhbmQgZnMuZmlsZV9leGlzdHMoZmVudik6Cj4gKyAg
ICAgICAgICAgICMgaWYgZ3J1YmVudiBmaWxlIGV4aXN0cyBuZXh0IHRvIGdydWIuY2ZnIHByZXBl
bmQgaXQKPiArICAgICAgICAgICAgZmVudmYgPSBmcy5vcGVuX2ZpbGUoZmVudikKPiArICAgICAg
ICAgICAgaWYgc3lzLnZlcnNpb25faW5mb1swXSA8IDM6Cj4gKyAgICAgICAgICAgICAgICBmc2Vw
ID0gIlxuIgo+ICsgICAgICAgICAgICBlbHNlOgo+ICsgICAgICAgICAgICAgICAgZnNlcCA9IGIi
XG4iCj4gKyAgICAgICAgICAgIGJ1ZiA9IGZzZXAuam9pbigoZmVudmYucmVhZChGU19SRUFEX01B
WCksZi5yZWFkKEZTX1JFQURfTUFYKSkpCj4gKyAgICAgICAgICAgIGRlbCBmZW52Zgo+ICAgICAg
ICAgICMgbGltaXQgcmVhZCBzaXplIHRvIGF2b2lkIHBhdGhvbG9naWNhbCBjYXNlcwo+IC0gICAg
ICAgIGJ1ZiA9IGYucmVhZChGU19SRUFEX01BWCkKPiArICAgICAgICBlbHNlOgo+ICsgICAgICAg
ICAgICBidWYgPSBmLnJlYWQoRlNfUkVBRF9NQVgpCj4gICAgICAgICAgZGVsIGYKPiAgICAgICAg
ICBpZiBzeXMudmVyc2lvbl9pbmZvWzBdIDwgMzoKPiAgICAgICAgICAgICAgc2VsZi5jZi5wYXJz
ZShidWYpCgpDYW4gd2UgaW5zdGVhZCBtYWtlIHRoZSBwYXJzZXIgdGFrZSBhIGxpc3QgPyAgVGhp
cyBidXNpbmVzcyBvZgpjb25zdHJ1Y3RpbmcgYSBjb25jYXRlbmF0ZWQgc3RyaW5nIGlzIG5vdCB2
ZXJ5IG5pY2UuCgpSZWdhcmRzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
