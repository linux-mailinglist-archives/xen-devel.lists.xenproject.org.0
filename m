Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8AC167BEB
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 12:24:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j56NG-0005Dr-Sj; Fri, 21 Feb 2020 11:21:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9FNp=4J=amazon.co.uk=prvs=313f46acb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j56NF-0005Cj-A8
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 11:21:37 +0000
X-Inumbo-ID: 52020b50-549c-11ea-8629-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52020b50-549c-11ea-8629-12813bfff9fa;
 Fri, 21 Feb 2020 11:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582284096; x=1613820096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eSWeDs33Xk0ZJ9WDOyHx4AeQnnVYfVe84mVD3fIk6pA=;
 b=uZvn8PjV2boi5FbuAJeXzETz6CtEDfRy3muLowYB18I37NCo73QnNbVN
 yZpk8sDeDnY8FVt9t1qHWTKwKmfOhDA+rKfSMcGgKMWRa1tyvDoCXrTHy
 JmlrpbLRJucP2/dP3tVSC3S7yjNptbusPhYiunjQqzeQD3/8W8VPEOL0y E=;
IronPort-SDR: 3/SpOcYpykbbwtrISJGmq1xHD+av8nsXfQzCwspUzVsDXUjPZgNe00ND03KoxBANVw39SVU1DQ
 TX/wX/luEmvw==
X-IronPort-AV: E=Sophos;i="5.70,468,1574121600"; d="scan'208";a="19025011"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 21 Feb 2020 11:21:24 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id E9C101416DD; Fri, 21 Feb 2020 11:21:22 +0000 (UTC)
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 21 Feb 2020 11:21:07 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUB004.ant.amazon.com (10.43.166.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 21 Feb 2020 11:21:06 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 21 Feb 2020 11:21:05 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Feb 2020 11:20:48 +0000
Message-ID: <20200221112049.3077-6-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200221112049.3077-1-pdurrant@amazon.com>
References: <20200221112049.3077-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v7 5/6] xl.conf: introduce 'domid_policy'
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBhZGRzIGEgbmV3IGdsb2JhbCAnZG9taWRfcG9saWN5JyBjb25maWd1cmF0aW9u
IG9wdGlvbiB0byBkZWNpZGUKaG93IGRvbWFpbiBpZCB2YWx1ZXMgYXJlIGFsbG9jYXRlZCBmb3Ig
bmV3IGRvbWFpbnMuIEl0IG1heSBiZSBzZXQgdG8gb25lIG9mCnR3byB2YWx1ZXM6CgoieGVuIiwg
dGhlIGRlZmF1bHQgdmFsdWUsIHdpbGwgY2F1c2UgYW4gaW52YWxpZCBkb21pZCB2YWx1ZSB0byBi
ZSBwYXNzZWQKdG8gZG9fZG9tYWluX2NyZWF0ZSgpIHByZXNlcnZpbmcgdGhlIGV4aXN0aW5nIGJl
aGF2aW91ciBvZiBoYXZpbmcgWGVuCmNob29zZSB0aGUgZG9taWQgdmFsdWUgZHVyaW5nIGRvbWFp
bl9jcmVhdGUoKS4KCiJyYW5kb20iIHdpbGwgY2F1c2UgdGhlIHNwZWNpYWwgUkFORE9NX0RPTUlE
IHZhbHVlIHRvIGJlIHBhc3NlZCB0bwpkb19kb21haW5fY3JlYXRlKCkgc3VjaCB0aGF0IGxpYnhs
X19kb21haW5fbWFrZSgpIHdpbGwgc2VsZWN0IGEgcmFuZG9tCmRvbWlkIHZhbHVlLgoKU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgpBY2tlZC1ieTogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQpDYzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoK
djI6CiAtIE5ldyBpbiB2MgotLS0KIGRvY3MvbWFuL3hsLmNvbmYuNS5wb2QgIHwgMTAgKysrKysr
KysrKwogdG9vbHMvZXhhbXBsZXMveGwuY29uZiAgfCAgNCArKysrCiB0b29scy94bC94bC5jICAg
ICAgICAgICB8IDEwICsrKysrKysrKysKIHRvb2xzL3hsL3hsLmggICAgICAgICAgIHwgIDEgKwog
dG9vbHMveGwveGxfdm1jb250cm9sLmMgfCAgMiArKwogNSBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZG9jcy9tYW4veGwuY29uZi41LnBvZCBiL2RvY3MvbWFu
L3hsLmNvbmYuNS5wb2QKaW5kZXggMjA3YWIzZTc3YS4uNDFlZTQyODc0NCAxMDA2NDQKLS0tIGEv
ZG9jcy9tYW4veGwuY29uZi41LnBvZAorKysgYi9kb2NzL21hbi94bC5jb25mLjUucG9kCkBAIC00
NSw2ICs0NSwxNiBAQCBUaGUgc2VtYW50aWNzIG9mIGVhY2ggQzxLRVk+IGRlZmluZXMgd2hpY2gg
Zm9ybSBvZiBDPFZBTFVFPiBpcyByZXF1aXJlZC4KIAogPW92ZXIgNAogCis9aXRlbSBCPGRvbWlk
X3BvbGljeT0ieGVuInwicmFuZG9tIj4KKworRGV0ZXJtaW5lcyBob3cgZG9tYWluLWlkIGlzIHNl
dCB3aGVuIGNyZWF0aW5nIGEgbmV3IGRvbWFpbi4KKworSWYgc2V0IHRvICJ4ZW4iIHRoZW4gdGhl
IGh5cGVydmlzb3Igd2lsbCBhbGxvY2F0ZSBuZXcgZG9tYWluLWlkIHZhbHVlcyBvbiBhIHNlcXVl
bnRpYWwgYmFzaXMuCisKK0lmIHNldCB0byAicmFuZG9tIiB0aGVuIGEgcmFuZG9tIGRvbWFpbi1p
ZCB2YWx1ZSB3aWxsIGJlIGNob3Nlbi4KKworRGVmYXVsdDogInhlbiIKKwogPWl0ZW0gQjxhdXRv
YmFsbG9vbj0ib2ZmInwib24ifCJhdXRvIj4KIAogSWYgc2V0IHRvICJvbiIgdGhlbiBDPHhsPiB3
aWxsIGF1dG9tYXRpY2FsbHkgcmVkdWNlIHRoZSBhbW91bnQgb2YKZGlmZiAtLWdpdCBhL3Rvb2xz
L2V4YW1wbGVzL3hsLmNvbmYgYi90b29scy9leGFtcGxlcy94bC5jb25mCmluZGV4IDA0NDZkZWIz
MDQuLjk1ZjJmNDQyZDMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2V4YW1wbGVzL3hsLmNvbmYKKysrIGIv
dG9vbHMvZXhhbXBsZXMveGwuY29uZgpAQCAtMSw1ICsxLDkgQEAKICMjIEdsb2JhbCBYTCBjb25m
aWcgZmlsZSAjIwogCisjIFNldCBkb21haW4taWQgcG9saWN5LiAieGVuIiBtZWFucyB0aGF0IHRo
ZSBoeXBlcnZpc29yIHdpbGwgY2hvb3NlIHRoZQorIyBpZCBvZiBhIG5ldyBkb21haW4uICJyYW5k
b20iIG1lYW5zIHRoYXQgYSByYW5kb20gdmFsdWUgd2lsbCBiZSBjaG9zZW4uCisjZG9taWRfcG9s
aWN5PSJ4ZW4iCisKICMgQ29udHJvbCB3aGV0aGVyIGRvbTAgaXMgYmFsbG9vbmVkIGRvd24gd2hl
biB4ZW4gZG9lc24ndCBoYXZlIGVub3VnaAogIyBmcmVlIG1lbW9yeSB0byBjcmVhdGUgYSBkb21h
aW4uICAiYXV0byIgbWVhbnMgb25seSBiYWxsb29uIGlmIGRvbTAKICMgc3RhcnRzIHdpdGggYWxs
IHRoZSBob3N0J3MgbWVtb3J5LgpkaWZmIC0tZ2l0IGEvdG9vbHMveGwveGwuYyBiL3Rvb2xzL3hs
L3hsLmMKaW5kZXggM2Q0MzkwYTQ2ZC4uMmE1ZGRkNDM5MCAxMDA2NDQKLS0tIGEvdG9vbHMveGwv
eGwuYworKysgYi90b29scy94bC94bC5jCkBAIC01NCw2ICs1NCw3IEBAIGludCBjbGFpbV9tb2Rl
ID0gMTsKIGJvb2wgcHJvZ3Jlc3NfdXNlX2NyID0gMDsKIGludCBtYXhfZ3JhbnRfZnJhbWVzID0g
LTE7CiBpbnQgbWF4X21hcHRyYWNrX2ZyYW1lcyA9IC0xOworbGlieGxfZG9taWQgZG9taWRfcG9s
aWN5ID0gSU5WQUxJRF9ET01JRDsKIAogeGVudG9vbGxvZ19sZXZlbCBtaW5tc2dsZXZlbCA9IG1p
bm1zZ2xldmVsX2RlZmF1bHQ7CiAKQEAgLTIyOCw2ICsyMjksMTUgQEAgc3RhdGljIHZvaWQgcGFy
c2VfZ2xvYmFsX2NvbmZpZyhjb25zdCBjaGFyICpjb25maWdmaWxlLAogICAgIGVsc2UKICAgICAg
ICAgbGlieGxfYml0bWFwX3NldF9hbnkoJmdsb2JhbF9wdl9hZmZpbml0eV9tYXNrKTsKIAorICAg
IGlmICgheGx1X2NmZ19nZXRfc3RyaW5nIChjb25maWcsICJkb21pZF9wb2xpY3kiLCAmYnVmLCAw
KSkgeworICAgICAgICBpZiAoIXN0cmNtcChidWYsICJ4ZW4iKSkKKyAgICAgICAgICAgIGRvbWlk
X3BvbGljeSA9IElOVkFMSURfRE9NSUQ7CisgICAgICAgIGVsc2UgaWYgKCFzdHJjbXAoYnVmLCAi
cmFuZG9tIikpCisgICAgICAgICAgICBkb21pZF9wb2xpY3kgPSBSQU5ET01fRE9NSUQ7CisgICAg
ICAgIGVsc2UKKyAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiaW52YWxpZCBkb21pZF9wb2xp
Y3kgb3B0aW9uIik7CisgICAgfQorCiAgICAgeGx1X2NmZ19kZXN0cm95KGNvbmZpZyk7CiB9CiAK
ZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsLmggYi90b29scy94bC94bC5oCmluZGV4IDYwYmRhZDhm
ZmIuLjJiNDcwOWVmYjIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hsL3hsLmgKKysrIGIvdG9vbHMveGwv
eGwuaApAQCAtMjgzLDYgKzI4Myw3IEBAIGV4dGVybiBpbnQgbWF4X21hcHRyYWNrX2ZyYW1lczsK
IGV4dGVybiBsaWJ4bF9iaXRtYXAgZ2xvYmFsX3ZtX2FmZmluaXR5X21hc2s7CiBleHRlcm4gbGli
eGxfYml0bWFwIGdsb2JhbF9odm1fYWZmaW5pdHlfbWFzazsKIGV4dGVybiBsaWJ4bF9iaXRtYXAg
Z2xvYmFsX3B2X2FmZmluaXR5X21hc2s7CitleHRlcm4gbGlieGxfZG9taWQgZG9taWRfcG9saWN5
OwogCiBlbnVtIG91dHB1dF9mb3JtYXQgewogICAgIE9VVFBVVF9GT1JNQVRfSlNPTiwKZGlmZiAt
LWdpdCBhL3Rvb2xzL3hsL3hsX3ZtY29udHJvbC5jIGIvdG9vbHMveGwveGxfdm1jb250cm9sLmMK
aW5kZXggZTUyMGIxZGE3OS4uMzkyOTJhY2ZlNiAxMDA2NDQKLS0tIGEvdG9vbHMveGwveGxfdm1j
b250cm9sLmMKKysrIGIvdG9vbHMveGwveGxfdm1jb250cm9sLmMKQEAgLTg5OSw2ICs4OTksOCBA
QCBzdGFydDoKICAgICAgICAgYXV0b2Nvbm5lY3RfY29uc29sZV9ob3cgPSAwOwogICAgIH0KIAor
ICAgIGRfY29uZmlnLmNfaW5mby5kb21pZCA9IGRvbWlkX3BvbGljeTsKKwogICAgIGlmICggcmVz
dG9yaW5nICkgewogICAgICAgICBsaWJ4bF9kb21haW5fcmVzdG9yZV9wYXJhbXMgcGFyYW1zOwog
Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
