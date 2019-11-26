Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8239109D79
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 13:06:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZZc-0002I4-64; Tue, 26 Nov 2019 12:04:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/P3v=ZS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iZZZa-0002Hq-8J
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 12:04:02 +0000
X-Inumbo-ID: d55ac3da-1044-11ea-83b8-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d55ac3da-1044-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574769841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8fq+LQnAtNAKRihUw4abp4YgZ5mjtCEESGTUOgajV4E=;
 b=dWIw8b8BEAghQWfb8QSlDxI/lY9VomGuK18f5ZrYwf8Embujq2edYtsJ
 is5YWcU3PWguWjSpk3fHaSIHFbFs4+HZADBqnqqTLCwJxjd7Dsoijl133
 SvKlt9OyazIW3YjM90ujC6kVm1OsdtmLfMKhQSxiYbBT6RsmnHB1bkMq1 Y=;
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
IronPort-SDR: Sg0EqeYEtEdfNGjHeNFByodRMW0DBGOkWLh4Wqcc6y8a+nmgWmW2bzpTardutJydXHsZhcdATM
 WqtF5SQXCaMO7vyAOusmYglrIkkBz5n/8h1XfOSU34ejo+vUs6EbR4C4nD0q0f4202FK+kGCWw
 p727FZuSiza/Bh8Qgta6HhTkQ01l+6VIfy7QYEZjTBM+xlKK3oCWKenPUfAFS49gk6cdufflKU
 f6QcnSyyLx9TVUejZyRtvBuOX0YqpgkukOQRjUUrts+DndarIFEDAqQCOpcYO/iOhF/ckNWcBE
 Oxc=
X-SBRS: 2.7
X-MesageID: 9390034
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,245,1571716800"; 
   d="scan'208";a="9390034"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 12:03:54 +0000
Message-ID: <20191126120357.13398-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v2 0/3] x86/hvm: Multiple corrections
 to task switch handling
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgcGF0Y2hlcyB3YW50IGJhY2twb3J0aW5nIGR1ZSB0byB0aGUgc2V2ZXJpdHkgb2YgcGF0
Y2ggMi4gIFRoZXkgc2hvdWxkCnRoZXJlZm9yZSBiZSBjb25zaWRlcmVkIGZvciA0LjEzIGF0IHRo
aXMgcG9pbnQuCgpBbmRyZXcgQ29vcGVyICgzKToKICB4ODYvdnR4OiBGaXggZmF1bHQgc2VtYW50
aWNzIGZvciBlYXJseSB0YXNrIHN3aXRjaCBmYWlsdXJlcwogIHg4Ni9zdm06IEFsd2F5cyBpbnRl
cmNlcHQgSUNFQlAKICB4ODYvc3ZtOiBXcml0ZSB0aGUgY29ycmVjdCAlZWlwIGludG8gdGhlIG91
dGdvaW5nIHRhc2sKCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgICAgICAgIHwgIDQg
Ky0KIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL2VtdWxhdGUuYyAgICAgICAgfCA1NCArKysrKysrKysr
KysrKysrKysrKysrKysKIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jICAgICAgICAgICAgfCA3
NyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L2h2bS9z
dm0vdm1jYi5jICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyAg
ICAgICAgICAgIHwgIDQgKy0KIHhlbi9hcmNoL3g4Ni9tb25pdG9yLmMgICAgICAgICAgICAgICAg
fCAgMyAtLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmggICAgICAgICB8IDEzICstLS0t
LQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL2VtdWxhdGUuaCB8ICAxICsKIDggZmlsZXMg
Y2hhbmdlZCwgMTA5IGluc2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
