Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3AD118666
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 12:36:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iedmj-00069c-Pr; Tue, 10 Dec 2019 11:34:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ERUJ=2A=amazon.com=prvs=2402c4381=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iedmi-00069N-I4
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 11:34:32 +0000
X-Inumbo-ID: 08799988-1b41-11ea-8925-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08799988-1b41-11ea-8925-12813bfff9fa;
 Tue, 10 Dec 2019 11:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575977673; x=1607513673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nJN0wSFtdOZDYjIZyP04UHN4GCv/sSLr82yiruvNA8s=;
 b=TOCRvsH6ZQWZbwyQfDzP2HkHbzfmCbHAOgwgCpX5yAdoC3j1QbaqwTR2
 vhOQUzc3/gP9y4SchK/+1pTGA2kiI9cEEoAwiaxdY9cv/tjEpEgb7dw0P
 TPmcmEBXegZQfTmxlcPZyG1ERsp/zp0CGSs1YIzm/d3BreKD8D6emsx1c 0=;
IronPort-SDR: v9HAsxUvYmEiTpVmKIHL6RlIhHRXGh0KROqBNNZAN+n39/I6tRV+5fSJgtDts5HUSYayq9NVAY
 7jAdk/ztpExw==
X-IronPort-AV: E=Sophos;i="5.69,299,1571702400"; d="scan'208";a="12635017"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 10 Dec 2019 11:34:13 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id 05FA3A1F60; Tue, 10 Dec 2019 11:34:10 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 11:34:10 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 11:34:09 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 10 Dec 2019 11:34:08 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 10 Dec 2019 11:33:45 +0000
Message-ID: <20191210113347.3404-3-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210113347.3404-1-pdurrant@amazon.com>
References: <20191210113347.3404-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 2/4] xenbus: limit when state is forced to
 closed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgYSBkcml2ZXIgcHJvYmUoKSBmYWlscyB0aGVuIGxlYXZlIHRoZSB4ZW5zdG9yZSBzdGF0ZSBh
bG9uZS4gVGhlcmUgaXMgbm8KcmVhc29uIHRvIG1vZGlmeSBpdCBhcyB0aGUgZmFpbHVyZSBtYXkg
YmUgZHVlIHRvIHRyYW5zaWVudCByZXNvdXJjZQphbGxvY2F0aW9uIGlzc3VlcyBhbmQgaGVuY2Ug
YSBzdWJzZXF1ZW50IHByb2JlKCkgbWF5IHN1Y2NlZWQuCgpJZiB0aGUgZHJpdmVyIHN1cHBvcnRz
IHJlLWJpbmRpbmcgdGhlbiBvbmx5IGZvcmNlIHN0YXRlIHRvIGNsb3NlZCBkdXJpbmcKcmVtb3Zl
KCkgb25seSBpbiB0aGUgY2FzZSB3aGVuIHRoZSB0b29sc3RhY2sgbWF5IG5lZWQgdG8gY2xlYW4g
dXAuIFRoaXMgY2FuCmJlIGRldGVjdGVkIGJ5IGNoZWNraW5nIHdoZXRoZXIgdGhlIHN0YXRlIGlu
IHhlbnN0b3JlIGhhcyBiZWVuIHNldCB0bwpjbG9zaW5nIHByaW9yIHRvIGRldmljZSByZW1vdmFs
LgoKTk9URTogUmUtYmluZCBzdXBwb3J0IGlzIGluZGljYXRlZCBieSBuZXcgYm9vbGVhbiBpbiBz
dHJ1Y3QgeGVuYnVzX2RyaXZlciwKICAgICAgd2hpY2ggZGVmYXVsdHMgdG8gZmFsc2UuIFN1YnNl
cXVlbnQgcGF0Y2hlcyB3aWxsIGFkZCBzdXBwb3J0IHRvCiAgICAgIHNvbWUgYmFja2VuZCBkcml2
ZXJzLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgot
LS0KQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgp2MjoKIC0gSW50cm9kdWNlIHRoZSAnYWxsb3dfcmViaW5k
JyBmbGFnCiAtIEV4cGFuZCB0aGUgY29tbWl0IGNvbW1lbnQKLS0tCiBkcml2ZXJzL3hlbi94ZW5i
dXMveGVuYnVzX3Byb2JlLmMgfCAxMiArKysrKysrKysrLS0KIGluY2x1ZGUveGVuL3hlbmJ1cy5o
ICAgICAgICAgICAgICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3By
b2JlLmMgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKaW5kZXggYTEwMzExYzM0
OGI5Li45MzAzZmYzNWIyYmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNf
cHJvYmUuYworKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKQEAgLTI1NSw3
ICsyNTUsNiBAQCBpbnQgeGVuYnVzX2Rldl9wcm9iZShzdHJ1Y3QgZGV2aWNlICpfZGV2KQogCW1v
ZHVsZV9wdXQoZHJ2LT5kcml2ZXIub3duZXIpOwogZmFpbDoKIAl4ZW5idXNfZGV2X2Vycm9yKGRl
diwgZXJyLCAieGVuYnVzX2Rldl9wcm9iZSBvbiAlcyIsIGRldi0+bm9kZW5hbWUpOwotCXhlbmJ1
c19zd2l0Y2hfc3RhdGUoZGV2LCBYZW5idXNTdGF0ZUNsb3NlZCk7CiAJcmV0dXJuIGVycjsKIH0K
IEVYUE9SVF9TWU1CT0xfR1BMKHhlbmJ1c19kZXZfcHJvYmUpOwpAQCAtMjc2LDcgKzI3NSwxNiBA
QCBpbnQgeGVuYnVzX2Rldl9yZW1vdmUoc3RydWN0IGRldmljZSAqX2RldikKIAogCWZyZWVfb3Ro
ZXJlbmRfZGV0YWlscyhkZXYpOwogCi0JeGVuYnVzX3N3aXRjaF9zdGF0ZShkZXYsIFhlbmJ1c1N0
YXRlQ2xvc2VkKTsKKwkvKgorCSAqIElmIHRoZSB0b29sc3RhY2sgaGFzIGZvcmNlZCB0aGUgZGV2
aWNlIHN0YXRlIHRvIGNsb3NpbmcgdGhlbiBzZXQKKwkgKiB0aGUgc3RhdGUgdG8gY2xvc2VkIG5v
dyB0byBhbGxvdyBpdCB0byBiZSBjbGVhbmVkIHVwLgorCSAqIFNpbWlsYXJseSwgaWYgdGhlIGRy
aXZlciBkb2VzIG5vdCBzdXBwb3J0IHJlLWJpbmQsIHNldCB0aGUKKwkgKiBjbG9zZWQuCisJICov
CisJaWYgKCFkcnYtPmFsbG93X3JlYmluZCB8fAorCSAgICB4ZW5idXNfcmVhZF9kcml2ZXJfc3Rh
dGUoZGV2LT5ub2RlbmFtZSkgPT0gWGVuYnVzU3RhdGVDbG9zaW5nKQorCQl4ZW5idXNfc3dpdGNo
X3N0YXRlKGRldiwgWGVuYnVzU3RhdGVDbG9zZWQpOworCiAJcmV0dXJuIDA7CiB9CiBFWFBPUlRf
U1lNQk9MX0dQTCh4ZW5idXNfZGV2X3JlbW92ZSk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94
ZW5idXMuaCBiL2luY2x1ZGUveGVuL3hlbmJ1cy5oCmluZGV4IDg2OWM4MTZkNWY4Yy4uMjQyMjhh
MTAyMTQxIDEwMDY0NAotLS0gYS9pbmNsdWRlL3hlbi94ZW5idXMuaAorKysgYi9pbmNsdWRlL3hl
bi94ZW5idXMuaApAQCAtOTMsNiArOTMsNyBAQCBzdHJ1Y3QgeGVuYnVzX2RldmljZV9pZAogc3Ry
dWN0IHhlbmJ1c19kcml2ZXIgewogCWNvbnN0IGNoYXIgKm5hbWU7ICAgICAgIC8qIGRlZmF1bHRz
IHRvIGlkc1swXS5kZXZpY2V0eXBlICovCiAJY29uc3Qgc3RydWN0IHhlbmJ1c19kZXZpY2VfaWQg
KmlkczsKKwlib29sIGFsbG93X3JlYmluZDsgLyogYXZvaWQgc2V0dGluZyB4ZW5zdG9yZSBjbG9z
ZWQgZHVyaW5nIHJlbW92ZSAqLwogCWludCAoKnByb2JlKShzdHJ1Y3QgeGVuYnVzX2RldmljZSAq
ZGV2LAogCQkgICAgIGNvbnN0IHN0cnVjdCB4ZW5idXNfZGV2aWNlX2lkICppZCk7CiAJdm9pZCAo
Km90aGVyZW5kX2NoYW5nZWQpKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsCi0tIAoyLjIwLjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
