Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B8D25771D
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 12:05:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCggQ-0001lV-BS; Mon, 31 Aug 2020 10:05:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EdQD=CJ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kCggO-0001lQ-RH
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 10:05:00 +0000
X-Inumbo-ID: 539f4bce-1c1e-45a2-93b1-357994ab2477
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 539f4bce-1c1e-45a2-93b1-357994ab2477;
 Mon, 31 Aug 2020 10:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598868300;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8olG1aSPXN0+YNhhTfxab/4DXpVWGcvJc3wl0CNDic4=;
 b=e4m1ZIqZ9oI45LhCAm2p8ihXMusuIWhskSWL+3HNMIMrWcjLlxduIjjv
 dneJ+0DENNM3afZSgq2vHGld+r0nQW3LWr+22pinE0uD2D3yEbUkwHGqM
 mBW8nLnpxPjPa9oJUaPzSd66/bJhTmLTXAKdYeIVxcXUsKAt/Sfnsd24D w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: AJYei6fIbs1EVnLOOAt149L3AviATro4gCRodt02jF53qalIHeH+IPePjiwI1c0UvtMntoB1H5
 upzCA5ajFlW70spUETCkgj2MlLmLGEqbk7/qTFrJ+3jV7KjpHBl7snVM6Ioash/eJbE3XYCXJf
 yXkRImOP4qqP/YGSPzoAtLMdUTfpFKiVeKAuNmSBbbb5n7L1XXypLTeUaVzgNMi6oLkswtWcHl
 acy/Z/48QIXrgwtp9rKWOysx/dmM0pDtbMzvcNq4jM6M4BKKkH9gG6QNXbxZIO9d43QavIT3L2
 9oU=
X-SBRS: 2.7
X-MesageID: 25964476
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,375,1592884800"; d="scan'208";a="25964476"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewW7YmHnnE1m4K4dP54x+JhUHfxjZ2OadL2spynPJ65gSeRbMVsCS0BpbvutxmHOfJM+ETmUI6L5+wqiKeb3AV0m9BhpFR/SjM51/+8CoGnpKY1HVBo90V3dJ1v1bujP2sDpvUy/psA4KZke4ablpCOQ46xHwADvy0iymlmcqBWxMe7mJeLtiJM4MZUH/njqdlZh6/on70e+1OO1iWnS9EoY2TpbIw2ITCBhUZxWSDjLhbLYDvWAEz8VVKH0j1nSW3U6VmncqXH3bO5c8K9DClOXfkqWMCVvKhcxVYnagEXq2/aTaz+ccKenmp4Rm05ahboxolfKGr27uwIalXN6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8olG1aSPXN0+YNhhTfxab/4DXpVWGcvJc3wl0CNDic4=;
 b=YNYcM8vpIVvsyDz3eQkv0fVb8PWk5U6IOz0FAwV0mrNZ8NvQms9iBvQOujw0KodWKmvREbiQt67zhmsd+SGfmjKOsyFk6sFp95BorEfRSC3j8UmnezQUazEVyKBJGC+gnF1G+98VgTcjZlOeNHGGy9yju+Ctv6IaLvUhOdyjFMqcypBRxWGKF127aGHJSX0eyjNmHa8sM3P5YMMSE5P2fxBgwUGdKdj59tlFf6Lxq3mGZwqOB8XCUcvNe2AMRsZWAxFMwUI2kBtARAXhUlswab7zfbiY72XkBrgJd8heyLcnuh6mq+J55WQ7T1UlRLzu+Co27zM48PwAs3k7CETitQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8olG1aSPXN0+YNhhTfxab/4DXpVWGcvJc3wl0CNDic4=;
 b=cZU/aWDpuYD4me9L4ErfRF0h+3bpsl79l7QHXLMyYnn9yf8KiiyK72UHL4DWprpUguIlv4pGfN+r8g2U61lLIdBc9zuhT5N7DNpd5paDDArREFvuoBOTy6x+LIT+aKv7a1fj4OUNa5Xq3KEF7Z+HiUEtRyrkIGdcdc43YjFLdDA=
From: George Dunlap <George.Dunlap@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: Jan Beulich <jbeulich@suse.com>, "open list:X86"
 <xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Ian Jackson
 <Ian.Jackson@citrix.com>, Julien Grall <julien@xen.org>, "Konrad Rzeszutek
 Wilk" <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH] gitignore: Move ignores from global to subdirectories
Thread-Topic: [PATCH] gitignore: Move ignores from global to subdirectories
Thread-Index: AQHWfOcPoB6C2A3RQk+KKhmh29t936lNHsiAgASp5QCAADnbAA==
Date: Mon, 31 Aug 2020 10:04:54 +0000
Message-ID: <CBAA2BDF-D5AC-4690-8996-1EBBE6DE19F6@citrix.com>
References: <20200828025747.GA25246@mattapan.m5p.com>
 <d284a27c-f347-f80f-f62f-78134749e20d@suse.com>
 <20200831063748.GB1522@mattapan.m5p.com>
In-Reply-To: <20200831063748.GB1522@mattapan.m5p.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a102b25-6a39-4a8b-be5d-08d84d954f52
x-ms-traffictypediagnostic: BY5PR03MB5364:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR03MB53642C15DC7F1F7B1D85AA0299510@BY5PR03MB5364.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O0t3e9MQkzkCwacv00MmUK5ExNODSpQAy9s4H6iwlLKPITP5fAfiKz8P4pi2f3gyKV1uxNT8dGU95R12YT18I70Gl6ZKDCc6tJT4lzikmQF9j1nPnKj50K/S15hVSnkFITuyWV/8MTheIMLipvp88EaXoBtYI1SkGfK4ttATzXUpNYZr/OdC3WG5dmcGasFa474R2ZkTISIK/vmIHBDCdgJBAwL8BNGMARnC22HTetAana48MZe5aRgISoNn45DxksZWeA5NYErbv6ddc7E2UczHmaOYZlxFI4KTsswz2WmKf8rD4RCfccG4z/CFwt4BS86xNzwKMY+X6r9IJdIohg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39850400004)(346002)(366004)(376002)(8936002)(6512007)(66556008)(316002)(186003)(8676002)(66476007)(71200400001)(2906002)(66446008)(5660300002)(64756008)(36756003)(4326008)(33656002)(26005)(2616005)(86362001)(83380400001)(53546011)(66946007)(54906003)(76116006)(91956017)(6506007)(478600001)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: coYgetpN/WzS9dmAOJpUcLG6p3KfG863xhtd2E6PPkm1lQW6NBSzpH5jCPYuWyKmtOj5VeYD7XTLQs3DdIM9qCdO4iAUgv+eyfLzcpvwtAy3B34729o8gOOszrpX/si41Sp019gfvk3BzDJ6GboyotLzhOq6dJKlP8joYWVtP7NixIccMQ4EIFy4YdrplTsSoYVv8BPETXWejAq1ChvecAyIiWUEXyM4DEPrMOP6wtTH28hKNxfQ8s+Q3EJwSMaC2XYVozogkhlOiD+uqtTN3M/gZbcqvdAP54a/gbfOKLl5jQeMiSUnT29RPFmDjPnjYpU0eQt3vVmzGNltoVC23feUhzj0E6+0u/cLoFUcqtfoGUw6b9HIh9jr1l49hqvGAM0ahOMZqEOnQW6NSrL9NFks9miFMzwmcNAX/iX1qQplcGJPK4bsOIiT8gMfV5eSN0YYx3GAnzKsxmfUtchRuf0GGjm72QtvZ4ihTzbVcnJmwNtx9PIO4YoUSkjAKUOQkMgtzK7eEr3bTSWRZCZLZwIKqfCX65jZ04sdg+8PRztHDl+NPP3hEvx+ynJ5mdQy1eRiVwxwaVcwU3Dte60q3ZdVK2RBAqoMk1UUp6GDclqaoTm91T0kSW0jg369OyoxfddMm26UoY7sWE9M443LnQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <CADDC450E2AED541B761A7EE6C9874A8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a102b25-6a39-4a8b-be5d-08d84d954f52
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 10:04:54.7314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7T3xIZILDClTiM8XYIhZdNKISisfAtG273K/VEgXIr3eon07G+dFZxP5+YnBnOjQx16o06mmdokgBqE6Emgh3ERqs6RGfZ6+FjMv8nTT/RQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5364
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

DQoNCj4gT24gQXVnIDMxLCAyMDIwLCBhdCA3OjM3IEFNLCBFbGxpb3R0IE1pdGNoZWxsIDxlaGVt
K3hlbkBtNXAuY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgQXVnIDI4LCAyMDIwIGF0IDA5OjI0
OjQxQU0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjguMDguMjAyMCAwNDo1Nywg
RWxsaW90dCBNaXRjaGVsbCB3cm90ZToNCj4+PiBTdWJkaXJlY3RvcmllcyB3aGljaCBoYXZlIC5n
aXRpZ25vcmUgZmlsZXMgc2hvdWxkIG5vdCBiZSByZWZlcmVuY2VkIGluDQo+Pj4gdGhlIGdsb2Jh
bCAuZ2l0aWdub3JlIGZpbGVzLiAgTW92ZSBzZXZlcmFsIGxpbmVzIHRvIGFwcHJvcHJpYXRlIHN1
YmRpcnMuDQo+Pj4gDQo+Pj4gU2lnbmVkLW9mZi1ieTogRWxsaW90dCBNaXRjaGVsbCA8ZWhlbSt4
ZW5AbTVwLmNvbT4NCj4+PiANCj4+PiAtLS0NCj4+PiBIb3BlZnVsbHkgdGhlIGNvbW1pdCBtZXNz
YWdlIGNvdmVycyBpdC4gIFdoZW4gbW92ZWQgdG8gdGhlIHN1YmRpcmVjdG9yaWVzDQo+Pj4gSSdt
IHVzaW5nICIuLzxmaWxlPiIgYXMgb3RoZXJ3aXNlIGFueSBmaWxlIHNoYXJpbmcgdGhlIG5hbWUg
aW4gYSBkZWVwZXINCj4+PiBzdWJkaXJlY3Rvcnkgd291bGQgYmUgc3ViamVjdCB0byB0aGUgbWF0
Y2guDQo+PiANCj4+IE1heSBJIGFzayB3aHkgdGhpcyBsYXN0IHNlbnRlbmNlIGlzbid0IHBhcnQg
b2YgdGhlIGNvbW1pdCBtZXNzYWdlPw0KPiANCj4gTXkgdGhpbmtpbmcgaXMgaXQgd2FzIHByZXR0
eSBzdHJhaWdodGZvcndhcmQgdG8gZmlndXJlIG91dCB3aGVuIGxvb2tpbmcuDQo+IE5vdCAvcXVp
dGUvIG9idmlvdXMgZW5vdWdoIHRvIGF2b2lkIGNvbW1lbnRpbmcgaW4gZS1tYWlsLCBidXQgbm90
IHF1aXRlDQo+IG9ic2N1cmUgZW5vdWdoIHRvIGhhdmUgaW4gY29tbWl0IG1lc3NhZ2UuICBUaGlz
IGNhbiBnbyBlaXRoZXIgd2F5IHJlYWxseS4NCg0KU3RvcmluZyB0aGUgZXh0cmEgcGFyYWdyYXBo
IGluIGdpdCBpcyBjaGVhcDsgdHJ5aW5nIHRvIHJlY29uc3RydWN0IHdoeSBzb21lb25lIG1hZGUg
YSBjaGFuZ2UgMTAgeWVhcnMgYWZ0ZXIgdGhlIGZhY3QgaXMgb2Z0ZW4gZGlmZmljdWx0LiAgUHJv
YmFibHkgbm90IHdvcnRoIGEgcmUtc2VuZCDigJQgaXQgY2FuIGJlIG1vdmVkIGludG8gdGhlIGNv
bW1pdCBtZXNzYWdlIGJ5IHRoZSBjb21taXR0ZXI7IGJ1dCBpZiB5b3XigJlyZSBnb2luZyB0byBz
ZW5kIHYyIGFueXdheSwgbWlnaHQgYXMgd2VsbCBtb3ZlIGl0IGluLg0KDQogLUdlb3JnZQ0KDQo=

