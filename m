Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D347C45FA55
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:28:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233722.405880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmVQ-0007qh-N4; Sat, 27 Nov 2021 01:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233722.405880; Sat, 27 Nov 2021 01:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmVQ-0007fy-5d; Sat, 27 Nov 2021 01:27:56 +0000
Received: by outflank-mailman (input) for mailman id 233722;
 Sat, 27 Nov 2021 01:27:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmSY-0004gG-Ms
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:24:58 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5665c5b-4f20-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 02:24:58 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d5665c5b-4f20-11ec-b941-1df2895da90e
Message-ID: <20211126233124.618283684@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637976297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=db+bEd42/odCLFRuWnqbyMqKNP8CPK8Qgl6k8EnxiD4=;
	b=1JlpTSX4Oy1wxfkRGfi3MFe15urC2p2+OrjfJgRh8RUL+84OSGSciJke659tDU3sGZWAPK
	kl9oaW52ONLaQ3HdTC/tL2eZb0dBKAlCTOBLxqnsHzvTkHnb2zmWh2mf67D0QDpvGh+PDN
	HYafcSl5dWtgEzn6jQ4MFoQ1CykTAYxLJzPL3dhreYF90toQe1lMo8dPAx8l/oXk/4Oe4R
	kAsJxgjoMqD641Zs66b3plcM9681VXaFP2G4W9DXXHvZegFqWPMRjXsdkuu/B4mAqmGsHL
	+nMcmL4XP8tl2H/u4Jfcrn2L2H6APZ9shAZy/iqsDKIBWqfUN22XWDpbzNMYFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637976297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=db+bEd42/odCLFRuWnqbyMqKNP8CPK8Qgl6k8EnxiD4=;
	b=aqqfLHlqslFm90N1E+AAibzpkiPNtQQ0MsJBpzh2OzQqLTRDn821RvKr0rjBDdb4IhJ4XQ
	RhGdp4ZZeW3Q1bBQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Cooper <amc96@cam.ac.uk>,
 Juergen Gross <jgross@suse.com>,
 linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: [patch 00/10] genirq/msi, PCI/MSI: Support for dynamic MSI-X vector
 expansion - Part 4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sat, 27 Nov 2021 02:24:57 +0100 (CET)

VGhpcyBpcyBmaW5hbGx5IHRoZSBwb2ludCB3aGVyZSBkeW5hbWljYWxseSBleHBhbmRpbmcgTVNJ
LVggdmVjdG9ycyBhZnRlcgplbmFibGluZyBNU0ktWCBpcyBpbXBsZW1lbnRlZC4KClRoZSBmaXJz
dCB0aHJlZSBwYXJ0cyBvZiB0aGlzIHdvcmsgY2FuIGJlIGZvdW5kIGhlcmU6CgogICAgaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMTEyNjIyMjcwMC44NjI0MDc5NzdAbGludXRyb25peC5k
ZQogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMTEyNjIyNDEwMC4zMDMwNDY3NDlA
bGludXRyb25peC5kZQogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMTEyNjIzMDk1
Ny4yMzkzOTE3OTlAbGludXRyb25peC5kZQoKVGhpcyBsYXN0IGFuZCBzbWFsbGVzdCBwYXJ0IG9m
IHRoZSBvdmVyYWxsIHNlcmllcyBjb250YWlucyB0aGUgZm9sbG93aW5nCmNoYW5nZXM6CgogICAx
KSBQcmVwYXJlIHRoZSBjb3JlIE1TSSBpcnEgZG9tYWluIGNvZGUgdG8gaGFuZGxlIHJhbmdlIGJh
c2VkIGFsbG9jYXRpb24KICAgICAgYW5kIGZyZWUKCiAgIDIpIFByZXBhcmUgdGhlIFBDSS9NU0kg
Y29kZSB0byBoYW5kbGUgcmFuZ2UgYmFzZWQgYWxsb2NhdGlvbiBhbmQgZnJlZQogIAogICAzKSBJ
bXBsZW1lbnQgYSBuZXcgaW50ZXJmYWNlIHdoaWNoIGFsbG93cyB0byBleHBhbmQgdGhlIE1TSS1Y
IHZlY3RvcgogICAgICBzcGFjZSBhZnRlciBpbml0aWFsaXphdGlvbgoKICAgNCkgRW5hYmxlIHN1
cHBvcnQgZm9yIHRoZSBYODYgUENJL01TSSBpcnEgZG9tYWlucwoKICAgICAgVGhpcyBpcyB1bmZv
cnR1bmF0ZSwgYnV0IHNvbWUgUENJL01TSSBpcnEgZG9tYWluIGltcGxlbWVudGF0aW9ucywKICAg
ICAgZS5nLiBwb3dlcnBjIGFuZCB0aGUgeDg2L1hFTiBpcnFkb21haW4gd3JhcHBlcnMgYXJlIG5v
dCByZWFsbHkgcmVhZHkKICAgICAgdG8gc3VwcG9ydCB0aGlzIG91dCBvZiB0aGUgYm94LgoKICAg
ICAgSSBsb29rZWQgYXQgdGhlIDMwIHBsYWNlcyB3aGljaCBpbXBsZW1lbnQgUENJL01TSSBpcnEg
ZG9tYWlucyBhbmQKICAgICAgbWFueSBvZiB0aGVtIGxvb2sgbGlrZSB0aGV5IGNvdWxkIHN1cHBv
cnQgaXQgb3V0IG9mIHRoZSBib3gsIGJ1dCBhcwogICAgICB3ZSBoYXZlIHR3byB3aGljaCBkZWZp
bml0ZWx5IGRvbid0LCBtYWtpbmcgdGhpcyBvcHQtaW4gaXMgdGhlIG9ubHkKICAgICAgc2FmZSBv
cHRpb24uCgpJJ3ZlIHRlc3RlZCB0aGlzIGJ5IGhhY2tpbmcgdXAgdGhlIFhIQ0kgZHJpdmVyIGFu
ZCBpdCB3b3JrcyBsaWtlIGEgY2hhcm0uCgpUaGVyZSBpcyBjZXJ0YWlubHkgc29tZSBtb3JlIHJv
b20gZm9yIGNvbnNvbGlkYXRpbmcgdGhlIFBDSS9NU0ktWCB1c2FnZSBpbgpkcml2ZXJzLCBpLmUu
IGdldHRpbmcgcmlkIG9mIHBjaV9lbmFibGVfbXNpeCooKSwgYnV0IHRoaXMgd291bGQgaGF2ZSBt
YWRlCnRoaXMgc2VyaWVzIGV2ZW4gbGFyZ2VyIGFuZCBpcyBhbiBvcnRob2dvbmFsIGlzc3VlLgoK
VGhlIHNlcmllcyBpcyBiYXNlZCBvbjoKCiAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3RnbHgvZGV2ZWwuZ2l0IG1zaS12MS1wYXJ0LTMKCmFuZCBhbHNv
IGF2YWlsYWJsZSBmcm9tIGdpdDoKCiAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RnbHgvZGV2ZWwuZ2l0IG1zaS12MS1wYXJ0LTQKClRoYW5rcywKCgl0
Z2x4Ci0tLQogYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL21zaS5jIHwgICAgNiArLQog
YXJjaC94ODYva2VybmVsL2FwaWMvbXNpLmMgICAgICAgICAgIHwgICAgNCAtCiBhcmNoL3g4Ni9w
Y2kveGVuLmMgICAgICAgICAgICAgICAgICAgfCAgIDEwICstLQogZHJpdmVycy9iYXNlL3BsYXRm
b3JtLW1zaS5jICAgICAgICAgIHwgICAgMyAtCiBkcml2ZXJzL3BjaS9tc2kvaXJxZG9tYWluLmMg
ICAgICAgICAgfCAgIDM5ICsrKysrKysrKystLS0tCiBkcml2ZXJzL3BjaS9tc2kvbXNpLmMgICAg
ICAgICAgICAgICAgfCAgIDk3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiBk
cml2ZXJzL3BjaS9tc2kvbXNpLmggICAgICAgICAgICAgICAgfCAgICA0IC0KIGluY2x1ZGUvbGlu
dXgvbXNpLmggICAgICAgICAgICAgICAgICB8ICAgNDYgKysrKysrKysrKystLS0tLQogaW5jbHVk
ZS9saW51eC9wY2kuaCAgICAgICAgICAgICAgICAgIHwgICAxMyArKysrCiBrZXJuZWwvaXJxL21z
aS5jICAgICAgICAgICAgICAgICAgICAgfCAgIDc1ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LQogMTAgZmlsZXMgY2hhbmdlZCwgMjA4IGluc2VydGlvbnMoKyksIDg5IGRlbGV0aW9ucygtKQo=

