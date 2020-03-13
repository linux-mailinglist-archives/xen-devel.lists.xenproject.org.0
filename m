Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF67418423D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 09:09:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCfLC-0002dQ-3U; Fri, 13 Mar 2020 08:06:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JFxv=46=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jCfL9-0002d4-Rj
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 08:06:44 +0000
X-Inumbo-ID: 923e9ed4-6501-11ea-bec1-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.134]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 923e9ed4-6501-11ea-bec1-bc764e2007e4;
 Fri, 13 Mar 2020 08:06:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpWI0NGgL2sVSg4q6qgzvIQzDye3lYHsgb3hLOEHYuMDKZKqnRcZ4t3srb2ZGI8SghylfjbLUKIqzbTAqWHDGDG3rFnuLcVkeJL5IOsHs8cnzl1P0Rf9rOnOYEKbZbq/pU2Q3qQ1zVuNxIebMk+89eN19tkJlZf+vO0UgUt57pRBqAwiTp7jPtsSHfgcSUrNWp7eVTWpM8rRk+JvkFvzapftSA5E9j6is5WsMo+3CSTmLy+q8CDi3bfIwxoRSixM3KUFPdlQSYdmbwRuI8IMKSPGbTQoIgNZac+IlM8IM5Cpul7mAHBdTs8trFMDz/VSIzhlGi9dwlj2xETKEWPpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpdBPje1809JXoumfIbaXWSbuRUDYLxGUjGk6oHyYzw=;
 b=F4in5M+OfAaRL758qX7nvK6me9poTysKtg3CWYHbE4R3E1qVJ8SEHev3EbmluPbt6s+rQUN9tYIC4Rh92NGEUwPibr8NLrMv038J+qiaNbWgqJaeR+IG5+fyNSU9G7ZKeDEl05tMeIw5UAEAOPp5xh0GxmB1JRTq5DB7VfanrZM5jg8wOcSevTwq9uqmc/LJj5ZURxBGl7A4sl8yGUUictsEEIqRSuXhRP38rljtwxoIEMbn+XmzMsdQr6ft3OtE5+rkIDHaSJEpNUleeFavY7KOyKxA+uu0gVJAlwHe3ml2EzKxxeW+It9mPnBgWsKDITqAmtDuYSUAJXDWB3KhvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpdBPje1809JXoumfIbaXWSbuRUDYLxGUjGk6oHyYzw=;
 b=DdDUZDzeNOfGsP80Qo892mskXX5iTd9tyaonoX1IsXmoBFGDWtpx4kcyZC6vKcpQBbIhexMno8qt6mk892kP/3LozDABHKBBzGhMcmFeGmDh3jgzs88UDZfNeSl+GYTenp5Mq2Kpdi+utZJjI62957VlZRLXsVP1FR+hkB8O1q4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6PR08MB3030.eurprd08.prod.outlook.com (52.135.164.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Fri, 13 Mar 2020 08:06:39 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2814.016; Fri, 13 Mar 2020
 08:06:39 +0000
To: Markus Armbruster <armbru@redhat.com>
References: <20200312085936.9552-1-vsementsov@virtuozzo.com>
 <20200312085936.9552-3-vsementsov@virtuozzo.com>
 <87eetwlmlm.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200313110637203
Message-ID: <efaed3e4-3f4d-f538-5087-96391fc20d2f@virtuozzo.com>
Date: Fri, 13 Mar 2020 11:06:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <87eetwlmlm.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-ClientProxiedBy: HE1P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::25)
 To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by
 HE1P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Fri, 13 Mar 2020 08:06:38 +0000
X-Tagtoolbar-Keys: D20200313110637203
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d272baa-f68d-4a29-0669-08d7c7257595
X-MS-TrafficTypeDiagnostic: AM6PR08MB3030:
X-Microsoft-Antispam-PRVS: <AM6PR08MB303072E253092B450FF60138C1FA0@AM6PR08MB3030.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(136003)(39850400004)(396003)(346002)(199004)(478600001)(31696002)(36756003)(2906002)(6486002)(26005)(4326008)(6916009)(16526019)(316002)(54906003)(5660300002)(86362001)(7416002)(66476007)(2616005)(8936002)(66946007)(956004)(31686004)(186003)(81156014)(52116002)(81166006)(66556008)(16576012)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR08MB3030;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3KC/mOt84U3wkq2GbllbeaI9T/rAhcDa4gLYbWxUggeNcstmg5vjl1BJsEgL9f2jdZG56gc3jO++3F6/E74iqQp4tugr0Rltqa7I1YYnJaFY6E0etul1WL/488Rqi5+kVzeIT2VInkWGzileLlhIyfkpufLldr3w6kqysNP+sUw+xXrrF/4cPXWWvmc0pVKPaczrzYv8xhvuiS4LqrWIeMSs7MXcG1FYv//3zYazvrCCyZ/EBf0mGnJbx9IZV+TmYCCbTUotDFxK4TPTFZKn/o2s4+WPZZJa2s6cFH9knv9YWTzNTqKd6cBYB9rKzRRtwblgqAVr1JEOPcSAOVvsBF851YVpTv4uHMVBbYl7NcoCMb+H71ahXZ6umYNnFWjvEjGXo0B1ocvHTGv0t2Kz8WvocOBkednTYDbc3H2x575dJEZ9Y+suQF9i8B5Rmlr0
X-MS-Exchange-AntiSpam-MessageData: cNVbM0eIfetI26lW5m7/8uIiYlccWyAOMBL6bV3R9J8lBeazJbazOmnEHAuUXRyCJo1j4Tc6Iqx7Nx3PhHUgcxSzME0XHcerZppxJpRLpdqQdx4Y/21UKgXsLWWsuK4ka0xjoJvyySlxgpgkrrZjHw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d272baa-f68d-4a29-0669-08d7c7257595
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 08:06:39.8201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ry1UL7yT98IiWwPLgxt0sr6YOpKfop5ThZza4qFBC0J2MlHRU3BdYaTFsVx5RGPQZQ4oSUZ4Gde/klanQVQMVfLEyV5QBcN0KgopGmWMmjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3030
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

MTMuMDMuMjAyMCAxMDo1MCwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6Cj4gVmxhZGltaXIgU2Vt
ZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4gCj4g
Wy4uLl0KPj4gKy8vIFdhcm4gc2V2ZXJhbCBFcnJvciAqIGRlZmluaXRpb25zLgo+PiArQGNoZWNr
MSBkaXNhYmxlIG9wdGlvbmFsX3F1YWxpZmllciBleGlzdHNACj4+ICtpZGVudGlmaWVyIGZuID0g
cnVsZTEuZm4sIGxvY2FsX2VyciwgbG9jYWxfZXJyMjsKPj4gK0BACj4+ICsKPj4gKyBmbiguLi4s
IEVycm9yICoqIF9fX18sIC4uLikKPj4gKyB7Cj4+ICsgICAgIC4uLgo+PiArICAgICBFcnJvciAq
bG9jYWxfZXJyID0gTlVMTDsKPj4gKyAgICAgLi4uIHdoZW4gYW55Cj4+ICsgICAgIEVycm9yICps
b2NhbF9lcnIyID0gTlVMTDsKPj4gKyAgICAgLi4uIHdoZW4gYW55Cj4+ICsgfQo+PiArCj4+ICtA
IHNjcmlwdDpweXRob24gQAo+PiArZm4gPDwgY2hlY2sxLmZuOwo+PiArQEAKPj4gKwo+PiArcHJp
bnQoJ1dhcm5pbmc6IGZ1bmN0aW9uIHt9IGhhcyBzZXZlcmFsIGRlZmluaXRpb25zIG9mICcKPj4g
KyAgICAgICdFcnJvciAqIGxvY2FsIHZhcmlhYmxlJy5mb3JtYXQoZm4pKQo+IAo+IFByaW50aW5n
IHRoZSBwb3NpdGlvbnMgbGlrZSB5b3UgZG8gaW4gdGhlIG5leHQgcnVsZSBpcyB1c2VmdWwgd2hl
bgo+IGV4YW1pbmluZyB0aGVzZSB3YXJuaW5ncy4KCkkgZGVjaWRlZCB0aGF0IHNlYXJjaGluZyBm
b3IgRXJyb3IgKiBkZWZpbml0aW9uIGlzIHNpbXBsZSwgYW5kIGJldHRlciBmb3IKdXNlciB0byBz
ZWFyY2ggYWxsIGRlZmluaXRpb25zIGJ5IGhhbmQgKG1heSBiZSBtb3JlIHRoYW4gdG9vKS4KCkJ1
dCB1bmRlcnN0YW5kaW5nIGNvbnRyb2wgZmxvd3MgaXMgbW9yZSBjb21wbGV4IHRoaW5nIGFuZCBi
ZXR0ZXIgdG8gaGVscAp1c2VyIHdpdGggbGluZSBwb3NpdGlvbnMuCgpCdXQgaWYgeW91IHdhbnQs
IHdlIGNhbiBhZGQgdGhlbSBvZiBjb3Vyc2UuIE5vdGUsIHRoYXQgZm9yIHNvbWUgcmVhc29ucyBz
b21lCnRpbWVzIGNvY2NpbmVsbGUgaW5zdGVhZCBvZiBvcmlnaW5hbCBmaWxlbmFtZSBwcmludHMg
c29tZXRoaW5nIGxpa2UgL3RtcC8uLi5vcmlnaW5hbC1uYW1lLi4uCnNvIGl0IGRvbid0IGxvb2sg
bmljZSBhbmQgbWF5IGJlIGEgYml0IG1pc2xlYWRpbmcuCgo+IAo+PiArCj4+ICsvLyBXYXJuIHNl
dmVyYWwgcHJvcGFnYXRpb25zIGluIGNvbnRyb2wgZmxvdy4KPj4gK0BjaGVjazIgZGlzYWJsZSBv
cHRpb25hbF9xdWFsaWZpZXIgZXhpc3RzQAo+PiAraWRlbnRpZmllciBmbiA9IHJ1bGUxLmZuOwo+
PiArc3ltYm9sIGVycnA7Cj4+ICtwb3NpdGlvbiBwMSwgcDI7Cj4+ICtAQAo+PiArCj4+ICsgZm4o
Li4uLCBFcnJvciAqKiBfX19fLCAuLi4pCj4+ICsgewo+PiArICAgICAuLi4KPj4gKygKPj4gKyAg
ICAgZXJyb3JfcHJvcGFnYXRlX3ByZXBlbmQoZXJycCwgLi4uKTtAcDEKPj4gK3wKPj4gKyAgICAg
ZXJyb3JfcHJvcGFnYXRlKGVycnAsIC4uLik7QHAxCj4+ICspCj4+ICsgICAgIC4uLgo+PiArKAo+
PiArICAgICBlcnJvcl9wcm9wYWdhdGVfcHJlcGVuZChlcnJwLCAuLi4pO0BwMgo+PiArfAo+PiAr
ICAgICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgLi4uKTtAcDIKPj4gKykKPj4gKyAgICAgLi4uIHdo
ZW4gYW55Cj4+ICsgfQo+PiArCj4+ICtAIHNjcmlwdDpweXRob24gQAo+PiArZm4gPDwgY2hlY2sy
LmZuOwo+PiArcDEgPDwgY2hlY2syLnAxOwo+PiArcDIgPDwgY2hlY2syLnAyOwo+PiArQEAKPj4g
Kwo+PiArcHJpbnQoJ1dhcm5pbmc6IGZ1bmN0aW9uIHt9IHByb3BhZ2F0ZXMgdG8gZXJycCBzZXZl
cmFsIHRpbWVzIGluICcKPj4gKyAgICAgICdvbmUgY29udHJvbCBmbG93OiBhdCB7fTp7fSBhbmQg
dGhlbiBhdCB7fTp7fScuZm9ybWF0KAo+PiArICAgICAgICAgIGZuLCBwMVswXS5maWxlLCBwMVsw
XS5saW5lLCBwMlswXS5maWxlLCBwMlswXS5saW5lKSkKPiBbLi4uXQo+IAoKCi0tIApCZXN0IHJl
Z2FyZHMsClZsYWRpbWlyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
