Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EBA33B418
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 14:27:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98012.185856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLnFI-0003Sa-Rg; Mon, 15 Mar 2021 13:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98012.185856; Mon, 15 Mar 2021 13:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLnFI-0003S4-OV; Mon, 15 Mar 2021 13:26:56 +0000
Received: by outflank-mailman (input) for mailman id 98012;
 Mon, 15 Mar 2021 13:26:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hl2=IN=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lLnFG-0003Rf-Mc
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 13:26:54 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4fc416f-7459-409b-9668-29b55d9a2944;
 Mon, 15 Mar 2021 13:26:53 +0000 (UTC)
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
X-Inumbo-ID: c4fc416f-7459-409b-9668-29b55d9a2944
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615814813;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nPLzut19jIiEdJ7RGV40EqqCQzkHaj9E3VQdX1oFvoI=;
  b=OtWMIPiThwWaNSyLXbFKPnj66x4366vzDxMtweIiNh3XmZQEim2gJTfW
   B8M5nDueBSE2x7SP9lWG41YF0g/vJ/IlyQM7hghK8bQpoDKN6Ern0kNFD
   72Rf3t0gQFCpzV9QerLHB/hf9mVC+uN6HaeSj00vm2+DqQClPcvl+G9ez
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CcNjdDh6QItXoPJGXl+5zDh7UrS9XlcV/q/UhlTMj0Yi/uSBtPg1XVSVIpvAM+vDZ7jBKu1i+S
 iQpn4Vhqg9YajHv6O99sEsrcV3nkVxsNDGzUBT+qkab0u1MMLCUjAjPYBBNJESnROLD+xesyDe
 LawjiCYLJ4XHhluR6ySe37pJcUuRi/mMfUKUNIuHdeihHLQTi9R8MylktzTMr0+lxJqZG5FDXL
 nmwUDTzjXYjLKNs3g33z1csNAsZZutyC9AHW8GT/L8hS6KnbXcVv/vWW49XwT+QcZq4Bt3Wf7j
 IEg=
X-SBRS: 5.2
X-MesageID: 39303409
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
X-IronPort-AV: E=Sophos;i="5.81,249,1610427600"; 
   d="scan'208";a="39303409"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vo3y7LoBlpRfnxlXiUBPVXO/pVDKGeThg3y69TcTkFjtvoUR0Z17PpI36FGvYy7bj7pFjamXtqRWZUOwKErq2wty46dPdyvO7g3nkbUwKjf1BexuTthftUibnhSephUVSIZrnZfTXV+ygj9+12ufGJan81H1MLIcrEnTRzg/jfRcKslps8Grh7ciqxUSSo8541JdQGlKE/vzYbI5NMrY/LJLKyEiCV/mwlo1mFLb3W/62PEwp9mDI2CXZbnotiD03ybcCY1NBrGpi4Nip5qG5dRiS4kjR0Iw6IcJvlwKsUalw/1uwxqBLrKWBHh8dzQOh4+B337rsygEJLWEeztuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPLzut19jIiEdJ7RGV40EqqCQzkHaj9E3VQdX1oFvoI=;
 b=cYjRFlujGa/sjUC1zwpGj+aoSl0KvI2FuVu8AJB2cfTRZnkbFWWlYCykrrLPXw9AD2iUOK824PhY0+rgUH9ufI+HJJgNSEd4J/5CBXmYNIBfhW6w18q702JNaze4SItIvKcxJmI5JQ3p11OPFuSozMDk8H8RD+hRAAtlIwfA+RpBnh+x1ClLlreWqWHHVZtXl5uGm+11pZB75+gqOAjCUFC7IH09Kn7XzAc2v2vdHE4MFmTqM+WE6ud8TYJ2Kmlt2HPUHssOOTsWQzOZ05hFVr9BwKbEaXgY0SYTxVSO7lsHi1wz4Hr9kaUfZ5erar6URNJezezFdfb1PK5LQkRaIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPLzut19jIiEdJ7RGV40EqqCQzkHaj9E3VQdX1oFvoI=;
 b=Ti0G+ltSUrPZZ5tu1BHNUn0cHKQZ4NwAgFgl842W+LBoRpHuYNoodI4pQPmNBzZEJ/rUyUTSwUrj0+00i8fpgY1QdoP2ajSsHoj14Hn0CE4AiihhH7Pm5n8WPN1J0RijNDNWZbrRw6On0ZaSIDi/FKS+R3VWpkXsqd0lckpxH5k=
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <iwj@xenproject.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH 4.15 3/3] CHANGELOG.md: Glean some information from
 SUPPORT.md
Thread-Topic: [PATCH 4.15 3/3] CHANGELOG.md: Glean some information from
 SUPPORT.md
Thread-Index: AQHXFPObmjsak1n05US1KozduC4yDaqFE8uA
Date: Mon, 15 Mar 2021 13:26:47 +0000
Message-ID: <702645DF-2B40-42E9-95A3-11A8BF3E7E0C@citrix.com>
References: <20210309145002.30359-1-iwj@xenproject.org>
 <20210309145002.30359-4-iwj@xenproject.org>
In-Reply-To: <20210309145002.30359-4-iwj@xenproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aae63747-2878-4d51-39f5-08d8e7b5fc39
x-ms-traffictypediagnostic: PH0PR03MB5799:
x-microsoft-antispam-prvs: <PH0PR03MB57993F2D20DE1A616694E848996C9@PH0PR03MB5799.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cZsj47s+1UFH8W9++XYzS6gNuy1oAv3Xi+GV5IxN7/Ydk3r6WSdXjN3xC3HrG8VBJEZdWDml93+rjGFoLkMI5TgXIADYF2xStTPy0Vp/eLA3NXgv4Da9I8sRPxiDHNuvcRgzXciaMSnip3XemRszxsaezVgaGvMtPo6VhnKjp99STB0J3cqOkfaxVvnaTu/b6llouj5vqQRKTbiF57hkl1wvXK5a8+azhcV3lUdnIgCWS0UAIkn3RA/5md1CW0ZntJMNhszXKoSESTq6ySvGDpVZh/xr9K7l9RXnTeC6OybspyXV8CqxtVKtCcxpsMcJcNctyjQWMFLcA46Zji5F2AFDt7LrqVgrK6EYXgxupGdFdr8ePdx+dkF1pLPqtTuccJfELP182HTxBZV39QRuo0p75kt0HDxEZ+vpJd4CcpEb+O5tz9qFVIZeizbOrbhOXZzMujYsdoU1K//hniODA5VwqOynHXL74cXg3CspL2NKxUJrmQ9PLUDz4CxO1NsyRqISiIvKC9CiK+6QsR2C4hBdD/EVKK0TOtjb2tqR/PTuZQ6u+XJHzzoDxXP4k22bWNxGE1ptdf6LC/CuC4z3HKBcxuHEUapPAGP/7ZCCeigkwXPWnP1nNc0u1dk/2P9/RHtEB9DC0YFXctB/jOR6lSP2dwxHMmbjsVyTRzKhahV7IMpFYp0cRgZFYhgC7yCEpA5dGS6Dbl7hUn/BOHfdsdJuOHxqviQ2mL5ETWPtIbBOT2gFxSiCrXs9UmACDZiw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(6506007)(8936002)(2906002)(53546011)(76116006)(64756008)(71200400001)(478600001)(8676002)(66476007)(66446008)(6486002)(26005)(2616005)(66946007)(66556008)(33656002)(186003)(54906003)(91956017)(86362001)(316002)(36756003)(6916009)(83380400001)(6512007)(4326008)(5660300002)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TkNQR3VGZTA5TlU5L0ttalRkaUkwS1hyOUs0SzhnQUlhK3QrcVEwNU9mdDRv?=
 =?utf-8?B?dG1kOE1QL3FPa2dwb2xFUHlBUXpoOXo0V2I3cE1vell3TEFYSlRFOHA0bDBB?=
 =?utf-8?B?T1oybWVEZUhvbElyVmJKOVB1djN4WitDaFh6S1Z4VmltdjBqT2JSd1NpNHVG?=
 =?utf-8?B?eWlabHBtMXV0MExrdVcxMGJLZDJQbzlFRXVERjVEU1kyZGVUcGZjdDE0SkVU?=
 =?utf-8?B?L3BmOW5qN25lUjJxVjVGdXRHeE81N3MyeElkMmtuUWdXZ1k3dVZ0S3dMbUxo?=
 =?utf-8?B?ZnpmbC9vazFmRzBuZDhnRHBYYzQyYktnczNCdHNNS3RNUTQ2dVh5azlyVDM0?=
 =?utf-8?B?UWdWU21xTUhFU2FIWlJvOVdDWWd0aUNYcVJjZSs5SmJQKzEzSmlDeEViNlRO?=
 =?utf-8?B?ZW1OdnF4aUY2VFVsRC8vb3ZCMTBrdEZsbXBNbDc5OVI4ZEQyWHVUVjE5bXYy?=
 =?utf-8?B?d1piRS9mNDFQLy9nRmlsOC93SGkwUlhTcTNzcllvbGpMZlZuY3A3L2RXS1p6?=
 =?utf-8?B?WS9NUFplUU1DclVGNldHVFdaVjlOUmlqQW1JSWgxN1dsSHdjTnZMdVFSak9a?=
 =?utf-8?B?bkdZZTdaTkVoNFg5Q3BCUEZTVndNTDJJWldXRHhOQjJsamQrWmpSL3haNWNy?=
 =?utf-8?B?MmFRTHhqQ1MzNjdnZmJXdlAzbStHS2x5dWowekxXL1NGUE9RZDFoYTdrSStl?=
 =?utf-8?B?b2pqVlNkWDc5VE1ZRjlhVDF2V1lNUS9MdW9CT25jRG80eXJMd2lGQkVmM1J2?=
 =?utf-8?B?a3VUbmxHeEpkSDZHZjlyVUhwRnJvNXJOaHJLWWxvVjQzcGdxeXNEaG8vYnp2?=
 =?utf-8?B?VTB6YTJXRldGUTZ1SVhlbko0VnRIcXJJRWp3OWw0ZzhSNXYwMXBma1U3ejhC?=
 =?utf-8?B?UnFyN3pabkhPRGVKTE9kSUVVT2FuTHdRaTU2engwNXhiNVVLd2h0Yis0Z0FJ?=
 =?utf-8?B?ZVF6U1VKeHE3RWZlSnExcU0wNWRkQ1hFSnl4bVU1bThLQVZzazhSbW8zQlNH?=
 =?utf-8?B?N29XYUFydkF5MkR0TWNCaFd6UHB3Tm5mM2wxRFRIN2JSZHo0clBycFo0djVn?=
 =?utf-8?B?ZEpISzRaV21seWdhWmo5TFlhRGFQc2tIYVh6OEpDb0FRZVVKbC9nMm5XSkhn?=
 =?utf-8?B?dFhJcnEvRkJXenRWeHFEM1o0NlNQVk02QjZkMGJGYWxmaWxRYTlZTWZnRUZk?=
 =?utf-8?B?VjZhTzRDTlJESjgzNUE4TUY3VG1TWCtReG9RYUNUaTF1TGFIWEU0SlRuTW90?=
 =?utf-8?B?elF0VTdQNmNnejFhL1RlSUx0RElsbVhlUjltcEdURFpVeWxpRFBhR0tQbUNZ?=
 =?utf-8?B?YU5wa1lmZUgwWnJyandkNlJDaS82N3d4Z2VYTWYvbGVNc3NIZzJjenhINHJU?=
 =?utf-8?B?RWxXczN6Q1VUN0ttaGRCbXlveHdQWkltUStGQkM1SlZFUFg3a29qdm4zK2ZR?=
 =?utf-8?B?c2dLNHJhSWVrbUNzeXYzZ3poZFludFFJVUpUTTN1ZWFlOFhQNGxteDhjc2NU?=
 =?utf-8?B?T0ZRZ2k5cjZQUlNPSTdvY2xtUnZKdVNvdU5SaVdkODdHaWdlT2VDTlVoZjIr?=
 =?utf-8?B?VisvMzBETWVoS0J4U0pHV3lXd3l3Tkh6MnFvRTZEV0d4c2RlK05jQkY1clZh?=
 =?utf-8?B?cXB0U1FmZ0U3eUlnVm1sckpTWmxHd1g0YkVXNENLMklsMmQ5TGw4WnFuMHJ3?=
 =?utf-8?B?RWVDMG1lS2x6Q1pQR0RGeDJKa1dNSlRoNVdILzRjT29ZdG52Z3c0a3JtZjRI?=
 =?utf-8?B?azExdWJ0MVhGWENqTFkyanh1dnJOUVhzdlNOc3F2L0MvdFNsZ284L0c2dUhM?=
 =?utf-8?B?VGJVNVkzSE5uUzNod3dJZz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E0ACCB8C81B644698A7733210674911@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aae63747-2878-4d51-39f5-08d8e7b5fc39
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 13:26:47.8376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4UIxhwNYTXQFU2/7t+44OMvxXR7d4ARXSNo6eSS8LTVc7j46aBagPPReiFtbFxEVv9Q1as1r5rffW5HNuHoP8eTMX0DzqzXWNbAEu5FPTts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5799
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWFyIDksIDIwMjEsIGF0IDI6NTAgUE0sIElhbiBKYWNrc29uIDxpd2pAeGVucHJv
amVjdC5vcmc+IHdyb3RlOg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGl3akB4
ZW5wcm9qZWN0Lm9yZz4NCj4gLS0tDQo+IENIQU5HRUxPRy5tZCB8IDEwICsrKysrKysrKysNCj4g
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9DSEFO
R0VMT0cubWQgYi9DSEFOR0VMT0cubWQNCj4gaW5kZXggNGVjZDE1N2EzNS4uY2NkYmI4MmMyZSAx
MDA2NDQNCj4gLS0tIGEvQ0hBTkdFTE9HLm1kDQo+ICsrKyBiL0NIQU5HRUxPRy5tZA0KPiBAQCAt
Niw2ICs2LDE2IEBAIFRoZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tlZXAgYSBDaGFuZ2Vsb2ddKGh0
dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29tL2VuLzEuMC4wLykNCj4gDQo+ICMjIFtVbnJlbGVhc2Vk
XShodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPXNob3J0bG9nKQ0K
PiANCj4gKyMjIEFkZGVkIC8gc3VwcG9ydCB1cGdyYWRlZA0KPiArIC0gTGludXggZGV2aWNlIG1v
ZGVsIHN0dWJkb21haW5zIChUZWNoIFByZXZpZXcpDQo+ICsgLSBYZW4gUFYgZGlzcGxheSBwcm90
b2NvbCAiYmFja2VuZCBhbGxvY2F0aW9uIiBtb2RlIChFeHBlcmltZW50YWwpDQo+ICsgLSBBUk0g
SU9SRVEgc2VydmVycyAoZGV2aWNlIGVtdWxhdGlvbiBldGMuKSAoVGVjaCBQcmV2aWV3KQ0KPiAr
IC0gUmVuZXNhcyBJUE1NVS1WTVNBIChTdXBwb3J0ZWQsIG5vdCBzZWN1cml0eSBzdXBwb3J0ZWQ7
IHdhcyBUZWNoIFByZXZpZXcpDQo+ICsgLSBBUk0gU01NVXYzIChUZWNoIFByZXZpZXcpDQoNCk90
aGVyIGdlbmVyYWwgdGhpbmdzIEnigJltIHNlZWluZyBpbiB0aGUgdHJlZSAobWF5IG5lZWQgYm90
aCBTVVBQT1JULm1kIGFuZCBjaGFuZ2Vsb2cgdXBkYXRlcyk6DQoNCiogU3VwcG9ydCBmb3IgenN0
ZC1jb21wcmVzc2VkIGRvbTAga2VybmVscw0KKiB2bXRyYWNlIHN1cHBvcnQNCiogbmFtZWQgUENJ
IGRldmljZXMgaW4geGwgLyBsaWJ4bA0KKiBnbnR0YWIgc3R1cHBvcnQgZm9yIE5ldEJTRA0KKiB2
aXJpZGlhbjogQmV0dGVyIHZpcnR1YWxpemVkIElQSSBzdXBwb3J0LCBjcHUgaG90cGx1ZywgcmVt
b3ZhbCBvZiA2NC12Y3B1IGxpbWl0DQoqIHg4Nl9lbXVsYXRlIHN1cHBvcnQgZm9yIEFWWC1WTk5J
DQoqIEV4cGFuZGVkIHRlc3QtY2FzZXMgZm9yIHg4Nl9lbXVsYXRlDQoqIEhWTS1zcGVjaWZpYyBN
TSBjb2RlIChzaGFkb3csIHAybSkgY29kZSBmYWN0b3JlZCBvdXQgaW50byBhIHNlcGFyYXRlIGZp
bGUNCiogaHlwZnM6IEFkZGVkIGNwdXBvb2wgZGlyZWN0b3JpZXMgYW5kIGNvbnRyb2xzDQoNCkNv
dWxkIHByb2JhYmx5IHVzZSBzb21lIGlucHV0IG9uIHRoZSBuYW1pbmcgaGVyZSBmcm9tIHBlb3Bs
ZSB3aG8gaGF2ZSBjb250cmlidXRlZC4NCg0KIC1HZW9yZ2UNCg0K

