Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807AF12E6F9
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 15:01:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in0xq-0005yX-5S; Thu, 02 Jan 2020 13:56:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WNQ8=2X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1in0xp-0005yS-7T
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 13:56:37 +0000
X-Inumbo-ID: abe6353a-2d67-11ea-a1e1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abe6353a-2d67-11ea-a1e1-bc764e2007e4;
 Thu, 02 Jan 2020 13:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577973388;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mn5JFeCRwY/yXWhNq4ML2NQjhiT89SS0XjXdMfrq8KY=;
 b=fxnQ5OUhcA/7sUyf3dIwcSxfVv+xkREsb8xeTRLf4NmOvcsN7z2RhyYw
 fpO5G0BRvNq1sEVnkCyZM4Qls97jWGsZiTybJhV9TA3U6yLNUzixNvmzF
 O+stv4RCSMxLd5NHfHW76GO7mzwBf8ZP36h09E4UuQ3RLKhCBAZgnGNxg M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6bpga+oEakx+3GR2tybPpc2tICGUGIA1PR3TH2T0YZc5Gh/17pVId6u1buGTeHumux4cbTECBY
 jqwOvdQ2Hz3vKlB2hWs4A5eyB+aCdXCX9LfJoHn8RGaPpyLeQlCsBzWgUOfB43uZXSOheX5uOl
 H60cmCs/BOhOyrn+497RpDxSob8hc9uR8OCRsxn4kcXC/jAOkKho6REA1/4LAcog64++JNBbEY
 xNIHY8IXMhLCs4F8O+Y5EOvYjsTmB3Pa5VqT+o3yvSpbJvmPXsFf+apNVbF5Ed0bzQOBKdED7Z
 Lk8=
X-SBRS: 2.7
X-MesageID: 10804504
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10804504"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 2 Jan 2020 13:56:24 +0000
Message-ID: <20200102135624.30787-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/efi: Drop infinite loops and use
 unreachable()/noreturn
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNDOiBWb2xvZHlteXIg
QmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2Vm
aS9lZmktYm9vdC5oIHwgMiArLQogeGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oIHwgMiArLQog
eGVuL2NvbW1vbi9lZmkvYm9vdC5jICAgICAgIHwgMSAtCiAzIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZWZp
L2VmaS1ib290LmggYi94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmgKaW5kZXggY2E2NTVmZjAw
My4uZDdiZjkzNDA3NyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oCisr
KyBiL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaApAQCAtMzY3LDcgKzM2Nyw3IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBlZmlfYXJjaF9wcmVfZXhpdF9ib290KHZvaWQpCiB7CiB9CiAKLXN0YXRp
YyB2b2lkIF9faW5pdCBlZmlfYXJjaF9wb3N0X2V4aXRfYm9vdCh2b2lkKQorc3RhdGljIHZvaWQg
X19pbml0IG5vcmV0dXJuIGVmaV9hcmNoX3Bvc3RfZXhpdF9ib290KHZvaWQpCiB7CiAgICAgZWZp
X3hlbl9zdGFydChmZHQsIGZkdF90b3RhbHNpemUoZmR0KSk7CiB9CmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvZWZpL2VmaS1ib290LmggYi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgKaW5k
ZXggMjMyOTcyZWVkZi4uNjc2ZDYxNmZmOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2VmaS9l
ZmktYm9vdC5oCisrKyBiL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaApAQCAtMjY4LDcgKzI2
OCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBub3JldHVybiBlZmlfYXJjaF9wb3N0X2V4aXRfYm9v
dCh2b2lkKQogICAgICAgICAgICAgICAgICAgICAgW3N0a29mZl0gImkiIChTVEFDS19TSVpFIC0g
c2l6ZW9mKHN0cnVjdCBjcHVfaW5mbykpLAogICAgICAgICAgICAgICAgICAgICAgIkQiICgmbWJp
KQogICAgICAgICAgICAgICAgICAgIDogIm1lbW9yeSIgKTsKLSAgICBmb3IoIDsgOyApOyAvKiBu
b3QgcmVhY2hlZCAqLworICAgIHVucmVhY2hhYmxlKCk7CiB9CiAKIHN0YXRpYyB2b2lkIF9faW5p
dCBlZmlfYXJjaF9jZmdfZmlsZV9lYXJseShFRklfRklMRV9IQU5ETEUgZGlyX2hhbmRsZSwgY2hh
ciAqc2VjdGlvbikKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZWZpL2Jvb3QuYyBiL3hlbi9jb21t
b24vZWZpL2Jvb3QuYwppbmRleCAzZjFjMzMwYWZlLi4xYjdkYzE2MDU2IDEwMDY0NAotLS0gYS94
ZW4vY29tbW9uL2VmaS9ib290LmMKKysrIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jCkBAIC0xNDAy
LDcgKzE0MDIsNiBAQCBlZmlfc3RhcnQoRUZJX0hBTkRMRSBJbWFnZUhhbmRsZSwgRUZJX1NZU1RF
TV9UQUJMRSAqU3lzdGVtVGFibGUpCiAgICAgZWZpX2V4aXRfYm9vdChJbWFnZUhhbmRsZSwgU3lz
dGVtVGFibGUpOwogCiAgICAgZWZpX2FyY2hfcG9zdF9leGl0X2Jvb3QoKTsKLSAgICBmb3IoIDsg
OyApOyAvKiBub3QgcmVhY2hlZCAqLwogfQogCiAjaWZuZGVmIENPTkZJR19BUk0gLyogVE9ETyAt
IHJ1bnRpbWUgc2VydmljZSBzdXBwb3J0ICovCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
