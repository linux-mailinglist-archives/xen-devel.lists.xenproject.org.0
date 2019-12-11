Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 955FA11A8B9
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 11:18:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iez1V-0001bB-1N; Wed, 11 Dec 2019 10:15:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9l2=2B=amazon.com=prvs=241e421da=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iez1T-0001b6-E9
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 10:15:11 +0000
X-Inumbo-ID: 1c99b4a2-1bff-11ea-8aea-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c99b4a2-1bff-11ea-8aea-12813bfff9fa;
 Wed, 11 Dec 2019 10:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576059311; x=1607595311;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QAxEg8wAMpeQpGJaY0emkukCqNQsOl8+HnDT4r3pg28=;
 b=ZYQ0EUrhMz35r5tq29bOdkGyAbp1dNaVCwzQrPKSZmyD9skDf0EeiwQU
 lPqSLg9X50bdRuLdTVsEfJQ1Sdqgq79lzm8OX/Rp6MtoDahNbswfT+b9N
 RAwOZv6uWgGal7oik4+Y78Lac+/YdR5sgz82aam5PcheZ0fiTzlLnkqks E=;
IronPort-SDR: TlUAzD03+db+XnCJ5SOx7jg8iAfAJAsCWzYeaF5UYwd4Ir/j6CHWtxsj3vujq21Oo9aEwN3lFc
 ATTxI2ku0eEg==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; 
   d="scan'208";a="8587630"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 11 Dec 2019 10:15:03 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 27B06A29F7; Wed, 11 Dec 2019 10:15:01 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 10:15:00 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 10:15:00 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 11 Dec 2019 10:14:59 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2 2/4] xenbus: limit when state is forced to
 closed
Thread-Index: AQHVr029Jnf5zy5/UEOnUavFsd58GKe0trGAgAABW5A=
Date: Wed, 11 Dec 2019 10:14:59 +0000
Message-ID: <86a7d140501047028c49736c43fe547c@EX13D32EUC003.ant.amazon.com>
References: <20191210113347.3404-1-pdurrant@amazon.com>
 <20191210113347.3404-3-pdurrant@amazon.com>
 <20191211100627.GI980@Air-de-Roger>
In-Reply-To: <20191211100627.GI980@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.120]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 2/4] xenbus: limit when state is forced
 to closed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFNlbnQ6IDExIERlY2VtYmVyIDIwMTkgMTA6MDYKPiBUbzog
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBKdWVyZ2VuCj4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47Cj4gQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNv
bT4KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYyIDIvNF0geGVuYnVzOiBsaW1p
dCB3aGVuIHN0YXRlIGlzIGZvcmNlZAo+IHRvIGNsb3NlZAo+IAo+IE9uIFR1ZSwgRGVjIDEwLCAy
MDE5IGF0IDExOjMzOjQ1QU0gKzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+IElmIGEgZHJp
dmVyIHByb2JlKCkgZmFpbHMgdGhlbiBsZWF2ZSB0aGUgeGVuc3RvcmUgc3RhdGUgYWxvbmUuIFRo
ZXJlIGlzCj4gbm8KPiA+IHJlYXNvbiB0byBtb2RpZnkgaXQgYXMgdGhlIGZhaWx1cmUgbWF5IGJl
IGR1ZSB0byB0cmFuc2llbnQgcmVzb3VyY2UKPiA+IGFsbG9jYXRpb24gaXNzdWVzIGFuZCBoZW5j
ZSBhIHN1YnNlcXVlbnQgcHJvYmUoKSBtYXkgc3VjY2VlZC4KPiA+Cj4gPiBJZiB0aGUgZHJpdmVy
IHN1cHBvcnRzIHJlLWJpbmRpbmcgdGhlbiBvbmx5IGZvcmNlIHN0YXRlIHRvIGNsb3NlZCBkdXJp
bmcKPiA+IHJlbW92ZSgpIG9ubHkgaW4gdGhlIGNhc2Ugd2hlbiB0aGUgdG9vbHN0YWNrIG1heSBu
ZWVkIHRvIGNsZWFuIHVwLiBUaGlzCj4gY2FuCj4gPiBiZSBkZXRlY3RlZCBieSBjaGVja2luZyB3
aGV0aGVyIHRoZSBzdGF0ZSBpbiB4ZW5zdG9yZSBoYXMgYmVlbiBzZXQgdG8KPiA+IGNsb3Npbmcg
cHJpb3IgdG8gZGV2aWNlIHJlbW92YWwuCj4gPgo+ID4gTk9URTogUmUtYmluZCBzdXBwb3J0IGlz
IGluZGljYXRlZCBieSBuZXcgYm9vbGVhbiBpbiBzdHJ1Y3QKPiB4ZW5idXNfZHJpdmVyLAo+ID4g
ICAgICAgd2hpY2ggZGVmYXVsdHMgdG8gZmFsc2UuIFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIGFk
ZCBzdXBwb3J0IHRvCj4gPiAgICAgICBzb21lIGJhY2tlbmQgZHJpdmVycy4KPiAKPiBNeSBpbnRl
bnRpb24gd2FzIHRvIHNwZWNpZnkgd2hldGhlciB5b3Ugd2FudCB0byBjbG9zZSB0aGUKPiBiYWNr
ZW5kcyBvbiB1bmJpbmQgaW4gc3lzZnMsIHNvIHRoYXQgYW4gdXNlciBjYW4gZGVjaWRlIGF0IHJ1
bnRpbWUsCj4gcmF0aGVyIHRoYW4gaGF2aW5nIGEgaGFyZGNvZGVkIHZhbHVlIGluIHRoZSBkcml2
ZXIuCj4gCj4gQW55d2F5LCBJJ20gbGVzcyBzdXJlIHdoZXRoZXIgc3VjaCBydW50aW1lIHR1bmFi
bGUgaXMgdXNlZnVsIGF0IGFsbCwKPiBzbyBsZXQncyBsZWF2ZSBpdCBvdXQgYW5kIGNhbiBhbHdh
eXMgYmUgYWRkZWQgYWZ0ZXJ3YXJkcy4gQXQgdGhlIGVuZAo+IG9mIGRheSBhIHVzZXIgd3Jvbmds
eSBkb2luZyBhIHJtbW9kIGJsa2JhY2sgY2FuIGFsd2F5cyByZWNvdmVyCj4gZ3JhY2VmdWxseSBi
eSBsb2FkaW5nIGJsa2JhY2sgYWdhaW4gd2l0aCB5b3VyIHByb3Bvc2VkIGFwcHJvYWNoIHRvCj4g
bGVhdmUgY29ubmVjdGlvbnMgb3BlbiBvbiBtb2R1bGUgcmVtb3ZhbC4KPiAKPiBTb3JyeSBmb3Ig
dGhlIGV4dHJhIHdvcmsuCj4gCgpEb2VzIHRoaXMgbWVhbiB5b3UgZG9uJ3QgdGhpbmsgdGhlIGV4
dHJhIGRyaXZlciBmbGFnIGlzIG5lY2Vzc2FyeSBhbnkgbW9yZT8gTkI6IG5vdyB0aGF0IHhlbmJ1
cyBhY3R1YWxseSB0YWtlcyBtb2R1bGUgcmVmZXJlbmNlcyB5b3UgY2FuJ3QgYWNjaWRlbnRhbGx5
IHJtbW9kIGFueSBtb3JlIDotKQoKICBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
