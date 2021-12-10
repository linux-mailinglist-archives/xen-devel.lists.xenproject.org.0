Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6274470DC2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 23:27:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244426.422947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoMS-0004j3-8i; Fri, 10 Dec 2021 22:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244426.422947; Fri, 10 Dec 2021 22:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoMR-0004Zl-RL; Fri, 10 Dec 2021 22:27:27 +0000
Received: by outflank-mailman (input) for mailman id 244426;
 Fri, 10 Dec 2021 22:27:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8/=Q3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvoEd-0005LR-HP
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 22:19:23 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a1474a6-5a07-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 23:19:22 +0100 (CET)
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
X-Inumbo-ID: 3a1474a6-5a07-11ec-ad7a-b7ef48004f0a
Message-ID: <20211210221814.720998720@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639174762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=Y/E/KkLUpd9rNPfDA/zqSwkvkNwtu0uG/q7moMbC6t8=;
	b=Q1loFyA5IlQ3aytzC+w8agXNpV+7qVzWLLt7gFAxD1uipRckq4A63ZDFlRGCLHiD1WXBCo
	w0KWYnAWbGzEZr/4SWaOTeEwWKw1e6hopGrKVSpqVp8bGWUD/cv86yFjYBjUcnEWdvHY3D
	rgx+tAv/GXM3Dr6QCsae7PjKT265v4cKhrWCbRIUXyRZCJMPv6JLxGPJrWrAjiLYk/CNRO
	jYnVtNkau0JyAHELKfNmrLSzDJz7ygURO1IyC5xhunTeJMWngrOu1RR1+HfWrbASO2qYnr
	hwv0O1X8uqWQklUq1DIP73U0V3zNDPJE2TlYjxuEWKoOXEF+hR4iuFZes26TAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639174762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=Y/E/KkLUpd9rNPfDA/zqSwkvkNwtu0uG/q7moMbC6t8=;
	b=6NW6+PSI7SpPEo0Bw1CpABwRumr4UbWMvCiNUQ1PxVZXboG1DTempdK99XRytho0lXor9m
	bf7Awa33UAb9FuCg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org,
 Cedric Le Goater <clg@kaod.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Sinan Kaya <okaya@kernel.org>
Subject: [patch V3 25/35] powerpc/pseries/msi: Let core code check for
 contiguous entries
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 10 Dec 2021 23:19:22 +0100 (CET)

RnJvbTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CgpTZXQgdGhlIGRvbWFp
biBpbmZvIGZsYWcgYW5kIHJlbW92ZSB0aGUgY2hlY2suCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
R2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KUmV2aWV3ZWQtYnk6IEdyZWcgS3JvYWgtSGFy
dG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNjOiBNaWNoYWVsIEVsbGVybWFuIDxt
cGVAZWxsZXJtYW4uaWQuYXU+CkNjOiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5l
bC5jcmFzaGluZy5vcmc+CkNjOiAiQ8OpZHJpYyBMZSBHb2F0ZXIiIDxjbGdAa2FvZC5vcmc+CkNj
OiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwoKLS0tClYyOiBSZW1vdmUgaXQgY29tcGxl
dGVseSAtIENlZHJpYwotLS0KIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9tc2kuYyB8
ICAgMzMgKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKCi0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0
Zm9ybXMvcHNlcmllcy9tc2kuYworKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMv
bXNpLmMKQEAgLTMyMSwyNyArMzIxLDYgQEAgc3RhdGljIGludCBtc2lfcXVvdGFfZm9yX2Rldmlj
ZShzdHJ1Y3QgcAogCXJldHVybiByZXF1ZXN0OwogfQogCi1zdGF0aWMgaW50IGNoZWNrX21zaXhf
ZW50cmllcyhzdHJ1Y3QgcGNpX2RldiAqcGRldikKLXsKLQlzdHJ1Y3QgbXNpX2Rlc2MgKmVudHJ5
OwotCWludCBleHBlY3RlZDsKLQotCS8qIFRoZXJlJ3Mgbm8gd2F5IGZvciB1cyB0byBleHByZXNz
IHRvIGZpcm13YXJlIHRoYXQgd2Ugd2FudAotCSAqIGEgZGlzY29udGlndW91cywgb3Igbm9uLXpl
cm8gYmFzZWQsIHJhbmdlIG9mIE1TSS1YIGVudHJpZXMuCi0JICogU28gd2UgbXVzdCByZWplY3Qg
c3VjaCByZXF1ZXN0cy4gKi8KLQotCWV4cGVjdGVkID0gMDsKLQlmb3JfZWFjaF9wY2lfbXNpX2Vu
dHJ5KGVudHJ5LCBwZGV2KSB7Ci0JCWlmIChlbnRyeS0+bXNpX2luZGV4ICE9IGV4cGVjdGVkKSB7
Ci0JCQlwcl9kZWJ1ZygicnRhc19tc2k6IGJhZCBNU0ktWCBlbnRyaWVzLlxuIik7Ci0JCQlyZXR1
cm4gLUVJTlZBTDsKLQkJfQotCQlleHBlY3RlZCsrOwotCX0KLQotCXJldHVybiAwOwotfQotCiBz
dGF0aWMgdm9pZCBydGFzX2hhY2tfMzJiaXRfbXNpX2dlbjIoc3RydWN0IHBjaV9kZXYgKnBkZXYp
CiB7CiAJdTMyIGFkZHJfaGksIGFkZHJfbG87CkBAIC0zODAsOSArMzU5LDYgQEAgc3RhdGljIGlu
dCBydGFzX3ByZXBhcmVfbXNpX2lycXMoc3RydWN0CiAJaWYgKHF1b3RhICYmIHF1b3RhIDwgbnZl
YykKIAkJcmV0dXJuIHF1b3RhOwogCi0JaWYgKHR5cGUgPT0gUENJX0NBUF9JRF9NU0lYICYmIGNo
ZWNrX21zaXhfZW50cmllcyhwZGV2KSkKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KIAkvKgogCSAqIEZp
cm13YXJlIGN1cnJlbnRseSByZWZ1c2UgYW55IG5vbiBwb3dlciBvZiB0d28gYWxsb2NhdGlvbgog
CSAqIHNvIHdlIHJvdW5kIHVwIGlmIHRoZSBxdW90YSB3aWxsIGFsbG93IGl0LgpAQCAtNTI5LDkg
KzUwNSwxNiBAQCBzdGF0aWMgc3RydWN0IGlycV9jaGlwIHBzZXJpZXNfcGNpX21zaV9pCiAJLmly
cV93cml0ZV9tc2lfbXNnCT0gcHNlcmllc19tc2lfd3JpdGVfbXNnLAogfTsKIAorCisvKgorICog
U2V0IE1TSV9GTEFHX01TSVhfQ09OVElHVU9VUyBhcyB0aGVyZSBpcyBubyB3YXkgdG8gZXhwcmVz
cyB0bworICogZmlybXdhcmUgdG8gcmVxdWVzdCBhIGRpc2NvbnRpZ3VvdXMgb3Igbm9uLXplcm8g
YmFzZWQgcmFuZ2Ugb2YKKyAqIE1TSS1YIGVudHJpZXMuIENvcmUgY29kZSB3aWxsIHJlamVjdCBz
dWNoIHNldHVwIGF0dGVtcHRzLgorICovCiBzdGF0aWMgc3RydWN0IG1zaV9kb21haW5faW5mbyBw
c2VyaWVzX21zaV9kb21haW5faW5mbyA9IHsKIAkuZmxhZ3MgPSAoTVNJX0ZMQUdfVVNFX0RFRl9E
T01fT1BTIHwgTVNJX0ZMQUdfVVNFX0RFRl9DSElQX09QUyB8Ci0JCSAgTVNJX0ZMQUdfTVVMVElf
UENJX01TSSAgfCBNU0lfRkxBR19QQ0lfTVNJWCksCisJCSAgTVNJX0ZMQUdfTVVMVElfUENJX01T
SSAgfCBNU0lfRkxBR19QQ0lfTVNJWCB8CisJCSAgTVNJX0ZMQUdfTVNJWF9DT05USUdVT1VTKSwK
IAkub3BzICAgPSAmcHNlcmllc19wY2lfbXNpX2RvbWFpbl9vcHMsCiAJLmNoaXAgID0gJnBzZXJp
ZXNfcGNpX21zaV9pcnFfY2hpcCwKIH07Cgo=

