Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3312B262150
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 22:47:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFkWH-0007wf-7z; Tue, 08 Sep 2020 20:47:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvjL=CR=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kFkWF-0007wa-Hu
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 20:47:11 +0000
X-Inumbo-ID: c596f62d-643f-4411-b331-7db8fb91ab70
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c596f62d-643f-4411-b331-7db8fb91ab70;
 Tue, 08 Sep 2020 20:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599598029;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Auu/tj7CsUU94olk9Ewu30UJQrawWKWUDzjo6uXjnyw=;
 b=HPC5xLN1PcQMr6ZRzYHFIi4FVzdkhFZMDSwiX6ql2zewShMDFQkSBS/5
 vAWCSoBQI6W/YPdowD98sBI7S2JlANaretekjhUSJxEuwX4FXFoyclnAR
 5Y6GmA5TRgsBXpVD1/r0BW+0KoLHkpk9nFLCOnZB+E8lodbIpcqb1Oz5l g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: KvXY4rfFEZj14yMRGqvvR8xz//enspZVODhz9E4eof1K/Pez/PR0+ImbEFED+CgolGZTwRjp+b
 hgtJsIxWyGfHX/SffnP2xvZitdAORn/VONuslFmS9AF8mz+ZJp6a/5zE0TVgy1ay5ZtIb+wsM/
 aJJ6WB5NZClO8XLOTOeC4v/NrlCQtdA9T5aBc3YyyYJBNfuRGLrEMmPRx464c3HhSdL6QImzXW
 4mKLW8NiniL3ZBQRcMmxnWesL2ip6dB/R2w6g2Hc1E0x+wabjONxWlQZf8DQGhG5yaHvaGTrLr
 YL8=
X-SBRS: 2.7
X-MesageID: 26364470
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,407,1592884800"; d="scan'208";a="26364470"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsUfY7V28FsBnoO3KocdKpGfMCCrdUdMOQZUcFoWGRwzPAeopwhvvKAD0w6Sm8IGv8EVdoiOr98APKU643BpN1z1Iv2/KdusH7t4Kmqp237CNJfV3OUG/vQnZb70h1PtzxFprceMHOTy1Xx4NeoDz8aiyYWzUMgfOlT0L8S+b6DKlv6wzVCV4PCTHIoBNCXbCOHjGoQ6r0v8r/TFrLc52AAp0eMmXMbiplPkPlLp+RjAU7J/WIXOPQ6mY4EdBETwptpTbnMEYtP4+zWxF9Xfd2+jWp/Rv7EEndKBvrv2CApWJWyxN5DhfRa4w+GjP/W3mhQM/MJDQYD2I0bn0BRr0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Auu/tj7CsUU94olk9Ewu30UJQrawWKWUDzjo6uXjnyw=;
 b=nanbzze3Ipstwes+oNEiGdFwFG8NET5VDcz8PDDiNfywdEp0eyIPgazcwDDi2TPdH+7M4R9yXoZfVNZjAmazCo8h7NnbZJ7b8xcTuMeEwRfTV/6EV1ycXw7Mrzhdx36EegyD2/SeyqzsWzpaKXFH2dtKwyC8vixyPHFnFULenQ7tFCl61unKoLsL11k+kqYCXdMb8ElDP5xajFHAKFtqFeCY92CnxsSW/1rH/ycjrI0YzUdjf9/k/4Hcpleu2Sc5sResWmDT/03kgjL39PCHHg6eeOomnXbi27StjSTHgbEdKt3AX6ITEo0OHZQbky0aJbH1pnLZd2G2/cJfL30kzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Auu/tj7CsUU94olk9Ewu30UJQrawWKWUDzjo6uXjnyw=;
 b=TAzkeikf9fCO8HXyP48DNq0DHXYtaW0nZ9JrNNw264Na8pCI7gH+w/bvL+rRBBA/o7XlBA1GjSqQ9J+9HLFLeTyJI6ujgD36qApNNIrZA+IbOllcbL+2Df6xcGVv7LIaXNCJxDdW2DlJIEaNf7dt8yKcC/CQ2lB2ZAxza7Dw6Ag=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Nick Rosbrook
 <rosbrookn@ainfosec.com>, Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH] golang/xenlight: Move to an entirely external repo
Thread-Topic: [PATCH] golang/xenlight: Move to an entirely external repo
Thread-Index: AQHWgtoY+gmcVIyUZUS8XTTIIdRNDKle/kIAgAADLoA=
Date: Tue, 8 Sep 2020 20:46:58 +0000
Message-ID: <612A1B4D-41E5-42F4-882E-D4750D53B24D@citrix.com>
References: <20200904164000.602618-1-george.dunlap@citrix.com>
 <20200908170332.GA12322@FED-nrosbr-BE.crux.rad.ainfosec.com>
In-Reply-To: <20200908170332.GA12322@FED-nrosbr-BE.crux.rad.ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c1d30f9-2331-450c-a2b3-08d854385463
x-ms-traffictypediagnostic: BYAPR03MB3896:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB38966C3DA02B0EAD4D20B93D99290@BYAPR03MB3896.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ty5m5yWwXBy4z4j03G2HgjzgrkU2oUrWhpyDTs5rCHIeLQIscnI5sVgplMJjBhskJ+/3QVJ0rTGmOJL6ku5Oy/FOUewfY1KngxWWViUbXYQpr4di4nDadJkDgRD5GGiUCLVnQV5mcVP60J3zZPc+wicqairKVRyDWT1hbErS+Yt3XPC33OxvzA5HOI0vgKCWKroTooGyeoxA7pYhMmv6EuEOl/OL7r7RnZrjwn+APRov1D8CTd7c98CW6xuTeNQuakawvBBevgVdmdYBqjvX0mHyFglhcVisW6nGu4sJAaTY5nuLxflwoV8DUeSmhH6P4Rl5Mc5wxTx/TFDnE+Lvpg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(26005)(6486002)(8936002)(4326008)(36756003)(5660300002)(66476007)(64756008)(86362001)(66446008)(2616005)(66946007)(53546011)(71200400001)(6506007)(55236004)(6512007)(91956017)(76116006)(66556008)(186003)(54906003)(83380400001)(8676002)(33656002)(478600001)(316002)(6916009)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: BBfaiadFO35ARP3Q4slfn8Tz4fOapb7lPcswpWL/n1PYndIbEIkoLVO0oENYvPZvmD4BNkPMrbxfQVDE5MUe9uyA4+1mVwVATKC/E7JdFtdOD99ZSfiMxUV3FUc2qE66cgx5MF3uE9ADd3rt30M8evxfdHdZT12pN0kPuE23OsrJRLihnh+2O/LrxNXqEY14rc6F2BJaho/iDiFqAcXqVWRt10ejW1z7sftqofKAa3XaAMQyfrVu/GcWtQS+njazfqYuVlnGeewfiRWpe2fI7B+AvXsb7d6jBIFidTna8yMyeW1bOhl5Q7+vdCqT8FjKb+VYwnlIDpoHZZ0mQcmmYfgScmzZN5pwyK7pXJ1okBtJOGkGCHC12kSoIEZ0dmYBcK7hgUD8tdDxtqB/5nRc2gUDmle71tC0f04XmdJ136goW6QcRsLH0+DRqgMvPkOJCNun07wgPMWzS9xLmMUbacblk/tFkOkRqR5nn4UbVUFcxujUd1XUDYILMJC/BwKWYuUYeOqVY+WSlPaD3LOvB6lWEso3cjRN/aXRiGOkmujLsOTH7FeST7znfEidGCQ+hZvqyNPENjFLJuGzAKZ7rsdIApnlxXZzJJNot+zZSOo6DhU9neL2WoKNl9D9ethpnCrYI+6jFVzuL3/l23Z18g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F93A516E3255864391FC682425A06D79@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1d30f9-2331-450c-a2b3-08d854385463
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 20:46:58.2713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GOUwdZPDJMjent7HvmcoEw/5UVJrTO3ymYaoisHUnEx3FnjLiRXoCKhbiXHHqlsH15lgVp5EK5EG+QB6V38+G9Uz8lMfI/nt/PMfCClhb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3896
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

DQoNCj4gT24gU2VwIDgsIDIwMjAsIGF0IDY6MDMgUE0sIE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29r
bkBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gRnJpLCBTZXAgMDQsIDIwMjAgYXQgMDU6NDA6
MDBQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4+IFJlbW92ZSBhbGwgZ28gZmlsZXMg
YW5kIGdlbmVyYXRpb24gdGFyZ2V0cy4NCj4+IA0KPj4gQWRkIGEgY29udmVuaWVuY2UgbWFjcm8g
dG8gYnVpbGQgdGhlIHBhY2thZ2UgZnJvbSBzdGFnaW5nLiAgVGhpcyBpc24ndA0KPj4gcmVhbGx5
IG1lYW50IHRvIGJlIGNhbGxlZCBkaXJlY3RseTsgcmF0aGVyLCBpdCdzIG1lYW50IHRvIGJlIGNh
bGxlZA0KPj4gZnJvbSBhIGNvcnJlc3BvbmRpbmcgYnVpbGQgdGFyZ2V0IGluc2lkZSB0aGUgZXh0
ZXJuYWwgeGVubGlnaHQgcGFja2FnZQ0KPj4gcmVwby4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTog
R2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KPiANCj4gRG9lcyB0aGlz
IG1ha2Ugb3VyIG1vdmUgdG8gZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9nby14ZW4gb2ZmaWNpYWw/
IEkNCj4gd2Fzbid0IGV4cGVjdGluZyB0aGlzIHRvIGJlIHNvIHNvb24uIEJ1dCwgaWYgeW91J3Jl
IHNhdGlzaWZlZCB3aXRoIHdoYXQNCj4geW91J3ZlIGxlYXJuZWQgZnJvbSB3b3JraW5nIG9uIHRo
ZSBleHBlcmltZW50YWwgcmVwby9tb2R1bGUsIEkgZ3Vlc3MgSSdtDQo+IG5vdCBvcHBvc2VkLiBJ
IHdvdWxkIGxpa2UgdG8ga25vdyB0aGUgcmVzdCBvZiB0aGUgZGV0YWlscyB0aG91Z2guDQoNCkFs
bCBwYXRjaGVzIHRvIHRoZSBsaXN0IGFyZSBwcm9wb3NhbHMg4oCUIG5vdGhpbmcgaXMgb2ZmaWNp
YWwgdW50aWwgaXTigJlzIGJlZW4gY2hlY2tlZCBpbjsgYW5kIEkgaGF2ZW7igJl0IGNoZWNrZWQs
IGJ1dCBzaW5jZSBub2JvZHkgaGFzIEFja2VkIGl0LCBpdCBjZXJ0YWlubHkgKnNob3VsZG7igJl0
KiBoYXZlIGJlZW4gY2hlY2tlZCBpbiB5ZXQuIDotKQ0KDQpTbywgZmVlbCBmcmVlIHRvIGdpdmUg
ZmVlZGJhY2sgb3IgYXNrIHdoYXRldmVyIGRldGFpbHMgeW91IHRoaW5rIG5lZWQgdG8gYmUgaXJv
bmVkIG91dC4gIFRoYXTigJlzIHdoYXQgdGhpcyB0aHJlYWQgaXMgZm9yLg0KDQpUaGVyZeKAmXMg
Y2VydGFpbmx5IG5vIGlzc3VlIHdpdGggd2FpdGluZyB0byBkZWxldGUgdGhlIGNvZGUgaW4tdHJl
ZTsgYnV0IEkgd291bGRu4oCZdCBiZSBhIGZhbiBvZiBkZXZlbG9waW5nIGluIGJvdGggcGxhY2Vz
IGF0IG9uY2UgYW5kIGtlZXBpbmcgdGhpbmdzIGluIHN5bmMuICAoSSBjb3VsZCBiZSBjb252aW5j
ZWQgaWYgeW91IHRob3VnaHQgdGhhdCB3YXMgaW1wb3J0YW50LikgIEnigJlkIHByZWZlciBqdXN0
IHRvIGRldmVsb3AgaW4gdGhlIGV4dGVybmFsIHRyZWUsIGFuZCBpZiBmb3Igc29tZSByZWFzb24g
d2UgZGVjaWRlIHRoYXQgZG9lc27igJl0IHdvcmssIGltcG9ydGluZyB0aGUgY2hhbmdlcyBiYWNr
IGludG8geGVuLmdpdC4NCg0KIC1HZW9yZ2U=

