Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09B5B38FE
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 13:06:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9oo6-0006CK-Hq; Mon, 16 Sep 2019 11:04:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GGTU=XL=amazon.de=prvs=1553567f6=wipawel@srs-us1.protection.inumbo.net>)
 id 1i9oo3-000676-1l
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 11:04:31 +0000
X-Inumbo-ID: c16b33ce-d871-11e9-b299-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c16b33ce-d871-11e9-b299-bc764e2007e4;
 Mon, 16 Sep 2019 11:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568631870; x=1600167870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=geUr5mAGZ/UsPFD/COUuS7ZfJw9HeGeE2i2aOXz2XsU=;
 b=LBxMKCirwKcrrmI7yCgLDNzAYv9fBSJ8J3eNSqBS5U82TTC3pb25N8MW
 1ewXGxD1oPYFAi+iLpONiD14Kl8Y/469Qd+YnasyHSDwfbmMXADcriM/N
 H7Hp6ZLTqdVs5R0mK1oUE4C4LzKvhkv+qNBD5oQUSuL/KHQbQMXzV0Zjm A=;
X-IronPort-AV: E=Sophos;i="5.64,512,1559520000"; d="scan'208";a="702597611"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 16 Sep 2019 11:04:10 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id CE58BA1D9A; Mon, 16 Sep 2019 11:04:05 +0000 (UTC)
Received: from EX13D05EUC002.ant.amazon.com (10.43.164.231) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:03:50 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D05EUC002.ant.amazon.com (10.43.164.231) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:03:49 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 16 Sep 2019 11:03:48 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Mon, 16 Sep 2019 10:59:42 +0000
Message-ID: <20190916105945.93632-10-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190916105945.93632-1-wipawel@amazon.de>
References: <20190916105945.93632-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 09/12] livepatch: Add support for modules
 .modinfo section metadata
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>, wipawel@amazon.com, Ross
 Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGF2aW5nIGRldGFpbGVkIGhvdHBhdGNoIG1ldGFkYXRhIGhlbHBzIHRvIHByb3Blcmx5IGlkZW50
aWZ5IG1vZHVsZSdzCm9yaWdpbiBhbmQgdmVyc2lvbi4gSXQgYWxzbyBhbGxvd3MgdG8ga2VlcCB0
cmFjayBvZiB0aGUgaGlzdG9yeSBvZgpob3RwYXRjaCBsb2FkcyBpbiB0aGUgc3lzdGVtIChhdCBs
ZWFzdCB3aXRoaW4gZG1lc2cgYnVmZmVyIHNpemUKbGltaXRzKS4KClRoZSBob3RwYXRjaCBtZXRh
ZGF0YSBhcmUgZW1iZWRkZWQgaW4gYSBmb3JtIG9mIC5tb2RpbmZvIHNlY3Rpb24uCkVhY2ggc3Vj
aCBzZWN0aW9uIGNvbnRhaW5zIGRhdGEgb2YgdGhlIGZvbGxvd2luZyBmb3JtYXQ6CmtleT12YWx1
ZVwwa2V5PXZhbHVlXDAuLi5rZXk9dmFsdWVcMAoKVGhlIC5tb2RpbmZvIHNlY3Rpb24gbWF5IGJl
IGdlbmVyYXRlZCBhbmQgYXBwZW5kZWQgdG8gdGhlIHJlc3VsdGluZwpob3RwYXRjaCBFTEYgZmls
ZSBvcHRpb25hbGx5IGFzIGFuIGV4dHJhIHN0ZXAgb2YgYSBoaWdoZXIgbGV2ZWwKaG90cGF0Y2gg
YnVpbGQgc3lzdGVtLgoKVGhlIG1ldGFkYXRhIHNlY3Rpb24gcG9pbnRlciBhbmQgdGhlIHNlY3Rp
b24gbGVuZ3RoIGlzIHN0b3JlZCBpbiB0aGUKaG90cGF0Y2ggcGF5bG9hZCBzdHJ1Y3R1cmUgYW5k
IGlzIHVzZWQgdG8gZGlzcGxheSB0aGUgY29udGVudCB1cG9uCmhvdHBhdGNoIGFwcGx5IG9wZXJh
dGlvbi4KClNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpv
bi5kZT4KUmV2aWV3ZWQtYnk6IEFuZHJhLUlyaW5hIFBhcmFzY2hpdiA8YW5kcmFwcnNAYW1hem9u
LmNvbT4KUmV2aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+ClJldmll
d2VkLWJ5OiBMZW9uYXJkIEZvZXJzdGVyIDxmb2Vyc2xlb0BhbWF6b24uZGU+ClJldmlld2VkLWJ5
OiBNYXJ0aW4gUG9obGFjayA8bXBvaGxhY2tAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogTm9yYmVy
dCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+ClNpZ25lZC1vZmYtYnk6IEtvbnJhZCBSemVz
enV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KLS0tCkNoYW5nZWQgc2luY2UgdjI6
CiAgKiBBZGRlZCAubW9kaW5mbyB0ZXN0cyAoS29ucmFkKQoKIHhlbi9jb21tb24vbGl2ZXBhdGNo
LmMgICAgICAgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
eGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaF9wYXlsb2FkLmggfCAgNiArKysrKysKIHhlbi90ZXN0
L2xpdmVwYXRjaC9NYWtlZmlsZSAgICAgICAgIHwgMTAgKysrKysrKysrLQogMyBmaWxlcyBjaGFu
Z2VkLCA0OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi9saXZlcGF0Y2guYyBiL3hlbi9jb21tb24vbGl2ZXBhdGNoLmMKaW5kZXggMzAyYWNkMzAx
NS4uMTg5MzVmNjA4YyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9saXZlcGF0Y2guYworKysgYi94
ZW4vY29tbW9uL2xpdmVwYXRjaC5jCkBAIC04NTMsNiArODUzLDIzIEBAIHN0YXRpYyBpbnQgcHJl
cGFyZV9wYXlsb2FkKHN0cnVjdCBwYXlsb2FkICpwYXlsb2FkLAogI2VuZGlmCiAgICAgfQogCisg
ICAgc2VjID0gbGl2ZXBhdGNoX2VsZl9zZWNfYnlfbmFtZShlbGYsICIubW9kaW5mbyIpOworICAg
IGlmICggc2VjICkKKyAgICB7CisgICAgICAgIGlmICggIXNlY3Rpb25fb2soZWxmLCBzZWMsIHNp
emVvZigqcGF5bG9hZC0+bWV0YWRhdGEuZGF0YSkpICkKKyAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOworCisgICAgICAgIHBheWxvYWQtPm1ldGFkYXRhLmRhdGEgPSBzZWMtPmxvYWRfYWRkcjsK
KyAgICAgICAgcGF5bG9hZC0+bWV0YWRhdGEubGVuID0gc2VjLT5zZWMtPnNoX3NpemU7CisKKyAg
ICAgICAgLyogVGhlIG1ldGFkYXRhIGlzIHJlcXVpcmVkIHRvIGNvbnNpc3RzIG9mIG51bGwgdGVy
bWluYXRlZCBzdHJpbmdzLiAqLworICAgICAgICBpZiAoIHBheWxvYWQtPm1ldGFkYXRhLmRhdGFb
cGF5bG9hZC0+bWV0YWRhdGEubGVuIC0gMV0gIT0gJ1wwJyApCisgICAgICAgIHsKKyAgICAgICAg
ICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6IEluY29ycmVjdCBtZXRhZGF0YSBm
b3JtYXQgZGV0ZWN0ZWRcbiIsIHBheWxvYWQtPm5hbWUpOworICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7CisgICAgICAgIH0KKyAgICB9CisKICAgICByZXR1cm4gMDsKIH0KIApAQCAtMTIwMSw2
ICsxMjE4LDE5IEBAIHN0YXRpYyBpbnQgbGl2ZXBhdGNoX2xpc3Qoc3RydWN0IHhlbl9zeXNjdGxf
bGl2ZXBhdGNoX2xpc3QgKmxpc3QpCiAgKiBmb3IgWEVOX1NZU0NUTF9MSVZFUEFUQ0hfQUNUSU9O
IG9wZXJhdGlvbiAoc2VlIGxpdmVwYXRjaF9hY3Rpb24pLgogICovCiAKK3N0YXRpYyBpbmxpbmUg
dm9pZCBsaXZlcGF0Y2hfZGlzcGxheV9tZXRhZGF0YShjb25zdCBzdHJ1Y3QgbGl2ZXBhdGNoX21l
dGFkYXRhICptZXRhZGF0YSkKK3sKKyAgICBjb25zdCBjaGFyICpzdHI7CisKKyAgICBpZiAoIG1l
dGFkYXRhICYmIG1ldGFkYXRhLT5kYXRhICYmIG1ldGFkYXRhLT5sZW4gPiAwICkKKyAgICB7Cisg
ICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyBMSVZFUEFUQ0ggIm1vZHVsZSBtZXRhZGF0YTpcbiIp
OworICAgICAgICBmb3IgKCBzdHIgPSBtZXRhZGF0YS0+ZGF0YTsgc3RyIDwgKG1ldGFkYXRhLT5k
YXRhICsgbWV0YWRhdGEtPmxlbik7IHN0ciArPSAoc3RybGVuKHN0cikgKyAxKSApCisgICAgICAg
ICAgICBwcmludGsoWEVOTE9HX0lORk8gTElWRVBBVENIICIgICVzXG4iLCBzdHIpOworICAgIH0K
KworfQorCiBzdGF0aWMgaW50IGFwcGx5X3BheWxvYWQoc3RydWN0IHBheWxvYWQgKmRhdGEpCiB7
CiAgICAgdW5zaWduZWQgaW50IGk7CkBAIC0xMjMzLDYgKzEyNjMsOCBAQCBzdGF0aWMgaW50IGFw
cGx5X3BheWxvYWQoc3RydWN0IHBheWxvYWQgKmRhdGEpCiAKICAgICBhcmNoX2xpdmVwYXRjaF9y
ZXZpdmUoKTsKIAorICAgIGxpdmVwYXRjaF9kaXNwbGF5X21ldGFkYXRhKCZkYXRhLT5tZXRhZGF0
YSk7CisKICAgICByZXR1cm4gMDsKIH0KIApAQCAtMjAwOSw2ICsyMDQxLDggQEAgc3RhdGljIHZv
aWQgbGl2ZXBhdGNoX3ByaW50YWxsKHVuc2lnbmVkIGNoYXIga2V5KQogICAgICAgICAgICAgICAg
ZGF0YS0+bmFtZSwgc3RhdGUyc3RyKGRhdGEtPnN0YXRlKSwgZGF0YS0+c3RhdGUsIGRhdGEtPnRl
eHRfYWRkciwKICAgICAgICAgICAgICAgIGRhdGEtPnJ3X2FkZHIsIGRhdGEtPnJvX2FkZHIsIGRh
dGEtPnBhZ2VzKTsKIAorICAgICAgICBsaXZlcGF0Y2hfZGlzcGxheV9tZXRhZGF0YSgmZGF0YS0+
bWV0YWRhdGEpOworCiAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgZGF0YS0+bmZ1bmNzOyBpKysg
KQogICAgICAgICB7CiAgICAgICAgICAgICBzdHJ1Y3QgbGl2ZXBhdGNoX2Z1bmMgKmYgPSAmKGRh
dGEtPmZ1bmNzW2ldKTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2hfcGF5
bG9hZC5oIGIveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaF9wYXlsb2FkLmgKaW5kZXggZmYxNmFm
MGRkNi4uOWY1ZjA2NDIwNSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaF9w
YXlsb2FkLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaF9wYXlsb2FkLmgKQEAgLTMz
LDYgKzMzLDExIEBAIHN0cnVjdCBsaXZlcGF0Y2hfaG9va3MgewogICAgIH0gYXBwbHksIHJldmVy
dDsKIH07CiAKK3N0cnVjdCBsaXZlcGF0Y2hfbWV0YWRhdGEgeworICAgIGNvbnN0IGNoYXIgKmRh
dGE7IC8qIFB0ciB0byAubW9kaW5mbyBzZWN0aW9uIHdpdGggQVNDSUkgZGF0YS4gKi8KKyAgICB1
aW50MzJfdCBsZW47ICAgICAvKiBMZW5ndGggb2YgdGhlIG1ldGFkYXRhIHNlY3Rpb24uICovCit9
OworCiBzdHJ1Y3QgcGF5bG9hZCB7CiAgICAgdWludDMyX3Qgc3RhdGU7ICAgICAgICAgICAgICAg
ICAgICAgIC8qIE9uZSBvZiB0aGUgTElWRVBBVENIX1NUQVRFXyouICovCiAgICAgaW50MzJfdCBy
YzsgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIDAgb3IgLVhFTl9FWFguICovCkBAIC02Myw2
ICs2OCw3IEBAIHN0cnVjdCBwYXlsb2FkIHsKICAgICB1bnNpZ25lZCBpbnQgbl9sb2FkX2Z1bmNz
OyAgICAgICAgICAgLyogTnIgb2YgdGhlIGZ1bmNzIHRvIGxvYWQgYW5kIGV4ZWN1dGUuICovCiAg
ICAgdW5zaWduZWQgaW50IG5fdW5sb2FkX2Z1bmNzOyAgICAgICAgIC8qIE5yIG9mIGZ1bmNzIHRv
IGNhbGwgZHVydW5nIHVubG9hZC4gKi8KICAgICBjaGFyIG5hbWVbWEVOX0xJVkVQQVRDSF9OQU1F
X1NJWkVdOyAgLyogTmFtZSBvZiBpdC4gKi8KKyAgICBzdHJ1Y3QgbGl2ZXBhdGNoX21ldGFkYXRh
IG1ldGFkYXRhOyAgLyogTW9kdWxlIG1ldGEgZGF0YSByZWNvcmQgKi8KIH07CiAKIC8qCmRpZmYg
LS1naXQgYS94ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUgYi94ZW4vdGVzdC9saXZlcGF0Y2gv
TWFrZWZpbGUKaW5kZXggYTc4NTdkM2EyZS4uM2YwODhlNzRiMiAxMDA2NDQKLS0tIGEveGVuL3Rl
c3QvbGl2ZXBhdGNoL01ha2VmaWxlCisrKyBiL3hlbi90ZXN0L2xpdmVwYXRjaC9NYWtlZmlsZQpA
QCAtNzksOSArNzksMTcgQEAgY29uZmlnLmg6IHhlbl9oZWxsb193b3JsZF9mdW5jLm8KIHhlbl9o
ZWxsb193b3JsZC5vOiBjb25maWcuaAogCiAuUEhPTlk6ICQoTElWRVBBVENIKQotJChMSVZFUEFU
Q0gpOiB4ZW5faGVsbG9fd29ybGRfZnVuYy5vIHhlbl9oZWxsb193b3JsZC5vIG5vdGUubyB4ZW5f
bm90ZS5vCiskKExJVkVQQVRDSCk6IHhlbl9oZWxsb193b3JsZF9mdW5jLm8geGVuX2hlbGxvX3dv
cmxkLm8gbm90ZS5vIHhlbl9ub3RlLm8gbW9kaW5mby5vCiAJJChMRCkgJChMREZMQUdTKSAkKGJ1
aWxkX2lkX2xpbmtlcikgLXIgLW8gJChMSVZFUEFUQ0gpICReCiAKKy5QSE9OWTogbW9kaW5mby5v
Cittb2RpbmZvLm86CisJKHNldCAtZTsgXAorCSBwcmludGYgIkxJVkVQQVRDSF9SVUxFWlwwIikg
PiAkQC5iaW4KKwkkKE9CSkNPUFkpICQoT0JKQ09QWV9NQUdJQykgXAorCQkgICAtLXJlbmFtZS1z
ZWN0aW9uPS5kYXRhPS5tb2RpbmZvLGFsbG9jLGxvYWQscmVhZG9ubHksZGF0YSxjb250ZW50cyAt
UyAkQC5iaW4gJEAKKwkjcm0gLWYgJEAuYmluCisKICMKICMgVGhpcyB0YXJnZXQgaXMgb25seSBh
Y2Nlc3NpYmxlIGlmIENPTkZJR19MSVZFUEFUQ0ggaXMgZGVmaW5lZCwgd2hpY2gKICMgZGVwZW5k
cyBvbiAkKGJ1aWxkX2lkX2xpbmtlcikgYmVpbmcgYXZhaWxhYmxlLiBIZW5jZSB3ZSBkbyBub3QK
LS0gCjIuMTYuNQoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3Jh
dXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNj
aGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90
dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIz
NyA4NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
