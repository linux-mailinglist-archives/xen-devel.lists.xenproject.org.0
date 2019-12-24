Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D560D12A018
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 11:23:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijhIw-0000Pd-F9; Tue, 24 Dec 2019 10:20:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zdcS=2O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ijhIu-0000PW-Oa
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 10:20:40 +0000
X-Inumbo-ID: 0879f8f0-2637-11ea-978f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0879f8f0-2637-11ea-978f-12813bfff9fa;
 Tue, 24 Dec 2019 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577182840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M6mDZWs6g2o48xWGr7PSDpZ8rocmMmhEd3WloyruAFA=;
 b=PHX5zWtD8lcIs/W4KRQe74H+Ke/eUEs1fD+RW70JQkvbB5XcHP83tWGk
 h+PyLTuA42/EO/sVUwLQ8YCUaNaRBLPUTondF+GlazXX54kJBwowkU+sB
 U65qXhJcIAF7LBoftqmJTt3NwDT6kqCbL++uK/oG8K5wNJ/WMioK826Jl Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: G712NR+t5CrKW64zoVSAVwYNl/Qfl3UGLlHA+T8VrPPHAfDb/228m06BQToitB++SByfw+jRD+
 URo6mckX4cUazq3/VRf462kOfNoPg25oXU5olEDpCMtmUsm+bexgq548qZSlwRkmhM0TOd60SW
 v8nGZ8uKRCIJ4RCnUG8HXndEUzip6AarBvaMNUjqfI+AYeE/9unaGTuVk00ZOz+pJOqbUdrf0s
 b+Q1ZkBgDyh3cAPoM3SZmjcSZ2RNVMymjLu5gou18v3thtTE4G1I6CnNyKIP4R/kRIuVNdgoWE
 hIo=
X-SBRS: 2.7
X-MesageID: 10093177
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10093177"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 11:18:10 +0100
Message-ID: <20191224101810.45915-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/hvm: always expose x2APIC feature in max
 HVM cpuid policy
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gaGFyZHdhcmUgd2l0aG91dCB4MkFQSUMgc3VwcG9ydCBYZW4gZW11bGF0ZWQgbG9jYWwgQVBJ
QyB3aWxsCnByb3ZpZGUgc3VjaCBtb2RlLCBhbmQgaGVuY2UgdGhlIGZlYXR1cmUgc2hvdWxkIGJl
IHNldCBpbiB0aGUgbWF4aW11bQpIVk0gY3B1aWQgcG9saWN5LgoKTm90IGV4cG9zaW5nIGl0IGlu
IHRoZSBtYXhpbXVtIHBvbGljeSByZXN1bHRzIGluIEhWTSBkb21haW5zIG5vdApnZXR0aW5nIHN1
Y2ggZmVhdHVyZSBleHBvc2VkIHVubGVzcyBpdCdzIGFsc28gc3VwcG9ydGVkIGJ5IHRoZQp1bmRl
cmx5aW5nIGhhcmR3YXJlLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Ci0tLQpUaGlzIGlzIGEgcmVncmVzc2lvbiwgYnV0IEknbSBub3QgYWJs
ZSB0byBpZGVudGlmeSB0aGUgY29tbWl0IHRoYXQKaW50cm9kdWNlZCB0aGUgYm9ndXMgYmVoYXZp
b3IuCi0tLQogeGVuL2FyY2gveDg2L2NwdWlkLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9jcHVpZC5jIGIveGVuL2FyY2gveDg2L2NwdWlkLmMKaW5kZXggNzA1NTUwOWVkNi4uYjFlZDMz
ZDUyNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2NwdWlkLmMKKysrIGIveGVuL2FyY2gveDg2
L2NwdWlkLmMKQEAgLTM5NiwxMCArMzk2LDExIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjYWxjdWxh
dGVfaHZtX21heF9wb2xpY3kodm9pZCkKICAgICAgICAgaHZtX2ZlYXR1cmVzZXRbaV0gJj0gaHZt
X2ZlYXR1cmVtYXNrW2ldOwogCiAgICAgLyoKLSAgICAgKiBYZW4gY2FuIHByb3ZpZGUgYW4gQVBJ
QyBlbXVsYXRpb24gdG8gSFZNIGd1ZXN0cyBldmVuIGlmIHRoZSBob3N0J3MgQVBJQwotICAgICAq
IGlzbid0IGVuYWJsZWQuCisgICAgICogWGVuIGNhbiBwcm92aWRlIGFuICh4MilBUElDIGVtdWxh
dGlvbiB0byBIVk0gZ3Vlc3RzIGV2ZW4gaWYgdGhlIGhvc3QncworICAgICAqICh4MilBUElDIGlz
bid0IGVuYWJsZWQuCiAgICAgICovCiAgICAgX19zZXRfYml0KFg4Nl9GRUFUVVJFX0FQSUMsIGh2
bV9mZWF0dXJlc2V0KTsKKyAgICBfX3NldF9iaXQoWDg2X0ZFQVRVUkVfWDJBUElDLCBodm1fZmVh
dHVyZXNldCk7CiAKICAgICAvKgogICAgICAqIE9uIEFNRCwgUFYgZ3Vlc3RzIGFyZSBlbnRpcmVs
eSB1bmFibGUgdG8gdXNlIFNZU0VOVEVSIGFzIFhlbiBydW5zIGluCi0tIAoyLjI0LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
