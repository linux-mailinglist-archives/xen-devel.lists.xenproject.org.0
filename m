Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0166DB60D7
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 11:55:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAWdT-00036l-Pl; Wed, 18 Sep 2019 09:52:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YCyf=XN=amazon.de=prvs=1574f1310=wipawel@srs-us1.protection.inumbo.net>)
 id 1iAWdS-00036g-K6
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 09:52:30 +0000
X-Inumbo-ID: 0750b56a-d9fa-11e9-962b-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0750b56a-d9fa-11e9-962b-12813bfff9fa;
 Wed, 18 Sep 2019 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568800349; x=1600336349;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=eZeSAG0H1cucWjuzL3ckw61cYjzqPDnLtYoo3Mk1Kp0=;
 b=qa9ltbFYvqGHBJaJIgrzq2h2et9kOpVBeF9q4/AF+szkubzj2ouIFM6t
 SW9Np+XfXakvDmydT/7tctHVzhwx83B/p1lwHyKjCSHZ/tV7aI9s9zdwk
 a863BPGm2lF9mI44o6VRDIsgly27HmfE2Tu20/eP6VOrbCSYVKgeSWdaI c=;
X-IronPort-AV: E=Sophos;i="5.64,520,1559520000"; d="scan'208";a="421785472"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 18 Sep 2019 09:52:28 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8A7A8A297A; Wed, 18 Sep 2019 09:52:25 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Sep 2019 09:52:24 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Sep 2019 09:52:23 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Wed, 18 Sep 2019 09:52:23 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Jan Beulich <jbeulich@suse.com>, Lars Kurth <lars.kurth@citrix.com>
Thread-Topic: [PATCH] create-diff-object: more precisely identify .rodata
 sections
Thread-Index: AQHVbfOz/MMBt+ID2EWJUuzwV092UacxMOkAgAAAuYA=
Date: Wed, 18 Sep 2019 09:52:23 +0000
Message-ID: <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
References: <20190918073538.24707-1-wipawel@amazon.de>
 <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
In-Reply-To: <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.196]
Content-ID: <52DAE7516F239F4B90F0DF0885B7AD88@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, "Pohlack, 
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE4LiBTZXAgMjAxOSwgYXQgMTE6NDksIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4gCj4gT24gMTguMDkuMjAxOSAwOTozNSwgUGF3ZWwgV2llY3pvcmtpZXdp
Y3ogd3JvdGU6Cj4+IFRoaXMgaXMgbmVlZGVkIGZvciBtb3JlIHByZWNpc2UgcGF0Y2hhYmlsaXR5
IHZlcmlmaWNhdGlvbi4KPj4gT25seSBub24tc3BlY2lhbCAucm9kYXRhIHNlY3Rpb25zIHNob3Vs
ZCBiZSBzdWJqZWN0Cj4+IGZvciBzdWNoIGEgbm9uLXJlZmVyZW5jZWQgY2hlY2sgaW4ga3BhdGNo
X3ZlcmlmeV9wYXRjaGFiaWxpdHkoKS4KPj4gQ3VycmVudCBjaGVjayAobm9uLXN0YW5kYXJkLCBu
b24tcmVsYSwgbm9uLWRlYnVnKSBpcyB0b28gd2VhayBhbmQKPj4gYWxsb3dzIGFsc28gbm9uLXJv
ZGF0YSBzZWN0aW9ucyB3aXRob3V0IHJlZmVyZW5jZWQgc3ltYm9scyB0byBzbGlwCj4+IHRocm91
Z2guCj4+IAo+PiBEZXRlY3QgLnJvZGF0YSBzZWN0aW9uIGJ5IGNoZWNraW5nIHNlY3Rpb24ncyB0
eXBlIChTSFRfUFJPR0JJVFMpLAo+PiBmbGFncyAobm8gZXhlYywgbm8gd3JpdGUpIGFuZCBmaW5h
bGx5IG5hbWUgcHJlZml4Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdp
Y3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+PiBSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNj
aGl2IDxhbmRyYXByc0BhbWF6b24uY29tPgo+PiBSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8
ZG9lYmVsQGFtYXpvbi5kZT4KPj4gUmV2aWV3ZWQtYnk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRo
ZXlAYW1hem9uLmRlPgo+PiAtLS0KPj4gY29tbW9uLmMgICAgICAgICAgICAgfCAgNyArKysrKysr
Cj4+IGNvbW1vbi5oICAgICAgICAgICAgIHwgIDEgKwo+PiBjcmVhdGUtZGlmZi1vYmplY3QuYyB8
IDEzICsrKysrKy0tLS0tLS0KPj4gMyBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQo+IAo+IFNlZWluZyB0aGF0IEkgaGF2ZSBiZWVuIENjLWVkIGhlcmUgLSB3
aGF0IHRyZWUgaXMgdGhpcyBhZ2FpbnN0PyBJCj4gZG9uJ3QgcmVjb2duaXplIHRoZSBmaWxlIG5h
bWVzIGFzIGFueXRoaW5nIEknbSBhIG1haW50YWluZXIgZm9yLgo+IAo+IEphbgoKWW91IGhhdmUg
YmVlbiBwcm9iYWJseSBhZGRlZCBiZWNhdXNlIEkgaGF2ZSB1c2VkIHRoZSBmb2xsb3dpbmcgY29t
bWFuZDoKCiQgc2NyaXB0cy8uL2FkZF9tYWludGFpbmVycy5wbCAtZCB+L2dpdC9saXZlcGF0Y2gt
YnVpbGQtdG9vbHMKCkBMYXJzOiBjb3VsZCB5b3UgY29uZmlybT8KCkJlc3QgUmVnYXJkcywKUGF3
ZWwgV2llY3pvcmtpZXdpY3oKCgoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55
IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hy
aXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNo
dCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDog
REUgMjg5IDIzNyA4NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
