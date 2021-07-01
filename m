Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D163B92E4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148699.274798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxO9-0004C3-Kn; Thu, 01 Jul 2021 14:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148699.274798; Thu, 01 Jul 2021 14:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxO9-00049C-Hl; Thu, 01 Jul 2021 14:09:57 +0000
Received: by outflank-mailman (input) for mailman id 148699;
 Thu, 01 Jul 2021 14:09:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tPK9=LZ=citrix.com=George.Dunlap@srs-us1.protection.inumbo.net>)
 id 1lyxO7-000494-IF
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:09:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01f3054a-da76-11eb-8327-12813bfff9fa;
 Thu, 01 Jul 2021 14:09:54 +0000 (UTC)
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
X-Inumbo-ID: 01f3054a-da76-11eb-8327-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148594;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eon9sNIahDWrgyFAaZIRX9vSn77mUv2BAx0W5C/4uLU=;
  b=Wx75YNY9LOa5kRcpypnMNepNLrG9gzXckmBvynwelH3WryqptFXs8yip
   1FBXFf8Bw3wQPhBd2Jr4S3msgXibRPl+tYZqNdBSeJ9YHtJjBF/xgp7Tm
   UVxKWuwC2VFyTfzKft2HtSR1+k4xs8BkP5jLY9mFM1eeQAL50XERUpSKe
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: o9Qqq7SGbEV6l5QW3XrwILTlDeqGYpAUgteR5Vu1gdwLny5S/sMadyZdRaS+9/Cow6ExD2BDkq
 g+8eH5/P/qdxQ2F7hoO/ijmGhqJ2S8GWaBVEGxMLPIEH8o4ugdeGl8dbAOTdvfb3bUjqc0O8Kp
 ruKE9CUBNFJvfEjUNacScMFqzmVCtuYvlIsYKWN7fd4GcHK27zDkHluwv7k6YdepgD1PvBXwlr
 9BVZskAfqt3K48DtwIfHckZfL9ribz9Tnf96kCjbUBYnX7tp5G+/ACtpjf4QwUrKAVZ9T9Tl51
 c6Y=
X-SBRS: 5.1
X-MesageID: 47755271
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Fk5ipako6LEsygqkS23Q05rCX4LpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47755271"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oodp9vd6P11DdzvMGYL9E6521Yrd6TG3yhfgft3MMBkwVdV30EgPuQIglGIQsx/HzBdddttG4jPBLktByEc0aHDkLjZBjMNluMvAuiPQlXCwcK/7PZAjF/VulDBE461JsxBWkhjsGfMWTy1Z/sYYy7cj78INNAa5X/a3qj52HhCUli7hpSxMnws7t99JLiJ/0NHIP+eotT1im731W8qcjwDxL35WhzgfLzaXqsInTCcV2T0xGpyoiPmP+dPnYuytYJyqxjINwrjf837f6KUa34+QWao/T7b7/U7sMfTzGt8p6UErImO41M/SM7DXe1RfGEXan/hvktJxmVhZZKUHKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eon9sNIahDWrgyFAaZIRX9vSn77mUv2BAx0W5C/4uLU=;
 b=Wv11+SGLNeQVpLEyxKH+VVC/PnLVi4YRqYSDqnseWqKx1vHQzOgSvwMJwZsonxnTGUCmnBzWqdcubQMjIC+V37TJxBpuJ9UJ+atHyQUztN4Y5NfU95Dx5ltuKM/esv8FkGTS+nOHOV5Nh7k6BuYzykT+VFuecV4JI67CsB8zKTQSOUPmleal4RfWR0yGtmAn+oyEafGZG6WFm/r+WOJGkEJuVynYnXpA02SI0gboHzAGVoNIo8Bh4OH0c666NNUzkf5o2jDH3Smrqu191K5VmiVeWrpJuny9D32z5e9+cJ/YQRkWNwx2jnZCahfw1qWkLVopEwB0UId2aNDCA++5Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eon9sNIahDWrgyFAaZIRX9vSn77mUv2BAx0W5C/4uLU=;
 b=EkadcRHnp6mohxfNjOh5cf4duVm8cwi+hTJd0Rz6yNW4eOcmSEMGFEnm2hmBlxq8CD1bSH6AcbhEaupI/PwRhUQcLarekjZnNLekZRR0kAcQfXX9ZhhF5rm1RwhdEJ6bpGRl5vEpvY3JHXeHcTPxU9gekEW+k5aUZi14uXQVOww=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 03/12] golang/xenlight: fix string conversion in
 generated toC functions
Thread-Topic: [RESEND PATCH 03/12] golang/xenlight: fix string conversion in
 generated toC functions
Thread-Index: AQHXUNysz1ZbuKJBuU+rSVrlC2Thy6sZwI6AgAUN5YCAD5VSgA==
Date: Thu, 1 Jul 2021 14:09:47 +0000
Message-ID: <22BCDDFA-0EDB-466D-B644-54A956C0D84C@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <06763aceff41167d3d3bbd603f729572c1f55c77.1621887506.git.rosbrookn@ainfosec.com>
 <6BAF6F60-EC63-41AC-A46E-2045E746C7E1@citrix.com>
 <YNC6LzVHXCcNfg+E@FED-nrosbr-BE.crux.rad.ainfosec.com>
In-Reply-To: <YNC6LzVHXCcNfg+E@FED-nrosbr-BE.crux.rad.ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ab6c070-b370-4bb4-0b04-08d93c99e26f
x-ms-traffictypediagnostic: PH0PR03MB5861:
x-microsoft-antispam-prvs: <PH0PR03MB58616F35B6AD996E89B3CDB499009@PH0PR03MB5861.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LonZVojVwI2lxyM/GygovcG73eGjvI2RwYS4m24HD3uUib3pZgWwv+vCohsXQ8oLfwLpXiqJ746TPwDPYVaJsb6X4y0RA8OGS4VoU4ZhEeIZn8fPWCLwyg55E7Fs7xxvaEWGRhEVF1RHGrS/1IEXwPhRHsBMirqnUu/Psp17mRjAMWsKfDFobyU+P/4Qlgobk2PvZNom5pKDpw4Y/UkZehLheHZ+dlTiyt2FadxWuOWaIjn3nBYBHho9HbXWIFtyDNOjxF12R/tTPN8mvl+6hqStrYGdBBPAt0xU25UaEZQt4Agi2T9Um41i85E4NJG807Vbnd7LZYA5uqcm3DNzZ5q4WWzXgG2ThYFHjGkHhaqjwVuFFg5kBwtKSQSxYZ2DGAPe+HDSWkSySXrGjAkpcQPQgD5RYl8OIoAAPIfgNOK9y1MfqKeGjl/mnAH7ueiDI+71GKQiHrTuw4jjLStfwpVlNjQrs+u3UgXcBukouK7VgyxuRT11TIs/bSHNOJSfSPi9NcRzd8PYi2EeZNt4nbvGIOIIjYql0/TDIQWEOIw5q/WzQqyUVYBSKa+rrfFLgrOGeyhbvA/UHxqzTG7jw7o/dMSzwOBnroxkg/rr58cMlj8L7m5/Uz9avXDWv/IUleOEFgsYbNYdp55rIX2v2ua/Vj7kamP8tfZaDvYdTGZf5JROM5Ht3funN/7+IPlCaFDG22No0gn9VrUmmJ82MA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(39850400004)(396003)(478600001)(91956017)(76116006)(316002)(4326008)(2906002)(8936002)(122000001)(38100700002)(66946007)(2616005)(8676002)(71200400001)(83380400001)(186003)(86362001)(6486002)(54906003)(5660300002)(36756003)(53546011)(64756008)(66476007)(66556008)(6512007)(66446008)(26005)(6916009)(33656002)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFpjb2ZEWW8zTEhoUWtDdWNkRkJYVGpNbkFZSFg2Q2pBWERTbkdWR3FCNUxR?=
 =?utf-8?B?Ukx1MkFjRFUyT2R5WnQ3eWhheEd4OG13S3F2bnNaNHUvZXFWNkNISDZXVHdO?=
 =?utf-8?B?Zm1YTThFY0k4ZGpNRmp3QklXcVRwd0VoTTZMdmhyN25BdWtpUWMvK29LSTZn?=
 =?utf-8?B?cExqOHNKNHp1V082RU1XUnVoT3NUcThKQTR5bGF6VUo3eE9QeHhLSlJWbG41?=
 =?utf-8?B?alQ1c29COWxoWk5jZ2E2d25QRURheDRKWVZvQjE5QXRzYkNVZ3FwU1plSWIz?=
 =?utf-8?B?dHdJcmpQWHZrNkI5eHBZZXZkOTNTL1lCZlFKWlE2NThDVmp6M09pNmZwMC8z?=
 =?utf-8?B?TndjamJUVHQ5ZVJ1cnFGeU1oeWNFZkJtMFBJY1hYcjN1b1d0eFgvQXdkZzhq?=
 =?utf-8?B?R2VoZW95QTJ0YjJpU2hxWWdCMXN3RkgvYk9MZzhEbmVJZDFIS1RxeG9kRXB2?=
 =?utf-8?B?S25Td3VhK3lYVnFjaVdFRTNEcmhtSllYUElNNG40Sy9JRWZZWXNxeEdHMFgv?=
 =?utf-8?B?ckVZT2tMR2hWSVBRNnJVUkpQWjQvSEQ1cHNzYk1RZllqTldrKzFSVEhUZWxS?=
 =?utf-8?B?em9paEdYNGN2WUlId2REaVRZb2hJZkNNY05UZG42eTBsaU1zQzd3VzVnNGF3?=
 =?utf-8?B?RTRydzNwSzdKSTlURjlkK21BTGp5bTcydkh6MlNOVEJXTU9Ga2ptSFdXQ0M3?=
 =?utf-8?B?RkJsazJDbVdUY0ZNMUYyVmpwL3R4RFkxK0JiTml4d1RqbzNtMjYzUlEyYkow?=
 =?utf-8?B?QXllRkRMTXJYa2dWL0R1NXZOUkIvbXBXK0ZlVWVXUGRSV3VWK01oWVFTWDgz?=
 =?utf-8?B?b1RFQW00RXduODRMMSthc3daL01tYjlaL1dtVHJvdkZKR1dqZXJwUXZFVDFJ?=
 =?utf-8?B?T3UwRXMySHhhZGgxeTBDK3p4ZXo0QlM2QWNET2IrUDZBWWJ4UHFXcnN6WFoz?=
 =?utf-8?B?S25OQkVxcFFnYm12dmNJcXBwZ25lY2gvYXh3WndiU2xrM0RXMTlScWQ4YU0y?=
 =?utf-8?B?Y3JEQkkvTzZIbDVXZE9JVHFiYkg0MzBZT0Z1K3doT2lZUFh2WU16Z1UrOWp6?=
 =?utf-8?B?d1I2b1BnczJFYmo3UW1PdEZCUys1VTJHY05udGo5V3MrSjQxSnNHMGNsSDRX?=
 =?utf-8?B?WmRKMms2cEZrQUhlUlM4WnJYNnVVMkNXQm1ESDd6V29NVWJMcTRoRnRiVWlW?=
 =?utf-8?B?enprQk5HSUk5R01qbllTYmVjNUJBS1NPVEJrVFhuc1k5cEF2a1NZL3lCTTdR?=
 =?utf-8?B?UVRCTmxCbHFQamJEcU51Y2FkTDVtL0ZCTnpra2VyTnc2Q1BFNHFBdkI4dWxx?=
 =?utf-8?B?aFU3ZmVvQm1hNnpDVWU2czdtdVp3MWlQcTgxWTFOUHhMRGlkcGRBWnJoY2V6?=
 =?utf-8?B?TzNpM0gvdU9DS1V4eU5GK1FYOEx1Um5XRFluSGhtd25qOWFtRENOM1ZXSjMr?=
 =?utf-8?B?aWx2RVVPVlU5QjRHM3ZwYjlJeTNPbDhtNDk0bTNKNlBvQ2FkQnNYOUJENUlL?=
 =?utf-8?B?WHhkQUhWdVRaaFZzR0pDcDMySVBKbDBhVE5Yei8vTE1yQUNpWnZrTk84Wjc0?=
 =?utf-8?B?OU1ZeG8rd0ZJRUxnL3ZCczdEV2VlRlovbFhXR0R4NTVqNHRucU1XUUd4TGhV?=
 =?utf-8?B?TzB3MXNyL202N0ljZGxnT1gwbStWVFU1aUM1TDh0blIrUmx2TzExTXUyNCtY?=
 =?utf-8?B?dWxCK1dBYWZIaVdXOGIrc2pYbXM5T3ZVcEJZUEJRUUxXTGxFZktoRWxyNVBl?=
 =?utf-8?Q?W+yo/j8dHxDU2nyILgkQHA9fM/mKUrzD/6xWqFF?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D2298BC982799344B85740357D1014E4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab6c070-b370-4bb4-0b04-08d93c99e26f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 14:09:47.5509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZShJsr0mMGx2wRebhN05T8pUr89VxC8alXwKWvozpcPH5UCUSZym+Cb77Z7PGgSVvdRhyVHDx6MHaQclyb7bYP8a6B/J6hcaZnfw/tcb0/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5861
X-OriginatorOrg: citrix.com

DQoNCj4gT24gSnVuIDIxLCAyMDIxLCBhdCA1OjExIFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgSnVuIDE4LCAyMDIxIGF0IDExOjAw
OjI2QU0gKzAwMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+PiANCj4+IA0KPj4+IE9uIE1heSAy
NCwgMjAyMSwgYXQgOTozNiBQTSwgTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGdtYWlsLmNvbT4g
d3JvdGU6DQo+Pj4gDQo+Pj4gSW4gZ2VuZ290eXBlcy5weSwgdGhlIHRvQyBmdW5jdGlvbnMgb25s
eSBzZXQgQyBzdHJpbmcgZmllbGRzIHdoZW4NCj4+PiB0aGUgR28gc3RyaW5ncyBhcmUgbm9uLWVt
cHR5LiBIb3dldmVyLCB0byBwcmV2ZW50IHNlZ2ZhdWx0cyBpbiBzb21lDQo+Pj4gY2FzZXMsIHRo
ZXNlIGZpZWxkcyBzaG91bGQgYWx3YXlzIGF0IGxlYXN0IGJlIHNldCB0byBuaWwgc28gdGhhdCB0
aGUgQw0KPj4+IG1lbW9yeSBpcyB6ZXJvZWQgb3V0Lg0KPj4+IA0KPj4+IFVwZGF0ZSBnZW5nb3R5
cGVzLnB5IHNvIHRoYXQgdGhlIGdlbmVyYXRlZCBjb2RlIGFsd2F5cyBzZXRzIHRoZXNlIGZpZWxk
cw0KPj4+IHRvIG5pbCBmaXJzdCwgYW5kIHRoZW4gcHJvY2VlZHMgdG8gY2hlY2sgaWYgdGhlIEdv
IHN0cmluZyBpcyBub24tZW1wdHkuDQo+Pj4gQW5kLCBjb21taXQgdGhlIG5ldyBnZW5lcmF0ZWQg
Y29kZS4NCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25A
YWluZm9zZWMuY29tPg0KPj4gDQo+PiBTbyB3YWl0IOKAlCBpZiB5b3UgZG8NCj4+IA0KPj4gdmFy
IGZvbyBDLnR5cGVuYW1lDQo+PiANCj4+IFRoZW4gZ29sYW5nIHdvbuKAmXQgYXV0b21hdGljYWxs
eSB6ZXJvIG91dCBgZm9vYD8NCj4+IA0KPj4gVGhhdCBzZWVtcyBsaWtlIGEgYnVnIHJlYWxseTsg
YnV0IGFzc3VtaW5nIHRoaXMgZml4ZXMgcmVhbCBiZWhhdmlvciB5b3XigJl2ZSBlbmNvdW50ZXJl
ZDoNCj4gDQo+IEkgd291bGQgaGF2ZSB0byBkaWcgaW4gYWdhaW4gdG8gZmlndXJlIG91dCBleGFj
dGx5IHdoYXQgR28vY2dvIGlzIGRvaW5nDQo+IGhlcmUsIGFuZCB3aGV0aGVyIG9yIG5vdCB0aGlz
IGlzIGEgYnVnLiBCdXQsIHRoZSBiZWhhdmlvciBJIG9ic2VydmVkIHdhcw0KPiB0aGF0IHdpdGhv
dXQgdGhlc2UgbmlsIGFzc2lnbm1lbnRzLCBJIHdvdWxkIHNvbWV0aW1lcyBnZXQgc2VnZmF1bHRz
IGluDQo+IGxpYnhsX3N0cmluZ19jb3B5LiBUaGlzIHBhdGNoIGVuc3VyZXMgdGhhdCBsaWJ4bF9f
c3RyX2R1cCBpcyBub3QgY2FsbGVkDQo+IGluIHRoZSBlbXB0eSBzdHJpbmcgY2FzZSwgdGh1cyBh
dm9pZGluZyB0aGUgc2VnZmF1bHQuDQoNCkkgc2tpbW1lZCB0aHJvdWdoIHRoZSBDR28gcGFnZSBh
Z2FpbiB3aGVuIEkgd2FzIGxvb2tpbmcgYXQgdGhpcywgYW5kIGRpZG7igJl0IHNlZSBhbnl0aGlu
ZyBzcGVjaWZpZWQgYWJvdXQgd2hhdCBoYXBwZW5zIGlmIHNvbWV0aGluZyBpcyBwYXNzZWQgdG8g
YSBDIGZ1bmN0aW9uIGJlZm9yZSBiZWluZyB1c2VkIGJ5IGdvbGFuZy4gIElmIHlvdSBnZXQgYSBj
aGFuY2UsIEkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byB0cnkgdG8gZmlsZSBhIHRpY2tldCB3
aXRoIHRoZSBnb2xhbmcgcHJvamVjdCwgcG9pbnRpbmcgb3V0IHRoZSBvYnNlcnZlZCBiZWhhdmlv
ciwgYW5kIGFza2luZyB0aGVtIHRvIGVpdGhlcjoNCg0KMS4gRG9jdW1lbnQgdGhhdCB0aGUgZ29s
YW5nIGNvbXBpbGVyIG1heSBub3QgaW5pdGlhbGl6ZSBhIHN0cnVjdHVyZSBiZWZvcmUgcGFzc2lu
ZyBpdCBpbiB0byBhIEMgZnVuY3Rpb24NCg0KMi4gRG9jdW1lbnQgdGhhdCBpdCAqd2lsbCogaW5p
dGlhbGl6ZSB2YWx1ZXMgdG8gemVybywgYW5kIGZpeCB0aGUgYnVnLg0KDQogLUdlb3JnZQ==

