Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617935E4DB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 15:09:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hieyv-0004qa-Vp; Wed, 03 Jul 2019 13:07:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2FDs=VA=amazon.de=prvs=080812bc2=vrd@srs-us1.protection.inumbo.net>)
 id 1hieyu-0004qM-Fs
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 13:07:28 +0000
X-Inumbo-ID: 81a2eaf2-9d93-11e9-9602-2f84c3411581
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81a2eaf2-9d93-11e9-9602-2f84c3411581;
 Wed, 03 Jul 2019 13:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1562159247; x=1593695247;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=xITRtcB5nFAJt5SkXLWCJjpuyNIQZEkwo4oZ39SjbZg=;
 b=mgOaQclOYvPZP0FbN7oDIGTuRASVXxMofq0hwtE6T/vyXk/XaF5FHdBd
 kVo+MNuWtBg7cl5zYg7LeBrcyZTYZDeYC+exrZydPlqcdqBva5h7bieyb
 YwojbjLLkrThVmoLLhp8KhiGjHKySMkBpBqvGJ8XomLppYOwng9qxAk+z E=;
X-IronPort-AV: E=Sophos;i="5.62,446,1554768000"; d="scan'208";a="409177782"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 03 Jul 2019 13:07:26 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 85F392410F0; Wed,  3 Jul 2019 13:07:25 +0000 (UTC)
Received: from EX13D08UEE002.ant.amazon.com (10.43.62.92) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 3 Jul 2019 13:07:25 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D08UEE002.ant.amazon.com (10.43.62.92) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 3 Jul 2019 13:07:24 +0000
Received: from u908889d5e8f057.ant.amazon.com (10.28.86.21) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 3 Jul 2019 13:07:23 +0000
From: Varad Gautam <vrd@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 3 Jul 2019 15:06:42 +0200
Message-ID: <1562159202-11316-1-git-send-email-vrd@amazon.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] x86: Get rid of p2m_host array allocation for
 HVM guests
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Varad Gautam <vrd@amazon.de>, Amit Shah <aams@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBhbGxvY2F0aW5nIHRoZSBndWVzdCBtZW1vcnkgZm9yIGFuIEhWTSBkb21haW4sIGxpYnhj
IGtlZXBzIHRoZSBQMk0KbWFwcGluZyBmb3IgdGhlIGVudGlyZXR5IG9mIHRoZSBndWVzdCBtZW1v
cnkgYXJvdW5kIGZvciB0aGUgdGltZSBvZiB0aGUKbGF1bmNoIGFzIHhjX2RvbV9pbWFnZS0+cDJt
X2hvc3QuIEZvciBndWVzdHMgdGhhdCBoYXZlIGEgbGFyZ2UgbWVtb3J5CigzOTA0IEdpQiksIHRo
ZSBwMm1faG9zdCBhbGxvY2F0aW9uIHRha2VzIG1vcmUgdGhhbiA3LjUgR2lCIG9mIHNwYWNlLCBh
bmQKbGVhdmVzIHhsIHN1c2NlcHRpYmxlIHRvIGdldHRpbmcgT09NLWtpbGxlZCBvbiBndWVzdCBj
cmVhdGlvbi4KCkNvbnZlcnQgdGhlIHAybV9ob3N0IHRhYmxlIGxvb2t1cHMgdG8gYW4gYXJjaC1z
cGVjaWZpYyBmdW5jdGlvbiB0aGF0CnJldHVybnMgdGhlIG1hcHBpbmcgb24tdGhlLWZseSBmb3Ig
eDg2IEhWTSBndWVzdHMgdG8gYXZvaWQgdGhpcwphbGxvY2F0aW9uLCBicmluZ2luZyBkb3duIHhs
J3MgbWVtb3J5IHVzYWdlIGZyb20gPiA4R2lCIHRvIDwgNzBNaWIgZm9yCnN1Y2ggbGF1bmNoZXMu
CgpTaWduZWQtb2ZmLWJ5OiBWYXJhZCBHYXV0YW0gPHZyZEBhbWF6b24uZGU+CgotLS0KCkFwcGxp
ZXMgdG8gc3RhYmxlLTQuMTErLgoKIHRvb2xzL2xpYnhjL2luY2x1ZGUveGNfZG9tLmggfCAgMTEg
KysrLQogdG9vbHMvbGlieGMveGNfZG9tX2FybS5jICAgICB8ICAgMiArCiB0b29scy9saWJ4Yy94
Y19kb21fY29yZS5jICAgIHwgICA0ICstCiB0b29scy9saWJ4Yy94Y19kb21feDg2LmMgICAgIHwg
MTI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIDQgZmlsZXMg
Y2hhbmdlZCwgOTkgaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGMvaW5jbHVkZS94Y19kb20uaCBiL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGNfZG9t
LmgKaW5kZXggOGE2Njg4OS4uNDNhYmMwZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGMvaW5jbHVk
ZS94Y19kb20uaAorKysgYi90b29scy9saWJ4Yy9pbmNsdWRlL3hjX2RvbS5oCkBAIC0xMzEsNiAr
MTMxLDkgQEAgc3RydWN0IHhjX2RvbV9pbWFnZSB7CiAgICAgICogYSBoeWJyaWQgZ3Vlc3QgdGhp
cyBtZWFucyB0aGF0IGl0IG1hcHMgR1BGTnMgdG8gR1BGTlMuCiAgICAgICoKICAgICAgKiBOb3Rl
IHRoYXQgdGhlIGlucHV0IGlzIG9mZnNldCBieSByYW1iYXNlLgorICAgICAqCisgICAgICogVGhp
cyBpcyBub3QgcG9wdWxhdGVkIGZvciBndWVzdHMgdGhhdCBwcm92aWRlIGFuIGFyY2gtc3BlY2lm
aWMKKyAgICAgKiBsb29rdXAgaG9vayBpbiBhcmNoX2hvb2tzLgogICAgICAqLwogICAgIHhlbl9w
Zm5fdCAqcDJtX2hvc3Q7CiAgICAgdm9pZCAqcDJtX2d1ZXN0OwpAQCAtMjc0LDYgKzI3NywxMCBA
QCBzdHJ1Y3QgeGNfZG9tX2FyY2ggewogICAgIGludCBhcmNoX3ByaXZhdGVfc2l6ZTsKIAogICAg
IHN0cnVjdCB4Y19kb21fYXJjaCAqbmV4dDsKKworICAgIC8qIGFyY2gtc3BlY2lmaWMgcDJtIHRh
YmxlIGxvb2t1cCB0byBnZXQgcmlkIG9mIHRoZSBwMm1faG9zdCBhcnJheSBzdG9yZWQgaW4KKyAg
ICAgKiB4Y19kb21faW1hZ2UuICovCisgICAgeGVuX3Bmbl90ICgqcDJtX2hvc3QpIChzdHJ1Y3Qg
eGNfZG9tX2ltYWdlICpkb20sIHVuc2lnbmVkIGxvbmcgaWR4KTsKIH07CiB2b2lkIHhjX2RvbV9y
ZWdpc3Rlcl9hcmNoX2hvb2tzKHN0cnVjdCB4Y19kb21fYXJjaCAqaG9va3MpOwogCkBAIC00Mzcs
NyArNDQ0LDkgQEAgc3RhdGljIGlubGluZSB4ZW5fcGZuX3QgeGNfZG9tX3AybShzdHJ1Y3QgeGNf
ZG9tX2ltYWdlICpkb20sIHhlbl9wZm5fdCBwZm4pCiAgICAgICAgIHJldHVybiBwZm47CiAgICAg
aWYgKHBmbiA8IGRvbS0+cmFtYmFzZV9wZm4gfHwgcGZuID49IGRvbS0+cmFtYmFzZV9wZm4gKyBk
b20tPnRvdGFsX3BhZ2VzKQogICAgICAgICByZXR1cm4gSU5WQUxJRF9NRk47Ci0gICAgcmV0dXJu
IGRvbS0+cDJtX2hvc3RbcGZuIC0gZG9tLT5yYW1iYXNlX3Bmbl07CisgICAgcmV0dXJuIGRvbS0+
YXJjaF9ob29rcy0+cDJtX2hvc3QgPworICAgICAgICAgICAgZG9tLT5hcmNoX2hvb2tzLT5wMm1f
aG9zdChkb20sIHBmbiAtIGRvbS0+cmFtYmFzZV9wZm4pCisgICAgICAgICAgICA6IGRvbS0+cDJt
X2hvc3RbcGZuIC0gZG9tLT5yYW1iYXNlX3Bmbl07CiB9CiAKICNlbmRpZiAvKiBfWENfRE9NX0gg
Ki8KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX2RvbV9hcm0uYyBiL3Rvb2xzL2xpYnhjL3hj
X2RvbV9hcm0uYwppbmRleCA1YjllY2E2Li5iMTVjNmQyIDEwMDY0NAotLS0gYS90b29scy9saWJ4
Yy94Y19kb21fYXJtLmMKKysrIGIvdG9vbHMvbGlieGMveGNfZG9tX2FybS5jCkBAIC01NDcsNiAr
NTQ3LDcgQEAgc3RhdGljIHN0cnVjdCB4Y19kb21fYXJjaCB4Y19kb21fMzIgPSB7CiAgICAgLm1l
bWluaXQgPSBtZW1pbml0LAogICAgIC5ib290ZWFybHkgPSBib290ZWFybHksCiAgICAgLmJvb3Rs
YXRlID0gYm9vdGxhdGUsCisgICAgLnAybV9ob3N0ID0gTlVMTCwKIH07CiAKIHN0YXRpYyBzdHJ1
Y3QgeGNfZG9tX2FyY2ggeGNfZG9tXzY0ID0gewpAQCAtNTYzLDYgKzU2NCw3IEBAIHN0YXRpYyBz
dHJ1Y3QgeGNfZG9tX2FyY2ggeGNfZG9tXzY0ID0gewogICAgIC5tZW1pbml0ID0gbWVtaW5pdCwK
ICAgICAuYm9vdGVhcmx5ID0gYm9vdGVhcmx5LAogICAgIC5ib290bGF0ZSA9IGJvb3RsYXRlLAor
ICAgIC5wMm1faG9zdCA9IE5VTEwsCiB9OwogCiBzdGF0aWMgdm9pZCBfX2luaXQgcmVnaXN0ZXJf
YXJjaF9ob29rcyh2b2lkKQpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfZG9tX2NvcmUuYyBi
L3Rvb2xzL2xpYnhjL3hjX2RvbV9jb3JlLmMKaW5kZXggOWJkMDRjYi4uZjNlYWFlMyAxMDA2NDQK
LS0tIGEvdG9vbHMvbGlieGMveGNfZG9tX2NvcmUuYworKysgYi90b29scy9saWJ4Yy94Y19kb21f
Y29yZS5jCkBAIC05ODUsNyArOTg1LDkgQEAgaW50IHhjX2RvbV91cGRhdGVfZ3Vlc3RfcDJtKHN0
cnVjdCB4Y19kb21faW1hZ2UgKmRvbSkKICAgICAgICAgICAgICAgICAgIF9fRlVOQ1RJT05fXywg
ZG9tLT5wMm1fc2l6ZSk7CiAgICAgICAgIHAybV8zMiA9IGRvbS0+cDJtX2d1ZXN0OwogICAgICAg
ICBmb3IgKCBpID0gMDsgaSA8IGRvbS0+cDJtX3NpemU7IGkrKyApCi0gICAgICAgICAgICBpZiAo
IGRvbS0+cDJtX2hvc3RbaV0gIT0gSU5WQUxJRF9QRk4gKQorICAgICAgICAgICAgaWYgKCBkb20t
PmFyY2hfaG9va3MtPnAybV9ob3N0ICkKKyAgICAgICAgICAgICAgICBwMm1fMzJbaV0gPSBkb20t
PmFyY2hfaG9va3MtPnAybV9ob3N0KGRvbSwgaSk7CisgICAgICAgICAgICBlbHNlIGlmICggZG9t
LT5wMm1faG9zdFtpXSAhPSBJTlZBTElEX1BGTiApCiAgICAgICAgICAgICAgICAgcDJtXzMyW2ld
ID0gZG9tLT5wMm1faG9zdFtpXTsKICAgICAgICAgICAgIGVsc2UKICAgICAgICAgICAgICAgICBw
Mm1fMzJbaV0gPSAodWludDMyX3QpIC0gMTsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX2Rv
bV94ODYuYyBiL3Rvb2xzL2xpYnhjL3hjX2RvbV94ODYuYwppbmRleCAzYWI5MThjLi41OGY5ODk0
IDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19kb21feDg2LmMKKysrIGIvdG9vbHMvbGlieGMv
eGNfZG9tX3g4Ni5jCkBAIC0xMDEsNiArMTAxLDEwIEBAIHN0cnVjdCB4Y19kb21faW1hZ2VfeDg2
IHsKICNkZWZpbmUgTUFQUElOR19NQVggMgogICAgIHN0cnVjdCB4Y19kb21feDg2X21hcHBpbmcg
bWFwc1tNQVBQSU5HX01BWF07CiAgICAgc3RydWN0IHhjX2RvbV9wYXJhbXMgKnBhcmFtczsKKwor
ICAgIC8qIFVzZWQgdG8gZmFrZSB2bWVtcmFuZ2UgaW5mb3JtYXRpb24gaW4gY2FzZSB2TlVNQSBp
bmZvcm1hdGlvbiB3YXMgbm90IHByb3ZpZGVkLiAqLworICAgIHhlbl92bWVtcmFuZ2VfdCBkdW1t
eV92bWVtcmFuZ2VbMl07CisgICAgdW5zaWduZWQgaW50IG5yX2R1bW15X3ZtZW1yYW5nZXM7CiB9
OwogCiAvKiBnZXQgZ3Vlc3QgSU8gQUJJIHByb3RvY29sICovCkBAIC0xMjUyLDEzICsxMjU2LDEz
IEBAIHN0YXRpYyBpbnQgbWVtaW5pdF9odm0oc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQogICAg
IHVuc2lnbmVkIGludCBtZW1mbGFncyA9IDA7CiAgICAgaW50IGNsYWltX2VuYWJsZWQgPSBkb20t
PmNsYWltX2VuYWJsZWQ7CiAgICAgdWludDY0X3QgdG90YWxfcGFnZXM7Ci0gICAgeGVuX3ZtZW1y
YW5nZV90IGR1bW15X3ZtZW1yYW5nZVsyXTsKICAgICB1bnNpZ25lZCBpbnQgZHVtbXlfdm5vZGVf
dG9fcG5vZGVbMV07CiAgICAgeGVuX3ZtZW1yYW5nZV90ICp2bWVtcmFuZ2VzOwogICAgIHVuc2ln
bmVkIGludCAqdm5vZGVfdG9fcG5vZGU7CiAgICAgdW5zaWduZWQgaW50IG5yX3ZtZW1yYW5nZXMs
IG5yX3Zub2RlczsKICAgICB4Y19pbnRlcmZhY2UgKnhjaCA9IGRvbS0+eGNoOwogICAgIHVpbnQz
Ml90IGRvbWlkID0gZG9tLT5ndWVzdF9kb21pZDsKKyAgICBzdHJ1Y3QgeGNfZG9tX2ltYWdlX3g4
NiAqZG9teDg2ID0gZG9tLT5hcmNoX3ByaXZhdGU7CiAKICAgICBpZiAoIG5yX3BhZ2VzID4gdGFy
Z2V0X3BhZ2VzICkKICAgICAgICAgbWVtZmxhZ3MgfD0gWEVOTUVNRl9wb3B1bGF0ZV9vbl9kZW1h
bmQ7CkBAIC0xMjc0LDI1ICsxMjc4LDI2IEBAIHN0YXRpYyBpbnQgbWVtaW5pdF9odm0oc3RydWN0
IHhjX2RvbV9pbWFnZSAqZG9tKQogICAgICAgICAgKiBoYXMgbm8gZWZmZWN0IG9uIHRoZSBhY3R1
YWwgcmVzdWx0LgogICAgICAgICAgKi8KIAotICAgICAgICBkdW1teV92bWVtcmFuZ2VbMF0uc3Rh
cnQgPSAwOwotICAgICAgICBkdW1teV92bWVtcmFuZ2VbMF0uZW5kICAgPSBkb20tPmxvd21lbV9l
bmQ7Ci0gICAgICAgIGR1bW15X3ZtZW1yYW5nZVswXS5mbGFncyA9IDA7Ci0gICAgICAgIGR1bW15
X3ZtZW1yYW5nZVswXS5uaWQgICA9IDA7Ci0gICAgICAgIG5yX3ZtZW1yYW5nZXMgPSAxOworICAg
ICAgICBkb214ODYtPmR1bW15X3ZtZW1yYW5nZVswXS5zdGFydCA9IDA7CisgICAgICAgIGRvbXg4
Ni0+ZHVtbXlfdm1lbXJhbmdlWzBdLmVuZCAgID0gZG9tLT5sb3dtZW1fZW5kOworICAgICAgICBk
b214ODYtPmR1bW15X3ZtZW1yYW5nZVswXS5mbGFncyA9IDA7CisgICAgICAgIGRvbXg4Ni0+ZHVt
bXlfdm1lbXJhbmdlWzBdLm5pZCAgID0gMDsKKyAgICAgICAgZG9teDg2LT5ucl9kdW1teV92bWVt
cmFuZ2VzID0gMTsKIAogICAgICAgICBpZiAoIGRvbS0+aGlnaG1lbV9lbmQgPiAoMVVMTCA8PCAz
MikgKQogICAgICAgICB7Ci0gICAgICAgICAgICBkdW1teV92bWVtcmFuZ2VbMV0uc3RhcnQgPSAx
VUxMIDw8IDMyOwotICAgICAgICAgICAgZHVtbXlfdm1lbXJhbmdlWzFdLmVuZCAgID0gZG9tLT5o
aWdobWVtX2VuZDsKLSAgICAgICAgICAgIGR1bW15X3ZtZW1yYW5nZVsxXS5mbGFncyA9IDA7Ci0g
ICAgICAgICAgICBkdW1teV92bWVtcmFuZ2VbMV0ubmlkICAgPSAwOworICAgICAgICAgICAgZG9t
eDg2LT5kdW1teV92bWVtcmFuZ2VbMV0uc3RhcnQgPSAxVUxMIDw8IDMyOworICAgICAgICAgICAg
ZG9teDg2LT5kdW1teV92bWVtcmFuZ2VbMV0uZW5kICAgPSBkb20tPmhpZ2htZW1fZW5kOworICAg
ICAgICAgICAgZG9teDg2LT5kdW1teV92bWVtcmFuZ2VbMV0uZmxhZ3MgPSAwOworICAgICAgICAg
ICAgZG9teDg2LT5kdW1teV92bWVtcmFuZ2VbMV0ubmlkICAgPSAwOwogCi0gICAgICAgICAgICBu
cl92bWVtcmFuZ2VzKys7CisgICAgICAgICAgICBkb214ODYtPm5yX2R1bW15X3ZtZW1yYW5nZXMr
KzsKICAgICAgICAgfQogCiAgICAgICAgIGR1bW15X3Zub2RlX3RvX3Bub2RlWzBdID0gWENfTlVN
QV9OT19OT0RFOwogICAgICAgICBucl92bm9kZXMgPSAxOwotICAgICAgICB2bWVtcmFuZ2VzID0g
ZHVtbXlfdm1lbXJhbmdlOworICAgICAgICB2bWVtcmFuZ2VzID0gZG9teDg2LT5kdW1teV92bWVt
cmFuZ2U7CisgICAgICAgIG5yX3ZtZW1yYW5nZXMgPSBkb214ODYtPm5yX2R1bW15X3ZtZW1yYW5n
ZXM7CiAgICAgICAgIHZub2RlX3RvX3Bub2RlID0gZHVtbXlfdm5vZGVfdG9fcG5vZGU7CiAgICAg
fQogICAgIGVsc2UKQEAgLTEzMjksMjUgKzEzMzQsNiBAQCBzdGF0aWMgaW50IG1lbWluaXRfaHZt
KHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSkKICAgICB9CiAKICAgICBkb20tPnAybV9zaXplID0g
cDJtX3NpemU7Ci0gICAgZG9tLT5wMm1faG9zdCA9IHhjX2RvbV9tYWxsb2MoZG9tLCBzaXplb2Yo
eGVuX3Bmbl90KSAqCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvbS0+
cDJtX3NpemUpOwotICAgIGlmICggZG9tLT5wMm1faG9zdCA9PSBOVUxMICkKLSAgICB7Ci0gICAg
ICAgIERPTVBSSU5URigiQ291bGQgbm90IGFsbG9jYXRlIHAybSIpOwotICAgICAgICBnb3RvIGVy
cm9yX291dDsKLSAgICB9Ci0KLSAgICBmb3IgKCBpID0gMDsgaSA8IHAybV9zaXplOyBpKysgKQot
ICAgICAgICBkb20tPnAybV9ob3N0W2ldID0gKCh4ZW5fcGZuX3QpLTEpOwotICAgIGZvciAoIHZt
ZW1pZCA9IDA7IHZtZW1pZCA8IG5yX3ZtZW1yYW5nZXM7IHZtZW1pZCsrICkKLSAgICB7Ci0gICAg
ICAgIHVpbnQ2NF90IHBmbjsKLQotICAgICAgICBmb3IgKCBwZm4gPSB2bWVtcmFuZ2VzW3ZtZW1p
ZF0uc3RhcnQgPj4gUEFHRV9TSElGVDsKLSAgICAgICAgICAgICAgcGZuIDwgdm1lbXJhbmdlc1t2
bWVtaWRdLmVuZCA+PiBQQUdFX1NISUZUOwotICAgICAgICAgICAgICBwZm4rKyApCi0gICAgICAg
ICAgICBkb20tPnAybV9ob3N0W3Bmbl0gPSBwZm47Ci0gICAgfQogCiAgICAgLyoKICAgICAgKiBU
cnkgdG8gY2xhaW0gcGFnZXMgZm9yIGVhcmx5IHdhcm5pbmcgb2YgaW5zdWZmaWNpZW50IG1lbW9y
eSBhdmFpbGFibGUuCkBAIC0xMzk1LDggKzEzODEsMTIgQEAgc3RhdGljIGludCBtZW1pbml0X2h2
bShzdHJ1Y3QgeGNfZG9tX2ltYWdlICpkb20pCiAgICAgICovCiAgICAgaWYgKCBkb20tPmRldmlj
ZV9tb2RlbCApCiAgICAgeworICAgICAgICB4ZW5fcGZuX3QgcGZuX2JhdGNoWzB4YTBdOworICAg
ICAgICBmb3IgKCBpID0gMDsgaSA8IDB4YTA7IGkrKyApCisgICAgICAgICAgICBwZm5fYmF0Y2hb
aV0gPSBkb20tPmFyY2hfaG9va3MtPnAybV9ob3N0KGRvbSwgaSk7CisKICAgICAgICAgcmMgPSB4
Y19kb21haW5fcG9wdWxhdGVfcGh5c21hcF9leGFjdCgKLSAgICAgICAgICAgIHhjaCwgZG9taWQs
IDB4YTAsIDAsIG1lbWZsYWdzLCAmZG9tLT5wMm1faG9zdFsweDAwXSk7CisgICAgICAgICAgICB4
Y2gsIGRvbWlkLCAweGEwLCAwLCBtZW1mbGFncywgJnBmbl9iYXRjaFsweDAwXSk7CiAgICAgICAg
IGlmICggcmMgIT0gMCApCiAgICAgICAgIHsKICAgICAgICAgICAgIERPTVBSSU5URigiQ291bGQg
bm90IHBvcHVsYXRlIGxvdyBtZW1vcnkgKDwgMHhBMCkuXG4iKTsKQEAgLTE0MzksNyArMTQyOSw3
IEBAIHN0YXRpYyBpbnQgbWVtaW5pdF9odm0oc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQogICAg
ICAgICAgICAgaWYgKCBjb3VudCA+IG1heF9wYWdlcyApCiAgICAgICAgICAgICAgICAgY291bnQg
PSBtYXhfcGFnZXM7CiAKLSAgICAgICAgICAgIGN1cl9wZm4gPSBkb20tPnAybV9ob3N0W2N1cl9w
YWdlc107CisgICAgICAgICAgICBjdXJfcGZuID0gZG9tLT5hcmNoX2hvb2tzLT5wMm1faG9zdChk
b20sIGN1cl9wYWdlcyk7CiAKICAgICAgICAgICAgIC8qIFRha2UgY2FyZSB0aGUgY29ybmVyIGNh
c2VzIG9mIHN1cGVyIHBhZ2UgdGFpbHMgKi8KICAgICAgICAgICAgIGlmICggKChjdXJfcGZuICYg
KFNVUEVSUEFHRV8xR0JfTlJfUEZOUy0xKSkgIT0gMCkgJiYKQEAgLTE0NjUsOCArMTQ1NSw3IEBA
IHN0YXRpYyBpbnQgbWVtaW5pdF9odm0oc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQogICAgICAg
ICAgICAgICAgIHhlbl9wZm5fdCBzcF9leHRlbnRzW25yX2V4dGVudHNdOwogCiAgICAgICAgICAg
ICAgICAgZm9yICggaSA9IDA7IGkgPCBucl9leHRlbnRzOyBpKysgKQotICAgICAgICAgICAgICAg
ICAgICBzcF9leHRlbnRzW2ldID0KLSAgICAgICAgICAgICAgICAgICAgICAgIGRvbS0+cDJtX2hv
c3RbY3VyX3BhZ2VzKyhpPDxTVVBFUlBBR0VfMUdCX1NISUZUKV07CisgICAgICAgICAgICAgICAg
ICAgIHNwX2V4dGVudHNbaV0gPSBkb20tPmFyY2hfaG9va3MtPnAybV9ob3N0KGRvbSwgY3VyX3Bh
Z2VzKyhpPDxTVVBFUlBBR0VfMUdCX1NISUZUKSk7CiAKICAgICAgICAgICAgICAgICBkb25lID0g
eGNfZG9tYWluX3BvcHVsYXRlX3BoeXNtYXAoeGNoLCBkb21pZCwgbnJfZXh0ZW50cywKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1VQRVJQQUdFXzFH
Ql9TSElGVCwKQEAgLTE1MDUsOCArMTQ5NCw3IEBAIHN0YXRpYyBpbnQgbWVtaW5pdF9odm0oc3Ry
dWN0IHhjX2RvbV9pbWFnZSAqZG9tKQogICAgICAgICAgICAgICAgICAgICB4ZW5fcGZuX3Qgc3Bf
ZXh0ZW50c1tucl9leHRlbnRzXTsKIAogICAgICAgICAgICAgICAgICAgICBmb3IgKCBpID0gMDsg
aSA8IG5yX2V4dGVudHM7IGkrKyApCi0gICAgICAgICAgICAgICAgICAgICAgICBzcF9leHRlbnRz
W2ldID0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBkb20tPnAybV9ob3N0W2N1cl9wYWdl
cysoaTw8U1VQRVJQQUdFXzJNQl9TSElGVCldOworICAgICAgICAgICAgICAgICAgICAgICAgc3Bf
ZXh0ZW50c1tpXSA9IGRvbS0+YXJjaF9ob29rcy0+cDJtX2hvc3QoZG9tLCBjdXJfcGFnZXMrKGk8
PFNVUEVSUEFHRV8yTUJfU0hJRlQpKTsKIAogICAgICAgICAgICAgICAgICAgICBkb25lID0geGNf
ZG9tYWluX3BvcHVsYXRlX3BoeXNtYXAoeGNoLCBkb21pZCwgbnJfZXh0ZW50cywKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNVUEVSUEFHRV8y
TUJfU0hJRlQsCkBAIC0xNTIxLDE0ICsxNTA5LDM5IEBAIHN0YXRpYyBpbnQgbWVtaW5pdF9odm0o
c3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQogICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAg
ICAgICAgICAgfQogICAgICAgICAgICAgfQotCiAgICAgICAgICAgICAvKiBGYWxsIGJhY2sgdG8g
NGtCIGV4dGVudHMuICovCiAgICAgICAgICAgICBpZiAoIGNvdW50ICE9IDAgKQogICAgICAgICAg
ICAgewotICAgICAgICAgICAgICAgIHJjID0geGNfZG9tYWluX3BvcHVsYXRlX3BoeXNtYXBfZXhh
Y3QoCi0gICAgICAgICAgICAgICAgICAgIHhjaCwgZG9taWQsIGNvdW50LCAwLCBuZXdfbWVtZmxh
Z3MsICZkb20tPnAybV9ob3N0W2N1cl9wYWdlc10pOwotICAgICAgICAgICAgICAgIGN1cl9wYWdl
cyArPSBjb3VudDsKLSAgICAgICAgICAgICAgICBzdGF0X25vcm1hbF9wYWdlcyArPSBjb3VudDsK
KyAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG5yX2V4dGVudHM7CisgICAgICAgICAgICAg
ICAgeGVuX3Bmbl90ICpwZm5fYmF0Y2g7CisKKyAgICAgICAgICAgICAgICBwZm5fYmF0Y2ggPSBj
YWxsb2MoU1VQRVJQQUdFXzFHQl9OUl9QRk5TLCBzaXplb2YoKnBmbl9iYXRjaCkpOworICAgICAg
ICAgICAgICAgIGlmICAoICFwZm5fYmF0Y2ggKSB7CisgICAgICAgICAgICAgICAgICAgIERPTVBS
SU5URigiQ291bGQgbm90IGFsbG9jYXRlIG1lbW9yeSB0byBjb25zdHJ1Y3QgcGh5c21hcCBiYXRj
aC4iKTsKKyAgICAgICAgICAgICAgICAgICAgcmMgPSAtMTsKKyAgICAgICAgICAgICAgICAgICAg
Z290byBlcnJvcl9vdXQ7CisgICAgICAgICAgICAgICAgfQorCisgICAgICAgICAgICAgICAgd2hp
bGUgKCBjb3VudCA+IDAgKSB7CisgICAgICAgICAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwg
Y291bnQgJiYgaSA8IFNVUEVSUEFHRV8xR0JfTlJfUEZOUzsgaSsrKQorICAgICAgICAgICAgICAg
ICAgICAgICAgcGZuX2JhdGNoW2ldID0gZG9tLT5hcmNoX2hvb2tzLT5wMm1faG9zdChkb20sIGN1
cl9wYWdlcytpKTsKKworICAgICAgICAgICAgICAgICAgICBucl9leHRlbnRzID0gY291bnQgPiBT
VVBFUlBBR0VfMUdCX05SX1BGTlMgPyBTVVBFUlBBR0VfMUdCX05SX1BGTlMgOiBjb3VudDsKKyAg
ICAgICAgICAgICAgICAgICAgcmMgPSB4Y19kb21haW5fcG9wdWxhdGVfcGh5c21hcF9leGFjdCh4
Y2gsIGRvbWlkLCBucl9leHRlbnRzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgMCwgbmV3X21lbWZsYWdzLCAmcGZuX2JhdGNoWzBdKTsKKyAg
ICAgICAgICAgICAgICAgICAgaWYgKCByYyAhPSAwICkgeworICAgICAgICAgICAgICAgICAgICAg
ICAgRE9NUFJJTlRGKCJDb3VsZCBub3QgcG9wdWxhdGUgcGh5c21hcCBiYXRjaC4iKTsKKyAgICAg
ICAgICAgICAgICAgICAgICAgIGZyZWUocGZuX2JhdGNoKTsKKyAgICAgICAgICAgICAgICAgICAg
ICAgIHJjID0gLTE7CisgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycm9yX291dDsKKyAg
ICAgICAgICAgICAgICAgICAgfQorCisgICAgICAgICAgICAgICAgICAgIHN0YXRfbm9ybWFsX3Bh
Z2VzICs9IG5yX2V4dGVudHM7CisgICAgICAgICAgICAgICAgICAgIGN1cl9wYWdlcyArPSBucl9l
eHRlbnRzOworICAgICAgICAgICAgICAgICAgICBjb3VudCAtPSBucl9leHRlbnRzOworICAgICAg
ICAgICAgICAgIH0KKworICAgICAgICAgICAgICAgIGZyZWUocGZuX2JhdGNoKTsKICAgICAgICAg
ICAgIH0KICAgICAgICAgfQogCkBAIC0xNzgwLDYgKzE3OTMsMzEgQEAgc3RhdGljIGludCBib290
bGF0ZV9odm0oc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQogICAgIHJldHVybiAwOwogfQogCitz
dGF0aWMgeGVuX3Bmbl90IHAybV9ob3N0X2h2bShzdHJ1Y3QgeGNfZG9tX2ltYWdlICpkb20sIHVu
c2lnbmVkIGxvbmcgaWR4KQoreworICAgIHN0cnVjdCB4Y19kb21faW1hZ2VfeDg2ICpkb214ODYg
PSBkb20tPmFyY2hfcHJpdmF0ZTsKKyAgICB4ZW5fdm1lbXJhbmdlX3QgKnZtZW1yYW5nZXM7Cisg
ICAgdW5zaWduZWQgaW50IG5yX3ZtZW1yYW5nZXM7CisgICAgaW50IHZtZW1pZDsKKworICAgIGlm
ICggZG9tLT5ucl92bWVtcmFuZ2VzICkgeworICAgICAgICB2bWVtcmFuZ2VzID0gZG9tLT52bWVt
cmFuZ2VzOworICAgICAgICBucl92bWVtcmFuZ2VzID0gZG9tLT5ucl92bWVtcmFuZ2VzOworICAg
IH0gZWxzZSB7CisgICAgICAgIHZtZW1yYW5nZXMgPSBkb214ODYtPmR1bW15X3ZtZW1yYW5nZTsK
KyAgICAgICAgbnJfdm1lbXJhbmdlcyA9IGRvbXg4Ni0+bnJfZHVtbXlfdm1lbXJhbmdlczsKKyAg
ICB9CisKKyAgICBmb3IgKCB2bWVtaWQgPSAwOyB2bWVtaWQgPCBucl92bWVtcmFuZ2VzIDsgdm1l
bWlkKysgKSB7CisgICAgICAgIGlmICggaWR4ID49ICh2bWVtcmFuZ2VzW3ZtZW1pZF0uc3RhcnQg
Pj4gWENfRE9NX1BBR0VfU0hJRlQoZG9tKSkKKyAgICAgICAgICAgICAmJiBpZHggPCAodm1lbXJh
bmdlc1t2bWVtaWRdLmVuZCA+PiBYQ19ET01fUEFHRV9TSElGVChkb20pKSApIHsKKyAgICAgICAg
ICAgIHJldHVybiBpZHg7CisgICAgICAgIH0KKyAgICB9CisKKyAgICByZXR1cm4gKCh4ZW5fcGZu
X3QpLTEpOworfQorCiBib29sIHhjX2RvbV90cmFuc2xhdGVkKGNvbnN0IHN0cnVjdCB4Y19kb21f
aW1hZ2UgKmRvbSkKIHsKICAgICAvKiBIVk0gZ3Vlc3RzIGFyZSB0cmFuc2xhdGVkLiAgUFYgZ3Vl
c3RzIGFyZSBub3QuICovCkBAIC0xODA1LDYgKzE4NDMsNyBAQCBzdGF0aWMgc3RydWN0IHhjX2Rv
bV9hcmNoIHhjX2RvbV8zMl9wYWUgPSB7CiAgICAgLm1lbWluaXQgPSBtZW1pbml0X3B2LAogICAg
IC5ib290ZWFybHkgPSBib290ZWFybHksCiAgICAgLmJvb3RsYXRlID0gYm9vdGxhdGVfcHYsCisg
ICAgLnAybV9ob3N0ID0gTlVMTCwKIH07CiAKIHN0YXRpYyBzdHJ1Y3QgeGNfZG9tX2FyY2ggeGNf
ZG9tXzY0ID0gewpAQCAtMTgyNCw2ICsxODYzLDcgQEAgc3RhdGljIHN0cnVjdCB4Y19kb21fYXJj
aCB4Y19kb21fNjQgPSB7CiAgICAgLm1lbWluaXQgPSBtZW1pbml0X3B2LAogICAgIC5ib290ZWFy
bHkgPSBib290ZWFybHksCiAgICAgLmJvb3RsYXRlID0gYm9vdGxhdGVfcHYsCisgICAgLnAybV9o
b3N0ID0gTlVMTCwKIH07CiAKIHN0YXRpYyBzdHJ1Y3QgeGNfZG9tX2FyY2ggeGNfaHZtXzMyID0g
ewpAQCAtMTgzMSw2ICsxODcxLDcgQEAgc3RhdGljIHN0cnVjdCB4Y19kb21fYXJjaCB4Y19odm1f
MzIgPSB7CiAgICAgLm5hdGl2ZV9wcm90b2NvbCA9IFhFTl9JT19QUk9UT19BQklfWDg2XzMyLAog
ICAgIC5wYWdlX3NoaWZ0ID0gUEFHRV9TSElGVF9YODYsCiAgICAgLnNpemVvZl9wZm4gPSA0LAor
ICAgIC5hcmNoX3ByaXZhdGVfc2l6ZSA9IHNpemVvZihzdHJ1Y3QgeGNfZG9tX2ltYWdlX3g4Niks
CiAgICAgLmFsbG9jX21hZ2ljX3BhZ2VzID0gYWxsb2NfbWFnaWNfcGFnZXNfaHZtLAogICAgIC5h
bGxvY19wZ3RhYmxlcyA9IGFsbG9jX3BndGFibGVzX2h2bSwKICAgICAuc2V0dXBfcGd0YWJsZXMg
PSBOVUxMLApAQCAtMTg0MCw2ICsxODgxLDcgQEAgc3RhdGljIHN0cnVjdCB4Y19kb21fYXJjaCB4
Y19odm1fMzIgPSB7CiAgICAgLm1lbWluaXQgPSBtZW1pbml0X2h2bSwKICAgICAuYm9vdGVhcmx5
ID0gYm9vdGVhcmx5LAogICAgIC5ib290bGF0ZSA9IGJvb3RsYXRlX2h2bSwKKyAgICAucDJtX2hv
c3QgPSBwMm1faG9zdF9odm0sCiB9OwogCiBzdGF0aWMgdm9pZCBfX2luaXQgcmVnaXN0ZXJfYXJj
aF9ob29rcyh2b2lkKQotLSAKMi43LjQKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2Vy
bWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6
IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dl
cmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3Qt
SUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
