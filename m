Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E03AB3907
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 13:07:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9ond-0005Ty-Mg; Mon, 16 Sep 2019 11:04:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GGTU=XL=amazon.de=prvs=1553567f6=wipawel@srs-us1.protection.inumbo.net>)
 id 1i9onc-0005Ss-6s
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 11:04:04 +0000
X-Inumbo-ID: af4def42-d871-11e9-95df-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af4def42-d871-11e9-95df-12813bfff9fa;
 Mon, 16 Sep 2019 11:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568631840; x=1600167840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=E6zMZMPgr9DNRC6CIsSmKiFHml8T72w/iwsXwnL48bE=;
 b=fpNZI4pX+ls9h+jv0i8BZWnEUrgS7+FkwYxvenCyzzVzFsV01G+Z+OMo
 ILyP0lw8a5nNy8rx3Bj0mwfpt9BziGjDqsknCdussXgppJcPjpydUs4t+
 3pmWxex2Wrylg0Yq1moaKKkRVN4WPWF4UcI2M8PkIcmQ3y0gyEO4Ckz7t 8=;
X-IronPort-AV: E=Sophos;i="5.64,512,1559520000"; d="scan'208";a="832619315"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 16 Sep 2019 11:03:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS
 id BDA8AA2365; Mon, 16 Sep 2019 11:03:54 +0000 (UTC)
Received: from EX13D05EUC001.ant.amazon.com (10.43.164.118) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:03:33 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D05EUC001.ant.amazon.com (10.43.164.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:03:32 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 16 Sep 2019 11:03:29 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Mon, 16 Sep 2019 10:59:34 +0000
Message-ID: <20190916105945.93632-2-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190916105945.93632-1-wipawel@amazon.de>
References: <20190916105945.93632-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 01/12] livepatch: Always check hypervisor
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
b2hsYWNrQGFtYXpvbi5kZT4KU2lnbmVkLW9mZi1ieTogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxr
b25yYWQud2lsa0BvcmFjbGUuY29tPgotLS0KQ2hhbmdlZCBzaW5jZSB2MToKICAqIGFsd2F5cyBw
cmludCBYRU5MT0dfRVJSIG1lc3NhZ2UgZnJvbSBjaGVja194ZW5fYnVpbGRfaWQoKQogICogZml4
IHR5cG8gaW4gdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUKCiAuZ2l0aWdub3JlICAgICAgICAgICAg
ICAgICAgfCAgMSArCiBkb2NzL21pc2MvbGl2ZXBhdGNoLnBhbmRvYyAgfCAyOCArKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0KIHhlbi9jb21tb24vbGl2ZXBhdGNoLmMgICAgICB8IDQ3ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogeGVuL2luY2x1ZGUveGVu
L2xpdmVwYXRjaC5oIHwgIDcgKysrKy0tLQogeGVuL3Rlc3QvbGl2ZXBhdGNoL01ha2VmaWxlIHwg
MzEgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDk4IGlu
c2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhLy5naXRpZ25vcmUgYi8u
Z2l0aWdub3JlCmluZGV4IDNjOTQ3YWM5NDguLjZmODNmYzg3MjggMTAwNjQ0Ci0tLSBhLy5naXRp
Z25vcmUKKysrIGIvLmdpdGlnbm9yZQpAQCAtMzEyLDYgKzMxMiw3IEBAIHhlbi90ZXN0L2xpdmVw
YXRjaC94ZW5fYnllX3dvcmxkLmxpdmVwYXRjaAogeGVuL3Rlc3QvbGl2ZXBhdGNoL3hlbl9oZWxs
b193b3JsZC5saXZlcGF0Y2gKIHhlbi90ZXN0L2xpdmVwYXRjaC94ZW5fbm9wLmxpdmVwYXRjaAog
eGVuL3Rlc3QvbGl2ZXBhdGNoL3hlbl9yZXBsYWNlX3dvcmxkLmxpdmVwYXRjaAoreGVuL3Rlc3Qv
bGl2ZXBhdGNoL3hlbl9ub194ZW5fYnVpbGRpZC5saXZlcGF0Y2gKIHhlbi90b29scy9rY29uZmln
Ly50bXBfZ3RrY2hlY2sKIHhlbi90b29scy9rY29uZmlnLy50bXBfcXRjaGVjawogeGVuL3Rvb2xz
L3N5bWJvbHMKZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9saXZlcGF0Y2gucGFuZG9jIGIvZG9jcy9t
aXNjL2xpdmVwYXRjaC5wYW5kb2MKaW5kZXggNmQ5ZjcyZjQ5Yi4uZmQxZjVkMDEyNiAxMDA2NDQK
LS0tIGEvZG9jcy9taXNjL2xpdmVwYXRjaC5wYW5kb2MKKysrIGIvZG9jcy9taXNjL2xpdmVwYXRj
aC5wYW5kb2MKQEAgLTI3MCw2ICsyNzAsOCBAQCBsaWtlIHdoYXQgdGhlIExpbnV4IGtlcm5lbCBt
b2R1bGUgbG9hZGVyIGRvZXMuCiBUaGUgcGF5bG9hZCBjb250YWlucyBhdCBsZWFzdCB0aHJlZSBz
ZWN0aW9uczoKIAogICogYC5saXZlcGF0Y2guZnVuY3NgIC0gd2hpY2ggaXMgYW4gYXJyYXkgb2Yg
bGl2ZXBhdGNoX2Z1bmMgc3RydWN0dXJlcy4KKyAqIGAubGl2ZXBhdGNoLnhlbl9kZXBlbmRzYCAt
IHdoaWNoIGlzIGFuIEVMRiBOb3RlIHRoYXQgZGVzY3JpYmVzIHdoYXQgWGVuCisgICAgYnVpbGQt
aWQgdGhlIHBheWxvYWQgZGVwZW5kcyBvbi4gKipNVVNUKiogaGF2ZSBvbmUuCiAgKiBgLmxpdmVw
YXRjaC5kZXBlbmRzYCAtIHdoaWNoIGlzIGFuIEVMRiBOb3RlIHRoYXQgZGVzY3JpYmVzIHdoYXQg
dGhlIHBheWxvYWQKICAgICBkZXBlbmRzIG9uLiAqKk1VU1QqKiBoYXZlIG9uZS4KICAqICBgLm5v
dGUuZ251LmJ1aWxkLWlkYCAtIHRoZSBidWlsZC1pZCBvZiB0aGlzIHBheWxvYWQuICoqTVVTVCoq
IGhhdmUgb25lLgpAQCAtMzgzLDE2ICszODUsMTYgQEAgVGhlIHR5cGUgZGVmaW5pdGlvbiBvZiB0
aGUgZnVuY3Rpb24gYXJlIGFzIGZvbGxvdzoKICAgICB0eXBlZGVmIHZvaWQgKCpsaXZlcGF0Y2hf
bG9hZGNhbGxfdCkodm9pZCk7CiAgICAgdHlwZWRlZiB2b2lkICgqbGl2ZXBhdGNoX3VubG9hZGNh
bGxfdCkodm9pZCk7CiAKLSMjIyAubGl2ZXBhdGNoLmRlcGVuZHMgYW5kIC5ub3RlLmdudS5idWls
ZC1pZAorIyMjIC5saXZlcGF0Y2gueGVuX2RlcGVuZHMsIC5saXZlcGF0Y2guZGVwZW5kcyBhbmQg
Lm5vdGUuZ251LmJ1aWxkLWlkCiAKIFRvIHN1cHBvcnQgZGVwZW5kZW5jaWVzIGNoZWNraW5nIGFu
ZCBzYWZlIGxvYWRpbmcgKHRvIGxvYWQgdGhlCiBhcHByb3BpYXRlIHBheWxvYWQgYWdhaW5zdCB0
aGUgcmlnaHQgaHlwZXJ2aXNvcikgdGhlcmUgaXMgYSBuZWVkCiB0byBlbWJiZWQgYW4gYnVpbGQt
aWQgZGVwZW5kZW5jeS4KIAotVGhpcyBpcyBkb25lIGJ5IHRoZSBwYXlsb2FkIGNvbnRhaW5pbmcg
YW4gc2VjdGlvbiBgLmxpdmVwYXRjaC5kZXBlbmRzYAotd2hpY2ggZm9sbG93cyB0aGUgZm9ybWF0
IG9mIGFuIEVMRiBOb3RlLiBUaGUgY29udGVudHMgb2YgdGhpcwotKG5hbWUsIGFuZCBkZXNjcmlw
dGlvbikgYXJlIHNwZWNpZmljIHRvIHRoZSBsaW5rZXIgdXRpbGl6ZWQgdG8KLWJ1aWxkIHRoZSBo
eXBldmlzb3IgYW5kIHBheWxvYWQuCitUaGlzIGlzIGRvbmUgYnkgdGhlIHBheWxvYWQgY29udGFp
bmluZyBzZWN0aW9ucyBgLmxpdmVwYXRjaC54ZW5fZGVwZW5kc2AKK2FuZCBgLmxpdmVwYXRjaC5k
ZXBlbmRzYCB3aGljaCBmb2xsb3cgdGhlIGZvcm1hdCBvZiBhbiBFTEYgTm90ZS4KK1RoZSBjb250
ZW50cyBvZiB0aGVzZSAobmFtZSwgYW5kIGRlc2NyaXB0aW9uKSBhcmUgc3BlY2lmaWMgdG8gdGhl
IGxpbmtlcgordXRpbGl6ZWQgdG8gYnVpbGQgdGhlIGh5cGV2aXNvciBhbmQgcGF5bG9hZC4KIAog
SWYgR05VIGxpbmtlciBpcyB1c2VkIHRoZW4gdGhlIG5hbWUgaXMgYEdOVWAgYW5kIHRoZSBkZXNj
cmlwdGlvbgogaXMgYSBOVF9HTlVfQlVJTERfSUQgdHlwZSBJRC4gVGhlIGRlc2NyaXB0aW9uIGNh
biBiZSBhbiBTSEExCkBAIC00MDAsNiArNDAyLDEzIEBAIGNoZWNrc3VtLCBNRDUgY2hlY2tzdW0g
b3IgYW55IHVuaXF1ZSB2YWx1ZS4KIAogVGhlIHNpemUgb2YgdGhlc2Ugc3RydWN0dXJlcyB2YXJp
ZXMgd2l0aCB0aGUgYC0tYnVpbGQtaWRgIGxpbmtlciBvcHRpb24uCiAKK1RoZXJlIGFyZSB0d28g
a2luZHMgb2YgYnVpbGQtaWQgZGVwZW5kZW5jaWVzOgorCisgKiBYZW4gYnVpbGQtaWQgZGVwZW5k
ZW5jeSAoLmxpdmVwYXRjaC54ZW5fZGVwZW5kcyBzZWN0aW9uKQorICogcHJldmlvdXMgcGF5bG9h
ZCBidWlsZC1pZCBkZXBlbmRlbmN5ICgubGl2ZXBhdGNoLmRlcGVuZHMgc2VjdGlvbikKKworU2Vl
ICJMaXZlIHBhdGNoIGludGVyZGVwZW5kZW5jaWVzIiBmb3IgbW9yZSBpbmZvcm1hdGlvbi4KKwog
IyMgSHlwZXJjYWxscwogCiBXZSB3aWxsIGVtcGxveSB0aGUgc3ViIG9wZXJhdGlvbnMgb2YgdGhl
IHN5c3RlbSBtYW5hZ2VtZW50IGh5cGVyY2FsbCAoc3lzY3RsKS4KQEAgLTg5NCwxMyArOTAzLDE2
IEBAIGJ1dCBpcyBtb3JlIGNvbXBsZXggdG8gaW1wbGVtZW50LgogVGhlIHNlY29uZCBvcHRpb24g
d2hpY2ggcmVxdWlyZXMgYW4gYnVpbGQtaWQgb2YgdGhlIGh5cGVydmlzb3IKIGlzIGltcGxlbWVu
dGVkIGluIHRoZSBYZW4gaHlwZXJ2aXNvci4KIAotU3BlY2lmaWNhbGx5IGVhY2ggcGF5bG9hZCBo
YXMgdHdvIGJ1aWxkLWlkIEVMRiBub3RlczoKK1NwZWNpZmljYWxseSBlYWNoIHBheWxvYWQgaGFz
IHRocmVlIGJ1aWxkLWlkIEVMRiBub3RlczoKICAqIFRoZSBidWlsZC1pZCBvZiB0aGUgcGF5bG9h
ZCBpdHNlbGYgKGdlbmVyYXRlZCB2aWEgLS1idWlsZC1pZCkuCisgKiBUaGUgYnVpbGQtaWQgb2Yg
dGhlIFhlbiBoeXBlcnZpc29yIGl0IGRlcGVuZHMgb24gKGV4dHJhY3RlZCBmcm9tIHRoZQorICAg
aHlwZXJ2aXNvciBkdXJpbmcgYnVpbGQgdGltZSkuCiAgKiBUaGUgYnVpbGQtaWQgb2YgdGhlIHBh
eWxvYWQgaXQgZGVwZW5kcyBvbiAoZXh0cmFjdGVkIGZyb20gdGhlCiAgICB0aGUgcHJldmlvdXMg
cGF5bG9hZCBvciBoeXBlcnZpc29yIGR1cmluZyBidWlsZCB0aW1lKS4KIAotVGhpcyBtZWFucyB0
aGF0IHRoZSB2ZXJ5IGZpcnN0IHBheWxvYWQgZGVwZW5kcyBvbiB0aGUgaHlwZXJ2aXNvcgotYnVp
bGQtaWQuCitUaGlzIG1lYW5zIHRoYXQgZXZlcnkgcGF5bG9hZCBkZXBlbmRzIG9uIHRoZSBoeXBl
cnZpc29yIGJ1aWxkLWlkIGFuZCBvbgordGhlIGJ1aWxkLWlkIG9mIHRoZSBwcmV2aW91cyBwYXls
b2FkIGluIHRoZSBzdGFjay4KK1RoZSB2ZXJ5IGZpcnN0IHBheWxvYWQgZGVwZW5kcyBvbiB0aGUg
aHlwZXJ2aXNvciBidWlsZC1pZCBvbmx5LgogCiAjIE5vdCBZZXQgRG9uZQogCmRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL2xpdmVwYXRjaC5jIGIveGVuL2NvbW1vbi9saXZlcGF0Y2guYwppbmRleCA3
Y2FhMzBjMjAyLi5lZjA4MWYxMTJjIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2xpdmVwYXRjaC5j
CisrKyBiL3hlbi9jb21tb24vbGl2ZXBhdGNoLmMKQEAgLTc0LDYgKzc0LDcgQEAgc3RydWN0IHBh
eWxvYWQgewogICAgIHVuc2lnbmVkIGludCBuc3ltczsgICAgICAgICAgICAgICAgICAvKiBOciBv
ZiBlbnRyaWVzIGluIC5zdHJ0YWIgYW5kIHN5bWJvbHMuICovCiAgICAgc3RydWN0IGxpdmVwYXRj
aF9idWlsZF9pZCBpZDsgICAgICAgIC8qIEVMRk5PVEVfREVTQygubm90ZS5nbnUuYnVpbGQtaWQp
IG9mIHRoZSBwYXlsb2FkLiAqLwogICAgIHN0cnVjdCBsaXZlcGF0Y2hfYnVpbGRfaWQgZGVwOyAg
ICAgICAvKiBFTEZOT1RFX0RFU0MoLmxpdmVwYXRjaC5kZXBlbmRzKS4gKi8KKyAgICBzdHJ1Y3Qg
bGl2ZXBhdGNoX2J1aWxkX2lkIHhlbl9kZXA7ICAgLyogRUxGTk9URV9ERVNDKC5saXZlcGF0Y2gu
eGVuX2RlcGVuZHMpLiAqLwogICAgIGxpdmVwYXRjaF9sb2FkY2FsbF90ICpjb25zdCAqbG9hZF9m
dW5jczsgICAvKiBUaGUgYXJyYXkgb2YgZnVuY3MgdG8gY2FsbCBhZnRlciAqLwogICAgIGxpdmVw
YXRjaF91bmxvYWRjYWxsX3QgKmNvbnN0ICp1bmxvYWRfZnVuY3M7LyogbG9hZCBhbmQgdW5sb2Fk
IG9mIHRoZSBwYXlsb2FkLiAqLwogICAgIHVuc2lnbmVkIGludCBuX2xvYWRfZnVuY3M7ICAgICAg
ICAgICAvKiBOciBvZiB0aGUgZnVuY3MgdG8gbG9hZCBhbmQgZXhlY3V0ZS4gKi8KQEAgLTQ3Niwx
MSArNDc3LDM0IEBAIHN0YXRpYyBib29sIHNlY3Rpb25fb2soY29uc3Qgc3RydWN0IGxpdmVwYXRj
aF9lbGYgKmVsZiwKICAgICByZXR1cm4gdHJ1ZTsKIH0KIAorc3RhdGljIGludCBjaGVja194ZW5f
YnVpbGRfaWQoY29uc3Qgc3RydWN0IHBheWxvYWQgKnBheWxvYWQpCit7CisgICAgY29uc3Qgdm9p
ZCAqaWQgPSBOVUxMOworICAgIHVuc2lnbmVkIGludCBsZW4gPSAwOworICAgIGludCByYzsKKwor
ICAgIEFTU0VSVChwYXlsb2FkLT54ZW5fZGVwLmxlbik7CisgICAgQVNTRVJUKHBheWxvYWQtPnhl
bl9kZXAucCk7CisKKyAgICByYyA9IHhlbl9idWlsZF9pZCgmaWQsICZsZW4pOworICAgIGlmICgg
cmMgKQorICAgICAgICByZXR1cm4gcmM7CisKKyAgICBpZiAoIHBheWxvYWQtPnhlbl9kZXAubGVu
ICE9IGxlbiB8fCBtZW1jbXAoaWQsIHBheWxvYWQtPnhlbl9kZXAucCwgbGVuKSApIHsKKyAgICAg
ICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogY2hlY2sgYWdhaW5zdCBoeXBlcnZp
c29yIGJ1aWxkLWlkIGZhaWxlZFxuIiwKKyAgICAgICAgICAgICAgIHBheWxvYWQtPm5hbWUpOwor
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICB9CisKKyAgICByZXR1cm4gMDsKK30KKwogc3Rh
dGljIGludCBjaGVja19zcGVjaWFsX3NlY3Rpb25zKGNvbnN0IHN0cnVjdCBsaXZlcGF0Y2hfZWxm
ICplbGYpCiB7CiAgICAgdW5zaWduZWQgaW50IGk7CiAgICAgc3RhdGljIGNvbnN0IGNoYXIgKmNv
bnN0IG5hbWVzW10gPSB7IEVMRl9MSVZFUEFUQ0hfRlVOQywKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgRUxGX0xJVkVQQVRDSF9ERVBFTkRTLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFTEZfTElWRVBBVENIX1hFTl9ERVBFTkRTLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFTEZfQlVJTERfSURfTk9U
RX07CiAgICAgREVDTEFSRV9CSVRNQVAoZm91bmQsIEFSUkFZX1NJWkUobmFtZXMpKSA9IHsgMCB9
OwogCkBAIC02MzIsNiArNjU2LDIyIEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9wYXlsb2FkKHN0cnVj
dCBwYXlsb2FkICpwYXlsb2FkLAogICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICAgfQog
CisgICAgc2VjID0gbGl2ZXBhdGNoX2VsZl9zZWNfYnlfbmFtZShlbGYsIEVMRl9MSVZFUEFUQ0hf
WEVOX0RFUEVORFMpOworICAgIGlmICggc2VjICkKKyAgICB7CisgICAgICAgIG4gPSBzZWMtPmxv
YWRfYWRkcjsKKworICAgICAgICBpZiAoIHNlYy0+c2VjLT5zaF9zaXplIDw9IHNpemVvZigqbikg
KQorICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisKKyAgICAgICAgaWYgKCB4ZW5fYnVpbGRf
aWRfY2hlY2sobiwgc2VjLT5zZWMtPnNoX3NpemUsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZwYXlsb2FkLT54ZW5fZGVwLnAsICZwYXlsb2FkLT54ZW5fZGVwLmxlbikgKQorICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisKKyAgICAgICAgaWYgKCAhcGF5bG9hZC0+eGVuX2Rl
cC5sZW4gfHwgIXBheWxvYWQtPnhlbl9kZXAucCApCisgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKKyAgICB9CisKICAgICAvKiBTZXR1cCB0aGUgdmlydHVhbCByZWdpb24gd2l0aCBwcm9wZXIg
ZGF0YS4gKi8KICAgICByZWdpb24gPSAmcGF5bG9hZC0+cmVnaW9uOwogCkBAIC04ODIsNiArOTIy
LDEwIEBAIHN0YXRpYyBpbnQgbG9hZF9wYXlsb2FkX2RhdGEoc3RydWN0IHBheWxvYWQgKnBheWxv
YWQsIHZvaWQgKnJhdywgc2l6ZV90IGxlbikKICAgICBpZiAoIHJjICkKICAgICAgICAgZ290byBv
dXQ7CiAKKyAgICByYyA9IGNoZWNrX3hlbl9idWlsZF9pZChwYXlsb2FkKTsKKyAgICBpZiAoIHJj
ICkKKyAgICAgICAgZ290byBvdXQ7CisKICAgICByYyA9IGJ1aWxkX3N5bWJvbF90YWJsZShwYXls
b2FkLCAmZWxmKTsKICAgICBpZiAoIHJjICkKICAgICAgICAgZ290byBvdXQ7CkBAIC0xNjU1LDYg
KzE2OTksOSBAQCBzdGF0aWMgdm9pZCBsaXZlcGF0Y2hfcHJpbnRhbGwodW5zaWduZWQgY2hhciBr
ZXkpCiAKICAgICAgICAgaWYgKCBkYXRhLT5kZXAubGVuICkKICAgICAgICAgICAgIHByaW50aygi
ZGVwZW5kLW9uPSUqcGhOXG4iLCBkYXRhLT5kZXAubGVuLCBkYXRhLT5kZXAucCk7CisKKyAgICAg
ICAgaWYgKCBkYXRhLT54ZW5fZGVwLmxlbiApCisgICAgICAgICAgICBwcmludGsoImRlcGVuZC1v
bi14ZW49JSpwaE5cbiIsIGRhdGEtPnhlbl9kZXAubGVuLCBkYXRhLT54ZW5fZGVwLnApOwogICAg
IH0KIAogICAgIHNwaW5fdW5sb2NrKCZwYXlsb2FkX2xvY2spOwpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUveGVuL2xpdmVwYXRjaC5oIGIveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oCmluZGV4
IDFiMTgxN2NhMGQuLmVkOTk3YWE0Y2MgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saXZl
cGF0Y2guaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoLmgKQEAgLTI5LDkgKzI5LDEw
IEBAIHN0cnVjdCB4ZW5fc3lzY3RsX2xpdmVwYXRjaF9vcDsKIC8qIENvbnZlbmllbmNlIGRlZmlu
ZSBmb3IgcHJpbnRrLiAqLwogI2RlZmluZSBMSVZFUEFUQ0ggICAgICAgICAgICAgImxpdmVwYXRj
aDogIgogLyogRUxGIHBheWxvYWQgc3BlY2lhbCBzZWN0aW9uIG5hbWVzLiAqLwotI2RlZmluZSBF
TEZfTElWRVBBVENIX0ZVTkMgICAgIi5saXZlcGF0Y2guZnVuY3MiCi0jZGVmaW5lIEVMRl9MSVZF
UEFUQ0hfREVQRU5EUyAiLmxpdmVwYXRjaC5kZXBlbmRzIgotI2RlZmluZSBFTEZfQlVJTERfSURf
Tk9URSAgICAgICIubm90ZS5nbnUuYnVpbGQtaWQiCisjZGVmaW5lIEVMRl9MSVZFUEFUQ0hfRlVO
QyAgICAgICAgIi5saXZlcGF0Y2guZnVuY3MiCisjZGVmaW5lIEVMRl9MSVZFUEFUQ0hfREVQRU5E
UyAgICAgIi5saXZlcGF0Y2guZGVwZW5kcyIKKyNkZWZpbmUgRUxGX0xJVkVQQVRDSF9YRU5fREVQ
RU5EUyAiLmxpdmVwYXRjaC54ZW5fZGVwZW5kcyIKKyNkZWZpbmUgRUxGX0JVSUxEX0lEX05PVEUg
ICAgICAgICAiLm5vdGUuZ251LmJ1aWxkLWlkIgogLyogQXJiaXRyYXJ5IGxpbWl0IGZvciBwYXls
b2FkIHNpemUgYW5kIC5ic3Mgc2VjdGlvbiBzaXplLiAqLwogI2RlZmluZSBMSVZFUEFUQ0hfTUFY
X1NJWkUgICAgIE1CKDIpCiAKZGlmZiAtLWdpdCBhL3hlbi90ZXN0L2xpdmVwYXRjaC9NYWtlZmls
ZSBiL3hlbi90ZXN0L2xpdmVwYXRjaC9NYWtlZmlsZQppbmRleCA2ODMxMzgzZGIxLi45MzhhZWUx
N2VjIDEwMDY0NAotLS0gYS94ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUKKysrIGIveGVuL3Rl
c3QvbGl2ZXBhdGNoL01ha2VmaWxlCkBAIC0xOSwxMSArMTksMTMgQEAgTElWRVBBVENIIDo9IHhl
bl9oZWxsb193b3JsZC5saXZlcGF0Y2gKIExJVkVQQVRDSF9CWUUgOj0geGVuX2J5ZV93b3JsZC5s
aXZlcGF0Y2gKIExJVkVQQVRDSF9SRVBMQUNFIDo9IHhlbl9yZXBsYWNlX3dvcmxkLmxpdmVwYXRj
aAogTElWRVBBVENIX05PUCA6PSB4ZW5fbm9wLmxpdmVwYXRjaAorTElWRVBBVENIX05PX1hFTl9C
VUlMRElEIDo9IHhlbl9ub194ZW5fYnVpbGRpZC5saXZlcGF0Y2gKIAogTElWRVBBVENIRVMgKz0g
JChMSVZFUEFUQ0gpCiBMSVZFUEFUQ0hFUyArPSAkKExJVkVQQVRDSF9CWUUpCiBMSVZFUEFUQ0hF
UyArPSAkKExJVkVQQVRDSF9SRVBMQUNFKQogTElWRVBBVENIRVMgKz0gJChMSVZFUEFUQ0hfTk9Q
KQorTElWRVBBVENIRVMgKz0gJChMSVZFUEFUQ0hfTk9fWEVOX0JVSUxESUQpCiAKIExJVkVQQVRD
SF9ERUJVR19ESVIgPz0gJChERUJVR19ESVIpL3hlbi1saXZlcGF0Y2gKIApAQCAtNTksNyArNjEs
NyBAQCBjb25maWcuaDogeGVuX2hlbGxvX3dvcmxkX2Z1bmMubwogeGVuX2hlbGxvX3dvcmxkLm86
IGNvbmZpZy5oCiAKIC5QSE9OWTogJChMSVZFUEFUQ0gpCi0kKExJVkVQQVRDSCk6IHhlbl9oZWxs
b193b3JsZF9mdW5jLm8geGVuX2hlbGxvX3dvcmxkLm8gbm90ZS5vCiskKExJVkVQQVRDSCk6IHhl
bl9oZWxsb193b3JsZF9mdW5jLm8geGVuX2hlbGxvX3dvcmxkLm8gbm90ZS5vIHhlbl9ub3RlLm8K
IAkkKExEKSAkKExERkxBR1MpICQoYnVpbGRfaWRfbGlua2VyKSAtciAtbyAkKExJVkVQQVRDSCkg
JF4KIAogIwpAQCAtNzgsNiArODAsMTcgQEAgbm90ZS5vOgogCQkgICAtLXJlbmFtZS1zZWN0aW9u
PS5kYXRhPS5saXZlcGF0Y2guZGVwZW5kcyxhbGxvYyxsb2FkLHJlYWRvbmx5LGRhdGEsY29udGVu
dHMgLVMgJEAuYmluICRACiAJcm0gLWYgJEAuYmluCiAKKyMKKyMgQXBwZW5kIC5saXZlcGF0Y2gu
eGVuX2RlcGVuZHMgc2VjdGlvbgorIyB3aXRoIFhlbiBidWlsZC1pZCBkZXJpdmVkIGZyb20geGVu
LXN5bXMuCisjCisuUEhPTlk6IHhlbl9ub3RlLm8KK3hlbl9ub3RlLm86CisJJChPQkpDT1BZKSAt
TyBiaW5hcnkgLS1vbmx5LXNlY3Rpb249Lm5vdGUuZ251LmJ1aWxkLWlkICQoQkFTRURJUikveGVu
LXN5bXMgJEAuYmluCisJJChPQkpDT1BZKSAkKE9CSkNPUFlfTUFHSUMpIFwKKwkJICAgLS1yZW5h
bWUtc2VjdGlvbj0uZGF0YT0ubGl2ZXBhdGNoLnhlbl9kZXBlbmRzLGFsbG9jLGxvYWQscmVhZG9u
bHksZGF0YSxjb250ZW50cyAtUyAkQC5iaW4gJEAKKwlybSAtZiAkQC5iaW4KKwogIwogIyBFeHRy
YWN0IHRoZSBidWlsZC1pZCBvZiB0aGUgeGVuX2hlbGxvX3dvcmxkLmxpdmVwYXRjaAogIyAod2hp
Y2ggeGVuX2J5ZV93b3JsZCB3aWxsIGRlcGVuZCBvbikuCkBAIC05MiwyMCArMTA1LDI4IEBAIGhl
bGxvX3dvcmxkX25vdGUubzogJChMSVZFUEFUQ0gpCiB4ZW5fYnllX3dvcmxkLm86IGNvbmZpZy5o
CiAKIC5QSE9OWTogJChMSVZFUEFUQ0hfQllFKQotJChMSVZFUEFUQ0hfQllFKTogeGVuX2J5ZV93
b3JsZF9mdW5jLm8geGVuX2J5ZV93b3JsZC5vIGhlbGxvX3dvcmxkX25vdGUubworJChMSVZFUEFU
Q0hfQllFKTogeGVuX2J5ZV93b3JsZF9mdW5jLm8geGVuX2J5ZV93b3JsZC5vIGhlbGxvX3dvcmxk
X25vdGUubyB4ZW5fbm90ZS5vCiAJJChMRCkgJChMREZMQUdTKSAkKGJ1aWxkX2lkX2xpbmtlcikg
LXIgLW8gJChMSVZFUEFUQ0hfQllFKSAkXgogCiB4ZW5fcmVwbGFjZV93b3JsZC5vOiBjb25maWcu
aAogCiAuUEhPTlk6ICQoTElWRVBBVENIX1JFUExBQ0UpCi0kKExJVkVQQVRDSF9SRVBMQUNFKTog
eGVuX3JlcGxhY2Vfd29ybGRfZnVuYy5vIHhlbl9yZXBsYWNlX3dvcmxkLm8gbm90ZS5vCiskKExJ
VkVQQVRDSF9SRVBMQUNFKTogeGVuX3JlcGxhY2Vfd29ybGRfZnVuYy5vIHhlbl9yZXBsYWNlX3dv
cmxkLm8gbm90ZS5vIHhlbl9ub3RlLm8KIAkkKExEKSAkKExERkxBR1MpICQoYnVpbGRfaWRfbGlu
a2VyKSAtciAtbyAkKExJVkVQQVRDSF9SRVBMQUNFKSAkXgogCiB4ZW5fbm9wLm86IGNvbmZpZy5o
CiAKIC5QSE9OWTogJChMSVZFUEFUQ0hfTk9QKQotJChMSVZFUEFUQ0hfTk9QKTogeGVuX25vcC5v
IG5vdGUubworJChMSVZFUEFUQ0hfTk9QKTogeGVuX25vcC5vIG5vdGUubyB4ZW5fbm90ZS5vCiAJ
JChMRCkgJChMREZMQUdTKSAkKGJ1aWxkX2lkX2xpbmtlcikgLXIgLW8gJChMSVZFUEFUQ0hfTk9Q
KSAkXgogCisjIFRoaXMgb25lIGFsd2F5cyBmYWlscyB1cG9uIHVwbG9hZCwgYmVjYXVzZSBpdCBk
ZWxpYmVyYXRlbHkKKyMgZG9lcyBub3QgaGF2ZSBhIC5saXZlcGF0Y2gueGVuX2RlcGVuZHMgKHhl
bl9ub3RlLm8pIHNlY3Rpb24uCit4ZW5fbm9feGVuX2J1aWxkaWQubzogY29uZmlnLmgKKworLlBI
T05ZOiAkKExJVkVQQVRDSF9OT19YRU5fQlVJTERJRCkKKyQoTElWRVBBVENIX05PX1hFTl9CVUlM
RElEKTogeGVuX25vcC5vIG5vdGUubworCSQoTEQpICQoTERGTEFHUykgJChidWlsZF9pZF9saW5r
ZXIpIC1yIC1vICQoTElWRVBBVENIX05PX1hFTl9CVUlMRElEKSAkXgorCiAuUEhPTlk6IGxpdmVw
YXRjaAotbGl2ZXBhdGNoOiAkKExJVkVQQVRDSCkgJChMSVZFUEFUQ0hfQllFKSAkKExJVkVQQVRD
SF9SRVBMQUNFKSAkKExJVkVQQVRDSF9OT1ApCitsaXZlcGF0Y2g6ICQoTElWRVBBVENIKSAkKExJ
VkVQQVRDSF9CWUUpICQoTElWRVBBVENIX1JFUExBQ0UpICQoTElWRVBBVENIX05PUCkgJChMSVZF
UEFUQ0hfTk9fWEVOX0JVSUxESUQpCi0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBD
ZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRz
ZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4g
YW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJl
cmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
