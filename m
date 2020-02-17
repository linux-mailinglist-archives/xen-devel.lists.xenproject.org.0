Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6BD161A12
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3lMv-0000fq-Jn; Mon, 17 Feb 2020 18:43:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3lMu-0000fV-9U
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 18:43:44 +0000
X-Inumbo-ID: 687a3950-51b5-11ea-8038-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 687a3950-51b5-11ea-8038-12813bfff9fa;
 Mon, 17 Feb 2020 18:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581965017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4j+WbkFE7AWIO7cVB83xA353YO0IfdxqaC8Gk9EZ4MI=;
 b=RDW75HEtpVLlHgRiOXocvAbsKcmUEtJgKL2BcBZHJ3IuvWWGv2gk8dg9
 875q2Kiiyil42rvcZzQxH6K0XHg8n1ZQItYvxWlQ74xIDJwhbFFTbvvxl
 O4fHhuNi0pwV6NiUxCAFLQJxuqBwqioWqO/n85SNLbKMZxJW6Ix97VfSa 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MNwiqqrV21DkOUUhpD/MkIGw3yAgagHNq3jDTOvDw6t5Ui2emxenESnbJy/4FlWAQHtoc2yZD2
 00Abuy78ptN02u3a4kibQkK/4Cizs5a3NrMVOwuLevQSbfRoQcie2Xp+P2lJKsqBETxwyq+WAq
 Hq461wZcEBJOrxixYQebw9CXrJEpwmMS3P43kEup8jXFwUaJF6WR+2/bKTwZR53T5mMtlvUGXM
 HoxeX/lzer6/LQ+u43LN7e9RHjNuznWZAwQqshSs3dDD7eBoQ3azhEHG6svcDyDHxxC6792u0q
 grU=
X-SBRS: 2.7
X-MesageID: 13202708
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,453,1574139600"; d="scan'208";a="13202708"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 17 Feb 2020 19:43:21 +0100
Message-ID: <20200217184324.73762-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217184324.73762-1-roger.pau@citrix.com>
References: <20200217184324.73762-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/6] x86: track when in #MC context
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGhlbHBlcnMgdG8gdHJhY2sgd2hlbiBleGVjdXRpbmcgaW4gI01DIGNvbnRleHQuIFRoaXMg
aXMgbW9kZWxlZAphZnRlciB0aGUgaW5faXJxIGhlbHBlcnMuCgpOb3RlIHRoYXQgdGhlcmUgYXJl
IG5vIHVzZXJzIG9mIGluX21jKCkgaW50cm9kdWNlZCBieSB0aGUgY2hhbmdlLApmdXJ0aGVyIHVz
ZXJzIHdpbGwgYmUgYWRkZWQgYnkgZm9sbG93dXAgY2hhbmdlcy4KClNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9j
cHUvbWNoZWNrL21jZS5jIHwgMiArKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJkaXJxLmggfCA1
ICsrKysrCiB4ZW4vaW5jbHVkZS94ZW4vaXJxX2NwdXN0YXQuaCB8IDEgKwogMyBmaWxlcyBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L21jaGVj
ay9tY2UuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5jCmluZGV4IGQ2MWU1ODJhZjMu
LjkzZWQ1NzUyYWMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5jCkBAIC05Myw3ICs5Myw5IEBAIHZvaWQg
eDg2X21jZV92ZWN0b3JfcmVnaXN0ZXIoeDg2X21jZV92ZWN0b3JfdCBoZGxyKQogCiB2b2lkIGRv
X21hY2hpbmVfY2hlY2soY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiB7CisgICAg
bWNfZW50ZXIoKTsKICAgICBfbWFjaGluZV9jaGVja192ZWN0b3IocmVncyk7CisgICAgbWNfZXhp
dCgpOwogfQogCiAvKgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJkaXJxLmgg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L2hhcmRpcnEuaAppbmRleCAzNGUxYjQ5MjYwLi5hZjNlYWI2
YTRkIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2hhcmRpcnEuaAorKysgYi94ZW4v
aW5jbHVkZS9hc20teDg2L2hhcmRpcnEuaApAQCAtOCw2ICs4LDcgQEAgdHlwZWRlZiBzdHJ1Y3Qg
ewogCXVuc2lnbmVkIGludCBfX3NvZnRpcnFfcGVuZGluZzsKIAl1bnNpZ25lZCBpbnQgX19sb2Nh
bF9pcnFfY291bnQ7CiAJdW5zaWduZWQgaW50IF9fbm1pX2NvdW50OworCXVuc2lnbmVkIGludCBt
Y19jb3VudDsKIAlib29sX3QgX19td2FpdF93YWtldXA7CiB9IF9fY2FjaGVsaW5lX2FsaWduZWQg
aXJxX2NwdXN0YXRfdDsKIApAQCAtMTgsNiArMTksMTAgQEAgdHlwZWRlZiBzdHJ1Y3QgewogI2Rl
ZmluZSBpcnFfZW50ZXIoKQkobG9jYWxfaXJxX2NvdW50KHNtcF9wcm9jZXNzb3JfaWQoKSkrKykK
ICNkZWZpbmUgaXJxX2V4aXQoKQkobG9jYWxfaXJxX2NvdW50KHNtcF9wcm9jZXNzb3JfaWQoKSkt
LSkKIAorI2RlZmluZSBpbl9tYygpIAkobWNfY291bnQoc21wX3Byb2Nlc3Nvcl9pZCgpKSAhPSAw
KQorI2RlZmluZSBtY19lbnRlcigpCShtY19jb3VudChzbXBfcHJvY2Vzc29yX2lkKCkpKyspCisj
ZGVmaW5lIG1jX2V4aXQoKQkobWNfY291bnQoc21wX3Byb2Nlc3Nvcl9pZCgpKS0tKQorCiB2b2lk
IGFja19iYWRfaXJxKHVuc2lnbmVkIGludCBpcnEpOwogCiBleHRlcm4gdm9pZCBhcGljX2ludHJf
aW5pdCh2b2lkKTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9pcnFfY3B1c3RhdC5oIGIv
eGVuL2luY2x1ZGUveGVuL2lycV9jcHVzdGF0LmgKaW5kZXggNzM2MjlmNmVjOC4uMTJiOTMyZmMz
OSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL2lycV9jcHVzdGF0LmgKKysrIGIveGVuL2lu
Y2x1ZGUveGVuL2lycV9jcHVzdGF0LmgKQEAgLTI2LDUgKzI2LDYgQEAgZXh0ZXJuIGlycV9jcHVz
dGF0X3QgaXJxX3N0YXRbXTsKICNkZWZpbmUgbG9jYWxfaXJxX2NvdW50KGNwdSkJX19JUlFfU1RB
VCgoY3B1KSwgX19sb2NhbF9pcnFfY291bnQpCiAjZGVmaW5lIG5taV9jb3VudChjcHUpCQlfX0lS
UV9TVEFUKChjcHUpLCBfX25taV9jb3VudCkKICNkZWZpbmUgbXdhaXRfd2FrZXVwKGNwdSkJX19J
UlFfU1RBVCgoY3B1KSwgX19td2FpdF93YWtldXApCisjZGVmaW5lIG1jX2NvdW50KGNwdSkJCV9f
SVJRX1NUQVQoKGNwdSksIG1jX2NvdW50KQogCiAjZW5kaWYJLyogX19pcnFfY3B1c3RhdF9oICov
Ci0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
