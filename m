Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0052112753
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 10:29:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icQwX-0001rx-1K; Wed, 04 Dec 2019 09:27:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fd9d=Z2=dingwall.me.uk=james@srs-us1.protection.inumbo.net>)
 id 1icQwV-0001rC-DB
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 09:27:31 +0000
X-Inumbo-ID: 47955602-1678-11ea-aea8-bc764e2007e4
Received: from know-smtprelay-omc-1.server.virginmedia.net (unknown
 [80.0.253.65]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47955602-1678-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 09:27:24 +0000 (UTC)
Received: from mail0.xen.dingwall.me.uk ([82.47.84.47]) by cmsmtp with ESMTPA
 id cQwNiY5hzxs8ecQwNioh3f; Wed, 04 Dec 2019 09:27:23 +0000
X-Originating-IP: [82.47.84.47]
X-Authenticated-User: james.dingwall@blueyonder.co.uk
X-Spam: 0
X-Authority: v=2.3 cv=L98zvdb8 c=1 sm=1 tr=0 a=0bfgdX8EJi0Cr9X0x0jFDA==:117
 a=0bfgdX8EJi0Cr9X0x0jFDA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19
 a=xqWC_Br6kY4A:10 a=pxVhFHJ0LMsA:10 a=5IRWAbXhAAAA:8 a=YFnRBznFj9VQ1rwjkNEA:9
 a=xo7gz2vLY8DhO4BdlxfM:22
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 249C2159427;
 Wed,  4 Dec 2019 09:27:42 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYQc4x1H0yfc; Wed,  4 Dec 2019 09:27:42 +0000 (UTC)
Received: from behemoth.dingwall.me.uk (behemoth.dingwall.me.uk
 [IPv6:2001:470:695c:302::c0a8:105])
 by dingwall.me.uk (Postfix) with ESMTP id 98204159417;
 Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
Received: by behemoth.dingwall.me.uk (Postfix, from userid 1000)
 id A66E6140E1D; Wed,  4 Dec 2019 09:27:41 +0000 (UTC)
From: james-xen@dingwall.me.uk
To: xen-devel@lists.xenproject.org
Date: Wed,  4 Dec 2019 09:27:39 +0000
Message-Id: <20191204092739.18177-5-james-xen@dingwall.me.uk>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191204092739.18177-1-james-xen@dingwall.me.uk>
References: <20191204092739.18177-1-james-xen@dingwall.me.uk>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKZJoxklV5Q0Crbpl0ZLACJxmaLTqKK6ekPEx8uMnDO5p1kjjD1esGp12wJKNL49IdkWu7Gf7CztIe8p8YMUwMzuIKFOUprkyINvei5hZ1YXg7gtsnRl
 5FtC7oEvAQNu+j0pAzSVopzAkwDJG+E603ho9qrM1KK7A9g13YbqQg1D7xjI5wm2evASO8HKBoYuUgcFh65K0Omec8bRgQzAsYtHn8CwyxL+ByavkDOFYH+c
 cKHD2q24E0ilvqeb+l33P6e5wJVQ+iaquWicJ7YTp5E=
Subject: [Xen-devel] [PATCH 4/4] xenstored logging: add minios variant of
 default_xprintf()
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
Cc: wei.liu2@citrix.com, ian.jackson@eu.citrix.com,
 James Dingwall <james@dingwall.me.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSmFtZXMgRGluZ3dhbGwgPGphbWVzQGRpbmd3YWxsLm1lLnVrPgoKc3RkZXJyIGlzIG5v
dCBhdmFpbGFibGUgaW4gYSB4ZW5zdG9yZSBkb21haW4uICBBZGQgYSBuZXcgaW1wbGVtZW50YXRp
b24gb2YKZGVmYXVsdF94cHJpbnRmKCkgd2hpY2ggc2VuZHMgdGhlIG1lc3NhZ2UgdG8gdnN5c2xv
ZygpIGF0IExPR19FUlJPUi4KLS0tCiB0b29scy94ZW5zdG9yZS91dGlscy5jIHwgMTQgKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
dG9vbHMveGVuc3RvcmUvdXRpbHMuYyBiL3Rvb2xzL3hlbnN0b3JlL3V0aWxzLmMKaW5kZXggYTFh
YzEyNTg0YS4uN2VkMDViMTk3MCAxMDA2NDQKLS0tIGEvdG9vbHMveGVuc3RvcmUvdXRpbHMuYwor
KysgYi90b29scy94ZW5zdG9yZS91dGlscy5jCkBAIC04LDggKzgsMjEgQEAKICNpbmNsdWRlIDxm
Y250bC5oPgogI2luY2x1ZGUgPHN5cy90eXBlcy5oPgogI2luY2x1ZGUgPHNpZ25hbC5oPgorI2lm
ZGVmIF9fTUlOSU9TX18KKyNpbmNsdWRlIDxzeXNsb2cuaD4KKyNlbmRpZgogI2luY2x1ZGUgInV0
aWxzLmgiCiAKKyNpZmRlZiBfX01JTklPU19fCitzdGF0aWMgdm9pZCBkZWZhdWx0X3hwcmludGYo
Y29uc3QgY2hhciAqZm10LCAuLi4pCit7CisJdmFfbGlzdCBhcmdzOworCisJdmFfc3RhcnQoYXJn
cywgZm10KTsKKwl2c3lzbG9nKExPR19FUlIsIGZtdCwgYXJncyk7CisJdmFfZW5kKGFyZ3MpOwor
fQorI2Vsc2UKIHN0YXRpYyB2b2lkIGRlZmF1bHRfeHByaW50Zihjb25zdCBjaGFyICpmbXQsIC4u
LikKIHsKIAl2YV9saXN0IGFyZ3M7CkBAIC0xOSw2ICszMiw3IEBAIHN0YXRpYyB2b2lkIGRlZmF1
bHRfeHByaW50Zihjb25zdCBjaGFyICpmbXQsIC4uLikKIAl2YV9lbmQoYXJncyk7CiAJZmZsdXNo
KHN0ZGVycik7CiB9CisjZW5kaWYKIAogdm9pZCAoKnhwcmludGYpKGNvbnN0IGNoYXIgKmZtdCwg
Li4uKSA9IGRlZmF1bHRfeHByaW50ZjsKIAotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
