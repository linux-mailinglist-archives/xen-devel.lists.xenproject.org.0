Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF3E113095
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 18:15:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icYCR-000421-O1; Wed, 04 Dec 2019 17:12:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQYo=Z2=amazon.com=prvs=234ed30ac=hongyxia@srs-us1.protection.inumbo.net>)
 id 1icYCQ-00041W-Dw
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 17:12:26 +0000
X-Inumbo-ID: 3aac8213-16b9-11ea-8206-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3aac8213-16b9-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 17:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575479541; x=1607015541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=BUNjbFN19La5dNEZzDM9hoIm4hLI2RtBAZtQ9z74zTM=;
 b=ZOu9n38yPybrQs3h2xIubSSOGOGCsNv8qjhAKwPfc1FXPWwex9gl+FRb
 hnR6QB8qo6JKd8/KKFV7Xg8tiEFV50EJITu/7FXRdMj2muVA9rp58sfzK
 a7pcnV2Ta2GzWw/hpiN14uRIEtMWazzw6Xw6v39cVp651m3DsaqOU3NZv w=;
IronPort-SDR: mNgSh0bJjaJzfp2iJmJ2xeBxd/EJuCsgXgmYvsfAmQpgtXIIkY2WO3LchmNE8IZqFrvbRDzibR
 fyzJcwVSau1Q==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; d="scan'208";a="11630599"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 04 Dec 2019 17:11:23 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 59E3AA1DCA; Wed,  4 Dec 2019 17:11:22 +0000 (UTC)
Received: from EX13D01UWA004.ant.amazon.com (10.43.160.99) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:12 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13d01UWA004.ant.amazon.com (10.43.160.99) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:11 +0000
Received: from u60d575063b1f53.ant.amazon.com (10.125.106.64) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 4 Dec 2019 17:11:10 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 17:10:58 +0000
Message-ID: <3885863bfc54a5f5f05cddb3cd9afe24897f27b3.1575477921.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575477921.git.hongyxia@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 6/9] x86/mm: add an end_of_loop label in
 map_pages_to_xen
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgc29vbiBuZWVkIHRv
IGNsZWFuIHVwIG1hcHBpbmdzIHdoZW5ldmVyIHRoZSBvdXQgbW9zdCBsb29wIGlzCmVuZGVkLiBB
ZGQgYSBuZXcgbGFiZWwgYW5kIHR1cm4gcmVsZXZhbnQgY29udGludWUncyBpbnRvIGdvdG8ncy4K
Ck5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyB8IDkgKysrKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggZjc0NjRjMjEwMy4uZjUz
MGRkMzkxYyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2
L21tLmMKQEAgLTUyNzMsNyArNTI3Myw3IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAogICAgICAg
ICAgICAgaWYgKCAhbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pICkKICAgICAgICAgICAgICAgICBt
Zm4gID0gbWZuX2FkZChtZm4sIDFVTCA8PCAoTDNfUEFHRVRBQkxFX1NISUZUIC0gUEFHRV9TSElG
VCkpOwogICAgICAgICAgICAgbnJfbWZucyAtPSAxVUwgPDwgKEwzX1BBR0VUQUJMRV9TSElGVCAt
IFBBR0VfU0hJRlQpOwotICAgICAgICAgICAgY29udGludWU7CisgICAgICAgICAgICBnb3RvIGVu
ZF9vZl9sb29wOwogICAgICAgICB9CiAKICAgICAgICAgaWYgKCAobDNlX2dldF9mbGFncyhvbDNl
KSAmIF9QQUdFX1BSRVNFTlQpICYmCkBAIC01MzAwLDcgKzUzMDAsNyBAQCBpbnQgbWFwX3BhZ2Vz
X3RvX3hlbigKICAgICAgICAgICAgICAgICBpZiAoICFtZm5fZXEobWZuLCBJTlZBTElEX01GTikg
KQogICAgICAgICAgICAgICAgICAgICBtZm4gPSBtZm5fYWRkKG1mbiwgaSk7CiAgICAgICAgICAg
ICAgICAgbnJfbWZucyAtPSBpOwotICAgICAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICAg
ICAgICAgIGdvdG8gZW5kX29mX2xvb3A7CiAgICAgICAgICAgICB9CiAKICAgICAgICAgICAgIGwy
dCA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKQEAgLTU0NjksNyArNTQ2OSw3IEBAIGludCBtYXBf
cGFnZXNfdG9feGVuKAogICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgaWYg
KCBsb2NraW5nICkKICAgICAgICAgICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZtYXBfcGdk
aXJfbG9jayk7Ci0gICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICAgICAgICAg
ICAgICBnb3RvIGVuZF9vZl9sb29wOwogICAgICAgICAgICAgICAgIH0KIAogICAgICAgICAgICAg
ICAgIGlmICggbDJlX2dldF9mbGFncyhvbDJlKSAmIF9QQUdFX1BTRSApCkBAIC01NTI0LDcgKzU1
MjQsNyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICAgICAgICAgIHsKICAgICAgICAgICAg
ICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygmbWFw
X3BnZGlyX2xvY2spOwotICAgICAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICAgICAgICAg
IGdvdG8gZW5kX29mX2xvb3A7CiAgICAgICAgICAgICB9CiAKICAgICAgICAgICAgIGwydCA9IGwz
ZV90b19sMmUob2wzZSk7CkBAIC01NTQ5LDYgKzU1NDksNyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hl
bigKICAgICAgICAgICAgIGVsc2UgaWYgKCBsb2NraW5nICkKICAgICAgICAgICAgICAgICBzcGlu
X3VubG9jaygmbWFwX3BnZGlyX2xvY2spOwogICAgICAgICB9CisgICAgZW5kX29mX2xvb3A6Owog
ICAgIH0KIAogI3VuZGVmIGZsdXNoX2ZsYWdzCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
