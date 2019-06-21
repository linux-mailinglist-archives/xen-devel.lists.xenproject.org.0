Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351BD4EFCA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 22:06:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hePk1-0003dB-Ga; Fri, 21 Jun 2019 20:02:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=47Z8=UU=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hePk0-0003d6-SO
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 20:02:32 +0000
X-Inumbo-ID: 80774518-945f-11e9-8980-bc764e045a96
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 80774518-945f-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 20:02:31 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w13so11724837eds.4
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2019 13:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qv5gft6V51d/FbS1RmsZMbr3hsnYZikVWsXJiUeJ2BI=;
 b=H+Ac7x7kZdbezeXG/Lw8A76p7OYHhVc5a7wvCo6tfU8OPEYkAsuWjV4B/wPj5Fp9zx
 9V7SfRVuS3+zlqr2NR6uLOpeOC6Yd+5IMSALPVdZOaOonBmyrJxuFUmGcPztBANn9PGO
 aXdAx8JRLdTTHlV79MsCiQGVCNIyFYf8vAolh2eOcA/fJYoaIUCMXy9rSlKE3WGK8cgD
 Ib+xwGYGqDSUVFgMvcrMIeWArBQqGGcSVIxshoFqLdGN2ncTNY9Mr2ZQTgPZQufcDP97
 WiTnPaTglAUBayv6uKaXxrlDOa3GM+ZiAtDUL5jlQLFUwZdDHftIApeIPpHhBIEHB0kl
 ZBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qv5gft6V51d/FbS1RmsZMbr3hsnYZikVWsXJiUeJ2BI=;
 b=It08hqrbgY96BI4HAwxOACF/rPFrgssxeqp+QnpjaJ+whniCcMKIl+5UM0uVaIHRj9
 N3MHS6/zd1MFtyNXV6pr0T7mwjrjRrlp72d5Yqwguoa2ijYnXqT3ykY+/LQ38Q4bIAnn
 MbLgdv0ZD1xq118y4zNq4zmKWQpXf7L8sKPcCakzbdGrmAZNVCg/1uG+6tCh/zezSbzf
 oltjwhuMITW6xdeUTD2Lq2joo9PqQfH3dtXlqyuvRxQWMH7C3kvZwBx/VgZuHfwwSoqk
 AwP93mtHOUXYiMgP0OB6SVj09/A/pG4rvfcddoylIWWtjL1gcQFvztLCyvhjIPcx/D9b
 Gqmg==
X-Gm-Message-State: APjAAAU+JR7fGUR+TSNHthTh+6P160EYufM847jbf/AXSmZMBYPBm3lh
 i23xfiogMV/z7LwpPPc4fubmWgMr
X-Google-Smtp-Source: APXvYqzQIwZqR0/MsHu5jt3WIQOviWG+BhjiTqTawX1kzvDZVlUak7HxG+phIep79XZ+Hv6uqybpog==
X-Received: by 2002:a50:f49a:: with SMTP id s26mr76983562edm.191.1561147350285; 
 Fri, 21 Jun 2019 13:02:30 -0700 (PDT)
Received: from debian.fritz.box
 (200116b8668690001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:6686:9000:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id e19sm579203eja.91.2019.06.21.13.02.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 13:02:29 -0700 (PDT)
From: Denis Obrezkov <denisobrezkov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 21 Jun 2019 22:02:19 +0200
Message-Id: <ee1f4b9b969e6cf67278905e0405bc4fa5d6080c.1561147189.git.denisobrezkov@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/arm: Switch OMAP5 secondary cores into hyp
 mode
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
Cc: julien.grall@arm.com, tim@xen.org, Denis Obrezkov <denisobrezkov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmdW5jdGlvbiBhbGxvd3MgeGVuIHRvIGJyaW5nIHNlY29uZGFyeSBDUFUgY29yZXMgaW50
byBub24tc2VjdXJlCkhZUCBtb2RlLiBUaGlzIGlzIGRvbmUgYnkgdXNpbmcgYSBTZWN1cmUgTW9u
aXRvciBjYWxsLgoKU2lnbmVkLW9mZi1ieTogRGVuaXMgT2JyZXprb3YgPGRlbmlzb2JyZXprb3ZA
Z21haWwuY29tPgotLS0KIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgICAgICAgICAgICAgfCAx
MSArKysrKysrKysrLQogeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9vbWFwNS5jICAgICAgICB8ICA1
ICsrKy0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL3BsYXRmb3Jtcy9vbWFwNS5oIHwgIDMgKysrCiAz
IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFk
LlMKaW5kZXggNWY4MTdkNDczZS4uMTIwZTAzNDkzNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJt
L2FybTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCkBAIC0zNiw2ICsz
NiwxMCBAQAogI2luY2x1ZGUgRUFSTFlfUFJJTlRLX0lOQwogI2VuZGlmCiAKKworI2RlZmluZSBB
UElfSFlQX0VOVFJZIDB4MTAyCisjZGVmaW5lIEFVWF9DT1JFX0JPT1QwX1BBICAgICAgICAgICAw
eDQ4MjgxODAwCisKIC8qCiAgKiBDb21tb24gcmVnaXN0ZXIgdXNhZ2UgaW4gdGhpcyBmaWxlOgog
ICogICByMCAgLQpAQCAtMTEzLDYgKzExNywxMiBAQCBwYXN0X3pJbWFnZToKIAogICAgICAgICBi
ICAgICBjb21tb25fc3RhcnQKIAorR0xPQkFMKG9tYXA1X2luaXRfc2Vjb25kYXJ5KQorICAgICAg
ICBsZHIgIHIxMiwgPUFQSV9IWVBfRU5UUlkKKyAgICAgICAgYWRyICByMCwgaW5pdF9zZWNvbmRh
cnkKKwkJZHNiCisgICAgICAgIHNtYyAgICMwCisKIEdMT0JBTChpbml0X3NlY29uZGFyeSkKICAg
ICAgICAgY3BzaWQgYWlmICAgICAgICAgICAgICAgICAgICAvKiBEaXNhYmxlIGFsbCBpbnRlcnJ1
cHRzICovCiAKQEAgLTE1OSw3ICsxNjksNiBAQCBjb21tb25fc3RhcnQ6CiAgICAgICAgIFBSSU5U
KCItIENQVSBkb2Vzbid0IHN1cHBvcnQgdGhlIHZpcnR1YWxpemF0aW9uIGV4dGVuc2lvbnMgLVxy
XG4iKQogICAgICAgICBiICAgICBmYWlsCiAxOgotCiAgICAgICAgIC8qIENoZWNrIHRoYXQgd2Un
cmUgYWxyZWFkeSBpbiBIeXAgbW9kZSAqLwogICAgICAgICBtcnMgICByMCwgY3BzcgogICAgICAg
ICBhbmQgICByMCwgcjAsICMweDFmICAgICAgICAgIC8qIE1vZGUgaXMgaW4gdGhlIGxvdyA1IGJp
dHMgb2YgQ1BTUiAqLwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9vbWFwNS5j
IGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9vbWFwNS5jCmluZGV4IGFlZTI0ZTRkMjguLjZiNWNj
MTVhZjMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvb21hcDUuYworKysgYi94
ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL29tYXA1LmMKQEAgLTEyOCw4ICsxMjgsOSBAQCBzdGF0aWMg
aW50IF9faW5pdCBvbWFwNV9zbXBfaW5pdCh2b2lkKQogICAgIH0KIAogICAgIHByaW50aygiU2V0
IEF1eENvcmVCb290MSB0byAlIlBSSXBhZGRyIiAoJXApXG4iLAotICAgICAgICAgICBfX3BhKGlu
aXRfc2Vjb25kYXJ5KSwgaW5pdF9zZWNvbmRhcnkpOwotICAgIHdyaXRlbChfX3BhKGluaXRfc2Vj
b25kYXJ5KSwgd3VnZW5fYmFzZSArIE9NQVBfQVVYX0NPUkVfQk9PVF8xX09GRlNFVCk7CisgICAg
ICAgICAgIF9fcGEob21hcDVfaW5pdF9zZWNvbmRhcnkpLCBvbWFwNV9pbml0X3NlY29uZGFyeSk7
CisgICAgd3JpdGVsKF9fcGEob21hcDVfaW5pdF9zZWNvbmRhcnkpLCAKKyAgICAgICAgICAgIHd1
Z2VuX2Jhc2UgKyBPTUFQX0FVWF9DT1JFX0JPT1RfMV9PRkZTRVQpOwogCiAgICAgcHJpbnRrKCJT
ZXQgQXV4Q29yZUJvb3QwIHRvIDB4MjBcbiIpOwogICAgIHdyaXRlbCgweDIwLCB3dWdlbl9iYXNl
ICsgT01BUF9BVVhfQ09SRV9CT09UXzBfT0ZGU0VUKTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS1hcm0vcGxhdGZvcm1zL29tYXA1LmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3BsYXRmb3Jt
cy9vbWFwNS5oCmluZGV4IGM1NTljODRiNjEuLjczMmIyN2Y0MDMgMTAwNjQ0Ci0tLSBhL3hlbi9p
bmNsdWRlL2FzbS1hcm0vcGxhdGZvcm1zL29tYXA1LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFy
bS9wbGF0Zm9ybXMvb21hcDUuaApAQCAtMjIsNiArMjIsOSBAQAogCiAjZW5kaWYgLyogX19BU01f
QVJNX1BMQVRGT1JNU19PTUFQNV9IICovCiAKKy8qIFNlY29uZGFyeSBjcHUgb21hcDUgc3BlY2lm
aWMgaW5pdCByb3V0aW5lICovCitleHRlcm4gdm9pZCBvbWFwNV9pbml0X3NlY29uZGFyeSh2b2lk
KTsKKwogLyoKICAqIExvY2FsIHZhcmlhYmxlczoKICAqIG1vZGU6IEMKLS0gCjIuMjAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
