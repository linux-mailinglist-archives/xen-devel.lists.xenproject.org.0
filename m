Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C5327E9F2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:30:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.695.2310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcBE-0002B9-UR; Wed, 30 Sep 2020 13:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695.2310; Wed, 30 Sep 2020 13:30:00 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcBE-0002Ak-R0; Wed, 30 Sep 2020 13:30:00 +0000
Received: by outflank-mailman (input) for mailman id 695;
 Wed, 30 Sep 2020 13:29:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKji=DH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kNcBD-0002Ae-CZ
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:29:59 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41f85e47-4296-4000-af23-621f1a8b116d;
 Wed, 30 Sep 2020 13:29:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ZKji=DH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kNcBD-0002Ae-CZ
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:29:59 +0000
X-Inumbo-ID: 41f85e47-4296-4000-af23-621f1a8b116d
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 41f85e47-4296-4000-af23-621f1a8b116d;
	Wed, 30 Sep 2020 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601472598;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=h4Eb5Lalxb5YMdt66BmnAJFH1S5rAh7O3LyWO9s9ua8=;
  b=IlM2NU6oj6u9h/lm1KKZPGzuBn/yH4kh2sUp7h5hHr8OfeeUKQrlVzJy
   R6JG/+ifBjJ0CR/GCDFSHA+jYXxEzcWUdgvDKoQug1B0bl6TqkiBjvslE
   U3t1O0SQU6uLBf8ZmaFbl/RTDj/WpFW5kAjw59dtPWjGdVFBor3lifr0e
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RQzlsDaxwmX89pv9O9yjIVAx7pcOVb8YHhABDOfYwl+avCUwn/HO+OZwv2nE40mz99oMYb7JmI
 jcypW5qopcB6ptQQmSdJSn2k0cQMpryVBsURCTIPOEi5P3dt7d/VHTn9l1MP/gqg/BqrR7j2cj
 h4GxSwLRmnuW0TlggityJMk37jxZrjogWeE90E9+SvYQBtX+HHwyNuocxZWUBUY0+yi4kwBzLy
 kTDryd8WBW2lA6GNwgnW/9zTwSRlkJSsse6f/NXyVfFqLPK/tBr6srLDQc3ej1OmOBPiNr9Qwz
 7hk=
X-SBRS: None
X-MesageID: 27969514
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="27969514"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7/6IiwHWTA2jLX8O33lmcEIE4XnRccizKzvS+M8OjEV0TfwoQhv5n4BBUJobaUzXChxTuWi/advPJhCcglO1blhPu/ojZyBcEZ+/8R/75F8xw6XxaxFCll0Lju+Ii8yQU5FCukck8nFVwEmzQhmIrF2kysswWzzlGtTOYS7voQTyCmlk9x6HrbuoxhV3Q7dxLGQT4anSg656/a0bqIeYfzSN9wApf29KKwyX5V1Q6cmndljdcQH5+PtnnWUy08QWSD9gqNwbF8SEg8u2WSjAZUWdT0jK92rxZdL35mcpuWPMZayiC7F+rXT2zMuOk4zeRtAjVIg6eT34oas83E3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4Eb5Lalxb5YMdt66BmnAJFH1S5rAh7O3LyWO9s9ua8=;
 b=We4bCm3Nf3BLgw09eBd6JDqD61U/BjYKdlKz1eqqroa1+dN/bTrPTdYzdWJ2rw8EE9M2+hrNbJQyooDjvuOO9LrGsuMNuBGDJ36hXNMWO85tH6clOw6rzJSC8YFAWb6a8UieZnnwJOL8v9FVeylF0mt7uQr0teTT4jIGs1+ZIziRUk2etwih5n233z8EXyPkBcIfQAeHh4t1ApZtk/hj0NjVyyPOCm7A1wymBJ9G3mNe6ATktS/+KU1KktHOBurhGGINFvdWSPTxdK/Ho3XvwsqPrq5wf/OOkuPMwUZpFA0Pc/P4w8iJEjQt6IlNxkplHbTnSK7/Tshgs/EJVhyZqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4Eb5Lalxb5YMdt66BmnAJFH1S5rAh7O3LyWO9s9ua8=;
 b=tCW8FoljdHOiYW8jLPG5z9uyefvIBiP6MdMOcqx9s8zm+jjilKJRmVlmuVObYYKAIphFC2KEV+KXQoKiKvyDma5wOoVqYsUApGFxEmdpHNJ3ZVJkmcuk1jeOn/jZktLGvtWd2PpYq2d3cVo0ugacQx7AM1ncl22HTZBvGCo2PGA=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
	<Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Rich Persaud <persaur@gmail.com>, "Bertrand
 Marquis" <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH RFC] docs: Add minimum version depencency policy document
Thread-Topic: [PATCH RFC] docs: Add minimum version depencency policy document
Thread-Index: AQHWlylRG8SsjpT4JUGR4W/Ewa0YcqmBKB+AgAAFGoA=
Date: Wed, 30 Sep 2020 13:29:52 +0000
Message-ID: <E1835B50-28EA-45DC-BDB6-F1047FF96F41@citrix.com>
References: <20200930125736.95203-1-george.dunlap@citrix.com>
 <9b67dd36-4216-9480-57ec-5b453eae0036@suse.com>
In-Reply-To: <9b67dd36-4216-9480-57ec-5b453eae0036@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 025d87fe-c41e-416f-f368-08d86544e9cb
x-ms-traffictypediagnostic: BYAPR03MB4326:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB4326D09238DB6E8FDE0163D899330@BYAPR03MB4326.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CkIllrsil8aPuVJdyVmG4fjTdtPlEeYFL5Z+PQ0u7LH/rB3Q5bSL6tPsnKGXaONnY9oirXIHHGvB5n45PMAqZCCpSu79cVbWB94/bqpk6q6GYfPfombmGrVg7hH3FUAg3D5RRKg8jzwiKoTwhKZr2OmN+gG4SX7clYL2pORdOwyyhyukMzo5iQUm8d01s/k1HSSYkEV8YK6Q510IhLpt4ik6TjAGrgWZrnTplDV7cKUmj81odtc/VuENAGbcc46s1XfRejnlaEKyfm6DiRiYXRtVjzPxLgy+rQkXoMYRqA0OqRZNRpgeF04/sVqkMuXXUmOU8tNzsadHoc7XLsG2ljC2hjR89/D6fgwy0EW0gg28B1uEGAggIOmGTor7c6pZ0hVhcqzYYCC8L2y9vIzvTxvZyCx6X+IPkBl9IeHlaJ0hXkNYJ1F3whQ3N7xSdX/mh77IxO40VlDuTkJb+1G0Ew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(2906002)(4326008)(6486002)(6512007)(8936002)(33656002)(36756003)(54906003)(83380400001)(5660300002)(86362001)(6916009)(66476007)(66556008)(64756008)(66446008)(316002)(66946007)(91956017)(76116006)(478600001)(8676002)(26005)(55236004)(71200400001)(186003)(6506007)(53546011)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: d0MkrGdiiLQqur/HGUZXU9BIbTK46ITmcO6Ov+dazZ7GrD+LenU2fD5gJn8Qzb8c25T/MM68VxIMJBph5KbLrO5qMbOZl/b9AKLOOxpXjkPlHbW9AtIl/fMRy9BMjgslgLpxC77Z1jp7ym1t5/UipktXyfRuGYVVOrr2PMfPcXUxSG9DT0lCxWquuxg3yVJfHX792WdC3SgfsyCNLhRMEWf3F6TcYXrMQVrzS6ie6tJZb6fykC8AbSXWXhK+93aIsBD15aGSsFnO5xCeGGD6ZsNt5gc2pYA/Vmf0NzaqEStveNBQi3fVRYKSTAMZ54+i7hDiPVXZNYflqGQDhIjKyQuxX/iAPW2z7N46KnyLtVwGnB1ci6rDN7TFd0ulJfPZpFJGI+B8J7ANjAsKkMT2H7uNjq9hefVuT6ezOwwcz62bbfhhDhi3pMKZF7t0XU8zjd5m7NcHxH54c6zMJ9qlhJQyMMYWJQDD2Mi9RRGZVciooKk9GJ5HjRrL3T7L3tqZ/fxDaIh8foRcE2Cz0wsHyeIj+N2JXpLvro9XWh4c679rnfOa9klcDAa37xyGXdvw46oWcV83uym7+ZrTklQUzFSYALQbFZwBxvzGI4KE/pMLsfSOGaiSjRE+9E6IZXR7dqOSuQLUcSfEjydHMAeKGw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFE7440BC2E30642B344323ABB3390A2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 025d87fe-c41e-416f-f368-08d86544e9cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 13:29:52.5755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZYq5auyzqCyUm0fYMs117NRgIn9f+Homilo/VYUVqENKHinNplKI2x2pJLE9zr+WJjnthEZu3GSxS7mLDGwd0d9x7/yQ41pAvrD8WVMKkzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4326
X-OriginatorOrg: citrix.com

DQoNCj4gT24gU2VwIDMwLCAyMDIwLCBhdCAyOjExIFBNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMzAuMDkuMjAyMCAxNDo1NywgR2VvcmdlIER1bmxh
cCB3cm90ZToNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2RvY3MvcG9saWNpZXMvZGVwZW5k
ZW5jeS12ZXJzaW9ucy5yc3QNCj4+IEBAIC0wLDAgKzEsNzYgQEANCj4+ICsuLiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogQ0MtQlktNC4wDQo+PiArDQo+PiArQnVpbGQgYW5kIHJ1bnRpbWUgZGVw
ZW5kZW5jaWVzDQo+PiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+PiArDQo+PiAr
WGVuIGRlcGVuZHMgb24gb3RoZXIgcHJvZ3JhbXMgYW5kIGxpYnJhcmllcyB0byBidWlsZCBhbmQg
dG8gcnVuLg0KPj4gK0Nob3NpbmcgYSBtaW5pbXVtIHZlcnNpb24gb2YgdGhlc2UgdG9vbHMgdG8g
c3VwcG9ydCByZXF1aXJlcyBhIGNhcmVmdWwNCj4+ICtiYWxhbmNlOiBTdXBwb3J0aW5nIG9sZGVy
IHZlcnNpb25zIG9mIHRoZXNlIHRvb2xzIG9yIGxpYnJhcmllcyBtZWFucw0KPj4gK3RoYXQgWGVu
IGNhbiBjb21waWxlIG9uIGEgd2lkZXIgdmFyaWV0eSBvZiBzeXN0ZW1zOyBidXQgbWVhbnMgdGhh
dCBYZW4NCj4+ICtjYW5ub3QgdGFrZSBhZHZhbnRhZ2Ugb2YgZmVhdHVyZXMgYXZhaWxhYmxlIGlu
IG5ld2VyIHZlcnNpb25zLg0KPj4gK0NvbnZlcnNlbHksIHJlcXVpcmluZyBuZXdlciB2ZXJzaW9u
cyBtZWFucyB0aGF0IFhlbiBjYW4gdGFrZSBhZHZhbnRhZ2UNCj4+ICtvZiBuZXdlciBmZWF0dXJl
cywgYnV0IGNhbm5vdCB3b3JrIG9uIGFzIHdpZGUgYSB2YXJpZXR5IG9mIHN5c3RlbXMuDQo+IA0K
PiBJIHRoaW5rICJjYW5ub3QgdGFrZSBhZHZhbnRhZ2UiIGlzIHRvbyBzdHJpY3QgaGVyZTogSXQg
bWF5IGJlIG1vcmUNCj4gY3VtYmVyc29tZSAoYW5kIGFzIGEgcmVzdWx0IHRvIHVnbHkgdG8gbWFp
bnRhaW4pLCBidXQgaXQgb3VnaHQgdG8NCj4gZ2VuZXJhbGx5IGJlIHBvc3NpYmxlLiBJT1cgaG93
IGFib3V0IGFkZGluZyAiZWFzaWx5Ij8NCg0KU3VyZS4NCg0KPj4gK1NwZWNpZmljIGRpc3RybyB2
ZXJzaW9ucyBzdXBwb3J0ZWQgaW4gdGhpcyByZWxlYXNlDQo+PiArLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+ICsNCj4+ICs9PT09PT09PSA9PT09
PT09PT09PT09PT09PT0NCj4+ICtEaXN0cm8gICBTdXBwb3J0ZWQgcmVsZWFzZXMNCj4+ICs9PT09
PT09PSA9PT09PT09PT09PT09PT09PT0NCj4+ICtEZWJpYW4gICAxMCAoQnVzdGVyKQ0KPj4gK1Vi
dW50dSAgIDIwLjEwIChHcm9vdnkgR29yaWxsYSksIDIwLjA0IChGb2NhbCBGb3NzYSksIDE4LjA0
IChCaW9uaWMgQmVhdmVyKSwgMTYuMDQgKFhlbmlhbCBYZXJ1cykNCj4+ICtPcGVuU1VTRSBMZWFw
IDE1LjINCj4+ICtTTEVTICAgICBTTEVTIDExLCAxMiwgMTUNCj4gDQo+IFNMRSAxMSBoYXMgYWxs
IHN1cHBvcnQgcGFja3MgaW4gTFRTUyBtb2RlIGFscmVhZHksIHNvIGFzIGxvbmcgYXMgdGhpcw0K
PiBtb2RlIGlzIHdoYXQncyBlcXVpdmFsZW50IHRvIG9yIGV2ZW4gbGVzcyB0aGFuICJNYWludGVu
YW5jZSB1cGRhdGVzIg0KPiBpbiB3aGF0IHlvdSBkaWQgc2F5IGZvciBSSEVMLCBpdCBtYXkgd2Fu
dCBkcm9wcGluZy4gKFBlcnNvbmFsbHkgSSdkDQo+IHByZWZlciBpZiB3ZSByZW1haW5lZCBzdWZm
aWNpZW50bHkgY29tcGF0aWJsZSwgYnV0IEkgcmVhbGl6ZSBJIG1heSBiZQ0KPiB0aGUgb25seSBv
bmUuKQ0KPiANCj4gQWRkaXRpb25hbGx5IGluIHNlcnZpY2UgcGFja3MgdGhpbmdzIGxpa2UgY29t
cGlsZXIgb3IgYmludXRpbHMgdmVyc2lvbnMNCj4gb2Z0ZW4gZ2V0IHVwZGF0ZWQsIHNvIGUuZy4g
IlNMRVMgMTEiIGFsb25lIGlzIG5vdCBzdWZmaWNpZW50IHRvIGtub3cNCj4gd2hhdCdzIG1lYW50
IHRvIGJlIHN1cHBvcnRlZCwgaXQgd291bGQgbGlrZWx5IG5lZWQgdG8gYmUgIlNMRVMgMTEgU1A0
Ig0KPiBhbmQgYWxpa2UsIGp1c3QgbGlrZSB5b3UgYWxzbyBzcGVjaWZ5IGEgbWlub3IgdmVyc2lv
biBmb3Igc29tZSBvZiB0aGUNCj4gb3RoZXIgZGlzdHJvcy4gU0xFUyB2ZXJzaW9ucyBub3QgeWV0
IGluIExUU1MgYXQgdGhpcyBwb2ludCBhcmUsIGlmIEknbQ0KPiBub3QgbWlzdGFrZW4sIDEyIFNQ
NSwgMTUgU1AxLCBhbmQgMTUgU1AyLg0KDQpSaWdodCwgcGFydCBvZiB0aGUgcmVhc29uIHRoaXMg
aXMg4oCYUkZD4oCZIGlzIHRvIGdldCBmZWVkYmFjayBmcm9tIHBlb3BsZSB3aG8gYWN0dWFsbHkg
a25vdyBzb21ldGhpbmcgYWJvdXQgdGhlaXIgdmFyaW91cyBkaXN0cm9zLg0KDQpUaGUgbGlzdCBh
Ym92ZSB3YXMgbWFkZSBieSB0cnlpbmcgdG8gbWFrZSBzZW5zZSBvZiB0aGUgdGFibGUgaW4gdGhl
IGxpbmsgYWJvdmUgKGh0dHBzOi8vd3d3LnN1c2UuY29tL2xpZmVjeWNsZS8pLiAgSSB0aGluayBp
dOKAmXMgaW1wb3J0YW50IHRvIGhhdmUgcmVmZXJlbmNlcyBzdWNoIHRoYXQgdGhlIHJlbGVhc2Ug
bWFuYWdlciBjYW4gZWFzaWx5IHVwZGF0ZSB0aGlzIGxpc3QgZXZlcnkgcmVsZWFzZS4gIERvIHlv
dSB0aGluayB5b3UgY291bGQgcHJvdmlkZSBhIGJldHRlciBsaW5rPw0KDQpUaGFua3MsDQogLUdl
b3JnZQ==

