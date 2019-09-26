Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA06CBEEC8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:50:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQOB-0004x0-PK; Thu, 26 Sep 2019 09:48:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQO9-0004ur-Vq
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:42 +0000
X-Inumbo-ID: d2908950-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id d2908950-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491321; x=1601027321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=9mWYNHZmtuPB9zVPJuoVpk2F+cc/wi/n5qjrC2/v5/g=;
 b=REN/rmjEqThlHQHVVW1FaEPSq9z7dGasdcoP9EkXRnRCiDv43Ng3F05o
 j6Fta56fmkE1s35vDkHG0egM5wdo0geIyDi9OYAh6TatcsLdSHGeOM4DN
 hMczg5LrK/XDunmsg92Uvthmx1+iNaymSBZ9APlsRnZ1DoQLLptPDbIr4 g=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="787535151"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Sep 2019 09:48:41 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7F008242082; Thu, 26 Sep 2019 09:48:39 +0000 (UTC)
Received: from EX13d09UWA004.ant.amazon.com (10.43.160.158) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:05 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13d09UWA004.ant.amazon.com (10.43.160.158) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:04 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:03 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:02 +0100
Message-ID: <4d89fb167f229e84026702595558a0aa24fc00c1.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 39/84] x86/smpboot: drop lXe_to_lYe
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDE2
ICsrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMgYi94ZW4vYXJj
aC94ODYvc21wYm9vdC5jCmluZGV4IGRhZjczNGQwOTUuLmI2NzQzMjkzM2QgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9zbXBib290LmMKKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwpAQCAt
ODkzLDIzICs4OTMsMjcgQEAgc3RhdGljIHZvaWQgY2xlYW51cF9jcHVfcm9vdF9wZ3QodW5zaWdu
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
VEFCTEVfRU5UUklFUzsgKytpMiApCiAgICAgICAgICAgICB7CkBAIC05MTcsMTMgKzkyMSwxNSBA
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
