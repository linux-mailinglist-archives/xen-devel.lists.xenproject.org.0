Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1180974C6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:23:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0LrT-0008Rp-Ix; Wed, 21 Aug 2019 08:20:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0LrR-0008P9-6M
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:20:53 +0000
X-Inumbo-ID: 97395dae-c3ec-11e9-8980-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97395dae-c3ec-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 08:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375652; x=1597911652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=SPD4A6bGMHPNjqLPvW3NJnbKE2CQOSt/oG6jsD3Ek3s=;
 b=K6WpNq1OHfCCV1R6KV3FD0yDnajJ8DOYqNNdhte1z6RHwLvWLiGTp/Y+
 EJ4zYHRh9dNk2GKw6RW8ECFfJ02ItlqmMCENmNI4rH18zwsHaYQRuRlYn
 bp3FJ7SLX6OR5Oj9Zs2wfZYKmS5u//jWfpYg/LmdW5Kq5IgvFmTZ+YdjL E=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="780418972"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 21 Aug 2019 08:20:52 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9EEBCC5DF6; Wed, 21 Aug 2019 08:20:51 +0000 (UTC)
Received: from EX13D03EUC001.ant.amazon.com (10.43.164.245) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:20:18 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D03EUC001.ant.amazon.com (10.43.164.245) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 01:20:16 -0700
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:20:14 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Wed, 21 Aug 2019 08:19:24 +0000
Message-ID: <20190821081931.90887-8-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821081931.90887-1-wipawel@amazon.de>
References: <20190821081931.90887-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 07/14] livepatch: Do not enforce
 ELF_LIVEPATCH_FUNC section presence
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>, wipawel@amazon.com, Ross
 Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCBkZWZhdWx0IGltcGxlbWVudGF0aW9uIHRoZSBFTEZfTElWRVBBVENIX0ZVTkMgc2VjdGlv
biBjb250YWluaW5nCmFsbCBmdW5jdGlvbnMgdG8gYmUgcmVwbGFjZWQgb3IgYWRkZWQgbXVzdCBi
ZSBwYXJ0IG9mIHRoZSBob3RwYXRjaApwYXlsb2FkLCBvdGhlcndpc2UgdGhlIHBheWxvYWQgaXMg
cmVqZWN0ZWQgKHdpdGggLUVJTlZBTCkuCgpIb3dldmVyLCB3aXRoIHRoZSBleHRlbmRlZCBob29r
cyBpbXBsZW1lbnRhdGlvbiwgYSBob3RwYXRjaCBtYXkgYmUKY29uc3RydWN0ZWQgb2Ygb25seSBo
b29rcyB0byBwZXJmb3JtIGNlcnRhaW4gYWN0aW9ucyB3aXRob3V0IGFueSBjb2RlCnRvIGJlIGFk
ZGVkIG9yIHJlcGxhY2VkLgpUaGVyZWZvcmUsIGRvIG5vdCBhbHdheXMgZXhwZWN0IHRoZSBmdW5j
dGlvbnMgc2VjdGlvbiBhbmQgYWxsb3cgaXQgdG8KYmUgbWlzc2luZywgcHJvdmlkZWQgdGhlcmUg
aXMgYXQgbGVhc3Qgb25lIHNlY3Rpb24gY29udGFpbmluZyBob29rcwpwcmVzZW50LiBUaGUgZnVu
Y3Rpb25zIHNlY3Rpb24sIHdoZW4gcHJlc2VudCBpbiBhIHBheWxvYWQsIG11c3QgYmUgYQpzaW5n
bGUsIG5vbi1lbXB0eSBzZWN0aW9uLgoKQ2hlY2sgYWxzbyBhbGwgZXh0ZW5kZWQgaG9va3Mgc2Vj
dGlvbnMgaWYgdGhleSBhcmUgYSBzaW5nbGUsIG5vbi1lbXB0eQpzZWN0aW9ucyBlYWNoLgoKQXQg
bGVhc3Qgb25lIG9mIHRoZSBmdW5jdGlvbnMgb3IgaG9va3Mgc2VjdGlvbiBtdXN0IGJlIHByZXNl
bnQgaW4gYQp2YWxpZCBwYXlsb2FkLgoKU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdp
Y3ogPHdpcGF3ZWxAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2
IDxhbmRyYXByc0BhbWF6b24uY29tPgpSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVs
QGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBQb2hsYWNrIDxtcG9obGFja0BhbWF6b24u
ZGU+Ci0tLQogeGVuL2NvbW1vbi9saXZlcGF0Y2guYyAgICAgIHwgMTQ1ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNo
LmggfCAgIDggKysrCiAyIGZpbGVzIGNoYW5nZWQsIDExMiBpbnNlcnRpb25zKCspLCA0MSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2xpdmVwYXRjaC5jIGIveGVuL2NvbW1v
bi9saXZlcGF0Y2guYwppbmRleCAzOGZhYjhiMjQwLi5jNGExMDdkOTFjIDEwMDY0NAotLS0gYS94
ZW4vY29tbW9uL2xpdmVwYXRjaC5jCisrKyBiL3hlbi9jb21tb24vbGl2ZXBhdGNoLmMKQEAgLTQ2
Nyw4ICs0NjcsNyBAQCBzdGF0aWMgaW50IGNoZWNrX3hlbl9idWlsZF9pZChjb25zdCBzdHJ1Y3Qg
cGF5bG9hZCAqcGF5bG9hZCkKIHN0YXRpYyBpbnQgY2hlY2tfc3BlY2lhbF9zZWN0aW9ucyhjb25z
dCBzdHJ1Y3QgbGl2ZXBhdGNoX2VsZiAqZWxmKQogewogICAgIHVuc2lnbmVkIGludCBpOwotICAg
IHN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBuYW1lc1tdID0geyBFTEZfTElWRVBBVENIX0ZVTkMs
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVMRl9MSVZFUEFUQ0hf
REVQRU5EUywKKyAgICBzdGF0aWMgY29uc3QgY2hhciAqY29uc3QgbmFtZXNbXSA9IHsgRUxGX0xJ
VkVQQVRDSF9ERVBFTkRTLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBFTEZfTElWRVBBVENIX1hFTl9ERVBFTkRTLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBFTEZfQlVJTERfSURfTk9URX07CiAgICAgREVDTEFSRV9CSVRNQVAoZm91
bmQsIEFSUkFZX1NJWkUobmFtZXMpKSA9IHsgMCB9OwpAQCAtNTAzLDYgKzUwMiw2NCBAQCBzdGF0
aWMgaW50IGNoZWNrX3NwZWNpYWxfc2VjdGlvbnMoY29uc3Qgc3RydWN0IGxpdmVwYXRjaF9lbGYg
KmVsZikKICAgICByZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBjaGVja19wYXRjaGluZ19zZWN0
aW9ucyhjb25zdCBzdHJ1Y3QgbGl2ZXBhdGNoX2VsZiAqZWxmKQoreworICAgIHVuc2lnbmVkIGlu
dCBpOworICAgIHN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBuYW1lc1tdID0geyBFTEZfTElWRVBB
VENIX0ZVTkMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVMRl9M
SVZFUEFUQ0hfTE9BRF9IT09LUywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgRUxGX0xJVkVQQVRDSF9VTkxPQURfSE9PS1MsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEVMRl9MSVZFUEFUQ0hfUFJFQVBQTFlfSE9PSywKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRUxGX0xJVkVQQVRDSF9BUFBMWV9IT09L
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFTEZfTElWRVBBVENI
X1BPU1RBUFBMWV9IT09LLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBFTEZfTElWRVBBVENIX1BSRVJFVkVSVF9IT09LLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBFTEZfTElWRVBBVENIX1JFVkVSVF9IT09LLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFTEZfTElWRVBBVENIX1BPU1RSRVZFUlRfSE9P
S307CisgICAgREVDTEFSRV9CSVRNQVAoZm91bmQsIEFSUkFZX1NJWkUobmFtZXMpKSA9IHsgMCB9
OworCisgICAgLyoKKyAgICAgKiBUaGUgcGF0Y2hpbmcgc2VjdGlvbnMgYXJlIG9wdGlvbmFsLCBi
dXQgYXQgbGVhc3Qgb25lCisgICAgICogbXVzdCBiZSBwcmVzZW50LiBPdGhlcndpc2UsIHRoZXJl
IGlzIG5vdGhpbmcgdG8gZG8uCisgICAgICogQWxsIHRoZSBleGlzdGluZyBzZWN0aW9ucyBtdXN0
IG5vdCBiZSBlbXB0eSBhbmQgbXVzdAorICAgICAqIGJlIHByZXNlbnQgYXQgbW9zdCBvbmNlLgor
ICAgICAqLworICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlfU0laRShuYW1lcyk7IGkrKyApCisg
ICAgeworICAgICAgICBjb25zdCBzdHJ1Y3QgbGl2ZXBhdGNoX2VsZl9zZWMgKnNlYzsKKworICAg
ICAgICBzZWMgPSBsaXZlcGF0Y2hfZWxmX3NlY19ieV9uYW1lKGVsZiwgbmFtZXNbaV0pOworICAg
ICAgICBpZiAoICFzZWMgKQorICAgICAgICB7CisgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19J
TkZPLCBMSVZFUEFUQ0ggIiVzOiAlcyBpcyBtaXNzaW5nIVxuIiwKKyAgICAgICAgICAgICAgICAg
ICAgZWxmLT5uYW1lLCBuYW1lc1tpXSk7CisgICAgICAgICAgICBjb250aW51ZTsgLyogVGhpcyBz
ZWN0aW9uIGlzIG9wdGlvbmFsICovCisgICAgICAgIH0KKworICAgICAgICBpZiAoICFzZWMtPnNl
Yy0+c2hfc2l6ZSApCisgICAgICAgIHsKKyAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwg
TElWRVBBVENIICIlczogJXMgaXMgZW1wdHkhXG4iLAorICAgICAgICAgICAgICAgICAgICBlbGYt
Pm5hbWUsIG5hbWVzW2ldKTsKKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOworICAgICAgICB9
CisKKyAgICAgICAgaWYgKCB0ZXN0X2FuZF9zZXRfYml0KGksIGZvdW5kKSApCisgICAgICAgIHsK
KyAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENIICIlczogJXMgd2FzIHNl
ZW4gbW9yZSB0aGFuIG9uY2UhXG4iLAorICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIG5h
bWVzW2ldKTsKKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOworICAgICAgICB9CisgICAgfQor
CisgICAgLyogQ2hlY2tpbmcgaWYgYXQgbGVhc3Qgb25lIHNlY3Rpb24gaXMgcHJlc2VudC4gKi8K
KyAgICBpZiAoIGJpdG1hcF9lbXB0eShmb3VuZCwgQVJSQVlfU0laRShuYW1lcykpICkKKyAgICB7
CisgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6IE5vdGhpbmcgdG8gcGF0
Y2guIEFib3J0aW5nLi4uXG4iLAorICAgICAgICAgICAgICAgZWxmLT5uYW1lKTsKKyAgICAgICAg
cmV0dXJuIC1FSU5WQUw7CisgICAgfQorCisgICAgcmV0dXJuIDA7Cit9CisKIC8qCiAgKiBMb29r
dXAgc3BlY2lmaWVkIHNlY3Rpb24gYW5kIHdoZW4gZXhpc3RzIGFzc2lnbiBpdHMgYWRkcmVzcyB0
byBhIHNwZWNpZmllZCBob29rLgogICogUGVyZm9ybSBzZWN0aW9uIHBvaW50ZXIgYW5kIHNpemUg
dmFsaWRhdGlvbjogc2luZ2xlIGhvb2sgc2VjdGlvbnMgbXVzdCBjb250YWluIGEKQEAgLTU0Miw1
NyArNTk5LDU5IEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9wYXlsb2FkKHN0cnVjdCBwYXlsb2FkICpw
YXlsb2FkLAogICAgIGNvbnN0IEVsZl9Ob3RlICpuOwogCiAgICAgc2VjID0gbGl2ZXBhdGNoX2Vs
Zl9zZWNfYnlfbmFtZShlbGYsIEVMRl9MSVZFUEFUQ0hfRlVOQyk7Ci0gICAgQVNTRVJUKHNlYyk7
Ci0gICAgaWYgKCAhc2VjdGlvbl9vayhlbGYsIHNlYywgc2l6ZW9mKCpwYXlsb2FkLT5mdW5jcykp
ICkKLSAgICAgICAgcmV0dXJuIC1FSU5WQUw7Ci0KLSAgICBwYXlsb2FkLT5mdW5jcyA9IHNlYy0+
bG9hZF9hZGRyOwotICAgIHBheWxvYWQtPm5mdW5jcyA9IHNlYy0+c2VjLT5zaF9zaXplIC8gc2l6
ZW9mKCpwYXlsb2FkLT5mdW5jcyk7Ci0KLSAgICBmb3IgKCBpID0gMDsgaSA8IHBheWxvYWQtPm5m
dW5jczsgaSsrICkKKyAgICBpZiAoIHNlYyApCiAgICAgewotICAgICAgICBpbnQgcmM7CisgICAg
ICAgIGlmICggIXNlY3Rpb25fb2soZWxmLCBzZWMsIHNpemVvZigqcGF5bG9hZC0+ZnVuY3MpKSAp
CisgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAotICAgICAgICBmID0gJihwYXlsb2FkLT5m
dW5jc1tpXSk7CisgICAgICAgIHBheWxvYWQtPmZ1bmNzID0gc2VjLT5sb2FkX2FkZHI7CisgICAg
ICAgIHBheWxvYWQtPm5mdW5jcyA9IHNlYy0+c2VjLT5zaF9zaXplIC8gc2l6ZW9mKCpwYXlsb2Fk
LT5mdW5jcyk7CiAKLSAgICAgICAgaWYgKCBmLT52ZXJzaW9uICE9IExJVkVQQVRDSF9QQVlMT0FE
X1ZFUlNJT04gKQorICAgICAgICBmb3IgKCBpID0gMDsgaSA8IHBheWxvYWQtPm5mdW5jczsgaSsr
ICkKICAgICAgICAgewotICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0gg
IiVzOiBXcm9uZyB2ZXJzaW9uICgldSkuIEV4cGVjdGVkICVkIVxuIiwKLSAgICAgICAgICAgICAg
ICAgICAgZWxmLT5uYW1lLCBmLT52ZXJzaW9uLCBMSVZFUEFUQ0hfUEFZTE9BRF9WRVJTSU9OKTsK
LSAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKLSAgICAgICAgfQorICAgICAgICAgICAg
aW50IHJjOwogCi0gICAgICAgIC8qICdvbGRfYWRkcicsICduZXdfYWRkcicsICduZXdfc2l6ZScg
Y2FuIGFsbCBiZSB6ZXJvLiAqLwotICAgICAgICBpZiAoICFmLT5vbGRfc2l6ZSApCi0gICAgICAg
IHsKLSAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENIICIlczogQWRkcmVz
cyBvciBzaXplIGZpZWxkcyBhcmUgemVybyFcbiIsCi0gICAgICAgICAgICAgICAgICAgIGVsZi0+
bmFtZSk7Ci0gICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKLSAgICAgICAgfQorICAgICAgICAg
ICAgZiA9ICYocGF5bG9hZC0+ZnVuY3NbaV0pOwogCi0gICAgICAgIHJjID0gYXJjaF9saXZlcGF0
Y2hfdmVyaWZ5X2Z1bmMoZik7Ci0gICAgICAgIGlmICggcmMgKQotICAgICAgICAgICAgcmV0dXJu
IHJjOworICAgICAgICAgICAgaWYgKCBmLT52ZXJzaW9uICE9IExJVkVQQVRDSF9QQVlMT0FEX1ZF
UlNJT04gKQorICAgICAgICAgICAgeworICAgICAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VS
UiwgTElWRVBBVENIICIlczogV3JvbmcgdmVyc2lvbiAoJXUpLiBFeHBlY3RlZCAlZCFcbiIsCisg
ICAgICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIGYtPnZlcnNpb24sIExJVkVQQVRDSF9Q
QVlMT0FEX1ZFUlNJT04pOworICAgICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKKyAg
ICAgICAgICAgIH0KIAotICAgICAgICByYyA9IHJlc29sdmVfb2xkX2FkZHJlc3MoZiwgZWxmKTsK
LSAgICAgICAgaWYgKCByYyApCi0gICAgICAgICAgICByZXR1cm4gcmM7CisgICAgICAgICAgICAv
KiAnb2xkX2FkZHInLCAnbmV3X2FkZHInLCAnbmV3X3NpemUnIGNhbiBhbGwgYmUgemVyby4gKi8K
KyAgICAgICAgICAgIGlmICggIWYtPm9sZF9zaXplICkKKyAgICAgICAgICAgIHsKKyAgICAgICAg
ICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRDSCAiJXM6IEFkZHJlc3Mgb3Igc2l6
ZSBmaWVsZHMgYXJlIHplcm8hXG4iLAorICAgICAgICAgICAgICAgICAgICAgICAgZWxmLT5uYW1l
KTsKKyAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICAgICAgICAgIH0KIAotICAg
ICAgICByYyA9IGxpdmVwYXRjaF92ZXJpZnlfZGlzdGFuY2UoZik7Ci0gICAgICAgIGlmICggcmMg
KQotICAgICAgICAgICAgcmV0dXJuIHJjOworICAgICAgICAgICAgcmMgPSBhcmNoX2xpdmVwYXRj
aF92ZXJpZnlfZnVuYyhmKTsKKyAgICAgICAgICAgIGlmICggcmMgKQorICAgICAgICAgICAgICAg
IHJldHVybiByYzsKKworICAgICAgICAgICAgcmMgPSByZXNvbHZlX29sZF9hZGRyZXNzKGYsIGVs
Zik7CisgICAgICAgICAgICBpZiAoIHJjICkKKyAgICAgICAgICAgICAgICByZXR1cm4gcmM7CisK
KyAgICAgICAgICAgIHJjID0gbGl2ZXBhdGNoX3ZlcmlmeV9kaXN0YW5jZShmKTsKKyAgICAgICAg
ICAgIGlmICggcmMgKQorICAgICAgICAgICAgICAgIHJldHVybiByYzsKKyAgICAgICAgfQogICAg
IH0KIAotICAgIExJVkVQQVRDSF9BU1NJR05fTVVMVElfSE9PSyhlbGYsIHBheWxvYWQtPmxvYWRf
ZnVuY3MsIHBheWxvYWQtPm5fbG9hZF9mdW5jcywgIi5saXZlcGF0Y2guaG9va3MubG9hZCIpOwot
ICAgIExJVkVQQVRDSF9BU1NJR05fTVVMVElfSE9PSyhlbGYsIHBheWxvYWQtPnVubG9hZF9mdW5j
cywgcGF5bG9hZC0+bl91bmxvYWRfZnVuY3MsICIubGl2ZXBhdGNoLmhvb2tzLnVubG9hZCIpOwor
ICAgIExJVkVQQVRDSF9BU1NJR05fTVVMVElfSE9PSyhlbGYsIHBheWxvYWQtPmxvYWRfZnVuY3Ms
IHBheWxvYWQtPm5fbG9hZF9mdW5jcywgRUxGX0xJVkVQQVRDSF9MT0FEX0hPT0tTKTsKKyAgICBM
SVZFUEFUQ0hfQVNTSUdOX01VTFRJX0hPT0soZWxmLCBwYXlsb2FkLT51bmxvYWRfZnVuY3MsIHBh
eWxvYWQtPm5fdW5sb2FkX2Z1bmNzLCBFTEZfTElWRVBBVENIX1VOTE9BRF9IT09LUyk7CiAKLSAg
ICBMSVZFUEFUQ0hfQVNTSUdOX1NJTkdMRV9IT09LKGVsZiwgcGF5bG9hZC0+aG9va3MuYXBwbHku
cHJlLCAiLmxpdmVwYXRjaC5ob29rcy5wcmVhcHBseSIpOwotICAgIExJVkVQQVRDSF9BU1NJR05f
U0lOR0xFX0hPT0soZWxmLCBwYXlsb2FkLT5ob29rcy5hcHBseS5hY3Rpb24sICIubGl2ZXBhdGNo
Lmhvb2tzLmFwcGx5Iik7Ci0gICAgTElWRVBBVENIX0FTU0lHTl9TSU5HTEVfSE9PSyhlbGYsIHBh
eWxvYWQtPmhvb2tzLmFwcGx5LnBvc3QsICIubGl2ZXBhdGNoLmhvb2tzLnBvc3RhcHBseSIpOwor
ICAgIExJVkVQQVRDSF9BU1NJR05fU0lOR0xFX0hPT0soZWxmLCBwYXlsb2FkLT5ob29rcy5hcHBs
eS5wcmUsIEVMRl9MSVZFUEFUQ0hfUFJFQVBQTFlfSE9PSyk7CisgICAgTElWRVBBVENIX0FTU0lH
Tl9TSU5HTEVfSE9PSyhlbGYsIHBheWxvYWQtPmhvb2tzLmFwcGx5LmFjdGlvbiwgRUxGX0xJVkVQ
QVRDSF9BUFBMWV9IT09LKTsKKyAgICBMSVZFUEFUQ0hfQVNTSUdOX1NJTkdMRV9IT09LKGVsZiwg
cGF5bG9hZC0+aG9va3MuYXBwbHkucG9zdCwgRUxGX0xJVkVQQVRDSF9QT1NUQVBQTFlfSE9PSyk7
CiAKLSAgICBMSVZFUEFUQ0hfQVNTSUdOX1NJTkdMRV9IT09LKGVsZiwgcGF5bG9hZC0+aG9va3Mu
cmV2ZXJ0LnByZSwgIi5saXZlcGF0Y2guaG9va3MucHJlcmV2ZXJ0Iik7Ci0gICAgTElWRVBBVENI
X0FTU0lHTl9TSU5HTEVfSE9PSyhlbGYsIHBheWxvYWQtPmhvb2tzLnJldmVydC5hY3Rpb24sICIu
bGl2ZXBhdGNoLmhvb2tzLnJldmVydCIpOwotICAgIExJVkVQQVRDSF9BU1NJR05fU0lOR0xFX0hP
T0soZWxmLCBwYXlsb2FkLT5ob29rcy5yZXZlcnQucG9zdCwgIi5saXZlcGF0Y2guaG9va3MucG9z
dHJldmVydCIpOworICAgIExJVkVQQVRDSF9BU1NJR05fU0lOR0xFX0hPT0soZWxmLCBwYXlsb2Fk
LT5ob29rcy5yZXZlcnQucHJlLCBFTEZfTElWRVBBVENIX1BSRVJFVkVSVF9IT09LKTsKKyAgICBM
SVZFUEFUQ0hfQVNTSUdOX1NJTkdMRV9IT09LKGVsZiwgcGF5bG9hZC0+aG9va3MucmV2ZXJ0LmFj
dGlvbiwgRUxGX0xJVkVQQVRDSF9SRVZFUlRfSE9PSyk7CisgICAgTElWRVBBVENIX0FTU0lHTl9T
SU5HTEVfSE9PSyhlbGYsIHBheWxvYWQtPmhvb2tzLnJldmVydC5wb3N0LCBFTEZfTElWRVBBVENI
X1BPU1RSRVZFUlRfSE9PSyk7CiAKICAgICBzZWMgPSBsaXZlcGF0Y2hfZWxmX3NlY19ieV9uYW1l
KGVsZiwgRUxGX0JVSUxEX0lEX05PVEUpOwogICAgIGlmICggc2VjICkKQEAgLTkwNCw2ICs5NjMs
MTAgQEAgc3RhdGljIGludCBsb2FkX3BheWxvYWRfZGF0YShzdHJ1Y3QgcGF5bG9hZCAqcGF5bG9h
ZCwgdm9pZCAqcmF3LCBzaXplX3QgbGVuKQogICAgIGlmICggcmMgKQogICAgICAgICBnb3RvIG91
dDsKIAorICAgIHJjID0gY2hlY2tfcGF0Y2hpbmdfc2VjdGlvbnMoJmVsZik7CisgICAgaWYgKCBy
YyApCisgICAgICAgIGdvdG8gb3V0OworCiAgICAgcmMgPSBwcmVwYXJlX3BheWxvYWQocGF5bG9h
ZCwgJmVsZik7CiAgICAgaWYgKCByYyApCiAgICAgICAgIGdvdG8gb3V0OwpkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oIGIveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5o
CmluZGV4IGVkOTk3YWE0Y2MuLjJhZWM1MzJlZTIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hl
bi9saXZlcGF0Y2guaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoLmgKQEAgLTMzLDYg
KzMzLDE0IEBAIHN0cnVjdCB4ZW5fc3lzY3RsX2xpdmVwYXRjaF9vcDsKICNkZWZpbmUgRUxGX0xJ
VkVQQVRDSF9ERVBFTkRTICAgICAiLmxpdmVwYXRjaC5kZXBlbmRzIgogI2RlZmluZSBFTEZfTElW
RVBBVENIX1hFTl9ERVBFTkRTICIubGl2ZXBhdGNoLnhlbl9kZXBlbmRzIgogI2RlZmluZSBFTEZf
QlVJTERfSURfTk9URSAgICAgICAgICIubm90ZS5nbnUuYnVpbGQtaWQiCisjZGVmaW5lIEVMRl9M
SVZFUEFUQ0hfTE9BRF9IT09LUyAgICAgICIubGl2ZXBhdGNoLmhvb2tzLmxvYWQiCisjZGVmaW5l
IEVMRl9MSVZFUEFUQ0hfVU5MT0FEX0hPT0tTICAgICIubGl2ZXBhdGNoLmhvb2tzLnVubG9hZCIK
KyNkZWZpbmUgRUxGX0xJVkVQQVRDSF9QUkVBUFBMWV9IT09LICAgIi5saXZlcGF0Y2guaG9va3Mu
cHJlYXBwbHkiCisjZGVmaW5lIEVMRl9MSVZFUEFUQ0hfQVBQTFlfSE9PSyAgICAgICIubGl2ZXBh
dGNoLmhvb2tzLmFwcGx5IgorI2RlZmluZSBFTEZfTElWRVBBVENIX1BPU1RBUFBMWV9IT09LICAi
LmxpdmVwYXRjaC5ob29rcy5wb3N0YXBwbHkiCisjZGVmaW5lIEVMRl9MSVZFUEFUQ0hfUFJFUkVW
RVJUX0hPT0sgICIubGl2ZXBhdGNoLmhvb2tzLnByZXJldmVydCIKKyNkZWZpbmUgRUxGX0xJVkVQ
QVRDSF9SRVZFUlRfSE9PSyAgICAgIi5saXZlcGF0Y2guaG9va3MucmV2ZXJ0IgorI2RlZmluZSBF
TEZfTElWRVBBVENIX1BPU1RSRVZFUlRfSE9PSyAiLmxpdmVwYXRjaC5ob29rcy5wb3N0cmV2ZXJ0
IgogLyogQXJiaXRyYXJ5IGxpbWl0IGZvciBwYXlsb2FkIHNpemUgYW5kIC5ic3Mgc2VjdGlvbiBz
aXplLiAqLwogI2RlZmluZSBMSVZFUEFUQ0hfTUFYX1NJWkUgICAgIE1CKDIpCiAKLS0gCjIuMTYu
NQoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4g
MzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwg
UmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1
bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
