Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DED1504C2
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:00:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyZQI-0007i7-5B; Mon, 03 Feb 2020 10:57:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z8sP=3X=amazon.co.uk=prvs=29554d7b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iyZQG-0007hZ-Dk
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 10:57:44 +0000
X-Inumbo-ID: ff4a0bd2-4673-11ea-8e48-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff4a0bd2-4673-11ea-8e48-12813bfff9fa;
 Mon, 03 Feb 2020 10:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580727462; x=1612263462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5cTElq8RmajOInGy+Yp6Ro4/ZWvBcXS3G3qbLkmNLKk=;
 b=tkK1kDXN/96Ny9Y7bTmMAGX1j17jK99+HdB4lL4bdtcSllj9Pq1a/Mu9
 SnvrCahpg2LdgpfxYQASJR3B+jMQTcjkhS0f5eaXEJlzArGPiA2N9jQwx
 SVvmuN5lh+VgOK7SBYaAZuRta+F/Rv9eLv6hCU/mWg9DvHga0JPs9ZJ6r U=;
IronPort-SDR: ldCLz2zrB56Lpe5EwQ2BgHHJwusEXMZhzNwyPOQ0h03RrDi0ZycL9n+J4RGEjuIac6a7xj6O2L
 tO0ORxApes8Q==
X-IronPort-AV: E=Sophos;i="5.70,397,1574121600"; d="scan'208";a="24015475"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 03 Feb 2020 10:57:30 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id B79E9A1EC8; Mon,  3 Feb 2020 10:57:26 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 3 Feb 2020 10:57:15 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 3 Feb 2020 10:57:14 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 3 Feb 2020 10:57:11 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 3 Feb 2020 10:56:54 +0000
Message-ID: <20200203105654.22998-5-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200203105654.22998-1-pdurrant@amazon.com>
References: <20200203105654.22998-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v9 4/4] x86 / vmx: use a MEMF_no_refcount
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
amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4KLS0tCkNjOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+CkNj
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8
d2xAeGVuLm9yZz4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cgp2NDoKIC0gVXNlIGEgTUVNRl9ub19yZWZjb3VudCBwYWdlIHJhdGhlciB0aGFuIGEgJ25vcm1h
bCcgcGFnZQoKdjI6CiAtIFNldCBhbiBpbml0aWFsIHZhbHVlIGZvciBtYXhfcGFnZXMgcmF0aGVy
IHRoYW4gYXZvaWRpbmcgdGhlIGNoZWNrIGluCiAgIGFzc2lnbl9wYWdlcygpCiAtIE1ha2UgZG9t
YWluX2Rlc3Ryb3koKSBvcHRpb25hbAotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIHwg
MjEgKysrKysrKysrKysrKysrKysrLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICB8IDEw
IC0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbW0uaCAgIHwgIDIgLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpp
bmRleCA2MDZmM2RjMmViLi43NDIzZDI0MjFiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3ZteC92bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpAQCAtMzAyOCwxMiAr
MzAyOCwyMiBAQCBzdGF0aWMgaW50IHZteF9hbGxvY192bGFwaWNfbWFwcGluZyhzdHJ1Y3QgZG9t
YWluICpkKQogICAgIGlmICggIWNwdV9oYXNfdm14X3ZpcnR1YWxpemVfYXBpY19hY2Nlc3NlcyAp
CiAgICAgICAgIHJldHVybiAwOwogCi0gICAgcGcgPSBhbGxvY19kb21oZWFwX3BhZ2UoZCwgTUVN
Rl9ub19vd25lcik7CisgICAgcGcgPSBhbGxvY19kb21oZWFwX3BhZ2UoZCwgTUVNRl9ub19yZWZj
b3VudCk7CiAgICAgaWYgKCAhcGcgKQogICAgICAgICByZXR1cm4gLUVOT01FTTsKKworICAgIGlm
ICggIWdldF9wYWdlX2FuZF90eXBlKHBnLCBkLCBQR1Rfd3JpdGFibGVfcGFnZSkgKQorICAgIHsK
KyAgICAgICAgLyoKKyAgICAgICAgICogVGhlIGRvbWFpbiBjYW4ndCBwb3NzaWJseSBrbm93IGFi
b3V0IHRoaXMgcGFnZSB5ZXQsIHNvIGZhaWx1cmUKKyAgICAgICAgICogaGVyZSBpcyBhIGNsZWFy
IGluZGljYXRpb24gb2Ygc29tZXRoaW5nIGZpc2h5IGdvaW5nIG9uLgorICAgICAgICAgKi8KKyAg
ICAgICAgZG9tYWluX2NyYXNoKGQpOworICAgICAgICByZXR1cm4gLUVOT0RBVEE7CisgICAgfQor
CiAgICAgbWZuID0gcGFnZV90b19tZm4ocGcpOwogICAgIGNsZWFyX2RvbWFpbl9wYWdlKG1mbik7
Ci0gICAgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdChwZywgZCwgU0hBUkVfcncpOwogICAgIGQt
PmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19tZm4gPSBtZm47CiAKICAgICByZXR1cm4gc2V0X21t
aW9fcDJtX2VudHJ5KGQsIHBhZGRyX3RvX3BmbihBUElDX0RFRkFVTFRfUEhZU19CQVNFKSwgbWZu
LApAQCAtMzA0Nyw3ICszMDU3LDEyIEBAIHN0YXRpYyB2b2lkIHZteF9mcmVlX3ZsYXBpY19tYXBw
aW5nKHN0cnVjdCBkb21haW4gKmQpCiAKICAgICBkLT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3Nf
bWZuID0gX21mbigwKTsKICAgICBpZiAoICFtZm5fZXEobWZuLCBfbWZuKDApKSApCi0gICAgICAg
IGZyZWVfc2hhcmVkX2RvbWhlYXBfcGFnZShtZm5fdG9fcGFnZShtZm4pKTsKKyAgICB7CisgICAg
ICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnID0gbWZuX3RvX3BhZ2UobWZuKTsKKworICAgICAgICBw
dXRfcGFnZV9hbGxvY19yZWYocGcpOworICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShwZyk7Cisg
ICAgfQogfQogCiBzdGF0aWMgdm9pZCB2bXhfaW5zdGFsbF92bGFwaWNfbWFwcGluZyhzdHJ1Y3Qg
dmNwdSAqdikKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21t
LmMKaW5kZXggZmQxMzRlZGNkZS4uMWU0OWJiMDE1NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTQ5NiwxNiArNDk2LDYgQEAgdm9pZCBz
aGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UsIHN0cnVjdCBk
b21haW4gKmQsCiAgICAgc3Bpbl91bmxvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7CiB9CiAKLXZv
aWQgZnJlZV9zaGFyZWRfZG9taGVhcF9wYWdlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpCi17Ci0g
ICAgcHV0X3BhZ2VfYWxsb2NfcmVmKHBhZ2UpOwotICAgIGlmICggIXRlc3RfYW5kX2NsZWFyX2Jp
dChfUEdDX3hlbl9oZWFwLCAmcGFnZS0+Y291bnRfaW5mbykgKQotICAgICAgICBBU1NFUlRfVU5S
RUFDSEFCTEUoKTsKLSAgICBwYWdlLT51LmludXNlLnR5cGVfaW5mbyA9IDA7Ci0gICAgcGFnZV9z
ZXRfb3duZXIocGFnZSwgTlVMTCk7Ci0gICAgZnJlZV9kb21oZWFwX3BhZ2UocGFnZSk7Ci19Ci0K
IHZvaWQgbWFrZV9jcjMoc3RydWN0IHZjcHUgKnYsIG1mbl90IG1mbikKIHsKICAgICBzdHJ1Y3Qg
ZG9tYWluICpkID0gdi0+ZG9tYWluOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9t
bS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCmluZGV4IDA2ZDY0ZDQ5NGQuLmZhZmIzYWY0
NmQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAorKysgYi94ZW4vaW5jbHVk
ZS9hc20teDg2L21tLmgKQEAgLTMyMCw4ICszMjAsNiBAQCBzdHJ1Y3QgcGFnZV9pbmZvCiAKICNk
ZWZpbmUgbWFkZHJfZ2V0X293bmVyKG1hKSAgIChwYWdlX2dldF9vd25lcihtYWRkcl90b19wYWdl
KChtYSkpKSkKIAotZXh0ZXJuIHZvaWQgZnJlZV9zaGFyZWRfZG9taGVhcF9wYWdlKHN0cnVjdCBw
YWdlX2luZm8gKnBhZ2UpOwotCiAjZGVmaW5lIGZyYW1lX3RhYmxlICgoc3RydWN0IHBhZ2VfaW5m
byAqKUZSQU1FVEFCTEVfVklSVF9TVEFSVCkKIGV4dGVybiB1bnNpZ25lZCBsb25nIG1heF9wYWdl
OwogZXh0ZXJuIHVuc2lnbmVkIGxvbmcgdG90YWxfcGFnZXM7Ci0tIAoyLjIwLjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
