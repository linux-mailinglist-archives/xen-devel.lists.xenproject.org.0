Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21472BEEEE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPb-0007oq-Mg; Thu, 26 Sep 2019 09:50:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPY-0007jK-Ie
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:08 +0000
X-Inumbo-ID: 051809a2-e043-11e9-b588-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 051809a2-e043-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 09:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491407; x=1601027407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=/N+3BiC33vzQF6ohI6LMcU0gxzw4E3xPn2zu9preNjo=;
 b=uc5ZuajNOESt5XN8VmeokTnEEXgfzsoLoyUellFlGn/R+z69hiuXLQWF
 6S5iql8DSvukoQLdTDXy1PlZ8CUB1kW7Cly4fJvKIudnO0pZAGYb6nlpz
 AxSqu0bhCkNtpKg+18Q4BVoaGPdeW7Fr0GbnwZqDkBd3iPlT2DSSKe0FB E=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836988975"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 09:49:04 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id DB16AA036A; Thu, 26 Sep 2019 09:48:50 +0000 (UTC)
Received: from EX13D10UWA002.ant.amazon.com (10.43.160.228) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:14 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D10UWA002.ant.amazon.com (10.43.160.228) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:13 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:12 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:07 +0100
Message-ID: <915a683ca67a6379017e2cbbfc4157080111aa47.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 44/84] x86_64/mm: map and unmap page tables
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
L3g4Nl82NC9tbS5jCmluZGV4IDNiMmIxMzZiNDkuLmY0Nzc5ZjVjMGEgMTAwNjQ0Ci0tLSBhL3hl
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
