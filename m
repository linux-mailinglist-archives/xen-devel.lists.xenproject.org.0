Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7794ADB9C9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 00:38:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLELp-0006Bg-Dy; Thu, 17 Oct 2019 22:34:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6xiX=YK=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iLELo-0006Bb-5p
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 22:34:32 +0000
X-Inumbo-ID: 48f4d9b0-f12e-11e9-bbab-bc764e2007e4
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe49::625])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48f4d9b0-f12e-11e9-bbab-bc764e2007e4;
 Thu, 17 Oct 2019 22:34:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtVDcHfc1KXGNRa9fkEmq5d+cQfO3V34iHDYXwT791BAsYQKZEkx88mhcyfYnBx2fVhBg9Hv8AfBC+/so9AEBxIkdkTw5v+w7Nz0I7V+l5HPQO97dGjGfjXhRPtRoe8kcUtQBwbQWXaeaINAxBj1Cdf2oQMA46i848e1n46cinn1dpNCiJTAvM9VO3seuZX/3r/I7hoUGW3+2ngtHMnouN2WapQ1VUpuTG0btjEcHlE7wCO5hk+dUAkYph3mFdvmKfy1rXj9q99TYhB4GRMFpXr82d5EDgnJwfe1ZoKoODON4xG3bz81Cr12+yd3+NRLTNLAUZgHShna5xIp7Dxe9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FC6Tduc7yguhzPWY5KD3UaJpGfg3FcKdEETXVWpOC0s=;
 b=J9NtvAlFL7tE+6d8KTaP28LBvvY7YcxBucZubUEuw+OMCHteWgms5Ac/pq6ZFOxRmmYxZabuvEWapGIWzn5iGDQI8PI2bsvpRqHgsgZtGh1sb2xzrI/yT0WVlwkN7bD2E5mJwiKuNpsPZi10mVDs1qAPdaov6T7uCivz7unHyWmKpjXy/ZZXXrur2UBC793swt3uqNnY6xSXwlNcZLkl1x1ImAs9a1XrYGlvMYFseJRz+ufmsb1RmSdUb9Rrg5a2xdQ9owg2NfWB4q//cYsENcIihUHWGdbFM7K2bfodqb0W2FstwckmxOIL0YmAKkcWsuD8mD+b8wWlAdo42ug44Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FC6Tduc7yguhzPWY5KD3UaJpGfg3FcKdEETXVWpOC0s=;
 b=CVkI3lSIvRFvwHUE3Siha1K7OQ+FQpAWe4tDVMlyLhtxO/guCKhvDvx110A5Bp4mAx+jGllCHQP+j/Md/P6X1ZpveZRksS7iYna4hrdcHzSiXosw6yFMNimx74+JZ8yQGgOgQEQ/33tRXZ7Fd4Vvjqn8R51opnsobshbvljZA28=
Received: from MWHPR0201CA0106.namprd02.prod.outlook.com
 (2603:10b6:301:75::47) by BN6PR02MB2306.namprd02.prod.outlook.com
 (2603:10b6:404:2a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Thu, 17 Oct
 2019 22:34:28 +0000
Received: from SN1NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::208) by MWHPR0201CA0106.outlook.office365.com
 (2603:10b6:301:75::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 22:34:28 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT016.mail.protection.outlook.com (10.152.72.113) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2367.14
 via Frontend Transport; Thu, 17 Oct 2019 22:34:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iLELj-0000GI-E9; Thu, 17 Oct 2019 15:34:27 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iLELe-0007YM-3o; Thu, 17 Oct 2019 15:34:22 -0700
Received: from [172.19.2.62] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iLELU-0007Wm-J3; Thu, 17 Oct 2019 15:34:12 -0700
Date: Thu, 17 Oct 2019 15:34:12 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: Julien Grall <julien.grall.oss@gmail.com>
Message-ID: <20191017223411.GB15629@xilinx.com>
References: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
 <1571342860-15838-1-git-send-email-brian.woods@xilinx.com>
 <CAJ=z9a2TxLmtE2nrwYQNVvh3K8upSszYke-PZ8BeaAs2wc0qjQ@mail.gmail.com>
 <20191017212004.GA15629@xilinx.com>
 <CAJ=z9a2ZTcE4a7Pqs5x4x_zNaO7-U7Y=B=MED65=7HFw=hm7Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ=z9a2ZTcE4a7Pqs5x4x_zNaO7-U7Y=B=MED65=7HFw=hm7Xw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(199004)(189003)(5660300002)(16586007)(6916009)(2906002)(14444005)(8936002)(6246003)(47776003)(305945005)(316002)(229853002)(58126008)(106002)(23726003)(54906003)(336012)(44832011)(446003)(486006)(26005)(76176011)(126002)(476003)(2616005)(426003)(9786002)(186003)(478600001)(356004)(33656002)(36386004)(50466002)(70206006)(70586007)(81166006)(81156014)(11346002)(36756003)(8676002)(86362001)(1076003)(4326008)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2306; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab786f4c-7d86-482f-9660-08d753522b8f
X-MS-TrafficTypeDiagnostic: BN6PR02MB2306:
X-Microsoft-Antispam-PRVS: <BN6PR02MB23067782CA0023CF0F146F8AD76D0@BN6PR02MB2306.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8QQUNUvLLYTrZv0xzN9pgdUSVueWT+xu9gTzxXZzR2JP+dmKJ/be58GN1Pv3RRAhJt+bD+ZGeiVpHsA6R4GOjaygwvXZ73xUvqEcTNUEM3sNaVvhitB87LWPREE82CoEroQwdcCdJI5Q+tfE5RXdXBLgXwuhIJeUKQpyMbYmLde3FeatKD93TgjBlL/WRahoInE4GR1SX+e/ObfYVbekUG8G+c86TapbzhVJORyViXgRjkvB7ElCjv4Z93MQ7SlKyGgZhdN91JaJ4HG3Asogq2X6ym5pdlE5NiuiQ8ytO0kW7ODZ/EfPj+lGcVM0E2dpC89NUI5E29zKO5ShyxEBrG+j5qcyCn+AJKdO+BE9dWt/xADKzYbF9HO96h7KuFOy2QnDGh0+nrBCWfNl/WoU0gSaBrOYnbHh16UUU9sdDvM=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 22:34:27.7987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab786f4c-7d86-482f-9660-08d753522b8f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2306
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: add warning if memory modules
 overlap
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
Cc: Brian Woods <brian.woods@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTA6NDk6MTVQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IE9uIFRodSwgMTcgT2N0IDIwMTkgYXQgMjI6MjAsIEJyaWFuIFdvb2RzIDxicmlhbi53
b29kc0B4aWxpbnguY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAw
OTozNDo1MVBNICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPgo+ID4g
PiBBcyBhIHVzZXIgc3VjaCBtZXNzYWdlIHdvdWxkIGxpa2VseSBwdXQgbWUgb2ZmLiBZb3UgdGVs
bCBtZSB0aGVyZSBhcmUKPiA+ID4gYW4gb3ZlcmxhcCwgYnV0IHlvdSBkb24ndCBwcm92aWRlIG1v
cmUgaW5mb3JtYXRpb24gZXZlbiBpZiB5b3UgbGlrZWx5Cj4gPiA+IGhhdmUgdGhlIGluZm9ybWF0
aW9uIGluIHBsYWNlLiBIb3dldmVyLi4uCj4gPgo+ID4gV2VsbCwgSSBzdXBwb3NlIHRoZSBtZXNz
YWdlIGNvdWxkIGJlIGNoYW5nZWQgdG8gc29tZXRoaW5nIGxpa2U6Cj4gPiAiV0FSTklORzogb3Zl
cmxhcCBkZXRlY3RlZCBpbiB0aGUgYWJvdmUgbWVtb3J5IG1vZHVsZSBhZGRyZXNzZXMuIgo+ID4g
b3Igc29tZXRoaW5nIHRvIG1vcmUgZGlyZWN0bHkgZ3VpZGUgdGhlIHVzZXJzIHRvIHRoZSBzZWN0
aW9uLiAgTWF5YmUKPiA+IG1vdmUgdGhlICdwcmludGsoIlxuIik7JyBhZnRlciB0aGUgd2Fybmlu
ZyBzbyBpdCdzIGdyb3VwZWQgdGlnaHRlciB3aXRoCj4gPiB0aGUgbW9kdWxlIGluZm9ybWF0aW9u
Lgo+IAo+IE15IHBvaW50IHN0YW5kcyBldmVuIGZvciB0aGlzIHNvcnQgb2YgbWVzc2FnZS4gWW91
IGtub3cgdGhlIGV4YWN0Cj4gb3ZlcmxhcCwgc28gd2h5IHdvdWxkIHlvdSBoaWRlIGl0IGZyb20g
dGhlIHVzZXJzPwoKV2UncmUgbm90IGhpZGluZyBpdC4gIFlvdSdyZSBub3QgY2x1dHRlcmluZyB1
cCB0aGUgbG9nIHdpdGggdGhlIHNhbWUKZGF0YSBtdWx0aXBsZSB0aW1lcy4gIFNlZSBiZWxvdy4K
Cj4gPiA+Cj4gPiA+IC4uLiBXaGF0J3Mgd3Jvbmcgd2l0aCBqdXN0IGR1bXBpbmcgdGhlIGluZm9y
bWF0aW9uIGhlcmUgZGlyZWN0bHk/Cj4gPgo+ID4gSU1PLCBpdCBpcyBiZXR0ZXIgdG8gaGF2ZSBh
bGwgdGhlIGluZm9ybWF0aW9uIHByaW50ZWQgaW4gb25lIHNwb3QuCj4gPiBUaGVyZSBpcyBsZXNz
IHRvIGdvIHRocm91Z2ggYW5kIGVhc2llciB0byBmaW5kIG91dCB3aGF0IGlzIGhhcHBlbmluZy4K
PiA+IFRoZXJlIGlzIGFsc28gdGhlIGZhY3QgdGhhdCB3ZSBkbyBub3QgaGF2ZSB0byBwcmludCB0
aGluZ3MgdHdpY2UgKDIgc2V0cwo+ID4gb2YgbmFtZXMsIHN0YXJ0aW5nIGFkZHJlc3NlcyBhbmQg
ZW5kaW5nIGFkZHJlc3NlcyBwZXIgb3ZlcmxhcCkgd2hlbiBpdAo+ID4gaXMgZ29pbmcgdG8gYmUg
cHJpbnRlZCBpbiB0aGUgbmVhciBmdXR1cmUgYW55d2F5LiAgVGhlIGNvc3Qgb2YgdGhpcyBpcwo+
ID4ganVzdCBvbmUgaW5pdGRhdGEgYm9vbCwgd2hpY2ggd2hpbGUgSSBhbSBub3QgdGhyaWxsZWQg
YWJvdXQsIGRvZXMgbm90Cj4gPiBzZWVtIHRoYXQgZXhwZW5zaXZlIChjb21wYXJlZCB0byBhIG5l
c3RlZCBsb29wIG9yIHByaW50aW5nIG91dCBhdCBsZWFzdAo+ID4gKDE2KjIgKyAxMikgKiAyIGNo
YXJhY3RlcnMgcGVyIG92ZXJsYXAoYXQgbGVhc3Qgb24gQXJtNjQpKS4KPiAKPiBBZ2FpbiwgdGhp
cyBpcyBib290IGNvZGUgYW5kIG5vdCBhIHBhdGggdGhhdCBpcyBnb2luZyB0byBiZSBjYWxsZWQK
PiBodW5kcmVkcyBvZiB0aW1lLiBTbyBwZXJmb3JtYW5jZSBpcyB0aGUgbGFzdCB0aGluZyBJIGNh
cmUgaW4gdGhpcwo+IHBhdGNoLgo+IAo+IElmIHdlIHRyeSB0byBoZWxwIHRoZSB1c2VycyBieSB0
ZWxsaW5nIHRoZW0gdGhlcmUgaXMgYW4gb3ZlcmxhcAo+IGJldHdlZW4gbW9kdWxlcywgdGhlbiB3
ZSBzaG91bGQgZG8gaXQgcHJvcGVybHkgYW5kIHRlbGwgdGhlbSB0aGUgZXhhY3QKPiBvdmVybGFw
LiBPdGhlcndpc2UgdGhpcyBpcyBuZWFybHkgYXMgcG9pbnRsZXNzIGFzIGEgY3Jhc2ggbGF0ZXIg
b24gaW4KPiB0aGUgYm9vdCBwcm9jZXNzLgo+IAo+IEkgYWxzbyBkb24ndCB3YW50IGEgZG91Ymxl
IGZvciBsb29wIG9yIGFueSBhZGRpdGlvbmFsIGdsb2JhbCB2YXJpYWJsZQo+IHdoZW4gaXQgY2Fu
IGJlIGRvbmUgYnkgc2ltcGx5IGFkZGluZyBhIGNoZWNrIGluIGFkZF9ib290X21vZHVsZSgpLgoK
VGhpcyBpc24ndCBhYm91dCBwZXJmb3JtYW5jZSAob3RoZXIgdGhhbiB0aGUgbmVzdGVkIGZvciks
IHRoaXMgaXMgYWJvdXQKcHJvdmlkaW5nIGEgcmVsYXRpdmVseSBjbGVhbiBhbmQgc2FuZSBsb2cg
dG8gcmVhZC4gIEl0J3Mgbm90IHRoYXQKZGlmZmljdWx0IHRvIGdvIHRocm91Z2ggdGhlIGFkZHJl
c3NlcyBhbmQgc2VlIGNvbmZsaWN0cy4gIFRoaXMgYWxzbwprZWVwcyBpdCBhbGwgaW4gb25lIHBh
cnQgb2YgdGhlIGxvZyBhbmQgc2hvcnRlciB3aXRob3V0IGxvc2luZwppbmZvcm1hdGlvbi4gIFNo
b3J0ZXIgYW5kIHdlbGwgc3RydWN0dXJlZCBsb2dzICh3aXRob3V0IGxvc2luZyBpbmZvKQptYWtl
cyBpdCBlYXNpZXIgdG8gcmVhZC4gIE1ha2luZyBsb2dzIGVhc2llciB0byByZWFkIGhlbHBzIGV2
ZXJ5b25lLgoKU2hvd2luZyB0aGUgYWRkcmVzc2VzIGFuZCBtb2R1bGUgbmFtZSBpdHNlbGYgd2ls
bCB0YWtlIDIgbGluZXMgYXNzdW1pbmcKeW91IHN0YXkgd2l0aGluIDgwIGNoYXJzLiAgKDE2KjIg
KyAxMikgKiAyID0gODgsIHRoYXQncyB3aXRob3V0IHNwYWNlcywKJzB4J3Mgb3IgYW55IHNvcnQg
b2YgbWVzc2FnZSBleHBsYWluaW5nIHdoYXQncyBhY3R1YWxseSBnb2luZyB3cm9uZy4KVGhlIG1v
ZHVsZSBuYW1lcyBhbmQgYWRkcmVzc2VzIHdpbGwgYmUgcHJpbnRlZCBvdXQgYW55d2F5IGluIHRo
ZSBuZWFyCmZ1dHVyZSwgc28gd2h5IG5vdCBncm91cCB0aGVtIHRvZ2V0aGVyPwoKVGhlIHB1cnBv
c2Ugb2YgdGhlIHdhcm5pbmcgaXMgdG8gdGVsbCB0aGUgdXNlciBzb21ldGhpbmcgaXMgd3Jvbmcs
IGJvdGgKbWVzc2FnZXMgZG8gdGhhdCBhbmQgcHJvdmlkZSB0aGUgaW5mb3JtYXRpb24gdG8gZGV0
ZXJtaW5lIHdoYXQncyB3cm9uZy4KCkJyaWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
