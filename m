Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770DE9E328
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 10:50:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2X8W-00030y-Li; Tue, 27 Aug 2019 08:47:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvsD=WX=amazon.de=prvs=1355b64ef=wipawel@srs-us1.protection.inumbo.net>)
 id 1i2X8U-0002yE-MF
 for xen-devel@lists.xen.org; Tue, 27 Aug 2019 08:47:30 +0000
X-Inumbo-ID: 433e3aa3-c8a7-11e9-ae2f-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 433e3aa3-c8a7-11e9-ae2f-12813bfff9fa;
 Tue, 27 Aug 2019 08:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566895633; x=1598431633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=YzbRxlmckMA9S6eiYKMn5PZH/NmHh5WuvM6agy/KnyA=;
 b=sIRa7BaXmM+C9l6iJ8kNpJLbLkE9WAdMfg6/zbsvMrqJtyWeE40aQZmV
 pckVuq4oF/wFuIuFpye/QDon9fq5g9QONVkHUNy40Uh2kZElkzBsz8Y+P
 Q0f/v0pHUSqAgclIJZrEOOZQWZoUxwlrnFcChD7+Ox5nufj+TwauRsC7/ I=;
X-IronPort-AV: E=Sophos;i="5.64,436,1559520000"; d="scan'208";a="417885654"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 27 Aug 2019 08:47:12 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2142CA1DDE; Tue, 27 Aug 2019 08:47:09 +0000 (UTC)
Received: from EX13D03EUC004.ant.amazon.com (10.43.164.33) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 27 Aug 2019 08:46:54 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D03EUC004.ant.amazon.com (10.43.164.33) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 27 Aug 2019 08:46:53 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 27 Aug 2019 08:46:51 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Tue, 27 Aug 2019 08:46:20 +0000
Message-ID: <20190827084624.116917-9-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190827084624.116917-1-wipawel@amazon.de>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 08/12] livepatch: Add support for inline asm
 hotpatching expectations
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyB0aGUgaW5pdGlhbCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZXhwZWN0YXRpb25zIGVu
aGFuY2VtZW50CnRvIGltcHJvdmUgaW5saW5lIGFzbSBob3RwYXRjaGluZy4KCkV4cGVjdGF0aW9u
cyBhcmUgZGVzaWduZWQgYXMgb3B0aW9uYWwgZmVhdHVyZSwgc2luY2UgdGhlIG1haW4gdXNlIG9m
CnRoZW0gaXMgcGxhbm5lZCBmb3IgaW5saW5lIGFzbSBob3RwYXRjaGluZy4gVGhlIGZsYWcgZW5h
YmxlZCBhbGxvd3MKdG8gY29udHJvbCB0aGUgZXhwZWN0YXRpb24gc3RhdGUuCkVhY2ggZXhwZWN0
YXRpb24gaGFzIGRhdGEgYW5kIGxlbiBmaWVsZHMgdGhhdCBkZXNjcmliZSB0aGUgZGF0YQp0aGF0
IGlzIGV4cGVjdGVkIHRvIGJlIGZvdW5kIGF0IGEgZ2l2ZW4gcGF0Y2hpbmcgKG9sZF9hZGRyKSBs
b2NhdGlvbi4KVGhlIGxlbiBtdXN0IG5vdCBleGNlZWQgdGhlIGRhdGEgYXJyYXkgc2l6ZS4gVGhl
IGRhdGEgYXJyYXkgc2l6ZQpmb2xsb3dzIHRoZSBzaXplIG9mIHRoZSBvcGFxdWUgYXJyYXksIHNp
bmNlIHRoZSBvcGFxdWUgYXJyYXkgaG9sZHMKdGhlIG9yaWdpbmFsIGRhdGEgYW5kIHRoZXJlZm9y
ZSBtdXN0IG1hdGNoIHdoYXQgaXMgc3BlY2lmaWVkIGluIHRoZQpleHBlY3RhdGlvbiAoaWYgZW5h
YmxlZCkuCgpUaGUgcGF5bG9hZCBzdHJ1Y3R1cmUgaXMgbW9kaWZpZWQgYXMgZWFjaCBleHBlY3Rh
dGlvbiBzdHJ1Y3R1cmUgaXMKcGFydCBvZiB0aGUgbGl2ZXBhdGNoX2Z1bmMgc3RydWN0dXJlIGFu
ZCBoZW5jZSBleHRlbmRzIHRoZSBwYXlsb2FkLgoKRWFjaCBleHBlY3RhdGlvbiBpcyBjaGVja2Vk
IHByaW9yIHRvIHRoZSBhcHBseSBhY3Rpb24gKGkuZS4gYXMgbGF0ZQphcyBwb3NzaWJsZSB0byBj
aGVjayBhZ2FpbnN0IHRoZSBtb3N0IGN1cnJlbnQgc3RhdGUgb2YgdGhlIGNvZGUpLgoKRm9yIHRo
ZSByZXBsYWNlIGFjdGlvbiBhIG5ldyBwYXlsb2FkJ3MgZXhwZWN0YXRpb25zIGFyZSBjaGVja2Vk
IEFGVEVSCmFsbCBhcHBsaWVkIHBheWxvYWRzIGFyZSBzdWNjZXNzZnVsbHkgcmV2ZXJ0ZWQsIGJ1
dCBCRUZPUkUgbmV3IHBheWxvYWQKaXMgYXBwbGllZC4gVGhhdCBicmVha3MgdGhlIHJlcGxhY2Ug
YWN0aW9uJ3MgYXRvbWljaXR5IGFuZCBpbiBjYXNlIG9mCmFuIGV4cGVjdGF0aW9uIGNoZWNrIGZh
aWx1cmUgd291bGQgbGVhdmUgYSBzeXN0ZW0gd2l0aCBhbGwgcGF5bG9hZHMKcmV2ZXJ0ZWQuIFRo
YXQgaXMgb2J2aW91c2x5IGluc2VjdXJlLiBVc2UgaXQgd2l0aCBjYXV0aW9uIGFuZCBhY3QKdXBv
biByZXBsYWNlIGVycm9ycyEKClNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3
aXBhd2VsQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IEFuZHJhLUlyaW5hIFBhcmFzY2hpdiA8YW5k
cmFwcnNAYW1hem9uLmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBQb2hsYWNrIDxtcG9obGFja0Bh
bWF6b24uZGU+ClJldmlld2VkLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5k
ZT4KLS0tCkNoYW5nZWQgc2luY2UgdjE6CiAgKiBhZGRlZCBjb3JyZXNwb25kaW5nIGRvY3VtZW50
YXRpb24KICAqIGFkZGVkIHRlc3RzCgogLmdpdGlnbm9yZSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDEgKwogZG9jcy9taXNjL2xpdmVwYXRjaC5wYW5kb2MgICAgICAgICAgICAg
ICAgIHwgMjggKysrKysrKysrKysrCiB4ZW4vY29tbW9uL2xpdmVwYXRjaC5jICAgICAgICAgICAg
ICAgICAgICAgfCA3MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9pbmNsdWRl
L3B1YmxpYy9zeXNjdGwuaCAgICAgICAgICAgICAgICB8IDE1ICsrKysrKy0KIHhlbi90ZXN0L2xp
dmVwYXRjaC9NYWtlZmlsZSAgICAgICAgICAgICAgICB8IDI3ICsrKysrKysrKysrLQogeGVuL3Rl
c3QvbGl2ZXBhdGNoL3hlbl9leHBlY3RhdGlvbnMuYyAgICAgIHwgNDEgKysrKysrKysrKysrKysr
KysKIHhlbi90ZXN0L2xpdmVwYXRjaC94ZW5fZXhwZWN0YXRpb25zX2ZhaWwuYyB8IDQyICsrKysr
KysrKysrKysrKysrKwogNyBmaWxlcyBjaGFuZ2VkLCAyMjIgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vdGVzdC9saXZlcGF0Y2gveGVuX2V4cGVj
dGF0aW9ucy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL3Rlc3QvbGl2ZXBhdGNoL3hlbl9leHBl
Y3RhdGlvbnNfZmFpbC5jCgpkaWZmIC0tZ2l0IGEvLmdpdGlnbm9yZSBiLy5naXRpZ25vcmUKaW5k
ZXggNWI4MGUyYmJkNS4uY2I3NzBjYzhjNyAxMDA2NDQKLS0tIGEvLmdpdGlnbm9yZQorKysgYi8u
Z2l0aWdub3JlCkBAIC0zMDgsNiArMzA4LDcgQEAgeGVuL2luY2x1ZGUveGVuL2FjbV9wb2xpY3ku
aAogeGVuL2luY2x1ZGUveGVuL2NvbXBpbGUuaAogeGVuL2luY2x1ZGUveGVuL2xpYi94ODYvY3B1
aWQtYXV0b2dlbi5oCiB4ZW4vdGVzdC9saXZlcGF0Y2gvY29uZmlnLmgKK3hlbi90ZXN0L2xpdmVw
YXRjaC9leHBlY3RfY29uZmlnLmgKIHhlbi90ZXN0L2xpdmVwYXRjaC8qLmxpdmVwYXRjaAogeGVu
L3Rvb2xzL2tjb25maWcvLnRtcF9ndGtjaGVjawogeGVuL3Rvb2xzL2tjb25maWcvLnRtcF9xdGNo
ZWNrCmRpZmYgLS1naXQgYS9kb2NzL21pc2MvbGl2ZXBhdGNoLnBhbmRvYyBiL2RvY3MvbWlzYy9s
aXZlcGF0Y2gucGFuZG9jCmluZGV4IDZhYjdmNGMyZDIuLjkyYTQyNGU5MTggMTAwNjQ0Ci0tLSBh
L2RvY3MvbWlzYy9saXZlcGF0Y2gucGFuZG9jCisrKyBiL2RvY3MvbWlzYy9saXZlcGF0Y2gucGFu
ZG9jCkBAIC0zMDAsNiArMzAwLDcgQEAgd2hpY2ggZGVzY3JpYmUgdGhlIGZ1bmN0aW9ucyB0byBi
ZSBwYXRjaGVkOgogICAgICAgICAvKiBBZGRlZCB0byBsaXZlcGF0Y2ggcGF5bG9hZCB2ZXJzaW9u
IDI6ICovCiAgICAgICAgIHVpbnQ4X3QgYXBwbGllZDsKICAgICAgICAgdWludDhfdCBfcGFkWzdd
OworICAgICAgICBsaXZlcGF0Y2hfZXhwZWN0YXRpb25fdCBleHBlY3Q7CiAgICAgfTsKIAogVGhl
IHNpemUgb2YgdGhlIHN0cnVjdHVyZSBpcyA2NCBieXRlcyBvbiA2NC1iaXQgaHlwZXJ2aXNvcnMu
IEl0IHdpbGwgYmUKQEAgLTMzNiw2ICszMzcsMjYgQEAgVGhlIHZlcnNpb24gMiBvZiB0aGUgcGF5
bG9hZCBhZGRzIHRoZSBmb2xsb3dpbmcgZmllbGRzIHRvIHRoZSBzdHJ1Y3R1cmU6CiAgICogYGFw
cGxpZWRgIHRyYWNrcyBmdW5jdGlvbidzIGFwcGxpZWQvcmV2ZXJ0ZWQgc3RhdGUuIEl0IGhhcyBh
IGJvb2xlYW4gdHlwZQogICAgIGVpdGhlciBMSVZFUEFUQ0hfRlVOQ19OT1RfQVBQTElFRCBvciBM
SVZFUEFUQ0hfRlVOQ19BUFBMSUVELgogICAqIGBfcGFkWzddYCBhZGRzIHBhZGRpbmcgdG8gYWxp
Z24gdG8gOCBieXRlcy4KKyAgKiBgZXhwZWN0YCBpcyBhbiBvcHRpb25hbCBzdHJ1Y3R1cmUgY29u
dGFpbmluZyBleHBlY3RlZCB0by1iZS1yZXBsYWNlZCBkYXRhCisgICAgKG1vc3RseSBmb3IgaW5s
aW5lIGFzbSBwYXRjaGluZykuIFRoZSBgZXhwZWN0YCBzdHJ1Y3R1cmUgZm9ybWF0IGlzOgorCisg
ICAgc3RydWN0IGxpdmVwYXRjaF9leHBlY3RhdGlvbiB7CisgICAgICAgIHVpbnQ4X3QgZW5hYmxl
ZCA6IDE7CisgICAgICAgIHVpbnQ4X3QgbGVuIDogNTsKKyAgICAgICAgdWludDhfdCBkYXRhW0xJ
VkVQQVRDSF9PUEFRVUVfU0laRV07IC8qIFNhbWUgc2l6ZSBhcyBvcGFxdWVbXSBidWZmZXIgb2YK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGxpdmVw
YXRjaF9mdW5jLiBUaGlzIGlzIHRoZQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBtYXggbnVtYmVyIG9mIGJ5dGVzIHRvIGJlIHBhdGNoZWQgKi8KKyAgICB9Owor
ICAgIHR5cGVkZWYgc3RydWN0IGxpdmVwYXRjaF9leHBlY3RhdGlvbiBsaXZlcGF0Y2hfZXhwZWN0
YXRpb25fdDsKKworICAgICogYGVuYWJsZWRgIGFsbG93cyB0byBlbmFibGUgdGhlIGV4cGVjdGF0
aW9uIGNoZWNrIGZvciBnaXZlbiBmdW5jdGlvbi4KKyAgICAgIERlZmF1bHQgc3RhdGUgaXMgZGlz
YWJsZWQuCisgICAgKiBgbGVuYCBzcGVjaWZpZXMgdGhlIG51bWJlciBvZiB2YWxpZCBieXRlcyBp
biBgZGF0YWAgYXJyYXkuIDUgYml0cyBpcworICAgICAgZW5vdWdoIHRvIHNwZWNpZnkgdmFsdWVz
IHVwIHRvIDMyIChvZiBieXRlcyksIHdoaWNoIGlzIGFib3ZlIHRoZSBhcnJheQorICAgICAgc2l6
ZS4KKyAgICAqIGBkYXRhYCBjb250YWlucyBleHBlY3RlZCBieXRlcyBvZiBjb250ZW50IHRvIGJl
IHJlcGxhY2VkLiBTYW1lIHNpemUgYXMKKyAgICAgIGBvcGFxdWVgIGJ1ZmZlciBvZiBgc3RydWN0
IGxpdmVwYXRjaF9mdW5jYCAobWF4IG51bWJlciBvZiBieXRlcyB0byBiZQorICAgICAgcGF0Y2hl
ZCkuCiAKIFRoZSBzaXplIG9mIHRoZSBgbGl2ZXBhdGNoX2Z1bmNgIGFycmF5IGlzIGRldGVybWlu
ZWQgZnJvbSB0aGUgRUxGIHNlY3Rpb24KIHNpemUuCkBAIC0zOTEsNiArNDEyLDcgQEAgQSBzaW1w
bGUgZXhhbXBsZSBvZiB3aGF0IGEgcGF5bG9hZCBmaWxlIGNhbiBiZToKICAgICAgICAgLyogQWRk
ZWQgdG8gbGl2ZXBhdGNoIHBheWxvYWQgdmVyc2lvbiAyOiAqLwogICAgICAgICB1aW50OF90IGFw
cGxpZWQ7CiAgICAgICAgIHVpbnQ4X3QgX3BhZFs3XTsKKyAgICAgICAgbGl2ZXBhdGNoX2V4cGVj
dGF0aW9uX3QgZXhwZWN0OwogICAgIH07CiAKICAgICAvKiBPdXIgcmVwbGFjZW1lbnQgZnVuY3Rp
b24gZm9yIHhlbl9leHRyYV92ZXJzaW9uLiAqLwpAQCAtNDA4LDYgKzQzMCwxMiBAQCBBIHNpbXBs
ZSBleGFtcGxlIG9mIHdoYXQgYSBwYXlsb2FkIGZpbGUgY2FuIGJlOgogICAgICAgICAub2xkX2Fk
ZHIgPSAodm9pZCAqKTB4ZmZmZjgyZDA4MDEzOTYzYywgLyogRXh0cmFjdGVkIGZyb20geGVuLXN5
bXMuICovCiAgICAgICAgIC5uZXdfc2l6ZSA9IDEzLCAvKiBUbyBiZSBiZSBjb21wdXRlZCBieSBz
Y3JpcHRzLiAqLwogICAgICAgICAub2xkX3NpemUgPSAxMywgLyogLS0tLS0tLS0tLS0iIi0tLS0t
LS0tLS0tLS0tLSAgKi8KKyAgICAgICAgLyogQWRkZWQgdG8gbGl2ZXBhdGNoIHBheWxvYWQgdmVy
c2lvbiAyOiAqLworICAgICAgICAuZXhwZWN0ID0geyAvKiBBbGwgZmllbGRzIHRvIGJlIGZpbGxl
ZCBtYW51YWxseSAqLworICAgICAgICAgICAgLmVuYWJsZWQgPSAxLAorICAgICAgICAgICAgLmxl
biA9IDUsCisgICAgICAgICAgICAuZGF0YSA9IHsgMHg0OCwgMHg4ZCwgMHgwNSwgMHgzMywgMHgx
QyB9CisgICAgICAgIH0sCiAgICAgfSBfX2F0dHJpYnV0ZV9fKChfX3NlY3Rpb25fXygiLmxpdmVw
YXRjaC5mdW5jcyIpKSk7CiAKIENvZGUgbXVzdCBiZSBjb21waWxlZCB3aXRoIGAtZlBJQ2AuCmRp
ZmYgLS1naXQgYS94ZW4vY29tbW9uL2xpdmVwYXRjaC5jIGIveGVuL2NvbW1vbi9saXZlcGF0Y2gu
YwppbmRleCBkNzY2MTk4NDRjLi5jZGFlMzI0NzI0IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2xp
dmVwYXRjaC5jCisrKyBiL3hlbi9jb21tb24vbGl2ZXBhdGNoLmMKQEAgLTU2MCw2ICs1NjAsNTgg
QEAgc3RhdGljIGludCBjaGVja19wYXRjaGluZ19zZWN0aW9ucyhjb25zdCBzdHJ1Y3QgbGl2ZXBh
dGNoX2VsZiAqZWxmKQogICAgIHJldHVybiAwOwogfQogCitzdGF0aWMgaW5saW5lIGludCBsaXZl
cGF0Y2hfdmVyaWZ5X2V4cGVjdGF0aW9uX2ZuKGNvbnN0IHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyAq
ZnVuYykKK3sKKyAgICBjb25zdCBsaXZlcGF0Y2hfZXhwZWN0YXRpb25fdCAqZXhwID0gJmZ1bmMt
PmV4cGVjdDsKKworICAgIC8qIElnbm9yZSBkaXNhYmxlZCBleHBlY3RhdGlvbnMuICovCisgICAg
aWYgKCAhZXhwLT5lbmFibGVkICkKKyAgICAgICAgcmV0dXJuIDA7CisKKyAgICAvKiBUaGVyZSBp
cyBub3RoaW5nIHRvIGV4cGVjdCAqLworICAgIGlmICggIWZ1bmMtPm9sZF9hZGRyICkKKyAgICAg
ICAgcmV0dXJuIC1FRkFVTFQ7CisKKyAgICBpZiAoIGV4cC0+bGVuID4gc2l6ZW9mKGV4cC0+ZGF0
YSkpCisgICAgICAgIHJldHVybiAtRU9WRVJGTE9XOworCisgICAgLyogSW5jb3JyZWN0IGV4cGVj
dGF0aW9uICovCisgICAgaWYgKCBmdW5jLT5vbGRfc2l6ZSA8IGV4cC0+bGVuICkKKyAgICAgICAg
cmV0dXJuIC1FUkFOR0U7CisKKyAgICBpZiAoIG1lbWNtcChmdW5jLT5vbGRfYWRkciwgZXhwLT5k
YXRhLCBleHAtPmxlbikgKQorICAgIHsKKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBB
VENIICIlczogZXhwZWN0YXRpb24gZmFpbGVkOiBleHBlY3RlZDolKnBoTiwgYWN0dWFsOiUqcGhO
XG4iLAorICAgICAgICAgICAgICAgZnVuYy0+bmFtZSwgZXhwLT5sZW4sIGV4cC0+ZGF0YSwgZXhw
LT5sZW4sIGZ1bmMtPm9sZF9hZGRyKTsKKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisgICAgfQor
CisgICAgcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbmxpbmUgaW50IGxpdmVwYXRjaF9jaGVja19l
eHBlY3RhdGlvbnMoY29uc3Qgc3RydWN0IHBheWxvYWQgKnBheWxvYWQpCit7CisgICAgaW50IGks
IHJjOworCisgICAgcHJpbnRrKFhFTkxPR19JTkZPIExJVkVQQVRDSCAiJXM6IFZlcmlmeWluZyBl
bmFibGVkIGV4cGVjdGF0aW9ucyBmb3IgYWxsIGZ1bmN0aW9uc1xuIiwKKyAgICAgICAgICAgcGF5
bG9hZC0+bmFtZSk7CisKKyAgICBmb3IgKCBpID0gMDsgaSA8IHBheWxvYWQtPm5mdW5jczsgaSsr
ICkKKyAgICB7CisgICAgICAgIGNvbnN0IHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyAqZnVuYyA9ICYo
cGF5bG9hZC0+ZnVuY3NbaV0pOworCisgICAgICAgIHJjID0gbGl2ZXBhdGNoX3ZlcmlmeV9leHBl
Y3RhdGlvbl9mbihmdW5jKTsKKyAgICAgICAgaWYgKCByYyApCisgICAgICAgIHsKKyAgICAgICAg
ICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6IGV4cGVjdGF0aW9ucyBvZiAlcyBm
YWlsZWQgKHJjPSVkKSwgYWJvcnRpbmchXG4iLAorICAgICAgICAgICAgICAgICAgIHBheWxvYWQt
Pm5hbWUsIGZ1bmMtPm5hbWUgPzogInVua25vd24iLCByYyk7CisgICAgICAgICAgICByZXR1cm4g
cmM7CisgICAgICAgIH0KKyAgICB9CisKKyAgICByZXR1cm4gMDsKK30KKwogLyoKICAqIExvb2t1
cCBzcGVjaWZpZWQgc2VjdGlvbiBhbmQgd2hlbiBleGlzdHMgYXNzaWduIGl0cyBhZGRyZXNzIHRv
IGEgc3BlY2lmaWVkIGhvb2suCiAgKiBQZXJmb3JtIHNlY3Rpb24gcG9pbnRlciBhbmQgc2l6ZSB2
YWxpZGF0aW9uOiBzaW5nbGUgaG9vayBzZWN0aW9ucyBtdXN0IGNvbnRhaW4gYQpAQCAtMTM0NSw2
ICsxMzk3LDIwIEBAIHN0YXRpYyB2b2lkIGxpdmVwYXRjaF9kb19hY3Rpb24odm9pZCkKIAogICAg
ICAgICBpZiAoIHJjID09IDAgKQogICAgICAgICB7CisgICAgICAgICAgICAvKgorICAgICAgICAg
ICAgICogTWFrZSBzdXJlIGFsbCBleHBlY3RhdGlvbiByZXF1aXJlbWVudHMgYXJlIG1ldC4KKyAg
ICAgICAgICAgICAqIEJld2FyZSBhbGwgdGhlIHBheWxvYWRzIGFyZSByZXZlcnRlZCBhdCB0aGlz
IHBvaW50LgorICAgICAgICAgICAgICogSWYgZXhwZWN0YXRpb25zIGFyZSBub3QgbWV0IHRoZSBz
eXN0ZW0gaXMgbGVmdCBpbiBhCisgICAgICAgICAgICAgKiBjb21wbGV0ZWx5IFVOUEFUQ0hFRCBz
dGF0ZSEKKyAgICAgICAgICAgICAqLworICAgICAgICAgICAgcmMgPSBsaXZlcGF0Y2hfY2hlY2tf
ZXhwZWN0YXRpb25zKGRhdGEpOworICAgICAgICAgICAgaWYgKCByYyApCisgICAgICAgICAgICB7
CisgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogU1lTVEVN
IE1JR0hUIEJFIElOU0VDVVJFOiAiCisgICAgICAgICAgICAgICAgICAgICAgICJSZXBsYWNlIGFj
dGlvbiBoYXMgYmVlbiBhYm9ydGVkIGFmdGVyIHJldmVydGluZyBBTEwgcGF5bG9hZHMhXG4iLCBk
YXRhLT5uYW1lKTsKKyAgICAgICAgICAgICAgICBicmVhazsKKyAgICAgICAgICAgIH0KKwogICAg
ICAgICAgICAgaWYgKCBpc19ob29rX2VuYWJsZWQoZGF0YS0+aG9va3MuYXBwbHkuYWN0aW9uKSAp
CiAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPIExJVkVQ
QVRDSCAiJXM6IENhbGxpbmcgYXBwbHkgYWN0aW9uIGhvb2sgZnVuY3Rpb25cbiIsIGRhdGEtPm5h
bWUpOwpAQCAtMTc5OCw2ICsxODY0LDExIEBAIHN0YXRpYyBpbnQgbGl2ZXBhdGNoX2FjdGlvbihz
dHJ1Y3QgeGVuX3N5c2N0bF9saXZlcGF0Y2hfYWN0aW9uICphY3Rpb24pCiAgICAgICAgICAgICAg
ICAgICAgIGJyZWFrOwogICAgICAgICAgICAgfQogCisgICAgICAgICAgICAvKiBNYWtlIHN1cmUg
YWxsIGV4cGVjdGF0aW9uIHJlcXVpcmVtZW50cyBhcmUgbWV0LiAqLworICAgICAgICAgICAgcmMg
PSBsaXZlcGF0Y2hfY2hlY2tfZXhwZWN0YXRpb25zKGRhdGEpOworICAgICAgICAgICAgaWYgKCBy
YyApCisgICAgICAgICAgICAgICAgYnJlYWs7CisKICAgICAgICAgICAgIGlmICggaXNfaG9va19l
bmFibGVkKGRhdGEtPmhvb2tzLmFwcGx5LnByZSkgKQogICAgICAgICAgICAgewogICAgICAgICAg
ICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyBMSVZFUEFUQ0ggIiVzOiBDYWxsaW5nIHByZS1hcHBs
eSBob29rIGZ1bmN0aW9uXG4iLCBkYXRhLT5uYW1lKTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L3B1YmxpYy9zeXNjdGwuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAppbmRleCAzYmNi
ODkyY2UxLi5hNDU0Yjg2Y2U2IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3Rs
LmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCkBAIC04MjYsNiArODI2LDE4IEBA
IHN0cnVjdCB4ZW5fc3lzY3RsX2NwdV9mZWF0dXJlc2V0IHsKICAqIFdlIGd1YXJkIHRoaXMgd2l0
aCBfX1hFTl9fIGFzIHRvb2xzdGFja3MgU0hPVUxEIG5vdCB1c2UgaXQuCiAgKi8KICNpZmRlZiBf
X1hFTl9fCisjZGVmaW5lIExJVkVQQVRDSF9PUEFRVUVfU0laRSAzMQorCitzdHJ1Y3QgbGl2ZXBh
dGNoX2V4cGVjdGF0aW9uIHsKKyAgICB1aW50OF90IGVuYWJsZWQgOiAxOworICAgIHVpbnQ4X3Qg
bGVuIDogNTsgICAgICAgIC8qIExlbmd0aCBvZiBkYXRhIHVwIHRvIExJVkVQQVRDSF9PUEFRVUVf
U0laRQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICg1IGJpdHMgaXMgZW5vdWdoIGZv
ciBub3cpICovCisgICAgdWludDhfdCBkYXRhW0xJVkVQQVRDSF9PUEFRVUVfU0laRV07IC8qIFNh
bWUgc2l6ZSBhcyBvcGFxdWVbXSBidWZmZXIgb2YKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IGxpdmVwYXRjaF9mdW5jLiBUaGlzIGlzIHRoZQorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXggbnVtYmVyIG9mIGJ5
dGVzIHRvIGJlIHBhdGNoZWQgKi8KK307Cit0eXBlZGVmIHN0cnVjdCBsaXZlcGF0Y2hfZXhwZWN0
YXRpb24gbGl2ZXBhdGNoX2V4cGVjdGF0aW9uX3Q7CisKIHR5cGVkZWYgZW51bSBsaXZlcGF0Y2hf
ZnVuY19zdGF0ZSB7CiAgICAgTElWRVBBVENIX0ZVTkNfTk9UX0FQUExJRUQsCiAgICAgTElWRVBB
VENIX0ZVTkNfQVBQTElFRApAQCAtODM4LDkgKzg1MCwxMCBAQCBzdHJ1Y3QgbGl2ZXBhdGNoX2Z1
bmMgewogICAgIHVpbnQzMl90IG5ld19zaXplOwogICAgIHVpbnQzMl90IG9sZF9zaXplOwogICAg
IHVpbnQ4X3QgdmVyc2lvbjsgICAgICAgIC8qIE1VU1QgYmUgTElWRVBBVENIX1BBWUxPQURfVkVS
U0lPTi4gKi8KLSAgICB1aW50OF90IG9wYXF1ZVszMV07CisgICAgdWludDhfdCBvcGFxdWVbTElW
RVBBVENIX09QQVFVRV9TSVpFXTsKICAgICB1aW50OF90IGFwcGxpZWQ7CiAgICAgdWludDhfdCBf
cGFkWzddOworICAgIGxpdmVwYXRjaF9leHBlY3RhdGlvbl90IGV4cGVjdDsKIH07CiB0eXBlZGVm
IHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyBsaXZlcGF0Y2hfZnVuY190OwogI2VuZGlmCmRpZmYgLS1n
aXQgYS94ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUgYi94ZW4vdGVzdC9saXZlcGF0Y2gvTWFr
ZWZpbGUKaW5kZXggMjMxMTNkMzQxOC4uMDY3ODYxOTAzZiAxMDA2NDQKLS0tIGEveGVuL3Rlc3Qv
bGl2ZXBhdGNoL01ha2VmaWxlCisrKyBiL3hlbi90ZXN0L2xpdmVwYXRjaC9NYWtlZmlsZQpAQCAt
MjcsNiArMjcsOCBAQCBMSVZFUEFUQ0hfQUNUSU9OX0hPT0tTX05PRlVOQyA6PSB4ZW5fYWN0aW9u
X2hvb2tzX25vZnVuYy5saXZlcGF0Y2gKIExJVkVQQVRDSF9BQ1RJT05fSE9PS1NfTUFSS0VSOj0g
eGVuX2FjdGlvbl9ob29rc19tYXJrZXIubGl2ZXBhdGNoCiBMSVZFUEFUQ0hfQUNUSU9OX0hPT0tT
X05PQVBQTFk6PSB4ZW5fYWN0aW9uX2hvb2tzX25vYXBwbHkubGl2ZXBhdGNoCiBMSVZFUEFUQ0hf
QUNUSU9OX0hPT0tTX05PUkVWRVJUOj0geGVuX2FjdGlvbl9ob29rc19ub3JldmVydC5saXZlcGF0
Y2gKK0xJVkVQQVRDSF9FWFBFQ1RBVElPTlM6PSB4ZW5fZXhwZWN0YXRpb25zLmxpdmVwYXRjaAor
TElWRVBBVENIX0VYUEVDVEFUSU9OU19GQUlMOj0geGVuX2V4cGVjdGF0aW9uc19mYWlsLmxpdmVw
YXRjaAogCiBMSVZFUEFUQ0hFUyArPSAkKExJVkVQQVRDSCkKIExJVkVQQVRDSEVTICs9ICQoTElW
RVBBVENIX0JZRSkKQEAgLTQwLDYgKzQyLDggQEAgTElWRVBBVENIRVMgKz0gJChMSVZFUEFUQ0hf
QUNUSU9OX0hPT0tTX05PRlVOQykKIExJVkVQQVRDSEVTICs9ICQoTElWRVBBVENIX0FDVElPTl9I
T09LU19NQVJLRVIpCiBMSVZFUEFUQ0hFUyArPSAkKExJVkVQQVRDSF9BQ1RJT05fSE9PS1NfTk9B
UFBMWSkKIExJVkVQQVRDSEVTICs9ICQoTElWRVBBVENIX0FDVElPTl9IT09LU19OT1JFVkVSVCkK
K0xJVkVQQVRDSEVTICs9ICQoTElWRVBBVENIX0VYUEVDVEFUSU9OUykKK0xJVkVQQVRDSEVTICs9
ICQoTElWRVBBVENIX0VYUEVDVEFUSU9OU19GQUlMKQogCiBMSVZFUEFUQ0hfREVCVUdfRElSID89
ICQoREVCVUdfRElSKS94ZW4tbGl2ZXBhdGNoCiAKQEAgLTU0LDcgKzU4LDcgQEAgdW5pbnN0YWxs
OgogCiAuUEhPTlk6IGNsZWFuCiBjbGVhbjo6Ci0Jcm0gLWYgKi5vIC4qLm8uZCAqLmxpdmVwYXRj
aCBjb25maWcuaAorCXJtIC1mICoubyAuKi5vLmQgKi5saXZlcGF0Y2ggY29uZmlnLmggZXhwZWN0
X2NvbmZpZy5oCiAKICMKICMgVG8gY29tcHV0ZSB0aGVzZSB2YWx1ZXMgd2UgbmVlZCB0aGUgYmlu
YXJ5IGZpbGVzOiB4ZW4tc3ltcwpAQCAtMTgyLDggKzE4NiwyNyBAQCB4ZW5fYWN0aW9uc19ob29r
c19ub3JldmVydC5vOiBjb25maWcuaAogJChMSVZFUEFUQ0hfQUNUSU9OX0hPT0tTX05PUkVWRVJU
KTogeGVuX2FjdGlvbl9ob29rc19tYXJrZXIubyB4ZW5faGVsbG9fd29ybGRfZnVuYy5vIG5vdGUu
byB4ZW5fbm90ZS5vCiAJJChMRCkgJChMREZMQUdTKSAkKGJ1aWxkX2lkX2xpbmtlcikgLXIgLW8g
JChMSVZFUEFUQ0hfQUNUSU9OX0hPT0tTX05PUkVWRVJUKSAkXgogCitDT0RFX0dFVF9FWFBFQ1Q9
JChzaGVsbCBvYmpkdW1wIC1kIC0taW5zbi13aWR0aD0xICQoMSkgfCBncmVwIC1BNiAtRSAnPCck
KDIpJz46JyB8IHRhaWwgLW4gKzIgfCBhd2sgJ0JFR0lOIHtwcmludGYgInsifSB7cHJpbnRmICIw
eCVzLCIsICQkMn0nIHwgc2VkICdzLywkJC99L2cnKQorLlBIT05ZOiBleHBlY3RfY29uZmlnLmgK
K2V4cGVjdF9jb25maWcuaDogRVhQRUNUX0JZVEVTPSQoY2FsbCBDT0RFX0dFVF9FWFBFQ1QsJChC
QVNFRElSKS94ZW4tc3ltcyx4ZW5fZXh0cmFfdmVyc2lvbikKK2V4cGVjdF9jb25maWcuaDogRVhQ
RUNUX0JZVEVTX0NPVU5UPTYKK2V4cGVjdF9jb25maWcuaDogeGVuX2V4cGVjdGF0aW9ucy5vCisJ
KHNldCAtZTsgXAorCSBlY2hvICIjZGVmaW5lIEVYUEVDVF9CWVRFUyAkKEVYUEVDVF9CWVRFUyki
OyBcCisgICAgICAgICBlY2hvICIjZGVmaW5lIEVYUEVDVF9CWVRFU19DT1VOVCAkKEVYUEVDVF9C
WVRFU19DT1VOVCkiKSA+ICRACisKK3hlbl9leHBlY3RhdGlvbnMubzogZXhwZWN0X2NvbmZpZy5o
CisKKy5QSE9OWTogJChMSVZFUEFUQ0hfRVhQRUNUQVRJT05TKQorJChMSVZFUEFUQ0hfRVhQRUNU
QVRJT05TKTogeGVuX2V4cGVjdGF0aW9ucy5vIHhlbl9oZWxsb193b3JsZF9mdW5jLm8gbm90ZS5v
IHhlbl9ub3RlLm8KKwkkKExEKSAkKExERkxBR1MpICQoYnVpbGRfaWRfbGlua2VyKSAtciAtbyAk
KExJVkVQQVRDSF9FWFBFQ1RBVElPTlMpICReCisKKy5QSE9OWTogJChMSVZFUEFUQ0hfRVhQRUNU
QVRJT05TX0ZBSUwpCiskKExJVkVQQVRDSF9FWFBFQ1RBVElPTlNfRkFJTCk6IHhlbl9leHBlY3Rh
dGlvbnNfZmFpbC5vIHhlbl9oZWxsb193b3JsZF9mdW5jLm8gbm90ZS5vIHhlbl9ub3RlLm8KKwkk
KExEKSAkKExERkxBR1MpICQoYnVpbGRfaWRfbGlua2VyKSAtciAtbyAkKExJVkVQQVRDSF9FWFBF
Q1RBVElPTlNfRkFJTCkgJF4KKwogLlBIT05ZOiBsaXZlcGF0Y2gKIGxpdmVwYXRjaDogJChMSVZF
UEFUQ0gpICQoTElWRVBBVENIX0JZRSkgJChMSVZFUEFUQ0hfUkVQTEFDRSkgJChMSVZFUEFUQ0hf
Tk9QKSAkKExJVkVQQVRDSF9OT19YRU5fQlVJTERJRCkgXAogICAgICAgICAgICAkKExJVkVQQVRD
SF9QUkVQT1NUX0hPT0tTKSAkKExJVkVQQVRDSF9QUkVQT1NUX0hPT0tTX0ZBSUwpICQoTElWRVBB
VENIX0FDVElPTl9IT09LUykgXAogICAgICAgICAgICAkKExJVkVQQVRDSF9BQ1RJT05fSE9PS1Nf
Tk9GVU5DKSAkKExJVkVQQVRDSF9BQ1RJT05fSE9PS1NfTUFSS0VSKSAkKExJVkVQQVRDSF9BQ1RJ
T05fSE9PS1NfTk9BUFBMWSkgXAotICAgICAgICAgICAkKExJVkVQQVRDSF9BQ1RJT05fSE9PS1Nf
Tk9SRVZFUlQpCisgICAgICAgICAgICQoTElWRVBBVENIX0FDVElPTl9IT09LU19OT1JFVkVSVCkg
JChMSVZFUEFUQ0hfRVhQRUNUQVRJT05TKSAkKExJVkVQQVRDSF9FWFBFQ1RBVElPTlNfRkFJTCkK
ZGlmZiAtLWdpdCBhL3hlbi90ZXN0L2xpdmVwYXRjaC94ZW5fZXhwZWN0YXRpb25zLmMgYi94ZW4v
dGVzdC9saXZlcGF0Y2gveGVuX2V4cGVjdGF0aW9ucy5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmM4MTc1YTQ1OGIKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4vdGVzdC9s
aXZlcGF0Y2gveGVuX2V4cGVjdGF0aW9ucy5jCkBAIC0wLDAgKzEsNDEgQEAKKy8qCisgKiBDb3B5
cmlnaHQgKGMpIDIwMTkgQW1hem9uLmNvbSwgSW5jLiBvciBpdHMgYWZmaWxpYXRlcy4gQWxsIHJp
Z2h0cyByZXNlcnZlZC4KKyAqCisgKi8KKworI2luY2x1ZGUgImV4cGVjdF9jb25maWcuaCIKKyNp
bmNsdWRlIDx4ZW4vbGliLmg+CisjaW5jbHVkZSA8eGVuL3R5cGVzLmg+CisjaW5jbHVkZSA8eGVu
L3ZlcnNpb24uaD4KKyNpbmNsdWRlIDx4ZW4vbGl2ZXBhdGNoLmg+CisjaW5jbHVkZSA8eGVuL2xp
dmVwYXRjaF9wYXlsb2FkLmg+CisKKyNpbmNsdWRlIDxwdWJsaWMvc3lzY3RsLmg+CisKK3N0YXRp
YyBjb25zdCBjaGFyIGxpdmVwYXRjaF9leGNlcHRpb25zX3N0cltdID0gInhlbl9leHRyYV92ZXJz
aW9uIjsKK2V4dGVybiBjb25zdCBjaGFyICp4ZW5faGVsbG9fd29ybGQodm9pZCk7CisKK3N0cnVj
dCBsaXZlcGF0Y2hfZnVuYyBfX3NlY3Rpb24oIi5saXZlcGF0Y2guZnVuY3MiKSBsaXZlcGF0Y2hf
ZXhjZXB0aW9ucyA9IHsKKyAgICAudmVyc2lvbiA9IExJVkVQQVRDSF9QQVlMT0FEX1ZFUlNJT04s
CisgICAgLm5hbWUgPSBsaXZlcGF0Y2hfZXhjZXB0aW9uc19zdHIsCisgICAgLm5ld19hZGRyID0g
eGVuX2hlbGxvX3dvcmxkLAorICAgIC5vbGRfYWRkciA9IHhlbl9leHRyYV92ZXJzaW9uLAorICAg
IC5uZXdfc2l6ZSA9IEVYUEVDVF9CWVRFU19DT1VOVCwKKyAgICAub2xkX3NpemUgPSBFWFBFQ1Rf
QllURVNfQ09VTlQsCisgICAgLmV4cGVjdCA9IHsKKyAgICAgICAgLmVuYWJsZWQgPSAxLAorICAg
ICAgICAubGVuID0gRVhQRUNUX0JZVEVTX0NPVU5ULAorICAgICAgICAuZGF0YSA9IEVYUEVDVF9C
WVRFUworICAgIH0sCisKK307CisKKy8qCisgKiBMb2NhbCB2YXJpYWJsZXM6CisgKiBtb2RlOiBD
CisgKiBjLWZpbGUtc3R5bGU6ICJCU0QiCisgKiBjLWJhc2ljLW9mZnNldDogNAorICogdGFiLXdp
ZHRoOiA0CisgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwKKyAqIEVuZDoKKyAqLwpkaWZmIC0tZ2l0
IGEveGVuL3Rlc3QvbGl2ZXBhdGNoL3hlbl9leHBlY3RhdGlvbnNfZmFpbC5jIGIveGVuL3Rlc3Qv
bGl2ZXBhdGNoL3hlbl9leHBlY3RhdGlvbnNfZmFpbC5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLjM2YTExMDI4NmYKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4vdGVzdC9s
aXZlcGF0Y2gveGVuX2V4cGVjdGF0aW9uc19mYWlsLmMKQEAgLTAsMCArMSw0MiBAQAorLyoKKyAq
IENvcHlyaWdodCAoYykgMjAxOSBBbWF6b24uY29tLCBJbmMuIG9yIGl0cyBhZmZpbGlhdGVzLiBB
bGwgcmlnaHRzIHJlc2VydmVkLgorICoKKyAqLworCisjaW5jbHVkZSA8eGVuL2xpYi5oPgorI2lu
Y2x1ZGUgPHhlbi90eXBlcy5oPgorI2luY2x1ZGUgPHhlbi92ZXJzaW9uLmg+CisjaW5jbHVkZSA8
eGVuL2xpdmVwYXRjaC5oPgorI2luY2x1ZGUgPHhlbi9saXZlcGF0Y2hfcGF5bG9hZC5oPgorCisj
aW5jbHVkZSA8cHVibGljL3N5c2N0bC5oPgorCitzdGF0aWMgY29uc3QgY2hhciBsaXZlcGF0Y2hf
ZXhjZXB0aW9uc19zdHJbXSA9ICJ4ZW5fZXh0cmFfdmVyc2lvbiI7CitleHRlcm4gY29uc3QgY2hh
ciAqeGVuX2hlbGxvX3dvcmxkKHZvaWQpOworCisjZGVmaW5lIEVYUEVDVF9CWVRFU19DT1VOVCA2
CisKK3N0cnVjdCBsaXZlcGF0Y2hfZnVuYyBfX3NlY3Rpb24oIi5saXZlcGF0Y2guZnVuY3MiKSBs
aXZlcGF0Y2hfZXhjZXB0aW9ucyA9IHsKKyAgICAudmVyc2lvbiA9IExJVkVQQVRDSF9QQVlMT0FE
X1ZFUlNJT04sCisgICAgLm5hbWUgPSBsaXZlcGF0Y2hfZXhjZXB0aW9uc19zdHIsCisgICAgLm5l
d19hZGRyID0geGVuX2hlbGxvX3dvcmxkLAorICAgIC5vbGRfYWRkciA9IHhlbl9leHRyYV92ZXJz
aW9uLAorICAgIC5uZXdfc2l6ZSA9IEVYUEVDVF9CWVRFU19DT1VOVCwKKyAgICAub2xkX3NpemUg
PSBFWFBFQ1RfQllURVNfQ09VTlQsCisgICAgLmV4cGVjdCA9IHsKKyAgICAgICAgLmVuYWJsZWQg
PSAxLAorICAgICAgICAubGVuID0gRVhQRUNUX0JZVEVTX0NPVU5ULAorICAgICAgICAuZGF0YSA9
IHsgMHhERSwgMHhBRCwgMHhDMCwgMHhERSwgMHhCQSwgMHhCRSB9CisgICAgfSwKKworfTsKKwor
LyoKKyAqIExvY2FsIHZhcmlhYmxlczoKKyAqIG1vZGU6IEMKKyAqIGMtZmlsZS1zdHlsZTogIkJT
RCIKKyAqIGMtYmFzaWMtb2Zmc2V0OiA0CisgKiB0YWItd2lkdGg6IDQKKyAqIGluZGVudC10YWJz
LW1vZGU6IG5pbAorICogRW5kOgorICovCi0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVu
dCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFl
ZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFn
ZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6
IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
