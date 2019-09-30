Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEEBC1F26
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:37:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1V-00084h-JY; Mon, 30 Sep 2019 10:35:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt1U-00082j-0W
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:20 +0000
X-Inumbo-ID: f07ef23e-e36d-11e9-96cd-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id f07ef23e-e36d-11e9-96cd-12813bfff9fa;
 Mon, 30 Sep 2019 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839693; x=1601375693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=fu4bJoN6T56Ad0vMmXWFUvvsPIUm3UDPU1ArzywSC+U=;
 b=MzvShTKwqFtbyosWjmCP8p+JDrM2UxC/yiGToNkE4SQRDe0x3/Gq/CNd
 FwwniYIYgQRVJ/AozuK+UAiZFDeBbbmur1YTKKadq0GYFCmjl36+MtIDj
 cfr6sXAtTzP+KIe6d2v5o1DvJuNCOCvwbscxwzp5wC53rLUiYTTfZDLks s=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="418649922"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:53 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 71C41A276F; Mon, 30 Sep 2019 10:34:52 +0000 (UTC)
Received: from EX13D21UEE003.ant.amazon.com (10.43.62.160) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:26 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D21UEE003.ant.amazon.com (10.43.62.160) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:25 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:25 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:30 +0100
Message-ID: <c3b163d1fbd78553e68a05d2de97ca4ada456be4.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 38/55] x86/smpboot: drop lXe_to_lYe
 invocations from cleanup_cpu_root_pgt
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
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDE2
ICsrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMgYi94ZW4vYXJj
aC94ODYvc21wYm9vdC5jCmluZGV4IDk1NmUxYmRiY2MuLmM1NWFhYTY1YTIgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9zbXBib290LmMKKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwpAQCAt
ODkxLDIzICs4OTEsMjcgQEAgc3RhdGljIHZvaWQgY2xlYW51cF9jcHVfcm9vdF9wZ3QodW5zaWdu
ZWQgaW50IGNwdSkKICAgICAgICAgICByIDwgcm9vdF90YWJsZV9vZmZzZXQoSFlQRVJWSVNPUl9W
SVJUX0VORCk7ICsrciApCiAgICAgewogICAgICAgICBsM19wZ2VudHJ5X3QgKmwzdDsKKyAgICAg
ICAgbWZuX3QgbDN0X21mbjsKICAgICAgICAgdW5zaWduZWQgaW50IGkzOwogCiAgICAgICAgIGlm
ICggIShyb290X2dldF9mbGFncyhycHRbcl0pICYgX1BBR0VfUFJFU0VOVCkgKQogICAgICAgICAg
ICAgY29udGludWU7CiAKLSAgICAgICAgbDN0ID0gbDRlX3RvX2wzZShycHRbcl0pOworICAgICAg
ICBsM3RfbWZuID0gbDRlX2dldF9tZm4ocnB0W3JdKTsKKyAgICAgICAgbDN0ID0gbWFwX3hlbl9w
YWdldGFibGVfbmV3KGwzdF9tZm4pOwogCiAgICAgICAgIGZvciAoIGkzID0gMDsgaTMgPCBMM19Q
QUdFVEFCTEVfRU5UUklFUzsgKytpMyApCiAgICAgICAgIHsKICAgICAgICAgICAgIGwyX3BnZW50
cnlfdCAqbDJ0OworICAgICAgICAgICAgbWZuX3QgbDJ0X21mbjsKICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBpMjsKIAogICAgICAgICAgICAgaWYgKCAhKGwzZV9nZXRfZmxhZ3MobDN0W2kzXSkg
JiBfUEFHRV9QUkVTRU5UKSApCiAgICAgICAgICAgICAgICAgY29udGludWU7CiAKICAgICAgICAg
ICAgIEFTU0VSVCghKGwzZV9nZXRfZmxhZ3MobDN0W2kzXSkgJiBfUEFHRV9QU0UpKTsKLSAgICAg
ICAgICAgIGwydCA9IGwzZV90b19sMmUobDN0W2kzXSk7CisgICAgICAgICAgICBsMnRfbWZuID0g
bDNlX2dldF9tZm4obDN0W2kzXSk7CisgICAgICAgICAgICBsMnQgPSBtYXBfeGVuX3BhZ2V0YWJs
ZV9uZXcobDJ0X21mbik7CiAKICAgICAgICAgICAgIGZvciAoIGkyID0gMDsgaTIgPCBMMl9QQUdF
VEFCTEVfRU5UUklFUzsgKytpMiApCiAgICAgICAgICAgICB7CkBAIC05MTUsMTMgKzkxOSwxNSBA
QCBzdGF0aWMgdm9pZCBjbGVhbnVwX2NwdV9yb290X3BndCh1bnNpZ25lZCBpbnQgY3B1KQogICAg
ICAgICAgICAgICAgICAgICBjb250aW51ZTsKIAogICAgICAgICAgICAgICAgIEFTU0VSVCghKGwy
ZV9nZXRfZmxhZ3MobDJ0W2kyXSkgJiBfUEFHRV9QU0UpKTsKLSAgICAgICAgICAgICAgICBmcmVl
X3hlbl9wYWdldGFibGUobDJlX3RvX2wxZShsMnRbaTJdKSk7CisgICAgICAgICAgICAgICAgZnJl
ZV94ZW5fcGFnZXRhYmxlX25ldyhsMmVfZ2V0X21mbihsMnRbaTJdKSk7CiAgICAgICAgICAgICB9
CiAKLSAgICAgICAgICAgIGZyZWVfeGVuX3BhZ2V0YWJsZShsMnQpOworICAgICAgICAgICAgVU5N
QVBfWEVOX1BBR0VUQUJMRV9ORVcobDJ0KTsKKyAgICAgICAgICAgIGZyZWVfeGVuX3BhZ2V0YWJs
ZV9uZXcobDJ0X21mbik7CiAgICAgICAgIH0KIAotICAgICAgICBmcmVlX3hlbl9wYWdldGFibGUo
bDN0KTsKKyAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDN0KTsKKyAgICAgICAgZnJl
ZV94ZW5fcGFnZXRhYmxlX25ldyhsM3RfbWZuKTsKICAgICB9CiAKICAgICBmcmVlX3hlbl9wYWdl
dGFibGUocnB0KTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
