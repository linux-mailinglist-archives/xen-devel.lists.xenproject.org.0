Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A16E1D90
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:01:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNHA3-0004xW-1J; Wed, 23 Oct 2019 13:58:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xo40=YQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iNHA1-0004wW-OJ
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:58:49 +0000
X-Inumbo-ID: 337549d0-f59d-11e9-947f-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 337549d0-f59d-11e9-947f-12813bfff9fa;
 Wed, 23 Oct 2019 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571839114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PO96FHxwZQffDGMSm7nUzZRMEcvgaDQH+GKPeqSlkL8=;
 b=PTGr+3ttiGH86vGMCcAQGhlsKA1HD1kspgdSo92+IfgrFCcH9Ezacx+g
 a47ThmzVd/MWBfHnfoJixAhKs+gKk3vO8anZlTyra0O6rZCjzjRMxUK8W
 pwVXoyK6g7S+cwdIa4oFnmmsY8XDqbjo0s2xExLbo6+JHa+QvjD01PFgy 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Oqg7ArGFovo4VN3zwplE5kHzvNxilR4s3Iki7cNFojzHlzsKnU8Uz8Wgl9nsw4o/6RFANKVjp2
 8FM+ulurQ+Q+4HcA2D9YjH5SoaP12zBzvjDparzADqzBgVEQNhwVCQtPXX60gYd0iGNh63PZ1M
 05e7syCUyo0HZDB2bEX5iTbCP6jlpxSbsT323tQIJFxzSEVrpwk+cxuBt/YehSK/xgvz+5zVWt
 30OBSR1vEI844AljV55N2tARmRJJEDKVgfW+tpAdVVtmPxnxCBoFUuFMEWWLYFLUtyB0f0IHon
 9KE=
X-SBRS: 2.7
X-MesageID: 7415854
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7415854"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 14:58:08 +0100
Message-ID: <20191023135812.21348-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191023135812.21348-1-andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 3/7] xen/nospec: Introduce
 CONFIG_SPECULATIVE_HARDEN_BRANCH
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVzdCBhcyB3aXRoIENPTkZJR19TUEVDVUxBVElWRV9IQVJERU5fQVJSQVksIGJyYW5jaCBoYXJk
ZW5pbmcgc2hvdWxkIGJlCmNvbmZpZ3VyYWJsZSBhdCBjb21waWxlIHRpbWUuCgpUaGUgcHJldmlv
dXMgQ09ORklHX0hWTSB3YXMgYSBjb25zZXF1ZW5jZSBvZiB3aGF0IGNvdWxkIGJlIGRpc2N1c3Nl
ZCBwdWJsaWNseQphdCB0aGUgdGltZSB0aGUgcGF0Y2hlcyB3ZXJlIHN1Ym1pdHRlZCwgYW5kIHdh
c24ndCBhY3R1YWxseSBjb3JyZWN0LiAgTGF0ZXIKcGF0Y2hlcyB3aWxsIG1ha2UgZnVydGhlciBj
b3JyZWN0aW9ucy4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgpDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKdjM6CiAqIFJlZHVj
ZSB0byBqdXN0IHRoZSBLY29uZmlnIG9wdGlvbi4gIFNwbGl0IG90aGVyIGNoYW5nZXMgb3V0IGlu
dG8gc2VwYXJhdGUKICAgcGF0Y2hlcy4KCnYyOgogKiBFeHBhbmQgdGhlIGNvbW1pdCBtZXNzYWdl
IHRvIGRlc2NyaWJlIGhvdyB0aGUgZ2VuZXJhdGVkIGNvZGUgaXMgYnJva2VuLgogKiBSZW5hbWUg
dG8gQ09ORklHX1NQRUNVTEFUSVZFX0hBUkRFTl9CUkFOQ0gKICogU3dpdGNoIGFsdGVybmF0aXZl
KCkgdG8gYXNtKCkKICogRml4IGEgY29tbWVudCB0eXBvCi0tLQogeGVuL2NvbW1vbi9LY29uZmln
ICAgICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L25vc3BlYy5oIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vS2NvbmZpZyBiL3hlbi9jb21t
b24vS2NvbmZpZwppbmRleCA3YjVkZDlkNDk1Li5jOWU2NzE4NjllIDEwMDY0NAotLS0gYS94ZW4v
Y29tbW9uL0tjb25maWcKKysrIGIveGVuL2NvbW1vbi9LY29uZmlnCkBAIC0xMDIsNiArMTAyLDI5
IEBAIGNvbmZpZyBTUEVDVUxBVElWRV9IQVJERU5fQVJSQVkKIAogCSAgSWYgdW5zdXJlLCBzYXkg
WS4KIAorY29uZmlnIFNQRUNVTEFUSVZFX0hBUkRFTl9CUkFOQ0gKKwlib29sICJTcGVjdWxhdGl2
ZSBCcmFuY2ggSGFyZGVuaW5nIgorCWRlZmF1bHQgeQorCWRlcGVuZHMgb24gWDg2CisgICAgICAg
IC0tLWhlbHAtLS0KKwkgIENvbnRlbXBvcmFyeSBwcm9jZXNzb3JzIG1heSB1c2Ugc3BlY3VsYXRp
dmUgZXhlY3V0aW9uIGFzIGEKKwkgIHBlcmZvcm1hbmNlIG9wdGltaXNhdGlvbiwgYnV0IHRoaXMg
Y2FuIHBvdGVudGlhbGx5IGJlIGFidXNlZCBieSBhbgorCSAgYXR0YWNrZXIgdG8gbGVhayBkYXRh
IHZpYSBzcGVjdWxhdGl2ZSBzaWRlY2hhbm5lbHMuCisKKwkgIE9uZSBzb3VyY2Ugb2YgbWlzYmVo
YXZpb3VyIGlzIGJ5IGV4ZWN1dGluZyB0aGUgd3JvbmcgYmFzaWMgYmxvY2sKKwkgIGZvbGxvd2lu
ZyBhIGNvbmRpdGlvbmFsIGp1bXAuCisKKwkgIFdoZW4gZW5hYmxlZCwgc3BlY2lmaWMgY29uZGl0
aW9ucyB3aGljaCBoYXZlIGJlZW4gZGVlbWVkIGxpYWJsZSB0bworCSAgYmUgc3BlY3VsYXRpdmVs
eSBhYnVzZWQgd2lsbCBiZSBoYXJkZW5lZCB0byBhdm9pZCBlbnRlcmluZyB0aGUgd3JvbmcKKwkg
IGJhc2ljIGJsb2NrLgorCisJICBUaGlzIGlzIGEgYmVzdC1lZmZvcnQgbWl0aWdhdGlvbi4gIFRo
ZXJlIGFyZSBubyBndWFyYW50ZWVzIHRoYXQgYWxsCisJICBhcmVhcyBvZiBjb2RlIG9wZW4gdG8g
YWJ1c2UgaGF2ZSBiZWVuIGhhcmRlbmVkLCBub3IgdGhhdAorCSAgb3B0aW1pc2F0aW9ucyBpbiB0
aGUgY29tcGlsZXIgaGF2ZW4ndCBzdWJ2ZXJ0ZWQgdGhlIGF0dGVtcHRzIHRvCisJICBoYXJkZW4u
CisKKwkgIElmIHVuc3VyZSwgc2F5IFkuCisKIGVuZG1lbnUKIAogY29uZmlnIEtFWEVDCmRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L25vc3BlYy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9ub3NwZWMuaAppbmRleCA0MjdiNWZmOWRmLi4xNTRlOTJhZWQ4IDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L25vc3BlYy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbm9zcGVj
LmgKQEAgLTksNyArOSw3IEBACiAvKiBBbGxvdyB0byBpbnNlcnQgYSByZWFkIG1lbW9yeSBiYXJy
aWVyIGludG8gY29uZGl0aW9uYWxzICovCiBzdGF0aWMgYWx3YXlzX2lubGluZSBib29sIGJhcnJp
ZXJfbm9zcGVjX3RydWUodm9pZCkKIHsKLSNpZmRlZiBDT05GSUdfSFZNCisjaWZkZWYgQ09ORklH
X1NQRUNVTEFUSVZFX0hBUkRFTl9CUkFOQ0gKICAgICBhbHRlcm5hdGl2ZSgiIiwgImxmZW5jZSIs
IFg4Nl9GRUFUVVJFX1NDX0wxVEZfVlVMTik7CiAjZW5kaWYKICAgICByZXR1cm4gdHJ1ZTsKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
