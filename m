Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983BDC2225
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 15:36:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEvnt-0005We-9k; Mon, 30 Sep 2019 13:33:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=znM2=XZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iEvns-0005WB-6S
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 13:33:28 +0000
X-Inumbo-ID: dd5cc320-e386-11e9-97fb-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id dd5cc320-e386-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 13:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569850399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LGMf3Bye9W7unx9wzxf6qtCwgdaDW8X0eBe1IrGRPkc=;
 b=ATlEHOUmqb+KueGhK0I6qT80KSRPxdujevGxYr5rJ4pFSzixrCislHcN
 wuGMjPklz5RxcDNgbPCgTxKP1BTJVaDe3PHcG9/bELXIRGKI2sSHmemr6
 kCCfxYZ2ngCXowRKPz+VzfNZQ4r9Ke69T4KD1iud8XpWMdR/0vkQUO+1O I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7A2Ty5E9OYjJ9HCkF9+9oeHe5WPTFpgQZLZT9jIAI8yu53eM6uS84O04cnRx066bLSXs/WShEp
 pwbA+SgRRQnVoNsum7MJvPn04wTj9kXHLBuCEVEByy758Va038CKFgNoJDqSB3n9uAr6OHSrFS
 fdBiNU6w6fIlRpohTVwIQX3j+WfupDXzdu3EGN7MgjgVsRZ0m6T/NF02Jd0M8fvz12BW/hnD8w
 5QHLZcXOGOT+PaijwzVi1f3ZjiXcJS46wDT50lroNJfxkVAxzfsH6LITAfL12GAtZp6C6h7Ljt
 G5Y=
X-SBRS: 2.7
X-MesageID: 6538592
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6538592"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 15:32:34 +0200
Message-ID: <20190930133238.49868-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930133238.49868-1-roger.pau@citrix.com>
References: <20190930133238.49868-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 06/10] ioreq: allow registering internal
 ioreq server handler
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Wei
 Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJvdmlkZSBhIHJvdXRpbmUgdG8gcmVnaXN0ZXIgdGhlIGhhbmRsZXIgZm9yIGFuIGludGVybmFs
IGlvcmVxCnNlcnZlci4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MjoKIC0gcy9odm1fYWRkX2lvcmVxX2hh
bmRsZXIvaHZtX3NldF9pb3JlcV9oYW5kbGVyLgogLSBEbyBub3QgZ290byB0aGUgb3V0IGxhYmVs
IGlmIGlvcmVxIGlzIG5vdCBpbnRlcm5hbC4KCkNoYW5nZXMgc2luY2UgdjE6CiAtIEFsbG93IHRv
IHByb3ZpZGUgYW4gb3BhcXVlIGRhdGEgcGFyYW1ldGVyIHRvIHBhc3MgdG8gdGhlIGhhbmRsZXIu
CiAtIEFsbG93IGNoYW5naW5nIHRoZSBoYW5kbGVyIGFzIGxvbmcgYXMgdGhlIHNlcnZlciBpcyBu
b3QgZW5hYmxlZC4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgICAgICAgIHwgMzIgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2lv
cmVxLmggfCAgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVx
LmMKaW5kZXggMDY0OWI3ZTAyZC4uNTc3MTljNjA3YyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L2h2bS9pb3JlcS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwpAQCAtNDg1LDYgKzQ4
NSwzOCBAQCBzdGF0aWMgaW50IGh2bV9hZGRfaW9yZXFfZ2ZuKHN0cnVjdCBodm1faW9yZXFfc2Vy
dmVyICpzLCBib29sIGJ1ZikKICAgICByZXR1cm4gcmM7CiB9CiAKK2ludCBodm1fc2V0X2lvcmVx
X2hhbmRsZXIoc3RydWN0IGRvbWFpbiAqZCwgaW9zZXJ2aWRfdCBpZCwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50ICgqaGFuZGxlcikoaW9yZXFfdCAqLCB2b2lkICopLAorICAgICAgICAg
ICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQoreworICAgIHN0cnVjdCBodm1faW9yZXFfc2Vy
dmVyICpzOworICAgIGludCByYyA9IDA7CisKKyAgICBpZiAoICFodm1faW9yZXFfaXNfaW50ZXJu
YWwoaWQpICkKKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisKKyAgICBzcGluX2xvY2tfcmVjdXJz
aXZlKCZkLT5hcmNoLmh2bS5pb3JlcV9zZXJ2ZXIubG9jayk7CisgICAgcyA9IGdldF9pb3JlcV9z
ZXJ2ZXIoZCwgaWQpOworICAgIGlmICggIXMgKQorICAgIHsKKyAgICAgICAgcmMgPSAtRU5PRU5U
OworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisgICAgaWYgKCBzLT5lbmFibGVkICkKKyAgICB7
CisgICAgICAgIHJjID0gLUVCVVNZOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisKKyAgICBz
LT5oYW5kbGVyID0gaGFuZGxlcjsKKyAgICBzLT5kYXRhID0gZGF0YTsKKworIG91dDoKKyAgICBz
cGluX3VubG9ja19yZWN1cnNpdmUoJmQtPmFyY2guaHZtLmlvcmVxX3NlcnZlci5sb2NrKTsKKwor
ICAgIHJldHVybiByYzsKK30KKwogc3RhdGljIHZvaWQgaHZtX3VwZGF0ZV9pb3JlcV9ldnRjaG4o
c3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIgKnMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgaHZtX2lvcmVxX3ZjcHUgKnN2KQogewpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vaW9yZXEuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2lvcmVx
LmgKaW5kZXggYzM5MTdhYTc0ZC4uYmZkMmI5OTI1ZSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vaW9yZXEuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pb3JlcS5o
CkBAIC01NCw2ICs1NCwxMCBAQCB1bnNpZ25lZCBpbnQgaHZtX2Jyb2FkY2FzdF9pb3JlcShpb3Jl
cV90ICpwLCBib29sIGJ1ZmZlcmVkKTsKIAogdm9pZCBodm1faW9yZXFfaW5pdChzdHJ1Y3QgZG9t
YWluICpkKTsKIAoraW50IGh2bV9zZXRfaW9yZXFfaGFuZGxlcihzdHJ1Y3QgZG9tYWluICpkLCBp
b3NlcnZpZF90IGlkLAorICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgKCpoYW5kbGVyKShp
b3JlcV90ICosIHZvaWQgKiksCisgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEp
OworCiBzdGF0aWMgaW5saW5lIGJvb2wgaHZtX2lvcmVxX2lzX2ludGVybmFsKHVuc2lnbmVkIGlu
dCBpZCkKIHsKICAgICBBU1NFUlQoaWQgPCBNQVhfTlJfSU9SRVFfU0VSVkVSUyk7Ci0tIAoyLjIz
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
