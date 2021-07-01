Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343973B900D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148332.274136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytNs-0003ew-SG; Thu, 01 Jul 2021 09:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148332.274136; Thu, 01 Jul 2021 09:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytNs-0003c6-Og; Thu, 01 Jul 2021 09:53:24 +0000
Received: by outflank-mailman (input) for mailman id 148332;
 Thu, 01 Jul 2021 09:53:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tPK9=LZ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lytNr-0003c0-Nc
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:53:23 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd37892f-0c37-4f5e-be58-2abef2c5c548;
 Thu, 01 Jul 2021 09:53:22 +0000 (UTC)
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
X-Inumbo-ID: bd37892f-0c37-4f5e-be58-2abef2c5c548
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625133202;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=8wf6RvJkTbeOhCP6B745KER9GHhknPb8hrfHAWHomBk=;
  b=C+zOOcJCXky0bBLkmrOGr35WGV1/ozr0V02Yzck4O4V0L/KZjy7hojRY
   pK04p+DDUs0tN6L9vDJgOivjO0mqxo/5jyd9Xd/4XsK/62WLsVaCGIerP
   5mDsMHB4aqaxiJFZUuaiitXSqA0UF18hRt3gzl0o5RgDagX3neLRiTjLv
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: u/C5ZsslG05/7yqjD58kdugYC8n7y+Br0abBWktXlDHVxDaU1tPiLfZFDQqWjaOC49Em8zOJ4X
 +qVcXW/FoVpmCW2V0pP/+PGe1CQcaLOclXlHx4dAF+DOcSstneXWUU7Cf10wRUc1oBsyuLR1DI
 p44HQ2AdtK1jkeVq2nXsFrtS7SBajPi4lZj/HW5xHz9WersN3mV37NUzoFV2Tx/osQvpCdqHJs
 6yl1ta4tIZ1Nl3liIVg24UxOqi2jYKezkSA4PW9TDibgTcruvSy49wio+9qSXMSZvASvq7hce6
 Fgc=
X-SBRS: 5.1
X-MesageID: 47354412
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:H8ZTYq2o64qVtneerPQc4AqjBTZyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ4+xpOMG7MBfhHQYc2/heAV7QZniahILOFvAi0WKC+UyuJ8SazI9gPM
 hbAtBD4bHLfDpHZKXBkUmF+rQbsaK6GcmT7I+0pRoMPGJXgslbnl1E422gYypLrXx9dOME/e
 2nl6x6TlSbCBEqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEA9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyDpAJb4RHoFqjgpF591H22xa1u
 UkZC1QZvib3kmhOl1dZyGdgzUIngxesEMKgmXo/UcL6faJOw7STfAx2L6xOyGpmnYIrZVy1r
 lG0HmesIcSBRTcnD7l79yNTB1ykFGoyEBS2tL6HxRkIPUjgZJq3MUiFXluYd899ePBmfQaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATxRlCvgYl7d1amm1F+IM2SpFC6e
 iBOqN0lKtWRstTaa5mHu8OTca+F2SISxPRN2CZJ0jhCcg8SjjwQl7MkcMIDcSRCdA1JbcJ6e
 b8uWJjxBkPkhjVeL6zNbVwg2XwqUuGLETQ9v0=
X-IronPort-AV: E=Sophos;i="5.83,313,1616472000"; 
   d="scan'208";a="47354412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnvPwk6hH/JdnMxYA1wt8MhYMQxe7ihTp5c8omXrXOMPpHa9ViWaSXanPoK+zDhKmWCSxeqQkRWhMIsM71IlOwanSlnW4TXPvQr0LudtUuav+2zKXDdOWBUSS0okG5Epm6OskBWRVTr33DGn4EBLYpyYS6T4AsA918zb7EsxQf6NFuWxgE6GMCsJHz9neSKhfL/LXtoZOmEQB8QIpxPePO751JoAmfs0qkExrojcIwPdSKA/9wMF3mnxxh23WI090B1c2hIgOo7/bT/EPX/eINUoq2zKgu+niVAslf1S644nbeOTfrGiNOTAz27FtF+lIc+qtdh+slLyJVtN5phX8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wf6RvJkTbeOhCP6B745KER9GHhknPb8hrfHAWHomBk=;
 b=K2OvDO5Y1yq+BRjJ/GypNSA1LPywxShqxW30IeQYmcPQ5v7f6/BvvYukmAvdWuH7mDZbV4c6RsUS6S2PR0Cjc6U2l1Qg6q6pT+PUuP6EO/L4wR2aKDNAomI16jKxo99ALgujs7mOCfBebw+wLY1kSIphFkH3ESMpC/Bq+WmnS7cRsGUm5kFRS3dmoR3HRckSC6GIR2WwMOdu8LisT3xx5RS9caimdKQIWyH/QGEZJZfDfTQZsRUaofIHI+ZBB5hLFSDjyzUZk8budHrOins5O0REfDHSd1g/FtKLkgLtA4Ngyf62rw5UdCP3/ZQs1NjbaeH/xsK5jq8IoWRKieAERQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wf6RvJkTbeOhCP6B745KER9GHhknPb8hrfHAWHomBk=;
 b=P9kXoGCtLhdSub4W3+B7Yl9HOkuAkrep8LzC9BGyiVHvRl48F5tzVJ47kbXDbQF5UbK02Sw3zG4D79PS+gP4jgY2c5hKHrMYc/4783/1h26OwN1Kdrg1mHNdmJwJkzU2lEXwl968CGVjNeOIxYI1MnQ1VUhRiMQXMsekKrn7nsg=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
CC: Ashley Weltz <aweltz@linuxfoundation.org>
Subject: JULY COMMUNITY CALL POSTPONED AND RESCHEDULED
Thread-Topic: JULY COMMUNITY CALL POSTPONED AND RESCHEDULED
Thread-Index: AQHXbl7rLw5NXgB2c0+Ak/Tp5fP82g==
Date: Thu, 1 Jul 2021 09:53:19 +0000
Message-ID: <3DF8B46A-308E-4992-A975-7F2E1737AD64@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 646c6f49-454a-432a-aae9-08d93c760e3b
x-ms-traffictypediagnostic: PH0PR03MB6300:
x-microsoft-antispam-prvs: <PH0PR03MB6300422E6BD121268946AD3A99009@PH0PR03MB6300.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: puG0lVI4rdZ3DRW+89T3Vhxv8QcYhNad3MZ72gC50KOaweiwEHCAsaFLaztLmYsywFioLAfX5L2CRDHJT+dmIzbH5Wnzc5T9G1UUzy3/NYye/sLzVB0eEjZwQ6DX1ko4MIGkfO/bqdJSMS+i/GeMJTab9NngCQkCUXRhqy9FK4Jce9HyI5DdEbtO4vXuOBQp+zwMiLyrY8zMvVtrz1nkKtK1RNeKFpOWLbTpGDa5cDpfdRVjfkKjYo33RIWpjQey3q4PAa1oTnuQG8N5UiE3tEbwbm0Fmy7mjTx5ncZQHHScpRVM02N8pMBpCDHov09mzZbffNrk0UG2eTTCJ2GeDdFcYjTkCm0n1lii/Wnv5PtthMtOPJxP/xmZViS87X6JsH8zY7O+McDjTRDluA4qVPQOFO5fT08RaoOErES9bGk5yXH07eyvghLIBQrKyxJxYvWL2HZgOFMMqRDJ5BIpc6ZaZTp1b3pPDONzz5S2ivY9Gm+vuyw3BmkwWFTAk4eXBqhaGjy4MsrkzfKsWNKKTey1Czcm7AONj4fcUD3zqbbs1cos2lCetHwIYU/acWyruOOTLUBoKo6it4lP7bRJ+HxM3DFN20fcSeac/phQMXwk9KPTa5Tt/W6KcakJihebWLNHGIg41jQrvPLFORO6kkKHXfMnWPI/iuY0Ph7yP+jHfgbcR0igWWvvv01r72yvE3pspzZ1FYWUWtZ+mqEYrg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(64756008)(66946007)(6486002)(6506007)(66556008)(2616005)(2906002)(66446008)(66476007)(36756003)(8676002)(5660300002)(478600001)(26005)(6916009)(91956017)(6512007)(186003)(86362001)(71200400001)(33656002)(8936002)(76116006)(316002)(4326008)(122000001)(38100700002)(83380400001)(4744005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVBFeDRERWNlZHBMR014WTdRSjVUTjkrSnh5cEc5QmlLWXpUa2JCRDN6dW5W?=
 =?utf-8?B?QjUzMlllZnNub3ZkTTd2dWE3aTlnRHdqdXc4eHlUY1g4YXRra2JZdFZqWkZr?=
 =?utf-8?B?NEdZOUdPWmFaYms1QkttblhPaFVIV3Vvc2NTRzRiV2wvdWpIVm9NOS9CV28z?=
 =?utf-8?B?R05Rb3RNa2hDWURGa3BWRUFmQmRtK0l1ZjltRGIzM2FuMlpYZzNSSXY1ckhH?=
 =?utf-8?B?cWpnWEhPcUE0ZDk1UDhHOWVxK3Z6dDRTbTJ2MXZCNDdIU0FRa3RIWnRUSkdh?=
 =?utf-8?B?aEJzcTliN0crUG5nMVQrdDVFTkRyNzJNeW5INkdaZXZXc0QvQnVIS2VxUml5?=
 =?utf-8?B?SWo1WjFpMmZaYXFsWTBqLzNWMjVPaVFBSXo2V3VuUytpa1gzMExiN01YYlJh?=
 =?utf-8?B?eGsxYUhBeUFXV2drSW8vSEVPbk9kYzVnSjJ4Nm5USjFTWjFwOURFWlRDSFl4?=
 =?utf-8?B?NHM3U3VJQ1liV3BwdWlaOTJ2dUZHSjdFWjhZWVExdzkxeTB4Y3pSZzk4TlBx?=
 =?utf-8?B?RTVuUG5jeis2TnErYWtLS29MaFc3bWErbWNxa3JOK2VRZGgvQ3E3TWxEcS9p?=
 =?utf-8?B?KzlaMEY2NkhFRmltbm9ZZ0ppSTExWU9EeVdDYzI0b3RRVjhQdnlaYitlVkRP?=
 =?utf-8?B?RHpDalM2ajc0czJuUkpnSnNkVndYRXNZcU5WWDhYL1RrZjBOVW5qTVhDVEhy?=
 =?utf-8?B?MHBrb3dTQ0VuUkdqZUFQaVNEbjNMQWJTOHhNZkZKNC96cmRjSWxGV1UvSXli?=
 =?utf-8?B?Wm5qekVrY2RURkRUK2x1SzFMM1JCNVFoRDV3ZDh3NGkxWGZEZnhaM1BPWHBl?=
 =?utf-8?B?b2FwdmVOa2JCRmI3MFM4a1VnVGd2NkwwdEdILzc1Umt2S2FQS0hHbDExLzcx?=
 =?utf-8?B?b3hOQXBlMU0yUUtramFQbDhycEN3Vm9aZjJlS2Z1OGJVYkMzZG5waUdPOGp5?=
 =?utf-8?B?Zm81Uno3S3JRbTgvRjNrWnpieG9uZ051dEZ5eHFSeTQyMDNMMXdId0djU0tC?=
 =?utf-8?B?UUZxekthRVdqQm1SWWM0RWJMMGo2YkswY25XbURYN3JvZng1WjlkM0ZOUDRo?=
 =?utf-8?B?ZTUvTWZFK3BEYUxCbExOM20rVUhseVkyckhzY1c1WlNqazJERm1pbkxGRkxy?=
 =?utf-8?B?ZWswcll6MXdjNVZyTWNwSjhVN3h0R2xKelhxZnZGSkhhN1JJam9WaUdOWVBN?=
 =?utf-8?B?ZjdQNkR3c0VXMHh3MEphYVk1OEFxYjF2VkZ4K25JU2REVmZ3YkpsRjVYQWcx?=
 =?utf-8?B?eW1LVkdvNzJ6R1RHUVlTTVZFcm9MZExtU3hZd0o0Q0VVSC9takFIZVYvdkNw?=
 =?utf-8?B?QThvUnJBYnZLMzU3U09iUkV5VFhqTGsrS0hZTldNNnZIWVlzaUlCQXhqN3p4?=
 =?utf-8?B?Zll2Ly9uMlhab0M1bXVhK3dieFpOcklBZS82Yk81SHRqMzFLOWFNSXZzZVVj?=
 =?utf-8?B?U0JSRkhuS3pVTHBHTjhJUHhZdlNzMFhZR1dNb1B2OTJybEJtOExGcUsyL1FM?=
 =?utf-8?B?TGRySVVkc3pXbGUzVHh3YjlDNWpvN25IQkpudUtqSDFWeE80V29WNXlNUkxq?=
 =?utf-8?B?Mm8xdUwxbDFzQ2h2anFPT2hhUmNJWDdtS25CQkdDUDBkUUNLSWhIam1tRGZL?=
 =?utf-8?B?Q1l5N29NOVZENTZxbGVKT1krRkJWOXMrU1IxdHlDUXRqbG1VbWNSMVJzNkpC?=
 =?utf-8?B?L2REcDlrTmNKT1F4cXF3cGZWc1pIcVo2TGtwL0tpYkFad2liWkF4c0tUVHRP?=
 =?utf-8?Q?ldWZT+Qjcp5GOrp7+Xx5iHsWyflFQ1luZJvKVoK?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF9AC13DF2C83C4EA12904DA2535452F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 646c6f49-454a-432a-aae9-08d93c760e3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 09:53:19.1627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nt9IYMluKzasGroa65jAR3O6fiuTECanmEnPOGAEWHB3FTuB7Bxj9yRg1syPxiYoDUlDCtmfYbn0s4D1qZoe6cy2PF5flmD9uDEnGJWU7Zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6300
X-OriginatorOrg: citrix.com

U29ycnkgZXZlcnlvbmUgZm9yIG5vdCBpbmNsdWRpbmcgeGVuLWRldmVsIGluIHRoaXMgYW5ub3Vu
Y2VtZW50IGVhcmxpZXIuDQoNClRIRVJFIFdJTEwgQkUgTk8gQ09NTVVOSVRZIENBTEwgVE9EQVku
ICBXZSB3aWxsIGhhdmUgdGhlIGNhbGwgbmV4dCB3ZWVrLCBhdCBhIHRpbWUgdG8gYmUgYW5ub3Vu
Y2VkIGxhdGVyIHRvZGF5Lg0KDQpXZSBhcmUgaW4gdGhlIHByb2Nlc3Mgb2YgZmluZGluZyBhIG5l
dyB0aW1lIChhIHN1cnZleSB3YXMgYWxyZWFkeSBzZW50IG91dCB0byBwZW9wbGUgb24gdGhlIGNv
bW11bml0eSBjYWxsIHNpZ24tdXAgbGlzdCksIHNvIHdlIGRlY2lkZWQgdG8gcHVzaCB0aGUgY2Fs
bCBiYWNrIG9uZSB3ZWVrLiAgSSBzZW50IGFuIGVtYWlsIHRvIHRoZSBjb21tdW5pdHkgY2FsbCBz
aWduLXVwIGxpc3QgbGFzdCB3ZWVrLCBidXQgZm9yZ290IHRvIGNjIHhlbi1kZXZlbDsgc29ycnkg
YWJvdXQgdGhhdC4NCg0KSeKAmWxsIHNlbmQgYW4gYW5ub3VuY2VtZW50IGZvciB0aGUgbmV3IHRp
bWUsIGFuZCBhIGxpbmsgdG8gdGhlIGFnZW5kYSwgbGF0ZXIgdG9kYXkuDQoNClBlYWNlLA0KIC1H
ZW9yZ2U=

