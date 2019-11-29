Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A76410D643
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 14:45:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iagYc-00050u-1n; Fri, 29 Nov 2019 13:43:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3pi/=ZV=amazon.com=prvs=22965b742=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iagYa-00050g-HA
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 13:43:36 +0000
X-Inumbo-ID: 394d9fb5-12ae-11ea-a3e7-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 394d9fb5-12ae-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575035010; x=1606571010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c6kyduALUMlhgXr7+NWpnW7lYxje+66n8zte1sjHPtQ=;
 b=jZI1p2tQm84hhNT9kA2BsYkOEJDBN+dzu2478xJfVE/S9A0hamYq8xyH
 p+wcMwnN2YZZYftb9/OfqNI/Ex0DFZjfV5Ff9RUltO8xz+hKMM2dzJf64
 GaPPS8Y8no1TFC2rKpKDQO4LHWvXDRWV3dxrNQiqefHU+1itoRrgYvN11 A=;
IronPort-SDR: e313tRJFZvKq/8QfO6v7WwPLs4wfemBryy0e4hKh5dmdkHBgrPoM/p7KJ6uTkCfaGL2Pd6S3K8
 aRuogK46WYNw==
X-IronPort-AV: E=Sophos;i="5.69,257,1571702400"; d="scan'208";a="10582565"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 29 Nov 2019 13:43:18 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 04DBE282697; Fri, 29 Nov 2019 13:43:15 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 13:43:15 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 29 Nov 2019 13:43:14 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 29 Nov 2019 13:43:12 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 13:43:05 +0000
Message-ID: <20191129134306.2738-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191129134306.2738-1-pdurrant@amazon.com>
References: <20191129134306.2738-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 1/2] xen/xenbus: reference count registered
 modules
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG8gcHJldmVudCBhIG1vZHVsZSBiZWluZyByZW1vdmVkIHdoaWxzdCBhdHRhY2hlZCB0byBhIGZy
b250ZW5kLCBhbmQKaGVuY2UgeGVuYnVzIGNhbGxpbmcgaW50byBwb3RlbnRpYWxseSBpbnZhbGlk
IHRleHQsIHRha2UgYSByZWZlcmVuY2Ugb24KdGhlIG1vZHVsZSBiZWZvcmUgY2FsbGluZyB0aGUg
cHJvYmUoKSBtZXRob2QgKGRyb3BwaW5nIGl0IGlmIHVuc3VjY2Vzc2Z1bCkKYW5kIGRyb3AgdGhl
IHJlZmVyZW5jZSBhZnRlciByZXR1cm5pbmcgZnJvbSB0aGUgcmVtb3ZlKCkgbWV0aG9kLgoKTk9U
RTogVGhpcyBhbGxvd3MgdGhlIGFkLWhvYyByZWZlcmVuY2UgY291bnRpbmcgaW4geGVuLW5ldGJh
Y2sgdG8gYmUKICAgICAgcmVtb3ZlZC4gVGhpcyB3aWxsIGJlIGRvbmUgaW4gYSBzdWJzZXF1ZW50
IHBhdGNoLgoKU3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClNp
Z25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KLS0tCkNjOiBC
b3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpDYzogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgoKdjI6CiAtIE5ldyBpbiB2MgotLS0KIGRyaXZlcnMveGVuL3hlbmJ1cy94
ZW5idXNfcHJvYmUuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVz
X3Byb2JlLmMgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKaW5kZXggNWI0NzE4
ODlkNzIzLi41YTQ5NDc2OTA1MDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5i
dXNfcHJvYmUuYworKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKQEAgLTIz
Miw5ICsyMzIsMTEgQEAgaW50IHhlbmJ1c19kZXZfcHJvYmUoc3RydWN0IGRldmljZSAqX2RldikK
IAkJcmV0dXJuIGVycjsKIAl9CiAKKwlfX21vZHVsZV9nZXQoZHJ2LT5kcml2ZXIub3duZXIpOwor
CiAJZXJyID0gZHJ2LT5wcm9iZShkZXYsIGlkKTsKIAlpZiAoZXJyKQotCQlnb3RvIGZhaWw7CisJ
CWdvdG8gZmFpbF9wdXQ7CiAKIAllcnIgPSB3YXRjaF9vdGhlcmVuZChkZXYpOwogCWlmIChlcnIp
IHsKQEAgLTI0NCw2ICsyNDYsOCBAQCBpbnQgeGVuYnVzX2Rldl9wcm9iZShzdHJ1Y3QgZGV2aWNl
ICpfZGV2KQogCX0KIAogCXJldHVybiAwOworZmFpbF9wdXQ6CisJbW9kdWxlX3B1dChkcnYtPmRy
aXZlci5vd25lcik7CiBmYWlsOgogCXhlbmJ1c19kZXZfZXJyb3IoZGV2LCBlcnIsICJ4ZW5idXNf
ZGV2X3Byb2JlIG9uICVzIiwgZGV2LT5ub2RlbmFtZSk7CiAJeGVuYnVzX3N3aXRjaF9zdGF0ZShk
ZXYsIFhlbmJ1c1N0YXRlQ2xvc2VkKTsKQEAgLTI2Myw2ICsyNjcsOCBAQCBpbnQgeGVuYnVzX2Rl
dl9yZW1vdmUoc3RydWN0IGRldmljZSAqX2RldikKIAlpZiAoZHJ2LT5yZW1vdmUpCiAJCWRydi0+
cmVtb3ZlKGRldik7CiAKKwltb2R1bGVfcHV0KGRydi0+ZHJpdmVyLm93bmVyKTsKKwogCWZyZWVf
b3RoZXJlbmRfZGV0YWlscyhkZXYpOwogCiAJeGVuYnVzX3N3aXRjaF9zdGF0ZShkZXYsIFhlbmJ1
c1N0YXRlQ2xvc2VkKTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
