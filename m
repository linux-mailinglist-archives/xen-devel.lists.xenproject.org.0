Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A527D18D13B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:39:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFIky-0000mf-HD; Fri, 20 Mar 2020 14:36:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k64R=5F=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jFIkw-0000ma-Kr
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:36:14 +0000
X-Inumbo-ID: 2532e040-6ab8-11ea-bd8d-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.125]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2532e040-6ab8-11ea-bd8d-12813bfff9fa;
 Fri, 20 Mar 2020 14:36:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTlX7fSIlMPQcyJvYh1huyeXcvuYTt2c5t/un/Ezwdsf9DNhGHQje+dkKlJDgiNSovq2CPNaIA5qr+/3e52C31MP5hMmDc3XGrQnSfateTpriRW6rwi/K0nsFRR2/SppHDRzPNqtAeTUsDQ2n0hviVS+yKawTrdjJa1JwmlttMDAJwDScr2HLdMuP3c9XFZPIZPlD4DD2YFvXZEZ/HX7s8mDK0+xfxAgINAvYvfZSgsOWXhI/6rM9qYld2vKkH72UhsaVqWh3PtYhoh5G+hvf0OPXY4blLxZdlQEe0cMf2LQS9lREuX7gzv6oUgFnyHGfR2jONmNshkpDpPtoXU+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34AhENEb0d098ZBr/mcpGzFLrlTMIPtl1CvxOlcCMFQ=;
 b=oGV0jkrCINTddwVqKmROYcB5RO4Qj1EUg/z7whgkEmfTzTBgvby3ENfn5ldofaK/EMPWY2Q/3kH1sAIoij7+T0EvsrNkIeMKdaVQ7tK+Y2Ndy//qbemUujhNjyyMh80aTdBxft/3r0neKCueR6e7LcOx/RZOPMAJr/uIj3of5KHl8cXpD0QesoiO507RJ3ktoDSljaYo5K30THgm9XJcjBQGAUXWDNYvvFrihxJwx3SEXgrj0CnZWICw6MG1MWL0d9FokxlG6oJJ8vvAdn62S+ZhzvoFuR2dAe5lKgAEWwGpozy3oMnS6hUBIbKkfDHgudEP1EjSArGa8j1n+HFGJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34AhENEb0d098ZBr/mcpGzFLrlTMIPtl1CvxOlcCMFQ=;
 b=vPOKd3x5QPNiCM66dx/51+hLgDM8dKlqi9S5vQYQRfpcRlIGzG0AEjkWsB9PKD6D371PdwW5TeyykJxn8zRiU4wWS8CVItSh2HJ4GRXA86okA+rARs0WxZV7LA/kBCfvn6G/ncJafK3fkLfPq8evVbOk/psLiCh6OCyceF0h3jw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com (10.175.35.136) by
 HE1PR0802MB2153.eurprd08.prod.outlook.com (10.172.126.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.18; Fri, 20 Mar 2020 14:36:10 +0000
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f]) by HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f%12]) with mapi id 15.20.2835.017; Fri, 20 Mar
 2020 14:36:10 +0000
To: Markus Armbruster <armbru@redhat.com>
References: <20200312085936.9552-1-vsementsov@virtuozzo.com>
 <20200312085936.9552-3-vsementsov@virtuozzo.com>
 <874kuto7hq.fsf@dusky.pond.sub.org>
 <4a70c6ee-10a2-fdc3-f8df-88c05340398b@virtuozzo.com>
 <875zf8gt2m.fsf@dusky.pond.sub.org>
 <7c6f9a91-76cf-242d-8166-0693ec14b24d@virtuozzo.com>
 <87blozex9v.fsf@dusky.pond.sub.org>
 <f9c8de73-38d8-a14c-632a-8e57d18e00c8@virtuozzo.com>
 <87o8swk8wc.fsf@dusky.pond.sub.org>
 <db2fa8a3-48cc-51aa-a3d5-eba88fb29f66@virtuozzo.com>
 <87wo7jqn8m.fsf@dusky.pond.sub.org>
 <c944511d-0a10-0840-258f-8e0bac19eb47@virtuozzo.com>
 <87wo7gd3nb.fsf@dusky.pond.sub.org>
 <d7bc3318-2d39-ce6f-1bd0-4165084458a2@virtuozzo.com>
 <87r1xn2kmf.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200320173606653
Message-ID: <28ac8e37-6b43-3755-61d7-41dc2d45ed94@virtuozzo.com>
Date: Fri, 20 Mar 2020 17:36:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <87r1xn2kmf.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-ClientProxiedBy: HE1PR0502CA0010.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::20) To HE1PR0802MB2507.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.2] (185.215.60.10) by
 HE1PR0502CA0010.eurprd05.prod.outlook.com (2603:10a6:3:e3::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18 via Frontend Transport; Fri, 20 Mar 2020 14:36:07 +0000
X-Tagtoolbar-Keys: D20200320173606653
X-Originating-IP: [185.215.60.10]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7c830a1-ca81-49f0-9937-08d7ccdc07a1
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2153:
X-Microsoft-Antispam-PRVS: <HE1PR0802MB215306A69EA82E699A0897DEC1F50@HE1PR0802MB2153.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03484C0ABF
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(346002)(366004)(396003)(39850400004)(199004)(4326008)(54906003)(36756003)(316002)(16526019)(186003)(2906002)(478600001)(6916009)(6486002)(16576012)(86362001)(66946007)(66476007)(81156014)(66556008)(52116002)(31696002)(8676002)(31686004)(8936002)(2616005)(7416002)(26005)(956004)(5660300002)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0802MB2153;
 H:HE1PR0802MB2507.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bZfQQmLCOAMy+rpGZ/WgtuRzEGOzAyfy49c47NZH/hQkE5FYjH1WoSc/GD5NaFhAsp/DtqzoCWFujTnSNsJJTt/hHWz/zA97i2XaFfpQcLI2rfqKvKqaeryxKTyQ80ZskHFsySIWweGW1bTMfg5ZJe8rJHW+f/f33oGPosNO7oAito/hVTi9cEgT3uwYQVqC8+LeRJKMiQiVPxgsMXwF9JcUEQ8MJdKJBMbbfsoT2GC0Mjx6Ga3KSUeepEK2a6IoOXARdJX3w0/vqObbXx9hk8WWvh4eC/5+hdIVp/z6ZjHY0xCaTq/PWNSYpHFIsXKIFs9xbxqfE+1y9mET3ZWHILutx+mrjiaoUPV3sAi5EJRfKR2l21Pqxr2kMJ9/tvKmVf0YA03XxpQ//McxCIQ8ogxVHybFfDEZPdz2CPdXjAlp2V6RQkAcnyHXuhklrfSq
X-MS-Exchange-AntiSpam-MessageData: BDHh+g1zr1JC7sgRMOTgprSSaqhP/+3drIS0yaFYkeWWd1phKWoLEK2bmfB4asLYydWcQIeO5ezTuepxZEJWoaJw/yq4zEItJ4wlEQX+3IJqGDSmEByPXqWaYdlbC7dnsGs+lDQiF8RI+7YEltIMaQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c830a1-ca81-49f0-9937-08d7ccdc07a1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2020 14:36:09.9092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaYMKZvZvmskDmApuBp+3RRRg+LKyY9dgG7uF9cFj9GbM4ErSzLIaUlZw7bXjTkAr1Lxydxbd7eP59zpAQEhRoe/m9Ab9gQYHPgXMMhiowQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2153
Subject: Re: [Xen-devel] [PATCH v9 02/10] scripts: Coccinelle script to use
 ERRP_AUTO_PROPAGATE()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MjAuMDMuMjAyMCAxNjo1OCwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6Cj4gVmxhZGltaXIgU2Vt
ZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4gCj4+
IDE5LjAzLjIwMjAgMTM6NDUsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+Pj4gVmxhZGltaXIg
U2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4g
Wy4uLl0KPj4+PiBTbywgdW5kZXJzdGFuZGluZyB0aGF0IHRoZXJlIG5vIHN1Y2ggY2FzZXMgaW4g
dGhlIHdob2xlIHRyZWUsIGFuZCBldmVuCj4+Pj4gaWYgeW91ciBwYXRjaCB3b3JrcyBmYXN0ZXIg
b24gdGhlIHdob2xlIHRyZWUsIEkgc3RpbGwgZG9uJ3Qgd2FudCB0bwo+Pj4+IGRyb3AgaW5oZXJp
dGFuY2UsIGJlY2F1c2UgaXQncyBqdXN0IGEgY29ycmVjdCB0aGluZyB0byBkby4gWWVzLCB3ZSd2
ZQo+Pj4+IGFkZGVkIF9fX18gaGVscGVyLiBJdCBoZWxwcyB0byBhdm9pZCBzb21lIHByb2JsZW1z
LiBQYWlyLWluaGVyaXRhbmNlCj4+Pj4gaGVscHMgdG8gYXZvaWQgYW5vdGhlciBwcm9ibGVtcy4g
SSB1bmRlcnN0YW5kLCB0aGF0IHRoZXJlIHN0aWxsIG1heQo+Pj4+IG90aGVyLCBub3QtY292ZXJl
ZCBwcm9ibGVtcywgYnV0IGJldHRlciB0byBiZSBhcyBzYWZlIGFzIHBvc3NpYmxlLiBBbmQKPj4+
PiBpbmhlcml0YW5jZSBoZXJlIGlzIG5hdGl2ZSBhbmQgY29ycmVjdCB0aGluZyB0byBkbywgZXZl
biB3aXRoIG91ciBfX19fCj4+Pj4gYWRkaXRpb25hbCBoZWxwZXIuIFdoYXQgZG8geW91IHRoaW5r
Pwo+Pj4KPj4+IEkgd291bGRuJ3QgY2FsbCBpdCBjb3JyZWN0LiAgSXQncyBzdGlsbCB1bnJlbGlh
YmxlLCBidXQgbGVzcyBzbyB0aGFuCj4+PiB3aXRob3V0IHRoZSBmdW5jdGlvbiBuYW1lIGNvbnN0
cmFpbnQuICBUaGF0IG1ha2VzIGl0IGxlc3Mgd3JvbmcuCj4+Cj4+IEFncmVlLgo+Pgo+Pj4KPj4+
IDEwMCUgcmVsaWFibGUgd291bGQgYmUgbmljZSwgYnV0IG5vdCBhdCBhbnkgY29zdC4gIFNvbWV0
aGluZyB3ZSdyZQo+Pj4gcmVhc29uYWJseSBjb25maWRlbnQgdG8gZ2V0IHJpZ2h0IHNob3VsZCBi
ZSBnb29kIGVub3VnaC4KPj4+Cj4+PiBUbyBiZSBjb25maWRlbnQsIHdlIG5lZWQgdG8gdW5kZXJz
dGFuZCB0aGUgc2NyaXB0J3MgbGltaXRhdGlvbnMsIGFuZCBob3cKPj4+IHRvIGNvbXBlbnNhdGUg
Zm9yIHRoZW0uICBJIGZpZ3VyZSB3ZSBkbyBub3cuICBZb3UgdG9vPwo+Pj4KPj4KPj4gSSB3aWxs
IG5vdCBiZSBzdXJwcmlzZWQsIGlmIHdlIG1pc3NlZCBzb21lIG1vcmUgaW50ZXJlc3RpbmcgY2Fz
ZXMgOikKPj4gQnV0IHdlIHNob3VsZCBwcm9jZWVkLiBXaGF0IGlzIG91ciBwbGFuPyBXaWxsIHlv
dSBxdWV1ZSB2MTAgZm9yIDUuMT8KPiAKPiB2MTAncyBQQVRDSCAxKzIgbG9vayByZWFkeS4gIFRo
ZSBlcnJvci5oIGNvbW1lbnQgdXBkYXRlIGNvdWxkIHBlcmhhcHMKPiB1c2Ugc29tZSBwb2xpc2g7
IEkndmUgZm9jdXNlZCBteSBhdHRlbnRpb24gZWxzZXdoZXJlLgo+IAo+IFBBVENIIDgtOSBhcmUg
Z2VuZXJhdGVkLiAgVGhleSBzaG91bGQgbmV2ZXIgYmUgcmViYXNlZCwgYWx3YXlzIGJlCj4gcmVn
ZW5lcmF0ZWQuICBXZSBjb21wYXJlIHJlZ2VuZXJhdGVkIHBhdGNoZXMgdG8gcG9zdGVkIG9uZXMg
dG8gbWFrZSBzdXJlCj4gdGhleSBhcmUgc3RpbGwgc2FuZSwgYW5kIHRoZSBSLWJ5cyBhcmUgc3Rp
bGwgdmFsaWQuICBJIGNhbiB0YWtlIGNhcmUgb2YKPiB0aGUgY29tcGFyaW5nLgo+IAo+IEknZCBs
aWtlIHRvIGhhdmUgYSBwdWxsIHJlcXVlc3QgcmVhZHkgd2hlbiB0aGUgdHJlZSByZW9wZW5zIGZv
ciBnZW5lcmFsCj4gZGV2ZWxvcG1lbnQuICBMZXQncyB1c2UgdGhlIHRpbWUgdW50aWwgdGhlbiB0
byBnZXQgbW9yZSBnZW5lcmF0ZWQKPiBwYXRjaGVzIG91dCBmb3IgcmV2aWV3Lgo+IAo+IElmIEkg
cXVldWUgdXAgcGF0Y2hlcyBpbiBteSB0cmVlLCB3ZSBzaGlmdCB0aGUgcmVzcG9uc2liaWxpdHkg
Zm9yCj4gcmVnZW5lcmF0aW5nIHBhdGNoZXMgZnJvbSB5b3UgdG8gbWUsIGFuZCBjcmVhdGUgYSBj
b29yZGluYXRpb24gaXNzdWU6Cj4geW91J2xsIHdhbnQgdG8gYmFzZSBwYXRjaCBzdWJtaXNzaW9u
cyBvbiB0aGUgYnJhbmNoIEkgdXNlIHRvIHF1ZXVlIHRoaXMKPiB3b3JrLCBhbmQgdGhhdCdzIGdv
aW5nIHRvIGJlIGF3a3dhcmQgd2hlbiBJIHJlYmFzZSAvIHJlZ2VuZXJhdGUgdGhhdAo+IGJyYW5j
aC4gIEkgdGhpbmsgaXQncyBzaW1wbGVyIHRvIHF1ZXVlIHVwIGluIHlvdXIgdHJlZSB1bnRpbCB3
ZSdyZSByZWFkeQo+IGZvciBhIHB1bGwgcmVxdWVzdC4KPiAKPiBXaGVuIHlvdSBwb3N0IG1vcmUg
cGF0Y2hlcywgdXNlCj4gCj4gICAgICBCYXNlZC1vbjogPDIwMjAwMzE3MTUxNjI1LjIwNzk3LTEt
dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPgo+IAo+IHNvIHRoYXQgUGF0Y2hldyBhcHBsaWVzIHRo
ZW0gb24gdG9wIG9mIHRoaXMgc2VyaWVzLiAgSG1tLCBwcm9iYWJseSB3b24ndAo+IGRvLCBhcyBQ
QVRDSCA5IGFscmVhZHkgY29uZmxpY3RzLgo+IAo+IFlvdSBjb3VsZCBpbnN0ZWFkIHJlcG9zdCBQ
QVRDSCAxKzIgd2l0aCBlYWNoIGJhdGNoLiAgSSBob3BlIHRoYXQncyBub3QKPiB0b28gY29uZnVz
aW5nLgo+IAo+IEkgdHJ1c3QgeW91J2xsIGtlZXAgcHJvdmlkaW5nIGEgdGFnIHJldmlld2VycyBj
YW4gcHVsbC4KPiAKPiBJIHN1Z2dlc3QgdG8gYXNrIG1haW50YWluZXJzIHRvIGxlYXZlIG1lcmdp
bmcgdGhlc2UgcGF0Y2hlcyB0byBtZSwgaW4KPiBjb3ZlciBsZXR0ZXJzLgo+IAo+IE1ha2VzIHNl
bnNlPwo+IAoKSG1tLgoKSSByZW1lbWJlciB3aGF0IEtldmluIHNhaWQgYWJvdXQgZnJlZXplIHBl
cmlvZDogbWFpbnRhaW5lcnMgd2lsbCBxdWV1ZQphIGxvdCBvZiBwYXRjaGVzIGluIHRoZWlyICJu
ZXh0IiBicmFuY2hlcywgYW5kIHNlbmQgcHVsbCByZXF1ZXN0cyBhdCBzdGFydApvZiBuZXh0IGRl
dmVsb3BpbmcgcGVyaW9kLiBUaGlzIGhpZ2hseSBwb3NzaWJsZSB3aWxsIGRyb3Agci1icyBJIGNh
biBnZXQgbm93LgpBbmQgcmV2aWV3ZXJzIHdpbGwgaGF2ZSB0byByZXZpZXcgdHdpY2UuCgpBbmQg
Zm9yIHRoZSBzYW1lIHJlYXNvbiwgaXQncyBiYWQgaWRlYSB0byBxdWV1ZSBpbiB5b3VyIGJyYW5j
aCBhIGxvdCBvZiBwYXRjaGVzCmZyb20gZGlmZmVyZW50IHN1YnN5c3RlbXMgZHVyaW5nIGZyZWV6
ZS4KClNvLCBqdXN0IHBvc3Rwb25lIHRoaXMgYWxsIHVwIHRvIG5leHQgZGV2ZWxvcG1lbnQgcGhh
c2U/CgoKLS0gCkJlc3QgcmVnYXJkcywKVmxhZGltaXIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
