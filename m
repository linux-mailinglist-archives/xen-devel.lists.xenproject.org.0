Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D13BEEE4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQOV-0005RK-8n; Thu, 26 Sep 2019 09:49:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQOS-0005OE-P8
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:00 +0000
X-Inumbo-ID: d9482f14-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id d9482f14-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491332; x=1601027332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=+RHBcW6KCppwDFXfLm4Jpwg6xCNrwVVorBBy++8X8SQ=;
 b=Z4wFJftEKvrE47qackHDZv8LvqM3lcYuc8J/O7qgfbptVN7Q9yl8S2IG
 E5O7CUroyvsjEc8l+xwOrU15Zp/TEzY0uziQv19zVkhwgmI4XlNHkT6hv
 8Qc6NmjEnHbuwTQPntMdpZI3Vmc9sQuxctssvBdYmmCfvux+4YzywHIbA U=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="423750593"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:48:52 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 656A0A2AF7; Thu, 26 Sep 2019 09:48:52 +0000 (UTC)
Received: from EX13D06UWA003.ant.amazon.com (10.43.160.13) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:18 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D06UWA003.ant.amazon.com (10.43.160.13) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:17 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:16 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:09 +0100
Message-ID: <50b69940bfef5c9102d234f557b0e8bc228cc6a5.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 46/84] x86_64/mm: map and unmap page tables
 in setup_compat_m2p_table
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIHwg
OSArKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIGIveGVuL2FyY2gveDg2
L3g4Nl82NC9tbS5jCmluZGV4IDY0MmZlYWQ0ZjYuLjBmYWM3MTM1NmIgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni94ODZfNjQvbW0uYworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKQEAg
LTM4MiwxMSArMzgyLDEzIEBAIHN0YXRpYyBpbnQgc2V0dXBfY29tcGF0X20ycF90YWJsZShzdHJ1
Y3QgbWVtX2hvdGFkZF9pbmZvICppbmZvKQogCiAgICAgdmEgPSBISVJPX0NPTVBBVF9NUFRfVklS
VF9TVEFSVCArCiAgICAgICAgICBzbWFwICogc2l6ZW9mKCpjb21wYXRfbWFjaGluZV90b19waHlz
X21hcHBpbmcpOwotICAgIGwzX3JvX21wdCA9IGw0ZV90b19sM2UoaWRsZV9wZ190YWJsZVtsNF90
YWJsZV9vZmZzZXQodmEpXSk7CisgICAgbDNfcm9fbXB0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3
KAorICAgICAgICBsNGVfZ2V0X21mbihpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldCh2YSld
KSk7CiAKICAgICBBU1NFUlQobDNlX2dldF9mbGFncyhsM19yb19tcHRbbDNfdGFibGVfb2Zmc2V0
KHZhKV0pICYgX1BBR0VfUFJFU0VOVCk7CiAKLSAgICBsMl9yb19tcHQgPSBsM2VfdG9fbDJlKGwz
X3JvX21wdFtsM190YWJsZV9vZmZzZXQodmEpXSk7CisgICAgbDJfcm9fbXB0ID0gbWFwX3hlbl9w
YWdldGFibGVfbmV3KAorICAgICAgICBsM2VfZ2V0X21mbihsM19yb19tcHRbbDNfdGFibGVfb2Zm
c2V0KHZhKV0pKTsKIAogI2RlZmluZSBNRk4oeCkgKCgoeCkgPDwgTDJfUEFHRVRBQkxFX1NISUZU
KSAvIHNpemVvZih1bnNpZ25lZCBpbnQpKQogI2RlZmluZSBDTlQgKChzaXplb2YoKmZyYW1lX3Rh
YmxlKSAmIC1zaXplb2YoKmZyYW1lX3RhYmxlKSkgLyBcCkBAIC00MjQsNiArNDI2LDkgQEAgc3Rh
dGljIGludCBzZXR1cF9jb21wYXRfbTJwX3RhYmxlKHN0cnVjdCBtZW1faG90YWRkX2luZm8gKmlu
Zm8pCiAgICAgfQogI3VuZGVmIENOVAogI3VuZGVmIE1GTgorCisgICAgVU5NQVBfWEVOX1BBR0VU
QUJMRV9ORVcobDJfcm9fbXB0KTsKKyAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsM19yb19t
cHQpOwogICAgIHJldHVybiBlcnI7CiB9CiAKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
