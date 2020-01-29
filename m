Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EB314CF5B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 18:13:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwqrk-0006MG-3s; Wed, 29 Jan 2020 17:11:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwqrj-0006LN-7x
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 17:10:59 +0000
X-Inumbo-ID: 51ad7f7a-42ba-11ea-8396-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51ad7f7a-42ba-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 17:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580317859; x=1611853859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=snp2NVeXhOEkFUzPknbnbI4mb526ZYn9hre94dMP500=;
 b=IZWZAx/Y54LWfJNIetWvsdLBUqrbvd0f2f04Rf+A/MG14cvhiXo3RZut
 K23xQs+ezmoririDyf4rXWbKz+AWPWNXYv4aOW0fORhIo7+mi9iaqjBfp
 M8TPJhVorIDPjAKRTo1gIG37nUstHf0ZKKjG0sH9xW6zKq9XrLl/63IpT A=;
IronPort-SDR: 9yekfD2Zj8j8aQXe/fdH1Jx+jcewZ1z4h+NNIgonufOFjF/BvXFLIYYbwe4ipsRM5/iQ+WD/wb
 KPmPkikdqsbA==
X-IronPort-AV: E=Sophos;i="5.70,378,1574121600"; d="scan'208";a="14793256"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 29 Jan 2020 17:10:58 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6BC24221CF5; Wed, 29 Jan 2020 17:10:57 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 17:10:45 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 17:10:44 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 29 Jan 2020 17:10:41 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 17:10:30 +0000
Message-ID: <20200129171030.1341-4-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129171030.1341-1-pdurrant@amazon.com>
References: <20200129171030.1341-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v7 3/3] x86 / vmx: use a MEMF_no_refcount
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
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
IER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Ci0tLQpDYzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50
ZWwuY29tPgpDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CkNjOiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgp2NDoKIC0g
VXNlIGEgTUVNRl9ub19yZWZjb3VudCBwYWdlIHJhdGhlciB0aGFuIGEgJ25vcm1hbCcgcGFnZQoK
djI6CiAtIFNldCBhbiBpbml0aWFsIHZhbHVlIGZvciBtYXhfcGFnZXMgcmF0aGVyIHRoYW4gYXZv
aWRpbmcgdGhlIGNoZWNrIGluCiAgIGFzc2lnbl9wYWdlcygpCiAtIE1ha2UgZG9tYWluX2Rlc3Ry
b3koKSBvcHRpb25hbAotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIHwgMjEgKysrKysr
KysrKysrKysrKysrLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICB8IDEwIC0tLS0tLS0t
LS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbW0uaCAgIHwgIDIgLS0KIDMgZmlsZXMgY2hhbmdlZCwg
MTggaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwppbmRleCA2MDZm
M2RjMmViLi43NDIzZDI0MjFiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXgu
YworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpAQCAtMzAyOCwxMiArMzAyOCwyMiBA
QCBzdGF0aWMgaW50IHZteF9hbGxvY192bGFwaWNfbWFwcGluZyhzdHJ1Y3QgZG9tYWluICpkKQog
ICAgIGlmICggIWNwdV9oYXNfdm14X3ZpcnR1YWxpemVfYXBpY19hY2Nlc3NlcyApCiAgICAgICAg
IHJldHVybiAwOwogCi0gICAgcGcgPSBhbGxvY19kb21oZWFwX3BhZ2UoZCwgTUVNRl9ub19vd25l
cik7CisgICAgcGcgPSBhbGxvY19kb21oZWFwX3BhZ2UoZCwgTUVNRl9ub19yZWZjb3VudCk7CiAg
ICAgaWYgKCAhcGcgKQogICAgICAgICByZXR1cm4gLUVOT01FTTsKKworICAgIGlmICggIWdldF9w
YWdlX2FuZF90eXBlKHBnLCBkLCBQR1Rfd3JpdGFibGVfcGFnZSkgKQorICAgIHsKKyAgICAgICAg
LyoKKyAgICAgICAgICogVGhlIGRvbWFpbiBjYW4ndCBwb3NzaWJseSBrbm93IGFib3V0IHRoaXMg
cGFnZSB5ZXQsIHNvIGZhaWx1cmUKKyAgICAgICAgICogaGVyZSBpcyBhIGNsZWFyIGluZGljYXRp
b24gb2Ygc29tZXRoaW5nIGZpc2h5IGdvaW5nIG9uLgorICAgICAgICAgKi8KKyAgICAgICAgZG9t
YWluX2NyYXNoKGQpOworICAgICAgICByZXR1cm4gLUVOT0RBVEE7CisgICAgfQorCiAgICAgbWZu
ID0gcGFnZV90b19tZm4ocGcpOwogICAgIGNsZWFyX2RvbWFpbl9wYWdlKG1mbik7Ci0gICAgc2hh
cmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdChwZywgZCwgU0hBUkVfcncpOwogICAgIGQtPmFyY2guaHZt
LnZteC5hcGljX2FjY2Vzc19tZm4gPSBtZm47CiAKICAgICByZXR1cm4gc2V0X21taW9fcDJtX2Vu
dHJ5KGQsIHBhZGRyX3RvX3BmbihBUElDX0RFRkFVTFRfUEhZU19CQVNFKSwgbWZuLApAQCAtMzA0
Nyw3ICszMDU3LDEyIEBAIHN0YXRpYyB2b2lkIHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKHN0cnVj
dCBkb21haW4gKmQpCiAKICAgICBkLT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3NfbWZuID0gX21m
bigwKTsKICAgICBpZiAoICFtZm5fZXEobWZuLCBfbWZuKDApKSApCi0gICAgICAgIGZyZWVfc2hh
cmVkX2RvbWhlYXBfcGFnZShtZm5fdG9fcGFnZShtZm4pKTsKKyAgICB7CisgICAgICAgIHN0cnVj
dCBwYWdlX2luZm8gKnBnID0gbWZuX3RvX3BhZ2UobWZuKTsKKworICAgICAgICBwdXRfcGFnZV9h
bGxvY19yZWYocGcpOworICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShwZyk7CisgICAgfQogfQog
CiBzdGF0aWMgdm9pZCB2bXhfaW5zdGFsbF92bGFwaWNfbWFwcGluZyhzdHJ1Y3QgdmNwdSAqdikK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXgg
NWIwNGRiOGMyMS4uOGIyOTBhYjNhMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysr
IGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTQ5NiwxNiArNDk2LDYgQEAgdm9pZCBzaGFyZV94ZW5f
cGFnZV93aXRoX2d1ZXN0KHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UsIHN0cnVjdCBkb21haW4gKmQs
CiAgICAgc3Bpbl91bmxvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7CiB9CiAKLXZvaWQgZnJlZV9z
aGFyZWRfZG9taGVhcF9wYWdlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCi17Ci0gICAgcHV0X3Bh
Z2VfYWxsb2NfcmVmKHBhZ2UpOwotICAgIGlmICggIXRlc3RfYW5kX2NsZWFyX2JpdChfUEdDX3hl
bl9oZWFwLCAmcGFnZS0+Y291bnRfaW5mbykgKQotICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUo
KTsKLSAgICBwYWdlLT51LmludXNlLnR5cGVfaW5mbyA9IDA7Ci0gICAgcGFnZV9zZXRfb3duZXIo
cGFnZSwgTlVMTCk7Ci0gICAgZnJlZV9kb21oZWFwX3BhZ2UocGFnZSk7Ci19Ci0KIHZvaWQgbWFr
ZV9jcjMoc3RydWN0IHZjcHUgKnYsIG1mbl90IG1mbikKIHsKICAgICBzdHJ1Y3QgZG9tYWluICpk
ID0gdi0+ZG9tYWluOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9tbS5oCmluZGV4IDA2ZDY0ZDQ5NGQuLmZhZmIzYWY0NmQgMTAwNjQ0
Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2
L21tLmgKQEAgLTMyMCw4ICszMjAsNiBAQCBzdHJ1Y3QgcGFnZV9pbmZvCiAKICNkZWZpbmUgbWFk
ZHJfZ2V0X293bmVyKG1hKSAgIChwYWdlX2dldF9vd25lcihtYWRkcl90b19wYWdlKChtYSkpKSkK
IAotZXh0ZXJuIHZvaWQgZnJlZV9zaGFyZWRfZG9taGVhcF9wYWdlKHN0cnVjdCBwYWdlX2luZm8g
KnBhZ2UpOwotCiAjZGVmaW5lIGZyYW1lX3RhYmxlICgoc3RydWN0IHBhZ2VfaW5mbyAqKUZSQU1F
VEFCTEVfVklSVF9TVEFSVCkKIGV4dGVybiB1bnNpZ25lZCBsb25nIG1heF9wYWdlOwogZXh0ZXJu
IHVuc2lnbmVkIGxvbmcgdG90YWxfcGFnZXM7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
