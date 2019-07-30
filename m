Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F8E7A4DC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:42:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsObG-0008Mq-4q; Tue, 30 Jul 2019 09:39:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sDM=V3=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hsObE-0008MV-A9
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:39:16 +0000
X-Inumbo-ID: e24fadb6-b2ad-11e9-b004-5b850822c15d
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e24fadb6-b2ad-11e9-b004-5b850822c15d;
 Tue, 30 Jul 2019 09:39:11 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: i1cwXM61ZbpJx+WjMNFC8oBpH5eBdnNOjh9k+2v5hBReU5crbp4UGvxmqFq2zMPNOmEp3rky85
 DpBdoqOEoFVKIppo7+7C+AyyOU4JemHr5aF9RkGn/Wm09MxnIwZ4laFL+nOrFY1/omrZdxQKD9
 5jbhXdrBoK06ZTBT8BM7q6joJR/pSDmDAbYW7ScdGRuvetu+J4DNGXgVQwz/xpEkx8YgLMuWaX
 +Qjt7baDY2vSozbIK6+3s/FU3JApW9WYThGia/zmDDF9FIX2kY/q4KeUXtxAr0Oup20i8naes3
 QJU=
X-SBRS: 2.7
X-MesageID: 3748698
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3748698"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 30 Jul 2019 10:38:59 +0100
Message-ID: <20190730093904.1794-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/5] use stashed domain create flags
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyB0aGUgcmVtYWluZGVyIG9mIG15ICdzdGFzaCBkb21haW4gY3JlYXRlIGZsYWdzIGFu
ZCB0aGVuIHVzZSB0aGVtJyBzZXJpZXMuIFBhdGNoICMxIGlzCmRyb3BwZWQgYXMgaXQgaXMgaW4g
dGhlIHByb2Nlc3Mgb2YgYmVpbmcgY29tbWl0dGVkIGFscmVhZHkuCgpQYXVsIER1cnJhbnQgKDUp
OgogIGRvbWFpbjogcmVtb3ZlICdndWVzdF90eXBlJyBmaWVsZCAoYW5kIGVudW0gZ3Vlc3RfdHlw
ZSkKICB4ODYvaHZtL2RvbWFpbjogcmVtb3ZlIHRoZSAnaGFwX2VuYWJsZWQnIGZsYWcKICB4ODYv
ZG9tYWluOiByZW1vdmUgdGhlICdvb3Nfb2ZmJyBmbGFnCiAgZG9tYWluOiByZW1vdmUgdGhlICdp
c194ZW5zdG9yZScgZmxhZwogIHg4Ni9kb21haW46IHJlbW92ZSB0aGUgJ3MzX2ludGVncml0eScg
ZmxhZwoKIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAgIHwgMjIgKysrKysrKysrKysr
KystLS0tLS0tLQogeGVuL2FyY2gveDg2L21tL3BhZ2luZy5jICAgICAgICAgfCAgNCArKy0tCiB4
ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jICB8ICA3ICsrKystLS0KIHhlbi9hcmNoL3g4
Ni9tbS9zaGFkb3cvbm9uZS5jICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAg
ICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni90Ym9vdC5jICAgICAgICAgICAgIHwgIDIgKy0K
IHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgICAgICAgIHwgMjggKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLQogeGVuL2NvbW1vbi9kb21jdGwuYyAgICAgICAgICAgICAgfCAxMiArKy0tLS0t
LS0tLS0KIHhlbi9jb21tb24va2VybmVsLmMgICAgICAgICAgICAgIHwgIDkgKystLS0tLS0tCiB4
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jICB8ICAyIC0tCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L2RvbWFpbi5oICAgICB8ICAzIC0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWlu
LmggfCAgNyAtLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L3BhZ2luZy5oICAgICB8ICAyICst
CiB4ZW4vaW5jbHVkZS9hc20teDg2L3NoYWRvdy5oICAgICB8ICAyICstCiB4ZW4vaW5jbHVkZS94
ZW4vc2NoZWQuaCAgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiB4ZW4v
aW5jbHVkZS94c20vZHVtbXkuaCAgICAgICAgICB8ICAyICstCiAxNiBmaWxlcyBjaGFuZ2VkLCA2
MiBpbnNlcnRpb25zKCspLCA3MCBkZWxldGlvbnMoLSkKLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5
Y2hvLm5zYS5nb3Y+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5j
b20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5j
b20+CkNjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDYzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8
dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLSAKMi4yMC4xLjIuZ2IyMWVi
YjY3MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
