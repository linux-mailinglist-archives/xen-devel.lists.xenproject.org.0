Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDF8113091
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 18:14:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icYCI-0003wl-85; Wed, 04 Dec 2019 17:12:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQYo=Z2=amazon.com=prvs=234ed30ac=hongyxia@srs-us1.protection.inumbo.net>)
 id 1icYCG-0003wG-DX
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 17:12:16 +0000
X-Inumbo-ID: 33af9972-16b9-11ea-8206-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33af9972-16b9-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 17:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575479528; x=1607015528;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=1yf9dDqLvjuFgwwJJk8m9i3fRjVc+CiLsNbxAvCjb5A=;
 b=Cz/y8gN9HJ7wfvmVhpvMfwlu56rRklvSMNlO6JC/CjcHB55YSTw86hJJ
 V57HZkKl6PWvHwQws8Vrtl4E2AxmfJEviP2qzJ13m7w8rCPlTRdB5n4Tn
 x4BJqgC5RSfkxIcLaKs2wL1/MqKKl2g7yPa2riFC0taAx1iYIeUmozQ7t Y=;
IronPort-SDR: X7RkASUdueHIRTfnMNjy6ynsjFs+kZ10Vu/HTOdHN3I8OJVRdjquViUQax41v33vEqgilPaWMW
 mZe3OaRyYyLQ==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; d="scan'208";a="11630517"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 04 Dec 2019 17:11:04 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2FB97A2898; Wed,  4 Dec 2019 17:11:04 +0000 (UTC)
Received: from EX13D01UWA002.ant.amazon.com (10.43.160.74) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:03 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13d01UWA002.ant.amazon.com (10.43.160.74) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:03 +0000
Received: from u60d575063b1f53.ant.amazon.com (10.125.106.64) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 4 Dec 2019 17:11:02 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 17:10:52 +0000
Message-ID: <cover.1575477921.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 0/9] Add alternative API for Xen PTEs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tk9URTogTXkgZW1haWwgYWRkcmVzcyBoYXMgY2hhbmdlZCBkdWUgdG8gc29tZSBIUiBtYW5hZ2Vt
ZW50LiBJIGhhdmUKbG9zdCBhbGwgbXkgcHJldmlvdXMgZW1haWxzIGFuZCBJIGNvdWxkIG9ubHkg
c2FsdmFnZSBzb21lIG9mIHRoZQpjb21tZW50cyB0byB2MyBmcm9tIHRoZSBtYWlsaW5nIGxpc3Qg
YXJjaGl2ZS4gSSB3aWxsIHJlcGx5IHRvIHRoZQpjb21tZW50cyBmcm9tIHYzIGluIHRoaXMgdjQg
c2VyaWVzLgoKVGhpcyBiYXRjaCBhZGRzIGFuIGFsdGVybmF0aXZlIGFsbG9jLW1hcC11bm1hcC1m
cmVlIFhlbiBQVEUgQVBJIHRvIHRoZQpub3JtYWwgYWxsb2MtZnJlZSBvbiB0aGUgeGVuaGVhcCwg
aW4gcHJlcGFyYXRpb24gb2Ygc3dpdGNoaW5nIHRvIGRvbWhlYXAKZm9yIFhlbiBwYWdlIHRhYmxl
cy4gU2luY2UgbWFwIGFuZCB1bm1hcCBhcmUgYmFzaWNhbGx5IG5vLW9wcyBub3csIGFuZApvdGhl
ciBjaGFuZ2VzIGFyZSBjb3NtZXRpYyB0byBlYXNlIGZ1dHVyZSBwYXRjaGVzLCB0aGlzIGJhdGNo
IGRvZXMgbm90CmludHJvZHVjZSBhbnkgZnVuY3Rpb25hbCBjaGFuZ2VzLgoKdHJlZToKaHR0cHM6
Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0LWh0dHAvcGVvcGxlL2h4MjQyL3hlbi5naXQgeGVuX3B0ZV9t
YXAtdjQKCnYzOiAKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hl
bi1kZXZlbC8yMDE5LTEwL21zZzAwMzA0Lmh0bWwKCi0tLQpDaGFuZ2VkIHNpbmNlIHYzOgotIGNo
YW5nZSBteSBlbWFpbCBhZGRyZXNzIGluIGFsbCBwYXRjaGVzCi0gYWRkcmVzcyBtYW55IHN0eWxl
IGlzc3VlcyBpbiB2MwotIHJlYmFzZQoKQ2hhbmdlZCBzaW5jZSB2MjoKLSBzcGxpdCBpbnRvIGEg
c21hbGxlciBzZXJpZXMKLSBkcm9wIHRoZSBjbGVhcl9wYWdlIG9wdGltaXNhdGlvbiBhcyBXZWkg
c3VnZ2VzdHMKLSByZWJhc2UKCkNoYW5nZWQgc2luY2UgdjE6Ci0gc3F1YXNoIHNvbWUgY29tbWl0
cwotIG1lcmdlIGJ1ZyBmaXhlcyBpbnRvIHRoaXMgZmlyc3QgYmF0Y2gKLSByZWJhc2UgYWdhaW5z
dCBsYXRlc3QgbWFzdGVyCgpXZWkgTGl1ICg5KToKICB4ODY6IG1vdmUgc29tZSB4ZW4gbW0gZnVu
Y3Rpb24gZGVjbGFyYXRpb25zCiAgeDg2OiBpbnRyb2R1Y2UgYSBuZXcgc2V0IG9mIEFQSXMgdG8g
bWFuYWdlIFhlbiBwYWdlIHRhYmxlcwogIHg4Ni9tbTogaW50cm9kdWNlIGx7MSwyfXQgbG9jYWwg
dmFyaWFibGVzIHRvIG1hcF9wYWdlc190b194ZW4KICB4ODYvbW06IGludHJvZHVjZSBsezEsMn10
IGxvY2FsIHZhcmlhYmxlcyB0byBtb2RpZnlfeGVuX21hcHBpbmdzCiAgeDg2L21tOiBtYXBfcGFn
ZXNfdG9feGVuIHdvdWxkIGJldHRlciBoYXZlIG9uZSBleGl0IHBhdGgKICB4ODYvbW06IGFkZCBh
biBlbmRfb2ZfbG9vcCBsYWJlbCBpbiBtYXBfcGFnZXNfdG9feGVuCiAgeDg2L21tOiBtYWtlIHN1
cmUgdGhlcmUgaXMgb25lIGV4aXQgcGF0aCBmb3IgbW9kaWZ5X3hlbl9tYXBwaW5ncwogIHg4Ni9t
bTogYWRkIGFuIGVuZF9vZl9sb29wIGxhYmVsIGluIG1vZGlmeV94ZW5fbWFwcGluZ3MKICB4ODYv
bW06IGNoYW5nZSBwbCplIHRvIGwqdCBpbiB2aXJ0X3RvX3hlbl9sKmUKCiB4ZW4vYXJjaC94ODYv
bW0uYyAgICAgICAgICB8IDI4MCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
CiB4ZW4vaW5jbHVkZS9hc20teDg2L21tLmggICB8ICAxNiArKysKIHhlbi9pbmNsdWRlL2FzbS14
ODYvcGFnZS5oIHwgICA1IC0KIDMgZmlsZXMgY2hhbmdlZCwgMTg2IGluc2VydGlvbnMoKyksIDEx
NSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
