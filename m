Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDDA1508AA
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 15:45:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iycx5-0006Ck-W6; Mon, 03 Feb 2020 14:43:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ac3p=3X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iycx4-0006C1-5j
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 14:43:50 +0000
X-Inumbo-ID: 94727aaf-4693-11ea-8e6a-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94727aaf-4693-11ea-8e6a-12813bfff9fa;
 Mon, 03 Feb 2020 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580741026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FfU9MZI/ojg3SsfVC2RfFMTHV6FmZYYVJt+bQ8PV4Hs=;
 b=AD+VStpozkpboFoX82ugAZhZDqssrt+QBecqWR63eIfFuG2efwOPFvQz
 Oy3ey/Aub8B57b2vs58pLU1YuBIkPp05EfeSekEZMmK407US4Qg+L6Rfj
 FeOGuNMujhHcPj1og69PUfmE9LCn0GXBFIa/4WjcTDqLkMx9gdqrQ9zMb c=;
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
IronPort-SDR: 96PiWZXpb9fwwkrcodzvYVTc3OkL6jPTXtogDhEkU9J6vS9DPN5M+W4wyewLh90NSQoQM6LyRJ
 8Q4bawlW5xT286yStSE4oWO8tWP0Gfx1DU4TIYx2eEbWp7tafvWCvtm/L4r3cPLYbWfAT3mTSb
 SiQSJdiMtuPz/PkURZmqj1RzUbDYsR8wOHFY3/bBZz/L04gVZ4FTLFQDcTzweHsMtcAXNI4ZKn
 pBAf6StDnpOmF+e2Mh/xxJLqw4pt663VK0wDHdFdd6D5crncpFc+gZeCXlytvCclFHvVIshVtc
 WVw=
X-SBRS: 2.7
X-MesageID: 12023812
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="12023812"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 3 Feb 2020 14:43:39 +0000
Message-ID: <20200203144340.4614-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200203144340.4614-1-andrew.cooper3@citrix.com>
References: <20200203144340.4614-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/4] AMD/IOMMU: Treat guest head/tail pointers
 as byte offsets
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIE1NSU8gcmVnaXN0ZXJzIGFzIGFscmVhZHkgYnl0ZSBvZmZzZXRzLiAgQnkgbWFza2luZyBv
dXQgdGhlIHJlc2VydmVkIGJpdHMKc3VpdGFibHkgaW4gZ3Vlc3RfaW9tbXVfbW1pb193cml0ZTY0
KCksIHdlIGNhbiB1c2UgdGhlIHZhbHVlcyBkaXJlY3RseSwKaW5zdGVhZCBvZiBtYXNraW5nL3No
aWZ0aW5nIG9uIGV2ZXJ5IHVzZS4KClN0b3JlIHRoZSBidWZmZXIgc2l6ZSwgcmF0aGVyIHRoYW4g
dGhlIG51bWJlciBvZiBlbnRyaWVzLCB0byBrZWVwIHRoZSBzYW1lCnVuaXRzIGZvciBjb21wYXJp
c29uIHB1cnBvc2VzLgoKVGhpcyBzaW1wbGlmaWVzIGd1ZXN0X2lvbW11X2dldF90YWJsZV9tZm4o
KSBieSBkcm9wcGluZyB0aGUgZW50cnlfc2l6ZQpwYXJhbWV0ZXIsIGFuZCBzaW1wbGlmaWVzIHRo
ZSBtYXBfZG9tYWluX3BhZ2UoKSBoYW5kbGluZyBieSBiZWluZyBhYmxlIHRvIGRyb3AKdGhlIGxv
Z19iYXNlIHZhcmlhYmxlcy4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1
bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpVbnRlc3RlZCAtIHRoaXMgaXMg
YWxsIGRlYWQgY29kZSwgYW5kIHRoZXJlIGFyZSBwbGVudHkgb2Ygc2VjdXJpdHkgaXNzdWVzCndo
aWNoIG5lZWQgYWRqdXN0aW5nIGJlZm9yZSBpdCBjYW4gc3RhcnQgYmVpbmcgdXNlZCBhZ2Fpbi4K
LS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXUuaCAgICAgICB8ICAyICstCiB4
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfZ3Vlc3QuYyB8IDg1ICsrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwg
NDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1k
L2lvbW11LmggYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXUuaAppbmRleCA4MWI2
ODEyZDNhLi4wYjU5OGQwNmY4IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
bWQvaW9tbXUuaAorKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXUuaApAQCAt
MTUyLDcgKzE1Miw3IEBAIHN0cnVjdCBndWVzdF9idWZmZXIgewogICAgIHN0cnVjdCBtbWlvX3Jl
ZyAgICAgICAgIHJlZ19iYXNlOwogICAgIHN0cnVjdCBtbWlvX3JlZyAgICAgICAgIHJlZ190YWls
OwogICAgIHN0cnVjdCBtbWlvX3JlZyAgICAgICAgIHJlZ19oZWFkOwotICAgIHVpbnQzMl90ICAg
ICAgICAgICAgICAgIGVudHJpZXM7CisgICAgdWludDMyX3QgICAgICAgICAgICAgICAgc2l6ZTsK
IH07CiAKIHN0cnVjdCBndWVzdF9pb21tdV9tc2kgewpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYW1kL2lvbW11X2d1ZXN0LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
bWQvaW9tbXVfZ3Vlc3QuYwppbmRleCBkMDU5MDFkMzQ4Li5lZjljNGE0ZDI5IDEwMDY0NAotLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfZ3Vlc3QuYworKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfZ3Vlc3QuYwpAQCAtMTAzLDE0ICsxMDMsMTMgQEAg
c3RhdGljIHZvaWQgZ3Vlc3RfaW9tbXVfZGVsaXZlcl9tc2koc3RydWN0IGRvbWFpbiAqZCkKIAog
c3RhdGljIHVuc2lnbmVkIGxvbmcgZ3Vlc3RfaW9tbXVfZ2V0X3RhYmxlX21mbihzdHJ1Y3QgZG9t
YWluICpkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
aW50NjRfdCBiYXNlX3JhdywKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IGVudHJ5X3NpemUsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBwb3MpCiB7CiAgICAgdW5zaWdu
ZWQgbG9uZyBpZHgsIGdmbiwgbWZuOwogICAgIHAybV90eXBlX3QgcDJtdDsKIAogICAgIGdmbiA9
IGdldF9nZm5fZnJvbV9iYXNlX3JlZyhiYXNlX3Jhdyk7Ci0gICAgaWR4ID0gKHBvcyAqIGVudHJ5
X3NpemUpID4+IFBBR0VfU0hJRlQ7CisgICAgaWR4ID0gcG9zID4+IFBBR0VfU0hJRlQ7CiAKICAg
ICBtZm4gPSBtZm5feChnZXRfZ2ZuKGQsIGdmbiArIGlkeCwgJnAybXQpKTsKICAgICBwdXRfZ2Zu
KGQsIGdmbik7CkBAIC0xMzMsMTQgKzEzMiwxNCBAQCBzdGF0aWMgdm9pZCBndWVzdF9pb21tdV9l
bmFibGVfcmluZ19idWZmZXIoc3RydWN0IGd1ZXN0X2lvbW11ICppb21tdSwKICAgICB1aW50MzJf
dCBsZW5ndGhfcmF3ID0gZ2V0X2ZpZWxkX2Zyb21fcmVnX3UzMihidWZmZXItPnJlZ19iYXNlLmhp
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJJTkdf
QkZfTEVOR1RIX01BU0ssCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUklOR19CRl9MRU5HVEhfU0hJRlQpOwotICAgIGJ1ZmZlci0+ZW50cmllcyA9IDEg
PDwgbGVuZ3RoX3JhdzsKKyAgICBidWZmZXItPnNpemUgPSBlbnRyeV9zaXplIDw8IGxlbmd0aF9y
YXc7CiB9CiAKIHZvaWQgZ3Vlc3RfaW9tbXVfYWRkX3Bwcl9sb2coc3RydWN0IGRvbWFpbiAqZCwg
dTMyIGVudHJ5W10pCiB7CiAgICAgdWludDE2X3QgZ2Rldl9pZDsKICAgICB1bnNpZ25lZCBsb25n
IG1mbiwgdGFpbCwgaGVhZDsKLSAgICBwcHJfZW50cnlfdCAqbG9nLCAqbG9nX2Jhc2U7CisgICAg
cHByX2VudHJ5X3QgKmxvZzsKICAgICBzdHJ1Y3QgZ3Vlc3RfaW9tbXUgKmlvbW11OwogCiAgICAg
aWYgKCAhaXNfaHZtX2RvbWFpbihkKSApCkBAIC0xNTAsMTAgKzE0OSwxMCBAQCB2b2lkIGd1ZXN0
X2lvbW11X2FkZF9wcHJfbG9nKHN0cnVjdCBkb21haW4gKmQsIHUzMiBlbnRyeVtdKQogICAgIGlm
ICggIWlvbW11ICkKICAgICAgICAgcmV0dXJuOwogCi0gICAgdGFpbCA9IGlvbW11X2dldF9yYl9w
b2ludGVyKGlvbW11LT5wcHJfbG9nLnJlZ190YWlsLmxvKTsKLSAgICBoZWFkID0gaW9tbXVfZ2V0
X3JiX3BvaW50ZXIoaW9tbXUtPnBwcl9sb2cucmVnX2hlYWQubG8pOworICAgIHRhaWwgPSBpb21t
dS0+cHByX2xvZy5yZWdfdGFpbC5sbzsKKyAgICBoZWFkID0gaW9tbXUtPnBwcl9sb2cucmVnX2hl
YWQubG87CiAKLSAgICBpZiAoIHRhaWwgPj0gaW9tbXUtPnBwcl9sb2cuZW50cmllcyB8fCBoZWFk
ID49IGlvbW11LT5wcHJfbG9nLmVudHJpZXMgKQorICAgIGlmICggdGFpbCA+PSBpb21tdS0+cHBy
X2xvZy5zaXplIHx8IGhlYWQgPj0gaW9tbXUtPnBwcl9sb2cuc2l6ZSApCiAgICAgewogICAgICAg
ICBBTURfSU9NTVVfREVCVUcoIkVycm9yOiBndWVzdCBpb21tdSBwcHIgbG9nIG92ZXJmbG93c1xu
Iik7CiAgICAgICAgIGd1ZXN0X2lvbW11X2Rpc2FibGUoaW9tbXUpOwpAQCAtMTYxLDExICsxNjAs
MTAgQEAgdm9pZCBndWVzdF9pb21tdV9hZGRfcHByX2xvZyhzdHJ1Y3QgZG9tYWluICpkLCB1MzIg
ZW50cnlbXSkKICAgICB9CiAKICAgICBtZm4gPSBndWVzdF9pb21tdV9nZXRfdGFibGVfbWZuKGQs
IHJlZ190b191NjQoaW9tbXUtPnBwcl9sb2cucmVnX2Jhc2UpLAotICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc2l6ZW9mKHBwcl9lbnRyeV90KSwgdGFpbCk7CisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB0YWlsKTsKICAgICBBU1NFUlQobWZuX3ZhbGlkKF9t
Zm4obWZuKSkpOwogCi0gICAgbG9nX2Jhc2UgPSBtYXBfZG9tYWluX3BhZ2UoX21mbihtZm4pKTsK
LSAgICBsb2cgPSBsb2dfYmFzZSArIHRhaWwgJSAoUEFHRV9TSVpFIC8gc2l6ZW9mKHBwcl9lbnRy
eV90KSk7CisgICAgbG9nID0gbWFwX2RvbWFpbl9wYWdlKF9tZm4obWZuKSkgKyAodGFpbCAmIFBB
R0VfTUFTSyk7CiAKICAgICAvKiBDb252ZXJ0IHBoeXNpY2FsIGRldmljZSBpZCBiYWNrIGludG8g
dmlydHVhbCBkZXZpY2UgaWQgKi8KICAgICBnZGV2X2lkID0gZ3Vlc3RfYmRmKGQsIGlvbW11X2dl
dF9kZXZpZF9mcm9tX2NtZChlbnRyeVswXSkpOwpAQCAtMTc0LDEzICsxNzIsMTUgQEAgdm9pZCBn
dWVzdF9pb21tdV9hZGRfcHByX2xvZyhzdHJ1Y3QgZG9tYWluICpkLCB1MzIgZW50cnlbXSkKICAg
ICBtZW1jcHkobG9nLCBlbnRyeSwgc2l6ZW9mKHBwcl9lbnRyeV90KSk7CiAKICAgICAvKiBOb3cg
c2hpZnQgcHByIGxvZyB0YWlsIHBvaW50ZXIgKi8KLSAgICBpZiAoICsrdGFpbCA+PSBpb21tdS0+
cHByX2xvZy5lbnRyaWVzICkKKyAgICB0YWlsICs9IHNpemVvZihwcHJfZW50cnlfdCk7CisgICAg
aWYgKCB0YWlsID49IGlvbW11LT5wcHJfbG9nLnNpemUgKQogICAgIHsKICAgICAgICAgdGFpbCA9
IDA7CiAgICAgICAgIGlvbW11LT5yZWdfc3RhdHVzLmxvIHw9IElPTU1VX1NUQVRVU19QUFJfTE9H
X09WRVJGTE9XOwogICAgIH0KLSAgICBpb21tdV9zZXRfcmJfcG9pbnRlcigmaW9tbXUtPnBwcl9s
b2cucmVnX3RhaWwubG8sIHRhaWwpOwotICAgIHVubWFwX2RvbWFpbl9wYWdlKGxvZ19iYXNlKTsK
KworICAgIGlvbW11LT5wcHJfbG9nLnJlZ190YWlsLmxvID0gdGFpbDsKKyAgICB1bm1hcF9kb21h
aW5fcGFnZShsb2cpOwogCiAgICAgZ3Vlc3RfaW9tbXVfZGVsaXZlcl9tc2koZCk7CiB9CkBAIC0x
ODksNyArMTg5LDcgQEAgdm9pZCBndWVzdF9pb21tdV9hZGRfZXZlbnRfbG9nKHN0cnVjdCBkb21h
aW4gKmQsIHUzMiBlbnRyeVtdKQogewogICAgIHVpbnQxNl90IGRldl9pZDsKICAgICB1bnNpZ25l
ZCBsb25nIG1mbiwgdGFpbCwgaGVhZDsKLSAgICBldmVudF9lbnRyeV90ICpsb2csICpsb2dfYmFz
ZTsKKyAgICBldmVudF9lbnRyeV90ICpsb2c7CiAgICAgc3RydWN0IGd1ZXN0X2lvbW11ICppb21t
dTsKIAogICAgIGlmICggIWlzX2h2bV9kb21haW4oZCkgKQpAQCAtMTk5LDEwICsxOTksMTAgQEAg
dm9pZCBndWVzdF9pb21tdV9hZGRfZXZlbnRfbG9nKHN0cnVjdCBkb21haW4gKmQsIHUzMiBlbnRy
eVtdKQogICAgIGlmICggIWlvbW11ICkKICAgICAgICAgcmV0dXJuOwogCi0gICAgdGFpbCA9IGlv
bW11X2dldF9yYl9wb2ludGVyKGlvbW11LT5ldmVudF9sb2cucmVnX3RhaWwubG8pOwotICAgIGhl
YWQgPSBpb21tdV9nZXRfcmJfcG9pbnRlcihpb21tdS0+ZXZlbnRfbG9nLnJlZ19oZWFkLmxvKTsK
KyAgICB0YWlsID0gaW9tbXUtPmV2ZW50X2xvZy5yZWdfdGFpbC5sbzsKKyAgICBoZWFkID0gaW9t
bXUtPmV2ZW50X2xvZy5yZWdfaGVhZC5sbzsKIAotICAgIGlmICggdGFpbCA+PSBpb21tdS0+ZXZl
bnRfbG9nLmVudHJpZXMgfHwgaGVhZCA+PSBpb21tdS0+ZXZlbnRfbG9nLmVudHJpZXMgKQorICAg
IGlmICggdGFpbCA+PSBpb21tdS0+ZXZlbnRfbG9nLnNpemUgfHwgaGVhZCA+PSBpb21tdS0+ZXZl
bnRfbG9nLnNpemUgKQogICAgIHsKICAgICAgICAgQU1EX0lPTU1VX0RFQlVHKCJFcnJvcjogZ3Vl
c3QgaW9tbXUgZXZlbnQgb3ZlcmZsb3dzXG4iKTsKICAgICAgICAgZ3Vlc3RfaW9tbXVfZGlzYWJs
ZShpb21tdSk7CkBAIC0yMTAsMTEgKzIxMCwxMCBAQCB2b2lkIGd1ZXN0X2lvbW11X2FkZF9ldmVu
dF9sb2coc3RydWN0IGRvbWFpbiAqZCwgdTMyIGVudHJ5W10pCiAgICAgfQogCiAgICAgbWZuID0g
Z3Vlc3RfaW9tbXVfZ2V0X3RhYmxlX21mbihkLCByZWdfdG9fdTY0KGlvbW11LT5ldmVudF9sb2cu
cmVnX2Jhc2UpLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGV2
ZW50X2VudHJ5X3QpLCB0YWlsKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHRhaWwpOwogICAgIEFTU0VSVChtZm5fdmFsaWQoX21mbihtZm4pKSk7CiAKLSAgICBsb2dfYmFz
ZSA9IG1hcF9kb21haW5fcGFnZShfbWZuKG1mbikpOwotICAgIGxvZyA9IGxvZ19iYXNlICsgdGFp
bCAlIChQQUdFX1NJWkUgLyBzaXplb2YoZXZlbnRfZW50cnlfdCkpOworICAgIGxvZyA9IG1hcF9k
b21haW5fcGFnZShfbWZuKG1mbikpICsgKHRhaWwgJiBQQUdFX01BU0spOwogCiAgICAgLyogcmUt
d3JpdGUgcGh5c2ljYWwgZGV2aWNlIGlkIGludG8gdmlydHVhbCBkZXZpY2UgaWQgKi8KICAgICBk
ZXZfaWQgPSBndWVzdF9iZGYoZCwgaW9tbXVfZ2V0X2RldmlkX2Zyb21fY21kKGVudHJ5WzBdKSk7
CkBAIC0yMjIsMTQgKzIyMSwxNSBAQCB2b2lkIGd1ZXN0X2lvbW11X2FkZF9ldmVudF9sb2coc3Ry
dWN0IGRvbWFpbiAqZCwgdTMyIGVudHJ5W10pCiAgICAgbWVtY3B5KGxvZywgZW50cnksIHNpemVv
ZihldmVudF9lbnRyeV90KSk7CiAKICAgICAvKiBOb3cgc2hpZnQgZXZlbnQgbG9nIHRhaWwgcG9p
bnRlciAqLwotICAgIGlmICggKyt0YWlsID49IGlvbW11LT5ldmVudF9sb2cuZW50cmllcyApCisg
ICAgdGFpbCArPSBzaXplb2YoZXZlbnRfZW50cnlfdCk7CisgICAgaWYgKCB0YWlsID49IGlvbW11
LT5ldmVudF9sb2cuc2l6ZSApCiAgICAgewogICAgICAgICB0YWlsID0gMDsKICAgICAgICAgaW9t
bXUtPnJlZ19zdGF0dXMubG8gfD0gSU9NTVVfU1RBVFVTX0VWRU5UX0xPR19PVkVSRkxPVzsKICAg
ICB9CiAKLSAgICBpb21tdV9zZXRfcmJfcG9pbnRlcigmaW9tbXUtPmV2ZW50X2xvZy5yZWdfdGFp
bC5sbywgdGFpbCk7Ci0gICAgdW5tYXBfZG9tYWluX3BhZ2UobG9nX2Jhc2UpOworICAgIGlvbW11
LT5ldmVudF9sb2cucmVnX3RhaWwubG8gPSB0YWlsOworICAgIHVubWFwX2RvbWFpbl9wYWdlKGxv
Zyk7CiAKICAgICBndWVzdF9pb21tdV9kZWxpdmVyX21zaShkKTsKIH0KQEAgLTM3OSw3ICszNzks
NyBAQCBzdGF0aWMgaW50IGRvX2ludmFsaWRhdGVfZHRlKHN0cnVjdCBkb21haW4gKmQsIGNtZF9l
bnRyeV90ICpjbWQpCiAKICAgICBkdGVfbWZuID0gZ3Vlc3RfaW9tbXVfZ2V0X3RhYmxlX21mbihk
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ190b191NjQoZ19p
b21tdS0+ZGV2X3RhYmxlLnJlZ19iYXNlKSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzaXplb2Yoc3RydWN0IGFtZF9pb21tdV9kdGUpLCBnYmRmKTsKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2Yoc3RydWN0IGFtZF9pb21tdV9k
dGUpICogZ2JkZik7CiAgICAgQVNTRVJUKG1mbl92YWxpZChfbWZuKGR0ZV9tZm4pKSk7CiAKICAg
ICAvKiBSZWFkIGd1ZXN0IGR0ZSBpbmZvcm1hdGlvbiAqLwpAQCAtNDI4LDggKzQyOCw4IEBAIHN0
YXRpYyBpbnQgZG9faW52YWxpZGF0ZV9kdGUoc3RydWN0IGRvbWFpbiAqZCwgY21kX2VudHJ5X3Qg
KmNtZCkKIAogc3RhdGljIHZvaWQgZ3Vlc3RfaW9tbXVfcHJvY2Vzc19jb21tYW5kKHZvaWQgKmRh
dGEpCiB7Ci0gICAgdW5zaWduZWQgbG9uZyBvcGNvZGUsIHRhaWwsIGhlYWQsIGVudHJpZXNfcGVy
X3BhZ2UsIGNtZF9tZm47Ci0gICAgY21kX2VudHJ5X3QgKmNtZCwgKmNtZF9iYXNlOworICAgIHVu
c2lnbmVkIGxvbmcgb3Bjb2RlLCB0YWlsLCBoZWFkLCBjbWRfbWZuOworICAgIGNtZF9lbnRyeV90
ICpjbWQ7CiAgICAgc3RydWN0IGRvbWFpbiAqZCA9IGRhdGE7CiAgICAgc3RydWN0IGd1ZXN0X2lv
bW11ICppb21tdTsKIApAQCAtNDM4LDM0ICs0MzgsMzAgQEAgc3RhdGljIHZvaWQgZ3Vlc3RfaW9t
bXVfcHJvY2Vzc19jb21tYW5kKHZvaWQgKmRhdGEpCiAgICAgaWYgKCAhaW9tbXUtPmVuYWJsZWQg
KQogICAgICAgICByZXR1cm47CiAKLSAgICBoZWFkID0gaW9tbXVfZ2V0X3JiX3BvaW50ZXIoaW9t
bXUtPmNtZF9idWZmZXIucmVnX2hlYWQubG8pOwotICAgIHRhaWwgPSBpb21tdV9nZXRfcmJfcG9p
bnRlcihpb21tdS0+Y21kX2J1ZmZlci5yZWdfdGFpbC5sbyk7CisgICAgaGVhZCA9IGlvbW11LT5j
bWRfYnVmZmVyLnJlZ19oZWFkLmxvOworICAgIHRhaWwgPSBpb21tdS0+Y21kX2J1ZmZlci5yZWdf
dGFpbC5sbzsKIAogICAgIC8qIFRhaWwgcG9pbnRlciBpcyByb2xsZWQgb3ZlciBieSBndWVzdCBk
cml2ZXIsIHZhbHVlIG91dHNpZGUKICAgICAgKiBjbWRfYnVmZmVyX2VudHJpZXMgY2F1c2UgaW9t
bXUgZGlzYWJsZWQKICAgICAgKi8KIAotICAgIGlmICggdGFpbCA+PSBpb21tdS0+Y21kX2J1ZmZl
ci5lbnRyaWVzIHx8Ci0gICAgICAgICBoZWFkID49IGlvbW11LT5jbWRfYnVmZmVyLmVudHJpZXMg
KQorICAgIGlmICggdGFpbCA+PSBpb21tdS0+Y21kX2J1ZmZlci5zaXplIHx8IGhlYWQgPj0gaW9t
bXUtPmNtZF9idWZmZXIuc2l6ZSApCiAgICAgewogICAgICAgICBBTURfSU9NTVVfREVCVUcoIkVy
cm9yOiBndWVzdCBpb21tdSBjbWQgYnVmZmVyIG92ZXJmbG93c1xuIik7CiAgICAgICAgIGd1ZXN0
X2lvbW11X2Rpc2FibGUoaW9tbXUpOwogICAgICAgICByZXR1cm47CiAgICAgfQogCi0gICAgZW50
cmllc19wZXJfcGFnZSA9IFBBR0VfU0laRSAvIHNpemVvZihjbWRfZW50cnlfdCk7Ci0KICAgICB3
aGlsZSAoIGhlYWQgIT0gdGFpbCApCiAgICAgewogICAgICAgICBpbnQgcmV0ID0gMDsKIAogICAg
ICAgICBjbWRfbWZuID0gZ3Vlc3RfaW9tbXVfZ2V0X3RhYmxlX21mbihkLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWdfdG9fdTY0KGlvbW11LT5jbWRfYnVm
ZmVyLnJlZ19iYXNlKSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2l6ZW9mKGNtZF9lbnRyeV90KSwgaGVhZCk7CisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGhlYWQpOwogICAgICAgICBBU1NFUlQobWZuX3ZhbGlkKF9tZm4o
Y21kX21mbikpKTsKIAotICAgICAgICBjbWRfYmFzZSA9IG1hcF9kb21haW5fcGFnZShfbWZuKGNt
ZF9tZm4pKTsKLSAgICAgICAgY21kID0gY21kX2Jhc2UgKyBoZWFkICUgZW50cmllc19wZXJfcGFn
ZTsKKyAgICAgICAgY21kID0gbWFwX2RvbWFpbl9wYWdlKF9tZm4oY21kX21mbikpICsgKGhlYWQg
JiBQQUdFX01BU0spOwogCiAgICAgICAgIG9wY29kZSA9IGdldF9maWVsZF9mcm9tX3JlZ191MzIo
Y21kLT5kYXRhWzFdLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElP
TU1VX0NNRF9PUENPREVfTUFTSywKQEAgLTQ5OCwxNSArNDk0LDE2IEBAIHN0YXRpYyB2b2lkIGd1
ZXN0X2lvbW11X3Byb2Nlc3NfY29tbWFuZCh2b2lkICpkYXRhKQogICAgICAgICAgICAgYnJlYWs7
CiAgICAgICAgIH0KIAotICAgICAgICB1bm1hcF9kb21haW5fcGFnZShjbWRfYmFzZSk7Ci0gICAg
ICAgIGlmICggKytoZWFkID49IGlvbW11LT5jbWRfYnVmZmVyLmVudHJpZXMgKQorICAgICAgICB1
bm1hcF9kb21haW5fcGFnZShjbWQpOworICAgICAgICBoZWFkICs9IHNpemVvZihjbWRfZW50cnlf
dCk7CisgICAgICAgIGlmICggaGVhZCA+PSBpb21tdS0+Y21kX2J1ZmZlci5zaXplICkKICAgICAg
ICAgICAgIGhlYWQgPSAwOwogICAgICAgICBpZiAoIHJldCApCiAgICAgICAgICAgICBndWVzdF9p
b21tdV9kaXNhYmxlKGlvbW11KTsKICAgICB9CiAKICAgICAvKiBOb3cgc2hpZnQgY21kIGJ1ZmZl
ciBoZWFkIHBvaW50ZXIgKi8KLSAgICBpb21tdV9zZXRfcmJfcG9pbnRlcigmaW9tbXUtPmNtZF9i
dWZmZXIucmVnX2hlYWQubG8sIGhlYWQpOworICAgIGlvbW11LT5jbWRfYnVmZmVyLnJlZ19oZWFk
LmxvID0gaGVhZDsKICAgICByZXR1cm47CiB9CiAKQEAgLTY3MiwyMyArNjY5LDIzIEBAIHN0YXRp
YyB2b2lkIGd1ZXN0X2lvbW11X21taW9fd3JpdGU2NChzdHJ1Y3QgZ3Vlc3RfaW9tbXUgKmlvbW11
LAogICAgICAgICBndWVzdF9pb21tdV93cml0ZV9jdHJsKGlvbW11LCB2YWwpOwogICAgICAgICBi
cmVhazsKICAgICBjYXNlIElPTU1VX0NNRF9CVUZGRVJfSEVBRF9PRkZTRVQ6Ci0gICAgICAgIHU2
NF90b19yZWcoJmlvbW11LT5jbWRfYnVmZmVyLnJlZ19oZWFkLCB2YWwpOworICAgICAgICBpb21t
dS0+Y21kX2J1ZmZlci5yZWdfaGVhZC5sbyA9IHZhbCAmIElPTU1VX1JJTkdfQlVGRkVSX1BUUl9N
QVNLOwogICAgICAgICBicmVhazsKICAgICBjYXNlIElPTU1VX0NNRF9CVUZGRVJfVEFJTF9PRkZT
RVQ6Ci0gICAgICAgIHU2NF90b19yZWcoJmlvbW11LT5jbWRfYnVmZmVyLnJlZ190YWlsLCB2YWwp
OworICAgICAgICBpb21tdS0+Y21kX2J1ZmZlci5yZWdfdGFpbC5sbyA9IHZhbCAmIElPTU1VX1JJ
TkdfQlVGRkVSX1BUUl9NQVNLOwogICAgICAgICB0YXNrbGV0X3NjaGVkdWxlKCZpb21tdS0+Y21k
X2J1ZmZlcl90YXNrbGV0KTsKICAgICAgICAgYnJlYWs7CiAgICAgY2FzZSBJT01NVV9FVkVOVF9M
T0dfSEVBRF9PRkZTRVQ6Ci0gICAgICAgIHU2NF90b19yZWcoJmlvbW11LT5ldmVudF9sb2cucmVn
X2hlYWQsIHZhbCk7CisgICAgICAgIGlvbW11LT5ldmVudF9sb2cucmVnX2hlYWQubG8gPSB2YWwg
JiBJT01NVV9SSU5HX0JVRkZFUl9QVFJfTUFTSzsKICAgICAgICAgYnJlYWs7CiAgICAgY2FzZSBJ
T01NVV9FVkVOVF9MT0dfVEFJTF9PRkZTRVQ6Ci0gICAgICAgIHU2NF90b19yZWcoJmlvbW11LT5l
dmVudF9sb2cucmVnX3RhaWwsIHZhbCk7CisgICAgICAgIGlvbW11LT5ldmVudF9sb2cucmVnX3Rh
aWwubG8gPSB2YWwgJiBJT01NVV9SSU5HX0JVRkZFUl9QVFJfTUFTSzsKICAgICAgICAgYnJlYWs7
CiAgICAgY2FzZSBJT01NVV9QUFJfTE9HX0hFQURfT0ZGU0VUOgotICAgICAgICB1NjRfdG9fcmVn
KCZpb21tdS0+cHByX2xvZy5yZWdfaGVhZCwgdmFsKTsKKyAgICAgICAgaW9tbXUtPnBwcl9sb2cu
cmVnX2hlYWQubG8gPSB2YWwgJiBJT01NVV9SSU5HX0JVRkZFUl9QVFJfTUFTSzsKICAgICAgICAg
YnJlYWs7CiAgICAgY2FzZSBJT01NVV9QUFJfTE9HX1RBSUxfT0ZGU0VUOgotICAgICAgICB1NjRf
dG9fcmVnKCZpb21tdS0+cHByX2xvZy5yZWdfdGFpbCwgdmFsKTsKKyAgICAgICAgaW9tbXUtPnBw
cl9sb2cucmVnX3RhaWwubG8gPSB2YWwgJiBJT01NVV9SSU5HX0JVRkZFUl9QVFJfTUFTSzsKICAg
ICAgICAgYnJlYWs7CiAgICAgY2FzZSBJT01NVV9TVEFUVVNfTU1JT19PRkZTRVQ6CiAgICAgICAg
IHZhbCAmPSBJT01NVV9TVEFUVVNfRVZFTlRfTE9HX09WRVJGTE9XIHwKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
