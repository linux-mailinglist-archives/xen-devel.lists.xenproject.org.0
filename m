Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2611840E7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 07:43:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCdzb-0002D0-6s; Fri, 13 Mar 2020 06:40:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JFxv=46=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jCdza-0002Ct-CY
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 06:40:22 +0000
X-Inumbo-ID: 8204741e-64f5-11ea-b34e-bc764e2007e4
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.125]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8204741e-64f5-11ea-b34e-bc764e2007e4;
 Fri, 13 Mar 2020 06:40:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+xrlYWLu4LGFU3XH6CumLzQ7MXHAZTYBQtbhnwFdwgC4ivqmeGPVyynobwSNXWI7mG3qn2RtO1eL/NXRN8ELYbTpYh0VlnXyKNt6TLTi87xFfnwuR7LuLxJ/dSluI8aZn7nMYDZ9KC8gjpkZ07W615Uc85QS0yqkTPOk8OF4m+UNxz75OuVYlQv9vUUpybIoIrXcMIktb/2PYVNuIsAaoauScdgPG7kD8YvN3N8jxmf7OQeuUx113Mjn6h2AKxGibQ4BMMxVPFdEHly4Pp3T78T9h8Z+x6K9u6qRn3s3F7R/rUEq1ZbqkU13d2RcWRigJOf821DJoXbQ/wgxXvtJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NB435gRqOYpAHDM0OyWF4GwUPGf1vOMVfyWXIvLcsV8=;
 b=bD7KIbbzkUed7k9fV4goOkbgT1vdo1UeTdFDs533HA+OzY0+lUmFTuoGVrFFXdKQzqaEb1Gk7uMDPl5CCe7cn/OPoFHmdm0tYdNzq+btj3xzllT+y/4wGxNs2+HDJ6gMYr1RpbGzxVkL6vt4zN7c2wbXqvrtFyKPAUDV8/AbEOOIP1ge6qwBIkMF0e57hQWQkora2ekRyJYPJ6gV6DPk1wABm4gzjNL5zPjHYV60IvhbKUC0aYj5m8B5unrRCI0/SnJo7AWnNppS04jY99VPxX7oNvm+1M+SSj0xuSoNOu7aXwI6eU3tYCFUNQeGRntT7HrMaiNo5qNYxk7JrvoHAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NB435gRqOYpAHDM0OyWF4GwUPGf1vOMVfyWXIvLcsV8=;
 b=mGMqdZ4HxYqk0UF6ph9XDFYeySefO0QaYmgowW4eufgHFI3vFRrO/MPOn+Daji1MrM1eghJ2O1Qr/VFnQB6JYzeRrfQEKDXGQeY9R+ntSUukmPaAOPW0MgmGgCVAGNnhAP5bsEisVAZ4oSaaSsRtenZU/JQ1FOHYwh4myjER8nk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB3797.eurprd08.prod.outlook.com (20.178.89.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.14; Fri, 13 Mar 2020 06:40:19 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2814.016; Fri, 13 Mar 2020
 06:40:19 +0000
To: Markus Armbruster <armbru@redhat.com>
References: <20200312085936.9552-1-vsementsov@virtuozzo.com>
 <87y2s5ps69.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200313094016799
Message-ID: <522ccf48-3148-9b1c-cd1b-7d9bdac26e26@virtuozzo.com>
Date: Fri, 13 Mar 2020 09:40:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <87y2s5ps69.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-ClientProxiedBy: HE1P190CA0027.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::16)
 To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by
 HE1P190CA0027.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Fri, 13 Mar 2020 06:40:18 +0000
X-Tagtoolbar-Keys: D20200313094016799
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2719b82-4795-4e4e-24ec-08d7c71965c4
X-MS-TrafficTypeDiagnostic: AM6PR08MB3797:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3797E2D1DC3D0258CA5C4CFDC1FA0@AM6PR08MB3797.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(136003)(376002)(39850400004)(396003)(199004)(52116002)(4326008)(16576012)(66476007)(66556008)(66946007)(36756003)(2906002)(54906003)(86362001)(31696002)(316002)(966005)(7416002)(26005)(6486002)(5660300002)(8936002)(16526019)(31686004)(186003)(81166006)(6916009)(8676002)(81156014)(2616005)(478600001)(956004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB3797;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FZCvaMJBt6VPzdm5sBtp9zzXmDePeenL/h3dbmEazFpKwWHLqQXDeYbZ9/QEdaNND1SZIOwlhpa94fCMY3DJLPiRxxAEk0jky44GTVut/Vh5zPxfgg7KYosr89U/n9N3eKvSFuCzWWRDZ4Q4Vv0itpaaTdItc5mcS6FcZOoY9N4vWX+1Fnj8GbFrHAoNuHDKGhF8HdIdwAkr7RqHi8sstj6pBxyI2SJY3+3N5vNDyFgN+2v4aH7iDhv39CrGCo0TbXDILyD7U5CLM141J8vjJXEx4u5jeZK9OBIn3xi4FBt3+mCC2w++/LlUUl8/ONte7gBPoh0SLB3w3hE7C/VuUEh+i6tDcdFSXekpPJ24hx+2YOIP+foJpfaSq5vx1/Yt4QncoBotgQkaTZHv28xU1snTb03xn+xp4uujp13GRr6w+XjjSNrriT7O70zKZlT2dUSFqM6RuUBS0xqskZzzW1qluf3TBBRwvp3e++2lEPjcw6zLW63BCptXswsE2jOCrdqlDb5uGwXkYhcSEDHNVw==
X-MS-Exchange-AntiSpam-MessageData: LwieS98pY0QSVFAYc/La41d9CQgARd/8rfcfsQeZhdZo2jrq8hd2d21p3PIxfPzRtdcygWGtNiG5oC8tOTOmtNovVhGuy2icjats1fyRzlGF3HTcAeCSi0ZI+5LZYZDn9ZvlYj3b4va2ELhJoXE3Qg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2719b82-4795-4e4e-24ec-08d7c71965c4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 06:40:19.3286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEbd0GrlJ4ktA8EhCuVUv093nkX/4bI5gpkUSCM9taAJsS+BVqntlbHjiePbVo0zPZzJFIGE4TI53LN2oUXuuIt1q9+yHTFalPfBEWjBN44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3797
Subject: Re: [Xen-devel] [PATCH v9 00/10] error: auto propagated local_err
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
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
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

MTIuMDMuMjAyMCAxNzoyNCwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6Cj4gVmxhZGltaXIgU2Vt
ZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4gCj4+
IHY5Cj4+IDAxOiBBIGxvdCBvZiByZXdvcmRpbmdzIFt0aGFua3MgdG8gRXJpY10KPj4gICAgICBT
dGlsbCwga2VlcCBhbGwgci1iIG1hcmtzLCBhc3N1bWluZyB0aGF0IHRoZXkgYXJlIG1vc3RseSBh
Ym91dCBtYWNybyBkZWZpbml0aW9uCj4+IDAyOiBzaWduaWZpY2FudCBjaGFuZ2VzIGFyZToKPj4g
ICAgICAxLiBEbyBub3QgbWF0Y2ggZG91YmxlIHByb3BhZ2F0aW9uIHBhdHRlcm4gaW4gRVJSUF9B
VVRPX1BST1BBR0FURS1hZGRpbmcgcnVsZQo+PiAgICAgIDIuIEludHJvZHVjZSBlcnJwLT5fX19f
LT5lcnJwIHNjaGVtZSB0byBtYXRjaCBvbmx5IGZ1bmN0aW9ucyBtYXRjaGVkIGJ5IHJ1bGUxCj4+
ICAgICAgICAgaW4gcnVsZXMgaW5oZXJpdGVkIGZyb20gcnVsZTEKPj4gICAgICAzLiBBZGQgcnVs
ZXMgdG8gd2FybiBhYm91dCB1bnVzdWFsIHBhdHRlcm5zCj4+Cj4+ICAgICAgQWxzbywgYWRkIGxp
bmUgdG8gTUFJTlRBSU5FUlMgdG8ga2VlcCBlcnJvciByZWxhdGVkIGNvY2NpbmVsbGUgc2NyaXB0
cyB1bmRlcgo+PiAgICAgIEVycm9yIHNlY3Rpb24uCj4+IDA3OiBhZGQgQ2hyaXN0aWFuJ3Mgci1i
Cj4+IDA5OiBhZGQgRXJpYydzIHItYgo+PiAxMDogYSBiaXQgb2YgY29udGV4dCBpbiB4ZW5fYmxv
Y2tfaW90aHJlYWRfY3JlYXRlICBhbmQgcW1wX29iamVjdF9hZGQoKQo+PiAgICAgIHNpZ25hdHVy
ZSBhcmUgY2hhbmdlZC4gUGF0Y2ggY2hhbmdlIGlzIG9idmlvdXMsIHNvIEkga2VlcCBQYXVsJ3Mg
ci1iCj4+Cj4+IHY5IGlzIGF2YWlsYWJsZSBhdAo+PiAgIGh0dHBzOi8vc3JjLm9wZW52ei5vcmcv
c2NtL352c2VtZW50c292L3FlbXUuZ2l0ICN0YWcgdXAtYXV0by1sb2NhbC1lcnItcGFydEktdjkK
PiAKPiBEaWQgeW91IGZvcmdldCB0byBwdXNoIHRoZSB0YWc/CgpTZWVtcyBJJ3ZlIHB1c2hlZCBp
dCB0byB3cm9uZyByZW1vdGUuIERvbmUgbm93LgoKPiAKPj4gdjggaXMgYXZhaWxhYmxlIGF0Cj4+
ICAgaHR0cHM6Ly9zcmMub3BlbnZ6Lm9yZy9zY20vfnZzZW1lbnRzb3YvcWVtdS5naXQgI3RhZyB1
cC1hdXRvLWxvY2FsLWVyci1wYXJ0SS12OAo+IFsuLi5dCj4gCgoKLS0gCkJlc3QgcmVnYXJkcywK
VmxhZGltaXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
