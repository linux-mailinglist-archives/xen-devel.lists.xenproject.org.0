Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DAFBCC0D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 18:04:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCnGI-0004Mr-AS; Tue, 24 Sep 2019 16:01:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y7zL=XT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iCnGG-0004Mk-0T
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 16:01:56 +0000
X-Inumbo-ID: a0a9d5f4-dee4-11e9-bf31-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by localhost (Halon) with ESMTPS
 id a0a9d5f4-dee4-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 16:01:54 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id l21so2468361lje.4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2019 09:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=OQsnUggE6sXWSnaFUQ6CNt1+7Fy+Ng9A3qHcCQFtRjc=;
 b=WTqgG6Cuifa/XlIJ0l6cs33g5MsZGk8TsbY0mirA7/G4ne1ffb+GLfRFbX2VlWgYPd
 S+VxlymwOHODV/LSASn3Cd6JFpEg5NkGxTQfLk7Xh2h/IiabXrZFt9XbeZGBzcuax1+M
 rb1GSWXhoifEiA1NJVTMcoYWo0qyE/Ive32TasfGekdzwAl8UlF7LtXva/XkgO+Ogd38
 fYId+HkyQmvhLBvKixi6c8o5C0NYMsjSRSerqcjEpbvRoJYerw8rukvtL26IqLnwjC5C
 y9Bhk97fSfmNkAz8q13o7MZeh0KPW/qzHbrF6Rq/2KUKVdEUzN9JhPPkIWaUs0nYxduv
 7KCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OQsnUggE6sXWSnaFUQ6CNt1+7Fy+Ng9A3qHcCQFtRjc=;
 b=f3Rl15TA5clBvEIzastjbaK3p6xBB1mWqmGwrLbxMi4FjfZbfVfcLohFGJqNS61OEu
 9xVecv7RmTPB4A47fVMD1f8anfKeXBxRQlyPQvyF15t59i4oCgLRRbUYk5UmHYf+HM54
 o9PyYIcDWFsGJ4u426Xt+DVnx+FlugL4NhFw2LymRbtbFpPDHpJAs+A1QmZ4TahN7mFI
 HBH4CgRkMWTCoTpf+yLqagbwF7sKCPMc6JsZ5tWU9toji5B049D8vbUL5jnlh9qgGjsE
 ii0V4a1miBtCDVnTLBH64z8akWzNwkth+n+nB6KwkgT2lGJph23Aa6nvPlcsOCZL2Q6j
 3XFw==
X-Gm-Message-State: APjAAAWdcEVRxeVl/y3IqjR0E5zj1hfLHeJe8bv4NMyYvxFc424w0HJm
 FQVkjw6GYFQgbo0UxHBDGW7Jfj9NKL4=
X-Google-Smtp-Source: APXvYqxmZ9CZjF6y5SVOl+fjuUP31DKRRclnQ9ES7kXBErFdNZa84jA2TLb1mCZAjvoCBbNr34IE5A==
X-Received: by 2002:a2e:1409:: with SMTP id u9mr2561714ljd.162.1569340913324; 
 Tue, 24 Sep 2019 09:01:53 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id q66sm549866ljq.101.2019.09.24.09.01.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 24 Sep 2019 09:01:52 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 19:01:51 +0300
Message-Id: <1569340911-20793-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH V4] xen/arm: Restrict "p2m_ipa_bits" according
 to the IOMMU requirements
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
 sstabellini@kernel.org, volodymyr_babchuk@epam.com
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
LQpQbGVhc2Ugbm90ZSwgdGhpcyBwYXRjaCBkZXBlbmRzIG9uIHRoZSBmb2xsb3dpbmcgcGF0Y2gg
c2VyaWVzOgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRl
dmVsLzIwMTktMDkvbXNnMDIyODIuaHRtbAphbmQgd2Fzbid0IGNoZWNrZWQgZm9yIHRoZSBTTU1V
LgoKQ2hhbmdlcyBSRkMgVjMgWzNdIC0+IFY0OgogICAtIE1vdmUgY2hlY2sgZm9yIHAybV9pcGFf
Yml0cyB0byBiZSBhdCBsZWFzdCA0MCBiaXQKICAgICB1bmRlciAjaWZkZWYgQ09ORklHX0FSTV8z
MgogICAtIFJld29yZCB0aGUgInBhbmljIiBtZXNzYWdlCgpDaGFuZ2VzIFJGQyBWMiBbMl0gLT4g
UkZDIFYzOgogICAtIENoZWNrIGluIHNldHVwX3ZpcnRfcGFnaW5nKCkgdGhhdCB0aGUgInJlc3Ry
aWN0ZWQiCiAgICAgUDJNIElQQSBzaXplIGlzIGF0IGxlYXN0IDQwLWJpdAogICAtIE1vZGlmeSBs
b2dpYyBpbiBzZXR1cF92aXJ0X3BhZ2luZygpIGEgYml0IHRvIG1ha2UgaXQKICAgICAiSU9NTVUt
YWdub3N0aWMiCiAgIC0gQ2xhcmlmeSBjb21tZW50cyBpbiBjb2RlLCBhZGQgc29tZSBleHBsYW5h
dGlvbnMKICAgLSBBdm9pZCB1c2luZyB0aGUgdGVybSAiSU9NTVUiIGluIFAyTSBjb2RlIHdoZXJl
IHBvc3NpYmxlCgpDaGFuZ2VzIFJGQyBWMSBbMV0gLT4gUkZDIFYyIFsyXToKICAgLSBEb24ndCB1
cGRhdGUgcDJtX2lwYV9iaXRzIGJ5IHRoZSBJT01NVSBkcml2ZXJzIGRpcmVjdGx5LAogICAgIGlu
dHJvZHVjZSBwMm1fcmVzdHJpY3RfaXBhX2JpdHMoKQogICAtIENsYXJpZnkgcGF0Y2ggc3ViamVj
dC9kZXNjcmlwdGlvbgogICAtIEFkZCBtb3JlIGNvbW1lbnRzIHRvIGNvZGUKICAgLSBDaGVjayBm
b3IgZXF1aXZhbGVudCAicGFiaXRzIiBpbiBzZXR1cF92aXJ0X3BhZ2luZygpCiAgIC0gUmVtb3Zl
IEFTU0VSVHMgZnJvbSB0aGUgU01NVSBhbmQgSVBNTVUgZHJpdmVycwoKWzFdIGh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wOC9tc2cwMjA3
OC5odG1sClsyXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVu
LWRldmVsLzIwMTktMDgvbXNnMDIyMzcuaHRtbApbM10gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA5L21zZzAwOTczLmh0bWwKLS0tCiB4
ZW4vYXJjaC9hcm0vcDJtLmMgICAgICAgICAgICAgICAgICAgICAgIHwgNDEgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0KIHhlbi9hcmNoL2FybS9zZXR1cC5jICAgICAgICAgICAgICAg
ICAgICAgfCAgOSArKysrKy0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1z
YS5jIHwgMTggKystLS0tLS0tLS0tLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11
LmMgICAgICAgfCAxMSArKystLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmggICAgICAg
ICAgICAgICAgfCAgOSArKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyks
IDMwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wMm0uYyBiL3hlbi9h
cmNoL2FybS9wMm0uYwppbmRleCAwZjhjYzNmLi43ZGE0MWU2IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC9hcm0vcDJtLmMKKysrIGIveGVuL2FyY2gvYXJtL3AybS5jCkBAIC0zNCw3ICszNCwxMSBAQCBz
dGF0aWMgdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgbWF4X3ZtaWQgPSBNQVhfVk1JRF84X0JJ
VDsKIAogI2RlZmluZSBQMk1fUk9PVF9QQUdFUyAgICAoMTw8UDJNX1JPT1RfT1JERVIpCiAKLXVu
c2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IHAybV9pcGFfYml0czsKKy8qCisgKiBTZXQgbGFyZ2Vy
IHRoYW4gYW55IHBvc3NpYmxlIHZhbHVlLCBzbyB0aGUgbnVtYmVyIG9mIElQQSBiaXRzIGNhbiBi
ZQorICogcmVzdHJpY3RlZCBieSBleHRlcm5hbCBlbnRpdHkgKGUuZy4gSU9NTVUpLgorICovCit1
bnNpZ25lZCBpbnQgX19yZWFkX21vc3RseSBwMm1faXBhX2JpdHMgPSA2NDsKIAogLyogSGVscGVy
cyB0byBsb29rdXAgdGhlIHByb3BlcnRpZXMgb2YgZWFjaCBsZXZlbCAqLwogc3RhdGljIGNvbnN0
IHBhZGRyX3QgbGV2ZWxfbWFza3NbXSA9CkBAIC0xOTI3LDYgKzE5MzEsMTYgQEAgc3RydWN0IHBh
Z2VfaW5mbyAqZ2V0X3BhZ2VfZnJvbV9ndmEoc3RydWN0IHZjcHUgKnYsIHZhZGRyX3QgdmEsCiAg
ICAgcmV0dXJuIHBhZ2U7CiB9CiAKK3ZvaWQgX19pbml0IHAybV9yZXN0cmljdF9pcGFfYml0cyh1
bnNpZ25lZCBpbnQgaXBhX2JpdHMpCit7CisgICAgLyoKKyAgICAgKiBDYWxjdWxhdGUgdGhlIG1p
bmltdW0gb2YgdGhlIG1heGltdW0gSVBBIGJpdHMgdGhhdCBhbnkgZXh0ZXJuYWwgZW50aXR5Cisg
ICAgICogY2FuIHN1cHBvcnQuCisgICAgICovCisgICAgaWYgKCBpcGFfYml0cyA8IHAybV9pcGFf
Yml0cyApCisgICAgICAgIHAybV9pcGFfYml0cyA9IGlwYV9iaXRzOworfQorCiAvKiBWVENSIHZh
bHVlIHRvIGJlIGNvbmZpZ3VyZWQgYnkgYWxsIENQVXMuIFNldCBvbmx5IG9uY2UgYnkgdGhlIGJv
b3QgQ1BVICovCiBzdGF0aWMgdWludDMyX3QgX19yZWFkX21vc3RseSB2dGNyOwogCkBAIC0xOTU4
LDYgKzE5NzIsMTAgQEAgdm9pZCBfX2luaXQgc2V0dXBfdmlydF9wYWdpbmcodm9pZCkKICAgICB1
bnNpZ25lZCBsb25nIHZhbCA9IFZUQ1JfUkVTMXxWVENSX1NIMF9JU3xWVENSX09SR04wX1dCV0F8
VlRDUl9JUkdOMF9XQldBOwogCiAjaWZkZWYgQ09ORklHX0FSTV8zMgorICAgIGlmICggcDJtX2lw
YV9iaXRzIDwgNDAgKQorICAgICAgICBwYW5pYygiUDJNOiBOb3QgYWJsZSB0byBzdXBwb3J0ICV1
LWJpdCBJUEEgYXQgdGhlIG1vbWVudFxuIiwKKyAgICAgICAgICAgICAgcDJtX2lwYV9iaXRzKTsK
KwogICAgIHByaW50aygiUDJNOiA0MC1iaXQgSVBBXG4iKTsKICAgICBwMm1faXBhX2JpdHMgPSA0
MDsKICAgICB2YWwgfD0gVlRDUl9UMFNaKDB4MTgpOyAvKiA0MCBiaXQgSVBBICovCkBAIC0xOTgx
LDE1ICsxOTk5LDIwIEBAIHZvaWQgX19pbml0IHNldHVwX3ZpcnRfcGFnaW5nKHZvaWQpCiAgICAg
ICAgIFs3XSA9IHsgMCB9ICAvKiBJbnZhbGlkICovCiAgICAgfTsKIAotICAgIHVuc2lnbmVkIGlu
dCBjcHU7CisgICAgdW5zaWduZWQgaW50IGksIGNwdTsKICAgICB1bnNpZ25lZCBpbnQgcGFfcmFu
Z2UgPSAweDEwOyAvKiBMYXJnZXIgdGhhbiBhbnkgcG9zc2libGUgdmFsdWUgKi8KICAgICBib29s
IHZtaWRfOF9iaXQgPSBmYWxzZTsKIAogICAgIGZvcl9lYWNoX29ubGluZV9jcHUgKCBjcHUgKQog
ICAgIHsKICAgICAgICAgY29uc3Qgc3RydWN0IGNwdWluZm9fYXJtICppbmZvID0gJmNwdV9kYXRh
W2NwdV07Ci0gICAgICAgIGlmICggaW5mby0+bW02NC5wYV9yYW5nZSA8IHBhX3JhbmdlICkKLSAg
ICAgICAgICAgIHBhX3JhbmdlID0gaW5mby0+bW02NC5wYV9yYW5nZTsKKworICAgICAgICAvKgor
ICAgICAgICAgKiBSZXN0cmljdCAicDJtX2lwYV9iaXRzIiBpZiBuZWVkZWQuIEFzIFAyTSB0YWJs
ZSBpcyBhbHdheXMgY29uZmlndXJlZAorICAgICAgICAgKiB3aXRoIElQQSBiaXRzID09IFBBIGJp
dHMsIGNvbXBhcmUgYWdhaW5zdCAicGFiaXRzIi4KKyAgICAgICAgICovCisgICAgICAgIGlmICgg
cGFfcmFuZ2VfaW5mb1tpbmZvLT5tbTY0LnBhX3JhbmdlXS5wYWJpdHMgPCBwMm1faXBhX2JpdHMg
KQorICAgICAgICAgICAgcDJtX2lwYV9iaXRzID0gcGFfcmFuZ2VfaW5mb1tpbmZvLT5tbTY0LnBh
X3JhbmdlXS5wYWJpdHM7CiAKICAgICAgICAgLyogU2V0IGEgZmxhZyBpZiB0aGUgY3VycmVudCBj
cHUgZG9lcyBub3Qgc3VwcG9ydCAxNiBiaXQgVk1JRHMuICovCiAgICAgICAgIGlmICggaW5mby0+
bW02NC52bWlkX2JpdHMgIT0gTU02NF9WTUlEXzE2X0JJVFNfU1VQUE9SVCApCkBAIC0yMDAzLDYg
KzIwMjYsMTYgQEAgdm9pZCBfX2luaXQgc2V0dXBfdmlydF9wYWdpbmcodm9pZCkKICAgICBpZiAo
ICF2bWlkXzhfYml0ICkKICAgICAgICAgbWF4X3ZtaWQgPSBNQVhfVk1JRF8xNl9CSVQ7CiAKKyAg
ICAvKiBDaG9vc2Ugc3VpdGFibGUgInBhX3JhbmdlIiBhY2NvcmRpbmcgdG8gdGhlIHJlc3VsdGVk
ICJwMm1faXBhX2JpdHMiLiAqLworICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlfU0laRShwYV9y
YW5nZV9pbmZvKTsgaSsrICkKKyAgICB7CisgICAgICAgIGlmICggcDJtX2lwYV9iaXRzID09IHBh
X3JhbmdlX2luZm9baV0ucGFiaXRzICkKKyAgICAgICAgeworICAgICAgICAgICAgcGFfcmFuZ2Ug
PSBpOworICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIH0KKyAgICB9CisKICAgICAvKiBwYV9y
YW5nZSBpcyA0IGJpdHMsIGJ1dCB0aGUgZGVmaW5lZCBlbmNvZGluZ3MgYXJlIG9ubHkgMyBiaXRz
ICovCiAgICAgaWYgKCBwYV9yYW5nZSA+PSBBUlJBWV9TSVpFKHBhX3JhbmdlX2luZm8pIHx8ICFw
YV9yYW5nZV9pbmZvW3BhX3JhbmdlXS5wYWJpdHMgKQogICAgICAgICBwYW5pYygiVW5rbm93biBl
bmNvZGluZyBvZiBJRF9BQTY0TU1GUjBfRUwxLlBBUmFuZ2UgJXhcbiIsIHBhX3JhbmdlKTsKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKaW5k
ZXggZmNhN2U2OC4uNzkwZWFiOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKKysr
IGIveGVuL2FyY2gvYXJtL3NldHVwLmMKQEAgLTkyOCwxMiArOTI4LDE3IEBAIHZvaWQgX19pbml0
IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQsCiAgICAgcHJpbnRrKCJC
cm91Z2h0IHVwICVsZCBDUFVzXG4iLCAobG9uZyludW1fb25saW5lX2NwdXMoKSk7CiAgICAgLyog
VE9ETzogc21wX2NwdXNfZG9uZSgpOyAqLwogCi0gICAgc2V0dXBfdmlydF9wYWdpbmcoKTsKLQor
ICAgIC8qCisgICAgICogVGhlIElPTU1VIHN1YnN5c3RlbSBtdXN0IGJlIGluaXRpYWxpemVkIGJl
Zm9yZSBQMk0gYXMgd2UgbmVlZAorICAgICAqIHRvIGdhdGhlciByZXF1aXJlbWVudHMgcmVnYXJk
aW5nIHRoZSBtYXhpbXVtIElQQSBiaXRzIHN1cHBvcnRlZCBieQorICAgICAqIGVhY2ggSU9NTVUg
ZGV2aWNlLgorICAgICAqLwogICAgIHJjID0gaW9tbXVfc2V0dXAoKTsKICAgICBpZiAoICFpb21t
dV9lbmFibGVkICYmIHJjICE9IC1FTk9ERVYgKQogICAgICAgICBwYW5pYygiQ291bGRuJ3QgY29u
ZmlndXJlIGNvcnJlY3RseSBhbGwgdGhlIElPTU1Vcy5cbiIpOwogCisgICAgc2V0dXBfdmlydF9w
YWdpbmcoKTsKKwogICAgIGRvX2luaXRjYWxscygpOwogCiAgICAgLyoKZGlmZiAtLWdpdCBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jCmluZGV4IGYyZmI0YTIuLjljZmFlN2UgMTAwNjQ0Ci0t
LSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMKKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYwpAQCAtODQ0LDIyICs4NDQsOCBAQCBz
dGF0aWMgaW50IGlwbW11X3Byb2JlKHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbm9kZSkKICAgICAg
ICAgICAgIGdvdG8gb3V0OwogICAgICAgICB9CiAKLSAgICAgICAgLyoKLSAgICAgICAgICogQXMg
NC1sZXZlbCB0cmFuc2xhdGlvbiB0YWJsZSBpcyBub3Qgc3VwcG9ydGVkIGluIElQTU1VLCB3ZSBu
ZWVkCi0gICAgICAgICAqIHRvIGNoZWNrIElQQSBzaXplIHVzZWQgZm9yIFAyTSB0YWJsZSBiZWZv
cmVoYW5kIHRvIGJlIHN1cmUgaXQgaXMKLSAgICAgICAgICogMy1sZXZlbCBhbmQgdGhlIElQTU1V
IHdpbGwgYmUgYWJsZSB0byB1c2UgaXQuCi0gICAgICAgICAqCi0gICAgICAgICAqIFRPRE86IEZp
cnN0IGluaXRpYWxpemUgdGhlIElPTU1VIGFuZCBnYXRoZXIgdGhlIHJlcXVpcmVtZW50cyBhbmQK
LSAgICAgICAgICogdGhlbiBpbml0aWFsaXplIHRoZSBQMk0uIEluIHRoZSBQMk0gY29kZSwgdGFr
ZSBpbnRvIHRoZSBhY2NvdW50Ci0gICAgICAgICAqIHRoZSBJT01NVSByZXF1aXJlbWVudHMgYW5k
IHJlc3RyaWN0ICJwYV9yYW5nZSIgaWYgbmVjZXNzYXJ5LgotICAgICAgICAgKi8KLSAgICAgICAg
aWYgKCBJUE1NVV9NQVhfUDJNX0lQQV9CSVRTIDwgcDJtX2lwYV9iaXRzICkKLSAgICAgICAgewot
ICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgImlwbW11OiBQMk0gSVBBIHNpemUgaXMgbm90
IHN1cHBvcnRlZCAoUDJNPSV1IElQTU1VPSV1KSFcbiIsCi0gICAgICAgICAgICAgICAgICAgcDJt
X2lwYV9iaXRzLCBJUE1NVV9NQVhfUDJNX0lQQV9CSVRTKTsKLSAgICAgICAgICAgIHJldCA9IC1F
Tk9ERVY7Ci0gICAgICAgICAgICBnb3RvIG91dDsKLSAgICAgICAgfQorICAgICAgICAvKiBTZXQg
bWF4aW11bSBTdGFnZS0yIGlucHV0IHNpemUgc3VwcG9ydGVkIGJ5IHRoZSBJUE1NVS4gKi8KKyAg
ICAgICAgcDJtX3Jlc3RyaWN0X2lwYV9iaXRzKElQTU1VX01BWF9QMk1fSVBBX0JJVFMpOwogCiAg
ICAgICAgIGlycSA9IHBsYXRmb3JtX2dldF9pcnEobm9kZSwgMCk7CiAgICAgICAgIGlmICggaXJx
IDwgMCApCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYwppbmRleCA4YWU5ODZhLi43MDFmZTlj
IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCisrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMKQEAgLTIxOTgsMTQgKzIxOTgsOSBAQCBz
dGF0aWMgaW50IGFybV9zbW11X2RldmljZV9jZmdfcHJvYmUoc3RydWN0IGFybV9zbW11X2Rldmlj
ZSAqc21tdSkKIAlzaXplID0gYXJtX3NtbXVfaWRfc2l6ZV90b19iaXRzKChpZCA+PiBJRDJfSUFT
X1NISUZUKSAmIElEMl9JQVNfTUFTSyk7CiAJc21tdS0+czFfb3V0cHV0X3NpemUgPSBtaW5fdCh1
bnNpZ25lZCBsb25nLCBQSFlTX01BU0tfU0hJRlQsIHNpemUpOwogCi0JLyogWGVuOiBTdGFnZS0y
IGlucHV0IHNpemUgaGFzIHRvIG1hdGNoIHAybV9pcGFfYml0cy4gICovCi0JaWYgKHNpemUgPCBw
Mm1faXBhX2JpdHMpIHsKLQkJZGV2X2VycihzbW11LT5kZXYsCi0JCQkiUDJNIElQQSBzaXplIG5v
dCBzdXBwb3J0ZWQgKFAyTT0ldSBTTU1VPSVsdSkhXG4iLAotCQkJcDJtX2lwYV9iaXRzLCBzaXpl
KTsKLQkJcmV0dXJuIC1FTk9ERVY7Ci0JfQotCXNtbXUtPnMyX2lucHV0X3NpemUgPSBwMm1faXBh
X2JpdHM7CisJLyogWGVuOiBTZXQgbWF4aW11bSBTdGFnZS0yIGlucHV0IHNpemUgc3VwcG9ydGVk
IGJ5IHRoZSBTTU1VLiAqLworCXAybV9yZXN0cmljdF9pcGFfYml0cyhzaXplKTsKKwlzbW11LT5z
Ml9pbnB1dF9zaXplID0gc2l6ZTsKICNpZiAwCiAJLyogU3RhZ2UtMiBpbnB1dCBzaXplIGxpbWl0
ZWQgZHVlIHRvIHBnZCBhbGxvY2F0aW9uIChQVFJTX1BFUl9QR0QpICovCiAjaWZkZWYgQ09ORklH
XzY0QklUCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL3AybS5oIGIveGVuL2luY2x1
ZGUvYXNtLWFybS9wMm0uaAppbmRleCAwM2YyZWU3Li44OWY4MmRmIDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS9hc20tYXJtL3AybS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmgKQEAg
LTE1OSw2ICsxNTksMTUgQEAgdm9pZCBwMm1fYWx0cDJtX2NoZWNrKHN0cnVjdCB2Y3B1ICp2LCB1
aW50MTZfdCBpZHgpCiAgICAgLyogTm90IHN1cHBvcnRlZCBvbiBBUk0uICovCiB9CiAKKy8qCisg
KiBIZWxwZXIgdG8gcmVzdHJpY3QgInAybV9pcGFfYml0cyIgYWNjb3JkaW5nIHRoZSBleHRlcm5h
bCBlbnRpdHkKKyAqIChlLmcuIElPTU1VKSByZXF1aXJlbWVudHMuCisgKgorICogRWFjaCBjb3Jy
ZXNwb25kaW5nIGRyaXZlciBzaG91bGQgcmVwb3J0IHRoZSBtYXhpbXVtIElQQSBiaXRzCisgKiAo
U3RhZ2UtMiBpbnB1dCBzaXplKSBpdCBjYW4gc3VwcG9ydC4KKyAqLwordm9pZCBwMm1fcmVzdHJp
Y3RfaXBhX2JpdHModW5zaWduZWQgaW50IGlwYV9iaXRzKTsKKwogLyogU2Vjb25kIHN0YWdlIHBh
Z2luZyBzZXR1cCwgdG8gYmUgY2FsbGVkIG9uIGFsbCBDUFVzICovCiB2b2lkIHNldHVwX3ZpcnRf
cGFnaW5nKHZvaWQpOwogCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
