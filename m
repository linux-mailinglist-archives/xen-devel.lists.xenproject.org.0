Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A493E8EA46
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 13:30:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyDup-0005ue-GH; Thu, 15 Aug 2019 11:27:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WRoS=WL=amazon.de=prvs=123ba6262=wipawel@srs-us1.protection.inumbo.net>)
 id 1hyDun-0005tv-JE
 for xen-devel@lists.xen.org; Thu, 15 Aug 2019 11:27:33 +0000
X-Inumbo-ID: aa8609bc-bf4f-11e9-8b9a-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa8609bc-bf4f-11e9-8b9a-12813bfff9fa;
 Thu, 15 Aug 2019 11:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565868450; x=1597404450;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=7k567wG9K2hRNMwJjysulFjLcC64lTQfbo5bK7gG7TA=;
 b=u/Ee4iTbJ40n4wcA2K77bykdG2h4wHhkF/tODp/LjuSjP/nFtVzUkGY2
 ZW4NbokwMWcIeSfwevxgKK0L/TXXNMEmdEckRV+JnplDHA3wLIGTKDwrs
 wFg47pLMtGnF3w5V60ouxodq4hU3ylhv91qS3oJLnPOKDCKMTJnn+8BkY U=;
X-IronPort-AV: E=Sophos;i="5.64,389,1559520000"; d="scan'208";a="820106037"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 15 Aug 2019 11:27:27 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id E31B4A22F2; Thu, 15 Aug 2019 11:27:26 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 15 Aug 2019 11:27:26 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 15 Aug 2019 11:27:25 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 15 Aug 2019 11:27:23 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Thu, 15 Aug 2019 11:27:08 +0000
Message-ID: <20190815112708.11474-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH lp-metadata 2/3] livepatch: Handle arbitrary
 size names with the list operation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 mpohlack@amazon.de, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHBheWxvYWRzJyBuYW1lIHN0cmluZ3MgY2FuIGJlIG9mIGFyYml0cmFyeSBzaXplICh0eXBp
Y2FsbHkgc21hbGwKd2l0aCBhbiB1cHBlciBib3VuZCBvZiBYRU5fTElWRVBBVENIX05BTUVfU0la
RSkuCkN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgdGhlIGxpc3Qgb3BlcmF0aW9uIGludGVyZmFj
ZSBhbGxvd3MgdG8gY29weQpuYW1lcyBpbiB0aGUgWEVOX0xJVkVQQVRDSF9OQU1FX1NJWkUgY2h1
bmtzIHJlZ2FyZGxlc3Mgb2YgaXRzIGFjdHVhbApzaXplIGFuZCBlbmZvcmNlcyBzcGFjZSBhbGxv
Y2F0aW9uIHJlcXVpcmVtZW50cyBvbiB1c2VybGFuZCB0b29scy4KClRvIHVuaWZ5IGFuZCBzaW1w
bGlmeSB0aGUgaW50ZXJmYWNlLCBoYW5kbGUgdGhlIG5hbWUgc3RyaW5ncyBvZgphcmJpdHJhcnkg
c2l6ZSBieSBjb3B5aW5nIHRoZW0gaW4gYWRoZXJpbmcgY2h1bmtzIHRvIHRoZSB1c2VybGFuZC4K
SW4gb3JkZXIgdG8gbGV0IHRoZSB1c2VybGFuZCBhbGxvY2F0ZSBlbm91Z2ggc3BhY2UgZm9yIHRo
ZSBpbmNvbWluZwpkYXRhIGFkZCBhbiBhdXhpbGlhcnkgaW50ZXJmYWNlIHhjX2xpdmVwYXRjaF9s
aXN0X2dldF9zaXplcygpIHRoYXQKcHJvdmlkZXMgdGhlIGN1cnJlbnQgbnVtYmVyIG9mIHBheWxv
YWQgZW50cmllcyBhbmQgdGhlIHRvdGFsIHNpemUgb2YKYWxsIG5hbWUgc3RyaW5ncy4gVGhpcyBp
cyBhY2hpZXZlZCBieSBleHRlbmRpbmcgdGhlIHN5c2N0bCBsaXN0CmludGVyZmFjZSB3aXRoIGFu
IGV4dHJhIGZpZWxkczogbmFtZV90b3RhbF9zaXplLgoKVGhlIHhjX2xpdmVwYXRjaF9saXN0X2dl
dF9zaXplcygpIGlzc3VlcyB0aGUgbGl2ZXBhdGNoIHN5c2N0bCBsaXN0Cm9wZXJhdGlvbiB3aXRo
IHRoZSBuciBmaWVsZCBzZXQgdG8gMC4gSW4gdGhpcyBtb2RlIHRoZSBvcGVyYXRpb24KcmV0dXJu
cyB0aGUgbnVtYmVyIG9mIHBheWxvYWQgZW50cmllcyBhbmQgY2FsY3VsYXRlcyB0aGUgdG90YWwg
c2l6ZXMKZm9yIGFsbCBwYXlsb2FkcycgbmFtZXMuCldoZW4gdGhlIHN5c2N0bCBvcGVyYXRpb24g
aXMgaXNzdWVkIHdpdGggYSBub24temVybyBuciBmaWVsZCAoZm9yCmluc3RhbmNlIHdpdGggYSB2
YWx1ZSBvYnRhaW5lZCBlYXJsaWVyIHdpdGggdGhlIHByaW9yIGNhbGwgdG8gdGhlCnhjX2xpdmVw
YXRjaF9saXN0X2dldF9zaXplcygpKSB0aGUgbmV3IGZpZWxkIG5hbWVfdG90YWxfc2l6ZSBwcm92
aWRlcwp0aGUgdG90YWwgc2l6ZSBvZiBhY3R1YWxseSBjb3BpZWQgZGF0YS4KCkV4dGVuZCB0aGUg
bGlieGMgdG8gaGFuZGxlIHRoZSBuYW1lIGJhY2stdG8tYmFjayBkYXRhIHRyYW5zZmVycy4KClRo
ZSB4ZW4tbGl2ZXBhdGNoIHRvb2wgaXMgbW9kaWZpZWQgdG8gc3RhcnQgdGhlIGxpc3Qgb3BlcmF0
aW9uIHdpdGggYQpjYWxsIHRvIHRoZSB4Y19saXZlcGF0Y2hfbGlzdF9nZXRfc2l6ZXMoKSB0byBv
YnRhaW4gdGhlIGFjdHVhbCBudW1iZXIKb2YgcGF5bG9hZHMgYXMgd2VsbCBhcyB0aGUgbmVjZXNz
YXJ5IHNwYWNlIGZvciBuYW1lcy4KVGhlIHRvb2wgbm93IGFsd2F5cyByZXF1ZXN0cyB0aGUgYWN0
dWFsIG51bWJlciBvZiBlbnRyaWVzIGFuZCBsZWF2ZXMKdGhlIHByZWVtcHRpb24gaGFuZGxpbmcg
dG8gdGhlIGxpYnhjIHJvdXRpbmUuIFRoZSBsaWJ4YyBzdGlsbCByZXR1cm5zCidkb25lJyBhbmQg
J2xlZnQnIHBhcmFtZXRlcnMgd2l0aCB0aGUgc2FtZSBzZW1hbnRpYyBhbGxvd2luZyB0aGUgdG9v
bAp0byBkZXRlY3QgYW5vbWFsaWVzIGFuZCByZWFjdCB0byB0aGVtLiBBdCB0aGUgbW9tZW50IGl0
IGlzIGV4cGVjdGVkCnRoYXQgdGhlIHRvb2wgcmVjZWl2ZXMgdGhlIGV4YWN0IG51bWJlciBvZiBl
bnRpcmVzIGFzIHJlcXVlc3RlZC4KVGhlIHhlbi1saXZlcGF0Y2ggdG9vbCBoYXMgYmVlbiBhbHNv
IG1vZGlmaWVkIHRvIGhhbmRsZSB0aGUgbmFtZQpiYWNrLXRvLWJhY2sgdHJhbnNmZXJzIGNvcnJl
Y3RseS4KClNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpv
bi5kZT4KUmV2aWV3ZWQtYnk6IEFuZHJhLUlyaW5hIFBhcmFzY2hpdiA8YW5kcmFwcnNAYW1hem9u
LmNvbT4KUmV2aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+ClJldmll
d2VkLWJ5OiBNYXJ0aW4gUG9obGFjayA8bXBvaGxhY2tAYW1hem9uLmRlPgotLS0KIHRvb2xzL2xp
YnhjL2luY2x1ZGUveGVuY3RybC5oIHwgIDQ5ICsrKysrKysrKysrKy0tLS0tLQogdG9vbHMvbGli
eGMveGNfbWlzYy5jICAgICAgICAgfCAxMDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLQogdG9vbHMvbWlzYy94ZW4tbGl2ZXBhdGNoLmMgICAgfCAxMTIgKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vY29tbW9uL2xpdmVwYXRjaC5jICAg
ICAgICB8ICAzMSArKysrKysrKystLS0KIHhlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCAgIHwg
IDE1ICsrKy0tLQogNSBmaWxlcyBjaGFuZ2VkLCAyMDQgaW5zZXJ0aW9ucygrKSwgMTAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oIGIvdG9v
bHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgKaW5kZXggNzI1Njk3YzEzMi4uZTBlYmI1ODZiNiAx
MDA2NDQKLS0tIGEvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgKKysrIGIvdG9vbHMvbGli
eGMvaW5jbHVkZS94ZW5jdHJsLmgKQEAgLTI1NjAsNyArMjU2MCwyNSBAQCBpbnQgeGNfbGl2ZXBh
dGNoX2dldCh4Y19pbnRlcmZhY2UgKnhjaCwKICAgICAgICAgICAgICAgICAgICAgIHhlbl9saXZl
cGF0Y2hfc3RhdHVzX3QgKnN0YXR1cyk7CiAKIC8qCi0gKiBUaGUgaGVhcnQgb2YgdGhpcyBmdW5j
dGlvbiBpcyB0byBnZXQgYW4gYXJyYXkgb2YgeGVuX2xpdmVwYXRjaF9zdGF0dXNfdC4KKyAqIEdl
dCBhIG51bWJlciBvZiBhdmFpbGFibGUgcGF5bG9hZHMgYW5kIGdldCBhY3R1YWwgdG90YWwgc2l6
ZSBvZgorICogdGhlIHBheWxvYWRzJyBuYW1lIGFycmF5LgorICoKKyAqIFRoaXMgZnVuY3Rpb25z
IGlzIHR5cGljYWxseSBleGVjdXRlZCBmaXJzdCBiZWZvcmUgdGhlIHhjX2xpdmVwYXRjaF9saXN0
KCkKKyAqIHRvIG9idGFpbiB0aGUgc2l6ZXMgYW5kIGNvcnJlY3RseSBhbGxvY2F0ZSBhbGwgbmVj
ZXNzYXJ5IGRhdGEgcmVzb3VyY2VzLgorICoKKyAqIFRoZSByZXR1cm4gdmFsdWUgaXMgemVybyBp
ZiB0aGUgaHlwZXJjYWxsIGNvbXBsZXRlZCBzdWNjZXNzZnVsbHkuCisgKgorICogSWYgdGhlcmUg
d2FzIGFuIGVycm9yIHBlcmZvcm1pbmcgdGhlIHN5c2N0bCBvcGVyYXRpb24sIHRoZSByZXR1cm4g
dmFsdWUKKyAqIHdpbGwgY29udGFpbiB0aGUgaHlwZXJjYWxsIGVycm9yIGNvZGUgdmFsdWUuCisg
Ki8KK2ludCB4Y19saXZlcGF0Y2hfbGlzdF9nZXRfc2l6ZXMoeGNfaW50ZXJmYWNlICp4Y2gsIHVu
c2lnbmVkIGludCAqbnIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90
ICpuYW1lX3RvdGFsX3NpemUpOworCisvKgorICogVGhlIGhlYXJ0IG9mIHRoaXMgZnVuY3Rpb24g
aXMgdG8gZ2V0IGFuIGFycmF5IG9mIHRoZSBmb2xsb3dpbmcgb2JqZWN0czoKKyAqICAgLSB4ZW5f
bGl2ZXBhdGNoX3N0YXR1c190OiBzdGF0ZXMgYW5kIHJldHVybiBjb2RlcyBvZiBwYXlsb2Fkcwor
ICogICAtIG5hbWU6IG5hbWVzIG9mIHBheWxvYWRzCisgKiAgIC0gbGVuOiBsZW5ndGhzIG9mIGNv
cnJlc3BvbmRpbmcgcGF5bG9hZHMnIG5hbWVzCiAgKgogICogSG93ZXZlciBpdCBpcyBjb21wbGV4
IGJlY2F1c2UgaXQgaGFzIHRvIGRlYWwgd2l0aCB0aGUgaHlwZXJ2aXNvcgogICogcmV0dXJuaW5n
IHNvbWUgb2YgdGhlIHJlcXVlc3RlZCBkYXRhIG9yIGRhdGEgYmVpbmcgc3RhbGUKQEAgLTI1NzEs
MjEgKzI1ODksMjAgQEAgaW50IHhjX2xpdmVwYXRjaF9nZXQoeGNfaW50ZXJmYWNlICp4Y2gsCiAg
KiAnbGVmdCcgYXJlIGFsc28gdXBkYXRlZCB3aXRoIHRoZSBudW1iZXIgb2YgZW50cmllcyBmaWxs
ZWQgb3V0CiAgKiBhbmQgcmVzcGVjdGl2ZWx5IHRoZSBudW1iZXIgb2YgZW50cmllcyBsZWZ0IHRv
IGdldCBmcm9tIGh5cGVydmlzb3IuCiAgKgotICogSXQgaXMgZXhwZWN0ZWQgdGhhdCB0aGUgY2Fs
bGVyIG9mIHRoaXMgZnVuY3Rpb24gd2lsbCB0YWtlIHRoZQotICogJ2xlZnQnIGFuZCB1c2UgdGhl
IHZhbHVlIGZvciAnc3RhcnQnLiBUaGlzIHdheSB3ZSBoYXZlIGFuCi0gKiBjdXJzb3IgaW4gdGhl
IGFycmF5LiBOb3RlIHRoYXQgdGhlICdpbmZvJywnbmFtZScsIGFuZCAnbGVuJyB3aWxsCi0gKiBi
ZSB1cGRhdGVkIGF0IHRoZSBzdWJzZXF1ZW50IGNhbGxzLgorICogSXQgaXMgZXhwZWN0ZWQgdGhh
dCB0aGUgY2FsbGVyIG9mIHRoaXMgZnVuY3Rpb24gd2lsbCBmaXJzdCBpc3N1ZSB0aGUKKyAqIHhj
X2xpdmVwYXRjaF9saXN0X2dldF9zaXplcygpIGluIG9yZGVyIHRvIG9idGFpbiB0b3RhbCBzaXpl
cyBvZiBuYW1lcworICogYXMgd2VsbCBhcyB0aGUgY3VycmVudCBudW1iZXIgb2YgcGF5bG9hZCBl
bnRyaWVzLgorICogVGhlIHRvdGFsIHNpemVzIGFyZSByZXF1aXJlZCBhbmQgc3VwcGxpZWQgdmlh
IHRoZSAnbmFtZV90b3RhbF9zaXplJworICogcGFyYW1ldGVyLgogICoKLSAqIFRoZSAnbWF4JyBp
cyB0byBiZSBwcm92aWRlZCBieSB0aGUgY2FsbGVyIHdpdGggdGhlIG1heGltdW0KLSAqIG51bWJl
ciBvZiBlbnRyaWVzIHRoYXQgJ2luZm8nLCAnbmFtZScsIGFuZCAnbGVuJyBhcnJheXMgY2FuCi0g
KiBiZSBmaWxsZWQgdXAgd2l0aC4KLSAqCi0gKiBFYWNoIGVudHJ5IGluIHRoZSAnbmFtZScgYXJy
YXkgaXMgZXhwZWN0ZWQgdG8gYmUgb2YgWEVOX0xJVkVQQVRDSF9OQU1FX1NJWkUKLSAqIGxlbmd0
aC4KKyAqIFRoZSAnbWF4JyBpcyB0byBiZSBwcm92aWRlZCBieSB0aGUgY2FsbGVyIHdpdGggdGhl
IG1heGltdW0gbnVtYmVyIG9mCisgKiBlbnRyaWVzIHRoYXQgJ2luZm8nLCAnbmFtZScsICdsZW4n
IGFycmF5cyBjYW4gYmUgZmlsbGVkIHVwIHdpdGguCiAgKgogICogRWFjaCBlbnRyeSBpbiB0aGUg
J2luZm8nIGFycmF5IGlzIGV4cGVjdGVkIHRvIGJlIG9mIHhlbl9saXZlcGF0Y2hfc3RhdHVzX3QK
ICAqIHN0cnVjdHVyZSBzaXplLgogICoKKyAqIEVhY2ggZW50cnkgaW4gdGhlICduYW1lJyBhcnJh
eSBtYXkgaGF2ZSBhbiBhcmJpdHJhcnkgc2l6ZS4KKyAqCiAgKiBFYWNoIGVudHJ5IGluIHRoZSAn
bGVuJyBhcnJheSBpcyBleHBlY3RlZCB0byBiZSBvZiB1aW50MzJfdCBzaXplLgogICoKICAqIFRo
ZSByZXR1cm4gdmFsdWUgaXMgemVybyBpZiB0aGUgaHlwZXJjYWxsIGNvbXBsZXRlZCBzdWNjZXNz
ZnVsbHkuCkBAIC0yNTk3LDEwICsyNjE0LDEyIEBAIGludCB4Y19saXZlcGF0Y2hfZ2V0KHhjX2lu
dGVyZmFjZSAqeGNoLAogICogd2lsbCBjb250YWluIHRoZSBudW1iZXIgb2YgZW50cmllcyB0aGF0
IGhhZCBiZWVuIHN1Y2Nlc2Z1bGx5CiAgKiByZXRyaWV2ZWQgKGlmIGFueSkuCiAgKi8KLWludCB4
Y19saXZlcGF0Y2hfbGlzdCh4Y19pbnRlcmZhY2UgKnhjaCwgdW5zaWduZWQgaW50IG1heCwgdW5z
aWduZWQgaW50IHN0YXJ0LAotICAgICAgICAgICAgICAgICAgICAgIHhlbl9saXZlcGF0Y2hfc3Rh
dHVzX3QgKmluZm8sIGNoYXIgKm5hbWUsCi0gICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qg
KmxlbiwgdW5zaWduZWQgaW50ICpkb25lLAotICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCAqbGVmdCk7CitpbnQgeGNfbGl2ZXBhdGNoX2xpc3QoeGNfaW50ZXJmYWNlICp4Y2gsIGNv
bnN0IHVuc2lnbmVkIGludCBtYXgsCisgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdW5zaWdu
ZWQgaW50IHN0YXJ0LAorICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5fbGl2ZXBhdGNo
X3N0YXR1cyAqaW5mbywKKyAgICAgICAgICAgICAgICAgICAgICBjaGFyICpuYW1lLCB1aW50MzJf
dCAqbGVuLAorICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVpbnQ2NF90IG5hbWVfdG90YWxf
c2l6ZSwKKyAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmRvbmUsIHVuc2lnbmVk
IGludCAqbGVmdCk7CiAKIC8qCiAgKiBUaGUgb3BlcmF0aW9ucyBhcmUgYXN5bmNocm9ub3VzIGFu
ZCB0aGUgaHlwZXJ2aXNvciBtYXkgdGFrZSBhIHdoaWxlCmRpZmYgLS1naXQgYS90b29scy9saWJ4
Yy94Y19taXNjLmMgYi90b29scy9saWJ4Yy94Y19taXNjLmMKaW5kZXggYThlOWU3ZDFlMi4uZDc4
N2YzZjI5ZiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGMveGNfbWlzYy5jCisrKyBiL3Rvb2xzL2xp
YnhjL3hjX21pc2MuYwpAQCAtNjYyLDcgKzY2Miw0OCBAQCBpbnQgeGNfbGl2ZXBhdGNoX2dldCh4
Y19pbnRlcmZhY2UgKnhjaCwKIH0KIAogLyoKLSAqIFRoZSBoZWFydCBvZiB0aGlzIGZ1bmN0aW9u
IGlzIHRvIGdldCBhbiBhcnJheSBvZiB4ZW5fbGl2ZXBhdGNoX3N0YXR1c190LgorICogR2V0IGEg
bnVtYmVyIG9mIGF2YWlsYWJsZSBwYXlsb2FkcyBhbmQgZ2V0IGFjdHVhbCB0b3RhbCBzaXplIG9m
CisgKiB0aGUgcGF5bG9hZHMnIG5hbWUgYXJyYXkuCisgKgorICogVGhpcyBmdW5jdGlvbnMgaXMg
dHlwaWNhbGx5IGV4ZWN1dGVkIGZpcnN0IGJlZm9yZSB0aGUgeGNfbGl2ZXBhdGNoX2xpc3QoKQor
ICogdG8gb2J0YWluIHRoZSBzaXplcyBhbmQgY29ycmVjdGx5IGFsbG9jYXRlIGFsbCBuZWNlc3Nh
cnkgZGF0YSByZXNvdXJjZXMuCisgKgorICogVGhlIHJldHVybiB2YWx1ZSBpcyB6ZXJvIGlmIHRo
ZSBoeXBlcmNhbGwgY29tcGxldGVkIHN1Y2Nlc3NmdWxseS4KKyAqCisgKiBJZiB0aGVyZSB3YXMg
YW4gZXJyb3IgcGVyZm9ybWluZyB0aGUgc3lzY3RsIG9wZXJhdGlvbiwgdGhlIHJldHVybiB2YWx1
ZQorICogd2lsbCBjb250YWluIHRoZSBoeXBlcmNhbGwgZXJyb3IgY29kZSB2YWx1ZS4KKyAqLwor
aW50IHhjX2xpdmVwYXRjaF9saXN0X2dldF9zaXplcyh4Y19pbnRlcmZhY2UgKnhjaCwgdW5zaWdu
ZWQgaW50ICpuciwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgKm5h
bWVfdG90YWxfc2l6ZSkKK3sKKyAgICBERUNMQVJFX1NZU0NUTDsKKyAgICBpbnQgcmM7CisKKyAg
ICBpZiAoICFuciB8fCAhbmFtZV90b3RhbF9zaXplICkKKyAgICB7CisgICAgICAgIGVycm5vID0g
RUlOVkFMOworICAgICAgICByZXR1cm4gLTE7CisgICAgfQorCisgICAgbWVtc2V0KCZzeXNjdGws
IDAsIHNpemVvZihzeXNjdGwpKTsKKyAgICBzeXNjdGwuY21kID0gWEVOX1NZU0NUTF9saXZlcGF0
Y2hfb3A7CisgICAgc3lzY3RsLnUubGl2ZXBhdGNoLmNtZCA9IFhFTl9TWVNDVExfTElWRVBBVENI
X0xJU1Q7CisKKyAgICByYyA9IGRvX3N5c2N0bCh4Y2gsICZzeXNjdGwpOworICAgIGlmICggcmMg
KQorICAgICAgICByZXR1cm4gcmM7CisKKyAgICAqbnIgPSBzeXNjdGwudS5saXZlcGF0Y2gudS5s
aXN0Lm5yOworICAgICpuYW1lX3RvdGFsX3NpemUgPSBzeXNjdGwudS5saXZlcGF0Y2gudS5saXN0
Lm5hbWVfdG90YWxfc2l6ZTsKKworICAgIHJldHVybiAwOworfQorCisvKgorICogVGhlIGhlYXJ0
IG9mIHRoaXMgZnVuY3Rpb24gaXMgdG8gZ2V0IGFuIGFycmF5IG9mIHRoZSBmb2xsb3dpbmcgb2Jq
ZWN0czoKKyAqICAgLSB4ZW5fbGl2ZXBhdGNoX3N0YXR1c190OiBzdGF0ZXMgYW5kIHJldHVybiBj
b2RlcyBvZiBwYXlsb2FkcworICogICAtIG5hbWU6IG5hbWVzIG9mIHBheWxvYWRzCisgKiAgIC0g
bGVuOiBsZW5ndGhzIG9mIGNvcnJlc3BvbmRpbmcgcGF5bG9hZHMnIG5hbWVzCiAgKgogICogSG93
ZXZlciBpdCBpcyBjb21wbGV4IGJlY2F1c2UgaXQgaGFzIHRvIGRlYWwgd2l0aCB0aGUgaHlwZXJ2
aXNvcgogICogcmV0dXJuaW5nIHNvbWUgb2YgdGhlIHJlcXVlc3RlZCBkYXRhIG9yIGRhdGEgYmVp
bmcgc3RhbGUKQEAgLTY3MywyMSArNzE0LDIwIEBAIGludCB4Y19saXZlcGF0Y2hfZ2V0KHhjX2lu
dGVyZmFjZSAqeGNoLAogICogJ2xlZnQnIGFyZSBhbHNvIHVwZGF0ZWQgd2l0aCB0aGUgbnVtYmVy
IG9mIGVudHJpZXMgZmlsbGVkIG91dAogICogYW5kIHJlc3BlY3RpdmVseSB0aGUgbnVtYmVyIG9m
IGVudHJpZXMgbGVmdCB0byBnZXQgZnJvbSBoeXBlcnZpc29yLgogICoKLSAqIEl0IGlzIGV4cGVj
dGVkIHRoYXQgdGhlIGNhbGxlciBvZiB0aGlzIGZ1bmN0aW9uIHdpbGwgdGFrZSB0aGUKLSAqICds
ZWZ0JyBhbmQgdXNlIHRoZSB2YWx1ZSBmb3IgJ3N0YXJ0Jy4gVGhpcyB3YXkgd2UgaGF2ZSBhbgot
ICogY3Vyc29yIGluIHRoZSBhcnJheS4gTm90ZSB0aGF0IHRoZSAnaW5mbycsJ25hbWUnLCBhbmQg
J2xlbicgd2lsbAotICogYmUgdXBkYXRlZCBhdCB0aGUgc3Vic2VxdWVudCBjYWxscy4KKyAqIEl0
IGlzIGV4cGVjdGVkIHRoYXQgdGhlIGNhbGxlciBvZiB0aGlzIGZ1bmN0aW9uIHdpbGwgZmlyc3Qg
aXNzdWUgdGhlCisgKiB4Y19saXZlcGF0Y2hfbGlzdF9nZXRfc2l6ZXMoKSBpbiBvcmRlciB0byBv
YnRhaW4gdG90YWwgc2l6ZXMgb2YgbmFtZXMKKyAqIGFzIHdlbGwgYXMgdGhlIGN1cnJlbnQgbnVt
YmVyIG9mIHBheWxvYWQgZW50cmllcy4KKyAqIFRoZSB0b3RhbCBzaXplcyBhcmUgcmVxdWlyZWQg
YW5kIHN1cHBsaWVkIHZpYSB0aGUgJ25hbWVfdG90YWxfc2l6ZScKKyAqIHBhcmFtZXRlci4KICAq
Ci0gKiBUaGUgJ21heCcgaXMgdG8gYmUgcHJvdmlkZWQgYnkgdGhlIGNhbGxlciB3aXRoIHRoZSBt
YXhpbXVtCi0gKiBudW1iZXIgb2YgZW50cmllcyB0aGF0ICdpbmZvJywgJ25hbWUnLCBhbmQgJ2xl
bicgYXJyYXlzIGNhbgotICogYmUgZmlsbGVkIHVwIHdpdGguCi0gKgotICogRWFjaCBlbnRyeSBp
biB0aGUgJ25hbWUnIGFycmF5IGlzIGV4cGVjdGVkIHRvIGJlIG9mIFhFTl9MSVZFUEFUQ0hfTkFN
RV9TSVpFCi0gKiBsZW5ndGguCisgKiBUaGUgJ21heCcgaXMgdG8gYmUgcHJvdmlkZWQgYnkgdGhl
IGNhbGxlciB3aXRoIHRoZSBtYXhpbXVtIG51bWJlciBvZgorICogZW50cmllcyB0aGF0ICdpbmZv
JywgJ25hbWUnLCAnbGVuJyBhcnJheXMgY2FuIGJlIGZpbGxlZCB1cCB3aXRoLgogICoKICAqIEVh
Y2ggZW50cnkgaW4gdGhlICdpbmZvJyBhcnJheSBpcyBleHBlY3RlZCB0byBiZSBvZiB4ZW5fbGl2
ZXBhdGNoX3N0YXR1c190CiAgKiBzdHJ1Y3R1cmUgc2l6ZS4KICAqCisgKiBFYWNoIGVudHJ5IGlu
IHRoZSAnbmFtZScgYXJyYXkgbWF5IGhhdmUgYW4gYXJiaXRyYXJ5IHNpemUuCisgKgogICogRWFj
aCBlbnRyeSBpbiB0aGUgJ2xlbicgYXJyYXkgaXMgZXhwZWN0ZWQgdG8gYmUgb2YgdWludDMyX3Qg
c2l6ZS4KICAqCiAgKiBUaGUgcmV0dXJuIHZhbHVlIGlzIHplcm8gaWYgdGhlIGh5cGVyY2FsbCBj
b21wbGV0ZWQgc3VjY2Vzc2Z1bGx5LgpAQCAtNjk5LDExICs3MzksMTIgQEAgaW50IHhjX2xpdmVw
YXRjaF9nZXQoeGNfaW50ZXJmYWNlICp4Y2gsCiAgKiB3aWxsIGNvbnRhaW4gdGhlIG51bWJlciBv
ZiBlbnRyaWVzIHRoYXQgaGFkIGJlZW4gc3VjY2VzZnVsbHkKICAqIHJldHJpZXZlZCAoaWYgYW55
KS4KICAqLwotaW50IHhjX2xpdmVwYXRjaF9saXN0KHhjX2ludGVyZmFjZSAqeGNoLCB1bnNpZ25l
ZCBpbnQgbWF4LCB1bnNpZ25lZCBpbnQgc3RhcnQsCitpbnQgeGNfbGl2ZXBhdGNoX2xpc3QoeGNf
aW50ZXJmYWNlICp4Y2gsIGNvbnN0IHVuc2lnbmVkIGludCBtYXgsCisgICAgICAgICAgICAgICAg
ICAgICAgY29uc3QgdW5zaWduZWQgaW50IHN0YXJ0LAogICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCB4ZW5fbGl2ZXBhdGNoX3N0YXR1cyAqaW5mbywKICAgICAgICAgICAgICAgICAgICAgICBj
aGFyICpuYW1lLCB1aW50MzJfdCAqbGVuLAotICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCAqZG9uZSwKLSAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmxlZnQpCisg
ICAgICAgICAgICAgICAgICAgICAgY29uc3QgdWludDY0X3QgbmFtZV90b3RhbF9zaXplLAorICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqZG9uZSwgdW5zaWduZWQgaW50ICpsZWZ0
KQogewogICAgIGludCByYzsKICAgICBERUNMQVJFX1NZU0NUTDsKQEAgLTcxNCwyNyArNzU1LDMz
IEBAIGludCB4Y19saXZlcGF0Y2hfbGlzdCh4Y19pbnRlcmZhY2UgKnhjaCwgdW5zaWduZWQgaW50
IG1heCwgdW5zaWduZWQgaW50IHN0YXJ0LAogICAgIHVpbnQzMl90IG1heF9iYXRjaF9zeiwgbnI7
CiAgICAgdWludDMyX3QgdmVyc2lvbiA9IDAsIHJldHJpZXMgPSAwOwogICAgIHVpbnQzMl90IGFk
anVzdCA9IDA7Ci0gICAgc3NpemVfdCBzejsKKyAgICBvZmZfdCBuYW1lX29mZiA9IDA7CisgICAg
dWludDY0X3QgbmFtZV9zejsKIAotICAgIGlmICggIW1heCB8fCAhaW5mbyB8fCAhbmFtZSB8fCAh
bGVuICkKKyAgICBpZiAoICFtYXggfHwgIWluZm8gfHwgIW5hbWUgfHwgIWxlbiB8fCAhZG9uZSB8
fCAhbGVmdCApCiAgICAgewogICAgICAgICBlcnJubyA9IEVJTlZBTDsKICAgICAgICAgcmV0dXJu
IC0xOwogICAgIH0KIAorICAgIGlmICggbmFtZV90b3RhbF9zaXplID09IDAgKQorICAgIHsKKyAg
ICAgICAgZXJybm8gPSBFTk9FTlQ7CisgICAgICAgIHJldHVybiAtMTsKKyAgICB9CisKKyAgICBt
ZW1zZXQoJnN5c2N0bCwgMCwgc2l6ZW9mKHN5c2N0bCkpOwogICAgIHN5c2N0bC5jbWQgPSBYRU5f
U1lTQ1RMX2xpdmVwYXRjaF9vcDsKICAgICBzeXNjdGwudS5saXZlcGF0Y2guY21kID0gWEVOX1NZ
U0NUTF9MSVZFUEFUQ0hfTElTVDsKLSAgICBzeXNjdGwudS5saXZlcGF0Y2gucGFkID0gMDsKLSAg
ICBzeXNjdGwudS5saXZlcGF0Y2gudS5saXN0LnZlcnNpb24gPSAwOwogICAgIHN5c2N0bC51Lmxp
dmVwYXRjaC51Lmxpc3QuaWR4ID0gc3RhcnQ7Ci0gICAgc3lzY3RsLnUubGl2ZXBhdGNoLnUubGlz
dC5wYWQgPSAwOwogCiAgICAgbWF4X2JhdGNoX3N6ID0gbWF4OwotICAgIC8qIENvbnZpZW5jZSB2
YWx1ZS4gKi8KLSAgICBzeiA9IHNpemVvZigqbmFtZSkgKiBYRU5fTElWRVBBVENIX05BTUVfU0la
RTsKKyAgICBuYW1lX3N6ID0gbmFtZV90b3RhbF9zaXplOwogICAgICpkb25lID0gMDsKICAgICAq
bGVmdCA9IDA7CiAgICAgZG8geworICAgICAgICB1aW50NjRfdCBfbmFtZV9zejsKKwogICAgICAg
ICAvKgogICAgICAgICAgKiBUaGUgZmlyc3QgdGltZSB3ZSBnbyBpbiB0aGlzIGxvb3Agb3VyICdt
YXgnIG1heSBiZSBiaWdnZXIKICAgICAgICAgICogdGhhbiB3aGF0IHRoZSBoeXBlcnZpc29yIGlz
IGNvbWZvcnRhYmxlIHdpdGggLSBoZW5jZSB0aGUgZmlyc3QKQEAgLTc1NCwxMSArODAxLDExIEBA
IGludCB4Y19saXZlcGF0Y2hfbGlzdCh4Y19pbnRlcmZhY2UgKnhjaCwgdW5zaWduZWQgaW50IG1h
eCwgdW5zaWduZWQgaW50IHN0YXJ0LAogICAgICAgICBzeXNjdGwudS5saXZlcGF0Y2gudS5saXN0
Lm5yID0gbnI7CiAgICAgICAgIC8qIEZpeCB0aGUgc2l6ZSAobWF5IHZhcnkgYmV0d2VlbiBoeXBl
cmNhbGxzKS4gKi8KICAgICAgICAgSFlQRVJDQUxMX0JPVU5DRV9TRVRfU0laRShpbmZvLCBuciAq
IHNpemVvZigqaW5mbykpOwotICAgICAgICBIWVBFUkNBTExfQk9VTkNFX1NFVF9TSVpFKG5hbWUs
IG5yICogbnIpOworICAgICAgICBIWVBFUkNBTExfQk9VTkNFX1NFVF9TSVpFKG5hbWUsIG5hbWVf
c3opOwogICAgICAgICBIWVBFUkNBTExfQk9VTkNFX1NFVF9TSVpFKGxlbiwgbnIgKiBzaXplb2Yo
KmxlbikpOwogICAgICAgICAvKiBNb3ZlIHRoZSBwb2ludGVyIHRvIHByb3BlciBvZmZzZXQgaW50
byAnaW5mbycuICovCiAgICAgICAgIChIWVBFUkNBTExfQlVGRkVSKGluZm8pKS0+dWJ1ZiA9IGlu
Zm8gKyAqZG9uZTsKLSAgICAgICAgKEhZUEVSQ0FMTF9CVUZGRVIobmFtZSkpLT51YnVmID0gbmFt
ZSArIChzeiAqICpkb25lKTsKKyAgICAgICAgKEhZUEVSQ0FMTF9CVUZGRVIobmFtZSkpLT51YnVm
ID0gbmFtZSArIG5hbWVfb2ZmOwogICAgICAgICAoSFlQRVJDQUxMX0JVRkZFUihsZW4pKS0+dWJ1
ZiA9IGxlbiArICpkb25lOwogICAgICAgICAvKiBBbGxvY2F0ZSBtZW1vcnkuICovCiAgICAgICAg
IHJjID0geGNfaHlwZXJjYWxsX2JvdW5jZV9wcmUoeGNoLCBpbmZvKTsKQEAgLTgyNywxNCArODc0
LDE5IEBAIGludCB4Y19saXZlcGF0Y2hfbGlzdCh4Y19pbnRlcmZhY2UgKnhjaCwgdW5zaWduZWQg
aW50IG1heCwgdW5zaWduZWQgaW50IHN0YXJ0LAogICAgICAgICAgICAgYnJlYWs7CiAgICAgICAg
IH0KICAgICAgICAgKmxlZnQgPSBzeXNjdGwudS5saXZlcGF0Y2gudS5saXN0Lm5yOyAvKiBUb3Rh
bCByZW1haW5pbmcgY291bnQuICovCisgICAgICAgIF9uYW1lX3N6ID0gc3lzY3RsLnUubGl2ZXBh
dGNoLnUubGlzdC5uYW1lX3RvdGFsX3NpemU7IC8qIFRvdGFsIHJlY2VpdmVkIG5hbWUgc2l6ZS4g
Ki8KICAgICAgICAgLyogQ29weSBvbmx5IHVwICdyYycgb2YgZGF0YScgLSB3ZSBjb3VsZCBhZGQg
J21pbihyYyxucikgaWYgZGVzaXJlZC4gKi8KICAgICAgICAgSFlQRVJDQUxMX0JPVU5DRV9TRVRf
U0laRShpbmZvLCAocmMgKiBzaXplb2YoKmluZm8pKSk7Ci0gICAgICAgIEhZUEVSQ0FMTF9CT1VO
Q0VfU0VUX1NJWkUobmFtZSwgKHJjICogc3opKTsKKyAgICAgICAgSFlQRVJDQUxMX0JPVU5DRV9T
RVRfU0laRShuYW1lLCBfbmFtZV9zeik7CiAgICAgICAgIEhZUEVSQ0FMTF9CT1VOQ0VfU0VUX1NJ
WkUobGVuLCAocmMgKiBzaXplb2YoKmxlbikpKTsKICAgICAgICAgLyogQm91bmNlIHRoZSBkYXRh
IGFuZCBmcmVlIHRoZSBib3VuY2UgYnVmZmVyLiAqLwogICAgICAgICB4Y19oeXBlcmNhbGxfYm91
bmNlX3Bvc3QoeGNoLCBpbmZvKTsKICAgICAgICAgeGNfaHlwZXJjYWxsX2JvdW5jZV9wb3N0KHhj
aCwgbmFtZSk7CiAgICAgICAgIHhjX2h5cGVyY2FsbF9ib3VuY2VfcG9zdCh4Y2gsIGxlbik7CisK
KyAgICAgICAgbmFtZV9zeiAtPSBfbmFtZV9zejsKKyAgICAgICAgbmFtZV9vZmYgKz0gX25hbWVf
c3o7CisKICAgICAgICAgLyogQW5kIHVwZGF0ZSBob3cgbWFueSBlbGVtZW50cyBvZiBpbmZvIHdl
IGhhdmUgY29waWVkIGludG8uICovCiAgICAgICAgICpkb25lICs9IHJjOwogICAgICAgICAvKiBV
cGRhdGUgaWR4LiAqLwpkaWZmIC0tZ2l0IGEvdG9vbHMvbWlzYy94ZW4tbGl2ZXBhdGNoLmMgYi90
b29scy9taXNjL3hlbi1saXZlcGF0Y2guYwppbmRleCBhMzdiMjQ1N2ZmLi44YWMzZDU2N2ZjIDEw
MDY0NAotLS0gYS90b29scy9taXNjL3hlbi1saXZlcGF0Y2guYworKysgYi90b29scy9taXNjL3hl
bi1saXZlcGF0Y2guYwpAQCAtNjQsMTQgKzY0LDE0IEBAIHN0YXRpYyBjb25zdCBjaGFyICpzdGF0
ZTJzdHIodW5zaWduZWQgaW50IHN0YXRlKQogICAgIHJldHVybiBuYW1lc1tzdGF0ZV07CiB9CiAK
LS8qIFRoaXMgdmFsdWUgd2FzIGNob29zZW4gYWRob2MuIEl0IGNvdWxkIGJlIDQyIHRvby4gKi8K
LSNkZWZpbmUgTUFYX0xFTiAxMQogc3RhdGljIGludCBsaXN0X2Z1bmMoaW50IGFyZ2MsIGNoYXIg
KmFyZ3ZbXSkKIHsKLSAgICB1bnNpZ25lZCBpbnQgaWR4LCBkb25lLCBsZWZ0LCBpOworICAgIHVu
c2lnbmVkIGludCBuciwgZG9uZSwgbGVmdCwgaTsKICAgICB4ZW5fbGl2ZXBhdGNoX3N0YXR1c190
ICppbmZvID0gTlVMTDsKICAgICBjaGFyICpuYW1lID0gTlVMTDsKICAgICB1aW50MzJfdCAqbGVu
ID0gTlVMTDsKKyAgICB1aW50NjRfdCBuYW1lX3RvdGFsX3NpemU7CisgICAgb2ZmX3QgbmFtZV9v
ZmY7CiAgICAgaW50IHJjID0gRU5PTUVNOwogCiAgICAgaWYgKCBhcmdjICkKQEAgLTc5LDY1ICs3
OSw3MyBAQCBzdGF0aWMgaW50IGxpc3RfZnVuYyhpbnQgYXJnYywgY2hhciAqYXJndltdKQogICAg
ICAgICBzaG93X2hlbHAoKTsKICAgICAgICAgcmV0dXJuIC0xOwogICAgIH0KLSAgICBpZHggPSBs
ZWZ0ID0gMDsKLSAgICBpbmZvID0gbWFsbG9jKHNpemVvZigqaW5mbykgKiBNQVhfTEVOKTsKLSAg
ICBpZiAoICFpbmZvICkKLSAgICAgICAgcmV0dXJuIHJjOwotICAgIG5hbWUgPSBtYWxsb2Moc2l6
ZW9mKCpuYW1lKSAqIFhFTl9MSVZFUEFUQ0hfTkFNRV9TSVpFICogTUFYX0xFTik7Ci0gICAgaWYg
KCAhbmFtZSApCisgICAgZG9uZSA9IGxlZnQgPSAwOworCisgICAgcmMgPSB4Y19saXZlcGF0Y2hf
bGlzdF9nZXRfc2l6ZXMoeGNoLCAmbnIsICZuYW1lX3RvdGFsX3NpemUpOworICAgIGlmICggcmMg
KQogICAgIHsKLSAgICAgICAgZnJlZShpbmZvKTsKKyAgICAgICAgcmMgPSBlcnJubzsKKyAgICAg
ICAgZnByaW50ZihzdGRlcnIsICJGYWlsZWQgdG8gZ2V0IGxpc3Qgc2l6ZXMuXG4iCisgICAgICAg
ICAgICAgICAgIkVycm9yICVkOiAlc1xuIiwKKyAgICAgICAgICAgICAgICByYywgc3RyZXJyb3Io
cmMpKTsKICAgICAgICAgcmV0dXJuIHJjOwogICAgIH0KLSAgICBsZW4gPSBtYWxsb2Moc2l6ZW9m
KCpsZW4pICogTUFYX0xFTik7Ci0gICAgaWYgKCAhbGVuICkgewotICAgICAgICBmcmVlKG5hbWUp
OwotICAgICAgICBmcmVlKGluZm8pOworCisgICAgaWYgKCBuciA9PSAwICkKKyAgICB7CisgICAg
ICAgIGZwcmludGYoc3Rkb3V0LCAiTm90aGluZyB0byBsaXN0XG4iKTsKKyAgICAgICAgcmV0dXJu
IDA7CisgICAgfQorCisgICAgaW5mbyA9IG1hbGxvYyhuciAqIHNpemVvZigqaW5mbykpOworICAg
IGlmICggIWluZm8gKQogICAgICAgICByZXR1cm4gcmM7CisKKyAgICBuYW1lID0gbWFsbG9jKG5h
bWVfdG90YWxfc2l6ZSAqIHNpemVvZigqbmFtZSkpOworICAgIGlmICggIW5hbWUgKQorICAgICAg
ICBnb3RvIGVycm9yX25hbWU7CisKKyAgICBsZW4gPSBtYWxsb2MobnIgKiBzaXplb2YoKmxlbikp
OworICAgIGlmICggIWxlbiApCisgICAgICAgIGdvdG8gZXJyb3JfbGVuOworCisgICAgbWVtc2V0
KGluZm8sICdBJywgbnIgKiBzaXplb2YoKmluZm8pKTsKKyAgICBtZW1zZXQobmFtZSwgJ0InLCBu
YW1lX3RvdGFsX3NpemUgKiBzaXplb2YoKm5hbWUpKTsKKyAgICBtZW1zZXQobGVuLCAnQycsIG5y
ICogc2l6ZW9mKCpsZW4pKTsKKyAgICBuYW1lX29mZiA9IDA7CisKKyAgICByYyA9IHhjX2xpdmVw
YXRjaF9saXN0KHhjaCwgbnIsIDAsIGluZm8sIG5hbWUsIGxlbiwgbmFtZV90b3RhbF9zaXplLCAm
ZG9uZSwgJmxlZnQpOworICAgIGlmICggcmMgfHwgZG9uZSAhPSBuciB8fCBsZWZ0ID4gMCkKKyAg
ICB7CisgICAgICAgIHJjID0gZXJybm87CisgICAgICAgIGZwcmludGYoc3RkZXJyLCAiRmFpbGVk
IHRvIGxpc3QgJWQvJWQuXG4iCisgICAgICAgICAgICAgICAgIkVycm9yICVkOiAlc1xuIiwKKyAg
ICAgICAgICAgICAgICBsZWZ0LCBuciwgcmMsIHN0cmVycm9yKHJjKSk7CisgICAgICAgIGdvdG8g
ZXJyb3I7CiAgICAgfQogCi0gICAgZG8gewotICAgICAgICBkb25lID0gMDsKLSAgICAgICAgLyog
VGhlIG1lbXNldCBpcyBkb25lIHRvIGNhdGNoIGVycm9ycy4gKi8KLSAgICAgICAgbWVtc2V0KGlu
Zm8sICdBJywgc2l6ZW9mKCppbmZvKSAqIE1BWF9MRU4pOwotICAgICAgICBtZW1zZXQobmFtZSwg
J0InLCBzaXplb2YoKm5hbWUpICogTUFYX0xFTiAqIFhFTl9MSVZFUEFUQ0hfTkFNRV9TSVpFKTsK
LSAgICAgICAgbWVtc2V0KGxlbiwgJ0MnLCBzaXplb2YoKmxlbikgKiBNQVhfTEVOKTsKLSAgICAg
ICAgcmMgPSB4Y19saXZlcGF0Y2hfbGlzdCh4Y2gsIE1BWF9MRU4sIGlkeCwgaW5mbywgbmFtZSwg
bGVuLCAmZG9uZSwgJmxlZnQpOwotICAgICAgICBpZiAoIHJjICkKLSAgICAgICAgewotICAgICAg
ICAgICAgcmMgPSBlcnJubzsKLSAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiRmFpbGVkIHRv
IGxpc3QgJWQvJWQuXG4iCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIkVycm9yICVkOiAl
c1xuIiwKLSAgICAgICAgICAgICAgICAgICAgaWR4LCBsZWZ0LCByYywgc3RyZXJyb3IocmMpKTsK
LSAgICAgICAgICAgIGJyZWFrOwotICAgICAgICB9Ci0gICAgICAgIGlmICggIWlkeCApCi0gICAg
ICAgICAgICBmcHJpbnRmKHN0ZG91dCwiIElEICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgc3RhdHVzXG4iCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAiLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS1cbiIpOworICAgIGZw
cmludGYoc3Rkb3V0LCIgSUQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBz
dGF0dXNcbiIKKyAgICAgICAgICAgICAgICAgICAiLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS1cbiIpOwogCi0gICAgICAgIGZvciAoIGkgPSAwOyBp
IDwgZG9uZTsgaSsrICkKLSAgICAgICAgewotICAgICAgICAgICAgdW5zaWduZWQgaW50IGo7Ci0g
ICAgICAgICAgICB1aW50MzJfdCBzejsKLSAgICAgICAgICAgIGNoYXIgKnN0cjsKLQotICAgICAg
ICAgICAgc3ogPSBsZW5baV07Ci0gICAgICAgICAgICBzdHIgPSBuYW1lICsgKGkgKiBYRU5fTElW
RVBBVENIX05BTUVfU0laRSk7Ci0gICAgICAgICAgICBmb3IgKCBqID0gc3o7IGogPCBYRU5fTElW
RVBBVENIX05BTUVfU0laRTsgaisrICkKLSAgICAgICAgICAgICAgICBzdHJbal0gPSAnXDAnOwot
Ci0gICAgICAgICAgICBwcmludGYoIiUtNDBzfCAlcyIsIHN0ciwgc3RhdGUyc3RyKGluZm9baV0u
c3RhdGUpKTsKLSAgICAgICAgICAgIGlmICggaW5mb1tpXS5yYyApCi0gICAgICAgICAgICAgICAg
cHJpbnRmKCIgKCVkLCAlcylcbiIsIC1pbmZvW2ldLnJjLCBzdHJlcnJvcigtaW5mb1tpXS5yYykp
OwotICAgICAgICAgICAgZWxzZQotICAgICAgICAgICAgICAgIHB1dHMoIiIpOwotICAgICAgICB9
Ci0gICAgICAgIGlkeCArPSBkb25lOwotICAgIH0gd2hpbGUgKCBsZWZ0ICk7CisgICAgZm9yICgg
aSA9IDA7IGkgPCBkb25lOyBpKysgKQorICAgIHsKKyAgICAgICAgY2hhciAqbmFtZV9zdHIgPSBu
YW1lICsgbmFtZV9vZmY7CisKKyAgICAgICAgcHJpbnRmKCIlLTQwLipzfCAlcyIsIGxlbltpXSwg
bmFtZV9zdHIsIHN0YXRlMnN0cihpbmZvW2ldLnN0YXRlKSk7CisgICAgICAgIGlmICggaW5mb1tp
XS5yYyApCisgICAgICAgICAgICBwcmludGYoIiAoJWQsICVzKVxuIiwgLWluZm9baV0ucmMsIHN0
cmVycm9yKC1pbmZvW2ldLnJjKSk7CisgICAgICAgIGVsc2UKKyAgICAgICAgICAgIHB1dHMoIiIp
OworCisgICAgICAgIG5hbWVfb2ZmICs9IGxlbltpXTsKKyAgICB9CiAKK2Vycm9yOgorICAgIGZy
ZWUobGVuKTsKK2Vycm9yX2xlbjoKICAgICBmcmVlKG5hbWUpOworZXJyb3JfbmFtZToKICAgICBm
cmVlKGluZm8pOwotICAgIGZyZWUobGVuKTsKICAgICByZXR1cm4gcmM7CiB9CiAjdW5kZWYgTUFY
X0xFTgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9saXZlcGF0Y2guYyBiL3hlbi9jb21tb24vbGl2
ZXBhdGNoLmMKaW5kZXggZjg4Y2YzYmM3My4uZjQ4NmNiMzAyMSAxMDA2NDQKLS0tIGEveGVuL2Nv
bW1vbi9saXZlcGF0Y2guYworKysgYi94ZW4vY29tbW9uL2xpdmVwYXRjaC5jCkBAIC0xMTYzLDcg
KzExNjMsNiBAQCBzdGF0aWMgaW50IGxpdmVwYXRjaF9saXN0KHN0cnVjdCB4ZW5fc3lzY3RsX2xp
dmVwYXRjaF9saXN0ICpsaXN0KQogCiAgICAgaWYgKCBsaXN0LT5uciAmJgogICAgICAgICAgKCFn
dWVzdF9oYW5kbGVfb2theShsaXN0LT5zdGF0dXMsIGxpc3QtPm5yKSB8fAotICAgICAgICAgICFn
dWVzdF9oYW5kbGVfb2theShsaXN0LT5uYW1lLCBYRU5fTElWRVBBVENIX05BTUVfU0laRSAqIGxp
c3QtPm5yKSB8fAogICAgICAgICAgICFndWVzdF9oYW5kbGVfb2theShsaXN0LT5sZW4sIGxpc3Qt
Pm5yKSkgKQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKIApAQCAtMTE3NCwyMyArMTE3MywzNSBA
QCBzdGF0aWMgaW50IGxpdmVwYXRjaF9saXN0KHN0cnVjdCB4ZW5fc3lzY3RsX2xpdmVwYXRjaF9s
aXN0ICpsaXN0KQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICB9CiAKKyAgICBsaXN0LT5u
YW1lX3RvdGFsX3NpemUgPSAwOwogICAgIGlmICggbGlzdC0+bnIgKQogICAgIHsKKyAgICAgICAg
dWludDY0X3QgbmFtZV9vZmZzZXQgPSAwOworCiAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnko
IGRhdGEsICZwYXlsb2FkX2xpc3QsIGxpc3QgKQogICAgICAgICB7Ci0gICAgICAgICAgICB1aW50
MzJfdCBsZW47CisgICAgICAgICAgICB1aW50MzJfdCBuYW1lX2xlbjsKIAogICAgICAgICAgICAg
aWYgKCBsaXN0LT5pZHggPiBpKysgKQogICAgICAgICAgICAgICAgIGNvbnRpbnVlOwogCiAgICAg
ICAgICAgICBzdGF0dXMuc3RhdGUgPSBkYXRhLT5zdGF0ZTsKICAgICAgICAgICAgIHN0YXR1cy5y
YyA9IGRhdGEtPnJjOwotICAgICAgICAgICAgbGVuID0gc3RybGVuKGRhdGEtPm5hbWUpICsgMTsK
KworICAgICAgICAgICAgbmFtZV9sZW4gPSBzdHJsZW4oZGF0YS0+bmFtZSkgKyAxOworICAgICAg
ICAgICAgbGlzdC0+bmFtZV90b3RhbF9zaXplICs9IG5hbWVfbGVuOworCisgICAgICAgICAgICBp
ZiAoICFndWVzdF9oYW5kbGVfc3VicmFuZ2Vfb2theShsaXN0LT5uYW1lLCBuYW1lX29mZnNldCwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5hbWVfb2Zmc2V0
ICsgbmFtZV9sZW4gLSAxKSApCisgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAgcmMgPSAt
RUlOVkFMOworICAgICAgICAgICAgICAgIGJyZWFrOworICAgICAgICAgICAgfQogCiAgICAgICAg
ICAgICAvKiBOLkIuICdpZHgnICE9ICdpJy4gKi8KLSAgICAgICAgICAgIGlmICggX19jb3B5X3Rv
X2d1ZXN0X29mZnNldChsaXN0LT5uYW1lLCBpZHggKiBYRU5fTElWRVBBVENIX05BTUVfU0laRSwK
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkYXRhLT5uYW1lLCBsZW4p
IHx8Ci0gICAgICAgICAgICAgICAgX19jb3B5X3RvX2d1ZXN0X29mZnNldChsaXN0LT5sZW4sIGlk
eCwgJmxlbiwgMSkgfHwKKyAgICAgICAgICAgIGlmICggX19jb3B5X3RvX2d1ZXN0X29mZnNldChs
aXN0LT5uYW1lLCBuYW1lX29mZnNldCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkYXRhLT5uYW1lLCBuYW1lX2xlbikgfHwKKyAgICAgICAgICAgICAgICBfX2NvcHlf
dG9fZ3Vlc3Rfb2Zmc2V0KGxpc3QtPmxlbiwgaWR4LCAmbmFtZV9sZW4sIDEpIHx8CiAgICAgICAg
ICAgICAgICAgX19jb3B5X3RvX2d1ZXN0X29mZnNldChsaXN0LT5zdGF0dXMsIGlkeCwgJnN0YXR1
cywgMSkgKQogICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIHJjID0gLUVGQVVMVDsKQEAg
LTExOTgsMTEgKzEyMDksMTkgQEAgc3RhdGljIGludCBsaXZlcGF0Y2hfbGlzdChzdHJ1Y3QgeGVu
X3N5c2N0bF9saXZlcGF0Y2hfbGlzdCAqbGlzdCkKICAgICAgICAgICAgIH0KIAogICAgICAgICAg
ICAgaWR4Kys7CisgICAgICAgICAgICBuYW1lX29mZnNldCArPSBuYW1lX2xlbjsKIAogICAgICAg
ICAgICAgaWYgKCAoaWR4ID49IGxpc3QtPm5yKSB8fCBoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygp
ICkKICAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICAgfQogICAgIH0KKyAgICBlbHNlCisg
ICAgeworICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KCBkYXRhLCAmcGF5bG9hZF9saXN0LCBs
aXN0ICkKKyAgICAgICAgeworICAgICAgICAgICAgbGlzdC0+bmFtZV90b3RhbF9zaXplICs9IHN0
cmxlbihkYXRhLT5uYW1lKSArIDE7CisgICAgICAgIH0KKyAgICB9CiAgICAgbGlzdC0+bnIgPSBw
YXlsb2FkX2NudCAtIGk7IC8qIFJlbWFpbmluZyBhbW91bnQuICovCiAgICAgbGlzdC0+dmVyc2lv
biA9IHBheWxvYWRfdmVyc2lvbjsKICAgICBzcGluX3VubG9jaygmcGF5bG9hZF9sb2NrKTsKZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCBiL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9zeXNjdGwuaAppbmRleCAzMzVlMTkzNzEyLi5iODY4MDRiN2E2IDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5o
CkBAIC05MjYsMTAgKzkyNiwxMSBAQCBzdHJ1Y3QgeGVuX3N5c2N0bF9saXZlcGF0Y2hfZ2V0IHsK
ICAqCiAgKiBJZiB0aGUgaHlwZXJjYWxsIHJldHVybnMgYW4gcG9zaXRpdmUgbnVtYmVyLCBpdCBp
cyB0aGUgbnVtYmVyICh1cCB0byBgbnJgKQogICogb2YgdGhlIHBheWxvYWRzIHJldHVybmVkLCBh
bG9uZyB3aXRoIGBucmAgdXBkYXRlZCB3aXRoIHRoZSBudW1iZXIgb2YgcmVtYWluaW5nCi0gKiBw
YXlsb2FkcywgYHZlcnNpb25gIHVwZGF0ZWQgKGl0IG1heSBiZSB0aGUgc2FtZSBhY3Jvc3MgaHlw
ZXJjYWxscy4gSWYgaXQKLSAqIHZhcmllcyB0aGUgZGF0YSBpcyBzdGFsZSBhbmQgZnVydGhlciBj
YWxscyBjb3VsZCBmYWlsKS4gVGhlIGBzdGF0dXNgLAotICogYG5hbWVgLCBhbmQgYGxlbmAnIGFy
ZSB1cGRhdGVkIGF0IHRoZWlyIGRlc2lnbmVkIGluZGV4IHZhbHVlIChgaWR4YCkgd2l0aAotICog
dGhlIHJldHVybmVkIHZhbHVlIG9mIGRhdGEuCisgKiBwYXlsb2FkcywgYHZlcnNpb25gIHVwZGF0
ZWQgKGl0IG1heSBiZSB0aGUgc2FtZSBhY3Jvc3MgaHlwZXJjYWxscy4gSWYgaXQgdmFyaWVzCisg
KiB0aGUgZGF0YSBpcyBzdGFsZSBhbmQgZnVydGhlciBjYWxscyBjb3VsZCBmYWlsKSBhbmQgdGhl
IG5hbWVfdG90YWxfc2l6ZQorICogY29udGFpbmluZyB0b3RhbCBzaXplIG9mIHRyYW5zZmVyZWQg
ZGF0YSBmb3IgdGhlIGFycmF5LgorICogVGhlIGBzdGF0dXNgLCBgbmFtZWAsIGBsZW5gIGFyZSB1
cGRhdGVkIGF0IHRoZWlyIGRlc2lnbmVkIGluZGV4IHZhbHVlIChgaWR4YCkKKyAqIHdpdGggdGhl
IHJldHVybmVkIHZhbHVlIG9mIGRhdGEuCiAgKgogICogSWYgdGhlIGh5cGVyY2FsbCByZXR1cm5z
IEUyQklHIHRoZSBgbnJgIGlzIHRvbyBiaWcgYW5kIHNob3VsZCBiZQogICogbG93ZXJlZC4gVGhl
IHVwcGVyIGxpbWl0IG9mIGBucmAgaXMgbGVmdCB0byB0aGUgaW1wbGVtZW50aW9uLgpAQCAtOTUy
LDExICs5NTMsMTMgQEAgc3RydWN0IHhlbl9zeXNjdGxfbGl2ZXBhdGNoX2xpc3QgewogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhbW91bnQgb2YgcGF5bG9h
ZHMgYW5kIHZlcnNpb24uCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIE9VVDogSG93IG1hbnkgcGF5bG9hZHMgbGVmdC4gKi8KICAgICB1aW50MzJfdCBwYWQ7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogSU46IE11c3QgYmUgemVyby4gKi8KKyAgICB1
aW50NjRfdCBuYW1lX3RvdGFsX3NpemU7ICAgICAgICAgICAgICAgLyogT1VUOiBUb3RhbCBzaXpl
IG9mIGFsbCB0cmFuc2ZlciBuYW1lcyAqLwogICAgIFhFTl9HVUVTVF9IQU5ETEVfNjQoeGVuX2xp
dmVwYXRjaF9zdGF0dXNfdCkgc3RhdHVzOyAgLyogT1VULiBNdXN0IGhhdmUgZW5vdWdoCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNwYWNlIGFsbG9jYXRl
IGZvciBuciBvZiB0aGVtLiAqLwogICAgIFhFTl9HVUVTVF9IQU5ETEVfNjQoY2hhcikgbmFtZTsg
ICAgICAgICAvKiBPVVQ6IEFycmF5IG9mIG5hbWVzLiBFYWNoIG1lbWJlcgotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNVVNUIFhFTl9MSVZFUEFUQ0hfTkFN
RV9TSVpFIGluIHNpemUuCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIE11c3QgaGF2ZSBuciBvZiB0aGVtLiAqLworICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBtYXkgaGF2ZSBhbiBhcmJpdHJhcnkgbGVuZ3RoIHVwIHRv
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhFTl9MSVZF
UEFUQ0hfTkFNRV9TSVpFIGJ5dGVzLiBNdXN0IGhhdmUKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbnIgb2YgdGhlbS4gKi8KICAgICBYRU5fR1VFU1RfSEFO
RExFXzY0KHVpbnQzMikgbGVuOyAgICAgICAgLyogT1VUOiBBcnJheSBvZiBsZW5ndGhzIG9mIG5h
bWUncy4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTXVz
dCBoYXZlIG5yIG9mIHRoZW0uICovCiB9OwotLSAKMi4xNi41CgoKCgpBbWF6b24gRGV2ZWxvcG1l
bnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hh
ZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJh
Z2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6
OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
