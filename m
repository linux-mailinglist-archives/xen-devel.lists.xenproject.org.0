Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6C515B3BF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 23:32:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j20WJ-0002qC-06; Wed, 12 Feb 2020 22:30:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X/s5=4A=amazon.com=prvs=304f9ffca=anchalag@srs-us1.protection.inumbo.net>)
 id 1j20WH-0002q7-Oi
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 22:30:09 +0000
X-Inumbo-ID: 3993a0bc-4de7-11ea-bc8e-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3993a0bc-4de7-11ea-bc8e-bc764e2007e4;
 Wed, 12 Feb 2020 22:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581546610; x=1613082610;
 h=date:from:to:subject:message-id:mime-version;
 bh=akTZAV+grlU78dn6Z1+WBBfqhjetJKFVvDp992dKcrc=;
 b=uD9t6ffmFLyDB7SzCEfP9/y0Z5130wwhRQwOcVviZJbJlH4At7y3IeGY
 AiVgbdmfOkPR24EmERm7Kf1iMhHPldaZmKCImvKViwHCe1MPgOuoaT5ow
 HloSrGyw8z2NGYMDppOq3HN9qKzpvG7KKPNLsETI0Tiak7IvjgNeyRwiK w=;
IronPort-SDR: DKuXC4xlCSUIPj9ul8xIp6uhnDILF7QL9Mjam9n2eegP2xSoxYYsOjmjus7iKoOEaZJ/eyhUpH
 ya6jnGM6gumA==
X-IronPort-AV: E=Sophos;i="5.70,434,1574121600"; d="scan'208";a="16326996"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 12 Feb 2020 22:30:06 +0000
Received: from EX13MTAUEB002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2C554A2197; Wed, 12 Feb 2020 22:30:04 +0000 (UTC)
Received: from EX13D08UEB003.ant.amazon.com (10.43.60.11) by
 EX13MTAUEB002.ant.amazon.com (10.43.60.12) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:29:35 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08UEB003.ant.amazon.com (10.43.60.11) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 12 Feb 2020 22:29:35 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Wed, 12 Feb 2020 22:29:35 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 36859400D1; Wed, 12 Feb 2020 22:29:35 +0000 (UTC)
Date: Wed, 12 Feb 2020 22:29:35 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.com>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <fllinden@amaozn.com>, <benh@kernel.crashing.org>
Message-ID: <20200212222935.GA3421@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH v3 00/12] Enable PM hibernation on guest VMs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCkkgYW0gc2VuZGluZyBvdXQgYSB2MyB2ZXJzaW9uIG9mIHNlcmllcyBvZiBwYXRjaGVz
IHRoYXQgaW1wbGVtZW50cyBndWVzdApQTSBoaWJlcm5hdGlvbi4KVGhlc2UgZ3Vlc3RzIGFyZSBy
dW5uaW5nIG9uIHhlbiBoeXBlcnZpc29yLiBUaGUgcGF0Y2hlcyBoYWQgYmVlbiB0ZXN0ZWQKYWdh
aW5zdCBtYWluc3RyZWFtIGtlcm5lbC4gRUMyIGluc3RhbmNlIGhpYmVybmF0aW9uIGZlYXR1cmUg
aXMgcHJvdmlkZWQKdG8gdGhlIEFXUyBFQzIgY3VzdG9tZXJzLiBQTSBoaWJlcm5hdGlvbiB1c2Vz
IHN3YXAgc3BhY2UgY2FydmVkIG91dCB3aXRoaW4KdGhlIGd1ZXN0W29yIGNhbiBiZSBhIHNlcGFy
YXRlIHBhcnRpdGlvbl0sIHdoZXJlIGhpYmVybmF0aW9uIGltYWdlIGlzCnN0b3JlZCBhbmQgcmVz
dG9yZWQgZnJvbS4KCkRvaW5nIGd1ZXN0IGhpYmVybmF0aW9uIGRvZXMgbm90IGludm9sdmUgYW55
IHN1cHBvcnQgZnJvbSBoeXBlcnZpc29yIGFuZCAKdGhpcyB3YXkgZ3Vlc3QgaGFzIGNvbXBsZXRl
IGNvbnRyb2wgb3ZlciBpdHMgc3RhdGUuIEluZnJhc3RydWN0dXJlCnJlc3RyaWN0aW9ucyBmb3Ig
c2F2aW5nIHVwIGd1ZXN0IHN0YXRlIGNhbiBiZSBvdmVyY29tZSBieSBndWVzdCBpbml0aWF0ZWQK
aGliZXJuYXRpb24uCgpUaGlzIHNlcmllcyBpbmNsdWRlcyBzb21lIGltcHJvdmVtZW50cyBvdmVy
IFJGQyBzZXJpZXMgc2VudCBsYXN0IHllYXI6Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0wNi9tc2cwMDgyMy5odG1sCgpDaGFuZ2Vsb2cg
djM6CjEuIEZlZWRiYWNrIGZyb20gVjIKMi4gSW50cm9kdWNlZCAyIG5ldyBwYXRjaGVzIGZvciB4
ZW4gc2NoZWQgY2xvY2sgb2Zmc2V0IGZpeAozLiBGaXhlZCBwaXJxIHNodXRkb3duL3Jlc3RvcmUg
aW4gZ2VuZXJpYyBpcnEgc3Vic3lzdGVtCjQuIFNwbGl0IHNhdmUvcmVzdG9yZSBzdGVhbCBjbG9j
ayBwYXRjaGVzIGludG8gMiBmb3IgYmV0dGVyIHJlYWRhYmlsaXR5CgpDaGFuZ2Vsb2cgdjI6CjEu
IFJlbW92ZWQgdGltZW91dC9yZXF1ZXN0IHByZXNlbnQgb24gdGhlIHJpbmcgaW4geGVuLWJsa2Zy
b250IGR1cmluZyBibGtmcm9udCBmcmVlemUKMi4gRml4ZWQgcmVzdG9yaW5nIG9mIFBJUlFzIHdo
aWNoIHdhcyBhcHBhcmVudGx5IHdvcmtpbmcgZm9yIDQuOSBrZXJuZWxzIGJ1dCBub3QgZm9yCm5l
d2VyIGtlcm5lbC4gW0xlZ2FjeSBpcnFzIHdlcmUgbm8gbG9uZ2VyIHJlc3RvcmVkIGFmdGVyIGhp
YmVybmF0aW9uIGludHJvZHVjZWQgd2l0aAp0aGlzIGNvbW1pdCAiMDIwZGI5ZDNjMWRjMCJdCjMu
IE1lcmdlZCBjb3VwbGUgb2YgcmVsYXRlZCBwYXRjaGVzIHRvIG1ha2UgdGhlIGNvZGUgbW9yZSBj
b2hlcmVudCBhbmQgcmVhZGFibGUKNC4gQ29kZSByZWZhY3RvcmluZwo1LiBTY2hlZCBjbG9jayBm
aXggd2hlbiBoaWJlcm5hdGluZyBndWVzdCBpcyB1bmRlciBoZWF2eSBDUFUgbG9hZApOb3RlOiBV
bmRlciB2ZXJ5IHJhcmUgY2lyY3Vtc3RhbmNlcyB3ZSBzZWUgcmVzdW1lIGZhaWx1cmVzIHdpdGgg
S0FTTFIgZW5hYmxlZCBvbmx5Cm9uIHhlbiBpbnN0YW5jZXMuICBXZSBhcmUgcm91Z2hseSBzZWVp
bmcgMyUgZmFpbHVyZXMgWz4xMDAwIHJ1bnNdIHdoZW4gdGVzdGluZyB3aXRoCnZhcmlvdXMgaW5z
dGFuY2Ugc2l6ZXMgYW5kIHNvbWUgd29ya2xvYWQgcnVubmluZyBvbiBlYWNoIGluc3RhbmNlLiBJ
IGFtIGN1cnJlbnRseQppbnZlc3RpZ2F0aW5nIHRoZSBpc3N1ZSBhcyB0byBjb25maXJtIGlmIGl0
cyBhIHhlbiBpc3N1ZSBvciBrZXJuZWwgaXNzdWUuCkhvd2V2ZXIsIGl0IHNob3VsZCBub3QgaG9s
ZCBiYWNrIGFueW9uZSBmcm9tIHJldmlld2luZy9hY2NlcHRpbmcgdGhlc2UgcGF0Y2hlcy4KClRl
c3RpbmcgZG9uZToKQWxsIHRlc3RpbmcgaXMgZG9uZSBmb3IgbXVsdGlwbGUgaGliZXJuYXRpb24g
Y3ljbGUgZm9yIDUuNCBrZXJuZWwgb24gRUMyLgoKVGVzdGluZyBIb3cgdG86Ci0tLS0tLS0tLS0t
LS0tLQpFeGFtcGxlOgpTZXQgdXAgYSBmaWxlLWJhY2tlZCBzd2FwIHNwYWNlLiBTd2FwIGZpbGUg
c2l6ZT49VG90YWwgbWVtb3J5IG9uIHRoZSBzeXN0ZW0Kc3VkbyBkZCBpZj0vZGV2L3plcm8gb2Y9
L3N3YXAgYnM9JCgoIDEwMjQgKiAxMDI0ICkpIGNvdW50PTQwOTYgIyA0MDk2TWlCCnN1ZG8gY2ht
b2QgNjAwIC9zd2FwCnN1ZG8gbWtzd2FwIC9zd2FwCnN1ZG8gc3dhcG9uIC9zd2FwCgpVcGRhdGUg
cmVzdW1lIGRldmljZS9yZXN1bWUgb2Zmc2V0IGluIGdydWIgaWYgdXNpbmcgc3dhcCBmaWxlOgpy
ZXN1bWU9L2Rldi94dmRhMSByZXN1bWVfb2Zmc2V0PTIwMDcwNAoKIEV4ZWN1dGU6Ci0tLS0tLS0t
CnN1ZG8gcG0taGliZXJuYXRlCk9SCmVjaG8gZGlzayA+IC9zeXMvcG93ZXIvc3RhdGUgJiYgZWNo
byByZWJvb3QgPiAvc3lzL3Bvd2VyL2Rpc2sKCkNvbXB1dGUgcmVzdW1lIG9mZnNldCBjb2RlOgoi
CiMhL3Vzci9iaW4vZW52IHB5dGhvbgppbXBvcnQgc3lzCmltcG9ydCBhcnJheQppbXBvcnQgZmNu
dGwKCiNzd2FwIGZpbGUKZiA9IG9wZW4oc3lzLmFyZ3ZbMV0sICdyJykKYnVmID0gYXJyYXkuYXJy
YXkoJ0wnLCBbMF0pCgojRklCTUFQCnJldCA9IGZjbnRsLmlvY3RsKGYuZmlsZW5vKCksIDB4MDEs
IGJ1ZikKcHJpbnQgYnVmWzBdCiIKCkFsZWtzZWkgQmVzb2dvbm92ICgxKToKICBQTSAvIGhpYmVy
bmF0ZTogdXBkYXRlIHRoZSByZXN1bWUgb2Zmc2V0IG9uIFNOQVBTSE9UX1NFVF9TV0FQX0FSRUEK
CkFuY2hhbCBBZ2Fyd2FsICg0KToKICB4ODYveGVuOiBJbnRyb2R1Y2UgbmV3IGZ1bmN0aW9uIHRv
IG1hcCBIWVBFUlZJU09SX3NoYXJlZF9pbmZvIG9uCiAgICBSZXN1bWUKICBnZW5pcnE6IFNodXRk
b3duIGlycSBjaGlwcyBpbiBzdXNwZW5kL3Jlc3VtZSBkdXJpbmcgaGliZXJuYXRpb24KICB4ZW46
IEludHJvZHVjZSB3cmFwcGVyIGZvciBzYXZlL3Jlc3RvcmUgc2NoZWQgY2xvY2sgb2Zmc2V0CiAg
eGVuOiBVcGRhdGUgc2NoZWQgY2xvY2sgb2Zmc2V0IHRvIGF2b2lkIHN5c3RlbSBpbnN0YWJpbGl0
eSBpbgogICAgaGliZXJuYXRpb24KCk11bmVoaXNhIEthbWF0YSAoNyk6CiAgeGVuL21hbmFnZTog
a2VlcCB0cmFjayBvZiB0aGUgb24tZ29pbmcgc3VzcGVuZCBtb2RlCiAgeGVuYnVzOiBhZGQgZnJl
ZXplL3RoYXcvcmVzdG9yZSBjYWxsYmFja3Mgc3VwcG9ydAogIHg4Ni94ZW46IGFkZCBzeXN0ZW0g
Y29yZSBzdXNwZW5kIGFuZCByZXN1bWUgY2FsbGJhY2tzCiAgeGVuLW5ldGZyb250OiBhZGQgY2Fs
bGJhY2tzIGZvciBQTSBzdXNwZW5kIGFuZCBoaWJlcm5hdGlvbiBzdXBwb3J0CiAgeGVuLWJsa2Zy
b250OiBhZGQgY2FsbGJhY2tzIGZvciBQTSBzdXNwZW5kIGFuZCBoaWJlcm5hdGlvbgogIHhlbi90
aW1lOiBpbnRyb2R1Y2UgeGVuX3tzYXZlLHJlc3RvcmV9X3N0ZWFsX2Nsb2NrCiAgeDg2L3hlbjog
c2F2ZSBhbmQgcmVzdG9yZSBzdGVhbCBjbG9jawoKIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZt
LmMgICAgICB8ICAgOCArKwogYXJjaC94ODYveGVuL3N1c3BlbmQuYyAgICAgICAgICAgIHwgIDcy
ICsrKysrKysrKysrKysrKysrKwogYXJjaC94ODYveGVuL3RpbWUuYyAgICAgICAgICAgICAgIHwg
IDE4ICsrKystCiBhcmNoL3g4Ni94ZW4veGVuLW9wcy5oICAgICAgICAgICAgfCAgIDMgKwogZHJp
dmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyAgICAgIHwgMTE5ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKystLQogZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMgICAgICAgIHwgIDk4ICsrKysr
KysrKysrKysrKysrKysrKysrLQogZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMgIHwg
ICAxICsKIGRyaXZlcnMveGVuL21hbmFnZS5jICAgICAgICAgICAgICB8ICA3MyArKysrKysrKysr
KysrKysrKysKIGRyaXZlcnMveGVuL3RpbWUuYyAgICAgICAgICAgICAgICB8ICAyOSArKysrKysr
LQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jIHwgIDk5ICsrKysrKysrKysrKysr
KysrKysrLS0tLS0KIGluY2x1ZGUvbGludXgvaXJxLmggICAgICAgICAgICAgICB8ICAgMiArCiBp
bmNsdWRlL3hlbi94ZW4tb3BzLmggICAgICAgICAgICAgfCAgIDggKysKIGluY2x1ZGUveGVuL3hl
bmJ1cy5oICAgICAgICAgICAgICB8ICAgMyArCiBrZXJuZWwvaXJxL2NoaXAuYyAgICAgICAgICAg
ICAgICAgfCAgIDIgKy0KIGtlcm5lbC9pcnEvaW50ZXJuYWxzLmggICAgICAgICAgICB8ICAgMSAr
CiBrZXJuZWwvaXJxL3BtLmMgICAgICAgICAgICAgICAgICAgfCAgMzEgKysrKystLS0KIGtlcm5l
bC9wb3dlci91c2VyLmMgICAgICAgICAgICAgICB8ICAgNiArLQogMTcgZmlsZXMgY2hhbmdlZCwg
NTMzIGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQoKLS0gCjIuMjQuMS5BTVpOCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
