Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B2A108D02
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 12:31:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZCXW-00013C-Qj; Mon, 25 Nov 2019 11:28:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8SdA=ZR=arm.com=qais.yousef@srs-us1.protection.inumbo.net>)
 id 1iZCXV-000132-Ma
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 11:28:21 +0000
X-Inumbo-ID: af065fec-0f76-11ea-9455-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id af065fec-0f76-11ea-9455-bc764e2007e4;
 Mon, 25 Nov 2019 11:28:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EE80139F;
 Mon, 25 Nov 2019 03:28:20 -0800 (PST)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 049813F52E;
 Mon, 25 Nov 2019 03:28:18 -0800 (PST)
From: Qais Yousef <qais.yousef@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 25 Nov 2019 11:27:50 +0000
Message-Id: <20191125112754.25223-11-qais.yousef@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125112754.25223-1-qais.yousef@arm.com>
References: <20191125112754.25223-1-qais.yousef@arm.com>
Subject: [Xen-devel] [PATCH v2 10/14] driver: xen: Replace cpu_up/down with
 device_online/offline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Qais Yousef <qais.yousef@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNvcmUgZGV2aWNlIEFQSSBwZXJmb3JtcyBleHRyYSBob3VzZWtlZXBpbmcgYml0cyB0aGF0
IGFyZSBtaXNzaW5nCmZyb20gZGlyZWN0bHkgY2FsbGluZyBjcHVfdXAvZG93bi4KClNlZSBjb21t
aXQgYTY3MTdjMDFkZGMyICgicG93ZXJwYy9ydGFzOiB1c2UgZGV2aWNlIG1vZGVsIEFQSXMgYW5k
CnNlcmlhbGl6YXRpb24gZHVyaW5nIExQTSIpIGZvciBhbiBleGFtcGxlIGRlc2NyaXB0aW9uIG9m
IHdoYXQgbWlnaHQgZ28Kd3JvbmcuCgpUaGlzIGFsc28gcHJlcGFyZXMgdG8gbWFrZSBjcHVfdXAv
ZG93biBhIHByaXZhdGUgaW50ZXJmYWNlIGZvciBhbnl0aGluZwpidXQgdGhlIGNwdSBzdWJzeXN0
ZW0uCgpTaWduZWQtb2ZmLWJ5OiBRYWlzIFlvdXNlZiA8cWFpcy55b3VzZWZAYXJtLmNvbT4KQ0M6
IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNDOiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CkNDOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKQ0M6IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL3hlbi9jcHVfaG90cGx1Zy5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vY3B1X2hvdHBsdWcuYyBiL2RyaXZlcnMveGVuL2NwdV9o
b3RwbHVnLmMKaW5kZXggZjE5MmI2ZjQyZGE5Li5lYzk3NWRlY2I1ZGUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMveGVuL2NwdV9ob3RwbHVnLmMKKysrIGIvZHJpdmVycy94ZW4vY3B1X2hvdHBsdWcuYwpA
QCAtOTQsNyArOTQsNyBAQCBzdGF0aWMgaW50IHNldHVwX2NwdV93YXRjaGVyKHN0cnVjdCBub3Rp
Zmllcl9ibG9jayAqbm90aWZpZXIsCiAKIAlmb3JfZWFjaF9wb3NzaWJsZV9jcHUoY3B1KSB7CiAJ
CWlmICh2Y3B1X29ubGluZShjcHUpID09IDApIHsKLQkJCSh2b2lkKWNwdV9kb3duKGNwdSk7CisJ
CQlkZXZpY2Vfb2ZmbGluZShnZXRfY3B1X2RldmljZShjcHUpKTsKIAkJCXNldF9jcHVfcHJlc2Vu
dChjcHUsIGZhbHNlKTsKIAkJfQogCX0KLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
