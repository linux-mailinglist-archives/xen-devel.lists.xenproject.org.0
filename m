Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FDBD45DF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 18:55:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIy0z-00059N-6c; Fri, 11 Oct 2019 16:43:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SPxS=YE=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iIy0x-00059I-6G
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 16:43:39 +0000
X-Inumbo-ID: 4640d2e2-ec46-11e9-beca-bc764e2007e4
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (unknown
 [40.107.75.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4640d2e2-ec46-11e9-beca-bc764e2007e4;
 Fri, 11 Oct 2019 16:43:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIJdcKazWjxieYgjxFLtJbkWwnwrPvcB0VurILLiHfu+36Z8ujeFKakS9qPsyKNmCuQ8J7FS6ljeQBolCbM/Aq34OGBoIIIF4GYiGur5F4VK2WYAvypbAmVnnIPeRNyQ1gkJWL/IxmRPlonF5OeAGsC8m/KTTGx2bbH/gnHh49UjYupKGtwFX6oJCzEWrSEOM4UVHPGK6eMLn91j9fb8zCN63NGJ24BZ1GGnJn1CNLBJXHu6ZRQVbDclSGsbhIteNagW19RQS4q+eVOZmGjbEVohUS0DZ68xa8rVbTYy/snRPK6rT9wq3ZOoWVrYIoYue38uy77C2U7TXWaF2IthkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3FOJxpxFyPs6qs80DOE2Kj0KYM4kPO0SVkruifjanc=;
 b=hqzMHdQ/0Rtr3h+Xr5oGVJdhMe7U4WbI1+uWCgQ7dkY9W/MeVBVBxaFSLyvs8LhXAjNSfegQ4k/oHWUVf7jjLdK7QnOqsjDunlvBnjtfMUdav2KoTqh5Dqn6MTURvUpSlz0bgcjTpSDqY+s3WyR6LUuMmyYjgyOa9SFYlJrrdMdE0Cc+7IaywM4e/Q1jzDRVIA/yoLbsyQt5FK/xjGxgXXojuCIiAx3TwHbDZxwIqGhm+lITNQQsLLPoeWdkdD/pm3wT/t289ew1j+yBCOWK+YEWs6QfAGlE5yY7hYClBx4P+kRVfu4fcLEru11CiMnoDWPQC2HxsOse3sIrd+AScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3FOJxpxFyPs6qs80DOE2Kj0KYM4kPO0SVkruifjanc=;
 b=EcY615G9M3z5GlCgOKXk7evvPcLHkqn2WBK3UncP9NMUB4cmf7KxLkD+4FuDmyfSq3U0mrM8bqCJlc5C1xcu18jGp7Se8+PqXsjNJMBWZnrjFX3f5oXgL/XdJ4aZDsDo8e9/nqkxLMZ0OL5dtPPoEEpxnfkEmNk9cVMH6bi+GGU=
Received: from BL0PR02CA0079.namprd02.prod.outlook.com (2603:10b6:208:51::20)
 by DM5PR02MB2794.namprd02.prod.outlook.com (2603:10b6:3:111::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 11 Oct
 2019 16:43:36 +0000
Received: from SN1NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::200) by BL0PR02CA0079.outlook.office365.com
 (2603:10b6:208:51::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 16:43:36 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT012.mail.protection.outlook.com (10.152.72.95) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2347.16
 via Frontend Transport; Fri, 11 Oct 2019 16:43:35 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iIy0t-0001Q5-5C; Fri, 11 Oct 2019 09:43:35 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iIy0o-0003w4-23; Fri, 11 Oct 2019 09:43:30 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x9BGhQL8008187; 
 Fri, 11 Oct 2019 09:43:26 -0700
Received: from [172.19.2.62] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iIy0k-0003vp-IW; Fri, 11 Oct 2019 09:43:26 -0700
Date: Fri, 11 Oct 2019 09:43:26 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20191011164325.GA18594@xilinx.com>
References: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
 <4da9c328-3968-5d46-6000-73e824b26962@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4da9c328-3968-5d46-6000-73e824b26962@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(199004)(189003)(44832011)(26005)(36386004)(86362001)(305945005)(8936002)(8676002)(14444005)(486006)(53546011)(356004)(476003)(5660300002)(50466002)(81156014)(478600001)(2906002)(81166006)(23726003)(7696005)(11346002)(2616005)(229853002)(70206006)(70586007)(106002)(58126008)(16586007)(446003)(54906003)(426003)(336012)(316002)(6246003)(47776003)(1076003)(33656002)(126002)(186003)(6916009)(76176011)(36756003)(4326008)(9786002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2794; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 216f4ec1-a0f1-4838-3bcb-08d74e6a2915
X-MS-TrafficTypeDiagnostic: DM5PR02MB2794:
X-Microsoft-Antispam-PRVS: <DM5PR02MB279464F8E2631E14B3244A73D7970@DM5PR02MB2794.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHCaWGmjdGu3P3fuaFSGhWe6aCa5DfVRITAaeeseGrDmkKm30eZVtrjZ3He7U8Q5yzP71Qr2mJVI/yPf/IUwByoOajRQOhWP9+GhdR5fEF5nuPgm/Pwzyv9A/0D9OnCYA9W4a2ok/ntk2N7pT/+8UHNDWMaJRVMsE2dXFehWWvUuokhfdOIYAYz+ctUgJeB1yNX6YBz+Lp0eOSV4J+0l38AmYN9h0XbO6AZ+esiVZKF2tCs8ADiIGteCdMNZL59QmIBfDnv+HFrXwGYPiQr7w7G3jOlf2PRvU05yui1mGLa9qwgW0BQO9+vhXfAZkliZbDt10ojRPTwpFIoJfe6+dSu2ZjV32m0z6ozngyctp//FICvq2WQmLxK8xmUXWjFxQD8yQrQ9jU5Tx3uyFXXodfzaGqiFsdwJTIB1690PLI4=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 16:43:35.7490 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 216f4ec1-a0f1-4838-3bcb-08d74e6a2915
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2794
Subject: Re: [Xen-devel] [PATCH] xen/arm: add warning if memory modules
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

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDQ6Mzk6MDdQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIEJyaWFuLAo+IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIDEw
LzkvMTkgODo0NyBQTSwgQnJpYW4gV29vZHMgd3JvdGU6Cj4gPkl0J3MgcG9zc2libGUgZm9yIGEg
bWlzY29uZmlndXJlZCBkZXZpY2UgdHJlZSB0byBjYXVzZSBYZW4gdG8gY3Jhc2ggd2hlbgo+ID50
aGVyZSBhcmUgb3ZlcmxhcHBpbmcgYWRkcmVzc2VzIGluIHRoZSBtZW1vcnkgbW9kdWxlcy4gIEFk
ZCBhIHdhcm5pbmcKPiA+d2hlbiBwcmludGluZyB0aGUgYWRkcmVzc2VzIHRvIGxldCB0aGUgdXNl
ciBrbm93IHRoZXJlJ3MgYSBwb3NzaWJsZQo+ID5pc3N1ZSB3aGVuIERFQlVHIGlzIGVuYWJsZWQu
Cj4gPgo+ID5TaWduZWQtb2ZmLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAeGlsaW54LmNv
bT4KPiA+LS0tCj4gPnNhbXBsZSBvdXRwdXQ6Cj4gPi4uLgo+ID4oWEVOKSBNT0RVTEVbMF06IDAw
MDAwMDAwMDE0MDAwMDAgLSAwMDAwMDAwMDAxNTNiOGYxIFhlbgo+ID4oWEVOKSBNT0RVTEVbMV06
IDAwMDAwMDAwMDc2ZDIwMDAgLSAwMDAwMDAwMDA3NmRjMDgwIERldmljZSBUcmVlCj4gPihYRU4p
IE1PRFVMRVsyXTogMDAwMDAwMDAwNzZkZjAwMCAtIDAwMDAwMDAwMDdmZmYzNjQgUmFtZGlzawo+
ID4oWEVOKSBNT0RVTEVbM106IDAwMDAwMDAwMDAwODAwMDAgLSAwMDAwMDAwMDAzMTgwMDAwIEtl
cm5lbAo+ID4oWEVOKSAgUkVTVkRbMF06IDAwMDAwMDAwMDc2ZDIwMDAgLSAwMDAwMDAwMDA3NmRj
MDAwCj4gPihYRU4pICBSRVNWRFsxXTogMDAwMDAwMDAwNzZkZjAwMCAtIDAwMDAwMDAwMDdmZmYz
NjQKPiA+KFhFTikKPiA+KFhFTikgV0FSTklORzogbW9kdWxlcyBYZW4gICAgICAgICAgYW5kIEtl
cm5lbCAgICAgICBvdmVybGFwCj4gPihYRU4pCj4gPihYRU4pIENvbW1hbmQgbGluZTogY29uc29s
ZT1kdHVhcnQgZHR1YXJ0PXNlcmlhbDAgZG9tMF9tZW09MUcgYm9vdHNjcnViPTAgbWF4Y3B1cz0x
IHRpbWVyX3Nsb3A9MAo+ID4uLi4KPiA+Cj4gPiAgeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyB8IDE3
ICsrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykK
PiA+Cj4gPmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIGIveGVuL2FyY2gvYXJt
L2Jvb3RmZHQuYwo+ID5pbmRleCAwOGZiNTlmLi4zY2IwYzQzIDEwMDY0NAo+ID4tLS0gYS94ZW4v
YXJjaC9hcm0vYm9vdGZkdC5jCj4gPisrKyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKPiA+QEAg
LTM4Nyw2ICszODcsMjMgQEAgc3RhdGljIHZvaWQgX19pbml0IGVhcmx5X3ByaW50X2luZm8odm9p
ZCkKPiA+ICAgICAgICAgICAgICAgICBtZW1fcmVzdi0+YmFua1tqXS5zdGFydCArIG1lbV9yZXN2
LT5iYW5rW2pdLnNpemUgLSAxKTsKPiA+ICAgICAgfQo+ID4gICAgICBwcmludGsoIlxuIik7Cj4g
PisKPiA+KyNpZm5kZWYgTkRFQlVHCj4gPisgICAgLyoKPiA+KyAgICAgKiBBc3N1bWluZyBhbGwg
Y29tYmluYXRpb25zIGFyZSBjaGVja2VkLCBvbmx5IHRoZSBzdGFydGluZyBhZGRyZXNzCj4gPisg
ICAgICogaGFzIHRvIGJlIGNoZWNrZWQgaWYgaXQncyBpbiBhbm90aGVyIG1lbW9yeSBtb2R1bGUn
cyByYW5nZS4KPiA+KyAgICAgKi8KPiA+KyAgICBmb3IgKCBpID0gMCA7IGkgPCBtb2RzLT5ucl9t
b2RzOyBpKysgKQo+ID4rICAgICAgICBmb3IgKCBqID0gMCA7IGogPCBtb2RzLT5ucl9tb2RzOyBq
KysgKQo+ID4rICAgICAgICAgICAgaWYgKCAoaSAhPSBqKSAmJgo+ID4rICAgICAgICAgICAgICAg
ICAobW9kcy0+bW9kdWxlW2ldLnN0YXJ0ID49IG1vZHMtPm1vZHVsZVtqXS5zdGFydCkgJiYKPiA+
KyAgICAgICAgICAgICAgICAgKG1vZHMtPm1vZHVsZVtpXS5zdGFydCA8Cj4gPisgICAgICAgICAg
ICAgICAgICBtb2RzLT5tb2R1bGVbal0uc3RhcnQgKyBtb2RzLT5tb2R1bGVbal0uc2l6ZSkgKQo+
ID4rICAgICAgICAgICAgICAgIHByaW50aygiV0FSTklORzogbW9kdWxlcyAlLTEycyBhbmQgJS0x
MnMgb3ZlcmxhcFxuIiwKPiA+KyAgICAgICAgICAgICAgICAgICAgICAgYm9vdF9tb2R1bGVfa2lu
ZF9hc19zdHJpbmcobW9kcy0+bW9kdWxlW2ldLmtpbmQpLAo+ID4rICAgICAgICAgICAgICAgICAg
ICAgICBib290X21vZHVsZV9raW5kX2FzX3N0cmluZyhtb2RzLT5tb2R1bGVbal0ua2luZCkpOwo+
IAo+IEkgYW0gbm90IGVudGlyZWx5IGhhcHB5IHdpdGggdGhlIGRvdWJsZSBmb3ItbG9vcCBoZXJl
Lgo+IAo+IEFzIHdlIGFscmVhZHkgZ28gdGhyb3VnaCBhbGwgdGhlIG1vZHVsZXMgaW4gYWRkX2Jv
b3RfbW9kdWxlKCkuIENvdWxkIHlvdQo+IGxvb2sgd2hldGhlciB0aGlzIGNoZWNrIGNvdWxkIGJl
IHBhcnQgb2YgaXQ/Cj4gCj4gVGhpcyBzaG91bGQgYWxzbyBhbGxvdyB0byBoYXZlIHRoaXMgY2hl
Y2sgZm9yIG5vbi1kZWJ1ZyBidWlsZCBhcyB3ZWxsLgo+IAo+IENoZWVycywKPiAKPiAtLSAKPiBK
dWxpZW4gR3JhbGwKClRvIG1ha2Ugc3VyZSB0aGUgbW9kdWxlIGlzIGdvaW5nIHRvIGdldCBhZGRl
ZCwgeW91J2QgbmVlZCB0byBkbyB0aGUKY2hlY2sgYWZ0ZXIgdGhlIGZvciBsb29wLiAgVGhpcyBt
ZWFucyB0aGVyZSdzIGdvaW5nIHRvIGJlIG11bHRpcGxlIGZvcgpsb29wcyBqdXN0IHNwcmVhZCBv
dmVyIHRoZSBjb3Vyc2Ugb2YgYWRkaW5nIHRoZSBib290IG1vZHVsZXMgcmF0aGVyIHRoYW4Kb25l
IHBsYWNlLgoKSSBoYWQgdGhpcyBiZWZvcmUgYnV0IGRlY2lkZWQgYWdhaW5zdCBpdCBidXQgYWZ0
ZXIgY2hhbmdpbmcgaXQgdG8gYm90aApzdGFydHMgcmF0aGVyIHRoYW4gdGhlIHN0YW5kIGFuZCBl
bmQgKGVuZHMgbG9vayBtdWNoIHVnbGllciksIGl0IGxvb2tzCmNsZWFuZXIuCgogICAgZm9yICgg
aSA9IDAgOyBpIDwgbW9kcy0+bnJfbW9kcy0xOyBpKysgKQogICAgICAgIGZvciAoIGogPSBpKzEg
OyBqIDwgbW9kcy0+bnJfbW9kczsgaisrICkKICAgICAgICAgICAgaWYgKCAoKG1vZHMtPm1vZHVs
ZVtpXS5zdGFydCA+PSBtb2RzLT5tb2R1bGVbal0uc3RhcnQpICYmCiAgICAgICAgICAgICAgICAg
IChtb2RzLT5tb2R1bGVbaV0uc3RhcnQgPD0KICAgICAgICAgICAgICAgICAgIG1vZHMtPm1vZHVs
ZVtqXS5zdGFydCArIG1vZHMtPm1vZHVsZVtqXS5zaXplKSkgfHwKICAgICAgICAgICAgICAgICAo
KG1vZHMtPm1vZHVsZVtqXS5zdGFydCA+PSBtb2RzLT5tb2R1bGVbaV0uc3RhcnQpICYmCiAgICAg
ICAgICAgICAgICAgIChtb2RzLT5tb2R1bGVbal0uc3RhcnQgPD0KICAgICAgICAgICAgICAgICAg
IG1vZHMtPm1vZHVsZVtpXS5zdGFydCArIG1vZHMtPm1vZHVsZVtpXS5zaXplKSkgKQogICAgICAg
ICAgICAgICAgcHJpbnRrKCJXQVJOSU5HOiBtb2R1bGVzICUtMTJzIGFuZCAlLTEycyBvdmVybGFw
XG4iLAogICAgICAgICAgICAgICAgICAgICAgIGJvb3RfbW9kdWxlX2tpbmRfYXNfc3RyaW5nKG1v
ZHMtPm1vZHVsZVtpXS5raW5kKSwKICAgICAgICAgICAgICAgICAgICAgICBib290X21vZHVsZV9r
aW5kX2FzX3N0cmluZyhtb2RzLT5tb2R1bGVbal0ua2luZCkpOwoKVGhhdCdzIGFsc28gYSBwb3Nz
aWJpbGl0eS4KCkkganVzdCBkb24ndCBzZWUgYSB3YXkgYXJvdW5kIGl0LCBjb21wdXRhdGlvbmFs
bHkuICBZb3UgY2FuIHNwbGl0IHdoZXJlCnRoZSBsb29wcyBhcmUgZXhlY3V0ZWQgYnV0IGluIHRo
ZSBlbmQgdGhlIHNhbWUgYW1vdW50IG9mIGNoZWNrcy90b3RhbAppdGVyYXRpb25zIGhhdmUgdG8g
YmUgcnVuLgoKSSB3YXMgdGFsa2luZyB0byBzb21lb25lIGFuZCBoZSBzdWdnZXN0ZWQgeW91IGNv
dWxkIGp1c3QgY2hlY2sgWGVuIGF0CmVhcmx5IGJvb3QgYW5kIHRoZW4gY2hlY2sgb3RoZXIgbW9k
dWxlcyBsYXRlci4KCi0tIApCcmlhbiBXb29kcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
