Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 044C715FA8C
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2020 00:28:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2kLr-00018M-C1; Fri, 14 Feb 2020 23:26:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0dv=4C=amazon.com=prvs=306f93d76=anchalag@srs-us1.protection.inumbo.net>)
 id 1j2kLq-000187-B8
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 23:26:26 +0000
X-Inumbo-ID: 6845b9cc-4f81-11ea-bb5b-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6845b9cc-4f81-11ea-bb5b-12813bfff9fa;
 Fri, 14 Feb 2020 23:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581722781; x=1613258781;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=FFWPXgIVAXjgcT115sJOuzax8nToCuuiY/HaQ9mneTM=;
 b=c2gPM2ccrXe+xF0iWXQu0K+fje3b041XaBdFv36ipfHd9xfIscKOqOiD
 kQWJ9KR1kql/pa0JYwAURnWhmspWkaDvIMgGN9pr+mi056EJYe2WRx3gc
 yyJZg6UKGb9xE1r96ewDXS+Hqpoa/lcw/DMpnbGJsirx0mpJgGYoz5Y1i o=;
IronPort-SDR: HuP4SSd2cYzUs+cM+RhoYVn7umcRvOl9TOTmD8HMurf/Mfr4/l1GvqltmzwCu2MsYaJQvZr5nv
 dr8D5uHlcrXQ==
X-IronPort-AV: E=Sophos;i="5.70,442,1574121600"; d="scan'208";a="25192188"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 14 Feb 2020 23:26:19 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id A91A5A2774; Fri, 14 Feb 2020 23:26:11 +0000 (UTC)
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:25:52 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D08UEE001.ant.amazon.com (10.43.62.126) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:25:51 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Fri, 14 Feb 2020 23:25:51 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id ED1114028E; Fri, 14 Feb 2020 23:25:50 +0000 (UTC)
Date: Fri, 14 Feb 2020 23:25:50 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.com>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <fllinden@amaozn.com>, <benh@kernel.crashing.org>
Message-ID: <e782c510916c8c05dc95ace151aba4eced207b31.1581721799.git.anchalag@amazon.com>
References: <cover.1581721799.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1581721799.git.anchalag@amazon.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 07/12] genirq: Shutdown irq chips in
 suspend/resume during hibernation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIG5vIHBtIGhhbmRsZXJzIGZvciB0aGUgbGVnYWN5IGRldmljZXMsIHNvIGR1cmlu
ZyB0ZWFyIGRvd24Kc3RhbGUgZXZlbnQgY2hhbm5lbCA8PiBJUlEgbWFwcGluZyBtYXkgc3RpbGwg
cmVtYWluIGluIHRoZSBpbWFnZSBhbmQKcmVzdW1lIG1heSBmYWlsLiBUbyBhdm9pZCBhZGRpbmcg
bXVjaCBjb2RlIGJ5IGltcGxlbWVudGluZyBoYW5kbGVycyBmb3IKbGVnYWN5IGRldmljZXMsIGFk
ZCBhIG5ldyBpcnFfY2hpcCBmbGFnIElSUUNISVBfU0hVVERPV05fT05fU1VTUEVORCB3aGljaAp3
aGVuIGVuYWJsZWQgb24gYW4gaXJxLWNoaXAgZS5nIHhlbi1waXJxLCBpdCB3aWxsIGxldCBjb3Jl
IHN1c3BlbmQvcmVzdW1lCmlycSBjb2RlIHRvIHNodXRkb3duIGFuZCByZXN0YXJ0IHRoZSBhY3Rp
dmUgaXJxcy4gUE0gc3VzcGVuZC9oaWJlcm5hdGlvbgpjb2RlIHdpbGwgcmVseSBvbiB0aGlzLgpX
aXRob3V0IHRoaXMsIGluIFBNIGhpYmVybmF0aW9uLCBpbmZvcm1hdGlvbiBhYm91dCB0aGUgZXZl
bnQgY2hhbm5lbApyZW1haW5zIGluIGhpYmVybmF0aW9uIGltYWdlLCBidXQgdGhlcmUgaXMgbm8g
Z3VhcmFudGVlIHRoYXQgdGhlIHNhbWUKZXZlbnQgY2hhbm5lbCBudW1iZXJzIGFyZSBhc3NpZ25l
ZCB0byB0aGUgZGV2aWNlcyB3aGVuIHJlc3RvcmluZyB0aGUKc3lzdGVtLiBUaGlzIG1heSBjYXVz
ZSBjb25mbGljdCBsaWtlIHRoZSBmb2xsb3dpbmcgYW5kIHByZXZlbnQgc29tZQpkZXZpY2VzIGZy
b20gYmVpbmcgcmVzdG9yZWQgY29ycmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogQW5jaGFsIEFnYXJ3
YWwgPGFuY2hhbGFnQGFtYXpvbi5jb20+ClN1Z2dlc3RlZC1ieTogVGhvbWFzIEdsZWl4bmVyIDx0
Z2x4QGxpbnV0cm9uaXguZGU+Ci0tLQogZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMg
fCAgMSArCiBpbmNsdWRlL2xpbnV4L2lycS5oICAgICAgICAgICAgICB8ICAyICsrCiBrZXJuZWwv
aXJxL2NoaXAuYyAgICAgICAgICAgICAgICB8ICAyICstCiBrZXJuZWwvaXJxL2ludGVybmFscy5o
ICAgICAgICAgICB8ICAxICsKIGtlcm5lbC9pcnEvcG0uYyAgICAgICAgICAgICAgICAgIHwgMzEg
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ldmVu
dHMvZXZlbnRzX2Jhc2UuYyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCmluZGV4
IDZjODg0Mzk2OGE1Mi4uZTQ0ZjI3YjQ1YmVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9ldmVu
dHMvZXZlbnRzX2Jhc2UuYworKysgYi9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYwpA
QCAtMTYyMCw2ICsxNjIwLDcgQEAgc3RhdGljIHN0cnVjdCBpcnFfY2hpcCB4ZW5fcGlycV9jaGlw
IF9fcmVhZF9tb3N0bHkgPSB7CiAJLmlycV9zZXRfYWZmaW5pdHkJPSBzZXRfYWZmaW5pdHlfaXJx
LAogCiAJLmlycV9yZXRyaWdnZXIJCT0gcmV0cmlnZ2VyX2R5bmlycSwKKwkuZmxhZ3MgICAgICAg
ICAgICAgICAgICA9IElSUUNISVBfU0hVVERPV05fT05fU1VTUEVORCwKIH07CiAKIHN0YXRpYyBz
dHJ1Y3QgaXJxX2NoaXAgeGVuX3BlcmNwdV9jaGlwIF9fcmVhZF9tb3N0bHkgPSB7CmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2lycS5oIGIvaW5jbHVkZS9saW51eC9pcnEuaAppbmRleCBmYjMw
MWNmMjkxNDguLjI4NzNhNTc5ZmQ5ZCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9pcnEuaAor
KysgYi9pbmNsdWRlL2xpbnV4L2lycS5oCkBAIC01MTEsNiArNTExLDcgQEAgc3RydWN0IGlycV9j
aGlwIHsKICAqIElSUUNISVBfRU9JX1RIUkVBREVEOglDaGlwIHJlcXVpcmVzIGVvaSgpIG9uIHVu
bWFzayBpbiB0aHJlYWRlZCBtb2RlCiAgKiBJUlFDSElQX1NVUFBPUlRTX0xFVkVMX01TSQlDaGlw
IGNhbiBwcm92aWRlIHR3byBkb29yYmVsbHMgZm9yIExldmVsIE1TSXMKICAqIElSUUNISVBfU1VQ
UE9SVFNfTk1JOglDaGlwIGNhbiBkZWxpdmVyIE5NSXMsIG9ubHkgZm9yIHJvb3QgaXJxY2hpcHMK
KyAqIElSUUNISVBfU0hVVERPV05fT05fU1VTUEVORDogU2h1dGRvd24gbm9uIHdha2UgaXJxcyBp
biB0aGUgc3VzcGVuZCBwYXRoCiAgKi8KIGVudW0gewogCUlSUUNISVBfU0VUX1RZUEVfTUFTS0VE
CQk9ICgxIDw8ICAwKSwKQEAgLTUyMiw2ICs1MjMsNyBAQCBlbnVtIHsKIAlJUlFDSElQX0VPSV9U
SFJFQURFRAkJPSAoMSA8PCAgNiksCiAJSVJRQ0hJUF9TVVBQT1JUU19MRVZFTF9NU0kJPSAoMSA8
PCAgNyksCiAJSVJRQ0hJUF9TVVBQT1JUU19OTUkJCT0gKDEgPDwgIDgpLAorCUlSUUNISVBfU0hV
VERPV05fT05fU1VTUEVORCAgICAgPSAoMSA8PCAgOSksCiB9OwogCiAjaW5jbHVkZSA8bGludXgv
aXJxZGVzYy5oPgpkaWZmIC0tZ2l0IGEva2VybmVsL2lycS9jaGlwLmMgYi9rZXJuZWwvaXJxL2No
aXAuYwppbmRleCBiNzY3MDNiMmMwYWYuLmExZThkZjUxOTNiYSAxMDA2NDQKLS0tIGEva2VybmVs
L2lycS9jaGlwLmMKKysrIGIva2VybmVsL2lycS9jaGlwLmMKQEAgLTIzMyw3ICsyMzMsNyBAQCBf
X2lycV9zdGFydHVwX21hbmFnZWQoc3RydWN0IGlycV9kZXNjICpkZXNjLCBzdHJ1Y3QgY3B1bWFz
ayAqYWZmLCBib29sIGZvcmNlKQogfQogI2VuZGlmCiAKLXN0YXRpYyBpbnQgX19pcnFfc3RhcnR1
cChzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpCitpbnQgX19pcnFfc3RhcnR1cChzdHJ1Y3QgaXJxX2Rl
c2MgKmRlc2MpCiB7CiAJc3RydWN0IGlycV9kYXRhICpkID0gaXJxX2Rlc2NfZ2V0X2lycV9kYXRh
KGRlc2MpOwogCWludCByZXQgPSAwOwpkaWZmIC0tZ2l0IGEva2VybmVsL2lycS9pbnRlcm5hbHMu
aCBiL2tlcm5lbC9pcnEvaW50ZXJuYWxzLmgKaW5kZXggMzkyNGZiZTgyOWQ0Li4xMWM3YzU1YmRh
NjMgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9pcnEvaW50ZXJuYWxzLmgKKysrIGIva2VybmVsL2lycS9p
bnRlcm5hbHMuaApAQCAtODAsNiArODAsNyBAQCBleHRlcm4gdm9pZCBfX2VuYWJsZV9pcnEoc3Ry
dWN0IGlycV9kZXNjICpkZXNjKTsKIGV4dGVybiBpbnQgaXJxX2FjdGl2YXRlKHN0cnVjdCBpcnFf
ZGVzYyAqZGVzYyk7CiBleHRlcm4gaW50IGlycV9hY3RpdmF0ZV9hbmRfc3RhcnR1cChzdHJ1Y3Qg
aXJxX2Rlc2MgKmRlc2MsIGJvb2wgcmVzZW5kKTsKIGV4dGVybiBpbnQgaXJxX3N0YXJ0dXAoc3Ry
dWN0IGlycV9kZXNjICpkZXNjLCBib29sIHJlc2VuZCwgYm9vbCBmb3JjZSk7CitleHRlcm4gaW50
IF9faXJxX3N0YXJ0dXAoc3RydWN0IGlycV9kZXNjICpkZXNjKTsKIAogZXh0ZXJuIHZvaWQgaXJx
X3NodXRkb3duKHN0cnVjdCBpcnFfZGVzYyAqZGVzYyk7CiBleHRlcm4gdm9pZCBpcnFfc2h1dGRv
d25fYW5kX2RlYWN0aXZhdGUoc3RydWN0IGlycV9kZXNjICpkZXNjKTsKZGlmZiAtLWdpdCBhL2tl
cm5lbC9pcnEvcG0uYyBiL2tlcm5lbC9pcnEvcG0uYwppbmRleCA4ZjU1N2ZhMWY0ZmUuLmRjNDhh
MjVmMTc1NiAxMDA2NDQKLS0tIGEva2VybmVsL2lycS9wbS5jCisrKyBiL2tlcm5lbC9pcnEvcG0u
YwpAQCAtODUsMTYgKzg1LDI1IEBAIHN0YXRpYyBib29sIHN1c3BlbmRfZGV2aWNlX2lycShzdHJ1
Y3QgaXJxX2Rlc2MgKmRlc2MpCiAJfQogCiAJZGVzYy0+aXN0YXRlIHw9IElSUVNfU1VTUEVOREVE
OwotCV9fZGlzYWJsZV9pcnEoZGVzYyk7Ci0KIAkvKgotCSAqIEhhcmR3YXJlIHdoaWNoIGhhcyBu
byB3YWtldXAgc291cmNlIGNvbmZpZ3VyYXRpb24gZmFjaWxpdHkKLQkgKiByZXF1aXJlcyB0aGF0
IHRoZSBub24gd2FrZXVwIGludGVycnVwdHMgYXJlIG1hc2tlZCBhdCB0aGUKLQkgKiBjaGlwIGxl
dmVsLiBUaGUgY2hpcCBpbXBsZW1lbnRhdGlvbiBpbmRpY2F0ZXMgdGhhdCB3aXRoCi0JICogSVJR
Q0hJUF9NQVNLX09OX1NVU1BFTkQuCisJICogU29tZSBpcnEgY2hpcHMgKGUuZy4gWEVOIFBJUlEp
IHJlcXVpcmUgYSBmdWxsIHNodXRkb3duIG9uIHN1c3BlbmQKKwkgKiBhcyBzb21lIG9mIHRoZSBs
ZWdhY3kgZHJpdmVycyhlLmcuIGZsb3BweSkgZG8gbm90aGluZyBkdXJpbmcgdGhlCisJICogc3Vz
cGVuZCBwYXRoCiAJICovCi0JaWYgKGlycV9kZXNjX2dldF9jaGlwKGRlc2MpLT5mbGFncyAmIElS
UUNISVBfTUFTS19PTl9TVVNQRU5EKQotCQltYXNrX2lycShkZXNjKTsKKwlpZiAoaXJxX2Rlc2Nf
Z2V0X2NoaXAoZGVzYyktPmZsYWdzICYgSVJRQ0hJUF9TSFVURE9XTl9PTl9TVVNQRU5EKSB7CisJ
CWlycV9zaHV0ZG93bihkZXNjKTsKKwl9IGVsc2UgeworCQlfX2Rpc2FibGVfaXJxKGRlc2MpOwor
CisJICAgICAgIC8qCisJCSogSGFyZHdhcmUgd2hpY2ggaGFzIG5vIHdha2V1cCBzb3VyY2UgY29u
ZmlndXJhdGlvbiBmYWNpbGl0eQorCQkqIHJlcXVpcmVzIHRoYXQgdGhlIG5vbiB3YWtldXAgaW50
ZXJydXB0cyBhcmUgbWFza2VkIGF0IHRoZQorCQkqIGNoaXAgbGV2ZWwuIFRoZSBjaGlwIGltcGxl
bWVudGF0aW9uIGluZGljYXRlcyB0aGF0IHdpdGgKKwkJKiBJUlFDSElQX01BU0tfT05fU1VTUEVO
RC4KKwkJKi8KKwkJaWYgKGlycV9kZXNjX2dldF9jaGlwKGRlc2MpLT5mbGFncyAmIElSUUNISVBf
TUFTS19PTl9TVVNQRU5EKQorCQkJbWFza19pcnEoZGVzYyk7CisJfQogCXJldHVybiB0cnVlOwog
fQogCkBAIC0xNTIsNyArMTYxLDExIEBAIHN0YXRpYyB2b2lkIHJlc3VtZV9pcnEoc3RydWN0IGly
cV9kZXNjICpkZXNjKQogCWlycV9zdGF0ZV9zZXRfbWFza2VkKGRlc2MpOwogcmVzdW1lOgogCWRl
c2MtPmlzdGF0ZSAmPSB+SVJRU19TVVNQRU5ERUQ7Ci0JX19lbmFibGVfaXJxKGRlc2MpOworCisJ
aWYgKGlycV9kZXNjX2dldF9jaGlwKGRlc2MpLT5mbGFncyAmIElSUUNISVBfU0hVVERPV05fT05f
U1VTUEVORCkKKwkJX19pcnFfc3RhcnR1cChkZXNjKTsKKwllbHNlCisJCV9fZW5hYmxlX2lycShk
ZXNjKTsKIH0KIAogc3RhdGljIHZvaWQgcmVzdW1lX2lycXMoYm9vbCB3YW50X2Vhcmx5KQotLSAK
Mi4yNC4xLkFNWk4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
