Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57244148B51
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 16:34:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv0w4-0006yy-Hc; Fri, 24 Jan 2020 15:31:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9iSm=3N=amazon.co.uk=prvs=28596b9bb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iv0w3-0006yi-Nm
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 15:31:51 +0000
X-Inumbo-ID: 9fb133a6-3ebe-11ea-aecd-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fb133a6-3ebe-11ea-aecd-bc764e2007e4;
 Fri, 24 Jan 2020 15:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579879903; x=1611415903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oMAppv56KAfQ4kG90bZsQ7GWRcBbT/ckuNqYoVVoRUo=;
 b=P81SGzqvHUvmMPRxtvUrK4AHgJh4fKhEwVSoOFc/9O7iva1q/rrqiPQV
 C/PYRKk6Ckxog6JbSYTYe7dQgxUXa4yFhsjQipZUp7C4rzaFgrtvCUGAT
 d2maKFKUnPzUz8dxV3q/hRRLNRng/wwJnvAs7LYGpvGJUYhMzQxRzK4gR o=;
IronPort-SDR: aY36YlnjNi0Jjuto+xQ+UYxvQSo8r/WRRZxXs8VSNuIC3VBYUqNKtH4MfMsCSayOLqtHUIq8bd
 HmNOXy8ebUag==
X-IronPort-AV: E=Sophos;i="5.70,358,1574121600"; d="scan'208";a="14564178"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 24 Jan 2020 15:31:41 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id E029FA2316; Fri, 24 Jan 2020 15:31:40 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 24 Jan 2020 15:31:28 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 24 Jan 2020 15:31:26 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 24 Jan 2020 15:31:24 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 24 Jan 2020 15:31:02 +0000
Message-ID: <20200124153103.18321-7-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124153103.18321-1-pdurrant@amazon.com>
References: <20200124153103.18321-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 6/7] x86 / vmx: use a MEMF_no_refcount
 domheap page for APIC_DEFAULT_PHYS_BASE
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
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dm14X2FsbG9jX3ZsYXBpY19tYXBwaW5nKCkgY3VycmVudGx5IGNvbnRhaW5zIHNvbWUgdmVyeSBv
ZGQgbG9va2luZyBjb2RlCnRoYXQgYWxsb2NhdGVzIGEgTUVNRl9ub19vd25lciBkb21oZWFwIHBh
Z2UgYW5kIHRoZW4gc2hhcmVzIHdpdGggdGhlIGd1ZXN0CmFzIGlmIGl0IHdlcmUgYSB4ZW5oZWFw
IHBhZ2UuIFRoaXMgdGhlbiByZXF1aXJlcyB2bXhfZnJlZV92bGFwaWNfbWFwcGluZygpCnRvIGNh
bGwgYSBzcGVjaWFsIGZ1bmN0aW9uIGluIHRoZSBtbSBjb2RlOiBmcmVlX3NoYXJlZF9kb21oZWFw
X3BhZ2UoKS4KCkJ5IHVzaW5nIGEgTUVNRl9ub19yZWZjb3VudCBkb21oZWFwIHBhZ2UgaW5zdGVh
ZCwgdGhlIG9kZCBsb29raW5nIGNvZGUgaW4Kdm14X2FsbG9jX3ZsYXBpY19tYXBwaW5nKCkgY2Fu
IHNpbXBseSB1c2UgZ2V0X3BhZ2VfYW5kX3R5cGUoKSB0byBzZXQgdXAgYQp3cml0YWJsZSBtYXBw
aW5nIGJlZm9yZSBpbnNlcnRpb24gaW4gdGhlIFAyTSBhbmQgdm14X2ZyZWVfdmxhcGljX21hcHBp
bmcoKQpjYW4gc2ltcGx5IHJlbGVhc2UgdGhlIHBhZ2UgdXNpbmcgcHV0X3BhZ2VfYWxsb2NfcmVm
KCkgZm9sbG93ZWQgYnkKcHV0X3BhZ2VfYW5kX3R5cGUoKS4gVGhpcyB0aGVuIGFsbG93cyBmcmVl
X3NoYXJlZF9kb21oZWFwX3BhZ2UoKSB0byBiZQpwdXJnZWQuCgpTaWduZWQtb2ZmLWJ5OiBQYXVs
IER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Ci0tLQpDYzogSnVuIE5ha2FqaW1hIDxqdW4u
bmFrYWppbWFAaW50ZWwuY29tPgpDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+
CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6ICJS
b2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgp2NDoKIC0gVXNlIGEgTUVN
Rl9ub19yZWZjb3VudCBwYWdlIHJhdGhlciB0aGFuIGEgJ25vcm1hbCcgcGFnZQoKdjI6CiAtIFNl
dCBhbiBpbml0aWFsIHZhbHVlIGZvciBtYXhfcGFnZXMgcmF0aGVyIHRoYW4gYXZvaWRpbmcgdGhl
IGNoZWNrIGluCiAgIGFzc2lnbl9wYWdlcygpCiAtIE1ha2UgZG9tYWluX2Rlc3Ryb3koKSBvcHRp
b25hbAotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIHwgMjEgKysrKysrKysrKysrKysr
KysrLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICB8IDEwIC0tLS0tLS0tLS0KIHhlbi9p
bmNsdWRlL2FzbS14ODYvbW0uaCAgIHwgIDIgLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0
aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92
bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwppbmRleCA2MDZmM2RjMmViLi43
NDIzZDI0MjFiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYworKysgYi94
ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpAQCAtMzAyOCwxMiArMzAyOCwyMiBAQCBzdGF0aWMg
aW50IHZteF9hbGxvY192bGFwaWNfbWFwcGluZyhzdHJ1Y3QgZG9tYWluICpkKQogICAgIGlmICgg
IWNwdV9oYXNfdm14X3ZpcnR1YWxpemVfYXBpY19hY2Nlc3NlcyApCiAgICAgICAgIHJldHVybiAw
OwogCi0gICAgcGcgPSBhbGxvY19kb21oZWFwX3BhZ2UoZCwgTUVNRl9ub19vd25lcik7CisgICAg
cGcgPSBhbGxvY19kb21oZWFwX3BhZ2UoZCwgTUVNRl9ub19yZWZjb3VudCk7CiAgICAgaWYgKCAh
cGcgKQogICAgICAgICByZXR1cm4gLUVOT01FTTsKKworICAgIGlmICggIWdldF9wYWdlX2FuZF90
eXBlKHBnLCBkLCBQR1Rfd3JpdGFibGVfcGFnZSkgKQorICAgIHsKKyAgICAgICAgLyoKKyAgICAg
ICAgICogVGhlIGRvbWFpbiBjYW4ndCBwb3NzaWJseSBrbm93IGFib3V0IHRoaXMgcGFnZSB5ZXQs
IHNvIGZhaWx1cmUKKyAgICAgICAgICogaGVyZSBpcyBhIGNsZWFyIGluZGljYXRpb24gb2Ygc29t
ZXRoaW5nIGZpc2h5IGdvaW5nIG9uLgorICAgICAgICAgKi8KKyAgICAgICAgZG9tYWluX2NyYXNo
KGQpOworICAgICAgICByZXR1cm4gLUVOT0RBVEE7CisgICAgfQorCiAgICAgbWZuID0gcGFnZV90
b19tZm4ocGcpOwogICAgIGNsZWFyX2RvbWFpbl9wYWdlKG1mbik7Ci0gICAgc2hhcmVfeGVuX3Bh
Z2Vfd2l0aF9ndWVzdChwZywgZCwgU0hBUkVfcncpOwogICAgIGQtPmFyY2guaHZtLnZteC5hcGlj
X2FjY2Vzc19tZm4gPSBtZm47CiAKICAgICByZXR1cm4gc2V0X21taW9fcDJtX2VudHJ5KGQsIHBh
ZGRyX3RvX3BmbihBUElDX0RFRkFVTFRfUEhZU19CQVNFKSwgbWZuLApAQCAtMzA0Nyw3ICszMDU3
LDEyIEBAIHN0YXRpYyB2b2lkIHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKHN0cnVjdCBkb21haW4g
KmQpCiAKICAgICBkLT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3NfbWZuID0gX21mbigwKTsKICAg
ICBpZiAoICFtZm5fZXEobWZuLCBfbWZuKDApKSApCi0gICAgICAgIGZyZWVfc2hhcmVkX2RvbWhl
YXBfcGFnZShtZm5fdG9fcGFnZShtZm4pKTsKKyAgICB7CisgICAgICAgIHN0cnVjdCBwYWdlX2lu
Zm8gKnBnID0gbWZuX3RvX3BhZ2UobWZuKTsKKworICAgICAgICBwdXRfcGFnZV9hbGxvY19yZWYo
cGcpOworICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShwZyk7CisgICAgfQogfQogCiBzdGF0aWMg
dm9pZCB2bXhfaW5zdGFsbF92bGFwaWNfbWFwcGluZyhzdHJ1Y3QgdmNwdSAqdikKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggNjU0MTkwZTll
OS4uMmE2ZDJlOGFmOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIveGVuL2Fy
Y2gveDg2L21tLmMKQEAgLTQ5NiwxNiArNDk2LDYgQEAgdm9pZCBzaGFyZV94ZW5fcGFnZV93aXRo
X2d1ZXN0KHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UsIHN0cnVjdCBkb21haW4gKmQsCiAgICAgc3Bp
bl91bmxvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7CiB9CiAKLXZvaWQgZnJlZV9zaGFyZWRfZG9t
aGVhcF9wYWdlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCi17Ci0gICAgcHV0X3BhZ2VfYWxsb2Nf
cmVmKHBhZ2UpOwotICAgIGlmICggIXRlc3RfYW5kX2NsZWFyX2JpdChfUEdDX3hlbl9oZWFwLCAm
cGFnZS0+Y291bnRfaW5mbykgKQotICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKLSAgICBw
YWdlLT51LmludXNlLnR5cGVfaW5mbyA9IDA7Ci0gICAgcGFnZV9zZXRfb3duZXIocGFnZSwgTlVM
TCk7Ci0gICAgZnJlZV9kb21oZWFwX3BhZ2UocGFnZSk7Ci19Ci0KIHZvaWQgbWFrZV9jcjMoc3Ry
dWN0IHZjcHUgKnYsIG1mbl90IG1mbikKIHsKICAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9t
YWluOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9tbS5oCmluZGV4IGU3NWZlZWExNWUuLjAzNmQ3YWMyMmYgMTAwNjQ0Ci0tLSBhL3hl
bi9pbmNsdWRlL2FzbS14ODYvbW0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKQEAg
LTMyMCw4ICszMjAsNiBAQCBzdHJ1Y3QgcGFnZV9pbmZvCiAKICNkZWZpbmUgbWFkZHJfZ2V0X293
bmVyKG1hKSAgIChwYWdlX2dldF9vd25lcihtYWRkcl90b19wYWdlKChtYSkpKSkKIAotZXh0ZXJu
IHZvaWQgZnJlZV9zaGFyZWRfZG9taGVhcF9wYWdlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpOwot
CiAjZGVmaW5lIGZyYW1lX3RhYmxlICgoc3RydWN0IHBhZ2VfaW5mbyAqKUZSQU1FVEFCTEVfVklS
VF9TVEFSVCkKIGV4dGVybiB1bnNpZ25lZCBsb25nIG1heF9wYWdlOwogZXh0ZXJuIHVuc2lnbmVk
IGxvbmcgdG90YWxfcGFnZXM7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
