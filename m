Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521D01250D6
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 19:41:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iheCt-0001OP-Bp; Wed, 18 Dec 2019 18:37:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HzQX=2I=amazon.com=prvs=248bb817a=sjpark@srs-us1.protection.inumbo.net>)
 id 1iheCr-0001O8-Ff
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 18:37:57 +0000
X-Inumbo-ID: 8161f108-21c5-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8161f108-21c5-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 18:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576694275; x=1608230275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Xpzt6vDQRDOijp8HV3H/w1zG6CWqztMhFIxNrpBJVT0=;
 b=X4RnpPqXbiTyXVZL8nAzUSw4FPwJpcwAVdfBohIPO0tiGPO3m0ABztUq
 J7GgA9kxfdjCz4aq5ATgSULEAiYiw4lwq06pnGe1Q62/yPK2viyl+Aa9v
 mXYHl5EF6qyqQTfySbLhQrrWNtlSud0yfiaysPQXO11so0mS9N7J8+XmC s=;
IronPort-SDR: XumbSHl7NofUH0IrubD4nexBoYveeVSBcTWZqS4Vl14pPxC3jLPKPlQS8+AezuOdkY6oTi3YJW
 uAxTCQuOiC6g==
X-IronPort-AV: E=Sophos;i="5.69,330,1571702400"; 
   d="scan'208";a="9153445"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 18 Dec 2019 18:37:54 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6C3FBA1F54; Wed, 18 Dec 2019 18:37:53 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 18:37:52 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.160.109) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 18:37:47 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <jgross@suse.com>, <axboe@kernel.dk>, <konrad.wilk@oracle.com>,
 <roger.pau@citrix.com>
Date: Wed, 18 Dec 2019 19:37:15 +0100
Message-ID: <20191218183718.31719-3-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218183718.31719-1-sjpark@amazon.com>
References: <20191218183718.31719-1-sjpark@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.160.109]
X-ClientProxiedBy: EX13D10UWB003.ant.amazon.com (10.43.161.106) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: [Xen-devel] [PATCH v13 2/5] xenbus/backend: Protect xenbus callback
 with lock
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

RnJvbTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KCkEgZHJpdmVyJ3MgJ3JlY2xh
aW1fbWVtb3J5JyBjYWxsYmFjayBjYW4gcmFjZSB3aXRoICdwcm9iZScgb3IgJ3JlbW92ZScKYmVj
YXVzZSBpdCB3aWxsIGJlIGNhbGxlZCB3aGVuZXZlciBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0ZWN0
ZWQuICBUbwphdm9pZCBzdWNoIHJhY2UsIHRoaXMgY29tbWl0IGVtYmVkcyBhIHNwaW5sb2NrIGlu
IGVhY2ggJ3hlbmJ1c19kZXZpY2UnCmFuZCBtYWtlICd4ZW5idXMnIHRvIGhvbGQgdGhlIGxvY2sg
d2hpbGUgdGhlIGNvcnJlc3BvbmRlZCBjYWxsYmFja3MgYXJlCnJ1bm5pbmcuCgpTaWduZWQtb2Zm
LWJ5OiBTZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmRlPgotLS0KIGRyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfcHJvYmUuYyAgICAgICAgIHwgIDggKysrKysrKy0KIGRyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jIHwgMTAgKysrKysrKystLQogaW5jbHVkZS94ZW4v
eGVuYnVzLmggICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDE2
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4v
eGVuYnVzL3hlbmJ1c19wcm9iZS5jIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5j
CmluZGV4IDViNDcxODg5ZDcyMy4uOWVkNTU2YmE0ZmQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hl
bi94ZW5idXMveGVuYnVzX3Byb2JlLmMKKysrIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19w
cm9iZS5jCkBAIC0yMzIsNyArMjMyLDkgQEAgaW50IHhlbmJ1c19kZXZfcHJvYmUoc3RydWN0IGRl
dmljZSAqX2RldikKIAkJcmV0dXJuIGVycjsKIAl9CiAKKwlzcGluX2xvY2soJmRldi0+cmVjbGFp
bV9sb2NrKTsKIAllcnIgPSBkcnYtPnByb2JlKGRldiwgaWQpOworCXNwaW5fdW5sb2NrKCZkZXYt
PnJlY2xhaW1fbG9jayk7CiAJaWYgKGVycikKIAkJZ290byBmYWlsOwogCkBAIC0yNjAsOCArMjYy
LDExIEBAIGludCB4ZW5idXNfZGV2X3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpfZGV2KQogCiAJZnJl
ZV9vdGhlcmVuZF93YXRjaChkZXYpOwogCi0JaWYgKGRydi0+cmVtb3ZlKQorCWlmIChkcnYtPnJl
bW92ZSkgeworCQlzcGluX2xvY2soJmRldi0+cmVjbGFpbV9sb2NrKTsKIAkJZHJ2LT5yZW1vdmUo
ZGV2KTsKKwkJc3Bpbl91bmxvY2soJmRldi0+cmVjbGFpbV9sb2NrKTsKKwl9CiAKIAlmcmVlX290
aGVyZW5kX2RldGFpbHMoZGV2KTsKIApAQCAtNDcyLDYgKzQ3Nyw3IEBAIGludCB4ZW5idXNfcHJv
YmVfbm9kZShzdHJ1Y3QgeGVuX2J1c190eXBlICpidXMsCiAJCWdvdG8gZmFpbDsKIAogCWRldl9z
ZXRfbmFtZSgmeGVuZGV2LT5kZXYsICIlcyIsIGRldm5hbWUpOworCXNwaW5fbG9ja19pbml0KCZ4
ZW5kZXYtPnJlY2xhaW1fbG9jayk7CiAKIAkvKiBSZWdpc3RlciB3aXRoIGdlbmVyaWMgZGV2aWNl
IGZyYW1ld29yay4gKi8KIAllcnIgPSBkZXZpY2VfcmVnaXN0ZXIoJnhlbmRldi0+ZGV2KTsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jIGIvZHJp
dmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMKaW5kZXggN2U3OGViZWY3YzU0
Li5iYzYxMzcyZTAwYTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJv
YmVfYmFja2VuZC5jCisrKyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2Vu
ZC5jCkBAIC0yNTEsMTIgKzI1MSwxOCBAQCBzdGF0aWMgaW50IGJhY2tlbmRfcHJvYmVfYW5kX3dh
dGNoKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbm90aWZpZXIsCiBzdGF0aWMgaW50IGJhY2tlbmRf
cmVjbGFpbV9tZW1vcnkoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQogewogCWNvbnN0
IHN0cnVjdCB4ZW5idXNfZHJpdmVyICpkcnY7CisJc3RydWN0IHhlbmJ1c19kZXZpY2UgKnhkZXY7
CiAKIAlpZiAoIWRldi0+ZHJpdmVyKQogCQlyZXR1cm4gMDsKIAlkcnYgPSB0b194ZW5idXNfZHJp
dmVyKGRldi0+ZHJpdmVyKTsKLQlpZiAoZHJ2ICYmIGRydi0+cmVjbGFpbV9tZW1vcnkpCi0JCWRy
di0+cmVjbGFpbV9tZW1vcnkodG9feGVuYnVzX2RldmljZShkZXYpKTsKKwlpZiAoZHJ2ICYmIGRy
di0+cmVjbGFpbV9tZW1vcnkpIHsKKwkJeGRldiA9IHRvX3hlbmJ1c19kZXZpY2UoZGV2KTsKKwkJ
aWYgKCFzcGluX3RyeWxvY2soJnhkZXYtPnJlY2xhaW1fbG9jaykpCisJCQlyZXR1cm4gMDsKKwkJ
ZHJ2LT5yZWNsYWltX21lbW9yeSh4ZGV2KTsKKwkJc3Bpbl91bmxvY2soJnhkZXYtPnJlY2xhaW1f
bG9jayk7CisJfQogCXJldHVybiAwOwogfQogCmRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94ZW5i
dXMuaCBiL2luY2x1ZGUveGVuL3hlbmJ1cy5oCmluZGV4IGM4NjFjZmI2ZjcyMC4uNDVjZDYxY2I2
ZTg2IDEwMDY0NAotLS0gYS9pbmNsdWRlL3hlbi94ZW5idXMuaAorKysgYi9pbmNsdWRlL3hlbi94
ZW5idXMuaApAQCAtNzYsNiArNzYsNyBAQCBzdHJ1Y3QgeGVuYnVzX2RldmljZSB7CiAJZW51bSB4
ZW5idXNfc3RhdGUgc3RhdGU7CiAJc3RydWN0IGNvbXBsZXRpb24gZG93bjsKIAlzdHJ1Y3Qgd29y
a19zdHJ1Y3Qgd29yazsKKwlzcGlubG9ja190IHJlY2xhaW1fbG9jazsKIH07CiAKIHN0YXRpYyBp
bmxpbmUgc3RydWN0IHhlbmJ1c19kZXZpY2UgKnRvX3hlbmJ1c19kZXZpY2Uoc3RydWN0IGRldmlj
ZSAqZGV2KQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
