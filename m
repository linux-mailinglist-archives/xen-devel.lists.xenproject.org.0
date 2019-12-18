Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF251250D5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 19:40:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iheCo-0001Nm-1d; Wed, 18 Dec 2019 18:37:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HzQX=2I=amazon.com=prvs=248bb817a=sjpark@srs-us1.protection.inumbo.net>)
 id 1iheCm-0001Nd-IQ
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 18:37:52 +0000
X-Inumbo-ID: 7f77b2ec-21c5-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f77b2ec-21c5-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 18:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576694272; x=1608230272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6HH7PeknGCYANJeR4Z4A5j/5EdY1wACfauzPdOr50Ks=;
 b=qyLRo9sJFI1Gv97x9dRkuVyxSa10hw6ar/M6lLPMzVKlFnN1tC3HdUda
 yjSJ3TAyhmKLLmXyivr1J5pSb7UWmybuPRyGcyUxbHmAYdSomkEGPUxd+
 HPWJ0ve/zqqjvq9fxpN/8SCiGfLo2+hp603Kv3Eh7jgDho7vop78Ym3tG w=;
IronPort-SDR: XeSVjJ9IKBNdw6vlSlO1Hd3qPAJlS3Q34ylYso4QxX+LJua2tLfFQblLAEiYdH8WfrOSlySYAu
 DsjukJtXyi1g==
X-IronPort-AV: E=Sophos;i="5.69,330,1571702400"; 
   d="scan'208";a="9153429"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-807d4a99.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 18 Dec 2019 18:37:51 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-807d4a99.us-east-1.amazon.com (Postfix) with ESMTPS
 id C4263A23D0; Wed, 18 Dec 2019 18:37:48 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 18 Dec 2019 18:37:48 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.160.109) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 18:37:43 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <jgross@suse.com>, <axboe@kernel.dk>, <konrad.wilk@oracle.com>,
 <roger.pau@citrix.com>
Date: Wed, 18 Dec 2019 19:37:14 +0100
Message-ID: <20191218183718.31719-2-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218183718.31719-1-sjpark@amazon.com>
References: <20191218183718.31719-1-sjpark@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.160.109]
X-ClientProxiedBy: EX13D10UWB003.ant.amazon.com (10.43.161.106) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: [Xen-devel] [PATCH v13 1/5] xenbus/backend: Add memory pressure
 handler callback
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: linux-block@vger.kernel.org, sjpark@amazon.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KCkdyYW50aW5nIHBhZ2VzIGNv
bnN1bWVzIGJhY2tlbmQgc3lzdGVtIG1lbW9yeS4gIEluIHN5c3RlbXMgY29uZmlndXJlZAp3aXRo
IGluc3VmZmljaWVudCBzcGFyZSBtZW1vcnkgZm9yIHRob3NlIHBhZ2VzLCBpdCBjYW4gY2F1c2Ug
YSBtZW1vcnkKcHJlc3N1cmUgc2l0dWF0aW9uLiAgSG93ZXZlciwgZmluZGluZyB0aGUgb3B0aW1h
bCBhbW91bnQgb2YgdGhlIHNwYXJlCm1lbW9yeSBpcyBjaGFsbGVuZ2luZyBmb3IgbGFyZ2Ugc3lz
dGVtcyBoYXZpbmcgZHluYW1pYyByZXNvdXJjZQp1dGlsaXphdGlvbiBwYXR0ZXJucy4gIEFsc28s
IHN1Y2ggYSBzdGF0aWMgY29uZmlndXJhdGlvbiBtaWdodCBsYWNrCmZsZXhpYmlsaXR5LgoKVG8g
bWl0aWdhdGUgc3VjaCBwcm9ibGVtcywgdGhpcyBjb21taXQgYWRkcyBhIG1lbW9yeSByZWNsYWlt
IGNhbGxiYWNrIHRvCid4ZW5idXNfZHJpdmVyJy4gIElmIGEgbWVtb3J5IHByZXNzdXJlIGlzIGRl
dGVjdGVkLCAneGVuYnVzJyByZXF1ZXN0cwpldmVyeSBiYWNrZW5kIGRyaXZlciB0byB2b2x1bmFy
aWx5IHJlbGVhc2UgaXRzIG1lbW9yeS4KCk5vdGUgdGhhdCBpdCB3b3VsZCBiZSBhYmxlIHRvIGlt
cHJvdmUgdGhlIGNhbGxiYWNrIGZhY2lsaXR5IGZvciBtb3JlCnNvcGhpc3RpY2F0ZWQgaGFuZGxp
bmdzIG9mIGdlbmVyYWwgcHJlc3N1cmVzLiAgRm9yIGV4YW1wbGUsIGl0IHdvdWxkIGJlCnBvc3Np
YmxlIHRvIG1vbml0b3IgdGhlIG1lbW9yeSBjb25zdW1wdGlvbiBvZiBlYWNoIGRldmljZSBhbmQg
aXNzdWUgdGhlCnJlbGVhc2UgcmVxdWVzdHMgdG8gb25seSBkZXZpY2VzIHdoaWNoIGNhdXNpbmcg
dGhlIHByZXNzdXJlLiAgQWxzbywgdGhlCmNhbGxiYWNrIGNvdWxkIGJlIGV4dGVuZGVkIHRvIGhh
bmRsZSBub3Qgb25seSBtZW1vcnksIGJ1dCBnZW5lcmFsCnJlc291cmNlcy4gIE5ldmVydGhlbGVz
cywgdGhpcyB2ZXJzaW9uIG9mIHRoZSBpbXBsZW1lbnRhdGlvbiBkZWZlcnMgc3VjaApzb3BoaXN0
aWNhdGVkIGdvYWxzIGFzIGEgZnV0dXJlIHdvcmsuCgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IFNlb25nSmFlIFBhcmsgPHNqcGFya0BhbWF6
b24uZGU+Ci0tLQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMgfCAz
MiArKysrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS94ZW4veGVuYnVzLmggICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYyBiL2Ry
aXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jCmluZGV4IGIwYmVkNGZhZjQ0
Yy4uN2U3OGViZWY3YzU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3By
b2JlX2JhY2tlbmQuYworKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tl
bmQuYwpAQCAtMjQ4LDYgKzI0OCwzNSBAQCBzdGF0aWMgaW50IGJhY2tlbmRfcHJvYmVfYW5kX3dh
dGNoKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbm90aWZpZXIsCiAJcmV0dXJuIE5PVElGWV9ET05F
OwogfQogCitzdGF0aWMgaW50IGJhY2tlbmRfcmVjbGFpbV9tZW1vcnkoc3RydWN0IGRldmljZSAq
ZGV2LCB2b2lkICpkYXRhKQoreworCWNvbnN0IHN0cnVjdCB4ZW5idXNfZHJpdmVyICpkcnY7CisK
KwlpZiAoIWRldi0+ZHJpdmVyKQorCQlyZXR1cm4gMDsKKwlkcnYgPSB0b194ZW5idXNfZHJpdmVy
KGRldi0+ZHJpdmVyKTsKKwlpZiAoZHJ2ICYmIGRydi0+cmVjbGFpbV9tZW1vcnkpCisJCWRydi0+
cmVjbGFpbV9tZW1vcnkodG9feGVuYnVzX2RldmljZShkZXYpKTsKKwlyZXR1cm4gMDsKK30KKwor
LyoKKyAqIFJldHVybnMgMCBhbHdheXMgYmVjYXVzZSB3ZSBhcmUgdXNpbmcgc2hyaW5rZXIgdG8g
b25seSBkZXRlY3QgbWVtb3J5CisgKiBwcmVzc3VyZS4KKyAqLworc3RhdGljIHVuc2lnbmVkIGxv
bmcgYmFja2VuZF9zaHJpbmtfbWVtb3J5X2NvdW50KHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXIs
CisJCQkJc3RydWN0IHNocmlua19jb250cm9sICpzYykKK3sKKwlidXNfZm9yX2VhY2hfZGV2KCZ4
ZW5idXNfYmFja2VuZC5idXMsIE5VTEwsIE5VTEwsCisJCQliYWNrZW5kX3JlY2xhaW1fbWVtb3J5
KTsKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIHN0cnVjdCBzaHJpbmtlciBiYWNrZW5kX21lbW9y
eV9zaHJpbmtlciA9IHsKKwkuY291bnRfb2JqZWN0cyA9IGJhY2tlbmRfc2hyaW5rX21lbW9yeV9j
b3VudCwKKwkuc2Vla3MgPSBERUZBVUxUX1NFRUtTLAorfTsKKwogc3RhdGljIGludCBfX2luaXQg
eGVuYnVzX3Byb2JlX2JhY2tlbmRfaW5pdCh2b2lkKQogewogCXN0YXRpYyBzdHJ1Y3Qgbm90aWZp
ZXJfYmxvY2sgeGVuc3RvcmVfbm90aWZpZXIgPSB7CkBAIC0yNjQsNiArMjkzLDkgQEAgc3RhdGlj
IGludCBfX2luaXQgeGVuYnVzX3Byb2JlX2JhY2tlbmRfaW5pdCh2b2lkKQogCiAJcmVnaXN0ZXJf
eGVuc3RvcmVfbm90aWZpZXIoJnhlbnN0b3JlX25vdGlmaWVyKTsKIAorCWlmIChyZWdpc3Rlcl9z
aHJpbmtlcigmYmFja2VuZF9tZW1vcnlfc2hyaW5rZXIpKQorCQlwcl93YXJuKCJzaHJpbmtlciBy
ZWdpc3RyYXRpb24gZmFpbGVkXG4iKTsKKwogCXJldHVybiAwOwogfQogc3Vic3lzX2luaXRjYWxs
KHhlbmJ1c19wcm9iZV9iYWNrZW5kX2luaXQpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4veGVu
YnVzLmggYi9pbmNsdWRlL3hlbi94ZW5idXMuaAppbmRleCA4NjljODE2ZDVmOGMuLmM4NjFjZmI2
ZjcyMCAxMDA2NDQKLS0tIGEvaW5jbHVkZS94ZW4veGVuYnVzLmgKKysrIGIvaW5jbHVkZS94ZW4v
eGVuYnVzLmgKQEAgLTEwNCw2ICsxMDQsNyBAQCBzdHJ1Y3QgeGVuYnVzX2RyaXZlciB7CiAJc3Ry
dWN0IGRldmljZV9kcml2ZXIgZHJpdmVyOwogCWludCAoKnJlYWRfb3RoZXJlbmRfZGV0YWlscyko
c3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldik7CiAJaW50ICgqaXNfcmVhZHkpKHN0cnVjdCB4ZW5i
dXNfZGV2aWNlICpkZXYpOworCXZvaWQgKCpyZWNsYWltX21lbW9yeSkoc3RydWN0IHhlbmJ1c19k
ZXZpY2UgKmRldik7CiB9OwogCiBzdGF0aWMgaW5saW5lIHN0cnVjdCB4ZW5idXNfZHJpdmVyICp0
b194ZW5idXNfZHJpdmVyKHN0cnVjdCBkZXZpY2VfZHJpdmVyICpkcnYpCi0tIAoyLjE3LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
