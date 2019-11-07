Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2478FF3661
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 18:57:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSly2-0004Mw-31; Thu, 07 Nov 2019 17:53:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a42S=Y7=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iSly0-0004MB-Qs
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 17:53:09 +0000
X-Inumbo-ID: 72fb1936-0187-11ea-a1ca-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72fb1936-0187-11ea-a1ca-12813bfff9fa;
 Thu, 07 Nov 2019 17:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573149185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9nhx9rULTycm/781xZmtN//Z5Sf2+s1ZNtb/Wyd+3iw=;
 b=Za3XLlK1rGt4fvf/sdEHgPNGqvhQvcC1kNN1PJado98GftEuZN0TLdMH
 Wwz37gF8H4vCv3R7qfbZsWRDF6X2elwivOVCm2Xfdf9K09bSSdkI2f6/i
 VvIiqsktaX4cZqz36a7+a5zPjPcd6+IyfrtkVAuCBVRP6ITzHzhqxtH6a g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: g3C9dZwaUd9PGa88lCJ40t9jADOvkie2edQHxehi0p3XNNZrrHJbNIb5cyrnO0ezLiqcJIAUgz
 6wMbhelcxMOkRQMGsIf4/H9tKUQVtL7k0O4qWVzK0ov950DIYgmuLqpIUM53CrU8BgPBOpHza2
 QAaB0uZ67TdQE+xudJ7cVtIMVp6jiPEZ56GpW1yWNMqloXW2/38BseQTg/pDO4i8eJfGMNI9KX
 OGGZMXMUHvbl8iJDLWa5bmQ1n3KIiiPu8IUvE3ipI5NDN34cxi6QIzYQUK6STbEpxg2TbUNLsF
 X3c=
X-SBRS: 2.7
X-MesageID: 8015061
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,278,1569297600"; 
   d="scan'208";a="8015061"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 7 Nov 2019 17:52:44 +0000
Message-ID: <20191107175244.3114-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <dd532554-81aa-7ebf-30f9-0aed22403856@eikelenboom.it>
References: <dd532554-81aa-7ebf-30f9-0aed22403856@eikelenboom.it>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] make-flight: Drop all win10 tests in
 all flights
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Sander Eikelenboom <linux@eikelenboom.it>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgYXJlIGZhaWxpbmcgYW5kIGhhdmUgYmVlbiBmb3Igc29tZSB0aW1lIGFuZCBpdCBkb2Vz
IG5vdCBhcHBlYXIKdGhhdCBhbnlvbmUgaGFzIHRoZSBjYXBhYmlsaXR5IHRvIGZpeCB0aGVtLiAg
UnVubmluZyB0aGVtIGluIHRoZXNlCmNpcmN1bXN0YW5jZXMgc2VlbXMgd2FzdGVmdWwuCgpFZmZl
Y3QgaXMgdG8gZHJvcCB0ZXN0LSotd2luMTAtKiBqb2JzIChjaGVja2VkIHdpdGgKc3RhbmRhbG9u
ZS1nZW5lcmF0ZS1kdW1wLWZsaWdodC1ydW52YXJzKS4KCkNDOiBTYW5kZXIgRWlrZWxlbmJvb20g
PGxpbnV4QGVpa2VsZW5ib29tLml0PgpDQzogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29t
PgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
LS0tCiBtYWtlLWZsaWdodCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ha2UtZmxpZ2h0IGIvbWFrZS1mbGlnaHQKaW5k
ZXggYmU2MjBjNmQuLmIwODQzMWRjIDEwMDc1NQotLS0gYS9tYWtlLWZsaWdodAorKysgYi9tYWtl
LWZsaWdodApAQCAtMzI3LDcgKzMyNyw3IEBAIGRvX2h2bV93aW43X3g2NF90ZXN0cyAoKSB7CiAK
IGRvX2h2bV93aW5fMjAxN190ZXN0cyAoKSB7CiAgIGRvX2h2bV93aW5fdGVzdF9vbmUgd3MxNiAg
d3MxNiAgICAgICBhbWQ2NCBndWVzdHNfbWVtc2l6ZT0zNTg0Ci0gIGRvX2h2bV93aW5fdGVzdF9v
bmUgd2luMTAgd2luMTB2MTcwMyBpMzg2ICBndWVzdHNfbWVtc2l6ZT0zNTg0CisjIGRvX2h2bV93
aW5fdGVzdF9vbmUgd2luMTAgd2luMTB2MTcwMyBpMzg2ICBndWVzdHNfbWVtc2l6ZT0zNTg0CiB9
CiAKIGRvX2h2bV9kZWJpYW5fbmVzdGVkX3Rlc3RzICgpIHsKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
