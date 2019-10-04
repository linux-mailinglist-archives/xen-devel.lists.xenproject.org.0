Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8F9CC108
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 18:46:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGQfM-0002z5-9C; Fri, 04 Oct 2019 16:42:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEoo=X5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iGQfK-0002z0-90
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 16:42:50 +0000
X-Inumbo-ID: fffd7842-e6c5-11e9-80e3-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id fffd7842-e6c5-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 16:42:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98DBC15AB;
 Fri,  4 Oct 2019 09:42:48 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBFC73F68E;
 Fri,  4 Oct 2019 09:42:47 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  4 Oct 2019 17:42:43 +0100
Message-Id: <20191004164243.30822-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13] xen/xsm: flask: Prevent NULL deference
 in flask_assign_{, dt}device()
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
Cc: jgross@suse.com, Julien Grall <julien.grall@arm.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, paul@xen.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Zmxhc2tfYXNzaWduX3ssIGR0fWRldmljZSgpIG1heSBiZSB1c2VkIHRvIGNoZWNrIHdoZXRoZXIg
eW91IGNhbiB0ZXN0IGlmCmEgZGV2aWNlIGlzIGFzc2lnbmVkLiBJbiB0aGlzIGNhc2UsIHRoZSBk
b21haW4gd2lsbCBiZSBOVUxMLgoKSG93ZXZlciwgZmxhc2tfaW9tbXVfcmVzb3VyY2VfdXNlX3Bl
cm0oKSB3aWxsIGJlIGNhbGxlZCBhbmQgbWF5IGVuZCB1cAp0byBkZWZlcmVuY2UgYSBOVUxMIHBv
aW50ZXIuIFRoaXMgY2FuIGJlIHByZXZlbnRlZCBieSBtb3ZpbmcgdGhlIGNhbGwKYWZ0ZXIgd2Ug
Y2hlY2sgdGhlIHZhbGlkaXR5IGZvciB0aGUgZG9tYWluIHBvaW50ZXIuCgpDb3Zlcml0eS1JRDog
MTQ4Njc0MQpGaXhlczogNzFlNjE3YTZiOCAoJ3VzZSBpc19pb21tdV9lbmFibGVkKCkgd2hlcmUg
YXBwcm9wcmlhdGUuLi4nKQpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgotLS0KIHhlbi94c20vZmxhc2svaG9va3MuYyB8IDggKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL3hzbS9mbGFzay9ob29rcy5jIGIveGVuL3hzbS9mbGFzay9ob29rcy5jCmluZGV4IDNiMzA4
Mjc3NjQuLmNmN2YyNWNkYTIgMTAwNjQ0Ci0tLSBhL3hlbi94c20vZmxhc2svaG9va3MuYworKysg
Yi94ZW4veHNtL2ZsYXNrL2hvb2tzLmMKQEAgLTEyOTYsMTEgKzEyOTYsMTMgQEAgc3RhdGljIGlu
dCBmbGFza19hc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90IG1hY2hpbmVf
YmRmKQogICAgIHUzMiBkc2lkLCByc2lkOwogICAgIGludCByYyA9IC1FUEVSTTsKICAgICBzdHJ1
Y3QgYXZjX2F1ZGl0X2RhdGEgYWQ7Ci0gICAgdTMyIGRwZXJtID0gZmxhc2tfaW9tbXVfcmVzb3Vy
Y2VfdXNlX3Blcm0oZCk7CisgICAgdTMyIGRwZXJtOwogCiAgICAgaWYgKCAhZCApCiAgICAgICAg
IHJldHVybiBmbGFza190ZXN0X2Fzc2lnbl9kZXZpY2UobWFjaGluZV9iZGYpOwogCisgICAgZHBl
cm0gPSBmbGFza19pb21tdV9yZXNvdXJjZV91c2VfcGVybShkKTsKKwogICAgIHJjID0gY3VycmVu
dF9oYXNfcGVybShkLCBTRUNDTEFTU19SRVNPVVJDRSwgUkVTT1VSQ0VfX0FERCk7CiAgICAgaWYg
KCByYyApCiAgICAgICAgIHJldHVybiByYzsKQEAgLTEzNTUsMTEgKzEzNTcsMTMgQEAgc3RhdGlj
IGludCBmbGFza19hc3NpZ25fZHRkZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgY29uc3QgY2hhciAq
ZHRwYXRoKQogICAgIHUzMiBkc2lkLCByc2lkOwogICAgIGludCByYyA9IC1FUEVSTTsKICAgICBz
dHJ1Y3QgYXZjX2F1ZGl0X2RhdGEgYWQ7Ci0gICAgdTMyIGRwZXJtID0gZmxhc2tfaW9tbXVfcmVz
b3VyY2VfdXNlX3Blcm0oZCk7CisgICAgdTMyIGRwZXJtOwogCiAgICAgaWYgKCAhZCApCiAgICAg
ICAgIHJldHVybiBmbGFza190ZXN0X2Fzc2lnbl9kdGRldmljZShkdHBhdGgpOwogCisgICAgZHBl
cm0gPSBmbGFza19pb21tdV9yZXNvdXJjZV91c2VfcGVybShkKTsKKwogICAgIHJjID0gY3VycmVu
dF9oYXNfcGVybShkLCBTRUNDTEFTU19SRVNPVVJDRSwgUkVTT1VSQ0VfX0FERCk7CiAgICAgaWYg
KCByYyApCiAgICAgICAgIHJldHVybiByYzsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
