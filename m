Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDB8BEEDC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQOw-0006Iq-0h; Thu, 26 Sep 2019 09:49:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQOu-0006GJ-65
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:28 +0000
X-Inumbo-ID: eb644908-e042-11e9-97fb-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id eb644908-e042-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 09:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491367; x=1601027367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=2UYyndybd/u2L8eu6I/OvdFYJWjbmvXRD7Ecm6dmF+Q=;
 b=hjGDIHYB8E3OtG7sWZj7V1ZhWTIZB7M1voLM/fnZ59AkrJl5ow1412Ao
 Go9ZSBjRVtdHFzES3By6C/Da9PMl2F/zkSr/WrYn/XiyrErXGcZ/LGxEF
 VqydEayO62uHa37NhfRC5RilLJsKxpTqk2heJQJZH9ZgEAUi75k/lWxmz s=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836988813"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 09:48:20 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 4402DC1333; Thu, 26 Sep 2019 09:48:09 +0000 (UTC)
Received: from EX13P01UWA003.ant.amazon.com (10.43.160.197) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:38 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13P01UWA003.ant.amazon.com (10.43.160.197) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:38 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:37 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:47 +0100
Message-ID: <24536847bce6e0d42440990abaa617e80fe08af8.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 24/84] x86_64/mm: drop l4e_to_l3e invocation
 from paging_init
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
NyArKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYyBiL3hlbi9hcmNoL3g4Ni94
ODZfNjQvbW0uYwppbmRleCBhOWMyYjVjYTU0Li45NDVhZTEyM2E2IDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYveDg2XzY0L21tLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCkBAIC02
NDksOCArNjQ5LDEwIEBAIHZvaWQgX19pbml0IHBhZ2luZ19pbml0KHZvaWQpCiAgICAgLyogQ3Jl
YXRlIHVzZXItYWNjZXNzaWJsZSBMMiBkaXJlY3RvcnkgdG8gbWFwIHRoZSBNUFQgZm9yIGNvbXBh
dCBndWVzdHMuICovCiAgICAgQlVJTERfQlVHX09OKGw0X3RhYmxlX29mZnNldChSRFdSX01QVF9W
SVJUX1NUQVJUKSAhPQogICAgICAgICAgICAgICAgICBsNF90YWJsZV9vZmZzZXQoSElST19DT01Q
QVRfTVBUX1ZJUlRfU1RBUlQpKTsKLSAgICBsM19yb19tcHQgPSBsNGVfdG9fbDNlKGlkbGVfcGdf
dGFibGVbbDRfdGFibGVfb2Zmc2V0KAotICAgICAgICBISVJPX0NPTVBBVF9NUFRfVklSVF9TVEFS
VCldKTsKKworICAgIGwzX3JvX21wdF9tZm4gPSBsNGVfZ2V0X21mbihpZGxlX3BnX3RhYmxlW2w0
X3RhYmxlX29mZnNldCgKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBI
SVJPX0NPTVBBVF9NUFRfVklSVF9TVEFSVCldKTsKKyAgICBsM19yb19tcHQgPSBtYXBfeGVuX3Bh
Z2V0YWJsZV9uZXcobDNfcm9fbXB0X21mbik7CiAKICAgICBsMl9yb19tcHRfbWZuID0gYWxsb2Nf
eGVuX3BhZ2V0YWJsZV9uZXcoKTsKICAgICBpZiAoIG1mbl9lcShsMl9yb19tcHRfbWZuLCBJTlZB
TElEX01GTikgKQpAQCAtNzAyLDYgKzcwNCw3IEBAIHZvaWQgX19pbml0IHBhZ2luZ19pbml0KHZv
aWQpCiAjdW5kZWYgTUZOCiAKICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsMl9yb19tcHQp
OworICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwzX3JvX21wdCk7CiAKICAgICBtYWNoaW5l
X3RvX3BoeXNfbWFwcGluZ192YWxpZCA9IDE7CiAKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
