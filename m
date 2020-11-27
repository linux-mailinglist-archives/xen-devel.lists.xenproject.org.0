Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B6D2C6980
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 17:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39642.72598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kigkZ-000551-04; Fri, 27 Nov 2020 16:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39642.72598; Fri, 27 Nov 2020 16:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kigkY-00054c-TL; Fri, 27 Nov 2020 16:37:34 +0000
Received: by outflank-mailman (input) for mailman id 39642;
 Fri, 27 Nov 2020 16:37:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oh9M=FB=amazon.co.uk=prvs=5939a8474=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kigkW-00054W-Jm
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 16:37:32 +0000
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bf6e1d7-9aa5-4140-8273-41b02bae612d;
 Fri, 27 Nov 2020 16:37:31 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 27 Nov 2020 16:37:19 +0000
Received: from EX13D37EUB002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS
 id D1A36A1D03; Fri, 27 Nov 2020 16:32:17 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D37EUB002.ant.amazon.com (10.43.166.116) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 27 Nov 2020 16:32:16 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 27 Nov 2020 16:32:15 +0000
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
X-Inumbo-ID: 1bf6e1d7-9aa5-4140-8273-41b02bae612d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1606495052; x=1638031052;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=lsH0YtbvDGLPC3AHBCFVFlW7qogk8BVDAthYXSFA5u0=;
  b=M7IAh6I/RimXacHhilP6n1ClwNNlAHjDp+w3y/mj53FdYIP5Lgh1Hp10
   mK08V3EHijmmHP+br9ulPjbyCUry8eESHddWh8YLsOLt0QHWi7GXE8FKF
   +Hpa7MT6CobplVQFeY2kZhVvk2MdfO2RNmNJVZmc1iJqh7t824Q18A/gE
   g=;
X-IronPort-AV: E=Sophos;i="5.78,375,1599523200"; 
   d="scan'208";a="98519313"
Subject: RE: [PATCH v10 0/7] IOMMU cleanup
Thread-Topic: [PATCH v10 0/7] IOMMU cleanup
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, "Grall,
 Julien" <jgrall@amazon.co.uk>, Jun Nakajima <jun.nakajima@intel.com>, "Kevin
 Tian" <kevin.tian@intel.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Thread-Index: AQHWxNloHBe1WIt8nku2zVDuU3dFH6ncK9/Q
Date: Fri, 27 Nov 2020 16:32:15 +0000
Message-ID: <4ec675a6344e46c4a50c4fbadc324bdb@EX13D32EUC003.ant.amazon.com>
References: <20201120132440.1141-1-paul@xen.org>
 <2015b3e8-0269-d9ba-c160-eb90b6ca3a99@suse.com>
In-Reply-To: <2015b3e8-0269-d9ba-c160-eb90b6ca3a99@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.145]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI3IE5vdmVtYmVyIDIwMjAgMTY6MjINCj4gVG86IFBhdWwg
RHVycmFudCA8cGF1bEB4ZW4ub3JnPg0KPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1h
em9uLmNvLnVrPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdl
b3JnZSBEdW5sYXANCj4gPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgR3JhbGwsIEp1bGllbg0KPiA8amdyYWxsQGFtYXpv
bi5jby51az47IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47IEtldmluIFRp
YW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgUm9nZXINCj4gUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsNCj4geGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
DQo+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxdIFtQQVRDSCB2MTAgMC83XSBJT01NVSBjbGVhbnVw
DQo+IA0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRo
ZSBvcmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuDQo+IGF0dGFjaG1lbnRz
IHVubGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBp
cyBzYWZlLg0KPiANCj4gDQo+IA0KPiBPbiAyMC4xMS4yMDIwIDE0OjI0LCBQYXVsIER1cnJhbnQg
d3JvdGU6DQo+ID4gRnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiA+
DQo+ID4gVGhpcyBpcyB0aGUgcmVtYWluZGVyIG9mIHRoZSBjbGVhbnVwIHNlcmllcyBkZWZlcnJl
ZCB1bnRpbCBYU0EtMzQ2IGFuZA0KPiA+IFhTQS0zNDcgd2VyZSBwdWJsaWNseSBkaXNjbG9zZWQu
DQo+ID4NCj4gPiBQYXVsIER1cnJhbnQgKDcpOg0KPiA+ICAgcmVtb3ZlIHJlbWFpbmluZyB1c2Vz
IG9mIGlvbW11X2xlZ2FjeV9tYXAvdW5tYXANCj4gPiAgIGNvbW1vbi9ncmFudF90YWJsZTogYmF0
Y2ggZmx1c2ggSS9PIFRMQg0KPiA+ICAgaW9tbXU6IHJlbW92ZSB0aGUgc2hhcmVfcDJtIG9wZXJh
dGlvbg0KPiA+ICAgaW9tbXU6IHN0b3AgY2FsbGluZyBJT01NVSBwYWdlIHRhYmxlcyAncDJtIHRh
YmxlcycNCj4gDQo+IEFyZSB0aGUgbGF0dGVyIHR3byBwYXRjaGVzIGRlcGVuZGVudCB1cG9uIHRo
ZSBmb3JtZXIgdHdvLCBvciBjb3VsZA0KPiB0aGV5IGdvIGluIGluZGVwZW5kZW50bHk/DQo+IA0K
DQpOb3QgcmVhbGx5LiBUaGV5IHNob3VsZCBiZSBhYmxlIHRvIGdvIGluIGFoZWFkIG9mIHRoZSBv
dGhlciB0d28uDQoNCiAgUGF1bA0KDQo+IEphbg0K

