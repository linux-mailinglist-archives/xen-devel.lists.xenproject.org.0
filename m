Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48932148B50
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 16:33:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv0wD-00074d-Ik; Fri, 24 Jan 2020 15:32:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9iSm=3N=amazon.co.uk=prvs=28596b9bb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iv0wB-00073l-OA
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 15:31:59 +0000
X-Inumbo-ID: a5a1f8bb-3ebe-11ea-8032-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5a1f8bb-3ebe-11ea-8032-12813bfff9fa;
 Fri, 24 Jan 2020 15:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579879915; x=1611415915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ahbKDvUHG0beABwkwLlarH9Not4uFWdN3xL+SF4P2bA=;
 b=MwhCW9ANh6wiqHMD/7U2H4t1JY9rXausShm4hiZ442GQWjUiSaUtyl1Q
 C47LMIS3+USqmRal+X53ADxVzTPO6PDorHmENLPiepgn2PNBmTm3Ib0ZE
 dVD2I0rKOMuLjGk3jF0oosKbUxVEAutODdfg9LjUzJyOKsWA3I7nEkCJk E=;
IronPort-SDR: nkR1m4H4lo/gvQus4d4RLEEkCjsqV+LyHkJy3QouOoHEZZU+yrAa47EZf/q69y/qEc+OpuWEV9
 NnnM0UMJFpVA==
X-IronPort-AV: E=Sophos;i="5.70,358,1574121600"; d="scan'208";a="22196949"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 24 Jan 2020 15:31:44 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS
 id 08678A21B6; Fri, 24 Jan 2020 15:31:42 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 24 Jan 2020 15:31:32 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 24 Jan 2020 15:31:30 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 24 Jan 2020 15:31:27 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 24 Jan 2020 15:31:03 +0000
Message-ID: <20200124153103.18321-8-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124153103.18321-1-pdurrant@amazon.com>
References: <20200124153103.18321-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 7/7] mm: remove donate_page()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmdW5jdGlvbiBhcHBlYXJzIHRvIGhhdmUgbm8gY2FsbGVycy4KClNpZ25lZC1vZmYtYnk6
IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KLS0tCkNjOiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPgpDYzogVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29t
PgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3Jn
ZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpD
YzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Cgp2NDoKIC0gTmV3IGluIHY0Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgICAg
fCAgNiAtLS0tLS0KIHhlbi9hcmNoL3g4Ni9tbS5jICAgIHwgNDEgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9tbS5oIHwgIDIgLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgNDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCA0ZDZjOTcxZjM3Li43MjcxMDdlZWZhIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAt
MTM1MywxMiArMTM1Myw2IEBAIHZvaWQgYXJjaF9kdW1wX3NoYXJlZF9tZW1faW5mbyh2b2lkKQog
ewogfQogCi1pbnQgZG9uYXRlX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBhZ2VfaW5m
byAqcGFnZSwgdW5zaWduZWQgaW50IG1lbWZsYWdzKQotewotICAgIEFTU0VSVF9VTlJFQUNIQUJM
RSgpOwotICAgIHJldHVybiAtRU5PU1lTOwotfQotCiBpbnQgc3RlYWxfcGFnZSgKICAgICBzdHJ1
Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLCB1bnNpZ25lZCBpbnQgbWVtZmxh
Z3MpCiB7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5j
CmluZGV4IDJhNmQyZThhZjkuLjY3MzUxNzk4YzcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC00MTc0LDQ3ICs0MTc0LDYgQEAgbG9uZyBk
b19tbXVfdXBkYXRlKAogfQogI2VuZGlmIC8qIENPTkZJR19QViAqLwogCi1pbnQgZG9uYXRlX3Bh
Z2UoCi0gICAgc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwgdW5zaWdu
ZWQgaW50IG1lbWZsYWdzKQotewotICAgIGNvbnN0IHN0cnVjdCBkb21haW4gKm93bmVyID0gZG9t
X3hlbjsKLQotICAgIHNwaW5fbG9jaygmZC0+cGFnZV9hbGxvY19sb2NrKTsKLQotICAgIGlmICgg
aXNfeGVuX2hlYXBfcGFnZShwYWdlKSB8fCAoKG93bmVyID0gcGFnZV9nZXRfb3duZXIocGFnZSkp
ICE9IE5VTEwpICkKLSAgICAgICAgZ290byBmYWlsOwotCi0gICAgaWYgKCBkLT5pc19keWluZyAp
Ci0gICAgICAgIGdvdG8gZmFpbDsKLQotICAgIGlmICggcGFnZS0+Y291bnRfaW5mbyAmIH4oUEdD
X2FsbG9jYXRlZCB8IDEpICkKLSAgICAgICAgZ290byBmYWlsOwotCi0gICAgaWYgKCAhKG1lbWZs
YWdzICYgTUVNRl9ub19yZWZjb3VudCkgKQotICAgIHsKLSAgICAgICAgaWYgKCBkLT50b3RfcGFn
ZXMgPj0gZC0+bWF4X3BhZ2VzICkKLSAgICAgICAgICAgIGdvdG8gZmFpbDsKLSAgICAgICAgaWYg
KCB1bmxpa2VseShkb21haW5fYWRqdXN0X3RvdF9wYWdlcyhkLCAxKSA9PSAxKSApCi0gICAgICAg
ICAgICBnZXRfa25vd25hbGl2ZV9kb21haW4oZCk7Ci0gICAgfQotCi0gICAgcGFnZS0+Y291bnRf
aW5mbyA9IFBHQ19hbGxvY2F0ZWQgfCAxOwotICAgIHBhZ2Vfc2V0X293bmVyKHBhZ2UsIGQpOwot
ICAgIHBhZ2VfbGlzdF9hZGRfdGFpbChwYWdlLCZkLT5wYWdlX2xpc3QpOwotCi0gICAgc3Bpbl91
bmxvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7Ci0gICAgcmV0dXJuIDA7Ci0KLSBmYWlsOgotICAg
IHNwaW5fdW5sb2NrKCZkLT5wYWdlX2FsbG9jX2xvY2spOwotICAgIGdkcHJpbnRrKFhFTkxPR19X
QVJOSU5HLCAiQmFkIGRvbmF0ZSBtZm4gJSIgUFJJX21mbgotICAgICAgICAgICAgICIgdG8gZCVk
IChvd25lciBkJWQpIGNhZj0lMDhseCB0YWY9JSIgUFJ0eXBlX2luZm8gIlxuIiwKLSAgICAgICAg
ICAgICBtZm5feChwYWdlX3RvX21mbihwYWdlKSksIGQtPmRvbWFpbl9pZCwKLSAgICAgICAgICAg
ICBvd25lciA/IG93bmVyLT5kb21haW5faWQgOiBET01JRF9JTlZBTElELAotICAgICAgICAgICAg
IHBhZ2UtPmNvdW50X2luZm8sIHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvKTsKLSAgICByZXR1cm4g
LUVJTlZBTDsKLX0KLQogLyoKICAqIFN0ZWFsIHBhZ2Ugd2lsbCBhdHRlbXB0IHRvIHJlbW92ZSBg
cGFnZWAgZnJvbSBkb21haW4gYGRgLiAgVXBvbgogICogcmV0dXJuLCBgcGFnZWAgd2lsbCBiZSBp
biBhIHN0YXRlIHNpbWlsYXIgdG8gdGhlIHN0YXRlIG9mIGEgcGFnZQpkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUveGVuL21tLmggYi94ZW4vaW5jbHVkZS94ZW4vbW0uaAppbmRleCA4ZDBkZGZiNjBj
Li5kMGQwOTVkOWM3IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vbW0uaAorKysgYi94ZW4v
aW5jbHVkZS94ZW4vbW0uaApAQCAtNTk5LDggKzU5OSw2IEBAIGludCB4ZW5tZW1fYWRkX3RvX3Bo
eXNtYXAoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHhlbl9hZGRfdG9fcGh5c21hcCAqeGF0cCwK
IGludCBfX211c3RfY2hlY2sgZ3Vlc3RfcmVtb3ZlX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5z
aWduZWQgbG9uZyBnbWZuKTsKIGludCBfX211c3RfY2hlY2sgc3RlYWxfcGFnZShzdHJ1Y3QgZG9t
YWluICpkLCBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBtZW1mbGFncyk7Ci1pbnQgX19tdXN0X2NoZWNrIGRvbmF0ZV9wYWdl
KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UsCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtZW1mbGFncyk7CiAKICNkZWZpbmUgUkFNX1RZ
UEVfQ09OVkVOVElPTkFMIDB4MDAwMDAwMDEKICNkZWZpbmUgUkFNX1RZUEVfUkVTRVJWRUQgICAg
IDB4MDAwMDAwMDIKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
