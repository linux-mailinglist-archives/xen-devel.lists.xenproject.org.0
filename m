Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967611517FB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 10:37:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyubV-0001Nn-Ik; Tue, 04 Feb 2020 09:34:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5+CW=3Y=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iyubU-0001NF-7W
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 09:34:44 +0000
X-Inumbo-ID: 8f7a6cd4-4731-11ea-8ef9-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f7a6cd4-4731-11ea-8ef9-12813bfff9fa;
 Tue, 04 Feb 2020 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580808877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Os92dfSQWU9h6kv9LrnZnZne/r4HgjhA4dGYC/s21v4=;
 b=Wey7Gf7Pt4n56R/V9VX18XZJYPTnUu4aEk9N2FU7JkkiezuDoyMhPLeC
 818SaO2jhH2byuJ8LkUJPyon7Di8L2gTkmOGTGGGiLbVzGO8T26mAEKPO
 cyhjCY0H3ntqvHkug6Q8aepp8kSefHdiwCP9DD1lunJs7iWps0to6VfsY 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
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
IronPort-SDR: GON+E+MD27L8/1CLN2veec9hlMlk/MG9zzYwUc3tfEoj47k2Ax3cIXCiZdj/l7bqOTtw/voxF6
 kmYPDeHWM2fDX+PYEq96kZ06TNgQxcLkZw82CqPllT5S7LRT3l9gYx8qF6Q0BbMgblkUS4bT+d
 oOeb6Ac2iMBFjFT+BwLSHkeitq/FFZe4m+6TJAtn1k9hqv3bmAe6u7zaZeZ1paO57bGXnUjDLo
 y73YDUYv6HMG4nQMeK1BxcZoSel81zoY/vv+lUfw9UfXiUKJqx9UHrnQ1YHIJ4avEQxsqt5Dtf
 /QA=
X-SBRS: 2.7
X-MesageID: 12517741
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,401,1574139600"; d="scan'208";a="12517741"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 4 Feb 2020 09:34:24 +0000
Message-ID: <20200204093424.10159-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200204093424.10159-1-ian.jackson@eu.citrix.com>
References: <20200204093424.10159-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/2] INSTALL: Mention kconfig
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
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+CgpGaXJzdGx5LCBhZGQg
YSByZWZlcmVuY2UgdG8gdGhlIGRvY3VtZW50YXRpb24gZm9yIHRoZSBrY29uZmlnIHN5c3RlbS4K
ClNlY29uZGx5LCB3YXJuIHRoZSB1c2VyIGFib3V0IHRoZSBYRU5fQ09ORklHX0VYUEVSVCBwcm9i
bGVtLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+
ClJldmlld2VkLWJ5OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+CgotLS0KdjI6
IEZpeCB0eXBvcwotLS0KIElOU1RBTEwgfCAyMCArKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9JTlNUQUxMIGIvSU5TVEFM
TAppbmRleCBhYTA4NTYyYjhhLi43MmRjNGI2N2RkIDEwMDY0NAotLS0gYS9JTlNUQUxMCisrKyBi
L0lOU1RBTEwKQEAgLTE5LDYgKzE5LDI2IEBAIGZvbGxvd2luZyBjb21waWxlIHByb2Nlc3MuIE9u
Y2UgY29uZmlndXJlIGlzIGRvbmUsIG1ha2UoMSkgaGFzIHRvIGJlCiBjYWxsZWQuIEFsc28gbWFr
ZSgxKSByZWNvZ25pemVzIGNlcnRhaW4gYXJndW1lbnRzLiBUaGUgZm9sbG93aW5nIHNlY3Rpb25z
CiB3aWxsIGdpdmUgYW4gb3ZlcnZpZXcuCiAKK1hlbiBIeXBlcnZpc29yCis9PT09PT09PT09PT09
PQorCitYZW4gaXRzZWxmIGlzIGNvbmZpZ3VyZWQgdmlhIGEgYGtjb25maWcnIHN5c3RlbSBib3Jy
b3dlZCBmcm9tIExpbnV4LgorU2VlIGRvY3MvbWlzYy9rY29uZmlnLnR4dC4KKworTm90ZSB0aGF0
IHVubGlrZSB3aXRoIExpbnV4LCBhbmQgY29udHJhcnkgdG8gdGhhdCBkb2N1bWVudCwgeW91IGNh
bm5vdAorbG9vayBhdCBLY29uZmlnIGZpbGVzLCBvciB0aGUgZGVmYXVsdCBvciBnZW5lcmF0ZWQg
Y29uZmlnIGZpbGVzIGV0Yy4sCit0byBmaW5kIGF2YWlsYWJsZSBjb25maWd1cmF0aW9uIG9wdGlv
bnMuICBUaGlzIGlzIGJlY2F1c2UgaXQgaXMgb25seQorc3VwcG9ydGVkIChhbmQgc2VjdXJpdHkg
c3VwcG9ydGVkKSBieSB0aGUgWGVuIFByb2plY3QsIHRvIGNoYW5nZSBhCitzbWFsbCBzdWJzZXQg
b2YgdGhlIG9wdGlvbnMuICBBdHRlbXB0cyB0byBjaGFuZ2Ugb3RoZXIgb3B0aW9ucyB3aWxsIGJl
CitzaWxlbnRseSBvdmVycmlkZGVuLiAgVGhlIG9ubHkgd2F5IHRvIGZpbmQgd2hpY2ggY29uZmln
dXJhdGlvbiBvcHRpb25zCithcmUgYXZhaWxhYmxlIGlzIHRvIHJ1biBgbWFrZSBtZW51Y29uZmln
JyBvciB0aGUgbGlrZS4KKworWW91IGNhbiBjb3VudGVyLW92ZXJyaWRlIHRoaXMgYmVoYXZpb3Vy
IGJ5IHNldHRpbmcgWEVOX0NPTkZJR19FWFBFUlQ9eQoraW4geW91ciBlbnZpcm9ubWVudC4gIEhv
d2V2ZXIsIGRvaW5nIHRoaXMgaXMgbm90IHN1cHBvcnRlZCBhbmQgdGhlCityZXN1bHRpbmcgY29u
ZmlndXJhdGlvbnMgZG8gbm90IHJlY2VpdmUgc2VjdXJpdHkgc3VwcG9ydC4gIElmIHlvdSBzZXQK
K3RoaXMgdmFyaWFibGUgdGhlcmUgaXMgbm90aGluZyBzdG9wcGluZyB5b3Ugc2V0dGluZyBkYW5n
ZXJvdXNseQorZXhwZXJpbWVudGFsIGNvbWJpbmF0aW9ucyBvZiBmZWF0dXJlcyAtIG5vdCBldmVu
IGFueSB3YXJuaW5ncy4KKwogT3B0aW9ucyByZWNvZ25pemVkIGJ5IGNvbmZpZ3VyZQogPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
