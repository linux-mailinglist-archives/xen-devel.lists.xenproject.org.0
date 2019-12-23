Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 516051298DD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 17:46:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijQo0-0006Ht-8Q; Mon, 23 Dec 2019 16:43:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q5yK=2N=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ijQny-0006Hg-VI
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 16:43:38 +0000
X-Inumbo-ID: 5ac53912-25a3-11ea-96fe-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ac53912-25a3-11ea-96fe-12813bfff9fa;
 Mon, 23 Dec 2019 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577119414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7vWp9GkW3ug+BLCdr2aqVvMT7j7OYz0ptK5b/xJThzk=;
 b=JzdaddEBp2gfFrj9Sge4mRu0EsTJrDoAZZ2dmN4nP2f6w37UlcPdrr+O
 ni1lqLtlxuD904m9cJKYjMR9N8V9o3qRGPsMgA5G8mogU+0jPKMCmodqK
 b/oVARpUqyKZQhEOSJM0gRl00fIBGfsaXemsLAOrqBDEjvJP2kpO/T8+S o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1ngXjC+DlOsqHUXA2V84RYcwdaRuaVODbDhbte0npTb8cVe9u0mcKyBEcYtcUlhXtBzHoQVgDJ
 ILjBaO49C6Mo2jJTfxcT/D3sGnR5Hoc9RpyakuSohggTk4mMTHaucVcSzroBp3HaM10lVR1gtJ
 w8AeWQAZ7+c1a/C54NIew76cRZ+u98qJZMblkF28sEhspZnxVCT2n1wOe5eyeoxck7IptGAfRJ
 FuBrgA5dUcmZ4LNavMm/YFvSqnTelgFKTS5jyZDLVRMxIUUNF0znCXGRO7djoDUOHs1Mei98sp
 LOo=
X-SBRS: 2.7
X-MesageID: 10229660
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,348,1571716800"; d="scan'208";a="10229660"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 23 Dec 2019 16:43:28 +0000
Message-ID: <20191223164329.3113378-4-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191223164329.3113378-1-george.dunlap@citrix.com>
References: <20191223164329.3113378-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/4] mm: Use put_old_guest_table for
 relinquish_pages
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cmVsaW5xdWlzaF9wYWdlcygpIGRlYWxzIHdpdGggaW50ZXJydXB0ZWQgZGUtdmFsaWRhdGlvbiBp
biBhIGZhaXJseQphZC1ob2Mgd2F5LCBieSBlaXRoZXIgcmUtc2V0dGluZyBQR1RfcGlubmVkIChp
biB0aGUgY2FzZSBvZiBFSU5UUikgb3IKbGV0dGluZyB0aGUgcGFnZSAiZmFsbCB0aHJvdWdoIiB0
byB0aGUgImZvcmNlIGludmFsaWRhdGUiIGxvb3AgYmVsb3cuClRoaXMgcmVxdWlyZXMgYW4gZXh0
ZW5zaXZlIGNvbW1lbnQgZGVzY3JpYmluZyB3aGF0IG5lZWRzIHRvIGhhcHBlbiB0bwp0aGUgdHlw
ZSBhbmQgY291bnQgaW4gZWFjaCBjYXNlLCBhbmQgd2h5IGVhY2ggd29ya3MuICBBZGRpdGlvbmFs
bHksIGl0CnR1cm5zIG91dCB0aGF0IGF0IHRoaXMgcG9pbnQsIHRoZSAiZm9yY2UgaW52YWxpZGF0
ZSIgbG9vcCBpcyBvbmx5CnJlcXVpcmVkIHRvIGhhbmRsZSB0aGlzIGFkLWhvYyBjb250aW51YXRp
b24uCgpSZXBsYWNlIHRoaXMgd2l0aCB0aGUgJ3N0YW5kYXJkJyB3YXkgb2YgZGVhbGluZyB3aXRo
IHJlc3RhcnRpbmcgcGFnZXMsCm9sZF9ndWVzdF90YWJsZS4gIENhbGwgcHV0X29sZF9ndWVzdF90
YWJsZShjdXJyZW50KSBhdCB0aGUgdG9wIG9mIHRoZQpmdW5jdGlvbiwgYW5kIHNldCBjdXJyZW50
LT5hcmNoLm9sZF9ndWVzdF90YWJsZSogYXMgYXBwcm9wcmlhdGUuICBUaGlzCmNvZGUgaXMgc2lt
cGxlciwgYW5kIG1pcnJvcnMgb3RoZXIgb2xkX2d1ZXN0X3RhYmxlIGNvZGUgaW4gbW0uYy4gIEl0
CndpbGwgYWxzbyBhbGxvdyB1cyB0byByZW1vdmUgdGhlIGZvcmNlLWludmFsaWRhdGUgbG9vcCBl
bnRpcmVseSBpbiBhCnN1YnNlcXVlbnQgcGF0Y2guCgpXaGlsZSBoZXJlLCBtYWtlIHRoZSByZWZj
b3VudGluZyBsb2dpYyBhIGJpdCBlYXNpZXIgdG8gZm9sbG93OiBXZQphbHdheXMgZHJvcCB0aGUg
Z2VuZXJhbCByZWZlcmVuY2UgaGVsZCBieSBQR1RfcGlubmVkLCByZWdhcmRsZXNzIG9mCndoYXQg
aGFwcGVucyB0byB0aGUgdHlwZSBjb3VudC4gIFJhdGhlciB0aGFuIG1hbnVhbGx5IHJlLWRyb3Bw
aW5nIHRoZQpyZWZjb3VudCBpZiBwdXRfcGFnZV9hbmRfdHlwZV9wcmVlbXB0aWJsZSgpIGZhaWxz
LCBqdXN0IGRyb3AgdGhlCnJlZmNvdW50IHVuY29uZGl0aW9uYWxseSwgYW5kIGNhbGwgcHV0X3Bh
Z2VfdHlwZV9wcmVlbXB0aWJsZSgpCmluc3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQpDQzogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KLS0tCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgfCA1MCArKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwg
MjggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jIGIveGVu
L2FyY2gveDg2L2RvbWFpbi5jCmluZGV4IGQ5YzYzMzc5Y2QuLmI3OTY4NDYzY2IgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKQEAg
LTE5NTMsNiArMTk1MywxMCBAQCBzdGF0aWMgaW50IHJlbGlucXVpc2hfbWVtb3J5KAogICAgIHVu
c2lnbmVkIGxvbmcgICAgIHgsIHk7CiAgICAgaW50ICAgICAgICAgICAgICAgcmV0ID0gMDsKIAor
ICAgIHJldCA9IHB1dF9vbGRfZ3Vlc3RfdGFibGUoY3VycmVudCk7CisgICAgaWYgKCByZXQgKQor
ICAgICAgICByZXR1cm4gcmV0OworCiAgICAgLyogVXNlIGEgcmVjdXJzaXZlIGxvY2ssIGFzIHdl
IG1heSBlbnRlciAnZnJlZV9kb21oZWFwX3BhZ2UnLiAqLwogICAgIHNwaW5fbG9ja19yZWN1cnNp
dmUoJmQtPnBhZ2VfYWxsb2NfbG9jayk7CiAKQEAgLTE5NjcsNDIgKzE5NzEsMzIgQEAgc3RhdGlj
IGludCByZWxpbnF1aXNoX21lbW9yeSgKICAgICAgICAgfQogCiAgICAgICAgIGlmICggdGVzdF9h
bmRfY2xlYXJfYml0KF9QR1RfcGlubmVkLCAmcGFnZS0+dS5pbnVzZS50eXBlX2luZm8pICkKLSAg
ICAgICAgICAgIHJldCA9IHB1dF9wYWdlX2FuZF90eXBlX3ByZWVtcHRpYmxlKHBhZ2UpOworICAg
ICAgICB7CisgICAgICAgICAgICAvKiBBbHdheXMgZHJvcCB0aGUgcGFnZSByZWYgYXNzb2NpYXRl
ZCB3aXRoIFBHVF9waW5uZWQgKi8KKyAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOworICAgICAg
ICAgICAgcmV0ID0gcHV0X3BhZ2VfdHlwZV9wcmVlbXB0aWJsZShwYWdlKTsKKyAgICAgICAgfQog
ICAgICAgICBzd2l0Y2ggKCByZXQgKQogICAgICAgICB7CiAgICAgICAgIGNhc2UgMDoKICAgICAg
ICAgICAgIGJyZWFrOwotICAgICAgICBjYXNlIC1FUkVTVEFSVDoKICAgICAgICAgY2FzZSAtRUlO
VFI6Ci0gICAgICAgICAgICAvKgotICAgICAgICAgICAgICogLUVJTlRSIG1lYW5zIFBHVF92YWxp
ZGF0ZWQgaGFzIGJlZW4gcmUtc2V0OyByZS1zZXQKLSAgICAgICAgICAgICAqIFBHVF9waW5uZWQg
YWdhaW4gc28gdGhhdCBpdCBnZXRzIHBpY2tlZCB1cCBuZXh0IHRpbWUKLSAgICAgICAgICAgICAq
IGFyb3VuZC4KLSAgICAgICAgICAgICAqCi0gICAgICAgICAgICAgKiAtRVJFU1RBUlQsIE9UT0gs
IG1lYW5zIFBHVF9wYXJ0aWFsIGlzIHNldCBpbnN0ZWFkLiAgUHV0Ci0gICAgICAgICAgICAgKiBp
dCBiYWNrIG9uIHRoZSBsaXN0LCBidXQgZG9uJ3Qgc2V0IFBHVF9waW5uZWQ7IHRoZQotICAgICAg
ICAgICAgICogc2VjdGlvbiBiZWxvdyB3aWxsIGZpbmlzaCBvZmYgZGUtdmFsaWRhdGlvbi4gIEJ1
dCB3ZSBkbwotICAgICAgICAgICAgICogbmVlZCB0byBkcm9wIHRoZSBnZW5lcmFsIHJlZiBhc3Nv
Y2lhdGVkIHdpdGgKLSAgICAgICAgICAgICAqIFBHVF9waW5uZWQsIHNpbmNlIHB1dF9wYWdlX2Fu
ZF90eXBlX3ByZWVtcHRpYmxlKCkKLSAgICAgICAgICAgICAqIGRpZG4ndCBkbyBpdC4KLSAgICAg
ICAgICAgICAqCi0gICAgICAgICAgICAgKiBOQiB3ZSBjYW4gZG8gYW4gQVNTRVJUIGZvciBQR1Rf
dmFsaWRhdGVkLCBzaW5jZSB3ZQotICAgICAgICAgICAgICogIm93biIgdGhlIHR5cGUgcmVmOyBi
dXQgdGhlb3JldGljYWxseSwgdGhlIFBHVF9wYXJ0aWFsCi0gICAgICAgICAgICAgKiBjb3VsZCBi
ZSBjbGVhcmVkIGJ5IHNvbWVvbmUgZWxzZS4KLSAgICAgICAgICAgICAqLwotICAgICAgICAgICAg
aWYgKCByZXQgPT0gLUVJTlRSICkKLSAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBBU1NF
UlQocGFnZS0+dS5pbnVzZS50eXBlX2luZm8gJiBQR1RfdmFsaWRhdGVkKTsKLSAgICAgICAgICAg
ICAgICBzZXRfYml0KF9QR1RfcGlubmVkLCAmcGFnZS0+dS5pbnVzZS50eXBlX2luZm8pOwotICAg
ICAgICAgICAgfQotICAgICAgICAgICAgZWxzZQotICAgICAgICAgICAgICAgIHB1dF9wYWdlKHBh
Z2UpOworICAgICAgICAgICAgQVNTRVJUKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX3Zh
bGlkYXRlZCk7CisgICAgICAgICAgICAvKiBGYWxsdGhyb3VnaCAqLworICAgICAgICBjYXNlIC1F
UkVTVEFSVDoKKyAgICAgICAgICAgIGN1cnJlbnQtPmFyY2gub2xkX2d1ZXN0X3B0cGcgPSBOVUxM
OworICAgICAgICAgICAgY3VycmVudC0+YXJjaC5vbGRfZ3Vlc3RfdGFibGUgPSBwYWdlOworICAg
ICAgICAgICAgY3VycmVudC0+YXJjaC5vbGRfZ3Vlc3RfdGFibGVfcGFydGlhbCA9IChyZXQgPT0g
LUVSRVNUQVJUKTsKIAogICAgICAgICAgICAgcmV0ID0gLUVSRVNUQVJUOwogCi0gICAgICAgICAg
ICAvKiBQdXQgdGhlIHBhZ2UgYmFjayBvbiB0aGUgbGlzdCBhbmQgZHJvcCB0aGUgcmVmIHdlIGdy
YWJiZWQgYWJvdmUgKi8KLSAgICAgICAgICAgIHBhZ2VfbGlzdF9hZGQocGFnZSwgbGlzdCk7Ci0g
ICAgICAgICAgICBwdXRfcGFnZShwYWdlKTsKKyAgICAgICAgICAgIC8qIE1ha2Ugc3VyZSB3ZSBk
b24ndCBsb3NlIHRyYWNrIG9mIHRoZSBwYWdlICovCisgICAgICAgICAgICBwYWdlX2xpc3RfYWRk
X3RhaWwocGFnZSwgJmQtPmFyY2gucmVsbWVtX2xpc3QpOworCisgICAgICAgICAgICAvKgorICAg
ICAgICAgICAgICogTkIgdGhhdCB3ZSd2ZSB0cmFuc2ZlcnJlZCB0aGUgZ2VuZXJhbCByZWYgYWNx
dWlyZWQgYXQKKyAgICAgICAgICAgICAqIHRoZSB0b3Agb2YgdGhlIGxvb3AgdG8gb2xkX2d1ZXN0
X3RhYmxlLgorICAgICAgICAgICAgICovCiAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAg
ZGVmYXVsdDoKICAgICAgICAgICAgIEJVRygpOwotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
