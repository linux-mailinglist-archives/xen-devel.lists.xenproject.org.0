Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240889E31B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 10:49:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2X87-0002LU-0q; Tue, 27 Aug 2019 08:47:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvsD=WX=amazon.de=prvs=1355b64ef=wipawel@srs-us1.protection.inumbo.net>)
 id 1i2X85-0002Kb-Mf
 for xen-devel@lists.xen.org; Tue, 27 Aug 2019 08:47:05 +0000
X-Inumbo-ID: 3e134b51-c8a7-11e9-ae2e-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e134b51-c8a7-11e9-ae2e-12813bfff9fa;
 Tue, 27 Aug 2019 08:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566895624; x=1598431624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=bpJJB8ENuWbYp4zQbEiJruIBvZKlk60Gg8fBcS+LgNM=;
 b=q2MV929+RFoqhTAz9QZj9CJDoJMhH1KUO4PzhakMWiPPWPJ+4vtn0MmE
 3hsVCgapXnNq6aB7kH79fUziK4hj1fnoST1loWMJ7okPOqo0WdmN24U0M
 n1qWh1aZhED18T4vV4C0rumsUq8TiYAQhisYnJMuOLGBkhoKcbHhR56AK s=;
X-IronPort-AV: E=Sophos;i="5.64,436,1559520000"; d="scan'208";a="697824845"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 27 Aug 2019 08:46:59 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 29343A1ED5; Tue, 27 Aug 2019 08:46:56 +0000 (UTC)
Received: from EX13D03EUA003.ant.amazon.com (10.43.165.89) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 27 Aug 2019 08:46:37 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D03EUA003.ant.amazon.com (10.43.165.89) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 27 Aug 2019 08:46:36 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 27 Aug 2019 08:46:34 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Tue, 27 Aug 2019 08:46:13 +0000
Message-ID: <20190827084624.116917-2-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190827084624.116917-1-wipawel@amazon.de>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 01/12] livepatch: Always check hypervisor
 build ID upon hotpatch upload
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

VGhpcyBjaGFuZ2UgaXMgcGFydCBvZiBhIGluZGVwZW5kYW50IHN0YWNrZWQgaG90cGF0Y2ggbW9k
dWxlcwpmZWF0dXJlLiBUaGlzIGZlYXR1cmUgYWxsb3dzIHRvIGJ5cGFzcyBkZXBlbmRlbmNpZXMg
YmV0d2VlbiBtb2R1bGVzCnVwb24gbG9hZGluZywgYnV0IHN0aWxsIHZlcmlmaWVzIFhlbiBidWls
ZCBJRCBtYXRjaGluZy4KCkluIG9yZGVyIHRvIHByZXZlbnQgKHVwKWxvYWRpbmcgYW55IGhvdHBh
dGNoZXMgYnVpbHQgZm9yIGRpZmZlcmVudApoeXBlcnZpc29yIHZlcnNpb24gYXMgaW5kaWNhdGVk
IGJ5IHRoZSBYZW4gQnVpbGQgSUQsIGFkZCBjaGVja2luZyBmb3IKdGhlIHBheWxvYWQncyB2cyBY
ZW4ncyBidWlsZCBpZCBtYXRjaC4KClRvIGFjaGlldmUgdGhhdCBlbWJlZCBpbnRvIGV2ZXJ5IGhv
dHBhdGNoIGFub3RoZXIgc2VjdGlvbiB3aXRoIGEKZGVkaWNhdGVkIGh5cGVydmlzb3IgYnVpbGQg
aWQgaW4gaXQuIEFmdGVyIHRoZSBwYXlsb2FkIGlzIGxvYWRlZCBhbmQKdGhlIC5saXZlcGF0Y2gu
eGVuX2RlcGVuZHMgc2VjdGlvbiBiZWNvbWVzIGF2YWlsYWJsZSwgcGVyZm9ybSB0aGUKY2hlY2sg
YW5kIHJlamVjdCB0aGUgcGF5bG9hZCBpZiB0aGVyZSBpcyBubyBtYXRjaC4KClNpZ25lZC1vZmYt
Ynk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6
IEFuZHJhLUlyaW5hIFBhcmFzY2hpdiA8YW5kcmFwcnNAYW1hem9uLmNvbT4KUmV2aWV3ZWQtYnk6
IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBFc2xhbSBFbG5p
a2V0eSA8ZWxuaWtldHlAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogTWFydGluIFBvaGxhY2sgPG1w
b2hsYWNrQGFtYXpvbi5kZT4KLS0tCkNoYW5nZWQgc2luY2UgdjE6CiAgKiBhbHdheXMgcHJpbnQg
WEVOTE9HX0VSUiBtZXNzYWdlIGZyb20gY2hlY2tfeGVuX2J1aWxkX2lkKCkKICAqIGZpeCB0eXBv
IGluIHRlc3QvbGl2ZXBhdGNoL01ha2VmaWxlCgogLmdpdGlnbm9yZSAgICAgICAgICAgICAgICAg
IHwgIDEgKwogZG9jcy9taXNjL2xpdmVwYXRjaC5wYW5kb2MgIHwgMjggKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tCiB4ZW4vY29tbW9uL2xpdmVwYXRjaC5jICAgICAgfCA0NyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL3hlbi9saXZl
cGF0Y2guaCB8ICA3ICsrKystLS0KIHhlbi90ZXN0L2xpdmVwYXRjaC9NYWtlZmlsZSB8IDMxICsr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCA5OCBpbnNlcnRp
b25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS8uZ2l0aWdub3JlIGIvLmdpdGln
bm9yZQppbmRleCAzYzk0N2FjOTQ4Li42ZjgzZmM4NzI4IDEwMDY0NAotLS0gYS8uZ2l0aWdub3Jl
CisrKyBiLy5naXRpZ25vcmUKQEAgLTMxMiw2ICszMTIsNyBAQCB4ZW4vdGVzdC9saXZlcGF0Y2gv
eGVuX2J5ZV93b3JsZC5saXZlcGF0Y2gKIHhlbi90ZXN0L2xpdmVwYXRjaC94ZW5faGVsbG9fd29y
bGQubGl2ZXBhdGNoCiB4ZW4vdGVzdC9saXZlcGF0Y2gveGVuX25vcC5saXZlcGF0Y2gKIHhlbi90
ZXN0L2xpdmVwYXRjaC94ZW5fcmVwbGFjZV93b3JsZC5saXZlcGF0Y2gKK3hlbi90ZXN0L2xpdmVw
YXRjaC94ZW5fbm9feGVuX2J1aWxkaWQubGl2ZXBhdGNoCiB4ZW4vdG9vbHMva2NvbmZpZy8udG1w
X2d0a2NoZWNrCiB4ZW4vdG9vbHMva2NvbmZpZy8udG1wX3F0Y2hlY2sKIHhlbi90b29scy9zeW1i
b2xzCmRpZmYgLS1naXQgYS9kb2NzL21pc2MvbGl2ZXBhdGNoLnBhbmRvYyBiL2RvY3MvbWlzYy9s
aXZlcGF0Y2gucGFuZG9jCmluZGV4IDZkOWY3MmY0OWIuLmZkMWY1ZDAxMjYgMTAwNjQ0Ci0tLSBh
L2RvY3MvbWlzYy9saXZlcGF0Y2gucGFuZG9jCisrKyBiL2RvY3MvbWlzYy9saXZlcGF0Y2gucGFu
ZG9jCkBAIC0yNzAsNiArMjcwLDggQEAgbGlrZSB3aGF0IHRoZSBMaW51eCBrZXJuZWwgbW9kdWxl
IGxvYWRlciBkb2VzLgogVGhlIHBheWxvYWQgY29udGFpbnMgYXQgbGVhc3QgdGhyZWUgc2VjdGlv
bnM6CiAKICAqIGAubGl2ZXBhdGNoLmZ1bmNzYCAtIHdoaWNoIGlzIGFuIGFycmF5IG9mIGxpdmVw
YXRjaF9mdW5jIHN0cnVjdHVyZXMuCisgKiBgLmxpdmVwYXRjaC54ZW5fZGVwZW5kc2AgLSB3aGlj
aCBpcyBhbiBFTEYgTm90ZSB0aGF0IGRlc2NyaWJlcyB3aGF0IFhlbgorICAgIGJ1aWxkLWlkIHRo
ZSBwYXlsb2FkIGRlcGVuZHMgb24uICoqTVVTVCoqIGhhdmUgb25lLgogICogYC5saXZlcGF0Y2gu
ZGVwZW5kc2AgLSB3aGljaCBpcyBhbiBFTEYgTm90ZSB0aGF0IGRlc2NyaWJlcyB3aGF0IHRoZSBw
YXlsb2FkCiAgICAgZGVwZW5kcyBvbi4gKipNVVNUKiogaGF2ZSBvbmUuCiAgKiAgYC5ub3RlLmdu
dS5idWlsZC1pZGAgLSB0aGUgYnVpbGQtaWQgb2YgdGhpcyBwYXlsb2FkLiAqKk1VU1QqKiBoYXZl
IG9uZS4KQEAgLTM4MywxNiArMzg1LDE2IEBAIFRoZSB0eXBlIGRlZmluaXRpb24gb2YgdGhlIGZ1
bmN0aW9uIGFyZSBhcyBmb2xsb3c6CiAgICAgdHlwZWRlZiB2b2lkICgqbGl2ZXBhdGNoX2xvYWRj
YWxsX3QpKHZvaWQpOwogICAgIHR5cGVkZWYgdm9pZCAoKmxpdmVwYXRjaF91bmxvYWRjYWxsX3Qp
KHZvaWQpOwogCi0jIyMgLmxpdmVwYXRjaC5kZXBlbmRzIGFuZCAubm90ZS5nbnUuYnVpbGQtaWQK
KyMjIyAubGl2ZXBhdGNoLnhlbl9kZXBlbmRzLCAubGl2ZXBhdGNoLmRlcGVuZHMgYW5kIC5ub3Rl
LmdudS5idWlsZC1pZAogCiBUbyBzdXBwb3J0IGRlcGVuZGVuY2llcyBjaGVja2luZyBhbmQgc2Fm
ZSBsb2FkaW5nICh0byBsb2FkIHRoZQogYXBwcm9waWF0ZSBwYXlsb2FkIGFnYWluc3QgdGhlIHJp
Z2h0IGh5cGVydmlzb3IpIHRoZXJlIGlzIGEgbmVlZAogdG8gZW1iYmVkIGFuIGJ1aWxkLWlkIGRl
cGVuZGVuY3kuCiAKLVRoaXMgaXMgZG9uZSBieSB0aGUgcGF5bG9hZCBjb250YWluaW5nIGFuIHNl
Y3Rpb24gYC5saXZlcGF0Y2guZGVwZW5kc2AKLXdoaWNoIGZvbGxvd3MgdGhlIGZvcm1hdCBvZiBh
biBFTEYgTm90ZS4gVGhlIGNvbnRlbnRzIG9mIHRoaXMKLShuYW1lLCBhbmQgZGVzY3JpcHRpb24p
IGFyZSBzcGVjaWZpYyB0byB0aGUgbGlua2VyIHV0aWxpemVkIHRvCi1idWlsZCB0aGUgaHlwZXZp
c29yIGFuZCBwYXlsb2FkLgorVGhpcyBpcyBkb25lIGJ5IHRoZSBwYXlsb2FkIGNvbnRhaW5pbmcg
c2VjdGlvbnMgYC5saXZlcGF0Y2gueGVuX2RlcGVuZHNgCithbmQgYC5saXZlcGF0Y2guZGVwZW5k
c2Agd2hpY2ggZm9sbG93IHRoZSBmb3JtYXQgb2YgYW4gRUxGIE5vdGUuCitUaGUgY29udGVudHMg
b2YgdGhlc2UgKG5hbWUsIGFuZCBkZXNjcmlwdGlvbikgYXJlIHNwZWNpZmljIHRvIHRoZSBsaW5r
ZXIKK3V0aWxpemVkIHRvIGJ1aWxkIHRoZSBoeXBldmlzb3IgYW5kIHBheWxvYWQuCiAKIElmIEdO
VSBsaW5rZXIgaXMgdXNlZCB0aGVuIHRoZSBuYW1lIGlzIGBHTlVgIGFuZCB0aGUgZGVzY3JpcHRp
b24KIGlzIGEgTlRfR05VX0JVSUxEX0lEIHR5cGUgSUQuIFRoZSBkZXNjcmlwdGlvbiBjYW4gYmUg
YW4gU0hBMQpAQCAtNDAwLDYgKzQwMiwxMyBAQCBjaGVja3N1bSwgTUQ1IGNoZWNrc3VtIG9yIGFu
eSB1bmlxdWUgdmFsdWUuCiAKIFRoZSBzaXplIG9mIHRoZXNlIHN0cnVjdHVyZXMgdmFyaWVzIHdp
dGggdGhlIGAtLWJ1aWxkLWlkYCBsaW5rZXIgb3B0aW9uLgogCitUaGVyZSBhcmUgdHdvIGtpbmRz
IG9mIGJ1aWxkLWlkIGRlcGVuZGVuY2llczoKKworICogWGVuIGJ1aWxkLWlkIGRlcGVuZGVuY3kg
KC5saXZlcGF0Y2gueGVuX2RlcGVuZHMgc2VjdGlvbikKKyAqIHByZXZpb3VzIHBheWxvYWQgYnVp
bGQtaWQgZGVwZW5kZW5jeSAoLmxpdmVwYXRjaC5kZXBlbmRzIHNlY3Rpb24pCisKK1NlZSAiTGl2
ZSBwYXRjaCBpbnRlcmRlcGVuZGVuY2llcyIgZm9yIG1vcmUgaW5mb3JtYXRpb24uCisKICMjIEh5
cGVyY2FsbHMKIAogV2Ugd2lsbCBlbXBsb3kgdGhlIHN1YiBvcGVyYXRpb25zIG9mIHRoZSBzeXN0
ZW0gbWFuYWdlbWVudCBoeXBlcmNhbGwgKHN5c2N0bCkuCkBAIC04OTQsMTMgKzkwMywxNiBAQCBi
dXQgaXMgbW9yZSBjb21wbGV4IHRvIGltcGxlbWVudC4KIFRoZSBzZWNvbmQgb3B0aW9uIHdoaWNo
IHJlcXVpcmVzIGFuIGJ1aWxkLWlkIG9mIHRoZSBoeXBlcnZpc29yCiBpcyBpbXBsZW1lbnRlZCBp
biB0aGUgWGVuIGh5cGVydmlzb3IuCiAKLVNwZWNpZmljYWxseSBlYWNoIHBheWxvYWQgaGFzIHR3
byBidWlsZC1pZCBFTEYgbm90ZXM6CitTcGVjaWZpY2FsbHkgZWFjaCBwYXlsb2FkIGhhcyB0aHJl
ZSBidWlsZC1pZCBFTEYgbm90ZXM6CiAgKiBUaGUgYnVpbGQtaWQgb2YgdGhlIHBheWxvYWQgaXRz
ZWxmIChnZW5lcmF0ZWQgdmlhIC0tYnVpbGQtaWQpLgorICogVGhlIGJ1aWxkLWlkIG9mIHRoZSBY
ZW4gaHlwZXJ2aXNvciBpdCBkZXBlbmRzIG9uIChleHRyYWN0ZWQgZnJvbSB0aGUKKyAgIGh5cGVy
dmlzb3IgZHVyaW5nIGJ1aWxkIHRpbWUpLgogICogVGhlIGJ1aWxkLWlkIG9mIHRoZSBwYXlsb2Fk
IGl0IGRlcGVuZHMgb24gKGV4dHJhY3RlZCBmcm9tIHRoZQogICAgdGhlIHByZXZpb3VzIHBheWxv
YWQgb3IgaHlwZXJ2aXNvciBkdXJpbmcgYnVpbGQgdGltZSkuCiAKLVRoaXMgbWVhbnMgdGhhdCB0
aGUgdmVyeSBmaXJzdCBwYXlsb2FkIGRlcGVuZHMgb24gdGhlIGh5cGVydmlzb3IKLWJ1aWxkLWlk
LgorVGhpcyBtZWFucyB0aGF0IGV2ZXJ5IHBheWxvYWQgZGVwZW5kcyBvbiB0aGUgaHlwZXJ2aXNv
ciBidWlsZC1pZCBhbmQgb24KK3RoZSBidWlsZC1pZCBvZiB0aGUgcHJldmlvdXMgcGF5bG9hZCBp
biB0aGUgc3RhY2suCitUaGUgdmVyeSBmaXJzdCBwYXlsb2FkIGRlcGVuZHMgb24gdGhlIGh5cGVy
dmlzb3IgYnVpbGQtaWQgb25seS4KIAogIyBOb3QgWWV0IERvbmUKIApkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9saXZlcGF0Y2guYyBiL3hlbi9jb21tb24vbGl2ZXBhdGNoLmMKaW5kZXggN2NhYTMw
YzIwMi4uZWYwODFmMTEyYyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9saXZlcGF0Y2guYworKysg
Yi94ZW4vY29tbW9uL2xpdmVwYXRjaC5jCkBAIC03NCw2ICs3NCw3IEBAIHN0cnVjdCBwYXlsb2Fk
IHsKICAgICB1bnNpZ25lZCBpbnQgbnN5bXM7ICAgICAgICAgICAgICAgICAgLyogTnIgb2YgZW50
cmllcyBpbiAuc3RydGFiIGFuZCBzeW1ib2xzLiAqLwogICAgIHN0cnVjdCBsaXZlcGF0Y2hfYnVp
bGRfaWQgaWQ7ICAgICAgICAvKiBFTEZOT1RFX0RFU0MoLm5vdGUuZ251LmJ1aWxkLWlkKSBvZiB0
aGUgcGF5bG9hZC4gKi8KICAgICBzdHJ1Y3QgbGl2ZXBhdGNoX2J1aWxkX2lkIGRlcDsgICAgICAg
LyogRUxGTk9URV9ERVNDKC5saXZlcGF0Y2guZGVwZW5kcykuICovCisgICAgc3RydWN0IGxpdmVw
YXRjaF9idWlsZF9pZCB4ZW5fZGVwOyAgIC8qIEVMRk5PVEVfREVTQygubGl2ZXBhdGNoLnhlbl9k
ZXBlbmRzKS4gKi8KICAgICBsaXZlcGF0Y2hfbG9hZGNhbGxfdCAqY29uc3QgKmxvYWRfZnVuY3M7
ICAgLyogVGhlIGFycmF5IG9mIGZ1bmNzIHRvIGNhbGwgYWZ0ZXIgKi8KICAgICBsaXZlcGF0Y2hf
dW5sb2FkY2FsbF90ICpjb25zdCAqdW5sb2FkX2Z1bmNzOy8qIGxvYWQgYW5kIHVubG9hZCBvZiB0
aGUgcGF5bG9hZC4gKi8KICAgICB1bnNpZ25lZCBpbnQgbl9sb2FkX2Z1bmNzOyAgICAgICAgICAg
LyogTnIgb2YgdGhlIGZ1bmNzIHRvIGxvYWQgYW5kIGV4ZWN1dGUuICovCkBAIC00NzYsMTEgKzQ3
NywzNCBAQCBzdGF0aWMgYm9vbCBzZWN0aW9uX29rKGNvbnN0IHN0cnVjdCBsaXZlcGF0Y2hfZWxm
ICplbGYsCiAgICAgcmV0dXJuIHRydWU7CiB9CiAKK3N0YXRpYyBpbnQgY2hlY2tfeGVuX2J1aWxk
X2lkKGNvbnN0IHN0cnVjdCBwYXlsb2FkICpwYXlsb2FkKQoreworICAgIGNvbnN0IHZvaWQgKmlk
ID0gTlVMTDsKKyAgICB1bnNpZ25lZCBpbnQgbGVuID0gMDsKKyAgICBpbnQgcmM7CisKKyAgICBB
U1NFUlQocGF5bG9hZC0+eGVuX2RlcC5sZW4pOworICAgIEFTU0VSVChwYXlsb2FkLT54ZW5fZGVw
LnApOworCisgICAgcmMgPSB4ZW5fYnVpbGRfaWQoJmlkLCAmbGVuKTsKKyAgICBpZiAoIHJjICkK
KyAgICAgICAgcmV0dXJuIHJjOworCisgICAgaWYgKCBwYXlsb2FkLT54ZW5fZGVwLmxlbiAhPSBs
ZW4gfHwgbWVtY21wKGlkLCBwYXlsb2FkLT54ZW5fZGVwLnAsIGxlbikgKSB7CisgICAgICAgIHBy
aW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6IGNoZWNrIGFnYWluc3QgaHlwZXJ2aXNvciBi
dWlsZC1pZCBmYWlsZWRcbiIsCisgICAgICAgICAgICAgICBwYXlsb2FkLT5uYW1lKTsKKyAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7CisgICAgfQorCisgICAgcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBp
bnQgY2hlY2tfc3BlY2lhbF9zZWN0aW9ucyhjb25zdCBzdHJ1Y3QgbGl2ZXBhdGNoX2VsZiAqZWxm
KQogewogICAgIHVuc2lnbmVkIGludCBpOwogICAgIHN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBu
YW1lc1tdID0geyBFTEZfTElWRVBBVENIX0ZVTkMsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIEVMRl9MSVZFUEFUQ0hfREVQRU5EUywKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgRUxGX0xJVkVQQVRDSF9YRU5fREVQRU5EUywKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRUxGX0JVSUxEX0lEX05PVEV9Owog
ICAgIERFQ0xBUkVfQklUTUFQKGZvdW5kLCBBUlJBWV9TSVpFKG5hbWVzKSkgPSB7IDAgfTsKIApA
QCAtNjMyLDYgKzY1NiwyMiBAQCBzdGF0aWMgaW50IHByZXBhcmVfcGF5bG9hZChzdHJ1Y3QgcGF5
bG9hZCAqcGF5bG9hZCwKICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwogICAgIH0KIAorICAg
IHNlYyA9IGxpdmVwYXRjaF9lbGZfc2VjX2J5X25hbWUoZWxmLCBFTEZfTElWRVBBVENIX1hFTl9E
RVBFTkRTKTsKKyAgICBpZiAoIHNlYyApCisgICAgeworICAgICAgICBuID0gc2VjLT5sb2FkX2Fk
ZHI7CisKKyAgICAgICAgaWYgKCBzZWMtPnNlYy0+c2hfc2l6ZSA8PSBzaXplb2YoKm4pICkKKyAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOworCisgICAgICAgIGlmICggeGVuX2J1aWxkX2lkX2No
ZWNrKG4sIHNlYy0+c2VjLT5zaF9zaXplLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmcGF5bG9hZC0+eGVuX2RlcC5wLCAmcGF5bG9hZC0+eGVuX2RlcC5sZW4pICkKKyAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOworCisgICAgICAgIGlmICggIXBheWxvYWQtPnhlbl9kZXAubGVu
IHx8ICFwYXlsb2FkLT54ZW5fZGVwLnAgKQorICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cisg
ICAgfQorCiAgICAgLyogU2V0dXAgdGhlIHZpcnR1YWwgcmVnaW9uIHdpdGggcHJvcGVyIGRhdGEu
ICovCiAgICAgcmVnaW9uID0gJnBheWxvYWQtPnJlZ2lvbjsKIApAQCAtODgyLDYgKzkyMiwxMCBA
QCBzdGF0aWMgaW50IGxvYWRfcGF5bG9hZF9kYXRhKHN0cnVjdCBwYXlsb2FkICpwYXlsb2FkLCB2
b2lkICpyYXcsIHNpemVfdCBsZW4pCiAgICAgaWYgKCByYyApCiAgICAgICAgIGdvdG8gb3V0Owog
CisgICAgcmMgPSBjaGVja194ZW5fYnVpbGRfaWQocGF5bG9hZCk7CisgICAgaWYgKCByYyApCisg
ICAgICAgIGdvdG8gb3V0OworCiAgICAgcmMgPSBidWlsZF9zeW1ib2xfdGFibGUocGF5bG9hZCwg
JmVsZik7CiAgICAgaWYgKCByYyApCiAgICAgICAgIGdvdG8gb3V0OwpAQCAtMTY1NSw2ICsxNjk5
LDkgQEAgc3RhdGljIHZvaWQgbGl2ZXBhdGNoX3ByaW50YWxsKHVuc2lnbmVkIGNoYXIga2V5KQog
CiAgICAgICAgIGlmICggZGF0YS0+ZGVwLmxlbiApCiAgICAgICAgICAgICBwcmludGsoImRlcGVu
ZC1vbj0lKnBoTlxuIiwgZGF0YS0+ZGVwLmxlbiwgZGF0YS0+ZGVwLnApOworCisgICAgICAgIGlm
ICggZGF0YS0+eGVuX2RlcC5sZW4gKQorICAgICAgICAgICAgcHJpbnRrKCJkZXBlbmQtb24teGVu
PSUqcGhOXG4iLCBkYXRhLT54ZW5fZGVwLmxlbiwgZGF0YS0+eGVuX2RlcC5wKTsKICAgICB9CiAK
ICAgICBzcGluX3VubG9jaygmcGF5bG9hZF9sb2NrKTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L3hlbi9saXZlcGF0Y2guaCBiL3hlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2guaAppbmRleCAxYjE4
MTdjYTBkLi5lZDk5N2FhNGNjIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNo
LmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oCkBAIC0yOSw5ICsyOSwxMCBAQCBz
dHJ1Y3QgeGVuX3N5c2N0bF9saXZlcGF0Y2hfb3A7CiAvKiBDb252ZW5pZW5jZSBkZWZpbmUgZm9y
IHByaW50ay4gKi8KICNkZWZpbmUgTElWRVBBVENIICAgICAgICAgICAgICJsaXZlcGF0Y2g6ICIK
IC8qIEVMRiBwYXlsb2FkIHNwZWNpYWwgc2VjdGlvbiBuYW1lcy4gKi8KLSNkZWZpbmUgRUxGX0xJ
VkVQQVRDSF9GVU5DICAgICIubGl2ZXBhdGNoLmZ1bmNzIgotI2RlZmluZSBFTEZfTElWRVBBVENI
X0RFUEVORFMgIi5saXZlcGF0Y2guZGVwZW5kcyIKLSNkZWZpbmUgRUxGX0JVSUxEX0lEX05PVEUg
ICAgICAiLm5vdGUuZ251LmJ1aWxkLWlkIgorI2RlZmluZSBFTEZfTElWRVBBVENIX0ZVTkMgICAg
ICAgICIubGl2ZXBhdGNoLmZ1bmNzIgorI2RlZmluZSBFTEZfTElWRVBBVENIX0RFUEVORFMgICAg
ICIubGl2ZXBhdGNoLmRlcGVuZHMiCisjZGVmaW5lIEVMRl9MSVZFUEFUQ0hfWEVOX0RFUEVORFMg
Ii5saXZlcGF0Y2gueGVuX2RlcGVuZHMiCisjZGVmaW5lIEVMRl9CVUlMRF9JRF9OT1RFICAgICAg
ICAgIi5ub3RlLmdudS5idWlsZC1pZCIKIC8qIEFyYml0cmFyeSBsaW1pdCBmb3IgcGF5bG9hZCBz
aXplIGFuZCAuYnNzIHNlY3Rpb24gc2l6ZS4gKi8KICNkZWZpbmUgTElWRVBBVENIX01BWF9TSVpF
ICAgICBNQigyKQogCmRpZmYgLS1naXQgYS94ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUgYi94
ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUKaW5kZXggNjgzMTM4M2RiMS4uOTM4YWVlMTdlYyAx
MDA2NDQKLS0tIGEveGVuL3Rlc3QvbGl2ZXBhdGNoL01ha2VmaWxlCisrKyBiL3hlbi90ZXN0L2xp
dmVwYXRjaC9NYWtlZmlsZQpAQCAtMTksMTEgKzE5LDEzIEBAIExJVkVQQVRDSCA6PSB4ZW5faGVs
bG9fd29ybGQubGl2ZXBhdGNoCiBMSVZFUEFUQ0hfQllFIDo9IHhlbl9ieWVfd29ybGQubGl2ZXBh
dGNoCiBMSVZFUEFUQ0hfUkVQTEFDRSA6PSB4ZW5fcmVwbGFjZV93b3JsZC5saXZlcGF0Y2gKIExJ
VkVQQVRDSF9OT1AgOj0geGVuX25vcC5saXZlcGF0Y2gKK0xJVkVQQVRDSF9OT19YRU5fQlVJTERJ
RCA6PSB4ZW5fbm9feGVuX2J1aWxkaWQubGl2ZXBhdGNoCiAKIExJVkVQQVRDSEVTICs9ICQoTElW
RVBBVENIKQogTElWRVBBVENIRVMgKz0gJChMSVZFUEFUQ0hfQllFKQogTElWRVBBVENIRVMgKz0g
JChMSVZFUEFUQ0hfUkVQTEFDRSkKIExJVkVQQVRDSEVTICs9ICQoTElWRVBBVENIX05PUCkKK0xJ
VkVQQVRDSEVTICs9ICQoTElWRVBBVENIX05PX1hFTl9CVUlMRElEKQogCiBMSVZFUEFUQ0hfREVC
VUdfRElSID89ICQoREVCVUdfRElSKS94ZW4tbGl2ZXBhdGNoCiAKQEAgLTU5LDcgKzYxLDcgQEAg
Y29uZmlnLmg6IHhlbl9oZWxsb193b3JsZF9mdW5jLm8KIHhlbl9oZWxsb193b3JsZC5vOiBjb25m
aWcuaAogCiAuUEhPTlk6ICQoTElWRVBBVENIKQotJChMSVZFUEFUQ0gpOiB4ZW5faGVsbG9fd29y
bGRfZnVuYy5vIHhlbl9oZWxsb193b3JsZC5vIG5vdGUubworJChMSVZFUEFUQ0gpOiB4ZW5faGVs
bG9fd29ybGRfZnVuYy5vIHhlbl9oZWxsb193b3JsZC5vIG5vdGUubyB4ZW5fbm90ZS5vCiAJJChM
RCkgJChMREZMQUdTKSAkKGJ1aWxkX2lkX2xpbmtlcikgLXIgLW8gJChMSVZFUEFUQ0gpICReCiAK
ICMKQEAgLTc4LDYgKzgwLDE3IEBAIG5vdGUubzoKIAkJICAgLS1yZW5hbWUtc2VjdGlvbj0uZGF0
YT0ubGl2ZXBhdGNoLmRlcGVuZHMsYWxsb2MsbG9hZCxyZWFkb25seSxkYXRhLGNvbnRlbnRzIC1T
ICRALmJpbiAkQAogCXJtIC1mICRALmJpbgogCisjCisjIEFwcGVuZCAubGl2ZXBhdGNoLnhlbl9k
ZXBlbmRzIHNlY3Rpb24KKyMgd2l0aCBYZW4gYnVpbGQtaWQgZGVyaXZlZCBmcm9tIHhlbi1zeW1z
LgorIworLlBIT05ZOiB4ZW5fbm90ZS5vCit4ZW5fbm90ZS5vOgorCSQoT0JKQ09QWSkgLU8gYmlu
YXJ5IC0tb25seS1zZWN0aW9uPS5ub3RlLmdudS5idWlsZC1pZCAkKEJBU0VESVIpL3hlbi1zeW1z
ICRALmJpbgorCSQoT0JKQ09QWSkgJChPQkpDT1BZX01BR0lDKSBcCisJCSAgIC0tcmVuYW1lLXNl
Y3Rpb249LmRhdGE9LmxpdmVwYXRjaC54ZW5fZGVwZW5kcyxhbGxvYyxsb2FkLHJlYWRvbmx5LGRh
dGEsY29udGVudHMgLVMgJEAuYmluICRACisJcm0gLWYgJEAuYmluCisKICMKICMgRXh0cmFjdCB0
aGUgYnVpbGQtaWQgb2YgdGhlIHhlbl9oZWxsb193b3JsZC5saXZlcGF0Y2gKICMgKHdoaWNoIHhl
bl9ieWVfd29ybGQgd2lsbCBkZXBlbmQgb24pLgpAQCAtOTIsMjAgKzEwNSwyOCBAQCBoZWxsb193
b3JsZF9ub3RlLm86ICQoTElWRVBBVENIKQogeGVuX2J5ZV93b3JsZC5vOiBjb25maWcuaAogCiAu
UEhPTlk6ICQoTElWRVBBVENIX0JZRSkKLSQoTElWRVBBVENIX0JZRSk6IHhlbl9ieWVfd29ybGRf
ZnVuYy5vIHhlbl9ieWVfd29ybGQubyBoZWxsb193b3JsZF9ub3RlLm8KKyQoTElWRVBBVENIX0JZ
RSk6IHhlbl9ieWVfd29ybGRfZnVuYy5vIHhlbl9ieWVfd29ybGQubyBoZWxsb193b3JsZF9ub3Rl
Lm8geGVuX25vdGUubwogCSQoTEQpICQoTERGTEFHUykgJChidWlsZF9pZF9saW5rZXIpIC1yIC1v
ICQoTElWRVBBVENIX0JZRSkgJF4KIAogeGVuX3JlcGxhY2Vfd29ybGQubzogY29uZmlnLmgKIAog
LlBIT05ZOiAkKExJVkVQQVRDSF9SRVBMQUNFKQotJChMSVZFUEFUQ0hfUkVQTEFDRSk6IHhlbl9y
ZXBsYWNlX3dvcmxkX2Z1bmMubyB4ZW5fcmVwbGFjZV93b3JsZC5vIG5vdGUubworJChMSVZFUEFU
Q0hfUkVQTEFDRSk6IHhlbl9yZXBsYWNlX3dvcmxkX2Z1bmMubyB4ZW5fcmVwbGFjZV93b3JsZC5v
IG5vdGUubyB4ZW5fbm90ZS5vCiAJJChMRCkgJChMREZMQUdTKSAkKGJ1aWxkX2lkX2xpbmtlcikg
LXIgLW8gJChMSVZFUEFUQ0hfUkVQTEFDRSkgJF4KIAogeGVuX25vcC5vOiBjb25maWcuaAogCiAu
UEhPTlk6ICQoTElWRVBBVENIX05PUCkKLSQoTElWRVBBVENIX05PUCk6IHhlbl9ub3AubyBub3Rl
Lm8KKyQoTElWRVBBVENIX05PUCk6IHhlbl9ub3AubyBub3RlLm8geGVuX25vdGUubwogCSQoTEQp
ICQoTERGTEFHUykgJChidWlsZF9pZF9saW5rZXIpIC1yIC1vICQoTElWRVBBVENIX05PUCkgJF4K
IAorIyBUaGlzIG9uZSBhbHdheXMgZmFpbHMgdXBvbiB1cGxvYWQsIGJlY2F1c2UgaXQgZGVsaWJl
cmF0ZWx5CisjIGRvZXMgbm90IGhhdmUgYSAubGl2ZXBhdGNoLnhlbl9kZXBlbmRzICh4ZW5fbm90
ZS5vKSBzZWN0aW9uLgoreGVuX25vX3hlbl9idWlsZGlkLm86IGNvbmZpZy5oCisKKy5QSE9OWTog
JChMSVZFUEFUQ0hfTk9fWEVOX0JVSUxESUQpCiskKExJVkVQQVRDSF9OT19YRU5fQlVJTERJRCk6
IHhlbl9ub3AubyBub3RlLm8KKwkkKExEKSAkKExERkxBR1MpICQoYnVpbGRfaWRfbGlua2VyKSAt
ciAtbyAkKExJVkVQQVRDSF9OT19YRU5fQlVJTERJRCkgJF4KKwogLlBIT05ZOiBsaXZlcGF0Y2gK
LWxpdmVwYXRjaDogJChMSVZFUEFUQ0gpICQoTElWRVBBVENIX0JZRSkgJChMSVZFUEFUQ0hfUkVQ
TEFDRSkgJChMSVZFUEFUQ0hfTk9QKQorbGl2ZXBhdGNoOiAkKExJVkVQQVRDSCkgJChMSVZFUEFU
Q0hfQllFKSAkKExJVkVQQVRDSF9SRVBMQUNFKSAkKExJVkVQQVRDSF9OT1ApICQoTElWRVBBVENI
X05PX1hFTl9CVUlMRElEKQotLSAKMi4xNi41CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVy
IEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhy
dW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFtIEFt
dHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4K
VXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
