Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D56011423A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 15:04:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icrhO-00079S-Fi; Thu, 05 Dec 2019 14:01:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SJM4=Z3=amazon.com=prvs=235339fe4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1icrhN-00079N-EB
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 14:01:41 +0000
X-Inumbo-ID: c2d30b59-1767-11ea-8227-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2d30b59-1767-11ea-8227-12813bfff9fa;
 Thu, 05 Dec 2019 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575554501; x=1607090501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T78jIw2G+NoTyOExzPIFxHYe8NsRzGe0PdgYlPNaGmg=;
 b=jkSg/8VzC9YJetUqyYYyaKaLvDWc+K/rpeykgkPwXoqLNBkxh9G5MgbY
 Kusxf1o1+8Sso56S/yJuA+dtsl9zKjahzXHgFLL+D4YkONC6Y/Ja50DJV
 DezMiXw+A1jeVq5WeWP7+7wDpku/MQ8ZZFVhuoE9fECWNZrk5GE22ZlHA 4=;
IronPort-SDR: TrQOkzDuolXJUMTPo2K5HXoHg/ggo3T0ufETrbzTLZWL9eor9HDoWJ13NLIxasnRSejJg9I0w4
 O0aBChzSre4Q==
X-IronPort-AV: E=Sophos;i="5.69,281,1571702400"; 
   d="scan'208";a="7211159"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 05 Dec 2019 14:01:39 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id 197A6A27D0; Thu,  5 Dec 2019 14:01:39 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 14:01:38 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 14:01:37 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 5 Dec 2019 14:01:35 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>
Date: Thu, 5 Dec 2019 14:01:21 +0000
Message-ID: <20191205140123.3817-3-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191205140123.3817-1-pdurrant@amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to closed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T25seSBmb3JjZSBzdGF0ZSB0byBjbG9zZWQgaW4gdGhlIGNhc2Ugd2hlbiB0aGUgdG9vbHN0YWNr
IG1heSBuZWVkIHRvCmNsZWFuIHVwLiBUaGlzIGNhbiBiZSBkZXRlY3RlZCBieSBjaGVja2luZyB3
aGV0aGVyIHRoZSBzdGF0ZSBpbiB4ZW5zdG9yZQpoYXMgYmVlbiBzZXQgdG8gY2xvc2luZyBwcmlv
ciB0byBkZXZpY2UgcmVtb3ZhbC4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJh
bnRAYW1hem9uLmNvbT4KLS0tCkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBv
cmFjbGUuY29tPgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfcHJvYmUuYyB8IDExICsrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfcHJvYmUuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYwpp
bmRleCBhMTAzMTFjMzQ4YjkuLmM1NGE1M2RhMDEwNiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4v
eGVuYnVzL3hlbmJ1c19wcm9iZS5jCisrKyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJv
YmUuYwpAQCAtMjU1LDcgKzI1NSw2IEBAIGludCB4ZW5idXNfZGV2X3Byb2JlKHN0cnVjdCBkZXZp
Y2UgKl9kZXYpCiAJbW9kdWxlX3B1dChkcnYtPmRyaXZlci5vd25lcik7CiBmYWlsOgogCXhlbmJ1
c19kZXZfZXJyb3IoZGV2LCBlcnIsICJ4ZW5idXNfZGV2X3Byb2JlIG9uICVzIiwgZGV2LT5ub2Rl
bmFtZSk7Ci0JeGVuYnVzX3N3aXRjaF9zdGF0ZShkZXYsIFhlbmJ1c1N0YXRlQ2xvc2VkKTsKIAly
ZXR1cm4gZXJyOwogfQogRVhQT1JUX1NZTUJPTF9HUEwoeGVuYnVzX2Rldl9wcm9iZSk7CkBAIC0y
NjQsNiArMjYzLDcgQEAgaW50IHhlbmJ1c19kZXZfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKl9kZXYp
CiB7CiAJc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiA9IHRvX3hlbmJ1c19kZXZpY2UoX2Rldik7
CiAJc3RydWN0IHhlbmJ1c19kcml2ZXIgKmRydiA9IHRvX3hlbmJ1c19kcml2ZXIoX2Rldi0+ZHJp
dmVyKTsKKwllbnVtIHhlbmJ1c19zdGF0ZSBzdGF0ZTsKIAogCURQUklOVEsoIiVzIiwgZGV2LT5u
b2RlbmFtZSk7CiAKQEAgLTI3Niw3ICsyNzYsMTQgQEAgaW50IHhlbmJ1c19kZXZfcmVtb3ZlKHN0
cnVjdCBkZXZpY2UgKl9kZXYpCiAKIAlmcmVlX290aGVyZW5kX2RldGFpbHMoZGV2KTsKIAotCXhl
bmJ1c19zd2l0Y2hfc3RhdGUoZGV2LCBYZW5idXNTdGF0ZUNsb3NlZCk7CisJLyoKKwkgKiBJZiB0
aGUgdG9vbHN0YWNrIGhhZCBmb3JjZSB0aGUgZGV2aWNlIHN0YXRlIHRvIGNsb3NpbmcgdGhlbiBz
ZXQKKwkgKiB0aGUgc3RhdGUgdG8gY2xvc2VkIG5vdyB0byBhbGxvdyBpdCB0byBiZSBjbGVhbmVk
IHVwLgorCSAqLworCXN0YXRlID0geGVuYnVzX3JlYWRfZHJpdmVyX3N0YXRlKGRldi0+bm9kZW5h
bWUpOworCWlmIChzdGF0ZSA9PSBYZW5idXNTdGF0ZUNsb3NpbmcpCisJCXhlbmJ1c19zd2l0Y2hf
c3RhdGUoZGV2LCBYZW5idXNTdGF0ZUNsb3NlZCk7CisKIAlyZXR1cm4gMDsKIH0KIEVYUE9SVF9T
WU1CT0xfR1BMKHhlbmJ1c19kZXZfcmVtb3ZlKTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
