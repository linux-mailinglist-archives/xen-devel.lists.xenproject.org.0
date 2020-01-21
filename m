Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89876143ED8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 15:03:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itu4G-000871-Tv; Tue, 21 Jan 2020 13:59:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cram=3K=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1itu4F-00086w-4d
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 13:59:43 +0000
X-Inumbo-ID: 40d4f972-3c56-11ea-b833-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40d4f972-3c56-11ea-b833-bc764e2007e4;
 Tue, 21 Jan 2020 13:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579615174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q81O0NQnXh4Nf3/E92q2P+Njy9Qpi8zaniekHshzOHQ=;
 b=GW31KdtRxFXl6L05NfTyy2HuR79svSPv87yPJrd3X1B7WuHHHKL1MlBv
 pYtWV+Sxy6y8mu3eYWxFknmDoeZYmRu8y5PSZp+BXQgnuZ4kLVve4WD0X
 /lzSm4I41RwcZUBf1NvTq6rOgZPsUlVVpY7X6WK2JyJ9WLc2WFVKxk9Pg E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QhGb9cH6s4v0JACVyroKyoqsIdwRmS490XB/NZ8kCr5pn0vi5eBMNLzfOX+eHl7Et7QfZL/zk7
 oVo+tD2vg/27dq34wDlId4oDSrEhjGJaU/qvYEY+nQIRkKKfZ7IyT4RojER1gS9asHmCVyV1aZ
 rkZsnYCHqdD6AO4lvQslB/d5+7dyum38qnJflO1VesHSAo97qE9l8EwnaBQtqS+H861ELrVA7T
 1RH6dAphEr8H4U2lUUJqjdoXTdGuM5bfE5n87w+1faHGhcHqmwiLm+6SIeuAKJ2wpf3oqrj57O
 EjQ=
X-SBRS: 2.7
X-MesageID: 11636294
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,346,1574139600"; d="scan'208";a="11636294"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 21 Jan 2020 13:59:14 +0000
Message-ID: <20200121135916.1140483-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117105358.607910-1-anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2.1 13/12] Makefile: Fix install-tests
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHRvcC1sZXZlbCBtYWtlZmlsZSBtYWtlIHVzZXMgb2YgaW50ZXJuYWwgaW1wbGVtZW50YXRp
b24gZGV0YWlsIG9mCnRoZSB4ZW4gYnVpbGQgc3lzdGVtLiBBdm9pZCB0aGF0IGJ5IGNyZWF0aW5n
IGEgbmV3IHRhcmdldAoiaW5zdGFsbC10ZXN0cyIgaW4geGVuL01ha2VmaWxlLCBhbmQgYnkgZml4
aW5nIHRoZSB0b3AtbGV2ZWwgTWFrZWZpbGUKdG8gbm90IGNhbGwgeGVuL1J1bGVzLm1rIGFueW1v
cmUuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KLS0tCiBNYWtlZmlsZSAgICAgfCA2ICsrLS0tLQogeGVuL01ha2VmaWxlIHwgMyArKysK
IDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggNTEyZDZiNzNjODk4Li45YWQyNjAyZjYz
ZjAgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0xNTUsMTMgKzE1NSwx
MSBAQCBpbnN0YWxsLWRvY3M6CiAjIFdlIG9ubHkgaGF2ZSBidWlsZC10ZXN0cyBpbnN0YWxsLXRl
c3RzLCBub3QgdW5pbnN0YWxsLXRlc3RzIGV0Yy4KIC5QSE9OWTogYnVpbGQtdGVzdHMKIGJ1aWxk
LXRlc3RzOiBidWlsZC14ZW4KLQlleHBvcnQgQkFTRURJUj0kKFhFTl9ST09UKS94ZW47IFwKLQkk
KE1BS0UpIC1mICQkQkFTRURJUi9SdWxlcy5tayAtQyB4ZW4vdGVzdCBidWlsZAorCSQoTUFLRSkg
LUMgeGVuIHRlc3RzCiAKIC5QSE9OWTogaW5zdGFsbC10ZXN0cwogaW5zdGFsbC10ZXN0czogaW5z
dGFsbC14ZW4KLQlleHBvcnQgQkFTRURJUj0kKFhFTl9ST09UKS94ZW47IFwKLQkkKE1BS0UpIC1m
ICQkQkFTRURJUi9SdWxlcy5tayAtQyB4ZW4vdGVzdCBpbnN0YWxsCisJJChNQUtFKSAtQyB4ZW4g
JEAKIAogIyBidWlsZCB4ZW4gYW5kIHRoZSB0b29scyBhbmQgcGxhY2UgdGhlbSBpbiB0aGUgaW5z
dGFsbAogIyBkaXJlY3RvcnkuICdtYWtlIGluc3RhbGwnIHNob3VsZCB0aGVuIGNvcHkgdGhlbSB0
byB0aGUgbm9ybWFsIHN5c3RlbQpkaWZmIC0tZ2l0IGEveGVuL01ha2VmaWxlIGIveGVuL01ha2Vm
aWxlCmluZGV4IGMzMjZmZWU1ODgwZS4uNzJiYzg5OTI0NjIyIDEwMDY0NAotLS0gYS94ZW4vTWFr
ZWZpbGUKKysrIGIveGVuL01ha2VmaWxlCkBAIC05MCw2ICs5MCw5IEBAIF9pbnN0YWxsOiAkKFRB
UkdFVCkkKENPTkZJR19YRU5fSU5TVEFMTF9TVUZGSVgpCiAuUEhPTlk6IF90ZXN0cwogX3Rlc3Rz
OgogCSQoTUFLRSkgLWYgJChCQVNFRElSKS9SdWxlcy5tayAtQyB0ZXN0IHRlc3RzCisuUEhPTlk6
IGluc3RhbGwtdGVzdHMKK2luc3RhbGwtdGVzdHM6CisJJChNQUtFKSAtZiAkKEJBU0VESVIpL1J1
bGVzLm1rIC1DIHRlc3QgaW5zdGFsbAogCiAuUEhPTlk6IF91bmluc3RhbGwKIF91bmluc3RhbGw6
IEQ9JChERVNURElSKQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
