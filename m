Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 802CE141269
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 21:44:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isYRw-0004wZ-JG; Fri, 17 Jan 2020 20:42:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J6zi=3G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1isYRu-0004wB-TG
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 20:42:34 +0000
X-Inumbo-ID: e0585092-3969-11ea-b618-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0585092-3969-11ea-b618-12813bfff9fa;
 Fri, 17 Jan 2020 20:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579293749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=peR5YpwnLucy99fGI8zjvLj+hucdOn9FmBcbB0UM/5w=;
 b=TS8NI0+IDbsG3dV87RKuHm2tz87BMjXqviN7HeuWBtsCoeWrSFqlPtcN
 aKIJOw2/R2fVkan3mB7JNPJNW6Svn35YjNVkRKC/qzrULw/53Zisg733G
 KLJLNIaGzPDixIqSDX8/RfcYVVSqhToAMk0b8sMDj+Pn8Xbh7cfrUMVfZ Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DiPOMOLQgxIPkEuFWfcnQtAySzjfWX3Owbyr1cp01uAk8LGsUqgCOz+Q5g7LqtXH/c1zfpLL+x
 rfYPytEllzzmlu/SJaXN1ihjLbBrlqMusHgKmfw2iJ3J2j89gq1Zst0OObXOcF/tksw8VwrxOB
 orc/HMDGP8mJCRdcfa3kG+qdUTL7njZjy5LOHhc9V0y3W+fTfnNX40RNIKSLBvlEtkHRUD9v3r
 Y1qmMVAfnf1ENgmy6LresszYDWurTmQfacCDs0gGprsvi1qUya7Rl8d/6aSD7CwORAievfrwLb
 rM4=
X-SBRS: 2.7
X-MesageID: 11688714
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,331,1574139600"; d="scan'208";a="11688714"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 20:42:21 +0000
Message-ID: <20200117204223.30076-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200117204223.30076-1-andrew.cooper3@citrix.com>
References: <20200117204223.30076-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/5] x86/boot: Drop explicit %fs uses
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

VGhlIHRyYW1wb2xpbmUgcmVsb2NhdGlvbiBjb2RlIHVzZXMgJWZzIGZvciBhY2Nlc3NpbmcgWGVu
LCBhbmQgdGhpcyBjb21lcyB3aXRoCmFuIGFyYml0cmFyeSAxNk0gbGltaXRhdGlvbi4gIFdlIGNv
dWxkIGFkanVzdCB0aGUgbGltaXQsIGJ1dCB0aGUgYm9vdCBjb2RlIGlzCmEgY29uZnVzaW5nIG1p
eCBvZiAlZHMvJWVzaS1iYXNlZCBhbmQgJWZzLWJhc2VkIGFjY2Vzc2VzLCBhbmQgdGhlIHVzZSBv
ZiAlZnMKaXMgbG9uZ2VyIHRvIGVuY29kZSwgYW5kIGluY3VycyBhbiBhZGRyZXNzIGdlbmVyYXRp
b24gb3ZlcmhlYWQuCgpSZXdyaXRlIHRoZSBsb2dpYyB0byB1c2UgJWRzLCBmb3IgYmV0dGVyIGNv
bnNpc3RlbmN5IHdpdGggdGhlIHN1cnJvdW5kaW5nCmNvZGUsIGFuZCBhIG1hcmdpbmFsIHBlcmZv
cm1hbmNlIGltcHJvdmVtZW50LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5j
b20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TIHwgMjYgKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAx
MSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMgYi94
ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKaW5kZXggMDEzN2VlOTlhNC4uMWRlZWFlMmYyYSAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCisrKyBiL3hlbi9hcmNoL3g4Ni9ib290
L2hlYWQuUwpAQCAtNzE4LDIzICs3MTgsMjcgQEAgdHJhbXBvbGluZV9zZXR1cDoKICAgICAgICAg
bW92ICAgICAlZWR4LCBzeW1fZXNpKGwyX2Jvb3RtYXApCiAKICAgICAgICAgLyogQXBwbHkgcmVs
b2NhdGlvbnMgdG8gYm9vdHN0cmFwIHRyYW1wb2xpbmUuICovCi0gICAgICAgIG1vdiAgICAgc3lt
X2ZzKHRyYW1wb2xpbmVfcGh5cyksJWVkeAotICAgICAgICBtb3YgICAgICRzeW1fb2ZmcyhfX3Ry
YW1wb2xpbmVfcmVsX3N0YXJ0KSwlZWRpCisgICAgICAgIG1vdiAgICAgc3ltX2VzaSh0cmFtcG9s
aW5lX3BoeXMpLCAlZWR4CisgICAgICAgIGxlYSAgICAgc3ltX2VzaShfX3RyYW1wb2xpbmVfcmVs
X3N0YXJ0KSwgJWVkaQorICAgICAgICBsZWEgICAgIHN5bV9lc2koX190cmFtcG9saW5lX3JlbF9z
dG9wKSwgJWVjeAogMToKLSAgICAgICAgbW92ICAgICAlZnM6KCVlZGkpLCVlYXgKLSAgICAgICAg
YWRkICAgICAlZWR4LCVmczooJWVkaSwlZWF4KQorICAgICAgICBtb3YgICAgICglZWRpKSwgJWVh
eAorICAgICAgICBhZGQgICAgICVlZHgsICglZWRpLCAlZWF4KQogICAgICAgICBhZGQgICAgICQ0
LCVlZGkKLSAgICAgICAgY21wICAgICAkc3ltX29mZnMoX190cmFtcG9saW5lX3JlbF9zdG9wKSwl
ZWRpCisKKyAgICAgICAgY21wICAgICAlZWN4LCAlZWRpCiAgICAgICAgIGpiICAgICAgMWIKIAog
ICAgICAgICAvKiBQYXRjaCBpbiB0aGUgdHJhbXBvbGluZSBzZWdtZW50LiAqLwogICAgICAgICBz
aHIgICAgICQ0LCVlZHgKLSAgICAgICAgbW92ICAgICAkc3ltX29mZnMoX190cmFtcG9saW5lX3Nl
Z19zdGFydCksJWVkaQorICAgICAgICBsZWEgICAgIHN5bV9lc2koX190cmFtcG9saW5lX3NlZ19z
dGFydCksICVlZGkKKyAgICAgICAgbGVhICAgICBzeW1fZXNpKF9fdHJhbXBvbGluZV9zZWdfc3Rv
cCksICVlY3gKIDE6Ci0gICAgICAgIG1vdiAgICAgJWZzOiglZWRpKSwlZWF4Ci0gICAgICAgIG1v
diAgICAgJWR4LCVmczooJWVkaSwlZWF4KQorICAgICAgICBtb3YgICAgICglZWRpKSwgJWVheAor
ICAgICAgICBtb3YgICAgICVkeCwgKCVlZGksICVlYXgpCiAgICAgICAgIGFkZCAgICAgJDQsJWVk
aQotICAgICAgICBjbXAgICAgICRzeW1fb2ZmcyhfX3RyYW1wb2xpbmVfc2VnX3N0b3ApLCVlZGkK
KworICAgICAgICBjbXAgICAgICVlY3gsICVlZGkKICAgICAgICAgamIgICAgICAxYgogCiAgICAg
ICAgIC8qIERvIG5vdCBwYXJzZSBjb21tYW5kIGxpbmUgb24gRUZJIHBsYXRmb3JtIGhlcmUuICov
CkBAIC03NjAsOSArNzY0LDkgQEAgdHJhbXBvbGluZV9zZXR1cDoKICAgICAgICAgcHVzaCAgICAl
ZWF4CiAKICAgICAgICAgLyogQ29weSBib290c3RyYXAgdHJhbXBvbGluZSB0byBsb3cgbWVtb3J5
LCBiZWxvdyAxTUIuICovCi0gICAgICAgIG1vdiAgICAgJHN5bV9vZmZzKHRyYW1wb2xpbmVfc3Rh
cnQpLCVlc2kKKyAgICAgICAgbGVhICAgICBzeW1fZXNpKHRyYW1wb2xpbmVfc3RhcnQpLCAlZXNp
CiAgICAgICAgIG1vdiAgICAgJCgodHJhbXBvbGluZV9lbmQgLSB0cmFtcG9saW5lX3N0YXJ0KSAv
IDQpLCVlY3gKLSAgICAgICAgcmVwIG1vdnNsICVmczooJWVzaSksJWVzOiglZWRpKQorICAgICAg
ICByZXAgbW92c2wKIAogICAgICAgICAvKiBKdW1wIGludG8gdGhlIHJlbG9jYXRlZCB0cmFtcG9s
aW5lLiAqLwogICAgICAgICBscmV0Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
