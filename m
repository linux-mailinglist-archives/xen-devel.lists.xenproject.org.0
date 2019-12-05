Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 129A4114239
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 15:04:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icrhi-0007E1-Qx; Thu, 05 Dec 2019 14:02:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SJM4=Z3=amazon.com=prvs=235339fe4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1icrhh-0007DZ-Ej
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 14:02:01 +0000
X-Inumbo-ID: cda40d49-1767-11ea-8227-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cda40d49-1767-11ea-8227-12813bfff9fa;
 Thu, 05 Dec 2019 14:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575554518; x=1607090518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1WJZpOjGUIHVRhgcjBz3yJxjB5haQQg6kXg1z4d6ets=;
 b=c2ZwzVIWRG2Nk4RNs6RRh0k7Ca5C67ZCJZMmSzY/4jcRUTebZCUh1FeV
 UzCOZZB2rO3WDusWhKIX5bmlxrQNwEs4eivc0k+vn8sdM7w2h/oiSnboP
 EUC9538TjTffzFmROUwOQBDyO7ItvcC53H3PLllv3sy5bGL80myknLZgo Y=;
IronPort-SDR: loNKSiQNwG75LMDfydCOTefyzN9ieNk12e8ueIaZsuDiGfR+2DLVXIwfiA2ChyEQXKkm9x/Dym
 IWYCNYTcFGTg==
X-IronPort-AV: E=Sophos;i="5.69,281,1571702400"; 
   d="scan'208";a="6345518"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 05 Dec 2019 14:01:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 04AB0A2A13; Thu,  5 Dec 2019 14:01:55 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 14:01:46 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 14:01:43 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 5 Dec 2019 14:01:40 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>
Date: Thu, 5 Dec 2019 14:01:23 +0000
Message-ID: <20191205140123.3817-5-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191205140123.3817-1-pdurrant@amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 4/4] xen-blkback: support dynamic unbind/bind
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Paul Durrant <pdurrant@amazon.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Qnkgc2ltcGx5IHJlLWF0dGFjaGluZyB0byBzaGFyZWQgcmluZ3MgZHVyaW5nIGNvbm5lY3Rfcmlu
ZygpIHJhdGhlciB0aGFuCmFzc3VtaW5nIHRoZXkgYXJlIGZyZXNobHkgYWxsb2NhdGVkIChpLmUg
YXNzdW1pbmcgdGhlIGNvdW50ZXJzIGFyZSB6ZXJvKQppdCBpcyBwb3NzaWJsZSBmb3IgdmJkIGlu
c3RhbmNlcyB0byBiZSB1bmJvdW5kIGFuZCByZS1ib3VuZCBmcm9tIGFuZCB0bwoocmVzcGVjdGl2
ZWx5KSBhIHJ1bm5pbmcgZ3Vlc3QuCgpUaGlzIGhhcyBiZWVuIHRlc3RlZCBieSBydW5uaW5nOgoK
d2hpbGUgdHJ1ZTsgZG8gZGQgaWY9L2Rldi91cmFuZG9tIG9mPXRlc3QuaW1nIGJzPTFNIGNvdW50
PTEwMjQ7IGRvbmUKCmluIGEgUFYgZ3Vlc3Qgd2hpbHN0IHJ1bm5pbmc6Cgp3aGlsZSB0cnVlOwog
IGRvIGVjaG8gdmJkLSRET01JRC0kVkJEID51bmJpbmQ7CiAgZWNobyB1bmJvdW5kOwogIHNsZWVw
IDU7CiAgZWNobyB2YmQtJERPTUlELSRWQkQgPmJpbmQ7CiAgZWNobyBib3VuZDsKICBzbGVlcCAz
OwogIGRvbmUKCmluIGRvbTAgZnJvbSAvc3lzL2J1cy94ZW4tYmFja2VuZC9kcml2ZXJzL3ZiZCB0
byBjb250aW51b3VzbHkgdW5iaW5kIGFuZApyZS1iaW5kIGl0cyBzeXN0ZW0gZGlzayBpbWFnZS4K
ClRoaXMgaXMgYSBoaWdobHkgdXNlZnVsIGZlYXR1cmUgZm9yIGEgYmFja2VuZCBtb2R1bGUgYXMg
aXQgYWxsb3dzIGl0IHRvIGJlCnVubG9hZGVkIGFuZCByZS1sb2FkZWQgKGkuZS4gdXBkYXRlZCkg
d2l0aG91dCByZXF1aXJpbmcgZG9tVXMgdG8gYmUgaGFsdGVkLgpUaGlzIHdhcyBhbHNvIHRlc3Rl
ZCBieSBydW5uaW5nOgoKd2hpbGUgdHJ1ZTsKICBkbyBlY2hvIHZiZC0kRE9NSUQtJFZCRCA+dW5i
aW5kOwogIGVjaG8gdW5ib3VuZDsKICBzbGVlcCA1OwogIHJtbW9kIHhlbi1ibGtiYWNrOwogIGVj
aG8gdW5sb2FkZWQ7CiAgc2xlZXAgMTsKICBtb2Rwcm9iZSB4ZW4tYmxrYmFjazsKICBlY2hvIGJv
dW5kOwogIGNkICQocHdkKTsKICBzbGVlcCAzOwogIGRvbmUKCmluIGRvbTAgd2hpbHN0IHJ1bm5p
bmcgdGhlIHNhbWUgbG9vcCBhcyBhYm92ZSBpbiB0aGUgKHNpbmdsZSkgUFYgZ3Vlc3QuCgpTb21l
IChsZXNzIHN0cmVzc2Z1bCkgdGVzdGluZyBoYXMgYWxzbyBiZWVuIGRvbmUgdXNpbmcgYSBXaW5k
b3dzIEhWTSBndWVzdAp3aXRoIHRoZSBsYXRlc3QgOS4wIFBWIGRyaXZlcnMgaW5zdGFsbGVkLgoK
U2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgotLS0KQ2M6
IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6ICJSb2dl
ciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNjOiBKZW5zIEF4Ym9lIDxheGJv
ZUBrZXJuZWwuZGs+CkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUu
Y29tPgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvYmxvY2sveGVuLWJs
a2JhY2sveGVuYnVzLmMgfCAxMiArKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4t
YmxrYmFjay94ZW5idXMuYyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMKaW5k
ZXggZThjNWM1NGUxZDI2Li4wYjgyNzQwYzRhOWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2sv
eGVuLWJsa2JhY2sveGVuYnVzLmMKKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5i
dXMuYwpAQCAtMTk2LDI0ICsxOTYsMjQgQEAgc3RhdGljIGludCB4ZW5fYmxraWZfbWFwKHN0cnVj
dCB4ZW5fYmxraWZfcmluZyAqcmluZywgZ3JhbnRfcmVmX3QgKmdyZWYsCiAJewogCQlzdHJ1Y3Qg
YmxraWZfc3JpbmcgKnNyaW5nOwogCQlzcmluZyA9IChzdHJ1Y3QgYmxraWZfc3JpbmcgKilyaW5n
LT5ibGtfcmluZzsKLQkJQkFDS19SSU5HX0lOSVQoJnJpbmctPmJsa19yaW5ncy5uYXRpdmUsIHNy
aW5nLAotCQkJICAgICAgIFhFTl9QQUdFX1NJWkUgKiBucl9ncmVmcyk7CisJCUJBQ0tfUklOR19B
VFRBQ0goJnJpbmctPmJsa19yaW5ncy5uYXRpdmUsIHNyaW5nLAorCQkJCSBYRU5fUEFHRV9TSVpF
ICogbnJfZ3JlZnMpOwogCQlicmVhazsKIAl9CiAJY2FzZSBCTEtJRl9QUk9UT0NPTF9YODZfMzI6
CiAJewogCQlzdHJ1Y3QgYmxraWZfeDg2XzMyX3NyaW5nICpzcmluZ194ODZfMzI7CiAJCXNyaW5n
X3g4Nl8zMiA9IChzdHJ1Y3QgYmxraWZfeDg2XzMyX3NyaW5nICopcmluZy0+YmxrX3Jpbmc7Ci0J
CUJBQ0tfUklOR19JTklUKCZyaW5nLT5ibGtfcmluZ3MueDg2XzMyLCBzcmluZ194ODZfMzIsCi0J
CQkgICAgICAgWEVOX1BBR0VfU0laRSAqIG5yX2dyZWZzKTsKKwkJQkFDS19SSU5HX0FUVEFDSCgm
cmluZy0+YmxrX3JpbmdzLng4Nl8zMiwgc3JpbmdfeDg2XzMyLAorCQkJCSBYRU5fUEFHRV9TSVpF
ICogbnJfZ3JlZnMpOwogCQlicmVhazsKIAl9CiAJY2FzZSBCTEtJRl9QUk9UT0NPTF9YODZfNjQ6
CiAJewogCQlzdHJ1Y3QgYmxraWZfeDg2XzY0X3NyaW5nICpzcmluZ194ODZfNjQ7CiAJCXNyaW5n
X3g4Nl82NCA9IChzdHJ1Y3QgYmxraWZfeDg2XzY0X3NyaW5nICopcmluZy0+YmxrX3Jpbmc7Ci0J
CUJBQ0tfUklOR19JTklUKCZyaW5nLT5ibGtfcmluZ3MueDg2XzY0LCBzcmluZ194ODZfNjQsCi0J
CQkgICAgICAgWEVOX1BBR0VfU0laRSAqIG5yX2dyZWZzKTsKKwkJQkFDS19SSU5HX0FUVEFDSCgm
cmluZy0+YmxrX3JpbmdzLng4Nl82NCwgc3JpbmdfeDg2XzY0LAorCQkJCSBYRU5fUEFHRV9TSVpF
ICogbnJfZ3JlZnMpOwogCQlicmVhazsKIAl9CiAJZGVmYXVsdDoKLS0gCjIuMjAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
