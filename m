Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705B1337B1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 00:46:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioyWf-0002MJ-MR; Tue, 07 Jan 2020 23:44:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wAzM=24=amazon.com=prvs=268257c0c=anchalag@srs-us1.protection.inumbo.net>)
 id 1ioyWe-0002M3-De
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 23:44:40 +0000
X-Inumbo-ID: abd62df4-31a7-11ea-b56d-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abd62df4-31a7-11ea-b56d-bc764e2007e4;
 Tue, 07 Jan 2020 23:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578440681; x=1609976681;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=f6Z3Yh5Svpg3B2CNoDg+pE4bEOLYIDxF72khvbH/8BY=;
 b=SXuQXWVh1XjD/Vp2upDv4OdTBYzleUMEFOZsIF6Gc8uavRGDhO2OYl5U
 qSgeplhnZTKoMF1CLxoyZclVYlrFKfv7M58LjWK9Zp6c06Gqm0EipigiP
 JwyxJrDMSjd4DrAP35SDrzyRGuYVEbkOWtVppcBMqZxk+2mbhFNE02JoN M=;
IronPort-SDR: VN1Xhl+bt3NNnO0zmMcnfsgfdV3B10I31QHUCoO03TuuoIqc3+CWPtyE1hCWoqAapXVMKhX0hf
 /se6u6x4A+3Q==
X-IronPort-AV: E=Sophos;i="5.69,407,1571702400"; d="scan'208";a="11335463"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 07 Jan 2020 23:44:39 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id 8A5F71A0AC3; Tue,  7 Jan 2020 23:44:36 +0000 (UTC)
Received: from EX13D08UEB003.ant.amazon.com (10.43.60.11) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:44:21 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08UEB003.ant.amazon.com (10.43.60.11) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 23:44:21 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Tue, 7 Jan 2020 23:44:20 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id CE67040E65; Tue,  7 Jan 2020 23:44:20 +0000 (UTC)
Date: Tue, 7 Jan 2020 23:44:20 +0000
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
Message-ID: <20200107234420.GA18738@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH V2 09/11] xen: Clear IRQD_IRQ_STARTED flag
 during shutdown PIRQs
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

c2h1dGRvd25fcGlycSBpcyBpbnZva2VkIGR1cmluZyBoaWJlcm5hdGlvbiBwYXRoIGFuZCBoZW5j
ZQpQSVJRcyBzaG91bGQgYmUgcmVzdGFydGVkIGR1cmluZyByZXN1bWUuCkJlZm9yZSB0aGlzIGNv
bW1pdCcwMjBkYjlkM2MxZGMwYScgeGVuL2V2ZW50czogRml4IGludGVycnVwdCBsb3N0CmR1cmlu
ZyBpcnFfZGlzYWJsZSBhbmQgaXJxX2VuYWJsZSBzdGFydHVwX3BpcnEgd2FzIGF1dG9tYXRpY2Fs
bHkKY2FsbGVkIGR1cmluZyBpcnFfZW5hYmxlIGhvd2V2ZXIsIGFmdGVyIHRoaXMgY29tbWl0IHBp
cnEncyBkaWQgbm90CmdldCBleHBsaWNpdGx5IHN0YXJ0ZWQgb25jZSByZXN1bWVkIGZyb20gaGli
ZXJuYXRpb24uCgpjaGlwLT5pcnFfc3RhcnR1cCBpcyBjYWxsZWQgb25seSBpZiBJUlFEX0lSUV9T
VEFSVEVEIGlzIHVuc2V0IGR1cmluZwppcnFfc3RhcnR1cCBvbiByZXN1bWUuIFRoaXMgZmxhZyBn
ZXRzIGNsZWFyZWQgYnkgZnJlZV9pcnEtPmlycV9zaHV0ZG93bgpkdXJpbmcgc3VzcGVuZC4gZnJl
ZV9pcnEoKSBuZXZlciBnZXRzIGV4cGxpY2l0bHkgY2FsbGVkIGZvciBpb2FwaWMtZWRnZQphbmQg
aW9hcGljLWxldmVsIGludGVycnVwdHMgYXMgcmVzcGVjdGl2ZSBkcml2ZXJzIGRvIG5vdGhpbmcg
ZHVyaW5nCnN1c3BlbmQvcmVzdW1lLiBTbyB3ZSBzaHV0IHRoZW0gZG93biBleHBsaWNpdGx5IGlu
IHRoZSBmaXJzdCBwbGFjZSBpbgpzeXNjb3JlX3N1c3BlbmQgcGF0aCB0byBjbGVhciBJUlE8PmV2
ZW50IGNoYW5uZWwgbWFwcGluZy4gc2h1dGRvd25fcGlycQpiZWluZyBjYWxsZWQgZXhwbGljaXRs
eSBkdXJpbmcgc3VzcGVuZCBkb2VzIG5vdCBjbGVhciB0aGlzIGZsYWdzLCBoZW5jZQouaXJxX2Vu
YWJsZSBpcyBjYWxsZWQgaW4gaXJxX3N0YXJ0dXAgZHVyaW5nIHJlc3VtZSBpbnN0ZWFkIGFuZCBw
aXJxJ3MKbmV2ZXIgc3RhcnQgdXAuCgpTaWduZWQtb2ZmLWJ5OiBBbmNoYWwgQWdhcndhbCA8YW5j
aGFsYWdAYW1hem9uLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYyB8
IDEgKwogaW5jbHVkZS9saW51eC9pcnEuaCAgICAgICAgICAgICAgfCAxICsKIGtlcm5lbC9pcnEv
Y2hpcC5jICAgICAgICAgICAgICAgIHwgMyArKy0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2
ZW50c19iYXNlLmMgYi9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYwppbmRleCBiODkz
NTM2ZDhhZjQuLmFhZTdjNDk5N2I1MSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2
ZW50c19iYXNlLmMKKysrIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKQEAgLTE2
MDYsNiArMTYwNiw3IEBAIHZvaWQgeGVuX3NodXRkb3duX3BpcnFzKHZvaWQpCiAJCQljb250aW51
ZTsKIAogCQlzaHV0ZG93bl9waXJxKGlycV9nZXRfaXJxX2RhdGEoaW5mby0+aXJxKSk7CisJCWly
cV9zdGF0ZV9jbHJfc3RhcnRlZChpcnFfdG9fZGVzYyhpbmZvLT5pcnEpKTsKIAl9CiB9CiAKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaXJxLmggYi9pbmNsdWRlL2xpbnV4L2lycS5oCmluZGV4
IGZiMzAxY2YyOTE0OC4uMWUxMjVjZDIyY2YwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2ly
cS5oCisrKyBiL2luY2x1ZGUvbGludXgvaXJxLmgKQEAgLTc0NSw2ICs3NDUsNyBAQCBleHRlcm4g
aW50IGlycV9zZXRfbXNpX2Rlc2ModW5zaWduZWQgaW50IGlycSwgc3RydWN0IG1zaV9kZXNjICpl
bnRyeSk7CiBleHRlcm4gaW50IGlycV9zZXRfbXNpX2Rlc2Nfb2ZmKHVuc2lnbmVkIGludCBpcnFf
YmFzZSwgdW5zaWduZWQgaW50IGlycV9vZmZzZXQsCiAJCQkJc3RydWN0IG1zaV9kZXNjICplbnRy
eSk7CiBleHRlcm4gc3RydWN0IGlycV9kYXRhICppcnFfZ2V0X2lycV9kYXRhKHVuc2lnbmVkIGlu
dCBpcnEpOworZXh0ZXJuIHZvaWQgaXJxX3N0YXRlX2Nscl9zdGFydGVkKHN0cnVjdCBpcnFfZGVz
YyAqZGVzYyk7CiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0IGlycV9jaGlwICppcnFfZ2V0X2NoaXAo
dW5zaWduZWQgaW50IGlycSkKIHsKZGlmZiAtLWdpdCBhL2tlcm5lbC9pcnEvY2hpcC5jIGIva2Vy
bmVsL2lycS9jaGlwLmMKaW5kZXggYjc2NzAzYjJjMGFmLi4zZThhMzZjNjczZDYgMTAwNjQ0Ci0t
LSBhL2tlcm5lbC9pcnEvY2hpcC5jCisrKyBiL2tlcm5lbC9pcnEvY2hpcC5jCkBAIC0xNzMsMTAg
KzE3MywxMSBAQCBzdGF0aWMgdm9pZCBpcnFfc3RhdGVfY2xyX21hc2tlZChzdHJ1Y3QgaXJxX2Rl
c2MgKmRlc2MpCiAJaXJxZF9jbGVhcigmZGVzYy0+aXJxX2RhdGEsIElSUURfSVJRX01BU0tFRCk7
CiB9CiAKLXN0YXRpYyB2b2lkIGlycV9zdGF0ZV9jbHJfc3RhcnRlZChzdHJ1Y3QgaXJxX2Rlc2Mg
KmRlc2MpCit2b2lkIGlycV9zdGF0ZV9jbHJfc3RhcnRlZChzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2Mp
CiB7CiAJaXJxZF9jbGVhcigmZGVzYy0+aXJxX2RhdGEsIElSUURfSVJRX1NUQVJURUQpOwogfQor
RVhQT1JUX1NZTUJPTF9HUEwoaXJxX3N0YXRlX2Nscl9zdGFydGVkKTsKIAogc3RhdGljIHZvaWQg
aXJxX3N0YXRlX3NldF9zdGFydGVkKHN0cnVjdCBpcnFfZGVzYyAqZGVzYykKIHsKLS0gCjIuMTUu
My5BTVpOCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
