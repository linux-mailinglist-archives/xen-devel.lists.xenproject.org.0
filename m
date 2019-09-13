Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE15B2613
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 21:30:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8rF5-0006uY-1f; Fri, 13 Sep 2019 19:28:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bj/4=XI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8rF4-0006uD-5r
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 19:28:26 +0000
X-Inumbo-ID: 9e8fe85d-d65c-11e9-95b9-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e8fe85d-d65c-11e9-95b9-12813bfff9fa;
 Fri, 13 Sep 2019 19:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568402890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/upZBzGAszcwIpyuQpeTBNr65pTRgh7FR1YW/jSBUGQ=;
 b=AQztp1ba922OoAgxQQx2+Bnx+PxssqJQhDbNw7T+yTl1+YvfUy3amO4E
 ymxRGGk7tqmB2NY0QMpfk1lkOtEDZilVj7VvobdvDsJ+QabCoJ+wot5qK
 JGzLrLoszo1Pe8iIxmVg0BWPs3758S8zHXuVAOyCGq7Z420ONjonXdGB5 w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ci7k6c0lS09hF1NJvcVfiHB4szfMArsf6lPR7cg3ZEpIiHn6b3sJers+Sl+liUFZbiI/kMRL3l
 T56rOkp0Q3InVBo0F4GqM3ZxxKFmvCrvFIUYSHj6H2pn4aXqgfrU4TGEXPOtsBMZFjEhVd4+9P
 A5KhrOGk/VyOw2J5VB4v0nx0WWvyY+8TLiX3dWZQU3nB1SW5PJD7BL1DFeSIt0cza6KYPkcbLV
 L/3wDIrfXEBQzM0oW6z2YqaHsGEZCAkZEE413kTgXr9EH0jVGv+LzINU5H+j9eR5jhczPe6w9+
 ye0=
X-SBRS: 2.7
X-MesageID: 5754526
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5754526"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 20:27:55 +0100
Message-ID: <20190913192759.10795-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190913192759.10795-1-andrew.cooper3@citrix.com>
References: <20190913192759.10795-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 06/10] tools/libxc: Pre-cleanup for
 xc_cpuid_{set, apply_policy}()
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
d28uCgpGb3IgeGNfY3B1aWRfc2V0KCksIGRvY3VtZW50IGhvdyB0aGUgJ3MnIGFuZCAnaycgb3B0
aW9ucyB3b3JrcyBiZWNhdXNlIGl0IGlzCnF1aXRlIHN1YnRsZS4gIFJlcGxhY2UgYSBtZW1zZXQo
KSB3aXRoIGEgZm9yIGxvb3Agb2YgNCBleHBsaWNpdCBOVUxMCmFzc2lnbWVudHMuICBUaGlzIG1p
cnJvcnMgdGhlIGZyZWUoKSdzIGluIHRoZSBmYWlsIHBhdGguCgpGb3IgeGNfY3B1aWRfYXBwbHlf
cG9saWN5KCksIGNvbnN0LWlmeSB0aGUgZmVhdHVyZXNldCBwb2ludGVyLiAgSXQgaXNuJ3QKd3Jp
dHRlbiB0bywgYW5kIHdhcyBuZXZlciBpbnRlbmRlZCB0byBiZSBtdXRhYmxlLgoKRHJvcCB0aHJl
ZSBwaWVjZXMgb2YgdHJhaWxpbmcgd2hpdGVzcGFjZS4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoK
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCkNDOiBKYW4g
QmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBJYW4gSmFja3NvbiA8
SWFuLkphY2tzb25AY2l0cml4LmNvbT4KCnYyOgogKiBBZGp1c3QgdGhlIGNvbW1lbnRzIHRvIGlu
Y2x1ZGUgJ3MnIGFsb25nIHdpdGggJ2snCi0tLQogdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJs
LmggfCAgMiArLQogdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgICAgfCAyMSArKysrKysrKysr
KysrKy0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCBiL3Rvb2xz
L2xpYnhjL2luY2x1ZGUveGVuY3RybC5oCmluZGV4IDBkYTQzNzMxOGUuLmY0NDMxNjg3YjMgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oCisrKyBiL3Rvb2xzL2xpYnhj
L2luY2x1ZGUveGVuY3RybC5oCkBAIC0xODAwLDcgKzE4MDAsNyBAQCBpbnQgeGNfY3B1aWRfc2V0
KHhjX2ludGVyZmFjZSAqeGNoLAogICAgICAgICAgICAgICAgICBjaGFyICoqY29uZmlnX3RyYW5z
Zm9ybWVkKTsKIGludCB4Y19jcHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJmYWNlICp4Y2gsCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRvbWlkLAotICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50MzJfdCAqZmVhdHVyZXNldCwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3QgdWludDMyX3QgKmZlYXR1cmVzZXQsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBucl9mZWF0dXJlcyk7CiBpbnQgeGNfbWNhX29wKHhjX2ludGVyZmFjZSAq
eGNoLCBzdHJ1Y3QgeGVuX21jICptYyk7CiBpbnQgeGNfbWNhX29wX2luamVjdF92Mih4Y19pbnRl
cmZhY2UgKnhjaCwgdW5zaWduZWQgaW50IGZsYWdzLApkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMv
eGNfY3B1aWRfeDg2LmMgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwppbmRleCAwZjA3MzE3
YjU0Li44Nzg1Y2FlMzI5IDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwor
KysgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwpAQCAtMSw1ICsxLDUgQEAKIC8qKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioKLSAqIHhjX2NwdWlkX3g4Ni5jIAorICogeGNfY3B1aWRfeDg2LmMKICAq
CiAgKiBDb21wdXRlIGNwdWlkIG9mIGEgZG9tYWluLgogICoKQEAgLTMyOSw3ICszMjksNyBAQCBz
dGF0aWMgdm9pZCBjcHVpZChjb25zdCB1bnNpZ25lZCBpbnQgKmlucHV0LCB1bnNpZ25lZCBpbnQg
KnJlZ3MpCiAKIHN0YXRpYyBpbnQgZ2V0X2NwdWlkX2RvbWFpbl9pbmZvKHhjX2ludGVyZmFjZSAq
eGNoLCB1aW50MzJfdCBkb21pZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBjcHVpZF9kb21haW5faW5mbyAqaW5mbywKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVpbnQzMl90ICpmZWF0dXJlc2V0LAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3QgdWludDMyX3QgKmZlYXR1cmVzZXQsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgbnJfZmVhdHVyZXMpCiB7CiAgICAgc3RydWN0IHhlbl9k
b21jdGwgZG9tY3RsID0ge307CkBAIC04MDQsOCArODA0LDcgQEAgc3RhdGljIHZvaWQgc2FuaXRp
c2VfZmVhdHVyZXNldChzdHJ1Y3QgY3B1aWRfZG9tYWluX2luZm8gKmluZm8pCiB9CiAKIGludCB4
Y19jcHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJmYWNlICp4Y2gsIHVpbnQzMl90IGRvbWlkLAot
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqZmVhdHVyZXNldCwKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5yX2ZlYXR1cmVzKQorICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCB1aW50MzJfdCAqZmVhdHVyZXNldCwgdW5zaWduZWQgaW50IG5y
X2ZlYXR1cmVzKQogewogICAgIHN0cnVjdCBjcHVpZF9kb21haW5faW5mbyBpbmZvID0ge307CiAg
ICAgdW5zaWduZWQgaW50IGlucHV0WzJdID0geyAwLCAwIH0sIHJlZ3NbNF07CkBAIC04OTUsNyAr
ODk0LDcgQEAgaW50IHhjX2NwdWlkX2FwcGx5X3BvbGljeSh4Y19pbnRlcmZhY2UgKnhjaCwgdWlu
dDMyX3QgZG9taWQsCiAgKiAgICdrJyAtPiBwYXNzIHRocm91Z2ggaG9zdCB2YWx1ZQogICogICAn
cycgLT4gcGFzcyB0aHJvdWdoIHRoZSBmaXJzdCB0aW1lIGFuZCB0aGVuIGtlZXAgdGhlIHNhbWUg
dmFsdWUKICAqICAgICAgICAgIGFjcm9zcyBzYXZlL3Jlc3RvcmUgYW5kIG1pZ3JhdGlvbi4KLSAq
IAorICoKICAqIEZvciAncycgYW5kICd4JyB0aGUgY29uZmlndXJhdGlvbiBpcyBvdmVyd3JpdHRl
biB3aXRoIHRoZSB2YWx1ZSBhcHBsaWVkLgogICovCiBpbnQgeGNfY3B1aWRfc2V0KApAQCAtOTA2
LDcgKzkwNSw4IEBAIGludCB4Y19jcHVpZF9zZXQoCiAgICAgdW5zaWduZWQgaW50IGksIGosIHJl
Z3NbNF0sIHBvbHJlZ3NbNF07CiAgICAgc3RydWN0IGNwdWlkX2RvbWFpbl9pbmZvIGluZm8gPSB7
fTsKIAotICAgIG1lbXNldChjb25maWdfdHJhbnNmb3JtZWQsIDAsIDQgKiBzaXplb2YoKmNvbmZp
Z190cmFuc2Zvcm1lZCkpOworICAgIGZvciAoIGkgPSAwOyBpIDwgNDsgKytpICkKKyAgICAgICAg
Y29uZmlnX3RyYW5zZm9ybWVkW2ldID0gTlVMTDsKIAogICAgIHJjID0gZ2V0X2NwdWlkX2RvbWFp
bl9pbmZvKHhjaCwgZG9taWQsICZpbmZvLCBOVUxMLCAwKTsKICAgICBpZiAoIHJjICkKQEAgLTky
NCw3ICs5MjQsNyBAQCBpbnQgeGNfY3B1aWRfc2V0KAogICAgICAgICAgICAgcmVnc1tpXSA9IHBv
bHJlZ3NbaV07CiAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgfQotICAgICAgICAKKwog
ICAgICAgICBjb25maWdfdHJhbnNmb3JtZWRbaV0gPSBjYWxsb2MoMzMsIDEpOyAvKiAzMiBiaXRz
LCBOVUwgdGVybWluYXRvci4gKi8KICAgICAgICAgaWYgKCBjb25maWdfdHJhbnNmb3JtZWRbaV0g
PT0gTlVMTCApCiAgICAgICAgIHsKQEAgLTkzMiw2ICs5MzIsMTMgQEAgaW50IHhjX2NwdWlkX3Nl
dCgKICAgICAgICAgICAgIGdvdG8gZmFpbDsKICAgICAgICAgfQogCisgICAgICAgIC8qCisgICAg
ICAgICAqIE5vdGVzIGZvciBmb2xsb3dpbmcgdGhpcyBhbGdvcml0aG06CisgICAgICAgICAqCisg
ICAgICAgICAqIFdoaWxlIGl0IHdpbGwgYWNjZXB0IGFueSBsZWFmIGRhdGEsIGl0IG9ubHkgbWFr
ZXMgc2Vuc2UgdG8gdXNlIG9uCisgICAgICAgICAqIGZlYXR1cmUgbGVhdmVzLiAgcmVnc1tdIGlu
aXRpYWxseSBjb250YWlucyB0aGUgaG9zdCB2YWx1ZXMuICBUaGlzLAorICAgICAgICAgKiB3aXRo
IHRoZSBmYWxsLXRocm91Z2ggY2hhaW4gaXMgaG93IHRoZSAncycgYW5kICdrJyBvcHRpb25zIHdv
cmtzLgorICAgICAgICAgKi8KICAgICAgICAgZm9yICggaiA9IDA7IGogPCAzMjsgaisrICkKICAg
ICAgICAgewogICAgICAgICAgICAgdW5zaWduZWQgY2hhciB2YWwgPSAhISgocmVnc1tpXSAmICgx
VSA8PCAoMzEgLSBqKSkpKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
