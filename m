Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D3E14ED70
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 14:34:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixWPd-0004qT-8r; Fri, 31 Jan 2020 13:32:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EwZr=3U=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1ixWPb-0004qD-8p
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 13:32:43 +0000
X-Inumbo-ID: 27ceaf24-442e-11ea-ad98-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::713])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27ceaf24-442e-11ea-ad98-bc764e2007e4;
 Fri, 31 Jan 2020 13:32:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5frjGlOlds2l0X9u8xgvya1N8GBG92mdkHYTT13mQLNEH7Fs04uu7W2sEYKrE/dqeWa0hZf4tgiXHCh7qsjVU0nh1B9L0pV1C5I6M0QPut/QvwIOGFgxQ3lGnNJNi2hpOkWVWz0kw73SafPvFCf6v7mrOzVF12Igl6Q42fkWdvc9bmVILW85633qSCt7gQT3s83puKpBGna+HwSWnrFdt2Zftfav4SHekula3PDt12RSZGCYl2qe3k/H9Jzb+B3sXcUVZ2H8eLI8KD7dDC1XUA9L7KnU7fliNh+BEcFYVpE7ULVz2l/O87QF9L3QJ6XwYtolkqd64w8nfaPHOE/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFYAep/tS6mwUtZH26H3avQEM2YOp38cuQd9r662xUg=;
 b=lr/613s1S2vejZnKAh4WkKmqQe30VSpQK24VL2j3bQjjjqDMSHA4qR5e7wERun5k19XFifZu1GWOT88CzvLxmFuVWsW/SFoNNkxCyK5SkVxlxv8QM/dhXGH351Y2oQkysIl8U3WwSTvzQ3YLownFlcVS/qndICyJoEM8bsCRoO4a3Nr9CUd5T7ItAo3AF+2BL44DP1Jqera9Aw7htvfPfbhrBa+hM3fjL+syZWyidcYEyaSadsmABRkccpIs6TZIPx6mNMyCHbjWJlfM2oQOewRFx0b9/LEFrLE3OCLK/5Zh7sTV6tm4VnILaZhRtlQl6eTgJI+zGUNeGRobtsNo9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFYAep/tS6mwUtZH26H3avQEM2YOp38cuQd9r662xUg=;
 b=M5aqL8bmgdV4BmNChy3XMr2BB1k1UtzeUWK+mEFOtAhVyblMeiKhDf6WGI5aQoaHyeB754RMl22dawX+rIII4V9HYmwn9VUTXcRq0yJOC0BVzdJXLCZjhYuief8cc+wBbzS5NuOvmgzn0WR9OdiwVlj2vCr+5g+xjJlcxU6bGQI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB3701.eurprd08.prod.outlook.com (20.178.90.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.29; Fri, 31 Jan 2020 13:32:40 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::11a9:a944:c946:3030%7]) with mapi id 15.20.2686.028; Fri, 31 Jan 2020
 13:32:40 +0000
To: qemu-devel@nongnu.org
References: <158047636035.17955.5913248840185467774@a1bbccc8075a>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200131163237327
Message-ID: <26ba57f0-8a7f-c73b-ccab-b2811af24d3d@virtuozzo.com>
Date: Fri, 31 Jan 2020 16:32:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <158047636035.17955.5913248840185467774@a1bbccc8075a>
Content-Language: en-US
X-ClientProxiedBy: HE1PR05CA0362.eurprd05.prod.outlook.com
 (2603:10a6:7:94::21) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
Received: from [172.16.24.200] (185.231.240.5) by
 HE1PR05CA0362.eurprd05.prod.outlook.com (2603:10a6:7:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27 via Frontend Transport; Fri, 31 Jan 2020 13:32:38 +0000
X-Tagtoolbar-Keys: D20200131163237327
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27a7f96a-7fb3-4ceb-016a-08d7a6520b05
X-MS-TrafficTypeDiagnostic: AM6PR08MB3701:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3701FA92430A0A3F12BE549CC1070@AM6PR08MB3701.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 029976C540
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10001)(10019020)(39850400004)(396003)(366004)(136003)(346002)(376002)(189003)(199004)(2906002)(31686004)(8676002)(52116002)(81156014)(8936002)(81166006)(7416002)(316002)(16576012)(4326008)(6486002)(16526019)(26005)(86362001)(66946007)(66556008)(186003)(66476007)(966005)(5660300002)(478600001)(6916009)(31696002)(2616005)(956004)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB3701;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwgG338uH+J2XkH5g0MTCLrhZcoQzcaaTp/U40TdkzOaTbgVBjfwFuwmeyn5/ivm/ReiLev226n7IoaRx2aKJvCyaucqPnFFnXzBcZHe8kFvM3kZnvxrC/F/z+9FKlkUAYvo5vJplrzXOEVLrGOmGx86r30YmN6NYR5KWArkBewHDWMwxXWrznjzwo7RzVpICwbjTIpjS0Bza5MPdQOSroybQeer3u+9nUJdXrdNH+ec6gf7HViJzaXO+gck1WmqsyD7Ej3knuuCPX4PU2DYXtBf54HxE9uAERl7pmGe7VF3k9zE47i+WKYxqltbrqMFfD1cBf1kGKE/gB4/SXikm//ZGXAhjIVsmnX5GYoMgEe4nhbZdt50h1XWOImH1mkg7T/0At9c9ha80gWzThxpq4y6NmooS1IigACpcpbKhIdcNkqEIEZQpE0/iWfcTRLEZ2pZm+FohjlKl7Ungtdcr5b0BrK73lDqHpZm1WZ8yjVBmRbvPmEC84rLZi/3pn9imRTSbZi8r53WdhZfMfh0LXU4ny3xMLSeWqf+6S+muFxnt4M/QTJ8oc05csyJ4e5GIRt30dqmesYANuImP5Wbsg==
X-MS-Exchange-AntiSpam-MessageData: X4QUHuGp+/GaFbC2LY5a/bunhzK3NFfE14fe6LyVt+l8xBWirGqFldHtLOJJuKfcW1wgx6xyZ7dps3ue6E0RgI1LeI6H5OJfCUN9p3La1cHFAHh1dUreLt7J4GkgmCggkRGAlEvXNXC3OYyF9zvDIQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a7f96a-7fb3-4ceb-016a-08d7a6520b05
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2020 13:32:40.0869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qf/vCjL5pqouBXMuHa6kYKz7D2pHHi07mPFHUZQcHRumxo92q9ITDMhmswu+QqJwxXKVIaU6UYl/joeiANjzpWh+pbBtPGy94jRIkGxLv+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3701
Subject: Re: [Xen-devel] [PATCH v7 00/11] error: auto propagated local_err
 part I
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
Cc: kwolf@redhat.com, sstabellini@kernel.org, mdroth@linux.vnet.ibm.com,
 qemu-block@nongnu.org, paul@xen.org, lersek@redhat.com, groug@kaod.org,
 eblake@redhat.com, armbru@redhat.com, kraxel@redhat.com, stefanha@redhat.com,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, mreitz@redhat.com,
 philmd@redhat.com, stefanb@linux.ibm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MzEuMDEuMjAyMCAxNjoxMiwgbm8tcmVwbHlAcGF0Y2hldy5vcmcgd3JvdGU6Cj4gUGF0Y2hldyBV
Ukw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDEzMTEzMDExOC4xNzE2LTEtdnNlbWVu
dHNvdkB2aXJ0dW96em8uY29tLwo+IAo+IAo+IAo+IEhpLAo+IAo+IFRoaXMgc2VyaWVzIHNlZW1z
IHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9y
Cj4gbW9yZSBpbmZvcm1hdGlvbjoKPiAKPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0ggdjcg
MDAvMTFdIGVycm9yOiBhdXRvIHByb3BhZ2F0ZWQgbG9jYWxfZXJyIHBhcnQgSQo+IE1lc3NhZ2Ut
aWQ6IDIwMjAwMTMxMTMwMTE4LjE3MTYtMS12c2VtZW50c292QHZpcnR1b3p6by5jb20KPiBUeXBl
OiBzZXJpZXMKPiAKPiA9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09Cj4gIyEvYmluL2Jhc2gKPiBn
aXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCj4gZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lbGltaXQgMAo+IGdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMg
VHJ1ZQo+IGdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KPiAuL3Nj
cmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo+ID09PSBURVNUIFNDUklQVCBF
TkQgPT09Cj4gCj4gIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11
Cj4gICAgIDkyODE3MzYuLmFkY2Q2ZTkgIG1hc3RlciAgICAgLT4gbWFzdGVyCj4gIEZyb20gaHR0
cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11Cj4gICAqIFtuZXcgdGFnXSAgICAg
ICAgIHBhdGNoZXcvMjAyMDAxMzExMzAxMTguMTcxNi0xLXZzZW1lbnRzb3ZAdmlydHVvenpvLmNv
bSAtPiBwYXRjaGV3LzIwMjAwMTMxMTMwMTE4LjE3MTYtMS12c2VtZW50c292QHZpcnR1b3p6by5j
b20KPiBTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCj4gYjBmNDgzNCB4ZW46IGludHJv
ZHVjZSBFUlJQX0FVVE9fUFJPUEFHQVRFCj4gYzcwNDU2MSBuYmQ6IGludHJvZHVjZSBFUlJQX0FV
VE9fUFJPUEFHQVRFCj4gMjM4YjRkMiBUUE06IGludHJvZHVjZSBFUlJQX0FVVE9fUFJPUEFHQVRF
Cj4gNTZhZjYzNCB2aXJ0aW8tOXA6IGludHJvZHVjZSBFUlJQX0FVVE9fUFJPUEFHQVRFCj4gOGRk
NDk3YSBmd19jZmc6IGludHJvZHVjZSBFUlJQX0FVVE9fUFJPUEFHQVRFCj4gY2Q1NDc1MCBwZmxh
c2g6IGludHJvZHVjZSBFUlJQX0FVVE9fUFJPUEFHQVRFCj4gMDMxZDdlZCBTRCAoU2VjdXJlIENh
cmQpOiBpbnRyb2R1Y2UgRVJSUF9BVVRPX1BST1BBR0FURQo+IDdkYzkxYzUgaHcvc2Qvc3NpLXNk
OiBmaXggZXJyb3IgaGFuZGxpbmcgaW4gc3NpX3NkX3JlYWxpemUKPiA1NzQzNWM0IHNjcmlwdHM6
IGFkZCBjb2NjaW5lbGxlIHNjcmlwdCB0byB1c2UgYXV0byBwcm9wYWdhdGVkIGVycnAKPiAwODgz
ZjI5IGVycm9yOiBhdXRvIHByb3BhZ2F0ZWQgbG9jYWxfZXJyCj4gZGYwZGI4MyBxYXBpL2Vycm9y
OiBhZGQgKEVycm9yICoqZXJycCkgY2xlYW5pbmcgQVBJcwo+IAo+ID09PSBPVVRQVVQgQkVHSU4g
PT09Cj4gMS8xMSBDaGVja2luZyBjb21taXQgZGYwZGI4M2NkMThhIChxYXBpL2Vycm9yOiBhZGQg
KEVycm9yICoqZXJycCkgY2xlYW5pbmcgQVBJcykKPiAyLzExIENoZWNraW5nIGNvbW1pdCAwODgz
ZjI5NmVkOGYgKGVycm9yOiBhdXRvIHByb3BhZ2F0ZWQgbG9jYWxfZXJyKQo+IEVSUk9SOiBNYWNy
b3Mgd2l0aCBtdWx0aXBsZSBzdGF0ZW1lbnRzIHNob3VsZCBiZSBlbmNsb3NlZCBpbiBhIGRvIC0g
d2hpbGUgbG9vcAo+ICMxMzk6IEZJTEU6IGluY2x1ZGUvcWFwaS9lcnJvci5oOjQyNzoKPiArI2Rl
ZmluZSBFUlJQX0FVVE9fUFJPUEFHQVRFKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ICsgICAgZ19hdXRvKEVycm9yUHJvcGFnYXRvcikgX2F1dG9fZXJycF9wcm9wID0gey5l
cnJwID0gZXJycH07ICBcCj4gKyAgICBlcnJwID0gKChlcnJwID09IE5VTEwgfHwgKmVycnAgPT0g
ZXJyb3JfZmF0YWwpICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgPyAmX2F1dG9fZXJycF9w
cm9wLmxvY2FsX2VyciA6IGVycnApCgoKSXQgd29ydGggaXQuCgo+IAo+IHRvdGFsOiAxIGVycm9y
cywgMCB3YXJuaW5ncywgMTAxIGxpbmVzIGNoZWNrZWQKPiAKPiBQYXRjaCAyLzExIGhhcyBzdHls
ZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKPiBhcmUg
ZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKPiBDSEVD
S1BBVENIIGluIE1BSU5UQUlORVJTLgo+IAo+IDMvMTEgQ2hlY2tpbmcgY29tbWl0IDU3NDM1YzQ3
M2JmMSAoc2NyaXB0czogYWRkIGNvY2NpbmVsbGUgc2NyaXB0IHRvIHVzZSBhdXRvIHByb3BhZ2F0
ZWQgZXJycCkKPiBXQVJOSU5HOiBhZGRlZCwgbW92ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2Vz
IE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/Cj4gIzM0Ogo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gCj4gdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCAxNjcgbGluZXMgY2hlY2tlZAo+IAo+
IFBhdGNoIDMvMTEgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9m
IHRoZXNlIGVycm9ycwo+IGFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1h
aW50YWluZXIsIHNlZQo+IENIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj4gNC8xMSBDaGVja2lu
ZyBjb21taXQgN2RjOTFjNTYwMjYzIChody9zZC9zc2ktc2Q6IGZpeCBlcnJvciBoYW5kbGluZyBp
biBzc2lfc2RfcmVhbGl6ZSkKPiA1LzExIENoZWNraW5nIGNvbW1pdCAwMzFkN2VkYTRiYmIgKFNE
IChTZWN1cmUgQ2FyZCk6IGludHJvZHVjZSBFUlJQX0FVVE9fUFJPUEFHQVRFKQo+IDYvMTEgQ2hl
Y2tpbmcgY29tbWl0IGNkNTQ3NTA3NDhmNCAocGZsYXNoOiBpbnRyb2R1Y2UgRVJSUF9BVVRPX1BS
T1BBR0FURSkKPiA3LzExIENoZWNraW5nIGNvbW1pdCA4ZGQ0OTdhNTA2YmMgKGZ3X2NmZzogaW50
cm9kdWNlIEVSUlBfQVVUT19QUk9QQUdBVEUpCj4gOC8xMSBDaGVja2luZyBjb21taXQgNTZhZjYz
NDk0MWQyICh2aXJ0aW8tOXA6IGludHJvZHVjZSBFUlJQX0FVVE9fUFJPUEFHQVRFKQo+IDkvMTEg
Q2hlY2tpbmcgY29tbWl0IDIzOGI0ZDJjODg2ZiAoVFBNOiBpbnRyb2R1Y2UgRVJSUF9BVVRPX1BS
T1BBR0FURSkKPiAxMC8xMSBDaGVja2luZyBjb21taXQgYzcwNDU2MTBkMjhkIChuYmQ6IGludHJv
ZHVjZSBFUlJQX0FVVE9fUFJPUEFHQVRFKQo+IDExLzExIENoZWNraW5nIGNvbW1pdCBiMGY0ODM0
NjA1MzQgKHhlbjogaW50cm9kdWNlIEVSUlBfQVVUT19QUk9QQUdBVEUpCj4gPT09IE9VVFBVVCBF
TkQgPT09Cj4gCj4gVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKPiAKPiAKPiBUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cj4gaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDAx
MzExMzAxMTguMTcxNi0xLXZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbS90ZXN0aW5nLmNoZWNrcGF0
Y2gvP3R5cGU9bWVzc2FnZS4KPiAtLS0KPiBFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBi
eSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uCj4gUGxlYXNlIHNlbmQgeW91ciBmZWVk
YmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20KPiAKCgotLSAKQmVzdCByZWdhcmRzLApW
bGFkaW1pcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
