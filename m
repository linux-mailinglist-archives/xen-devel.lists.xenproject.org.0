Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973F915FA8D
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2020 00:28:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2kLP-00011v-1T; Fri, 14 Feb 2020 23:25:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0dv=4C=amazon.com=prvs=306f93d76=anchalag@srs-us1.protection.inumbo.net>)
 id 1j2kLN-00011c-Hw
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 23:25:57 +0000
X-Inumbo-ID: 56f4d2e8-4f81-11ea-b0fd-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56f4d2e8-4f81-11ea-b0fd-bc764e2007e4;
 Fri, 14 Feb 2020 23:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581722752; x=1613258752;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=65wFrGrYmXjd0UW/pA31otT2ZrHynjVNpCVt+utpQWU=;
 b=r8tTtiOf76Futw7LkvLm87BeP5zwH1loaG6laKLHpNY3hcH0HRYSK53z
 ka9iC1Vf+mNS2Z/nJAGAKYhbgkZ4NId4DiIa6VBAU8tFgOmzh3D8kbgl9
 iFQgyMuB3eSFqYafLs0PPw7wYU1i/KCsxPlaJ1gLVTGhhFis99ZAptAjS Y=;
IronPort-SDR: bL7Fsnk+QmgPzaLi2dVu7FU9qWoIvjANaCWDzTME9a1GTC9kcbC0NMrraFxDGeXgb6TxgZFuDt
 MZ9MFEE9KDJQ==
X-IronPort-AV: E=Sophos;i="5.70,442,1574121600"; d="scan'208";a="25192150"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-807d4a99.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 14 Feb 2020 23:25:50 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-807d4a99.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2FCECA2466; Fri, 14 Feb 2020 23:25:42 +0000 (UTC)
Received: from EX13D08UEE004.ant.amazon.com (10.43.62.182) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:25:35 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D08UEE004.ant.amazon.com (10.43.62.182) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:25:35 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Fri, 14 Feb 2020 23:25:35 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id D719E4028E; Fri, 14 Feb 2020 23:25:34 +0000 (UTC)
Date: Fri, 14 Feb 2020 23:25:34 +0000
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
Message-ID: <890c404c585d7790514527f0c021056a7be6e748.1581721799.git.anchalag@amazon.com>
References: <cover.1581721799.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1581721799.git.anchalag@amazon.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 06/12] xen-blkfront: add callbacks for PM
 suspend and hibernation
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

RnJvbTogTXVuZWhpc2EgS2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20KCkFkZCBmcmVlemUsIHRo
YXcgYW5kIHJlc3RvcmUgY2FsbGJhY2tzIGZvciBQTSBzdXNwZW5kIGFuZCBoaWJlcm5hdGlvbgpz
dXBwb3J0LiBBbGwgZnJvbnRlbmQgZHJpdmVycyB0aGF0IG5lZWRzIHRvIHVzZSBQTV9ISUJFUk5B
VElPTi9QTV9TVVNQRU5ECmV2ZW50cywgbmVlZCB0byBpbXBsZW1lbnQgdGhlc2UgeGVuYnVzX2Ry
aXZlciBjYWxsYmFja3MuClRoZSBmcmVlemUgaGFuZGxlciBzdG9wcyBhIGJsb2NrLWxheWVyIHF1
ZXVlIGFuZCBkaXNjb25uZWN0IHRoZQpmcm9udGVuZCBmcm9tIHRoZSBiYWNrZW5kIHdoaWxlIGZy
ZWVpbmcgcmluZ19pbmZvIGFuZCBhc3NvY2lhdGVkIHJlc291cmNlcy4KVGhlIHJlc3RvcmUgaGFu
ZGxlciByZS1hbGxvY2F0ZXMgcmluZ19pbmZvIGFuZCByZS1jb25uZWN0IHRvIHRoZQpiYWNrZW5k
LCBzbyB0aGUgcmVzdCBvZiB0aGUga2VybmVsIGNhbiBjb250aW51ZSB0byB1c2UgdGhlIGJsb2Nr
IGRldmljZQp0cmFuc3BhcmVudGx5LiBBbHNvLCB0aGUgaGFuZGxlcnMgYXJlIHVzZWQgZm9yIGJv
dGggUE0gc3VzcGVuZCBhbmQKaGliZXJuYXRpb24gc28gdGhhdCB3ZSBjYW4ga2VlcCB0aGUgZXhp
c3Rpbmcgc3VzcGVuZC9yZXN1bWUgY2FsbGJhY2tzIGZvcgpYZW4gc3VzcGVuZCB3aXRob3V0IG1v
ZGlmaWNhdGlvbi4gQmVmb3JlIGRpc2Nvbm5lY3RpbmcgZnJvbSBiYWNrZW5kLAp3ZSBuZWVkIHRv
IHByZXZlbnQgYW55IG5ldyBJTyBmcm9tIGJlaW5nIHF1ZXVlZCBhbmQgd2FpdCBmb3IgZXhpc3Rp
bmcKSU8gdG8gY29tcGxldGUuIEZyZWV6ZS91bmZyZWV6ZSBvZiB0aGUgcXVldWVzIHdpbGwgZ3Vh
cmFudGVlIHRoYXQgdGhlcmUKYXJlIG5vIHJlcXVlc3RzIGluIHVzZSBvbiB0aGUgc2hhcmVkIHJp
bmcuCgpOb3RlOkZvciBvbGRlciBiYWNrZW5kcyxpZiBhIGJhY2tlbmQgZG9lc24ndCBoYXZlIGNv
bW1pdCcxMmVhNzI5NjQ1YWNlJwp4ZW4vYmxrYmFjazogdW5tYXAgYWxsIHBlcnNpc3RlbnQgZ3Jh
bnRzIHdoZW4gZnJvbnRlbmQgZ2V0cyBkaXNjb25uZWN0ZWQsCnRoZSBmcm9udGVuZCBtYXkgc2Vl
IG1hc3NpdmUgYW1vdW50IG9mIGdyYW50IHRhYmxlIHdhcm5pbmcgd2hlbiBmcmVlaW5nCnJlc291
cmNlcy4KWyAgIDM2Ljg1MjY1OV0gZGVmZXJyaW5nIGcuZS4gMHhmOSAocGZuIDB4ZmZmZmZmZmZm
ZmZmZmZmZikKWyAgIDM2Ljg1NTA4OV0geGVuOmdyYW50X3RhYmxlOiBXQVJOSU5HOmUuZy4gMHgx
MTIgc3RpbGwgaW4gdXNlIQoKSW4gdGhpcyBjYXNlLCBwZXJzaXN0ZW50IGdyYW50cyB3b3VsZCBu
ZWVkIHRvIGJlIGRpc2FibGVkLgoKW0FuY2hhbCBDaGFuZ2Vsb2c6IFJlbW92ZWQgdGltZW91dC9y
ZXF1ZXN0IGR1cmluZyBibGtmcm9udCBmcmVlemUuCkZpeGVkIG1ham9yIHBhcnQgb2YgdGhlIGNv
ZGUgdG8gd29yayB3aXRoIGJsay1tcV0KU2lnbmVkLW9mZi1ieTogQW5jaGFsIEFnYXJ3YWwgPGFu
Y2hhbGFnQGFtYXpvbi5jb20+ClNpZ25lZC1vZmYtYnk6IE11bmVoaXNhIEthbWF0YSA8a2FtYXRh
bUBhbWF6b24uY29tPgotLS0KIGRyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMgfCAxMTkgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMTIgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hl
bi1ibGtmcm9udC5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwppbmRleCA0NzgxMjAy
MzM3NTAuLmQ3MTVlZDNjYjY5YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJv
bnQuYworKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCkBAIC00Nyw2ICs0Nyw4IEBA
CiAjaW5jbHVkZSA8bGludXgvYml0bWFwLmg+CiAjaW5jbHVkZSA8bGludXgvbGlzdC5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPgorI2luY2x1ZGUgPGxpbnV4L2NvbXBsZXRpb24uaD4K
KyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogCiAjaW5jbHVkZSA8eGVuL3hlbi5oPgogI2luY2x1
ZGUgPHhlbi94ZW5idXMuaD4KQEAgLTc5LDYgKzgxLDggQEAgZW51bSBibGtpZl9zdGF0ZSB7CiAJ
QkxLSUZfU1RBVEVfRElTQ09OTkVDVEVELAogCUJMS0lGX1NUQVRFX0NPTk5FQ1RFRCwKIAlCTEtJ
Rl9TVEFURV9TVVNQRU5ERUQsCisJQkxLSUZfU1RBVEVfRlJFRVpJTkcsCisJQkxLSUZfU1RBVEVf
RlJPWkVOCiB9OwogCiBzdHJ1Y3QgZ3JhbnQgewpAQCAtMjIwLDYgKzIyNCw3IEBAIHN0cnVjdCBi
bGtmcm9udF9pbmZvCiAJc3RydWN0IGxpc3RfaGVhZCByZXF1ZXN0czsKIAlzdHJ1Y3QgYmlvX2xp
c3QgYmlvX2xpc3Q7CiAJc3RydWN0IGxpc3RfaGVhZCBpbmZvX2xpc3Q7CisJc3RydWN0IGNvbXBs
ZXRpb24gd2FpdF9iYWNrZW5kX2Rpc2Nvbm5lY3RlZDsKIH07CiAKIHN0YXRpYyB1bnNpZ25lZCBp
bnQgbnJfbWlub3JzOwpAQCAtMjYxLDYgKzI2Niw3IEBAIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0so
bWlub3JfbG9jayk7CiBzdGF0aWMgaW50IGJsa2Zyb250X3NldHVwX2luZGlyZWN0KHN0cnVjdCBi
bGtmcm9udF9yaW5nX2luZm8gKnJpbmZvKTsKIHN0YXRpYyB2b2lkIGJsa2Zyb250X2dhdGhlcl9i
YWNrZW5kX2ZlYXR1cmVzKHN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvKTsKIHN0YXRpYyBpbnQg
bmVnb3RpYXRlX21xKHN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvKTsKK3N0YXRpYyB2b2lkIF9f
YmxraWZfZnJlZShzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbyk7CiAKIHN0YXRpYyBpbnQgZ2V0
X2lkX2Zyb21fZnJlZWxpc3Qoc3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqcmluZm8pCiB7CkBA
IC05OTUsNiArMTAwMSw3IEBAIHN0YXRpYyBpbnQgeGx2YmRfaW5pdF9ibGtfcXVldWUoc3RydWN0
IGdlbmRpc2sgKmdkLCB1MTYgc2VjdG9yX3NpemUsCiAJaW5mby0+c2VjdG9yX3NpemUgPSBzZWN0
b3Jfc2l6ZTsKIAlpbmZvLT5waHlzaWNhbF9zZWN0b3Jfc2l6ZSA9IHBoeXNpY2FsX3NlY3Rvcl9z
aXplOwogCWJsa2lmX3NldF9xdWV1ZV9saW1pdHMoaW5mbyk7CisJaW5pdF9jb21wbGV0aW9uKCZp
bmZvLT53YWl0X2JhY2tlbmRfZGlzY29ubmVjdGVkKTsKIAogCXJldHVybiAwOwogfQpAQCAtMTIx
OCw2ICsxMjI1LDggQEAgc3RhdGljIHZvaWQgeGx2YmRfcmVsZWFzZV9nZW5kaXNrKHN0cnVjdCBi
bGtmcm9udF9pbmZvICppbmZvKQogLyogQWxyZWFkeSBob2xkIHJpbmZvLT5yaW5nX2xvY2suICov
CiBzdGF0aWMgaW5saW5lIHZvaWQga2lja19wZW5kaW5nX3JlcXVlc3RfcXVldWVzX2xvY2tlZChz
dHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZvICpyaW5mbykKIHsKKwlpZiAodW5saWtlbHkocmluZm8t
PmRldl9pbmZvLT5jb25uZWN0ZWQgPT0gQkxLSUZfU1RBVEVfRlJFRVpJTkcpKQorCQlyZXR1cm47
CiAJaWYgKCFSSU5HX0ZVTEwoJnJpbmZvLT5yaW5nKSkKIAkJYmxrX21xX3N0YXJ0X3N0b3BwZWRf
aHdfcXVldWVzKHJpbmZvLT5kZXZfaW5mby0+cnEsIHRydWUpOwogfQpAQCAtMTM0MSw4ICsxMzUw
LDYgQEAgc3RhdGljIHZvaWQgYmxraWZfZnJlZV9yaW5nKHN0cnVjdCBibGtmcm9udF9yaW5nX2lu
Zm8gKnJpbmZvKQogCiBzdGF0aWMgdm9pZCBibGtpZl9mcmVlKHN0cnVjdCBibGtmcm9udF9pbmZv
ICppbmZvLCBpbnQgc3VzcGVuZCkKIHsKLQl1bnNpZ25lZCBpbnQgaTsKLQogCS8qIFByZXZlbnQg
bmV3IHJlcXVlc3RzIGJlaW5nIGlzc3VlZCB1bnRpbCB3ZSBmaXggdGhpbmdzIHVwLiAqLwogCWlu
Zm8tPmNvbm5lY3RlZCA9IHN1c3BlbmQgPwogCQlCTEtJRl9TVEFURV9TVVNQRU5ERUQgOiBCTEtJ
Rl9TVEFURV9ESVNDT05ORUNURUQ7CkBAIC0xMzUwLDYgKzEzNTcsMTMgQEAgc3RhdGljIHZvaWQg
YmxraWZfZnJlZShzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbywgaW50IHN1c3BlbmQpCiAJaWYg
KGluZm8tPnJxKQogCQlibGtfbXFfc3RvcF9od19xdWV1ZXMoaW5mby0+cnEpOwogCisJX19ibGtp
Zl9mcmVlKGluZm8pOworfQorCitzdGF0aWMgdm9pZCBfX2Jsa2lmX2ZyZWUoc3RydWN0IGJsa2Zy
b250X2luZm8gKmluZm8pCit7CisJdW5zaWduZWQgaW50IGk7CisKIAlmb3IgKGkgPSAwOyBpIDwg
aW5mby0+bnJfcmluZ3M7IGkrKykKIAkJYmxraWZfZnJlZV9yaW5nKCZpbmZvLT5yaW5mb1tpXSk7
CiAKQEAgLTE1NTMsOCArMTU2NywxMCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgYmxraWZfaW50ZXJy
dXB0KGludCBpcnEsIHZvaWQgKmRldl9pZCkKIAlzdHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZvICpy
aW5mbyA9IChzdHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZvICopZGV2X2lkOwogCXN0cnVjdCBibGtm
cm9udF9pbmZvICppbmZvID0gcmluZm8tPmRldl9pbmZvOwogCi0JaWYgKHVubGlrZWx5KGluZm8t
PmNvbm5lY3RlZCAhPSBCTEtJRl9TVEFURV9DT05ORUNURUQpKQotCQlyZXR1cm4gSVJRX0hBTkRM
RUQ7CisJaWYgKHVubGlrZWx5KGluZm8tPmNvbm5lY3RlZCAhPSBCTEtJRl9TVEFURV9DT05ORUNU
RUQpKSB7CisJCWlmIChpbmZvLT5jb25uZWN0ZWQgIT0gQkxLSUZfU1RBVEVfRlJFRVpJTkcpCisJ
CQlyZXR1cm4gSVJRX0hBTkRMRUQ7CisJfQogCiAJc3Bpbl9sb2NrX2lycXNhdmUoJnJpbmZvLT5y
aW5nX2xvY2ssIGZsYWdzKTsKICBhZ2FpbjoKQEAgLTIwMjAsNiArMjAzNiw3IEBAIHN0YXRpYyBp
bnQgYmxraWZfcmVjb3ZlcihzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbykKIAlzdHJ1Y3QgYmlv
ICpiaW87CiAJdW5zaWduZWQgaW50IHNlZ3M7CiAKKwlib29sIGZyb3plbiA9IGluZm8tPmNvbm5l
Y3RlZCA9PSBCTEtJRl9TVEFURV9GUk9aRU47CiAJYmxrZnJvbnRfZ2F0aGVyX2JhY2tlbmRfZmVh
dHVyZXMoaW5mbyk7CiAJLyogUmVzZXQgbGltaXRzIGNoYW5nZWQgYnkgYmxrX21xX3VwZGF0ZV9u
cl9od19xdWV1ZXMoKS4gKi8KIAlibGtpZl9zZXRfcXVldWVfbGltaXRzKGluZm8pOwpAQCAtMjA0
Niw2ICsyMDYzLDkgQEAgc3RhdGljIGludCBibGtpZl9yZWNvdmVyKHN0cnVjdCBibGtmcm9udF9p
bmZvICppbmZvKQogCQlraWNrX3BlbmRpbmdfcmVxdWVzdF9xdWV1ZXMocmluZm8pOwogCX0KIAor
CWlmIChmcm96ZW4pCisJCXJldHVybiAwOworCiAJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHJl
cSwgbiwgJmluZm8tPnJlcXVlc3RzLCBxdWV1ZWxpc3QpIHsKIAkJLyogUmVxdWV1ZSBwZW5kaW5n
IHJlcXVlc3RzIChmbHVzaCBvciBkaXNjYXJkKSAqLwogCQlsaXN0X2RlbF9pbml0KCZyZXEtPnF1
ZXVlbGlzdCk7CkBAIC0yMzU5LDYgKzIzNzksNyBAQCBzdGF0aWMgdm9pZCBibGtmcm9udF9jb25u
ZWN0KHN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvKQogCiAJCXJldHVybjsKIAljYXNlIEJMS0lG
X1NUQVRFX1NVU1BFTkRFRDoKKwljYXNlIEJMS0lGX1NUQVRFX0ZST1pFTjoKIAkJLyoKIAkJICog
SWYgd2UgYXJlIHJlY292ZXJpbmcgZnJvbSBzdXNwZW5zaW9uLCB3ZSBuZWVkIHRvIHdhaXQKIAkJ
ICogZm9yIHRoZSBiYWNrZW5kIHRvIGFubm91bmNlIGl0J3MgZmVhdHVyZXMgYmVmb3JlCkBAIC0y
NDc2LDEyICsyNDk3LDM3IEBAIHN0YXRpYyB2b2lkIGJsa2JhY2tfY2hhbmdlZChzdHJ1Y3QgeGVu
YnVzX2RldmljZSAqZGV2LAogCQlicmVhazsKIAogCWNhc2UgWGVuYnVzU3RhdGVDbG9zZWQ6Ci0J
CWlmIChkZXYtPnN0YXRlID09IFhlbmJ1c1N0YXRlQ2xvc2VkKQorCQlpZiAoZGV2LT5zdGF0ZSA9
PSBYZW5idXNTdGF0ZUNsb3NlZCkgeworCQkJaWYgKGluZm8tPmNvbm5lY3RlZCA9PSBCTEtJRl9T
VEFURV9GUkVFWklORykgeworCQkJCV9fYmxraWZfZnJlZShpbmZvKTsKKwkJCQlpbmZvLT5jb25u
ZWN0ZWQgPSBCTEtJRl9TVEFURV9GUk9aRU47CisJCQkJY29tcGxldGUoJmluZm8tPndhaXRfYmFj
a2VuZF9kaXNjb25uZWN0ZWQpOworCQkJCWJyZWFrOworCQkJfQorCiAJCQlicmVhazsKKwkJfQor
CisJCS8qCisJCSAqIFdlIG1heSBzb21laG93IHJlY2VpdmUgYmFja2VuZCdzIENsb3NlZCBhZ2Fp
biB3aGlsZSB0aGF3aW5nCisJCSAqIG9yIHJlc3RvcmluZyBhbmQgaXQgY2F1c2VzIHRoYXdpbmcg
b3IgcmVzdG9yaW5nIHRvIGZhaWwuCisJCSAqIElnbm9yZSBzdWNoIHVuZXhwZWN0ZWQgc3RhdGUg
YW55d2F5LgorCQkgKi8KKwkJaWYgKGluZm8tPmNvbm5lY3RlZCA9PSBCTEtJRl9TVEFURV9GUk9a
RU4gJiYKKwkJCQlkZXYtPnN0YXRlID09IFhlbmJ1c1N0YXRlSW5pdGlhbGlzZWQpIHsKKwkJCWRl
dl9kYmcoJmRldi0+ZGV2LAorCQkJCQkiaWdub3JlIHRoZSBiYWNrZW5kJ3MgQ2xvc2VkIHN0YXRl
OiAlcyIsCisJCQkJCWRldi0+bm9kZW5hbWUpOworCQkJYnJlYWs7CisJCX0KIAkJLyogZmFsbCB0
aHJvdWdoICovCiAJY2FzZSBYZW5idXNTdGF0ZUNsb3Npbmc6Ci0JCWlmIChpbmZvKQotCQkJYmxr
ZnJvbnRfY2xvc2luZyhpbmZvKTsKKwkJaWYgKGluZm8pIHsKKwkJCWlmIChpbmZvLT5jb25uZWN0
ZWQgPT0gQkxLSUZfU1RBVEVfRlJFRVpJTkcpCisJCQkJeGVuYnVzX2Zyb250ZW5kX2Nsb3NlZChk
ZXYpOworCQkJZWxzZQorCQkJCWJsa2Zyb250X2Nsb3NpbmcoaW5mbyk7CisJCX0KIAkJYnJlYWs7
CiAJfQogfQpAQCAtMjYyNSw2ICsyNjcxLDYyIEBAIHN0YXRpYyB2b2lkIGJsa2lmX3JlbGVhc2Uo
c3RydWN0IGdlbmRpc2sgKmRpc2ssIGZtb2RlX3QgbW9kZSkKIAltdXRleF91bmxvY2soJmJsa2Zy
b250X211dGV4KTsKIH0KIAorc3RhdGljIGludCBibGtmcm9udF9mcmVlemUoc3RydWN0IHhlbmJ1
c19kZXZpY2UgKmRldikKK3sKKwl1bnNpZ25lZCBpbnQgaTsKKwlzdHJ1Y3QgYmxrZnJvbnRfaW5m
byAqaW5mbyA9IGRldl9nZXRfZHJ2ZGF0YSgmZGV2LT5kZXYpOworCXN0cnVjdCBibGtmcm9udF9y
aW5nX2luZm8gKnJpbmZvOworCS8qIFRoaXMgd291bGQgYmUgcmVhc29uYWJsZSB0aW1lb3V0IGFz
IHVzZWQgaW4geGVuYnVzX2Rldl9zaHV0ZG93bigpICovCisJdW5zaWduZWQgaW50IHRpbWVvdXQg
PSA1ICogSFo7CisJaW50IGVyciA9IDA7CisKKwlpbmZvLT5jb25uZWN0ZWQgPSBCTEtJRl9TVEFU
RV9GUkVFWklORzsKKworCWJsa19tcV9mcmVlemVfcXVldWUoaW5mby0+cnEpOworCWJsa19tcV9x
dWllc2NlX3F1ZXVlKGluZm8tPnJxKTsKKworCWZvciAoaSA9IDA7IGkgPCBpbmZvLT5ucl9yaW5n
czsgaSsrKSB7CisJCXJpbmZvID0gJmluZm8tPnJpbmZvW2ldOworCisJCWdudHRhYl9jYW5jZWxf
ZnJlZV9jYWxsYmFjaygmcmluZm8tPmNhbGxiYWNrKTsKKwkJZmx1c2hfd29yaygmcmluZm8tPndv
cmspOworCX0KKworCS8qIEtpY2sgdGhlIGJhY2tlbmQgdG8gZGlzY29ubmVjdCAqLworCXhlbmJ1
c19zd2l0Y2hfc3RhdGUoZGV2LCBYZW5idXNTdGF0ZUNsb3NpbmcpOworCisJLyoKKwkgKiBXZSBk
b24ndCB3YW50IHRvIG1vdmUgZm9yd2FyZCBiZWZvcmUgdGhlIGZyb250ZW5kIGlzIGRpY29ubmVj
dGVkCisJICogZnJvbSB0aGUgYmFja2VuZCBjbGVhbmx5LgorCSAqLworCXRpbWVvdXQgPSB3YWl0
X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJmluZm8tPndhaXRfYmFja2VuZF9kaXNjb25uZWN0ZWQs
CisJCQkJCSAgICAgIHRpbWVvdXQpOworCWlmICghdGltZW91dCkgeworCQllcnIgPSAtRUJVU1k7
CisJCXhlbmJ1c19kZXZfZXJyb3IoZGV2LCBlcnIsICJGcmVlemluZyB0aW1lZCBvdXQ7IgorCQkJ
CSAidGhlIGRldmljZSBtYXkgYmVjb21lIGluY29uc2lzdGVudCBzdGF0ZSIpOworCX0KKworCXJl
dHVybiBlcnI7Cit9CisKK3N0YXRpYyBpbnQgYmxrZnJvbnRfcmVzdG9yZShzdHJ1Y3QgeGVuYnVz
X2RldmljZSAqZGV2KQoreworCXN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvID0gZGV2X2dldF9k
cnZkYXRhKCZkZXYtPmRldik7CisJaW50IGVyciA9IDA7CisKKwllcnIgPSB0YWxrX3RvX2Jsa2Jh
Y2soZGV2LCBpbmZvKTsKKwlibGtfbXFfdW5xdWllc2NlX3F1ZXVlKGluZm8tPnJxKTsKKwlibGtf
bXFfdW5mcmVlemVfcXVldWUoaW5mby0+cnEpOworCisJaWYgKGVycikKKwkJZ290byBvdXQ7CisJ
YmxrX21xX3VwZGF0ZV9ucl9od19xdWV1ZXMoJmluZm8tPnRhZ19zZXQsIGluZm8tPm5yX3Jpbmdz
KTsKKworb3V0OgorCXJldHVybiBlcnI7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmxvY2tf
ZGV2aWNlX29wZXJhdGlvbnMgeGx2YmRfYmxvY2tfZm9wcyA9CiB7CiAJLm93bmVyID0gVEhJU19N
T0RVTEUsCkBAIC0yNjQ3LDYgKzI3NDksOSBAQCBzdGF0aWMgc3RydWN0IHhlbmJ1c19kcml2ZXIg
YmxrZnJvbnRfZHJpdmVyID0gewogCS5yZXN1bWUgPSBibGtmcm9udF9yZXN1bWUsCiAJLm90aGVy
ZW5kX2NoYW5nZWQgPSBibGtiYWNrX2NoYW5nZWQsCiAJLmlzX3JlYWR5ID0gYmxrZnJvbnRfaXNf
cmVhZHksCisJLmZyZWV6ZSA9IGJsa2Zyb250X2ZyZWV6ZSwKKwkudGhhdyA9IGJsa2Zyb250X3Jl
c3RvcmUsCisJLnJlc3RvcmUgPSBibGtmcm9udF9yZXN0b3JlCiB9OwogCiBzdGF0aWMgdm9pZCBw
dXJnZV9wZXJzaXN0ZW50X2dyYW50cyhzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbykKLS0gCjIu
MjQuMS5BTVpOCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
