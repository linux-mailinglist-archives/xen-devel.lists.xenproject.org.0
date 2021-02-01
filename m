Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DBF30A921
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 14:55:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79893.145667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Zf6-0003K3-9T; Mon, 01 Feb 2021 13:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79893.145667; Mon, 01 Feb 2021 13:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Zf6-0003Je-5i; Mon, 01 Feb 2021 13:54:40 +0000
Received: by outflank-mailman (input) for mailman id 79893;
 Mon, 01 Feb 2021 13:54:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VcwM=HD=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1l6Zf4-0003JZ-GH
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 13:54:38 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc3e95f5-0911-4752-a8e0-d1e8df019178;
 Mon, 01 Feb 2021 13:54:36 +0000 (UTC)
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
X-Inumbo-ID: fc3e95f5-0911-4752-a8e0-d1e8df019178
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612187676;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=i3RqQQ2Ww49K89/ICp9Nq50nugf8sRfMQwkDzeBqkAY=;
  b=D/FVohUNEJ3UVdvUzuOU0e0vJGg96nFCjY13Tw0T/JeciHC3XkvvA9mE
   B4ri9QGTvGvWap8DgKp1BjeM83fQYKHlVO+b+HlRkkDIcy9jFHtPY2X6X
   /LAeahWMgQvEuxNGsQQ0wn2swxRd5dpKXKGUbvetdTjZTs+VmJk/sWg4i
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SdwwFXwsj49KI4AXuF6/J0myesEF16qfJwdXXOYUYT5MxZh5QfPzmTJPYbFgXFHmp2N+MGi1Mw
 KcHvlErnjv5yETnCr7Ih1vRchETSkv/O1nhneMkTLgwhvLZtnPX/fjYnfdpL4clzOv1+x9emFz
 rVaeCFMNsVbMLuPq/NRh+iN3bKqcKLVDEX5S4N2xIjWjWTOuHeMAGBnD4qwfQjNE4DcJKscvMv
 a7AmaECIU1AndQP4oxpToUm8huwt47HjK/W3W+wMKML0TJCKFvZIJYjaa/AmoYX7IfDdcwFGMi
 WAU=
X-SBRS: 5.2
X-MesageID: 37603483
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="37603483"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZLnJBpE/xnD112p4UCM5GI+Mdo3oN5/ZKddqlk3jvpS3ErzoxPxCVKr/MyJ45obpWnqsopTUZGAfdosrivIeLqEX4scaE4vAYdB9YL5ohhsTT+sPiscTT+2d90NLU+Xx+OS8AIlEK6077ooRbakEvc2AuEofTPjX06t/9Hx1HnaNSjiUgB+sFQD8jfxiteMrIy7fQiGrRmOdS0V0mvzlg43CkjBSdnfL6eqHZxmzOi5xDuRAmwMIvqeHmpGmx2l9eWvHkxRyCYjJDZu/As4e8KwzaFIkmI0y6HOx0hMZSB2GTdxrCQB4UYf60F/WTzyAMGF9aBAfE6HwqV1ug7gFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3RqQQ2Ww49K89/ICp9Nq50nugf8sRfMQwkDzeBqkAY=;
 b=C9uOMEOXkNwXD37wr1vgQqlUZ9JxaDJptttHofBteYcnh2nnB+bT7zc5J6xwFvx4z1Ao7oMJ5yTFSVP0sp0CuVabAU2yhrYSxmo90fKPPPCO+d7v8BCAE15ZoC6rHmbAa527sy0WZG1YZ8nlwBKu8EwNgLB9p42VG6loIz7Q466bSJ4K0lDK4E5OYl2mHjmYhCr42wdpeqfLHmUIYtFjq9m5q+O+W6anlZi163SE81C6YZp5CWje3DYMRt3QZi1nmI2cvGt7ggB3WfLovtoT+0EcZOzLkZSo8ySGiCTLaZQM0s3VT++p+P6X4MPZyWLsVYGH2AbSFCDrlrPnZY2lUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3RqQQ2Ww49K89/ICp9Nq50nugf8sRfMQwkDzeBqkAY=;
 b=ua6tQ9YRg+5QxARA3mBuaGFE+HyhzBZo7BsWb1tEhD7I4FXkEc/v+/w3kzg915HNFTw5EN6Eh1l+rV6FQXKPRTY/oQUpkwRICJKxUgpmvrQbpzc1apZKucFOTWIhwCwzpUU9BF221vQv5Du7pSdTRgW5mjwMPv0XhJ9FSH722BY=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for 4.16] xl: Add xl.conf-based dom0 autoballoon limits
Thread-Topic: [PATCH for 4.16] xl: Add xl.conf-based dom0 autoballoon limits
Thread-Index: AQHW9l7snzGwdbg2aUWFV1Hc3k4X76pDUo0AgAAEOAA=
Date: Mon, 1 Feb 2021 13:54:29 +0000
Message-ID: <1F7EC4ED-BFA0-4EC8-A7F4-BE78E2455FAE@citrix.com>
References: <20210129164858.3280477-1-george.dunlap@citrix.com>
 <606292ed-9083-d9a7-33e9-a02485cbbca0@suse.com>
In-Reply-To: <606292ed-9083-d9a7-33e9-a02485cbbca0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06734a5e-6687-40e4-94dc-08d8c6b8e519
x-ms-traffictypediagnostic: PH0PR03MB5720:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5720855AFB6A9F9B1FE482E499B69@PH0PR03MB5720.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AmAiJPq+7i0IAw7RO026pw8u4urIZrG+a/5czufCjT/1lLMUyc8yv5c3M5/WKm6NAKQ+RsHQKyfVmTtQ42YoeDqaFtJThU3m19F95XopociGlGhqsmzn9eJpMSnh0zupKkw8ceckFjlYzTNc0ZjQcQ7mZAmrRGeE+G0Ur5UKzk3ArKj4eH7FSvxbanrz3fiMLQZOMgkMwSqo29+uTzXyKAXQNL1eX253miZaRupsOlsWftn+PW+BsB4d0qzIubEiuLh0LTUsT+3g5gtuExUftlU5anc0BLlwNmJE3vO4qG4LOsUahYYAtCIrL9M0tjIaqohGNkRGx+lnXhGaUmB3d7AJjNnGFcJq5AdDXvOkKjEBhfivYmIDEiLNeF/ktIoQmlRFuN07qdSQ7U7XH35Am+5Rm8oKj8s/+BxYbSqZ3ZTe4UWaEFUz6rtEZSwLXxySNI0vBJAXkOsyGXAQtpNM03IKBcKcNKym9tlJxhlIWo/Q+TD0DBYj1DpbEzEp/TxFsrj+LclEeP5Y/hCwqXS6HLV3LefO8MfzriwGp2xRhmECZrQ/QEFHHMl0HiRvl762lJnOLwA5qNQmdxgK1sftfp9mBGAYXA4BFb3vYLaPPvp7w9bHioxayYwcIraRy0ht/owqIDhtB4E18qf7EloIMO+AriZ00RwTvwwtlcjV1gk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(6486002)(2906002)(91956017)(66446008)(66946007)(6916009)(86362001)(76116006)(66476007)(64756008)(66556008)(83380400001)(2616005)(8936002)(478600001)(316002)(6512007)(33656002)(966005)(186003)(6506007)(5660300002)(54906003)(8676002)(36756003)(53546011)(71200400001)(26005)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?K2FFOWNyWFZ2S3duTjFRMUU0MUpWUnI3cjQ5ZC9ONWRJYU9ZVktlVVp6UzUx?=
 =?utf-8?B?ZHAxcVVNSm9paisvNWpmRXpDK1czNVFqNENOeU9iWjhYM1NWV3pzckFuSVFP?=
 =?utf-8?B?M1VJd0ZiNWxzWGRjamUrcDloaFBBZ3FQNjl5NTBoNERjT0I2eVRrdXFzWUkx?=
 =?utf-8?B?YlJrQnl5SnBrYldCZUgvSGJhbmpScHFhZUVmbVJpZWJtSUxMeVp2RnFzQys4?=
 =?utf-8?B?L0F5WnZ3cWlEN2M4S005b2JNT0IvZDA4SmI3dHRaVjdZUE10YU5QeDN1cTZH?=
 =?utf-8?B?TDhRZjhtaEZ1KzBxaFVZdDM1VE1wTkJjRmFuZ3hHRGZlRHk4Q3htbEVrbzZP?=
 =?utf-8?B?emRmSWVZVWlvY3hXdWc1NGlhWWNyeDAzSWg1dkh1RDhHenA3R1lVY294Rnpa?=
 =?utf-8?B?aml4emIweTN5bnAxSnRPa0tadnpSM2d4L0tSMmpTMmNlZU5ZOFJIOFRBTWho?=
 =?utf-8?B?RVJPd2gzS3NyQVZRNVlORHIwNGM4SW5aWmtaTDNUUkhYMTFjL3R6YzZhNlMz?=
 =?utf-8?B?d1IwRFU3YXFzOGN1aThVZWRncllJUVhZbGw0bzlWQkZ4ZkNTWkZGYjJBUWZZ?=
 =?utf-8?B?Nm1VSXZYamp2c2JpNmZhaDNXdzNrRERTN3dna0xuOVNuOGNlN1k0aHNJYUhN?=
 =?utf-8?B?eTdpU05jTlFtR2UwcnJmOU5OUCt1OHJHL2Y2Q05ITTVxUldyN0h0WU9zeWN5?=
 =?utf-8?B?UEJaVHJqNWkyR21Bdk5JSWkyT0dEYktEREZRTDE0aVRMcEF1V2pVS1MycjlP?=
 =?utf-8?B?ZFRlK3BYRmVMdVR3dmYxdEU5SDI4dFVBVjBlTU90K3VHMTd6QWN3UmFtTDdI?=
 =?utf-8?B?dzFrTS95K2FwaXcyeUVORnRONFRPVmQwS1RtaHBLUHA2eWYrVzVGMFdaMGNI?=
 =?utf-8?B?UWZjTmFDVVhNVEZhdU1xd0N0VGh3YkZJSlQ1b2l2Nk0wN3ZOeE1jMHd3SHdR?=
 =?utf-8?B?WXFRUXZHTWFPUSs0RXp2YVNpOXVmY0tSZHdSUzc5b29zMTJua1l4d3FHa3M1?=
 =?utf-8?B?NWwxLy96aFZuK2llcWJUTFRXWlpVeEtSVmRETEZLSmNzS1g5VTlKRC9jajVl?=
 =?utf-8?B?OUxpYk1jRGlxaUd4dDJjaVdyZ2pLdnR3bnc2WkxyS2NxWXFUU0d1OVNiSUZW?=
 =?utf-8?B?eHlERzhyUWxqMTB4T2krUS9qck1lYWVoUGtmb0dpZUdDMlhVT0VjTEJRTTVI?=
 =?utf-8?B?V1pBSlo1UVV0N1JwdkFSclJ0ZnNLZ2VTZ0JqMzFqb0ZKcWxESjIycHpKbUR3?=
 =?utf-8?B?eEFKRkNsczlFT3o2L3RwREV0L1BSQi9zR1RzOUFOWEorelhVbzUvV2s3L1ha?=
 =?utf-8?B?bWlDUmN3SWFIOTNBMEpVUjNrN3UwVVg3K281WDJLSDRkNHVvS3d1ZHM0d2hM?=
 =?utf-8?B?eGRyVTJkekMxOUN5OTV2OFlkT1hlbkF1R1FPTGpvenE4dGNkRHVsYmZINmRl?=
 =?utf-8?B?aHo2TGgrbSszRk1Hd2pVcEthR2xzOURVWWJ1YS93PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EB8D590AD90E24AA39611252A84CE65@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06734a5e-6687-40e4-94dc-08d8c6b8e519
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2021 13:54:29.1920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQ2L1I90Bgdd3uE7ZdqHk18nIsxZEV+I1uYJGHr+BVBP3uEmmBwsxSMLsndZLmJ7VAfg0KGoDegjKn88KzB9vOTVEMrldqERYyUkB3r22zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5720
X-OriginatorOrg: citrix.com

DQoNCj4gT24gRmViIDEsIDIwMjEsIGF0IDE6MzkgUE0sIEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyOS4wMS4yMDIxIDE3OjQ4LCBHZW9yZ2UgRHVubGFw
IHdyb3RlOg0KPj4gV2hlbiBpbiAiYXV0b2JhbGxvb24iIG1vZGUsIHhsIHdpbGwgYXR0ZW1wdCB0
byBiYWxsb29uIGRvbTAgZG93biBpbg0KPj4gb3JkZXIgdG8gZnJlZSB1cCBtZW1vcnkgdG8gc3Rh
cnQgYSBndWVzdCwgYmFzZWQgb24gdGhlIGV4cGVjdGVkIGFtb3VudA0KPj4gb2YgbWVtb3J5IHJl
cG9ydGVkIGJ5IGxpYnhsLiAgQ3VycmVudGx5LCB0aGlzIGlzIGxpbWl0ZWQgaW4gbGlieGwgd2l0
aA0KPj4gYSBoYXJkLWNvZGVkIHZhbHVlIG9mIDEyOE1pQiwgdG8gcHJldmVudCBzcXVlZXppbmcg
ZG9tMCBzbyBoYXJkIHRoYXQNCj4+IGl0IE9PTXMuICBPbiBtYW55IHN5c3RlbXMsIGhvd2V2ZXIs
IDEyOE1pQiBpcyBmYXIgdG9vIGxvdyBhIGxpbWl0LCBhbmQNCj4+IGRvbTAgbWF5IGNyYXNoIGFu
eXdheS4NCj4+IA0KPj4gRnVydGhlcm1vcmUsICJhdXRvYmFsbG9vbiIgbW9kZSwgYWx0aG91Z2gg
c3Ryb25nbHkgcmVjb21tZW5kZWQNCj4+IGFnYWluc3QsIG11c3QgYmUgdGhlIGRlZmF1bHQgbW9k
ZSBmb3IgbW9zdCBkaXN0cm9zOiBIYXZpbmcgdGhlIG1lbW9yeQ0KPj4gYXZhaWxhYmxlIHRvIExp
bnV4IGRyb3AgdG8gMUdpQiB3b3VsZCBiZSB0b28gbXVjaCBvZiBhbiB1bmV4cGVjdGVkDQo+PiBz
dXJwcmlzZSBmb3IgdGhvc2Ugbm90IGZhbWlsaWFyIHdpdGggWGVuLiAgVGhpcyBsZWFkcyB0byBh
IHNpdHVhdGlvbiwNCj4+IGhvd2V2ZXIsIHdoZXJlIHN0YXJ0aW5nIHRvbyBtYW55IGd1ZXN0cyBv
biBhIGxhcmdlLWlzaCBzeXN0ZW0gY2FuDQo+PiB1bmV4cGVjdGVkbHkgY2F1c2UgdGhlIHN5c3Rl
bSB0byBzbG93IGRvd24gYW5kIGNyYXNoIHdpdGggbm8gd2FybmluZywNCj4+IGFzIHhsIHNxdWVl
emVzIGRvbTAgdW50aWwgaXQgT09Ncy4NCj4+IA0KPj4gSWRlYWxseSB3aGF0IHdlIHdhbnQgaXMg
dG8gcmV0YWluIHRoZSAianVzdCB3b3JrcyBhZnRlciBpbnN0YWxsIg0KPj4gZnVuY3Rpb25hbGl0
eSB0aGF0IHdlIGhhdmUgbm93IHdpdGggcmVzcGVjdCB0byBhdXRvYmFsbG9vbmluZywgYnV0DQo+
PiBwcm9tcHRzIHRoZSBhZG1pbiB0byBjb25zaWRlciBhdXRvYmFsbG9vbmluZyBpc3N1ZXMgb25j
ZSB0aGV5J3ZlDQo+PiBkZW1vbnN0cmF0ZWQgdGhhdCB0aGV5IGludGVuZCB0byB1c2UgYSBzaWdu
aWZpY2FudCBwZXJjZW50YWdlIG9mIHRoZQ0KPj4gaG9zdCBtZW1vcnkgdG8gc3RhcnQgZ3Vlc3Rz
LCBhbmQgYWxzbyBhbGxvdyBrbm93bGVkZ2FibGUgdXNlcnMgdGhlDQo+PiBmbGV4aWJpbGl0eSB0
byBjb25maWd1cmUgdGhlIHN5c3RlbSBhcyB0aGV5IHNlZSBmaXQuDQo+PiANCj4+IFRvIGRvIHRo
aXMsIGludHJvZHVjZSB0d28gbmV3IHhsLmNvbmYtYmFzZWQgZG9tMCBhdXRvYmFsbG9vbiBsaW1p
dHM6DQo+PiBhdXRvYmFsbG9vbl9kb20wX21pbl9tZW1tYiwgYW5kIGF1dG9iYWxsb29uX2RvbTBf
bWluX21lbXBjdC4NCj4+IA0KPj4gV2hlbiBwYXJzaW5nIHhsLmNvbmYsIHhsIHdpbGwgYWx3YXlz
IGNhbGN1bGF0ZSBhIG1pbmltdW0gdmFsdWUgZm9yDQo+PiBkb20wIHRhcmdldC4gIElmIGF1dG9i
YWxsb29uX2RvbTBfbWluX21lbW1iIGlzIHNldCwgaXQgd2lsbCBqdXN0IHVzZQ0KPj4gdGhhdDsg
aWYgdGhhdCBpcyBub3Qgc2V0IGFuZCBfbWluX21lbXBjdCBpcyBzZXQsIGl0IHdpbGwgY2FsY3Vs
YXRlIHRoZQ0KPj4gbWluaW11bSB0YXJnZXQgYmFzZWQgb24gYSBwZXJjZW50YWdlIG9mIGhvc3Qg
bWVtb3J5LiAgSWYgbmVpdGhlciBpcw0KPj4gc2V0LCBpdCB3aWxsIGRlZmF1bHQgdG8gMjUlIG9m
IGhvc3QgbWVtb3J5Lg0KPj4gDQo+PiBBZGQgYSBtb3JlIHVzZWZ1bCBlcnJvciBtZXNzYWdlIHdo
ZW4gYXV0b2JhbGxvb24gZmFpbHMgZHVlIHRvIG1pc3NpbmcNCj4+IHRoZSB0YXJnZXQuICBBZGRp
dGlvbmFsbHksIGlmIHRoZSBhdXRvYmFsbG9vbiB0YXJnZXQgd2FzIGF1dG9tYXRpYywNCj4+IHBv
c3QgYW4gYWRkaXRpb25hbCBtZXNzYWdlIHByb21wdGluZyB0aGUgYWRtaW4gdG8gY29uc2lkZXIg
YXV0b2JhbGxvb24NCj4+IGV4cGxpY2l0bHkuICBIb3BlZnVsbHkgdGhpcyB3aWxsIGJhbGFuY2Ug
dGhpbmdzIHdvcmtpbmcgb3V0IG9mIHRoZSBib3gNCj4+IChhbmQgbWFrZSBpdCBwb3NzaWJsZSBm
b3IgYWR2YW5jZWQgdXNlcnMgdG8gY29uZmlndXJlIHRoZWlyIHN5c3RlbXMgYXMNCj4+IHRoZXkg
d2lzaCksIHlldCBwcm9tcHQgYWRtaW5zIHRvIGV4cGxvcmUgZnVydGhlciB3aGVuIGl0J3MNCj4+
IGFwcHJvcHJpYXRlLg0KPj4gDQo+PiBOQiB0aGF0IHRoZXJlJ3MgYSByYWNlIGluIHRoZSByZXN1
bHRpbmcgY29kZSBiZXR3ZWVuDQo+PiBsaWJ4bF9nZXRfbWVtb3J5X3RhcmdldCgpIGFuZCBsaWJ4
bF9zZXRfbWVtb3J5X3RhcmdldCgpOyBidXQgdGhlcmUgd2FzDQo+PiBhbHJlYWR5IGEgcmFjZSBi
ZXR3ZWVuIHRoZSBsYXR0ZXIgYW5kIGxpYnhsX2dldF9mcmVlX21lbW9yeSgpIGFueXdheTsNCj4+
IHRoaXMgZG9lc24ndCByZWFsbHkgbWFrZSB0aGUgc2l0dWF0aW9uIHdvcnNlLg0KPj4gDQo+PiBX
aGlsZSBoZXJlLCByZWR1Y2UgdGhlIHNjb3BlIG9mIHRoZSBmcmVlX21lbWtiIHZhcmlhYmxlLCB3
aGljaCBpc24ndA0KPj4gdXNlZCBvdXRzaWRlIHRoZSBkb3t9IGxvb3AgaW4gZnJlZW1lbSgpLg0K
Pj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJp
eC5jb20+DQo+IA0KPiBJJ20gbm90IGNvbnZpbmNlZCBpdCBpcyB0aGUgdG9vbCBzdGFjayB0byBz
ZXQgYSBsb3dlciBsaW1pdCBoZXJlLg0KPiBJbW8gdGhlIGtlcm5lbCBzaG91bGQgZ3VhcmQgaXRz
ZWxmIGZyb20gdG9vIGFnZ3Jlc3NpdmUgYmFsbG9vbmluZy4NCj4gSW4gZmFjdCwgdGhlIG9sZCBY
ZW5vTGludXggZHJpdmVyIGRpZCwgYXMgb2YNCj4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvaGcv
bGludXgtMi42LjE4LXhlbi5oZy9yZXYvYjYxNDQzYjFiZjc2LA0KPiB3aGljaCBpbiBvdXIgZm9y
d2FyZCBwb3J0cyB3ZSB0aGVuIGV4dGVuZGVkIHRvIGhhdmUgZXhwb3N1cmUgaW4NCj4gL3Byb2Mg
YW5kIC9zeXMsIGFsb25nc2lkZSBhbiB1cHBlciBsaW1pdCAoZm9yIHB1cmVseSBpbmZvcm1hdGlv
bmFsDQo+IHB1cnBvc2VzIGlpcmMpLg0KDQpKdXN0IHRvIGJlIGNsZWFyLCB0aGUgbGltaXQgaW4g
dGhpcyBwYXRjaCB3aWxsICpvbmx5KiBhZmZlY3Q6DQoNCjEuIGF1dG9iYWxsb29uaW5nDQoyLiBk
b25lIGJ5IHhsDQozLiBpbiByZXNwb25zZSB0byBhbiBgeGwgY3JlYXRlYA0KDQpZb3UgY2FuIHN0
aWxsIGNyYXNoIHlvdXIgZG9tMCBqdXN0IGZpbmUgYnkgcnVubmluZyBgeGwgbWVtLXNldCAwICRU
T09fU01BTExgOyBhbmQgdGhpcyBwYXRjaCB3b27igJl0IGFmZmVjdCB0aGUgYmVoYXZpb3Igb2Yg
YWx0ZXJuYXRlIHRvb2xzdGFja3MgaW1wbGVtZW50ZWQgb24gbGlieGwgKGUuZy4sIGxpYnZpcnQp
Lg0KDQpJ4oCZZCBjZXJ0YWlubHkgYmUgaW4gZmF2b3Igb2YgZ2V0dGluZyBzb21ldGhpbmcgbGlr
ZSBiNjE0NDNiMWJmNzYgdXBzdHJlYW0uICBJIHN0aWxsIHRoaW5rIGEgcGF0Y2ggbGlrZSB0aGlz
IG9uZSB3b3VsZCBiZSB1c2VmdWwgdGhvdWdoOg0KDQoxLiBUaGUgZXJyb3IgbWVzc2FnZSB3aWxs
IGJlIGdpdmVuIHJpZ2h0IGF3YXksIHJhdGhlciB0aGFuIHRpbWluZyBvdXQgb24gdGhlIGRvbTAg
YmFsbG9vbiBkcml2ZXINCg0KMi4gVGhlIGVycm9yIG1lc3NhZ2UgY2FuIGJlIG1vcmUgaW5mb3Jt
YXRpdmUsIGFuZCBwb2ludCBwZW9wbGUgdG8gdGhlIHdob2xlIOKAnGZpeGVkIGRvbTAgbWVtb3J5
4oCdIHRoaW5nLg0KDQogLUdlb3JnZQ==

