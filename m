Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3330414B55F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 14:53:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRFy-0007Rw-E3; Tue, 28 Jan 2020 13:50:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mHYt=3R=amazon.com=prvs=2895eb870=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iwRFw-0007Rr-D8
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 13:50:16 +0000
X-Inumbo-ID: 1d140ced-41d5-11ea-86c7-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d140ced-41d5-11ea-86c7-12813bfff9fa;
 Tue, 28 Jan 2020 13:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580219416; x=1611755416;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=imo+rhjLrKN9NFYE1OVe2fx8sVaEE91PZ3r8W57FZhE=;
 b=SywlzAgje6remxf3qezAb76jvKiNi9LXK+CZMtS6K9orQEIO0uHBrdSD
 FZLVu0G5LdIMAvjk2TOzHDXGC/t5BQryFDfK6dnVJfr7nxE46ZUXhVctj
 Pum+4vzykJ6E/T/gnXm/Ohv0qo39j4sl0tCeXSIUY3ot+KbJQjQNpFu9O 0=;
IronPort-SDR: HqOSAdEvuZtIfmfES+ImlnNy7o5tHeyQ6uHWuUV+Q6mBCSkScKIZtOFdQaPaghpdd/5w1TSnH1
 RfUWoeZV73Xg==
X-IronPort-AV: E=Sophos;i="5.70,374,1574121600"; d="scan'208";a="14577012"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 28 Jan 2020 13:50:15 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2994AA24FA; Tue, 28 Jan 2020 13:50:14 +0000 (UTC)
Received: from EX13D37EUB004.ant.amazon.com (10.43.166.187) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 28 Jan 2020 13:50:13 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D37EUB004.ant.amazon.com (10.43.166.187) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 28 Jan 2020 13:50:12 +0000
Received: from u0b3720fa96e858.ant.amazon.com (10.125.106.133) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 28 Jan 2020 13:50:09 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 28 Jan 2020 13:50:05 +0000
Message-ID: <ad98947f577560d47ea7825deb624149788645d0.1580219401.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v6] x86: introduce a new set of APIs to manage
 Xen page tables
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIGFyZSBnb2luZyB0byBzd2l0
Y2ggdG8gdXNpbmcgZG9taGVhcCBwYWdlIGZvciBwYWdlIHRhYmxlcy4KQSBuZXcgc2V0IG9mIEFQ
SXMgaXMgaW50cm9kdWNlZCB0byBhbGxvY2F0ZSBhbmQgZnJlZSBwYWdlcyBvZiBwYWdlCnRhYmxl
cyBiYXNlZCBvbiBtZm4gaW5zdGVhZCBvZiB0aGUgeGVuaGVhcCBkaXJlY3QgbWFwIGFkZHJlc3Mu
IFRoZQphbGxvY2F0aW9uIGFuZCBkZWFsbG9jYXRpb24gd29yayBvbiBtZm5fdCBidXQgbm90IHBh
Z2VfaW5mbywgYmVjYXVzZQp0aGV5IGFyZSByZXF1aXJlZCB0byB3b3JrIGV2ZW4gYmVmb3JlIGZy
YW1lIHRhYmxlIGlzIHNldCB1cC4KCkltcGxlbWVudCB0aGUgb2xkIGZ1bmN0aW9ucyB3aXRoIHRo
ZSBuZXcgb25lcy4gV2Ugd2lsbCByZXdyaXRlLCBzaXRlCmJ5IHNpdGUsIG90aGVyIG1tIGZ1bmN0
aW9ucyB0aGF0IG1hbmlwdWxhdGUgcGFnZSB0YWJsZXMgdG8gdXNlIHRoZSBuZXcKQVBJcy4KCkFm
dGVyIHRoZSBhbGxvY2F0aW9uLCBvbmUgbmVlZHMgdG8gbWFwIGFuZCB1bm1hcCB2aWEgbWFwX2Rv
bWFpbl9wYWdlIHRvCmFjY2VzcyB0aGUgUFRFcy4gVGhpcyBkb2VzIG5vdCBicmVhayB4ZW4gaGFs
ZiB3YXksIHNpbmNlIHRoZSBuZXcgQVBJcwpzdGlsbCB1c2UgeGVuaGVhcCBwYWdlcyB1bmRlcm5l
YXRoLCBhbmQgbWFwX2RvbWFpbl9wYWdlIHdpbGwganVzdCB1c2UKdGhlIGRpcmVjdG1hcCBmb3Ig
bWFwcGluZ3MuIFRoZXkgd2lsbCBiZSBzd2l0Y2hlZCB0byB1c2UgZG9taGVhcCBhbmQKZHluYW1p
YyBtYXBwaW5ncyB3aGVuIHVzYWdlIG9mIG9sZCBBUElzIGlzIGVsaW1pbmF0ZWQuCgpObyBmdW5j
dGlvbmFsIGNoYW5nZSBpbnRlbmRlZCBpbiB0aGlzIHBhdGNoLgoKU2lnbmVkLW9mZi1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhv
bmd5eGlhQGFtYXpvbi5jb20+ClJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6
b24uY29tPgoKLS0tCkNoYW5nZWQgc2luY2UgdjU6Ci0gc291bmRzIGxpa2Ugd2UgYXJlIGhhcHB5
IHRvIHVzZSBtYXBfZG9tYWluX3BhZ2UgZm9yIFhlbiBQVEVzLiBSZW1vdmUKICBtYXAvdW5tYXBf
eGVuX3BhZ2V0YWJsZSwganVzdCB1c2UgbWFwL3VubWFwX2RvbWFpbl9wYWdlIGluc3RlYWQuCi0g
cmVtb3ZlIHJlZHVuZGFudCBsb2dpYyBpbiBmcmVlX3hlbl9wYWdldGFibGUuCgpDaGFuZ2VkIHNp
bmNlIHY0OgotIHByb3Blcmx5IGhhbmRsZSBJTlZBTElEX01GTi4KLSByZW1vdmUgdGhlIF9uZXcg
c3VmZml4IGZvciBtYXAvdW5tYXBfeGVuX3BhZ2V0YWJsZSBiZWNhdXNlIHRoZXkgZG8gbm90CiAg
aGF2ZSBvbGQgYWx0ZXJuYXRpdmVzLgoKQ2hhbmdlZCBzaW5jZSB2MzoKLSBjb25zdCBxdWFsaWZ5
IHVubWFwX3hlbl9wYWdldGFibGVfbmV3KCkuCi0gcmVtb3ZlIHJlZHVuZGFudCBwYXJlbnRoZXNl
cy4KLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgfCAzMiArKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oIHwgIDMgKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRleCBmNTBjMDY1YWYzLi5m
YTgyNGQ1MjUyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJjaC94
ODYvbW0uYwpAQCAtMTE5LDYgKzExOSw3IEBACiAjaW5jbHVkZSA8eGVuL2VmaS5oPgogI2luY2x1
ZGUgPHhlbi9ncmFudF90YWJsZS5oPgogI2luY2x1ZGUgPHhlbi9oeXBlcmNhbGwuaD4KKyNpbmNs
dWRlIDx4ZW4vbW0uaD4KICNpbmNsdWRlIDxhc20vcGFnaW5nLmg+CiAjaW5jbHVkZSA8YXNtL3No
YWRvdy5oPgogI2luY2x1ZGUgPGFzbS9wYWdlLmg+CkBAIC00OTQ3LDIyICs0OTQ4LDQzIEBAIGlu
dCBtbWNmZ19pbnRlcmNlcHRfd3JpdGUoCiB9CiAKIHZvaWQgKmFsbG9jX3hlbl9wYWdldGFibGUo
dm9pZCkKK3sKKyAgICBtZm5fdCBtZm4gPSBhbGxvY194ZW5fcGFnZXRhYmxlX25ldygpOworCisg
ICAgcmV0dXJuIG1mbl9lcShtZm4sIElOVkFMSURfTUZOKSA/IE5VTEwgOiBtZm5fdG9fdmlydCht
Zm5feChtZm4pKTsKK30KKwordm9pZCBmcmVlX3hlbl9wYWdldGFibGUodm9pZCAqdikKK3sKKyAg
ICBtZm5fdCBtZm4gPSB2ID8gdmlydF90b19tZm4odikgOiBJTlZBTElEX01GTjsKKworICAgIGZy
ZWVfeGVuX3BhZ2V0YWJsZV9uZXcobWZuKTsKK30KKworLyoKKyAqIEZvciB0aGVzZSBQVEUgQVBJ
cywgdGhlIGNhbGxlciBtdXN0IGZvbGxvdyB0aGUgYWxsb2MtbWFwLXVubWFwLWZyZWUKKyAqIGxp
ZmVjeWNsZSwgd2hpY2ggbWVhbnMgZXhwbGljaXRseSBtYXBwaW5nIHRoZSBQVEUgcGFnZXMgYmVm
b3JlIGFjY2Vzc2luZworICogdGhlbS4gVGhlIGNhbGxlciBtdXN0IGNoZWNrIHdoZXRoZXIgdGhl
IGFsbG9jYXRpb24gaGFzIHN1Y2NlZWRlZCwgYW5kIG9ubHkKKyAqIHBhc3MgdmFsaWQgTUZOcyB0
byBtYXBfZG9tYWluX3BhZ2UoKS4KKyAqLworbWZuX3QgYWxsb2NfeGVuX3BhZ2V0YWJsZV9uZXco
dm9pZCkKIHsKICAgICBpZiAoIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfZWFybHlfYm9vdCAp
CiAgICAgewogICAgICAgICB2b2lkICpwdHIgPSBhbGxvY194ZW5oZWFwX3BhZ2UoKTsKIAogICAg
ICAgICBCVUdfT04oIWhhcmR3YXJlX2RvbWFpbiAmJiAhcHRyKTsKLSAgICAgICAgcmV0dXJuIHB0
cjsKKyAgICAgICAgcmV0dXJuIHB0ciA/IHZpcnRfdG9fbWZuKHB0cikgOiBJTlZBTElEX01GTjsK
ICAgICB9CiAKLSAgICByZXR1cm4gbWZuX3RvX3ZpcnQobWZuX3goYWxsb2NfYm9vdF9wYWdlcygx
LCAxKSkpOworICAgIHJldHVybiBhbGxvY19ib290X3BhZ2VzKDEsIDEpOwogfQogCi12b2lkIGZy
ZWVfeGVuX3BhZ2V0YWJsZSh2b2lkICp2KQorLyogbWZuIGNhbiBiZSBJTlZBTElEX01GTiAqLwor
dm9pZCBmcmVlX3hlbl9wYWdldGFibGVfbmV3KG1mbl90IG1mbikKIHsKLSAgICBpZiAoIHN5c3Rl
bV9zdGF0ZSAhPSBTWVNfU1RBVEVfZWFybHlfYm9vdCApCi0gICAgICAgIGZyZWVfeGVuaGVhcF9w
YWdlKHYpOworICAgIGlmICggc3lzdGVtX3N0YXRlICE9IFNZU19TVEFURV9lYXJseV9ib290ICYm
ICFtZm5fZXEobWZuLCBJTlZBTElEX01GTikgKQorICAgICAgICBmcmVlX3hlbmhlYXBfcGFnZSht
Zm5fdG9fdmlydChtZm5feChtZm4pKSk7CiB9CiAKIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0sobWFw
X3BnZGlyX2xvY2spOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9tbS5oCmluZGV4IDJjYTg4ODJhZDAuLmFjODE5OTFlNjIgMTAwNjQ0
Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2
L21tLmgKQEAgLTU4Miw2ICs1ODIsOSBAQCB2b2lkICpkb19wYWdlX3dhbGsoc3RydWN0IHZjcHUg
KnYsIHVuc2lnbmVkIGxvbmcgYWRkcik7CiAvKiBBbGxvY2F0b3IgZnVuY3Rpb25zIGZvciBYZW4g
cGFnZXRhYmxlcy4gKi8KIHZvaWQgKmFsbG9jX3hlbl9wYWdldGFibGUodm9pZCk7CiB2b2lkIGZy
ZWVfeGVuX3BhZ2V0YWJsZSh2b2lkICp2KTsKK21mbl90IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3
KHZvaWQpOwordm9pZCBmcmVlX3hlbl9wYWdldGFibGVfbmV3KG1mbl90IG1mbik7CisKIGwxX3Bn
ZW50cnlfdCAqdmlydF90b194ZW5fbDFlKHVuc2lnbmVkIGxvbmcgdik7CiAKIGludCBfX3N5bmNf
bG9jYWxfZXhlY3N0YXRlKHZvaWQpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
