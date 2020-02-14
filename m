Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB8215FA8E
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2020 00:29:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2kN2-0001ML-5t; Fri, 14 Feb 2020 23:27:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0dv=4C=amazon.com=prvs=306f93d76=anchalag@srs-us1.protection.inumbo.net>)
 id 1j2kN0-0001M4-Et
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 23:27:38 +0000
X-Inumbo-ID: 95deeaf2-4f81-11ea-ade5-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95deeaf2-4f81-11ea-ade5-bc764e2007e4;
 Fri, 14 Feb 2020 23:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581722858; x=1613258858;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=twtwEReB4vMkPmSnf9+l1xK/swlwTJyqpy55MdpJ7fk=;
 b=uGjSqM6DD/dPwgX1agedt7m8VW/mKQ/itlPtWapCGx5/jbKbVkhFHoCX
 aSpTJ3wMzAheJrjbhjKjM3+urAjXZPEv53IPBZ5EN+fw0Cpg+/jv1dodq
 KN0EPTajDyCH32bUs/ckLiYAFXjlNasi8bIvGAbxtNka+PFclVWvj2FLD w=;
IronPort-SDR: 0NYhP0y0gcnaLbWj28x+E2/jgUI4gGpKUH11hprNLe3x8BJa1vSsS6GgCFZdKL3U2He/tfqsAM
 hOUpZ7VBqHBA==
X-IronPort-AV: E=Sophos;i="5.70,442,1574121600"; d="scan'208";a="26558936"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 14 Feb 2020 23:27:35 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id B67BEA22B3; Fri, 14 Feb 2020 23:27:28 +0000 (UTC)
Received: from EX13D08UEB002.ant.amazon.com (10.43.60.107) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:27:05 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08UEB002.ant.amazon.com (10.43.60.107) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 23:27:05 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Fri, 14 Feb 2020 23:27:05 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id DB8AA4028E; Fri, 14 Feb 2020 23:27:04 +0000 (UTC)
Date: Fri, 14 Feb 2020 23:27:04 +0000
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
Message-ID: <47d0ad88d45360b034bf472802e9f43637155fb3.1581721799.git.anchalag@amazon.com>
References: <cover.1581721799.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1581721799.git.anchalag@amazon.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 09/12] x86/xen: save and restore steal
 clock
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

RnJvbTogTXVuZWhpc2EgS2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20+CgpTYXZlIHN0ZWFsIGNs
b2NrIHZhbHVlcyBvZiBhbGwgcHJlc2VudCBDUFVzIGluIHRoZSBzeXN0ZW0gY29yZSBvcHMKc3Vz
cGVuZCBjYWxsYmFja3MuIEFsc28sIHJlc3RvcmUgYSBib290IENQVSdzIHN0ZWFsIGNsb2NrIGlu
IHRoZSBzeXN0ZW0KY29yZSByZXN1bWUgY2FsbGJhY2suIEZvciBub24tYm9vdCBDUFVzLCByZXN0
b3JlIGFmdGVyIHRoZXkncmUgYnJvdWdodAp1cCwgYmVjYXVzZSBydW5zdGF0ZSBpbmZvIGZvciBu
b24tYm9vdCBDUFVzIGFyZSBub3QgYWN0aXZlIHVudGlsIHRoZW4uCgpTaWduZWQtb2ZmLWJ5OiBN
dW5laGlzYSBLYW1hdGEgPGthbWF0YW1AYW1hem9uLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5jaGFs
IEFnYXJ3YWwgPGFuY2hhbGFnQGFtYXpvbi5jb20+Ci0tLQogYXJjaC94ODYveGVuL3N1c3BlbmQu
YyB8IDEzICsrKysrKysrKysrKy0KIGFyY2gveDg2L3hlbi90aW1lLmMgICAgfCAgMyArKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L3hlbi9zdXNwZW5kLmMgYi9hcmNoL3g4Ni94ZW4vc3VzcGVuZC5jCmluZGV4
IDc4NGM0NDg0MTAwYi4uZGFlMGY3NGY1MzkwIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4vc3Vz
cGVuZC5jCisrKyBiL2FyY2gveDg2L3hlbi9zdXNwZW5kLmMKQEAgLTkxLDEyICs5MSwyMCBAQCB2
b2lkIHhlbl9hcmNoX3N1c3BlbmQodm9pZCkKIHN0YXRpYyBpbnQgeGVuX3N5c2NvcmVfc3VzcGVu
ZCh2b2lkKQogewogCXN0cnVjdCB4ZW5fcmVtb3ZlX2Zyb21fcGh5c21hcCB4cmZwOwotCWludCBy
ZXQ7CisJaW50IGNwdSwgcmV0OwogCiAJLyogWGVuIHN1c3BlbmQgZG9lcyBzaW1pbGFyIHN0dWZm
cyBpbiBpdHMgb3duIGxvZ2ljICovCiAJaWYgKHhlbl9zdXNwZW5kX21vZGVfaXNfeGVuX3N1c3Bl
bmQoKSkKIAkJcmV0dXJuIDA7CiAKKwlmb3JfZWFjaF9wcmVzZW50X2NwdShjcHUpIHsKKwkJLyoK
KwkJICogTm9uYm9vdCBDUFVzIGFyZSBhbHJlYWR5IG9mZmxpbmUsIGJ1dCB0aGUgbGFzdCBjb3B5
IG9mCisJCSAqIHJ1bnN0YXRlIGluZm8gaXMgc3RpbGwgYWNjZXNzaWJsZS4KKwkJICovCisJCXhl
bl9zYXZlX3N0ZWFsX2Nsb2NrKGNwdSk7CisJfQorCiAJeHJmcC5kb21pZCA9IERPTUlEX1NFTEY7
CiAJeHJmcC5ncGZuID0gX19wYShIWVBFUlZJU09SX3NoYXJlZF9pbmZvKSA+PiBQQUdFX1NISUZU
OwogCkBAIC0xMTgsNiArMTI2LDkgQEAgc3RhdGljIHZvaWQgeGVuX3N5c2NvcmVfcmVzdW1lKHZv
aWQpCiAKIAlwdmNsb2NrX3Jlc3VtZSgpOwogCisJLyogTm9uYm9vdCBDUFVzIHdpbGwgYmUgcmVz
dW1lZCB3aGVuIHRoZXkncmUgYnJvdWdodCB1cCAqLworCXhlbl9yZXN0b3JlX3N0ZWFsX2Nsb2Nr
KHNtcF9wcm9jZXNzb3JfaWQoKSk7CisKIAlnbnR0YWJfcmVzdW1lKCk7CiB9CiAKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L3hlbi90aW1lLmMgYi9hcmNoL3g4Ni94ZW4vdGltZS5jCmluZGV4IGJlZmJk
ZDhiMTdmMC4uOGNmNjMyZGRhNjA1IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4vdGltZS5jCisr
KyBiL2FyY2gveDg2L3hlbi90aW1lLmMKQEAgLTUzNyw2ICs1MzcsOSBAQCBzdGF0aWMgdm9pZCB4
ZW5faHZtX3NldHVwX2NwdV9jbG9ja2V2ZW50cyh2b2lkKQogewogCWludCBjcHUgPSBzbXBfcHJv
Y2Vzc29yX2lkKCk7CiAJeGVuX3NldHVwX3J1bnN0YXRlX2luZm8oY3B1KTsKKwlpZiAoY3B1KQor
CQl4ZW5fcmVzdG9yZV9zdGVhbF9jbG9jayhjcHUpOworCiAJLyoKIAkgKiB4ZW5fc2V0dXBfdGlt
ZXIoY3B1KSAtIHNucHJpbnRmIGlzIGJhZCBpbiBhdG9taWMgY29udGV4dC4gSGVuY2UKIAkgKiBk
b2luZyBpdCB4ZW5faHZtX2NwdV9ub3RpZnkgKHdoaWNoIGdldHMgY2FsbGVkIGJ5IHNtcF9pbml0
IGR1cmluZwotLSAKMi4yNC4xLkFNWk4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
