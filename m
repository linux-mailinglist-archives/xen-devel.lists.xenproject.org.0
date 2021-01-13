Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E552F5149
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 18:43:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66643.118436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkAa-0004Mr-Vd; Wed, 13 Jan 2021 17:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66643.118436; Wed, 13 Jan 2021 17:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzkAa-0004MR-Rd; Wed, 13 Jan 2021 17:42:56 +0000
Received: by outflank-mailman (input) for mailman id 66643;
 Wed, 13 Jan 2021 17:42:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yStP=GQ=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kzkAa-0004MM-3l
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 17:42:56 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d73aee6-533c-4de6-be4f-970029e6e280;
 Wed, 13 Jan 2021 17:42:54 +0000 (UTC)
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
X-Inumbo-ID: 7d73aee6-533c-4de6-be4f-970029e6e280
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610559773;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=snu7hOmGZhJu/H6Kfuuq7DHlzm86DAvJ42iZsLkJEYc=;
  b=AwowKBx6rfuuAKqXK2P6aXEkFGX0kBBBOuOwMfkIiTxUEY+JWUfC/6kj
   zvUxVfJ9Tpvu5BVrlRCPQcJCmkcwTQ6nY85/rGGCSBiIX38SvlSH7Z199
   +ANM3fuC5qVZHNebKLfBRiYWEki0T5ms8ufSzCPTB5nAI52ev5gsLU4gQ
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XeWkoFYBNjHN4DLw0fls/bcNdF00zjVo+1zkt+bPDVa9WM6g+GChFCNOt+uPP0+8m4rjV57Kh1
 plJHqTOLGtVVko4ag4VcB6dnQOZraKnbKYbruYH/8ckI/VH+Kdk5t5XO2ILsi1hCD1zQlv4Z7I
 nqfIP143q8AxqMTa7gTWxdGILXXS7lFx17NNnsmxUhGGuVVyVKhojFs5CXI7uJLnWr01bGlUhm
 BHbtmumqsuhqQpE4Q7JEeoUAbhUZhUiHucefmNdVAqVZbWm10NhSRc65yvS2MhVdgzqf5AMFRZ
 /aA=
X-SBRS: 5.2
X-MesageID: 36314123
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,344,1602561600"; 
   d="scan'208";a="36314123"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=To+tkVSV2dmjzgEgUw3b9qQ0HPCaDXZnmoCAP540Cc05sg1o85IXLuZ9yiJMWOGzQP/N0ID/ybw8UCidpUEqU98mTumxhVy+jL0VFadZIn9L/ip6gme9p9XdRWYClZDc++4apcqEEwIxoDjNDqIhEkN4o6ku4M/v+Bp439i10HMM7PDjSWIXjID+m14hKUp/LMFnyoDh4r5azyxiKTAABwkV1DxSSO/TcYNfibFJsSO5Y655m2kReJy/nxTX04/6h75aR+MiOm/FKjki7aZxCtkU1fyvZw+QwQqcIiKz9sCZItt8/tPgD+j4PLGh4shfRIGTSRcrCFXqRF/GdtXf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snu7hOmGZhJu/H6Kfuuq7DHlzm86DAvJ42iZsLkJEYc=;
 b=fiovzBVFTNaLsGXRo1zWF02z57F1WVZHsHk7cSRVpieEg9BMj7Fa6sG3vf77iH/2jcQI3D8AoX2zNG4J1SZnXNbMeIqKBHXBtcHkW/QQq3Si4NwBnl4tIVfkJNPukmOJLy0lMmqrXrl1SwSSOEf0/aCzxTpCTrk2PUX/rWgttjGIzPJIea6UYAo2ZLeHtdpkh3MVD8fwrSGk3cMlp6dZwbAsBpVYaAZHOFvPyaO5G9QPjmNIVYTG4y19f80CxH2HAvJHMuapdtR8GMWwQ+etupEyou2LvtCtyldCqVbnUKy3yMW8z5lfCpm8aokOlHDEu1cCGIm9s5wsIvrwzaIlBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snu7hOmGZhJu/H6Kfuuq7DHlzm86DAvJ42iZsLkJEYc=;
 b=GVMsYi0J1W0UUfhkoL3HWUrmieYSLny4ooeeXBwTFSh85aXwfsdvQsgcAnqyuE5Vb/XguYkAlY89/PbiaPCaLR/r9pM+ff7VTTkYH+P80pSpQlMJ3NEG5r5VXuiu6OZn1CUd22EkyCFv0VTaindaX/dgCR26VeV14vT4mDEa7+E=
From: Edwin Torok <edvin.torok@citrix.com>
To: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org"
	<julien@xen.org>, "wl@xen.org" <wl@xen.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"jgrall@amazon.com" <jgrall@amazon.com>, "paul@xen.org" <paul@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH v10 06/25] tools/xenstore: add live update command to
 xenstore-control
Thread-Topic: [PATCH v10 06/25] tools/xenstore: add live update command to
 xenstore-control
Thread-Index: AQHW5DasU1BxCsIJ+UqM32f3+7Ll9aoaq8UAgAsfvYCAABMTgA==
Date: Wed, 13 Jan 2021 17:42:48 +0000
Message-ID: <e5d873435b1b49dce6723c04e7638fb9a95e2509.camel@citrix.com>
References: <20201215163603.21700-1-jgross@suse.com>
	 <20201215163603.21700-7-jgross@suse.com>
	 <d2d7ff33b2d255517a90cbf649761fb23385aefb.camel@citrix.com>
	 <eefc9ac3-67a8-baad-afe0-1fdae432389a@suse.com>
In-Reply-To: <eefc9ac3-67a8-baad-afe0-1fdae432389a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.38.1-1 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e176c98-7eb8-48b3-616e-08d8b7eaa48f
x-ms-traffictypediagnostic: BYAPR03MB3768:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB37681C04E6E9B91193269E429BA90@BYAPR03MB3768.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZnXWfZSRjHZaUN+N6NeIi749OTRTaEQ29L/KjOqwfe7iTF5TFuo/1mIV6XGTLdb8tLvweBD4zMlGawhyYwz0UYkKayttrQSabRly0U5mvCexiVhRxgfGEL4k+ViadP7QEAbLq9l5Np5oBSQFycepfzXVvVrqszcp6nzrXVWERmiW3JrvPsUjJxzK+5w6bTsTuo08J/bB96JFi8juHXc1CoERI/vkFw/IA5sFNSGhoW+4gEPwswvbCPqjMBqGdz/pSMxzl7tEoJu28DsXN+KVtgtVDpvG78zILyrBrjNpx7FeTdpsYDtc6qpKrge+MrJwTDcP9OzmRbVWo8qruOqoqSIJ2VGHu38c6yquP+1WPtdkfT3dXVvSJhGI/erXIBteoQ1l0LSIqNhRRvdTHdpchQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(64756008)(66946007)(6512007)(110136005)(83380400001)(66446008)(54906003)(2906002)(6486002)(86362001)(8936002)(186003)(66556008)(36756003)(76116006)(66476007)(107886003)(478600001)(2616005)(15650500001)(8676002)(66574015)(71200400001)(26005)(5660300002)(91956017)(6506007)(53546011)(316002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?R215VS9ITnNDUlY4OEVucGNLOWRweXpibG9INXQ4WCtQUXd4dXJtTmRrK1hq?=
 =?utf-8?B?RjUxUTd0WHMzZ05aZUcvQmtRNEp5YmpXREE1OGdLanIxVXFtaHhVOGhKYnRH?=
 =?utf-8?B?dXZBajk4WWdrQkV1UEJjRTJwNW53UWdJd2JyMUVBSUFNc3hQdnBwMmpQUzhl?=
 =?utf-8?B?M2piczVHNzhXQ1N2ZGFXeVFqdjZjT20zTEpSbDg3bWVQSDQ5ZDZpTllqRmpy?=
 =?utf-8?B?VUorWnIvZ3lSNWcwcS9HNnVPUzMvN1UxeDRraDRrNFdWd2ZUYVF2WitHMzUw?=
 =?utf-8?B?am9TQXVyVUFTOUNzd0RhVXBRR2tKQWNlMWcwN0JQNFhySnJ6empaZngzTmgx?=
 =?utf-8?B?TEpuaytKTnRlU09Pa3BlbHh4NENlY3Q4d25uS09tY3dMMDJjMGNsbU9jYVBD?=
 =?utf-8?B?MWNpYWd0d3VUL1dUWU9QcCttNzRIcWFlKzRkZWxWTmxVY0t0MEs5b3hKNDZw?=
 =?utf-8?B?UEVyMnM5TVB6MGx2VCtHdCtobWdCZjBqM01NWnZobTRKQjRqUUpYMFJkMjdQ?=
 =?utf-8?B?TG83VXdtTmgwZDhMVXczd29sN0Zyb2hzNzZsTWh4QVdpYzYyekJnNXdCcUtO?=
 =?utf-8?B?SDVMcEhJQ21sWVhFeDUxSmtLTjhwNThuekQ1R0poLzh3YWJPeVJYcVdqUUY5?=
 =?utf-8?B?c3MyYlVZQ2NwZmt2eTRVM0c2b2FKZi9xMUdnaGQ4Mno5U2FmTzIzRlF2WEwx?=
 =?utf-8?B?bXRpeWw1TVd2OTdvRTc1WXBrL0ZJNFZNbEtzZ1llRVhNTzQyM1pPQUhlWDFj?=
 =?utf-8?B?cUNCYklYUVFpdzNjNFB4TGo4cU1jZisxbGRjRHVtNitWWnFwOWlVM0xNb1pR?=
 =?utf-8?B?NjVsNDgxQ1RsbnZVb29WWkMxS3JhUEdlMzVNdGxraS9qUGhPa3pibTd3U05o?=
 =?utf-8?B?c0g1MytKVzhidDUwdUczZUtYaEc0Y3JubzU2R3d5MVNIckk4S0pvNWEzdDJv?=
 =?utf-8?B?ZGxJdnVueHkrYndJSUNBd1oxWXM5YWEvd0ZXK2Y3elZJNS9wODVRd3ZucjJ6?=
 =?utf-8?B?clh4ckFPQ3l0N2ZxZUZVOE53Z0FiTytMYmJESW9KSFdQSWN4VGVQaEpUYWNn?=
 =?utf-8?B?SjEwNlZRdUJjWG1FaG1vSDd0WWh1UmFQUHNzVCtURnN0SzBlNHJlMzRtd0Mx?=
 =?utf-8?B?NEgxc3JpcE1PNWtRbnBWN2o2aHVmNjNZdUllQWM5T0ZJR3doZnQyZ1Z2ZzF4?=
 =?utf-8?B?MWhqRTY2QVJSa0wzMjFIcjdUTTg2N1R5Sm82dGtENWZVWEZpK2lBL2pwUVZ3?=
 =?utf-8?B?OC9pbld6YUtMRlJENzRpV3hkcVpLT2xEMnlFbFkrcGN2bDJEY1lweEQ5alRr?=
 =?utf-8?Q?CX9GPIz5RqyKFCHfTemZFAJEFptk4tiNex?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <232D2AA2C53AA54DA0163B5F46FBC706@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e176c98-7eb8-48b3-616e-08d8b7eaa48f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 17:42:48.3288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KBBmlcPhkftQyJDaknriiKQjl7vx4auzNVR0bhAv8TgHbEA7On8xQo3XPJRHU3Sn9i66BoPgy7kZ9O1lSvDthQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3768
X-OriginatorOrg: citrix.com

T24gV2VkLCAyMDIxLTAxLTEzIGF0IDE3OjM0ICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0K
PiBPbiAwNi4wMS4yMSAxNTo0MiwgRWR3aW4gVG9yb2sgd3JvdGU6DQo+ID4gWy4uLl0NCj4gPiAN
Cj4gPiBJJ2QgcHJlZmVyIGl0IGlmIHRoZXJlIHdhcyBhIG1vcmUgYXN5bmNocm9ub3VzIHByb3Rv
Y29sIGF2YWlsYWJsZQ0KPiA+IGZvcg0KPiA+IGxpdmUtdXBkYXRlOg0KPiA+ICogdGhlIGxpdmUt
dXBkYXRlIG9uIGl0cyBvd24gcXVldWVzIHVwIHRoZSBsaXZlIHVwZGF0ZSByZXF1ZXN0IGFuZA0K
PiA+IHJldHVybnMgYSBnZW5lcmF0aW9uIElELiB4ZW5zdG9yZWQgcmV0cmllcyBvbiBpdHMgb3du
IGR1cmluZyBlYWNoDQo+ID4gb2YNCj4gPiBpdHMgbWFpbiBsb29wIGl0ZXJhdGlvbnMgd2hldGhl
ciB0aGUgY29uZGl0aW9ucyBmb3IgbGl2ZS11cGRhdGUgYXJlDQo+ID4gbm93DQo+ID4gbWV0DQo+
ID4gKiB3aGVuIGEgZ2VuZXJhdGlvbiBJRCBpcyBzcGVjaWZpZWQgd2l0aCB0aGUgbGl2ZS11cGRh
dGUgY29tbWFuZCBpdA0KPiA+IGFjdHMgYXMgYSBxdWVyeSB0byByZXR1cm4gdGhlIHN0YXR1cy4g
QSBxdWVyeSBmb3IgZ2VuZXJhdGlvbiBJRCA8DQo+ID4gY3VycmVudCBJRCByZXR1cm4gc3VjY2Vz
cywgYW5kIGZvciBnZW5lcmF0aW9uIElEID0gY3VycmVudCBJRCBpdA0KPiA+IHJldHVybnMgZWl0
aGVyIEJVU1ksIG9yIGEgc3BlY2lmaWMgZXJyb3IgaWYga25vd24gKGUuZy4gdGltZW91dA0KPiA+
IHJlYWNoZWQNCj4gPiBhbmQgbGlzdCBvZiBkb21haW5zIHByZXZlbnRpbmcgbGl2ZSB1cGRhdGUp
DQo+ID4gKiB0aGUgZ2VuZXJhdGlvbiBJRCBnZXRzIGluY3JlbWVudGVkIGV2ZXJ5IHRpbWUgYSBs
aXZlIHVwZGF0ZQ0KPiA+IHN1Y2NlZWRzDQo+ID4gwqAgDQo+ID4gVGhpcyB3b3VsZCBlbGltaW5p
YXRlIHRoZSBuZWVkIGZvciBhIGNsaWVudC1zaWRlIHRpbWVvdXQsIHNpbmNlDQo+ID4gZWFjaCBv
Zg0KPiA+IHRoZXNlIGNvbW1hbmRzIHdvdWxkIGJlIG5vbi1ibG9ja2luZy4NCj4gPiBJdCdkIGFs
c28gYXZvaWQgdGhlIGJ1c3ktcG9sbCBmbG9vZC4NCj4gPiANCj4gPiBPYnZpb3VzbHkgYW55IGNo
YW5nZSBoZXJlIGhhcyB0byBiZSBiYWNrd2FyZHMgY29tcGF0aWJsZSB3aXRoIHRoZQ0KPiA+IGFs
cmVhZHkgZGVwbG95ZWQgeGVuc3RvcmVkIGFuZCBveGVuc3RvcmVkIHdoaWNoIGRvZXNuJ3Qga25v
dyBhYm91dA0KPiA+IGdlbmVyYXRpb24gSURzLCBidXQgeW91IGNhbiB0ZWxsIHRoZW0gYXBhcnQg
YmFzZWQgb24gdGhlIHJlcGx5OiBpZg0KPiA+IHlvdQ0KPiA+IGdldCBiYWNrIE9LL0JVU1kvc29t
ZSBlcnJvciBpdCBpcyB0aGUgb2xkIHZlcnNpb24sIGlmIHlvdSBnZXQgYmFjaw0KPiA+IGENCj4g
PiBnZW5lcmF0aW9uIElEIGl0IGlzIHRoZSBuZXcgdmVyc2lvbi4NCj4gPiANCj4gPiBJIHJhbiBv
dXQgb2YgdGltZSB0byBpbXBsZW1lbnQgdGhpcyBiZWZvcmUgdGhlIGVtYmFyZ28gd2FzIHVwLA0K
PiA+IHNob3VsZCBJDQo+ID4gZ28gYWhlYWQgd2l0aCBwcm90b3R5cGluZyBhIHBhdGNoIGZvciB0
aGlzIG5vdywgb3IgZG8geW91IHNlZSBhbg0KPiA+IGFsdGVybmF0aXZlIHdheSB0byBtYWtlIHRo
ZSBsaXZlLXVwZGF0ZSBjb21tYW5kIG1vcmUgcm9idXN0Pw0KPiANCj4gSSB0aGluayB0aGlzIGNh
biBiZSBtYWRlIG11Y2ggZWFzaWVyOg0KPiANCj4gVGhlIGxpdmUtdXBkYXRlIHNob3VsZCBiZSBo
YW5kbGVkIGNvbXBsZXRlbHkgaW4gdGhlIGRhZW1vbiwgc28NCj4gcmV0dXJuaW5nIG9ubHkgd2l0
aCBzdWNjZXNzIG9yIGZhaWx1cmUuIFJldHVybmluZyBCVVNZIHdvdWxkbid0DQo+IG9jY3VyIHRo
aXMgd2F5LCBidXQgZWl0aGVyICJPSyIgKGFmdGVyIHRoZSBzdWNjZXNzZnVsIExVKSBvciBhDQo+
IGZhaWx1cmUgcmVhc29uIChlLmcuIGxpc3Qgb2YgZG9tYWlucyBibG9ja2luZykgd291bGQgYmUN
Cj4gcmV0dXJuZWQuDQo+IA0KPiBJJ2xsIGhhdmUgYSB0cnkgd2l0aCB0aGlzIGFwcHJvYWNoLg0K
PiANCj4gDQoNCkluIG94ZW5zdG9yZWQgZWFjaCByZXF1ZXN0IHdhbnRzIGFuIGltbWVkaWF0ZSBy
ZXBseSwgc28gZGVsYXlpbmcgdGhlDQpyZXBseSB0byBhZnRlciB0aGUgbGl2ZS11cGRhdGUgaXMg
bm90IHRyaXZpYWwuDQpTaG91bGQgYmUgcG9zc2libGUgdG8gZG8gdGhvdWdoIChlLmcuIG1hcmsg
dGhlIHNvY2tldCBzdWNoIHRoYXQgbm8NCmZ1cnRoZXIgeGVuc3RvcmUgcHJvdG9jb2wgaXMgcHJv
Y2Vzc2VkIG9uIGl0LCBhbmQgInB1dCBiYWNrIiB0aGUgbGl2ZQ0KdXBkYXRlIHJlcXVlc3QsIHRv
IGJlIHJlcGxpZWQgYnkgdGhlIG5ldyB4ZW5zdG9yZWQgYWZ0ZXIgdGhlIGxpdmUNCnVwZGF0ZSBj
b21wbGV0ZXMsIHdoaWNoIHdvdWxkIGNsZWFyIHRoZSAnZG8gbm90IHByb2Nlc3MgdGhpcyBzb2Nr
ZXQnDQpmbGFnKSwgSSdsbCBiZSBjdXJpb3VzIHRvIHNlZSB3aGF0IHlvdXIgYXBwcm9hY2ggd2ls
bCBsb29rIGxpa2UuDQoNCkJlc3QgcmVnYXJkcywNCi0tRWR3aW4NCg==

