Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A0011D58E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 19:30:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifTBw-0007CY-Fi; Thu, 12 Dec 2019 18:28:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MOos=2C=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ifTBu-0007CL-Gc
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 18:27:58 +0000
X-Inumbo-ID: 1ce8bf20-1d0d-11ea-8deb-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ce8bf20-1d0d-11ea-8deb-12813bfff9fa;
 Thu, 12 Dec 2019 18:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576175274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sf9HhTq4lwll+WQF2S/w/a9eTfdLgYzixJiFHlaljrg=;
 b=MUsARUoOewMZfvRJdUM+IGQtbksVKK99IDMqkmiu8ftRCcz5Nws9lWl6
 hwOnPqXjJVSt+jfKboqvOzWZ8dbbZBfrr6gVzXVj1OPY9WqdNPjQzFDGQ
 6p+u3bt+pf3pPxc1KOxry8DaDzz5q+DZmLjlJtvGhIuLa8RR06OcvFZzS w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: u40o6B24LzYEgcnaKKE8W+L4UP/Yy5u5eXfJqrw63hVcelQUDc0RsM5bfuOwk8eh4M4GUYohdk
 1RydU0NI7wzAr0up9FGsTosjAjnvl/99xuhksxH5KMM0zPWrNj7jQTF9lwEt3b4miBQYM0de9A
 qnSWxYwuSYfFFuUbn/DMWL3DwbcUH/aSUDvU96J4se/8RAQZeg5burt3y1D0fp6Kj4AG9aGq4Q
 62vfNJDpLkmHfnvQiz+EtQ/4vucr+I/UB4DzSoMYtaRF8nHOoFEqfOToOmdWjicDqGInXjKbt5
 DpY=
X-SBRS: 2.7
X-MesageID: 10021231
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; d="scan'208";a="10021231"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 12 Dec 2019 18:27:39 +0000
Message-ID: <20191212182740.2190199-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212182740.2190199-1-anthony.perard@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 7/8] xen: Use $(CONFIG_CC_IS_CLANG) instead
 of $(clang) in Makefile
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
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

S2NvbmZpZyBjYW4gY2hlY2sgaWYgJChDQykgaXMgY2xhbmcgb3Igbm90LCBpZiBpdCBpcwpDT05G
SUdfQ0NfSVNfQ0xBTkcgd2lsbCBiZSBzZXQuCgpXaXRoIHRoYXQgcGF0Y2gsIHRoZSBoeXBlcnZp
c29yIGNhbiBiZSBidWlsdCB1c2luZyBjbGFuZyBieSBydW5uaW5nCmBtYWtlIENDPWNsYW5nIENY
WD1jbGFuZysrYCB3aXRob3V0IG5lZWRlZCB0byBwcm92aWRlIGFuIGV4dHJhIGNsYW5nCnBhcmFt
ZXRlci4KCmBtYWtlIGNsYW5nPXlgIHN0aWxsIHdvcmtzIGFzIENvbmZpZy5tayB3aWxsIHNldCBD
QyBhbmQgQ1hYLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+Ci0tLQogeGVuL1J1bGVzLm1rICAgICAgICAgICAgICAgICB8IDggKysrKy0t
LS0KIHhlbi9hcmNoL3g4Ni9SdWxlcy5tayAgICAgICAgfCAyICstCiB4ZW4vY29tbW9uL2NvdmVy
YWdlL01ha2VmaWxlIHwgMiArLQogeGVuL2luY2x1ZGUvTWFrZWZpbGUgICAgICAgICB8IDIgKy0K
IDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9SdWxlcy5tayBiL3hlbi9SdWxlcy5tawppbmRleCBkMDUzZGJkMjY1MjYuLmZj
ZGFmZDAyOTM0MiAxMDA2NDQKLS0tIGEveGVuL1J1bGVzLm1rCisrKyBiL3hlbi9SdWxlcy5tawpA
QCAtNjQsNyArNjQsNyBAQCBDRkxBR1MgKz0gLXBpcGUgLURfX1hFTl9fIC1pbmNsdWRlICQoQkFT
RURJUikvaW5jbHVkZS94ZW4vY29uZmlnLmgKIENGTEFHUy0kKENPTkZJR19ERUJVR19JTkZPKSAr
PSAtZwogQ0ZMQUdTICs9ICctRF9fT0JKRUNUX0ZJTEVfXz0iJEAiJwogCi1pZm5lcSAoJChjbGFu
ZykseSkKK2lmbmVxICgkKENPTkZJR19DQ19JU19DTEFORykseSkKICMgQ2xhbmcgZG9lc24ndCB1
bmRlcnN0YW5kIHRoaXMgY29tbWFuZCBsaW5lIGFyZ3VtZW50LCBhbmQgZG9lc24ndCBhcHBlYXIg
dG8KICMgaGF2ZSBhbiBzdWl0YWJsZSBhbHRlcm5hdGl2ZS4gIFRoZSByZXN1bHRpbmcgY29tcGls
ZWQgYmluYXJ5IGRvZXMgZnVuY3Rpb24sCiAjIGJ1dCBoYXMgYW4gZXhjZXNzaXZlbHkgbGFyZ2Ug
c3ltYm9sIHRhYmxlLgpAQCAtMTI2LDcgKzEyNiw3IEBAIHN1YmRpci1hbGwgOj0gJChzdWJkaXIt
eSkgJChzdWJkaXItbikKICQoZmlsdGVyICUuaW5pdC5vLCQob2JqLXkpICQob2JqLWJpbi15KSAk
KGV4dHJhLXkpKTogQ0ZMQUdTICs9IC1ESU5JVF9TRUNUSU9OU19PTkxZCiAKIGlmZXEgKCQoQ09O
RklHX0NPVkVSQUdFKSx5KQotaWZlcSAoJChjbGFuZykseSkKK2lmZXEgKCQoQ09ORklHX0NDX0lT
X0NMQU5HKSx5KQogICAgIENPVl9GTEFHUyA6PSAtZnByb2ZpbGUtaW5zdHItZ2VuZXJhdGUgLWZj
b3ZlcmFnZS1tYXBwaW5nCiBlbHNlCiAgICAgQ09WX0ZMQUdTIDo9IC1mcHJvZmlsZS1hcmNzIC1m
dGVzdC1jb3ZlcmFnZQpAQCAtMTQzLDcgKzE0Myw3IEBAIGVuZGlmCiAKIGlmZXEgKCQoQ09ORklH
X0xUTykseSkKIENGTEFHUyArPSAtZmx0bwotTERGTEFHUy0kKGNsYW5nKSArPSAtcGx1Z2luIExM
Vk1nb2xkLnNvCitMREZMQUdTLSQoQ09ORklHX0NDX0lTX0NMQU5HKSArPSAtcGx1Z2luIExMVk1n
b2xkLnNvCiAjIFdvdWxkIGxpa2UgdG8gaGFuZGxlIGFsbCBvYmplY3QgZmlsZXMgYXMgYml0Y29k
ZSwgYnV0IG9iamVjdHMgbWFkZSBmcm9tCiAjIHB1cmUgYXNtIGFyZSBpbiBhIGRpZmZlcmVudCBm
b3JtYXQgYW5kIGhhdmUgdG8gYmUgY29sbGVjdGVkIHNlcGFyYXRlbHkuCiAjIE1pcnJvciB0aGUg
ZGlyZWN0b3J5IHRyZWUsIGNvbGxlY3RpbmcgdGhlbSBhcyBidWlsdF9pbl9iaW4uby4KQEAgLTE5
Nyw3ICsxOTcsNyBAQCBTUkNQQVRIIDo9ICQocGF0c3Vic3QgJChCQVNFRElSKS8lLCUsJChDVVJE
SVIpKQogJS5vOiAlLmMgTWFrZWZpbGUKIGlmZXEgKCQoQ09ORklHX0VORk9SQ0VfVU5JUVVFX1NZ
TUJPTFMpLHkpCiAJJChDQykgJChDRkxBR1MpIC1jICQ8IC1vICQoQEQpLy4kKEBGKS50bXAKLWlm
ZXEgKCQoY2xhbmcpLHkpCitpZmVxICgkKENPTkZJR19DQ19JU19DTEFORykseSkKIAkkKE9CSkNP
UFkpIC0tcmVkZWZpbmUtc3ltICQ8PSQoU1JDUEFUSCkvJDwgJChARCkvLiQoQEYpLnRtcCAkQAog
ZWxzZQogCSQoT0JKQ09QWSkgLS1yZWRlZmluZS1zeW0gJCg8Rik9JChTUkNQQVRIKS8kPCAkKEBE
KS8uJChARikudG1wICRACmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvUnVsZXMubWsgYi94ZW4v
YXJjaC94ODYvUnVsZXMubWsKaW5kZXggYTJjMjU3ZmI5NWIyLi5iOThlMTRlMjhjNWEgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9SdWxlcy5taworKysgYi94ZW4vYXJjaC94ODYvUnVsZXMubWsK
QEAgLTEyLDcgKzEyLDcgQEAgQ0ZMQUdTICs9ICctRF9fT0JKRUNUX0xBQkVMX189JChzdWJzdCAv
LCQkLCQoc3Vic3QgLSxfLCQoc3Vic3QgJChCQVNFRElSKS8sLCQoQ1UKICMgUHJldmVudCBmbG9h
dGluZy1wb2ludCB2YXJpYWJsZXMgZnJvbSBjcmVlcGluZyBpbnRvIFhlbi4KIENGTEFHUyArPSAt
bXNvZnQtZmxvYXQKIAotaWZlcSAoJChjbGFuZykseSkKK2lmZXEgKCQoQ09ORklHX0NDX0lTX0NM
QU5HKSx5KQogIyBOb3RlOiBBbnkgdGVzdCB3aGljaCBhZGRzIC1uby1pbnRlZ3JhdGVkLWFzIHdp
bGwgY2F1c2Ugc3Vic2VxdWVudCB0ZXN0cyB0bwogIyBzdWNjZWVkLCBhbmQgbm90IHRyaWdnZXIg
ZnVydGhlciBhZGRpdGlvbnMuCiAjCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2NvdmVyYWdlL01h
a2VmaWxlIGIveGVuL2NvbW1vbi9jb3ZlcmFnZS9NYWtlZmlsZQppbmRleCBiNTA5ZTUxZjk2MGIu
LjYzZjk4YzcxZDZiNSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9jb3ZlcmFnZS9NYWtlZmlsZQor
KysgYi94ZW4vY29tbW9uL2NvdmVyYWdlL01ha2VmaWxlCkBAIC0xLDUgKzEsNSBAQAogb2JqLXkg
Kz0gY292ZXJhZ2UubwotaWZuZXEgKCQoY2xhbmcpLHkpCitpZm5lcSAoJChDT05GSUdfQ0NfSVNf
Q0xBTkcpLHkpCiBvYmoteSArPSBnY292X2Jhc2UubyBnY292Lm8KIG9iai15ICs9ICQoY2FsbCBj
Yy1pZnZlcnNpb24sLWx0LDA0MDcsIFwKIAkJZ2NjXzNfNC5vLCAkKGNhbGwgY2MtaWZ2ZXJzaW9u
LC1sdCwwNDA5LCBcCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9NYWtlZmlsZSBiL3hlbi9pbmNs
dWRlL01ha2VmaWxlCmluZGV4IGMzZTAyODNkMzQ3Zi4uZmRlMGNhMDEzMTIxIDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS9NYWtlZmlsZQorKysgYi94ZW4vaW5jbHVkZS9NYWtlZmlsZQpAQCAtMzYs
NyArMzYsNyBAQCBjcHBmbGFncy15ICAgICAgICAgICAgICAgIDo9IC1pbmNsdWRlIHB1YmxpYy94
ZW4tY29tcGF0LmggLURYRU5fR0VORVJBVElOR19DT01QQQogY3BwZmxhZ3MtJChDT05GSUdfWDg2
KSAgICArPSAtbTMyCiAKICMgOC1ieXRlIHR5cGVzIGFyZSA0LWJ5dGUgYWxpZ25lZCBvbiB4ODZf
MzIgLi4uCi1pZmVxICgkKGNsYW5nKSx5KQoraWZlcSAoJChDT05GSUdfQ0NfSVNfQ0xBTkcpLHkp
CiBwcmVmaXgtJChDT05GSUdfWDg2KSAgICAgIDo9IFwjcHJhZ21hIHBhY2socHVzaCwgNCkKIHN1
ZmZpeC0kKENPTkZJR19YODYpICAgICAgOj0gXCNwcmFnbWEgcGFjayhwb3ApCiBlbHNlCi0tIApB
bnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
