Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3813113FC7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 11:57:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icojU-0007sF-Hn; Thu, 05 Dec 2019 10:51:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G9sg=Z3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1icojS-0007s9-Fx
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 10:51:38 +0000
X-Inumbo-ID: 35e5f396-174d-11ea-a0d2-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35e5f396-174d-11ea-a0d2-bc764e2007e4;
 Thu, 05 Dec 2019 10:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575543097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pw1JewxFnchssyqWPRk//HZa44jJe7aWETaAmZFFzF8=;
 b=RHwzHcip14mZRU82YwXN055uKifZLolXmCkFtlQm7OOiS17TiIH6FUMq
 ujpSMLeIhHKHpY3ZUsinqP0lysnn0GiArQCQSonIkKxE8W8FH9rZZoJbh
 +FZ2fP/xKmlcX0q/WecQvVReE2lOWrGVNRlT7RrJ4rUv00pT2KlRqQ7ex U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PeIZiqJ6xCj8XxnuOCcrrRhLjjn5iilVUKaNIkpXv75rLULiPlA/DAyFXGtwOpfLSWZSD0x74m
 9wVgnTbvHB56g3FlmfHwUO74iT13uXrRNpbaoablNAXYgcFV8glSH1avpE5EeZi6r9ESNCl8Qs
 UI2nM0NyUCyB8kkt7vpLLzeGj5RPaA5VGUaVK0o39P7WLIrM6ehZk1njcKcqWh2s0NR27SFora
 MTFp6UzBVBdC9h/XdkFG/uymJqJ5gADKJ4pnO2H3lONlyBgMXRHoB7sbWDqsJ/C2rI4ItZyTc+
 2lM=
X-SBRS: 2.7
X-MesageID: 9241747
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,281,1571716800"; 
   d="scan'208";a="9241747"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 5 Dec 2019 10:51:34 +0000
Message-ID: <20191205105134.7801-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191204094335.24603-1-andrew.cooper3@citrix.com>
References: <20191204094335.24603-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/4] x86/svm: Minor cleanup to start_svm()
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

VGhlIGZ1bmN0aW9uIGlzIGluaXQsIHNvIGNhbiB1c2UgYm9vdF9jcHVfZGF0YSBkaXJlY3RseS4K
ClRoZXJlIGlzIG5vIG5lZWQgdG8gd3JpdGUgMCB0byBzdm1fZmVhdHVyZV9mbGFncyBpbiB0aGUg
Y2FzZSBvZiBhIENQVUlECm1pc21hdGNoIChub3QgbGVhc3QgYmVjYXVzZSB0aGlzIGlzIGRlYWQg
Y29kZSBvbiByZWFsIGhhcmR3YXJlKSwgYW5kIG5vIG5lZWQKdG8gdXNlIGxvY2tlZCBhdG9taWMg
b3BlcmF0aW9ucy4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jIHwgNiArKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwpp
bmRleCBhZjNkNDVmZTU2Li44MDZiZjkxMTcxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3N2bS9zdm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwpAQCAtMTYzMiwxNCAr
MTYzMiwxNCBAQCBjb25zdCBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlICogX19pbml0IHN0YXJ0
X3N2bSh2b2lkKQogCiAgICAgc2V0dXBfdm1jYl9kdW1wKCk7CiAKLSAgICBzdm1fZmVhdHVyZV9m
bGFncyA9IChjdXJyZW50X2NwdV9kYXRhLmV4dGVuZGVkX2NwdWlkX2xldmVsID49IDB4ODAwMDAw
MEEgPwotICAgICAgICAgICAgICAgICAgICAgICAgIGNwdWlkX2VkeCgweDgwMDAwMDBBKSA6IDAp
OworICAgIGlmICggYm9vdF9jcHVfZGF0YS5leHRlbmRlZF9jcHVpZF9sZXZlbCA+PSAweDgwMDAw
MDBhICkKKyAgICAgICAgc3ZtX2ZlYXR1cmVfZmxhZ3MgPSBjcHVpZF9lZHgoMHg4MDAwMDAwYSk7
CiAKICAgICBwcmludGsoIlNWTTogU3VwcG9ydGVkIGFkdmFuY2VkIGZlYXR1cmVzOlxuIik7CiAK
ICAgICAvKiBEZWNvZGVBc3Npc3RzIGZhc3QgcGF0aHMgYXNzdW1lIG5leHRyaXAgaXMgdmFsaWQg
Zm9yIGZhc3QgcklQIHVwZGF0ZS4gKi8KICAgICBpZiAoICFjcHVfaGFzX3N2bV9ucmlwcyApCi0g
ICAgICAgIGNsZWFyX2JpdChTVk1fRkVBVFVSRV9ERUNPREVBU1NJU1RTLCAmc3ZtX2ZlYXR1cmVf
ZmxhZ3MpOworICAgICAgICBfX2NsZWFyX2JpdChTVk1fRkVBVFVSRV9ERUNPREVBU1NJU1RTLCAm
c3ZtX2ZlYXR1cmVfZmxhZ3MpOwogCiAgICAgaWYgKCBjcHVfaGFzX3RzY19yYXRpbyApCiAgICAg
ICAgIHN2bV9mdW5jdGlvbl90YWJsZS50c2Nfc2NhbGluZy5yYXRpb19mcmFjX2JpdHMgPSAzMjsK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
