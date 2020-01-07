Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E37133793
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 00:42:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioySU-0001l3-CY; Tue, 07 Jan 2020 23:40:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wAzM=24=amazon.com=prvs=268257c0c=anchalag@srs-us1.protection.inumbo.net>)
 id 1ioyST-0001ku-CU
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 23:40:21 +0000
X-Inumbo-ID: 10f16808-31a7-11ea-ad29-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10f16808-31a7-11ea-ad29-12813bfff9fa;
 Tue, 07 Jan 2020 23:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578440421; x=1609976421;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=fKBHoK09YZBwiKXNN6RfSgjFeH+5bNsX0xukKXYpamw=;
 b=jtucKk9KpH1S+Gr6UTTFJA3H6DCGSi9EwFkg6puLDX3NzKrkR1YoS5yo
 QlEpLYn1XW2pQWeAXOh6TxZcOvZTAYIlZUvZcYotpj4hcr4qT7C679aj/
 ltKBcPJ+wNO6rtP0Sw16gS/g/yBn+6y++a0pphXSK+jAUMcy7oHjJQwVQ s=;
IronPort-SDR: +5WXZR3aQI5IaNTfkU7fCO+qrdocNvSC8Btqi8thp07FiCmMP6fRqrvnOSUa1k56Gzc7llX4Wq
 QvHj7bPazjDg==
X-IronPort-AV: E=Sophos;i="5.69,407,1571702400"; d="scan'208";a="17325704"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 07 Jan 2020 23:40:10 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id E3EF9C2E0A; Tue,  7 Jan 2020 23:40:07 +0000 (UTC)
Received: from EX13D08UEB003.ant.amazon.com (10.43.60.11) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:39:47 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D08UEB003.ant.amazon.com (10.43.60.11) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:39:47 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP
 Server id 15.0.1236.3 via Frontend Transport; Tue, 7 Jan 2020 23:39:47 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id E3FD440E65; Tue,  7 Jan 2020 23:39:46 +0000 (UTC)
Date: Tue, 7 Jan 2020 23:39:46 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.co>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>,
 <dwmw@amazon.co.uk>, <fllinden@amaozn.com>
Message-ID: <20200107233946.GA18143@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH V2 03/11] x86/xen: Introduce new function to
 map
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: anchalag@amazon.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50cm9kdWNlIGEgc21hbGwgZnVuY3Rpb24gd2hpY2ggcmUtdXNlcyBzaGFyZWQgcGFnZSdzIFBB
IGFsbG9jYXRlZApkdXJpbmcgZ3Vlc3QgaW5pdGlhbGl6YXRpb24gdGltZSBpbiByZXNlcnZlX3No
YXJlZF9pbmZvKCkgYW5kIG5vdAphbGxvY2F0ZSBuZXcgcGFnZSBkdXJpbmcgcmVzdW1lIGZsb3cu
Ckl0IGFsc28gIGRvZXMgdGhlIG1hcHBpbmcgb2Ygc2hhcmVkX2luZm9fcGFnZSBieSBjYWxsaW5n
Cnhlbl9odm1faW5pdF9zaGFyZWRfaW5mbygpIHRvIHVzZSB0aGUgZnVuY3Rpb24uCgpTaWduZWQt
b2ZmLWJ5OiBBbmNoYWwgQWdhcndhbCA8YW5jaGFsYWdAYW1hem9uLmNvbT4KLS0tCiBhcmNoL3g4
Ni94ZW4vZW5saWdodGVuX2h2bS5jIHwgNyArKysrKysrCiBhcmNoL3g4Ni94ZW4veGVuLW9wcy5o
ICAgICAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVu
X2h2bS5jCmluZGV4IGUxMzhmN2RlNTJkMi4uNzViMWVjN2EwZmNkIDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZt
LmMKQEAgLTI3LDYgKzI3LDEzIEBACiAKIHN0YXRpYyB1bnNpZ25lZCBsb25nIHNoYXJlZF9pbmZv
X3BmbjsKIAordm9pZCB4ZW5faHZtX21hcF9zaGFyZWRfaW5mbyh2b2lkKQoreworCXhlbl9odm1f
aW5pdF9zaGFyZWRfaW5mbygpOworCWlmIChzaGFyZWRfaW5mb19wZm4pCisJCUhZUEVSVklTT1Jf
c2hhcmVkX2luZm8gPSBfX3ZhKFBGTl9QSFlTKHNoYXJlZF9pbmZvX3BmbikpOworfQorCiB2b2lk
IHhlbl9odm1faW5pdF9zaGFyZWRfaW5mbyh2b2lkKQogewogCXN0cnVjdCB4ZW5fYWRkX3RvX3Bo
eXNtYXAgeGF0cDsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi94ZW4tb3BzLmggYi9hcmNoL3g4
Ni94ZW4veGVuLW9wcy5oCmluZGV4IDQ1YTQ0MWMzM2Q2ZC4uZDg0YzM1Nzk5NGJkIDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni94ZW4veGVuLW9wcy5oCisrKyBiL2FyY2gveDg2L3hlbi94ZW4tb3BzLmgK
QEAgLTU2LDYgKzU2LDcgQEAgdm9pZCB4ZW5fZW5hYmxlX3N5c2NhbGwodm9pZCk7CiB2b2lkIHhl
bl92Y3B1X3Jlc3RvcmUodm9pZCk7CiAKIHZvaWQgeGVuX2NhbGxiYWNrX3ZlY3Rvcih2b2lkKTsK
K3ZvaWQgeGVuX2h2bV9tYXBfc2hhcmVkX2luZm8odm9pZCk7CiB2b2lkIHhlbl9odm1faW5pdF9z
aGFyZWRfaW5mbyh2b2lkKTsKIHZvaWQgeGVuX3VucGx1Z19lbXVsYXRlZF9kZXZpY2VzKHZvaWQp
OwogCi0tIAoyLjE1LjMuQU1aTgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
