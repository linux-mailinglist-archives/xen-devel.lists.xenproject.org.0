Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 451DF27FCCE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 12:07:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1164.3845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNvTn-0003j6-RQ; Thu, 01 Oct 2020 10:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164.3845; Thu, 01 Oct 2020 10:06:27 +0000
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
	id 1kNvTn-0003ih-Nx; Thu, 01 Oct 2020 10:06:27 +0000
Received: by outflank-mailman (input) for mailman id 1164;
 Thu, 01 Oct 2020 10:06:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CxPN=DI=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kNvTm-0003ic-CO
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:06:26 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63677afb-644e-40fc-adbb-451ff683f780;
 Thu, 01 Oct 2020 10:06:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CxPN=DI=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kNvTm-0003ic-CO
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:06:26 +0000
X-Inumbo-ID: 63677afb-644e-40fc-adbb-451ff683f780
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 63677afb-644e-40fc-adbb-451ff683f780;
	Thu, 01 Oct 2020 10:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601546785;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/UAhn6V5sQFFpeKUVPG2DKvo68iuogAeGXi0cF0ZRLA=;
  b=UumGVCg6hc6Lxr3O9SnZrlanaeYKihCdprJeeX2cjQ3G604EojG2W2/u
   AdF+gOxGszlyvNGwJiLW6wurWshs9KehMsFzCmIVx9vxVnY8LB64lcOHc
   3Z8OVUeVgsaXJmOX+28b1wPtEML2eaPp70qJdPxF8cmYGHZ/ACAV80Ddr
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dH5ekr5PSIQNc0O9zF19lXXz/rnUyuiMVeOkZ6NLI875zIp7BZu82889yqe9LfhMdqn4AkyZwD
 +7pB5hlWSKNICdJnUKS+LBrs6miVzLG1RXV/CjDnte0WGv7gEzBBBPZULafJURGEiTqZgjTsck
 oypZfz7sH0TrW49IehhgymszVOWn73dQTio4ipIlCfSy2dDHGnhEGqNtWudyfXBCyq/I+S/WBe
 9Wg0aD14nFLGsvhZ/zHUJ/+jyoU8B+kBjkDLgi75IwNiLdOgIL6r4FVVzviS5XxnQ+63kSuKUj
 YTM=
X-SBRS: None
X-MesageID: 28144524
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="28144524"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+he/qXg7uS64agHxgf90uckSMUJ8pWMqulNW8mRz5hsydPrEMbx5Sog4N+N6zi4HIZ653YHFqE14VeaXvRRmiC9cGZpXWuLFNf3tCbKWYhjcElrgcfj6ltr4Ra8OClpvSUVKUgmoVv9mdz7kgzmdyqPHeFFaTmpEsm9XaVC/ZwSfzYpOj1BoSUEITGVpRN2idNHirCaw5TOTYPz5TGaPSIVxYzjfIj/1MqVRt4j6Exsua6Umc/SPk2O7pr9Ha9dx9L1t9zAcRoKiP/K7hix2pywCH67juHTjJOwofYJFKmDoMh5RHr52s3l4KAoE5lqjFOP9U6HjS4g71Up6F7p7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UAhn6V5sQFFpeKUVPG2DKvo68iuogAeGXi0cF0ZRLA=;
 b=XBgxFXEHr+TcOnlw0X9dzC7FF2EVfXpHc8vFzewdmxMp1YOVspx4fHu6xxCcKSEX6xLK/nU4YltzzZreckdVZUYyKDKioEN34T3k9XyIfRleB9z3DR1ZejTDv3GHYNi8piw/7bjh8Cp+YkpLmv3IN/Z19k1CWiPWtaptBJ8yEHKFkzDCGXkqdnh3VFePy6qQmaxy6iSSAN7R1wfaEmCY0muUiNdm0ajIBBJ3HU8w/bqFZvrT22NvmFwu84sTuea/IMON6p1vWh9S6sIDuhjLZiudJN7EHbhJ+sekYRhx3uVYltcd93noqXxKR7yer5y+C6pqQkagHTZI/yqgRN4aVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UAhn6V5sQFFpeKUVPG2DKvo68iuogAeGXi0cF0ZRLA=;
 b=fv10gasLOrbKVrPB5Q+GpG7pLM2Z6a5SkHa1cw5VYF4AvfQZirYtOUAQRXw76+uSb1lRccMANM8J7Qw9BiRC/0tlfnU0yaKvh7D7WwX3r6CikhwjyflogueiqHPh5G/p7fT2I5ByiTdICirLQKglQqrDfAJYgDKeg/TWu59emBE=
From: George Dunlap <George.Dunlap@citrix.com>
To: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, Artem Mygaiev
	<Artem_Mygaiev@epam.com>, "committers@xenproject.org"
	<committers@xenproject.org>, "julien@xen.org" <julien@xen.org>,
	"vicooodin@gmail.com" <vicooodin@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "viktor.mitin.19@gmail.com"
	<viktor.mitin.19@gmail.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: Xen Coding style and clang-format
Thread-Topic: Xen Coding style and clang-format
Thread-Index: AQHWlwq4nKYEhMN38U+xmvwRsutq+amA8joAgAAHUgCAAXyKAIAAENkA
Date: Thu, 1 Oct 2020 10:06:21 +0000
Message-ID: <B64C5E67-7BEA-4C31-9089-AB8CC1F1E80F@citrix.com>
References: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>
 <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com>
 <E068C671-8009-4976-87B8-0709F6A5C3BF@citrix.com>
 <b16dfb26e0916166180d5cbbe95278dc99277330.camel@epam.com>
In-Reply-To: <b16dfb26e0916166180d5cbbe95278dc99277330.camel@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fe55158-6529-4ede-ef8f-08d865f1a58f
x-ms-traffictypediagnostic: BYAPR03MB3639:
x-microsoft-antispam-prvs: <BYAPR03MB3639DB9D34923523AEA3F29299300@BYAPR03MB3639.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RALu3ktj9yQKXiUgizG+OVZtCPY6YUQbhxV/ABP8EfjgKbJQUAXCKxZX811W7LhRFBuAP6+Vcxi5TUAjsdJbjSmdHOpc6+Nn6T4gbuMtamgPqV+I0fRjC5stAistxS6pQf2U4rqryceR++T8OhhBzVzFYkQXh/CwgOlejRp9ZtkJZI/KG2lGBMKevWa1VXfng+GFKdan+9hlWsVruILH/IyfBdH9zbipvXi0I5vbdtNwKyIY99DG46SCg7mnb6Y+dzxhD3c9c2loXLSijbKPcAhdcY2AmMj+tYCy55pXeB8GvBkLNqPbwU4766IZKdhZifeiUXPmuLVJ99Ie7dwx6w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(66476007)(66946007)(54906003)(2906002)(53546011)(2616005)(55236004)(91956017)(6506007)(5660300002)(26005)(76116006)(316002)(6512007)(6916009)(33656002)(64756008)(6486002)(4326008)(86362001)(36756003)(186003)(8936002)(478600001)(8676002)(71200400001)(66446008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: L+HxWkD0wE8ipSvelLfDChuFXcHRq7Wo2/r1k/2lUwbbKBUoG8t6Bzd8m2iqQhTtWOvZBkzv/Zfab/GTVnppNaL+BgkoueDNHEQCBLUqsGBAIHRBvOxv0xKOG6M5AjA4/9p5eIS8VpqvY84ifBjNwKDRY2nZYTyU3bilUyT4dd+A3wivMtKjCxpiITUOkEPxDIYKbaWde3SjjBsgQ9QBMkQCcMvhnZKpih7JmV/lSZ9yWeNkZgx1BvIBIJyCPImHDn26WeRpc+5DkMJ+gICJLEQkZd2okGR4TyW6IYLmEHN3NY4DeYyNCBOB3hLz1LOGRK8ijYsc65F0WFDcHf/DDvxWF4CiYdZkrsB0vDpgjn7mETXpIlyMw4ntYBd2eLsaCp3puM4cQY8/NNxnXFuYomZptFXsBUhqvp6MPmnxMZGLdjrJXmek0G3ZcMZAswNnqV5Z8SQ9+ZfpZEpN6gRcviaFVV6FewT27dgzF0GJQnbCqvXnpZlsXK/iIxP856zZe0n6R+xbaqR/tjsX8evLxhDGGWzCnXs2OSuotV/XZKx28CqvSjvJHFi2YH6/+HryPb+Y4XTqhEZvvXatOJI55i8q0pIvPDEnsJTceYuNuZ0FqeyydU/jhUcDQHVE/++R+FtrMReKU0npEo0gY02tUA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A93C568F7B01E4AB9A95C4E3D0AB4EA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe55158-6529-4ede-ef8f-08d865f1a58f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 10:06:21.1352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ursIv/6Id6lOFXEw/I+GIHTdlJ9qVhJxiKlmi6msNp82zLfUdIS38oRMlBBhGQ1ZXDXETYV1eHKG/5QHpUZm/MxBvMSVxFoc7Bj35jdUAnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3639
X-OriginatorOrg: citrix.com

DQoNCj4gT24gT2N0IDEsIDIwMjAsIGF0IDEwOjA2IEFNLCBBbmFzdGFzaWlhIEx1a2lhbmVua28g
PEFuYXN0YXNpaWFfTHVraWFuZW5rb0BlcGFtLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+
IE9uIFdlZCwgMjAyMC0wOS0zMCBhdCAxMDoyNCArMDAwMCwgR2VvcmdlIER1bmxhcCB3cm90ZToN
Cj4+PiBPbiBTZXAgMzAsIDIwMjAsIGF0IDEwOjU3IEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+DQo+Pj4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gMzAuMDkuMjAyMCAxMToxOCwgQW5h
c3Rhc2lpYSBMdWtpYW5lbmtvIHdyb3RlOg0KPj4+PiBJIHdvdWxkIGxpa2UgdG8ga25vdyB5b3Vy
IG9waW5pb24gb24gdGhlIGZvbGxvd2luZyBjb2Rpbmcgc3R5bGUNCj4+Pj4gY2FzZXMuDQo+Pj4+
IFdoaWNoIG9wdGlvbiBkbyB5b3UgdGhpbmsgaXMgY29ycmVjdD8NCj4+Pj4gMSkgRnVuY3Rpb24g
cHJvdG90eXBlIHdoZW4gdGhlIHN0cmluZyBsZW5ndGggaXMgbG9uZ2VyIHRoYW4gdGhlDQo+Pj4+
IGFsbG93ZWQNCj4+Pj4gb25lDQo+Pj4+IC1zdGF0aWMgaW50IF9faW5pdA0KPj4+PiAtYWNwaV9w
YXJzZV9naWNfY3B1X2ludGVyZmFjZShzdHJ1Y3QgYWNwaV9zdWJ0YWJsZV9oZWFkZXINCj4+Pj4g
KmhlYWRlciwNCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdW5zaWdu
ZWQgbG9uZyBlbmQpDQo+Pj4+ICtzdGF0aWMgaW50IF9faW5pdCBhY3BpX3BhcnNlX2dpY19jcHVf
aW50ZXJmYWNlKA0KPj4+PiArICAgIHN0cnVjdCBhY3BpX3N1YnRhYmxlX2hlYWRlciAqaGVhZGVy
LCBjb25zdCB1bnNpZ25lZCBsb25nDQo+Pj4+IGVuZCkNCj4+PiANCj4+PiBCb3RoIHZhcmlhbnRz
IGFyZSBkZWVtZWQgdmFsaWQgc3R5bGUsIEkgdGhpbmsgKHNhbWUgYWxzbyBnb2VzIGZvcg0KPj4+
IGZ1bmN0aW9uIGNhbGxzIHdpdGggdGhpcyBzYW1lIHByb2JsZW0pLiBJbiBmYWN0IHlvdSBtaXgg
dHdvDQo+Pj4gZGlmZmVyZW50IHN0eWxlIGFzcGVjdHMgdG9nZXRoZXIgKHBsYWNlbWVudCBvZiBw
YXJhbWV0ZXINCj4+PiBkZWNsYXJhdGlvbnMgYW5kIHBsYWNlbWVudCBvZiByZXR1cm4gdHlwZSBl
dGMpIC0gZm9yIGVhY2gNCj4+PiBpbmRpdmlkdWFsbHkgYm90aCBmb3JtcyBhcmUgZGVlbWVkIGFj
Y2VwdGFibGUsIEkgdGhpbmsuDQo+PiANCj4+IElmIHdl4oCZcmUgZ29pbmcgdG8gaGF2ZSBhIHRv
b2wgZ28gdGhyb3VnaCBhbmQgcmVwb3J0IChjb3JyZWN0PykgYWxsDQo+PiB0aGVzZSBjb2Rpbmcg
c3R5bGUgdGhpbmdzLCBpdOKAmXMgYW4gb3Bwb3J0dW5pdHkgdG8gdGhpbmsgaWYgd2Ugd2FudCB0
bw0KPj4gYWRkIG5ldyBjb2Rpbmcgc3R5bGUgcmVxdWlyZW1lbnRzIChvciBjaGFuZ2UgZXhpc3Rp
bmcgcmVxdWlyZW1lbnRzKS4NCj4+IA0KPiANCj4gSSBhbSByZWFkeSB0byBkaXNjdXNzIG5ldyBy
ZXF1aXJlbWVudHMgYW5kIGltcGxlbWVudCB0aGVtIGluIHJ1bGVzIG9mDQo+IHRoZSBYZW4gQ29k
aW5nIHN0eWxlIGNoZWNrZXIuDQoNClRoYW5rIHlvdS4gOi0pICBCdXQgd2hhdCBJIG1lYW50IHdh
czogUmlnaHQgbm93IHdlIGRvbuKAmXQgcmVxdWlyZSBvbmUgYXBwcm9hY2ggb3IgdGhlIG90aGVy
IGZvciB0aGlzIHNwZWNpZmljIGluc3RhbmNlLiAgRG8gd2Ugd2FudCB0byBjaG9vc2Ugb25lPw0K
DQpJIHRoaW5rIGluIHRoaXMgY2FzZSBpdCBtYWtlcyBzZW5zZSB0byBkbyB0aGUgZWFzaWVzdCB0
aGluZy4gIElmIGl04oCZcyBlYXN5IHRvIG1ha2UgdGhlIGN1cnJlbnQgdG9vbCBhY2NlcHQgYm90
aCBzdHlsZXMsIGxldOKAmXMganVzdCBkbyB0aGF0IGZvciBub3cuICBJZiB0aGUgdG9vbCBjdXJy
ZW50bHkgZm9yY2VzIHlvdSB0byBjaG9vc2Ugb25lIG9mIHRoZSB0d28gc3R5bGVzLCBsZXTigJlz
IGNob29zZSBvbmUuDQoNCiAtR2Vvcmdl

