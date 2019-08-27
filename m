Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1D79E30D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 10:48:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2X8M-0002hM-Ac; Tue, 27 Aug 2019 08:47:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvsD=WX=amazon.de=prvs=1355b64ef=wipawel@srs-us1.protection.inumbo.net>)
 id 1i2X8K-0002fN-N6
 for xen-devel@lists.xen.org; Tue, 27 Aug 2019 08:47:20 +0000
X-Inumbo-ID: 424d7a9c-c8a7-11e9-ae2f-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 424d7a9c-c8a7-11e9-ae2f-12813bfff9fa;
 Tue, 27 Aug 2019 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566895631; x=1598431631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=PspuYjtKr/4y0IqY+AMdojgETTa2lqIWhYGlI9D9x6w=;
 b=fZQ/+SVyvAwjVllZ+3YRjKAl2tQ3QKpkYelc/lYdEa+IYe14bkNM7bBM
 yIA6dP5LbU9Ad4trkFbsLtsFCudGsViTYDUfESaWewSxJ0EamMZJHHlX8
 Ue6sSRMT5YMsbtz9vESxw+t3I7JeM9NbcOvtW9x2VZfLrwFwd21nu0vTQ 0=;
X-IronPort-AV: E=Sophos;i="5.64,436,1559520000"; d="scan'208";a="417885646"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 27 Aug 2019 08:47:10 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 48EC0A23D9; Tue, 27 Aug 2019 08:47:10 +0000 (UTC)
Received: from EX13D03EUC001.ant.amazon.com (10.43.164.245) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 27 Aug 2019 08:46:56 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D03EUC001.ant.amazon.com (10.43.164.245) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 27 Aug 2019 01:46:55 -0700
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 27 Aug 2019 08:46:53 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Tue, 27 Aug 2019 08:46:21 +0000
Message-ID: <20190827084624.116917-10-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190827084624.116917-1-wipawel@amazon.de>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 09/12] livepatch: Add support for modules
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
dCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Ci0tLQogeGVuL2NvbW1vbi9saXZlcGF0Y2gu
YyAgICAgICAgICAgICAgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB4
ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoX3BheWxvYWQuaCB8ICA2ICsrKysrKwogMiBmaWxlcyBj
aGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9saXZlcGF0
Y2guYyBiL3hlbi9jb21tb24vbGl2ZXBhdGNoLmMKaW5kZXggY2RhZTMyNDcyNC4uYTA1NmZjZWZj
YyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9saXZlcGF0Y2guYworKysgYi94ZW4vY29tbW9uL2xp
dmVwYXRjaC5jCkBAIC04NTAsNiArODUwLDIzIEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9wYXlsb2Fk
KHN0cnVjdCBwYXlsb2FkICpwYXlsb2FkLAogI2VuZGlmCiAgICAgfQogCisgICAgc2VjID0gbGl2
ZXBhdGNoX2VsZl9zZWNfYnlfbmFtZShlbGYsICIubW9kaW5mbyIpOworICAgIGlmICggc2VjICkK
KyAgICB7CisgICAgICAgIGlmICggIXNlY3Rpb25fb2soZWxmLCBzZWMsIHNpemVvZigqcGF5bG9h
ZC0+bWV0YWRhdGEuZGF0YSkpICkKKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOworCisgICAg
ICAgIHBheWxvYWQtPm1ldGFkYXRhLmRhdGEgPSBzZWMtPmxvYWRfYWRkcjsKKyAgICAgICAgcGF5
bG9hZC0+bWV0YWRhdGEubGVuID0gc2VjLT5zZWMtPnNoX3NpemU7CisKKyAgICAgICAgLyogVGhl
IG1ldGFkYXRhIGlzIHJlcXVpcmVkIHRvIGNvbnNpc3RzIG9mIG51bGwgdGVybWluYXRlZCBzdHJp
bmdzLiAqLworICAgICAgICBpZiAoIHBheWxvYWQtPm1ldGFkYXRhLmRhdGFbcGF5bG9hZC0+bWV0
YWRhdGEubGVuIC0gMV0gIT0gJ1wwJyApCisgICAgICAgIHsKKyAgICAgICAgICAgIHByaW50ayhY
RU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6IEluY29ycmVjdCBtZXRhZGF0YSBmb3JtYXQgZGV0ZWN0
ZWRcbiIsIHBheWxvYWQtPm5hbWUpOworICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisgICAg
ICAgIH0KKyAgICB9CisKICAgICByZXR1cm4gMDsKIH0KIApAQCAtMTE5OCw2ICsxMjE1LDE5IEBA
IHN0YXRpYyBpbnQgbGl2ZXBhdGNoX2xpc3Qoc3RydWN0IHhlbl9zeXNjdGxfbGl2ZXBhdGNoX2xp
c3QgKmxpc3QpCiAgKiBmb3IgWEVOX1NZU0NUTF9MSVZFUEFUQ0hfQUNUSU9OIG9wZXJhdGlvbiAo
c2VlIGxpdmVwYXRjaF9hY3Rpb24pLgogICovCiAKK3N0YXRpYyBpbmxpbmUgdm9pZCBsaXZlcGF0
Y2hfZGlzcGxheV9tZXRhZGF0YShjb25zdCBzdHJ1Y3QgbGl2ZXBhdGNoX21ldGFkYXRhICptZXRh
ZGF0YSkKK3sKKyAgICBjb25zdCBjaGFyICpzdHI7CisKKyAgICBpZiAoIG1ldGFkYXRhICYmIG1l
dGFkYXRhLT5kYXRhICYmIG1ldGFkYXRhLT5sZW4gPiAwICkKKyAgICB7CisgICAgICAgIHByaW50
ayhYRU5MT0dfSU5GTyBMSVZFUEFUQ0ggIm1vZHVsZSBtZXRhZGF0YTpcbiIpOworICAgICAgICBm
b3IgKCBzdHIgPSBtZXRhZGF0YS0+ZGF0YTsgc3RyIDwgKG1ldGFkYXRhLT5kYXRhICsgbWV0YWRh
dGEtPmxlbik7IHN0ciArPSAoc3RybGVuKHN0cikgKyAxKSApCisgICAgICAgICAgICBwcmludGso
WEVOTE9HX0lORk8gTElWRVBBVENIICIgICVzXG4iLCBzdHIpOworICAgIH0KKworfQorCiBzdGF0
aWMgaW50IGFwcGx5X3BheWxvYWQoc3RydWN0IHBheWxvYWQgKmRhdGEpCiB7CiAgICAgdW5zaWdu
ZWQgaW50IGk7CkBAIC0xMjMwLDYgKzEyNjAsOCBAQCBzdGF0aWMgaW50IGFwcGx5X3BheWxvYWQo
c3RydWN0IHBheWxvYWQgKmRhdGEpCiAKICAgICBhcmNoX2xpdmVwYXRjaF9yZXZpdmUoKTsKIAor
ICAgIGxpdmVwYXRjaF9kaXNwbGF5X21ldGFkYXRhKCZkYXRhLT5tZXRhZGF0YSk7CisKICAgICBy
ZXR1cm4gMDsKIH0KIApAQCAtMjAwNiw2ICsyMDM4LDggQEAgc3RhdGljIHZvaWQgbGl2ZXBhdGNo
X3ByaW50YWxsKHVuc2lnbmVkIGNoYXIga2V5KQogICAgICAgICAgICAgICAgZGF0YS0+bmFtZSwg
c3RhdGUyc3RyKGRhdGEtPnN0YXRlKSwgZGF0YS0+c3RhdGUsIGRhdGEtPnRleHRfYWRkciwKICAg
ICAgICAgICAgICAgIGRhdGEtPnJ3X2FkZHIsIGRhdGEtPnJvX2FkZHIsIGRhdGEtPnBhZ2VzKTsK
IAorICAgICAgICBsaXZlcGF0Y2hfZGlzcGxheV9tZXRhZGF0YSgmZGF0YS0+bWV0YWRhdGEpOwor
CiAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgZGF0YS0+bmZ1bmNzOyBpKysgKQogICAgICAgICB7
CiAgICAgICAgICAgICBzdHJ1Y3QgbGl2ZXBhdGNoX2Z1bmMgKmYgPSAmKGRhdGEtPmZ1bmNzW2ld
KTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2hfcGF5bG9hZC5oIGIveGVu
L2luY2x1ZGUveGVuL2xpdmVwYXRjaF9wYXlsb2FkLmgKaW5kZXggZmYxNmFmMGRkNi4uOWY1ZjA2
NDIwNSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaF9wYXlsb2FkLmgKKysr
IGIveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaF9wYXlsb2FkLmgKQEAgLTMzLDYgKzMzLDExIEBA
IHN0cnVjdCBsaXZlcGF0Y2hfaG9va3MgewogICAgIH0gYXBwbHksIHJldmVydDsKIH07CiAKK3N0
cnVjdCBsaXZlcGF0Y2hfbWV0YWRhdGEgeworICAgIGNvbnN0IGNoYXIgKmRhdGE7IC8qIFB0ciB0
byAubW9kaW5mbyBzZWN0aW9uIHdpdGggQVNDSUkgZGF0YS4gKi8KKyAgICB1aW50MzJfdCBsZW47
ICAgICAvKiBMZW5ndGggb2YgdGhlIG1ldGFkYXRhIHNlY3Rpb24uICovCit9OworCiBzdHJ1Y3Qg
cGF5bG9hZCB7CiAgICAgdWludDMyX3Qgc3RhdGU7ICAgICAgICAgICAgICAgICAgICAgIC8qIE9u
ZSBvZiB0aGUgTElWRVBBVENIX1NUQVRFXyouICovCiAgICAgaW50MzJfdCByYzsgICAgICAgICAg
ICAgICAgICAgICAgICAgIC8qIDAgb3IgLVhFTl9FWFguICovCkBAIC02Myw2ICs2OCw3IEBAIHN0
cnVjdCBwYXlsb2FkIHsKICAgICB1bnNpZ25lZCBpbnQgbl9sb2FkX2Z1bmNzOyAgICAgICAgICAg
LyogTnIgb2YgdGhlIGZ1bmNzIHRvIGxvYWQgYW5kIGV4ZWN1dGUuICovCiAgICAgdW5zaWduZWQg
aW50IG5fdW5sb2FkX2Z1bmNzOyAgICAgICAgIC8qIE5yIG9mIGZ1bmNzIHRvIGNhbGwgZHVydW5n
IHVubG9hZC4gKi8KICAgICBjaGFyIG5hbWVbWEVOX0xJVkVQQVRDSF9OQU1FX1NJWkVdOyAgLyog
TmFtZSBvZiBpdC4gKi8KKyAgICBzdHJ1Y3QgbGl2ZXBhdGNoX21ldGFkYXRhIG1ldGFkYXRhOyAg
LyogTW9kdWxlIG1ldGEgZGF0YSByZWNvcmQgKi8KIH07CiAKIC8qCi0tIAoyLjE2LjUKCgoKCkFt
YXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3
IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVy
YnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJC
IDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
