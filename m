Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5669A45AA3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 12:40:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbjb2-0002kf-DU; Fri, 14 Jun 2019 10:38:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbjb0-0002k9-QD
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 10:38:10 +0000
X-Inumbo-ID: 8050c424-8e90-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8050c424-8e90-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 10:38:09 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: t7CfGOnci/kuF3IRoxQ2uWbZhGoQfPDm6iBlCmBxHd9Nt8FeQrp7njmdodUChYt1azWi4KiXNB
 f2yDKP91hwXxBjw5+BOiLuVtqoApe7Y+u5Ye0we5ed8GK5h3xqfeM2LYJcwsxzRcy95eRgiv1N
 8bxAdNuIMbmBRr4wpb5Vx/MDjF53z6v4UXVeY7cXu1KSmcDhLGg5nw7ZHlSTQtnVHFvWjtmLDF
 yivN58t3wGprxUU3Uan0R+0QRGAbqIO0PTZYX3dhrUiu68qKiZgDXjbvr22ixFuYCvrh4ompph
 fsE=
X-SBRS: 2.7
X-MesageID: 1752396
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1752396"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 11:37:52 +0100
Message-ID: <20190614103801.22619-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/9] libxl: New slow lock + fix
 libxl_cdrom_insert with QEMU depriv
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpDaGFuZ2VzIGluIHYyOgotIE5ldyBsaWJ4bF9fZXZfbG9jaywgd2hpY2ggYWN0dWFsbHkg
cmVzcGVjdCBsb2NrIGhpZXJhcmNoeSAoaXQncyBvdXRzaWRlIG9mCiAgQ1RYX0xPQ0spLgotIHNv
bWUgc21hbGxlciBjaGFuZ2VzIGRldGFpbGVkIGluIHBhdGNoIG5vdGVzLgoKVGhpcyBwYXRjaCBz
ZXJpZXMgZml4IGxpYnhsX2Nkcm9tX2luc2VydCB0byB3b3JrIHdpdGggYSBkZXByaXZpbGVkZ2Ug
UUVNVS4gRm9yCnRoYXQsIHdlIG5lZWQgdG8gdXNlIGxpYnhsX19ldl9xbXAuICBGb3IgdGhhdCwg
d2UgbmVlZCBhIG5ldyBsb2NrIGJlY2F1c2UKdXNlcmRhdGFfbG9jayBjYW4ndCBiZSB1c2VkIGFu
eW1vcmUuCgpGWUk6IEkgZG9uJ3QgdGhpbmsgdGhhdCBlbm91Z2ggeWV0IHRvIG1pZ3JhdGUgYSBk
ZXByaXZpbGVkZ2VkIFFFTVUuIFdlIG1heSBuZWVkCnRvIG9wZW4gZGlza3MvY2Ryb20gaW4gbGli
eGwgYmVmb3JlIHN0YXJ0aW5nIFFFTVUsIHNpbWlsYXIgdG8gd2hhdCB0aGlzIHBhdGNoCnNlcmll
cyBkbyB3aGVuIGluc2VydGluZyBhIG5ldyBjZHJvbS4KClBhdGNoIHNlcmllcyBhdmFpbGFibGUg
aW4gdGhpcyBnaXQgYnJhbmNoOgpodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9w
bGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJyLmxpYnhsLXNsb3ctbG9jay12MgoKQW50aG9u
eSBQRVJBUkQgKDkpOgogIGxpYnhsX2ludGVybmFsOiBSZW1vdmUgbG9zdCBjb21tZW50CiAgbGli
eGw6IFBvaW50ZXIgb24gdXNhZ2Ugb2YgbGlieGxfX2RvbWFpbl91c2VyZGF0YV9sb2NrCiAgbGli
eGxfaW50ZXJuYWw6IEludHJvZHVjZSBsaWJ4bF9fZXZfbG9jayBmb3IgZGV2aWNlcyBob3RwbHVn
IHZpYSBRTVAKICBsaWJ4bDogQWRkIG9wdGltaXNhdGlvbiB0byBldl9sb2NrCiAgbGlieGxfZGlz
azogUmVvcmdhbmlzZSBsaWJ4bF9jZHJvbV9pbnNlcnQKICBsaWJ4bF9kaXNrOiBDdXQgbGlieGxf
Y2Ryb21faW5zZXJ0IGludG8gc3RlcHMgLi4KICBsaWJ4bF9kaXNrOiBJbXBsZW1lbnQgbWlzc2lu
ZyB0aW1lb3V0IGZvciBsaWJ4bF9jZHJvbV9pbnNlcnQKICBsaWJ4bDogTW92ZSBxbXBfcGFyYW1l
dGVyc18qIHByb3RvdHlwZXMgdG8gbGlieGxfaW50ZXJuYWwuaAogIGxpYnhsX2Rpc2s6IFVzZSBl
dl9xbXAgaW4gbGlieGxfY2Ryb21faW5zZXJ0CgogdG9vbHMvbGlieGwvTWFrZWZpbGUgICAgICAg
ICB8ICAgMyArCiB0b29scy9saWJ4bC9saWJ4bF9kaXNrLmMgICAgIHwgMzQxICsrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jIHwg
MTkzICsrKysrKysrKysrKysrKysrKysrCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwg
MTA1ICsrKysrKysrKy0tCiB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyAgICAgIHwgIDg5ICsrKyst
LS0tLQogNSBmaWxlcyBjaGFuZ2VkLCA2MDEgaW5zZXJ0aW9ucygrKSwgMTMwIGRlbGV0aW9ucygt
KQoKLS0gCkFudGhvbnkgUEVSQVJECgoKUGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdp
dCBicmFuY2g6Cmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJk
L3hlbi11bnN0YWJsZS5naXQgYnIubGlieGwtc2xvdy1sb2NrLXYyCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
