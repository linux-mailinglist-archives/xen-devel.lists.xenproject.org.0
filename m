Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B87AC1467E1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 13:24:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iubUm-0006wN-LL; Thu, 23 Jan 2020 12:22:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqmU=3M=amazon.co.uk=prvs=2848fc5af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iubUl-0006wG-Sm
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 12:21:59 +0000
X-Inumbo-ID: f378ad00-3dda-11ea-be14-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f378ad00-3dda-11ea-be14-12813bfff9fa;
 Thu, 23 Jan 2020 12:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579782119; x=1611318119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2lzEZDhgxXCFC9fA5KBzFHKfUlrE+V5zfJAISHPuxIg=;
 b=sDfA7ZjZwTtQu2LwpaxftEutcKsdPKZQdvTBa01hXYwUYEoChwKskJpS
 K9OPyIOAhD+GiKIRmnkJ28889K6n0EdlCcDdGn8H7emvFHTsSyqqeR77B
 MjlBFKJnkv704QMht0R+HgdoPCHfHAbr8M2DzZpuJNImbOBNcYBJbSKca 0=;
IronPort-SDR: 5iWyqt2/bW5HoVjptiPMBvxv6G95iyYhTU44E1e+vh5R2BtbT/hBK2zM7Oj6jgqCAjIYXTmbuV
 rMJdwL05BPtQ==
X-IronPort-AV: E=Sophos;i="5.70,353,1574121600"; d="scan'208";a="12928362"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 23 Jan 2020 12:21:57 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id A53CC1A13AA; Thu, 23 Jan 2020 12:21:54 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 23 Jan 2020 12:21:54 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 23 Jan 2020 12:21:53 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 23 Jan 2020 12:21:51 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 23 Jan 2020 12:21:38 +0000
Message-ID: <20200123122141.1419-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200123122141.1419-1-pdurrant@amazon.com>
References: <20200123122141.1419-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 1/3] x86 / vmx: make apic_access_mfn type-safe
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIG1mbl90IHJhdGhlciB0aGFuIHVuc2lnbmVkIGxvbmcgYW5kIGNoYW5nZSBwcmV2aW91cyB0
ZXN0cyBhZ2FpbnN0IDAgdG8KdGVzdHMgYWdhaW5zdCBJTlZBTElEX01GTiAoYWxzbyBpbnRyb2R1
Y2luZyBpbml0aWFsaXphdGlvbiB0byB0aGF0IHZhbHVlKS4KClNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmlu
LnRpYW5AaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNj
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KQ2M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KCnYy
OgogLSBTZXQgYXBpY19hY2Nlc3NfbWZuIHRvIElOVkFMSURfTUZOIGluIHZteF9mcmVlX3ZsYXBp
Y19tYXBwaW5nKCkgdG8gbWFrZQogICB0aGUgZnVuY3Rpb24gaWRlbXBvdGVudAotLS0KIHhlbi9h
cmNoL3g4Ni9odm0vbXRyci5jICAgICAgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L2h2bS92
bXgvdm14LmMgICAgICAgICB8IDE1ICsrKysrKysrLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4
Ni9odm0vdm14L3ZtY3MuaCB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9tdHJyLmMg
Yi94ZW4vYXJjaC94ODYvaHZtL210cnIuYwppbmRleCA1YWQxNWVhZmUwLi44MzU2ZThkZTNkIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL210cnIuYworKysgYi94ZW4vYXJjaC94ODYvaHZt
L210cnIuYwpAQCAtODE4LDcgKzgxOCw3IEBAIGludCBlcHRlX2dldF9lbnRyeV9lbXQoc3RydWN0
IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnZm4sIG1mbl90IG1mbiwKIAogICAgIGlmICggZGly
ZWN0X21taW8gKQogICAgIHsKLSAgICAgICAgaWYgKCAobWZuX3gobWZuKSBeIGQtPmFyY2guaHZt
LnZteC5hcGljX2FjY2Vzc19tZm4pID4+IG9yZGVyICkKKyAgICAgICAgaWYgKCAobWZuX3gobWZu
KSBeIG1mbl94KGQtPmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19tZm4pKSA+PiBvcmRlciApCiAg
ICAgICAgICAgICByZXR1cm4gTVRSUl9UWVBFX1VOQ0FDSEFCTEU7CiAgICAgICAgIGlmICggb3Jk
ZXIgKQogICAgICAgICAgICAgcmV0dXJuIC0xOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2
bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwppbmRleCBmODNmMTAyNjM4
Li44NzA2OTU0ZDczIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYworKysg
Yi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpAQCAtNDEzLDYgKzQxMyw3IEBAIHN0YXRpYyBp
bnQgdm14X2RvbWFpbl9pbml0aWFsaXNlKHN0cnVjdCBkb21haW4gKmQpCiAgICAgaWYgKCAhaGFz
X3ZsYXBpYyhkKSApCiAgICAgICAgIHJldHVybiAwOwogCisgICAgZC0+YXJjaC5odm0udm14LmFw
aWNfYWNjZXNzX21mbiA9IElOVkFMSURfTUZOOwogICAgIGlmICggKHJjID0gdm14X2FsbG9jX3Zs
YXBpY19tYXBwaW5nKGQpKSAhPSAwICkKICAgICAgICAgcmV0dXJuIHJjOwogCkBAIC0zMDM0LDcg
KzMwMzUsNyBAQCBzdGF0aWMgaW50IHZteF9hbGxvY192bGFwaWNfbWFwcGluZyhzdHJ1Y3QgZG9t
YWluICpkKQogICAgIG1mbiA9IHBhZ2VfdG9fbWZuKHBnKTsKICAgICBjbGVhcl9kb21haW5fcGFn
ZShtZm4pOwogICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QocGcsIGQsIFNIQVJFX3J3KTsK
LSAgICBkLT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3NfbWZuID0gbWZuX3gobWZuKTsKKyAgICBk
LT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3NfbWZuID0gbWZuOwogCiAgICAgcmV0dXJuIHNldF9t
bWlvX3AybV9lbnRyeShkLCBwYWRkcl90b19wZm4oQVBJQ19ERUZBVUxUX1BIWVNfQkFTRSksIG1m
biwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfT1JERVJfNEssCkBAIC0zMDQz
LDI0ICszMDQ0LDI0IEBAIHN0YXRpYyBpbnQgdm14X2FsbG9jX3ZsYXBpY19tYXBwaW5nKHN0cnVj
dCBkb21haW4gKmQpCiAKIHN0YXRpYyB2b2lkIHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKHN0cnVj
dCBkb21haW4gKmQpCiB7Ci0gICAgdW5zaWduZWQgbG9uZyBtZm4gPSBkLT5hcmNoLmh2bS52bXgu
YXBpY19hY2Nlc3NfbWZuOworICAgIG1mbl90IG1mbiA9IGQtPmFyY2guaHZtLnZteC5hcGljX2Fj
Y2Vzc19tZm47CiAKLSAgICBpZiAoIG1mbiAhPSAwICkKLSAgICAgICAgZnJlZV9zaGFyZWRfZG9t
aGVhcF9wYWdlKG1mbl90b19wYWdlKF9tZm4obWZuKSkpOworICAgIGQtPmFyY2guaHZtLnZteC5h
cGljX2FjY2Vzc19tZm4gPSBJTlZBTElEX01GTjsKKyAgICBpZiAoICFtZm5fZXEobWZuLCBJTlZB
TElEX01GTikgKQorICAgICAgICBmcmVlX3NoYXJlZF9kb21oZWFwX3BhZ2UobWZuX3RvX3BhZ2Uo
bWZuKSk7CiB9CiAKIHN0YXRpYyB2b2lkIHZteF9pbnN0YWxsX3ZsYXBpY19tYXBwaW5nKHN0cnVj
dCB2Y3B1ICp2KQogewogICAgIHBhZGRyX3QgdmlydF9wYWdlX21hLCBhcGljX3BhZ2VfbWE7CiAK
LSAgICBpZiAoIHYtPmRvbWFpbi0+YXJjaC5odm0udm14LmFwaWNfYWNjZXNzX21mbiA9PSAwICkK
KyAgICBpZiAoIG1mbl9lcSh2LT5kb21haW4tPmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19tZm4s
IElOVkFMSURfTUZOKSApCiAgICAgICAgIHJldHVybjsKIAogICAgIEFTU0VSVChjcHVfaGFzX3Zt
eF92aXJ0dWFsaXplX2FwaWNfYWNjZXNzZXMpOwogCiAgICAgdmlydF9wYWdlX21hID0gcGFnZV90
b19tYWRkcih2Y3B1X3ZsYXBpYyh2KS0+cmVnc19wYWdlKTsKLSAgICBhcGljX3BhZ2VfbWEgPSB2
LT5kb21haW4tPmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19tZm47Ci0gICAgYXBpY19wYWdlX21h
IDw8PSBQQUdFX1NISUZUOworICAgIGFwaWNfcGFnZV9tYSA9IG1mbl90b19tYWRkcih2LT5kb21h
aW4tPmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19tZm4pOwogCiAgICAgdm14X3ZtY3NfZW50ZXIo
dik7CiAgICAgX192bXdyaXRlKFZJUlRVQUxfQVBJQ19QQUdFX0FERFIsIHZpcnRfcGFnZV9tYSk7
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm1jcy5oIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZtY3MuaAppbmRleCBhNTE0Mjk5MTQ0Li5iZTQ2NjFhOTI5
IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm1jcy5oCisrKyBiL3hl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92bWNzLmgKQEAgLTU5LDcgKzU5LDcgQEAgc3RydWN0
IGVwdF9kYXRhIHsKICNkZWZpbmUgX1ZNWF9ET01BSU5fUE1MX0VOQUJMRUQgICAgMAogI2RlZmlu
ZSBWTVhfRE9NQUlOX1BNTF9FTkFCTEVEICAgICAoMXVsIDw8IF9WTVhfRE9NQUlOX1BNTF9FTkFC
TEVEKQogc3RydWN0IHZteF9kb21haW4gewotICAgIHVuc2lnbmVkIGxvbmcgYXBpY19hY2Nlc3Nf
bWZuOworICAgIG1mbl90IGFwaWNfYWNjZXNzX21mbjsKICAgICAvKiBWTVhfRE9NQUlOXyogKi8K
ICAgICB1bnNpZ25lZCBpbnQgc3RhdHVzOwogCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
