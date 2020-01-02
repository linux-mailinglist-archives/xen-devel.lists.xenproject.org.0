Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4032D12E7CA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 16:03:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in1x9-0002LP-Hu; Thu, 02 Jan 2020 14:59:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WNQ8=2X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1in1x7-0002LD-DU
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 14:59:57 +0000
X-Inumbo-ID: 89baca9e-2d70-11ea-a37c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89baca9e-2d70-11ea-a37c-12813bfff9fa;
 Thu, 02 Jan 2020 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577977196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sjRDIYOl9ceyQaNIJEpSnWE5i6UF/jphRt0RbeiWh+s=;
 b=CWuktZJdVGWTjoBSsQmM3VzY0AxerxdSlhmmMT9vB2ICmcdcnRa8jEkd
 SLHIkG1UJ8tHyPO8p8s0XYQfOV+pbJroayU3XQra0m+6+uzxzewR/VEm7
 7SB9X0ONHLN6QQW9oiEvFFXrs3AI3SHs8BlseDyb7ohzHtN7gD94sLrYJ 8=;
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
IronPort-SDR: HmXv9cAy0TPiQc8KcuIsL2vZu0EapoJhudXaSNIwNrQ43yUjM5Qoee3FdgSXpmHzqG4qozlAcN
 B83mnrhr3xSGItDH4WUmMEXkJBppHYeJj8AgDZHxiHKmjPhIkRLDwWE+prDSVYf8XrEZ933hXO
 Cr4IkwUnmD4LijGwVkLAIQvfQFgwtkQMAj4UE3I2+kKh5CiR97d1BZZcdbYtNigiW/0Gi8HNZ6
 B3GykfCxR0BRUT2JgS9Rno2Ztckv0cg+Am8mw/fnylbcsuih7E3G63tA04iZOd+Ux2aoGMn3QX
 5m4=
X-SBRS: 2.7
X-MesageID: 10533696
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10533696"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 2 Jan 2020 14:59:53 +0000
Message-ID: <20200102145953.6503-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Clean up the trampoline transition
 into Long mode
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

VGhlIGptcCBhZnRlciBzZXR0aW5nICVjcjAgaXMgcmVkdW5kYW50IHdpdGggdGhlIGZvbGxvd2lu
ZyBsam1wLgoKVGhlIENQVUlEIHRvIHByb3RlY3QgdGhlIGp1bXAgdG8gaGlnaGVyIG1hcHBpbmdz
IHdhcyBpbnNlcnRlZCBkdWUgdG8gYW4KYWJ1bmRhbmNlIG9mIGNhdXRpb24vcGFyYW5vaWEgYmVm
b3JlIFNwZWN0cmUgd2FzIHB1YmxpYy4gIFRoZXJlIGlzIG5vdCBhCm1hdGNoaW5nIHByb3RlY3Rp
b24gaW4gdGhlIFMzIHJlc3VtZSBwYXRoLCBhbmQgdGhlcmUgaXMgbm90aGluZwppbnRlcmVzdGlu
ZyBpbiBtZW1vcnkgYXQgdGhpcyBwb2ludC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUu
UyB8IDIyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMgYi94ZW4v
YXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMKaW5kZXggYzYwZWJiM2YwMC4uNTc0ZDFiZDhmNCAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCisrKyBiL3hlbi9hcmNo
L3g4Ni9ib290L3RyYW1wb2xpbmUuUwpAQCAtMTAxLDggKzEwMSw2IEBAIHRyYW1wb2xpbmVfcHJv
dG1vZGVfZW50cnk6CiAgICAgICAgIG1vdiAgICAgJChYODZfQ1IwX1BHIHwgWDg2X0NSMF9BTSB8
IFg4Nl9DUjBfV1AgfCBYODZfQ1IwX05FIHxcCiAgICAgICAgICAgICAgICAgICBYODZfQ1IwX0VU
IHwgWDg2X0NSMF9NUCB8IFg4Nl9DUjBfUEUpLCAlZWF4CiAgICAgICAgIG1vdiAgICAgJWVheCwl
Y3IwCi0gICAgICAgIGptcCAgICAgMWYKLTE6CiAKICAgICAgICAgLyogTm93IGluIGNvbXBhdGli
aWxpdHkgbW9kZS4gTG9uZy1qdW1wIGludG8gNjQtYml0IG1vZGUuICovCiAgICAgICAgIGxqbXAg
ICAgJEJPT1RfQ1M2NCwkYm9vdHN5bV9yZWwoc3RhcnQ2NCw2KQpAQCAtMTExLDI2ICsxMDksNiBA
QCB0cmFtcG9saW5lX3Byb3Rtb2RlX2VudHJ5Ogogc3RhcnQ2NDoKICAgICAgICAgLyogSnVtcCB0
byBoaWdoIG1hcHBpbmdzLiAqLwogICAgICAgICBtb3ZhYnMgICRfX2hpZ2hfc3RhcnQsICVyZGkK
LQotI2lmZGVmIENPTkZJR19JTkRJUkVDVF9USFVOSwotICAgICAgICAvKgotICAgICAgICAgKiBJ
ZiBib290aW5nIHZpcnR1YWxpc2VkLCBvciBob3Qtb25saW5pbmcgYSBDUFUsIHNpYmxpbmcgdGhy
ZWFkcyBjYW4KLSAgICAgICAgICogYXR0ZW1wdCBCcmFuY2ggVGFyZ2V0IEluamVjdGlvbiBhZ2Fp
bnN0IHRoaXMgam1wLgotICAgICAgICAgKgotICAgICAgICAgKiBXZSd2ZSBnb3Qgbm8gdXNhYmxl
IHN0YWNrIHNvIGNhbid0IHVzZSBhIFJFVFBPTElORSB0aHVuaywgYW5kIGFyZQotICAgICAgICAg
KiBmdXJ0aGVyIHRoYW4gZGlzcDMyIGZyb20gdGhlIGhpZ2ggbWFwcGluZ3Mgc28gY291bGRuJ3Qg
dXNlCi0gICAgICAgICAqIEpVTVBfVEhVTksgZXZlbiBpZiBpdCB3YXMgYSBub24tUkVUUE9MSU5F
IHRodW5rLiAgRnVydGhlcm1vcmUsIGFuCi0gICAgICAgICAqIExGRU5DRSBpc24ndCBuZWNlc3Nh
cmlseSBzYWZlIHRvIHVzZSBhdCB0aGlzIHBvaW50LgotICAgICAgICAgKgotICAgICAgICAgKiBB
cyB0aGlzIGlzbid0IGEgaG90cGF0aCwgdXNlIGEgZnVsbHkgc2VyaWFsaXNpbmcgZXZlbnQgdG8g
cmVkdWNlCi0gICAgICAgICAqIHRoZSBzcGVjdWxhdGlvbiB3aW5kb3cgYXMgbXVjaCBhcyBwb3Nz
aWJsZS4gICVlYnggbmVlZHMgcHJlc2VydmluZwotICAgICAgICAgKiBmb3IgX19oaWdoX3N0YXJ0
LgotICAgICAgICAgKi8KLSAgICAgICAgbW92ICAgICAlZWJ4LCAlZXNpCi0gICAgICAgIGNwdWlk
Ci0gICAgICAgIG1vdiAgICAgJWVzaSwgJWVieAotI2VuZGlmCi0KICAgICAgICAgam1wcSAgICAq
JXJkaQogCiAjaW5jbHVkZSAidmlkZW8uaCIKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
