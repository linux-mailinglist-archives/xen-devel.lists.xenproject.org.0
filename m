Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6DC16851A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 18:36:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5C9n-0007Zo-QH; Fri, 21 Feb 2020 17:32:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nUl4=4J=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1j5C9m-0007ZV-05
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 17:32:06 +0000
X-Inumbo-ID: 12c6d70c-54d0-11ea-ade5-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::701])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12c6d70c-54d0-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 17:32:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWn9EDGhtjZfaZabiyzjSD00sTnC43qY/ozbpwvrLzVXUDyD51zZrEgykN2DRabwm8Jufuu288GG4B6QtzeFTcuAeBoJ8aItay184M4MDMR4SHw/cJYak17mXDRI3lANizgpEmeB5jLxKCq76TrjegvD2E76ZIlTHWe6xolToUkIwhSTnDwhs6Mh1jzMKtAQ5Myc2SAFm3UdN2rTdwG9N/2ecjS+ukkrLjRHHvwikjYXPEc/ELzKi5/TF+EoLAx/qTj0hw4X4LNx75hST0wBE+3eJVqC31F/hNu6dnbavNrQCGmf45LsX7alewK+qHin2VL2Zo6EZV1vem6cMDDSXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=De9oi+D5qtGD6H/lO4/hVswXUoHltfm4VlfdPII3PmM=;
 b=Bn1rW6ckhoGjjB62EIdjO+iMT3uU3LKCclNe31XxKmZiNBkKsNVzW0U0u8TbKk8IQmhrtJ5aUDoBWgRmGYqQsI1frCMLGE8zduqXwwCru9Oev2Y49e7yM/YaItUxMRhf/YHHeNfC+3bXx9dC3g4bb4XmQ9E7C8miq9H1nx8xdBSKiQdGbpd4AywAePL2L6xMEwcfnDImEkUgwijsjuvE4aKD5PS+UFCXayP+KS99Rw/UVFGPBjLQPhaqNJ6l4ee+64omZkEvQDOXW7+Jhv/YcyHVTBuPUSYdgwZC5sKAmTssoPBbch9nRQqf7n6kxSDJFZUBeo8bynvwbBMDseqZ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=De9oi+D5qtGD6H/lO4/hVswXUoHltfm4VlfdPII3PmM=;
 b=eeUpKWdrHwydCvzMsv602+fYfQvHfOAREIaFmaS7W8f9hnPB54XMyvl1Stm+kBjlUqMMGvGuymD0eyNbwS/JyrEuT2Z9K9yX9Q2Tm7j8bVOTx2JVa7KpNKW8gmDv4aLCs0UmbqacOrjSSXeJWIlOoqJvFK2LrYfo4z3azFSoDMk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com (20.179.7.140) by
 AM6SPR01MB0057.eurprd08.prod.outlook.com (10.255.22.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17; Fri, 21 Feb 2020 17:32:02 +0000
Received: from AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664]) by AM6PR08MB4423.eurprd08.prod.outlook.com
 ([fe80::e05a:63af:818c:b664%4]) with mapi id 15.20.2750.016; Fri, 21 Feb 2020
 17:32:02 +0000
To: Markus Armbruster <armbru@redhat.com>
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <20200131130118.1716-2-vsementsov@virtuozzo.com>
 <87d0a88k6d.fsf@dusky.pond.sub.org>
 <7856fcbb-8c01-aba3-a11b-63058c117362@virtuozzo.com>
 <875zfz6gsh.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
X-Tagtoolbar-Keys: D20200221203155959
Message-ID: <064ca8e9-458e-c780-92a0-05f40cf0975b@virtuozzo.com>
Date: Fri, 21 Feb 2020 20:31:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
In-Reply-To: <875zfz6gsh.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-ClientProxiedBy: HE1P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::16)
 To AM6PR08MB4423.eurprd08.prod.outlook.com
 (2603:10a6:20b:bf::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.24.200] (185.231.240.5) by
 HE1P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17 via Frontend Transport; Fri, 21 Feb 2020 17:32:01 +0000
X-Tagtoolbar-Keys: D20200221203155959
X-Originating-IP: [185.231.240.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfdb1672-398b-4a30-d62d-08d7b6f3f64b
X-MS-TrafficTypeDiagnostic: AM6SPR01MB0057:
X-Microsoft-Antispam-PRVS: <AM6SPR01MB0057F4D71D0E109A0B69A2A4C1120@AM6SPR01MB0057.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0320B28BE1
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(376002)(346002)(39850400004)(136003)(199004)(189003)(16576012)(316002)(54906003)(31686004)(66946007)(478600001)(66476007)(66556008)(31696002)(6486002)(81166006)(8936002)(86362001)(26005)(81156014)(8676002)(6916009)(16526019)(186003)(5660300002)(956004)(7416002)(36756003)(6666004)(2906002)(2616005)(4326008)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6SPR01MB0057;
 H:AM6PR08MB4423.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2uAEmzSrMrgBj0++TKfDbH73YxO9znBlHHy/Rjv+e49nyBnt0Q1wTTtCH0ax0S6+aIGdCTFxVGA8d/moK6USmj+EExfGrcbBWHUznRDGh3SESjWxoryvz6eivPvCjMEkib3bKbgknytSA9WGUq97bvN3nJ+YVn7W16MeoDcANSeLmYvUjoTp7W9xlYrF2huWItsc+tCfEAtIaNGr+Ip2dCdWi7N2IcXr/2hAB1Ai8xjO/GnYuz+HB97ZG9wAlNfkMv3OJ2rSRSL4d2DlscpSF3dsV4wYtlICHTGzH/gxPsI2JgJ7zajkyTD0yPzpwH8LyYnawWskBw6Aqh8B9GIbsDuKvgc15hyIWoyEAZhFJ6Ejb/Q9DRQE1OSJWJM8DsZ4/xXm+zOfP4cyixgpyndl8LvF27RZ2q1u9l4vtVnCy/GGoVvdNt72j4ypFffcqH61
X-MS-Exchange-AntiSpam-MessageData: gOrvb366LFT7xO/91E23E7ur+NIotbpJ+rDi1DM/aMPCoOi9WlF/woP1DljompZ8Q4vbcAXH0GPJcYQdDdlVMCvGv7xsJ7UhYB5Bfo3xzZUxmFqUerYtEkE8refpB5xYMjkrcQHuyxZZrfrCHJqHnA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdb1672-398b-4a30-d62d-08d7b6f3f64b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2020 17:32:02.3366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGY3/4FmZOIBSozIYJzmgfMjbt1Lg21uzddxMDWvhqoP8cPV1yCuERcEywmZgH+gNiKbnwyeLktLlkS6HctXADjOQXTiBk87YPw4P55Ro6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6SPR01MB0057
Subject: Re: [Xen-devel] [PATCH v7 01/11] qapi/error: add (Error **errp)
 cleaning APIs
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

MjEuMDIuMjAyMCAxOTozNCwgTWFya3VzIEFybWJydXN0ZXIgd3JvdGU6Cj4gVmxhZGltaXIgU2Vt
ZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4gCj4+
IDIxLjAyLjIwMjAgMTA6MzgsIE1hcmt1cyBBcm1icnVzdGVyIHdyb3RlOgo+Pj4gVmxhZGltaXIg
U2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVudHNvdkB2aXJ0dW96em8uY29tPiB3cml0ZXM6Cj4+
Pgo+Pj4+IEFkZCBmdW5jdGlvbnMgdG8gY2xlYW4gRXJyb3IgKiplcnJwOiBjYWxsIGNvcnJlc3Bv
bmRpbmcgRXJyb3IgKmVycgo+Pj4+IGNsZWFuaW5nIGZ1bmN0aW9uIGFuIHNldCBwb2ludGVyIHRv
IE5VTEwuCj4+Pj4KPj4+PiBOZXcgZnVuY3Rpb25zOgo+Pj4+ICAgICBlcnJvcl9mcmVlX2VycnAK
Pj4+PiAgICAgZXJyb3JfcmVwb3J0X2VycnAKPj4+PiAgICAgd2Fybl9yZXBvcnRfZXJycAo+Pj4+
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSA8dnNlbWVu
dHNvdkB2aXJ0dW96em8uY29tPgo+Pj4+IFJldmlld2VkLWJ5OiBHcmVnIEt1cnogPGdyb3VnQGth
b2Qub3JnPgo+Pj4+IFJldmlld2VkLWJ5OiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4K
Pj4+PiAtLS0KPj4+Pgo+Pj4+IENDOiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KPj4+
PiBDQzogS2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT4KPj4+PiBDQzogTWF4IFJlaXR6IDxt
cmVpdHpAcmVkaGF0LmNvbT4KPj4+PiBDQzogR3JlZyBLdXJ6IDxncm91Z0BrYW9kLm9yZz4KPj4+
PiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+Pj4+IEND
OiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPj4+PiBDQzogUGF1
bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Cj4+Pj4gQ0M6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4KPj4+PiBDQzogIlBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIiA8cGhpbG1k
QHJlZGhhdC5jb20+Cj4+Pj4gQ0M6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Cj4+
Pj4gQ0M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+Pj4+IENDOiBTdGVmYW4g
QmVyZ2VyIDxzdGVmYW5iQGxpbnV4LmlibS5jb20+Cj4+Pj4gQ0M6IE1hcmt1cyBBcm1icnVzdGVy
IDxhcm1icnVAcmVkaGF0LmNvbT4KPj4+PiBDQzogTWljaGFlbCBSb3RoIDxtZHJvdGhAbGludXgu
dm5ldC5pYm0uY29tPgo+Pj4+IENDOiBxZW11LWJsb2NrQG5vbmdudS5vcmcKPj4+PiBDQzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4+Pj4KPj4+PiAgICBpbmNsdWRlL3FhcGkvZXJy
b3IuaCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gICAgMSBmaWxlIGNoYW5n
ZWQsIDI2IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3FhcGkv
ZXJyb3IuaCBiL2luY2x1ZGUvcWFwaS9lcnJvci5oCj4+Pj4gaW5kZXggYWQ1YjZlODk2ZC4uZDM0
OTg3MTQ4ZCAxMDA2NDQKPj4+PiAtLS0gYS9pbmNsdWRlL3FhcGkvZXJyb3IuaAo+Pj4+ICsrKyBi
L2luY2x1ZGUvcWFwaS9lcnJvci5oCj4+Pj4gQEAgLTMwOSw2ICszMDksMzIgQEAgdm9pZCB3YXJu
X3JlcG9ydGZfZXJyKEVycm9yICplcnIsIGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+Pj4+ICAgIHZv
aWQgZXJyb3JfcmVwb3J0Zl9lcnIoRXJyb3IgKmVyciwgY29uc3QgY2hhciAqZm10LCAuLi4pCj4+
Pj4gICAgICAgIEdDQ19GTVRfQVRUUigyLCAzKTsKPj4+PiAgICArLyoKPj4+PiArICogRnVuY3Rp
b25zIHRvIGNsZWFuIEVycm9yICoqZXJycDogY2FsbCBjb3JyZXNwb25kaW5nIEVycm9yICplcnIg
Y2xlYW5pbmcKPj4+PiArICogZnVuY3Rpb24sIHRoZW4gc2V0IHBvaW50ZXIgdG8gTlVMTC4KPj4+
PiArICovCj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBlcnJvcl9mcmVlX2VycnAoRXJyb3IgKipl
cnJwKQo+Pj4+ICt7Cj4+Pj4gKyAgICBhc3NlcnQoZXJycCAmJiAqZXJycCk7Cj4+Pj4gKyAgICBl
cnJvcl9mcmVlKCplcnJwKTsKPj4+PiArICAgICplcnJwID0gTlVMTDsKPj4+PiArfQo+Pj4+ICsK
Pj4+PiArc3RhdGljIGlubGluZSB2b2lkIGVycm9yX3JlcG9ydF9lcnJwKEVycm9yICoqZXJycCkK
Pj4+PiArewo+Pj4+ICsgICAgYXNzZXJ0KGVycnAgJiYgKmVycnApOwo+Pj4+ICsgICAgZXJyb3Jf
cmVwb3J0X2VycigqZXJycCk7Cj4+Pj4gKyAgICAqZXJycCA9IE5VTEw7Cj4+Pj4gK30KPj4+PiAr
Cj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB3YXJuX3JlcG9ydF9lcnJwKEVycm9yICoqZXJycCkK
Pj4+PiArewo+Pj4+ICsgICAgYXNzZXJ0KGVycnAgJiYgKmVycnApOwo+Pj4+ICsgICAgd2Fybl9y
ZXBvcnRfZXJyKCplcnJwKTsKPj4+PiArICAgICplcnJwID0gTlVMTDsKPj4+PiArfQo+Pj4+ICsK
Pj4+PiArCj4+Pj4gICAgLyoKPj4+PiAgICAgKiBKdXN0IGxpa2UgZXJyb3Jfc2V0ZygpLCBleGNl
cHQgeW91IGdldCB0byBzcGVjaWZ5IHRoZSBlcnJvciBjbGFzcy4KPj4+PiAgICAgKiBOb3RlOiB1
c2Ugb2YgZXJyb3IgY2xhc3NlcyBvdGhlciB0aGFuIEVSUk9SX0NMQVNTX0dFTkVSSUNfRVJST1Ig
aXMKPj4+Cj4+PiBUaGVzZSBhcHBlYXIgdG8gYmUgdW51c2VkIGFwYXJ0IGZyb20gdGhlIENvY2Np
bmVsbGUgc2NyaXB0IGluIFBBVENIIDAzLgo+Pj4KPj4+IFRoZXkgYXJlIHVzZWQgaW4gdGhlIGZ1
bGwgIltSRkMgdjUgMDAwLzEyNl0gZXJyb3I6IGF1dG8gcHJvcGFnYXRlZAo+Pj4gbG9jYWxfZXJy
IiBzZXJpZXMuICBPcHRpb25zOgo+Pj4KPj4+IDEuIFBpY2sgYSBmZXcgbW9yZSBwYXRjaGVzIGlu
dG8gdGhpcyBwYXJ0IEkgc2VyaWVzLCBzbyB0aGVzZSBndXlzIGNvbWUKPj4+ICAgICAgd2l0aCB1
c2Vycy4KPj4KPj4gSXQgbmVlZHMgc29tZSBhZGRpdGlvbmFsIGVmZm9ydCBmb3IgdGhpcyBzZXJp
ZXMuLiBCdXQgaXQncyBwb3NzaWJsZS4gU3RpbGwsCj4+IEkgdGhpbmsgdGhhdCB3ZSBhdCBsZWFz
dCBzaG91bGQgbm90IHB1bGwgb3V0IHBhdGNoZXMgd2hpY2ggc2hvdWxkIGJlIGluCj4+IGZ1dHVy
ZSBzZXJpZXMgKGZvciBleGFtcGxlIGZyb20gcHBjIG9yIGJsb2NrLykuLgo+IAo+IFllcywgd2Ug
d2FudCB0byBrZWVwIHJlbGF0ZWQgc3R1ZmYgdG9nZXRoZXIuCj4gCj4+IEdyZXBwaW5nIHRocm91
Z2ggdjU6Cj4+ICAgZm9yIHggaW4ge3dhcm5fcmVwb3J0X2VycnAsZXJyb3JfcmVwb3J0X2VycnAs
ZXJyb3JfZnJlZV9lcnJwfTsgZG8gZWNobyA9PSAkeCA9PTsgZ2l0IGdyZXAgLWwgJHggfCBncmVw
IC12IGNvY2NpbmVsbGUgfCBncmVwIC12ICdlcnJvclwuaCc7IGVjaG87IGRvbmUKPj4gPT0gd2Fy
bl9yZXBvcnRfZXJycCA9PQo+PiBibG9jay9maWxlLXBvc2l4LmMKPj4gaHcvcHBjL3NwYXByLmMK
Pj4gaHcvcHBjL3NwYXByX2NhcHMuYwo+PiBody9wcGMvc3BhcHJfaXJxLmMKPj4gaHcvdmZpby9w
Y2kuYwo+PiBuZXQvdGFwLmMKPj4gcW9tL29iamVjdC5jCj4+Cj4+ID09IGVycm9yX3JlcG9ydF9l
cnJwID09Cj4+IGh3L2Jsb2NrL3Zob3N0LXVzZXItYmxrLmMKPj4gdXRpbC9vc2xpYi1wb3NpeC5j
Cj4+Cj4+ID09IGVycm9yX2ZyZWVfZXJycCA9PQo+PiBibG9jay5jCj4+IGJsb2NrL3FhcGkuYwo+
PiBibG9jay9zaGVlcGRvZy5jCj4+IGJsb2NrL3NuYXBzaG90LmMKPj4gYmxvY2tkZXYuYwo+PiBj
aGFyZGV2L2NoYXItc29ja2V0LmMKPj4gaHcvYXVkaW8vaW50ZWwtaGRhLmMKPj4gaHcvY29yZS9x
ZGV2LXByb3BlcnRpZXMuYwo+PiBody9wY2ktYnJpZGdlL3BjaV9icmlkZ2VfZGV2LmMKPj4gaHcv
cGNpLWJyaWRnZS9wY2llX3BjaV9icmlkZ2UuYwo+PiBody9zY3NpL21lZ2FzYXMuYwo+PiBody9z
Y3NpL21wdHNhcy5jCj4+IGh3L3VzYi9oY2QteGhjaS5jCj4+IGlvL25ldC1saXN0ZW5lci5jCj4+
IG1pZ3JhdGlvbi9jb2xvLmMKPj4gcWdhL2NvbW1hbmRzLXBvc2l4LmMKPj4gcWdhL2NvbW1hbmRz
LXdpbjMyLmMKPj4gdXRpbC9xZW11LXNvY2tldHMuYwo+Pgo+PiBXaGF0IGRvIHlvdSB3YW50IHRv
IGFkZD8KPiAKPiBQQVRDSCB2NSAwMzIgdXNlcyBib3RoIGVycm9yX3JlcG9ydF9lcnJwKCkgYW5k
IGVycm9yX2ZyZWVfZXJycCgpLgo+IEFkZGluZyB3YXJuX3JlcG9ydF9lcnJwKCkgd2l0aG91dCBh
IHVzZXIgaXMgb2theSB3aXRoIG1lLiAgV2hhdCBkbyB5b3UKPiB0aGluaz8KPiAKPiBJZiB0aGVy
ZSBhcmUgcGF0Y2hlcyB5b3UgY29uc2lkZXIgcmVsYXRlZCB0byAwMzIsIGZlZWwgZnJlZSB0byB0
aHJvdwo+IHRoZW0gaW4uCgowMzIgaXMgcWdhL2NvbW1hbmRzLXdpbjMyLmMgYW5kIHV0aWwvb3Ns
aWItcG9zaXguYwoKU2VlbXMgdGhhdCB0aGV5IGFyZSB3cm9uZ2x5IGdyb3VwZWQgaW50byBvbmUg
cGF0Y2guCgpxZ2EvY29tbWFuZHMtd2luMzIuYyBtYXRjaGVzIHFnYS8gKE1pY2hhZWwgUm90aCkK
YW5kICB1dGlsL29zbGliLXBvc2l4LmMgbWF0Y2hlcyBQT1NJWCAoUGFvbG8gQm9uemluaSkKClNv
LCBpdCBzaG91bGQgYmUgdHdvIHNlcGFyYXRlIHBhdGNoZXMgYW55d2F5LgoKRm9yIFsxLl0gSSBv
bmx5IGFmcmFpZCB0aGF0IHdlJ2xsIGhhdmUgdG8gd2FpdCBmb3IgbWFpbnRhaW5lcnMsIHdobyB3
ZXJlCm5vdCBpbnRlcmVzdGVkIGluIHByZXZpb3VzIGl0ZXJhdGlvbnMsIHRvIHJldmlldyB0aGVz
ZSBuZXcgcGF0Y2hlcy4uCgo+IAo+Pj4KPj4+IDIuIFB1bnQgdGhpcyBwYXRjaCB0byB0aGUgZmly
c3QgcGFydCB0aGF0IGhhcyB1c2VycywgYWxvbmcgd2l0aCB0aGUKPj4+ICAgICAgcGFydCBvZiB0
aGUgQ29jY2luZWxsZSBzY3JpcHQgdGhhdCBkZWFscyB3aXRoIHRoZW0uCj4+Cj4+IEJ1dCBjb2Nj
aW5lbGxlIHNjcmlwdCB3b3VsZCBiZSB3cm9uZywgaWYgd2UgZHJvcCB0aGlzIHBhcnQgZnJvbSBp
dC4gSSB0aGluaywKPj4gdGhhdCBhZnRlciBjb21taXQgd2hpY2ggYWRkcyBjb2NjaW5lbGxlIHNj
cmlwdCwgaXQgc2hvdWxkIHdvcmsgd2l0aCBhbnkgZmlsZSwKPj4gbm90IG9ubHkgc3Vic2V0IG9m
IHRoZXNlIHNlcmllcy4KPj4KPj4gU28sIGl0J3MgcHJvYmFibHkgT0sgZm9yIG5vdyB0byBkcm9w
IHRoZXNlIGZ1bmN0aW9ucywgZm9yY2luZyB0aGVpciBhZGRpdGlvbiBpZgo+PiBjb2NjaW5lbGxl
IHNjcmlwdCB3aWxsIGJlIGFwcGxpZWQgd2hlcmUgdGhlc2UgZnVuY3Rpb25zIGFyZSBuZWVkZWQu
IFdlIGNhbiwgZm9yCj4+IGV4YW1wbGUgY29tbWVudCB0aGVzZSB0aHJlZSBmdW5jdGlvbnMuCj4+
Cj4+IFNwbGl0dGluZyBjb2NjaW5lbGxlIHNjcmlwdCBpbnRvIHR3byBwYXJ0cywgd2hpY2ggd2ls
bCBiZSBpbiBkaWZmZXJlbnQgc2VyaWVzIHdpbGwKPj4gbm90IGhlbHAgYW55IHBhdGNoLXBvcnRp
bmcgcHJvY2Vzc2VzLgo+Pgo+PiBNb3Jlb3ZlciwgdGhpcyB3aWxsIGNyZWF0ZSBkZXBlbmRlbmNp
ZXMgYmV0d2VlbiBmdXR1cmUgc2VyaWVzIHVwZGF0aW5nIG90aGVyIGZpbGVzLgo+Pgo+PiBTbywg
SSBkb24ndCBsaWtlIFsyLl0uLgo+IAo+IEFuZCBpdCdzIGxpa2VseSBtb3JlIHdvcmsgdGhhbiAx
Lgo+IAo+Pj4gMy4gRG8gbm90aGluZzogYWNjZXB0IHRoZSBmdW5jdGlvbnMgd2l0aG91dCB1c2Vy
cy4KPj4KPj4gT0sgZm9yIG1lKQo+Pgo+Pj4KPj4+IEkgaGFiaXR1YWxseSBkaXNsaWtlIDMuLCBi
dXQgcmV2aWV3aW5nIHRoZSByZXN0IG9mIHRoaXMgc2VyaWVzIG1pZ2h0Cj4+PiBtYWtlIG1lIG92
ZXJyaWRlIHRoYXQgZGlzbGlrZS4KPiBbLi4uXQo+IAoKCi0tIApCZXN0IHJlZ2FyZHMsClZsYWRp
bWlyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
