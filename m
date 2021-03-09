Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B2A332834
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 15:10:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95476.180272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJd42-0008Gp-QP; Tue, 09 Mar 2021 14:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95476.180272; Tue, 09 Mar 2021 14:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJd42-0008GQ-N4; Tue, 09 Mar 2021 14:10:22 +0000
Received: by outflank-mailman (input) for mailman id 95476;
 Tue, 09 Mar 2021 14:10:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGpp=IH=amazon.com=prvs=6954daadc=andyhsu@srs-us1.protection.inumbo.net>)
 id 1lJd41-0008GL-Ug
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:10:21 +0000
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6795f7e-60c9-4c60-a1db-2d8f861f6134;
 Tue, 09 Mar 2021 14:10:21 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-e69428c4.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 09 Mar 2021 14:10:15 +0000
Received: from EX13D12EUA001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1d-e69428c4.us-east-1.amazon.com (Postfix) with ESMTPS
 id D86F9C081F
 for <xen-devel@lists.xenproject.org>; Tue,  9 Mar 2021 14:10:13 +0000 (UTC)
Received: from EX13D12EUA002.ant.amazon.com (10.43.165.103) by
 EX13D12EUA001.ant.amazon.com (10.43.165.48) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 9 Mar 2021 14:10:12 +0000
Received: from EX13D12EUA002.ant.amazon.com ([10.43.165.103]) by
 EX13D12EUA002.ant.amazon.com ([10.43.165.103]) with mapi id 15.00.1497.012;
 Tue, 9 Mar 2021 14:10:12 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d6795f7e-60c9-4c60-a1db-2d8f861f6134
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1615299022; x=1646835022;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=n3fVoOlqvOn69GDOJ2orF6qiOsuOKIaHcOrcPH2dSJg=;
  b=MZ6jMSJPiGgDuGvS4r2Cr2TwDLTizznuiBHT42F5SoJ6pANCmGwKhPgB
   JZpByg1lh0Nnd+Nhkl8f7/2RqdycB2XhKSS8HdtX4Sr3UYnQe8RHy8FbV
   UEwJoeIrffsTDOhUk6QcDUz7xIJhSiqTidnGjIVInewQ5iX81x/MQU2A9
   0=;
X-IronPort-AV: E=Sophos;i="5.81,234,1610409600"; 
   d="scan'208";a="95673226"
From: "Hsu, Chiahao" <andyhsu@amazon.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen-netback: add module parameter to disable
 ctrl-ring
Thread-Topic: [PATCH 1/2] xen-netback: add module parameter to disable
 ctrl-ring
Thread-Index: AQHXC3Ho66sjBAH4ck+AJsybt15sHap71bYA
Date: Tue, 9 Mar 2021 14:10:12 +0000
Message-ID: <CEC939E8-3F18-46A0-B7B6-ECBE97678DAC@amazon.com>
References: <20210225122940.9310-1-andyhsu@amazon.com>
In-Reply-To: <20210225122940.9310-1-andyhsu@amazon.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.171]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA82232A61644340AF0483BC00B4309B@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

DQoNCu+7v09uIDI1LjAyLjIxLCAxMzoyOSwgIkhzdSwgQ2hpYWhhbyIgPGFuZHloc3VAYW1hem9u
LmNvbT4gd3JvdGU6DQoNCiAgICBJbiBvcmRlciB0byBzdXBwb3J0IGxpdmUgbWlncmF0aW9uIG9m
IGd1ZXN0cyBiZXR3ZWVuIGtlcm5lbHMNCiAgICB0aGF0IGRvIGFuZCBkbyBub3Qgc3VwcG9ydCAn
ZmVhdHVyZS1jdHJsLXJpbmcnLCB3ZSBhZGQgYQ0KICAgIG1vZHVsZSBwYXJhbWV0ZXIgdGhhdCBh
bGxvd3MgdGhlIGZlYXR1cmUgdG8gYmUgZGlzYWJsZWQNCiAgICBhdCBydW4gdGltZSwgaW5zdGVh
ZCBvZiB1c2luZyBoYXJkY29kZSB2YWx1ZS4NCiAgICBUaGUgZGVmYXVsdCB2YWx1ZSBpcyBlbmFi
bGUuDQoNCiAgICBTaWduZWQtb2ZmLWJ5OiBDaGlhSGFvIEhzdSA8YW5keWhzdUBhbWF6b24uY29t
Pg0KICAgIC0tLQ0KICAgICBkcml2ZXJzL25ldC94ZW4tbmV0YmFjay9jb21tb24uaCAgfCAgMiAr
Kw0KICAgICBkcml2ZXJzL25ldC94ZW4tbmV0YmFjay9uZXRiYWNrLmMgfCAgNiArKysrKysNCiAg
ICAgZHJpdmVycy9uZXQveGVuLW5ldGJhY2sveGVuYnVzLmMgIHwgMTMgKysrKysrKystLS0tLQ0K
ICAgICAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoN
CiAgICBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svY29tbW9uLmggYi9kcml2
ZXJzL25ldC94ZW4tbmV0YmFjay9jb21tb24uaA0KICAgIGluZGV4IDRhMTZkNmUzM2MwOS4uYmZi
N2EzMDU0OTE3IDEwMDY0NA0KICAgIC0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2NvbW1v
bi5oDQogICAgKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svY29tbW9uLmgNCiAgICBAQCAt
Mjc2LDYgKzI3Niw3IEBAIHN0cnVjdCBiYWNrZW5kX2luZm8gew0KICAgICAJdTggaGF2ZV9ob3Rw
bHVnX3N0YXR1c193YXRjaDoxOw0KDQogICAgIAljb25zdCBjaGFyICpob3RwbHVnX3NjcmlwdDsN
CiAgICArCWJvb2wgY3RybF9yaW5nX2VuYWJsZWQ7DQogICAgIH07DQoNCiAgICAgc3RydWN0IHhl
bnZpZiB7DQogICAgQEAgLTQxMyw2ICs0MTQsNyBAQCBzdGF0aWMgaW5saW5lIHBlbmRpbmdfcmlu
Z19pZHhfdCBucl9wZW5kaW5nX3JlcXMoc3RydWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUpDQoNCiAg
ICAgaXJxcmV0dXJuX3QgeGVudmlmX2ludGVycnVwdChpbnQgaXJxLCB2b2lkICpkZXZfaWQpOw0K
DQogICAgK2V4dGVybiBib29sIGNvbnRyb2xfcmluZzsNCiAgICAgZXh0ZXJuIGJvb2wgc2VwYXJh
dGVfdHhfcnhfaXJxOw0KICAgICBleHRlcm4gYm9vbCBwcm92aWRlc194ZHBfaGVhZHJvb207DQoN
CiAgICBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svbmV0YmFjay5jIGIvZHJp
dmVycy9uZXQveGVuLW5ldGJhY2svbmV0YmFjay5jDQogICAgaW5kZXggZTVjNzNmODE5NjYyLi4y
MGQ4NThmMDQ1NmEgMTAwNjQ0DQogICAgLS0tIGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svbmV0
YmFjay5jDQogICAgKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svbmV0YmFjay5jDQogICAg
QEAgLTQ4LDYgKzQ4LDEyIEBADQoNCiAgICAgI2luY2x1ZGUgPGFzbS94ZW4vaHlwZXJjYWxsLmg+
DQoNCiAgICArLyogUHJvdmlkZSBhbiBvcHRpb24gdG8gZGlzYWJsZSBjb250cm9sIHJpbmcgd2hp
Y2ggaXMgdXNlZCB0byBwYXNzDQogICAgKyAqIGxhcmdlIHF1YW50aXRpZXMgb2YgZGF0YSBmcm9t
IGZyb250ZW5kIHRvIGJhY2tlbmQuDQogICAgKyAqLw0KICAgICtib29sIGNvbnRyb2xfcmluZyA9
IHRydWU7DQogICAgK21vZHVsZV9wYXJhbShjb250cm9sX3JpbmcsIGJvb2wsIDA2NDQpOw0KICAg
ICsNCiAgICAgLyogUHJvdmlkZSBhbiBvcHRpb24gdG8gZGlzYWJsZSBzcGxpdCBldmVudCBjaGFu
bmVscyBhdCBsb2FkIHRpbWUgYXMNCiAgICAgICogZXZlbnQgY2hhbm5lbHMgYXJlIGxpbWl0ZWQg
cmVzb3VyY2UuIFNwbGl0IGV2ZW50IGNoYW5uZWxzIGFyZQ0KICAgICAgKiBlbmFibGVkIGJ5IGRl
ZmF1bHQuDQogICAgZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5j
IGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sveGVuYnVzLmMNCiAgICBpbmRleCBhNTQzOWMxMzAx
MzAuLjhhOTE2OWNmZjljNSAxMDA2NDQNCiAgICAtLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFj
ay94ZW5idXMuYw0KICAgICsrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5jDQog
ICAgQEAgLTExMjMsMTEgKzExMjMsMTQgQEAgc3RhdGljIGludCBuZXRiYWNrX3Byb2JlKHN0cnVj
dCB4ZW5idXNfZGV2aWNlICpkZXYsDQogICAgIAlpZiAoZXJyKQ0KICAgICAJCXByX2RlYnVnKCJF
cnJvciB3cml0aW5nIG11bHRpLXF1ZXVlLW1heC1xdWV1ZXNcbiIpOw0KDQogICAgLQllcnIgPSB4
ZW5idXNfcHJpbnRmKFhCVF9OSUwsIGRldi0+bm9kZW5hbWUsDQogICAgLQkJCSAgICAiZmVhdHVy
ZS1jdHJsLXJpbmciLA0KICAgIC0JCQkgICAgIiV1IiwgdHJ1ZSk7DQogICAgLQlpZiAoZXJyKQ0K
ICAgIC0JCXByX2RlYnVnKCJFcnJvciB3cml0aW5nIGZlYXR1cmUtY3RybC1yaW5nXG4iKTsNCiAg
ICArCWJlLT5jdHJsX3JpbmdfZW5hYmxlZCA9IFJFQURfT05DRShjb250cm9sX3JpbmcpOw0KICAg
ICsJaWYgKGJlLT5jdHJsX3JpbmdfZW5hYmxlZCkgew0KICAgICsJCWVyciA9IHhlbmJ1c19wcmlu
dGYoWEJUX05JTCwgZGV2LT5ub2RlbmFtZSwNCiAgICArCQkJCSAgICAiZmVhdHVyZS1jdHJsLXJp
bmciLA0KICAgICsJCQkJICAgICIldSIsIHRydWUpOw0KICAgICsJCWlmIChlcnIpDQogICAgKwkJ
CXByX2RlYnVnKCJFcnJvciB3cml0aW5nIGZlYXR1cmUtY3RybC1yaW5nXG4iKTsNCiAgICArCX0N
Cg0KICAgICAJYmFja2VuZF9zd2l0Y2hfc3RhdGUoYmUsIFhlbmJ1c1N0YXRlSW5pdFdhaXQpOw0K
DQogICAgLS0gDQogICAgMi4yMy4zDQoNCkdlbnRsZSBwaW5nLg0KDQo=

