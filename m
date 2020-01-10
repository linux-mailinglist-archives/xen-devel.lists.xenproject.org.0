Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E19013725C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 17:06:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipwm5-0008U7-OA; Fri, 10 Jan 2020 16:04:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vEkf=27=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipwm3-0008Ty-SH
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 16:04:35 +0000
X-Inumbo-ID: e0144e44-33c2-11ea-ac27-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0144e44-33c2-11ea-ac27-bc764e2007e4;
 Fri, 10 Jan 2020 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578672266;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J3jkwhbkYBTQPFeoMX+4Kq27RChxu9RkHpM2LNf45nw=;
 b=P3VDFQAbmAVwTpqfTt9V1QNlnVZsVxU5YPF4J6O1PJFNjObo6/j0LchR
 6W7fZOfIsCEo6cTaW2Z8AonguZ4l1/to6YnBsw3S3vaWUypZ0cRuR8iWK
 8PKb0caHdRV6KaIfVTlp4aWdl/zxrHyT735adFaf5dWK90LKMfHoGXWrP Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Qu+okuvZZTFWVC2OSlNp3A0j8bp79jSX8eIg14EKHGw4P8NWePk7BQHgHxZovgUsQJob2lydjy
 hc2nRi1RtGeaJ68aPNg8bPAw4IzOdSQQfJySu07O2BU4if3AFzymFa/hPbEPh6LoTMrctpZrYj
 r1eCN+MU94UWNgL3/ZY8j2vQD7VkE0kaUZrDyiJc5cbLePMZqOQMTyN/Y3TqmHdrc5MY/LZXtH
 CJA3OEHZF0rqXZwBWnKq09VVk26wUhlbreRc5t+ODRiAJKpE8y0K36v8ZbW1sywZDvls5SBMBb
 Cc4=
X-SBRS: 2.7
X-MesageID: 11122722
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,417,1571716800"; d="scan'208";a="11122722"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 10 Jan 2020 17:04:01 +0100
Message-ID: <20200110160404.15573-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/3] x86: improve assisted tlb flush and use
 it in guest mode
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBhaW1zIHRvIGltcHJvdmUgdGhlIFRMQiBmbHVz
aCB0aW1lcyB3aGVuIHJ1bm5pbmcKbmVzdGVkIFhlbiwgYW5kIGl0J3Mgc3BlY2lhbGx5IGJlbmVm
aWNpYWwgd2hlbiBydW5uaW5nIGluIHNoaW0gbW9kZS4KClBhdGNoICMyIGlzIGxpa2VseSB0aGUg
bW9zdCBjb250cm92ZXJzaWFsIG9uZSwgYXMgaXQgY2hhbmdlcyB0aGUKaW1wbGVtZW50YXRpb24g
b2YgYXNzaXN0ZWQgVExCIGZsdXNoZXMuIEkgaGF2ZSB0byBhZG1pdCBJIGhhdmVuJ3QgYmVlbgph
YmxlIHRvIGZpZ3VyZSBvdXQgd2h5IEhWTSBndWVzdCBjb250ZXh0IGZsdXNoZXMgaXNzdWVkIGEK
Zmx1c2hfdGxiX21hc2ssIGFuZCB0aGUgY29tbWl0IGludHJvZHVjaW5nIHN1Y2ggYmVoYXZpb3Ig
ZG9lc24ndCBjb250YWluCmEgaGVscGZ1bCBjb21taXQgbWVzc2FnZS4KClNlZSBwYXRjaCAjMyBm
b3IgYSBjb21wYXJpc29uIG9uIHRoZSBwZXJmb3JtYW5jZSBvZiB0aGUgTDAgYXNzaXN0ZWQKZmx1
c2ggdnMgdXNpbmcgeDJBUElDIHNob3J0aGFuZC4KClRoYW5rcywgUm9nZXIuCgpSb2dlciBQYXUg
TW9ubmUgKDMpOgogIHg4Ni9odm06IGFsbG93IEFTSUQgZmx1c2ggd2hlbiB2ICE9IGN1cnJlbnQK
ICB4ODYvaHZtOiByZXdvcmsgSFZNT1BfZmx1c2hfdGxicwogIHg4Ni90bGI6IHVzZSBYZW4gTDAg
YXNzaXN0ZWQgVExCIGZsdXNoIHdoZW4gYXZhaWxhYmxlCgogeGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydmlzb3IuYyAgICAgICAgfCAgOSArKysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4u
YyAgICAgICAgICAgfCAgNiArKysKIHhlbi9hcmNoL3g4Ni9odm0vYXNpZC5jICAgICAgICAgICAg
ICAgIHwgIDYgKy0tCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgICAgICAgICB8IDU0
ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3Zp
cmlkaWFuLmMgICB8ICA3ICstLS0KIHhlbi9hcmNoL3g4Ni9zbXAuYyAgICAgICAgICAgICAgICAg
ICAgIHwgIDYgKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCB8IDEz
ICsrKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oICAgICAgICAgIHwgIDIgKy0K
IDggZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCgotLSAK
Mi4yNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
