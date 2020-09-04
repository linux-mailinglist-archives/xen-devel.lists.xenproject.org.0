Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A3025D6DC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 12:53:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE9L0-0004WS-MY; Fri, 04 Sep 2020 10:52:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V0SP=CN=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kE9Kz-0004WM-2C
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 10:52:57 +0000
X-Inumbo-ID: 067d341d-5d67-4157-acd0-ec405091c7ce
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 067d341d-5d67-4157-acd0-ec405091c7ce;
 Fri, 04 Sep 2020 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599216775;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3Rzyq2j6IvJ0guLriyGXhUuLMqQIqhssJU5abS4o4k0=;
 b=GMiwJEdPJ8VkZlRSA/qN1Jszn6XyyROuGTG2/hOAE4dUMAYthCG94OZd
 ZoIu2P6h8L2WzOYebdryHvAtzcVayq5dGVQxgHKfgG/s8GbbNAIjaAcbH
 Q1fAibHmY3WtnWwJrkw+RsFX5wQPEtE56HgV5Mn4xCSWldGOQGadFF7bn o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: tUWcB32nryityRzhSyx68yoYO+3PYkz7pQFKuq0q79yAuGSTgK5hTLDxFdMx+lwYz8O8kaUC8T
 3Ghn5SDq0p00Cl4ORKxZ0moOvRd6prJKaCzgeVrFcpvtccxMncSn7hL8nIM1N3PZLNgDa+fP+Z
 ojUcFG2AA6SgSN6KqmcHoQZ+tECiBDLxfuqlmFTc88/Yn5RMPJMJsytuSXkunZsQCoXg0anpR7
 +VygPhKkw2BgnZ9CWeBg3OhJeLZHA9EZ718vIdnuZZwAkCbTLW9a6Zqco9GAt6kfq5/tSBJ57V
 Muo=
X-SBRS: 2.7
X-MesageID: 26960544
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26960544"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eh7mEz9UxoGA7kj92hBxZlanmic6I8KVth2etBZLFc1JWN7ANr2g/TStb+VzAA5tkwa9JPHoJD8vFCz5iteN4sCg3ksla3KjEQXVfO5SpR7nxpq76zfgiSBrRcuto6SfORhBZfNfq7T4Wfk+8bofrmjrMnFLFBK7Gfr443iz8EL2q32a1yXjZgvPM+qaYRTwSR/vIMVR0e5Bp8tc3Ucsop5b++HJHx669lCYZjaM+oA33J9VeDRkvUJ6VEnGa+kTLaI7a7sjPq7otL7gbHpV+ahgjDd+9s/VHbX+FVuc7HWWONxaeCk80HEvKKhazSXNVuvVg5jhQLcr27Uyavn0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Rzyq2j6IvJ0guLriyGXhUuLMqQIqhssJU5abS4o4k0=;
 b=R1r2xElHrpyFLSou46kR8vix2V1s9tyQ6FvMyAk81i6MEUy/ynalgr7ReFK6MKn09XbzPqB8uzjuftCZ29AuvDvc+e3ScJ0MIiZCheK33N22geGIIWuxKd26sRVWvNS3xGzDshSCjoSeKMstqUpAdxHafklLzFKVovNyfFTnv2lUdDZAgi6ZQtLqoqsLaFm42zRXQUigqcYaRO0T5u9QtMfvPbFCduhCWcENXSoyyc923RcIsgLkKCxLZXvw1T0ARYXmHSQpyMMfcuSTAZEWY+E8N3uOgKrreuil9rQkZFMYWAaEDPnilb+VMY/wChZJEEbIZpwcQU1u6u5pIET1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Rzyq2j6IvJ0guLriyGXhUuLMqQIqhssJU5abS4o4k0=;
 b=la453YS5PxRWXC4HavGYq7H36iu5RJGloeTaGGon3T5djandMDvLCHqzc8a/skCZ0bWFo4UkTp0+eyRxFU61GAEzYrDs+ESDSO0DDhB0vCGTkGAQ6ZOY3mX33XjEftxe2NSyD4mQVz4yUqhPDEp7+JPPpgr+e90rG8PRRU1I4oA=
From: George Dunlap <George.Dunlap@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, "open list:X86"
 <xen-devel@lists.xenproject.org>
Subject: Re: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Topic: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Index: AQHWgqFQhHT7mTtQgECZKsLV4pzAaalYRMuAgAAGaQCAAAHFAIAAANWA
Date: Fri, 4 Sep 2020 10:52:52 +0000
Message-ID: <E40FED16-38FB-443A-B1B4-8B0444829A06@citrix.com>
References: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
 <e0c040bd-8b85-8dc9-37ee-04dd83adf072@suse.com>
 <6D291A71-A0A6-401E-B9F6-BF6F992E60DF@arm.com>
 <48BB5235-F9FD-4E81-8CAE-59BEFB24DDC0@arm.com>
In-Reply-To: <48BB5235-F9FD-4E81-8CAE-59BEFB24DDC0@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fa470fd-5a80-48ec-95f4-08d850c0ac09
x-ms-traffictypediagnostic: SJ0PR03MB5581:
x-microsoft-antispam-prvs: <SJ0PR03MB5581069FC989164B76DD1003992D0@SJ0PR03MB5581.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R8SE/7yNtXToBYHt3qBl0q5hcr6tn/5Zt7zN5tEPZ4ZxI9kITnDARn/mn8JMjHNwPybaHBN2pIMrcRmOHceFGjx43wt0EGEe65BGXhHNKDyVxHbgdy9g/mXAmFGQBmDWY/nJLQNeNORr5ikKFtBhgUttEdrZNppLuLCX9JRR8OS81PXLlpVL6IPMcd1HtJ5N4MDz2yoTjeLCO6S0y4545d+XG6AH//Ywx0geCh+8gVkz/QYP9VI6NIrD49DqitS268/8+eNdCq4XqLRyCS8fpW23cEn4zw9IU9devxzSWG92dut4XtqOMzKieTYgoFAr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(26005)(55236004)(6916009)(5660300002)(36756003)(186003)(53546011)(6486002)(66476007)(478600001)(54906003)(2906002)(66946007)(66556008)(91956017)(64756008)(6506007)(76116006)(66446008)(33656002)(8936002)(86362001)(4744005)(6512007)(4326008)(316002)(8676002)(2616005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: I+a/kD07oaBFHR4SgAN389Shf9Efp2K4l1X953rH1JoutwEirkkDPoywVItUmdO991YgyD6nfrFm8l3acJQ9gEe8pyyTM878pHvjjz1xPjrKJG83mh/u3Za/gsOZY3nh/EMo+fbmtzxWJG/MzlQqil/tmLiTYsNSSJfE/GsiiObVFMdrbfvB8UCV/cRDFwNImlmoT1BMDtxfPK84KjgXy+lhDOXNsuBXYlnTQZfEkget6+TV/ZBbM9QBJ/eHw6efjb8bHo4+clW4+9eAjch5eq6NvKHRGVhrPauLDMZ+0rzgpuv03x5iOFLPnx7u7MV2z07QZ/HULxzl0hMv8gRG4+lzuhONzRMcKZppf9VzrSduAWv4guHeumOrZN+WL4AqwFfaUoBytGQIXY8bV4jco1fK0tA35gedqeT6CD0B1kl18uZT457CbhpksPzJsCaGcugNIce6w6vpqHMGus+YfvKKpPmayL+C2UKYRRuokVY5/4sm2yb07ocGGUKxjVuVtrLsk4gk0Qa5Dyj52lw3hVbCiJVKKW+m9ZO/VzlCKky9ZAiiDreORI7uToMIkp2nxe+bF7Y31g4yxgSASnVDuAKCCZKFkzPSSexxKBySrYs4OrBkDmEXMe8d3tKOJl+KIf1PJUZKQ1AapwLlQ/Npug==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <901891B67AE85E40AAFF2EAE5B10E5D4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa470fd-5a80-48ec-95f4-08d850c0ac09
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2020 10:52:52.2218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1pnKU5WKxKcUOQbUiIjtsU2brWQHA4u1SSnExuLTJ+M0d03XRDQhZ1QOyQ4Xan7y5/4C3MTf8nhcpwA2tPeV1608Q0u3VtKR2oEqAgMZvGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5581
X-OriginatorOrg: citrix.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gU2VwIDQsIDIwMjAsIGF0IDExOjQ5IEFNLCBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0
cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4+IA0KPj4gSSB0cmllZCB0byBhZGQg
YSBjb21tZW50IGFuZCB0aGF0IGlzIHdvcmtpbmcgd2VsbA0KPj4gDQo+PiBSZW1hcmtzIGZyb20g
bXkgc2lkZToNCj4+IC0gSG93IGNhbiBpIGFjay90ZXN0L3JlamVjdCBvbiB0aGlzID8NCj4gDQo+
IGFuc3dlciBteXNlbGYgYXMgaSBmb3VuZCB0aGUgdGh1bWJzIHVwIHRoYXQgaSBoYXZlIHRvIGNs
aWNrIDotKQ0KDQpJIGhhdmUgYSBidXR0b24gdGhhdCBzYXlzIOKAnEFwcHJvdmXigJ0g4oCUIGRv
IHlvdSBub3QgaGF2ZSB0aGF0PyAgUGVyaGFwcyB5b3UgZG9u4oCZdCBoYXZlIHRoZSByZXF1aXNp
dGUgcGVybWlzc2lvbnMuDQoNCkJ1dCBJIHRoaW5rIGFkZGluZyDigJxSZXZpZXdlZC1ieeKAnSBp
biBhIGNvbW1lbnQgd291bGQgd29yayBqdXN0IGFzIHdlbGwuDQoNCiAtR2Vvcmdl

