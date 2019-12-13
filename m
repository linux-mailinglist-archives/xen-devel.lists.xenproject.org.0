Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4573E11E952
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 18:41:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifosx-0000LH-6S; Fri, 13 Dec 2019 17:37:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GgWl=2D=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ifosv-0000LC-93
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 17:37:49 +0000
X-Inumbo-ID: 470b34e6-1dcf-11ea-8fa7-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 470b34e6-1dcf-11ea-8fa7-12813bfff9fa;
 Fri, 13 Dec 2019 17:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576258667;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ko150mZ4Hf+8v8oKxBejU4anx/41GO4LLCa6S0wboPo=;
 b=WHQUAYVuybQ43Rff0e3uM2vfCbvFMLPcQ9ClczqFu1F2q97nNUVcs2tm
 c5vN03XqBlC/rtfbJctfF3yKrSlTnL35C7boUpory+D7Kns4IbJ/jncsE
 wKR1+tHYgzp11N1ry//JnEB4NrdAjJHWvWLtKubuww6r1Vr8cMhkH0NsA U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: j4KDWkWCPFKdklcljb4ZoNj64rO8GgK88MxpTzex4op559DqAvzH37mZObMGqG9VCUr4jEyy9a
 l4S+v2s6RQrLyfvA05QG0VS9bdomPp4TkTZDPgCFvijoLt+ptkxoBWEYLoPDe0xIc62hIQGde4
 CzqmBL8bKbLuasomDW/NMAHqptoWVtlqxY68Uv9nPmRkZmg6b9zjro6MIAm6+CFYTNqmzy/B4d
 mmV1I9pJzQvhQjWWXugdb6KbrW+ifrTQYVNzJ92GM+8AqcmeYUYeoWQmHCYSNe+PUl2BYEGav6
 Z3A=
X-SBRS: 2.7
X-MesageID: 10014753
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10014753"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 17:37:39 +0000
Message-ID: <20191213173742.1960441-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] Post-299 cleanups
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgaW1wbGVtZW50cyBhIG51bWJlciBvZiBjbGVhbnVwcyB0byBtYWtlIHRoZSBj
b2RlIHNpbXBsZXIKYW5kIGVhc2llciB0byBmb2xsb3cuICBObyBmdW5jdGlvbmFsIGNoYW5nZXMg
aW50ZW5kZWQuCgpHZW9yZ2UgRHVubGFwICgzKToKICB4ODYvbW06IFVzZSBhIG1vcmUgZGVzY3Jp
cHRpdmUgbmFtZSBmb3IgcGFnZXRhYmxlIG1mbnMKICB4ODYvbW06IFVzZSBtZm5fdCBpbiB0eXBl
IGdldCAvIHB1dCBjYWxsIHRyZWUKICB4ODYvbW06IE1vcmUgZGlzY3JpcHRpdmUgbmFtZXMgZm9y
IHBhZ2UgZGUvdmFsaWRhdGlvbiBmdW5jdGlvbnMKCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAg
fCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICB8IDE2MSArKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbW0uaCB8ICAgNCAr
LQogMyBmaWxlcyBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspLCA4NSBkZWxldGlvbnMoLSkKCi0t
CkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
