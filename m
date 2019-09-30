Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BB7C1F04
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt0q-0007AT-0R; Mon, 30 Sep 2019 10:34:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt0o-00079n-Q4
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:34:38 +0000
X-Inumbo-ID: e7467052-e36d-11e9-97fb-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id e7467052-e36d-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839678; x=1601375678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=5qUXGVLQZ6upgeYLGOcqRG0zacCJFu2/sQ3YGcsLoRs=;
 b=PkvFeYfI67HwtZ1Y48n3l6RTeP+T2OjW3dVElaVGHe97sobsmlXc8AKS
 2sH9dODM6nx7sZD17eU7L44kMw+uZQscHNykWWCW4AXCNllTLBPXJxjaO
 Sn89ICIk0lcOItYi/jvJ0yBXoHcyU6PdtqcglreBQp8nZR4kUeGEysY+q Y=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="424630092"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:38 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9D5C4A2289; Mon, 30 Sep 2019 10:34:36 +0000 (UTC)
Received: from EX13D28EUB002.ant.amazon.com (10.43.166.97) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:08 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D28EUB002.ant.amazon.com (10.43.166.97) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:07 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:05 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:10 +0100
Message-ID: <4a6cbcbb473bcedb50585e1a6d35f1390f8fa0d8.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 18/55] x86/mm: switch to new APIs in
 modify_xen_mappings
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Hongyan Xia <hongyax@amazon.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClBhZ2UgdGFibGVzIGFsbG9jYXRl
ZCBpbiB0aGF0IGZ1bmN0aW9uIHNob3VsZCBiZSBtYXBwZWQgYW5kIHVubWFwcGVkCm5vdy4KClNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6
IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+CgotLS0KQ2hhbmdlZCBzaW5jZSB2MToK
ICAqIHJlbW92ZSByZWR1bmRhbnQgbGluZXMKLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyB8IDMzICsr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5j
IGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggMDhhZjcxYTI2MS4uYTgxMmVmMDI0NCAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTU1NjIs
NiArNTU2Miw3IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5z
aWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAgICAgICAgIGlmICggbDNlX2dldF9mbGFn
cygqcGwzZSkgJiBfUEFHRV9QU0UgKQogICAgICAgICB7CiAgICAgICAgICAgICBsMl9wZ2VudHJ5
X3QgKmwydDsKKyAgICAgICAgICAgIG1mbl90IG1mbjsKIAogICAgICAgICAgICAgaWYgKCBsMl90
YWJsZV9vZmZzZXQodikgPT0gMCAmJgogICAgICAgICAgICAgICAgICBsMV90YWJsZV9vZmZzZXQo
dikgPT0gMCAmJgpAQCAtNTU3OCwxMyArNTU3OSwxNSBAQCBpbnQgbW9kaWZ5X3hlbl9tYXBwaW5n
cyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5zaWduZWQgaW50IG5mKQogICAg
ICAgICAgICAgfQogCiAgICAgICAgICAgICAvKiBQQUdFMUdCOiBzaGF0dGVyIHRoZSBzdXBlcnBh
Z2UgYW5kIGZhbGwgdGhyb3VnaC4gKi8KLSAgICAgICAgICAgIGwydCA9IGFsbG9jX3hlbl9wYWdl
dGFibGUoKTsKLSAgICAgICAgICAgIGlmICggIWwydCApCisgICAgICAgICAgICBtZm4gPSBhbGxv
Y194ZW5fcGFnZXRhYmxlX25ldygpOworICAgICAgICAgICAgaWYgKCBtZm5fZXEobWZuLCBJTlZB
TElEX01GTikgKQogICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIEFTU0VSVChyYyA9PSAt
RU5PTUVNKTsKICAgICAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAgICAgIH0KIAorICAg
ICAgICAgICAgbDJ0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KG1mbik7CisKICAgICAgICAgICAg
IGZvciAoIGkgPSAwOyBpIDwgTDJfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApCiAgICAgICAgICAg
ICAgICAgbDJlX3dyaXRlKGwydCArIGksCiAgICAgICAgICAgICAgICAgICAgICAgICAgIGwyZV9m
cm9tX3BmbihsM2VfZ2V0X3BmbigqcGwzZSkgKwpAQCAtNTU5NSwxNCArNTU5OCwxNiBAQCBpbnQg
bW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5z
aWduZWQgaW50IG5mKQogICAgICAgICAgICAgaWYgKCAobDNlX2dldF9mbGFncygqcGwzZSkgJiBf
UEFHRV9QUkVTRU5UKSAmJgogICAgICAgICAgICAgICAgICAobDNlX2dldF9mbGFncygqcGwzZSkg
JiBfUEFHRV9QU0UpICkKICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBsM2Vfd3JpdGVf
YXRvbWljKHBsM2UsIGwzZV9mcm9tX21mbih2aXJ0X3RvX21mbihsMnQpLAotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fUEFHRV9IWVBFUlZJU09S
KSk7Ci0gICAgICAgICAgICAgICAgbDJ0ID0gTlVMTDsKKyAgICAgICAgICAgICAgICBsM2Vfd3Jp
dGVfYXRvbWljKHBsM2UsIGwzZV9mcm9tX21mbihtZm4sIF9fUEFHRV9IWVBFUlZJU09SKSk7Cisg
ICAgICAgICAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDJ0KTsKICAgICAgICAgICAg
IH0KICAgICAgICAgICAgIGlmICggbG9ja2luZyApCiAgICAgICAgICAgICAgICAgc3Bpbl91bmxv
Y2soJm1hcF9wZ2Rpcl9sb2NrKTsKICAgICAgICAgICAgIGlmICggbDJ0ICkKLSAgICAgICAgICAg
ICAgICBmcmVlX3hlbl9wYWdldGFibGUobDJ0KTsKKyAgICAgICAgICAgIHsKKyAgICAgICAgICAg
ICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsMnQpOworICAgICAgICAgICAgICAgIGZyZWVf
eGVuX3BhZ2V0YWJsZV9uZXcobWZuKTsKKyAgICAgICAgICAgIH0KICAgICAgICAgfQogCiAgICAg
ICAgIC8qCkBAIC01NjM3LDE1ICs1NjQyLDE4IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVu
c2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAgICAgICAg
ICAgICBlbHNlCiAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgbDFfcGdlbnRyeV90ICps
MXQ7CisgICAgICAgICAgICAgICAgbWZuX3QgbWZuOwogCiAgICAgICAgICAgICAgICAgLyogUFNF
OiBzaGF0dGVyIHRoZSBzdXBlcnBhZ2UgYW5kIHRyeSBhZ2Fpbi4gKi8KLSAgICAgICAgICAgICAg
ICBsMXQgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7Ci0gICAgICAgICAgICAgICAgaWYgKCAhbDF0
ICkKKyAgICAgICAgICAgICAgICBtZm4gPSBhbGxvY194ZW5fcGFnZXRhYmxlX25ldygpOworICAg
ICAgICAgICAgICAgIGlmICggbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pICkKICAgICAgICAgICAg
ICAgICB7CiAgICAgICAgICAgICAgICAgICAgIEFTU0VSVChyYyA9PSAtRU5PTUVNKTsKICAgICAg
ICAgICAgICAgICAgICAgZ290byBvdXQ7CiAgICAgICAgICAgICAgICAgfQogCisgICAgICAgICAg
ICAgICAgbDF0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KG1mbik7CisKICAgICAgICAgICAgICAg
ICBmb3IgKCBpID0gMDsgaSA8IEwxX1BBR0VUQUJMRV9FTlRSSUVTOyBpKysgKQogICAgICAgICAg
ICAgICAgICAgICBsMWVfd3JpdGUoJmwxdFtpXSwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGwxZV9mcm9tX3BmbihsMmVfZ2V0X3BmbigqcGwyZSkgKyBpLApAQCAtNTY1NSwxNCArNTY2
MywxNyBAQCBpbnQgbW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVk
IGxvbmcgZSwgdW5zaWduZWQgaW50IG5mKQogICAgICAgICAgICAgICAgIGlmICggKGwyZV9nZXRf
ZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFJFU0VOVCkgJiYKICAgICAgICAgICAgICAgICAgICAgIChs
MmVfZ2V0X2ZsYWdzKCpwbDJlKSAmIF9QQUdFX1BTRSkgKQogICAgICAgICAgICAgICAgIHsKLSAg
ICAgICAgICAgICAgICAgICAgbDJlX3dyaXRlX2F0b21pYyhwbDJlLCBsMmVfZnJvbV9tZm4odmly
dF90b19tZm4obDF0KSwKKyAgICAgICAgICAgICAgICAgICAgbDJlX3dyaXRlX2F0b21pYyhwbDJl
LCBsMmVfZnJvbV9tZm4obWZuLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBfX1BBR0VfSFlQRVJWSVNPUikpOwotICAgICAgICAgICAgICAg
ICAgICBsMXQgPSBOVUxMOworICAgICAgICAgICAgICAgICAgICBVTk1BUF9YRU5fUEFHRVRBQkxF
X05FVyhsMXQpOwogICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgICBpZiAoIGxvY2tp
bmcgKQogICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygmbWFwX3BnZGlyX2xvY2spOwog
ICAgICAgICAgICAgICAgIGlmICggbDF0ICkKLSAgICAgICAgICAgICAgICAgICAgZnJlZV94ZW5f
cGFnZXRhYmxlKGwxdCk7CisgICAgICAgICAgICAgICAgeworICAgICAgICAgICAgICAgICAgICBV
Tk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsMXQpOworICAgICAgICAgICAgICAgICAgICBmcmVlX3hl
bl9wYWdldGFibGVfbmV3KG1mbik7CisgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgfQog
ICAgICAgICB9CiAgICAgICAgIGVsc2UKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
