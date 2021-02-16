Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D9431C983
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 12:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85494.160313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lByKv-0002vy-5m; Tue, 16 Feb 2021 11:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85494.160313; Tue, 16 Feb 2021 11:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lByKv-0002va-1h; Tue, 16 Feb 2021 11:16:09 +0000
Received: by outflank-mailman (input) for mailman id 85494;
 Tue, 16 Feb 2021 11:16:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFEE=HS=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lByKs-0002vS-Qi
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 11:16:06 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcb7f0d3-c7d4-4fc2-9ca2-0dfccb8eaa70;
 Tue, 16 Feb 2021 11:16:05 +0000 (UTC)
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
X-Inumbo-ID: dcb7f0d3-c7d4-4fc2-9ca2-0dfccb8eaa70
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613474165;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=prvIo8r5uqxUuSL4WmFE54fDoRX4oi5o+88Tm/eLTe4=;
  b=YUutq58Uqm10RqdJ1IWFZehSNcL1Lk9nYAtm1FsPZ1kuRJqBDyugCL0W
   PG4CQTo5vfDnT4zy1qyS5np7QbL+AvzT6aXCkT5HktYy9/ol8BcWWxR0e
   8k+I/PSF43cSx8Ttu7wf3z5MpgZcQwUEYOdFh6Ri+kShd07MPb5XooBBS
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /aE+jzHXvAR33K7j797FKAtzpQ9lfZHI5n1HcDaxHdW9uXEIfJydkO/W3frGD2SFadT07i1ypr
 sFPEeCNshELYrsEm1Uqyuh9HCrm49jlRVZ91TJYH9HO6Vzd2Gi9mdqYGXAQ5hAdGl2alAmpbB5
 0zqFBVZTLfeXiu+szdqDEFhNVSlQbdVF37SRjWbjPtyFApaRGjzpizEJz+nOJ08urGXJJX3Qi6
 8lbopTlC0+AXxzNyU8+N8Yj7eOHDY6/1MWk9q62m6TUzQUQ6VS4Lk3tHXSw6Am6aKPidOMl/ji
 VFA=
X-SBRS: 5.2
X-MesageID: 38678394
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,183,1610427600"; 
   d="scan'208";a="38678394"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdomDXxFi8kvUxmcHfcsQDrxi/xm/+6z4qWmug5PvaFReefQo6ynpUKAFZGfIyYOSXLT+sUCWaDs/7tFRFQq1ZbipUD0/vEmlWG5CeTwfgQwbPeFm0zOVkDSwVT6IM9+TLtOvrhcAwYAKu7YqlOC5gSRhImOhRlvPxm6OB6Lwg6sBm4OQdYP1/cAbbLcgswA+7CipfPlabH0g/VsAuPPQQwuvHk6GmhgaSTFHIdmQi2sGvcrAfB9xD7ekr+hUG7nCNuw6WaHFUlJ3+F5RoCZhsCT070pdChydphHQnHHz0pmQa3694M3mjwp7CkwgN3JSF9/9DNEMstaBTRzkMry1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prvIo8r5uqxUuSL4WmFE54fDoRX4oi5o+88Tm/eLTe4=;
 b=nUU2RTzeUJlvgjVDg+zIyC0mGL+ba0+qAf395u8eoQT7l8bgkaUWF5mszbXFbq9FQ1/0Y818+SbWt+FziMQTPajXPxvldtRTETm54cg02QhudLUYFmUZhyGu+Yie6zKEuetrRtiNNiRDfedoX1tPaXG7QDc84nj6+MN2FZCoSukAEY/wBe4lBaYCCpOyo4po3QMDyuV2PtAp3As5qiPgSeon7jxnxIEoDW8gd3SykfD68nonAtTHsayaYt4SwJe9yRr6vWEJOIM9DXHm1C6EgCtdSVywHgNKogguzMFj7tcyAYH/SonBAy7nb/TCZMTFVt/RE05ZkrSVBtKufQmlyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prvIo8r5uqxUuSL4WmFE54fDoRX4oi5o+88Tm/eLTe4=;
 b=JIHHyNAily+5l45JKbySor+Z43B4PVofduFkJvPAa6TqPQ6/9VCnEtNXrD18lf90eqNgymsr7fpSDPXLxrAFWZgykrdPFRVNdswQwDF0MZmvuyv8D30d3XK4aBgd/WcEKpoXkrwVzHsjWgu9wIo7LqteDa1F0Bb2GlM2lkriFR8=
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH DO NOT APPLY] docs: Document allocator properties and the
 rubric for using them
Thread-Topic: [PATCH DO NOT APPLY] docs: Document allocator properties and the
 rubric for using them
Thread-Index: AQHXBE6IzoDpW0Psi0SLnVWLvJvx9Kpam+MAgAAFtoA=
Date: Tue, 16 Feb 2021 11:16:02 +0000
Message-ID: <E820CE9D-9671-4ED3-872E-3AECE21505AC@citrix.com>
References: <20210216102839.1801667-1-george.dunlap@citrix.com>
 <c5eb64fc-a90b-6e28-bb0d-075e3a870299@xen.org>
In-Reply-To: <c5eb64fc-a90b-6e28-bb0d-075e3a870299@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b7cbc34-48c9-4582-2874-08d8d26c3e97
x-ms-traffictypediagnostic: PH0PR03MB5782:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB578214A3C6E2A94554A40A5499879@PH0PR03MB5782.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PY5+gn0I4+oN50Dy8Ab8mOZ01s0T5Mk+HSSRM8SRtHR9PDKxZ0PFne2bJCNoNXQA/cs1h/mhdxtIwnnuDWoZ/LawNi9KTwKN7EhrATpJlop+JVH2kXgb/8IWRW0MFEb37Q6jaIRpA82F0u/gT7ObBJRTZDfrwqxO6BchOK6ZqdZ3uHMQf1CAT3aDhOhL2I8IQFQNewwkejiTRSscbsPXbbiB1YNO00zfe5dOp9IhQRiytjYWKVZz9q0pifOVLsKzB9Y3kuqAgX601zYJGRN1FiFK2Z7eLy5dL55LpE+55eu9wpskHY+oV3qDGhehVBmy/m3sVT9ConuZaOKqslg549LcRQnW6j6sIatFy5c+S0z/6f2Tjw9RItEOjoNO6Qk1H1PQ1ScAP3D1h5sKLwJ3YRr642UkYyIfe5TQf+oJXY8sxvH4Q/KCmFmXImNMXUqwNOoTfxXD/PxjbA+U9PJ6yr/oCYrZIypwECUJQXrOG2sMKYqXP4851X6evdv0u8ggqDrZgPblOZn9pil/qpu39638sm1cxgukifpJwcU8AqYSB6MdEyJ53nnUorf95nrGxWUPuG1rE6jpu6w6LXc5zA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(186003)(36756003)(54906003)(91956017)(71200400001)(6506007)(6916009)(26005)(8676002)(478600001)(53546011)(66446008)(64756008)(66476007)(33656002)(66556008)(2616005)(6512007)(66946007)(83380400001)(316002)(86362001)(8936002)(76116006)(6486002)(2906002)(5660300002)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZDlGSXVhdUVrdHVvWmtoZUhWb2luMzFmQi9HaEt5LzMxTU56Z2h0WFArdzJZ?=
 =?utf-8?B?Q2p6d3BoSGlOUWFpOVBxTWhmYmpiWTl5OC9pUnJRTFdnY0N2cUtWV3JLWDdC?=
 =?utf-8?B?dktiY200ODBRY3NzTVdNV05rZ0ZhODZuaUZnM2ZhSUFnUG55d0djQUhBTGZG?=
 =?utf-8?B?SGlPcVRMWTdmU3NrZ2o5RW5aWElTRWorY0EvSVRpNnBWNHh2TWN2d1BkNkNK?=
 =?utf-8?B?OWRuS2RWZkpTZDJTaDRObUYxSzNXTjcxN05aRTIvS2ZIVEZCbzdaTm02LzVP?=
 =?utf-8?B?azcrMWQyWTV1L1ZlQVNRTDJuTmYxSmxJZTB5c0lsZnlScE5mL3pKcFY4M05M?=
 =?utf-8?B?aWdWQ3czSFdOcWFCc2l3L2RHMERQTnpCU2w1MUhoUnI2ekNnVzJMTFdGYllU?=
 =?utf-8?B?YVRmYkNNazF2YUVHUFhyUGZsVVpvTWkxZ2tsSEY4SXZyM0tqMm94MEhlK3pm?=
 =?utf-8?B?L1ZTY2JkYXYyY0dDWVlJNEJ5TFRaNEtUUHFrczQ2QnA0clVscHBKQWp4ZGps?=
 =?utf-8?B?NVBNWmJzYzZnWFFjcHp2WkNaMlh0VGIvb2pkZDMvMk5vWkQvUE9zbWpWdUJh?=
 =?utf-8?B?UHpJNlNUalk5aGhSbmVhbXBnNG9EUTZMV1R1RzlPVGFqRythVlpUS0dnYnBh?=
 =?utf-8?B?c21Ya2hwbnpreStvNkVHR3k3Yi9nMDIxZWE3SlBzVFllVWE5VXhpdTJFZENn?=
 =?utf-8?B?eTJOWk9LbDZJQ01wTFU5em8rdytKRnUvUHd3ZUZJczk1NGhETGoza29lQ2Qy?=
 =?utf-8?B?b3BzaHJHRWkvRmVwR3Avc2lNTnZDZFBrQ1VWRVFVd1VXZzhZeVNqa1UxaTA3?=
 =?utf-8?B?QjNta0ppUzZhUUdacml3YVV0NVBIL3FjU3lSS2xuZVV4eXZlT0JwUUVSaVNT?=
 =?utf-8?B?bnoxM1lRbTFnRmJ4YWJ1cGFoNHpYRkxOalVwczhReStiK1kvRno0VHRwdVJ0?=
 =?utf-8?B?OFhvdXdkWWJ2TFUxMDBuT0hzNGNjRGFyM2RVWTlXL21iV29vK3d4YkRIejAy?=
 =?utf-8?B?Mkh3emtWOXJWRlBOR2IrR0czWUtSTjgrWm5pSk9pRFN3YWMxNUl4TDlBODB2?=
 =?utf-8?B?c1MxSzUwakNiUTBkVHZnbENOOURyMzhUYWdlMDJQWDBUa0lBelAwNmZ3OHU2?=
 =?utf-8?B?eU15dkI1akxuc0Nla05QOG9LUUpVVUxWbTBxZ3NhVmJJeE5iL25RYVU2UThv?=
 =?utf-8?B?cHFvS1BtNGJCa2NjMkpZdkRPT1k1NVBIMW1GczJlNkF3R3NpWWpiQktaYnkv?=
 =?utf-8?B?aVBLeUExUXZSdnFRUnNtOUVOZTZsUGtDVEoyUTIwY2lhRTVPNFR4NWpNT1M2?=
 =?utf-8?B?ZlVpYlhnUVpONGx0aGx4MTM1NHdaUHBNMyt0Z3hZWkpscWsrNGM0V24xT29x?=
 =?utf-8?B?dll6NUpNeVp4VXpFbTJVeUQyNW9lVWJPNHduOFhYLzQ4My9zRUVDSjVra1di?=
 =?utf-8?B?alFCUGNTcGg5YTExR0IvbE5meTIvR25ySjQxdFVOMkgra1NpcC9RMVFVbyth?=
 =?utf-8?B?SUNSaU95LytaelAzTEhaeDRjdWlSdCtBNFRsbGowKy9uTzVzN2NQVEdGNFVa?=
 =?utf-8?B?aFBjbWQvSzYrdEsxcnIrdE9oMGhnQjF1R1N3VGFNaFloTU9MYzdCQ2JVdjdH?=
 =?utf-8?B?Ny92MjlKVWtPcmtRRmZ2ZXFBSFMzZmdBTEpuMUY1RU8xdUlEMzA0TWV6UEhG?=
 =?utf-8?B?OCs3NkdhcGlpakplallhUmp6ZmpPbG9PN1haNzhIUGprUlNnVmhoakRrWHVr?=
 =?utf-8?B?VUhvUXNGdEQ1MWtrZ2pJZ2p2Q0wzcXFIeVlXdXRQOFU2ck8waitWU253N216?=
 =?utf-8?B?eVhFbDhqNjBQeUxSUXZBZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AD3F8BABA54EE44AE4257E8BD110A92@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7cbc34-48c9-4582-2874-08d8d26c3e97
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2021 11:16:02.0135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 354THSTQfW2IzJUlxHBuGHoffeauNm/sAIq0rrdynuNCXsG0w74KX3NguOjWw+EFigwtWp9swTI/NEiEnnBKBMNh1yZRO55dSnwOA7iV6Ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5782
X-OriginatorOrg: citrix.com

DQoNCj4gT24gRmViIDE2LCAyMDIxLCBhdCAxMDo1NSBBTSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBHZW9yZ2UsDQo+IA0KPiBPbiAxNi8wMi8yMDIxIDEw
OjI4LCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4gRG9jdW1lbnQgdGhlIHByb3BlcnRpZXMgb2Yg
dGhlIHZhcmlvdXMgYWxsb2NhdG9ycyBhbmQgbGF5IG91dCBhIGNsZWFyDQo+PiBydWJyaWMgZm9y
IHdoZW4gdG8gdXNlIGVhY2guDQo+PiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+IFRoaXMgZG9jIGlzIG15IHVuZGVyc3Rh
bmRpbmcgb2YgdGhlIHByb3BlcnRpZXMgb2YgdGhlIGN1cnJlbnQNCj4+IGFsbG9jYXRvcnMgKGFs
bG9jX3hlbmhlYXBfcGFnZXMsIHhtYWxsb2MsIGFuZCB2bWFsbG9jKSwgYW5kIG9mIEphbidzDQo+
PiBwcm9wb3NlZCBuZXcgd3JhcHBlciwgeHZtYWxsb2MuDQo+PiB4bWFsbG9jLCB2bWFsbG9jLCBh
bmQgeHZtYWxsb2Mgd2VyZSBkZXNpZ25lZCBtb3JlIG9yIGxlc3MgdG8gbWlycm9yDQo+PiBzaW1p
bGFyIGZ1bmN0aW9ucyBpbiBMaW51eCAoa21hbGxvYywgdm1hbGxvYywgYW5kIGt2bWFsbG9jDQo+
PiByZXNwZWN0aXZlbHkpLg0KPj4gQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+DQo+PiBDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gQ0M6
IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+PiBDQzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPj4gQ0M6IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+DQo+PiAtLS0NCj4+ICAuLi4vbWVtb3J5LWFsbG9jYXRpb24tZnVuY3Rp
b25zLnJzdCAgICAgICAgICAgfCAxMTggKysrKysrKysrKysrKysrKysrDQo+PiAgMSBmaWxlIGNo
YW5nZWQsIDExOCBpbnNlcnRpb25zKCspDQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3MvaHlw
ZXJ2aXNvci1ndWlkZS9tZW1vcnktYWxsb2NhdGlvbi1mdW5jdGlvbnMucnN0DQo+PiBkaWZmIC0t
Z2l0IGEvZG9jcy9oeXBlcnZpc29yLWd1aWRlL21lbW9yeS1hbGxvY2F0aW9uLWZ1bmN0aW9ucy5y
c3QgYi9kb2NzL2h5cGVydmlzb3ItZ3VpZGUvbWVtb3J5LWFsbG9jYXRpb24tZnVuY3Rpb25zLnJz
dA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAuLjE1YWEyYTFh
NjUNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2RvY3MvaHlwZXJ2aXNvci1ndWlkZS9tZW1v
cnktYWxsb2NhdGlvbi1mdW5jdGlvbnMucnN0DQo+PiBAQCAtMCwwICsxLDExOCBAQA0KPj4gKy4u
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBDQy1CWS00LjANCj4+ICsNCj4+ICtYZW5oZWFwIG1l
bW9yeSBhbGxvY2F0aW9uIGZ1bmN0aW9ucw0KPj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09DQo+PiArDQo+PiArSW4gZ2VuZXJhbCBYZW4gY29udGFpbnMgdHdvIHBvb2xzIChv
ciAiaGVhcHMiKSBvZiBtZW1vcnk6IHRoZSAqeGVuDQo+PiAraGVhcCogYW5kIHRoZSAqZG9tIGhl
YXAqLiAgUGxlYXNlIHNlZSB0aGUgY29tbWVudCBhdCB0aGUgdG9wIG9mDQo+PiArYGB4ZW4vY29t
bW9uL3BhZ2VfYWxsb2MuY2BgIGZvciB0aGUgY2Fub25pY2FsIGV4cGxhbmF0aW9uLg0KPj4gKw0K
Pj4gK1RoaXMgZG9jdW1lbnQgZGVzY3JpYmVzIHRoZSB2YXJpb3VzIGZ1bmN0aW9ucyBhdmFpbGFi
bGUgdG8gYWxsb2NhdGUNCj4+ICttZW1vcnkgZnJvbSB0aGUgeGVuIGhlYXA6IHRoZWlyIHByb3Bl
cnRpZXMgYW5kIHJ1bGVzIGZvciB3aGVuIHRoZXkgc2hvdWxkIGJlDQo+PiArdXNlZC4NCj4+ICsN
Cj4+ICsNCj4+ICtUTERSIGd1aWRlbGluZXMNCj4+ICstLS0tLS0tLS0tLS0tLS0NCj4+ICsNCj4+
ICsqIEJ5IGRlZmF1bHQsIGBgeHZtYWxsb2NgYCAob3IgaXRzIGhlbHBlciBjb2duYXRlcykgc2hv
dWxkIGJlIHVzZWQNCj4+ICsgIHVubGVzcyB5b3Uga25vdyB5b3UgaGF2ZSBzcGVjaWZpYyBwcm9w
ZXJ0aWVzIHRoYXQgbmVlZCB0byBiZSBtZXQuDQo+PiArDQo+PiArKiBJZiB5b3UgbmVlZCBtZW1v
cnkgd2hpY2ggbmVlZHMgdG8gYmUgcGh5c2ljYWxseSBjb250aWd1b3VzLCBhbmQgbWF5DQo+PiAr
ICBiZSBsYXJnZXIgdGhhbiBgYFBBR0VfU0laRWBgLi4uDQo+PiArDQo+PiArICAtIC4uLmFuZCBp
cyBvcmRlciAyLCB1c2UgYGBhbGxvY194ZW5oZWFwX3BhZ2VzYGAuDQo+PiArDQo+PiArICAtIC4u
LmFuZCBpcyBub3Qgb3JkZXIgMiwgdXNlIGBgeG1hbGxvY2BgIChvciBpdHMgaGVscGVyIGNvZ25h
dGVzKS4uDQo+PiArDQo+PiArKiBJZiB5b3UgZG9uJ3QgbmVlZCBtZW1vcnkgdG8gYmUgcGh5c2lj
YWxseSBjb250aWd1b3VzLCBhbmQga25vdyB0aGUNCj4+ICsgIGFsbG9jYXRpb24gd2lsbCBhbHdh
eXMgYmUgbGFyZ2VyIHRoYW4gYGBQQUdFX1NJWkVgYCwgeW91IG1heSB1c2UNCj4+ICsgIGBgdm1h
bGxvY2BgIChvciBvbmUgb2YgaXRzIGhlbHBlciBjb2duYXRlcykuDQo+PiArDQo+PiArKiBJZiB5
b3Uga25vdyB0aGF0IGFsbG9jYXRpb24gd2lsbCBhbHdheXMgYmUgbGVzcyB0aGFuIGBgUEFHRV9T
SVpFYGAsDQo+PiArICB5b3UgbWF5IHVzZSBgYHhtYWxsb2NgYC4NCj4gDQo+IEFGQUlDVCwgdGhl
IGRldGVybWluaW5nIGZhY3RvciBpcyBQQUdFX1NJWkUuIFRoaXMgaXMgYSBzaW5nbGUgaXMgYSBz
aW5nbGUgdmFsdWUgb24geDg2IChlLmcuIDRLQikgYnV0IG9uIG90aGVyIGFyY2hpdGVjdHVyZSB0
aGlzIG1heSBiZSBtdWx0aXBsZSB2YWx1ZXMuDQo+IA0KPiBGb3IgaW5zdGFuY2UsIG9uIEFybSwg
dGhpcyBjb3VsZCBiZSA0S0IsIDE2S0IsIDY0S0IgKG5vdGUgdGhhdCBvbmx5IHRoZSBmb3JtZXIg
aXMgc28gZmFyIHN1cHBvcnRlZCBvbiBYZW4pLg0KPiANCj4gRm9yIEFybSBhbmQgY29tbW9uIGNv
ZGUsIGl0IGZlZWxzIHRvIG1lIHdlIGNhbid0IG1ha2UgYSBjbGVhciBkZWNpc2lvbiBiYXNlZCBv
biBQQUdFX1NJWkUuIEluc3RlYWQsIEkgY29udGludWUgdG8gdGhpbmsgdGhhdCB0aGUgZGVjaXNp
b24gc2hvdWxkIG9ubHkgYmUgYmFzZWQgb24gcGh5c2ljYWwgdnMgdmlydHVhbGx5IGNvbnRpZ3Vv
dXMuDQo+IA0KPiBXZSBjYW4gdGhlbiBhZGQgZnVydGhlciBydWxlcyBmb3IgeDg2IHNwZWNpZmlj
IGNvZGUgaWYgdGhlIG1haW50YWluZXJzIHdhbnQuDQoNClNvcnJ5IG15IHNlY29uZCBtYWlsIHdh
cyBzb21ld2hhdCBkZWxheWVkIOKAlCBteSBpbnRlbnQgd2FzOiAxKSBwb3N0IHRoZSBkb2N1bWVu
dCBJ4oCZZCBhZ3JlZWQgdG8gd3JpdGUsIDIpIHNheSB3aHkgSSB0aGluayB0aGUgcHJvcG9zYWwg
aXMgYSBiYWQgaWRlYS4gOi0pDQoNClJlIHBhZ2Ugc2l6ZSDigJQgdGhlIHZhc3QgbWFqb3JpdHkg
b2YgdGltZSB3ZeKAmXJlIHRhbGtpbmcg4oCca25vd2luZ+KAnSB0aGF0IHRoZSBzaXplIGlzIGxl
c3MgdGhhbiA0ay4gIElmIHdl4oCZcmUgY29uZmlkZW50IHRoYXQgbm8gYXJjaGl0ZWN0dXJlIHdp
bGwgZXZlciBoYXZlIGEgcGFnZSBzaXplIGxlc3MgdGhhbiA0aywgdGhlbiB3ZSBrbm93IHRoYXQg
YWxsIGFsbG9jYXRpb25zIGxlc3MgdGhhbiA0ayB3aWxsIGFsd2F5cyBiZSBsZXNzIHRoYW4gUEFH
RV9TSVpFLiAgT2J2aW91c2x5IGxhcmdlciBwYWdlIHNpemVzIHRoZW4gYmVjb21lcyBhbiBpc3N1
ZS4NCg0KQnV0IGluIGFueSBjYXNlIOKAlCB1bmxlc3Mgd2UgaGF2ZSBCVUdfT04oc2l6ZSA+IFBB
R0VfU0laRSksIHdl4oCZcmUgZ29pbmcgdG8gaGF2ZSB0byBoYXZlIGEgZmFsbGJhY2ssIHdoaWNo
IGlzIGdvaW5nIHRvIGNvc3Qgb25lIHByZWNpb3VzIGNvbmRpdGlvbmFsLCBtYWtpbmcgdGhlIHdo
b2xlIGV4ZXJjaXNlIHBvaW50bGVzcy4NCg0KIC1HZW9yZ2U=

