Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E141076F
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 13:19:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLnFD-0001lT-LW; Wed, 01 May 2019 11:17:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G7ua=TB=merlin.srs.infradead.org=batv+1e733e8c069b692f204e+5729+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hLnFB-0001hm-DY
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 11:17:45 +0000
X-Inumbo-ID: bbecba4a-6c02-11e9-843c-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bbecba4a-6c02-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:References:In-Reply-To:
 Message-Id:Date:Subject:To:From:Reply-To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dTo1DUqH93TJIqLlrFIb7xQKjtZ4P8ZDGGkx1B6ykW8=; b=OrWcvLos+/yliHMDr2Su4LwOP
 XDyxPIebylh/VTUvTLL13PXZtm5IarcEQATxgBFe7hO1oesXdWWjhHjpmoaTAKvDHo4naWe7SqCrA
 szOA6ELqnvgwgonN544w32gOCfeWzI69H5TyxZ4wTGt9xCWawU+Y9u9qhmw1ov3KbtIWkwtVibCZW
 /WG6kx+ZoqHjLqt9EaiS3JUhJJs7nVRPV2+BGcdZTIB0RlwcM0hbRU7TTQTSbodjTqHIEmH9eIIyI
 Rk5TKYSs7WSBZg51qBP0HZzssA+4hils5QxDnUE1k94xqCWrG8ACy+n05+X72yk3zY6xymXMJm8Aj
 rUoitRvhg==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLnF6-0008Rv-8T
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 11:17:40 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hLnF5-0030OH-CP
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 12:17:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Wed,  1 May 2019 12:17:39 +0100
Message-Id: <c2666007fb7d937fc5b5854cf5e23f77f2ef8c3a.1556708226.git.dwmw2@infradead.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1556708225.git.dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
In-Reply-To: <cover.1556708225.git.dwmw2@infradead.org>
References: <cover.1556708225.git.dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH 7/7] x86/boot: Do not use trampoline for
 no-real-mode boot paths
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

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KCldoZXJlIGJvb3RlZCBm
cm9tIEVGSSBvciB3aXRoIG5vLXJlYWwtbW9kZSwgdGhlcmUgaXMgbm8gbmVlZCB0byBzdG9tcApv
biBsb3cgbWVtb3J5IHdpdGggdGhlIDE2LWJvb3QgY29kZS4gSW5zdGVhZCwganVzdCBnbyBzdHJh
aWdodCB0bwp0cmFtcG9saW5lX3Byb3Rtb2RlX2VudHJ5KCkgYXQgaXRzIHBoeXNpY2FsIGxvY2F0
aW9uIHdpdGhpbiB0aGUgWGVuCmltYWdlLgoKRm9yIG5vdywgdGhlIGJvb3QgY29kZSAoaW5jbHVk
aW5nIHRoZSBFRkkgbG9hZGVyIHBhdGgpIHN0aWxsIGRldGVybWluZXMKd2hhdCB0aGUgdHJhbXBv
bGluZV9waHlzIGFkZHJlc3Mgc2hvdWxkIGJlLiBUaGUgdHJhbXBvbGluZSBpcyBhY3R1YWxseQpy
ZWxvY2F0ZWQgZm9yIHRoYXQgYWRkcmVzcyBhbmQgY29waWVkIGludG8gbG93IG1lbW9yeSwgZnJv
bSBhCnJlbG9jYXRlX3RyYW1wb2xpbmUoKSBjYWxsIG1hZGUgZnJvbSBfX3N0YXJ0X3hlbigpLgoK
Rm9yIHN1YnNlcXVlbnQgQVAgc3RhcnR1cCBhbmQgd2FrZXVwLCB0aGUgMzItYml0IHRyYW1wb2xp
bmUgY2FuJ3QKdHJpdmlhbGx5IGJlIHVzZWQgaW4tcGxhY2UgYXMgdGhhdCByZWdpb24gaXNuJ3Qg
bWFwcGVkLiBTbyBjb3B5IGl0CmRvd24gdG8gbG93IG1lbW9yeSB0b28sIGhhdmluZyByZWxvY2F0
ZWQgaXQgKGFnYWluKSB0byB3b3JrIGZyb20KdGhlcmUuCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBX
b29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgotLS0KIHhlbi9hcmNoL3g4Ni9hY3BpL3Bvd2Vy
LmMgICAgICB8ICA2ICstLQogeGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TICAgICAgIHwgNjcgKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBv
bGluZS5TIHwgMzAgKysrKysrKysrKystLS0tCiB4ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jICAg
ICAgfCAgMiArLQogeGVuL2FyY2gveDg2L2NwdS9pbnRlbC5jICAgICAgIHwgIDIgKy0KIHhlbi9h
cmNoL3g4Ni9lZmkvZWZpLWJvb3QuaCAgICB8IDMxICsrLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNo
L3g4Ni9tbS5jICAgICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAg
ICAgICAgfCA0MyArKysrKysrKysrKysrKysrKysrKy0tCiB4ZW4vYXJjaC94ODYvc21wYm9vdC5j
ICAgICAgICAgfCAgNiArLS0KIHhlbi9hcmNoL3g4Ni90Ym9vdC5jICAgICAgICAgICB8ICA2ICst
LQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jICAgICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL2Fz
bS14ODYvYWNwaS5oICAgICB8ICAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L2NvbmZpZy5oICAg
fCAxMCArKy0tLQogMTMgZmlsZXMgY2hhbmdlZCwgMTE3IGluc2VydGlvbnMoKyksIDkyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMgYi94ZW4vYXJj
aC94ODYvYWNwaS9wb3dlci5jCmluZGV4IGE3MDRjN2MzNDAuLmExY2U4YWNiMjEgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKKysrIGIveGVuL2FyY2gveDg2L2FjcGkvcG93
ZXIuYwpAQCAtMTUyLDkgKzE1Miw5IEBAIHN0YXRpYyB2b2lkIGFjcGlfc2xlZXBfcHJlcGFyZSh1
MzIgc3RhdGUpCiAgICAgICAgIHJldHVybjsKIAogICAgIGlmICggYWNwaV9zaW5mby52ZWN0b3Jf
d2lkdGggPT0gMzIgKQotICAgICAgICAqKHVpbnQzMl90ICopd2FrZXVwX3ZlY3Rvcl92YSA9IGJv
b3RzeW1fcGh5cyh3YWtldXBfc3RhcnQpOworICAgICAgICAqKHVpbnQzMl90ICopd2FrZXVwX3Zl
Y3Rvcl92YSA9IHRyYW1wc3ltX3BoeXMod2FrZXVwX3N0YXJ0KTsKICAgICBlbHNlCi0gICAgICAg
ICoodWludDY0X3QgKil3YWtldXBfdmVjdG9yX3ZhID0gYm9vdHN5bV9waHlzKHdha2V1cF9zdGFy
dCk7CisgICAgICAgICoodWludDY0X3QgKil3YWtldXBfdmVjdG9yX3ZhID0gdHJhbXBzeW1fcGh5
cyh3YWtldXBfc3RhcnQpOwogfQogCiBzdGF0aWMgdm9pZCBhY3BpX3NsZWVwX3Bvc3QodTMyIHN0
YXRlKSB7fQpAQCAtMzg4LDcgKzM4OCw3IEBAIHN0YXRpYyB2b2lkIHRib290X3NsZWVwKHU4IHNs
ZWVwX3N0YXRlKQogICAgIGdfdGJvb3Rfc2hhcmVkLT5hY3BpX3NpbmZvLndha2V1cF92ZWN0b3Ig
PSBhY3BpX3NpbmZvLndha2V1cF92ZWN0b3I7CiAgICAgZ190Ym9vdF9zaGFyZWQtPmFjcGlfc2lu
Zm8udmVjdG9yX3dpZHRoID0gYWNwaV9zaW5mby52ZWN0b3Jfd2lkdGg7CiAgICAgZ190Ym9vdF9z
aGFyZWQtPmFjcGlfc2luZm8ua2VybmVsX3MzX3Jlc3VtZV92ZWN0b3IgPQotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb3RzeW1fcGh5cyh3YWtldXBfc3Rh
cnQpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRyYW1w
c3ltX3BoeXMod2FrZXVwX3N0YXJ0KTsKIAogICAgIHN3aXRjaCAoIHNsZWVwX3N0YXRlICkKICAg
ICB7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMgYi94ZW4vYXJjaC94ODYv
Ym9vdC9oZWFkLlMKaW5kZXggN2Q2YzhkMzI5Mi4uYzIzZWViM2FhNCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L2Jvb3QvaGVhZC5TCisrKyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwpAQCAt
Njk2LDE2ICs2OTYsMjMgQEAgdHJhbXBvbGluZV9zZXR1cDoKICAgICAgICAgbGVhICAgICBfX1BB
R0VfSFlQRVJWSVNPUitzeW1fZXNpKGwxX2lkZW50bWFwKSwlZWRpCiAgICAgICAgIG1vdiAgICAg
JWVkaSxzeW1fZnMobDJfYm9vdG1hcCkKIAotICAgICAgICAvKiBBcHBseSByZWxvY2F0aW9ucyB0
byBib290c3RyYXAgdHJhbXBvbGluZS4gKi8KLSAgICAgICAgbW92ICAgICBzeW1fZnModHJhbXBv
bGluZV9waHlzKSwlZWR4Ci0gICAgICAgIG1vdiAgICAgJHN5bV9vZmZzKF9fdHJhbXBvbGluZV9y
ZWxfc3RhcnQpLCVlZGkKLTE6Ci0gICAgICAgIG1vdiAgICAgJWZzOiglZWRpKSwlZWF4Ci0gICAg
ICAgIGFkZCAgICAgJWVkeCwlZnM6KCVlZGksJWVheCkKLSAgICAgICAgYWRkICAgICAkNCwlZWRp
Ci0gICAgICAgIGNtcCAgICAgJHN5bV9vZmZzKF9fdHJhbXBvbGluZV9yZWxfc3RvcCksJWVkaQot
ICAgICAgICBqYiAgICAgIDFiCisgICAgICAgIC8qIERvIG5vdCBwYXJzZSBjb21tYW5kIGxpbmUg
b24gRUZJIHBsYXRmb3JtIGhlcmUuICovCisgICAgICAgIGNtcGIgICAgJDAsc3ltX2ZzKGVmaV9w
bGF0Zm9ybSkKKyAgICAgICAgam56ICAgICAxZgogCisgICAgICAgIC8qIEJhaWwgaWYgdGhlcmUg
aXMgbm8gY29tbWFuZCBsaW5lIHRvIHBhcnNlLiAqLworICAgICAgICBtb3YgICAgIHN5bV9mcyht
dWx0aWJvb3RfcHRyKSwlZWJ4CisgICAgICAgIHRlc3RsICAgJE1CSV9DTURMSU5FLE1CX2ZsYWdz
KCVlYngpCisgICAgICAgIGp6ICAgICAgMWYKKworICAgICAgICBsZWEgICAgIHN5bV9lc2koZWFy
bHlfYm9vdF9vcHRzKSwlZWF4CisgICAgICAgIHB1c2ggICAgJWVheAorICAgICAgICBwdXNobCAg
IE1CX2NtZGxpbmUoJWVieCkKKyAgICAgICAgY2FsbCAgICBjbWRsaW5lX3BhcnNlX2Vhcmx5CisK
KzE6CisgICAgICAgIC8qIEFwcGx5IHJlbG9jYXRpb25zIHRvIDMyLWJpdCB0cmFtcG9saW5lIGZv
ciBleGVjdXRpb24gaW4gcGxhY2UuICovCisgICAgICAgIGxlYSAgICAgc3ltX2VzaShwZXJtX3Ry
YW1wb2xpbmVfc3RhcnQpLCVlZHgKICAgICAgICAgbW92ICAgICAkc3ltX29mZnMoX190cmFtcG9s
aW5lMzJfcmVsX3N0YXJ0KSwlZWRpCiAxOgogICAgICAgICBtb3YgICAgICVmczooJWVkaSksJWVh
eApAQCAtNzE0LDYgKzcyMSwyMSBAQCB0cmFtcG9saW5lX3NldHVwOgogICAgICAgICBjbXAgICAg
ICRzeW1fb2ZmcyhfX3RyYW1wb2xpbmUzMl9yZWxfc3RvcCksJWVkaQogICAgICAgICBqYiAgICAg
IDFiCiAKKyAgICAgICAgY21wICAgICAkMCxzeW1fZXNpKHNraXBfcmVhbG1vZGUpCisgICAgICAg
IGp6ICAgICAgLkxkb19yZWFsbW9kZQorCisgICAgICAgIC8qIEdvIGRpcmVjdGx5IHRvIHRyYW1w
b2xpbmVfcHJvdG1vZGVfZW50cnkgYXQgaXRzIHBoeXNpY2FsIGFkZHJlc3MgKi8KKyAgICAgICAg
bGVhICAgICB0cmFtcG9saW5lX3Byb3Rtb2RlX2VudHJ5LV9fWEVOX1ZJUlRfU1RBUlQoJWVzaSks
JWVheAorICAgICAgICBwdXNobCAgICRCT09UX0NTMzIKKyAgICAgICAgcHVzaCAgICAlZWF4CisK
KyAgICAgICAgLyogRUJYID09IDAgaW5kaWNhdGVzIHdlIGFyZSB0aGUgQlAgKEJvb3QgUHJvY2Vz
c29yKS4gKi8KKyAgICAgICAgeG9yICAgICAlZWJ4LCVlYngKKyAgICAgICAgcmV0bAorCisuTGRv
X3JlYWxtb2RlOgorICAgICAgICAvKiBBcHBseSByZWxvY2F0aW9ucyB0byAxNi1iaXQgYm9vdCBj
b2RlLiAqLworICAgICAgICBtb3YgICAgIHN5bV9mcyh0cmFtcG9saW5lX3BoeXMpLCVlZHgKICAg
ICAgICAgbW92ICAgICAkc3ltX29mZnMoX19ib290c3ltX3JlbF9zdGFydCksJWVkaQogMToKICAg
ICAgICAgbW92ICAgICAlZnM6KCVlZGkpLCVlYXgKQEAgLTc0MywzNSArNzY1LDEyIEBAIHRyYW1w
b2xpbmVfc2V0dXA6CiAgICAgICAgIGNtcCAgICAgJHN5bV9vZmZzKF9fYm9vdGRhdGFzeW1fcmVs
X3N0b3ApLCVlZGkKICAgICAgICAgamIgICAgICAxYgogCi0gICAgICAgIC8qIERvIG5vdCBwYXJz
ZSBjb21tYW5kIGxpbmUgb24gRUZJIHBsYXRmb3JtIGhlcmUuICovCi0gICAgICAgIGNtcGIgICAg
JDAsc3ltX2ZzKGVmaV9wbGF0Zm9ybSkKLSAgICAgICAgam56ICAgICAxZgotCi0gICAgICAgIC8q
IEJhaWwgaWYgdGhlcmUgaXMgbm8gY29tbWFuZCBsaW5lIHRvIHBhcnNlLiAqLwotICAgICAgICBt
b3YgICAgIHN5bV9mcyhtdWx0aWJvb3RfcHRyKSwlZWJ4Ci0gICAgICAgIHRlc3RsICAgJE1CSV9D
TURMSU5FLE1CX2ZsYWdzKCVlYngpCi0gICAgICAgIGp6ICAgICAgMWYKLQotICAgICAgICBsZWEg
ICAgIHN5bV9lc2koZWFybHlfYm9vdF9vcHRzKSwlZWF4Ci0gICAgICAgIHB1c2ggICAgJWVheAot
ICAgICAgICBwdXNobCAgIE1CX2NtZGxpbmUoJWVieCkKLSAgICAgICAgY2FsbCAgICBjbWRsaW5l
X3BhcnNlX2Vhcmx5Ci0KLTE6CiAgICAgICAgIC8qIFN3aXRjaCB0byBsb3ctbWVtb3J5IHN0YWNr
IHdoaWNoIGxpdmVzIGF0IHRoZSBlbmQgb2YgdHJhbXBvbGluZSByZWdpb24uICovCiAgICAgICAg
IG1vdiAgICAgc3ltX2ZzKHRyYW1wb2xpbmVfcGh5cyksJWVkaQogICAgICAgICBsZWEgICAgIFRS
QU1QT0xJTkVfU1BBQ0UrVFJBTVBPTElORV9TVEFDS19TUEFDRSglZWRpKSwlZXNwCi0gICAgICAg
IGNtcGIgICAgJDAsIHN5bV9mcyhza2lwX3JlYWxtb2RlKQotICAgICAgICBqeiAgICAgIDFmCi0g
ICAgICAgIC8qIElmIG5vLXJlYWwtbW9kZSwganVtcCBzdHJhaWdodCB0byB0cmFtcG9saW5lX3By
b3Rtb2RlX2VudHJ5ICovCi0gICAgICAgIGxlYSAgICAgdHJhbXBvbGluZV9wcm90bW9kZV9lbnRy
eS1ib290X3RyYW1wb2xpbmVfc3RhcnQoJWVkaSksJWVheAotICAgICAgICAvKiBFQlggPT0gMCBp
bmRpY2F0ZXMgd2UgYXJlIHRoZSBCUCAoQm9vdCBQcm9jZXNzb3IpLiAqLwotICAgICAgICB4b3Ig
ICAgICVlYngsJWVieAotICAgICAgICBqbXAgICAgIDJmCi0xOgorCiAgICAgICAgIC8qIEdvIHZp
YSAxNi1iaXQgY29kZSBpbiB0cmFtcG9saW5lX2Jvb3RfY3B1X2VudHJ5ICovCiAgICAgICAgIGxl
YSAgICAgdHJhbXBvbGluZV9ib290X2NwdV9lbnRyeS1ib290X3RyYW1wb2xpbmVfc3RhcnQoJWVk
aSksJWVheAotMjoKICAgICAgICAgcHVzaGwgICAkQk9PVF9DUzMyCiAgICAgICAgIHB1c2ggICAg
JWVheAogCkBAIC03OTQsOCArNzkzLDYgQEAgY21kbGluZV9wYXJzZV9lYXJseToKIHJlbG9jOgog
I2luY2x1ZGUgInJlbG9jLlMiCiAKLUVOVFJZKGJvb3RfdHJhbXBvbGluZV9zdGFydCkKICNpbmNs
dWRlICJ0cmFtcG9saW5lLlMiCi1FTlRSWShib290X3RyYW1wb2xpbmVfZW5kKQogCiAjaW5jbHVk
ZSAieDg2XzY0LlMiCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMg
Yi94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMKaW5kZXggZmRmZWUyZWRiMS4uMWNlODE1
ZTBkYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCisrKyBiL3hl
bi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUuUwpAQCAtNjAsNyArNjAsNyBAQCBHTE9CQUwoYm9v
dGRhdGFfc3RhcnQpCiAgICAgICAgIC5wb3BzZWN0aW9uCiAKICN1bmRlZiB0cmFtcHN5bQotI2Rl
ZmluZSB0cmFtcHN5bShzKSAoKHMpLWJvb3RfdHJhbXBvbGluZV9zdGFydCkKKyNkZWZpbmUgdHJh
bXBzeW0ocykgKChzKS1wZXJtX3RyYW1wb2xpbmVfc3RhcnQpCiAKICNkZWZpbmUgdHJhbXBzeW1f
cmVsKHN5bSwgb2ZmLCBvcG5kLi4uKSAgICBcCiAgICAgICAgIHRyYW1wc3ltKHN5bSksIyNvcG5k
OyAgICAgICAgICAgICAgXApAQCAtNzAsNyArNzAsNyBAQCBHTE9CQUwoYm9vdGRhdGFfc3RhcnQp
CiAgICAgICAgIC5wb3BzZWN0aW9uCiAKICN1bmRlZiB0cmFtcDMyc3ltCi0jZGVmaW5lIHRyYW1w
MzJzeW0ocykgKChzKS1ib290X3RyYW1wb2xpbmVfc3RhcnQpCisjZGVmaW5lIHRyYW1wMzJzeW0o
cykgKChzKS1wZXJtX3RyYW1wb2xpbmVfc3RhcnQpCiAKICNkZWZpbmUgdHJhbXAzMnN5bV9yZWwo
c3ltLCBvZmYsIG9wbmQuLi4pICBcCiAgICAgICAgIHRyYW1wMzJzeW0oc3ltKSwjI29wbmQ7ICAg
ICAgICAgICAgXApAQCAtODMsNiArODMsNyBAQCBHTE9CQUwoYm9vdGRhdGFfc3RhcnQpCiAKICAg
ICAgICAgLmNvZGUxNgogCitFTlRSWShwZXJtX3RyYW1wb2xpbmVfc3RhcnQpCiBHTE9CQUwodHJh
bXBvbGluZV9yZWFsbW9kZV9lbnRyeSkKICAgICAgICAgbW92ICAgICAlY3MsJWF4CiAgICAgICAg
IG1vdiAgICAgJWF4LCVkcwpAQCAtOTAsNyArOTEsNyBAQCBHTE9CQUwodHJhbXBvbGluZV9yZWFs
bW9kZV9lbnRyeSkKICAgICAgICAgY2xkCiAgICAgICAgIGNsaQogICAgICAgICBsaWR0ICAgIHRy
YW1wc3ltKGlkdF80OCkKLSAgICAgICAgbGdkdCAgICB0cmFtcHN5bShnZHRfNDgpCisgICAgICAg
IGxnZHRsICAgdHJhbXBzeW0oZ2R0XzQ4KQogICAgICAgICBtb3YgICAgICQxLCVibCAgICAgICAg
ICAgICAgICAgICAgIyBFQlggIT0gMCBpbmRpY2F0ZXMgd2UgYXJlIGFuIEFQCiAgICAgICAgIHhv
ciAgICAgJWF4LCAlYXgKICAgICAgICAgaW5jICAgICAlYXgKQEAgLTIzMCwxMSArMjMxLDIzIEBA
IHN0YXJ0NjQ6CiAKIC8qIFRoZSBmaXJzdCBwYWdlIG9mIHRyYW1wb2xpbmUgaXMgcGVybWFuZW50
LCB0aGUgcmVzdCBib290LXRpbWUgb25seS4gKi8KIC8qIFJldXNlIHRoZSBib290IHRyYW1wb2xp
bmUgb24gdGhlIDFzdCB0cmFtcG9saW5lIHBhZ2UgYXMgc3RhY2sgZm9yIHdha2V1cC4gKi8KLSAg
ICAgICAgLmVxdSAgICB3YWtldXBfc3RhY2ssIGJvb3RfdHJhbXBvbGluZV9zdGFydCArIFBBR0Vf
U0laRQorICAgICAgICAuZXF1ICAgIHdha2V1cF9zdGFjaywgcGVybV90cmFtcG9saW5lX3N0YXJ0
ICsgUEFHRV9TSVpFCiAgICAgICAgIC5nbG9iYWwgd2FrZXVwX3N0YWNrCiAKK0VOVFJZKHBlcm1f
dHJhbXBvbGluZV9lbmQpCisKIC8qIEZyb20gaGVyZSBvbiBlYXJseSBib290IG9ubHkuICovCiAK
K0VOVFJZKGJvb3RfdHJhbXBvbGluZV9zdGFydCkKKworICAgICAgICAud29yZCAgIDAKK2Jvb3Qx
Nl9pZHQ6CisgICAgICAgIC53b3JkICAgMCwgMCwgMCAjIGJhc2UgPSBsaW1pdCA9IDAKKyAgICAg
ICAgLndvcmQgICAwCitib290MTZfZ2R0OgorICAgICAgICAud29yZCAgIDcqOC0xCisgICAgICAg
IC5sb25nICAgdHJhbXAzMnN5bV9yZWwodHJhbXBvbGluZV9nZHQsNCkKKwogICAgICAgICAuY29k
ZTMyCiB0cmFtcG9saW5lX2Jvb3RfY3B1X2VudHJ5OgogICAgICAgICAvKiBMb2FkIHBzZXVkby1y
ZWFsLW1vZGUgc2VnbWVudHMuICovCkBAIC0yOTgsOCArMzExLDggQEAgdHJhbXBvbGluZV9ib290
X2NwdV9lbnRyeToKICAgICAgICAgY2xpCiAKICAgICAgICAgLyogUmVzZXQgR0RUIGFuZCBJRFQu
IFNvbWUgQklPU2VzIGNsb2JiZXIgR0RUUi4gKi8KLSAgICAgICAgbGlkdCAgICBib290c3ltKGlk
dF80OCkKLSAgICAgICAgbGdkdCAgICBib290c3ltKGdkdF80OCkKKyAgICAgICAgbGlkdCAgICBi
b290c3ltKGJvb3QxNl9pZHQpICMgWFhYCisgICAgICAgIGxnZHRsICAgYm9vdHN5bShib290MTZf
Z2R0KQogCiAgICAgICAgIC8qIEVudGVyIHByb3RlY3RlZCBtb2RlLCBhbmQgZmx1c2ggaW5zbiBx
dWV1ZS4gKi8KICAgICAgICAgeG9yICAgICAlYXgsJWF4CkBAIC0zMzcsNyArMzUwLDggQEAgdHJh
bXBvbGluZV9ib290X2NwdV9lbnRyeToKICAgICAgICAgeG9yICAgICAlZWJ4LCVlYngKIAogICAg
ICAgICAvKiBKdW1wIHRvIHRoZSBjb21tb24gYm9vdHN0cmFwIGVudHJ5IHBvaW50LiAqLwotICAg
ICAgICBqbXAgICAgIHRyYW1wb2xpbmVfcHJvdG1vZGVfZW50cnkKKyAgICAgICAgbW92ICAgICAk
dHJhbXAzMnN5bV9yZWwodHJhbXBvbGluZV9wcm90bW9kZV9lbnRyeSw0LCVlYXgpCisgICAgICAg
IGptcCAgICAgKiVlYXgKIAogI2luY2x1ZGUgInZpZGVvLmgiCiAKQEAgLTM3Myw2ICszODcsOCBA
QCBybV9pZHQ6IC53b3JkICAgMjU2KjQtMSwgMCwgMAogI2luY2x1ZGUgInZpZGVvLlMiCiAjZW5k
aWYKIAorRU5UUlkoYm9vdF90cmFtcG9saW5lX2VuZCkKKwogICAgICAgICAucHVzaHNlY3Rpb24g
LmRhdGEuYm9vdDE2LCAiYXciLCBAcHJvZ2JpdHMKIEdMT0JBTChib290ZGF0YV9lbmQpCiAgICAg
ICAgIC5wb3BzZWN0aW9uCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jIGIv
eGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwppbmRleCAxZDIxZmY5NDY3Li5iMjY4ZTAxMGM1IDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9j
cHUvY29tbW9uLmMKQEAgLTQwOCw3ICs0MDgsNyBAQCBzdGF0aWMgdm9pZCBnZW5lcmljX2lkZW50
aWZ5KHN0cnVjdCBjcHVpbmZvX3g4NiAqYykKIAkJICAgICAgJmMtPng4Nl9jYXBhYmlsaXR5W2Nw
dWZlYXRfd29yZChYODZfRkVBVFVSRV9MQUhGX0xNKV0sCiAJCSAgICAgICZjLT54ODZfY2FwYWJp
bGl0eVtjcHVmZWF0X3dvcmQoWDg2X0ZFQVRVUkVfU1lTQ0FMTCldKTsKIAlpZiAoYyA9PSAmYm9v
dF9jcHVfZGF0YSkKLQkJYm9vdHN5bShjcHVpZF9leHRfZmVhdHVyZXMpID0KKwkJdHJhbXBzeW0o
Y3B1aWRfZXh0X2ZlYXR1cmVzKSA9CiAJCQljLT54ODZfY2FwYWJpbGl0eVtjcHVmZWF0X3dvcmQo
WDg2X0ZFQVRVUkVfTlgpXTsKIAogCWlmIChjLT5leHRlbmRlZF9jcHVpZF9sZXZlbCA+PSAweDgw
MDAwMDA0KQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9pbnRlbC5jIGIveGVuL2FyY2gv
eDg2L2NwdS9pbnRlbC5jCmluZGV4IDhlMjNlZDYzNzkuLmU3Zjc5NGE2MDEgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9jcHUvaW50ZWwuYworKysgYi94ZW4vYXJjaC94ODYvY3B1L2ludGVsLmMK
QEAgLTI0MCw3ICsyNDAsNyBAQCBzdGF0aWMgdm9pZCBlYXJseV9pbml0X2ludGVsKHN0cnVjdCBj
cHVpbmZvX3g4NiAqYykKIAkJCQkgTVNSX0lBMzJfTUlTQ19FTkFCTEVfWERfRElTQUJMRSk7CiAJ
aWYgKGRpc2FibGUpIHsKIAkJd3Jtc3JsKE1TUl9JQTMyX01JU0NfRU5BQkxFLCBtaXNjX2VuYWJs
ZSAmIH5kaXNhYmxlKTsKLQkJYm9vdHN5bSh0cmFtcG9saW5lX21pc2NfZW5hYmxlX29mZikgfD0g
ZGlzYWJsZTsKKwkJdHJhbXBzeW0odHJhbXBvbGluZV9taXNjX2VuYWJsZV9vZmYpIHw9IGRpc2Fi
bGU7CiAJfQogCiAJaWYgKGRpc2FibGUgJiBNU1JfSUEzMl9NSVNDX0VOQUJMRV9MSU1JVF9DUFVJ
RCkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaCBiL3hlbi9hcmNoL3g4
Ni9lZmkvZWZpLWJvb3QuaAppbmRleCBmNmY0MzVhNGM1Li5lY2VjMzM0ZDYwIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgKKysrIGIveGVuL2FyY2gveDg2L2VmaS9lZmkt
Ym9vdC5oCkBAIC05OCwyOSArOTgsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZWZpX2FyY2hfcmVs
b2NhdGVfaW1hZ2UodW5zaWduZWQgbG9uZyBkZWx0YSkKICAgICB9CiB9CiAKLWV4dGVybiBjb25z
dCBzMzIgX190cmFtcG9saW5lX3JlbF9zdGFydFtdLCBfX3RyYW1wb2xpbmVfcmVsX3N0b3BbXTsK
LWV4dGVybiBjb25zdCBzMzIgX190cmFtcG9saW5lMzJfcmVsX3N0YXJ0W10sIF9fdHJhbXBvbGlu
ZTMyX3JlbF9zdG9wW107Ci0KLXN0YXRpYyB2b2lkIF9faW5pdCByZWxvY2F0ZV90cmFtcG9saW5l
KHVuc2lnbmVkIGxvbmcgcGh5cykKLXsKLSAgICBjb25zdCBzMzIgKnRyYW1wb2xpbmVfcHRyOwot
Ci0gICAgdHJhbXBvbGluZV9waHlzID0gcGh5czsKLQotICAgIGlmICggIWVmaV9lbmFibGVkKEVG
SV9MT0FERVIpICkKLSAgICAgICAgcmV0dXJuOwotCi0gICAgLyogQXBwbHkgcmVsb2NhdGlvbnMg
dG8gdHJhbXBvbGluZS4gKi8KLSAgICBmb3IgKCB0cmFtcG9saW5lX3B0ciA9IF9fdHJhbXBvbGlu
ZV9yZWxfc3RhcnQ7Ci0gICAgICAgICAgdHJhbXBvbGluZV9wdHIgPCBfX3RyYW1wb2xpbmVfcmVs
X3N0b3A7Ci0gICAgICAgICAgKyt0cmFtcG9saW5lX3B0ciApCi0gICAgICAgICoodTMyICopKCp0
cmFtcG9saW5lX3B0ciArIChsb25nKXRyYW1wb2xpbmVfcHRyKSArPSBwaHlzOwotICAgIGZvciAo
IHRyYW1wb2xpbmVfcHRyID0gX190cmFtcG9saW5lMzJfcmVsX3N0YXJ0OwotICAgICAgICAgIHRy
YW1wb2xpbmVfcHRyIDwgX190cmFtcG9saW5lMzJfcmVsX3N0b3A7Ci0gICAgICAgICAgKyt0cmFt
cG9saW5lX3B0ciApCi0gICAgICAgICoodTMyICopKCp0cmFtcG9saW5lX3B0ciArIChsb25nKXRy
YW1wb2xpbmVfcHRyKSArPSBwaHlzOwotfQotCiBzdGF0aWMgdm9pZCBfX2luaXQgcGxhY2Vfc3Ry
aW5nKHUzMiAqYWRkciwgY29uc3QgY2hhciAqcykKIHsKICAgICBjaGFyICphbGxvYyA9IE5VTEw7
CkBAIC0yMjMsNyArMjAwLDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGVmaV9hcmNoX3ByZV9leGl0
X2Jvb3Qodm9pZCkKICAgICB7CiAgICAgICAgIGlmICggIWNmZy5hZGRyICkKICAgICAgICAgICAg
IGJsZXhpdChMIk5vIG1lbW9yeSBmb3IgdHJhbXBvbGluZSIpOwotICAgICAgICByZWxvY2F0ZV90
cmFtcG9saW5lKGNmZy5hZGRyKTsKKyAgICAgICAgdHJhbXBvbGluZV9waHlzID0gY2ZnLmFkZHI7
CiAgICAgfQogfQogCkBAIC0yMzIsNyArMjA5LDYgQEAgc3RhdGljIHZvaWQgX19pbml0IG5vcmV0
dXJuIGVmaV9hcmNoX3Bvc3RfZXhpdF9ib290KHZvaWQpCiAgICAgdTY0IGNyNCA9IFhFTl9NSU5J
TUFMX0NSNCAmIH5YODZfQ1I0X1BHRSwgZWZlcjsKIAogICAgIGVmaV9hcmNoX3JlbG9jYXRlX2lt
YWdlKF9fWEVOX1ZJUlRfU1RBUlQgLSB4ZW5fcGh5c19zdGFydCk7Ci0gICAgbWVtY3B5KCh2b2lk
ICopdHJhbXBvbGluZV9waHlzLCBib290X3RyYW1wb2xpbmVfc3RhcnQsIGNmZy5zaXplKTsKIAog
ICAgIC8qIFNldCBzeXN0ZW0gcmVnaXN0ZXJzIGFuZCB0cmFuc2ZlciBjb250cm9sLiAqLwogICAg
IGFzbSB2b2xhdGlsZSgicHVzaHEgJDBcblx0cG9wZnEiKTsKQEAgLTU2NSwxNCArNTQxLDE0IEBA
IHN0YXRpYyB2b2lkIF9faW5pdCBlZmlfYXJjaF9tZW1vcnlfc2V0dXAodm9pZCkKICAgICBjZmcu
YWRkciA9IDB4MTAwMDAwOwogCiAgICAgaWYgKCBlZmlfZW5hYmxlZChFRklfTE9BREVSKSApCi0g
ICAgICAgIGNmZy5zaXplID0gYm9vdF90cmFtcG9saW5lX2VuZCAtIGJvb3RfdHJhbXBvbGluZV9z
dGFydDsKKyAgICAgICAgY2ZnLnNpemUgPSBwZXJtX3RyYW1wb2xpbmVfZW5kIC0gcGVybV90cmFt
cG9saW5lX3N0YXJ0OwogICAgIGVsc2UKICAgICAgICAgY2ZnLnNpemUgPSBUUkFNUE9MSU5FX1NQ
QUNFICsgVFJBTVBPTElORV9TVEFDS19TUEFDRTsKIAogICAgIHN0YXR1cyA9IGVmaV9icy0+QWxs
b2NhdGVQYWdlcyhBbGxvY2F0ZU1heEFkZHJlc3MsIEVmaUxvYWRlckRhdGEsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFBGTl9VUChjZmcuc2l6ZSksICZjZmcuYWRkcik7CiAg
ICAgaWYgKCBzdGF0dXMgPT0gRUZJX1NVQ0NFU1MgKQotICAgICAgICByZWxvY2F0ZV90cmFtcG9s
aW5lKGNmZy5hZGRyKTsKKyAgICAgICAgdHJhbXBvbGluZV9waHlzID0gY2ZnLmFkZHI7CiAgICAg
ZWxzZQogICAgIHsKICAgICAgICAgY2ZnLmFkZHIgPSAwOwpAQCAtNjY0LDcgKzY0MCw2IEBAIHN0
YXRpYyB2b2lkIF9faW5pdCBlZmlfYXJjaF9sb2FkX2FkZHJfY2hlY2soRUZJX0xPQURFRF9JTUFH
RSAqbG9hZGVkX2ltYWdlKQogICAgICAgICBibGV4aXQoTCJYZW4gbXVzdCBiZSBsb2FkZWQgYmVs
b3cgNEdiLiIpOwogICAgIGlmICggeGVuX3BoeXNfc3RhcnQgJiAoKDEgPDwgTDJfUEFHRVRBQkxF
X1NISUZUKSAtIDEpICkKICAgICAgICAgYmxleGl0KEwiWGVuIG11c3QgYmUgbG9hZGVkIGF0IGEg
Mk1iIGJvdW5kYXJ5LiIpOwotICAgIHRyYW1wb2xpbmVfeGVuX3BoeXNfc3RhcnQgPSB4ZW5fcGh5
c19zdGFydDsKIH0KIAogc3RhdGljIGJvb2wgX19pbml0IGVmaV9hcmNoX3VzZV9jb25maWdfZmls
ZShFRklfU1lTVEVNX1RBQkxFICpTeXN0ZW1UYWJsZSkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggN2EyZTE4ODkxNi4uMTdhNTViNGI4YSAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAg
LTMxNCw3ICszMTQsNyBAQCB2b2lkIF9faW5pdCBhcmNoX2luaXRfbWVtb3J5KHZvaWQpCiAgICAg
ICovCiAgICAgQlVHX09OKHB2aF9ib290ICYmIHRyYW1wb2xpbmVfcGh5cyAhPSAweDEwMDApOwog
ICAgIGZvciAoIGkgPSAwOwotICAgICAgICAgIGkgPCAocHZoX2Jvb3QgPyAoMSArIFBGTl9VUChi
b290X3RyYW1wb2xpbmVfZW5kIC0gYm9vdF90cmFtcG9saW5lX3N0YXJ0KSkKKyAgICAgICAgICBp
IDwgKHB2aF9ib290ID8gKDEgKyBQRk5fVVAocGVybV90cmFtcG9saW5lX2VuZCAtIHBlcm1fdHJh
bXBvbGluZV9zdGFydCkpCiAgICAgICAgICAgICAgICAgICAgICAgICA6IDB4MTAwKTsKICAgICAg
ICAgICBpKysgKQogICAgICAgICBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KG1mbl90b19wYWdl
KF9tZm4oaSkpLCBkb21faW8sIFNIQVJFX3J3KTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9z
ZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMKaW5kZXggNGRkNGM0MTYxYy4uYjI1NTI0MjU2
MSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMKKysrIGIveGVuL2FyY2gveDg2L3Nl
dHVwLmMKQEAgLTY3NSw2ICs2NzUsNDIgQEAgc3RhdGljIGludCBjb3B5X2Jpb3NfZTgyMChzdHJ1
Y3QgZTgyMGVudHJ5ICptYXAsIHVuc2lnbmVkIGludCBsaW1pdCkKICAgICByZXR1cm4gbjsKIH0K
IAorZXh0ZXJuIGNvbnN0IHMzMiBfX3RyYW1wb2xpbmVfcmVsX3N0YXJ0W10sIF9fdHJhbXBvbGlu
ZV9yZWxfc3RvcFtdOworZXh0ZXJuIGNvbnN0IHMzMiBfX3RyYW1wb2xpbmUzMl9yZWxfc3RhcnRb
XSwgX190cmFtcG9saW5lMzJfcmVsX3N0b3BbXTsKKworc3RhdGljIHZvaWQgX19pbml0IHJlbG9j
YXRlX3RyYW1wb2xpbmUodW5zaWduZWQgbG9uZyBwaHlzKQoreworICAgIGNvbnN0IHMzMiAqdHJh
bXBvbGluZV9wdHI7CisgICAgdWludDMyX3QgdHJhbXAzMl9kZWx0YSA9IDA7CisKKyAgICAvKiBB
cHBseSByZWxvY2F0aW9ucyB0byB0cmFtcG9saW5lLiAqLworICAgIGZvciAoIHRyYW1wb2xpbmVf
cHRyID0gX190cmFtcG9saW5lX3JlbF9zdGFydDsKKyAgICAgICAgICB0cmFtcG9saW5lX3B0ciA8
IF9fdHJhbXBvbGluZV9yZWxfc3RvcDsKKyAgICAgICAgICArK3RyYW1wb2xpbmVfcHRyICkKKyAg
ICAgICAgKih1MzIgKikoKnRyYW1wb2xpbmVfcHRyICsgKGxvbmcpdHJhbXBvbGluZV9wdHIpICs9
IHBoeXM7CisKKyAgICB0cmFtcDMyX2RlbHRhID0gcGh5czsKKyAgICBpZiAoIWVmaV9lbmFibGVk
KEVGSV9MT0FERVIpKSB7CisgICAgICAgIC8qCisgICAgICAgICAqIFRoZSBub24tRUZJIGJvb3Qg
Y29kZSB1c2VzIHRoZSAzMi1iaXQgdHJhbXBvbGluZSBpbiBwbGFjZQorICAgICAgICAgKiBzbyB3
aWxsIGhhdmUgcmVsb2NhdGVkIGl0IHRvIHRoZSBwaHlzaWNhbCBhZGRyZXNzIG9mCisgICAgICAg
ICAqIHBlcm1fdHJhbXBvbGluZV9zdGFydCBhbHJlYWR5LiBVbmRvIHRoYXQgYXMgaXQgbmVlZHMg
dG8KKyAgICAgICAgICogcnVuIGZyb20gbG93IG1lbW9yeSBmb3IgQVAgc3RhcnR1cCwgYmVjYXVz
ZSB0aGUgWGVuCisgICAgICAgICAqIHBoeXNpY2FsIGFkZHJlc3MgcmFuZ2Ugd29uJ3QgYmUgbWFw
cGVkLgorICAgICAgICAgKi8KKyAgICAgICAgdHJhbXAzMl9kZWx0YSAtPSB0cmFtcG9saW5lX3hl
bl9waHlzX3N0YXJ0OworICAgICAgICB0cmFtcDMyX2RlbHRhIC09ICh1bnNpZ25lZCBsb25nKShw
ZXJtX3RyYW1wb2xpbmVfc3RhcnQgLSBfX1hFTl9WSVJUX1NUQVJUKTsKKyAgICB9CisgICAgZm9y
ICggdHJhbXBvbGluZV9wdHIgPSBfX3RyYW1wb2xpbmUzMl9yZWxfc3RhcnQ7CisgICAgICAgICAg
dHJhbXBvbGluZV9wdHIgPCBfX3RyYW1wb2xpbmUzMl9yZWxfc3RvcDsKKyAgICAgICAgICArK3Ry
YW1wb2xpbmVfcHRyICkKKyAgICAgICAgKih1MzIgKikoKnRyYW1wb2xpbmVfcHRyICsgKGxvbmcp
dHJhbXBvbGluZV9wdHIpICs9IHRyYW1wMzJfZGVsdGE7CisgICAgdHJhbXBvbGluZV94ZW5fcGh5
c19zdGFydCA9IHhlbl9waHlzX3N0YXJ0OworCisgICAgbWVtY3B5KHRyYW1wc3ltKHBlcm1fdHJh
bXBvbGluZV9zdGFydCksIHBlcm1fdHJhbXBvbGluZV9zdGFydCwKKyAgICAgICAgICAgcGVybV90
cmFtcG9saW5lX2VuZCAtIHBlcm1fdHJhbXBvbGluZV9zdGFydCk7Cit9CisKIHZvaWQgX19pbml0
IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCiB7CiAgICAgY2hhciAq
bWVtbWFwX3R5cGUgPSBOVUxMOwpAQCAtMTA0Nyw3ICsxMDgzLDYgQEAgdm9pZCBfX2luaXQgbm9y
ZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKICAgICAgICAgICAgIC8qIFNl
bGVjdCByZWxvY2F0aW9uIGFkZHJlc3MuICovCiAgICAgICAgICAgICBlID0gZW5kIC0gcmVsb2Nf
c2l6ZTsKICAgICAgICAgICAgIHhlbl9waHlzX3N0YXJ0ID0gZTsKLSAgICAgICAgICAgIGJvb3Rz
eW0odHJhbXBvbGluZV94ZW5fcGh5c19zdGFydCkgPSBlOwogCiAgICAgICAgICAgICAvKgogICAg
ICAgICAgICAgICogUGVyZm9ybSByZWxvY2F0aW9uIHRvIG5ldyBwaHlzaWNhbCBhZGRyZXNzLgpA
QCAtMTQ3OSw2ICsxNTE0LDggQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5z
aWduZWQgbG9uZyBtYmlfcCkKICAgICBlbHNlCiAgICAgICAgIGVuZF9ib290X2FsbG9jYXRvcigp
OwogCisgICAgcmVsb2NhdGVfdHJhbXBvbGluZSh0cmFtcG9saW5lX3BoeXMpOworCiAgICAgc3lz
dGVtX3N0YXRlID0gU1lTX1NUQVRFX2Jvb3Q7CiAgICAgLyoKICAgICAgKiBObyBjYWxscyBpbnZv
bHZpbmcgQUNQSSBjb2RlIHNob3VsZCBnbyBiZXR3ZWVuIHRoZSBzZXR0aW5nIG9mCkBAIC0xODM4
LDggKzE4NzUsOCBAQCBpbnQgX19od2RvbV9pbml0IHhlbl9pbl9yYW5nZSh1bnNpZ25lZCBsb25n
IG1mbikKICAgICBpZiAoICF4ZW5fcmVnaW9uc1swXS5zICkKICAgICB7CiAgICAgICAgIC8qIFMz
IHJlc3VtZSBjb2RlIChhbmQgb3RoZXIgcmVhbCBtb2RlIHRyYW1wb2xpbmUgY29kZSkgKi8KLSAg
ICAgICAgeGVuX3JlZ2lvbnNbcmVnaW9uX3MzXS5zID0gYm9vdHN5bV9waHlzKGJvb3RfdHJhbXBv
bGluZV9zdGFydCk7Ci0gICAgICAgIHhlbl9yZWdpb25zW3JlZ2lvbl9zM10uZSA9IGJvb3RzeW1f
cGh5cyhib290X3RyYW1wb2xpbmVfZW5kKTsKKyAgICAgICAgeGVuX3JlZ2lvbnNbcmVnaW9uX3Mz
XS5zID0gdHJhbXBzeW1fcGh5cyhwZXJtX3RyYW1wb2xpbmVfc3RhcnQpOworICAgICAgICB4ZW5f
cmVnaW9uc1tyZWdpb25fczNdLmUgPSB0cmFtcHN5bV9waHlzKHBlcm1fdHJhbXBvbGluZV9lbmQp
OwogCiAgICAgICAgIC8qCiAgICAgICAgICAqIFRoaXMgbmVlZHMgdG8gcmVtYWluIGluIHN5bmMg
d2l0aCB0aGUgdXNlcyBvZiB0aGUgc2FtZSBzeW1ib2xzIGluCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvc21wYm9vdC5jIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwppbmRleCA3ZTc2Y2MzZDY4
Li4wMmQ5N2ExYWEzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9zbXBib290LmMKQEAgLTQ4LDcgKzQ4LDcgQEAKICNpbmNsdWRlIDxtYWNoX3dh
a2VjcHUuaD4KICNpbmNsdWRlIDxzbXBib290X2hvb2tzLmg+CiAKLSNkZWZpbmUgc2V0dXBfdHJh
bXBvbGluZSgpICAgIChib290c3ltX3BoeXModHJhbXBvbGluZV9yZWFsbW9kZV9lbnRyeSkpCisj
ZGVmaW5lIHNldHVwX3RyYW1wb2xpbmUoKSAgICAodHJhbXBzeW1fcGh5cyh0cmFtcG9saW5lX3Jl
YWxtb2RlX2VudHJ5KSkKIAogdW5zaWduZWQgbG9uZyBfX3JlYWRfbW9zdGx5IHRyYW1wb2xpbmVf
cGh5czsKIApAQCAtNjAwLDcgKzYwMCw3IEBAIHN0YXRpYyBpbnQgZG9fYm9vdF9jcHUoaW50IGFw
aWNpZCwgaW50IGNwdSkKICAgICAgICAgewogICAgICAgICAgICAgYm9vdF9lcnJvciA9IDE7CiAg
ICAgICAgICAgICBzbXBfbWIoKTsKLSAgICAgICAgICAgIGlmICggYm9vdHN5bSh0cmFtcG9saW5l
X2NwdV9zdGFydGVkKSA9PSAweEE1ICkKKyAgICAgICAgICAgIGlmICggdHJhbXBzeW0odHJhbXBv
bGluZV9jcHVfc3RhcnRlZCkgPT0gMHhBNSApCiAgICAgICAgICAgICAgICAgLyogdHJhbXBvbGlu
ZSBzdGFydGVkIGJ1dC4uLj8gKi8KICAgICAgICAgICAgICAgICBwcmludGsoIlN0dWNrID8/XG4i
KTsKICAgICAgICAgICAgIGVsc2UKQEAgLTYxNiw3ICs2MTYsNyBAQCBzdGF0aWMgaW50IGRvX2Jv
b3RfY3B1KGludCBhcGljaWQsIGludCBjcHUpCiAgICAgfQogCiAgICAgLyogbWFyayAic3R1Y2si
IGFyZWEgYXMgbm90IHN0dWNrICovCi0gICAgYm9vdHN5bSh0cmFtcG9saW5lX2NwdV9zdGFydGVk
KSA9IDA7CisgICAgdHJhbXBzeW0odHJhbXBvbGluZV9jcHVfc3RhcnRlZCkgPSAwOwogICAgIHNt
cF9tYigpOwogCiAgICAgc21wYm9vdF9yZXN0b3JlX3dhcm1fcmVzZXRfdmVjdG9yKCk7CmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvdGJvb3QuYyBiL3hlbi9hcmNoL3g4Ni90Ym9vdC5jCmluZGV4
IDllM2Q5YzRjNjkuLjAwNmYwNjc4YTYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni90Ym9vdC5j
CisrKyBiL3hlbi9hcmNoL3g4Ni90Ym9vdC5jCkBAIC0zNjksOSArMzY5LDkgQEAgdm9pZCB0Ym9v
dF9zaHV0ZG93bih1aW50MzJfdCBzaHV0ZG93bl90eXBlKQogICAgICAgICAgKi8KICAgICAgICAg
Z190Ym9vdF9zaGFyZWQtPm51bV9tYWNfcmVnaW9ucyA9IDM7CiAgICAgICAgIC8qIFMzIHJlc3Vt
ZSBjb2RlIChhbmQgb3RoZXIgcmVhbCBtb2RlIHRyYW1wb2xpbmUgY29kZSkgKi8KLSAgICAgICAg
Z190Ym9vdF9zaGFyZWQtPm1hY19yZWdpb25zWzBdLnN0YXJ0ID0gYm9vdHN5bV9waHlzKGJvb3Rf
dHJhbXBvbGluZV9zdGFydCk7Ci0gICAgICAgIGdfdGJvb3Rfc2hhcmVkLT5tYWNfcmVnaW9uc1sw
XS5zaXplID0gYm9vdHN5bV9waHlzKGJvb3RfdHJhbXBvbGluZV9lbmQpIC0KLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib290c3ltX3BoeXMoYm9vdF90cmFt
cG9saW5lX3N0YXJ0KTsKKyAgICAgICAgZ190Ym9vdF9zaGFyZWQtPm1hY19yZWdpb25zWzBdLnN0
YXJ0ID0gdHJhbXBzeW1fcGh5cyhwZXJtX3RyYW1wb2xpbmVfc3RhcnQpOworICAgICAgICBnX3Ri
b290X3NoYXJlZC0+bWFjX3JlZ2lvbnNbMF0uc2l6ZSA9IHRyYW1wc3ltX3BoeXMocGVybV90cmFt
cG9saW5lX2VuZCkgLQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHRyYW1wc3ltX3BoeXMocGVybV90cmFtcG9saW5lX3N0YXJ0KTsKICAgICAgICAgLyogaHlw
ZXJ2aXNvciAudGV4dCArIC5yb2RhdGEgKi8KICAgICAgICAgZ190Ym9vdF9zaGFyZWQtPm1hY19y
ZWdpb25zWzFdLnN0YXJ0ID0gKHVpbnQ2NF90KV9fcGEoJl9zdGV4dCk7CiAgICAgICAgIGdfdGJv
b3Rfc2hhcmVkLT5tYWNfcmVnaW9uc1sxXS5zaXplID0gX19wYSgmX18yTV9yb2RhdGFfZW5kKSAt
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgYi94ZW4vYXJjaC94ODYveDg2
XzY0L21tLmMKaW5kZXggZmZlOGJhMjA4Ni4uZGJiYmM2NGJlYiAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L3g4Nl82NC9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwpAQCAtNjk3
LDcgKzY5Nyw3IEBAIHZvaWQgX19pbml0IHphcF9sb3dfbWFwcGluZ3Modm9pZCkKIAogICAgIC8q
IFJlcGxhY2Ugd2l0aCBtYXBwaW5nIG9mIHRoZSBib290IHRyYW1wb2xpbmUgb25seS4gKi8KICAg
ICBtYXBfcGFnZXNfdG9feGVuKHRyYW1wb2xpbmVfcGh5cywgbWFkZHJfdG9fbWZuKHRyYW1wb2xp
bmVfcGh5cyksCi0gICAgICAgICAgICAgICAgICAgICBQRk5fVVAoYm9vdF90cmFtcG9saW5lX2Vu
ZCAtIGJvb3RfdHJhbXBvbGluZV9zdGFydCksCisgICAgICAgICAgICAgICAgICAgICBQRk5fVVAo
cGVybV90cmFtcG9saW5lX2VuZCAtIHBlcm1fdHJhbXBvbGluZV9zdGFydCksCiAgICAgICAgICAg
ICAgICAgICAgICBfX1BBR0VfSFlQRVJWSVNPUik7CiB9CiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvYWNwaS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9hY3BpLmgKaW5kZXggYzEz
OGRlZjFiZC4uZGZmZTAyYTM2MyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hY3Bp
LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9hY3BpLmgKQEAgLTExMCw3ICsxMTAsNyBAQCBl
eHRlcm4gaW50IGFjcGlfc2Nhbl9ub2Rlcyh1NjQgc3RhcnQsIHU2NCBlbmQpOwogI2lmZGVmIENP
TkZJR19BQ1BJX1NMRUVQCiAKIGV4dGVybiBzdHJ1Y3QgYWNwaV9zbGVlcF9pbmZvIGFjcGlfc2lu
Zm87Ci0jZGVmaW5lIGFjcGlfdmlkZW9fZmxhZ3MgYm9vdHN5bSh2aWRlb19mbGFncykKKyNkZWZp
bmUgYWNwaV92aWRlb19mbGFncyB0cmFtcHN5bSh2aWRlb19mbGFncykKIHN0cnVjdCB4ZW5wZl9l
bnRlcl9hY3BpX3NsZWVwOwogZXh0ZXJuIGludCBhY3BpX2VudGVyX3NsZWVwKHN0cnVjdCB4ZW5w
Zl9lbnRlcl9hY3BpX3NsZWVwICpzbGVlcCk7CiBleHRlcm4gaW50IGFjcGlfZW50ZXJfc3RhdGUo
dTMyIHN0YXRlKTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvY29uZmlnLmggYi94
ZW4vaW5jbHVkZS9hc20teDg2L2NvbmZpZy5oCmluZGV4IDliN2VkNTA4MjUuLmRiZDdjYjI1NWEg
MTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvY29uZmlnLmgKKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9jb25maWcuaApAQCAtOTAsMTIgKzkwLDEyIEBACiAKICNpZm5kZWYgX19BU1NF
TUJMWV9fCiBleHRlcm4gdW5zaWduZWQgbG9uZyB0cmFtcG9saW5lX3BoeXM7Ci0jZGVmaW5lIGJv
b3RzeW1fcGh5cyhzeW0pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgICgo
KHVuc2lnbmVkIGxvbmcpJihzeW0pLSh1bnNpZ25lZCBsb25nKSZib290X3RyYW1wb2xpbmVfc3Rh
cnQpK3RyYW1wb2xpbmVfcGh5cykKLSNkZWZpbmUgYm9vdHN5bShzeW0pICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCisjZGVmaW5lIHRyYW1wc3ltX3BoeXMoc3ltKSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAoKCh1bnNpZ25lZCBsb25nKSYoc3lt
KS0odW5zaWduZWQgbG9uZykmcGVybV90cmFtcG9saW5lX3N0YXJ0KSt0cmFtcG9saW5lX3BoeXMp
CisjZGVmaW5lIHRyYW1wc3ltKHN5bSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKICAgICAoKlJFTE9DX0hJREUoKHR5cGVvZigmKHN5bSkpKV9fdmEoX19wYSgmKHN5bSkp
KSwgICAgICBcCi0gICAgICAgICAgICAgICAgIHRyYW1wb2xpbmVfcGh5cy1fX3BhKGJvb3RfdHJh
bXBvbGluZV9zdGFydCkpKQotZXh0ZXJuIGNoYXIgYm9vdF90cmFtcG9saW5lX3N0YXJ0W10sIGJv
b3RfdHJhbXBvbGluZV9lbmRbXTsKKyAgICAgICAgICAgICAgICAgdHJhbXBvbGluZV9waHlzLV9f
cGEocGVybV90cmFtcG9saW5lX3N0YXJ0KSkpCitleHRlcm4gY2hhciBwZXJtX3RyYW1wb2xpbmVf
c3RhcnRbXSwgcGVybV90cmFtcG9saW5lX2VuZFtdOwogZXh0ZXJuIGNoYXIgdHJhbXBvbGluZV9y
ZWFsbW9kZV9lbnRyeVtdOwogZXh0ZXJuIHVuc2lnbmVkIGludCB0cmFtcG9saW5lX3hlbl9waHlz
X3N0YXJ0OwogZXh0ZXJuIHVuc2lnbmVkIGNoYXIgdHJhbXBvbGluZV9jcHVfc3RhcnRlZDsKLS0g
CjIuMTcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
