Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3300187D5D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 10:44:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jE8jp-0005ja-FA; Tue, 17 Mar 2020 09:42:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fiuw=5C=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jE8jn-0005jU-Cz
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 09:42:15 +0000
X-Inumbo-ID: 943b1778-6833-11ea-bec1-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::703])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 943b1778-6833-11ea-bec1-bc764e2007e4;
 Tue, 17 Mar 2020 09:42:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAGm3p5h/c3Jn6E0T/QthJNOPoCtdBmdPNukned8O8AnG1HjRf8c2vd1+k8viDFfJRjXnnuH2ejnOyUwHvnpmkgRJ/7VOUd/yIl8vHo7hHwcW89xCWLz4Gh8VKHOJdU4CGE1Bj/d7J3WIY1ebvYiJ6VTi1KjeeSdXVhOrIQ4VAwKD24ybdi+HWqjidOxopaZdalHQk9mt5AgQgoaPHr876OVT9/mifPebuRE2OnyPyD9ZDV6KwRHi6ALKi3Ow38taVmuIynwBii4Yt8nbfCzB6Py3eriE6xWgtsz+gvBzGFxL6C/g8iPIE5H75/qOleEG8RIJ2UOd6epr+OGGVmJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXIrKZnGV8uShkz+6JSMur7bn9zGmhlSZt9rYDbIgqQ=;
 b=HJDjvra/ik7PtXNdueI0PxUXUowO3zVFSA3PNlasvYb6RPPCjhDUtxYiHLX0KlrlfT+ERQiQZsfStP42AbkMoAoTKr6qSmTf80c//FZz05MgySIsxAjM4Xb0PYXCy9AjXjOVl7vCvjoVMHADEdvCFwB5QQCCsi8Xj6DhpzXcLNfoDM3c2ayFl/rAHgX4O6c9jFtUqDfeqNjYZ0xZ7JRbbwkwbAtNCsiy7n4h/6B5GVwGcswhMPtSTnPM7Y3IwB2q440qQdP5zr5fh+10mBkMKlXp0BBmM2Fj1skj6QQdc7Vv9KsfhWwKLwC/1mnhIuK/RjSf66VN19aBquG7FOkeRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXIrKZnGV8uShkz+6JSMur7bn9zGmhlSZt9rYDbIgqQ=;
 b=ci/UJwvIGx5k88nPldSDy2GMglL/qqa7dRtmIUZQKbo12Cg1ZNiLUbPJKn5JCvnDzDLDM/OBGadzM2lWaDHVmoXAPTql0XsNmxGerDv9iZz4G6z+oucKdPsm0rHpAdp+DcTwUz9Tff+RM7pkmZ+OajQ8kujSrUTf4SYAHWjCYPI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com (10.175.35.136) by
 HE1PR0802MB2409.eurprd08.prod.outlook.com (10.175.33.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.14; Tue, 17 Mar 2020 09:42:11 +0000
Received: from HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f]) by HE1PR0802MB2507.eurprd08.prod.outlook.com
 ([fe80::4d32:e4e1:5b9f:240f%12]) with mapi id 15.20.2814.021; Tue, 17 Mar
 2020 09:42:11 +0000
To: Markus Armbruster <armbru@redhat.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <87y2shdg00.fsf@dusky.pond.sub.org>
 <87abeabb-c8ee-ed6f-6b3a-b3fc24d07b89@virtuozzo.com>
 <87r1xsfjnh.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200317124207292
Message-ID: <97edc043-6ad8-0dd1-4eda-663b350072dd@virtuozzo.com>
Date: Tue, 17 Mar 2020 12:42:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <87r1xsfjnh.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0004.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::14) To HE1PR0802MB2507.eurprd08.prod.outlook.com
 (2603:10a6:3:e1::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.2] (185.215.60.248) by
 ZR0P278CA0004.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.18 via Frontend Transport; Tue, 17 Mar 2020 09:42:08 +0000
X-Tagtoolbar-Keys: D20200317124207292
X-Originating-IP: [185.215.60.248]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99de89e7-b7e1-4602-73be-08d7ca577703
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2409:
X-Microsoft-Antispam-PRVS: <HE1PR0802MB24096AA289A08D5A5A4966FEC1F60@HE1PR0802MB2409.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0345CFD558
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(376002)(396003)(366004)(39850400004)(199004)(7416002)(6486002)(4326008)(2906002)(36756003)(478600001)(186003)(2616005)(86362001)(5660300002)(16526019)(956004)(26005)(81166006)(81156014)(8936002)(8676002)(66946007)(66556008)(66476007)(31686004)(16576012)(31696002)(6916009)(316002)(52116002)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0802MB2409;
 H:HE1PR0802MB2507.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v0IMbzFjhPMgsr6JNq6WEodQ8826TVSIJZ2FpNoXweRIofOfEllNBXMO1HKN5UJiYAe8Wml868JPJ1sIUAtqX5ChwnwgUL+yg2cUH0VvvcIVlj1rBCei4flGSivLzzLFlCOoe5GJeBEHCXiNX5noc/1TShxwQX9IRZTRp+Wg958CTjOOuqWxArZ6ITZzraFv4JkXGaZvvPz+GmswiOvdbvS/vZ37lrkg7TrtiT0XKymsKq1M8Q3ngJ8l41bjBVDWnb4SWbgVB4erySUhiJfL+y8ZK4XHWR16K1uHbBjoTGKqXiDywZjsPZfDFCPkxRGFYOn4phFxQyNMNWqJvgZRhljFcAac2WZuUEAOK1Sa8IJf+PrKkbC01ctBykMrAsRuheGzxbigbFxrYkWF/3JBD4siZN7Joz4XW9K5acNXsWChdnyrx7Vof4/IOoUw8TCt
X-MS-Exchange-AntiSpam-MessageData: SnWv491aGNSFBak2gNfLU+JGMoZ3Fa083mZISh5wBtQ8saNt+8ODi5oxcenDr8S0NOKEOAL4dTiRZGGhJDPgJU+po7z1ykOHrKe0c1ntOi4reMtQlTIMMggrBSLapBVrN81TXZVBhm3/iek68iuCyQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99de89e7-b7e1-4602-73be-08d7ca577703
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 09:42:10.9632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YQZfKrPcX6hDs1sz2iLl1M0VS0QoiHcD8sdfkhE0k4SEFAaHul5IvVqJ+vmJ7QbyhY2dE5YZ/JqFJW9iOAuG1pRhFV8msqWxKPfY0LR8wQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2409
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTYuMDMuMjAyMCAxNzo0MCwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6Cj4gVmxhZGltaXIgU2Vt
ZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4gCj4+
IDAzLjAzLjIwMjAgMTE6MDEsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+Pj4gSGkgVmxhZGlt
aXIsCj4+Pgo+Pj4gSSd2ZSBjb21lIHRvIHJhdGhlciBsaWtlIHlvdXIgRVJSUF9BVVRPX1BST1BB
R0FURSgpIGlkZWEuICBXaGF0IEkKPj4+IHdvdWxkbid0IGxpa2UgaXMgYSBwcm90cmFjdGVkIGNv
bnZlcnNpb24uCj4+Pgo+Pj4gT25jZSB3ZSdyZSBoYXBweSB3aXRoIFBBVENIIDEtMywgaXQncyBh
IG1hdHRlciBvZiBydW5uaW5nIENvY2NpbmVsbGUgYW5kCj4+PiByZXZpZXdpbmcgaXRzIG91dHB1
dC4gIEknbSBjb25maWRlbnQgd2UgY2FuIGNvbnZlcmdlIG9uIFBBVENIIDEtMy4KPj4+Cj4+PiBJ
dCdzIHR3byB3ZWVrcyB1bnRpbCBzb2Z0IGZyZWV6ZS4gIFdlIG5lZWQgdG8gZGVjaWRlIHdoZXRo
ZXIgdG8gcHVyc3VlIGEKPj4+IHBhcnRpYWwgY29udmVyc2lvbiBmb3IgNS4wIChiYXNpY2FsbHkg
dGhpcyBzZXJpZXMgcGx1cyB0aGUgdHdvIHBhdGNoZXMKPj4+IHdlIGlkZW50aWZpZWQgaW4gcmV2
aWV3IG9mIFBBVENIIDEpLCBvciBkZWxheSB1bnRpbCA1LjEuICBJbiBlaXRoZXIKPj4+IGNhc2Us
IEkgd2FudCB0aGUgY29udmVyc2lvbiB0byBiZSBmaW5pc2hlZCBpbiA1LjEuCj4+Pgo+Pj4gUGxl
YXNlIGRvIG5vdCBmZWVsIHByZXNzdXJlZCB0byBtYWtlIHRoZSA1LjAgZGVhZGxpbmUuCj4+Pgo+
Pj4gSSBjYW4gcXVldWUgdXAgcGF0Y2hlcyBmb3IgNS4xIGR1cmluZyB0aGUgZnJlZXplLgo+Pj4K
Pj4+IEhvdyB3b3VsZCB5b3UgbGlrZSB0byBwcm9jZWVkPwo+Pj4KPj4KPj4gSGkgTWFya3VzISBG
dW5ueSBjb2luY2lkZW5jZTogZXhhY3RseSBub3cgKGxlc3MgdGhhbiAxIGhvdXIgYWdvKSwgSSd2
ZQo+PiBzdGFydGVkIHdvcmtpbmcgZm9yIHRoZSBuZXh0IHZlcnNpb24gZm9yIHRoZXNlIHNlcmll
cy4gU28sIEknbSBnb2luZyB0bwo+PiByZXNlbmQgdG9kYXkuIE9mIGNvdXJzZSwgSSdkIHByZWZl
ciB0byBtZXJnZSBzb21ldGhpbmcgdG8gNS4wIGlmIGF0IGFsbAo+PiBwb3NzaWJsZS4KPiAKPiBU
aGF0IHdhcyB2OCwgZm9sbG93ZWQgYnkgdjkuICBXZSdyZSBjbGVhcmx5IGNvbnZlcmdpbmcuICBI
b3dldmVyLCB0aGUKPiBzb2Z0IGZyZWV6ZSBpcyB0b21vcnJvdyBhbHJlYWR5Lgo+IAo+IFlvdSd2
ZSBwZXJzZXZlcmVkIHdpdGggdGhpcyBpZGVhIGZvciBxdWl0ZSBhIHdoaWxlOyBzb21lIGltcGF0
aWVuY2UKPiB3b3VsZCBiZSBxdWl0ZSBleGN1c2FibGUgbm93LiAgU3RpbGwsIEkgZG91YnQgcGFy
dCBJIG1ha2luZyA1LjAgbWF0dGVycy4KCk5vdCBhIHByb2JsZW0uIEkgaG9wZSwgSSdsbCByZXNl
bmQgc29vbiwgdGhlbiBpdCB3aWxsIGJlIHVwIHRvIHlvdS4KCj4gVGhlIGhhbmQtd3JpdHRlbiBw
YXJ0IGlzIGxpa2VseSB0byByZWJhc2UgZWFzaWx5LCBhbmQgdGhlIGdlbmVyYXRlZCBwYXJ0Cj4g
c2hvdWxkIGJlIHJlZ2VuZXJhdGVkIGluc3RlYWQgb2YgcmViYXNlZCBhbnl3YXkuCj4gCj4gV2hh
dCBhY3R1YWxseSBtYXR0ZXJzIGlzICpmaW5pc2hpbmcqIHRoZSBqb2IuICBXaGF0IGRvZXMgdGhh
dCB0YWtlPwo+IAo+ICogQ29uc2Vuc3VzIG9uIHRoZSBoYW5kLXdyaXR0ZW4gcGFydC4gIEkgdGhp
bmsgd2UncmUgYmFzaWNhbGx5IHRoZXJlLCB3ZQo+ICAgIGp1c3Qgd2FudCB0byB3b3JrIGluIGEg
ZmV3IG1vcmUgdHdlYWtzLgoKSSdsbCByZXNlbmQgdG9kYXksIG1vc3QgcHJvYmFibHkgaXQgd291
bGQgYmUgeW91ciB2ZXJzaW9uIG9mIGNvY2NpbmVsbGUgKGlmIEkgd2lsbCBub3QgZmluZCByZWFs
IHNlbnNlIGluIGZuIGluaGVyaXRhbmNlKS4KCj4gCj4gKiBTcGxpdCB0aGUgZ2VuZXJhdGVkIHBh
cnQgaW50byByZXZpZXdhYmxlIGJhdGNoZXMsIHJlZ2VuZXJhdGluZyBwYXRjaGVzCj4gICAgYXMg
bmVjZXNzYXJ5LiAgU29saWNpdCByZXZpZXcuICBGaXJzdCBiYXRjaCBpcyBwYXJ0IG9mIHRoaXMg
c2VyaWVzLAo+ICAgIGFuZCB2OSBsb29rcyByZWFkeSB0byBtZS4gIEkgYXNzdW1lIHlvdSdsbCBw
cmVwYXJlIHRoZSByZW1haW5pbmcKPiAgICBiYXRjaGVzLgoKWWVzIEkgd2lsbC4gVGhpcyBpcyB0
aGUgcmV3YXJkIGZvciB0aGlzIHdvcms6IHNlbmQgb25lIGh1bmRyZWQgZ2VuZXJhdGVkIHBhdGNo
ZXMgOikpCgo+IAo+ICogUXVldWUgdXAgYmF0Y2hlcyBhcyB0aGV5IGJlY29tZSByZWFkeSwgcG9z
dCBwdWxsIHJlcXVlc3RzLiAgSSBjYW4gZG8KPiAgICB0aGF0Lgo+IAo+ICogVXBkYXRlIHRoZSBR
QVBJIGNvZGUgZ2VuZXJhdG9yIHRvIHRoZSBuZXcgRXJyb3IgdXNhZ2UuICBJIGNhbiBkbyB0aGF0
Lgo+IAoKR3JlYXQhCgotLSAKQmVzdCByZWdhcmRzLApWbGFkaW1pcgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
