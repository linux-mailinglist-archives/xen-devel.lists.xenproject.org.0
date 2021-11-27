Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CF945F992
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:24:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233606.405459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmS9-0003xP-Dm; Sat, 27 Nov 2021 01:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233606.405459; Sat, 27 Nov 2021 01:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmS9-0003v2-AH; Sat, 27 Nov 2021 01:24:33 +0000
Received: by outflank-mailman (input) for mailman id 233606;
 Sat, 27 Nov 2021 01:24:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmS8-0003uw-8n
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:24:32 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c572d563-4f20-11ec-9787-a32c541c8605;
 Sat, 27 Nov 2021 02:24:31 +0100 (CET)
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
X-Inumbo-ID: c572d563-4f20-11ec-9787-a32c541c8605
Message-ID: <20211126233124.618283684@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637976270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cXwN7LAx6ag9HOMQtjLd6VTeK3zX6xCMXFRxvs6U6Qg=;
	b=14q4wOfG/0/SZhjwir+cQHJgN4Eo+aHBwW3N78dcnYHDysV9Oh1NWZqgJ4JuWR/baa9D2Z
	NGYz0nAYpGfPsHFUlg5IrQQTw+vEwwj30OLhvIpllXtuE9HgIXHfbE7EEDVm3GOiGHYHbG
	QKUA3MpESWpx/pP4hwDMPtsbETljzTerGL18EUZQZo3hOmbv8495iEjfmpSrxIhYVTmU9q
	Y+ipEcdCu43SMNRGBKk3j3+5hGIz1q5c7m+vCiYI5CvegGVw6Zpl6rZNHHG7P6my+qeA/L
	PXiEE2W/Cgvup0+A3VLyLKTee/d5AKafHg/Uir8yQD0wfIFbtg/4DTAu6ZhMxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637976270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cXwN7LAx6ag9HOMQtjLd6VTeK3zX6xCMXFRxvs6U6Qg=;
	b=KO4VdGK/spEZe2s55ufjJGfc/FG3K9/3AjsE6hAK9UTesq2K2rALdyStZ/xDIu23Rs4Tjf
	UmIDWC9TXBsCnuCA==
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
Date: Sat, 27 Nov 2021 02:24:30 +0100 (CET)

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
YWRlCnRoaXMgb3ZlcmFsbCBzZXJpZXMgZXZlbiBsYXJnZXIgYW5kIGlzIGFuIG9ydGhvZ29uYWwg
aXNzdWUuCgpUaGlzIGZvdXJ0aCBzZXJpZXMgaXMgYmFzZWQgb246CgogICAgIGdpdDovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90Z2x4L2RldmVsLmdpdCBtc2ktdjEt
cGFydC0zCgphbmQgYWxzbyBhdmFpbGFibGUgZnJvbSBnaXQ6CgogICAgIGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90Z2x4L2RldmVsLmdpdCBtc2ktdjEtcGFy
dC00CgpUaGFua3MsCgoJdGdseAotLS0KIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9t
c2kuYyB8ICAgIDYgKy0KIGFyY2gveDg2L2tlcm5lbC9hcGljL21zaS5jICAgICAgICAgICB8ICAg
IDQgLQogYXJjaC94ODYvcGNpL3hlbi5jICAgICAgICAgICAgICAgICAgIHwgICAxMCArLS0KIGRy
aXZlcnMvYmFzZS9wbGF0Zm9ybS1tc2kuYyAgICAgICAgICB8ICAgIDMgLQogZHJpdmVycy9wY2kv
bXNpL2lycWRvbWFpbi5jICAgICAgICAgIHwgICAzOSArKysrKysrKysrLS0tLQogZHJpdmVycy9w
Y2kvbXNpL21zaS5jICAgICAgICAgICAgICAgIHwgICA5NyArKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLQogZHJpdmVycy9wY2kvbXNpL21zaS5oICAgICAgICAgICAgICAgIHwgICAg
NCAtCiBpbmNsdWRlL2xpbnV4L21zaS5oICAgICAgICAgICAgICAgICAgfCAgIDQ2ICsrKysrKysr
KysrLS0tLS0KIGluY2x1ZGUvbGludXgvcGNpLmggICAgICAgICAgICAgICAgICB8ICAgMTMgKysr
Kwoga2VybmVsL2lycS9tc2kuYyAgICAgICAgICAgICAgICAgICAgIHwgICA3NSArKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0KIDEwIGZpbGVzIGNoYW5nZWQsIDIwOCBpbnNlcnRpb25zKCspLCA4
OSBkZWxldGlvbnMoLSkK

