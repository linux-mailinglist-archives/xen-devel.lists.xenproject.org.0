Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BBDB0358
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 20:03:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i86u4-0000Fi-M7; Wed, 11 Sep 2019 17:59:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oCsH=XG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i86u3-0000Fa-Gc
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 17:59:39 +0000
X-Inumbo-ID: eb87bd42-d4bd-11e9-b76c-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb87bd42-d4bd-11e9-b76c-bc764e2007e4;
 Wed, 11 Sep 2019 17:59:38 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l11so17188586lfk.6
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2019 10:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5C95kf9c0fiXXe9eHC4b3N15laYfsWrjL1Mm0/xpy9o=;
 b=D8oXZg4JRXEH+3wLUmFuEvsO+H3SkWsssJ799qsoqqzKlN+pDBDHy8x60MTObIYoM+
 u4+z7PY6GSaWSl7D0aDDkR60K6ktksA4ul1idlUnEr4MU4KHA+A4Wy7XP+ceByMkv1vk
 XXIC1P/CQCvhJpt1Yk1dZqEzfqslFZxnPbRnQPTbADgOpv+XcHSsKgnHOMpSNDlO91r0
 yEdJr2z4VELHsTqJuxhwvNE87CpTaPUWVuycM968cdrAAkxJ62xVMsXVpyoqbOTyr66n
 x2hvRwx5w7EKjFJgwcUShRPvNm0sq0HNNvums8wtzDHGCovFkiuZkKZsn8OIt15rnK1C
 J4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5C95kf9c0fiXXe9eHC4b3N15laYfsWrjL1Mm0/xpy9o=;
 b=LWCyGUrlsdnQOQaXbKgnHdCt6Zic0JDh6KmD9NSRzxUdLHihZ0Giyyo4y3OMQ8XquF
 6VJLK18VJuZy5asR7hkyiLe04kUpmoEXLLzKAG4EyJneRvP59SbjSJsMki9smGN4WSVo
 f9c1k+3tb/hK0QqF2FA7FBE5qB++HFBQDf4wRKRna9Ca0rHCgK8uUtnMOI9J1eu/teQq
 Dtunnu/JKiq3Q8VeECZCcUJgpDt/5MmMv4/7qnPnjOOsZHA0M27vc6ZrDMHnU+e1qVbX
 5HU9QsmHqf9oVjFDohpkc2XQLEPlqRMm4B4hyNF4wOR6hctvq10btGB7z08hI7SG3gY0
 Z6Aw==
X-Gm-Message-State: APjAAAVsPvYXz1ToWJlZpgoFhI8PeE4WRuQo02bvTrfPwLGAiSxSPUBI
 Kpqq9w0qanz7ZchzDNvszB3/LBy9
X-Google-Smtp-Source: APXvYqw//SwD3HVJns5qGXd44qI/1SMIOvkaY54K++FAAdkxlJq9zlFIXW2d1zwXvAjEErzKcKyJNw==
X-Received: by 2002:ac2:44b9:: with SMTP id c25mr26248817lfm.112.1568224776981; 
 Wed, 11 Sep 2019 10:59:36 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id u1sm5294335lfi.83.2019.09.11.10.59.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Sep 2019 10:59:36 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 11 Sep 2019 20:59:30 +0300
Message-Id: <1568224770-25402-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [RFC PATCH V3] xen/arm: Restrict "p2m_ipa_bits"
 according to the IOMMU requirements
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhlcmUgaXMgYSBzdHJpY3QgcmVxdWlyZW1lbnQgZm9yIHRoZSBJT01NVSB3aGljaCB3YW50
cyB0byBzaGFyZQp0aGUgUDJNIHRhYmxlIHdpdGggdGhlIENQVS4gVGhlIElPTU1VJ3MgU3RhZ2Ut
MiBpbnB1dCBzaXplIG11c3QgYmUgZXF1YWwKdG8gdGhlIFAyTSBJUEEgc2l6ZS4gSXQgaXMgbm90
IGEgcHJvYmxlbSB3aGVuIHRoZSBJT01NVSBjYW4gc3VwcG9ydAphbGwgdmFsdWVzIHRoZSBDUFUg
c3VwcG9ydHMuIEluIHRoYXQgY2FzZSwgdGhlIElPTU1VIGRyaXZlciB3b3VsZCBqdXN0CnVzZSBh
bnkgInAybV9pcGFfYml0cyIgdmFsdWUgYXMgaXMuIEJ1dCwgdGhlcmUgYXJlIGNhc2VzIHdoZW4g
bm90LgoKSW4gb3JkZXIgdG8gbWFrZSBQMk0gc2hhcmluZyBwb3NzaWJsZSBvbiB0aGUgcGxhdGZv
cm1zIHdoaWNoCklPTU1VcyBoYXZlIGEgbGltaXRhdGlvbiBpbiBtYXhpbXVtIFN0YWdlLTIgaW5w
dXQgc2l6ZSBpbnRyb2R1Y2UKdGhlIGZvbGxvd2luZyBsb2dpYy4KCkZpcnN0IGluaXRpYWxpemUg
dGhlIElPTU1VIHN1YnN5c3RlbSBhbmQgZ2F0aGVyIHJlcXVpcmVtZW50cyByZWdhcmRpbmcKdGhl
IG1heGltdW0gSVBBIGJpdHMgc3VwcG9ydGVkIGJ5IGVhY2ggSU9NTVUgZGV2aWNlIHRvIGZpZ3Vy
ZSBvdXQKdGhlIG1pbmltdW0gdmFsdWUgYW1vbmcgdGhlbS4gSW4gdGhlIFAyTSBjb2RlLCB0YWtl
IGludG8gdGhlIGFjY291bnQKdGhlIElPTU1VIHJlcXVpcmVtZW50cyBhbmQgY2hvb3NlIHN1aXRh
YmxlICJwYV9yYW5nZSIgYWNjb3JkaW5nCnRvIHRoZSByZXN0cmljdGVkICJwMm1faXBhX2JpdHMi
LgoKU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hl
bmtvQGVwYW0uY29tPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0t
LQpTdGlsbCBSRkM6CgoxLiBQYXRjaCBhc3N1bWVzIHRoYXQgSVBNTVUgc3VwcG9ydCBpcyBhbHJl
YWR5IGluLgoyLiBOb3QgY2hlY2tlZCBmb3IgdGhlIFNNTVUuCgpDaGFuZ2VzIFJGQyBWMiBbMl0g
LT4gUkZDIFYzOgogICAtIENoZWNrIGluIHNldHVwX3ZpcnRfcGFnaW5nKCkgdGhhdCB0aGUgInJl
c3RyaWN0ZWQiCiAgICAgUDJNIElQQSBzaXplIGlzIGF0IGxlYXN0IDQwLWJpdAogICAtIE1vZGlm
eSBsb2dpYyBpbiBzZXR1cF92aXJ0X3BhZ2luZygpIGEgYml0IHRvIG1ha2UgaXQKICAgICAiSU9N
TVUtYWdub3N0aWMiCiAgIC0gQ2xhcmlmeSBjb21tZW50cyBpbiBjb2RlLCBhZGQgc29tZSBleHBs
YW5hdGlvbnMKICAgLSBBdm9pZCB1c2luZyB0aGUgdGVybSAiSU9NTVUiIGluIFAyTSBjb2RlIHdo
ZXJlIHBvc3NpYmxlCgpDaGFuZ2VzIFJGQyBWMSBbMV0gLT4gUkZDIFYyIFsyXToKICAgLSBEb24n
dCB1cGRhdGUgcDJtX2lwYV9iaXRzIGJ5IHRoZSBJT01NVSBkcml2ZXJzIGRpcmVjdGx5LAogICAg
IGludHJvZHVjZSBwMm1fcmVzdHJpY3RfaXBhX2JpdHMoKQogICAtIENsYXJpZnkgcGF0Y2ggc3Vi
amVjdC9kZXNjcmlwdGlvbgogICAtIEFkZCBtb3JlIGNvbW1lbnRzIHRvIGNvZGUKICAgLSBDaGVj
ayBmb3IgZXF1aXZhbGVudCAicGFiaXRzIiBpbiBzZXR1cF92aXJ0X3BhZ2luZygpCiAgIC0gUmVt
b3ZlIEFTU0VSVHMgZnJvbSB0aGUgU01NVSBhbmQgSVBNTVUgZHJpdmVycwoKWzFdIGh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wOC9tc2cw
MjA3OC5odG1sClsyXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwv
eGVuLWRldmVsLzIwMTktMDgvbXNnMDIyMzcuaHRtbAotLS0KIHhlbi9hcmNoL2FybS9wMm0uYyAg
ICAgICAgICAgICAgICAgICAgICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LQogeGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICAgICAgICAgICAgICAgICB8ICA5ICsrKysrLS0K
IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMgfCAxOCArKy0tLS0tLS0t
LS0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYyAgICAgICB8IDExICsrKy0t
LS0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9wMm0uaCAgICAgICAgICAgICAgICB8ICA5ICsrKysr
KysKIDUgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3AybS5jIGIveGVuL2FyY2gvYXJtL3AybS5jCmluZGV4
IDIzNzRlOTIuLmQ1ZTI1MzkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9wMm0uYworKysgYi94
ZW4vYXJjaC9hcm0vcDJtLmMKQEAgLTM0LDcgKzM0LDExIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQg
X19yZWFkX21vc3RseSBtYXhfdm1pZCA9IE1BWF9WTUlEXzhfQklUOwogCiAjZGVmaW5lIFAyTV9S
T09UX1BBR0VTICAgICgxPDxQMk1fUk9PVF9PUkRFUikKIAotdW5zaWduZWQgaW50IF9fcmVhZF9t
b3N0bHkgcDJtX2lwYV9iaXRzOworLyoKKyAqIFNldCBsYXJnZXIgdGhhbiBhbnkgcG9zc2libGUg
dmFsdWUsIHNvIHRoZSBudW1iZXIgb2YgSVBBIGJpdHMgY2FuIGJlCisgKiByZXN0cmljdGVkIGJ5
IGV4dGVybmFsIGVudGl0eSAoZS5nLiBJT01NVSkuCisgKi8KK3Vuc2lnbmVkIGludCBfX3JlYWRf
bW9zdGx5IHAybV9pcGFfYml0cyA9IDY0OwogCiAvKiBIZWxwZXJzIHRvIGxvb2t1cCB0aGUgcHJv
cGVydGllcyBvZiBlYWNoIGxldmVsICovCiBzdGF0aWMgY29uc3QgcGFkZHJfdCBsZXZlbF9tYXNr
c1tdID0KQEAgLTE5MTIsNiArMTkxNiwxNiBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpnZXRfcGFnZV9m
cm9tX2d2YShzdHJ1Y3QgdmNwdSAqdiwgdmFkZHJfdCB2YSwKICAgICByZXR1cm4gcGFnZTsKIH0K
IAordm9pZCBfX2luaXQgcDJtX3Jlc3RyaWN0X2lwYV9iaXRzKHVuc2lnbmVkIGludCBpcGFfYml0
cykKK3sKKyAgICAvKgorICAgICAqIENhbGN1bGF0ZSB0aGUgbWluaW11bSBvZiB0aGUgbWF4aW11
bSBJUEEgYml0cyB0aGF0IGFueSBleHRlcm5hbCBlbnRpdHkKKyAgICAgKiBjYW4gc3VwcG9ydC4K
KyAgICAgKi8KKyAgICBpZiAoIGlwYV9iaXRzIDwgcDJtX2lwYV9iaXRzICkKKyAgICAgICAgcDJt
X2lwYV9iaXRzID0gaXBhX2JpdHM7Cit9CisKIC8qIFZUQ1IgdmFsdWUgdG8gYmUgY29uZmlndXJl
ZCBieSBhbGwgQ1BVcy4gU2V0IG9ubHkgb25jZSBieSB0aGUgYm9vdCBDUFUgKi8KIHN0YXRpYyB1
aW50MzJfdCBfX3JlYWRfbW9zdGx5IHZ0Y3I7CiAKQEAgLTE5NjYsMTUgKzE5ODAsMjQgQEAgdm9p
ZCBfX2luaXQgc2V0dXBfdmlydF9wYWdpbmcodm9pZCkKICAgICAgICAgWzddID0geyAwIH0gIC8q
IEludmFsaWQgKi8KICAgICB9OwogCi0gICAgdW5zaWduZWQgaW50IGNwdTsKKyAgICB1bnNpZ25l
ZCBpbnQgaSwgY3B1OwogICAgIHVuc2lnbmVkIGludCBwYV9yYW5nZSA9IDB4MTA7IC8qIExhcmdl
ciB0aGFuIGFueSBwb3NzaWJsZSB2YWx1ZSAqLwogICAgIGJvb2wgdm1pZF84X2JpdCA9IGZhbHNl
OwogCisgICAgaWYgKCBwMm1faXBhX2JpdHMgPCA0MCApCisgICAgICAgIHBhbmljKCJQMk0gSVBB
IHNpemUgbXVzdCBiZSBhdCBsZWFzdCA0MC1iaXQgKHAybV9pcGFfYml0cz0ldSlcbiIsCisgICAg
ICAgICAgICAgIHAybV9pcGFfYml0cyk7CisKICAgICBmb3JfZWFjaF9vbmxpbmVfY3B1ICggY3B1
ICkKICAgICB7CiAgICAgICAgIGNvbnN0IHN0cnVjdCBjcHVpbmZvX2FybSAqaW5mbyA9ICZjcHVf
ZGF0YVtjcHVdOwotICAgICAgICBpZiAoIGluZm8tPm1tNjQucGFfcmFuZ2UgPCBwYV9yYW5nZSAp
Ci0gICAgICAgICAgICBwYV9yYW5nZSA9IGluZm8tPm1tNjQucGFfcmFuZ2U7CisKKyAgICAgICAg
LyoKKyAgICAgICAgICogUmVzdHJpY3QgInAybV9pcGFfYml0cyIgaWYgbmVlZGVkLiBBcyBQMk0g
dGFibGUgaXMgYWx3YXlzIGNvbmZpZ3VyZWQKKyAgICAgICAgICogd2l0aCBJUEEgYml0cyA9PSBQ
QSBiaXRzLCBjb21wYXJlIGFnYWluc3QgInBhYml0cyIuCisgICAgICAgICAqLworICAgICAgICBp
ZiAoIHBhX3JhbmdlX2luZm9baW5mby0+bW02NC5wYV9yYW5nZV0ucGFiaXRzIDwgcDJtX2lwYV9i
aXRzICkKKyAgICAgICAgICAgIHAybV9pcGFfYml0cyA9IHBhX3JhbmdlX2luZm9baW5mby0+bW02
NC5wYV9yYW5nZV0ucGFiaXRzOwogCiAgICAgICAgIC8qIFNldCBhIGZsYWcgaWYgdGhlIGN1cnJl
bnQgY3B1IGRvZXMgbm90IHN1cHBvcnQgMTYgYml0IFZNSURzLiAqLwogICAgICAgICBpZiAoIGlu
Zm8tPm1tNjQudm1pZF9iaXRzICE9IE1NNjRfVk1JRF8xNl9CSVRTX1NVUFBPUlQgKQpAQCAtMTk4
OCw2ICsyMDExLDE2IEBAIHZvaWQgX19pbml0IHNldHVwX3ZpcnRfcGFnaW5nKHZvaWQpCiAgICAg
aWYgKCAhdm1pZF84X2JpdCApCiAgICAgICAgIG1heF92bWlkID0gTUFYX1ZNSURfMTZfQklUOwog
CisgICAgLyogQ2hvb3NlIHN1aXRhYmxlICJwYV9yYW5nZSIgYWNjb3JkaW5nIHRvIHRoZSByZXN1
bHRlZCAicDJtX2lwYV9iaXRzIi4gKi8KKyAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUo
cGFfcmFuZ2VfaW5mbyk7IGkrKyApCisgICAgeworICAgICAgICBpZiAoIHAybV9pcGFfYml0cyA9
PSBwYV9yYW5nZV9pbmZvW2ldLnBhYml0cyApCisgICAgICAgIHsKKyAgICAgICAgICAgIHBhX3Jh
bmdlID0gaTsKKyAgICAgICAgICAgIGJyZWFrOworICAgICAgICB9CisgICAgfQorCiAgICAgLyog
cGFfcmFuZ2UgaXMgNCBiaXRzLCBidXQgdGhlIGRlZmluZWQgZW5jb2RpbmdzIGFyZSBvbmx5IDMg
Yml0cyAqLwogICAgIGlmICggcGFfcmFuZ2UgPj0gQVJSQVlfU0laRShwYV9yYW5nZV9pbmZvKSB8
fCAhcGFfcmFuZ2VfaW5mb1twYV9yYW5nZV0ucGFiaXRzICkKICAgICAgICAgcGFuaWMoIlVua25v
d24gZW5jb2Rpbmcgb2YgSURfQUE2NE1NRlIwX0VMMS5QQVJhbmdlICV4XG4iLCBwYV9yYW5nZSk7
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5j
CmluZGV4IDUxYTY2NzcuLjBlNjI4YmMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5j
CisrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCkBAIC05MzYsMTIgKzkzNiwxNyBAQCB2b2lkIF9f
aW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0LAogICAgIHByaW50
aygiQnJvdWdodCB1cCAlbGQgQ1BVc1xuIiwgKGxvbmcpbnVtX29ubGluZV9jcHVzKCkpOwogICAg
IC8qIFRPRE86IHNtcF9jcHVzX2RvbmUoKTsgKi8KIAotICAgIHNldHVwX3ZpcnRfcGFnaW5nKCk7
Ci0KKyAgICAvKgorICAgICAqIFRoZSBJT01NVSBzdWJzeXN0ZW0gbXVzdCBiZSBpbml0aWFsaXpl
ZCBiZWZvcmUgUDJNIGFzIHdlIG5lZWQKKyAgICAgKiB0byBnYXRoZXIgcmVxdWlyZW1lbnRzIHJl
Z2FyZGluZyB0aGUgbWF4aW11bSBJUEEgYml0cyBzdXBwb3J0ZWQgYnkKKyAgICAgKiBlYWNoIElP
TU1VIGRldmljZS4KKyAgICAgKi8KICAgICByYyA9IGlvbW11X3NldHVwKCk7CiAgICAgaWYgKCAh
aW9tbXVfZW5hYmxlZCAmJiByYyAhPSAtRU5PREVWICkKICAgICAgICAgcGFuaWMoIkNvdWxkbid0
IGNvbmZpZ3VyZSBjb3JyZWN0bHkgYWxsIHRoZSBJT01NVXMuIik7CiAKKyAgICBzZXR1cF92aXJ0
X3BhZ2luZygpOworCiAgICAgZG9faW5pdGNhbGxzKCk7CiAKICAgICAvKgpkaWZmIC0tZ2l0IGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMKaW5kZXggZWEyOWU5MS4uZWZiZGEzOSAxMDA2NDQK
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYworKysgYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jCkBAIC04NDQsMjIgKzg0NCw4IEBA
IHN0YXRpYyBpbnQgaXBtbXVfcHJvYmUoc3RydWN0IGR0X2RldmljZV9ub2RlICpub2RlKQogICAg
ICAgICAgICAgZ290byBvdXQ7CiAgICAgICAgIH0KIAotICAgICAgICAvKgotICAgICAgICAgKiBB
cyA0LWxldmVsIHRyYW5zbGF0aW9uIHRhYmxlIGlzIG5vdCBzdXBwb3J0ZWQgaW4gSVBNTVUsIHdl
IG5lZWQKLSAgICAgICAgICogdG8gY2hlY2sgSVBBIHNpemUgdXNlZCBmb3IgUDJNIHRhYmxlIGJl
Zm9yZWhhbmQgdG8gYmUgc3VyZSBpdCBpcwotICAgICAgICAgKiAzLWxldmVsIGFuZCB0aGUgSVBN
TVUgd2lsbCBiZSBhYmxlIHRvIHVzZSBpdC4KLSAgICAgICAgICoKLSAgICAgICAgICogVE9ETzog
Rmlyc3QgaW5pdGlhbGl6ZSB0aGUgSU9NTVUgYW5kIGdhdGhlciB0aGUgcmVxdWlyZW1lbnRzIGFu
ZAotICAgICAgICAgKiB0aGVuIGluaXRpYWxpemUgdGhlIFAyTS4gSW4gdGhlIFAyTSBjb2RlLCB0
YWtlIGludG8gdGhlIGFjY291bnQKLSAgICAgICAgICogdGhlIElPTU1VIHJlcXVpcmVtZW50cyBh
bmQgcmVzdHJpY3QgInBhX3JhbmdlIiBpZiBuZWNlc3NhcnkuCi0gICAgICAgICAqLwotICAgICAg
ICBpZiAoIElQTU1VX01BWF9QMk1fSVBBX0JJVFMgPCBwMm1faXBhX2JpdHMgKQotICAgICAgICB7
Ci0gICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiaXBtbXU6IFAyTSBJUEEgc2l6ZSBpcyBu
b3Qgc3VwcG9ydGVkIChQMk09JXUgSVBNTVU9JXUpIVxuIiwKLSAgICAgICAgICAgICAgICAgICBw
Mm1faXBhX2JpdHMsIElQTU1VX01BWF9QMk1fSVBBX0JJVFMpOwotICAgICAgICAgICAgcmV0ID0g
LUVOT0RFVjsKLSAgICAgICAgICAgIGdvdG8gb3V0OwotICAgICAgICB9CisgICAgICAgIC8qIFNl
dCBtYXhpbXVtIFN0YWdlLTIgaW5wdXQgc2l6ZSBzdXBwb3J0ZWQgYnkgdGhlIElQTU1VLiAqLwor
ICAgICAgICBwMm1fcmVzdHJpY3RfaXBhX2JpdHMoSVBNTVVfTUFYX1AyTV9JUEFfQklUUyk7CiAK
ICAgICAgICAgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShub2RlLCAwKTsKICAgICAgICAgaWYgKCBp
cnEgPCAwICkKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCmluZGV4IDhhZTk4NmEuLjcwMWZl
OWMgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMKKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYwpAQCAtMjE5OCwxNCArMjE5OCw5IEBA
IHN0YXRpYyBpbnQgYXJtX3NtbXVfZGV2aWNlX2NmZ19wcm9iZShzdHJ1Y3QgYXJtX3NtbXVfZGV2
aWNlICpzbW11KQogCXNpemUgPSBhcm1fc21tdV9pZF9zaXplX3RvX2JpdHMoKGlkID4+IElEMl9J
QVNfU0hJRlQpICYgSUQyX0lBU19NQVNLKTsKIAlzbW11LT5zMV9vdXRwdXRfc2l6ZSA9IG1pbl90
KHVuc2lnbmVkIGxvbmcsIFBIWVNfTUFTS19TSElGVCwgc2l6ZSk7CiAKLQkvKiBYZW46IFN0YWdl
LTIgaW5wdXQgc2l6ZSBoYXMgdG8gbWF0Y2ggcDJtX2lwYV9iaXRzLiAgKi8KLQlpZiAoc2l6ZSA8
IHAybV9pcGFfYml0cykgewotCQlkZXZfZXJyKHNtbXUtPmRldiwKLQkJCSJQMk0gSVBBIHNpemUg
bm90IHN1cHBvcnRlZCAoUDJNPSV1IFNNTVU9JWx1KSFcbiIsCi0JCQlwMm1faXBhX2JpdHMsIHNp
emUpOwotCQlyZXR1cm4gLUVOT0RFVjsKLQl9Ci0Jc21tdS0+czJfaW5wdXRfc2l6ZSA9IHAybV9p
cGFfYml0czsKKwkvKiBYZW46IFNldCBtYXhpbXVtIFN0YWdlLTIgaW5wdXQgc2l6ZSBzdXBwb3J0
ZWQgYnkgdGhlIFNNTVUuICovCisJcDJtX3Jlc3RyaWN0X2lwYV9iaXRzKHNpemUpOworCXNtbXUt
PnMyX2lucHV0X3NpemUgPSBzaXplOwogI2lmIDAKIAkvKiBTdGFnZS0yIGlucHV0IHNpemUgbGlt
aXRlZCBkdWUgdG8gcGdkIGFsbG9jYXRpb24gKFBUUlNfUEVSX1BHRCkgKi8KICNpZmRlZiBDT05G
SUdfNjRCSVQKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmggYi94ZW4vaW5j
bHVkZS9hc20tYXJtL3AybS5oCmluZGV4IGY5NzBjNTMuLjBhMzc3ZWEgMTAwNjQ0Ci0tLSBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vcDJtLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wMm0uaApA
QCAtMTY1LDYgKzE2NSwxNSBAQCB2b2lkIHAybV9hbHRwMm1fY2hlY2soc3RydWN0IHZjcHUgKnYs
IHVpbnQxNl90IGlkeCkKICAgICAvKiBOb3Qgc3VwcG9ydGVkIG9uIEFSTS4gKi8KIH0KIAorLyoK
KyAqIEhlbHBlciB0byByZXN0cmljdCAicDJtX2lwYV9iaXRzIiBhY2NvcmRpbmcgdGhlIGV4dGVy
bmFsIGVudGl0eQorICogKGUuZy4gSU9NTVUpIHJlcXVpcmVtZW50cy4KKyAqCisgKiBFYWNoIGNv
cnJlc3BvbmRpbmcgZHJpdmVyIHNob3VsZCByZXBvcnQgdGhlIG1heGltdW0gSVBBIGJpdHMKKyAq
IChTdGFnZS0yIGlucHV0IHNpemUpIGl0IGNhbiBzdXBwb3J0LgorICovCit2b2lkIHAybV9yZXN0
cmljdF9pcGFfYml0cyh1bnNpZ25lZCBpbnQgaXBhX2JpdHMpOworCiAvKiBTZWNvbmQgc3RhZ2Ug
cGFnaW5nIHNldHVwLCB0byBiZSBjYWxsZWQgb24gYWxsIENQVXMgKi8KIHZvaWQgc2V0dXBfdmly
dF9wYWdpbmcodm9pZCk7CiAKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
