Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA9A15919B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 15:10:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1WDR-0008EH-Dr; Tue, 11 Feb 2020 14:08:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BEN5=37=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j1WDQ-0008EC-Ct
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 14:08:40 +0000
X-Inumbo-ID: 00624c40-4cd8-11ea-8bf0-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00624c40-4cd8-11ea-8bf0-bc764e2007e4;
 Tue, 11 Feb 2020 14:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581430120;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wDZ8da/P3RxEsccKLRKUl5KDl0lqwvfsyMjzGM4ztf8=;
 b=XLwoH1gEhX8a4y+Nlesgr7zUvR2Vanq+wvILeNktK7zURxx1/F/SsyK3
 VBzbAzACsvE6fNQSrPF9bh2rxfGn/eIUmGD00aI+pdme6d7wpbjyTGsuD
 mvL5mMyCN+qwcnR1vVyXc836WdN9ZSg4gAzOZ1IgZ7TNd012YLGTd6wIH U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZmCWkTZ+DE/ITDxNfkldmGvQZZ/rSSRwbsF3ybCsM6c7L+87GanYTThWOAuE/4kiQLBOU65QQS
 gX5RYQSNdDx41b0KkbqJPSYYDylK3VQTGtaS3XupVFz8GDSvgnYWnyofOmQDUTUfJDmFsFRim2
 B58n3ZqE2p0YdlBC9mjNb+Zw87QdQVMtYb5YWu9ngAKmCgAeTRup6RHfTQ87GC03CHichj+sJJ
 zTIqgCUBx77LkizrINxL3CizTJwIbOex/zCOk/9HeslZd3qVtp+19n1whK47DS31d9KpgoAz+z
 hAA=
X-SBRS: 2.7
X-MesageID: 12445351
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12445351"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 11 Feb 2020 14:08:25 +0000
Message-ID: <20200211140825.1192-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] hvmloader: Drop use of XENVER_extraversion
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHByaW50ZigpIGluIGluaXRfaHlwZXJjYWxscygpIG9ubHkgZW5kcyB1cCBpbiB0aGUgaHlw
ZXJ2aXNvciBjb25zb2xlIGxvZywKc28gZXh0cmF2ZXJzaW9uIHJlYWxseSBpc24ndCBpbnRlcmVz
dGluZy4KClRoZSBTTUJpb3MgdGFibGUgZG9lc24ndCBuZWVkIGV4dHJhdmVyc2lvbiwgYW5kIHJl
bW92aW5nIGl0IHJlZHVjZXMgdGhlCmFiaWxpdHkgZm9yIGEgZ3Vlc3QgdG8gZmluZ2VycHJpbnQg
dGhlIGV4YWN0IGh5cGVydmlzb3IgaXQgaXMgcnVubmluZyB1bmRlci4KClNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHRvb2xzL2Zpcm13YXJl
L2h2bWxvYWRlci9odm1sb2FkZXIuYyB8ICA0ICstLS0KIHRvb2xzL2Zpcm13YXJlL2h2bWxvYWRl
ci9zbWJpb3MuYyAgICB8IDEwIC0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxv
YWRlci9odm1sb2FkZXIuYyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9odm1sb2FkZXIuYwpp
bmRleCA1OThhMjI2Mjc4Li45OWM4ODQxNzkwIDEwMDY0NAotLS0gYS90b29scy9maXJtd2FyZS9o
dm1sb2FkZXIvaHZtbG9hZGVyLmMKKysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL2h2bWxv
YWRlci5jCkBAIC0xMjEsNyArMTIxLDYgQEAgc3RhdGljIHZvaWQgaW5pdF9oeXBlcmNhbGxzKHZv
aWQpCiAgICAgdWludDMyX3QgZWF4LCBlYngsIGVjeCwgZWR4OwogICAgIHVuc2lnbmVkIGxvbmcg
aTsKICAgICBjaGFyIHNpZ25hdHVyZVsxM107Ci0gICAgeGVuX2V4dHJhdmVyc2lvbl90IGV4dHJh
dmVyc2lvbjsKICAgICB1aW50MzJfdCBiYXNlOwogCiAgICAgZm9yICggYmFzZSA9IDB4NDAwMDAw
MDA7IGJhc2UgPCAweDQwMDEwMDAwOyBiYXNlICs9IDB4MTAwICkKQEAgLTE0Niw4ICsxNDUsNyBA
QCBzdGF0aWMgdm9pZCBpbml0X2h5cGVyY2FsbHModm9pZCkKIAogICAgIC8qIFByaW50IHZlcnNp
b24gaW5mb3JtYXRpb24uICovCiAgICAgY3B1aWQoYmFzZSArIDEsICZlYXgsICZlYngsICZlY3gs
ICZlZHgpOwotICAgIGh5cGVyY2FsbF94ZW5fdmVyc2lvbihYRU5WRVJfZXh0cmF2ZXJzaW9uLCBl
eHRyYXZlcnNpb24pOwotICAgIHByaW50ZigiRGV0ZWN0ZWQgWGVuIHYldS4ldSVzXG4iLCBlYXgg
Pj4gMTYsIGVheCAmIDB4ZmZmZiwgZXh0cmF2ZXJzaW9uKTsKKyAgICBwcmludGYoIkRldGVjdGVk
IFhlbiB2JXUuJXVcbiIsIGVheCA+PiAxNiwgZWF4ICYgMHhmZmZmKTsKIH0KIAogLyogUmVwbGFj
ZSBwb3NzaWJseSBlcnJvbmVvdXMgbWVtb3J5LXNpemUgQ01PUyBmaWVsZHMgd2l0aCBjb3JyZWN0
IHZhbHVlcy4gKi8KZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9zbWJpb3Mu
YyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9zbWJpb3MuYwppbmRleCA5N2EwNTRlOWUzLi40
NmJhMWNiN2IzIDEwMDY0NAotLS0gYS90b29scy9maXJtd2FyZS9odm1sb2FkZXIvc21iaW9zLmMK
KysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3NtYmlvcy5jCkBAIC0yNTYsNyArMjU2LDYg
QEAgaHZtX3dyaXRlX3NtYmlvc190YWJsZXMoCiAgICAgeGVuX2RvbWFpbl9oYW5kbGVfdCB1dWlk
OwogICAgIHVpbnQxNl90IHhlbl9tYWpvcl92ZXJzaW9uLCB4ZW5fbWlub3JfdmVyc2lvbjsKICAg
ICB1aW50MzJfdCB4ZW5fdmVyc2lvbjsKLSAgICBjaGFyIHhlbl9leHRyYV92ZXJzaW9uW1hFTl9F
WFRSQVZFUlNJT05fTEVOXTsKICAgICAvKiBndWVzcyBjb25zZXJ2YXRpdmVseSBvbiBidWZmZXIg
bGVuZ3RoIGZvciBYZW4gdmVyc2lvbiBzdHJpbmcgKi8KICAgICBjaGFyIHhlbl92ZXJzaW9uX3N0
cls4MF07CiAgICAgLyogdGVtcG9yYXJ5IHZhcmlhYmxlcyB1c2VkIHRvIGJ1aWxkIHVwIFhlbiB2
ZXJzaW9uIHN0cmluZyAqLwpAQCAtMjc0LDggKzI3Myw2IEBAIGh2bV93cml0ZV9zbWJpb3NfdGFi
bGVzKAogICAgIHhlbl9tYWpvcl92ZXJzaW9uID0gKHVpbnQxNl90KSAoeGVuX3ZlcnNpb24gPj4g
MTYpOwogICAgIHhlbl9taW5vcl92ZXJzaW9uID0gKHVpbnQxNl90KSB4ZW5fdmVyc2lvbjsKIAot
ICAgIGh5cGVyY2FsbF94ZW5fdmVyc2lvbihYRU5WRVJfZXh0cmF2ZXJzaW9uLCB4ZW5fZXh0cmFf
dmVyc2lvbik7Ci0KICAgICAvKiBidWlsZCB1cCBodW1hbi1yZWFkYWJsZSBYZW4gdmVyc2lvbiBz
dHJpbmcgKi8KICAgICBwID0geGVuX3ZlcnNpb25fc3RyOwogICAgIGxlbiA9IDA7CkBAIC0zMDIs
MTMgKzI5OSw2IEBAIGh2bV93cml0ZV9zbWJpb3NfdGFibGVzKAogICAgIHN0cmNweShwLCB0bXAp
OwogICAgIHAgKz0gdG1wX2xlbjsKIAotICAgIHRtcF9sZW4gPSBzdHJsZW4oeGVuX2V4dHJhX3Zl
cnNpb24pOwotICAgIGxlbiArPSB0bXBfbGVuOwotICAgIGlmICggbGVuID49IHNpemVvZih4ZW5f
dmVyc2lvbl9zdHIpICkKLSAgICAgICAgZ290byBlcnJvcl9vdXQ7Ci0gICAgc3RyY3B5KHAsIHhl
bl9leHRyYV92ZXJzaW9uKTsKLSAgICBwICs9IHRtcF9sZW47Ci0KICAgICB4ZW5fdmVyc2lvbl9z
dHJbc2l6ZW9mKHhlbl92ZXJzaW9uX3N0ciktMV0gPSAnXDAnOwogCiAgICAgLyogc2NyYXRjaF9z
dGFydCBpcyBhIHNhZmUgbGFyZ2UgbWVtb3J5IGFyZWEgZm9yIHNjcmF0Y2guICovCi0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
