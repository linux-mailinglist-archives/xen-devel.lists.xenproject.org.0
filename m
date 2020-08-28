Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE492558DC
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 12:49:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBbvy-0005cf-Vi; Fri, 28 Aug 2020 10:48:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNC1=CG=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kBbvx-0005ca-8n
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 10:48:37 +0000
X-Inumbo-ID: 67181589-84c8-490f-b293-de956a62201e
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67181589-84c8-490f-b293-de956a62201e;
 Fri, 28 Aug 2020 10:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598611716;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=KLypotq5+UWKcUVozmUgJ52Tr5/c6PIvYAd0Pzp8qq8=;
 b=ZHc7AfHXCzEToF0KxzbQ8i7LeMA47hnwi8Ig6knFnsQcXUl9TzCTw3g6
 Eg4W50yovqypKLCnnB8fLGzhHapM2wQBgEwCGaR0KMzPzBoTtai4QgPuI
 bUP4l/jk4xktK9jFvEgofPn97+TjhoZpOOKtTJx6idS37xDKSkHbnA2Wn U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: s+lVc3bFCnHZTx5YBpvxBxy1bC5yrZrs6/TghTswwqSs06MInqDivME779qmgCqXSTuk3+oWKR
 hY20XaCr9stpSfsvXsCMDDN2TFcWy5r0YrpEb0sXIRzAXKvKyPne3T3PPv+wUDl71yKycFUXBk
 y6ypGIaCOlNKswB2Nkr1vafsEsdx9Tmcfrdui1EKZ/1ENoMe+k1eaZV/nxrMuIhPzWMGb7dK5w
 utQdDC+c4tmYTe68z5Z3K/eHsVGgxAmcPdstAhb8b80+w8MFrWG64kKpN6NwTi4fnjUINHOJ24
 +wk=
X-SBRS: 2.7
X-MesageID: 25496965
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,363,1592884800"; d="scan'208";a="25496965"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBrLxVnrouc7CffFhFijr646SlaS2lFTiAUQ5Tl2/63K37Img9Koq4WqiM+jQqhIyL5eZopnbjfVo3OF3EdpregRqn315u3AeJVJQz9XRiv6wyNAgQ8ysMxbB0uTexSDwmM0o1Xgr01nLvdDCt+exhm5G4uQ3yEwNvtwZwKyiCM+FVmRaYAV35Y/VvFAk0buCQ7AVupCmU/vHnDMs+plqzpMXCyXSHgEWvesYtd5IL6Cw0QtZ6Ym/jXNA+QQsjRHmmVDO/oq04pdXtlJn9PQmLm6QmLAZnC59tB+/SoK19cUobmaaiIkSbrTebcaj+nXIrmxu0QlB7Cp3EbcGU8iWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLypotq5+UWKcUVozmUgJ52Tr5/c6PIvYAd0Pzp8qq8=;
 b=dTN9qkvDaWexxXIYoyYvrn/sEDj5bAswpcg1ogYMgulrkV3wOX3o4TtE+tr/iAdXfiyObAQTDZIKVMxHesBQb9mdLWPoGVStZeLiVao0jQElBR4DvAJyvyCspslYwVORp3+eSS30HKiLGi7TfebOjxp4BNlxoyKBqijPFw+PzNdxwAZCyYuUwvoxjaPwAp/aImn3WMldvY1WVEKHmwsS0pqF5KB14za9AyOi4F6mAhOBH0t+iwTv7hFSNXdX6q+kBoL2u5S+lEUrZ6ne26H8R9jNW0wbEiTZLwtnMKOkkCdjzKXx/d9gI9VnYMMmn38YZTsOOrjfqgvEYv+X8OWRNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLypotq5+UWKcUVozmUgJ52Tr5/c6PIvYAd0Pzp8qq8=;
 b=ATLagje1P1iJE+eyLPBuiQ4U1OxWoPuRwNJxKOBjj6ZexXHCJtLZaYWyMckmG3qFkqufk1wYIdObWt5ZsFGnyeAePXxKgJpRZTImoH5oY/r0O6OftnHEJC6bm5r3GPUchVv9zpRPPwnj6WfEIYfwpj0+lKPi4F30c840CHdecwA=
From: George Dunlap <George.Dunlap@citrix.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com"
 <intel-xen@intel.com>, "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Sergey Dyasli
 <sergey.dyasli@citrix.com>, Christopher Clark
 <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, "Kevin
 Pearson" <kevin.pearson@ortmanconsulting.com>, Juergen Gross
 <jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
 "Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
 <edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
 <robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, "Matt
 Spencer" <Matt.Spencer@arm.com>, "anastassios.nanos@onapp.com"
 <anastassios.nanos@onapp.com>, Stewart Hildebrand
 <Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, "mirela.simonovic@aggios.com"
 <mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Ian Jackson
 <Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
 <cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, "David
 Woodhouse" <dwmw@amazon.co.uk>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
 <varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
 <rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>, "Olivier
 Lambert" <olivier.lambert@vates.fr>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>
Subject: [ANNOUNCE] Call for agenda items for 3 September Community Call @
 15:00 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 3 September Community Call
 @ 15:00 UTC
Thread-Index: AQHWfSjCftSKszlqLUuptDIy6yV9XA==
Date: Fri, 28 Aug 2020 10:48:27 +0000
Message-ID: <0CF41EE7-BA9F-4CB6-A431-28AA0A145BE6@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6796cfcd-3da8-436a-6b98-08d84b3fe55d
x-ms-traffictypediagnostic: SJ0PR03MB5581:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR03MB5581B858CFC71C73D2FF7AC199520@SJ0PR03MB5581.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QIDCme9fZY+E+znU263rlEPxNXnlUMsOVMA4nJsvRtDxCP9aHfM3h4PK/Qx+YnUGqyueauct+TMguuTulD4rSohacgZWJJXMnTbU3BSFui+vgh2lLUVG6PnFRqY+w0IBuZsz++EIdnC9ty7HjbIrzIwmQxTHJh4KzPWwyMnqbSmkgiFIW+fGZonqda3BL12PtFY7Wth7C5K6qCVO0xN1XI3hE5sWvd+bvxcnkebzjY9HwpdG90E8fwy7v+X3yFuwwyZQANSl4xuQx2XJGANr3wZCLlaPrplrf05gOLsyidkqHX1YLMILkrrhgWS7Ja/Vy2CZB5wPVMN2SknHe4tykJRhHOBykSUNJLUL0XqYjT01vYURi875+goELAiwL6iWZYSiOwjkIvIF26uqcnXZZTe+bB2FIffGaBxMe0BYE7Qn7r0Ds9NhaHt4SnIH067t
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(36756003)(316002)(8676002)(33656002)(86362001)(5660300002)(6486002)(6506007)(66476007)(6512007)(7406005)(478600001)(110136005)(83380400001)(8936002)(7416002)(26005)(64756008)(4326008)(966005)(2616005)(76116006)(66446008)(66556008)(2906002)(91956017)(71200400001)(186003)(66946007)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Aifc0tFnVfvI+TedCo6ifEdyxi+BizWJibznurIK1OYcaWXF2nSeruB2pnwHdBKuCHpWmlGlSE5kF5pQRzh/ENcvQjXBcOmWQUTi0YJ0CP4B2hfzRpXM0HF/QKXjcE7+UNA3hwUprmZlB0/qGup5KG3Emb7dvRUH9VoisjtlqKmsf9vsnIWx/MJNsJ4bGzKMCvhDwGj1sRourenyGs58+9FHnvbVT/wqXt+LcD5Jjyi6hqlF8LM9UCluW65mII9091Ud1n087ZSzFDIxoJBxiNhcJuT8PxAxfdf3Pp/UD0qh1WEiowFNSq0XDpvZeOHJm52+crFoGN1U8NIJj/BEkF8C1WzAI8Q/kTGfPEGlSJT+i4KWJdlGy0UhrzhUvHG0DywuLEtxC8QZIxx18Uw9lz47/1se8+MIPHKjsKwCJZuShOAPYKZcfR4gdCCvWDNsUWMtDfKqZkfHFB/IzNhB9q5n/14lG27RQpCeDSuZuSydeOP87F6vuB7nsZUZ5t1Gjkql24TuE9tIwjECVDzaXMEZ8EC8bjrMI5gdsgAIud5ZcelmFypx4a9TG9KZ5LHCVvlR9tEx/Sju7sgDNZXDWuMY5zSliPIewoC6xJOiuNefrN2P+ThYCX2T5QYqsrY5PvDfqi7GOuaHyFygB0/juQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <BAC0B0C72852144AACBF5D724E4F44F1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6796cfcd-3da8-436a-6b98-08d84b3fe55d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 10:48:27.3234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0wyWSYdQDSaGTa1Z1itmYafLYDE0Gktrp3zEvHgK1/EglHubmA+BR054iu8KJJ0AEOaese60FZFAsgAa5pmFuv7V9ShKzbRhDEeWjJoBQjU=
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

SGkgYWxsLA0KDQpUaGUgcHJvcG9zZWQgYWdlbmRhIGlzIGluIGh0dHBzOi8vY3J5cHRwYWQuZnIv
cGFkLyMvMy9wYWQvZWRpdC9mMTQ3YjBhZWQ4ZmUyNmFmNzIxY2EzY2QwMDQyNTM2MS8gYW5kIHlv
dSBjYW4gZWRpdCB0byBhZGQgaXRlbXMuICBBbHRlcm5hdGl2ZWx5LCB5b3UgY2FuIHJlcGx5IHRv
IHRoaXMgbWFpbCBkaXJlY3RseS4NCg0KQWdlbmRhIGl0ZW1zIGFwcHJlY2lhdGVkIGEgZmV3IGRh
eXMgYmVmb3JlIHRoZSBjYWxsOiBwbGVhc2UgcHV0IHlvdXIgbmFtZSBiZXNpZGVzIGl0ZW1zIGlm
IHlvdSBlZGl0IHRoZSBkb2N1bWVudC4NCg0KTm90ZSB0aGUgZm9sbG93aW5nIGFkbWluaXN0cmF0
aXZlIGNvbnZlbnRpb25zIGZvciB0aGUgY2FsbDoNCiogVW5sZXNzLCBhZ3JlZWQgaW4gdGhlIHBl
cnZpb3VzIG1lZXRpbmcgb3RoZXJ3aXNlLCB0aGUgY2FsbCBpcyBvbiB0aGUgMXN0IFRodXJzZGF5
IG9mIGVhY2ggbW9udGggYXQgMTYwMCBCcml0aXNoIFRpbWUgKGVpdGhlciBHTVQgb3IgQlNUKQ0K
KiBJIHVzdWFsbHkgc2VuZCBvdXQgYSBtZWV0aW5nIHJlbWluZGVyIGEgZmV3IGRheXMgYmVmb3Jl
IHdpdGggYSBwcm92aXNpb25hbCBhZ2VuZGENCg0KKiBJZiB5b3Ugd2FudCB0byBiZSBDQydlZCBw
bGVhc2UgYWRkIG9yIHJlbW92ZSB5b3Vyc2VsZiBmcm9tIHRoZSBzaWduLXVwLXNoZWV0IGF0IGh0
dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9EOXZHemloUHh4QU9lNlJGUHowc1JD
ZisvDQoNCkJlc3QgUmVnYXJkcw0KR2VvcmdlDQoNCg0KPT0gRGlhbC1pbiBJbmZvcm1hdGlvbiA9
PQ0KIyMgTWVldGluZyB0aW1lDQoxNTowMCAtIDE2OjAwIFVUQyAoZHVyaW5nIEJTVCkNCkZ1cnRo
ZXIgSW50ZXJuYXRpb25hbCBtZWV0aW5nIHRpbWVzOiBodHRwczovL3d3dy50aW1lYW5kZGF0ZS5j
b20vd29ybGRjbG9jay9tZWV0aW5nZGV0YWlscy5odG1sP3llYXI9MjAyMCZtb250aD01JmRheT03
JmhvdXI9MTUmbWluPTAmc2VjPTAmcDE9MTIzNCZwMj0zNyZwMz0yMjQmcDQ9MTc5DQoNCg0KIyMg
RGlhbCBpbiBkZXRhaWxzDQpXZWI6IGh0dHBzOi8vd3d3LmdvdG9tZWV0Lm1lL0dlb3JnZUR1bmxh
cA0KDQpZb3UgY2FuIGFsc28gZGlhbCBpbiB1c2luZyB5b3VyIHBob25lLg0KQWNjZXNzIENvZGU6
IDE2OC02ODItMTA5DQoNCkNoaW5hIChUb2xsIEZyZWUpOiA0MDA4IDgxMTA4NA0KR2VybWFueTog
KzQ5IDY5MiA1NzM2IDczMTcNClBvbGFuZCAoVG9sbCBGcmVlKTogMDAgODAwIDExMjQ3NTkNClVr
cmFpbmUgKFRvbGwgRnJlZSk6IDAgODAwIDUwIDE3MzMNClVuaXRlZCBLaW5nZG9tOiArNDQgMzMw
IDIyMSAwMDg4DQpVbml0ZWQgU3RhdGVzOiArMSAoNTcxKSAzMTctMzEyOQ0KU3BhaW46ICszNCA5
MzIgNzUgMjAwNA0KDQoNCk1vcmUgcGhvbmUgbnVtYmVycw0KQXVzdHJhbGlhOiArNjEgMiA5MDg3
IDM2MDQNCkF1c3RyaWE6ICs0MyA3IDIwODEgNTQyNw0KQXJnZW50aW5hIChUb2xsIEZyZWUpOiAw
IDgwMCA0NDQgMzM3NQ0KQmFocmFpbiAoVG9sbCBGcmVlKTogODAwIDgxIDExMQ0KQmVsYXJ1cyAo
VG9sbCBGcmVlKTogOCA4MjAgMDAxMSAwNDAwDQpCZWxnaXVtOiArMzIgMjggOTMgNzAxOA0KQnJh
emlsIChUb2xsIEZyZWUpOiAwIDgwMCAwNDcgNDkwNg0KQnVsZ2FyaWEgKFRvbGwgRnJlZSk6IDAw
ODAwIDEyMCA0NDE3DQpDYW5hZGE6ICsxICg2NDcpIDQ5Ny05MzkxDQpDaGlsZSAoVG9sbCBGcmVl
KTogODAwIDM5NSAxNTANCkNvbG9tYmlhIChUb2xsIEZyZWUpOiAwMSA4MDAgNTE4IDQ0ODMNCkN6
ZWNoIFJlcHVibGljIChUb2xsIEZyZWUpOiA4MDAgNTAwNDQ4DQpEZW5tYXJrOiArNDUgMzIgNzIg
MDMgODINCkZpbmxhbmQ6ICszNTggOTIzIDE3IDA1NjgNCkZyYW5jZTogKzMzIDE3MCA5NTAgNTk0
DQpHcmVlY2UgKFRvbGwgRnJlZSk6IDAwIDgwMCA0NDE0IDM4MzgNCkhvbmcgS29uZyAoVG9sbCBG
cmVlKTogMzA3MTMxNjk5MDYtODg2LTk2NQ0KSHVuZ2FyeSAoVG9sbCBGcmVlKTogKDA2KSA4MCA5
ODYgMjU1DQpJY2VsYW5kIChUb2xsIEZyZWUpOiA4MDAgNzIwNA0KSW5kaWEgKFRvbGwgRnJlZSk6
IDE4MDAyNjY5MjcyDQpJbmRvbmVzaWEgKFRvbGwgRnJlZSk6IDAwNyA4MDMgMDIwIDUzNzUNCkly
ZWxhbmQ6ICszNTMgMTUgMzYwIDcyOA0KSXNyYWVsIChUb2xsIEZyZWUpOiAxIDgwOSA0NTQgODMw
DQpJdGFseTogKzM5IDAgMjQ3IDkyIDEzIDAxDQpKYXBhbiAoVG9sbCBGcmVlKTogMCAxMjAgNjYz
IDgwMA0KS29yZWEsIFJlcHVibGljIG9mIChUb2xsIEZyZWUpOiAwMDc5OCAxNCAyMDcgNDkxNA0K
THV4ZW1ib3VyZyAoVG9sbCBGcmVlKTogODAwIDg1MTU4DQpNYWxheXNpYSAoVG9sbCBGcmVlKTog
MSA4MDAgODEgNjg1NA0KTWV4aWNvIChUb2xsIEZyZWUpOiAwMSA4MDAgNTIyIDExMzMNCk5ldGhl
cmxhbmRzOiArMzEgMjA3IDk0MSAzNzcNCk5ldyBaZWFsYW5kOiArNjQgOSAyODAgNjMwMg0KTm9y
d2F5OiArNDcgMjEgOTMgMzcgNTENClBhbmFtYSAoVG9sbCBGcmVlKTogMDAgODAwIDIyNiA3OTI4
DQpQZXJ1IChUb2xsIEZyZWUpOiAwIDgwMCA3NzAyMw0KUGhpbGlwcGluZXMgKFRvbGwgRnJlZSk6
IDEgODAwIDExMTAgMTY2MQ0KUG9ydHVnYWwgKFRvbGwgRnJlZSk6IDgwMCA4MTkgNTc1DQpSb21h
bmlhIChUb2xsIEZyZWUpOiAwIDgwMCA0MTAgMDI5DQpSdXNzaWFuIEZlZGVyYXRpb24gKFRvbGwg
RnJlZSk6IDggODAwIDEwMCA2MjAzDQpTYXVkaSBBcmFiaWEgKFRvbGwgRnJlZSk6IDgwMCA4NDQg
MzYzMw0KU2luZ2Fwb3JlIChUb2xsIEZyZWUpOiAxODAwNzIzMTMyMw0KU291dGggQWZyaWNhIChU
b2xsIEZyZWUpOiAwIDgwMCA1NTUgNDQ3DQpTd2VkZW46ICs0NiA4NTMgNTI3IDgyNw0KU3dpdHpl
cmxhbmQ6ICs0MSAyMjUgNDU5OSA3OA0KVGFpd2FuIChUb2xsIEZyZWUpOiAwIDgwMCA2NjYgODU0
DQpUaGFpbGFuZCAoVG9sbCBGcmVlKTogMDAxIDgwMCAwMTEgMDIzDQpUdXJrZXkgKFRvbGwgRnJl
ZSk6IDAwIDgwMCA0NDg4IDIzNjgzDQpVbml0ZWQgQXJhYiBFbWlyYXRlcyAoVG9sbCBGcmVlKTog
ODAwIDA0NCA0MDQzOQ0KVXJ1Z3VheSAoVG9sbCBGcmVlKTogMDAwNCAwMTkgMTAxOA0KVmlldCBO
YW0gKFRvbGwgRnJlZSk6IDEyMiA4MCA0ODENCuKAi+KAi+KAi+KAi+KAi+KAi+KAiw0KDQpGaXJz
dCBHb1RvTWVldGluZz8gTGV0J3MgZG8gYSBxdWljayBzeXN0ZW0gY2hlY2s6DQoNCmh0dHBzOi8v
bGluay5nb3RvbWVldGluZy5jb20vc3lzdGVtLWNoZWNr

