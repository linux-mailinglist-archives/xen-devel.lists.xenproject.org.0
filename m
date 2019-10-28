Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC438E77BD
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 18:38:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP8si-0004kO-LT; Mon, 28 Oct 2019 17:32:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u9ZC=YV=amazon.co.uk=prvs=197879d93=rjstone@srs-us1.protection.inumbo.net>)
 id 1iP8qP-0004hQ-Et
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 17:30:17 +0000
X-Inumbo-ID: 9ac011ce-f9a8-11e9-94fc-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ac011ce-f9a8-11e9-94fc-12813bfff9fa;
 Mon, 28 Oct 2019 17:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1572283815; x=1603819815;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=Wqxm5F+pN2LKJ6GfaZtg5+vYZm6E9D7IT0lzJxndiGU=;
 b=iZDx6RKsjOZjmK4rbnG20grsrZs9g8BftM5sYLQW92PFgyVGn5CiVHOH
 6aGzc+cDN7QrCQliIhX6UMKjwZ3Agr88NylVFeP8QQIBCHat9t5xi8jZv
 zg1YT+LQtrIAY8ywLkgssp3JipJvpxcaO1aFm7V6IFdeJtp9Tl1/OH56p s=;
IronPort-SDR: gCFBJEZIs85o8oUIcF+WmL/vId7kH99wEtw6z1jAQpSUQEEcGWeVEHdBIJbAi3nSCrDvZHRhfL
 OorUva5dPSvQ==
X-IronPort-AV: E=Sophos;i="5.68,240,1569283200"; 
   d="scan'208";a="1220585"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 28 Oct 2019 17:30:15 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id B0D5DA24F8; Mon, 28 Oct 2019 17:30:14 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 28 Oct 2019 17:30:13 +0000
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 28 Oct 2019 17:30:13 +0000
Received: from EX13D32EUB004.ant.amazon.com ([10.43.166.212]) by
 EX13D32EUB004.ant.amazon.com ([10.43.166.212]) with mapi id 15.00.1367.000;
 Mon, 28 Oct 2019 17:30:13 +0000
From: "Stonehouse, Robert" <rjstone@amazon.co.uk>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [stable-4.11] Heads-up: c719519 (x86/SMP: don't try to stop
 already stopped CPUs) causes 100% kexec/kdump failure
Thread-Index: AQHVjbVaB/Vr+HbUnE+siwwtUNCppw==
Date: Mon, 28 Oct 2019 17:30:12 +0000
Message-ID: <D5940155-716B-48BE-A00B-36FC0B5B41A9@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.15]
Content-ID: <1DF1B47DA90CE3418E1AC9E65FC06A61@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
X-Mailman-Approved-At: Mon, 28 Oct 2019 17:32:39 +0000
Subject: [Xen-devel] [stable-4.11] Heads-up: c719519 (x86/SMP: don't try to
 stop already stopped CPUs) causes 100% kexec/kdump failure
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Durrant, Paul" <pdurrant@amazon.com>, "Stonehouse,
 Robert" <rjstone@amazon.co.uk>, "Elnikety, Eslam" <elnikety@amazon.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhIGhlYWRzLXVwIGFzIEkgaGF2ZSBvYnNlcnZlZCB0aGF0IHRoZSBmb2xsb3dpbmcg
Y29tbWl0IChiYWNrcG9ydGVkIG9udG8gYW4gQW1hem9uIDQuMTEgdHJlZSkgY2F1c2VzIGtleGVj
IChhbmQgaGVuY2Uga2R1bXApIHRvIGZhaWwuIA0KPT09PT09PT0NCmNvbW1pdCBjNzE5NTE5YTQx
ODNkMDYzMDEyMWY2YWJlYmE0MjBmNDlkYmMzMjI5DQpBdXRob3I6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NCkF1dGhvckRhdGU6IEZyaSBKdWwgNSAxMDozMjo0MSAyMDE5ICswMjAw
DQpDb21taXQ6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCkNvbW1pdERhdGU6IEZy
aSBKdWwgNSAxMDozMjo0MSAyMDE5ICswMjAwDQoNCng4Ni9TTVA6IGRvbid0IHRyeSB0byBzdG9w
IGFscmVhZHkgc3RvcHBlZCBDUFVzDQogICAgDQogICAgSW4gcGFydGljdWxhciB3aXRoIGFuIGVu
YWJsZWQgSU9NTVUgKGJ1dCBub3QgcmVhbGx5IGxpbWl0ZWQgdG8gdGhpcw0KICAgIGNhc2UpLCB0
cnlpbmcgdG8gaW52b2tlIGZpeHVwX2lycXMoKSBhZnRlciBoYXZpbmcgYWxyZWFkeSBkb25lDQog
ICAgZGlzYWJsZV9JT19BUElDKCkgLT4gY2xlYXJfSU9fQVBJQygpIGlzIGEgcmF0aGVyIGJhZCBp
ZGVhOg0KPT09PT09PT0NCg0KVGhlIHRlc3Qgd2FzIHBlcmZvcm1pbmcgImVjaG8gYyA+IC9wcm9j
L3N5c3JxLXRyaWdnZXIiIGluIGRvbTAgYW5kIHRoZSBsb2FkZWQgY3Jhc2gga2VybmVsIGZhaWxz
IHRvIHNob3cgYW55IHNpZ25zIG9mIHN0YXJ0aW5nLiBUaGlzIGlzIHRoZSBlbmQgb2YgdGhlIFhl
biBjb25zb2xlIC4uLg0KPT09PT09PT0NCihYRU4pIEhhcmR3YXJlIERvbTAgY3Jhc2hlZDogcmVi
b290aW5nIG1hY2hpbmUgaW4gNSBzZWNvbmRzLg0KKFhFTikgUmVzZXR0aW5nIHdpdGggQUNQSSBN
RU1PUlkgb3IgSS9PIFJFU0VUX1JFRy4NCjxtYWNoaW5lIGhhbmdzIGhlcmUgdGhlbiByZWJvb3Rz
IHZpYSB0aGUgQklPUyBhZnRlciA1IHNlY29uZHM+DQo9PT09PT09PQ0KRXhwZWN0ZWQgYmVoYXZp
b3VyIGlzIHRoYXQgdGhlIGtkdW1wIGtlcm5lbCBpbW1lZGlhdGVseSBsb2FkcyBhbmQgdGhlbiBw
ZXJmb3JtcyB0aGUgY3Jhc2ggZHVtcA0KDQpJJ20gc29ycnkgdGhhdCBJIGhhdmUgbm90IHlldCBo
YWQgdGltZSB0byBjaGVjayBpZiB0aGlzIGFmZmVjdHMgdmFuaWxsYSBzdGFibGUtNC4xMSBvciBt
YXN0ZXIuIEkganVzdCB3YW50ZWQgdG8gYmUgY2VydGFpbiB0aGF0IHlvdSBkb24ndCBoYXZlIHRo
ZSBzYW1lIGlzc3VlLg0KDQoNClJldmVydGluZyBvbmUgaHVuayB2aWEgdGhlIGZvbGxvd2luZyBj
b21taXQgZml4ZXMgdGhpbmdzIGZvciBtZSAodGhpcyBpcyBhbiBleHBlcmltZW50IGFuZCBub3Qg
YXQgYWxsIGEgcHJvcG9zZWQgZml4KQ0KPT09PT09PT0NCi0tLSBhL3hlbi9hcmNoL3g4Ni9zbXAu
Yw0KKysrIGIveGVuL2FyY2gveDg2L3NtcC5jDQpAQCAtMzAzLDE1ICszMDMsMTUgQEAgc3RhdGlj
IHZvaWQgc3RvcF90aGlzX2NwdSh2b2lkICpkdW1teSkNCiB2b2lkIHNtcF9zZW5kX3N0b3Aodm9p
ZCkNCiB7DQogICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7DQorICAg
IA0KKyAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOw0KKyAgICBmaXh1cF9pcnFzKGNwdW1hc2tfb2Yo
Y3B1KSwgMCk7DQorICAgIGxvY2FsX2lycV9lbmFibGUoKTsNCiANCiAgICAgaWYgKCBudW1fb25s
aW5lX2NwdXMoKSA+IDEgKQ0KICAgICB7DQogICAgICAgICBpbnQgdGltZW91dCA9IDEwOw0KIA0K
LSAgICAgICAgbG9jYWxfaXJxX2Rpc2FibGUoKTsNCi0gICAgICAgIGZpeHVwX2lycXMoY3B1bWFz
a19vZihjcHUpLCAwKTsNCi0gICAgICAgIGxvY2FsX2lycV9lbmFibGUoKTsNCi0NCiAgICAgICAg
IHNtcF9jYWxsX2Z1bmN0aW9uKHN0b3BfdGhpc19jcHUsIE5VTEwsIDApOw0KIA0KICAgICAgICAg
LyogV2FpdCAxMG1zIGZvciBhbGwgb3RoZXIgQ1BVcyB0byBnbyBvZmZsaW5lLiAqLw0KPT09PT09
PT0NCg0KUmVnYXJkcw0KUm9iDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
