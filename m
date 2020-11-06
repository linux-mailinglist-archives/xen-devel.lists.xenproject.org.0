Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE7B2A98D4
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 16:54:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20923.46984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb43f-0003vP-At; Fri, 06 Nov 2020 15:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20923.46984; Fri, 06 Nov 2020 15:53:47 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb43f-0003v0-7T; Fri, 06 Nov 2020 15:53:47 +0000
Received: by outflank-mailman (input) for mailman id 20923;
 Fri, 06 Nov 2020 15:53:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYaw=EM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kb43d-0003uu-EH
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:53:45 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 262090eb-bf42-472f-b220-ae7278bd4259;
 Fri, 06 Nov 2020 15:53:43 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mYaw=EM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kb43d-0003uu-EH
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:53:45 +0000
X-Inumbo-ID: 262090eb-bf42-472f-b220-ae7278bd4259
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 262090eb-bf42-472f-b220-ae7278bd4259;
	Fri, 06 Nov 2020 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604678023;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=V07ZJB0BEyifSVhpjP+or0kueU0shHYYGhLPZwoP954=;
  b=EpY9j4ys9J547a7q9ocwYGg6PHbCxY5dSRhJNCDZthpr6x7csGCsbS+U
   /PPDnrv+vEGdB/I+iWsCCrjdMFVoBduaFI3P8zRf3eQ1V1i7mwcvWBXX5
   hrbEoUgcpIWRUe0BM3MdLRzOvaWXz55IJSgjdnUlZ0XFtFvNMQbigy0vr
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HCgbAj4jitrHQ2VE/poy3CMSJz/54i/jNTPPbiUgzQErZVO4Zxb6Oe56mVwNECEkUHoNKGePII
 0paOZcPgP3MLUBYP0ZT6raXySfPTsmI3U/vwuk4nKu7cdhRZyf3ARKUHlHyg7irN9BbruKRpjc
 mjdfdaEsfQUjE4Lcxq4OW2VacQ8j+v+ViIsujl1yUIPESWo74wHiWQXHw5TRle1xNZEXEx49sM
 qQtc4JI3bFLz+l5bPB20e7uPCspN3GB3Mp9XhRxHC/Q2BBu331EK2A2PwKtPST4L93bbMrgP12
 1bU=
X-SBRS: None
X-MesageID: 30881112
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,456,1596513600"; 
   d="scan'208";a="30881112"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahSJOP5cQSZOI8RTAjUnvAUYo3KgP2CIDcDyPNeOqRBNtMOY01dEexrIjXJe2a8T/+HzDUe6kHnzXNKzhOittYgZ/AIp9H9HmlOvi2exSrrAyt1BKDuK4ZB/2YJv928IUoShL6AiCk8883FzQJRpeUxrSRVgBQkSX445uqU0oWgoCYEkdNypvRK4kGLcPatqcMSVFmHZQOnOJJo5fhUTCSWICJujJWQh+3c0VmXukr3wQcJ0/lV1BhkZG4I4UNleVB1/pxqlG85GjXfVHrsMKFCXJDkrol9Sel+bKC9FTFJCttbKrDFRcpDi/zzhX5dn4RsxbOujTd1FjNlwAC3sgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V07ZJB0BEyifSVhpjP+or0kueU0shHYYGhLPZwoP954=;
 b=mqA1pt4nqwb7+Oa20MmV8royN9c1uDHY7A4xCKojUdEwp7JTiDPaq9VrGb0wvz2IeSc1iYvWxeKquwnCU63QnwxsOdf/G9ZHcKlCoi+d/54GPgvSwsU4CE+hNySqg0Y2Yy5ARVeddbJ1Zs71b/Xd866sAl7fALwboQ6LYsQ987xBGYXn7fQcPCO7KIAcJKIpEJ/KrbuZTMQkP1civZdIKRZwme5Mqr+QoAqN070PDUQjucPAyqdq7/ktdxVX9erZn0LAqu57RoNRNLA0STjYlbguMkryiLYWFwwlLokziINZTRL74CmxRDvZPiC5Px2wPbou/lquSNe3LwUwAlUuTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V07ZJB0BEyifSVhpjP+or0kueU0shHYYGhLPZwoP954=;
 b=oSmE+2b90IaTfGgmJqF/UpnAFIKnDFPPZ3REDkgcEIugI9LcrhFNG4wIRbiqKVYNK0Hnim2fJDZsiKG6R/VQWNBqPjg+E9/KhQl9FaAmFJuEwjE71lWfgsOrt4yWSHozNOkA6ly/haMrlgnx1yd3J9bRxb6FkzuVXG79kz0OklI=
From: George Dunlap <George.Dunlap@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Michael Young <m.a.young@durham.ac.uk>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Xen 4.13.2 released
Thread-Topic: Xen 4.13.2 released
Thread-Index: AQHWsn7TXlZVtT/AC0iXjX7nX8Eg4Km7Q7sAgAABPQA=
Date: Fri, 6 Nov 2020 15:53:35 +0000
Message-ID: <4D30BF59-8F11-49EC-8F7B-5822807744BF@citrix.com>
References: <ed219f15-479b-5d06-c835-eb4f4c64db3a@suse.com>
 <a391cfd1-be4a-add6-cd36-8bb254f9b43f@austen3.home>
 <a3dfec9d-bb32-c1c5-c00e-ea95c62c9bde@suse.com>
 <20201106154908.GN2214@perard.uk.xensource.com>
In-Reply-To: <20201106154908.GN2214@perard.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 529ee543-a1bb-465b-bb31-08d8826c1e7a
x-ms-traffictypediagnostic: BYAPR03MB4391:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB439156CBE52D83C15F7A7B8399ED0@BYAPR03MB4391.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gh9HADmv+rqMjSlFEoX5LDzFYWMRqYlxjE/xWg81Vkr7tBnXPeM/AQ4KngPS1Qa+oqpSQ3R2tIclQpRhJoOyIcZc4OrjQmgmAON2KVoLgRD4o6wKwEqPzubL9rn5ZznKH9rm7BRC7pih17kzY0m54QBECT0yUEVrxAWvd47TuT9jMqCo12SvgEZnA92XaMXjbaH5cAOW/CFoAdKkooAK5tM5zymQYjyFXCPtEKncZ7GqEyxqBUwqADTafRo9aIgTutVu3FWW5sCy5XYHQAD+SBHT6UC8wqAgznR2ssualtIx/us0sXajIIJ4n73e4feevpkCmhBMQnjY98xHyyu00k0XYYjyAEHjKZ3fR1zrm9c14YqBBWWkQn/cKebiEqgTc1AmymfzBg3S+gx7mv4fXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(6512007)(54906003)(4326008)(2616005)(66946007)(83380400001)(5660300002)(37006003)(6636002)(71200400001)(186003)(8936002)(8676002)(36756003)(86362001)(53546011)(2906002)(55236004)(66446008)(478600001)(91956017)(6486002)(6506007)(66556008)(33656002)(66476007)(6862004)(7116003)(966005)(26005)(64756008)(76116006)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: SP5wWpGPK0t+cphiXppTBDpfGJOegGB3c4VYzixLve92AHlIGh+YrdIqENGqtUjJELf92FOEAzTaEV93IJpJPGX1uS6Zrf4P4cLfEH1O84BgRFiNvhpVzJwlBjCuwIK6xvs+lE/WzVxtzzrx5eDQQkOx96PqBh3ZGJm4uPS18bSp8Valkv2UEvpwlwKqgBbxBhvrnhPogwLo4on7nsiSKoT5xxGxzRFktcRpC5O7Wd6VpnDWJw1+AMplQ2HOG+0Q3QWARW27LSxoxjTVazrb6QE/eD4kgTgNjKke6IXZPZAapW4DmUMXGw1hwVn6LmyCc08v6sxoN8IJ7YwV5e4AAWnNl4Ekr/XXDi3q6Bqvdxrv1B+QiYdwuLY4lJN4cMJROky+aXQ7UfC6L6KZ4Xohd+AvG15T6CLsQ6qe6/h5Ks/bK6vt3a3e+dwn+SXHYzIYQ1euMSIaAijTNiNsp4n6ohYP9V6o3Kfso++WN7eLsfDt5PJRNOU5NOvgJmX9TrEO2KzSMLC9RhluQRoKYxWfKpibQtrb+OmZ7GOHp04M7pAagHZgx3JopNVuFaPRRmcBhdCDjq8u1VnNxjrszDTo/5RA+uVPhpTHn1eMQ4qnLWPc7/uzzvr483eAboHSDPWy/GaVLxjC6k176yZGgL+lNA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA65C41A7131344AA52234DB1D3B2125@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529ee543-a1bb-465b-bb31-08d8826c1e7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 15:53:35.1004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ff4HIOt9O5RhnLsd+FWGVIrWLYrlLhIWpLdRVA09pb5ZYoMolS8JNTvsZe+974f/3DAPAJfBBba5lvoHd5rQwHcTA+LrB7EZzA1mzWeTNzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4391
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTm92IDYsIDIwMjAsIGF0IDM6NDkgUE0sIEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgTm92IDA0LCAyMDIwIGF0
IDA4OjQ3OjU3QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDQuMTEuMjAyMCAw
MDo1NSwgTWljaGFlbCBZb3VuZyB3cm90ZToNCj4+PiBPbiBUdWUsIDMgTm92IDIwMjAsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPj4+PiBJIGFtIHBsZWFzZWQgdG8gYW5ub3VuY2UgdGhlIHJlbGVhc2Ug
b2YgWGVuIDQuMTMuMi4gVGhpcyBpcyBhdmFpbGFibGUNCj4+Pj4gaW1tZWRpYXRlbHkgZnJvbSBp
dHMgZ2l0IHJlcG9zaXRvcnkNCj4+Pj4gaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9
eGVuLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFkcy9zdGFibGUtNC4xMw0KPj4+PiAodGFnIFJF
TEVBU0UtNC4xMy4yKSBvciBmcm9tIHRoZSBYZW5Qcm9qZWN0IGRvd25sb2FkIHBhZ2UNCj4+Pj4g
aHR0cHM6Ly94ZW5wcm9qZWN0Lm9yZy9kb3dubG9hZHMveGVuLXByb2plY3QtYXJjaGl2ZXMveGVu
LXByb2plY3QtNC0xMy1zZXJpZXMveGVuLXByb2plY3QtNC0xMy0yLw0KPj4+PiAod2hlcmUgYSBs
aXN0IG9mIGNoYW5nZXMgY2FuIGFsc28gYmUgZm91bmQpLg0KPj4+IA0KPj4+IElzIHRoZSBlbnRy
eSBmb3IgWFNBLTMzNSBjb3JyZWN0IG9uIHRoZSBkb3dubG9hZCBwYWdlPyBUaGF0IHdhcyBhIHFl
bXUgDQo+Pj4gcGF0Y2ggYnV0IEkgZG9uJ3QgdGhpbmsgaXQgd2FzIGluY2x1ZGVkIGluIDQuMTMu
Mi4NCj4+IA0KPj4gSW50ZXJlc3RpbmcsIHRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuIFRo
ZSBxZW11LXRyYWQgcGFydCwNCj4+IGFsYmVpdCAianVzdCIgYSBTVVBQT1JULm1kIHVwZGF0ZSwg
ZGlkbid0IGV2ZW4gbWFrZSBpdCBpbnRvDQo+PiBzdGFnaW5nIHlldCBhZmFpY3MuIFdoaWxlIHRo
aXMgY2FuIHBlcmhhcHMgYmUgdmlld2VkIGFzIGJlbmlnbiwNCj4+IEknbSBjb25jZXJuZWQgdGhh
dCB0aGUgcWVtdXUgZml4IGFsc28gZG9lc24ndCBsb29rIHRvIGhhdmUNCj4+IGxhbmRlZCBpbiBh
bnkgb2YgdGhlIGJyYW5jaGVzIHlldCwgZGVzcGl0ZSB0aGUgdmVyc2lvbiBidW1wIG9uDQo+PiB0
aGUgc3RhZ2luZy9tYXN0ZXIgYnJhbmNoZXMganVzdCA1IGRheXMgYWdvLiBBbnRob255LCBTdGVm
YW5vPw0KPiANCj4gSSd2ZSBwdXNoZWQgdGhlIGZpeCBub3csIHRvIHFlbXUteGVuIHRyZWVzLg0K
PiANCj4gTWF5YmUgR2VvcmdlJ3Mgc2NyaXB0IGNvdWxkIGNoZWNrIHFlbXUteGVuIHRyZWVzIGFz
IHdlbGw/IE9yIHNvbWVvbmUgaW4NCj4gdGhlIHNlY3VyaXR5IHRlYW0gY291bGQgcHVzaCB0aGUg
cGF0Y2hzIG9yIHRlbGwgbWUgYWJvdXQgWFNBcyBpbnZvbHZpbmcNCj4gUUVNVSwgb3RoZXJ3aXNl
IHRoYXQncyBnb2luZyB0byBoYXBwZW4gYWdhaW4uDQoNCk1ha2luZyBhIHNjcmlwdCB5b3UgY291
bGQgcHV0IGludG8gYSBjcm9uIGpvYiB0byB0ZWxsIHlvdSB3aGVuIGEgUUVNVSBYU0EgY29tZXMg
b3V0IHNob3VsZCBiZSBmYWlybHkgZWFzeS4gIChBbHRob3VnaCwgb2YgY291cnNlIGluIHRoaXMg
Y2FzZSBpdCB3b3VsZG7igJl0IGhhdmUgd29ya2VkIGJlY2F1c2UgeHNhLmpzb24gZGlkbuKAmXQg
aGF2ZSB0aGUgY29ycmVjdCBpbmZvcm1hdGlvbi4pDQoNCkNoZWNraW5nIHRoYXQgaXTigJlzIGJl
ZW4gYXBwbGllZCB3b3VsZCBiZSBhIGJpdCBtb3JlIHdvcms7IGl04oCZcyBvbiBteSBsaXN0IG9m
IHRoaW5ncyB0byBkby4NCg0KSXTigJlzIGFsbCBpbiBHbywgc28gbWF5YmUgSSBzaG91bGQgcHVi
bGlzaCB0aGUgcGFja2FnZXM7IHRoZW4gbWF5YmUgeW91IGNvdWxkIHNlbmQgbWUgYSBQUi4gOi0p
DQoNCiAtR2Vvcmdl

