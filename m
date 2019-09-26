Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A422CBEEE2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQNq-0004Ow-V7; Thu, 26 Sep 2019 09:48:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQNo-0004MF-NK
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:20 +0000
X-Inumbo-ID: c3e9b571-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id c3e9b571-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491298; x=1601027298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=0SYqLn0J8g22MwTPI4ly2IZPEB0g/6dxXq86B5UES/I=;
 b=jf/soolwuAgNTsw5aikDpAlJY9ctmpkZ2yBPtINWXR0PEZ4W/BPu7vLE
 Ldkh5nbwezsOzSKl0IbyN9hJrZGlzMflvaCMGNG9nzcLLhmKuPif5xp78
 SbI/JLMlnOlfPl6BGolyKN9t+Dswu0lBwqyjFSuTVVE2l/g+8omXREVai 4=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="417788190"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:48:18 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id D09F9A04EB; Thu, 26 Sep 2019 09:48:17 +0000 (UTC)
Received: from EX13D03UWA002.ant.amazon.com (10.43.160.144) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:50 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D03UWA002.ant.amazon.com (10.43.160.144) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:49 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:49 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:54 +0100
Message-ID: <dcd67517f3b6dd097dfecc801afb7daed3d982c0.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 31/84] efi: use new page table APIs in
 efi_init_memory
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2NvbW1vbi9lZmkvYm9vdC5jIHwgMzkg
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MjcgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1v
bi9lZmkvYm9vdC5jIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jCmluZGV4IDY0YTI4NzY5MGEuLjFk
MTQyMGYwMmMgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZWZpL2Jvb3QuYworKysgYi94ZW4vY29t
bW9uL2VmaS9ib290LmMKQEAgLTE2MzcsMzkgKzE2MzcsNTAgQEAgdm9pZCBfX2luaXQgZWZpX2lu
aXRfbWVtb3J5KHZvaWQpCiAKICAgICAgICAgaWYgKCAhKGw0ZV9nZXRfZmxhZ3MobDRlKSAmIF9Q
QUdFX1BSRVNFTlQpICkKICAgICAgICAgewotICAgICAgICAgICAgcGwzZSA9IGFsbG9jX3hlbl9w
YWdldGFibGUoKTsKLSAgICAgICAgICAgIEJVR19PTighcGwzZSk7CisgICAgICAgICAgICBtZm5f
dCBsM3RfbWZuOworCisgICAgICAgICAgICBsM3RfbWZuID0gYWxsb2NfeGVuX3BhZ2V0YWJsZV9u
ZXcoKTsKKyAgICAgICAgICAgIEJVR19PTihtZm5fZXEobDN0X21mbiwgSU5WQUxJRF9NRk4pKTsK
KyAgICAgICAgICAgIHBsM2UgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcobDN0X21mbik7CiAgICAg
ICAgICAgICBjbGVhcl9wYWdlKHBsM2UpOwogICAgICAgICAgICAgZWZpX2w0X3BndGFibGVbbDRf
dGFibGVfb2Zmc2V0KGFkZHIpXSA9Ci0gICAgICAgICAgICAgICAgbDRlX2Zyb21fcGFkZHIodmly
dF90b19tYWRkcihwbDNlKSwgX19QQUdFX0hZUEVSVklTT1IpOworICAgICAgICAgICAgICAgIGw0
ZV9mcm9tX21mbihsM3RfbWZuLCBfX1BBR0VfSFlQRVJWSVNPUik7CiAgICAgICAgIH0KICAgICAg
ICAgZWxzZQotICAgICAgICAgICAgcGwzZSA9IGw0ZV90b19sM2UobDRlKTsKKyAgICAgICAgICAg
IHBsM2UgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcobDRlX2dldF9tZm4obDRlKSk7CiAgICAgICAg
IHBsM2UgKz0gbDNfdGFibGVfb2Zmc2V0KGFkZHIpOworCiAgICAgICAgIGlmICggIShsM2VfZ2V0
X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAgewotICAgICAgICAgICAg
cGwyZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKLSAgICAgICAgICAgIEJVR19PTighcGwyZSk7
CisgICAgICAgICAgICBtZm5fdCBsMnRfbWZuOworCisgICAgICAgICAgICBsMnRfbWZuID0gYWxs
b2NfeGVuX3BhZ2V0YWJsZV9uZXcoKTsKKyAgICAgICAgICAgIEJVR19PTihtZm5fZXEobDJ0X21m
biwgSU5WQUxJRF9NRk4pKTsKKyAgICAgICAgICAgIHBsMmUgPSBtYXBfeGVuX3BhZ2V0YWJsZV9u
ZXcobDJ0X21mbik7CiAgICAgICAgICAgICBjbGVhcl9wYWdlKHBsMmUpOwotICAgICAgICAgICAg
KnBsM2UgPSBsM2VfZnJvbV9wYWRkcih2aXJ0X3RvX21hZGRyKHBsMmUpLCBfX1BBR0VfSFlQRVJW
SVNPUik7CisgICAgICAgICAgICAqcGwzZSA9IGwzZV9mcm9tX21mbihsMnRfbWZuLCBfX1BBR0Vf
SFlQRVJWSVNPUik7CiAgICAgICAgIH0KICAgICAgICAgZWxzZQogICAgICAgICB7CiAgICAgICAg
ICAgICBCVUdfT04obDNlX2dldF9mbGFncygqcGwzZSkgJiBfUEFHRV9QU0UpOwotICAgICAgICAg
ICAgcGwyZSA9IGwzZV90b19sMmUoKnBsM2UpOworICAgICAgICAgICAgcGwyZSA9IG1hcF94ZW5f
cGFnZXRhYmxlX25ldyhsM2VfZ2V0X21mbigqcGwzZSkpOwogICAgICAgICB9CiAgICAgICAgIHBs
MmUgKz0gbDJfdGFibGVfb2Zmc2V0KGFkZHIpOworCiAgICAgICAgIGlmICggIShsMmVfZ2V0X2Zs
YWdzKCpwbDJlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAgewotICAgICAgICAgICAgbDF0
ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwotICAgICAgICAgICAgQlVHX09OKCFsMXQpOworICAg
ICAgICAgICAgbWZuX3QgbDF0X21mbjsKKworICAgICAgICAgICAgbDF0X21mbiA9IGFsbG9jX3hl
bl9wYWdldGFibGVfbmV3KCk7CisgICAgICAgICAgICBCVUdfT04obWZuX2VxKGwxdF9tZm4sIElO
VkFMSURfTUZOKSk7CisgICAgICAgICAgICBsMXQgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcobDF0
X21mbik7CiAgICAgICAgICAgICBjbGVhcl9wYWdlKGwxdCk7Ci0gICAgICAgICAgICAqcGwyZSA9
IGwyZV9mcm9tX3BhZGRyKHZpcnRfdG9fbWFkZHIobDF0KSwgX19QQUdFX0hZUEVSVklTT1IpOwor
ICAgICAgICAgICAgKnBsMmUgPSBsMmVfZnJvbV9tZm4obDF0X21mbiwgX19QQUdFX0hZUEVSVklT
T1IpOwogICAgICAgICB9CiAgICAgICAgIGVsc2UKICAgICAgICAgewogICAgICAgICAgICAgQlVH
X09OKGwyZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFNFKTsKLSAgICAgICAgICAgIGwxdCA9
IGwyZV90b19sMWUoKnBsMmUpOworICAgICAgICAgICAgbDF0ID0gbWFwX3hlbl9wYWdldGFibGVf
bmV3KGwyZV9nZXRfbWZuKCpwbDJlKSk7CiAgICAgICAgIH0KICAgICAgICAgZm9yICggaSA9IGwx
X3RhYmxlX29mZnNldChhZGRyKTsKICAgICAgICAgICAgICAgaSA8IEwxX1BBR0VUQUJMRV9FTlRS
SUVTICYmIGV4dHJhLT5zbWZuIDwgZXh0cmEtPmVtZm47CkBAIC0xNjgxLDYgKzE2OTIsMTAgQEAg
dm9pZCBfX2luaXQgZWZpX2luaXRfbWVtb3J5KHZvaWQpCiAgICAgICAgICAgICBleHRyYV9oZWFk
ID0gZXh0cmEtPm5leHQ7CiAgICAgICAgICAgICB4ZnJlZShleHRyYSk7CiAgICAgICAgIH0KKwor
ICAgICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsMXQpOworICAgICAgICBVTk1BUF9YRU5f
UEFHRVRBQkxFX05FVyhwbDJlKTsKKyAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcocGwz
ZSk7CiAgICAgfQogCiAgICAgLyogSW5zZXJ0IFhlbiBtYXBwaW5ncy4gKi8KLS0gCjIuMTcuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
