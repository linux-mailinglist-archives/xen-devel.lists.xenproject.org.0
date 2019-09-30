Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E97BC1F37
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:38:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt2i-0001vN-H2; Mon, 30 Sep 2019 10:36:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt2f-0001rf-UT
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:36:33 +0000
X-Inumbo-ID: 1d975824-e36e-11e9-97fb-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 1d975824-e36e-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 10:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839769; x=1601375769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=FkCiWRcyyS94XOIYsLNshumBozBwBJwF/QaEiXmKu/o=;
 b=TOASnwO/oGNrqyLIBTpUt266SpOCSnmq+c4c978MzxX2K46M037A+JH/
 Au/TYbUiisx218wJZI0ir/Iio5ahuvPOH6PWonKB/gI/e3W2MosWX+CAT
 psRV+HxZJzkwT7DGwLv2sKzd577wvBSJpCi0TcADOs8HD0gI3rcvVGX7i o=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="838005687"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 30 Sep 2019 10:35:09 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id CE308A228C; Mon, 30 Sep 2019 10:34:55 +0000 (UTC)
Received: from EX13D06UEE001.ant.amazon.com (10.43.62.79) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:32 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D06UEE001.ant.amazon.com (10.43.62.79) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:32 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:31 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:37 +0100
Message-ID: <c723d760abe52d02e09fb623c215d27dcda27bff.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 45/55] x86_64/mm: map and unmap page tables
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIHwg
OSArKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIGIveGVuL2FyY2gveDg2
L3g4Nl82NC9tbS5jCmluZGV4IDFkMmViZDY0MmYuLmU4ZWQwNDAwNmYgMTAwNjQ0Ci0tLSBhL3hl
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
