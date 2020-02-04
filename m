Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3AC151D8A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:43:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz0Jj-0003Ar-JC; Tue, 04 Feb 2020 15:40:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I1tw=3Y=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iz0Ji-0003AV-Bz
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:40:46 +0000
X-Inumbo-ID: adbb0400-4764-11ea-8f8e-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adbb0400-4764-11ea-8f8e-12813bfff9fa;
 Tue, 04 Feb 2020 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580830832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=+PjeV3haqZ/Lx5p12bpCjHkhAMM1ejzapAAughXbDvc=;
 b=BcRDV1eTEC4ezF9sP5gBPw+tNn4slC4UVE8pc0EzsTm3hh/B49lJw47S
 pz6KODcM9AYE/n93F71NWnOM78nOUIqkoC4JokCf0Jmh/MfGfj7UIsWxt
 atJvtWtYFKYQJsiuwvYYmuUcdiBdOXcTJIlDYrpcxUeWZwTaWbk0tLXh2 k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WdBucxVRbHrIhgzPfCMcTcSA3LlC314hJCLQtHRj6Nz+8nQ4yLML6cMfBymiMif/n7Vs+RwhPj
 RmvORcfDOUAD/U5evPACNfSYFQ826irzelqf9VhrzmmPf82E5yFczw5xxOX3ib0bddjNWI7Jkc
 pLTeai8QaT9lVlAJX9ITZ7bLMQUgp/zAOuJkUzrBVkzXcYY69OzmlTSiLkeLw/TAXq8ZEYBA0s
 x0ko1RGbvdSA8o9a6wpTwnrNUjBxvujmmkZa2oH/+pk0X4QpTV4AfRL9eRgkIAdv1f9wk2GZzV
 uxo=
X-SBRS: 2.7
X-MesageID: 12295795
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,402,1574139600"; d="scan'208";a="12295795"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 4 Feb 2020 15:40:25 +0000
Message-ID: <1580830825-18767-3-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580830825-18767-1-git-send-email-igor.druzhinin@citrix.com>
References: <1580830825-18767-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] x86/time: report correct frequency of Xen
 PV clocksource
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHZhbHVlIG9mIHRoZSBjb3VudGVyIHJlcHJlc2VudHMgdGhlIG51bWJlciBvZiBuYW5vc2Vj
b25kcwpzaW5jZSBob3N0IGJvb3QuIFRoYXQgbWVhbnMgdGhlIGNvcnJlY3QgZnJlcXVlbmN5IGlz
IGFsd2F5cyAxR0h6LgoKVGhpcyBpbmNvbnNpc3RlbmN5IGNhdXNlZCB0aW1lIHRvIGdvIHNsb3dl
ciBpbiBQViBzaGltIG9uIG1vc3QKcGxhdGZvcm1zLgoKU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6
aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3RpbWUu
YyB8IDE3ICstLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90aW1lLmMgYi94ZW4v
YXJjaC94ODYvdGltZS5jCmluZGV4IDdlN2E2MmUuLjk1ODQwYzQgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni90aW1lLmMKKysrIGIveGVuL2FyY2gveDg2L3RpbWUuYwpAQCAtNTY3LDI3ICs1Njcs
MTIgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV90aW1lc291cmNlIF9faW5pdGRhdGEgcGx0X3Rz
YyA9CiAgKi8KIHN0YXRpYyB1aW50NjRfdCB4ZW5fdGltZXJfbGFzdDsKIAotc3RhdGljIHVpbnQ2
NF90IHhlbl90aW1lcl9jcHVfZnJlcXVlbmN5KHZvaWQpCi17Ci0gICAgc3RydWN0IHZjcHVfdGlt
ZV9pbmZvICppbmZvID0gJnRoaXNfY3B1KHZjcHVfaW5mbyktPnRpbWU7Ci0gICAgdWludDY0X3Qg
ZnJlcTsKLQotICAgIGZyZXEgPSAxMDAwMDAwMDAwVUxMIDw8IDMyOwotICAgIGRvX2RpdihmcmVx
LCBpbmZvLT50c2NfdG9fc3lzdGVtX211bCk7Ci0gICAgaWYgKCBpbmZvLT50c2Nfc2hpZnQgPCAw
ICkKLSAgICAgICAgZnJlcSA8PD0gLWluZm8tPnRzY19zaGlmdDsKLSAgICBlbHNlCi0gICAgICAg
IGZyZXEgPj49IGluZm8tPnRzY19zaGlmdDsKLQotICAgIHJldHVybiBmcmVxOwotfQotCiBzdGF0
aWMgaW50NjRfdCBfX2luaXQgaW5pdF94ZW5fdGltZXIoc3RydWN0IHBsYXRmb3JtX3RpbWVzb3Vy
Y2UgKnB0cykKIHsKICAgICBpZiAoICF4ZW5fZ3Vlc3QgKQogICAgICAgICByZXR1cm4gMDsKIAot
ICAgIHB0cy0+ZnJlcXVlbmN5ID0geGVuX3RpbWVyX2NwdV9mcmVxdWVuY3koKTsKKyAgICBwdHMt
PmZyZXF1ZW5jeSA9IDEwMDAwMDAwMDBVTEw7CiAKICAgICByZXR1cm4gcHRzLT5mcmVxdWVuY3k7
CiB9Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
