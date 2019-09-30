Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF302C1F2F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:38:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1k-0008Um-Ho; Mon, 30 Sep 2019 10:35:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt1i-0008Sk-U1
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:34 +0000
X-Inumbo-ID: f2aad050-e36d-11e9-96cd-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id f2aad050-e36d-11e9-96cd-12813bfff9fa;
 Mon, 30 Sep 2019 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839697; x=1601375697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Ni0X70rMd4HiEival1ohb3qxb2lcIMo1JhaaSjsq/ps=;
 b=ABAetlM1Kmof1RSxqDsgRwuF8ltxb9wVEm8eTwnQmjdfOPtRGM1+WZaM
 SrTeJ8PCTfRRaPHX3EQLa8F01bp0qXShg1lz/adPkpLNUTEI7Y29aYIH3
 mAACbflDPQ53zh2bgJU5JjnV6R5WmjRcScIOLl6lYr5T+YKyPrDx+OjrH Y=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="418649944"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:56 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id E88C4A123A; Mon, 30 Sep 2019 10:34:54 +0000 (UTC)
Received: from EX13D14UEE003.ant.amazon.com (10.43.62.11) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:30 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D14UEE003.ant.amazon.com (10.43.62.11) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:30 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:29 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:35 +0100
Message-ID: <bb1d43ed328b6cd5a16b2c38ebef2ee4b9305fba.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 43/55] x86_64/mm: map and unmap page tables
 in destroy_compat_m2p_mapping
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
L3g4Nl82NC9tbS5jCmluZGV4IGUwZDIxOTBiZTEuLjJmZmY1ZjkzMDYgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni94ODZfNjQvbW0uYworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKQEAg
LTI1MiwxMSArMjUyLDEzIEBAIHN0YXRpYyB2b2lkIGRlc3Ryb3lfY29tcGF0X20ycF9tYXBwaW5n
KHN0cnVjdCBtZW1faG90YWRkX2luZm8gKmluZm8pCiAgICAgaWYgKCBlbWFwID4gKChSRFdSX0NP
TVBBVF9NUFRfVklSVF9FTkQgLSBSRFdSX0NPTVBBVF9NUFRfVklSVF9TVEFSVCkgPj4gMikgKQog
ICAgICAgICBlbWFwID0gKFJEV1JfQ09NUEFUX01QVF9WSVJUX0VORCAtIFJEV1JfQ09NUEFUX01Q
VF9WSVJUX1NUQVJUKSA+PiAyOwogCi0gICAgbDNfcm9fbXB0ID0gbDRlX3RvX2wzZShpZGxlX3Bn
X3RhYmxlW2w0X3RhYmxlX29mZnNldChISVJPX0NPTVBBVF9NUFRfVklSVF9TVEFSVCldKTsKKyAg
ICBsM19yb19tcHQgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcoCisgICAgICAgIGw0ZV9nZXRfbWZu
KGlkbGVfcGdfdGFibGVbbDRfdGFibGVfb2Zmc2V0KEhJUk9fQ09NUEFUX01QVF9WSVJUX1NUQVJU
KV0pKTsKIAogICAgIEFTU0VSVChsM2VfZ2V0X2ZsYWdzKGwzX3JvX21wdFtsM190YWJsZV9vZmZz
ZXQoSElST19DT01QQVRfTVBUX1ZJUlRfU1RBUlQpXSkgJiBfUEFHRV9QUkVTRU5UKTsKIAotICAg
IGwyX3JvX21wdCA9IGwzZV90b19sMmUobDNfcm9fbXB0W2wzX3RhYmxlX29mZnNldChISVJPX0NP
TVBBVF9NUFRfVklSVF9TVEFSVCldKTsKKyAgICBsMl9yb19tcHQgPSBtYXBfeGVuX3BhZ2V0YWJs
ZV9uZXcoCisgICAgICAgIGwzZV9nZXRfbWZuKGwzX3JvX21wdFtsM190YWJsZV9vZmZzZXQoSElS
T19DT01QQVRfTVBUX1ZJUlRfU1RBUlQpXSkpOwogCiAgICAgZm9yICggaSA9IHNtYXA7IGkgPCBl
bWFwOyApCiAgICAgewpAQCAtMjc4LDYgKzI4MCw5IEBAIHN0YXRpYyB2b2lkIGRlc3Ryb3lfY29t
cGF0X20ycF9tYXBwaW5nKHN0cnVjdCBtZW1faG90YWRkX2luZm8gKmluZm8pCiAgICAgICAgIGkg
Kz0gMVVMIDw8IChMMl9QQUdFVEFCTEVfU0hJRlQgLSAyKTsKICAgICB9CiAKKyAgICBVTk1BUF9Y
RU5fUEFHRVRBQkxFX05FVyhsMl9yb19tcHQpOworICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVX
KGwzX3JvX21wdCk7CisKICAgICByZXR1cm47CiB9CiAKLS0gCjIuMTcuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
