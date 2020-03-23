Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D6B18F664
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 14:54:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGNUX-0002o3-Jx; Mon, 23 Mar 2020 13:51:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/55+=5I=arm.com=qais.yousef@srs-us1.protection.inumbo.net>)
 id 1jGNUW-0002nm-KO
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 13:51:44 +0000
X-Inumbo-ID: 6e311f80-6d0d-11ea-82d5-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6e311f80-6d0d-11ea-82d5-12813bfff9fa;
 Mon, 23 Mar 2020 13:51:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5CE1FEC;
 Mon, 23 Mar 2020 06:51:43 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6B293F52E;
 Mon, 23 Mar 2020 06:51:42 -0700 (PDT)
From: Qais Yousef <qais.yousef@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>
Date: Mon, 23 Mar 2020 13:51:06 +0000
Message-Id: <20200323135110.30522-14-qais.yousef@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323135110.30522-1-qais.yousef@arm.com>
References: <20200323135110.30522-1-qais.yousef@arm.com>
Subject: [Xen-devel] [PATCH v4 13/17] driver: xen: Replace cpu_up/down with
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
ZW0uCgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpTaWduZWQt
b2ZmLWJ5OiBRYWlzIFlvdXNlZiA8cWFpcy55b3VzZWZAYXJtLmNvbT4KQ0M6IEJvcmlzIE9zdHJv
dnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+CkNDOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKQ0M6IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL3hlbi9jcHVfaG90cGx1Zy5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy94ZW4vY3B1X2hvdHBsdWcuYyBiL2RyaXZlcnMveGVuL2NwdV9ob3RwbHVnLmMKaW5k
ZXggZjE5MmI2ZjQyZGE5Li5lYzk3NWRlY2I1ZGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL2Nw
dV9ob3RwbHVnLmMKKysrIGIvZHJpdmVycy94ZW4vY3B1X2hvdHBsdWcuYwpAQCAtOTQsNyArOTQs
NyBAQCBzdGF0aWMgaW50IHNldHVwX2NwdV93YXRjaGVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAq
bm90aWZpZXIsCiAKIAlmb3JfZWFjaF9wb3NzaWJsZV9jcHUoY3B1KSB7CiAJCWlmICh2Y3B1X29u
bGluZShjcHUpID09IDApIHsKLQkJCSh2b2lkKWNwdV9kb3duKGNwdSk7CisJCQlkZXZpY2Vfb2Zm
bGluZShnZXRfY3B1X2RldmljZShjcHUpKTsKIAkJCXNldF9jcHVfcHJlc2VudChjcHUsIGZhbHNl
KTsKIAkJfQogCX0KLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
