Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A86B01337B4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 00:47:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioyY0-0002aM-Fw; Tue, 07 Jan 2020 23:46:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wAzM=24=amazon.com=prvs=268257c0c=anchalag@srs-us1.protection.inumbo.net>)
 id 1ioyXz-0002aA-9N
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 23:46:03 +0000
X-Inumbo-ID: dcac59ee-31a7-11ea-ad29-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcac59ee-31a7-11ea-ad29-12813bfff9fa;
 Tue, 07 Jan 2020 23:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578440763; x=1609976763;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=C+JaTHQLVFTnM8u9L8ZSkRBth8A1GrfPB1444d3zUEk=;
 b=Sr9NWBfYr6ulkMkmcFHEzSiwvc0g0eAjiTkqpLLBYc2/3t4/dVKFqR95
 Do7mIs2bQBbtpyX5AUEL3C5jVkolmJ6faHxFTbFlZ/Pza6obA4kGp2B5r
 JChND7g4GwILW0PlTH91rspBZ0sB3LgcHihQr23kjXX0aOamypKS61tRf 0=;
IronPort-SDR: tgZkjPccZ3NN32ilYfpUAqXwfPAg3ycN79+7mbg/yBELHAIIAEhZkb41aLfWqiI5YJOmjh5N2D
 RKzL0UoG9vhw==
X-IronPort-AV: E=Sophos;i="5.69,407,1571702400"; 
   d="scan'208";a="8919095"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 07 Jan 2020 23:46:01 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 04022A2516; Tue,  7 Jan 2020 23:45:52 +0000 (UTC)
Received: from EX13D08UEE003.ant.amazon.com (10.43.62.118) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:45:26 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D08UEE003.ant.amazon.com (10.43.62.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:45:26 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Tue, 7 Jan 2020 23:45:26 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 982CE40E65; Tue,  7 Jan 2020 23:45:26 +0000 (UTC)
Date: Tue, 7 Jan 2020 23:45:26 +0000
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
Message-ID: <20200107234526.GA19034@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH V2 11/11] x86: tsc: avoid system instability
 in hibernation
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

RnJvbTogRWR1YXJkbyBWYWxlbnRpbiA8ZWR1dmFsQGFtYXpvbi5jb20+CgpTeXN0ZW0gaW5zdGFi
aWxpdHkgYXJlIHNlZW4gZHVyaW5nIHJlc3VtZSBmcm9tIGhpYmVybmF0aW9uIHdoZW4gc3lzdGVt
CmlzIHVuZGVyIGhlYXZ5IENQVSBsb2FkLiBUaGlzIGlzIGR1ZSB0byB0aGUgbGFjayBvZiB1cGRh
dGUgb2Ygc2NoZWQKY2xvY2sgZGF0YSwgYW5kIHRoZSBzY2hlZHVsZXIgd291bGQgdGhlbiB0aGlu
ayB0aGF0IGhlYXZ5IENQVSBob2cKdGFza3MgbmVlZCBtb3JlIHRpbWUgaW4gQ1BVLCBjYXVzaW5n
IHRoZSBzeXN0ZW0gdG8gZnJlZXplCmR1cmluZyB0aGUgdW5mcmVlemluZyBvZiB0YXNrcy4gRm9y
IGV4YW1wbGUsIHRocmVhZGVkIGlycXMsCmFuZCBrZXJuZWwgcHJvY2Vzc2VzIHNlcnZpY2luZyBu
ZXR3b3JrIGludGVyZmFjZSBtYXkgYmUgZGVsYXllZApmb3Igc2V2ZXJhbCB0ZW5zIG9mIHNlY29u
ZHMsIGNhdXNpbmcgdGhlIHN5c3RlbSB0byBiZSB1bnJlYWNoYWJsZS4KClNpdHVhdGlvbiBsaWtl
IHRoaXMgY2FuIGJlIHJlcG9ydGVkIGJ5IHVzaW5nIGxvY2t1cCBkZXRlY3RvcnMKc3VjaCBhcyB3
b3JrcXVldWUgbG9ja3VwIGRldGVjdG9yczoKCltyb290QGlwLTE3Mi0zMS02Ny0xMTQgZWMyLXVz
ZXJdIyBlY2hvIGRpc2sgPiAvc3lzL3Bvd2VyL3N0YXRlCgpNZXNzYWdlIGZyb20gc3lzbG9nZEBp
cC0xNzItMzEtNjctMTE0IGF0IE1heSAgNyAxODoyMzoyMSAuLi4KIGtlcm5lbDpCVUc6IHdvcmtx
dWV1ZSBsb2NrdXAgLSBwb29sIGNwdXM9MCBub2RlPTAgZmxhZ3M9MHgwIG5pY2U9MCBzdHVjayBm
b3IgNTdzIQoKTWVzc2FnZSBmcm9tIHN5c2xvZ2RAaXAtMTcyLTMxLTY3LTExNCBhdCBNYXkgIDcg
MTg6MjM6MjEgLi4uCiBrZXJuZWw6QlVHOiB3b3JrcXVldWUgbG9ja3VwIC0gcG9vbCBjcHVzPTEg
bm9kZT0wIGZsYWdzPTB4MCBuaWNlPTAgc3R1Y2sgZm9yIDU3cyEKCk1lc3NhZ2UgZnJvbSBzeXNs
b2dkQGlwLTE3Mi0zMS02Ny0xMTQgYXQgTWF5ICA3IDE4OjIzOjIxIC4uLgoga2VybmVsOkJVRzog
d29ya3F1ZXVlIGxvY2t1cCAtIHBvb2wgY3B1cz0zIG5vZGU9MCBmbGFncz0weDEgbmljZT0wIHN0
dWNrIGZvciA1N3MhCgpNZXNzYWdlIGZyb20gc3lzbG9nZEBpcC0xNzItMzEtNjctMTE0IGF0IE1h
eSAgNyAxODoyOTowNiAuLi4KIGtlcm5lbDpCVUc6IHdvcmtxdWV1ZSBsb2NrdXAgLSBwb29sIGNw
dXM9MyBub2RlPTAgZmxhZ3M9MHgxIG5pY2U9MCBzdHVjayBmb3IgNDAzcyEKClRoZSBmaXggZm9y
IHRoaXMgc2l0dWF0aW9uIGlzIHRvIG1hcmsgdGhlIHNjaGVkIGNsb2NrIGFzIHVuc3RhYmxlCmFz
IGVhcmx5IGFzIHBvc3NpYmxlIGluIHRoZSByZXN1bWUgcGF0aCwgbGVhdmluZyBpdCB1bnN0YWJs
ZQpmb3IgdGhlIGR1cmF0aW9uIG9mIHRoZSByZXN1bWUgcHJvY2Vzcy4gVGhpcyB3aWxsIGZvcmNl
IHRoZQpzY2hlZHVsZXIgdG8gYXR0ZW1wdCB0byBhbGlnbiB0aGUgc2NoZWQgY2xvY2sgYWNyb3Nz
IENQVXMgdXNpbmcKdGhlIGRlbHRhIHdpdGggdGltZSBvZiBkYXksIHVwZGF0aW5nIHNjaGVkIGNs
b2NrIGRhdGEuIEluIGEgcG9zdApoaWJlcm5hdGlvbiBldmVudCwgd2UgY2FuIHRoZW4gbWFyayB0
aGUgc2NoZWQgY2xvY2sgYXMgc3RhYmxlCmFnYWluLCBhdm9pZGluZyB1bm5lY2Vzc2FyeSBzeW5j
cyB3aXRoIHRpbWUgb2YgZGF5IG9uIHN5c3RlbXMKaW4gd2hpY2ggVFNDIGlzIHJlbGlhYmxlLgoK
UmV2aWV3ZWQtYnk6IEVyaWsgUXVhbnN0cm9tIDxxdWFuc3Ryb0BhbWF6b24uY29tPgpSZXZpZXdl
ZC1ieTogRnJhbmsgdmFuIGRlciBMaW5kZW4gPGZsbGluZGVuQGFtYXpvbi5jb20+ClJldmlld2Vk
LWJ5OiBCYWxiaXIgU2luZ2ggPHNibGJpckBhbWF6b24uY29tPgpSZXZpZXdlZC1ieTogTXVuZWhp
c2EgS2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20+ClRlc3RlZC1ieTogQW5jaGFsIEFnYXJ3YWwg
PGFuY2hhbGFnQGFtYXpvbi5jb20+ClNpZ25lZC1vZmYtYnk6IEVkdWFyZG8gVmFsZW50aW4gPGVk
dXZhbEBhbWF6b24uY29tPgotLS0KIGFyY2gveDg2L2tlcm5lbC90c2MuYyAgICAgICB8IDI5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L3NjaGVkL2Nsb2NrLmgg
fCAgNSArKysrKwoga2VybmVsL3NjaGVkL2Nsb2NrLmMgICAgICAgIHwgIDQgKystLQogMyBmaWxl
cyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2tlcm5lbC90c2MuYyBiL2FyY2gveDg2L2tlcm5lbC90c2MuYwppbmRleCA3ZTMy
MmUyZGFhZjUuLmFlNzdiOGJjNGU0NiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL3RzYy5j
CisrKyBiL2FyY2gveDg2L2tlcm5lbC90c2MuYwpAQCAtMTQsNiArMTQsNyBAQAogI2luY2x1ZGUg
PGxpbnV4L3BlcmNwdS5oPgogI2luY2x1ZGUgPGxpbnV4L3RpbWV4Lmg+CiAjaW5jbHVkZSA8bGlu
dXgvc3RhdGljX2tleS5oPgorI2luY2x1ZGUgPGxpbnV4L3N1c3BlbmQuaD4KIAogI2luY2x1ZGUg
PGFzbS9ocGV0Lmg+CiAjaW5jbHVkZSA8YXNtL3RpbWVyLmg+CkBAIC0xNTM0LDMgKzE1MzUsMzEg
QEAgdW5zaWduZWQgbG9uZyBjYWxpYnJhdGVfZGVsYXlfaXNfa25vd24odm9pZCkKIAlyZXR1cm4g
MDsKIH0KICNlbmRpZgorCitzdGF0aWMgaW50IHRzY19wbV9ub3RpZmllcihzdHJ1Y3Qgbm90aWZp
ZXJfYmxvY2sgKm5vdGlmaWVyLAorCQkJICAgIHVuc2lnbmVkIGxvbmcgcG1fZXZlbnQsIHZvaWQg
KnVudXNlZCkKK3sKKwlzd2l0Y2ggKHBtX2V2ZW50KSB7CisJY2FzZSBQTV9ISUJFUk5BVElPTl9Q
UkVQQVJFOgorCQljbGVhcl9zY2hlZF9jbG9ja19zdGFibGUoKTsKKwkJYnJlYWs7CisJY2FzZSBQ
TV9QT1NUX0hJQkVSTkFUSU9OOgorCQkvKiBTZXQgYmFjayB0byB0aGUgZGVmYXVsdCAqLworCQlp
ZiAoIWNoZWNrX3RzY191bnN0YWJsZSgpKQorCQkJc2V0X3NjaGVkX2Nsb2NrX3N0YWJsZSgpOwor
CQlicmVhazsKKwl9CisKKwlyZXR1cm4gMDsKK307CisKK3N0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJf
YmxvY2sgdHNjX3BtX25vdGlmaWVyX2Jsb2NrID0geworICAgICAgIC5ub3RpZmllcl9jYWxsID0g
dHNjX3BtX25vdGlmaWVyLAorfTsKKworc3RhdGljIGludCB0c2Nfc2V0dXBfcG1fbm90aWZpZXIo
dm9pZCkKK3sKKyAgICAgICByZXR1cm4gcmVnaXN0ZXJfcG1fbm90aWZpZXIoJnRzY19wbV9ub3Rp
Zmllcl9ibG9jayk7Cit9CisKK3N1YnN5c19pbml0Y2FsbCh0c2Nfc2V0dXBfcG1fbm90aWZpZXIp
OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zY2hlZC9jbG9jay5oIGIvaW5jbHVkZS9saW51
eC9zY2hlZC9jbG9jay5oCmluZGV4IDg2N2Q1ODgzMTRlMC4uOTAyNjU0YWM1ZjdlIDEwMDY0NAot
LS0gYS9pbmNsdWRlL2xpbnV4L3NjaGVkL2Nsb2NrLmgKKysrIGIvaW5jbHVkZS9saW51eC9zY2hl
ZC9jbG9jay5oCkBAIC0zMiw2ICszMiwxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgY2xlYXJfc2No
ZWRfY2xvY2tfc3RhYmxlKHZvaWQpCiB7CiB9CiAKK3N0YXRpYyBpbmxpbmUgdm9pZCBzZXRfc2No
ZWRfY2xvY2tfc3RhYmxlKHZvaWQpCit7Cit9CisKIHN0YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF9j
bG9ja19pZGxlX3NsZWVwX2V2ZW50KHZvaWQpCiB7CiB9CkBAIC01MSw2ICs1NSw3IEBAIHN0YXRp
YyBpbmxpbmUgdTY0IGxvY2FsX2Nsb2NrKHZvaWQpCiB9CiAjZWxzZQogZXh0ZXJuIGludCBzY2hl
ZF9jbG9ja19zdGFibGUodm9pZCk7CitleHRlcm4gdm9pZCBzZXRfc2NoZWRfY2xvY2tfc3RhYmxl
KHZvaWQpOwogZXh0ZXJuIHZvaWQgY2xlYXJfc2NoZWRfY2xvY2tfc3RhYmxlKHZvaWQpOwogCiAv
KgpkaWZmIC0tZ2l0IGEva2VybmVsL3NjaGVkL2Nsb2NrLmMgYi9rZXJuZWwvc2NoZWQvY2xvY2su
YwppbmRleCAxMTUyMjU5YTRjYTAuLjM3NGQ0MGU1YjFhMiAxMDA2NDQKLS0tIGEva2VybmVsL3Nj
aGVkL2Nsb2NrLmMKKysrIGIva2VybmVsL3NjaGVkL2Nsb2NrLmMKQEAgLTExNiw3ICsxMTYsNyBA
QCBzdGF0aWMgdm9pZCBfX3NjZF9zdGFtcChzdHJ1Y3Qgc2NoZWRfY2xvY2tfZGF0YSAqc2NkKQog
CXNjZC0+dGlja19yYXcgPSBzY2hlZF9jbG9jaygpOwogfQogCi1zdGF0aWMgdm9pZCBfX3NldF9z
Y2hlZF9jbG9ja19zdGFibGUodm9pZCkKK3ZvaWQgc2V0X3NjaGVkX2Nsb2NrX3N0YWJsZSh2b2lk
KQogewogCXN0cnVjdCBzY2hlZF9jbG9ja19kYXRhICpzY2Q7CiAKQEAgLTIzNiw3ICsyMzYsNyBA
QCBzdGF0aWMgaW50IF9faW5pdCBzY2hlZF9jbG9ja19pbml0X2xhdGUodm9pZCkKIAlzbXBfbWIo
KTsgLyogbWF0Y2hlcyB7c2V0LGNsZWFyfV9zY2hlZF9jbG9ja19zdGFibGUoKSAqLwogCiAJaWYg
KF9fc2NoZWRfY2xvY2tfc3RhYmxlX2Vhcmx5KQotCQlfX3NldF9zY2hlZF9jbG9ja19zdGFibGUo
KTsKKwkJc2V0X3NjaGVkX2Nsb2NrX3N0YWJsZSgpOwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjE1
LjMuQU1aTgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
