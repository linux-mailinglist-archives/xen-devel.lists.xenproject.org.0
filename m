Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D102A370127
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 21:28:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120734.228343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcYnu-0004GT-K1; Fri, 30 Apr 2021 19:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120734.228343; Fri, 30 Apr 2021 19:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcYnu-0004G4-Gj; Fri, 30 Apr 2021 19:27:58 +0000
Received: by outflank-mailman (input) for mailman id 120734;
 Fri, 30 Apr 2021 19:27:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t0FU=J3=starlab.io=scott.davis@srs-us1.protection.inumbo.net>)
 id 1lcYns-0004Fz-Hi
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 19:27:56 +0000
Received: from GCC02-BL0-obe.outbound.protection.outlook.com (unknown
 [40.107.89.129]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fdce44b-a22f-462f-8a23-1cccbefe3198;
 Fri, 30 Apr 2021 19:27:55 +0000 (UTC)
Received: from MN2PR09MB5258.namprd09.prod.outlook.com (2603:10b6:208:220::11)
 by BLAPR09MB6868.namprd09.prod.outlook.com (2603:10b6:208:2a1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Fri, 30 Apr
 2021 19:27:52 +0000
Received: from MN2PR09MB5258.namprd09.prod.outlook.com
 ([fe80::2939:7b58:8863:9a07]) by MN2PR09MB5258.namprd09.prod.outlook.com
 ([fe80::2939:7b58:8863:9a07%7]) with mapi id 15.20.4087.035; Fri, 30 Apr 2021
 19:27:51 +0000
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
X-Inumbo-ID: 2fdce44b-a22f-462f-8a23-1cccbefe3198
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9EqO64FmF4VTyeVNVQu+T2rL9WmO6w8S/94yHA9TGwUc9yGFqe9SRFFQr3XsZLJXYPufhM0IoZ/Yp79o2vsY6tcOjG/GpIFPXHcuFGvk/Xbeu8bXebRmeto0cEtRQlyCtQH1gyoEDyVMow47ug1NDc88rTGb4dCv95iTZzNXPSCOua38Z9GP0g65O1XJ+bnkmUMjGGGlNEUjZ8/l0EwEh1V1Q7DV3z1029nDHOjW94aNkmhIMiFPyw4QZ8NzK3JZlKwf4Ko0eB5WtYm8PvID/G4ySfrxlgEBqaZKAMMmnv2CcAfofVA3ihFfcGj8QV0RPLAal6JxWTWwiFKqVGL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDVVTGrRgGXLdbJMbXSDP6eLgKQ1xo8wwryytqD0tmU=;
 b=eZAuQyeUruN++txJ8fLNZpIuyylUC702A7qZn4G3UYfTdR2572KtMQPlRW5hwvGH4ac/YgRS/COOaBEvvqYyxElHop6zQXGahuyW43seLqV6tazKE/dn+RjhaOX8O2jzD44rzRPq135P69Hw7gBxjr5LVCtDqy40JZWrdyXxdBqZcm/Mx8q/hfEWoT/AzPECIk6TDSYKXOmsgV7CymKhAX2ULHv2CJhxeZT0130FNhsBwFYDOvAfv4j13JRjR8yGaC+Elkds32PwZIkywYSD8dqkWtNjCqzYu09/uJty7sxoVk1phEqmYRmX1WJo+Ky9YnOLFEMJcX+jE3tWiNbUaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starlab.io; dmarc=pass action=none header.from=starlab.io;
 dkim=pass header.d=starlab.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDVVTGrRgGXLdbJMbXSDP6eLgKQ1xo8wwryytqD0tmU=;
 b=AuqfdAo7dCmdio7fkReCsD8HY/aPaXyr//6u+uNYWY+Ri1MiO+5F9o6aq/K1efgwO2v1ib8SmtkdOrcrrKuZl/CMbW11IJskTsk80YMq5i+dHuYFDcZf/Vhk21hRnWMN6NmQytleAxPsok0O5n8P+VNPqcDMg0WRoQC60fGebUQ=
From: Scott Davis <scott.davis@starlab.io>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "paul@xen.org" <paul@xen.org>
Subject: Re: [RFC PATCH] iommu: make no-quarantine mean no-quarantine
Thread-Topic: [RFC PATCH] iommu: make no-quarantine mean no-quarantine
Thread-Index:
 AQHXOsEjPlXZorMQi0Kt8384oCpmdqrH72EAgAC5poCAAM1cAIAAEeQAgAI1xoCAAO20gIAAiYCA
Date: Fri, 30 Apr 2021 19:27:51 +0000
Message-ID: <52860A0A-D1D0-427D-ADE6-0876FC0897D3@starlab.io>
References:
 <0a292d952ff71dbfed5234d27b42a05f7b49a1fe.1619451434.git.scott.davis@starlab.io>
 <cea1d2d0-fd69-a4cd-6653-dd881d07b96a@suse.com>
 <56F61E81-511E-4ECA-B2A0-B91F250804D7@starlab.io>
 <237ad45b-b68d-9d31-0fbc-1af52dfca808@suse.com>
 <dc6556ae-c653-8519-1a81-9524e4472f26@xen.org>
 <2A65573D-2DD6-49C7-B34C-27B15FD620B2@starlab.io>
 <ec0cc346-3d56-afec-7414-bce81e9eea1d@suse.com>
In-Reply-To: <ec0cc346-3d56-afec-7414-bce81e9eea1d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=starlab.io;
x-originating-ip: [73.133.107.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af3ed640-85f4-4006-8687-08d90c0e0bfc
x-ms-traffictypediagnostic: BLAPR09MB6868:
x-microsoft-antispam-prvs:
 <BLAPR09MB686874EBE075B15B74C84C4D915E9@BLAPR09MB6868.namprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Jo47KMwpMR45hTr7ggchUqSgPy08A/uE8kr+bOUlYeQ7gkBVicLqgx11HfO7nENI7BbfNgB9LsTCjAL4iD1Qi7qVYS/1KujDZqSGJfue1X51c3+28YlGIcgVwX1Q+W7+iaRmOHM1WuRUpfVgv7UuAz2pyLcMz+AFcQ/g8O8ChHUAa0oVwEermRJLSsRU/JVpz3646v07RCtkXhrogB5915/bKzaB4V+GjQsRGqzA6lZFwo0O/okkGTEyTEazjiJdmHRTukKzKxBJWCzin2YywZMzTnsrg/t/LUXU886cPfWoBr0Ztc4nti/tMmVQGUYHyNk6jQjlg3dp1bYoeFH6225tZY+gotk1u27/qiEpJYLtsBxWJ46upBSIfZzpD7KFRC+Nb93AvVP9yGeicsutf9zy50eLb6hcMTxJtT/veeO0xU/MXKZz9SWkIFMHCRtZEehm0maK+xvuYwA+0kH6I1aQwPtXjMH0YdzXO+zJNCei+3p/cj6kLm6FZ23EVHSlmvjtaH/tCKXslOhqECWNJR280DM67zISG8LFN2ZabzZV5LE4vT7uJ6pO43a+3X/z6bggUqYITvT/7WWvzs35L5Cpc2lmejRk3vhVsY2IPd3svi8rumFIZTTrbf7EyP5lwR6sG2ofAYX6tXnmL4N43w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR09MB5258.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39830400003)(366004)(6916009)(76116006)(5660300002)(478600001)(44832011)(6486002)(66446008)(64756008)(66476007)(66556008)(71200400001)(66946007)(83380400001)(6506007)(186003)(38100700002)(36756003)(6512007)(33656002)(4326008)(2616005)(86362001)(26005)(8936002)(122000001)(8676002)(54906003)(316002)(53546011)(2906002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?WnhXZHlvTyt1WE1HclBoRGJpZ1RSQkJSVW5RNXNkUDl3SkJ1ZGxncUViQlY2?=
 =?utf-8?B?cHNMQlFXdTRsQXpURlkrUjNnNmp2WmE2M09HbnRYYmVFdnN1bTdVMWxtcStS?=
 =?utf-8?B?RnN6Wk80OGlyeXQyODVQZVRKY3FLVllETSt4VjBnZlphbDZjOU91aXVwaTVi?=
 =?utf-8?B?ejRBNmhrVWNRT0UxNDV1M3djazlCcUR4ek9HU3hRQ0ZwbXFSZ3dHKzZBWHdu?=
 =?utf-8?B?V09WckU3eVBjREpDVTFTdWF2ZHQyM3Fnamt0NW1NZ2Y2bTFZd0FrRHhCTWp1?=
 =?utf-8?B?cEFsa2JhNVBYMDg0bWVabVBuaUNQa21ONFlVellERWV1bTJsNEEraHZqclp2?=
 =?utf-8?B?S0MxNFRXYXVtVXQ0RDZxR3FZSWtjZW1zVHNtaUdIaTZHb3BWQkhmdTNPeGt5?=
 =?utf-8?B?cm9wYWRjaE5pUnlFNXQrbHZyRTJVSk1keCszYURQalNJaGVkenNkdjAzWWRp?=
 =?utf-8?B?UnA5WkdvdmM4aXlzOHZ2Tyt3RW1La2RoUmxuV0RHVk1qYXhiK2x3MXc4M0Vj?=
 =?utf-8?B?ZlQ1ZVVaV1VUMWdvL2RKL0I1eDVKcTZ2U1RnaHZSblJhL25WMk82RDRXemsz?=
 =?utf-8?B?ZUd0aEJQYnZJelNyY2pBK1NDTUc5aHRrT1lETmx1ejQrNXppK2tUYlNzZU9w?=
 =?utf-8?B?dXl1dzY2eW55RGpSclpKT29JSHppTGp6LzZQelJMQ3lTZ1VZU3RJdWdSWnA4?=
 =?utf-8?B?UEZQWHp6ZDQ2bkc2RFRPdVRBenNMV0F5Q1QwYXJha09mQmVTbVZHb2VUVGV1?=
 =?utf-8?B?SE03QU5CWFBsUzJyOE55cnpod0NDVUxHTXZaRWQvb2FnQTVwcXczNVdtNDcz?=
 =?utf-8?B?YXI3V0xMQkM0YzZSRlRsbjh2ejcvOUdPcVJhY09nbFlpRXBFRjQ4Uk9WMk1t?=
 =?utf-8?B?a28wQWNLOUNMSk1vRTc3YzFtSmFBR2FNSmFqQ2w2OE1Jcys4RHJIR0xqYTVl?=
 =?utf-8?B?bVR2RHY4anF5WmlXekgvdUl2enY1b0JtWmRwN2dRS3VFZGRQZktMY2hTZFB6?=
 =?utf-8?B?T2VVQnhhM0oyUTFWTWNseEN2b1F5aE1DNG1uUzdyV0thUmVKMElGNzBwSWk5?=
 =?utf-8?B?YXVSRUsrYXdrak84YVQwdnlJSDd5RG4xOXl2eVF3VG5mbks2Ry8reWdZUmsv?=
 =?utf-8?B?ZGFicXpCQmRPbCtGT1hOQkVJZUR5WUtLZVRhYWtOeEc3Qy91OURjTzN0M1Y0?=
 =?utf-8?B?Rzd2UlQvZEtGUVhWWTJ3Z1oyeldRNWxTRU50QUxnL2puOUdBcjIzcm9Ib0hR?=
 =?utf-8?B?a3RvdWFaTlNiOHZmUU85Zlcyb3N0VUJhaytob2lSbndTWkdCT3BlVHh5Zi9L?=
 =?utf-8?B?eGhwSlJ2TWtqT2tGVnhmZlFsTjFaMVFvL0taQXpYbjEwSDh4dnlrS1lBRmdI?=
 =?utf-8?B?SDF1TElkSFV1Mm5DYmI3WjlSeFRZYWVOVnV0UTNOTU0rWEdXcU9kcURTcTNV?=
 =?utf-8?B?eHF5eU9xdkZIUVRWemJWMTRpVndON01yTHNZM1R5YVlQVnQzMjdUSGZFVUNv?=
 =?utf-8?B?YjNVTDBqZXFsd3dwNEhmMVZHVmFUS290d0IzdmtTN1NJQjVYTTBua2l2MkZx?=
 =?utf-8?B?VFIzczdVekNablRVM0VMQnRua3hVT1NzV1RVVWtTaWR4TmUrODN2azU5Y2NP?=
 =?utf-8?B?blJMY2d0Y0J3T0ppSjNQR1YybGF6QXdBeTdWZXZ3b3REVkh3bFlJWVNuaWw0?=
 =?utf-8?B?NnhRY1l1c092dnJqRG55a2VWT0t0SzJLTVVHaHBIUHQwVHltRXdQZ01jN0lC?=
 =?utf-8?Q?IJWY8TUPkUNbeMmV7bP+8bEDUP2j7R3hNZ6uddV?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <49904EE525E10246AE2A518ED9E90E0C@namprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR09MB5258.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3ed640-85f4-4006-8687-08d90c0e0bfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 19:27:51.7639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR09MB6868

T24gNC8zMC8yMSwgMzoxNSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFNvIGZhciB5b3UgZGlk
bid0IHRlbGwgdXMgd2hhdCB0aGUgYWN0dWFsIGNyYXNoIHdhcy4gSSBndWVzcyBpdCdzIG5vdA0K
PiBldmVuIGNsZWFyIHRvIG1lIHdoZXRoZXIgaXQncyBYZW4gb3IgcWVtdSB0aGF0IGRpZCBjcmFz
aCBmb3IgeW91LiBCdXQNCj4gSSBoYXZlIHRvIGFsc28gYWRtaXQgdGhhdCB1bnRpbCBub3cgaXQg
d2Fzbid0IHJlYWxseSBjbGVhciB0byBtZSB0aGF0DQo+IHlvdSByYW4gWGVuIF91bmRlcl8gcWVt
dSAtIGluc3RlYWQgSSB3YXMgYXNzdW1pbmcgdGhlcmUgd2FzIGFuDQo+IGludGVyYWN0aW9uIHBy
b2JsZW0gd2l0aCBhIHFlbXUgc2VydmluZyBhIGd1ZXN0Lg0KDQpJIGV4cGxhaW5lZCB0aGlzIGlu
IG15IE9QLCBzb3JyeSBpZiBpdCB3YXMgbm90IGNsZWFyOg0KDQo+IEJhY2tncm91bmQ6IEkgYW0g
c2V0dGluZyB1cCBhIFFFTVUtYmFzZWQgZGV2ZWxvcG1lbnQgYW5kIHRlc3RpbmcgZW52aXJvbm1l
bnQNCj4gZm9yIHRoZSBDcnVjaWJsZSB0ZWFtIGF0IFN0YXIgTGFiIHRoYXQgaW5jbHVkZXMgZW11
bGF0ZWQgUENJZSBkZXZpY2VzIGZvcg0KPiBwYXNzdGhyb3VnaCBhbmQgaG90cGx1Zy4gSSBlbmNv
dW50ZXJlZCBhbiBpc3N1ZSB3aXRoIGB4bCBwY2ktYXNzaWduYWJsZS1hZGRgDQo+IHRoYXQgY2F1
c2VzIHRoZSBob3N0IFFFTVUgdG8gcmFwaWRseSBhbGxvY2F0ZSBtZW1vcnkgdW50aWwgZ2V0dGlu
ZyANCj4gT09NLWtpbGxlZC4NCg0KQXMgc29vbiBhcyBYZW4gd3JpdGVzIHRoZSBJUVQgcmVnaXN0
ZXIsIHRoZSBob3N0IFFFTVUgcHJvY2VzcyBsb2NrcyB1cCwNCnN0YXJ0cyBhbGxvY2F0aW5nIHNl
dmVyYWwgaHVuZHJlZCBNQi9zZWMsIGFuZCBpcyBzb29uIE9PTS1raWxsZWQgYnkgdGhlDQpob3N0
IGtlcm5lbC4NCg0KT24gNC8zMC8yMSwgMzoxNSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IElu
dGVyZXN0aW5nLiBUaGlzIHRoZW4gbGVhdmVzIHRoZSBxdWVzdGlvbiB3aGV0aGVyIHdlIHN1Ym1p
dCBhIGJvZ3VzDQo+IGNvbW1hbmQsIG9yIHdoZXRoZXIgcWVtdSBjYW4ndCBkZWFsIChjb3JyZWN0
bHkpIHdpdGggYSB2YWxpZCBvbmUgaGVyZS4NCg0KSSBkaWQgc29tZSBleHRyYSBkZWJ1Z2dpbmcg
dG8gaW5zcGVjdCB0aGUgaW5kZXggdmFsdWVzIGJlaW5nIHdyaXR0ZW4gdG8NCklRVCBhcyB3ZWxs
IGFzIHRoZSBpbnZhbGlkYXRpb24gZGVzY3JpcHRvcnMgdGhlbXNlbHZlcyBhbmQgZXZlcnl0aGlu
Zw0KYXBwZWFyZWQgZmluZSB0byBtZSBvbiBYZW4ncyBlbmQuIEluIGZhY3QsIHRoZSBkZXNjcmlw
dG9yIHdyaXR0ZW4gYnkNCnF1ZXVlX2ludmFsaWRhdGVfY29udGV4dF9zeW5jIHVwb24gbWFwIGlu
dG8gZG9tX2lvIGlzIGVudGlyZWx5IGlkZW50aWNhbA0KdG8gdGhlIG9uZSBpdCB3cml0ZXMgdXBv
biB1bm1hcCBmcm9tIGRvbTAsIHdoaWNoIHdvcmtzIHdpdGhvdXQgaXNzdWUuDQpUaGlzIHBvaW50
IHRvd2FyZHMgYSBRRU1VIGJ1ZyB0byBtZToNCg0KKGdkYikgYw0KVGhyZWFkIDEgaGl0IEJyZWFr
cG9pbnQgNCwgcXVldWVfaW52YWxpZGF0ZV9jb250ZXh0X3N5bmMgKC4uLikgYXQgcWludmFsLmM6
MTAxDQooZ2RiKSBidA0KIzAgIHF1ZXVlX2ludmFsaWRhdGVfY29udGV4dF9zeW5jICguLi4pIGF0
IHFpbnZhbC5jOjg1DQojMSAgZmx1c2hfY29udGV4dF9xaSAoLi4uKSBhdCBxaW52YWwuYzozNDEN
CiMyICBpb21tdV9mbHVzaF9jb250ZXh0X2RldmljZSAoLi4uKSBhdCBpb21tdS5jOjQwMA0KIzMg
IGRvbWFpbl9jb250ZXh0X3VubWFwX29uZSAoLi4uKSBhdCBpb21tdS5jOjE2MDYNCiM0ICBkb21h
aW5fY29udGV4dF91bm1hcCAoLi4uKSBhdCBpb21tdS5jOjE2NzENCiM1ICByZWFzc2lnbl9kZXZp
Y2Vfb3duZXJzaGlwICguLi4pIGF0IGlvbW11LmM6MjM5Ng0KIzYgIGludGVsX2lvbW11X2Fzc2ln
bl9kZXZpY2UgKC4uLikgYXQgaW9tbXUuYzoyNDc2DQojNyAgYXNzaWduX2RldmljZSAoLi4uKSBh
dCBwY2kuYzoxNTQ1DQojOCAgaW9tbXVfZG9fcGNpX2RvbWN0bCAoLi4uKSBhdCBwY2kuYzoxNzMy
DQojOSAgaW9tbXVfZG9fZG9tY3RsICguLi4pIGF0IGlvbW11LmM6NTM5DQouLi4NCihnZGIpIHBy
aW50IGluZGV4DQokMiA9IDU1Mg0KKGdkYikgcHJpbnQgcWludmFsX2VudHJ5LT5xLmNjX2ludl9k
c2MNCiQzID0gew0KICBsbyA9IHsNCiAgICB0eXBlID0gMSwNCiAgICBncmFudSA9IDMsDQogICAg
cmVzXzEgPSAwLA0KICAgIGRpZCA9IDAsDQogICAgc2lkID0gMjU2LA0KICAgIGZtID0gMCwNCiAg
ICByZXNfMiA9IDANCiAgfSwNCiAgaGkgPSB7DQogICAgcmVzID0gMA0KICB9DQp9DQooZ2RiKSBj
DQpUaHJlYWQgMSBoaXQgQnJlYWtwb2ludCA1LCBxaW52YWxfbmV4dF9pbmRleCAoLi4uKSBhdCBx
aW52YWwuYzo1OA0KKGdkYikgYnQNCiMwICBxaW52YWxfbmV4dF9pbmRleCAoLi4uKSBhdCBxaW52
YWwuYzo1OA0KIzEgIHF1ZXVlX2ludmFsaWRhdGVfd2FpdCAoLi4uKSBhdCBxaW52YWwuYzoxNTkN
CiMyICBpbnZhbGlkYXRlX3N5bmMgKC4uLikgYXQgcWludmFsLmM6MjA3DQojMyAgcXVldWVfaW52
YWxpZGF0ZV9jb250ZXh0X3N5bmMgKC4uLikgYXQgcWludmFsLmM6MTA2DQouLi4NCihnZGIpIHBy
aW50IHRhaWwNCiQ0ID0gNTUzDQooZ2RiKSBjDQpUaHJlYWQgMSBoaXQgQnJlYWtwb2ludCA1LCBx
aW52YWxfbmV4dF9pbmRleCAoLi4uKSBhdCBxaW52YWwuYzo1OA0KKGdkYikgYnQNCiMwICBxaW52
YWxfbmV4dF9pbmRleCAoLi4uKSBhdCBxaW52YWwuYzo1OA0KIzMgIHF1ZXVlX2ludmFsaWRhdGVf
aW90bGJfc3luYyAoLi4uKSBhdCBxaW52YWwuYzoxMjANCiM0ICBmbHVzaF9pb3RsYl9xaSAoLi4u
KSBhdCBxaW52YWwuYzozNzYNCiM1ICBpb21tdV9mbHVzaF9pb3RsYl9kc2kgKC4uLikgYXQgaW9t
bXUuYzo0OTkNCiM2ICBkb21haW5fY29udGV4dF91bm1hcF9vbmUgKC4uLikgYXQgaW9tbXUuYzox
NjExDQojNyAgZG9tYWluX2NvbnRleHRfdW5tYXAgKC4uLikgYXQgaW9tbXUuYzoxNjcxDQouLi4N
CihnZGIpIHByaW50IHRhaWwNCiQ1ID0gNTU0DQooZ2RiKSBjDQpUaHJlYWQgMSBoaXQgQnJlYWtw
b2ludCA1LCBxaW52YWxfbmV4dF9pbmRleCAoLi4uKSBhdCBxaW52YWwuYzo1OA0KKGdkYikgYnQN
CiMwICBxaW52YWxfbmV4dF9pbmRleCAoLi4uKSBhdCBxaW52YWwuYzo1OA0KIzEgIHF1ZXVlX2lu
dmFsaWRhdGVfd2FpdCAoLi4uKSBhdCBxaW52YWwuYzoxNTkNCiMyICBpbnZhbGlkYXRlX3N5bmMg
KC4uLikgYXQgcWludmFsLmM6MjA3DQojMyAgcXVldWVfaW52YWxpZGF0ZV9pb3RsYl9zeW5jICgu
Li4pIGF0IHFpbnZhbC5jOjE0Mw0KLi4uDQooZ2RiKSBwcmludCB0YWlsDQokNiA9IDU1NQ0KKGdk
YikgYw0KVGhyZWFkIDEgaGl0IEJyZWFrcG9pbnQgNSwgcWludmFsX25leHRfaW5kZXggKC4uLikg
YXQgcWludmFsLmM6NTgNCihnZGIpIGJ0DQojMCAgcWludmFsX25leHRfaW5kZXggKC4uLikgYXQg
cWludmFsLmM6NTgNCiMxICBxdWV1ZV9pbnZhbGlkYXRlX2NvbnRleHRfc3luYyAoLi4uKSBhdCBx
aW52YWwuYzo4Ng0KIzIgIGZsdXNoX2NvbnRleHRfcWkgKC4uLikgYXQgcWludmFsLmM6MzQxDQoj
MyAgaW9tbXVfZmx1c2hfY29udGV4dF9kZXZpY2UgKC4uLikgYXQgaW9tbXUuYzo0MDANCiM0ICBk
b21haW5fY29udGV4dF9tYXBwaW5nX29uZSAoLi4uKSBhdCBpb21tdS5jOjE0MzYNCiM1ICBkb21h
aW5fY29udGV4dF9tYXBwaW5nICguLi4pIGF0IGlvbW11LmM6MTUxMA0KIzYgIHJlYXNzaWduX2Rl
dmljZV9vd25lcnNoaXAgKC4uLikgYXQgaW9tbXUuYzoyNDEyDQouLi4NCihnZGIpIHByaW50IHRh
aWwNCiQ3ID0gNTU2DQooZ2RiKSBjDQpUaHJlYWQgMSBoaXQgQnJlYWtwb2ludCA0LCBxdWV1ZV9p
bnZhbGlkYXRlX2NvbnRleHRfc3luYyAoLi4uKSBhdCBxaW52YWwuYzoxMDENCihnZGIpIHByaW50
IGluZGV4DQokOCA9IDU1Ng0KKGdkYikgcHJpbnQgcWludmFsX2VudHJ5LT5xLmNjX2ludl9kc2MN
CiQ5ID0gew0KICBsbyA9IHsNCiAgICB0eXBlID0gMSwNCiAgICBncmFudSA9IDMsDQogICAgcmVz
XzEgPSAwLA0KICAgIGRpZCA9IDAsDQogICAgc2lkID0gMjU2LA0KICAgIGZtID0gMCwNCiAgICBy
ZXNfMiA9IDANCiAgfSwNCiAgaGkgPSB7DQogICAgcmVzID0gMA0KICB9DQp9DQooZ2RiKSBjDQpD
b250aW51aW5nLg0KUmVtb3RlIGNvbm5lY3Rpb24gY2xvc2VkDQoNCldpdGggb3V0cHV0IGZyb20g
ZG9tMCBhbmQgWGVuIGxpa2U6DQoNClsgICAzMS4wMDIyMTRdIGUxMDAwZSAwMDAwOjAxOjAwLjAg
ZXRoMTogcmVtb3ZlZCBQSEMNClsgICAzMS42OTQyNzBdIGUxMDAwZTogZXRoMSBOSUMgTGluayBp
cyBEb3duDQpbICAgMzEuNzE3ODQ5XSBwY2liYWNrIDAwMDA6MDE6MDAuMDogc2VpemluZyBkZXZp
Y2UNClsgICAzMS43MTk0NjRdIEFscmVhZHkgc2V0dXAgdGhlIEdTSSA6MjANCihYRU4pIFsgICA4
My41NzI4MDRdIFtWVC1EXWQwOlBDSWU6IHVubWFwIDAwMDA6MDE6MDAuMA0KKFhFTikgWyAgODA4
LjA5MjMxMF0gW1ZULURdZDMyNzUzOlBDSWU6IG1hcCAwMDAwOjAxOjAwLjANCg0KR29vZCBkYXks
DQpTY290dA0KDQo=

