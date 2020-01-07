Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E601337A9
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 00:46:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioyWC-0002HK-Aq; Tue, 07 Jan 2020 23:44:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wAzM=24=amazon.com=prvs=268257c0c=anchalag@srs-us1.protection.inumbo.net>)
 id 1ioyWA-0002H9-P2
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 23:44:10 +0000
X-Inumbo-ID: 9a4076da-31a7-11ea-ad29-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a4076da-31a7-11ea-ad29-12813bfff9fa;
 Tue, 07 Jan 2020 23:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578440651; x=1609976651;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=UUoiDw62OaoiuTXALuZgpOAThPO4x4J408qVWSCrhCo=;
 b=GfWrrNV2VJSABiPsfHMNBLeuTbsJZdig1Bp+3MIuEodbk7V6LKla8qp0
 SQV6qccfLmUQkYxSLYYb86InG9XGgr+fKZtgnUhZ8RyKHiO0Plb5rqkqm
 kLZgFPoa+U73iThIQKBX/MXBGpjiJULDaKjfZ36r2oRfCQRrhkKc2zlCj U=;
IronPort-SDR: isxIpuJEy/UGoJ7F3jCaH/LivfpJTT57vE63npovTgLeuI1NC402U0z8/k1z0K0aWtOUJYTNvY
 USeGTNst5HPQ==
X-IronPort-AV: E=Sophos;i="5.69,407,1571702400"; d="scan'208";a="11335420"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 07 Jan 2020 23:44:11 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id 14441A29F4; Tue,  7 Jan 2020 23:44:09 +0000 (UTC)
Received: from EX13D05UWC002.ant.amazon.com (10.43.162.92) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:43:47 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC002.ant.amazon.com (10.43.162.92) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:43:47 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Tue, 7 Jan 2020 23:43:47 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id B359440E65; Tue,  7 Jan 2020 23:43:47 +0000 (UTC)
Date: Tue, 7 Jan 2020 23:43:47 +0000
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
Message-ID: <20200107234347.GA18699@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH V2 08/11] x86/xen: close event channels for
 PIRQs in system core suspend callback
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

RnJvbTogTXVuZWhpc2EgS2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20+CgpUaGVyZSBhcmUgbm8g
cG0gaGFuZGxlcnMgZm9yIHRoZSBsZWdhY3kgZGV2aWNlcywgc28gZHVyaW5nIHRlYXIgZG93bgpz
dGFsZSBldmVudCBjaGFubmVsIDw+IElSUSBtYXBwaW5nIG1heSBzdGlsbCByZW1haW4gaW4gdGhl
IGltYWdlIGFuZCByZXN1bWUKbWF5IGZhaWwuIFRvIGF2b2lkIGFkZGluZyBtdWNoIGNvZGUgYnkg
aW1wbGVtZW50aW5nIGhhbmRsZXJzIGZvciBsZWdhY3kKZGV2aWNlcywgYWRkIGEgc2ltcGxlIGhl
bHBlciBmdW5jdGlvbiB0byAic2h1dGRvd24iIGFjdGl2ZSBQSVJRcywgd2hpY2gKYWN0dWFsbHkg
Y2xvc2VzIGV2ZW50IGNoYW5uZWxzIGJ1dCBrZWVwcyByZWxhdGVkIElSUSBzdHJ1Y3R1cmVzIGlu
dGFjdC4KUE0gc3VzcGVuZC9oaWJlcm5hdGlvbiBjb2RlIHdpbGwgcmVseSBvbiB0aGlzLgpDbG9z
ZSBldmVudCBjaGFubmVscyBhbGxvY2F0ZWQgZm9yIGRldmljZXMgd2hpY2ggYXJlIGJhY2tlZCBi
eSBQSVJRIGFuZApzdGlsbCBhY3RpdmUgd2hlbiBzdXNwZW5kaW5nIHRoZSBzeXN0ZW0gY29yZS4g
Tm9ybWFsbHksIHRoZSBkZXZpY2VzIGFyZQplbXVsYXRlZCBsZWdhY3kgZGV2aWNlcywgZS5nLiBQ
Uy8yIGtleWJvYXJkLCBmbG9wcHkgY29udHJvbGxlciBhbmQgZXRjLgpXaXRob3V0IHRoaXMsIGlu
IFBNIGhpYmVybmF0aW9uLCBpbmZvcm1hdGlvbiBhYm91dCB0aGUgZXZlbnQgY2hhbm5lbApyZW1h
aW5zIGluIGhpYmVybmF0aW9uIGltYWdlLCBidXQgdGhlcmUgaXMgbm8gZ3VhcmFudGVlIHRoYXQg
dGhlIHNhbWUKZXZlbnQgY2hhbm5lbCBudW1iZXJzIGFyZSBhc3NpZ25lZCB0byB0aGUgZGV2aWNl
cyB3aGVuIHJlc3RvcmluZyB0aGUKc3lzdGVtLiBUaGlzIG1heSBjYXVzZSBjb25mbGljdCBsaWtl
IHRoZSBmb2xsb3dpbmcgYW5kIHByZXZlbnQgc29tZQpkZXZpY2VzIGZyb20gYmVpbmcgcmVzdG9y
ZWQgY29ycmVjdGx5LgoKWyAgMTAyLjMzMDgyMV0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0t
LS0tLS0tLS0tClsgIDEwMi4zMzMyNjRdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDIzMjQgYXQKZHJp
dmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmM6ODc4IGJpbmRfZXZ0Y2huX3RvX2lycSsweDg4
LzB4ZjAKLi4uClsgIDEwMi4zNDgwNTddIENhbGwgVHJhY2U6ClsgIDEwMi4zNDgwNTddICBbPGZm
ZmZmZmZmODEzMDAxZGY+XSBkdW1wX3N0YWNrKzB4NjMvMHg4NApbICAxMDIuMzQ4MDU3XSAgWzxm
ZmZmZmZmZjgxMDcxODExPl0gX193YXJuKzB4ZDEvMHhmMApbICAxMDIuMzQ4MDU3XSAgWzxmZmZm
ZmZmZjgxMDcxOGZkPl0gd2Fybl9zbG93cGF0aF9udWxsKzB4MWQvMHgyMApbICAxMDIuMzQ4MDU3
XSAgWzxmZmZmZmZmZjgxMzlhMWY4Pl0gYmluZF9ldnRjaG5fdG9faXJxKzB4ODgvMHhmMApbICAx
MDIuMzQ4MDU3XSAgWzxmZmZmZmZmZmEwMGNkNDIwPl0gPyBibGtpZl9jb3B5X2Zyb21fZ3JhbnQr
MHhiMC8weGIwIFt4ZW5fYmxrZnJvbnRdClsgIDEwMi4zNDgwNTddICBbPGZmZmZmZmZmODEzOWEz
MDc+XSBiaW5kX2V2dGNobl90b19pcnFoYW5kbGVyKzB4MjcvMHg4MApbICAxMDIuMzQ4MDU3XSAg
WzxmZmZmZmZmZmEwMGNjNzg1Pl0gdGFsa190b19ibGtiYWNrKzB4NDI1LzB4Y2QwIFt4ZW5fYmxr
ZnJvbnRdClsgIDEwMi4zNDgwNTddICBbPGZmZmZmZmZmODExZTBjOGE+XSA/IF9fa21hbGxvYysw
eDFlYS8weDIwMApbICAxMDIuMzQ4MDU3XSAgWzxmZmZmZmZmZmEwMGNlODRkPl0gYmxrZnJvbnRf
cmVzdG9yZSsweDJkLzB4NjAgW3hlbl9ibGtmcm9udF0KWyAgMTAyLjM0ODA1N10gIFs8ZmZmZmZm
ZmY4MTNhMDA3OD5dIHhlbmJ1c19kZXZfcmVzdG9yZSsweDU4LzB4MTAwClsgIDEwMi4zNDgwNTdd
ICBbPGZmZmZmZmZmODEzYTFmZjA+XSA/ICB4ZW5idXNfZnJvbnRlbmRfZGVsYXllZF9yZXN1bWUr
MHgyMC8weDIwClsgIDEwMi4zNDgwNTddICBbPGZmZmZmZmZmODEzYTIwMGU+XSB4ZW5idXNfZGV2
X2NvbmRfcmVzdG9yZSsweDFlLzB4MzAKWyAgMTAyLjM0ODA1N10gIFs8ZmZmZmZmZmY4MTNmNzk3
ZT5dIGRwbV9ydW5fY2FsbGJhY2srMHg0ZS8weDEzMApbICAxMDIuMzQ4MDU3XSAgWzxmZmZmZmZm
ZjgxM2Y3ZjE3Pl0gZGV2aWNlX3Jlc3VtZSsweGU3LzB4MjEwClsgIDEwMi4zNDgwNTddICBbPGZm
ZmZmZmZmODEzZjc4MTA+XSA/IHBtX2Rldl9kYmcrMHg4MC8weDgwClsgIDEwMi4zNDgwNTddICBb
PGZmZmZmZmZmODEzZjkzNzQ+XSBkcG1fcmVzdW1lKzB4MTE0LzB4MmYwClsgIDEwMi4zNDgwNTdd
ICBbPGZmZmZmZmZmODEwYzAwY2Y+XSBoaWJlcm5hdGlvbl9zbmFwc2hvdCsweDE1Zi8weDM4MApb
ICAxMDIuMzQ4MDU3XSAgWzxmZmZmZmZmZjgxMGMwYWMzPl0gaGliZXJuYXRlKzB4MTgzLzB4Mjkw
ClsgIDEwMi4zNDgwNTddICBbPGZmZmZmZmZmODEwYmUxYWY+XSBzdGF0ZV9zdG9yZSsweGNmLzB4
ZTAKWyAgMTAyLjM0ODA1N10gIFs8ZmZmZmZmZmY4MTMwMjBiZj5dIGtvYmpfYXR0cl9zdG9yZSsw
eGYvMHgyMApbICAxMDIuMzQ4MDU3XSAgWzxmZmZmZmZmZjgxMjdjODhhPl0gc3lzZnNfa2Zfd3Jp
dGUrMHgzYS8weDUwClsgIDEwMi4zNDgwNTddICBbPGZmZmZmZmZmODEyN2MzYmI+XSBrZXJuZnNf
Zm9wX3dyaXRlKzB4MTBiLzB4MTkwClsgIDEwMi4zNDgwNTddICBbPGZmZmZmZmZmODEyMDAwMDg+
XSBfX3Zmc193cml0ZSsweDI4LzB4MTIwClsgIDEwMi4zNDgwNTddICBbPGZmZmZmZmZmODEyMDBj
MTk+XSA/IHJ3X3ZlcmlmeV9hcmVhKzB4NDkvMHhiMApbICAxMDIuMzQ4MDU3XSAgWzxmZmZmZmZm
ZjgxMjAwZTYyPl0gdmZzX3dyaXRlKzB4YjIvMHgxYjAKWyAgMTAyLjM0ODA1N10gIFs8ZmZmZmZm
ZmY4MTIwMjE5Nj5dIFN5U193cml0ZSsweDQ2LzB4YTAKWyAgMTAyLjM0ODA1N10gIFs8ZmZmZmZm
ZmY4MTUyMGNmNz5dIGVudHJ5X1NZU0NBTExfNjRfZmFzdHBhdGgrMHgxYS8weGE5ClsgIDEwMi40
MjMwMDVdIC0tLVsgZW5kIHRyYWNlIGI4ZDY3MThlMjJlMmIxMDcgXS0tLQpbICAxMDIuNDI1MDMx
XSBnZW5pcnE6IEZsYWdzIG1pc21hdGNoIGlycSA2LiAwMDAwMDAwMCAoYmxraWYpIHZzLiAwMDAw
MDAwMCAoZmxvcHB5KQoKTm90ZSB0aGF0IHdlIGRvbid0IGV4cGxpY2l0bHkgcmUtYWxsb2NhdGUg
ZXZlbnQgY2hhbm5lbHMgZm9yIHN1Y2gKZGV2aWNlcyBpbiB0aGUgcmVzdW1lIGNhbGxiYWNrLiBS
ZS1hbGxvY2F0aW9uIHdpbGwgb2NjdXIgd2hlbiBQTSBjb3JlCnJlLWVuYWJsZSBJUlFzIGZvciB0
aGUgZGV2aWNlcyBhdCBsYXRlciBwb2ludC4KClNpZ25lZC1vZmYtYnk6IE11bmVoaXNhIEthbWF0
YSA8a2FtYXRhbUBhbWF6b24uY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmNoYWwgQWdhcndhbCA8YW5j
aGFsYWdAYW1hem9uLmNvbT4KLS0tCiBhcmNoL3g4Ni94ZW4vc3VzcGVuZC5jICAgICAgICAgICB8
ICAyICsrCiBkcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYyB8IDEyICsrKysrKysrKysr
KwogaW5jbHVkZS94ZW4vZXZlbnRzLmggICAgICAgICAgICAgfCAgMSArCiAzIGZpbGVzIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vc3VzcGVuZC5j
IGIvYXJjaC94ODYveGVuL3N1c3BlbmQuYwppbmRleCBkYWUwZjc0ZjUzOTAuLmFmZmE2M2Q0YjZi
ZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL3N1c3BlbmQuYworKysgYi9hcmNoL3g4Ni94ZW4v
c3VzcGVuZC5jCkBAIC0xMDUsNiArMTA1LDggQEAgc3RhdGljIGludCB4ZW5fc3lzY29yZV9zdXNw
ZW5kKHZvaWQpCiAJCXhlbl9zYXZlX3N0ZWFsX2Nsb2NrKGNwdSk7CiAJfQogCisJeGVuX3NodXRk
b3duX3BpcnFzKCk7CisKIAl4cmZwLmRvbWlkID0gRE9NSURfU0VMRjsKIAl4cmZwLmdwZm4gPSBf
X3BhKEhZUEVSVklTT1Jfc2hhcmVkX2luZm8pID4+IFBBR0VfU0hJRlQ7CiAKZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2
ZW50c19iYXNlLmMKaW5kZXggNTY5NDM3YzE1OGNhLi5iODkzNTM2ZDhhZjQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCisrKyBiL2RyaXZlcnMveGVuL2V2ZW50
cy9ldmVudHNfYmFzZS5jCkBAIC0xNTk3LDYgKzE1OTcsMTggQEAgdm9pZCB4ZW5faXJxX3Jlc3Vt
ZSh2b2lkKQogCXJlc3RvcmVfcGlycXMoKTsKIH0KIAordm9pZCB4ZW5fc2h1dGRvd25fcGlycXMo
dm9pZCkKK3sKKwlzdHJ1Y3QgaXJxX2luZm8gKmluZm87CisKKwlsaXN0X2Zvcl9lYWNoX2VudHJ5
KGluZm8sICZ4ZW5faXJxX2xpc3RfaGVhZCwgbGlzdCkgeworCQlpZiAoaW5mby0+dHlwZSAhPSBJ
UlFUX1BJUlEgfHwgIVZBTElEX0VWVENITihpbmZvLT5ldnRjaG4pKQorCQkJY29udGludWU7CisK
KwkJc2h1dGRvd25fcGlycShpcnFfZ2V0X2lycV9kYXRhKGluZm8tPmlycSkpOworCX0KK30KKwog
c3RhdGljIHN0cnVjdCBpcnFfY2hpcCB4ZW5fZHluYW1pY19jaGlwIF9fcmVhZF9tb3N0bHkgPSB7
CiAJLm5hbWUJCQk9ICJ4ZW4tZHluIiwKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4vZXZlbnRz
LmggYi9pbmNsdWRlL3hlbi9ldmVudHMuaAppbmRleCBjMGU2YTA1OTgzOTcuLjM5YjJjNGU0ZDJl
ZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS94ZW4vZXZlbnRzLmgKKysrIGIvaW5jbHVkZS94ZW4vZXZl
bnRzLmgKQEAgLTcxLDYgKzcxLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIG5vdGlmeV9yZW1vdGVf
dmlhX2V2dGNobihpbnQgcG9ydCkKIHZvaWQgbm90aWZ5X3JlbW90ZV92aWFfaXJxKGludCBpcnEp
OwogCiB2b2lkIHhlbl9pcnFfcmVzdW1lKHZvaWQpOwordm9pZCB4ZW5fc2h1dGRvd25fcGlycXMo
dm9pZCk7CiAKIC8qIENsZWFyIGFuIGlycSdzIHBlbmRpbmcgc3RhdGUsIGluIHByZXBhcmF0aW9u
IGZvciBwb2xsaW5nIG9uIGl0ICovCiB2b2lkIHhlbl9jbGVhcl9pcnFfcGVuZGluZyhpbnQgaXJx
KTsKLS0gCjIuMTUuMy5BTVpOCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
