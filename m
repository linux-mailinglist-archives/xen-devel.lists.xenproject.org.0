Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691D6BEF05
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:53:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPm-0008MN-Om; Thu, 26 Sep 2019 09:50:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPk-0008Ho-Rm
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:20 +0000
X-Inumbo-ID: f595e512-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by localhost (Halon) with ESMTPS
 id f595e512-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491381; x=1601027381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=zyosdYVmojrSWgJKr5OykIUlrK5LiuGCbfn1NO0sGF8=;
 b=D1GDVH79KEVlgcWrqKDNhvKDINUXe4Vo0uJswrQNanPpprXg2KEMVJE4
 pnXJbcbXAZXhahuIFZHHRQXJWNZQu1DzBfof2vT5CV00C5/xbuih7WbkF
 8E217wOcpRntdgAPywAzyHENJPdbKOpZsq4NL9VVrxl/X1Q/fFoAx3VZh M=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="704637294"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1d-98acfc19.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Sep 2019 09:48:09 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-98acfc19.us-east-1.amazon.com (Postfix) with ESMTPS
 id 897CDA18F2; Thu, 26 Sep 2019 09:47:51 +0000 (UTC)
Received: from EX13D15UWA001.ant.amazon.com (10.43.160.152) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:23 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D15UWA001.ant.amazon.com (10.43.160.152) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:23 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:22 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:39 +0100
Message-ID: <5d71a079f647c913dc6cdfe30ce62c8728f37fc4.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 16/84] x86/mm: switch to new APIs in
 map_pages_to_xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClBhZ2UgdGFibGVzIGFsbG9jYXRl
ZCBpbiB0aGF0IGZ1bmN0aW9uIHNob3VsZCBiZSBtYXBwZWQgYW5kIHVubWFwcGVkCm5vdy4KClNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gv
eDg2L21tLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IGY3ZmQwZTZiYWQuLjA2MTY2
NjYyMjEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9t
bS5jCkBAIC01MTg1LDYgKzUxODUsNyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBmbHVzaF9mbGFncyA9CiAgICAgICAgICAgICAgICAgRkxVU0hfVExC
IHwgRkxVU0hfT1JERVIoMiAqIFBBR0VUQUJMRV9PUkRFUik7CiAgICAgICAgICAgICBsMl9wZ2Vu
dHJ5X3QgKmwydDsKKyAgICAgICAgICAgIG1mbl90IG1mbjsKIAogICAgICAgICAgICAgLyogU2tp
cCB0aGlzIFBURSBpZiB0aGVyZSBpcyBubyBjaGFuZ2UuICovCiAgICAgICAgICAgICBpZiAoICgo
bDNlX2dldF9wZm4ob2wzZSkgJiB+KEwyX1BBR0VUQUJMRV9FTlRSSUVTICoKQEAgLTUyMDYsMTMg
KzUyMDcsMTUgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCiAgICAgICAgICAgICAgICAgZ290byBl
bmRfb2ZfbG9vcDsKICAgICAgICAgICAgIH0KIAotICAgICAgICAgICAgbDJ0ID0gYWxsb2NfeGVu
X3BhZ2V0YWJsZSgpOwotICAgICAgICAgICAgaWYgKCBsMnQgPT0gTlVMTCApCisgICAgICAgICAg
ICBtZm4gPSBhbGxvY194ZW5fcGFnZXRhYmxlX25ldygpOworICAgICAgICAgICAgaWYgKCBtZm5f
ZXEobWZuLCBJTlZBTElEX01GTikgKQogICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIEFT
U0VSVChyYyA9PSAtRU5PTUVNKTsKICAgICAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAg
ICAgIH0KIAorICAgICAgICAgICAgbDJ0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KG1mbik7CisK
ICAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgTDJfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyAp
CiAgICAgICAgICAgICAgICAgbDJlX3dyaXRlKGwydCArIGksCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGwyZV9mcm9tX3BmbihsM2VfZ2V0X3BmbihvbDNlKSArCkBAIC01MjI3LDE1ICs1MjMw
LDE4IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAogICAgICAgICAgICAgaWYgKCAobDNlX2dldF9m
bGFncygqcGwzZSkgJiBfUEFHRV9QUkVTRU5UKSAmJgogICAgICAgICAgICAgICAgICAobDNlX2dl
dF9mbGFncygqcGwzZSkgJiBfUEFHRV9QU0UpICkKICAgICAgICAgICAgIHsKLSAgICAgICAgICAg
ICAgICBsM2Vfd3JpdGVfYXRvbWljKHBsM2UsIGwzZV9mcm9tX21mbih2aXJ0X3RvX21mbihsMnQp
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9f
UEFHRV9IWVBFUlZJU09SKSk7CisgICAgICAgICAgICAgICAgbDNlX3dyaXRlX2F0b21pYyhwbDNl
LCBsM2VfZnJvbV9tZm4obWZuLCBfX1BBR0VfSFlQRVJWSVNPUikpOworICAgICAgICAgICAgICAg
IFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwydCk7CiAgICAgICAgICAgICAgICAgbDJ0ID0gTlVM
TDsKICAgICAgICAgICAgIH0KICAgICAgICAgICAgIGlmICggbG9ja2luZyApCiAgICAgICAgICAg
ICAgICAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKICAgICAgICAgICAgIGZsdXNoX2Fy
ZWEodmlydCwgZmx1c2hfZmxhZ3MpOwogICAgICAgICAgICAgaWYgKCBsMnQgKQotICAgICAgICAg
ICAgICAgIGZyZWVfeGVuX3BhZ2V0YWJsZShsMnQpOworICAgICAgICAgICAgeworICAgICAgICAg
ICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwydCk7CisgICAgICAgICAgICAgICAgZnJl
ZV94ZW5fcGFnZXRhYmxlX25ldyhtZm4pOworICAgICAgICAgICAgfQogICAgICAgICB9CiAKICAg
ICAgICAgcGwyZSA9IHZpcnRfdG9feGVuX2wyZSh2aXJ0KTsKQEAgLTUyOTgsNiArNTMwNCw3IEBA
IGludCBtYXBfcGFnZXNfdG9feGVuKAogICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbHVz
aF9mbGFncyA9CiAgICAgICAgICAgICAgICAgICAgIEZMVVNIX1RMQiB8IEZMVVNIX09SREVSKFBB
R0VUQUJMRV9PUkRFUik7CiAgICAgICAgICAgICAgICAgbDFfcGdlbnRyeV90ICpsMXQ7CisgICAg
ICAgICAgICAgICAgbWZuX3QgbWZuOwogCiAgICAgICAgICAgICAgICAgLyogU2tpcCB0aGlzIFBU
RSBpZiB0aGVyZSBpcyBubyBjaGFuZ2UuICovCiAgICAgICAgICAgICAgICAgaWYgKCAoKChsMmVf
Z2V0X3BmbigqcGwyZSkgJiB+KEwxX1BBR0VUQUJMRV9FTlRSSUVTIC0gMSkpICsKQEAgLTUzMTcs
MTMgKzUzMjQsMTUgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCiAgICAgICAgICAgICAgICAgICAg
IGdvdG8gY2hlY2tfbDM7CiAgICAgICAgICAgICAgICAgfQogCi0gICAgICAgICAgICAgICAgbDF0
ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwotICAgICAgICAgICAgICAgIGlmICggbDF0ID09IE5V
TEwgKQorICAgICAgICAgICAgICAgIG1mbiA9IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KCk7Cisg
ICAgICAgICAgICAgICAgaWYgKCBtZm5fZXEobWZuLCBJTlZBTElEX01GTikgKQogICAgICAgICAg
ICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgQVNTRVJUKHJjID09IC1FTk9NRU0pOwogICAg
ICAgICAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAgICAgICAgICB9CiAKKyAgICAgICAg
ICAgICAgICBsMXQgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcobWZuKTsKKwogICAgICAgICAgICAg
ICAgIGZvciAoIGkgPSAwOyBpIDwgTDFfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApCiAgICAgICAg
ICAgICAgICAgICAgIGwxZV93cml0ZSgmbDF0W2ldLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbDFlX2Zyb21fcGZuKGwyZV9nZXRfcGZuKCpwbDJlKSArIGksCkBAIC01MzM3LDE1ICs1
MzQ2LDE5IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAogICAgICAgICAgICAgICAgIGlmICggKGwy
ZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFJFU0VOVCkgJiYKICAgICAgICAgICAgICAgICAg
ICAgIChsMmVfZ2V0X2ZsYWdzKCpwbDJlKSAmIF9QQUdFX1BTRSkgKQogICAgICAgICAgICAgICAg
IHsKLSAgICAgICAgICAgICAgICAgICAgbDJlX3dyaXRlX2F0b21pYyhwbDJlLCBsMmVfZnJvbV9t
Zm4odmlydF90b19tZm4obDF0KSwKKyAgICAgICAgICAgICAgICAgICAgbDJlX3dyaXRlX2F0b21p
YyhwbDJlLCBsMmVfZnJvbV9tZm4obWZuLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBfX1BBR0VfSFlQRVJWSVNPUikpOworICAgICAgICAg
ICAgICAgICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsMXQpOwogICAgICAgICAgICAgICAg
ICAgICBsMXQgPSBOVUxMOwogICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgICBpZiAo
IGxvY2tpbmcgKQogICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygmbWFwX3BnZGlyX2xv
Y2spOwogICAgICAgICAgICAgICAgIGZsdXNoX2FyZWEodmlydCwgZmx1c2hfZmxhZ3MpOwogICAg
ICAgICAgICAgICAgIGlmICggbDF0ICkKLSAgICAgICAgICAgICAgICAgICAgZnJlZV94ZW5fcGFn
ZXRhYmxlKGwxdCk7CisgICAgICAgICAgICAgICAgeworICAgICAgICAgICAgICAgICAgICBVTk1B
UF9YRU5fUEFHRVRBQkxFX05FVyhsMXQpOworICAgICAgICAgICAgICAgICAgICBmcmVlX3hlbl9w
YWdldGFibGVfbmV3KG1mbik7CisgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgfQogCiAg
ICAgICAgICAgICBwbDFlICA9IGwyZV90b19sMWUoKnBsMmUpICsgbDFfdGFibGVfb2Zmc2V0KHZp
cnQpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
