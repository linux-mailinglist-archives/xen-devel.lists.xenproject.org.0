Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6482117B91C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 10:20:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA97o-0002m5-8m; Fri, 06 Mar 2020 09:18:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwnm=4X=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jA97m-0002m0-LA
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 09:18:31 +0000
X-Inumbo-ID: 709b4f5a-5f8b-11ea-a77d-12813bfff9fa
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.91]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 709b4f5a-5f8b-11ea-a77d-12813bfff9fa;
 Fri, 06 Mar 2020 09:18:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvGpG+d52L8loygRotQdeAIErqcXn/FGN/40eTCFei6RyuMnHXIysxtLREbU0Ge4jzNP6f4uPnLilJnPiRvrtJ8CtFeYCd+I+3Ieo5I8Yg8dpD/AYidx1WvgpRLiQNBF3uf+eWi0RWnGEQLh80VLRaU/X8D8Hix0kSJKLHusRVbcN1HwwjL5nsxHYiNS8R4wxC/QvFlnykN0oL+BP+DPzM7d8GI1a3LCP++bn7AfeEhe4hR5BrSUuP8qZtV0nvmdknbvLSHSWBg6Fd7zdhVjwsYkEm5X45zq6Jpb2vwWH7OGWiIqCl0ibtJOcemIFHKnWyDAcoZ8SHmofWjXjF8vCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95jCxrGKzOtPnhruszenmv4/DYv3dPCtLMe3bX3oBmY=;
 b=i7PsQaKlcqYNfgBQvEBYPopS7DNB+Dtg1o9jGL4NmLloIxzJbuayG++YHsWxqNtr+acVpXeQuCrMARxr8cQ7oGfIkNTvYAnzWq5chXWr9hPPFnrWaeUttuSvcl5Wq8uZsTzRgZS8R2TKOrohK/42aOZELenoRqcSIahsu+8Oi2Yart+2xg5CD1ROkSqj/rIPUweqRc4PBhkXgqnJHgFkwVjdVstEeXWDUAImoeejprUIntn4cGkQGJ/OiPF6mgOz3zJD3SpK7JrDwPWVTiJwq0C7KE/JKuVNugBEonw5oFpkYViyIZmDTeybLCAx7aBGuxg7CkJOBwu7I9Gz1aOpEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95jCxrGKzOtPnhruszenmv4/DYv3dPCtLMe3bX3oBmY=;
 b=hI+Qmmoq6hq1OjjQ5PFO8qzbx0fgE+HQBi0rICvcz+mDmiY7789wLXS3S1GLvixJHDKPhOdU5KpiBHh/z3/Bt1skm+/jAnCSa2AdJv6Nd1yRkJQnRupCZjxEdPocXbgoOwfr9nlODZhoa6us39dArqxRurp2aoFa51bhGcLhFFM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB4440.eurprd08.prod.outlook.com (20.179.6.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Fri, 6 Mar 2020 09:18:26 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2793.013; Fri, 6 Mar 2020
 09:18:26 +0000
To: Paul Durrant <paul@xen.org>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-11-vsementsov@virtuozzo.com>
 <CACCGGhAdx_OX-V59omuSQZccUWBNft063BO4-TPAw=JHNbuGoQ@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200306121823677
Message-ID: <fcb2a459-8732-8bb9-26f9-498526dedb28@virtuozzo.com>
Date: Fri, 6 Mar 2020 12:18:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <CACCGGhAdx_OX-V59omuSQZccUWBNft063BO4-TPAw=JHNbuGoQ@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: HE1PR05CA0371.eurprd05.prod.outlook.com
 (2603:10a6:7:94::30) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by
 HE1PR05CA0371.eurprd05.prod.outlook.com (2603:10a6:7:94::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16 via Frontend Transport; Fri, 6 Mar 2020 09:18:26 +0000
X-Tagtoolbar-Keys: D20200306121823677
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4594aebe-1a5d-449c-5143-08d7c1af53e0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4440:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4440558EA80B61CE000DE1BFC1E30@AM6PR08MB4440.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(376002)(396003)(39850400004)(136003)(199004)(189003)(66476007)(478600001)(66556008)(5660300002)(86362001)(66946007)(6916009)(6486002)(52116002)(8676002)(81156014)(81166006)(8936002)(2616005)(16576012)(2906002)(31696002)(956004)(31686004)(4326008)(316002)(54906003)(26005)(186003)(16526019)(7416002)(6666004)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB4440;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: au3Fa8KfyZwfRn1C3SalMLxrobilb7/tDfCyR4Lyr0ru8YQa1m3R/7rQ9OKo5PnD+jZbdDLJV6SPfCdcbrSH9ge0euNXXIT02bUIF2HdSsnEBHo3a5zIgz9TIoVt664QrZuzBRw2VqkF78a9o5PT6cbIUAALB/YaKQdDPW+XbN/dmCF1ugN1OenG61Ew344+aAA9KfzT5caY0By4jgB6UANIa3uj2ShvwbytqhmBxbbPRkzd/8OtwoWBFGmetEQ2mia6rItsc+9Keh21B/YrSdGjI+mkIjur4t4J6oXl/JqNRLKxIaVh0rLel2MvR7hywvQbskI4RwjVThA2PNJvx/pWBspx/4/jFqOPX/AFWFTXB+gol+yijiNLb8Vg9ZfT3avh3e0WYiWoOjlbJ5d3PfcuvB5xDDLZ07SJtze2nHy+qLpcGRtzhuM1d7yIUobc
X-MS-Exchange-AntiSpam-MessageData: GkM21RfFf77biS5ejrlIrWBR1tZTjjniFHsvQ3FglnAIgAkVahYTwtJf3/UNXMB9DBMjE0RI92wJYqY3AcqXUA3BqzxXzH0j3XGU/8Nj4y9D7UZR1jbuU6k+EQtYIMQMRjxY4MVVZRHtL7Y3jgBkXQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4594aebe-1a5d-449c-5143-08d7c1af53e0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 09:18:26.8051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvnbU0KZ154UtsLVnFY8P9QIbIi+F/2HxLNdyEbFH2Hx+m+A3Xphftrf8Yw5g6MFCFKSVKVtCx1rb+s4ujqVLGCRjFTlKpEynqNpo6H5sac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4440
Subject: Re: [Xen-devel] [PATCH v8 10/10] xen: introduce ERRP_AUTO_PROPAGATE
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
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Max Reitz <mreitz@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MDYuMDMuMjAyMCAxMjoxMiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IE9uIEZyaSwgNiBNYXIgMjAy
MCBhdCAwNToxNiwgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeQo+IDx2c2VtZW50c292QHZp
cnR1b3p6by5jb20+IHdyb3RlOgo+Pgo+PiBJZiB3ZSB3YW50IHRvIGFkZCBzb21lIGluZm8gdG8g
ZXJycCAoYnkgZXJyb3JfcHJlcGVuZCgpIG9yCj4+IGVycm9yX2FwcGVuZF9oaW50KCkpLCB3ZSBt
dXN0IHVzZSB0aGUgRVJSUF9BVVRPX1BST1BBR0FURSBtYWNyby4KPj4gT3RoZXJ3aXNlLCB0aGlz
IGluZm8gd2lsbCBub3QgYmUgYWRkZWQgd2hlbiBlcnJwID09ICZlcnJvcl9mYXRhbAo+PiAodGhl
IHByb2dyYW0gd2lsbCBleGl0IHByaW9yIHRvIHRoZSBlcnJvcl9hcHBlbmRfaGludCgpIG9yCj4+
IGVycm9yX3ByZXBlbmQoKSBjYWxsKS4gIEZpeCBzdWNoIGNhc2VzLgo+Pgo+PiBJZiB3ZSB3YW50
IHRvIGNoZWNrIGVycm9yIGFmdGVyIGVycnAtZnVuY3Rpb24gY2FsbCwgd2UgbmVlZCB0bwo+PiBp
bnRyb2R1Y2UgbG9jYWxfZXJyIGFuZCB0aGVuIHByb3BhZ2F0ZSBpdCB0byBlcnJwLiBJbnN0ZWFk
LCB1c2UKPj4gRVJSUF9BVVRPX1BST1BBR0FURSBtYWNybywgYmVuZWZpdHMgYXJlOgo+PiAxLiBO
byBuZWVkIG9mIGV4cGxpY2l0IGVycm9yX3Byb3BhZ2F0ZSBjYWxsCj4+IDIuIE5vIG5lZWQgb2Yg
ZXhwbGljaXQgbG9jYWxfZXJyIHZhcmlhYmxlOiB1c2UgZXJycCBkaXJlY3RseQo+PiAzLiBFUlJQ
X0FVVE9fUFJPUEFHQVRFIGxlYXZlcyBlcnJwIGFzIGlzIGlmIGl0J3Mgbm90IE5VTEwgb3IKPj4g
ICAgICZlcnJvcl9mYXRhbCwgdGhpcyBtZWFucyB0aGF0IHdlIGRvbid0IGJyZWFrIGVycm9yX2Fi
b3J0Cj4+ICAgICAod2UnbGwgYWJvcnQgb24gZXJyb3Jfc2V0LCBub3Qgb24gZXJyb3JfcHJvcGFn
YXRlKQo+Pgo+PiBUaGlzIGNvbW1pdCBpcyBnZW5lcmF0ZWQgYnkgY29tbWFuZAo+Pgo+PiAgICAg
IHNlZCAtbiAnL15YODYgWGVuIENQVXMkLywvXiQve3MvXkY6IC8vcH0nIE1BSU5UQUlORVJTIHwg
XAo+PiAgICAgIHhhcmdzIGdpdCBscy1maWxlcyB8IGdyZXAgJ1wuW2hjXSQnIHwgXAo+PiAgICAg
IHhhcmdzIHNwYXRjaCBcCj4+ICAgICAgICAgIC0tc3AtZmlsZSBzY3JpcHRzL2NvY2NpbmVsbGUv
YXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kgXAo+PiAgICAgICAgICAtLW1hY3JvLWZpbGUgc2Ny
aXB0cy9jb2NjaS1tYWNyby1maWxlLmggXAo+PiAgICAgICAgICAtLWluLXBsYWNlIC0tbm8tc2hv
dy1kaWZmIC0tbWF4LXdpZHRoIDgwCj4+Cj4+IFJlcG9ydGVkLWJ5OiBLZXZpbiBXb2xmIDxrd29s
ZkByZWRoYXQuY29tPgo+PiBSZXBvcnRlZC1ieTogR3JlZyBLdXJ6IDxncm91Z0BrYW9kLm9yZz4K
Pj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNv
dkB2aXJ0dW96em8uY29tPgo+IAo+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVu
Lm9yZz4KPiAKCgpUaGFua3MgZm9yIHJldmlld2luZyEKCi0tIApCZXN0IHJlZ2FyZHMsClZsYWRp
bWlyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
