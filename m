Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFAB11CD69
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 13:48:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifNrO-0000ba-Pa; Thu, 12 Dec 2019 12:46:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y0ZC=2C=amazon.com=prvs=2428343ec=hongyxia@srs-us1.protection.inumbo.net>)
 id 1ifNrN-0000bV-QR
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 12:46:25 +0000
X-Inumbo-ID: 6860e14c-1cdd-11ea-8d42-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6860e14c-1cdd-11ea-8d42-12813bfff9fa;
 Thu, 12 Dec 2019 12:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576154785; x=1607690785;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=bslhqlH7/68itxYb8uoqT7wAk4WrSz2bnJxmL1ABJ4M=;
 b=c7Fnj4XnAYr8BADlpM+2KkBQB9VRMwCM1usK2e5ZSnY9dCyKd8ePOKE1
 Ymy+nk+Al/Ks1PhJ6hc40Izyd39SElCdVNMpg4zC1p5AZYW+CBJQTMN9U
 +VAMj8eDBnNxO97xBGq1lMu8xkeUhFRDONMxMatTE41hWiC6OTeVjB8iO Q=;
IronPort-SDR: kp5XZgcPIownOT8MToKj8xfzr30UXMOcgf3uV7yRfckhtchCWnYUsVcE1j5Uqy4ytWgIngN2/4
 o0AiQ1mFKGKw==
X-IronPort-AV: E=Sophos;i="5.69,305,1571702400"; 
   d="scan'208";a="8196482"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 12 Dec 2019 12:46:24 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id A71B2A1758; Thu, 12 Dec 2019 12:46:22 +0000 (UTC)
Received: from EX13D37EUB002.ant.amazon.com (10.43.166.116) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 12 Dec 2019 12:46:22 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D37EUB002.ant.amazon.com (10.43.166.116) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 12 Dec 2019 12:46:21 +0000
Received: from u60d575063b1f53.ant.amazon.com (10.55.230.166) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 12 Dec 2019 12:46:18 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 12 Dec 2019 12:46:15 +0000
Message-ID: <cover.1576154413.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 0/2] Refactor super page shattering
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bWFwX3BhZ2VzX3RvX3hlbiBhbmQgbW9kaWZ5X3hlbl9tYXBwaW5ncyB1c2UgYWxtb3N0IGV4YWN0
bHkgdGhlIHNhbWUKcGFnZSBzaGF0dGVyaW5nIGxvZ2ljLCBhbmQgdGhlIGNvZGUgaXMgbWluZ2xl
ZCB3aXRoIG90aGVyIFBURQptYW5pcHVsYXRpb25zIHNvIGl0IGlzIGxlc3Mgb2J2aW91cyB0aGF0
IHRoZSBpbnRlbnRpb24gaXMgcGFnZQpzaGF0dGVyaW5nLiBGYWN0b3Igb3V0IHRoZSBmdW5jdGlv
bnMgdG8gbWFrZSB0aGVtIHJldXNhYmxlIGFuZCB0byBtYWtlCnRoZSBpbnRlbnRpb24gbW9yZSBv
YnZpb3VzLgoKT2YgY291cnNlLCB0aGVyZSBpcyBub3QgbXVjaCBkaWZmZXJlbmNlIGJldHdlZW4g
dGhlIHNoYXR0ZXJpbmcgbG9naWMgb2YKZWFjaCBsZXZlbCwgc28gd2UgY291bGQgZnVydGhlciB0
dXJuIHRoZSBwZXItbGV2ZWwgZnVuY3Rpb25zIGludG8gYQpzaW5nbGUgbWFjcm8sIGFsdGhvdWdo
IHRoaXMgaXMgbm90IHRoYXQgc2ltcGxlIHNpbmNlIHdlIGhhdmUgcGVyLWxldmVsCmZ1bmN0aW9u
cyBhbmQgbWFjcm9zIGFsbCBvdmVyIHRoZSBwbGFjZSBhbmQgdGhlcmUgYXJlIHNsaWdodCBkaWZm
ZXJlbmNlcwpiZXR3ZWVuIGxldmVscy4gS2VlcCBpdCBwZXItbGV2ZWwgZm9yIG5vdy4KCnRyZWU6
Cmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9oeDI0Mi94ZW4uZ2l0CnNo
YXR0ZXItcmVmYWN0b3JfdjQKCi0tLQpDaGFuZ2VzIGluIHY0OgotIGhlbHBlciBmdW5jdGlvbnMg
bm93IHJldHVybiBib29sIGluc3RlYWQgb2YgYSByYW5kb20gdmFsdWUuCi0gcmViYXNlCgpDaGFu
Z2VzIGluIHYzOgotIHN0eWxlIGFuZCBpbmRlbnRhdGlvbiBmaXhlcy4KCkNoYW5nZXMgaW4gdjI6
Ci0gcmViYXNlLgotIGltcHJvdmUgYXNtIGNvZGUuCi0gYXZvaWQgc3RhbGUgdmFsdWVzIHdoZW4g
dGFraW5nIHRoZSBsb2NrLgotIG1vdmUgYWxsb2NhdGlvbiBvZiBQVEUgdGFibGVzIGluc2lkZSB0
aGUgc2hhdHRlciBmdW5jdGlvbi4KCkhvbmd5YW4gWGlhICgyKToKICB4ODYvbW06IGZhY3RvciBv
dXQgdGhlIGNvZGUgZm9yIHNoYXR0ZXJpbmcgYW4gbDMgUFRFCiAgeDg2L21tOiBmYWN0b3Igb3V0
IHRoZSBjb2RlIGZvciBzaGF0dGVyaW5nIGFuIGwyIFBURQoKIHhlbi9hcmNoL3g4Ni9tbS5jIHwg
MTk0ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA5OCBpbnNlcnRpb25zKCspLCA5NiBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
