Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F1F1699C8
	for <lists+xen-devel@lfdr.de>; Sun, 23 Feb 2020 20:33:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5wxB-0004Fu-3t; Sun, 23 Feb 2020 19:30:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xtdu=4L=arm.com=qais.yousef@srs-us1.protection.inumbo.net>)
 id 1j5wx9-0004Fp-VJ
 for xen-devel@lists.xenproject.org; Sun, 23 Feb 2020 19:30:11 +0000
X-Inumbo-ID: e818dc4a-5672-11ea-b0fd-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e818dc4a-5672-11ea-b0fd-bc764e2007e4;
 Sun, 23 Feb 2020 19:30:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E76CFEC;
 Sun, 23 Feb 2020 11:30:10 -0800 (PST)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 835CA3F6CF;
 Sun, 23 Feb 2020 11:30:09 -0800 (PST)
From: Qais Yousef <qais.yousef@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>
Date: Sun, 23 Feb 2020 19:29:38 +0000
Message-Id: <20200223192942.18420-12-qais.yousef@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200223192942.18420-1-qais.yousef@arm.com>
References: <20200223192942.18420-1-qais.yousef@arm.com>
Subject: [Xen-devel] [PATCH v3 11/15] driver: xen: Replace cpu_up/down with
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
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
Z2VyLmtlcm5lbC5vcmcKLS0tCgpKdWVyZ2VuLCB0aGVyZSdzIGEgbmV3IGFkZF9jcHUoKSB3aGlj
aCB5b3Ugc2hvdWxkIGJlIENDZWQgb24uIEkgd2Fzbid0IHN1cmUgaWYKSSBjb3VsZCBzYWZlbHkg
Y29udmVydCB0aGlzIHRvIHVzZSBpdCBzaW5jZSBJIGNvdWxkbid0IGZpbmQgd2hldGhlciB0aGUK
bm90aWZpZXIgYWxyZWFkeSBob2xkIHRoZSBsb2NrIG9yIG5vdC4gSWYgeW91IHRoaW5rIHJlbW92
ZV9jcHUoKSBpcyBzYWZlLCBsZXQKbWUga25vdyBhbmQgSSBjYW4gc2VuZCBhbiB1cGRhdGVkIHBh
dGNoLgoKIGRyaXZlcnMveGVuL2NwdV9ob3RwbHVnLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9j
cHVfaG90cGx1Zy5jIGIvZHJpdmVycy94ZW4vY3B1X2hvdHBsdWcuYwppbmRleCBmMTkyYjZmNDJk
YTkuLmVjOTc1ZGVjYjVkZSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vY3B1X2hvdHBsdWcuYwor
KysgYi9kcml2ZXJzL3hlbi9jcHVfaG90cGx1Zy5jCkBAIC05NCw3ICs5NCw3IEBAIHN0YXRpYyBp
bnQgc2V0dXBfY3B1X3dhdGNoZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpub3RpZmllciwKIAog
CWZvcl9lYWNoX3Bvc3NpYmxlX2NwdShjcHUpIHsKIAkJaWYgKHZjcHVfb25saW5lKGNwdSkgPT0g
MCkgewotCQkJKHZvaWQpY3B1X2Rvd24oY3B1KTsKKwkJCWRldmljZV9vZmZsaW5lKGdldF9jcHVf
ZGV2aWNlKGNwdSkpOwogCQkJc2V0X2NwdV9wcmVzZW50KGNwdSwgZmFsc2UpOwogCQl9CiAJfQot
LSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
