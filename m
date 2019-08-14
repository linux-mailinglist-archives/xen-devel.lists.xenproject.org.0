Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDB18D293
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 13:56:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxrqq-0006A9-6z; Wed, 14 Aug 2019 11:54:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+akc=WK=amazon.de=prvs=1223f87df=wipawel@srs-us1.protection.inumbo.net>)
 id 1hxrqp-0006A4-0W
 for xen-devel@lists.xen.org; Wed, 14 Aug 2019 11:53:59 +0000
X-Inumbo-ID: 31b208ee-be8a-11e9-8692-034475ef29d0
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31b208ee-be8a-11e9-8692-034475ef29d0;
 Wed, 14 Aug 2019 11:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565783636; x=1597319636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=H2Jobcf7/B4qcCN5zZ1DZ3Id7Yd870t7Njz94pqBXLQ=;
 b=ir/uNyN4mDHGETKzNgw1+K+AdY8oLKvGZdvJJ+jX7gSxT3XOhcPZoMVN
 c4mQkWFSyaO1DlkYa4fQfwgL+RxQD40OqKLdJQqJ4oWmsqbgPcTdNTB5Y
 hLjNRAa/ax3WQjTXCxEe49uRgIrO0E2gQSdoZCKqbKvXPJGFNSMJq+r/j k=;
X-IronPort-AV: E=Sophos;i="5.64,385,1559520000"; d="scan'208";a="819776422"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 14 Aug 2019 11:53:40 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 14FEDA2C0D; Wed, 14 Aug 2019 11:53:40 +0000 (UTC)
Received: from EX13D03EUA001.ant.amazon.com (10.43.165.33) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 14 Aug 2019 11:53:39 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D03EUA001.ant.amazon.com (10.43.165.33) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 14 Aug 2019 11:53:38 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Wed, 14 Aug 2019 11:53:36 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 14 Aug 2019 11:53:14 +0000
Message-ID: <20190814115314.12271-2-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190814115314.12271-1-wipawel@amazon.de>
References: <20190814115314.12271-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH livepatch-strip 2/2] livepatch-build: Strip all
 metadata symbols from hotpatch modules
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com, wipawel@amazon.de,
 konrad.wilk@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RyaXAgYWxsIHVubmVlZGVkIG1ldGFkYXRhIHN5bWJvbHMgZnJvbSBnZW5lcmF0ZWQgaG90cGF0
Y2ggbW9kdWxlcy4KVGhlIG1ldGFkYXRhIHN5bWJvbHMgYXJlIHRoZSBzeW1ib2xzIGZyb20gbWV0
YWRhdGEtbGlrZSBzZWN0aW9ucyAoZS5nLgonLmxpdmVwYXRjaC5mdW5jcycpIG9yIGxpdmVwYXRj
aCBob29rcyBzeW1ib2xzIChkZWZpbmVkIGJ5IGEgc2V0IG9mCnByZWZpeGVzLiBFLmcuICdsaXZl
cGF0Y2hfbG9hZF9kYXRhXycpLgoKQnkgZGVmYXVsdCB0aGUgY3JlYXRlLWRpZmYtb2JqZWN0IGRv
ZXMgbm90IGNyZWF0ZSBzeW1ib2xzIGluIG1ldGFkYXRhCnNlY3Rpb25zLiBIb3dldmVyLCBzdWNo
IHN5bWJvbHMgbWF5IGJlIGltcGxpY2l0bHkgYWRkZWQgYnkgc3BlY2l5aW5nCmV4dHJhIGVudHJp
ZXMgaW4gdGhlIHNlY3Rpb25zIG1hbnVhbGx5IChpbiBhIGdpdmVuIHBhdGNoKS4KVGhlIHN5bWJv
bHMgYXJlIG5vdCBuZWVkZWQgZm9yIHRoZSBob3RwYXRjaCBtb2R1bGVzIGFuZCBzaG91bGQgYmUK
c3RyaXBwZWQgdG8gYXZvaWQgc3ltYm9sIG5hbWVzIGNvbGxpc2lvbnMgYW5kIHRvIHNhdmUgaG90
cGF0Y2ggZmlsZXMKc3BhY2UuCgpTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8
d2lwYXdlbEBhbWF6b24uZGU+Ci0tLQogbGl2ZXBhdGNoLWJ1aWxkIHwgNTUgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDUzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGl2ZXBh
dGNoLWJ1aWxkIGIvbGl2ZXBhdGNoLWJ1aWxkCmluZGV4IGNjNzE2NDAuLmU3YzdjMTEgMTAwNzU1
Ci0tLSBhL2xpdmVwYXRjaC1idWlsZAorKysgYi9saXZlcGF0Y2gtYnVpbGQKQEAgLTExMSwxMCAr
MTExLDM5IEBAIGZ1bmN0aW9uIGJ1aWxkX3NwZWNpYWwoKQogICAgIHVuc2V0IExJVkVQQVRDSF9D
QVBUVVJFX0RJUgogfQogCi1zdHJpcF9leHRyYV9zeW1ib2xzICgpCitlbGZfc2VjdGlvbl9leGlz
dHMgKCkKK3sKKyAgICBsb2NhbCBFTEY9IiQxIgorICAgIGxvY2FsIFNFQz0iJDIiCisKKyAgICBv
YmpkdW1wIC1oIC1qICIkU0VDIiAiJEVMRiIgJj4gL2Rldi9udWxsCit9CisKKyMgRXh0cmFjdCBh
IHNldCBvZiB1bmlxdWUgc3ltYm9scyBmb3IgYSBzcGVjaWZpZWQgc2VjdGlvbi4KK2VsZl9leHRy
YWN0X3NlY3Rpb25fc3ltYm9scyAoKQoreworICAgIGxvY2FsIC1yIEVMRj0iJDEiCisgICAgbG9j
YWwgLXIgU0VDPSIkMiIKKworICAgIGlmIGVsZl9zZWN0aW9uX2V4aXN0cyAiJEVMRiIgIiRTRUMi
CisgICAgdGhlbgorICAgICAgICAjIEV4YW1wbGUgb2JqZHVtcCBjb21tYW5kIG91dHB1dCB0byBi
ZSBwYXJzZWQ6CisgICAgICAgICMKKyAgICAgICAgIyBTWU1CT0wgVEFCTEU6CisgICAgICAgICMg
MDAwMDAwMDAwMDAwMDAwMCBsICAgIGQgIC5saXZlcGF0Y2guZnVuY3MgICAgMDAwMDAwMDAwMDAw
MDAwMCAubGl2ZXBhdGNoLmZ1bmNzCisgICAgICAgIG9iamR1bXAgLXcgLWogIiRTRUMiIC10ICIk
RUxGIiB8IGF3ayAnL15TWU1CT0wgVEFCTEU6LyB7c2VlbiA9IDE7IG5leHR9IHNlZW4gJiYgJE5G
IHtwcmludCAkTkZ9JyB8IHNvcnQgLXUKKyAgICBmaQorfQorCisjIFN0cmlwIGFsbCBtZXRhZGF0
YSBzeW1ib2xzIGJlbG9uZ2luZyB0byBhIG1ldGFkYXRhIHNlY3Rpb24KKyMgb3Igd2hvc2UgbmFt
ZSBzdGFydHMgd2l0aCBhIGxpdmVwYXRjaCBob29rIHByZWZpeC4KKyMgVGhlIGZ1bmN0aW9uIGNv
bnN0cnVjdHMgdGhlICdzdHJpcCcgdXRpbGl0eSBjb21tYW5kIGxpbmUKKyMgYW5kIHRoZW4gaW52
b2tlcyBzdHJpcCB3aXRoIHRoYXQgY29tbWFuZCBsaW5lLgorc3RyaXBfbWV0YWRhdGFfc3ltYm9s
cyAoKQogewogICAgIGxvY2FsIC1yIEZJTEU9IiQxIgogICAgIGxvY2FsIC1hIFNUUklQX0NNRF9P
UFRTPSgpCisgICAgbG9jYWwgLWEgU1lNX1NFQ1RJT05TPSgiLmxpdmVwYXRjaC5mdW5jcyIpCiAg
ICAgbG9jYWwgLWEgU1lNX1BSRUZJWD0oImxpdmVwYXRjaF9sb2FkX2RhdGFfIgogICAgICAgICAg
ICAgICAgICAgICAgICAgICJsaXZlcGF0Y2hfdW5sb2FkX2RhdGFfIgogICAgICAgICAgICAgICAg
ICAgICAgICAgICJsaXZlcGF0Y2hfcHJlYXBwbHlfZGF0YV8iCkBAIC0xMjMsMTMgKzE1MiwzNSBA
QCBzdHJpcF9leHRyYV9zeW1ib2xzICgpCiAgICAgICAgICAgICAgICAgICAgICAgICAgImxpdmVw
YXRjaF9wcmVyZXZlcnRfZGF0YV8iCiAgICAgICAgICAgICAgICAgICAgICAgICAgImxpdmVwYXRj
aF9yZXZlcnRfZGF0YV8iCiAgICAgICAgICAgICAgICAgICAgICAgICAgImxpdmVwYXRjaF9wb3N0
cmV2ZXJ0X2RhdGFfIikKKyAgICBsb2NhbCAtYSBTWU1TPSgpCiAKKyAgICAjIEVuYWJsZSB3aWxk
Y2FyZAogICAgIFNUUklQX0NNRF9PUFRTKz0oIi13IikKKworICAgICMgU3RyaXAgYWxsIGxpdmVw
YXRjaCBob29rcyBtZXRhZGF0YSBzeW1ib2xzCiAgICAgZm9yIHN5bSBpbiAiJHtTWU1fUFJFRklY
W0BdfSI7IGRvCiAgICAgICAgIFNUUklQX0NNRF9PUFRTKz0oIi1OIikKICAgICAgICAgU1RSSVBf
Q01EX09QVFMrPSgiXCIke3N5bX0qXCIiKQogICAgIGRvbmUKIAorICAgICMgRmluZCBhbGwgc3lt
Ym9scyBmcm9tIG1ldGFkYXRhIHNlY3Rpb25zCisgICAgIyBOb3RlOiBUaGVyZSBtYXkgYmUgbmFt
ZSBjb25mbGljdHMgYmV0d2VlbiBnbG9iYWwKKyAgICAjIGFuZCBsb2NhbCBzeW1ib2xzIGJlbG9u
Z2luZyB0byB0aGUgc2FtZSBzZWN0aW9uLgorICAgICMgRm9yIHRoZSAnLmxpdmVwYXRjaC5mdW5j
cycgc2VjdGlvbiBpdCBpcyBub3QgYQorICAgICMgcHJvYmxlbS4gVGhpbmsgYWJvdXQgaXQgYmVm
b3JlIGFkZGluZyBtb3JlIHNlY3Rpb25zLgorICAgIGZvciBzZWMgaW4gIiR7U1lNX1NFQ1RJT05T
W0BdfSI7IGRvCisgICAgICAgIFNZTVMrPSgkKGVsZl9leHRyYWN0X3NlY3Rpb25fc3ltYm9scyAi
JEZJTEUiICIkc2VjIikpCisgICAgZG9uZQorCisgICAgIyBTdHJpcCBtZXRhZGF0YSBzZWN0aW9u
cycgc3ltYm9scworICAgIGlmIFsgJHsjU1lNU1tAXX0gLWd0IDAgXQorICAgIHRoZW4KKyAgICAg
ICAgZm9yIHN5bSBpbiAiJHtTWU1TW0BdfSI7IGRvCisgICAgICAgICAgICBTVFJJUF9DTURfT1BU
Uys9KCItTiIpCisgICAgICAgICAgICBTVFJJUF9DTURfT1BUUys9KCIke3N5bX0iKQorICAgICAg
ICBkb25lCisgICAgZmkKKwogICAgIHN0cmlwICIke1NUUklQX0NNRF9PUFRTW0BdfSIgIiRGSUxF
IgogfQogCkBAIC0xOTksNyArMjUwLDcgQEAgZnVuY3Rpb24gY3JlYXRlX3BhdGNoKCkKICAgICAg
ICAgIiR7VE9PTFNESVJ9Ii9wcmVsaW5rICRkZWJ1Z29wdCBvdXRwdXQubyAiJHtQQVRDSE5BTUV9
LmxpdmVwYXRjaCIgIiRYRU5TWU1TIiAmPj4gIiR7T1VUUFVUfS9wcmVsaW5rLmxvZyIgfHwgZGll
CiAgICAgZmkKIAotICAgIHN0cmlwX2V4dHJhX3N5bWJvbHMgIiR7UEFUQ0hOQU1FfS5saXZlcGF0
Y2giCisgICAgc3RyaXBfbWV0YWRhdGFfc3ltYm9scyAiJHtQQVRDSE5BTUV9LmxpdmVwYXRjaCIK
IAogICAgIG9iamNvcHkgLS1hZGQtc2VjdGlvbiAubGl2ZXBhdGNoLmRlcGVuZHM9ZGVwZW5kcy5i
aW4gIiR7UEFUQ0hOQU1FfS5saXZlcGF0Y2giCiAgICAgb2JqY29weSAtLXNldC1zZWN0aW9uLWZs
YWdzIC5saXZlcGF0Y2guZGVwZW5kcz1hbGxvYyxyZWFkb25seSAiJHtQQVRDSE5BTUV9LmxpdmVw
YXRjaCIKLS0gCjIuMTYuNQoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdt
YkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0
aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBD
aGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUg
Mjg5IDIzNyA4NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
