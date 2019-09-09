Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE26AD725
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 12:46:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7H9J-00052V-SF; Mon, 09 Sep 2019 10:43:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RLmJ=XE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i7H9I-00052N-89
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 10:43:56 +0000
X-Inumbo-ID: b772abca-d2ee-11e9-ac0a-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b772abca-d2ee-11e9-ac0a-12813bfff9fa;
 Mon, 09 Sep 2019 10:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568025835;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UZ3w1RsyzCoDE9rbW8tVbPzX87EZjHqwYNEfofyZV+M=;
 b=GKsaeAe8xN/qf7xg4bdThZdMu+x27D28tGeVISwQX47m4mMRUEHlKQEZ
 0ja92xzWWrhbFw3aF5p1qRTIb3eWuXhiJLIizmKEOt8erWyaAM7uQAbco
 QscYjlLCTZ/Wapsd9PDzJTwZQ14isKIlaJVaG0zIJxvHXZzYVsYUCIpvo E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NkxXeVA1t5YovxisE3J8OlVeoXdbvHZ688cfYnhNNcvratVAQcR3UvZVTqoc+A+fAs5ydQwneI
 9JLSRlY4q1O88PwYRpBOZAZarozaBcz5nsR89aXewnt/Wk/Xq3s87zKaqWfL8GdqSEGn3XFAyA
 WmcsQBahD+HEjJXmRcJyJoXWQZx0k+HBdP1mKJtQM3vTkkDkJF2m/G2cKiUvw6BSiUQoAGfOPK
 R4LWGkwFYwf4vvXPKXokmiH/PkrPx7D8BzaqTwsFXJyGgXRsmgAidKxtdhu8pjpScmjA7Ffvji
 /78=
X-SBRS: 2.7
X-MesageID: 5543761
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,484,1559534400"; 
   d="scan'208";a="5543761"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 9 Sep 2019 11:43:51 +0100
Message-ID: <20190909104351.13444-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Improve code generation from bootsym()
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

VGhlIGNvZGUgZ2VuZXJhdGlvbiBmb3IgYm9vdHN5bSgpIGlzIGF0cm9jaW91cywgYW5kIHVubmVj
ZXNzZXJpbHkKY29tcGxpY2F0ZWQuICBHaXZlbiB0aGUgYXBwcm9wcmlhdGUgcGh5c2ljYWwgYWRk
cmVzcywgYWxsIHdlIG5lZWQgaXMgdG8KY29uc3RydWN0IGEgdmlydHVhbCBhZGRyZXNzIG9mIHRo
ZSBhcHByb3ByaWF0ZSB0eXBlLgoKICBhZGQvcmVtb3ZlOiAwLzAgZ3Jvdy9zaHJpbms6IDAvOSB1
cC9kb3duOiAwLy00MjU2ICgtNDI1NikKICBGdW5jdGlvbiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBvbGQgICAgIG5ldyAgIGRlbHRhCiAga2V4ZWNfcmVzZXJ2ZV9hcmVhLmNv
bnN0cHJvcCAgICAgICAgICAgICAgICAgMTY1ICAgICAxNTkgICAgICAtNgogIHJlc2V0X3ZpZGVv
bW9kZV9hZnRlcl9zMyAgICAgICAgICAgICAgICAgICAgIDIzMSAgICAgIDcwICAgIC0xNjEKICBp
ZGVudGlmeV9jcHUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEzNDEgICAgMTE3NiAg
ICAtMTY1CiAgcGFyc2VfYWNwaV9zbGVlcCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNDA4
ICAgICAyNDAgICAgLTE2OAogIGVhcmx5X2luaXRfaW50ZWwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDYzMiAgICAgNDQwICAgIC0xOTIKICBfX2NwdV91cCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDE5ODMgICAgMTY4MiAgICAtMzAxCiAgZG9fcGxhdGZvcm1fb3AgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA2NDY5ICAgIDU1MjYgICAgLTk0MwogIGNvbXBhdF9w
bGF0Zm9ybV9vcCAgICAgICAgICAgICAgICAgICAgICAgICAgNjQzMyAgICA1NDgyICAgIC05NTEK
ICBfX3N0YXJ0X3hlbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMTI5MzkgICAxMTU3
MCAgIC0xMzY5CiAgVG90YWw6IEJlZm9yZT0zMzQxMjk4LCBBZnRlcj0zMzM3MDQyLCBjaGcgLTAu
MTMlCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvY29uZmlnLmgg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9jb25maWcuaCBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvY29uZmlnLmgKaW5kZXggZjk1MDI0NzAyOS4uZGFiN2Q3YmFkZSAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9jb25maWcuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2
L2NvbmZpZy5oCkBAIC05MSw4ICs5MSw4IEBAIGV4dGVybiB1bnNpZ25lZCBsb25nIHRyYW1wb2xp
bmVfcGh5czsKICNkZWZpbmUgYm9vdHN5bV9waHlzKHN5bSkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCiAgICAgKCgodW5zaWduZWQgbG9uZykmKHN5bSktKHVuc2lnbmVkIGxvbmcp
JnRyYW1wb2xpbmVfc3RhcnQpK3RyYW1wb2xpbmVfcGh5cykKICNkZWZpbmUgYm9vdHN5bShzeW0p
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0gICAgKCpSRUxPQ19ISURF
KCh0eXBlb2YoJihzeW0pKSlfX3ZhKF9fcGEoJihzeW0pKSksICAgICAgXAotICAgICAgICAgICAg
ICAgICB0cmFtcG9saW5lX3BoeXMtX19wYSh0cmFtcG9saW5lX3N0YXJ0KSkpCisgICAgKCooKHR5
cGVvZihzeW0pICopX192YShib290c3ltX3BoeXMoc3ltKSkpKQorCiBleHRlcm4gY2hhciB0cmFt
cG9saW5lX3N0YXJ0W10sIHRyYW1wb2xpbmVfZW5kW107CiBleHRlcm4gY2hhciB0cmFtcG9saW5l
X3JlYWxtb2RlX2VudHJ5W107CiBleHRlcm4gdW5zaWduZWQgaW50IHRyYW1wb2xpbmVfeGVuX3Bo
eXNfc3RhcnQ7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
