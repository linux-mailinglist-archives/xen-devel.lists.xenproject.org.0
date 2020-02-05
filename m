Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 020831529E1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 12:26:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izIn8-00030X-13; Wed, 05 Feb 2020 11:24:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gd5K=3Z=amazon.co.uk=prvs=297b894c2=pdurrant@srs-us1.protection.inumbo.net>)
 id 1izIn6-00030F-2I
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:24:20 +0000
X-Inumbo-ID: 0d241602-480a-11ea-b211-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d241602-480a-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 11:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580901859; x=1612437859;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aUVhM3JACGS8Mtd4sIpfFaFQhcNQCUVDkHagyeiC2pA=;
 b=MxS66uDvW/Qv25UZXzwIX9WXaFJaOW+7hg3JtQO4m8urxeCgD1WsYT4T
 95vZ3IRIk9VtIAK4JcidB736QZbUmZoJI4KkY2FDzc4yFt8y4JTs2wGR6
 HJItJ9B7NIdLOA3mhUTzJgaXNMGX2CoBqRGw1/0iA802NVWAe/0q6pXN2 U=;
IronPort-SDR: OUFv4zXygIY0WK5js32znPl/xSDWo8rTQmjY+N9vLyVNmT7LN6uLCiVcupk+IczeRqOa4EG/kH
 PcnqzlnPpaCg==
X-IronPort-AV: E=Sophos;i="5.70,405,1574121600"; d="scan'208";a="14881112"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 05 Feb 2020 11:24:17 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9AE71A2698; Wed,  5 Feb 2020 11:24:16 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 5 Feb 2020 11:24:16 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 5 Feb 2020 11:24:15 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 5 Feb 2020 11:24:13 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 5 Feb 2020 11:24:12 +0000
Message-ID: <20200205112412.19414-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2] libxl: fix assertion failure in stub domain
 creation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW4gYXNzZXJ0aW9uIGluIGxpYnhsX19kb21haW5fbWFrZSgpOgoKJ3NvZnRfcmVzZXQgfHwgKmRv
bWlkID09IElOVkFMSURfRE9NSUQnCgpkb2VzIG5vdCBob2xkIHRydWUgZm9yIHN0dWIgZG9tYWlu
IGNyZWF0aW9uLCB3aGVyZSBzb2Z0X3Jlc2V0IGlzIGZhbHNlCmJ1dCB0aGUgcGFzc2VkIGluIGRv
bWlkID09IDAuIFRoaXMgaXMgZWFzaWx5IGZpeGVkIGJ5IGNoYW5naW5nIHRoZQppbml0aWFsaXpl
ciBpbiBsaWJ4bF9fc3Bhd25fc3R1Yl9kbSgpLgoKTk9URTogVGhlIGNvbW1lbnQgZm9yIFhFTl9E
T01DVExfY3JlYXRlZG9tYWluIGluIGRvbWN0bC5oIGlzIGNoYW5nZWQgdG8KICAgICAgcmVmbGVj
dCByZWFsaXR5LgoKRml4ZXM6IDc1MjU5MjM5ZDg1ZCAoImxpYnhsX2NyZWF0ZTogbWFrZSAnc29m
dCByZXNldCcgZXhwbGljaXQiKQpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50
QGFtYXpvbi5jb20+Ci0tLQpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+CkNjOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBH
ZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgpD
YzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKQW4gZXhhbXBsZSBvZiB0
aGUgYXNzZXJ0aW9uIGZhaWx1cmUgY2FuIGJlIHNlZW4gYXQ6CgpodHRwOi8vbG9ncy50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQ2NzI2L3Rlc3QtYW1kNjQtYW1kNjQteGwt
cWVtdXQtc3R1YmRvbS1kZWJpYW5odm0tYW1kNjQteHNtLzEwLnRzLWRlYmlhbi1odm0taW5zdGFs
bC5sb2cKLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kbS5jICAgICAgfCAyICstCiB4ZW4vaW5jbHVk
ZS9wdWJsaWMvZG9tY3RsLmggfCAzICsrLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKaW5kZXggZjc1OGRhZjNiNi4uM2IxZGE5MDE2NyAxMDA2
NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYworKysgYi90b29scy9saWJ4bC9saWJ4bF9k
bS5jCkBAIC0yMTI3LDcgKzIxMjcsNyBAQCB2b2lkIGxpYnhsX19zcGF3bl9zdHViX2RtKGxpYnhs
X19lZ2MgKmVnYywgbGlieGxfX3N0dWJfZG1fc3Bhd25fc3RhdGUgKnNkc3MpCiAgICAgICAgIGdv
dG8gb3V0OwogICAgIH0KIAotICAgIHNkc3MtPnB2cWVtdS5ndWVzdF9kb21pZCA9IDA7CisgICAg
c2Rzcy0+cHZxZW11Lmd1ZXN0X2RvbWlkID0gSU5WQUxJRF9ET01JRDsKIAogICAgIGxpYnhsX2Rv
bWFpbl9jcmVhdGVfaW5mb19pbml0KCZkbV9jb25maWctPmNfaW5mbyk7CiAgICAgZG1fY29uZmln
LT5jX2luZm8udHlwZSA9IExJQlhMX0RPTUFJTl9UWVBFX1BWOwpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvcHVibGljL2RvbWN0bC5oIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCmluZGV4
IDJiYjczOTc5MjMuLmZlYzZmNmZkZDEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9k
b21jdGwuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKQEAgLTQyLDcgKzQyLDgg
QEAKIAogLyoKICAqIE5CLiB4ZW5fZG9tY3RsLmRvbWFpbiBpcyBhbiBJTi9PVVQgcGFyYW1ldGVy
IGZvciB0aGlzIG9wZXJhdGlvbi4KLSAqIElmIGl0IGlzIHNwZWNpZmllZCBhcyB6ZXJvLCBhbiBp
ZCBpcyBhdXRvLWFsbG9jYXRlZCBhbmQgcmV0dXJuZWQuCisgKiBJZiBpdCBpcyBzcGVjaWZpZWQg
YXMgYW4gaW52YWxpZCB2YWx1ZSAoMCBvciA+PSBET01JRF9GSVJTVF9SRVNFUlZFRCksCisgKiBh
biBpZCBpcyBhdXRvLWFsbG9jYXRlZCBhbmQgcmV0dXJuZWQuCiAgKi8KIC8qIFhFTl9ET01DVExf
Y3JlYXRlZG9tYWluICovCiBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gewotLSAKMi4y
MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
