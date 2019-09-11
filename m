Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4738EB04C0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 22:10:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i88rk-00030W-45; Wed, 11 Sep 2019 20:05:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L0xq=XG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i88ri-00030J-KR
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 20:05:22 +0000
X-Inumbo-ID: 7be61c7e-d4cf-11e9-978d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7be61c7e-d4cf-11e9-978d-bc764e2007e4;
 Wed, 11 Sep 2019 20:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568232321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5mwy1x2NvpEAJcMZSDwwXuBx23b+MiSxgOml7mKLXH8=;
 b=ZonA4OKyao3OBNU7aqKvlxaKsK+mlY6mwnmYOhG3kQIcKRGPqmfjmYUk
 dsFzw9irY9wtl311oFW3eowKIfoZQH2ufQVLZGoAzwP7dHxZZ5uTp6pcm
 1xli73fbunqh9OiUlniXw2Gj/S5Ahr8tPi0+E5QbDl3mqQwG0QtTmGYjZ c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9aRAf2ARsQVOzObqupFfxU3QpYt4Vs/I9oSKXX3xWLakzEzIq1AfhtKQmVi2gdYLMT/E5eos2L
 6ebiRzc5rMuWKHDM3k09OXXPDqf0G8wouNIieQ/BF0g8mjHTivNEw1JN1LkUSSB6MySgF+f/yi
 9qAudeJ2jE25M/musySF6AZ8rCeoEJkPGHf+56QOn0PlUgUFR9RZ5qiBsLcv8Eh13jQRO5OMBG
 F6nVfM1/f7cu0/AGYfhvAeOEkq90BAEYUeL7HiJika2RaqgoVBzq1NuYvICS/XrdQNWfXJiklp
 Upk=
X-SBRS: 2.7
X-MesageID: 5742443
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,494,1559534400"; 
   d="scan'208";a="5742443"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 11 Sep 2019 21:05:00 +0100
Message-ID: <20190911200504.5693-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190911200504.5693-1-andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/8] tools/libxc: Pre-cleanup for xc_cpuid_{set,
 apply_policy}()
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
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBpcyBicm9rZW4gb3V0IGp1c3QgdG8gc2ltcGxpZnkgdGhlIGZvbGxvd2luZyB0
d28uCgpGb3IgeGNfY3B1aWRfc2V0KCksIGRvY3VtZW50IGhvdyB0aGUgJ2snIHdvcmtzIGJlY2F1
c2UgaXQgaXMgcXVpdGUgc3VidGxlLgpSZXBsYWNlIGEgbWVtc2V0KCkgd2l0aCB3ZWlyZCBjYWxj
dWxhdGlvbiBmb3IgYSBsb29wIG9mIDQgZXhwbGljaXQgTlVMTAphc3NpZ21lbnRzLiAgVGhpcyBt
aXJyb3JzIHRoZSBmcmVlKCkncyBpbiB0aGUgZmFpbCBwYXRoLgoKRm9yIHhjX2NwdWlkX2FwcGx5
X3BvbGljeSgpLCBjb25zdC1pZnkgdGhlIGZlYXR1cmVzZXQgcG9pbnRlci4gIEl0IGlzbid0Cndy
aXR0ZW4gdG8sIGFuZCB3YXMgbmV2ZXIgaW50ZW5kZWQgdG8gYmUgbXV0YWJsZS4KCkRyb3AgdGhy
ZWUgcGllY2VzIG9mIHRyYWlsaW5nIHdoaXRlc3BhY2UuCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4K
ClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzog
SWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGMvaW5j
bHVkZS94ZW5jdHJsLmggfCAgMiArLQogdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgICAgfCAy
MSArKysrKysrKysrKysrKy0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0
cmwuaCBiL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oCmluZGV4IGU0Nzc3ODUzNWQuLjI0
MTlhNDdmMjIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oCisrKyBi
L3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oCkBAIC0xODAwLDcgKzE4MDAsNyBAQCBpbnQg
eGNfY3B1aWRfc2V0KHhjX2ludGVyZmFjZSAqeGNoLAogICAgICAgICAgICAgICAgICBjaGFyICoq
Y29uZmlnX3RyYW5zZm9ybWVkKTsKIGludCB4Y19jcHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJm
YWNlICp4Y2gsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRvbWlkLAotICAg
ICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqZmVhdHVyZXNldCwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uc3QgdWludDMyX3QgKmZlYXR1cmVzZXQsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBucl9mZWF0dXJlcyk7CiBpbnQgeGNfbWNhX29wKHhj
X2ludGVyZmFjZSAqeGNoLCBzdHJ1Y3QgeGVuX21jICptYyk7CiBpbnQgeGNfbWNhX29wX2luamVj
dF92Mih4Y19pbnRlcmZhY2UgKnhjaCwgdW5zaWduZWQgaW50IGZsYWdzLApkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwpp
bmRleCAzM2I5ZTlmYzg1Li5hMmQyOWEwZmFlIDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19j
cHVpZF94ODYuYworKysgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwpAQCAtMSw1ICsxLDUg
QEAKIC8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioKLSAqIHhjX2NwdWlkX3g4Ni5jIAorICogeGNfY3B1
aWRfeDg2LmMKICAqCiAgKiBDb21wdXRlIGNwdWlkIG9mIGEgZG9tYWluLgogICoKQEAgLTMzMiw3
ICszMzIsNyBAQCBzdGF0aWMgdm9pZCBjcHVpZChjb25zdCB1bnNpZ25lZCBpbnQgKmlucHV0LCB1
bnNpZ25lZCBpbnQgKnJlZ3MpCiAKIHN0YXRpYyBpbnQgZ2V0X2NwdWlkX2RvbWFpbl9pbmZvKHhj
X2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBkb21pZCwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBjcHVpZF9kb21haW5faW5mbyAqaW5mbywKLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQzMl90ICpmZWF0dXJlc2V0LAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3QgdWludDMyX3QgKmZlYXR1cmVzZXQsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbnJfZmVhdHVyZXMpCiB7CiAgICAg
c3RydWN0IHhlbl9kb21jdGwgZG9tY3RsID0ge307CkBAIC04MDcsOCArODA3LDcgQEAgc3RhdGlj
IHZvaWQgc2FuaXRpc2VfZmVhdHVyZXNldChzdHJ1Y3QgY3B1aWRfZG9tYWluX2luZm8gKmluZm8p
CiB9CiAKIGludCB4Y19jcHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJmYWNlICp4Y2gsIHVpbnQz
Ml90IGRvbWlkLAotICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqZmVhdHVyZXNl
dCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5yX2ZlYXR1cmVzKQor
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1aW50MzJfdCAqZmVhdHVyZXNldCwgdW5z
aWduZWQgaW50IG5yX2ZlYXR1cmVzKQogewogICAgIHN0cnVjdCBjcHVpZF9kb21haW5faW5mbyBp
bmZvID0ge307CiAgICAgdW5zaWduZWQgaW50IGlucHV0WzJdID0geyAwLCAwIH0sIHJlZ3NbNF07
CkBAIC04OTgsNyArODk3LDcgQEAgaW50IHhjX2NwdWlkX2FwcGx5X3BvbGljeSh4Y19pbnRlcmZh
Y2UgKnhjaCwgdWludDMyX3QgZG9taWQsCiAgKiAgICdrJyAtPiBwYXNzIHRocm91Z2ggaG9zdCB2
YWx1ZQogICogICAncycgLT4gcGFzcyB0aHJvdWdoIHRoZSBmaXJzdCB0aW1lIGFuZCB0aGVuIGtl
ZXAgdGhlIHNhbWUgdmFsdWUKICAqICAgICAgICAgIGFjcm9zcyBzYXZlL3Jlc3RvcmUgYW5kIG1p
Z3JhdGlvbi4KLSAqIAorICoKICAqIEZvciAncycgYW5kICd4JyB0aGUgY29uZmlndXJhdGlvbiBp
cyBvdmVyd3JpdHRlbiB3aXRoIHRoZSB2YWx1ZSBhcHBsaWVkLgogICovCiBpbnQgeGNfY3B1aWRf
c2V0KApAQCAtOTA5LDcgKzkwOCw4IEBAIGludCB4Y19jcHVpZF9zZXQoCiAgICAgdW5zaWduZWQg
aW50IGksIGosIHJlZ3NbNF0sIHBvbHJlZ3NbNF07CiAgICAgc3RydWN0IGNwdWlkX2RvbWFpbl9p
bmZvIGluZm8gPSB7fTsKIAotICAgIG1lbXNldChjb25maWdfdHJhbnNmb3JtZWQsIDAsIDQgKiBz
aXplb2YoKmNvbmZpZ190cmFuc2Zvcm1lZCkpOworICAgIGZvciAoIGkgPSAwOyBpIDwgNDsgKytp
ICkKKyAgICAgICAgY29uZmlnX3RyYW5zZm9ybWVkW2ldID0gTlVMTDsKIAogICAgIHJjID0gZ2V0
X2NwdWlkX2RvbWFpbl9pbmZvKHhjaCwgZG9taWQsICZpbmZvLCBOVUxMLCAwKTsKICAgICBpZiAo
IHJjICkKQEAgLTkyNyw3ICs5MjcsNyBAQCBpbnQgeGNfY3B1aWRfc2V0KAogICAgICAgICAgICAg
cmVnc1tpXSA9IHBvbHJlZ3NbaV07CiAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgfQot
ICAgICAgICAKKwogICAgICAgICBjb25maWdfdHJhbnNmb3JtZWRbaV0gPSBjYWxsb2MoMzMsIDEp
OyAvKiAzMiBiaXRzLCBOVUwgdGVybWluYXRvci4gKi8KICAgICAgICAgaWYgKCBjb25maWdfdHJh
bnNmb3JtZWRbaV0gPT0gTlVMTCApCiAgICAgICAgIHsKQEAgLTkzNSw2ICs5MzUsMTMgQEAgaW50
IHhjX2NwdWlkX3NldCgKICAgICAgICAgICAgIGdvdG8gZmFpbDsKICAgICAgICAgfQogCisgICAg
ICAgIC8qCisgICAgICAgICAqIE5vdGVzIGZvciBmb2xsb3dpbmcgdGhpcyBhbGdvcml0aG06Cisg
ICAgICAgICAqCisgICAgICAgICAqIFdoaWxlIGl0IHdpbGwgYWNjZXB0IGFueSBsZWFmIGRhdGEs
IGl0IG9ubHkgbWFrZXMgc2Vuc2UgdG8gdXNlIG9uCisgICAgICAgICAqIGZlYXR1cmUgbGVhdmVz
LiAgcmVnc1tdIGluaXRpYWxseSBjb250YWlucyB0aGUgaG9zdCB2YWx1ZXMuICBUaGlzLAorICAg
ICAgICAgKiB3aXRoIHRoZSBmYWxsLXRocm91Z2ggY2hhaW4gaXMgaG93IHRoZSAnaycgb3B0aW9u
IHdvcmtzLgorICAgICAgICAgKi8KICAgICAgICAgZm9yICggaiA9IDA7IGogPCAzMjsgaisrICkK
ICAgICAgICAgewogICAgICAgICAgICAgdW5zaWduZWQgY2hhciB2YWwgPSAhISgocmVnc1tpXSAm
ICgxVSA8PCAoMzEgLSBqKSkpKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
