Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ADB18BB9B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 16:50:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jExOp-00060F-ET; Thu, 19 Mar 2020 15:47:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e0hQ=5E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jExOo-0005zz-Hz
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 15:47:58 +0000
X-Inumbo-ID: 0074dc83-69f9-11ea-bc33-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0074dc83-69f9-11ea-bc33-12813bfff9fa;
 Thu, 19 Mar 2020 15:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584632878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YEFZ0ZQoqerPo8pu5IOKpcP1dzlkQemUykOgJQLjy24=;
 b=Iy3zpK59Fkbqfn1DetftcQzEftj7LpTD5m+HSMVnfXwLehfXaPAHCwCF
 q9SvXaqg2gldrUd1NRl6pxBvLN6fkJQcXaggEfIlNEqzelCDIl/RceGBg
 y5nuyYfEgaQByAej2NQkDROw+nF+wukSMf4R2n5NjBVgqLerkbd+X0bfW U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KLX74Ule1pwAV7ZTgXbZCEMPMnBzTb7AXM/PMVsnmnsSHcsrT83BFzSg89aY+LS1EYAhQWQxWb
 q2D/nneJbnNzUUDf9LGefHYLYPUivkOZZwaAUcHsSrUIg8Hy8bP9SeHa7LQqSOdqPKTQo7ZHqx
 SB7zUBXt47xBuqKcQ/1eEAIYFBWydM4ZG9Z4rT1zS4V4glLXf/fFDD8rZ3WI3JvECzKv+YFTUm
 bj5aXGdxL/U9nO39kIxSSkCclFtKqrlEDj/gcsmcdsXKqUnviKux11K0qcvUE5oYG65cfvZQrZ
 2WE=
X-SBRS: 2.7
X-MesageID: 14489661
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,572,1574139600"; d="scan'208";a="14489661"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Mar 2020 16:47:14 +0100
Message-ID: <20200319154716.34556-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200319154716.34556-1-roger.pau@citrix.com>
References: <20200319154716.34556-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50cm9kdWNlIGEgc3BlY2lmaWMgZmxhZyB0byByZXF1ZXN0IGEgSFZNIGd1ZXN0IGxpbmVhciBU
TEIgZmx1c2gsCndoaWNoIGlzIGFuIEFTSUQvVlBJRCB0aWNrbGUgdGhhdCBmb3JjZXMgYSBndWVz
dCBsaW5lYXIgdG8gZ3Vlc3QKcGh5c2ljYWwgVExCIGZsdXNoIGZvciBhbGwgSFZNIGd1ZXN0cy4K
ClRoaXMgd2FzIHByZXZpb3VzbHkgdW5jb25kaXRpb25hbGx5IGRvbmUgaW4gZWFjaCBwcmVfZmx1
c2ggY2FsbCwgYnV0CnRoYXQncyBub3QgcmVxdWlyZWQ6IEhWTSBndWVzdHMgbm90IHVzaW5nIHNo
YWRvdyBkb24ndCByZXF1aXJlIGxpbmVhcgpUTEIgZmx1c2hlcyBhcyBYZW4gZG9lc24ndCBtb2Rp
ZnkgdGhlIGd1ZXN0IHBhZ2UgdGFibGVzIGluIHRoYXQgY2FzZQooaWU6IHdoZW4gdXNpbmcgSEFQ
KS4gTm90ZSB0aGF0IHNoYWRvdyBwYWdpbmcgY29kZSBhbHJlYWR5IHRha2VzIGNhcmUKb2YgaXNz
dWluZyB0aGUgbmVjZXNzYXJ5IGZsdXNoZXMgd2hlbiB0aGUgc2hhZG93IHBhZ2UgdGFibGVzIGFy
ZQptb2RpZmllZC4KCkluIG9yZGVyIHRvIGtlZXAgdGhlIHByZXZpb3VzIGJlaGF2aW9yIG1vZGlm
eSBhbGwgc2hhZG93IGNvZGUgVExCCmZsdXNoZXMgdG8gYWxzbyBmbHVzaCB0aGUgZ3Vlc3QgbGlu
ZWFyIHRvIHBoeXNpY2FsIFRMQi4gSSBoYXZlbid0Cmxvb2tlZCBhdCBlYWNoIHNwZWNpZmljIHNo
YWRvdyBjb2RlIFRMQiBmbHVzaCBpbiBvcmRlciB0byBmaWd1cmUgb3V0CndoZXRoZXIgaXQgYWN0
dWFsbHkgcmVxdWlyZXMgYSBndWVzdCBUTEIgZmx1c2ggb3Igbm90LCBzbyB0aGVyZSBtaWdodApi
ZSByb29tIGZvciBpbXByb3ZlbWVudCBpbiB0aGF0IHJlZ2FyZC4KCkFsc28gcGVyZm9ybSBBU0lE
L1ZQSVQgZmx1c2hlcyB3aGVuIG1vZGlmeWluZyB0aGUgcDJtIHRhYmxlcyBhcyBpdCdzIGEKcmVx
dWlyZW1lbnQgZm9yIEFNRCBoYXJkd2FyZS4gRmluYWxseSBrZWVwIHRoZSBmbHVzaCBpbgpzd2l0
Y2hfY3IzX2NyNCwgYXMgaXQncyBub3QgY2xlYXIgd2hldGhlciBjb2RlIGNvdWxkIHJlbHkgb24K
c3dpdGNoX2NyM19jcjQgYWxzbyBwZXJmb3JtaW5nIGEgZ3Vlc3QgbGluZWFyIFRMQiBmbHVzaC4g
QSBmb2xsb3dpbmcKcGF0Y2ggY2FuIHJlbW92ZSB0aGUgQVNJRC9WUElUIHRpY2tsZSBmcm9tIHN3
aXRjaF9jcjNfY3I0IGlmIGZvdW5kIHRvCm5vdCBiZSBuZWNlc3NhcnkuCgpTaWduZWQtb2ZmLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2lu
Y2UgdjY6CiAtIEFkZCBBU0lEL1ZQSVQgZmx1c2hlcyB3aGVuIG1vZGlmeWluZyB0aGUgcDJtLgog
LSBLZWVwIHRoZSBBU0lEL1ZQSVQgZmx1c2ggaW4gc3dpdGNoX2NyM19jcjQuCgpDaGFuZ2VzIHNp
bmNlIHY1OgogLSBSZW5hbWUgRkxVU0hfR1VFU1RTX1RMQiB0byBGTFVTSF9IVk1fQVNJRF9DT1JF
LgogLSBDbGFyaWZ5IGNvbW1pdCBtZXNzYWdlLgogLSBEZWZpbmUgRkxVU0hfSFZNX0FTSURfQ09S
RSB0byAwIHdoZW4gIUNPTkZJR19IVk0uCi0tLQogeGVuL2FyY2gveDg2L2ZsdXNodGxiLmMgICAg
ICAgICAgfCAgNiArKysrLS0KIHhlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMgICAgICAgIHwgIDgg
KysrKy0tLS0KIHhlbi9hcmNoL3g4Ni9tbS9oYXAvbmVzdGVkX2hhcC5jIHwgIDIgKy0KIHhlbi9h
cmNoL3g4Ni9tbS9wMm0tcHQuYyAgICAgICAgIHwgIDMgKystCiB4ZW4vYXJjaC94ODYvbW0vcGFn
aW5nLmMgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jICB8
IDE4ICsrKysrKysrKy0tLS0tLS0tLQogeGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYyAgICAg
fCAgMiArLQogeGVuL2FyY2gveDg2L21tL3NoYWRvdy9tdWx0aS5jICAgfCAxNiArKysrKysrKy0t
LS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2ZsdXNodGxiLmggICB8ICA2ICsrKysrKwogeGVu
L2luY2x1ZGUveGVuL21tLmggICAgICAgICAgICAgfCAgMiArLQogMTAgZmlsZXMgY2hhbmdlZCwg
MzcgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2ZsdXNodGxiLmMgYi94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYwppbmRleCAwM2Y5MmMyM2Rj
Li5jODFlNTNjMGFlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYworKysgYi94
ZW4vYXJjaC94ODYvZmx1c2h0bGIuYwpAQCAtNTksOCArNTksNiBAQCBzdGF0aWMgdTMyIHByZV9m
bHVzaCh2b2lkKQogICAgICAgICByYWlzZV9zb2Z0aXJxKE5FV19UTEJGTFVTSF9DTE9DS19QRVJJ
T0RfU09GVElSUSk7CiAKICBza2lwX2Nsb2NrdGljazoKLSAgICBodm1fZmx1c2hfZ3Vlc3RfdGxi
cygpOwotCiAgICAgcmV0dXJuIHQyOwogfQogCkBAIC0xMTgsNiArMTE2LDcgQEAgdm9pZCBzd2l0
Y2hfY3IzX2NyNCh1bnNpZ25lZCBsb25nIGNyMywgdW5zaWduZWQgbG9uZyBjcjQpCiAgICAgbG9j
YWxfaXJxX3NhdmUoZmxhZ3MpOwogCiAgICAgdCA9IHByZV9mbHVzaCgpOworICAgIGh2bV9mbHVz
aF9ndWVzdF90bGJzKCk7CiAKICAgICBvbGRfY3I0ID0gcmVhZF9jcjQoKTsKICAgICBBU1NFUlQo
IShvbGRfY3I0ICYgWDg2X0NSNF9QQ0lERSkgfHwgIShvbGRfY3I0ICYgWDg2X0NSNF9QR0UpKTsK
QEAgLTIyMSw2ICsyMjAsOSBAQCB1bnNpZ25lZCBpbnQgZmx1c2hfYXJlYV9sb2NhbChjb25zdCB2
b2lkICp2YSwgdW5zaWduZWQgaW50IGZsYWdzKQogICAgICAgICAgICAgZG9fdGxiX2ZsdXNoKCk7
CiAgICAgfQogCisgICAgaWYgKCBmbGFncyAmIEZMVVNIX0hWTV9BU0lEX0NPUkUgKQorICAgICAg
ICBodm1fZmx1c2hfZ3Vlc3RfdGxicygpOworCiAgICAgaWYgKCBmbGFncyAmIEZMVVNIX0NBQ0hF
ICkKICAgICB7CiAgICAgICAgIGNvbnN0IHN0cnVjdCBjcHVpbmZvX3g4NiAqYyA9ICZjdXJyZW50
X2NwdV9kYXRhOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYyBiL3hlbi9h
cmNoL3g4Ni9tbS9oYXAvaGFwLmMKaW5kZXggYTZkNWUzOWIwMi4uMDA0YTg5YjRiOSAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYworKysgYi94ZW4vYXJjaC94ODYvbW0vaGFw
L2hhcC5jCkBAIC0xMTgsNyArMTE4LDcgQEAgaW50IGhhcF90cmFja19kaXJ0eV92cmFtKHN0cnVj
dCBkb21haW4gKmQsCiAgICAgICAgICAgICBwMm1fY2hhbmdlX3R5cGVfcmFuZ2UoZCwgYmVnaW5f
cGZuLCBiZWdpbl9wZm4gKyBuciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
Mm1fcmFtX3J3LCBwMm1fcmFtX2xvZ2RpcnR5KTsKIAotICAgICAgICAgICAgZmx1c2hfdGxiX21h
c2soZC0+ZGlydHlfY3B1bWFzayk7CisgICAgICAgICAgICBmbHVzaF9tYXNrKGQtPmRpcnR5X2Nw
dW1hc2ssIEZMVVNIX1RMQiB8IEZMVVNIX0hWTV9BU0lEX0NPUkUpOwogCiAgICAgICAgICAgICBt
ZW1zZXQoZGlydHlfYml0bWFwLCAweGZmLCBzaXplKTsgLyogY29uc2lkZXIgYWxsIHBhZ2VzIGRp
cnR5ICovCiAgICAgICAgIH0KQEAgLTIwNSw3ICsyMDUsNyBAQCBzdGF0aWMgaW50IGhhcF9lbmFi
bGVfbG9nX2RpcnR5KHN0cnVjdCBkb21haW4gKmQsIGJvb2xfdCBsb2dfZ2xvYmFsKQogICAgICAg
ICAgKiB0byBiZSByZWFkLW9ubHksIG9yIHZpYSBoYXJkd2FyZS1hc3Npc3RlZCBsb2ctZGlydHku
CiAgICAgICAgICAqLwogICAgICAgICBwMm1fY2hhbmdlX2VudHJ5X3R5cGVfZ2xvYmFsKGQsIHAy
bV9yYW1fcncsIHAybV9yYW1fbG9nZGlydHkpOwotICAgICAgICBmbHVzaF90bGJfbWFzayhkLT5k
aXJ0eV9jcHVtYXNrKTsKKyAgICAgICAgZmx1c2hfbWFzayhkLT5kaXJ0eV9jcHVtYXNrLCBGTFVT
SF9UTEIgfCBGTFVTSF9IVk1fQVNJRF9DT1JFKTsKICAgICB9CiAgICAgcmV0dXJuIDA7CiB9CkBA
IC0yMzQsNyArMjM0LDcgQEAgc3RhdGljIHZvaWQgaGFwX2NsZWFuX2RpcnR5X2JpdG1hcChzdHJ1
Y3QgZG9tYWluICpkKQogICAgICAqIGJlIHJlYWQtb25seSwgb3IgdmlhIGhhcmR3YXJlLWFzc2lz
dGVkIGxvZy1kaXJ0eS4KICAgICAgKi8KICAgICBwMm1fY2hhbmdlX2VudHJ5X3R5cGVfZ2xvYmFs
KGQsIHAybV9yYW1fcncsIHAybV9yYW1fbG9nZGlydHkpOwotICAgIGZsdXNoX3RsYl9tYXNrKGQt
PmRpcnR5X2NwdW1hc2spOworICAgIGZsdXNoX21hc2soZC0+ZGlydHlfY3B1bWFzaywgRkxVU0hf
VExCIHwgRkxVU0hfSFZNX0FTSURfQ09SRSk7CiB9CiAKIC8qKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKiovCkBAIC03OTgsNyArNzk4LDcgQEAgaGFwX3dyaXRl
X3AybV9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCB1bnNpZ25lZCBsb25nIGdmbiwgbDFf
cGdlbnRyeV90ICpwLAogCiAgICAgc2FmZV93cml0ZV9wdGUocCwgbmV3KTsKICAgICBpZiAoIG9s
ZF9mbGFncyAmIF9QQUdFX1BSRVNFTlQgKQotICAgICAgICBmbHVzaF90bGJfbWFzayhkLT5kaXJ0
eV9jcHVtYXNrKTsKKyAgICAgICAgZmx1c2hfbWFzayhkLT5kaXJ0eV9jcHVtYXNrLCBGTFVTSF9U
TEIgfCBGTFVTSF9IVk1fQVNJRF9DT1JFKTsKIAogICAgIHBhZ2luZ191bmxvY2soZCk7CiAKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9oYXAvbmVzdGVkX2hhcC5jIGIveGVuL2FyY2gveDg2
L21tL2hhcC9uZXN0ZWRfaGFwLmMKaW5kZXggYWJlNTk1OGE1Mi4uOWMwNzUwYmUxNyAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L21tL2hhcC9uZXN0ZWRfaGFwLmMKKysrIGIveGVuL2FyY2gveDg2
L21tL2hhcC9uZXN0ZWRfaGFwLmMKQEAgLTg0LDcgKzg0LDcgQEAgbmVzdGVkcDJtX3dyaXRlX3Ay
bV9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCB1bnNpZ25lZCBsb25nIGdmbiwKICAgICBz
YWZlX3dyaXRlX3B0ZShwLCBuZXcpOwogCiAgICAgaWYgKG9sZF9mbGFncyAmIF9QQUdFX1BSRVNF
TlQpCi0gICAgICAgIGZsdXNoX3RsYl9tYXNrKHAybS0+ZGlydHlfY3B1bWFzayk7CisgICAgICAg
IGZsdXNoX21hc2socDJtLT5kaXJ0eV9jcHVtYXNrLCBGTFVTSF9UTEIgfCBGTFVTSF9IVk1fQVNJ
RF9DT1JFKTsKIAogICAgIHBhZ2luZ191bmxvY2soZCk7CiAKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9tbS9wMm0tcHQuYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYwppbmRleCBlYjY2MDc3
NDk2Li5mYmNlYTE4MWJhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMKKysr
IGIveGVuL2FyY2gveDg2L21tL3AybS1wdC5jCkBAIC04OTYsNyArODk2LDggQEAgc3RhdGljIHZv
aWQgcDJtX3B0X2NoYW5nZV9lbnRyeV90eXBlX2dsb2JhbChzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJt
LAogICAgIHVubWFwX2RvbWFpbl9wYWdlKHRhYik7CiAKICAgICBpZiAoIGNoYW5nZWQgKQotICAg
ICAgICAgZmx1c2hfdGxiX21hc2socDJtLT5kb21haW4tPmRpcnR5X2NwdW1hc2spOworICAgICAg
ICAgZmx1c2hfbWFzayhwMm0tPmRvbWFpbi0+ZGlydHlfY3B1bWFzaywKKyAgICAgICAgICAgICAg
ICAgICAgRkxVU0hfVExCIHwgRkxVU0hfSFZNX0FTSURfQ09SRSk7CiB9CiAKIHN0YXRpYyBpbnQg
cDJtX3B0X2NoYW5nZV9lbnRyeV90eXBlX3JhbmdlKHN0cnVjdCBwMm1fZG9tYWluICpwMm0sCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMgYi94ZW4vYXJjaC94ODYvbW0vcGFn
aW5nLmMKaW5kZXggNDY5YmI3NjQyOS4uZjlkOTMwYjdhOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L21tL3BhZ2luZy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wYWdpbmcuYwpAQCAtNjEzLDcg
KzYxMyw3IEBAIHZvaWQgcGFnaW5nX2xvZ19kaXJ0eV9yYW5nZShzdHJ1Y3QgZG9tYWluICpkLAog
CiAgICAgcDJtX3VubG9jayhwMm0pOwogCi0gICAgZmx1c2hfdGxiX21hc2soZC0+ZGlydHlfY3B1
bWFzayk7CisgICAgZmx1c2hfbWFzayhkLT5kaXJ0eV9jcHVtYXNrLCBGTFVTSF9UTEIgfCBGTFVT
SF9IVk1fQVNJRF9DT1JFKTsKIH0KIAogLyoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9z
aGFkb3cvY29tbW9uLmMgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCmluZGV4IDEy
MWRkZjEyNTUuLmFhNzUwZWFmYWUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cv
Y29tbW9uLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYwpAQCAtMzYzLDcg
KzM2Myw3IEBAIHN0YXRpYyBpbnQgb29zX3JlbW92ZV93cml0ZV9hY2Nlc3Moc3RydWN0IHZjcHUg
KnYsIG1mbl90IGdtZm4sCiAgICAgfQogCiAgICAgaWYgKCBmdGxiICkKLSAgICAgICAgZmx1c2hf
dGxiX21hc2soZC0+ZGlydHlfY3B1bWFzayk7CisgICAgICAgIGZsdXNoX21hc2soZC0+ZGlydHlf
Y3B1bWFzaywgRkxVU0hfVExCIHwgRkxVU0hfSFZNX0FTSURfQ09SRSk7CiAKICAgICByZXR1cm4g
MDsKIH0KQEAgLTkzOSw3ICs5MzksNyBAQCBzdGF0aWMgdm9pZCBfc2hhZG93X3ByZWFsbG9jKHN0
cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBwYWdlcykKICAgICAgICAgICAgICAgICAvKiBT
ZWUgaWYgdGhhdCBmcmVlZCB1cCBlbm91Z2ggc3BhY2UgKi8KICAgICAgICAgICAgICAgICBpZiAo
IGQtPmFyY2gucGFnaW5nLnNoYWRvdy5mcmVlX3BhZ2VzID49IHBhZ2VzICkKICAgICAgICAgICAg
ICAgICB7Ci0gICAgICAgICAgICAgICAgICAgIGZsdXNoX3RsYl9tYXNrKGQtPmRpcnR5X2NwdW1h
c2spOworICAgICAgICAgICAgICAgICAgICBmbHVzaF9tYXNrKGQtPmRpcnR5X2NwdW1hc2ssIEZM
VVNIX1RMQiB8IEZMVVNIX0hWTV9BU0lEX0NPUkUpOwogICAgICAgICAgICAgICAgICAgICByZXR1
cm47CiAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgfQpAQCAtOTkzLDcgKzk5Myw3IEBA
IHN0YXRpYyB2b2lkIHNoYWRvd19ibG93X3RhYmxlcyhzdHJ1Y3QgZG9tYWluICpkKQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhZ2V0YWJsZV9nZXRfbWZuKHYtPmFyY2guc2hhZG93
X3RhYmxlW2ldKSwgMCk7CiAKICAgICAvKiBNYWtlIHN1cmUgZXZlcnlvbmUgc2VlcyB0aGUgdW5z
aGFkb3dpbmdzICovCi0gICAgZmx1c2hfdGxiX21hc2soZC0+ZGlydHlfY3B1bWFzayk7CisgICAg
Zmx1c2hfbWFzayhkLT5kaXJ0eV9jcHVtYXNrLCBGTFVTSF9UTEIgfCBGTFVTSF9IVk1fQVNJRF9D
T1JFKTsKIH0KIAogdm9pZCBzaGFkb3dfYmxvd190YWJsZXNfcGVyX2RvbWFpbihzdHJ1Y3QgZG9t
YWluICpkKQpAQCAtMTEwMiw3ICsxMTAyLDcgQEAgbWZuX3Qgc2hhZG93X2FsbG9jKHN0cnVjdCBk
b21haW4gKmQsCiAgICAgICAgIGlmICggdW5saWtlbHkoIWNwdW1hc2tfZW1wdHkoJm1hc2spKSAp
CiAgICAgICAgIHsKICAgICAgICAgICAgIHBlcmZjX2luY3Ioc2hhZG93X2FsbG9jX3RsYmZsdXNo
KTsKLSAgICAgICAgICAgIGZsdXNoX3RsYl9tYXNrKCZtYXNrKTsKKyAgICAgICAgICAgIGZsdXNo
X21hc2soJm1hc2ssIEZMVVNIX1RMQiB8IEZMVVNIX0hWTV9BU0lEX0NPUkUpOwogICAgICAgICB9
CiAgICAgICAgIC8qIE5vdyBzYWZlIHRvIGNsZWFyIHRoZSBwYWdlIGZvciByZXVzZSAqLwogICAg
ICAgICBjbGVhcl9kb21haW5fcGFnZShwYWdlX3RvX21mbihzcCkpOwpAQCAtMjI5MCw3ICsyMjkw
LDcgQEAgdm9pZCBzaF9yZW1vdmVfc2hhZG93cyhzdHJ1Y3QgZG9tYWluICpkLCBtZm5fdCBnbWZu
LCBpbnQgZmFzdCwgaW50IGFsbCkKIAogICAgIC8qIE5lZWQgdG8gZmx1c2ggVExCcyBub3csIHNv
IHRoYXQgbGluZWFyIG1hcHMgYXJlIHNhZmUgbmV4dCB0aW1lIHdlCiAgICAgICogdGFrZSBhIGZh
dWx0LiAqLwotICAgIGZsdXNoX3RsYl9tYXNrKGQtPmRpcnR5X2NwdW1hc2spOworICAgIGZsdXNo
X21hc2soZC0+ZGlydHlfY3B1bWFzaywgRkxVU0hfVExCIHwgRkxVU0hfSFZNX0FTSURfQ09SRSk7
CiAKICAgICBwYWdpbmdfdW5sb2NrKGQpOwogfQpAQCAtMzAwNSw3ICszMDA1LDcgQEAgc3RhdGlj
IHZvaWQgc2hfdW5zaGFkb3dfZm9yX3AybV9jaGFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgbG9uZyBnZm4sCiAgICAgICAgIHsKICAgICAgICAgICAgIHNoX3JlbW92ZV9hbGxfc2hhZG93
c19hbmRfcGFyZW50cyhkLCBtZm4pOwogICAgICAgICAgICAgaWYgKCBzaF9yZW1vdmVfYWxsX21h
cHBpbmdzKGQsIG1mbiwgX2dmbihnZm4pKSApCi0gICAgICAgICAgICAgICAgZmx1c2hfdGxiX21h
c2soZC0+ZGlydHlfY3B1bWFzayk7CisgICAgICAgICAgICAgICAgZmx1c2hfbWFzayhkLT5kaXJ0
eV9jcHVtYXNrLCBGTFVTSF9UTEIgfCBGTFVTSF9IVk1fQVNJRF9DT1JFKTsKICAgICAgICAgfQog
ICAgIH0KIApAQCAtMzA0NSw3ICszMDQ1LDcgQEAgc3RhdGljIHZvaWQgc2hfdW5zaGFkb3dfZm9y
X3AybV9jaGFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnZm4sCiAgICAgICAg
ICAgICAgICAgfQogICAgICAgICAgICAgICAgIG9tZm4gPSBtZm5fYWRkKG9tZm4sIDEpOwogICAg
ICAgICAgICAgfQotICAgICAgICAgICAgZmx1c2hfdGxiX21hc2soJmZsdXNobWFzayk7CisgICAg
ICAgICAgICBmbHVzaF9tYXNrKCZmbHVzaG1hc2ssIEZMVVNIX1RMQiB8IEZMVVNIX0hWTV9BU0lE
X0NPUkUpOwogCiAgICAgICAgICAgICBpZiAoIG5wdGUgKQogICAgICAgICAgICAgICAgIHVubWFw
X2RvbWFpbl9wYWdlKG5wdGUpOwpAQCAtMzMzMiw3ICszMzMyLDcgQEAgaW50IHNoYWRvd190cmFj
a19kaXJ0eV92cmFtKHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAgIH0KICAgICB9CiAgICAgaWYg
KCBmbHVzaF90bGIgKQotICAgICAgICBmbHVzaF90bGJfbWFzayhkLT5kaXJ0eV9jcHVtYXNrKTsK
KyAgICAgICAgZmx1c2hfbWFzayhkLT5kaXJ0eV9jcHVtYXNrLCBGTFVTSF9UTEIgfCBGTFVTSF9I
Vk1fQVNJRF9DT1JFKTsKICAgICBnb3RvIG91dDsKIAogb3V0X3NsMW1hOgpAQCAtMzQwMiw3ICsz
NDAyLDcgQEAgYm9vbCBzaGFkb3dfZmx1c2hfdGxiKGJvb2wgKCpmbHVzaF92Y3B1KSh2b2lkICpj
dHh0LCBzdHJ1Y3QgdmNwdSAqdiksCiAgICAgfQogCiAgICAgLyogRmx1c2ggVExCcyBvbiBhbGwg
Q1BVcyB3aXRoIGRpcnR5IHZjcHUgc3RhdGUuICovCi0gICAgZmx1c2hfdGxiX21hc2sobWFzayk7
CisgICAgZmx1c2hfbWFzayhtYXNrLCBGTFVTSF9UTEIgfCBGTFVTSF9IVk1fQVNJRF9DT1JFKTsK
IAogICAgIC8qIERvbmUuICovCiAgICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cv
aHZtLmMKaW5kZXggMWU2MDI0YzcxZi4uNTA5MTYyY2RjZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L21tL3NoYWRvdy9odm0uYworKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2h2bS5jCkBA
IC01OTEsNyArNTkxLDcgQEAgc3RhdGljIHZvaWQgdmFsaWRhdGVfZ3Vlc3RfcHRfd3JpdGUoc3Ry
dWN0IHZjcHUgKnYsIG1mbl90IGdtZm4sCiAKICAgICBpZiAoIHJjICYgU0hBRE9XX1NFVF9GTFVT
SCApCiAgICAgICAgIC8qIE5lZWQgdG8gZmx1c2ggVExCcyB0byBwaWNrIHVwIHNoYWRvdyBQVCBj
aGFuZ2VzICovCi0gICAgICAgIGZsdXNoX3RsYl9tYXNrKGQtPmRpcnR5X2NwdW1hc2spOworICAg
ICAgICBmbHVzaF9tYXNrKGQtPmRpcnR5X2NwdW1hc2ssIEZMVVNIX1RMQiB8IEZMVVNIX0hWTV9B
U0lEX0NPUkUpOwogCiAgICAgaWYgKCByYyAmIFNIQURPV19TRVRfRVJST1IgKQogICAgIHsKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvbXVsdGkuYyBiL3hlbi9hcmNoL3g4Ni9t
bS9zaGFkb3cvbXVsdGkuYwppbmRleCBiNmFmYzBmYmE0Li42NjdmY2E5NmM3IDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L211bHRpLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3No
YWRvdy9tdWx0aS5jCkBAIC0zMDY2LDcgKzMwNjYsNyBAQCBzdGF0aWMgaW50IHNoX3BhZ2VfZmF1
bHQoc3RydWN0IHZjcHUgKnYsCiAgICAgICAgIHBlcmZjX2luY3Ioc2hhZG93X3JtX3dyaXRlX2Zs
dXNoX3RsYik7CiAgICAgICAgIHNtcF93bWIoKTsKICAgICAgICAgYXRvbWljX2luYygmZC0+YXJj
aC5wYWdpbmcuc2hhZG93Lmd0YWJsZV9kaXJ0eV92ZXJzaW9uKTsKLSAgICAgICAgZmx1c2hfdGxi
X21hc2soZC0+ZGlydHlfY3B1bWFzayk7CisgICAgICAgIGZsdXNoX21hc2soZC0+ZGlydHlfY3B1
bWFzaywgRkxVU0hfVExCIHwgRkxVU0hfSFZNX0FTSURfQ09SRSk7CiAgICAgfQogCiAjaWYgKFNI
QURPV19PUFRJTUlaQVRJT05TICYgU0hPUFRfT1VUX09GX1NZTkMpCkBAIC0zNTc1LDcgKzM1NzUs
NyBAQCBzdGF0aWMgYm9vbCBzaF9pbnZscGcoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGxvbmcg
bGluZWFyKQogICAgIGlmICggbWZuX3RvX3BhZ2Uoc2wxbWZuKS0+dS5zaC50eXBlCiAgICAgICAg
ICA9PSBTSF90eXBlX2ZsMV9zaGFkb3cgKQogICAgIHsKLSAgICAgICAgZmx1c2hfdGxiX2xvY2Fs
KCk7CisgICAgICAgIGZsdXNoX2xvY2FsKEZMVVNIX1RMQiB8IEZMVVNIX0hWTV9BU0lEX0NPUkUp
OwogICAgICAgICByZXR1cm4gZmFsc2U7CiAgICAgfQogCkBAIC0zODEwLDcgKzM4MTAsNyBAQCBz
aF91cGRhdGVfbGluZWFyX2VudHJpZXMoc3RydWN0IHZjcHUgKnYpCiAgICAgICAgICAqIHRhYmxl
IGVudHJ5LiBCdXQsIHdpdGhvdXQgdGhpcyBjaGFuZ2UsIGl0IHdvdWxkIGZldGNoIHRoZSB3cm9u
ZwogICAgICAgICAgKiB2YWx1ZSBkdWUgdG8gYSBzdGFsZSBUTEIuCiAgICAgICAgICAqLwotICAg
ICAgICBmbHVzaF90bGJfbG9jYWwoKTsKKyAgICAgICAgZmx1c2hfbG9jYWwoRkxVU0hfVExCIHwg
RkxVU0hfSFZNX0FTSURfQ09SRSk7CiAgICAgfQogfQogCkBAIC00MDExLDcgKzQwMTEsNyBAQCBz
aF91cGRhdGVfY3IzKHN0cnVjdCB2Y3B1ICp2LCBpbnQgZG9fbG9ja2luZywgYm9vbCBub2ZsdXNo
KQogICAgICAqIChvbGQpIHNoYWRvdyBsaW5lYXIgbWFwcyBpbiB0aGUgd3JpdGVhYmxlIG1hcHBp
bmcgaGV1cmlzdGljcy4gKi8KICNpZiBHVUVTVF9QQUdJTkdfTEVWRUxTID09IDIKICAgICBpZiAo
IHNoX3JlbW92ZV93cml0ZV9hY2Nlc3MoZCwgZ21mbiwgMiwgMCkgIT0gMCApCi0gICAgICAgIGZs
dXNoX3RsYl9tYXNrKGQtPmRpcnR5X2NwdW1hc2spOworICAgICAgICBmbHVzaF9tYXNrKGQtPmRp
cnR5X2NwdW1hc2ssIEZMVVNIX1RMQiB8IEZMVVNIX0hWTV9BU0lEX0NPUkUpOwogICAgIHNoX3Nl
dF90b3BsZXZlbF9zaGFkb3codiwgMCwgZ21mbiwgU0hfdHlwZV9sMl9zaGFkb3cpOwogI2VsaWYg
R1VFU1RfUEFHSU5HX0xFVkVMUyA9PSAzCiAgICAgLyogUEFFIGd1ZXN0cyBoYXZlIGZvdXIgc2hh
ZG93X3RhYmxlIGVudHJpZXMsIGJhc2VkIG9uIHRoZQpAQCAtNDAzNSw3ICs0MDM1LDcgQEAgc2hf
dXBkYXRlX2NyMyhzdHJ1Y3QgdmNwdSAqdiwgaW50IGRvX2xvY2tpbmcsIGJvb2wgbm9mbHVzaCkK
ICAgICAgICAgICAgIH0KICAgICAgICAgfQogICAgICAgICBpZiAoIGZsdXNoICkKLSAgICAgICAg
ICAgIGZsdXNoX3RsYl9tYXNrKGQtPmRpcnR5X2NwdW1hc2spOworICAgICAgICAgICAgZmx1c2hf
bWFzayhkLT5kaXJ0eV9jcHVtYXNrLCBGTFVTSF9UTEIgfCBGTFVTSF9IVk1fQVNJRF9DT1JFKTsK
ICAgICAgICAgLyogTm93IGluc3RhbGwgdGhlIG5ldyBzaGFkb3dzLiAqLwogICAgICAgICBmb3Ig
KCBpID0gMDsgaSA8IDQ7IGkrKyApCiAgICAgICAgIHsKQEAgLTQwNTYsNyArNDA1Niw3IEBAIHNo
X3VwZGF0ZV9jcjMoc3RydWN0IHZjcHUgKnYsIGludCBkb19sb2NraW5nLCBib29sIG5vZmx1c2gp
CiAgICAgfQogI2VsaWYgR1VFU1RfUEFHSU5HX0xFVkVMUyA9PSA0CiAgICAgaWYgKCBzaF9yZW1v
dmVfd3JpdGVfYWNjZXNzKGQsIGdtZm4sIDQsIDApICE9IDAgKQotICAgICAgICBmbHVzaF90bGJf
bWFzayhkLT5kaXJ0eV9jcHVtYXNrKTsKKyAgICAgICAgZmx1c2hfbWFzayhkLT5kaXJ0eV9jcHVt
YXNrLCBGTFVTSF9UTEIgfCBGTFVTSF9IVk1fQVNJRF9DT1JFKTsKICAgICBzaF9zZXRfdG9wbGV2
ZWxfc2hhZG93KHYsIDAsIGdtZm4sIFNIX3R5cGVfbDRfc2hhZG93KTsKICAgICBpZiAoICFzaGFk
b3dfbW9kZV9leHRlcm5hbChkKSAmJiAhaXNfcHZfMzJiaXRfZG9tYWluKGQpICkKICAgICB7CkBA
IC00NTAyLDcgKzQ1MDIsNyBAQCBzdGF0aWMgdm9pZCBzaF9wYWdldGFibGVfZHlpbmcocGFkZHJf
dCBncGEpCiAgICAgICAgIH0KICAgICB9CiAgICAgaWYgKCBmbHVzaCApCi0gICAgICAgIGZsdXNo
X3RsYl9tYXNrKGQtPmRpcnR5X2NwdW1hc2spOworICAgICAgICBmbHVzaF9tYXNrKGQtPmRpcnR5
X2NwdW1hc2ssIEZMVVNIX1RMQiB8IEZMVVNIX0hWTV9BU0lEX0NPUkUpOwogCiAgICAgLyogUmVt
ZW1iZXIgdGhhdCB3ZSd2ZSBzZWVuIHRoZSBndWVzdCB1c2UgdGhpcyBpbnRlcmZhY2UsIHNvIHdl
CiAgICAgICogY2FuIHJlbHkgb24gaXQgdXNpbmcgaXQgaW4gZnV0dXJlLCBpbnN0ZWFkIG9mIGd1
ZXNzaW5nIGF0CkBAIC00NTM5LDcgKzQ1MzksNyBAQCBzdGF0aWMgdm9pZCBzaF9wYWdldGFibGVf
ZHlpbmcocGFkZHJfdCBncGEpCiAgICAgICAgIG1mbl90b19wYWdlKGdtZm4pLT5wYWdldGFibGVf
ZHlpbmcgPSB0cnVlOwogICAgICAgICBzaGFkb3dfdW5ob29rX21hcHBpbmdzKGQsIHNtZm4sIDEv
KiB1c2VyIHBhZ2VzIG9ubHkgKi8pOwogICAgICAgICAvKiBOb3cgZmx1c2ggdGhlIFRMQjogd2Ug
cmVtb3ZlZCB0b3BsZXZlbCBtYXBwaW5ncy4gKi8KLSAgICAgICAgZmx1c2hfdGxiX21hc2soZC0+
ZGlydHlfY3B1bWFzayk7CisgICAgICAgIGZsdXNoX21hc2soZC0+ZGlydHlfY3B1bWFzaywgRkxV
U0hfVExCIHwgRkxVU0hfSFZNX0FTSURfQ09SRSk7CiAgICAgfQogCiAgICAgLyogUmVtZW1iZXIg
dGhhdCB3ZSd2ZSBzZWVuIHRoZSBndWVzdCB1c2UgdGhpcyBpbnRlcmZhY2UsIHNvIHdlCmRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2ZsdXNodGxiLmggYi94ZW4vaW5jbHVkZS9hc20t
eDg2L2ZsdXNodGxiLmgKaW5kZXggMmNmZTRlNmU5Ny4uNTc5ZGM1NjgwMyAxMDA2NDQKLS0tIGEv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9mbHVzaHRsYi5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
Zmx1c2h0bGIuaApAQCAtMTA1LDYgKzEwNSwxMiBAQCB2b2lkIHN3aXRjaF9jcjNfY3I0KHVuc2ln
bmVkIGxvbmcgY3IzLCB1bnNpZ25lZCBsb25nIGNyNCk7CiAjZGVmaW5lIEZMVVNIX1ZDUFVfU1RB
VEUgMHgxMDAwCiAgLyogRmx1c2ggdGhlIHBlci1jcHUgcm9vdCBwYWdlIHRhYmxlICovCiAjZGVm
aW5lIEZMVVNIX1JPT1RfUEdUQkwgMHgyMDAwCisjaWYgQ09ORklHX0hWTQorIC8qIEZsdXNoIGFs
bCBIVk0gZ3Vlc3RzIGxpbmVhciBUTEIgKHVzaW5nIEFTSUQvVlBJRCkgKi8KKyNkZWZpbmUgRkxV
U0hfSFZNX0FTSURfQ09SRSAweDQwMDAKKyNlbHNlCisjZGVmaW5lIEZMVVNIX0hWTV9BU0lEX0NP
UkUgMAorI2VuZGlmCiAKIC8qIEZsdXNoIGxvY2FsIFRMQnMvY2FjaGVzLiAqLwogdW5zaWduZWQg
aW50IGZsdXNoX2FyZWFfbG9jYWwoY29uc3Qgdm9pZCAqdmEsIHVuc2lnbmVkIGludCBmbGFncyk7
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vbW0uaCBiL3hlbi9pbmNsdWRlL3hlbi9tbS5o
CmluZGV4IGQwZDA5NWQ5YzcuLjAyYWFkNDMwNDIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hl
bi9tbS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oCkBAIC02NDQsNyArNjQ0LDcgQEAgc3Rh
dGljIGlubGluZSB2b2lkIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYXNrKHVpbnQzMl90IHRsYmZsdXNo
X3RpbWVzdGFtcCkKICAgICBpZiAoICFjcHVtYXNrX2VtcHR5KCZtYXNrKSApCiAgICAgewogICAg
ICAgICBwZXJmY19pbmNyKG5lZWRfZmx1c2hfdGxiX2ZsdXNoKTsKLSAgICAgICAgZmx1c2hfdGxi
X21hc2soJm1hc2spOworICAgICAgICBmbHVzaF9tYXNrKCZtYXNrLCBGTFVTSF9UTEIgfCBGTFVT
SF9IVk1fQVNJRF9DT1JFKTsKICAgICB9CiB9CiAKLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
