Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2635114C8AB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 11:19:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwkPW-0003uJ-M7; Wed, 29 Jan 2020 10:17:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwkPU-0003tw-LZ
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 10:17:24 +0000
X-Inumbo-ID: 8ad2ef5e-4280-11ea-a933-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ad2ef5e-4280-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 10:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580293044; x=1611829044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MYzT8ab35qHW4SGUYC1NXLjyWVX/wfXFVByy3xo3h/c=;
 b=HMU0qdmJF5bvTn807WLfrJ2ITvDSF1aEmi3ylQjVioZxoPCj6KpgoKCg
 5BXdMhcgK6CnSr0bdI3cRL1dgy+alwBqIS5ALGeq03r9vFXG6b9yEYeHj
 0hz4dMzTvUnKpyvWdkyCeiEdSki3ZYFRMoBtaWaR3YqhgtAh3K19XU8p7 I=;
IronPort-SDR: ykRamrqa5dZdyjk4k6oJ/BMPmKgFSPrILDwJYLpm0CwWwRI55qG65W2lKVqq4275HIfxdLRkDd
 sLLGzkNaXVjg==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="13820855"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 29 Jan 2020 10:17:22 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3E24FA2038; Wed, 29 Jan 2020 10:17:21 +0000 (UTC)
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 10:17:02 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUB004.ant.amazon.com (10.43.166.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 10:17:01 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 29 Jan 2020 10:16:59 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 10:16:43 +0000
Message-ID: <20200129101643.1394-5-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129101643.1394-1-pdurrant@amazon.com>
References: <20200129101643.1394-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 4/4] x86 / vmx: use a MEMF_no_refcount
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
ZjUwYzA2NWFmMy4uNjczNTE3OThjNyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysr
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
L2luY2x1ZGUvYXNtLXg4Ni9tbS5oCmluZGV4IGU3NWZlZWExNWUuLjAzNmQ3YWMyMmYgMTAwNjQ0
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
