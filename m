Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A33292F9BEE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 10:40:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69514.124453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1R1G-0007jt-3Y; Mon, 18 Jan 2021 09:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69514.124453; Mon, 18 Jan 2021 09:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1R1G-0007jW-0W; Mon, 18 Jan 2021 09:40:18 +0000
Received: by outflank-mailman (input) for mailman id 69514;
 Mon, 18 Jan 2021 09:40:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LVP7=GV=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l1R1E-0007jO-9M
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 09:40:16 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be8441a2-ac0d-488c-90a1-5fbf255a8fef;
 Mon, 18 Jan 2021 09:40:15 +0000 (UTC)
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
X-Inumbo-ID: be8441a2-ac0d-488c-90a1-5fbf255a8fef
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610962815;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8cAll7XNGzC+FWFUjcHlW8QTt0c0mzLrGlD1NXM8+us=;
  b=LOhHDL7ZMw9n9cFl8vH2NJMhsutpxyfOq4TjLrHqcvhG0zaOf2QG6wRg
   Jn4dy2fBLi4OqNcY+2sR6xVxfD4ILh3PscYNcuroe+6dwN+uv5lKFRmDT
   h8QkkKfh0uefpvDPY1uF1WIJCe70gYHZejHXSDfv+z3RKQDegi1wtaG+2
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: o3KYpFMvEERYDB3b2b7oVG94oaEN6b0ygj/0xKK1bwHj3plCLDTLwUQZb44bcnFMl3Piv81hbT
 UqGgs7HD39tKMdolOZaqM8lmRfAAjAVQMpS9Ggq9i20l3rdE2Ubr5nHzNMAiT9kWYFt5cxnmwF
 iddw8/pfbmUO9TLsYU6Rj30P/mZB+hmnUp8pfyUWs9bNoI/xfkzqNUjr6Q6VvEIMRKVl+g0/CF
 Ey1CoTq74gP3RmShOy5FYCawzIfV4IiRFkpLR5vToX6tMBmrnjVAO4XcpQIN+yMWTuoLWaJERu
 PZY=
X-SBRS: 5.2
X-MesageID: 35505439
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35505439"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/bY6VqprAowOjef1C+fZ+ozKHCTBGT8rnQ9Ii4vhK5SkJ5Oz7swTE8PlGV0Ubzn8xLcy5cd/l1n55lJJXJT9gIvERaBdhxxQ4Nvi/c4wZ+V6p0S/nyHsVDT9Eeq6Ejg3n4djU4xmwwOkVA0M/ZYn9SbLEXlpn7mLhZT49be7c+BeUPg72iHyL+4Scwn5PfWm/COyR+kt1mVf+V2NE0z0R1KrsF9tk843qTgBkAcyf/nIEiRB4EoH5o3L3BEKOnqMrM5NYunqKYxjwJ6ivFsodAxsr5lyeERCAELlZNXYxB+gSzwGR+H15TeK5OWHoKtUMLDWbwKCEPlt5hkS5NlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cAll7XNGzC+FWFUjcHlW8QTt0c0mzLrGlD1NXM8+us=;
 b=gnLwiKSfTqsMdGh41UUx6BV0ejS/NA/JUDRE9ub4vlOSofwyU9EUgMO1tYVcT+SI/C4XhViS9dfNVOTZVXUyMtcGM0E0slQyAo7a9xuur9TETqU+G+l+Ooy2cmLiTEDzBxIlPg7qQg5IYM6me019Hzc4mTji26XethKYb55ts6GNklG+CVMUwecj46OT6mbLdk2qGwkdQH65HutNx49Cao0zwi5MkjobyH+SBS7eGM/B0hSDDyPiCA1igEEFVdXpLMSvd1eLB3nn6fj54hmzV/M0U+hnNxBgAuRugx3gJ0hLDiknouizYVTaX5136+q/1dY8dWLXMgU6BKrG9kitqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cAll7XNGzC+FWFUjcHlW8QTt0c0mzLrGlD1NXM8+us=;
 b=FvCS/1Xd2iT2XLGBdMo5EM2VJ1MP7NN5/z3sbS+Nknvy0uvMNBFzSnEdCQuAyVGq/dKoFHMB6VjZeBvAZ02Cs1gZeiB3aNr4wi2vX3F5ll+dRtFOFvRFiDk2aycXxi89izQmqn8twNJiZMSXg8hlC+PlLSJRkWoLrsCgR0/CmnM=
From: Edwin Torok <edvin.torok@citrix.com>
To: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org"
	<julien@xen.org>, "wl@xen.org" <wl@xen.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"jgrall@amazon.com" <jgrall@amazon.com>, George Dunlap
	<George.Dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH v2 1/8] tools/xenstore: add live update command to
 xenstore-control
Thread-Topic: [PATCH v2 1/8] tools/xenstore: add live update command to
 xenstore-control
Thread-Index: AQHW7W6reh9Sy0G7+UqP/AM+Pn2A/aotIPUA
Date: Mon, 18 Jan 2021 09:40:10 +0000
Message-ID: <82d8c2964aa91bdc571af7832d1f92934ad803f9.camel@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
	 <89d027f191af20c39dbf9d37dfcd602c2669511d.1610748224.git.edvin.torok@citrix.com>
	 <31626f43-150d-327c-8ca2-e7fd184af678@suse.com>
In-Reply-To: <31626f43-150d-327c-8ca2-e7fd184af678@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.38.1-1 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d51245c-f56e-40bd-1456-08d8bb950c80
x-ms-traffictypediagnostic: SJ0PR03MB5600:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR03MB5600147EC5C2D940572B1BBA9BA40@SJ0PR03MB5600.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TN8/iuCUUblY4afbtWZELb/dXhM5SFUqo9dg78FJiG86OwKRh8CrPE3QWXd6C5n/7QNtmgR56Ei7NV/TrHl3GKY9VDzezhe7sVkYsEq7iSgN/jKgObXm4mLxBQ99uO130qxyF7qrC0QpoYdkqD4lD/J9EDvRCwHB9faBFcydIDGF04cLXgWvFNggggSNuIydxMR4meuOX6NMaUn9SOzUDDZi6nMnKQyI/Upnr7p34fHEOjuKOE2iqUN6CqUWS6v49TtyIVdu2HkYPVK4SEMiGxEdFvzCUPv4oocawMmUJUCWUXX6JKO0MvZW0rRNNzM9C3zlMWmQ72UI/CyOEOzdEmHZfJB2CR3NOQByFwQ4mqhELZr3JDX4Uh1qHZwJF2Z5FHXTdt9un8EaBcz/me2WnS4VnsxJ9b9vQw4LSwQHWEkThKLM9AdkYjNVQGpwtUvAd7Li/QF4X2b40E6ekKNlEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(396003)(366004)(376002)(76116006)(91956017)(2906002)(478600001)(86362001)(4326008)(966005)(8676002)(6506007)(5660300002)(6512007)(64756008)(66446008)(66556008)(15650500001)(66476007)(66946007)(53546011)(36756003)(54906003)(107886003)(316002)(110136005)(83380400001)(2616005)(66574015)(186003)(8936002)(26005)(71200400001)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?c3gvajRjeDRJcUJkc3FrdGVRV25yVk1RN2hhWDNpZjRXcjMyK2JHRjdkdmRm?=
 =?utf-8?B?b0RxQjJxUzVJUmxTZDBoSFI4NjJranB5eGZCN2cwbkR4QVVNbE1BMnpOS3Zy?=
 =?utf-8?B?UDNlN3UyVlp1SFNBNmVMODg0ZUVmelBscGtPNWdzWitOZzZVbTVnbldEZXIr?=
 =?utf-8?B?Qk9ES1BiMzlkVTFrQTZZK0pRTkZGY256RkVnZ0dXRm5KeVRMZzBxQlk2SFps?=
 =?utf-8?B?Ymh4eWtWbGtyWnNLUU5lRTdEWkQxdE1Xbnl2a2loUFo3S1U1L3IwRU9KaXY1?=
 =?utf-8?B?d2V6SWQyeDB6dHVSREFicmhjWGpyZk1aY2dWQmhZMGxmZnFKTHE3ZFBiV2xW?=
 =?utf-8?B?U2U2cWxxeXFYejVHY1hyV3lGZktsRGcrKy8zTXgrRlJOVFhJOUo1Szc4WERO?=
 =?utf-8?B?OU82eWQ3eEM0VURTenN4NDdjOUZyVTQvOFlGcURZN3M3aVhvbk81aTJGanU5?=
 =?utf-8?B?bFdsNFlZSzg1dVJkWEVzaTVVSm9NSTZqRVc2YlhiSEFYdlRvQ1JjMk5tQ2VX?=
 =?utf-8?B?SmdLMHRNTXRIbGVhUzVDYUVqbW5rZ1dLd3NrUzNIcFBOM0l6QlRhV1Back5Q?=
 =?utf-8?B?TzZHVE4rbGs5YTRsZkh4R1VqWmZPOGw1NER1U0hpVnp0OERPQ0ZVS3JhRzlK?=
 =?utf-8?B?NnZJZk4xM2EzU0hjbkN3QkZzbEZPSFJWaHpoOHZVYW50NzdwaFMvV21KSERk?=
 =?utf-8?B?eUZINjNPR0ZJZExBMk9IaVcxV0ozendIU3dVSFVsa3JNZW9nQmQwSFZrVWRN?=
 =?utf-8?B?YXNkU3ZCZVg5ZHhPSnVra3hFSDViSzZiYTA4MHVscjVTQllZSU5YUmwxU3Vw?=
 =?utf-8?B?eUVXVmZzTkc1dlRQbHJMZ0FHNHZ1WlZBYXgvbE5WUTFuVjU1TGRDQjJ2dWJU?=
 =?utf-8?B?eWFlZ21rS0VrZWFNc2FRSk5oVTFKU3dRNTF5eTRCZzhJcGE0NTVMbkJIOXdZ?=
 =?utf-8?B?UzRVbGY1U0pqQ3lWcFJYSkNXa0d5MkRNaXlNMHA2WUtDTExSbUphUDd5MTFh?=
 =?utf-8?B?NEFRNW9YbzRXTFZZRjRZQnY0OEtKUWxLdUpNSXNoY1BGSkF1RWRKNFBZVlBp?=
 =?utf-8?B?dWxYZkk4THo2YzVNVVpNRmVwbE0yZ1hMcjhDR05yVmZrM3hrOUlpS3FoZmJR?=
 =?utf-8?B?allkczBYQnFiSVVzNDZqd3c1ZG1BWGlpcVdQMUtHc09OZ2xZMmtsWVRYREdT?=
 =?utf-8?B?TStNUmJoK2dmaWQrYTJkSVdFQjdKRXVERC9vM3cvSWlxc28wOWhCTEpYczJW?=
 =?utf-8?B?REhxQkhPdGV2eTNldjRHeEF3OEE5SjNCSjlzQXh1Vy9pQWZ0OFFtQmlYc1Ru?=
 =?utf-8?Q?lmuL+omNd9gB3dMpivyKXIOBw6TCoO6zir?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CABDB7C2992E164B8851044CB6B5AAB0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d51245c-f56e-40bd-1456-08d8bb950c80
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2021 09:40:10.6509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DjDUPjQtiYKOcWWN/bCdLqtdZ6eder5OgGpMdMgDrWp3XCckCpw85ZGOg/Iqk+PNAkp+uvv4pOwPrdI0ySlMig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5600
X-OriginatorOrg: citrix.com

T24gTW9uLCAyMDIxLTAxLTE4IGF0IDA4OjUwICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0K
PiBPbiAxNS4wMS4yMSAyMzoyOCwgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4gPiBGcm9tOiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+ID4gDQo+ID4gQWRkIHRoZSAibGl2ZS11cGRh
dGUiIGNvbW1hbmQgdG8geGVuc3RvcmUtY29udHJvbCBlbmFibGluZyB1cGRhdGluZw0KPiA+IHhl
bnN0b3JlZCB0byBhIG5ldyB2ZXJzaW9uIGluIGEgcnVubmluZyBYZW4gc3lzdGVtLg0KPiA+IA0K
PiA+IFdpdGggLWMgPGFyZz4gaXQgaXMgcG9zc2libGUgdG8gcGFzcyBhIGRpZmZlcmVudCBjb21t
YW5kIGxpbmUgdG8NCj4gPiB0aGUNCj4gPiBuZXcgaW5zdGFuY2Ugb2YgeGVuc3RvcmVkLiBUaGlz
IHdpbGwgcmVwbGFjZSB0aGUgY29tbWFuZCBsaW5lIHVzZWQNCj4gPiBmb3IgdGhlIGludm9jYXRp
b24gb2YgdGhlIGp1c3QgcnVubmluZyB4ZW5zdG9yZWQgaW5zdGFuY2UuDQo+ID4gDQo+ID4gVGhl
IHJ1bm5pbmcgeGVuc3RvcmVkIChvciB4ZW5zdG9yZS1zdHViZG9tKSBuZWVkcyB0byBzdXBwb3J0
IGxpdmUNCj4gPiB1cGRhdGluZywgb2YgY291cnNlLg0KPiA+IA0KPiA+IEZvciBub3cganVzdCBh
ZGQgYSBzbWFsbCBkdW1teSBoYW5kbGVyIHRvIEMgeGVuc3RvcmUgZGVueWluZyBhbnkNCj4gPiBs
aXZlIHVwZGF0ZSBhY3Rpb24uDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxA
eGVuLm9yZz4NCj4gPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNv
bT4NCj4gDQo+IEluc3RlYWQgb2YgbWVyZ2luZyBtdWx0aXBsZSBwYXRjaGVzIG9mIG1pbmUgaW50
byBhIHNpbmdsZSBvbmUgYW5kDQo+IHNlbmRpbmcgaXQgaGVyZSB3aXRoIG15IFMtby1iIEknZCBw
cmVmZXIgYSBzaW1wbGUgY2F2ZWF0IGZvciB5b3VyDQo+IHNlcmllcyB0byBkZXBlbmQgb24gbXkg
Qy14ZW5zdG9yZSBzZXJpZXMuDQoNClllcywgSSBzaG91bGQndmUgYWRkZWQgYSBsaW5rIHRvIHRo
YXQgaW4gbXkgY292ZXIgbGV0dGVyLA0KaW4gdGhlIG5leHQgcmV2aXNpb24gSSdsbCBwb2ludCB0
bzoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDIxMDExNTA4MzAwMC4xNDE4
Ni0xLWpncm9zc0BzdXNlLmNvbS8NCg0KPiANCj4gVGhpcyBhZGRpdGlvbmFsbHkgcmVkdWNlcyB0
aGUgcmlzayB0byBtaXNzIGFueSBtb2RpZmljYXRpb25zIGluDQo+IG15IHNlcmllcyBkb25lIGlu
IGEgbGF0ZXIgaXRlcmF0aW9uIHRoYW4gdGhlIG9uZSB5b3UgaGF2ZSB0YWtlbi4NCg0KSSd2ZSBy
ZW9yZGVyZWQgdGhlIHBhdGNoZXMgYW5kIGNoYW5nZWQgdGhlIGJhc2UswqBpdCBzaG91bGQgYmUg
Z29uZSB0aGUNCm5leHQgSSBkbyBnaXQgZm9ybWF0LXBhdGNoOg0KaHR0cHM6Ly9naXRodWIuY29t
L2Vkd2ludG9yb2sveGVuL3B1bGwvMS9jb21taXRzDQoNCldpbGwgYWxzbyByZW1vdmUNCmh0dHBz
Oi8vZ2l0aHViLmNvbS9lZHdpbnRvcm9rL3hlbi9wdWxsLzEvY29tbWl0cy80N2RkMWQ5Yjk5Yjky
MTBlOTRmYmQ0YWYyOGFmZWU4MDg4ZDUyNjcNCm9uY2UgSSBpbXBsZW1lbnRlZCB0aGUgY2hhbmdl
IGluIG94ZW5zdG9yZWQgdG8gbm90IHJldHVybiBCVVNZIHRoYXQgd2UNCmRpc2N1c3NlZC4NCg0K
PiANCj4gDQo+IEp1ZXJnZW4NCg0K

