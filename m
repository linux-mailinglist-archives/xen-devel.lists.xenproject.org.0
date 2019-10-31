Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8AFEB80F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 20:41:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQGGv-0006qX-Uy; Thu, 31 Oct 2019 19:38:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TWW1=YY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iQGGu-0006qS-1H
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 19:38:16 +0000
X-Inumbo-ID: fae40618-fc15-11e9-9550-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fae40618-fc15-11e9-9550-12813bfff9fa;
 Thu, 31 Oct 2019 19:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572550694;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6JCPKajX0qAU+X07RQaVo3ui9CX6yX1v0Szo9c/EPxw=;
 b=BQEtaarpnlqCqMpb0AoN4uDt2130pUzWTToxoD9KkV8L21V2vdkccyAO
 zUD/qVEDcRC0Y09hcZh0yC9FNQ9ccMa9Icdm0+t5PFUz+uEQ0fgg7CLrn
 K/c8LYrkWpoU7oins2ieqIDpnnuP3KJuR3Q99CoODOlciH7ZmC7qxiSLn A=;
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
IronPort-SDR: +HugxMiAzNfO38zRpOiIs9mkBXCFwWhVFIrimtUZ2jWb2zdodrd0bVoimeLGA5OgaNspYcA1hD
 ei3tdUYvxlSYa/6sf70axkWzgvizQSfcf4smEWbPghvrvbpILYfgHxgOxisQYGWiQbG0LWc1uX
 h8S5J0hPJ1UiA4a6KXZOT7JrKZ5gIkCK5+VY8O6zVA7BFPuIIaR+/kTdbNj3/+Q1uKhAXtx9cB
 IyVn7IIC0q0Ni0dcuzHCIPDgCNg+lwkvZ+XYLtOL9uzHfwLi4JOe2AcyNAdHLoj2TaWMSS0Ij8
 TVM=
X-SBRS: 2.7
X-MesageID: 8073740
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,252,1569297600"; 
   d="scan'208";a="8073740"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 31 Oct 2019 19:38:08 +0000
Message-ID: <20191031193808.15401-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/pv: Fix !CONFIG_PV build following XSA-296
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UFRGXyogYXJlIGRlY2xhcmVkIHdpdGhpbiBDT05GSUdfUFYsIGFuZCB1c2VkIG91dHNpZGU6Cgog
IG1tLmM6IEluIGZ1bmN0aW9uIOKAmF9wdXRfcGFnZV90eXBl4oCZOgogIG1tLmM6MjgxOTozMjog
ZXJyb3I6IOKAmFBURl9wcmVlbXB0aWJsZeKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbikKICAgICAgIGJvb2wgcHJlZW1wdGlibGUgPSBmbGFncyAmIFBURl9wcmVlbXB0
aWJsZTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgog
IG1tLmM6MjgxOTozMjogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0
ZWQgb25seSBvbmNlIGZvciBlYWNoCiAgZnVuY3Rpb24gaXQgYXBwZWFycyBpbgogIG1tLmM6Mjg0
MjoyNDogZXJyb3I6IOKAmFBURl9wYXJ0aWFsX3NldOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2Ug
aW4gdGhpcyBmdW5jdGlvbikKICAgICAgICAgICBpZiAoICEoZmxhZ3MgJiBQVEZfcGFydGlhbF9z
ZXQpICkKICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn4KICBtbS5jOiBJ
biBmdW5jdGlvbiDigJhwdXRfcGFnZV90eXBlX3ByZWVtcHRpYmxl4oCZOgogIG1tLmM6MzA5MDoz
MzogZXJyb3I6IOKAmFBURl9wcmVlbXB0aWJsZeKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4g
dGhpcyBmdW5jdGlvbikKICAgICAgIHJldHVybiBfcHV0X3BhZ2VfdHlwZShwYWdlLCBQVEZfcHJl
ZW1wdGlibGUsIE5VTEwpOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fgogIG1tLmM6IEluIGZ1bmN0aW9uIOKAmHB1dF9vbGRfZ3Vlc3RfdGFibGXigJk6
CiAgbW0uYzozMTA4OjI1OiBlcnJvcjog4oCYUFRGX3ByZWVtcHRpYmxl4oCZIHVuZGVjbGFyZWQg
KGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQogICAgICAgICAgICAgICAgICAgICAgICAgICBQ
VEZfcHJlZW1wdGlibGUgfAogICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+
fn4KICBtbS5jOjMxMTA6Mjc6IGVycm9yOiDigJhQVEZfcGFydGlhbF9zZXTigJkgdW5kZWNsYXJl
ZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgUFRGX3BhcnRpYWxfc2V0IDogMCApLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fgogIG1tLmM6IEluIGZ1bmN0aW9uIOKAmHB1dF9wYWdlX3R5cGVfcHJlZW1w
dGlibGXigJk6CiAgbW0uYzozMDkxOjE6IGVycm9yOiBjb250cm9sIHJlYWNoZXMgZW5kIG9mIG5v
bi12b2lkIGZ1bmN0aW9uCiAgWy1XZXJyb3I9cmV0dXJuLXR5cGVdCiAgIH0KICAgXgogIGNjMTog
YWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCgpSZXBvc2l0aW9uIHRoZSBkZWZp
bml0aW9ucyB0byBiZSBvdXRzaWRlIG9mIHRoZSAjaWZkZWYgQ09ORklHX1BWCgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEph
biBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkND
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEdlb3JnZSBEdW5s
YXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IDc5YzNlNGM0NzMuLjU3ZjIyNzc1
YWMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5j
CkBAIC0xMDYzLDggKzEwNjMsNiBAQCBnZXRfcGFnZV9mcm9tX2wxZSgKICAgICByZXR1cm4gLUVC
VVNZOwogfQogCi0jaWZkZWYgQ09ORklHX1BWCi0KIC8qCiAgKiBUaGUgZm9sbG93aW5nIGZsYWdz
IGFyZSB1c2VkIHRvIHNwZWNpZnkgYmVoYXZpb3Igb2YgdmFyaW91cyBnZXQgYW5kCiAgKiBwdXQg
Y29tbWFuZHMuICBUaGUgZmlyc3QgaXMgYWxzbyBzdG9yZWQgaW4gcGFnZS0+cGFydGlhbF9mbGFn
cyB0bwpAQCAtMTA3Nyw2ICsxMDc1LDggQEAgZ2V0X3BhZ2VfZnJvbV9sMWUoCiAjZGVmaW5lIFBU
Rl9kZWZlciAgICAgICAgICAgICAgICAgKDEgPDwgMykKICNkZWZpbmUgUFRGX3JldGFpbl9yZWZf
b25fcmVzdGFydCAoMSA8PCA0KQogCisjaWZkZWYgQ09ORklHX1BWCisKIHN0YXRpYyBpbnQgZ2V0
X3BhZ2VfYW5kX3R5cGVfZnJvbV9tZm4oCiAgICAgbWZuX3QgbWZuLCB1bnNpZ25lZCBsb25nIHR5
cGUsIHN0cnVjdCBkb21haW4gKmQsCiAgICAgdW5zaWduZWQgaW50IGZsYWdzKQotLSAKMi4xMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
