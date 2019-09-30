Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8506DC1F07
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt15-0007RZ-II; Mon, 30 Sep 2019 10:34:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt13-0007Pt-QF
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:34:53 +0000
X-Inumbo-ID: e98136c2-e36d-11e9-97fb-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id e98136c2-e36d-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 10:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839682; x=1601375682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=kfRLGwMAo8qUkUICVo3LN9nmzho78UjN+g9YgNVLCXI=;
 b=t0aon9QEkkCiSQvroVDo6grZtLn4H0YkeMrIaZ9h582iA6PZlJ6PZfvK
 8CFsELNNKhK0/vtsMkJGft2iKQMJ5Clp9x/KbKReDB+adO4jyYtghBNWT
 js1afYH0DpyiFTsRut3h/bWrsV23rjSdbe7+NdtbCPrhlbau5DrmpJdY3 M=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="424630109"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:41 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 83826A1F55; Mon, 30 Sep 2019 10:34:41 +0000 (UTC)
Received: from EX13D20UEE001.ant.amazon.com (10.43.62.84) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:13 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D20UEE001.ant.amazon.com (10.43.62.84) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:13 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:12 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:15 +0100
Message-ID: <64c26c9c344f68e0377e15e956a9bca3962c896f.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 23/55] x86_64/mm: drop l4e_to_l3e invocation
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIHwg
NyArKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYyBiL3hlbi9hcmNoL3g4Ni94
ODZfNjQvbW0uYwppbmRleCBjOGM3MTU2NGJhLi5jMWRhYTA0Y2Y1IDEwMDY0NAotLS0gYS94ZW4v
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
