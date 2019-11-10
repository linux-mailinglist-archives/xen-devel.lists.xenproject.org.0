Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3959CF682C
	for <lists+xen-devel@lfdr.de>; Sun, 10 Nov 2019 10:29:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iTjTP-0004Sb-CK; Sun, 10 Nov 2019 09:25:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nPAK=ZC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iTjTN-0004SR-Kf
 for xen-devel@lists.xenproject.org; Sun, 10 Nov 2019 09:25:29 +0000
X-Inumbo-ID: 079cb9a8-039c-11ea-a1f4-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 079cb9a8-039c-11ea-a1f4-12813bfff9fa;
 Sun, 10 Nov 2019 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573377928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/tEVaFfCmin8bNmFhv84WNA3WrmA1Zy61SW+C74zaWU=;
 b=IPD6tmEaOa0kmWutGwbxLgj49QV5etlxpy4CvI9cpmEIAmAjMRQqoiDV
 ZjIRHm2xS1sAUj3w0SLwIjmQAXFUP1T2EcFyFff0lzUy4bHFybUOnI2C9
 PqClI5khYl4ovW4VtgxPpsEZ8It0vnwOe/shWDdbvf6lX+DuH9yBKrmkd 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RR4lqlDHIoRaHy7/dkrKAGNQiQ8I0MDfzsovze1ILAaLiFI9/R9i0VKrCb6O/VIJV+tkTnFF2N
 peeXFU4hy/TLzdEMUyXrNgpFuBXYqZ8Sz7qYw2DE5HEeTQ+vgmFbWrd+2uWsewdSmtOswTuKku
 VovupM7hY4um/dFQwnsQtSb4kd6MxqHXiA8pBQjTyzLvWrQ24umcbtBjp3Gy9o3zmDAMwfLRnq
 Umi/RVZLitdGz7k35g9x5fAE7q+lddLJDaLanpEY5/nG3U3XvqEccz2YlC15cdU460fXHT0hC+
 FH0=
X-SBRS: 2.7
X-MesageID: 8217509
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,288,1569297600"; 
   d="scan'208";a="8217509"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Sun, 10 Nov 2019 10:25:05 +0100
Message-ID: <20191110092506.98925-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191110092506.98925-1-roger.pau@citrix.com>
References: <20191110092506.98925-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v2 1/2] x86/ioapic: remove usage of
 TRUE and FALSE in clear_IO_APIC_pin
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kIGluc3RlYWQgdXNlIHByb3BlciBib29sZWFucy4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50
ZW5kZWQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCkNjOiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2lvX2FwaWMu
YyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaW9fYXBpYy5jIGIveGVuL2Fy
Y2gveDg2L2lvX2FwaWMuYwppbmRleCAzN2VhYmMxNmM5Li5iOWM2NmFjZGIzIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvaW9fYXBpYy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMKQEAg
LTUwMiw3ICs1MDIsNyBAQCBzdGF0aWMgdm9pZCBjbGVhcl9JT19BUElDX3Bpbih1bnNpZ25lZCBp
bnQgYXBpYywgdW5zaWduZWQgaW50IHBpbikKICAgICBzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRy
eSBlbnRyeTsKIAogICAgIC8qIENoZWNrIGRlbGl2ZXJ5X21vZGUgdG8gYmUgc3VyZSB3ZSdyZSBu
b3QgY2xlYXJpbmcgYW4gU01JIHBpbiAqLwotICAgIGVudHJ5ID0gX19pb2FwaWNfcmVhZF9lbnRy
eShhcGljLCBwaW4sIEZBTFNFKTsKKyAgICBlbnRyeSA9IF9faW9hcGljX3JlYWRfZW50cnkoYXBp
YywgcGluLCBmYWxzZSk7CiAgICAgaWYgKGVudHJ5LmRlbGl2ZXJ5X21vZGUgPT0gZGVzdF9TTUkp
CiAgICAgICAgIHJldHVybjsKIApAQCAtNTEyLDE1ICs1MTIsMTUgQEAgc3RhdGljIHZvaWQgY2xl
YXJfSU9fQVBJQ19waW4odW5zaWduZWQgaW50IGFwaWMsIHVuc2lnbmVkIGludCBwaW4pCiAgICAg
ICovCiAgICAgaWYgKCFlbnRyeS5tYXNrKSB7CiAgICAgICAgIGVudHJ5Lm1hc2sgPSAxOwotICAg
ICAgICBfX2lvYXBpY193cml0ZV9lbnRyeShhcGljLCBwaW4sIEZBTFNFLCBlbnRyeSk7CisgICAg
ICAgIF9faW9hcGljX3dyaXRlX2VudHJ5KGFwaWMsIHBpbiwgZmFsc2UsIGVudHJ5KTsKICAgICB9
Ci0gICAgZW50cnkgPSBfX2lvYXBpY19yZWFkX2VudHJ5KGFwaWMsIHBpbiwgVFJVRSk7CisgICAg
ZW50cnkgPSBfX2lvYXBpY19yZWFkX2VudHJ5KGFwaWMsIHBpbiwgdHJ1ZSk7CiAKICAgICBpZiAo
ZW50cnkuaXJyKSB7CiAgICAgICAgIC8qIE1ha2Ugc3VyZSB0aGUgdHJpZ2dlciBtb2RlIGlzIHNl
dCB0byBsZXZlbC4gKi8KICAgICAgICAgaWYgKCFlbnRyeS50cmlnZ2VyKSB7CiAgICAgICAgICAg
ICBlbnRyeS50cmlnZ2VyID0gMTsKLSAgICAgICAgICAgIF9faW9hcGljX3dyaXRlX2VudHJ5KGFw
aWMsIHBpbiwgVFJVRSwgZW50cnkpOworICAgICAgICAgICAgX19pb2FwaWNfd3JpdGVfZW50cnko
YXBpYywgcGluLCB0cnVlLCBlbnRyeSk7CiAgICAgICAgIH0KICAgICAgICAgX19pb19hcGljX2Vv
aShhcGljLCBlbnRyeS52ZWN0b3IsIHBpbik7CiAgICAgfQpAQCAtNTMwLDkgKzUzMCw5IEBAIHN0
YXRpYyB2b2lkIGNsZWFyX0lPX0FQSUNfcGluKHVuc2lnbmVkIGludCBhcGljLCB1bnNpZ25lZCBp
bnQgcGluKQogICAgICAqLwogICAgIG1lbXNldCgmZW50cnksIDAsIHNpemVvZihlbnRyeSkpOwog
ICAgIGVudHJ5Lm1hc2sgPSAxOwotICAgIF9faW9hcGljX3dyaXRlX2VudHJ5KGFwaWMsIHBpbiwg
VFJVRSwgZW50cnkpOworICAgIF9faW9hcGljX3dyaXRlX2VudHJ5KGFwaWMsIHBpbiwgdHJ1ZSwg
ZW50cnkpOwogCi0gICAgZW50cnkgPSBfX2lvYXBpY19yZWFkX2VudHJ5KGFwaWMsIHBpbiwgVFJV
RSk7CisgICAgZW50cnkgPSBfX2lvYXBpY19yZWFkX2VudHJ5KGFwaWMsIHBpbiwgdHJ1ZSk7CiAg
ICAgaWYgKGVudHJ5LmlycikKICAgICAgICAgcHJpbnRrKEtFUk5fRVJSICJJTy1BUElDJTAyeC0l
dTogVW5hYmxlIHRvIHJlc2V0IElSUlxuIiwKICAgICAgICAgICAgICAgIElPX0FQSUNfSUQoYXBp
YyksIHBpbik7Ci0tIAoyLjIzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
