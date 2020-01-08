Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0AC133F75
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 11:42:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip8kE-0007xG-5V; Wed, 08 Jan 2020 10:39:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/T5=25=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ip8kC-0007x7-0v
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 10:39:20 +0000
X-Inumbo-ID: 193036a0-3203-11ea-bf56-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 193036a0-3203-11ea-bf56-bc764e2007e4;
 Wed, 08 Jan 2020 10:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578479948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ba4ra9nZdllESORCXLcGcHMgte79HZx546Vj9gUeQJk=;
 b=N0GfuyaWWR5994xiDC1fhU1axbZ7VrIbz8eay0N7CW+COJOBhmEaLPKM
 wzSs8z3m5/OPo1ccCRO98Dufn80uxu6C5jbnoEsusTPSYGz0+VhN5k1Tu
 /CX23Lk5hw/sROdEdHVAsk0bNgSV/Wz6ao7YB9q0P8f4fBQLw1xWUqnEm 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7jiqfmdepobmiVldalbVvA7XJ2NiDBNqSr9cq58kdW8Cdcj57QGOgPZSqS+OxEzuvFdbiOzHtu
 7zdCjOkjsbIW78iZl2PqrBNHI+/lfwTp35o2gb/iNBfVK/KGOvGWOzvlo66a1k510/zcpMy2OT
 KEc4pWHSdqWQIpJkY8FPK99jQGc6ZjTaptTR5piMLG/oIDsp99M3OrafjzdemDygbnmLu+LxPg
 //Y7MJVfoe8idE39+dvdudlCzEoK8m/i2eeRFqfemNmLyJgBMbegT+JL6zyG4UUl5XOTVpA1Jk
 KxU=
X-SBRS: 2.7
X-MesageID: 10603608
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,409,1571716800"; d="scan'208";a="10603608"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 8 Jan 2020 11:38:56 +0100
Message-ID: <20200108103857.77236-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108103857.77236-1-roger.pau@citrix.com>
References: <20200108103857.77236-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] nvmx: fix handling of interrupts
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBkb2luZyBhIHZpcnR1YWwgdm1leGl0IChpZTogYSB2bWV4aXQgaGFuZGxlZCBieSB0aGUg
TDEgVk1NKQppbnRlcnJ1cHRzIHNob3VsZG4ndCBiZSBpbmplY3RlZCB1c2luZyB0aGUgdmlydHVh
bCBpbnRlcnJ1cHQgZGVsaXZlcnkKbWVjaGFuaXNtLCBhbmQgaW5zdGVhZCBzaG91bGQgYmUgc2ln
bmFsZWQgaW4gdGhlIHZtY3MgdXNpbmcgdGhlIGV4aXQKcmVhc29uIGFuZCB0aGUgaW50ZXJydXB0
aW9uLWluZm9ybWF0aW9uIGZpZWxkIGlmIHRoZSAiQWNrbm93bGVkZ2UKaW50ZXJydXB0IG9uIGV4
aXQiIHZtZXhpdCBjb250cm9sIGlzIHNldC4KClJlbW92ZSB0aGUgbnZteF91cGRhdGVfYXBpY3Yg
aGVscGVyOiBpdCdzIGJvZ3VzIHRvIGF0dGVtcHQgdG8gaW5qZWN0CmludGVycnVwdHMgb24gdmly
dHVhbCB2bWV4aXQgdXNpbmcgdGhlIHZpcnR1YWwgaW50ZXJydXB0IGRlbGl2ZXJ5CmFzc2lzdGFu
Y2UsIGFuZCBpdCdzIGFsc28gYm9ndXMgdG8gYWNrIGludGVycnVwdHMgd2l0aG91dCBjaGVja2lu
ZyBpZgp0aGUgdm1leGl0ICJBY2tub3dsZWRnZSBpbnRlcnJ1cHQgb24gZXhpdCIgdm1leGl0IGNv
bnRyb2wgaXMgc2V0Lgpudm14X2ludHJfaW50ZXJjZXB0IGFscmVhZHkgaGFuZGxlcyBpbnRlcnJ1
cHRzIGNvcnJlY3RseSBvbiB2aXJ0dWFsCnZtZXhpdC4KCk5vdGUgdGhhdCB0aGlzIGZpeGVzIHRo
ZSB1c2FnZSBvZiB4MkFQSUMgYnkgdGhlIEwxIFZNTSwgYXQgbGVhc3Qgd2hlbgp0aGUgTDEgVk1N
IGlzIFhlbi4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyB8IDMyIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIveGVuL2FyY2gveDg2L2h2
bS92bXgvdnZteC5jCmluZGV4IGQ4YWIxNjdkNjIuLmFmNDhiMGJlZWYgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14
LmMKQEAgLTEzMTYsMzUgKzEzMTYsNiBAQCBzdGF0aWMgdm9pZCBzeW5jX2V4Y2VwdGlvbl9zdGF0
ZShzdHJ1Y3QgdmNwdSAqdikKICAgICB9CiB9CiAKLXN0YXRpYyB2b2lkIG52bXhfdXBkYXRlX2Fw
aWN2KHN0cnVjdCB2Y3B1ICp2KQotewotICAgIHN0cnVjdCBuZXN0ZWR2bXggKm52bXggPSAmdmNw
dV8yX252bXgodik7Ci0gICAgdW5zaWduZWQgbG9uZyByZWFzb24gPSBnZXRfdnZtY3ModiwgVk1f
RVhJVF9SRUFTT04pOwotICAgIHVpbnQzMl90IGludHJfaW5mbyA9IGdldF92dm1jcyh2LCBWTV9F
WElUX0lOVFJfSU5GTyk7Ci0KLSAgICBpZiAoIHJlYXNvbiA9PSBFWElUX1JFQVNPTl9FWFRFUk5B
TF9JTlRFUlJVUFQgJiYKLSAgICAgICAgIG52bXgtPmludHIuc291cmNlID09IGh2bV9pbnRzcmNf
bGFwaWMgJiYKLSAgICAgICAgIChpbnRyX2luZm8gJiBJTlRSX0lORk9fVkFMSURfTUFTSykgKQot
ICAgIHsKLSAgICAgICAgdWludDE2X3Qgc3RhdHVzOwotICAgICAgICB1aW50MzJfdCBydmksIHBw
cjsKLSAgICAgICAgdWludDMyX3QgdmVjdG9yID0gaW50cl9pbmZvICYgMHhmZjsKLSAgICAgICAg
c3RydWN0IHZsYXBpYyAqdmxhcGljID0gdmNwdV92bGFwaWModik7Ci0KLSAgICAgICAgdmxhcGlj
X2Fja19wZW5kaW5nX2lycSh2LCB2ZWN0b3IsIDEpOwotCi0gICAgICAgIHBwciA9IHZsYXBpY19z
ZXRfcHByKHZsYXBpYyk7Ci0gICAgICAgIFdBUk5fT04oKHBwciAmIDB4ZjApICE9ICh2ZWN0b3Ig
JiAweGYwKSk7Ci0KLSAgICAgICAgc3RhdHVzID0gdmVjdG9yIDw8IFZNWF9HVUVTVF9JTlRSX1NU
QVRVU19TVklfT0ZGU0VUOwotICAgICAgICBydmkgPSB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxKHYp
OwotICAgICAgICBpZiAoIHJ2aSAhPSAtMSApCi0gICAgICAgICAgICBzdGF0dXMgfD0gcnZpICYg
Vk1YX0dVRVNUX0lOVFJfU1RBVFVTX1NVQkZJRUxEX0JJVE1BU0s7Ci0KLSAgICAgICAgX192bXdy
aXRlKEdVRVNUX0lOVFJfU1RBVFVTLCBzdGF0dXMpOwotICAgIH0KLX0KLQogc3RhdGljIHZvaWQg
dmlydHVhbF92bWV4aXQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiB7CiAgICAgc3RydWN0
IHZjcHUgKnYgPSBjdXJyZW50OwpAQCAtMTM5Myw5ICsxMzY0LDYgQEAgc3RhdGljIHZvaWQgdmly
dHVhbF92bWV4aXQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiAgICAgLyogdXBkYXRpbmcg
aG9zdCBjcjAgdG8gc3luYyBUUyBiaXQgKi8KICAgICBfX3Ztd3JpdGUoSE9TVF9DUjAsIHYtPmFy
Y2guaHZtLnZteC5ob3N0X2NyMCk7CiAKLSAgICBpZiAoIGNwdV9oYXNfdm14X3ZpcnR1YWxfaW50
cl9kZWxpdmVyeSApCi0gICAgICAgIG52bXhfdXBkYXRlX2FwaWN2KHYpOwotCiAgICAgbnZjcHUt
Pm52X3Ztc3dpdGNoX2luX3Byb2dyZXNzID0gMDsKIH0KIAotLSAKMi4yNC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
