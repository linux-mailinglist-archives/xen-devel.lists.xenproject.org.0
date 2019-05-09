Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A089189E8
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 14:38:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOiH7-0008Iu-DY; Thu, 09 May 2019 12:35:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOiH5-0008Ip-VY
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 12:35:48 +0000
X-Inumbo-ID: f7c355e5-7256-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f7c355e5-7256-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 12:35:46 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 09 May 2019 06:35:45 -0600
Message-Id: <5CD41EA1020000780022D25D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 09 May 2019 06:35:45 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] page-alloc: detect double free earlier
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmlnaHQgbm93IHRoaXMgZ29lcyB1bm5vdGljZWQgdW50aWwgc29tZSBzdWJzZXF1ZW50IHBhZ2Ug
YWxsb2NhdG9yCm9wZXJhdGlvbiBzdHVtYmxlcyBhY3Jvc3MgdGhlIHRodXMgY29ycnVwdGVkIGxp
c3QuIFdlIGNhbiBkbyBiZXR0ZXI6Ck9ubHkgUEdDX3N0YXRlX2ludXNlIGFuZCBQR0Nfc3RhdGVf
b2ZmbGluaW5nIHBhZ2VzIGNhbiBsZWdpdGltYXRlbHkgYmUKcGFzc2VkIHRvIGZyZWVfaGVhcF9w
YWdlcygpLgoKVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28gcmVzdHJpY3QgdGhlIFBHQ19i
cm9rZW4gY2hlY2sgdG8gdGhlClBHQ19zdGF0ZV9vZmZsaW5pbmcgY2FzZSwgYXMgb25seSBwYWdl
cyBvZiB0aGF0IHR5cGUgb3IKUEdDX3N0YXRlX29mZmxpbmVkIG1heSBoYXZlIHRoaXMgZmxhZyBz
ZXQgb24gdGhlbS4gU2ltaWxhcmx5LCBzaW5jZQpQR0Nfc3RhdGVfb2ZmbGluZWQgaXMgbm90IGEg
dmFsaWQgaW5wdXQgc3RhdGUsIHRoZSBzZXR0aW5nIG9mICJ0YWludGVkIgpjYW4gYmUgcmVzdHJp
Y3RlZCB0byBqdXN0IHRoaXMgY2FzZS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCisrKyBiL3hlbi9j
b21tb24vcGFnZV9hbGxvYy5jCkBAIC0xNDA5LDEzICsxNDA5LDIyIEBAIHN0YXRpYyB2b2lkIGZy
ZWVfaGVhcF9wYWdlcygKICAgICAgICAgICogICAgIGluIGl0cyBwc2V1ZG9waHlzaWNhbCBhZGRy
ZXNzIHNwYWNlKS4KICAgICAgICAgICogSW4gYWxsIHRoZSBhYm92ZSBjYXNlcyB0aGVyZSBjYW4g
YmUgbm8gZ3Vlc3QgbWFwcGluZ3Mgb2YgdGhpcyBwYWdlLgogICAgICAgICAgKi8KLSAgICAgICAg
QVNTRVJUKCFwYWdlX3N0YXRlX2lzKCZwZ1tpXSwgb2ZmbGluZWQpKTsKLSAgICAgICAgcGdbaV0u
Y291bnRfaW5mbyA9Ci0gICAgICAgICAgICAoKHBnW2ldLmNvdW50X2luZm8gJiBQR0NfYnJva2Vu
KSB8Ci0gICAgICAgICAgICAgKHBhZ2Vfc3RhdGVfaXMoJnBnW2ldLCBvZmZsaW5pbmcpCi0gICAg
ICAgICAgICAgID8gUEdDX3N0YXRlX29mZmxpbmVkIDogUEdDX3N0YXRlX2ZyZWUpKTsKLSAgICAg
ICAgaWYgKCBwYWdlX3N0YXRlX2lzKCZwZ1tpXSwgb2ZmbGluZWQpICkKKyAgICAgICAgc3dpdGNo
ICggcGdbaV0uY291bnRfaW5mbyAmIFBHQ19zdGF0ZSApCisgICAgICAgIHsKKyAgICAgICAgY2Fz
ZSBQR0Nfc3RhdGVfaW51c2U6CisgICAgICAgICAgICBCVUdfT04ocGdbaV0uY291bnRfaW5mbyAm
IFBHQ19icm9rZW4pOworICAgICAgICAgICAgcGdbaV0uY291bnRfaW5mbyA9IFBHQ19zdGF0ZV9m
cmVlOworICAgICAgICAgICAgYnJlYWs7CisKKyAgICAgICAgY2FzZSBQR0Nfc3RhdGVfb2ZmbGlu
aW5nOgorICAgICAgICAgICAgcGdbaV0uY291bnRfaW5mbyA9IChwZ1tpXS5jb3VudF9pbmZvICYg
UEdDX2Jyb2tlbikgfAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBHQ19zdGF0ZV9v
ZmZsaW5lZDsKICAgICAgICAgICAgIHRhaW50ZWQgPSAxOworICAgICAgICAgICAgYnJlYWs7CisK
KyAgICAgICAgZGVmYXVsdDoKKyAgICAgICAgICAgIEJVRygpOworICAgICAgICB9CiAKICAgICAg
ICAgLyogSWYgYSBwYWdlIGhhcyBubyBvd25lciBpdCB3aWxsIG5lZWQgbm8gc2FmZXR5IFRMQiBm
bHVzaC4gKi8KICAgICAgICAgcGdbaV0udS5mcmVlLm5lZWRfdGxiZmx1c2ggPSAocGFnZV9nZXRf
b3duZXIoJnBnW2ldKSAhPSBOVUxMKTsKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
