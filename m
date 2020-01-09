Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB010136138
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 20:36:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipdY6-0001tC-Eb; Thu, 09 Jan 2020 19:32:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zaws=26=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipdY4-0001t6-SV
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 19:32:52 +0000
X-Inumbo-ID: d33f5581-3316-11ea-ba61-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d33f5581-3316-11ea-ba61-12813bfff9fa;
 Thu, 09 Jan 2020 19:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578598372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4T2bHZMNtQ/+mkzwSgBiDf/wC0cM6a9T4871J62jmJM=;
 b=CaPDE3Xd7ZBmFrU5g8ZLa3SqZriVJ7a8yDNQgGIFR1sBX1NovRgFnoPf
 6Mko3tA6vpy1Ah4h4PiNPOdaahm7XllHsGlq8RFx3iqGpNeef5nur8S2I
 S3c5dqSdMc5tlT3sOZWeC4mK2eiBO0Iho2658+7X5IJbvH7XpoucCi4JV I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ea7VDE+wFYXXqEa5FDWMLxDjTSGYJp7E+faaqdfH+Mi/2H8g7vvlPXB71YT90GgkuEFK/sL+YU
 w1A9WNafERv03ERYGuO2EEnHRSPd1dw8jk04Hhe3Ecoi7IPsnXWRL/nTrH0SPiPvG462YpTxM3
 AiZa1+BdSD/Ngs3e7UIZNXdaX006GIwPoTHh/pdcymJpTDg1yJL/zLDdgqWvujHTd7eztGtRzR
 799vfT/dRdk7VCHoDAyhUmqL9omRU3CmBbjxVQhQR0T2ibLesOwPG+ULPtjkuSvMuQKRwq3zB+
 1+g=
X-SBRS: 2.7
X-MesageID: 11295601
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,414,1571716800"; d="scan'208";a="11295601"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 9 Jan 2020 19:32:41 +0000
Message-ID: <20200109193241.14542-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200109193241.14542-1-andrew.cooper3@citrix.com>
References: <20200109193241.14542-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 4/4] x86/boot: Drop INVALID_VCPU
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

Tm93IHRoYXQgTlVMTCB3aWxsIGZhdWx0IGF0IGJvb3QsIHRoZXJlIGlzIG5vIG5lZWQgZm9yIGEg
c3BlY2lhbCBjb25zdGFudCB0bwpzaWduaWZ5ICJjdXJyZW50IG5vdCBzZXQgdXAgeWV0Ii4KClNp
bmNlIGMvcyBmYWUyNDlkMjM0MTMgIng4Ni9ib290OiBSYXRpb25hbGlzZSBzdGFjayBoYW5kbGlu
ZyBkdXJpbmcgZWFybHkKYm9vdCIsIHRoZSBCU1AgY3B1X2luZm8gYmxvY2sgaXMgbm93IGNvbnNp
c3RlbnRseSB6ZXJvLCBzbyBkcm9wIHRoZSBhZGphY2VudApyZS16ZXJvaW5nLgoKU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpD
QzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgp2MjoKICogRHJvcCBy
ZS16ZXJvaWduIG9mIHRoZSBjcHVfaW5mbyBibG9jawotLS0KIHhlbi9hcmNoL3g4Ni9jcHUvbWNo
ZWNrL21jZS5jIHwgMiArLQogeGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMgICAgfCAyICstCiB4
ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgICB8IDMgLS0tCiB4ZW4vYXJjaC94ODYvdGJvb3Qu
YyAgICAgICAgICB8IDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvc2V0dXAuaCAgIHwgMyAtLS0K
IDUgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5jIGIveGVuL2FyY2gveDg2L2NwdS9t
Y2hlY2svbWNlLmMKaW5kZXggMjlmM2Y5YzVlMy4uMTk4NTk1ZmY5NyAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9tY2hlY2sv
bWNlLmMKQEAgLTI2MCw3ICsyNjAsNyBAQCBzdGF0aWMgaW50IG1jYV9pbml0X2dsb2JhbCh1aW50
MzJfdCBmbGFncywgc3RydWN0IG1jaW5mb19nbG9iYWwgKm1pZykKICAgICAgICAgICAgICAgICAg
ICAgICAgICZtaWctPm1jX2NvcmVpZCwgJm1pZy0+bWNfY29yZV90aHJlYWRpZCwKICAgICAgICAg
ICAgICAgICAgICAgICAgICZtaWctPm1jX2FwaWNpZCwgTlVMTCwgTlVMTCwgTlVMTCk7CiAKLSAg
ICBpZiAoIGN1cnIgIT0gSU5WQUxJRF9WQ1BVICkKKyAgICBpZiAoIGN1cnIgKQogICAgIHsKICAg
ICAgICAgbWlnLT5tY19kb21pZCA9IGN1cnItPmRvbWFpbi0+ZG9tYWluX2lkOwogICAgICAgICBt
aWctPm1jX3ZjcHVpZCA9IGN1cnItPnZjcHVfaWQ7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
ZG9tYWluX3BhZ2UuYyBiL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jCmluZGV4IDRhMDdjZmIx
OGUuLmRkMzI3MTJkMmYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jCkBAIC0yOSw3ICsyOSw3IEBAIHN0YXRpYyBp
bmxpbmUgc3RydWN0IHZjcHUgKm1hcGNhY2hlX2N1cnJlbnRfdmNwdSh2b2lkKQogICAgICAqIFdo
ZW4gY3VycmVudCBpc24ndCBwcm9wZXJseSBzZXQgdXAgeWV0LCB0aGlzIGlzIGVxdWl2YWxlbnQg
dG8KICAgICAgKiBydW5uaW5nIGluIGFuIGlkbGUgdkNQVSAoY2FsbGVycyBtdXN0IGNoZWNrIGZv
ciBOVUxMKS4KICAgICAgKi8KLSAgICBpZiAoIHYgPT0gSU5WQUxJRF9WQ1BVICkKKyAgICBpZiAo
ICF2ICkKICAgICAgICAgcmV0dXJuIE5VTEw7CiAKICAgICAvKgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwppbmRleCA2MmFkYzllMmE4Li4x
YjZjYTRhNDdkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYworKysgYi94ZW4vYXJj
aC94ODYvc2V0dXAuYwpAQCAtNzA3LDkgKzcwNyw2IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9f
c3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCiAKICAgICAvKiBDcml0aWNhbCByZWdpb24g
d2l0aG91dCBJRFQgb3IgVFNTLiAgQW55IGZhdWx0IGlzIGRlYWRseSEgKi8KIAotICAgIHNldF9w
cm9jZXNzb3JfaWQoMCk7Ci0gICAgc2V0X2N1cnJlbnQoSU5WQUxJRF9WQ1BVKTsgLyogZGVidWcg
c2FuaXR5LiAqLwotICAgIGlkbGVfdmNwdVswXSA9IGN1cnJlbnQ7CiAgICAgaW5pdF9zaGFkb3df
c3BlY19jdHJsX3N0YXRlKCk7CiAKICAgICBwZXJjcHVfaW5pdF9hcmVhcygpOwpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3Rib290LmMgYi94ZW4vYXJjaC94ODYvdGJvb3QuYwppbmRleCAzZTgy
OGZlMjA0Li41MDIwYzRhZDQ5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvdGJvb3QuYworKysg
Yi94ZW4vYXJjaC94ODYvdGJvb3QuYwpAQCAtMzkyLDcgKzM5Miw3IEBAIHZvaWQgdGJvb3Rfc2h1
dGRvd24odWludDMyX3Qgc2h1dGRvd25fdHlwZSkKICAgICAgKiBEdXJpbmcgZWFybHkgYm9vdCwg
d2UgY2FuIGJlIGNhbGxlZCBieSBwYW5pYyBiZWZvcmUgaWRsZV92Y3B1WzBdIGlzCiAgICAgICog
c2V0dXAsIGJ1dCBpbiB0aGF0IGNhc2Ugd2UgZG9uJ3QgbmVlZCB0byBjaGFuZ2UgcGFnZSB0YWJs
ZXMuCiAgICAgICovCi0gICAgaWYgKCBpZGxlX3ZjcHVbMF0gIT0gSU5WQUxJRF9WQ1BVICkKKyAg
ICBpZiAoIGlkbGVfdmNwdVswXSApCiAgICAgICAgIHdyaXRlX3B0YmFzZShpZGxlX3ZjcHVbMF0p
OwogCiAgICAgKCh2b2lkKCopKHZvaWQpKSh1bnNpZ25lZCBsb25nKWdfdGJvb3Rfc2hhcmVkLT5z
aHV0ZG93bl9lbnRyeSkoKTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc2V0dXAu
aCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc2V0dXAuaAppbmRleCA4NjFkNDZkNmFjLi4yODI1N2Jj
NWM4IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3NldHVwLmgKKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9zZXR1cC5oCkBAIC00LDkgKzQsNiBAQAogI2luY2x1ZGUgPHhlbi9tdWx0
aWJvb3QuaD4KICNpbmNsdWRlIDxhc20vbnVtYS5oPgogCi0vKiB2Q1BVIHBvaW50ZXIgdXNlZCBw
cmlvciB0byB0aGVyZSBiZWluZyBhIHZhbGlkIG9uZSBhcm91bmQgKi8KLSNkZWZpbmUgSU5WQUxJ
RF9WQ1BVICgoc3RydWN0IHZjcHUgKikweGNjY2NjY2NjY2NjY2MwMDBVTCkKLQogZXh0ZXJuIGNv
bnN0IGNoYXIgX18yTV90ZXh0X3N0YXJ0W10sIF9fMk1fdGV4dF9lbmRbXTsKIGV4dGVybiBjb25z
dCBjaGFyIF9fMk1fcm9kYXRhX3N0YXJ0W10sIF9fMk1fcm9kYXRhX2VuZFtdOwogZXh0ZXJuIGNo
YXIgX18yTV9pbml0X3N0YXJ0W10sIF9fMk1faW5pdF9lbmRbXTsKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
