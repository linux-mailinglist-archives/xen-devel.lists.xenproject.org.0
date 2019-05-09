Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A7A19504
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 00:03:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOr5P-0002BR-96; Thu, 09 May 2019 22:00:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=leE6=TJ=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hOr5N-0002BM-9t
 for xen-devel@lists.xen.org; Thu, 09 May 2019 22:00:17 +0000
X-Inumbo-ID: d1978356-72a5-11e9-b432-4b2034f4ce9f
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (unknown
 [40.107.76.89]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1978356-72a5-11e9-b432-4b2034f4ce9f;
 Thu, 09 May 2019 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDPPXb+sSeskLyJvGRlOn5IR6TUttT7JYviI68kuVjw=;
 b=bJBzJwOvbr0QLE0whVWwwkkv+OHFQBknNv/As/X+rDJHgOE4lF1knwpBE2ZPXLjLlXvsuRMykY/g9/LNNPFNumhV19H/z+3FOf4c7tlvjJNLUUqP/PbngG/FYu1w1ZKf1CBwbcVkKIU9HYVWzpHNmF55HEZjMVzM1fPrrLuAxuM=
Received: from MWHPR12MB1597.namprd12.prod.outlook.com (10.172.56.10) by
 MWHPR12MB1823.namprd12.prod.outlook.com (10.175.55.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Thu, 9 May 2019 22:00:07 +0000
Received: from MWHPR12MB1597.namprd12.prod.outlook.com
 ([fe80::e17e:557b:cac8:755a]) by MWHPR12MB1597.namprd12.prod.outlook.com
 ([fe80::e17e:557b:cac8:755a%2]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 22:00:07 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Thread-Topic: [Xen-devel] [PATCH v2 0/3] mwait support for AMD processors
Thread-Index: AQHU5XeM504EUMjU30KXwgaAbNMDuaZjmi0A
Date: Thu, 9 May 2019 22:00:07 +0000
Message-ID: <20190509220003.GA17484@amd.com>
References: <20190328150426.7295-1-brian.woods@amd.com>
In-Reply-To: <20190328150426.7295-1-brian.woods@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN1PR12CA0073.namprd12.prod.outlook.com
 (2603:10b6:802:20::44) To MWHPR12MB1597.namprd12.prod.outlook.com
 (2603:10b6:301:10::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbcd3842-e824-4a2c-334e-08d6d4c9b28e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1823; 
x-ms-traffictypediagnostic: MWHPR12MB1823:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR12MB18237194F819EF0B488C78DDE5330@MWHPR12MB1823.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(366004)(396003)(376002)(346002)(199004)(189003)(33656002)(2351001)(66066001)(8676002)(7736002)(81156014)(81166006)(305945005)(6246003)(53936002)(6916009)(25786009)(4326008)(99286004)(66446008)(66476007)(66556008)(64756008)(66946007)(8936002)(73956011)(52116002)(102836004)(76176011)(6506007)(386003)(71200400001)(71190400001)(5660300002)(4744005)(186003)(26005)(316002)(2616005)(256004)(11346002)(476003)(486006)(446003)(6116002)(3846002)(478600001)(36756003)(6306002)(2501003)(5640700003)(6436002)(6512007)(229853002)(6486002)(54906003)(72206003)(966005)(86362001)(2906002)(14454004)(68736007)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1823;
 H:MWHPR12MB1597.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PLMB/Fa23CIB9pnnTVpnaDBkKkTdZZNVCtvKO/e/dfThINfI2+2iB+AGX+UJQQlWusbnL9eKdWjMllffgaakm/YSKOptJPuoIFvVdC7W2eazaLxPABXXtoG0eXjztGKXWnANkdUkuyLc9ISxEWF1Xho5N7kbqBGAdRa0SLTenad19QiaP82FlsqpmyJbTFnRkW1tBQ7nlptqv4ljZpJNo/FUSuPDp5DOuP0U4jg4h2ZQzChBawGQ3/mr/ZuQ+iF3r/qEv/QzswkVvpj1d/POwSfnO7+NQzfaBTVD294nLG3aa0X3HFW8IqUvagSiYdUQtxqKXf/3BQoxyXv/kpOMhS8HS8NgmYx6KAjArYM14+ZQXYi7KeetCHrz4TWpC5zS8Wf6KowErTU0uKzSo+zImOp7YVMN7jECH5g5ISlfkys=
Content-ID: <F761ADDDE7F1914699A7A8F7F0DB52A4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbcd3842-e824-4a2c-334e-08d6d4c9b28e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 22:00:07.3216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1823
Subject: Re: [Xen-devel] [PATCH v2 0/3] mwait support for AMD processors
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 "Woods, Brian" <Brian.Woods@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMjgsIDIwMTkgYXQgMDM6MDQ6MzJQTSArMDAwMCwgQnJpYW4gV29vZHMgd3Jv
dGU6Cj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkIHN1cHBvcnQgYW5kIGVuYWJsZW1lbnQgZm9yIG13
YWl0IG9uIEFNRCBOYXBsZXMKPiBhbmQgUm9tZSBwcm9jZXNzb3JzLiAgTmV3ZXIgQU1EIHByb2Nl
c3NvcnMgc3VwcG9ydCBtd2FpdCwgYnV0IG9ubHkgZm9yCj4gYzEsIGFuZCBmb3IgYzIgaGFsdCBp
cyB1c2VkLiAgVGhlIG13YWl0LWlkbGUgZHJpdmVyIGlzIG1vZGlmaWVkIHRvIGJlCj4gYWJsZSB0
byB1c2UgYm90aCBtd2FpdCBhbmQgaGFsdCBmb3IgaWRsaW5nLgo+IAo+IEJyaWFuIFdvb2RzICgz
KToKPiAgIG13YWl0LWlkbGU6IGFkZCBzdXBwb3J0IGZvciB1c2luZyBoYWx0Cj4gICBtd2FpdC1p
ZGxlOiBhZGQgc3VwcG9ydCBmb3IgQU1EIHByb2Nlc3NvcnMKPiAgIG13YWl0LWlkbGU6IGFkZCBl
bmFibGVtZW50IGZvciBBTUQgTmFwbGVzIGFuZCBSb21lCj4gCj4gIHhlbi9hcmNoL3g4Ni9hY3Bp
L2NwdV9pZGxlLmMgIHwgIDIgKy0KPiAgeGVuL2FyY2gveDg2L2NwdS9td2FpdC1pZGxlLmMgfCA2
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gIHhlbi9pbmNs
dWRlL2FzbS14ODYvY3B1aWRsZS5oIHwgIDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDU3IGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4xMS4wCj4gCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKUGluZyBmb3IgQW5k
eS4KCi0tIApCcmlhbiBXb29kcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
