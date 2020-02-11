Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3910115902E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 14:44:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1VoE-0005q5-Eu; Tue, 11 Feb 2020 13:42:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pFJM=37=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1j1VoC-0005pT-CC
 for xen-devel@lists.xen.org; Tue, 11 Feb 2020 13:42:36 +0000
X-Inumbo-ID: 59e35cae-4cd4-11ea-8d48-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59e35cae-4cd4-11ea-8d48-bc764e2007e4;
 Tue, 11 Feb 2020 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581428551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=R+vXsjxpVw8T8CTr2MPpkBq3V1PxaaAJEGeR1pf0czE=;
 b=UCu878tVZgJQycTdwP//+g7KBui3AcmaDHu8tvhLwhYS7DZ58HXLsBR4
 56MlA06wlFnXVUMyZvCQvwnPeXmbcjg3wowjDnjIfUjDmHJ4E3nKoAnM8
 68sDIjHosIgDd3iwAfwwnE4PdEGlT1Eqh1HOwrg603Cvs7Yl4HEHWSFTz c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QM1YN7ZkAAb+fjt8dJ4A9hni9m+KYfLAjzUECQVha4FY5wkWnKqrHwELNlShWX+l+fGILGgj2+
 TGGnAPC/4iF+oRw+XZ+mCGEXRfyh5Z01wgUMDdg18XgicnPlncoJR62vUZmKWkePJyWekiSnC3
 0K1mzgxi9P4LXkhEveQke5lJSbCP9602HjGsMez/AdRMZI3GwUsnqit9PKljHynXbxZvAsXIt+
 xhvfJTnBFrwpwqAJaCLYnLDimol3tTKYue8uFd9sJ30ShxYPHABZi0moNdk2ytWhlEUQ1361Tl
 pJ0=
X-SBRS: 2.7
X-MesageID: 12638713
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12638713"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Tue, 11 Feb 2020 13:42:19 +0000
Message-ID: <20200211134220.9194-2-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211134220.9194-1-sergey.dyasli@citrix.com>
References: <20200211134220.9194-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 1/2] xsm: add Kconfig option for denied string
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIEtjb25maWcgb3B0aW9uIHRvIG1ha2UgaXQgcG9zc2libGUgdG8gY29uZmlndXJlIHRoZSBz
dHJpbmcgcmV0dXJuZWQKdG8gbm9uLXByaXZpbGVnZWQgZ3Vlc3RzIGluc3RlYWQgb2YgdGhlIGRl
ZmF1bHQgIjxkZW5pZWQ+IiB3aGljaCBjb3VsZApwcm9wYWdhdGUgdG8gVUkgLyBsb2dzIGFmdGVy
IHRoZSBzdWJzZXF1ZW50IHBhdGNoIHRoYXQgaGlkZXMgZGV0YWlsZWQKWGVuIHZlcnNpb24gaW5m
b3JtYXRpb24gZnJvbSB1bnByaXZpbGVnZWQgZ3Vlc3RzLgoKSW50cm9kdWNlIFhFTlZFUl9kZW5p
ZWRfc3RyaW5nIHRvIGFsbG93IGd1ZXN0cyB0byBzZXQgdXAgVUkgLyBsb2dzCmZpbHRlcmluZyB3
aGljaCBkZXBlbmRlbnMgb24gdGhlIG5ldyBDT05GSUdfWFNNX0RFTklFRF9TVFJJTkcuCgpTaWdu
ZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Ci0tLQp2
MyAtLT4gdjQ6Ci0gVXBkYXRlZCBrY29uZmlnIHByb21wdCBkZXNjcmlwdGlvbgotIEFkZGVkIFhF
TlZFUl9kZW5pZWRfc3RyaW5nCi0gQWRkZWQgI2lmZGVmIHRvIGZpeCBidWlsZCB3aGVuIENPTkZJ
R19YU00gaXMgbm90IHNldAoKdjIgLS0+IHYzOgotIG5ldyBwYXRjaAoKLS0tCiB4ZW4vY29tbW9u
L0tjb25maWcgICAgICAgICAgIHwgIDggKysrKysrKysKIHhlbi9jb21tb24va2VybmVsLmMgICAg
ICAgICAgfCAxMSArKysrKysrKysrKwogeGVuL2NvbW1vbi92ZXJzaW9uLmMgICAgICAgICB8ICA0
ICsrKysKIHhlbi9pbmNsdWRlL3B1YmxpYy92ZXJzaW9uLmggfCAgNSArKysrKwogeGVuL2luY2x1
ZGUveHNtL2R1bW15LmggICAgICB8ICAxICsKIDUgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vS2NvbmZpZyBiL3hlbi9jb21tb24vS2NvbmZp
ZwppbmRleCBhNjkxNGZjYWU5Li40YTFhOTM5OGNkIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL0tj
b25maWcKKysrIGIveGVuL2NvbW1vbi9LY29uZmlnCkBAIC0yMjgsNiArMjI4LDE0IEBAIGNob2lj
ZQogCQlib29sICJTSUxPIiBpZiBYU01fU0lMTwogZW5kY2hvaWNlCiAKK2NvbmZpZyBYU01fREVO
SUVEX1NUUklORworCXN0cmluZyAieGVuX3ZlcnNpb24gaHlwZXJjYWxsIGRlbmllZCBpbmZvcm1h
dGlvbiByZXBsYWNlbWVudCBzdHJpbmciCisJZGVmYXVsdCAiPGRlbmllZD4iCisJZGVwZW5kcyBv
biBYU00KKwktLS1oZWxwLS0tCisJICBBIHN0cmluZyB3aGljaCBzdWJzdGl0dXRlcyBzZW5zaXRp
dmUgaW5mb3JtYXRpb24gcmV0dXJuZWQgdmlhCisJICB4ZW5fdmVyc2lvbiBoeXBlcmNhbGwgdG8g
bm9uLXByaXZpbGVnZWQgZ3Vlc3RzCisKIGNvbmZpZyBMQVRFX0hXRE9NCiAJYm9vbCAiRGVkaWNh
dGVkIGhhcmR3YXJlIGRvbWFpbiIKIAlkZWZhdWx0IG4KZGlmZiAtLWdpdCBhL3hlbi9jb21tb24v
a2VybmVsLmMgYi94ZW4vY29tbW9uL2tlcm5lbC5jCmluZGV4IDIyOTQxY2VjOTQuLjFjMjJlNWQx
NjcgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24va2VybmVsLmMKKysrIGIveGVuL2NvbW1vbi9rZXJu
ZWwuYwpAQCAtNTYxLDYgKzU2MSwxNyBAQCBETyh4ZW5fdmVyc2lvbikoaW50IGNtZCwgWEVOX0dV
RVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCiAKICAgICAgICAgcmV0dXJuIHN6OwogICAgIH0K
KworICAgIGNhc2UgWEVOVkVSX2RlbmllZF9zdHJpbmc6CisgICAgeworICAgICAgICB4ZW5fZGVu
aWVkX3N0cmluZ190IHN0cjsKKworICAgICAgICBzYWZlX3N0cmNweShzdHIsIHhlbl9kZW55KCkp
OworICAgICAgICBpZiAoIGNvcHlfdG9fZ3Vlc3QoYXJnLCBzdHIsIFhFTl9ERU5JRURfU1RSSU5H
X0xFTikgKQorICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7CisKKyAgICAgICAgcmV0dXJuIDA7
CisgICAgfQogICAgIH0KIAogICAgIHJldHVybiAtRU5PU1lTOwpkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi92ZXJzaW9uLmMgYi94ZW4vY29tbW9uL3ZlcnNpb24uYwppbmRleCA5MzdlYjEyODFjLi5m
YmQwZWY0NjY4IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3ZlcnNpb24uYworKysgYi94ZW4vY29t
bW9uL3ZlcnNpb24uYwpAQCAtNjcsNyArNjcsMTEgQEAgY29uc3QgY2hhciAqeGVuX2Jhbm5lcih2
b2lkKQogCiBjb25zdCBjaGFyICp4ZW5fZGVueSh2b2lkKQogeworI2lmZGVmIENPTkZJR19YU01f
REVOSUVEX1NUUklORworICAgIHJldHVybiBDT05GSUdfWFNNX0RFTklFRF9TVFJJTkc7CisjZWxz
ZQogICAgIHJldHVybiAiPGRlbmllZD4iOworI2VuZGlmCiB9CiAKIHN0YXRpYyBjb25zdCB2b2lk
ICpidWlsZF9pZF9wIF9fcmVhZF9tb3N0bHk7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJs
aWMvdmVyc2lvbi5oIGIveGVuL2luY2x1ZGUvcHVibGljL3ZlcnNpb24uaAppbmRleCAxN2E4MWUy
M2NkLi5mNjUwMDFkMmQ5IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvdmVyc2lvbi5o
CisrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy92ZXJzaW9uLmgKQEAgLTEwMCw2ICsxMDAsMTEgQEAg
c3RydWN0IHhlbl9idWlsZF9pZCB7CiB9OwogdHlwZWRlZiBzdHJ1Y3QgeGVuX2J1aWxkX2lkIHhl
bl9idWlsZF9pZF90OwogCisvKiBhcmcgPT0geGVuX2RlbmllZF9zdHJpbmdfdC4gKi8KKyNkZWZp
bmUgWEVOVkVSX2RlbmllZF9zdHJpbmcgMTEKK3R5cGVkZWYgY2hhciB4ZW5fZGVuaWVkX3N0cmlu
Z190WzY0XTsKKyNkZWZpbmUgWEVOX0RFTklFRF9TVFJJTkdfTEVOIChzaXplb2YoeGVuX2Rlbmll
ZF9zdHJpbmdfdCkpCisKICNlbmRpZiAvKiBfX1hFTl9QVUJMSUNfVkVSU0lPTl9IX18gKi8KIAog
LyoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hzbS9kdW1teS5oIGIveGVuL2luY2x1ZGUveHNt
L2R1bW15LmgKaW5kZXggYjhlMTg1ZTZmYS4uNzJhMTAxYjEwNiAxMDA2NDQKLS0tIGEveGVuL2lu
Y2x1ZGUveHNtL2R1bW15LmgKKysrIGIveGVuL2luY2x1ZGUveHNtL2R1bW15LmgKQEAgLTc0OCw2
ICs3NDgsNyBAQCBzdGF0aWMgWFNNX0lOTElORSBpbnQgeHNtX3hlbl92ZXJzaW9uIChYU01fREVG
QVVMVF9BUkcgdWludDMyX3Qgb3ApCiAgICAgY2FzZSBYRU5WRVJfdmVyc2lvbjoKICAgICBjYXNl
IFhFTlZFUl9wbGF0Zm9ybV9wYXJhbWV0ZXJzOgogICAgIGNhc2UgWEVOVkVSX2dldF9mZWF0dXJl
czoKKyAgICBjYXNlIFhFTlZFUl9kZW5pZWRfc3RyaW5nOgogICAgICAgICAvKiBUaGVzZSBzdWIt
b3BzIGlnbm9yZSB0aGUgcGVybWlzc2lvbiBjaGVja3MgYW5kIHJldHVybiBkYXRhLiAqLwogICAg
ICAgICByZXR1cm4gMDsKICAgICBjYXNlIFhFTlZFUl9leHRyYXZlcnNpb246Ci0tIAoyLjE3LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
