Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC5C10777
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 13:20:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLnFE-0001mP-3t; Wed, 01 May 2019 11:17:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G7ua=TB=merlin.srs.infradead.org=batv+1e733e8c069b692f204e+5729+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hLnFB-0001hk-CS
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 11:17:45 +0000
X-Inumbo-ID: bbeaf0d5-6c02-11e9-843c-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bbeaf0d5-6c02-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:References:In-Reply-To:
 Message-Id:Date:Subject:To:From:Reply-To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5jt+5npRe6p81P8RyMxxmUSB4Zxhx3mhFjyte/083J8=; b=CX3KQYTg3E55CosaKPSQ3W9uy
 X8G+7iNTZ1BkuZaD99cLeHJEvJV4hICC0cyLrI7KDh0dlrxGnfu9SOJZ/SjWVe0Xf/oPtR7X4v5VS
 Md+ALqGK1X6Xo0HU80c5OWS9H1xMnZLcB3KyPiSC694qFayIL2x8pIdl5TDUP7nC04EavLrUbtsxq
 TD6x05gnbL64YeMcypivwI7a+dnPptceXJkd4KO6toLBKWTidZsUs5ApWZ1l3DJiWsrAvAII1AewJ
 s7beCsDT14Unp6U7E4FSknEI4O/1aKcGgobFimzamnhIzdojJtJbK09o9kk+tetwNvYkMj52/Ago7
 5FoyotNeg==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLnF6-0008Ru-80
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 11:17:40 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hLnF5-0030OC-Bu
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 12:17:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Wed,  1 May 2019 12:17:38 +0100
Message-Id: <15986052e40bcef5d80f2367ada726d482b12c45.1556708226.git.dwmw2@infradead.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1556708225.git.dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
In-Reply-To: <cover.1556708225.git.dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH 6/7] x86/boot: Copy 16-bit boot variables
 back up to Xen image
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KCkRpdGNoIHRoZSBib290
c3ltKCkgYWNjZXNzIGZyb20gQyBjb2RlIGZvciB0aGUgdmFyaWFibGVzIHBvcHVsYXRlZCBieQox
Ni1iaXQgYm9vdCBjb2RlLiBBcyB3ZWxsIGFzIGJlaW5nIGNsZWFuZXIgdGhpcyBhbHNvIHBhdmVz
IHRoZSB3YXkgZm9yCm5vdCBoYXZpbmcgdGhlIDE2LWJpdCBib290IGNvZGUgaW4gbG93IG1lbW9y
eSBmb3Igbm8tcmVhbC1tb2RlIG9yIEVGSQpsb2FkZXIgYm9vdHMgYXQgYWxsLgoKU2lnbmVkLW9m
Zi1ieTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KLS0tCiB4ZW4vYXJjaC94
ODYvYm9vdC9lZGQuUyAgICAgICAgICAgfCAgMiArKwogeGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5T
ICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKysrCiB4ZW4vYXJjaC94ODYvYm9vdC9tZW0uUyAg
ICAgICAgICAgfCAgMiArKwogeGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TICAgIHwgMzMg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQogeGVuL2FyY2gveDg2L2Jvb3QvdmlkZW8u
UyAgICAgICAgIHwgMzAgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2
L3BsYXRmb3JtX2h5cGVyY2FsbC5jIHwgMTggKysrKysrKystLS0tLS0tLS0KIHhlbi9hcmNoL3g4
Ni9zZXR1cC5jICAgICAgICAgICAgICB8IDIzICsrKysrKysrKysrLS0tLS0tLS0tLQogeGVuL2Fy
Y2gveDg2L3hlbi5sZHMuUyAgICAgICAgICAgIHwgIDggKysrKysrKy0KIHhlbi9pbmNsdWRlL2Fz
bS14ODYvZWRkLmggICAgICAgICB8ICAxIC0KIDkgZmlsZXMgY2hhbmdlZCwgOTMgaW5zZXJ0aW9u
cygrKSwgNDAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jvb3QvZWRk
LlMgYi94ZW4vYXJjaC94ODYvYm9vdC9lZGQuUwppbmRleCA0MzRiYmJkOTYwLi4xMzhkMDRjOTY0
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9vdC9lZGQuUworKysgYi94ZW4vYXJjaC94ODYv
Ym9vdC9lZGQuUwpAQCAtMTYzLDYgKzE2Myw3IEBAIGVkZF9kb25lOgogLkxlZGRfbWJyX3NpZ19z
a2lwOgogICAgICAgICByZXQKIAorICAgICAgICAucHVzaHNlY3Rpb24gLmRhdGEuYm9vdDE2LCAi
YXciLCBAcHJvZ2JpdHMKIEdMT0JBTChib290X2VkZF9pbmZvX25yKQogICAgICAgICAuYnl0ZSAg
IDAKIEdMT0JBTChib290X21icl9zaWduYXR1cmVfbnIpCkBAIC0xNzEsMyArMTcyLDQgQEAgR0xP
QkFMKGJvb3RfbWJyX3NpZ25hdHVyZSkKICAgICAgICAgLmZpbGwgICBFRERfTUJSX1NJR19NQVgq
OCwxLDAKIEdMT0JBTChib290X2VkZF9pbmZvKQogICAgICAgICAuZmlsbCAgIEVERF9JTkZPX01B
WCAqIChFRERFWFRTSVpFICsgRUREUEFSTVNJWkUpLCAxLCAwCisgICAgICAgIC5wb3BzZWN0aW9u
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMgYi94ZW4vYXJjaC94ODYvYm9v
dC9oZWFkLlMKaW5kZXggODIzNDI3NjljNy4uN2Q2YzhkMzI5MiAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L2Jvb3QvaGVhZC5TCisrKyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwpAQCAtNzMy
LDYgKzczMiwxNyBAQCB0cmFtcG9saW5lX3NldHVwOgogICAgICAgICBjbXAgICAgICRzeW1fb2Zm
cyhfX2Jvb3RzeW1fc2VnX3N0b3ApLCVlZGkKICAgICAgICAgamIgICAgICAxYgogCisgICAgICAg
IC8qIFJlbG9jYXRpb25zIGZvciB0aGUgYm9vdCBkYXRhIHNlY3Rpb24uICovCisgICAgICAgIG1v
diAgICAgc3ltX2ZzKHRyYW1wb2xpbmVfcGh5cyksJWVkeAorICAgICAgICBhZGQgICAgICQoYm9v
dF90cmFtcG9saW5lX2VuZCAtIGJvb3RfdHJhbXBvbGluZV9zdGFydCksJWVkeAorICAgICAgICBt
b3YgICAgICRzeW1fb2ZmcyhfX2Jvb3RkYXRhc3ltX3JlbF9zdGFydCksJWVkaQorMToKKyAgICAg
ICAgbW92ICAgICAlZnM6KCVlZGkpLCVlYXgKKyAgICAgICAgYWRkICAgICAlZWR4LCVmczooJWVk
aSwlZWF4KQorICAgICAgICBhZGQgICAgICQ0LCVlZGkKKyAgICAgICAgY21wICAgICAkc3ltX29m
ZnMoX19ib290ZGF0YXN5bV9yZWxfc3RvcCksJWVkaQorICAgICAgICBqYiAgICAgIDFiCisKICAg
ICAgICAgLyogRG8gbm90IHBhcnNlIGNvbW1hbmQgbGluZSBvbiBFRkkgcGxhdGZvcm0gaGVyZS4g
Ki8KICAgICAgICAgY21wYiAgICAkMCxzeW1fZnMoZWZpX3BsYXRmb3JtKQogICAgICAgICBqbnog
ICAgIDFmCkBAIC03NjksNiArNzgwLDExIEBAIHRyYW1wb2xpbmVfc2V0dXA6CiAgICAgICAgIG1v
diAgICAgJCgoYm9vdF90cmFtcG9saW5lX2VuZCAtIGJvb3RfdHJhbXBvbGluZV9zdGFydCkgLyA0
KSwlZWN4CiAgICAgICAgIHJlcCBtb3ZzbCAlZnM6KCVlc2kpLCVlczooJWVkaSkKIAorICAgICAg
ICAvKiBDb3B5IGJvb3QgZGF0YSB0ZW1wbGF0ZSB0byBsb3cgbWVtb3J5LiAqLworICAgICAgICBt
b3YgICAgICRzeW1fb2Zmcyhib290ZGF0YV9zdGFydCksJWVzaQorICAgICAgICBtb3YgICAgICQo
KGJvb3RkYXRhX2VuZCAtIGJvb3RkYXRhX3N0YXJ0ICsgMykgLyA0KSwlZWN4CisgICAgICAgIHJl
cCBtb3ZzbCAlZnM6KCVlc2kpLCVlczooJWVkaSkKKwogICAgICAgICAvKiBKdW1wIGludG8gdGhl
IHJlbG9jYXRlZCB0cmFtcG9saW5lLiAqLwogICAgICAgICBscmV0CiAKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9ib290L21lbS5TIGIveGVuL2FyY2gveDg2L2Jvb3QvbWVtLlMKaW5kZXggYWEz
OTYwODQ0Mi4uODZmMGZhOWFmNyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvbWVtLlMK
KysrIGIveGVuL2FyY2gveDg2L2Jvb3QvbWVtLlMKQEAgLTY3LDYgKzY3LDcgQEAgZ2V0X21lbW9y
eV9tYXA6CiAgICAgICAgIHJldAogCiAgICAgICAgIC5hbGlnbiAgNAorICAgICAgICAucHVzaHNl
Y3Rpb24gLmRhdGEuYm9vdDE2LCAiYXciLCBAcHJvZ2JpdHMKIEdMT0JBTChiaW9zX2U4MjBtYXAp
CiAgICAgICAgIC5maWxsICAgRTgyMF9CSU9TX01BWCoyMCwxLDAKIEdMT0JBTChiaW9zX2U4MjBu
cikKQEAgLTc1LDMgKzc2LDQgQEAgR0xPQkFMKGxvd21lbV9rYikKICAgICAgICAgLmxvbmcgICAw
CiBHTE9CQUwoaGlnaG1lbV9rYikKICAgICAgICAgLmxvbmcgICAwCisJLnBvcHNlY3Rpb24KZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUuUyBiL3hlbi9hcmNoL3g4Ni9i
b290L3RyYW1wb2xpbmUuUwppbmRleCAwZjRhNzQwZmNiLi5mZGZlZTJlZGIxIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMKKysrIGIveGVuL2FyY2gveDg2L2Jvb3Qv
dHJhbXBvbGluZS5TCkBAIC00NywxMSArNDcsMTUgQEAKICAgICAgICAgLmxvbmcgMTExYiAtIChv
ZmYpIC0gLjsgICAgICAgICAgICBcCiAgICAgICAgIC5wb3BzZWN0aW9uCiAKLSNkZWZpbmUgYm9v
dGRhdGFzeW0ocykgKChzKS1ib290X3RyYW1wb2xpbmVfc3RhcnQpCisgICAgICAgIC5wdXNoc2Vj
dGlvbiAuZGF0YS5ib290MTYsICJhdyIsIEBwcm9nYml0cworR0xPQkFMKGJvb3RkYXRhX3N0YXJ0
KQorICAgICAgICAucG9wc2VjdGlvbgorCisjZGVmaW5lIGJvb3RkYXRhc3ltKHMpICgocyktYm9v
dGRhdGFfc3RhcnQrKGJvb3RfdHJhbXBvbGluZV9lbmQtYm9vdF90cmFtcG9saW5lX3N0YXJ0KSkK
ICNkZWZpbmUgYm9vdGRhdGFzeW1fcmVsKHN5bSwgb2ZmLCBvcG5kLi4uKSBcCiAgICAgICAgIGJv
b3RkYXRhc3ltKHN5bSksIyNvcG5kOyAgICAgICAgICAgXAogMTExOjsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICAgICAgLnB1c2hzZWN0aW9uIC5ib290ZGF0YXN5
bV9yZWwsICJhIjtcCisgICAgICAgIC5wdXNoc2VjdGlvbiAuYm9vdHN5bV9yZWwsICJhIjtcCiAg
ICAgICAgIC5sb25nIDExMWIgLSAob2ZmKSAtIC47ICAgICAgICAgICAgXAogICAgICAgICAucG9w
c2VjdGlvbgogCkBAIC0xMDAsNyArMTA0LDcgQEAgR0xPQkFMKHRyYW1wb2xpbmVfY3B1X3N0YXJ0
ZWQpCiAgICAgICAgIC53b3JkICAgMAogaWR0XzQ4OiAud29yZCAgIDAsIDAsIDAgIyBiYXNlID0g
bGltaXQgPSAwCiAgICAgICAgIC53b3JkICAgMAotZ2R0XzQ4OiAud29yZCAgIDYqOC0xCitnZHRf
NDg6IC53b3JkICAgNyo4LTEKICAgICAgICAgLmxvbmcgICB0cmFtcDMyc3ltX3JlbCh0cmFtcG9s
aW5lX2dkdCw0KQogCiAvKiBTdGFydCBvZiB0cmFtcDMyc3ltIHNlY3Rpb24gd2hpY2ggY2FuIGJl
IHVzZWQgaW4gcGxhY2UgZHVyaW5nIGJvb3QgKi8KQEAgLTMxMiw2ICszMTYsMjMgQEAgdHJhbXBv
bGluZV9ib290X2NwdV9lbnRyeToKICAgICAgICAgbW92ICAgICAlZWF4LCVncwogICAgICAgICBt
b3YgICAgICVlYXgsJXNzCiAKKyAgICAgICAgLyoKKyAgICAgICAgICogQ29weSBsb2NhbGx5LWdh
dGhlcmVkIGRhdGEgYmFjayB1cCBpbnRvIHRoZSBYZW4gcGh5c2ljYWwgaW1hZ2UKKyAgICAgICAg
ICovCisgICAgICAgIG1vdiAgICAgJEJPT1RfRlMsJWVheAorICAgICAgICBtb3YgICAgICVlYXgs
JWVzCisKKyAgICAgICAgbW92ICAgICAkc3ltX29mZnMoYm9vdGRhdGFfZW5kKSwlZWN4CisgICAg
ICAgIG1vdiAgICAgJHN5bV9vZmZzKGJvb3RkYXRhX3N0YXJ0KSwlZWRpCisgICAgICAgIHN1YiAg
ICAgJWVkaSwlZWN4CisgICAgICAgIG1vdiAgICAgJGJvb3RkYXRhc3ltX3JlbChib290ZGF0YV9z
dGFydCw0LCVlc2kpCisgICAgICAgIHJlcCBtb3ZzYiAlZHM6KCVlc2kpLCVlczooJWVkaSkKKwor
ICAgICAgICAvKgorICAgICAgICAgKiAlZXMgc3RpbGwgcG9pbnRzIHRvIEJPT1RfRlMgYnV0IHRy
YW1wb2xpbmVfcHJvdG1vZGVfZW50cnkKKyAgICAgICAgICogcmVsb2FkcyBpdCBhbnl3YXkuCisg
ICAgICAgICAqLworCiAgICAgICAgIC8qIEVCWCA9PSAwIGluZGljYXRlcyB3ZSBhcmUgdGhlIEJQ
IChCb290IFByb2Nlc3NvcikuICovCiAgICAgICAgIHhvciAgICAgJWVieCwlZWJ4CiAKQEAgLTMz
OSw4ICszNjAsMTAgQEAgdmVzYV9zaXplOgogICAgICAgICAud29yZCAgIDAsMCwwICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLyogd2lkdGggeCBkZXB0aCB4IGhlaWdodCAqLwogI2VuZGlmCiAK
KyAgICAgICAgLnB1c2hzZWN0aW9uIC5kYXRhLmJvb3QxNiwgImF3IiwgQHByb2diaXRzCiBHTE9C
QUwoa2JkX3NoaWZ0X2ZsYWdzKQogICAgICAgICAuYnl0ZSAgIDAKKyAgICAgICAgLnBvcHNlY3Rp
b24KIAogcm1faWR0OiAud29yZCAgIDI1Nio0LTEsIDAsIDAKIApAQCAtMzQ5LDMgKzM3Miw3IEBA
IHJtX2lkdDogLndvcmQgICAyNTYqNC0xLCAwLCAwCiAjaWZkZWYgQ09ORklHX1ZJREVPCiAjaW5j
bHVkZSAidmlkZW8uUyIKICNlbmRpZgorCisgICAgICAgIC5wdXNoc2VjdGlvbiAuZGF0YS5ib290
MTYsICJhdyIsIEBwcm9nYml0cworR0xPQkFMKGJvb3RkYXRhX2VuZCkKKyAgICAgICAgLnBvcHNl
Y3Rpb24KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ib290L3ZpZGVvLlMgYi94ZW4vYXJjaC94
ODYvYm9vdC92aWRlby5TCmluZGV4IDUwODdjNmE0ZDUuLjQ2MDg0NjRiNzcgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9ib290L3ZpZGVvLlMKKysrIGIveGVuL2FyY2gveDg2L2Jvb3QvdmlkZW8u
UwpAQCAtMTUsMTAgKzE1LDEwIEBACiAKICNpbmNsdWRlICJ2aWRlby5oIgogCi0vKiBTY3JhdGNo
IHNwYWNlIGxheW91dDogYm9vdF90cmFtcG9saW5lX2VuZCB0byBib290X3RyYW1wb2xpbmVfZW5k
KzB4MTAwMC4gKi8KLSNkZWZpbmUgbW9kZWxpc3QgICAgICAgYm9vdHN5bShib290X3RyYW1wb2xp
bmVfZW5kKSAgIC8qIDJrQiAoMjU2IGVudHJpZXMpICovCi0jZGVmaW5lIHZlc2FfZ2xvYl9pbmZv
IChtb2RlbGlzdCArIDB4ODAwKSAgICAgICAgLyogMWtCICovCi0jZGVmaW5lIHZlc2FfbW9kZV9p
bmZvICh2ZXNhX2dsb2JfaW5mbyArIDB4NDAwKSAgLyogMWtCICovCisvKiBTY3JhdGNoIHNwYWNl
IGxheW91dDogYm9vdGRhdGFfZW5kIHRvIGJvb3RkYXRhX2VuZCsweDEwMDAuICovCisjZGVmaW5l
IG1vZGVsaXN0KHQpICAgICAgIGJvb3RkYXRhc3ltX3JlbChib290ZGF0YV9lbmQsMix0KSAgICAg
ICAgIC8qIDJLaUIgKDI1NiBlbnRyaWVzKSAqLworI2RlZmluZSB2ZXNhX2dsb2JfaW5mbyh0KSBi
b290ZGF0YXN5bV9yZWwoKGJvb3RkYXRhX2VuZCsweDgwMCksMix0KSAvKiAxS2lCICovCisjZGVm
aW5lIHZlc2FfbW9kZV9pbmZvKHQpIGJvb3RkYXRhc3ltX3JlbCgoYm9vdGRhdGFfZW5kKzB4YzAw
KSwyLHQpIC8qIDFLaUIgKi8KIAogLyogUmV0cmlldmUgRXh0ZW5kZWQgRGlzcGxheSBJZGVudGlm
aWNhdGlvbiBEYXRhLiAqLwogI2RlZmluZSBDT05GSUdfRklSTVdBUkVfRURJRApAQCAtMTEzLDcg
KzExMyw3IEBAIG1vcGFyMjogbW92YiAgICAlYWwsIF9wYXJhbShQQVJBTV9WSURFT19MSU5FUykK
IAogIyBGZXRjaGluZyBvZiBWRVNBIGZyYW1lIGJ1ZmZlciBwYXJhbWV0ZXJzCiBtb3Bhcl9ncjoK
LSAgICAgICAgbGVhdyAgICB2ZXNhX21vZGVfaW5mbywgJWRpCisgICAgICAgIGxlYXcgICAgdmVz
YV9tb2RlX2luZm8oJWRpKQogICAgICAgICBtb3ZiICAgICQweDIzLCBfcGFyYW0oUEFSQU1fSEFW
RV9WR0EpCiAgICAgICAgIG1vdncgICAgMTYoJWRpKSwgJWF4CiAgICAgICAgIG1vdncgICAgJWF4
LCBfcGFyYW0oUEFSQU1fTEZCX0xJTkVMRU5HVEgpCkBAIC0xMzQsNyArMTM0LDcgQEAgbW9wYXJf
Z3I6CiAgICAgICAgIG1vdncgICAgJWF4LCBfcGFyYW0oUEFSQU1fVkVTQV9BVFRSSUIpCiAKICMg
Z2V0IHZpZGVvIG1lbSBzaXplCi0gICAgICAgIGxlYXcgICAgdmVzYV9nbG9iX2luZm8sICVkaQor
ICAgICAgICBsZWF3ICAgIHZlc2FfZ2xvYl9pbmZvKCVkaSkKICAgICAgICAgeG9ybCAgICAlZWF4
LCAlZWF4CiAgICAgICAgIG1vdncgICAgMTgoJWRpKSwgJWF4CiAgICAgICAgIG1vdmwgICAgJWVh
eCwgX3BhcmFtKFBBUkFNX0xGQl9TSVpFKQpAQCAtMjI2LDcgKzIyNiw3IEBAIGFuMTogICAgY2Fs
bCAgICBwcnRzdHIKICAgICAgICAgbGVhdyAgICBib290c3ltKGxpc3RoZHIpLCAlc2kgICAjIFRh
YmxlIGhlYWRlcgogICAgICAgICBjYWxsICAgIHBydHN0cgogICAgICAgICBtb3ZiICAgICQweDMw
LCAlZGwgICAgICAgICAgICAgICMgREwgaG9sZHMgbW9kZSBudW1iZXIKLSAgICAgICAgbGVhdyAg
ICBtb2RlbGlzdCwgJXNpCisgICAgICAgIGxlYXcgICAgbW9kZWxpc3QoJXNpKQogbG0xOiAgICBj
bXB3ICAgICRBU0tfVkdBLCAoJXNpKSAgICAgICAgICMgRW5kPwogICAgICAgICBqeiAgICAgIGxt
MgogCkBAIC00MzUsMTMgKzQzNSwxMyBAQCBzZXRtZW51OgogICAgICAgICBqbXAgICAgIG1vZGVf
c2V0CiAKIGNoZWNrX3Zlc2E6Ci0gICAgICAgIGxlYXcgICAgdmVzYV9nbG9iX2luZm8sICVkaQor
ICAgICAgICBsZWF3ICAgIHZlc2FfZ2xvYl9pbmZvKCVkaSkKICAgICAgICAgbW92dyAgICAkMHg0
ZjAwLCAlYXgKICAgICAgICAgaW50ICAgICAkMHgxMAogICAgICAgICBjbXB3ICAgICQweDAwNGYs
ICVheAogICAgICAgICBqbnogICAgIHNldGJhZAogCi0gICAgICAgIGxlYXcgICAgdmVzYV9tb2Rl
X2luZm8sICVkaQorICAgICAgICBsZWF3ICAgIHZlc2FfbW9kZV9pbmZvKCVkaSkKICAgICAgICAg
c3ViYiAgICAkVklERU9fRklSU1RfVkVTQT4+OCwgJWJoCiAgICAgICAgIG1vdncgICAgJWJ4LCAl
Y3ggICAgICAgICAgICAgICAgIyBHZXQgbW9kZSBpbmZvcm1hdGlvbiBzdHJ1Y3R1cmUKICAgICAg
ICAgbW92dyAgICAkMHg0ZjAxLCAlYXgKQEAgLTUwOSw3ICs1MDksNyBAQCBpbmlkeDogIG91dGIg
ICAgJWFsLCAlZHggICAgICAgICAgICAgICAgIyBSZWFkIGZyb20gaW5kZXhlZCBWR0EgcmVnaXN0
ZXIKIAogc2V0dmVzYWJ5c2l6ZToKICAgICAgICAgY2FsbCAgICBtb2RlX3RhYmxlCi0gICAgICAg
IGxlYXcgICAgbW9kZWxpc3QsJXNpCisgICAgICAgIGxlYXcgICAgbW9kZWxpc3QoJXNpKQogMTog
ICAgICBhZGQgICAgICQ4LCVzaQogICAgICAgICBjbXB3ICAgICRBU0tfVkdBLC04KCVzaSkgICAg
ICAgICMgRW5kPwogICAgICAgICBqZSAgICAgIF9zZXRiYWQKQEAgLTY2OSw3ICs2NjksNyBAQCBt
b2RlX3RhYmxlOgogICAgICAgICBvcncgICAgICVkaSwgJWRpCiAgICAgICAgIGpueiAgICAgbXRh
YjEKIAotICAgICAgICBsZWF3ICAgIG1vZGVsaXN0LCAlZGkgICAgICAgICAgICMgU3RvcmUgc3Rh
bmRhcmQgbW9kZXM6CisgICAgICAgIGxlYXcgICAgbW9kZWxpc3QoJWRpKSAgICAgICAgICAgIyBT
dG9yZSBzdGFuZGFyZCBtb2RlczoKICAgICAgICAgbW92dyAgICAkVklERU9fODB4MjUsKCVkaSkg
ICAgICAjIFRoZSA4MHgyNSBtb2RlIChBTEwpCiAgICAgICAgIG1vdncgICAgJDB4NTAsMiglZGkp
CiAgICAgICAgIG1vdncgICAgJDB4MTksNCglZGkpCkBAIC02ODQsNyArNjg0LDcgQEAgbW9kZV90
YWJsZToKIAogICAgICAgICBtb3Z3ICAgICRBU0tfVkdBLCAoJWRpKSAgICAgICAgICMgRW5kIG1h
cmtlcgogICAgICAgICBtb3Z3ICAgICVkaSwgYm9vdHN5bShtdF9lbmQpCi1tdGFiMTogIGxlYXcg
ICAgbW9kZWxpc3QsICVzaSAgICAgICAgICAgIyBTST1tb2RlIGxpc3QsIERJPWxpc3QgZW5kCitt
dGFiMTogIGxlYXcgICAgbW9kZWxpc3QoJXNpKSAgICAgICAgICAgIyBTST1tb2RlIGxpc3QsIERJ
PWxpc3QgZW5kCiByZXQwOiAgIHJldAogCiAjIE1vZGVzIHVzYWJsZSBvbiBhbGwgc3RhbmRhcmQg
VkdBcwpAQCAtNzAwLDcgKzcwMCw3IEBAIHZnYV9tb2Rlc19lbmQ6CiAjIERldGVjdCBWRVNBIG1v
ZGVzLgogdmVzYV9tb2RlczoKICAgICAgICAgbW92dyAgICAlZGksICVicCAgICAgICAgICAgICAg
ICAjIEJQPW9yaWdpbmFsIG1vZGUgdGFibGUgZW5kCi0gICAgICAgIGxlYXcgICAgdmVzYV9nbG9i
X2luZm8sICVkaQorICAgICAgICBsZWF3ICAgIHZlc2FfZ2xvYl9pbmZvKCVkaSkKICAgICAgICAg
bW92dyAgICAkMHg0ZjAwLCAlYXggICAgICAgICAgICAjIFZFU0EgR2V0IGNhcmQgaW5mbyBjYWxs
CiAgICAgICAgIGludCAgICAgJDB4MTAKICAgICAgICAgbW92dyAgICAlZGksICVzaQpAQCAtODk3
LDcgKzg5Nyw3IEBAIHN0b3JlX2VkaWQ6CiAgICAgICAgIGNtcGIgICAgJDEsIGJvb3RzeW0ob3B0
X2VkaWQpICAgIyBFRElEIGRpc2FibGVkIG9uIGNtZGxpbmUgKGVkaWQ9bm8pPwogICAgICAgICBq
ZSAgICAgIC5Mbm9fZWRpZAogCi0gICAgICAgIGxlYXcgICAgdmVzYV9nbG9iX2luZm8sICVkaQor
ICAgICAgICBsZWF3ICAgIHZlc2FfZ2xvYl9pbmZvKCVkaSkKICAgICAgICAgbW92dyAgICAkMHg0
ZjAwLCAlYXgKICAgICAgICAgaW50ICAgICAkMHgxMAogICAgICAgICBjbXB3ICAgICQweDAwNGYs
ICVheApAQCAtOTkwLDYgKzk5MCw3IEBAIG5hbWVfYmFubjogICAgICAuYXNjaXogICJWaWRlbyBh
ZGFwdGVyOiAiCiAKIGZvcmNlX3NpemU6ICAgICAud29yZCAgIDAgICAgICAgIyBVc2UgdGhpcyBz
aXplIGluc3RlYWQgb2YgdGhlIG9uZSBpbiBCSU9TIHZhcnMKIAorICAgICAgICAucHVzaHNlY3Rp
b24gLmRhdGEuYm9vdDE2LCAiYXciLCBAcHJvZ2JpdHMKIEdMT0JBTChib290X3ZpZF9pbmZvKQog
ICAgICAgICAuYnl0ZSAgIDAsIDAgICAgLyogb3JpZ194LCBvcmlnX3kgKi8KICAgICAgICAgLmJ5
dGUgICAzICAgICAgIC8qIHRleHQgbW9kZSAzICAgICovCkBAIC0xMDAxLDMgKzEwMDIsNCBAQCBH
TE9CQUwoYm9vdF9lZGlkX2luZm8pCiAgICAgICAgIC5maWxsICAgMTI4LDEsMHgxMwogR0xPQkFM
KGJvb3RfZWRpZF9jYXBzKQogICAgICAgICAud29yZCAgIDB4MTMxMworICAgICAgICAucG9wc2Vj
dGlvbgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jIGIveGVu
L2FyY2gveDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jCmluZGV4IGVhMThjMzIxNWEuLjVjODk1M2Fl
MTkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9wbGF0Zm9ybV9oeXBlcmNhbGwuYworKysgYi94
ZW4vYXJjaC94ODYvcGxhdGZvcm1faHlwZXJjYWxsLmMKQEAgLTMzMywxMCArMzMzLDEwIEBAIHJl
dF90IGRvX3BsYXRmb3JtX29wKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX3BsYXRmb3JtX29w
X3QpIHVfeGVucGZfb3ApCiAgICAgICAgICAgICB1MTYgbGVuZ3RoOwogCiAgICAgICAgICAgICBy
ZXQgPSAtRVNSQ0g7Ci0gICAgICAgICAgICBpZiAoIG9wLT51LmZpcm13YXJlX2luZm8uaW5kZXgg
Pj0gYm9vdHN5bShib290X2VkZF9pbmZvX25yKSApCisgICAgICAgICAgICBpZiAoIG9wLT51LmZp
cm13YXJlX2luZm8uaW5kZXggPj0gYm9vdF9lZGRfaW5mb19uciApCiAgICAgICAgICAgICAgICAg
YnJlYWs7CiAKLSAgICAgICAgICAgIGluZm8gPSBib290c3ltKGJvb3RfZWRkX2luZm8pICsgb3At
PnUuZmlybXdhcmVfaW5mby5pbmRleDsKKyAgICAgICAgICAgIGluZm8gPSBib290X2VkZF9pbmZv
ICsgb3AtPnUuZmlybXdhcmVfaW5mby5pbmRleDsKIAogICAgICAgICAgICAgLyogVHJhbnNmZXIg
dGhlIEVERCBpbmZvIGJsb2NrLiAqLwogICAgICAgICAgICAgcmV0ID0gLUVGQVVMVDsKQEAgLTM3
MiwxMCArMzcyLDEwIEBAIHJldF90IGRvX3BsYXRmb3JtX29wKFhFTl9HVUVTVF9IQU5ETEVfUEFS
QU0oeGVuX3BsYXRmb3JtX29wX3QpIHVfeGVucGZfb3ApCiAgICAgICAgICAgICBjb25zdCBzdHJ1
Y3QgbWJyX3NpZ25hdHVyZSAqc2lnOwogCiAgICAgICAgICAgICByZXQgPSAtRVNSQ0g7Ci0gICAg
ICAgICAgICBpZiAoIG9wLT51LmZpcm13YXJlX2luZm8uaW5kZXggPj0gYm9vdHN5bShib290X21i
cl9zaWduYXR1cmVfbnIpICkKKyAgICAgICAgICAgIGlmICggb3AtPnUuZmlybXdhcmVfaW5mby5p
bmRleCA+PSBib290X21icl9zaWduYXR1cmVfbnIgKQogICAgICAgICAgICAgICAgIGJyZWFrOwog
Ci0gICAgICAgICAgICBzaWcgPSBib290c3ltKGJvb3RfbWJyX3NpZ25hdHVyZSkgKyBvcC0+dS5m
aXJtd2FyZV9pbmZvLmluZGV4OworICAgICAgICAgICAgc2lnID0gYm9vdF9tYnJfc2lnbmF0dXJl
ICsgb3AtPnUuZmlybXdhcmVfaW5mby5pbmRleDsKIAogICAgICAgICAgICAgb3AtPnUuZmlybXdh
cmVfaW5mby51LmRpc2tfbWJyX3NpZ25hdHVyZS5kZXZpY2UgPSBzaWctPmRldmljZTsKICAgICAg
ICAgICAgIG9wLT51LmZpcm13YXJlX2luZm8udS5kaXNrX21icl9zaWduYXR1cmUubWJyX3NpZ25h
dHVyZSA9CkBAIC0zOTEsMTMgKzM5MSwxMyBAQCByZXRfdCBkb19wbGF0Zm9ybV9vcChYRU5fR1VF
U1RfSEFORExFX1BBUkFNKHhlbl9wbGF0Zm9ybV9vcF90KSB1X3hlbnBmX29wKQogI2lmZGVmIENP
TkZJR19WSURFTwogICAgICAgICAgICAgaWYgKCBvcC0+dS5maXJtd2FyZV9pbmZvLmluZGV4ICE9
IDAgKQogICAgICAgICAgICAgICAgIGJyZWFrOwotICAgICAgICAgICAgaWYgKCAqKHUzMiAqKWJv
b3RzeW0oYm9vdF9lZGlkX2luZm8pID09IDB4MTMxMzEzMTMgKQorICAgICAgICAgICAgaWYgKCAq
KHUzMiAqKWJvb3RfZWRpZF9pbmZvID09IDB4MTMxMzEzMTMgKQogICAgICAgICAgICAgICAgIGJy
ZWFrOwogCiAgICAgICAgICAgICBvcC0+dS5maXJtd2FyZV9pbmZvLnUudmJlZGRjX2luZm8uY2Fw
YWJpbGl0aWVzID0KLSAgICAgICAgICAgICAgICBib290c3ltKGJvb3RfZWRpZF9jYXBzKTsKKyAg
ICAgICAgICAgICAgICBib290X2VkaWRfY2FwczsKICAgICAgICAgICAgIG9wLT51LmZpcm13YXJl
X2luZm8udS52YmVkZGNfaW5mby5lZGlkX3RyYW5zZmVyX3RpbWUgPQotICAgICAgICAgICAgICAg
IGJvb3RzeW0oYm9vdF9lZGlkX2NhcHMpID4+IDg7CisgICAgICAgICAgICAgICAgYm9vdF9lZGlk
X2NhcHMgPj4gODsKIAogICAgICAgICAgICAgcmV0ID0gMDsKICAgICAgICAgICAgIGlmICggX19j
b3B5X2ZpZWxkX3RvX2d1ZXN0KHVfeGVucGZfb3AsIG9wLCB1LmZpcm13YXJlX2luZm8uCkBAIC00
MDUsNyArNDA1LDcgQEAgcmV0X3QgZG9fcGxhdGZvcm1fb3AoWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TSh4ZW5fcGxhdGZvcm1fb3BfdCkgdV94ZW5wZl9vcCkKICAgICAgICAgICAgICAgICAgX19jb3B5
X2ZpZWxkX3RvX2d1ZXN0KHVfeGVucGZfb3AsIG9wLCB1LmZpcm13YXJlX2luZm8uCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1LnZiZWRkY19pbmZvLmVkaWRfdHJhbnNm
ZXJfdGltZSkgfHwKICAgICAgICAgICAgICAgICAgY29weV90b19jb21wYXQob3AtPnUuZmlybXdh
cmVfaW5mby51LnZiZWRkY19pbmZvLmVkaWQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJvb3RzeW0oYm9vdF9lZGlkX2luZm8pLCAxMjgpICkKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYm9vdF9lZGlkX2luZm8sIDEyOCkgKQogICAgICAgICAgICAgICAgIHJldCA9
IC1FRkFVTFQ7CiAjZW5kaWYKICAgICAgICAgICAgIGJyZWFrOwpAQCAtNDIyLDcgKzQyMiw3IEBA
IHJldF90IGRvX3BsYXRmb3JtX29wKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX3BsYXRmb3Jt
X29wX3QpIHVfeGVucGZfb3ApCiAgICAgICAgICAgICBpZiAoIG9wLT51LmZpcm13YXJlX2luZm8u
aW5kZXggIT0gMCApCiAgICAgICAgICAgICAgICAgYnJlYWs7CiAKLSAgICAgICAgICAgIG9wLT51
LmZpcm13YXJlX2luZm8udS5rYmRfc2hpZnRfZmxhZ3MgPSBib290c3ltKGtiZF9zaGlmdF9mbGFn
cyk7CisgICAgICAgICAgICBvcC0+dS5maXJtd2FyZV9pbmZvLnUua2JkX3NoaWZ0X2ZsYWdzID0g
a2JkX3NoaWZ0X2ZsYWdzOwogCiAgICAgICAgICAgICByZXQgPSAwOwogICAgICAgICAgICAgaWYg
KCBfX2NvcHlfZmllbGRfdG9fZ3Vlc3QodV94ZW5wZl9vcCwgb3AsCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvc2V0dXAuYyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCmluZGV4IGI3MTRlM2MyMzcu
LjRkZDRjNDE2MWMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9zZXR1cC5jCkBAIC01MDcsNyArNTA3LDcgQEAgZXh0ZXJuIHN0cnVjdCBib290X3Zp
ZGVvX2luZm8gYm9vdF92aWRfaW5mbzsKIHN0YXRpYyB2b2lkIF9faW5pdCBwYXJzZV92aWRlb19p
bmZvKHZvaWQpCiB7CiAjaWZkZWYgQ09ORklHX1ZJREVPCi0gICAgc3RydWN0IGJvb3RfdmlkZW9f
aW5mbyAqYnZpID0gJmJvb3RzeW0oYm9vdF92aWRfaW5mbyk7CisgICAgc3RydWN0IGJvb3Rfdmlk
ZW9faW5mbyAqYnZpID0gJmJvb3RfdmlkX2luZm87CiAKICAgICAvKiB2Z2FfY29uc29sZV9pbmZv
IGlzIGZpbGxlZCBkaXJlY3RseSBvbiBFRkkgcGxhdGZvcm0uICovCiAgICAgaWYgKCBlZmlfZW5h
YmxlZChFRklfQk9PVCkgKQpAQCAtNjY2LDEyICs2NjYsMTEgQEAgc3RhdGljIGNoYXIgKiBfX2lu
aXQgY21kbGluZV9jb29rKGNoYXIgKnAsIGNvbnN0IGNoYXIgKmxvYWRlcl9uYW1lKQogCiBzdGF0
aWMgaW50IGNvcHlfYmlvc19lODIwKHN0cnVjdCBlODIwZW50cnkgKm1hcCwgdW5zaWduZWQgaW50
IGxpbWl0KQogewotICAgIHVuc2lnbmVkIGludCBuID0gYm9vdHN5bShiaW9zX2U4MjBucik7Cisg
ICAgdW5zaWduZWQgaW50IG4gPSBiaW9zX2U4MjBucjsKICAgICBpZiAobiA+IGxpbWl0KQogICAg
ICAgICBuID0gbGltaXQ7Ci0KICAgICBpZiAobikKLSAgICAgICAgbWVtY3B5KG1hcCwgYm9vdHN5
bShiaW9zX2U4MjBtYXApLCBzaXplb2YoKm1hcCkgKiBuKTsKKyAgICAgICAgbWVtY3B5KG1hcCwg
Ymlvc19lODIwbWFwLCBzaXplb2YoKm1hcCkgKiBuKTsKIAogICAgIHJldHVybiBuOwogfQpAQCAt
ODAyLDE1ICs4MDEsMTUgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWdu
ZWQgbG9uZyBtYmlfcCkKICAgICB9CiAKICAgICAvKiBQcmludCBWQkUvRERDIEVESUQgaW5mb3Jt
YXRpb24uICovCi0gICAgaWYgKCBib290c3ltKGJvb3RfZWRpZF9jYXBzKSAhPSAweDEzMTMgKQor
ICAgIGlmICggYm9vdF9lZGlkX2NhcHMgIT0gMHgxMzEzICkKICAgICB7Ci0gICAgICAgIHUxNiBj
YXBzID0gYm9vdHN5bShib290X2VkaWRfY2Fwcyk7CisgICAgICAgIHUxNiBjYXBzID0gYm9vdF9l
ZGlkX2NhcHM7CiAgICAgICAgIHByaW50aygiIFZCRS9EREMgbWV0aG9kczolcyVzJXM7ICIsCiAg
ICAgICAgICAgICAgICAoY2FwcyAmIDEpID8gIiBWMSIgOiAiIiwKICAgICAgICAgICAgICAgIChj
YXBzICYgMikgPyAiIFYyIiA6ICIiLAogICAgICAgICAgICAgICAgIShjYXBzICYgMykgPyAiIG5v
bmUiIDogIiIpOwogICAgICAgICBwcmludGsoIkVESUQgdHJhbnNmZXIgdGltZTogJWQgc2Vjb25k
c1xuIiwgY2FwcyA+PiA4KTsKLSAgICAgICAgaWYgKCAqKHUzMiAqKWJvb3RzeW0oYm9vdF9lZGlk
X2luZm8pID09IDB4MTMxMzEzMTMgKQorICAgICAgICBpZiAoICoodTMyICopYm9vdF9lZGlkX2lu
Zm8gPT0gMHgxMzEzMTMxMyApCiAgICAgICAgIHsKICAgICAgICAgICAgIHByaW50aygiIEVESUQg
aW5mbyBub3QgcmV0cmlldmVkIGJlY2F1c2UgIik7CiAgICAgICAgICAgICBpZiAoICEoY2FwcyAm
IDMpICkKQEAgLTgyNSw5ICs4MjQsOSBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hl
bih1bnNpZ25lZCBsb25nIG1iaV9wKQogCiAgICAgcHJpbnRrKCJEaXNjIGluZm9ybWF0aW9uOlxu
Iik7CiAgICAgcHJpbnRrKCIgRm91bmQgJWQgTUJSIHNpZ25hdHVyZXNcbiIsCi0gICAgICAgICAg
IGJvb3RzeW0oYm9vdF9tYnJfc2lnbmF0dXJlX25yKSk7CisgICAgICAgICAgIGJvb3RfbWJyX3Np
Z25hdHVyZV9ucik7CiAgICAgcHJpbnRrKCIgRm91bmQgJWQgRUREIGluZm9ybWF0aW9uIHN0cnVj
dHVyZXNcbiIsCi0gICAgICAgICAgIGJvb3RzeW0oYm9vdF9lZGRfaW5mb19ucikpOworICAgICAg
ICAgICBib290X2VkZF9pbmZvX25yKTsKIAogICAgIC8qIENoZWNrIHRoYXQgd2UgaGF2ZSBhdCBs
ZWFzdCBvbmUgTXVsdGlib290IG1vZHVsZS4gKi8KICAgICBpZiAoICEobWJpLT5mbGFncyAmIE1C
SV9NT0RVTEVTKSB8fCAobWJpLT5tb2RzX2NvdW50ID09IDApICkKQEAgLTg5OSwxNCArODk4LDE0
IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3Ap
CiAgICAgICAgICAgICBieXRlcyArPSBtYXAtPnNpemUgKyA0OwogICAgICAgICB9CiAgICAgfQot
ICAgIGVsc2UgaWYgKCBib290c3ltKGxvd21lbV9rYikgKQorICAgIGVsc2UgaWYgKCBsb3dtZW1f
a2IgKQogICAgIHsKICAgICAgICAgbWVtbWFwX3R5cGUgPSAiWGVuLWU4MDEiOwogICAgICAgICBl
ODIwX3Jhdy5tYXBbMF0uYWRkciA9IDA7Ci0gICAgICAgIGU4MjBfcmF3Lm1hcFswXS5zaXplID0g
Ym9vdHN5bShsb3dtZW1fa2IpIDw8IDEwOworICAgICAgICBlODIwX3Jhdy5tYXBbMF0uc2l6ZSA9
IGxvd21lbV9rYiA8PCAxMDsKICAgICAgICAgZTgyMF9yYXcubWFwWzBdLnR5cGUgPSBFODIwX1JB
TTsKICAgICAgICAgZTgyMF9yYXcubWFwWzFdLmFkZHIgPSAweDEwMDAwMDsKLSAgICAgICAgZTgy
MF9yYXcubWFwWzFdLnNpemUgPSBib290c3ltKGhpZ2htZW1fa2IpIDw8IDEwOworICAgICAgICBl
ODIwX3Jhdy5tYXBbMV0uc2l6ZSA9IGhpZ2htZW1fa2IgPDwgMTA7CiAgICAgICAgIGU4MjBfcmF3
Lm1hcFsxXS50eXBlID0gRTgyMF9SQU07CiAgICAgICAgIGU4MjBfcmF3Lm5yX21hcCA9IDI7CiAg
ICAgfQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUyBiL3hlbi9hcmNoL3g4Ni94
ZW4ubGRzLlMKaW5kZXggNWYzNmI4OGI5Mi4uNDM2NzgxY2VmYSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L3hlbi5sZHMuUworKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCkBAIC0yMjgsMTEg
KzIyOCwxMyBAQCBTRUNUSU9OUwogICAgICAgIF9fdHJhbXBvbGluZTMyX3JlbF9zdG9wID0gLjsK
ICAgICAgICBfX2Jvb3RzeW1fcmVsX3N0YXJ0ID0gLjsKICAgICAgICAqKC5ib290c3ltX3JlbCkK
LSAgICAgICAqKC5ib290ZGF0YXN5bV9yZWwpCiAgICAgICAgX19ib290c3ltX3JlbF9zdG9wID0g
LjsKICAgICAgICBfX2Jvb3RzeW1fc2VnX3N0YXJ0ID0gLjsKICAgICAgICAqKC5ib290c3ltX3Nl
ZykKICAgICAgICBfX2Jvb3RzeW1fc2VnX3N0b3AgPSAuOworICAgICAgIF9fYm9vdGRhdGFzeW1f
cmVsX3N0YXJ0ID0gLjsKKyAgICAgICAqKC5ib290ZGF0YXN5bV9yZWwpCisgICAgICAgX19ib290
ZGF0YXN5bV9yZWxfc3RvcCA9IC47CiAgICAgICAgLyoKICAgICAgICAgKiBzdHJ1Y3QgYWx0X2lu
c3QgZW50cmllcy4gRnJvbSB0aGUgaGVhZGVyIChhbHRlcm5hdGl2ZS5oKToKICAgICAgICAgKiAi
QWx0ZXJuYXRpdmUgaW5zdHJ1Y3Rpb25zIGZvciBkaWZmZXJlbnQgQ1BVIHR5cGVzIG9yIGNhcGFi
aWxpdGllcyIKQEAgLTI3NSw2ICsyNzcsMTAgQEAgU0VDVElPTlMKICAgREVDTF9TRUNUSU9OKC5k
YXRhKSB7CiAgICAgICAgKiguZGF0YS5wYWdlX2FsaWduZWQpCiAgICAgICAgKiguZGF0YSkKKyAg
ICAgICAuID0gQUxJR04oMTYpOworICAgICAgIF9fYm9vdGRhdGFfc3RhcnQgPSAuOworICAgICAg
ICooLmRhdGEuYm9vdDE2KQorICAgICAgIF9fYm9vdGRhdGFfZW5kID0gLjsKICAgICAgICAqKC5k
YXRhLnJlbCkKICAgICAgICAqKC5kYXRhLnJlbC4qKQogICAgICAgIENPTlNUUlVDVE9SUwpkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9lZGQuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
ZWRkLmgKaW5kZXggYWZhYTIzNzMyYS4uYTRkNmI0ZDkwZSAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9lZGQuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2VkZC5oCkBAIC0xNDMs
NyArMTQzLDYgQEAgc3RydWN0IF9fcGFja2VkIG1icl9zaWduYXR1cmUgewogICAgIHUzMiBzaWdu
YXR1cmU7CiB9OwogCi0vKiBUaGVzZSBhbGwgcmVzaWRlIGluIHRoZSBib290IHRyYW1wb2xpbmUu
IEFjY2VzcyB2aWEgYm9vdHN5bSgpLiAqLwogZXh0ZXJuIHN0cnVjdCBtYnJfc2lnbmF0dXJlIGJv
b3RfbWJyX3NpZ25hdHVyZVtdOwogZXh0ZXJuIHU4IGJvb3RfbWJyX3NpZ25hdHVyZV9ucjsKIGV4
dGVybiBzdHJ1Y3QgZWRkX2luZm8gYm9vdF9lZGRfaW5mb1tdOwotLSAKMi4xNy4yCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
