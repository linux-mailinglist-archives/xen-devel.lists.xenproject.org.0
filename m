Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12971829F5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 08:45:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCIUJ-0000gj-II; Thu, 12 Mar 2020 07:42:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8LiD=45=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jCIUH-0000ge-KA
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 07:42:38 +0000
X-Inumbo-ID: 08623d96-6435-11ea-b34e-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.97]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08623d96-6435-11ea-b34e-bc764e2007e4;
 Thu, 12 Mar 2020 07:42:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxb3xGKBqMtfCV6MX/78U2EVD2YfSUZ1ZTd/U5QHDERnc4wHPvyI939CRpw8jPEnAfQhCZKwC+HFlvl5wUMoSvpq0UfK/wNJ1je8mmPQElBBEBmNIk3mFKjHzjafnZYsV3qE6G1CUgtUGA/S8mrVzBgJtWg16oLVAgfnU92im07iMIX1Udrm3ulOG6asIcnsu8QJ3ldfPlbEERqawTkYgzyeCVDTiWftIhlkTeAd9gKtSdKSm4X4zAyRMhR1OOwcHNX+32hLIZSRqHeBI8xyD1BTZwLsYwT0l+aM3tKYyRMuGbilX8xgEu9eegrzCZ8pqK3qF7NmjQsH3wZShzW1hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GMRDENyPa5vHklTvA/upKYzvGWr9kL0BSgqBktBkcQ=;
 b=mvoVWwzHZ215FfYUDpnIa8pyk5hZ17XJv/JOYfj/2SXzfaaq2wSFdDhIGetXzMPZ+CInzC1Vi30jvVJDuEjZn5UbfeiphmqkA8VkXsrViToXk1gNtp0n7IRcSnQvo+lZsjfEAabBRU/lRTuWn5AUjHr/W7tZZtTbiQWCWkpRpnxx5uuWdQs8H1ftYDgNFmg/NzpCDHMKaBDh8U87yUYPE7MwOKygZcuSoaQYKQzt7/C2LM5czVUqGgNWTFc9jdM5ujjsPG0ShSrMRjTmUT0KO1jcLtXzx6NPR9ecXQEcd+B73QX8yOGY81YbuoSgo8q6LBEETeJwlflphY8+cXPUBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GMRDENyPa5vHklTvA/upKYzvGWr9kL0BSgqBktBkcQ=;
 b=qyKdPugVvlgez4KHS0eEMAobiM9QLHl5eAKs7cgMIOhCW8rP4F9UANmXx1ZMmt+nME0SbMQ0LP8U/lZoarhayBdudUOYyEkTSsR3TG5chq1onUbutDkP+kasbv47t7cS+nEbPNVjK+1CWNrliF5ZmxVJeJ05d1yIHvyAeQP3tcs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB4982.eurprd08.prod.outlook.com (10.255.122.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.14; Thu, 12 Mar 2020 07:42:30 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2814.007; Thu, 12 Mar 2020
 07:42:30 +0000
To: Markus Armbruster <armbru@redhat.com>
References: <20200306051536.27803-1-vsementsov@virtuozzo.com>
 <20200306051536.27803-3-vsementsov@virtuozzo.com>
 <87lfo997hs.fsf@dusky.pond.sub.org>
 <fda76f8a-bb62-d867-d7b4-7cf8caf0489e@virtuozzo.com>
 <87a74ngriw.fsf@dusky.pond.sub.org>
 <71ada30b-c72b-6251-cc38-877ddd4156a8@virtuozzo.com>
 <87h7yvx8ce.fsf@dusky.pond.sub.org>
 <a16e5dee-7f2b-236d-1e71-f40c75cb5902@virtuozzo.com>
 <87blp2rq92.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200312104227555
Message-ID: <554d6b37-1fc7-ca8b-258a-2280462f903c@virtuozzo.com>
Date: Thu, 12 Mar 2020 10:42:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <87blp2rq92.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-ClientProxiedBy: HE1PR0901CA0057.eurprd09.prod.outlook.com
 (2603:10a6:3:45::25) To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by
 HE1PR0901CA0057.eurprd09.prod.outlook.com (2603:10a6:3:45::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.20 via Frontend Transport; Thu, 12 Mar 2020 07:42:29 +0000
X-Tagtoolbar-Keys: D20200312104227555
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7326355f-3204-4f6d-bc04-08d7c658eb4b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4982:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4982D87B69F837BD65BE0240C1FD0@AM6PR08MB4982.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(39850400004)(366004)(136003)(199004)(6916009)(81156014)(7416002)(52116002)(16576012)(8936002)(8676002)(36756003)(31686004)(316002)(81166006)(6486002)(2616005)(4326008)(478600001)(54906003)(956004)(26005)(66946007)(66556008)(31696002)(2906002)(86362001)(5660300002)(186003)(16526019)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB4982;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6q/BD6NTClHN2UpeNoLhA3kRGRxZb9N/XuIy8vacRNlVbvNbcTWDWSR9wsejxaQ6KlMAaE1CbhnOkllhw7d91hx321O8OKO3wyihoc4pjR73peR7IO4Y+HEDAesbnDbjhAKxIJ0Nkay1yeUx5nvmQxtu0NEKgU6ZRiebU54VP8WMD1at/1FrNb4mM4BEjOH1tfyUdrddlCNClgVJfNIkMifTnAyUNYAHjpmdfgr58VuxMHKp5lCjsNRqESCi0zcLmhCnx7Ae+WIQxE3vB2h8RuiZ2ljFnx40XEQwhT5ZJt0q4+RC8RmL2poXF9252dT64tA/i7fV2yosUreGjILaGQyNdONsgKgnVj5Ln2qtx5p/+NRGJkgsxRdBa/sNWb5NlqE+0Fq0Xjr5aTtxgrdf/8+3DcxACV1KgBJ0Ippw1xxTXWE6lCy+Ef6VbDl3XGCi
X-MS-Exchange-AntiSpam-MessageData: wDQyW9vmB5yY1uvul9x9rs/2bNhSk8HPQz0gwoBfTqGxCtdB4k9bXlnbDA7PzcOzcUICy4QAVI0h+zk3j8xippuu+xIVYSkfTfrMkUagWoFMyyYaZpXu8e6DXL1dnG1nAMULBZSILKaSt2Jv3KiOpw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7326355f-3204-4f6d-bc04-08d7c658eb4b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2020 07:42:30.6153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNZ4IAm8CXo8c4cEDzpMt9BcKWtBx1NNoQtxAkk/CZNCg4ImdEGOt16z1GkDrzY7azRbgeLT7TGgfakEtkQzmkrU5JCcF1vIQSi/2W1Zxmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4982
Subject: Re: [Xen-devel] [PATCH v8 02/10] scripts: add coccinelle script to
 use auto propagated errp
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
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

MTIuMDMuMjAyMCAxMDoyMywgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6Cj4gVmxhZGltaXIgU2Vt
ZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4gCj4+
IDExLjAzLjIwMjAgMTc6NDEsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+Pj4gVmxhZGltaXIg
U2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4+
Pgo+Pj4+IDExLjAzLjIwMjAgMTI6MzgsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+Pj4+PiBW
bGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdy
aXRlczoKPj4+Pj4KPj4+Pj4+IDA5LjAzLjIwMjAgMTI6NTYsIE1hcmt1cyBBcm1icnVzdGVyIHdy
b3RlOgo+Pj4+Pj4+IFN1Z2dlc3QKPj4+Pj4+Pgo+Pj4+Pj4+ICAgICAgICAgc2NyaXB0czogQ29j
Y2luZWxsZSBzY3JpcHQgdG8gdXNlIGF1dG8tcHJvcGFnYXRlZCBlcnJwCj4+Pj4+Pj4KPj4+Pj4+
PiBvcgo+Pj4+Pj4+Cj4+Pj4+Pj4gICAgICAgICBzY3JpcHRzOiBDb2NjaW5lbGxlIHNjcmlwdCB0
byB1c2UgRVJSUF9BVVRPX1BST1BBR0FURSgpCj4+Pj4+Pj4KPj4+Pj4+PiBWbGFkaW1pciBTZW1l
bnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292QHZpcnR1b3p6by5jb20+IHdyaXRlczoKPj4+Pj4g
Wy4uLl0KPj4+Pj4+Pj4gKy8vIE5vdGUsIHRoYXQgd2UgdXBkYXRlIGV2ZXJ5dGhpbmcgcmVsYXRl
ZCB0byBtYXRjaGVkIGJ5IHJ1bGUxIGZ1bmN0aW9uIG5hbWUKPj4+Pj4+Pj4gKy8vIGFuZCBsb2Nh
bF9lcnIgbmFtZS4gV2UgbWF5IG1hdGNoIHNvbWV0aGluZyBub3QgcmVsYXRlZCB0byB0aGUgcGF0
dGVybgo+Pj4+Pj4+PiArLy8gbWF0Y2hlZCBieSBydWxlMS4gRm9yIGV4YW1wbGUsIGxvY2FsX2Vy
ciBtYXkgYmUgZGVmaW5lZCB3aXRoIHRoZSBzYW1lIG5hbWUKPj4+Pj4+Pj4gKy8vIGluIGRpZmZl
cmVudCBibG9ja3MgaW5zaWRlIG9uZSBmdW5jdGlvbiwgYW5kIGluIG9uZSBibG9jayBmb2xsb3cg
dGhlCj4+Pj4+Pj4+ICsvLyBwcm9wYWdhdGlvbiBwYXR0ZXJuIGFuZCBpbiBvdGhlciBibG9jayBk
b2Vzbid0LiBPciB3ZSBtYXkgaGF2ZSBzZXZlcmFsCj4+Pj4+Pj4+ICsvLyBmdW5jdGlvbnMgd2l0
aCB0aGUgc2FtZSBuYW1lIChmb3IgZGlmZmVyZW50IGNvbmZpZ3VyYXRpb25zKS4KPj4+Pj4+Pgo+
Pj4+Pj4+IENvbnRleHQ6IHJ1bGUxIG1hdGNoZXMgZnVuY3Rpb25zIHRoYXQgaGF2ZSBhbGwgdGhy
ZWUgb2YKPj4+Pj4+Pgo+Pj4+Pj4+ICogYW4gRXJyb3IgKiplcnJwIHBhcmFtZXRlcgo+Pj4+Pj4+
Cj4+Pj4+Pj4gKiBhbiBFcnJvciAqbG9jYWxfZXJyID0gTlVMTCB2YXJpYWJsZSBkZWNsYXJhdGlv
bgo+Pj4+Pj4+Cj4+Pj4+Pj4gKiBhbiBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxfZXJyKSBv
ciBlcnJvcl9wcm9wYWdhdGVfcHJlcGVuZChlcnJwLAo+Pj4+Pj4+ICAgICAgIGxvY2FsX2Vyciwg
Li4uKSBleHByZXNzaW9uLCB3aGVyZSBAZXJycCBpcyB0aGUgcGFyYW1ldGVyIGFuZAo+Pj4+Pj4+
ICAgICAgIEBsb2NhbF9lcnIgaXMgdGhlIHZhcmlhYmxlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSWYgSSB1
bmRlcnN0YW5kIHlvdSBjb3JyZWN0bHksIHlvdSdyZSBwb2ludGluZyBvdXQgdHdvIHBvdGVudGlh
bCBpc3N1ZXM6Cj4+Pj4+Pj4KPj4+Pj4+PiAxLiBUaGlzIHJ1bGUgY2FuIG1hdGNoIGZ1bmN0aW9u
cyBydWxlMSBkb2VzIG5vdCBtYXRjaCBpZiB0aGVyZSBpcwo+Pj4+Pj4+IGFub3RoZXIgZnVuY3Rp
b24gd2l0aCB0aGUgc2FtZSBuYW1lIHRoYXQgcnVsZTEgZG9lcyBtYXRjaC4KPj4+Pj4+Pgo+Pj4+
Pj4+IDIuIFRoaXMgcnVsZSBtYXRjaGVzIGluIHRoZSBlbnRpcmUgZnVuY3Rpb24gbWF0Y2hlZCBi
eSBydWxlMSwgZXZlbiB3aGVuCj4+Pj4+Pj4gcGFydHMgb2YgdGhhdCBmdW5jdGlvbiB1c2UgYSBk
aWZmZXJlbnQgQGVycnAgb3IgQGxvY2FsX2Vyci4KPj4+Pj4+Pgo+Pj4+Pj4+IEkgZmlndXJlIHRo
ZXNlIGFwcGx5IHRvIGFsbCBydWxlcyB3aXRoIGlkZW50aWZpZXIgcnVsZTEuZm4sIG5vdCBqdXN0
Cj4+Pj4+Pj4gdGhpcyBvbmUuICBDb3JyZWN0Pwo+Pj4+Pj4+Cj4+Pj4+Pj4gUmVnYXJkaW5nIDEu
ICBUaGVyZSBtdXN0IGJlIGEgYmV0dGVyIHdheSB0byBjaGFpbiBydWxlcyB0b2dldGhlciwgYnV0
IEkKPj4+Pj4+PiBkb24ndCBrbm93IGl0Lgo+Pj4+Pj4KPj4+Pj4+IEhtbSwgd2hhdCBhYm91dCBz
b21ldGhpbmcgbGlrZSB0aGlzOgo+Pj4+Pj4KPj4+Pj4+IEBydWxlMSBkaXNhYmxlIG9wdGlvbmFs
X3F1YWxpZmllciBleGlzdHNACj4+Pj4+PiBpZGVudGlmaWVyIGZuLCBsb2NhbF9lcnI7Cj4+Pj4+
PiBzeW1ib2wgZXJycDsKPj4+Pj4+IEBACj4+Pj4+Pgo+Pj4+Pj4gICAgIGZuKC4uLiwgRXJyb3Ig
KioKPj4+Pj4+IC0gZXJycAo+Pj4+Pj4gKyBfX19lcnJwX2NvY2NpbmVsbGVfdXBkYXRpbmdfX18K
Pj4+Pj4+ICAgICAgICAsIC4uLikKPj4+Pj4+ICAgICB7Cj4+Pj4+PiAgICAgICAgIC4uLgo+Pj4+
Pj4gICAgICAgICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsKPj4+Pj4+ICAgICAgICAgLi4uCj4+
Pj4+PiAoCj4+Pj4+PiAgICAgICAgZXJyb3JfcHJvcGFnYXRlX3ByZXBlbmQoZXJycCwgbG9jYWxf
ZXJyLCAuLi4pOwo+Pj4+Pj4gfAo+Pj4+Pj4gICAgICAgIGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBs
b2NhbF9lcnIpOwo+Pj4+Pj4gKQo+Pj4+Pj4gICAgICAgICAuLi4KPj4+Pj4+ICAgICB9Cj4+Pj4+
Pgo+Pj4+Pj4KPj4+Pj4+IFsuLl0KPj4+Pj4+Cj4+Pj4+PiBtYXRjaCBzeW1ib2wgX19fZXJycF9j
b2NjaW5lbGxlX3VwZGF0aW5nX19fIGluIGZvbGxvd2luZyBydWxlcyBpbiBmdW5jdGlvbiBoZWFk
ZXIKPj4+Pj4+Cj4+Pj4+PiBbLi5dCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEAgZGlzYWJsZSBvcHRp
b25hbF9xdWFsaWZpZXJACj4+Pj4+PiBpZGVudGlmaWVyIGZuLCBsb2NhbF9lcnI7Cj4+Pj4+PiBz
eW1ib2wgZXJycDsKPj4+Pj4+IEBACj4+Pj4+Pgo+Pj4+Pj4gICAgIGZuKC4uLiwgRXJyb3IgKioK
Pj4+Pj4+IC0gX19fZXJycF9jb2NjaW5lbGxlX3VwZGF0aW5nX19fCj4+Pj4+PiArIGVycnAKPj4+
Pj4+ICAgICAgICAsIC4uLikKPj4+Pj4+ICAgICB7Cj4+Pj4+PiAgICAgICAgIC4uLgo+Pj4+Pj4g
ICAgIH0KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gLSBoYWNreSwgYnV0IHNlZW1zIG5vdCBtb3JlIGhh
Y2t5IHRoYW4gcHl0aG9uIGRldGVjdGlvbiwgYW5kIHNob3VsZCB3b3JrIGJldHRlcgo+Pj4+Pgo+
Pj4+PiBBcyBzaW1wbGUsIGZvcmNlZnVsIGFuZCB1bnN1YnRsZSBhcyBhIHNsZWRnZWhhbW1lci4g
IEkgbGlrZSBpdCA6KQo+Pj4+Pgo+Pj4+Cj4+Pj4KPj4+PiBIbW0sIG5vdCBzbyBzaW1wbGUuCj4+
Pj4KPj4+PiBJdCBsZWFkcyB0byByZWluZGVudGluZyBvZiBmdW5jdGlvbiBoZWFkZXIsIHdoaWNo
IGlzIGJhZC4KPj4+Cj4+PiBCZWNhdXNlIF9fX2VycnBfY29jY2luZWxsZV91cGRhdGluZ19fXyBp
cyBsb25nZXIgdGhhbiBlcnJwLCBJIGd1ZXNzLgo+Pj4gVHJ5IF9fX18/Cj4+Cj4+IEknbSBhZnJh
aWQgbm90LiBJdCdzIGJlY2F1c2UgaXQganVzdCBhZGRzIFxuLCB3aGVuIEkgZG8KPj4KPj4gLi4u
LAo+Pgo+PiAtIGVycnAKPj4gKyBfX19lcnJwX2NvY2NpbmVsbGVfdXBkYXRpbmdfX18KPj4gLC4u
Lgo+IAo+IEkgd2FzIHRoaW5raW5nIG9mIHNvbWV0aGluZyBsaWtlIHRoZSBhcHBlbmRlZCBwYXRj
aCwgd2hpY2ggaW4gbXkKPiAoc3VwZXJmaWNpYWwhKSB0ZXN0aW5nIGxlYXZlcyBhbG9uZSBuZXds
aW5lcyB1bmxlc3MgbGluZXMgYXJlIGxvbmcsIGJ1dAo+IGhhbmdzIGZvciBibG9jay5jLiAgT2gg
d2VsbC4KClNvcnJ5LCBJIGRpZG4ndCBzYXksIGJ1dCBJJ3ZlIGNoZWNrZWQgYW5kIEkgd2FzIHdy
b25nOiBfX18gIHdvcmtzIGZpbmUuIEJ1dAp3ZSBuZWVkIC0tbWF4LXdpZHRoIDgwLCBvdGhlcndp
c2UgY29jY2luZWxsZSB3cmFwcyBzb21lIGxpbmVzIHdoaWNoIGZpdCBpbnRvCjgwIGNoYXJhY3Rl
cnMgYW5kIHByb2R1Y2VzIGV4dHJhIGh1bmtzLgoKU28sIG5vdyBJJ20gcHJlcGFyaW5nIHY5IHdp
dGggZXJycC0+X19fXy0+ZXJycCBjb25jZXB0LiBJdCBkaWZmZXJzIGZyb20geW91ciBwYXRjaCBh
bmQgd29ya3Mgb24gYmxvY2suYwoKV2UgZG9uJ3QgbmVlZCB0byBzd2l0Y2ggYWxsIGVycnAgaW50
byBfX19fLCBpdCdzIGFuIGV4dHJhIGNvbXBsaWNhdGlvbi4gQ2hhbmdpbmcgbmFtZSBvbmx5IGlu
IGZ1bmN0aW9uCmhlYWRlciBpcyBlbm91Z2guIEFuZCBkb24ndCB3b3JyeSBhYm91dCBicm9rZW4g
Y29tcGlsYXRpb246IGl0J3MgYnJva2VuIGFueXdheSBhbW9uZyB0aGUgcnVsZXMsIGFuZCBhbGwK
aXMgT0sgYWZ0ZXIgYWxsIHJ1bGVzIGFwcGxpZWQuCgo+IAo+IAo+IGRpZmYgLS1naXQgYS9zY3Jp
cHRzL2NvY2NpbmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kgYi9zY3JpcHRzL2NvY2Np
bmVsbGUvYXV0by1wcm9wYWdhdGVkLWVycnAuY29jY2kKPiBpbmRleCBiZmYyNzRiZDZkLi40OTJh
NGRiODI2IDEwMDY0NAo+IC0tLSBhL3NjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQt
ZXJycC5jb2NjaQo+ICsrKyBiL3NjcmlwdHMvY29jY2luZWxsZS9hdXRvLXByb3BhZ2F0ZWQtZXJy
cC5jb2NjaQo+IEBAIC0zNSwxMiArMzUsMTIgQEAKPiAgIC8vIGVycm9yX3Byb3BhZ2F0ZV9wcmVw
ZW5kKCkuCj4gICBAIGRlcGVuZHMgb24gIShmaWxlIGluICJ1dGlsL2Vycm9yLmMiKSBkaXNhYmxl
IG9wdGlvbmFsX3F1YWxpZmllckAKPiAgIGlkZW50aWZpZXIgZm47Cj4gLWlkZW50aWZpZXIgX2Vy
cnAgIT0gZXJycDsKPiAraWRlbnRpZmllciBfZXJycDsKPiAgIEBACj4gICAKPiAgICBmbiguLi4s
Cj4gICAtICAgRXJyb3IgKipfZXJycAo+IC0rICAgRXJyb3IgKiplcnJwCj4gKysgICBFcnJvciAq
Kl9fX18KPiAgICAgICAsLi4uKQo+ICAgIHsKPiAgICgKPiBAQCAtNDgsNyArNDgsNyBAQCBpZGVu
dGlmaWVyIF9lcnJwICE9IGVycnA7Cj4gICAmCj4gICAgICAgIDwuLi4KPiAgIC0gICAgX2VycnAK
PiAtKyAgICBlcnJwCj4gKysgICAgX19fXwo+ICAgICAgICAuLi4+Cj4gICApCj4gICAgfQo+IEBA
IC02MywyNiArNjMsMjYgQEAgaWRlbnRpZmllciBfZXJycCAhPSBlcnJwOwo+ICAgLy8gYWxsIHBv
c3NpYmxlIGNvbnRyb2wgZmxvd3MgKG90aGVyd2lzZSwgaXQgd2lsbCBub3QgbWF0Y2ggc3RhbmRh
cmQgcGF0dGVybgo+ICAgLy8gd2hlbiBlcnJvcl9wcm9wYWdhdGUoKSBjYWxsIGlzIGluIGlmIGJy
YW5jaCkuCj4gICBAIGRpc2FibGUgb3B0aW9uYWxfcXVhbGlmaWVyIGV4aXN0c0AKPiAtaWRlbnRp
ZmllciBmbiwgbG9jYWxfZXJyLCBlcnJwOwo+ICtpZGVudGlmaWVyIGZuLCBsb2NhbF9lcnI7Cj4g
ICBAQAo+ICAgCj4gLSBmbiguLi4sIEVycm9yICoqZXJycCwgLi4uKQo+ICsgZm4oLi4uLCBFcnJv
ciAqKl9fX18sIC4uLikKPiAgICB7Cj4gICArICAgRVJSUF9BVVRPX1BST1BBR0FURSgpOwo+ICAg
ICAgIC4uLiAgd2hlbiAhPSBFUlJQX0FVVE9fUFJPUEFHQVRFKCk7Cj4gICAoCj4gLSAgICBlcnJv
cl9hcHBlbmRfaGludChlcnJwLCAuLi4pOwo+ICsgICAgZXJyb3JfYXBwZW5kX2hpbnQoX19fXywg
Li4uKTsKPiAgIHwKPiAtICAgIGVycm9yX3ByZXBlbmQoZXJycCwgLi4uKTsKPiArICAgIGVycm9y
X3ByZXBlbmQoX19fXywgLi4uKTsKPiAgIHwKPiAtICAgIGVycm9yX3ZwcmVwZW5kKGVycnAsIC4u
Lik7Cj4gKyAgICBlcnJvcl92cHJlcGVuZChfX19fLCAuLi4pOwo+ICAgfAo+ICAgICAgIEVycm9y
ICpsb2NhbF9lcnIgPSBOVUxMOwo+ICAgICAgIC4uLgo+ICAgKAo+IC0gICAgZXJyb3JfcHJvcGFn
YXRlX3ByZXBlbmQoZXJycCwgbG9jYWxfZXJyLCAuLi4pOwo+ICsgICAgZXJyb3JfcHJvcGFnYXRl
X3ByZXBlbmQoX19fXywgbG9jYWxfZXJyLCAuLi4pOwo+ICAgfAo+IC0gICAgZXJyb3JfcHJvcGFn
YXRlKGVycnAsIGxvY2FsX2Vycik7Cj4gKyAgICBlcnJvcl9wcm9wYWdhdGUoX19fXywgbG9jYWxf
ZXJyKTsKPiAgICkKPiAgICkKPiAgICAgICAuLi4gd2hlbiBhbnkKPiBAQCAtOTIsMTggKzkyLDE3
IEBAIGlkZW50aWZpZXIgZm4sIGxvY2FsX2VyciwgZXJycDsKPiAgIC8vIE1hdGNoIHNjZW5hcmlv
cyB3aXRoIHByb3BhZ2F0aW9uIG9mIGxvY2FsIGVycm9yIHRvIGVycnAuCj4gICBAcnVsZTEgZGlz
YWJsZSBvcHRpb25hbF9xdWFsaWZpZXIgZXhpc3RzQAo+ICAgaWRlbnRpZmllciBmbiwgbG9jYWxf
ZXJyOwo+IC1zeW1ib2wgZXJycDsKPiAgIEBACj4gICAKPiAtIGZuKC4uLiwgRXJyb3IgKiplcnJw
LCAuLi4pCj4gKyBmbiguLi4sIEVycm9yICoqX19fXywgLi4uKQo+ICAgIHsKPiAgICAgICAgLi4u
Cj4gICAgICAgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxMOwo+ICAgICAgICAuLi4KPiAgICgKPiAt
ICAgIGVycm9yX3Byb3BhZ2F0ZV9wcmVwZW5kKGVycnAsIGxvY2FsX2VyciwgLi4uKTsKPiArICAg
IGVycm9yX3Byb3BhZ2F0ZV9wcmVwZW5kKF9fX18sIGxvY2FsX2VyciwgLi4uKTsKPiAgIHwKPiAt
ICAgIGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBsb2NhbF9lcnIpOwo+ICsgICAgZXJyb3JfcHJvcGFn
YXRlKF9fX18sIGxvY2FsX2Vycik7Cj4gICApCj4gICAgICAgIC4uLgo+ICAgIH0KPiBAQCAtMTE4
LDcgKzExNyw2IEBAIHN5bWJvbCBlcnJwOwo+ICAgLy8gd2l0aG91dCBlcnJvcl9wcm9wYWdhdGUo
KSBjYWxsKSwgY29jY2luZWxsZSBmYWlscyB0byBtYXRjaCB0aGlzICJvdXQ6IH0iLgo+ICAgQEAK
PiAgIGlkZW50aWZpZXIgcnVsZTEuZm4sIHJ1bGUxLmxvY2FsX2Vyciwgb3V0Owo+IC1zeW1ib2wg
ZXJycDsKPiAgIEBACj4gICAKPiAgICBmbiguLi4pCj4gQEAgLTEyOCw3ICsxMjYsNyBAQCBzeW1i
b2wgZXJycDsKPiAgICsgICAgcmV0dXJuOwo+ICAgICAgICAuLi4+Cj4gICAtIG91dDoKPiAtLSAg
ICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxfZXJyKTsKPiArLSAgICBlcnJvcl9wcm9wYWdh
dGUoX19fXywgbG9jYWxfZXJyKTsKPiAgICB9Cj4gICAKPiAgIC8vIENvbnZlcnQgbW9zdCBvZiBs
b2NhbF9lcnIgcmVsYXRlZCBzdGFmZi4KPiBAQCAtMTU5LDcgKzE1Nyw2IEBAIHN5bWJvbCBlcnJw
Owo+ICAgQCBleGlzdHNACj4gICBpZGVudGlmaWVyIHJ1bGUxLmZuLCBydWxlMS5sb2NhbF9lcnI7
Cj4gICBleHByZXNzaW9uIGxpc3QgYXJnczsKPiAtc3ltYm9sIGVycnA7Cj4gICBAQAo+ICAgCj4g
ICAgZm4oLi4uKQo+IEBAIC0xNzIsMzAgKzE2OSwzMCBAQCBzeW1ib2wgZXJycDsKPiAgIC8vIENv
bnZlcnQgZXJyb3IgY2xlYXJpbmcgZnVuY3Rpb25zCj4gICAoCj4gICAtICAgIGVycm9yX2ZyZWUo
bG9jYWxfZXJyKTsKPiAtKyAgICBlcnJvcl9mcmVlX2VycnAoZXJycCk7Cj4gKysgICAgZXJyb3Jf
ZnJlZV9lcnJwKF9fX18pOwo+ICAgfAo+ICAgLSAgICBlcnJvcl9yZXBvcnRfZXJyKGxvY2FsX2Vy
cik7Cj4gLSsgICAgZXJyb3JfcmVwb3J0X2VycnAoZXJycCk7Cj4gKysgICAgZXJyb3JfcmVwb3J0
X2VycnAoX19fXyk7Cj4gICB8Cj4gICAtICAgIGVycm9yX3JlcG9ydGZfZXJyKGxvY2FsX2Vyciwg
YXJncyk7Cj4gLSsgICAgZXJyb3JfcmVwb3J0Zl9lcnJwKGVycnAsIGFyZ3MpOwo+ICsrICAgIGVy
cm9yX3JlcG9ydGZfZXJycChfX19fLCBhcmdzKTsKPiAgIHwKPiAgIC0gICAgd2Fybl9yZXBvcnRf
ZXJyKGxvY2FsX2Vycik7Cj4gLSsgICAgd2Fybl9yZXBvcnRfZXJycChlcnJwKTsKPiArKyAgICB3
YXJuX3JlcG9ydF9lcnJwKF9fX18pOwo+ICAgfAo+ICAgLSAgICB3YXJuX3JlcG9ydGZfZXJyKGxv
Y2FsX2VyciwgYXJncyk7Cj4gLSsgICAgd2Fybl9yZXBvcnRmX2VycnAoZXJycCwgYXJncyk7Cj4g
KysgICAgd2Fybl9yZXBvcnRmX2VycnAoX19fXywgYXJncyk7Cj4gICApCj4gICA/LSAgICBsb2Nh
bF9lcnIgPSBOVUxMOwo+ICAgCj4gICB8Cj4gLS0gICAgZXJyb3JfcHJvcGFnYXRlX3ByZXBlbmQo
ZXJycCwgbG9jYWxfZXJyLCBhcmdzKTsKPiAtKyAgICBlcnJvcl9wcmVwZW5kKGVycnAsIGFyZ3Mp
Owo+ICstICAgIGVycm9yX3Byb3BhZ2F0ZV9wcmVwZW5kKF9fX18sIGxvY2FsX2VyciwgYXJncyk7
Cj4gKysgICAgZXJyb3JfcHJlcGVuZChfX19fLCBhcmdzKTsKPiAgIHwKPiAtLSAgICBlcnJvcl9w
cm9wYWdhdGUoZXJycCwgbG9jYWxfZXJyKTsKPiArLSAgICBlcnJvcl9wcm9wYWdhdGUoX19fXywg
bG9jYWxfZXJyKTsKPiAgIHwKPiAgIC0gICAgJmxvY2FsX2Vycgo+IC0rICAgIGVycnAKPiArKyAg
ICBfX19fCj4gICApCj4gICAgICAgIC4uLj4KPiAgICB9Cj4gQEAgLTIwNSwyNyArMjAyLDQzIEBA
IHN5bWJvbCBlcnJwOwo+ICAgLy8gY29uZmxpY3RzIHdpdGggb3RoZXIgc3Vic3RpdHV0aW9ucyBp
biBpdCAoYXQgbGVhc3Qgd2l0aCAiLSBsb2NhbF9lcnIgPSBOVUxMIikuCj4gICBAQAo+ICAgaWRl
bnRpZmllciBydWxlMS5mbiwgcnVsZTEubG9jYWxfZXJyOwo+IC1zeW1ib2wgZXJycDsKPiAgIEBA
Cj4gICAKPiAgICBmbiguLi4pCj4gICAgewo+ICAgICAgICA8Li4uCj4gICAtICAgIGxvY2FsX2Vy
cgo+IC0rICAgICplcnJwCj4gKysgICAgKl9fX18KPiAgICAgICAgLi4uPgo+ICAgIH0KPiAgIAo+
ICAgLy8gQWx3YXlzIHVzZSB0aGUgc2FtZSBwYXR0ZXIgZm9yIGNoZWNraW5nIGVycm9yCj4gICBA
QAo+ICAgaWRlbnRpZmllciBydWxlMS5mbjsKPiAtc3ltYm9sIGVycnA7Cj4gICBAQAo+ICAgCj4g
ICAgZm4oLi4uKQo+ICAgIHsKPiAgICAgICAgPC4uLgo+IC0tICAgICplcnJwICE9IE5VTEwKPiAt
KyAgICAqZXJycAo+ICstICAgICpfX19fICE9IE5VTEwKPiArKyAgICAqX19fXwo+ICAgICAgICAu
Li4+Cj4gICAgfQo+ICsKPiArQEAKPiAraWRlbnRpZmllciBmbjsKPiArc3ltYm9sIGVycnA7Cj4g
K0BACj4gKwo+ICsgZm4oLi4uLAo+ICstICAgRXJyb3IgKipfX19fCj4gKysgICBFcnJvciAqKmVy
cnAKPiArICAgICwuLi4pCj4gKyB7Cj4gKyAuLi4KPiArIH0KPiArCj4gK0BACj4gK0BACj4gKy1f
X19fCj4gKytlcnJwCj4gCgoKLS0gCkJlc3QgcmVnYXJkcywKVmxhZGltaXIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
