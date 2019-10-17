Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7692DB8E8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 23:24:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLDC7-0000O5-D4; Thu, 17 Oct 2019 21:20:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6xiX=YK=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iLDC5-0000O0-TA
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 21:20:26 +0000
X-Inumbo-ID: ee8f8e02-f123-11e9-a531-bc764e2007e4
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (unknown
 [40.107.82.71]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee8f8e02-f123-11e9-a531-bc764e2007e4;
 Thu, 17 Oct 2019 21:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b91EMXOZ3dZdUy2d+eS/dM/cVb21YglTyNfEPYntBpWJ4IHhYq3/PEED5ZOI6FVkS57yqRGI81kylpgei8ch7Jwrl4N9k0oUsRS/J47YL1WkQElMNz6LjiDXyQEd6q5VLrcjVlvJ0XuXT4faavP5JRo1bVyRTQE864Dg7ZkU6t5R5tYsrYYJbkccv7BvaMjRyxHiSuGhsqs1MSukq19DxTGEa+x813MDpeej4tmZR6TCD8iHoNSbmFZRI9Br40IKlyLV3T/zmWlWPxuvKN2fekwzRlrcMWrQzN9+u8OBBq+uRiS+ibgO/ptgBnqzJEwJ6Zabzm2TsjT0vNRLghrCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04GpXCZn3ftFDgRzMaAEDfwYCxGhugJk+fKUvrvt+gM=;
 b=H/6Ob4Y93/VghD3pGx1FPJDeMbRvk/Ta0rdVLKYMdZKCWgZEG/Nyc8va04XL7R9/pfGrjsREEqY9u7Qt1WjwoZBHHU3w5bwntsXiUNT5GTr5JGqH2LD/ClaCGj/E8OKMmaIIE2JmH4fQDgaX+V7MeKXx38in6aehPgrg28yZj+eUCiQrYXoMQEW0HTlZ+oDcbDHGROU7LGbOPj68guMH8/y9OrIsk1DuUAd/RsMSm5/LWeFsXKqdhxMyjJ88xnebs6w52jPKyehwD7ku1w/v5ogjMrNPJuRuzhWUcqXTn3hllFASz3Yl45r3IN0IPxS74gpDcvuRhSpLjmIuw6ZuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04GpXCZn3ftFDgRzMaAEDfwYCxGhugJk+fKUvrvt+gM=;
 b=aGlr0plLpucRJ+8+g9QWz8lski84Uqe6jbM4lV/oYdtDIpeggot8vaSEjg48P3J/eCDGB+nC6HGbvXPAxd7Rf9BorLEB2XCYC7XX15bc+pC1DI6YgaEXQuO2tHQzYu/LnQE895UaWQ1jA6hhKz6LSGXD9ZrUVFHeMnCD2D60fK8=
Received: from CY4PR02CA0013.namprd02.prod.outlook.com (2603:10b6:903:18::23)
 by SN6PR02MB4256.namprd02.prod.outlook.com (2603:10b6:805:3c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Thu, 17 Oct
 2019 21:20:22 +0000
Received: from CY1NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::209) by CY4PR02CA0013.outlook.office365.com
 (2603:10b6:903:18::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 21:20:22 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT018.mail.protection.outlook.com (10.152.75.183) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2367.14
 via Frontend Transport; Thu, 17 Oct 2019 21:20:22 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iLDC1-0005Ot-KT; Thu, 17 Oct 2019 14:20:21 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iLDBw-0001BS-F5; Thu, 17 Oct 2019 14:20:16 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may
 be forged))
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x9HLK5IM015061; 
 Thu, 17 Oct 2019 14:20:06 -0700
Received: from [172.19.2.62] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iLDBk-0000mf-SU; Thu, 17 Oct 2019 14:20:04 -0700
Date: Thu, 17 Oct 2019 14:20:04 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: Julien Grall <julien.grall.oss@gmail.com>
Message-ID: <20191017212004.GA15629@xilinx.com>
References: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
 <1571342860-15838-1-git-send-email-brian.woods@xilinx.com>
 <CAJ=z9a2TxLmtE2nrwYQNVvh3K8upSszYke-PZ8BeaAs2wc0qjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ=z9a2TxLmtE2nrwYQNVvh3K8upSszYke-PZ8BeaAs2wc0qjQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(136003)(346002)(189003)(199004)(16586007)(1076003)(23726003)(2906002)(70586007)(70206006)(36386004)(478600001)(36756003)(316002)(4326008)(106002)(58126008)(47776003)(54906003)(86362001)(50466002)(44832011)(6246003)(5660300002)(336012)(126002)(486006)(186003)(81156014)(81166006)(6916009)(33656002)(2616005)(11346002)(8676002)(476003)(229853002)(26005)(9786002)(14444005)(8936002)(426003)(76176011)(7696005)(356004)(305945005)(446003)(42866002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4256; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf2de103-27d1-4b72-6a53-08d75347d1c1
X-MS-TrafficTypeDiagnostic: SN6PR02MB4256:
X-Microsoft-Antispam-PRVS: <SN6PR02MB425692D94EA2C0538E9E3C48D76D0@SN6PR02MB4256.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qmmwky3uCw/TRkl4IPJ2FRZnleHJHZ8LZfD2IxDq82kz0HgPFu1xl9YaWAxLi2JzEz8AtjWUTCRx75aWN7it9Ib1Xx8fy/NeMbDM6+rlT/ldaqasXhHMHgC0Wegzc4fgzs3mRrBQANtev4v2yU1W7hfERACogaGC2kl5lvI4MBskssUtncymrrCZR8W9kjq8SrqHHCj5tbLI067wibyTnDRLEJBMF0XlIs4yDOdVCSr9BZPNEN8ml3/uwA0gSr7UT86WFifL9X252HSmvhj15MyuG+AXIktO7xIdMURcfdm7/lRobvlV7OrNytH3Cz5nNJAXF5gQS4vIcF1gYb1GwvuTdJ+CV0fUQZneQDu74WJHZEe5weCOACpULhhYEfOu6CB4/XntMCSmXoST2dBcHob4C145fdHOym86d4EmHXI=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 21:20:22.1200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2de103-27d1-4b72-6a53-08d75347d1c1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4256
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

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDk6MzQ6NTFQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIFRodSwgMTcgT2N0IDIwMTkgYXQgMjE6MDgsIEJyaWFuIFdvb2Rz
IDxicmlhbi53b29kc0B4aWxpbnguY29tPiB3cm90ZToKPiA+Cj4gPiBJdCdzIHBvc3NpYmxlIGZv
ciBhIG1pc2NvbmZpZ3VyZWQgZGV2aWNlIHRyZWUgdG8gY2F1c2UgWGVuIHRvIGNyYXNoIHdoZW4K
PiA+IHRoZXJlIGFyZSBvdmVybGFwcGluZyBhZGRyZXNzZXMgaW4gdGhlIG1lbW9yeSBtb2R1bGVz
LiAgQWRkIGEgd2FybmluZwo+ID4gd2hlbiBwcmludGluZyB0aGUgYWRkcmVzc2VzIHRvIGxldCB0
aGUgdXNlciBrbm93IHRoZXJlJ3MgYSBwb3NzaWJsZQo+ID4gaXNzdWUuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQHhpbGlueC5jb20+Cj4gPiAtLS0KPiA+
IHYxIC0+IHYyCj4gPiAgICAgICAgIC0gcmVtb3ZlZCBuZXN0ZWQgbG9vcCBhbmQgcGxhY2VkIGNo
ZWNrIGluIGFkZF9ib290X21vZHVsZSgpCj4gPgo+ID4gU2FtcGxlIG91dHB1dDoKPiA+IC4uLgo+
ID4gKFhFTikgTU9EVUxFWzBdOiAwMDAwMDAwMDAxNDAwMDAwIC0gMDAwMDAwMDAwMTU0MjEyMSBY
ZW4KPiA+IChYRU4pIE1PRFVMRVsxXTogMDAwMDAwMDAwMzg0NjAwMCAtIDAwMDAwMDAwMDM4NTAw
ODAgRGV2aWNlIFRyZWUKPiA+IChYRU4pIE1PRFVMRVsyXTogMDAwMDAwMDAwMzg1MzAwMCAtIDAw
MDAwMDAwMDdmZmY2NzYgUmFtZGlzawo+ID4gKFhFTikgTU9EVUxFWzNdOiAwMDAwMDAwMDAwMDgw
MDAwIC0gMDAwMDAwMDAwMzE4MDAwMCBLZXJuZWwKPiA+IChYRU4pICBSRVNWRFswXTogMDAwMDAw
MDAwMzg0NjAwMCAtIDAwMDAwMDAwMDM4NTAwMDAKPiA+IChYRU4pICBSRVNWRFsxXTogMDAwMDAw
MDAwMzg1MzAwMCAtIDAwMDAwMDAwMDdmZmY2NzYKPiA+IChYRU4pCj4gPiAoWEVOKSBXQVJOSU5H
OiBvdmVybGFwIGRldGVjdGVkIGluIHRoZSBtZW1vcnkgbW9kdWxlIGFkZHJlc3Nlcwo+ID4gKFhF
TikKPiA+IChYRU4pIENvbW1hbmQgbGluZTogY29uc29sZT1kdHVhcnQgZHR1YXJ0PXNlcmlhbDAg
ZG9tMF9tZW09MUcgYm9vdHNjcnViPTAgbWF4Y3B1cz0xIHRpbWVyX3Nsb3A9MAo+ID4gLi4uCj4g
Pgo+ID4gIHhlbi9hcmNoL2FybS9ib290ZmR0LmMgICAgICB8IDQgKysrKwo+ID4gIHhlbi9hcmNo
L2FybS9zZXR1cC5jICAgICAgICB8IDYgKysrKysrCj4gPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9z
ZXR1cC5oIHwgMSArCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0vYm9v
dGZkdC5jCj4gPiBpbmRleCAwOGZiNTlmLi5mOGIzNGQ0IDEwMDY0NAo+ID4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2Jvb3RmZHQuYwo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+ID4gQEAg
LTM4Nyw2ICszODcsMTAgQEAgc3RhdGljIHZvaWQgX19pbml0IGVhcmx5X3ByaW50X2luZm8odm9p
ZCkKPiA+ICAgICAgICAgICAgICAgICBtZW1fcmVzdi0+YmFua1tqXS5zdGFydCArIG1lbV9yZXN2
LT5iYW5rW2pdLnNpemUgLSAxKTsKPiA+ICAgICAgfQo+ID4gICAgICBwcmludGsoIlxuIik7Cj4g
PiArCj4gPiArICAgIGlmICggbWVtX21vZHVsZV9vdmVybGFwICkKPiA+ICsgICAgICAgIHByaW50
aygiV0FSTklORzogb3ZlcmxhcCBkZXRlY3RlZCBpbiB0aGUgbWVtb3J5IG1vZHVsZSBhZGRyZXNz
ZXMuXG4iKTsKPiAKPiBBcyBhIHVzZXIgc3VjaCBtZXNzYWdlIHdvdWxkIGxpa2VseSBwdXQgbWUg
b2ZmLiBZb3UgdGVsbCBtZSB0aGVyZSBhcmUKPiBhbiBvdmVybGFwLCBidXQgeW91IGRvbid0IHBy
b3ZpZGUgbW9yZSBpbmZvcm1hdGlvbiBldmVuIGlmIHlvdSBsaWtlbHkKPiBoYXZlIHRoZSBpbmZv
cm1hdGlvbiBpbiBwbGFjZS4gSG93ZXZlci4uLgoKV2VsbCwgSSBzdXBwb3NlIHRoZSBtZXNzYWdl
IGNvdWxkIGJlIGNoYW5nZWQgdG8gc29tZXRoaW5nIGxpa2U6CiJXQVJOSU5HOiBvdmVybGFwIGRl
dGVjdGVkIGluIHRoZSBhYm92ZSBtZW1vcnkgbW9kdWxlIGFkZHJlc3Nlcy4iCm9yIHNvbWV0aGlu
ZyB0byBtb3JlIGRpcmVjdGx5IGd1aWRlIHRoZSB1c2VycyB0byB0aGUgc2VjdGlvbi4gIE1heWJl
Cm1vdmUgdGhlICdwcmludGsoIlxuIik7JyBhZnRlciB0aGUgd2FybmluZyBzbyBpdCdzIGdyb3Vw
ZWQgdGlnaHRlciB3aXRoCnRoZSBtb2R1bGUgaW5mb3JtYXRpb24uCgo+ID4gKwo+ID4gICAgICBm
b3IgKCBpID0gMCA7IGkgPCBjbWRzLT5ucl9tb2RzOyBpKysgKQo+ID4gICAgICAgICAgcHJpbnRr
KCJDTURMSU5FWyUiUFJJcGFkZHIiXTolcyAlc1xuIiwgY21kcy0+Y21kbGluZVtpXS5zdGFydCwK
PiA+ICAgICAgICAgICAgICAgICBjbWRzLT5jbWRsaW5lW2ldLmR0X25hbWUsCj4gPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+ID4gaW5k
ZXggNzA1YTkxNy4uMzE1YTEzMSAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5j
Cj4gPiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+ID4gQEAgLTY5LDYgKzY5LDggQEAgaW50
ZWdlcl9wYXJhbSgieGVuaGVhcF9tZWdhYnl0ZXMiLCBvcHRfeGVuaGVhcF9tZWdhYnl0ZXMpOwo+
ID4KPiA+ICBkb21pZF90IF9fcmVhZF9tb3N0bHkgbWF4X2luaXRfZG9taWQ7Cj4gPgo+ID4gK2Jv
b2wgX19pbml0ZGF0YSBtZW1fbW9kdWxlX292ZXJsYXA7Cj4gPiArCj4gPiAgc3RhdGljIF9fdXNl
ZCB2b2lkIGluaXRfZG9uZSh2b2lkKQo+ID4gIHsKPiA+ICAgICAgLyogTXVzdCBiZSBkb25lIHBh
c3Qgc2V0dGluZyBzeXN0ZW1fc3RhdGUuICovCj4gPiBAQCAtMjU0LDYgKzI1NiwxMCBAQCBzdHJ1
Y3QgYm9vdG1vZHVsZSBfX2luaXQgKmFkZF9ib290X21vZHVsZShib290bW9kdWxlX2tpbmQga2lu
ZCwKPiA+ICAgICAgICAgICAgICAgICAgbW9kLT5kb21VID0gZmFsc2U7Cj4gPiAgICAgICAgICAg
ICAgcmV0dXJuIG1vZDsKPiA+ICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgIGlmICggKCht
b2QtPnN0YXJ0ID49IHN0YXJ0KSAmJiAobW9kLT5zdGFydCA8IHN0YXJ0ICsgc2l6ZSkpIHx8Cj4g
PiArICAgICAgICAgICAgICgoc3RhcnQgPj0gbW9kLT5zdGFydCkgJiYgKHN0YXJ0IDwgbW9kLT5z
dGFydCArIG1vZC0+c2l6ZSkpICkKPiA+ICsgICAgICAgICAgICBtZW1fbW9kdWxlX292ZXJsYXAg
PSB0cnVlOwo+IAo+IC4uLiBXaGF0J3Mgd3Jvbmcgd2l0aCBqdXN0IGR1bXBpbmcgdGhlIGluZm9y
bWF0aW9uIGhlcmUgZGlyZWN0bHk/CgpJTU8sIGl0IGlzIGJldHRlciB0byBoYXZlIGFsbCB0aGUg
aW5mb3JtYXRpb24gcHJpbnRlZCBpbiBvbmUgc3BvdC4KVGhlcmUgaXMgbGVzcyB0byBnbyB0aHJv
dWdoIGFuZCBlYXNpZXIgdG8gZmluZCBvdXQgd2hhdCBpcyBoYXBwZW5pbmcuClRoZXJlIGlzIGFs
c28gdGhlIGZhY3QgdGhhdCB3ZSBkbyBub3QgaGF2ZSB0byBwcmludCB0aGluZ3MgdHdpY2UgKDIg
c2V0cwpvZiBuYW1lcywgc3RhcnRpbmcgYWRkcmVzc2VzIGFuZCBlbmRpbmcgYWRkcmVzc2VzIHBl
ciBvdmVybGFwKSB3aGVuIGl0CmlzIGdvaW5nIHRvIGJlIHByaW50ZWQgaW4gdGhlIG5lYXIgZnV0
dXJlIGFueXdheS4gIFRoZSBjb3N0IG9mIHRoaXMgaXMKanVzdCBvbmUgaW5pdGRhdGEgYm9vbCwg
d2hpY2ggd2hpbGUgSSBhbSBub3QgdGhyaWxsZWQgYWJvdXQsIGRvZXMgbm90CnNlZW0gdGhhdCBl
eHBlbnNpdmUgKGNvbXBhcmVkIHRvIGEgbmVzdGVkIGxvb3Agb3IgcHJpbnRpbmcgb3V0IGF0IGxl
YXN0CigxNioyICsgMTIpICogMiBjaGFyYWN0ZXJzIHBlciBvdmVybGFwKGF0IGxlYXN0IG9uIEFy
bTY0KSkuCgpJIGRvIHRoaW5rIHRoZSBtZXNzYWdlIGNvdWxkIHVzZSBzb21lIHBvbGlzaCwgYnV0
IHRoaXMgYXBwcm9hY2ggbWFrZXMKdGhlIG1vc3Qgc2Vuc2UgdG8gbWUuCgpCcmlhbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
