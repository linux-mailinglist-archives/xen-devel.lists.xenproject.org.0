Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49312149FD8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 09:26:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ivzbt-0001Wy-Er; Mon, 27 Jan 2020 08:19:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y5+q=3Q=amazon.com=prvs=288afea8f=sjpark@srs-us1.protection.inumbo.net>)
 id 1ivzbs-0001Wl-Be
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 08:19:04 +0000
X-Inumbo-ID: a831641c-40dd-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a831641c-40dd-11ea-9fd7-bc764e2007e4;
 Mon, 27 Jan 2020 08:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580113135; x=1611649135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=dm2qM4W8b5BZdLKOsyrt63daqngTk+Y1qGr35fS4OsQ=;
 b=n47aNtE0sEzuKZu27e1FUP8uKAakIVtLITnhaWIHHJqhUyWG6mGy9iqX
 kXNyPQTdeiiqnVWNYzKPvBXZFQxnwAPmvjL7spOk7lVLYZiz1F6UdQtbm
 K7mmD0/Zj5Xe6O8sBRUa5txQP73FXNAHV+qEXXQK1o+Ft+592LA41DSXe E=;
IronPort-SDR: 8RkC+dRPpNCwzT4oTt6mIf+gDHsQWjpSZz9W0iuH2mB9IduHH3/j/VwwIVPHBKf6fOA/8AKhxt
 kPzbR7pnDsHQ==
X-IronPort-AV: E=Sophos;i="5.70,369,1574121600"; d="scan'208";a="22599829"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 27 Jan 2020 08:18:47 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS
 id BD122A2750; Mon, 27 Jan 2020 08:18:46 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 27 Jan 2020 08:18:46 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.160.8) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 27 Jan 2020 08:18:41 +0000
From: <sjpark@amazon.com>
To: <jgross@suse.com>, <roger.pau@citrix.com>, <axboe@kernel.dk>
Date: Mon, 27 Jan 2020 09:18:09 +0100
Message-ID: <20200127081812.21216-3-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127081812.21216-1-sjpark@amazon.com>
References: <20200127081812.21216-1-sjpark@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.160.8]
X-ClientProxiedBy: EX13D11UWB004.ant.amazon.com (10.43.161.90) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: [Xen-devel] [PATCH v14 2/5] xenbus/backend: Protect xenbus callback
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
Cc: konrad.wilk@oracle.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KCkEgZHJpdmVyJ3MgJ3JlY2xh
aW1fbWVtb3J5JyBjYWxsYmFjayBjYW4gcmFjZSB3aXRoICdwcm9iZScgb3IgJ3JlbW92ZScKYmVj
YXVzZSBpdCB3aWxsIGJlIGNhbGxlZCB3aGVuZXZlciBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0ZWN0
ZWQuICBUbwphdm9pZCBzdWNoIHJhY2UsIHRoaXMgY29tbWl0IGVtYmVkcyBhIHNwaW5sb2NrIGlu
IGVhY2ggJ3hlbmJ1c19kZXZpY2UnCmFuZCBtYWtlICd4ZW5idXMnIHRvIGhvbGQgdGhlIGxvY2sg
d2hpbGUgdGhlIGNvcnJlc3BvbmRlZCBjYWxsYmFja3MgYXJlCnJ1bm5pbmcuCgpSZXZpZXdlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5OiBTZW9uZ0ph
ZSBQYXJrIDxzanBhcmtAYW1hem9uLmRlPgotLS0KIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNf
cHJvYmUuYyAgICAgICAgIHwgIDggKysrKysrKy0KIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNf
cHJvYmVfYmFja2VuZC5jIHwgMTAgKysrKysrKystLQogaW5jbHVkZS94ZW4veGVuYnVzLmggICAg
ICAgICAgICAgICAgICAgICAgfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1
c19wcm9iZS5jIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jCmluZGV4IDM3ODQ4
NmI3OWY5Ni4uNjY5NzVkYTRmM2I2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVu
YnVzX3Byb2JlLmMKKysrIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jCkBAIC0y
MzksNyArMjM5LDkgQEAgaW50IHhlbmJ1c19kZXZfcHJvYmUoc3RydWN0IGRldmljZSAqX2RldikK
IAkJZ290byBmYWlsOwogCX0KIAorCXNwaW5fbG9jaygmZGV2LT5yZWNsYWltX2xvY2spOwogCWVy
ciA9IGRydi0+cHJvYmUoZGV2LCBpZCk7CisJc3Bpbl91bmxvY2soJmRldi0+cmVjbGFpbV9sb2Nr
KTsKIAlpZiAoZXJyKQogCQlnb3RvIGZhaWxfcHV0OwogCkBAIC0yNjgsOCArMjcwLDExIEBAIGlu
dCB4ZW5idXNfZGV2X3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpfZGV2KQogCiAJZnJlZV9vdGhlcmVu
ZF93YXRjaChkZXYpOwogCi0JaWYgKGRydi0+cmVtb3ZlKQorCWlmIChkcnYtPnJlbW92ZSkgewor
CQlzcGluX2xvY2soJmRldi0+cmVjbGFpbV9sb2NrKTsKIAkJZHJ2LT5yZW1vdmUoZGV2KTsKKwkJ
c3Bpbl91bmxvY2soJmRldi0+cmVjbGFpbV9sb2NrKTsKKwl9CiAKIAltb2R1bGVfcHV0KGRydi0+
ZHJpdmVyLm93bmVyKTsKIApAQCAtNDY4LDYgKzQ3Myw3IEBAIGludCB4ZW5idXNfcHJvYmVfbm9k
ZShzdHJ1Y3QgeGVuX2J1c190eXBlICpidXMsCiAJCWdvdG8gZmFpbDsKIAogCWRldl9zZXRfbmFt
ZSgmeGVuZGV2LT5kZXYsICIlcyIsIGRldm5hbWUpOworCXNwaW5fbG9ja19pbml0KCZ4ZW5kZXYt
PnJlY2xhaW1fbG9jayk7CiAKIAkvKiBSZWdpc3RlciB3aXRoIGdlbmVyaWMgZGV2aWNlIGZyYW1l
d29yay4gKi8KIAllcnIgPSBkZXZpY2VfcmVnaXN0ZXIoJnhlbmRldi0+ZGV2KTsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jIGIvZHJpdmVycy94
ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMKaW5kZXggM2I1Y2I3YTVhN2U0Li43OTFm
NmZlMDFlOTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFj
a2VuZC5jCisrKyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jCkBA
IC0yNTAsMTIgKzI1MCwxOCBAQCBzdGF0aWMgaW50IGJhY2tlbmRfcHJvYmVfYW5kX3dhdGNoKHN0
cnVjdCBub3RpZmllcl9ibG9jayAqbm90aWZpZXIsCiBzdGF0aWMgaW50IGJhY2tlbmRfcmVjbGFp
bV9tZW1vcnkoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQogewogCWNvbnN0IHN0cnVj
dCB4ZW5idXNfZHJpdmVyICpkcnY7CisJc3RydWN0IHhlbmJ1c19kZXZpY2UgKnhkZXY7CiAKIAlp
ZiAoIWRldi0+ZHJpdmVyKQogCQlyZXR1cm4gMDsKIAlkcnYgPSB0b194ZW5idXNfZHJpdmVyKGRl
di0+ZHJpdmVyKTsKLQlpZiAoZHJ2ICYmIGRydi0+cmVjbGFpbV9tZW1vcnkpCi0JCWRydi0+cmVj
bGFpbV9tZW1vcnkodG9feGVuYnVzX2RldmljZShkZXYpKTsKKwlpZiAoZHJ2ICYmIGRydi0+cmVj
bGFpbV9tZW1vcnkpIHsKKwkJeGRldiA9IHRvX3hlbmJ1c19kZXZpY2UoZGV2KTsKKwkJaWYgKCFz
cGluX3RyeWxvY2soJnhkZXYtPnJlY2xhaW1fbG9jaykpCisJCQlyZXR1cm4gMDsKKwkJZHJ2LT5y
ZWNsYWltX21lbW9yeSh4ZGV2KTsKKwkJc3Bpbl91bmxvY2soJnhkZXYtPnJlY2xhaW1fbG9jayk7
CisJfQogCXJldHVybiAwOwogfQogCmRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94ZW5idXMuaCBi
L2luY2x1ZGUveGVuL3hlbmJ1cy5oCmluZGV4IDk4MDk1MmVhNDUyYi4uODlhODg5NTg1YmEwIDEw
MDY0NAotLS0gYS9pbmNsdWRlL3hlbi94ZW5idXMuaAorKysgYi9pbmNsdWRlL3hlbi94ZW5idXMu
aApAQCAtNzYsNiArNzYsNyBAQCBzdHJ1Y3QgeGVuYnVzX2RldmljZSB7CiAJZW51bSB4ZW5idXNf
c3RhdGUgc3RhdGU7CiAJc3RydWN0IGNvbXBsZXRpb24gZG93bjsKIAlzdHJ1Y3Qgd29ya19zdHJ1
Y3Qgd29yazsKKwlzcGlubG9ja190IHJlY2xhaW1fbG9jazsKIH07CiAKIHN0YXRpYyBpbmxpbmUg
c3RydWN0IHhlbmJ1c19kZXZpY2UgKnRvX3hlbmJ1c19kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2
KQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
