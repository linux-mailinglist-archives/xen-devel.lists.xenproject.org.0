Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3F0A55B2
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 14:14:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4lBd-0007Lf-Ua; Mon, 02 Sep 2019 12:11:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jggy=W5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i4lBd-0007LU-9Q
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 12:11:57 +0000
X-Inumbo-ID: db4a200e-cd7a-11e9-b95f-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db4a200e-cd7a-11e9-b95f-bc764e2007e4;
 Mon, 02 Sep 2019 12:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567426317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w6i41ZxPiPF2yUs3xAzSTkIf3AiNAEX/fl83Hf/iJ2k=;
 b=CmVc/4PQ93pV7Ezk7/xYk9dXEB+Jn7ZW3eZxBbmkjioyT328iCLMu551
 l4t5MrsufVTEsJaIHUn4KMegEJ/vAoi+RxdS8ju6IDQ4gvL960pAaQm7/
 fKcKCWFbUTghqjQ/mkoNuEz7HC5iOOxBm9t/8625s0WwxAwjp3+427Ir2 o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6g+TGuXWfnbNTIrHE5QLyOIQVAH9w3CpgRAi7YmJzfsj9i3xgN2WjrrbX+f+27HwnJ5RDiMFBu
 S0DF/+r5WzOHuFmQjIqFfpOfqBRYxmXdhY1z+CaO/ClyUYsNhF6YDg61gJ8yd5v3teMvcv4n1Q
 YuEkT9qnKLKgRii4YhSxW4+YYGuuwXWi7h8xeFYLAroG7LPpnkuRDoC9hoNY0mAo7sD0/mT1ug
 vCmMQky27ZhL4LjDstS5J/60kBJFHWUA/c8O9z+FCY75rch9pKoqqsWjmDSZ4H3QduoUetex2V
 UHo=
X-SBRS: 2.7
X-MesageID: 5014793
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5014793"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 2 Sep 2019 13:11:50 +0100
Message-ID: <20190902121151.11384-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] x86/acpi: Drop sleep_states[] and
 associated print messages
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

c2xlZXBfc3RhdGVzW10gaXMgYSB3cml0ZS1vbmx5IGFycmF5LCBhbmQgZGVzcGl0ZSB0aGUgbG9v
cCBsb2dpYywgdGhlIHByaW50ZWQKbWVzc2FnZSBpcyBjb25zaXN0ZW50bHkgIkFDUEkgc2xlZXAg
bW9kZXM6IFMzIi4gIERyb3AgaXQgYWxsLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYyB8IDE1
IC0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMgYi94ZW4vYXJjaC94ODYvYWNwaS9wb3dl
ci5jCmluZGV4IGQ4M2U4Y2RkNTIuLjZhZTllMjkyMjkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9hY3BpL3Bvd2VyLmMKKysrIGIveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYwpAQCAtMzYsNyAr
MzYsNiBAQCB1aW50MzJfdCBzeXN0ZW1fcmVzZXRfY291bnRlciA9IDE7CiBzdGF0aWMgY2hhciBf
X2luaXRkYXRhIG9wdF9hY3BpX3NsZWVwWzIwXTsKIHN0cmluZ19wYXJhbSgiYWNwaV9zbGVlcCIs
IG9wdF9hY3BpX3NsZWVwKTsKIAotc3RhdGljIHU4IHNsZWVwX3N0YXRlc1tBQ1BJX1NfU1RBVEVf
Q09VTlRdOwogc3RhdGljIERFRklORV9TUElOTE9DSyhwbV9sb2NrKTsKIAogc3RydWN0IGFjcGlf
c2xlZXBfaW5mbyBhY3BpX3NpbmZvOwpAQCAtNDYwLDcgKzQ1OSw2IEBAIGFjcGlfc3RhdHVzIGFj
cGlfZW50ZXJfc2xlZXBfc3RhdGUodTggc2xlZXBfc3RhdGUpCiAKIHN0YXRpYyBpbnQgX19pbml0
IGFjcGlfc2xlZXBfaW5pdCh2b2lkKQogewotICAgIGludCBpOwogICAgIGNoYXIgKnAgPSBvcHRf
YWNwaV9zbGVlcDsKIAogICAgIHdoaWxlICggKHAgIT0gTlVMTCkgJiYgKCpwICE9ICdcMCcpICkK
QEAgLTQ3NCwxOSArNDcyLDYgQEAgc3RhdGljIGludCBfX2luaXQgYWNwaV9zbGVlcF9pbml0KHZv
aWQpCiAgICAgICAgICAgICBwICs9IHN0cnNwbihwLCAiLCBcdCIpOwogICAgIH0KIAotICAgIHBy
aW50ayhYRU5MT0dfSU5GTyAiQUNQSSBzbGVlcCBtb2RlczoiKTsKLSAgICBmb3IgKCBpID0gMDsg
aSA8IEFDUElfU19TVEFURV9DT1VOVDsgaSsrICkKLSAgICB7Ci0gICAgICAgIGlmICggaSA9PSBB
Q1BJX1NUQVRFX1MzICkKLSAgICAgICAgewotICAgICAgICAgICAgc2xlZXBfc3RhdGVzW2ldID0g
MTsKLSAgICAgICAgICAgIHByaW50aygiIFMlZCIsIGkpOwotICAgICAgICB9Ci0gICAgICAgIGVs
c2UKLSAgICAgICAgICAgIHNsZWVwX3N0YXRlc1tpXSA9IDA7Ci0gICAgfQotICAgIHByaW50aygi
XG4iKTsKLQogICAgIHJldHVybiAwOwogfQogX19pbml0Y2FsbChhY3BpX3NsZWVwX2luaXQpOwot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
