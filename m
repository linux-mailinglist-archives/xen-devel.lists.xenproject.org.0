Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C5B136137
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 20:36:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipdYE-0001uB-22; Thu, 09 Jan 2020 19:33:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zaws=26=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipdYB-0001ti-Ry
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 19:32:59 +0000
X-Inumbo-ID: d049c2e8-3316-11ea-ac27-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d049c2e8-3316-11ea-ac27-bc764e2007e4;
 Thu, 09 Jan 2020 19:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578598366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TUgSJcvrtirnKoh5NZO7xoERz9S6nXrtyBnu1JNNQyo=;
 b=iX1Pz4q/Fag89XoA1aIp9djJZZZx+/2HkhLS4/kMuCmawf36PR4ZesiK
 0WtexTTsYsRcdX665occOdi9HbzidIjYHetjjjkVVW2w8X9Xg2PjjFCOY
 dqrQi3/xkuQJ5aTj81m/sN66waJ/vhJ9D+V1IiltlIe9biysSsJPdV0YC E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9g+cp44T7LVkWnkx5tocdIhT2jPVosjMB+R3gL3eoKSvuzcZngER5UjV1DeN27ePwq35z2CPp3
 95sB/zqzNBZuscktsviwDqGUSXMvbupZjScxTDzcJLKq9Tn50ObDCDaHGXDeXQwzm57oR8RDcR
 0GKD2Q16z35nfuZGsS9UTgFvTSHqiy6gDi17CMxugkx/d56/xp6YYVK+bInEI+duoy+PbhGdTC
 tt8DGektGI4eU3Ufzm84H4k5ns2InnLXsDTBRgUkZoNXVtU5H86X/MIXzDiStZSk1a+FnTRERv
 aEE=
X-SBRS: 2.7
X-MesageID: 11081780
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,414,1571716800"; d="scan'208";a="11081780"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 9 Jan 2020 19:32:40 +0000
Message-ID: <20200109193241.14542-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200109193241.14542-1-andrew.cooper3@citrix.com>
References: <20200109193241.14542-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/4] x86/boot: Don't map 0 during boot
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gcGFydGljdWxhciwgaXQgY2F1c2VzIGFjY2lkZW50YWwgTlVMTCBwb2ludGVyIGRlcmVmZXJl
bmNlcyB0byBnbyB1bm5vdGljZWQuCgpUaGUgbWFqb3JpdHkgb2YgdGhlIGVhcmx5IG9wZXJhdGlv
biB0YWtlcyBwbGFjZSBlaXRoZXIgaW4gUmVhbCBtb2RlLCBvcgpQcm90ZWN0ZWQgVW5wYWdlZCBt
b2RlLiAgVGhlIG9ubHkgYml0IHdoaWNoIHJlcXVpcmVzIHBhZ2V0YWJsZSBtYXBwaW5ncyBpcyB0
aGUKdHJhbXBvbGluZSB0cmFuc2l0aW9uIGludG8gTG9uZyBtb2RlIGFuZCBqdW1wIHRvIHRoZSBo
aWdoZXIgbWFwcGluZ3MsIHNvIHRoZXJlCmlzIG5vIG5lZWQgZm9yIHRoZSB3aG9sZSBib3R0b20g
Mk0gdG8gYmUgbWFwcGVkLgoKSW50cm9kdWNlIGEgbmV3IGwxX2Jvb3RtYXAgaW4gLmluaXQuZGF0
YSwgYW5kIHVzZSBpdCBpbnN0ZWFkIG9mIGwxX2lkZW50bWFwLgpUaGUgRUZJIGJvb3QgcGF0aCBk
b2Vzbid0IHBhc3MgdGhyb3VnaCB0aGUgdHJhbXBvbGluZSwgc28gZG9lc24ndCBuZWVkIGFueQph
ZGp1c3RtZW50LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
LS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQog
eGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TICAgfCAxNCArKysrKysrKy0tLS0tLQogeGVuL2FyY2gv
eDg2L2Jvb3QveDg2XzY0LlMgfCAgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jvb3QvaGVh
ZC5TIGIveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCmluZGV4IDBiNzVkMzNhMjUuLmQyNDZlMzc0
ZjEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUworKysgYi94ZW4vYXJjaC94
ODYvYm9vdC9oZWFkLlMKQEAgLTY4OSwxMiArNjg5LDE0IEBAIHRyYW1wb2xpbmVfc2V0dXA6CiAg
ICAgICAgIHN1YiAgICAgJChMMl9QQUdFVEFCTEVfRU5UUklFUyo4KSwlZWF4CiAgICAgICAgIGxv
b3AgICAgMWIKIAotICAgICAgICAvKgotICAgICAgICAgKiBEdXJpbmcgYm9vdCwgaG9vayA0a0Ig
bWFwcGluZ3Mgb2YgZmlyc3QgMk1CIG9mIG1lbW9yeSBpbnRvIEwyLgotICAgICAgICAgKiBUaGlz
IGF2b2lkcyBtaXhpbmcgY2FjaGFiaWxpdHkgZm9yIHRoZSBsZWdhY3kgVkdBIHJlZ2lvbi4KLSAg
ICAgICAgICovCi0gICAgICAgIGxlYSAgICAgX19QQUdFX0hZUEVSVklTT1Irc3ltX2VzaShsMV9p
ZGVudG1hcCksJWVkaQotICAgICAgICBtb3YgICAgICVlZGksc3ltX2ZzKGwyX2Jvb3RtYXApCisg
ICAgICAgIC8qIE1hcCB0aGUgcGVybWFuZW50IHRyYW1wb2xpbmUgcGFnZSBpbnRvIGx7MSwyfV9i
b290bWFwW10uICovCisgICAgICAgIG1vdiAgICAgc3ltX2VzaSh0cmFtcG9saW5lX3BoeXMpLCAl
ZWN4CisgICAgICAgIGxlYSAgICAgX19QQUdFX0hZUEVSVklTT1JfUlgoJWVjeCksICVlZHggLyog
JWVkeCA9IFBURSB0byB3cml0ZSAgKi8KKyAgICAgICAgc2hyICAgICAkUEFHRV9TSElGVCwgJWVj
eCAgICAgICAgICAgICAgICAvKiAlZWN4ID0gU2xvdCB0byB3cml0ZSAqLworICAgICAgICBtb3Yg
ICAgICVlZHgsIHN5bV9vZmZzKGwxX2Jvb3RtYXApKCVlc2ksICVlY3gsIDgpCisKKyAgICAgICAg
bGVhICAgICBfX1BBR0VfSFlQRVJWSVNPUiArIHN5bV9lc2kobDFfYm9vdG1hcCksICVlZHgKKyAg
ICAgICAgbW92ICAgICAlZWR4LCBzeW1fZXNpKGwyX2Jvb3RtYXApCiAKICAgICAgICAgLyogQXBw
bHkgcmVsb2NhdGlvbnMgdG8gYm9vdHN0cmFwIHRyYW1wb2xpbmUuICovCiAgICAgICAgIG1vdiAg
ICAgc3ltX2ZzKHRyYW1wb2xpbmVfcGh5cyksJWVkeApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2Jvb3QveDg2XzY0LlMgYi94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUwppbmRleCBkZTU1NWY4
N2Y0Li5hZjYyODUwNTg5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUwor
KysgYi94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUwpAQCAtMTU1LDYgKzE1NSwxMCBAQCBHTE9C
QUwoX19wYWdlX3RhYmxlc19lbmQpCiAgICAgICAgIC5zZWN0aW9uIC5pbml0LmRhdGEsICJhdyIs
IEBwcm9nYml0cwogICAgICAgICAuYWxpZ24gUEFHRV9TSVpFLCAwCiAKK2wxX2Jvb3RtYXA6Cisg
ICAgICAgIC5maWxsIEwxX1BBR0VUQUJMRV9FTlRSSUVTLCA4LCAwCisgICAgICAgIC5zaXplIGwx
X2Jvb3RtYXAsIC4gLSBsMV9ib290bWFwCisKIEdMT0JBTChsMl9ib290bWFwKQogICAgICAgICAu
ZmlsbCA0ICogTDJfUEFHRVRBQkxFX0VOVFJJRVMsIDgsIDAKICAgICAgICAgLnNpemUgbDJfYm9v
dG1hcCwgLiAtIGwyX2Jvb3RtYXAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
