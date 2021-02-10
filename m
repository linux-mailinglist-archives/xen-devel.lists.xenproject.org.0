Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680C6316493
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 12:05:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83527.155651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nIv-0006jy-SC; Wed, 10 Feb 2021 11:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83527.155651; Wed, 10 Feb 2021 11:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nIv-0006jZ-Og; Wed, 10 Feb 2021 11:05:05 +0000
Received: by outflank-mailman (input) for mailman id 83527;
 Wed, 10 Feb 2021 11:05:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zXqh=HM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1l9nIu-0006jU-2o
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 11:05:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0f74fb5-7d2f-40ca-9a5a-1644295a4e6f;
 Wed, 10 Feb 2021 11:05:02 +0000 (UTC)
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
X-Inumbo-ID: f0f74fb5-7d2f-40ca-9a5a-1644295a4e6f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612955102;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=S4VMAbTurNdKPv2oUY6KDHCWiyvUpxAAlhweQL8RLkI=;
  b=egv7geZG4cHwOJ9zUcakepSWDTpU+xnpuYKFOq0tvorDZjMs2TfY/nlZ
   1jG1lQT0FyFim/MG1nasaEE5HPpUnGbpC/R9Zhb8BIC2653UB8e3uEWuB
   5pKfgqqe4AfvMx5wCYFS+9brRLnSyxGqsO43gGFiQbBmcQyVmVY+JRHKI
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AMRtoFChYKtnOihXL2f67m3GKBjVdoebzNDwlXElaFp/sq1c+kKqV7wHUwgNG580B5H4GNHb6G
 clJ3GYSwx6mDyJEc0pebWZFU8eSDDSVYEDKJr4yqwXpkxzfFhfAIW8nAM4fHxK19keWb5oLYDm
 WaPgyPlyDSJJfPp+YO8oHr9WqRHjy8iR0bciMs59uEQXF7STisgiJkq04rRvujL/TuPCTED31m
 cAutjGgBq5+KYhWHjWUPFVrwyQ69DDQdqdKKA+trk6xDkbKUhrwe6L23l46GlyAjrrW7hLvzy1
 tkE=
X-SBRS: 5.2
X-MesageID: 38297382
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,168,1610427600"; 
   d="scan'208";a="38297382"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYVaTtKSBgfHIdmh1ZrIO4t6EQGfWOfVKdufECDCgMu6YBffrsIvvzFDJmmFUBmVxpFK6Q4MAPRdtufWkjm7I83s4lOET0LWxdcwu67fK2WTwwBLzCz8ClWrRJO1TWTS4QqjJ67DK/Z2ka4vDf/7ueeVleu0ITS8UF/jnHZsimx8slCVDOrHWFEPTOD7socWDDBQPREyZ8qSB91zeHjvxXc/VDA0YWhaznFMjLH4+0nmpawGSHl+dNe2Qww8R4QKY7EcWvEdGmv81usJKtsKDzftQ9sxbfHrBECVYTMmrz0TJDfraT8G2LnuYFqwQ42Aexjiw3AwBi7gR96DbcjUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4VMAbTurNdKPv2oUY6KDHCWiyvUpxAAlhweQL8RLkI=;
 b=Iko1sqIUDuokEXmEi56MFnSoOVtn0q0+ynY3WPccvqmA2EiUnAhhRBCbjos8IZfrgdvM3Iu6n65wS0p2WdzJcnL3Hp/2FVjvCs7Du3+DIxULo/Rw0jcJ8bsHvd+3lG9d16goZw3HQ0HTD4/7yfACbmsvXeXaRU8Vabd6lbsFFlYw2Tckhx0gvr/Gg+DhJGcEbFMqghiz2HVEU4LMl1Wx9o1yqypxZKnkqHw3r0QdzaET4ZhZ3L4GIfUVPwJE0uBY8pm07N6I5zyINkD6/PnD9GY7hh3M0R581OhNONb52WSkDMtUJUZxMvALd6V9T0xWbdbIs0i0likAp2UIDftV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4VMAbTurNdKPv2oUY6KDHCWiyvUpxAAlhweQL8RLkI=;
 b=I+wi8ikydXf5VAHP2XBLlA9x1GdQvgZpzjvUwsoLh/nXV+yVzeC4XfTIx01HZdEvzXkZbJ+STA+fXKxd5FPfBdCjsPNYf33TE3M3tNxroXdzhG4Y4KMduP4qJLKqoUXm6KYDrloTDnH0bVvGWWoSXtrOouLdaQB9eV7i95rZSuo=
From: George Dunlap <George.Dunlap@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, "lucmiccio@gmail.com" <lucmiccio@gmail.com>, "open
 list:X86" <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Topic: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Index: AQHW/wlm+vwmTie2HEebCGdpHuZ0HapROvYA
Date: Wed, 10 Feb 2021 11:04:37 +0000
Message-ID: <CA0BC7AD-056F-413D-A7C7-7C00A3FF7348@citrix.com>
References: <20210208184932.23468-1-sstabellini@kernel.org>
 <173ed75a-94cf-26a5-9271-a687bf201578@xen.org>
 <alpine.DEB.2.21.2102081214010.8948@sstabellini-ThinkPad-T480s>
 <4df687cb-d3bc-ccb8-4e7c-a6429c37574e@suse.com>
 <24610.38467.808678.941320@mariner.uk.xensource.com>
 <alpine.DEB.2.21.2102090914280.8948@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2102090914280.8948@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc98ee5d-a3f9-4131-783f-08d8cdb3a7e7
x-ms-traffictypediagnostic: BYAPR03MB4838:
x-microsoft-antispam-prvs: <BYAPR03MB4838F3477271C64817C92DF2998D9@BYAPR03MB4838.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /M44ZOHTJda8UxPOIrmoaXD9ymK0OIGADbDXzu0upe6eRyL06RVN+sqeOAcpha/jLbF5ZfVa763JLQECZoA3u3WgNp5g1QqClH4rDD7o4+Q2QVqG6OKdH4K/Jl83FupWOwXuHXDpCbVzx4D5OF97sLdnyYTfFNj7EerZ/pmzwRiIf+48vcuaoi3axKxGFkIbnAYiPWRxCyb4tY+VwG3kx++SI23Ms/3hd4T0qgvi3hpTdmGDijicuTEh/q4uDcdIO/BsHo9H4WDej7MB/UC7DWqDbBSQ85aOxL1sS+wEFgNOoa1JHbeTnVg39Rt10N1IaE6u4sEg/xf7ml86s80t8Yhe36icO6/PQckTJ2qROB6CI3GPo0stvWxtnbqZyynImRDS/eSC479y4X5SGbA3UIIXxe9ac1FFN7Jzx261URsyt91CFoHncClFZVPs9qlTMajEqdiAcjn6K402ciCkrJKkLiSy/xn1u81IkESYo/YGeRVExRH/kToayFMREH8i7KNdfRAVGh+7NEHcimKq3C1+fM5AflfNMcC5uyi/WsuLWURKq8SOFpXnh7G0tVduooF16ah+k7ZlOYUzy8rSfA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5680.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(76116006)(86362001)(8936002)(66556008)(71200400001)(66476007)(26005)(64756008)(2616005)(6512007)(36756003)(66446008)(91956017)(83380400001)(7416002)(66946007)(33656002)(6486002)(8676002)(2906002)(54906003)(478600001)(53546011)(4326008)(6506007)(316002)(6916009)(5660300002)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NzNEUkYwYjFCUzFlcXVhc1NJV2UzaGlEbXEzbEhWR2hTZ3p4UlRrdWxLVURv?=
 =?utf-8?B?YzFmV1BzTlFUMGJmVnF3bkZOYW1VeWRmU2ZHWFJjaERRVjczTGl4cEJOOHpF?=
 =?utf-8?B?ZFE5RHYvSEI0bGRzdWRZY3VybmV3WVZuVDMxdlJrb0c1clFSbFhxSVdVb2Zi?=
 =?utf-8?B?MTF3dVU5MnU5bXRXdllycUtqMGdFTW5oMHNYTXhEM2NUU29LZklwV0RMc3Rz?=
 =?utf-8?B?N1NuYW1VcU9TeTQ0MzY5c1EvMWlmSlUxa3VocGQxMVBSd3JWWHVTa0lUNnVm?=
 =?utf-8?B?M25sUmNRb2U5b0FsaXBnTFBaQWtOYkFSMVA2VzNpMWdReU9ONW9KN2dhVkZl?=
 =?utf-8?B?aDBGNlM4cjRvMzdtMGZmSzJTLzlWaXU1d1NOMDVuZC9EOWw3cFZVWWJ3VFVQ?=
 =?utf-8?B?eGw5OFgxVWZ3RHRsQjlCSlNCVzNZbDBtL0NvVmxHWFVBdzNjRS9sZDloZ21r?=
 =?utf-8?B?SDV4dTlhcGJtT0U4TWdtdjRkdXFMaDNPcDJXT1ArWmVYZUFjdzFWNnh1Y3Jp?=
 =?utf-8?B?bDVhU1RzdVpYbkt4SWNTQ25OY0xmNXo5R3puMmZIbkd2QlBRLzBPbnh6TmIy?=
 =?utf-8?B?cFhYbnJJVXNNZ2RoTmtGZmxSVEpPcUFwSTNwSy9kNXhZSUZFYWFMQWpQbXNu?=
 =?utf-8?B?UmFZdEh4cEJBNWtLSHRKaXdPZE5wWnZCQWpYbHhoYk1mS2lhTTBKWGhadjVp?=
 =?utf-8?B?c0lHc0Jzdkgwd2xUYmFLeEZhQk1kcVR0QnhQNE00TFUyeG1mbi9kUnZMcE9T?=
 =?utf-8?B?dXgrZXVwbzA1cG0vTlFjUDNJL0l3U3BlYzVTV21LdXZIRWg2c0lPYWVaSVoy?=
 =?utf-8?B?NUk5WnYrWG5hR2crdHhqZjF2WWdKRFljKzY1OWxCUi8xRnNmRk5ERE1MSFU2?=
 =?utf-8?B?aGFxSUtpRWo4Z01aME9wQjQ1aTVGTTU5aTQ1aVlzUDZaNk9qTG50SlBsZ3Zr?=
 =?utf-8?B?by9kTWVCMVJvRzhIa0l2bGxCYlBmRTF2TFgvamJXZXg0SEFtR3NpMVNROUlC?=
 =?utf-8?B?c1JXUFkrSGwyeU5FVXBGOXlrRDU0TmRxdnhxZVpuYUR1T1g5WkFUbFNmb3VV?=
 =?utf-8?B?Nnh2V0hKczFUNjNHeVdiZjVMTU05RVp4VWFZT1owNXR0bmpkTHdCK3dTUTVG?=
 =?utf-8?B?RGxOczR2S1V1bGszNGlSZWNQR2N0UXdFcDJpM0pkWW8xVlFNR0habEFNRE4r?=
 =?utf-8?B?TEw1aDREZ25VOS9DL1ZkcXFoRTZjTGo3ak5yWXFwRlZTaElRalB6empRbE1j?=
 =?utf-8?B?NzlzOERya3hja0h3NE9EVDMvZUVRa2FUSExDTWhnU1hOUGNFZzdibU9mSjZl?=
 =?utf-8?B?NHppUTkrTVptUTRaL3VFbHRsdGxHakptTGl5elhCd1RKOU9aeHpLTVBLSkda?=
 =?utf-8?B?UzNHdnlUTkRhUm5yRlN0QWJwSitSRk9SN3psOGNrc1JxQVNTaXkyRFpOcGE1?=
 =?utf-8?B?clRlUEptdFp3RzVhbHBqYlFqMDZwWVRxQ3lQYzVsVlVIbitwSG84ZDNCNjBW?=
 =?utf-8?B?OWtjR2llSlM4TnJFd0xIdkFkdHRMRUxtTTJDRHVKVzNQVzBsZVZhWXcvY3ZN?=
 =?utf-8?B?d1pzak81QXp0UEV3Q092OHlvcGhHdmFEREMveUovMEUzM2dhSGgzMjRvQ0J6?=
 =?utf-8?B?Vk1CWFJRNTZTYUI0SnZxd204YnV1enc2eERNMGFNT1FEQzltSGxhYUZMMXJT?=
 =?utf-8?B?ZHhtZlA4cWllNlRHTVY5b3ZUNFdITUtNdjlwZ3dXazE3Mlp2VjBBbGFaMGYz?=
 =?utf-8?B?cHdMUE9qTU5NbWpUTlRVZW1xMW5qQXBDa2ZPNG1hWVk2U0lENTJMM21GbTlF?=
 =?utf-8?B?VXBTc0dKYVZRL1E1ZS9JQT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <77D33764C521B744A21A25BFE0304DBB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc98ee5d-a3f9-4131-783f-08d8cdb3a7e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 11:04:37.1415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CL6xp/wzsKtB+oGmFJMFDrrBJbfqtIVTICMdQ/k0mI/P4qzcJW+BViSyHgnIeCCoyS+DLCKv6//X0dfMK5PrJN31IS/CckA64DbVFzqfxP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4838
X-OriginatorOrg: citrix.com

DQoNCj4gT24gRmViIDksIDIwMjEsIGF0IDU6MzEgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIDkgRmViIDIwMjEsIElh
biBKYWNrc29uIHdyb3RlOg0KPj4gSmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSCB2Ml0g
eGVuL2FybTogZml4IGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmciKToNCj4+PiBPbiAwOC4wMi4y
MDIxIDIxOjI0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiAuLi4NCj4+Pj4gRm9yIHRo
ZXNlIGNhc2VzLCBJIHdvdWxkIGp1c3QgZm9sbG93IGEgc2ltcGxlIHJ1bGUgb2YgdGh1bWI6DQo+
Pj4+IC0gaXMgdGhlIHN1Ym1pdHRlciB3aWxsaW5nIHRvIHByb3ZpZGUgdGhlIGJhY2twb3J0Pw0K
Pj4+PiAtIGlzIHRoZSBiYWNrcG9ydCBsb3ctcmlzaz8NCj4+Pj4gLSBpcyB0aGUgdW5kZXJseWlu
ZyBidWcgaW1wb3J0YW50Pw0KPj4+PiANCj4+Pj4gSWYgdGhlIGFuc3dlciB0byBhbGwgaXMgInll
cyIgdGhlbiBJJ2QgZ28gd2l0aCBpdC4NCj4+PiANCj4+PiBQZXJzb25hbGx5IEkgZGlzYWdyZWUs
IGZvciB0aGUgdmVyeSBzaW1wbGUgcmVhc29uIG9mIHRoZSBxdWVzdGlvbg0KPj4+IGdvaW5nIHRv
IGJlY29tZSAiV2hlcmUgZG8gd2UgZHJhdyB0aGUgbGluZT8iIFRoZSBvbmx5IG5vbi1zZWN1cml0
eQ0KPj4+IGJhY2twb3J0cyB0aGF0IEkgY29uc2lkZXIgYWNjZXB0YWJsZSBhcmUgbG93LXJpc2sg
Y2hhbmdlcyB0byBhbGxvdw0KPj4+IGJ1aWxkaW5nIHdpdGggbmV3ZXIgdG9vbCBjaGFpbnMuIEkg
a25vdyBvdGhlciBiYWNrcG9ydHMgaGF2ZQ0KPj4+IG9jY3VycmVkIGluIHRoZSBwYXN0LCBhbmQg
SSBkaWQgdm9pY2UgbXkgZGlzYWdyZWVtZW50IHdpdGggdGhpcw0KPj4+IGhhdmluZyBoYXBwZW5l
ZC4NCj4+IA0KPj4gSSB0aGluayBJIHRha2UgYSBtb3JlIHJlbGF4ZWQgdmlldyB0aGFuIEphbiwg
YnV0IHN0aWxsIGEgbXVjaCBtb3JlDQo+PiBmaXJtIGxpbmUgdGhhbiBTdGVmYW5vLiAgTXkgb3Bp
bmlvbiBpcyB0aGF0IHdlIHNob3VsZCBtYWtlIGV4Y2VwdGlvbnMNCj4+IGZvciBvbmx5IGJ1Z3Mg
b2YgZXhjZXB0aW9uYWwgc2V2ZXJpdHkuDQo+PiANCj4+IEkgZG9uJ3QgdGhpbmsgSSBoYXZlIHNl
ZW4gYW4gYXJndW1lbnQgdGhhdCB0aGlzIGJ1ZyBpcyBleGNlcHRpb25hbGx5DQo+PiBzZXZlcmUu
DQo+PiANCj4+IEZvciBtZSB0aGUgZmFjdCB0aGF0IHlvdSBjYW4gb25seSBleHBlcmllbmNlIHRo
aXMgYnVnIGlmIHlvdSB1cGdyYWRlDQo+PiB0aGUgaGFyZHdhcmUgb3Igc2lnbmlmaWNhbnRseSBj
aGFuZ2UgdGhlIGNvbmZpZ3VyYXRpb24sIG1lYW5zIHRoYXQNCj4+IHRoaXMgaXNuJ3Qgc28gc2Vy
aW91cyBhIGJ1Zy4NCj4gDQo+IFllYWgsIEkgdGhpbmsgdGhhdCdzIHJlYWxseSB0aGUgY29yZSBv
ZiB0aGlzIGlzc3VlLiBJZiBzb21lYm9keSBpcw0KPiBhbHJlYWR5IHVzaW5nIDQuMTIgaGFwcGls
eSwgdGhlcmUgaXMgcmVhbGx5IG5vIHJlYXNvbiBmb3IgdGhlbSB0byB0YWtlDQo+IHRoZSBmaXgu
IElmIHNvbWVib2R5IGlzIGFib3V0IHRvIHVzZSA0LjEyLCB0aGVuIGl0IGlzIGEgc2V2ZXJlIGlz
c3VlLg0KPiANCj4gVGhlIHZpZXcgb2YgdGhlIGdyb3VwIGlzIHRoYXQgbm9ib2R5IHNob3VsZCBi
ZSBzd2l0Y2hpbmcgdG8gNC4xMiBub3cNCj4gYmVjYXVzZSB0aGVyZSBhcmUgbmV3ZXIgcmVsZWFz
ZXMgb3V0IHRoZXJlLiBJIGRvbid0IGtub3cgaWYgdGhhdCBpcw0KPiB0cnVlLg0KDQpJIGRvbuKA
mXQgdGhpbmsgd2UgaGF2ZSB0byB0ZWxsIHBlb3BsZSB3aGF0IHRvIGRvOyByYXRoZXIsIHdlIG5l
ZWQgdG8gdGVsbCBwZW9wbGUgd2hhdCAqd2UqIGFyZSBnb2luZyB0byBkby4gIFdl4oCZdmUgdG9s
ZCBwZW9wbGUgdGhhdCB3ZeKAmWxsIHByb3ZpZGUgbm9ybWFsIGJ1Zy1maXhlcyB1bnRpbCAyMDIw
LTEwLTAyLCBhbmQgc2VjdXJpdHkgYnVnZml4ZXMgdW50aWwgMjAyMi0wNC0wMi4gQW55b25lIGlz
IHdlbGNvbWUgdG8gdXNlIDQuMTIgd2hlbmV2ZXIgdGhleSB3YW50IHRvOyBidXQgaWYgdGhleSBk
bywgdGhleSB0YWtlIHRoZSByaXNrIHRoYXQgdGhlcmUgd2lsbCBiZSBhIOKAnG5vcm1hbOKAnSBi
dWcgdGhhdCBkb2VzbuKAmXQgZ2V0IGZpeGVkIGJ5IHVwc3RyZWFtLiAgVGhlIHBhdGNoIGlzIGF2
YWlsYWJsZSwgYW55b25lIHdobyB3YW50cyB0byBjYW4gYXBwbHkgaXQgdGhlbXNlbHZlcyAoYXQg
dGhlaXIgb3duIHJpc2ssIG9mIGNvdXJzZSkuDQoNCldlIGRvbuKAmXQgc2VlbSB0byBoYXZlIGFu
eXRoaW5nIGV4cGxpY2l0bHkgd3JpdHRlbiBkb3duIGFueXdoZXJlLCBidXQgd2hlbmV2ZXIgc29t
ZW9uZSBoYXMgY29tZSB0byB1cyB1c2luZyBzb21lIG9ic29sZXRlIHZlcnNpb24gb2YgWGVuLCB3
ZeKAmXZlIHJlY29tbWVuZGVkIHRoZXkgdXNlIHRoZSBtb3N0IHJlY2VudCBzdGFibGUgcmVsZWFz
ZS4NCg0KVGhlIG9uZSByZWFzb24gc29tZW9uZSBtaWdodCB1c2UgNC4xMiBvdmVyIGEgbmV3ZXIg
dmVyc2lvbiBpcyBpZiB0aGF04oCZcyBzdGlsbCB0aGUgb25lIHBhY2thZ2VkIGJ5IHRoZWlyIGRp
c3Ryby4gIEluIHRoYXQgY2FzZSwgdGhlIGRpc3RybyBzaG91bGQgZWl0aGVyIHVwZGF0ZSB0byBh
IG5ld2VyIHZlcnNpb24sIG9yIHRha2Ugb24gdGhlIGVmZm9ydCBvZiBzdXBwb3J0aW5nIHRoZSBv
bGQgdmVyc2lvbiBieSBiYWNrcG9ydGluZyBidWdmaXhlcy4gIElmIHN1Y2ggYSBkaXN0cm8gY2hv
b3NlcyBub3QgdG8gZG8gc28sIHRoZW4gYSB1c2VyIHNob3VsZCBjb25zaWRlciBzd2l0Y2hpbmcg
dG8gYSBkaWZmZXJlbnQgZGlzdHJvLg0KDQpUaGUgcHVycG9zZSBvZiBoYXZpbmcgc3VjaCBhIHBv
bGljeSBpcyB0byBhdm9pZCBuZWVkaW5nIHRvIGhhdmUgdGhpcyBkaXNjdXNzaW9uIGFib3V0IGV2
ZXJ5IHNpbmdsZSBwYXRjaCB0aGF0IGNvbWVzIHVwOyBhbmQgdGhlIG51bWJlciB3YXMgY2hvc2Vu
IHRvIGJhbGFuY2UgZWZmb3J0IGZvciB0ZXN0aW5nIGFuZCBtYWludGFpbmVycyBhZ2FpbnN0IHZh
bHVlIHRvIGRvd25zdHJlYW1zLiAgQ2VydGFpbmx5IGJhY2twb3N0aW5nIEp1c3QgVGhpcyBPbmUg
cGF0Y2ggd29u4oCZdCBiZSBhIGh1Z2UgYW1vdW50IG9mIHdvcms7IGJ1dCBJIGNvbXBsZXRlbHkg
c3ltcGF0aGl6ZSB3aXRoIEphbuKAmXMgcG9pbnQgb2YgdmlldyB0aGF0IGlmIHdlIHN0YXJ0IHRv
IG1ha2UgZXhjZXB0aW9ucywgcGVvcGxlIHdpbGwgYmVnaW4gdG8gZXhwZWN0IHRoZW0uICBXZeKA
mXZlIHNhaWQgd2hhdCB3ZeKAmXJlIGdvaW5nIHRvIGRvLCB3ZSBzaG91bGQganVzdCBzdGljayB3
aXRoIGl0Lg0KDQpOb3cgbWF5YmUgdGhlIDE4LW1vbnRoIOKAnGZ1bGwtc3VwcG9ydCIgd2luZG93
IGlzIHRvbyBzbWFsbC4gIFdlIHNlZW0gdG8gaGF2ZSBsb3RzIG9mIGRvd25zdHJlYW1zIChhdCBs
ZWFzdCBTdVNFIGFuZCBYZW5TZXJ2ZXIpIHdobyBzdXBwb3J0IG11Y2ggb2xkZXIgdmVyc2lvbnM7
IGNvb3JkaW5hdGluZyBvbiB2ZXJzaW9ucyB0byBkZXNpZ25hdGUgTFRTIHJlbGVhc2VzIHRvIGF2
b2lkIGR1cGxpY2F0aW9uIG9mIGVmZm9ydCBhbmQgc2hhcmUgdGhlIGJlbmVmaXRzIG9mIHRoYXQg
ZWZmb3J0IHdpdGggdGhlIHdpZGVyIGNvbW11bml0eSBtaWdodCBiZSBzb21ldGhpbmcgd29ydGgg
Y29uc2lkZXJpbmcuICBCdXQgdGhhdOKAmXMgYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBkaXNjdXNz
aW9uLg0KDQogLUdlb3JnZQ0KDQo=

