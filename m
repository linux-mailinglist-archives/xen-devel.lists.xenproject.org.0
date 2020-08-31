Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3F5257FDA
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 19:42:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCnpG-0001dW-6z; Mon, 31 Aug 2020 17:42:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EdQD=CJ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kCnpE-0001dQ-Ca
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 17:42:36 +0000
X-Inumbo-ID: 80eecafa-0ba9-40fd-9853-c6f7b75a55f6
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80eecafa-0ba9-40fd-9853-c6f7b75a55f6;
 Mon, 31 Aug 2020 17:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598895754;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=OFnWxph2L6rY1YCcCAXZtyUkT+Mh1SS+AEpld45ieXs=;
 b=Xq8xvEg3xZ8dtp7tMe9DB2bzDbM1NSaDUIrPRn8EKF1cg+0Qd13NBQzF
 zQGmwzH++ThLMm+XO3cKiC/K2TSygJ/2A43r6TqXG+ILeLwbXtjBLNa4l
 i0izrLzVnqCMC7rldLNUFv1+LL8KrChgodz90pZd+bxL74x/VNttBcCUw E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: sogHLHYVzdAoEwEizu3FLqF00aST6S7iQSG6ejZF+4QA/wPK0r8Z9CYsH7pyY8b1TXUJ5IIjk9
 ugx2ti1cnUA6i4SV+rMb7QHgXKhQt544xmIrJPL7h2nuHvydCdD3KIzRUFFTGzbLsDkD1LbYd2
 0kvH1172EH3tYt0vAdVOBakQiicY4usL+7HdVlwNwcW1PnWFfs5HRntzDrBgK77mIC5X4iP95i
 lo1VQGeAzvBkjYX/Sxhlzro3VIiN0FfmqFvy/9oYjNN2+M9xCJiAqNIUPmwOJctXpXAlS3cdyp
 1co=
X-SBRS: 2.7
X-MesageID: 25805451
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,376,1592884800"; d="scan'208";a="25805451"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WR3mha8YKEbdPTrVqxzIOvN8xip1ubwyMbsLCNZqaFuzQrsIbOsCjuZNDPyDkf455sbOe/tcXqTNBj/cdhD+4yImRS2LO+EurfihXLqeUfeukIuO3c1r7q2H87e1RNCANGokXqSemFSt1CcwR4/zvVR4eEkOeLUQCCLyO3ktflzv08W9E7d/UP9DXZt7lkpuHvzHfi1RXrS7gJBQ/w91c9LwzxpBBPbcgjB832I1dfpgdnbgTjuXnVKAE+TsEQEjROB8Bx1PgbUCYY9tBaAqMhEfEDupz7YVBzcFqxiRHYPnk2EtGyBrhl3AlsCNGL9AtmgIVutmUIIYPnULT6BX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFnWxph2L6rY1YCcCAXZtyUkT+Mh1SS+AEpld45ieXs=;
 b=Fg3KGgbl53SVHmf1Udgx8whZ/xdYBLZBGlFLdKT+lfTez3sLjCq+1hkbcqOmmAfkSTBymk/zW9Fu98fWLWcUYy1wjko8EjQGu325s0Byhn44wMm/JuV/nkZ4pjg+LmwfjqXYF68XN0PaScR1HAQpjCgJ7z5iUGP9G67ucNWG4+OM+Nkgth5A70e7wa4qYrrcEM1R0WhjVesOgePnddsDMHRNX2Dl22sO1O+XsbQwfVk4LHWAtU/qlV5/ukxWNWpai0HtzR7ao3nGciEa1v9xecZiDVfN0e9jHAOZIMap9ZcO1H4RFrIGvIJ3jdd/osTcRz/KZAqd1lQ4Ph0QZSeZ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFnWxph2L6rY1YCcCAXZtyUkT+Mh1SS+AEpld45ieXs=;
 b=LZMwpKIHILqNy2jHCybHpLTpP41oyCE0UYSpsLm+81K1SgVhdLZgvwtxY1X6KbMzJywHD3FjBaDh7GErJh8yPU9IE5kA0sYEUxM92bLDhhlMtA0yWCE2IaQ26QpibSkCbMMSQo0YrUBY92YlXFBv6jB2MCd7hcG+e+IdL6yYA6Y=
From: George Dunlap <George.Dunlap@citrix.com>
To: "open list:X86" <xen-devel@lists.xenproject.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Subject: Code of Conduct vote outcome
Thread-Topic: Code of Conduct vote outcome
Thread-Index: AQHWf74ZkwVEKjqX7EGicGsyInzOSQ==
Date: Mon, 31 Aug 2020 17:42:29 +0000
Message-ID: <CB503BA1-979C-42E5-86C6-AFAB10C738DF@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b53f5eb0-3c47-49cc-60f9-08d84dd53bbe
x-ms-traffictypediagnostic: BYAPR03MB3461:
x-microsoft-antispam-prvs: <BYAPR03MB34618CB25E11E0276582216099510@BYAPR03MB3461.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OhydRt+Ssdg/T1ZjA3U8uAgjCMRKEdjev+axVQTktyktGVUEJlQgo81Fz4uBCK55alNnjI3ThjCyQ3b7yTC57rKC2mQJ54Oc8KVXXMJq1v1CgxLmrZnsgj6obZL2J4CFymMLBeD9JKpQHlcltqH8toPewbN7ANifghSeian6SChYzh1YtPB9DuP0hTkK8HIvmZlxJZPuaoopLmWUcL0U4UJXg09uuabuYg9PrwndcLlowhb62f0LMsOtzsPMLHq+mpQaWmMumVw+9E1kPlEk6hA5t+U8dVLXVJznIbkwwmbz4CcmHgkYosUXdhlnc46OXo34yF/NJ8ydlsi2DM9T61L/jqUsObtB4pV3k3y3bXTifU9VllXQK+kq1a1k3IlyCCosbnnkVp1qIjwP3LcowdxE6GwS2LYzvdTHJb3+gthfFKwFRQqfd94YsZ+GP5trS2lP06vKXDnZXKD/S2uFxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(450100002)(966005)(86362001)(64756008)(66946007)(478600001)(8676002)(76116006)(91956017)(66446008)(110136005)(316002)(5660300002)(36756003)(66556008)(66476007)(6506007)(6486002)(26005)(186003)(8936002)(2906002)(6512007)(2616005)(71200400001)(33656002)(6606295002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: eenrJoFVo4xt0IKaB1KDv3ODdyPKWCtM/4SMKYniCSGkzDK0ATS54QeMNeyWHa4GD21/82vtCJYvvIepCfS8XVGeTAN2hlivodr+6oBGRPy3mcC5JC56M1b2yVppTUHYr3DtQ5yCPS5B3ZifftMQWNWiegF+OsF41YmQbV23+JBM23Y5OCx4aJtCTvPwe1yRPm7ndn7C2hnMQ8d8HInUOStnbWU+ynjXUGpDX4aPb7lZJmmwnbxfG748VBb1wwD/AU77SHR904o6JRdiudm2O/BqQNAXzlgI4faPMw63XqdlOX7r5kPbm+e8MwFoDZAZfR5tuJyXg5xS97e+5m6jKCIYo3wApLE1UBruExe9GXvYLF+dkCKFMJ4hgQWG6zbj8ZzBRerVobR3SqyaghwL4zSyCYdnGY2CsrGZkiESYLI4EgUVgzRYBN4o9BHit1JVilS/i1sIJVGQt1vuv2dDxZH+O9zUtIR9r0RiTh2SEZQUm3C6hBeeb76Ho7oPH9J+GaryMUUMcMNErldz8HQpWVcqRSeSK8Qo9c/oBS0ocm+6Zi9FjdkulZoB09+wbrKNq+QSAUqt7FZ39FpzUFbqnIAqotG/OwEwSE5U9R9ev2sapIOV2WpMX427qv5BaX7kISH9zPV5ZRzTaP63mgLG4Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3438B94C9CC7E046B695D9B154AC835C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53f5eb0-3c47-49cc-60f9-08d84dd53bbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 17:42:29.7261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FvRlmlIkSBHUjcXA/1j+cQZs7XPV7B3Se7hE6EwpQamLSNlLJhiUCU1+tq00p/YdGC0YzQHq8M4Z/GIyjgc31Wr1DIQijrl0WjaWSRb2Ss8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3461
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

SGV5IGFsbCwNCg0KVGhpcyBpcyBhIHJlc29sdXRpb24gdG8gdGhlIENvZGUgb2YgQ29uZHVjdCB2
b3RlIExhcnMgY2FsbGVkIGZvciBiYWNrIGluIEphbnVhcnkgWzFdLCB3aGljaCBlbmRlZCAzMSBN
YXJjaC4NCg0KVGhlIHJlc3VsdHMgd2VyZToNCg0KSHlwZXJ2aXNpb3IgcHJvamVjdCAoNyArIDEg
TFQgbWVtYmVycyk6IFNpeCArMSB2b3Rlcywgbm8gLTEgdm90ZXMNClhBUEkgcHJvamVjdCAoNSBM
VCBtZW1iZXJzKTogTm8gdm90ZXMNCldpbmRvd3MgUFYgRHJpdmVycyBQcm9qZWN0ICgzIExUIG1l
bWJlcnMpOiBPbmUgKzEgdm90ZSwgbm8gLTEgdm90ZXMNCg0KTm93IHRvIGludGVycHJldCB0aGUg
Z292ZXJuYW5jZSBydWxlcyBvbiBwcm9qZWN0LXdpZGUgZGVjaXNpb25zIFsyXS4NCg0KSXQgc3Rh
dGVzIHRoYXQ6ICJBIHF1b3J1bSBvZiBhdCBsZWFzdCBsZWFzdCAxLzMgb2YgcG9zaXRpdmUgdm90
ZXMgb2YgZWFjaCBwcm9qZWN04oCZcyBsZWFkZXJzaGlwIHRlYW0gbWVtYmVycyBpcyByZXF1aXJl
ZC4gSW4gb3RoZXIgd29yZHM6IGlmIGEgcHJvamVjdOKAmXMgbGVhZGVyc2hpcCB0ZWFtIGRvZXMg
bm90IGFjaGlldmUgdGhlIHF1b3J1bSwgdGhlIGVudGlyZSBzdWItcHJvamVjdOKAmXMgdm90ZSBp
cyBub3QgY291bnRlZC7igJ0NCg0KVGhhdCB3b3VsZCBtZWFuIHRoYXQgdGhlIEhWIHByb2plY3Qg
YW5kIHRoZSBQViBEcml2ZXJzIFByb2plY3QgYm90aCBoYXZlIHF1b3J1bSwgYnV0IFhBUEkgZG9l
cyBub3QuDQoNCkl0IGFsc28gc2F5czogIklmIG5vbmUgb2YgdGhlIHF1YWxpZnlpbmcgcHJvamVj
dHMgYWNoaWV2ZSBhIHF1b3J1bSwgdGhlIGNoYW5nZSBjYW5ub3QgaG9sZC4gSW4gdGhhdCBjYXNl
LCB3ZSBjb25zaWRlciB0aGF0IHRoZXJlIGlzIG5vdCBlbm91Z2ggbW9tZW50dW0gYmVoaW5kIGEg
Y2hhbmdlLiINCg0KVGhhdCBydWxlIGRvZXNu4oCZdCBhcHBseSB0byB0aGlzIHNpdHVhdGlvbiwg
YmVjYXVzZSB3ZSBkbyBoYXZlIHF1YWxpZnlpbmcgcHJvamVjdHMgdGhhdCBoYXZlIGFjaGlldmVk
IGEgcXVvcnVtLiAgVGhlIHBocmFzaW5nIHNlZW1zIHRvIGluZGljYXRlIHRoYXQgYXMgbG9uZyBh
cyAqYXQgbGVhc3Qgb25lKiBwcm9qZWN0IHF1YWxpZnlpbmcgcHJvamVjdCAgaGFzIGEgcXVvcnVt
LCB0aGVuIHRoZSB2b3RlIGlzIHZhbGlkLg0KDQpJdCB0aGVuIHNheXM6DQoNCuKAnEZvciBlYWNo
IHF1YWxpZnlpbmcgcHJvamVjdCB3aXRoIGEgcXVvcnVtLCB0aGUgcGVyY2VudGFnZSBvZiB2b3Rl
cyBpbiBmYXZvdXIgYW5kIGFnYWluc3QgaXMgY2FsY3VsYXRlZCAoZS5nLiBpZiA1IHBlb3BsZSB2
b3RlZCBpbiBmYXZvdXIsIDIgYWdhaW5zdCBhbmQgMSBhYnN0YWlucywgdGhlIHNoYXJlIGlzIDUv
N3RoIGFuZCAyLzd0aCByZXNwZWN0aXZlbHkpLuKAnQ0KDQpUaGF0IGdpdmVzIHVzOiBIViBQcm9q
ZWN0IDEwMCUgKDYvNiksIFBWIGRyaXZlciBwcm9qZWN0IDEwMCUgKDEvMSkuDQoNClRoZW4gaXQg
c2F5czoNCg0KVm90ZXMgaW4gZmF2b3VyIGFyZSBhdmVyYWdlZCBhcyBwZXJjZW50YWdlcyBhY3Jv
c3MgYWxsIHByb2plY3RzIChzYXkgd2UgaGF2ZSBwZXIgcHJvamVjdCBmaWd1cmVzIG9mIDUwJSwg
ODAlLCA3MCUgaW4gZmF2b3VyLCB0aGVuIHRoZSB0b3RhbCB2b3RlIGluIGZhdm91ciBpcyA2Ni42
NyUpLg0KDQpUaGF0IGdpdmVzIHVzOiAoMTAwICsgMTAwKSAvIDIgPT0gMTAwJSBBdmVyYWdlDQoN
CkFuZCBmaW5hbGx5Og0KDQoiSWYgdGhlIHRvdGFsIHZvdGUgYWNoaWV2ZXMgYSAyLzNyZCBtYWpv
cml0eSBpbiBmYXZvdXIsIHRoZSBwcm9wb3NhbCBwYXNzZXMuIE90aGVyd2lzZSBpdCBmYWlscy7i
gJ0NCg0KMTAwJSA+IDIvMywgc28gKmFjY29yZGluZyB0byBteSByZWFkaW5nKiwgdGhpcyBwYXNz
ZXMuDQoNCknigJltIGdvaW5nIHRvIHdhaXQgYSB3ZWVrIGJlZm9yZSBvZmZpY2lhbGx5IGRlY2xh
cmluZyBpdCBhcyBoYXZpbmcgcGFzc2VkLCBob3dldmVyLCB0byBhbGxvdyBwZW9wbGUgdG8gZG91
YmxlLWNoZWNrIG15IHJlYWRpbmcgb2YgdGhlIHJ1bGVzIGFuZCBwcm9wb3NlIGFsdGVybmF0ZSBp
bnRlcnByZXRhdGlvbnMuDQoNCiAtR2VvcmdlDQoNClsxXSBodHRwczovL21hcmMuaW5mby8/bD14
ZW4tZGV2ZWwmbT0xNTc5Mjg4NDMwMTU5MDkmdz0yDQpbMl0gaHR0cHM6Ly94ZW5wcm9qZWN0Lm9y
Zy9kZXZlbG9wZXJzL2dvdmVybmFuY2UvI3Byb2plY3QtZGVjaXNpb25z

