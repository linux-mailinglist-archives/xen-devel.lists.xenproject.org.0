Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57AC100A06
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 18:15:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWkaQ-0005xh-H5; Mon, 18 Nov 2019 17:13:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vqm6=ZK=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iWkaP-0005xa-Cg
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 17:13:13 +0000
X-Inumbo-ID: b2e67e4e-0a26-11ea-a2db-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2e67e4e-0a26-11ea-a2db-12813bfff9fa;
 Mon, 18 Nov 2019 17:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574097191;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EJYdqTgidb6qN2U1RxXLqhiPV/bd33Li9xUGPwo0JuI=;
 b=FIHKk3kbHR6mytoKLGO+6JqlJIvqy3XUmsiyfQD0RfcfJ3rEzZqepWBs
 NQ1YNL4jA0VxI47z6Hw6eZf2iq7fjbzVtxKOm2v2VqvfmyQOxyEZeXMsQ
 qR9QlEzw2C4k64ZOYsB2+2Y0IhM81md8dqWUNt72qc+bWAdYd2b4djHWW c=;
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
IronPort-SDR: yxETLkZ5kixKsSpP24KoKqG6OsWCrJwUBn05HS31kugV6k1ZDuhTk+KggsMvDWSQ+dA2bNhRly
 lhTQKGfRtBXNxsdWxVzlAnV6GbhG9Q+kyWgreRD7ny5NGZ4V8eDdGXDZr1coWDoG+JFEUqQjpl
 egSkuuA0fXSwbcPFWO1pL92SyYeQ8PrsEtSYkSfqJVNxRrYP+MDR29hg7FDTG0ooWVCi9A1KiF
 7Z3fNZ+2kN9D1fijom/WxxH73zywV5g8IxjUAJPVPD9mcSiSIj58G3N7K5lCly1PNvRbtnC2+x
 iic=
X-SBRS: 2.7
X-MesageID: 8888850
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,320,1569297600"; 
   d="scan'208";a="8888850"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 18 Nov 2019 17:13:01 +0000
Message-ID: <20191118171309.1459302-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v3 0/7] Fix: libxl workaround,
 multiple connection to single QMP socket
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cmh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQgYnIuZml4
LWV2X3FtcC1tdWx0aS1jb25uZWN0LXYzCgp2MzoKVHdvIHBhdGNoZXMgbGVmdCB0byByZXZpZXc6
Ci0gbGlieGw6IEludHJvZHVjZSBsaWJ4bF9fZXZfaW1tZWRpYXRlIChuZXcpCi0gbGlieGxfcW1w
OiBIYXZlIGEgbG9jayBmb3IgUU1QIHNvY2tldCBhY2Nlc3MKCkFuZCBKw7xyZ2VuIGFscmVhZHkg
Z2F2ZSBoaXMgYWNrIG9uIDh0aCBvZiBOb3ZlbWJlcjoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKSGksCgpRRU1VJ3MgUU1QIHNvY2tldCBkb2Vzbid0
IGFsbG93IG11bHRpcGxlIGNvbmN1cnJlbnQgY29ubmVjdGlvbi4gQWxzbywgaXQKbGlzdGVuKCkg
b24gdGhlIHNvY2tldCB3aXRoIGEgYGJhY2tsb2cnIG9mIG9ubHkgMS4gT24gTGludXggYXQgbGVh
c3QsIG9uY2UgdGhhdApiYWNrbG9nIGlzIGZpbGxlZCBjb25uZWN0KCkgd2lsbCByZXR1cm4gRUFH
QUlOIGlmIHRoZSBzb2NrZXQgZmQgaXMKbm9uLWJsb2NraW5nLiBsaWJ4bCBtYXkgYXR0ZW1wdCBt
YW55IGNvbmN1cnJlbnQgY29ubmVjdCgpIGF0dGVtcHQgaWYgZm9yCmV4YW1wbGUgYSBndWVzdCBp
cyBzdGFydGVkIHdpdGggc2V2ZXJhbCBQQ0kgcGFzc3Rocm91Z2ggZGV2aWNlcywgYW5kIGEKY29u
bmVjdCgpIGZhaWx1cmUgbGVhZCB0byBhIGZhaWx1cmUgdG8gc3RhcnQgdGhlIGd1ZXN0LgoKU2lu
Y2Ugd2UgY2FuJ3QgY2hhbmdlIHRoZSBsaXN0ZW4oKSdzIGBiYWNrbG9nJyB0aGF0IFFFTVUgdXNl
LCB3ZSBuZWVkIG90aGVyCndheXMgdG8gd29ya2Fyb3VuZCB0aGUgaXNzdWUuIFRoaXMgcGF0Y2gg
c2VyaWVzIGludHJvZHVjZSBhIGxvY2sgdG8gYWNxdWlyZQpiZWZvcmUgYXR0ZW1wdGluZyB0byBj
b25uZWN0KCkgdG8gdGhlIFFNUCBzb2NrZXQuIFNpbmNlIHRoZSBsb2NrIG1pZ2h0IGJlIGhlbGQK
Zm9yIHRvIGxvbmcsIHRoZSBzZXJpZXMgYWxzbyBpbnRyb2R1Y2UgYSB3YXkgdG8gY2FuY2VsIHRo
ZSBhY3F1aXNpdGlvbiBvZiB0aGUKbG9jaywgdGhpcyBtZWFucyBraWxsaW5nIHRoZSBwcm9jZXNz
IHRoYXQgdHJpZXMgdG8gZ2V0IHRoZSBsb2NrLgoKU2VlIHRocmVhZFsxXSBmb3IgZGlzY3Vzc2Vk
IGFsdGVybmF0aXZlLgpbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9o
dG1sL3hlbi1kZXZlbC8yMDE5LTEwL21zZzAxODE1Lmh0bWwKCkNoZWVycywKCkFudGhvbnkgUEVS
QVJEICg3KToKICBsaWJ4bDogSW50cm9kdWNlIGxpYnhsX19ldl9jaGlsZF9raWxsX2RlcmVnaXN0
ZXIKICBsaWJ4bDogTW92ZSBsaWJ4bF9fZXZfZGV2bG9jayBkZWNsYXJhdGlvbgogIGxpYnhsOiBS
ZW5hbWUgZXZfZGV2bG9jayB0byBldl9zbG93bG9jawogIGxpYnhsOiBJbnRyb2R1Y2UgbGlieGxf
X2V2X3Nsb3dsb2NrX2Rpc3Bvc2UKICBsaWJ4bDogbGlieGxfX2V2X3FtcF9zZW5kIG5vdyB0YWtl
cyBhbiBlZ2MKICBsaWJ4bDogSW50cm9kdWNlIGxpYnhsX19ldl9pbW1lZGlhdGUKICBsaWJ4bF9x
bXA6IEhhdmUgYSBsb2NrIGZvciBRTVAgc29ja2V0IGFjY2VzcwoKIHRvb2xzL2xpYnhsL2xpYnhs
X2Rpc2suYyAgICAgICAgfCAgMTYgKystLQogdG9vbHMvbGlieGwvbGlieGxfZG0uYyAgICAgICAg
ICB8ICAgOCArLQogdG9vbHMvbGlieGwvbGlieGxfZG9tX3NhdmUuYyAgICB8ICAgMiArLQogdG9v
bHMvbGlieGwvbGlieGxfZG9tX3N1c3BlbmQuYyB8ICAgMiArLQogdG9vbHMvbGlieGwvbGlieGxf
ZG9tYWluLmMgICAgICB8ICAxOCArKy0tCiB0b29scy9saWJ4bC9saWJ4bF9ldmVudC5jICAgICAg
IHwgIDI1ICsrKysrLQogdG9vbHMvbGlieGwvbGlieGxfZm9yay5jICAgICAgICB8ICA0OCArKysr
KysrKysrKwogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuYyAgICB8ICA0MSArKysrKystLS0K
IHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggICAgfCAxNDcgKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX3BjaS5jICAgICAgICAgfCAgIDggKy0K
IHRvb2xzL2xpYnhsL2xpYnhsX3FtcC5jICAgICAgICAgfCAxMjggKysrKysrKysrKysrKysrKysr
KystLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF91c2IuYyAgICAgICAgIHwgIDI4ICsrKy0tLQog
MTIgZmlsZXMgY2hhbmdlZCwgMzM2IGluc2VydGlvbnMoKyksIDEzNSBkZWxldGlvbnMoLSkKCi0t
IApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
