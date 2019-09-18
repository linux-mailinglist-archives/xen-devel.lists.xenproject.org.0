Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D2B6296
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 13:59:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAYaL-0000GR-EK; Wed, 18 Sep 2019 11:57:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cE4e=XN=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iAYaK-0000GM-6D
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 11:57:24 +0000
X-Inumbo-ID: 78c41a8c-da0b-11e9-962f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78c41a8c-da0b-11e9-962f-12813bfff9fa;
 Wed, 18 Sep 2019 11:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568807842;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nQEHhjPgrkULCQNvBRUJgv1c/SBgiH6iI6S8yIu68OA=;
 b=FOPigT2T/WniPYQdasbL+Ny6TZJ+RIwZwv7nmrhLnvHM3Klq5NbWXqym
 TTP+i6mcp1OWcK7+9R3cSwErzONCfLwLP+tihSTmspzfWgasoiBt/rqrq
 U2JPUVQkQ3XsyfA/0cDaXXzkwfEgeyAgHiuXkPW6xAlqfIydQWedLaObk A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: L7PLu0oOZXysHPpCd0PTgePx3JTMhkh70aCwsNRU4CHMWGkwENYX82utJe/Rj+ZF9on+dCcLVS
 +H+pOt9xU8ht+8Cx2vw7516++PqXEYcEB3LgXs3RQMhGlJNAaWjwvxpjW9l4KhpPxLuLrXLuM+
 0PB2HDFP+E08lSGeR833OEa1awIE0OJjHBND7KX0o+0N4p5gJ21kco8B8+GxmJNR26wV6G8uaI
 dM47pBQlIIxoDg8xlontKcemkE2KA1a/iqIOL5o+seeuSC0jU5LjeHO+PHNt2Ll4JyOkmM0NNi
 YlY=
X-SBRS: 2.7
X-MesageID: 5720020
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5720020"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>, <qemu-devel@nongnu.org>,
 <qemu-block@nongnu.org>
Date: Wed, 18 Sep 2019 12:57:02 +0100
Message-ID: <20190918115702.38959-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen-block: treat XenbusStateUnknown the same as
 XenbusStateClosed
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Max Reitz <mreitz@redhat.com>, Paul Durrant <paul.durrant@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, Mark Syms <mark.syms@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBhIGZyb250ZW5kIGdyYWNlZnVsbHkgZGlzY29ubmVjdHMgZnJvbSBhbiBvZmZsaW5lIGJh
Y2tlbmQsIGl0IHdpbGwKc2V0IGl0cyBvd24gc3RhdGUgdG8gWGVuYnVzU3RhdGVDbG9zZWQuIFRo
ZSBjb2RlIGluIHhlbi1ibG9jay5jIGNvcnJlY3RseQpkZWFscyB3aXRoIHRoaXMgYW5kIHNldHMg
dGhlIGJhY2tlbmQgaW50byBYZW5idXNTdGF0ZUNsb3NlZC4gVW5mb3J0dW5hdGVseQppdCBpcyBw
b3NzaWJsZSBmb3IgdG9vbHN0YWNrIHRvIGFjdHVhbGx5IGRlbGV0ZSB0aGUgZnJvbnRlbmQgYXJl
YQpiZWZvcmUgdGhlIHN0YXRlIGtleSBoYXMgYmVlbiByZWFkLCBsZWFkaW5nIHRvIGFuIGFwcGFy
ZW50IGZyb250ZW5kIHN0YXRlCm9mIFhlbmJ1c1N0YXRlVW5rbm93bi4gVGhpcyBwcmV2ZW50cyB0
aGUgYmFja2VuZCBzdGF0ZSBmcm9tIHRyYW5zaXRpb25pbmcKdG8gWGVuYnVzU3RhdGVDbG9zZWQg
YW5kIGhlbmNlIGxlYXZlcyBpdCBsaW1iby4KClRoaXMgcGF0Y2ggc2ltcGx5IHRyZWF0cyBhIGZy
b250ZW5kIHN0YXRlIG9mIFhlbmJ1c1N0YXRlVW5rbm93biB0aGUgc2FtZQphcyBYZW5idXNTdGF0
ZUNsb3NlZCwgd2hpY2ggd2lsbCB1bmJsb2NrIHRoZSBiYWNrZW5kIGluIHRoZXNlIGNpcmN1bXN0
YW5jZXMuCgpSZXBvcnRlZC1ieTogTWFyayBTeW1zIDxtYXJrLnN5bXNAY2l0cml4LmNvbT4KU2ln
bmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KLS0tCkNj
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBBbnRob255
IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQ2M6IEtldmluIFdvbGYgPGt3b2xm
QHJlZGhhdC5jb20+CkNjOiBNYXggUmVpdHogPG1yZWl0ekByZWRoYXQuY29tPgotLS0KIGh3L2Js
b2NrL3hlbi1ibG9jay5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRp
ZmYgLS1naXQgYS9ody9ibG9jay94ZW4tYmxvY2suYyBiL2h3L2Jsb2NrL3hlbi1ibG9jay5jCmlu
ZGV4IGY3NzM0M2RiNjAuLjg3OWZjMzEwYTQgMTAwNjQ0Ci0tLSBhL2h3L2Jsb2NrL3hlbi1ibG9j
ay5jCisrKyBiL2h3L2Jsb2NrL3hlbi1ibG9jay5jCkBAIC0zMTMsNiArMzEzLDcgQEAgc3RhdGlj
IHZvaWQgeGVuX2Jsb2NrX2Zyb250ZW5kX2NoYW5nZWQoWGVuRGV2aWNlICp4ZW5kZXYsCiAgICAg
ICAgIGJyZWFrOwogCiAgICAgY2FzZSBYZW5idXNTdGF0ZUNsb3NlZDoKKyAgICBjYXNlIFhlbmJ1
c1N0YXRlVW5rbm93bjoKICAgICAgICAgeGVuX2Jsb2NrX2Rpc2Nvbm5lY3QoeGVuZGV2LCAmbG9j
YWxfZXJyKTsKICAgICAgICAgaWYgKGxvY2FsX2VycikgewogICAgICAgICAgICAgZXJyb3JfcHJv
cGFnYXRlKGVycnAsIGxvY2FsX2Vycik7Ci0tIAoyLjIwLjEuMi5nYjIxZWJiNjcxCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
