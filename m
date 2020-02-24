Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B680816A840
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 15:25:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Ecr-0007rG-8t; Mon, 24 Feb 2020 14:22:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j6Ecp-0007rB-Q8
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 14:22:23 +0000
X-Inumbo-ID: 1255f274-5711-11ea-a490-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1255f274-5711-11ea-a490-bc764e2007e4;
 Mon, 24 Feb 2020 14:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582554142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D3PTEokV3P1nGTzp4QXhPH5TsIlx02sVQf+cswffQ5U=;
 b=c6r9kHX2gjip9F6lxkCN9EWvHJnKVJdHqL/Mh/WHa/PVJL624pMT4RS8
 EvsM9l1k/Mbr2S/DISr2fnKLrMnQBToU6AGCRJ7adtqBdBpYAxC4ADUqJ
 BqR60f2D71ZwtwInnlxmv3BGsujtdfcO5bJeUAf635NzoITynQAWMCB0Y M=;
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
IronPort-SDR: Yo0veVn7g8uSJ4qM3xbXcXUKPHsfo5tvtyDU9nss3VgpCPUAgH8tw5cFr9d9asFyZczIdoA7Xe
 oT0HZMDjD8EYH4yn2YtKqt4kgSnDmYOMYFyLZc4eOznSEXZAUT6WqyDDVWBFQTW/lDlEGMfHy9
 KulO1OKMN1gEcmkHmuPS2kghNXhx6phPL9jTw7D7JygVPI2ax00O78xYP4EMpdoNEDq99M6j3E
 vLWhDFAiiZYxwU4eODJlE7Zw4T40aXx5zcwJcheTAxyHHXR6r8cvQ4rODTXeluWK1svbB5i4QN
 8ls=
X-SBRS: 2.7
X-MesageID: 13265437
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="13265437"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 24 Feb 2020 14:22:19 +0000
Message-ID: <20200224142219.30690-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/xmalloc Unify type handling in macros
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

VGhlIG1hY3JvcyBpbiB4bWFsbG9jLmggYXJlIGEgbWl4IG9mIHVzaW5nIHRoZWlyIHR5cGUgcGFy
YW1ldGVyIGRpcmVjdGx5LCBhbmQKdXNpbmcgdHlwZW9mKCkuICBTd2l0Y2ggdW5pZm9ybWx5IHRv
IHRoZSBsYXR0ZXIgc28gZXhwcmVzc2lvbnMgY2FuIGJlIHVzZWQsCnJhdGhlciB0aGFuIG9ubHkg
dHlwZSBuYW1lcy4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgotLS0KIHhlbi9pbmNsdWRlL3hlbi94bWFsbG9jLmggfCAxNSArKysrKysrKystLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaCBiL3hlbi9pbmNsdWRlL3hlbi94bWFs
bG9jLmgKaW5kZXggZjUxNWNlZWUyYS4uNmVmNDY2YjEzZiAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUveGVuL3htYWxsb2MuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oCkBAIC0xMCw4
ICsxMCwxMSBAQAogICovCiAKIC8qIEFsbG9jYXRlIHNwYWNlIGZvciB0eXBlZCBvYmplY3QuICov
Ci0jZGVmaW5lIHhtYWxsb2MoX3R5cGUpICgoX3R5cGUgKilfeG1hbGxvYyhzaXplb2YoX3R5cGUp
LCBfX2FsaWdub2ZfXyhfdHlwZSkpKQotI2RlZmluZSB4emFsbG9jKF90eXBlKSAoKF90eXBlICop
X3h6YWxsb2Moc2l6ZW9mKF90eXBlKSwgX19hbGlnbm9mX18oX3R5cGUpKSkKKyNkZWZpbmUgeG1h
bGxvYyhfdHlwZSkgXAorICAgICgodHlwZW9mKF90eXBlKSAqKV94bWFsbG9jKHNpemVvZihfdHlw
ZSksIF9fYWxpZ25vZl9fKF90eXBlKSkpCisKKyNkZWZpbmUgeHphbGxvYyhfdHlwZSkgXAorICAg
ICgodHlwZW9mKF90eXBlKSAqKV94emFsbG9jKHNpemVvZihfdHlwZSksIF9fYWxpZ25vZl9fKF90
eXBlKSkpCiAKIC8qCiAgKiBBbGxvY2F0ZSBzcGFjZSBmb3IgYSB0eXBlZCBvYmplY3QgYW5kIGNv
cHkgYW4gZXhpc3RpbmcgaW5zdGFuY2UuCkBAIC0zMSwxNiArMzQsMTYgQEAKIAogLyogQWxsb2Nh
dGUgc3BhY2UgZm9yIGFycmF5IG9mIHR5cGVkIG9iamVjdHMuICovCiAjZGVmaW5lIHhtYWxsb2Nf
YXJyYXkoX3R5cGUsIF9udW0pIFwKLSAgICAoKF90eXBlICopX3htYWxsb2NfYXJyYXkoc2l6ZW9m
KF90eXBlKSwgX19hbGlnbm9mX18oX3R5cGUpLCBfbnVtKSkKKyAgICAoKHR5cGVvZihfdHlwZSkg
KilfeG1hbGxvY19hcnJheShzaXplb2YoX3R5cGUpLCBfX2FsaWdub2ZfXyhfdHlwZSksIF9udW0p
KQogI2RlZmluZSB4emFsbG9jX2FycmF5KF90eXBlLCBfbnVtKSBcCi0gICAgKChfdHlwZSAqKV94
emFsbG9jX2FycmF5KHNpemVvZihfdHlwZSksIF9fYWxpZ25vZl9fKF90eXBlKSwgX251bSkpCisg
ICAgKCh0eXBlb2YoX3R5cGUpICopX3h6YWxsb2NfYXJyYXkoc2l6ZW9mKF90eXBlKSwgX19hbGln
bm9mX18oX3R5cGUpLCBfbnVtKSkKIAogLyogQWxsb2NhdGUgc3BhY2UgZm9yIGEgc3RydWN0dXJl
IHdpdGggYSBmbGV4aWJsZSBhcnJheSBvZiB0eXBlZCBvYmplY3RzLiAqLwogI2RlZmluZSB4emFs
bG9jX2ZsZXhfc3RydWN0KHR5cGUsIGZpZWxkLCBucikgXAotICAgICgodHlwZSAqKV94emFsbG9j
KG9mZnNldG9mKHR5cGUsIGZpZWxkW25yXSksIF9fYWxpZ25vZl9fKHR5cGUpKSkKKyAgICAoKHR5
cGVvZih0eXBlKSAqKV94emFsbG9jKG9mZnNldG9mKHR5cGUsIGZpZWxkW25yXSksIF9fYWxpZ25v
Zl9fKHR5cGUpKSkKIAogI2RlZmluZSB4bWFsbG9jX2ZsZXhfc3RydWN0KHR5cGUsIGZpZWxkLCBu
cikgXAotICAgICgodHlwZSAqKV94bWFsbG9jKG9mZnNldG9mKHR5cGUsIGZpZWxkW25yXSksIF9f
YWxpZ25vZl9fKHR5cGUpKSkKKyAgICAoKHR5cGVvZih0eXBlKSAqKV94bWFsbG9jKG9mZnNldG9m
KHR5cGUsIGZpZWxkW25yXSksIF9fYWxpZ25vZl9fKHR5cGUpKSkKIAogLyogUmUtYWxsb2NhdGUg
c3BhY2UgZm9yIGEgc3RydWN0dXJlIHdpdGggYSBmbGV4aWJsZSBhcnJheSBvZiB0eXBlZCBvYmpl
Y3RzLiAqLwogI2RlZmluZSB4cmVhbGxvY19mbGV4X3N0cnVjdChwdHIsIGZpZWxkLCBucikgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
