Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F289DCBF6A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 17:39:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGPdo-0003pp-BA; Fri, 04 Oct 2019 15:37:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=23nd=X5=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iGPdn-0003pk-0K
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 15:37:11 +0000
X-Inumbo-ID: d43525b0-e6bc-11e9-9bee-bc764e2007e4
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe49::606])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d43525b0-e6bc-11e9-9bee-bc764e2007e4;
 Fri, 04 Oct 2019 15:37:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbvmnUzk7Fr2iIfWvd2NCSvZ6stSxtxFD18h2ukhRGRflDkH50Qrifnq6UdmJdCFZ0Yg9b693Bza/8G6c05WONu25RB9fWuKyfRGbVjdqIngW763FZwCHEgyphVE9r48TLW5/EFchVZNKyLdbzecf5voPBmjFLmwqSyilX2L+KEf6002WOu5b5eK7f4SZ2EeIOYVazlyeLm5cUlHq3l18vk851VUnUESwAfThKRMp6+VokF7kz0og2FHNHXvRZlVnfCFfd3fLpBPPujcZJkMilUJ+e4id09In8laZ8oq7dEBo4AVcz9T2kMpcizRNn+uXuMMuHFfwQ4z5ArGRb8SSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUh6UP3j/ouzid2QKrCNXUZZQyvTMprKPqqIPf/Ua4I=;
 b=EHzO+GPRDkbn5yDwVE+oGxQN8nfdkRkC5+rsrOwPlfvuv8vNz80z2BjU9XMSpt+MYzhsO5RvhF8IwegqNNuJ2LaRsqay5l4xJrFZMndul0ToRyJSyPZYWkn+lBDJMeCi3ALsbDMb0MCZ2An2yIq4+LelQNHcLCHj+By+68fnjRZCQ9QcmY7VR8wQbxrA4mepqufEyT6FWHAwpIVzKeE/YP8vYAE6wMeMSTh6evCzjhVOnoHCiEJpam6W59ljMLrxlfHZsPUjK1LutigGWxA3tINMQ0oLPeuM5Rq8yJTEZi0F8kAP/N6pPZD9FECZ9G2syITgl04FKBKVd4yZ+n7OiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUh6UP3j/ouzid2QKrCNXUZZQyvTMprKPqqIPf/Ua4I=;
 b=mSOFB+VddbVzk5dS+aiatqn8AFJSydzddeNg1Xq3dF57XYBNZ7xSPqHGDZSM7qeyU01/+6MOnUvx3uM2Jk7KVeR//rZdrJOUsRGR0IpTxYpfERs9aLYcM+8yyEgDg/q+qe+Iak4cLzoNEScB25zn3WRUbFxQtL5ondYgpNBNyko=
Received: from BN7PR02CA0018.namprd02.prod.outlook.com (2603:10b6:408:20::31)
 by SN6PR02MB5327.namprd02.prod.outlook.com (2603:10b6:805:71::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.16; Fri, 4 Oct
 2019 15:37:08 +0000
Received: from BL2NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::205) by BN7PR02CA0018.outlook.office365.com
 (2603:10b6:408:20::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.18 via Frontend
 Transport; Fri, 4 Oct 2019 15:37:08 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT053.mail.protection.outlook.com (10.152.76.225) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2327.21
 via Frontend Transport; Fri, 4 Oct 2019 15:37:07 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iGPdj-00056F-5I; Fri, 04 Oct 2019 08:37:07 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iGPde-0008I7-1I; Fri, 04 Oct 2019 08:37:02 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x94FatO8006020; 
 Fri, 4 Oct 2019 08:36:55 -0700
Received: from [172.19.2.62] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iGPdX-0008FJ-Mb; Fri, 04 Oct 2019 08:36:55 -0700
Date: Fri, 4 Oct 2019 08:36:55 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20191004153655.GA5856@xilinx.com>
References: <75d64b52-7bea-3349-e45f-44c8bce86d6e@arm.com>
 <20191002212249.GB2644@xilinx.com>
 <20191002232017.GC2644@xilinx.com>
 <ade177bc-003f-edcc-47fe-d1014d638990@arm.com>
 <20191003181547.GA13953@xilinx.com>
 <c2ea24d9-6bd0-a5b2-9ea1-b3bfe5e30a02@arm.com>
 <20191003202457.GA4040@xilinx.com>
 <3764ed03-e2a8-31e4-0e73-0bd3d88434ca@arm.com>
 <20191004002502.GA9033@xilinx.com>
 <edb70263-f98c-da0b-0e6a-859d6808b438@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <edb70263-f98c-da0b-0e6a-859d6808b438@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(189003)(199004)(426003)(356004)(106002)(86362001)(186003)(26005)(54906003)(70586007)(446003)(44832011)(58126008)(16586007)(9786002)(6916009)(316002)(6246003)(81166006)(81156014)(70206006)(50466002)(4326008)(478600001)(53546011)(476003)(76176011)(126002)(1076003)(36756003)(14444005)(7696005)(23726003)(2616005)(5660300002)(305945005)(33656002)(36386004)(486006)(8676002)(336012)(47776003)(229853002)(8936002)(2906002)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5327; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6dfb37f-83d2-481e-be1d-08d748e0b727
X-MS-TrafficTypeDiagnostic: SN6PR02MB5327:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5327C6691C9D0757FBDC00FED79E0@SN6PR02MB5327.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 018093A9B5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z6sBZFuXPoUJlNKWfbWMCklF4WItaF9QMsNbiyCszvuQEipfshtxdqBscV7EY/HrAA7Cxm2meC3nM3UwvzOuAASaTCZcIkuksGG5A9zU4IHF9cqrnFpJ/8BM9iE3NEZX2+ju/5hPGF7USbO7gUv3PtyYPwDmdyQDmtJoU0W6y7xFmZhp5Y8bBZRc0BbPrtNAL9NQxTcWtAR5GSi0e/5ZlCbegMAlg5fn0F6yPPz/VS599xqL/D4KI9L5FfRxzXELmxu2mk+KN7LZ5mfqB8cDM5MwHGCgLDkPwSJ+zFT2djsbL+7PxlP5kz3hDjibAMkYJim7jXZktBi53jP9XrurS1LKQwkIAG52anpir7OILwFU7tYX7A68ZPHtbg3RAMwFrIlt0YQHH5/zUQHAmm/yfL2J2mQEkgfrlDQ9CNa63xE=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2019 15:37:07.7182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dfb37f-83d2-481e-be1d-08d748e0b727
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5327
Subject: Re: [Xen-devel] Errors with Loading Xen at a Certain Address
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
Cc: Brian Woods <brian.woods@xilinx.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMTA6NDk6MjhBTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIEJyaWFuLAo+IAo+IE9uIDA0LzEwLzIwMTkgMDE6MjUsIEJyaWFuIFdvb2RzIHdy
b3RlOgo+ID4KPiA+SW4gdGhlIGxvZywgdGhlcmUnczoKPiA+KFhFTikgTU9EVUxFWzBdOiAwMDAw
MDAwMDAxNDAwMDAwIC0gMDAwMDAwMDAwMTUzMjhmMSBYZW4KPiA+KFhFTikgTU9EVUxFWzFdOiAw
MDAwMDAwMDA3NmQyMDAwIC0gMDAwMDAwMDAwNzZkYzA4MCBEZXZpY2UgVHJlZQo+ID4oWEVOKSBN
T0RVTEVbMl06IDAwMDAwMDAwMDc2ZGYwMDAgLSAwMDAwMDAwMDA3ZmZmMzY0IFJhbWRpc2sKPiA+
KFhFTikgTU9EVUxFWzNdOiAwMDAwMDAwMDAwMDgwMDAwIC0gMDAwMDAwMDAwMzE4MDAwMCBLZXJu
ZWwKPiA+KFhFTikgIFJFU1ZEWzBdOiAwMDAwMDAwMDA3NmQyMDAwIC0gMDAwMDAwMDAwNzZkYzAw
MAo+ID4oWEVOKSAgUkVTVkRbMV06IDAwMDAwMDAwMDc2ZGYwMDAgLSAwMDAwMDAwMDA3ZmZmMzY0
Cj4gPgo+ID5MaW51eCBrZXJuZWwJLT4gICA4XzAwMDAgLSAzMThfMDAwMAo+ID5YZW4JCS0+IDE0
MF8wMDAwIC0gMTUzXzI4ZjEKPiA+Cj4gPlRoZXJlJ3Mgc29tZXRoaW5nIG5vdCBxdWl0ZSByaWdo
dCBoZXJlLi4uIEknbSBndWVzc2luZyBYZW4gd2FzIHdvcmtpbmcKPiA+YXQgdGhlIGFkZHJlc3Mg
YmVmb3JlIGJlY2F1c2UgaXQgd2FzIG91dCBvZiB0aGUgInJhbmdlIiBvZiB0aGUgTGludXgKPiA+
a2VybmVsLiAgTm93IEkgZ3Vlc3MgSSBuZWVkIHRvIGxvb2sgaW50byBpZiBpdCdzIGEgWGVuIG9y
IHUtYm9vdCBpc3N1ZS4KPiAKPiBUaGUgbG9hZGluZyBhZGRyZXNzIHlvdSB3cm90ZSBtYXRjaCB0
aGUgb25lcyB5b3Ugc2VlbSB0byBoYXZlIHJlcXVlc3RlZCBpbiBVLWJvb3Q6Cj4gCj4gRmlsZW5h
bWUgJ3lvY3RvLUltYWdlJy4KPiBMb2FkIGFkZHJlc3M6IDB4ODAwMDAKPiAKPiBGaWxlbmFtZSAn
eGVuLWN1c3RvbS51YicuCj4gTG9hZCBhZGRyZXNzOiAweDE0MDAwMDAKPiAKPiBCdXQgdGhlIHNp
emUgZG9lcyBub3QgbWF0Y2ggdGhlIG9uZSB5b3UgcHJvdmlkZWQgaW4gdGhlIERldmljZS1UcmVl
Ogo+IAo+IEJ5dGVzIHRyYW5zZmVycmVkID0gMTgyMTU0MjQgKDExNWYyMDAgaGV4KQo+IAo+IHZz
Cj4gCj4gMHgwMDAwMDAwMDAzMTgwMDAwIC0gMHgwMDAwMDAwMDAwMDgwMDAwID0gMHgzMTAwMDAw
Cj4gCj4gVGhpcyBpcyBhbHdheXMgYSByaXNrIHdoZW4geW91IHdyaXRlIGluIGFkdmFuY2UgdGhl
IHNpemUgb2YgdGhlIGJpbmFyaWVzIGFuZAo+IGxvY2F0aW9uIGluIHRoZSBEZXZpY2UtVHJlZS4g
SWYgeW91IGFyZSB1c2luZyB0ZnRwL2xvYWQgZnJvbSBGUywgaXQgaXMgbXVjaAo+IGxlc3Mgcmlz
a3kgdG8gcHJvdmlkZSBhIFUtYm9vdCBzY3JpcHQgdGhhdCB3aWxsIGdlbmVyYXRlIHRoZSBYZW4g
RFQgbm9kZS4KPiAKPiBDaGVlcnMsCj4gCj4gLS0gCj4gSnVsaWVuIEdyYWxsCgpZZWFoLiAgV2hl
biBJIHdlbnQgaW4gYW5kIGNoYW5nZWQgdGhlIGVuZCBhZGRyZXNzIGluIHRoZSBkZXZpY2UgdHJl
ZSBhbmQKaXQgYWxsIHdvcmtlZC4gIEknbSBndWVzc2luZyBYZW4gY291bGQgdXNlIHNvbWUgd2Fy
bmluZ3MgYW5kIHNvbWUgb3RoZXIKdGhpbmdzIHRvIGFsZXJ0IHRoZSB1c2VyIHRoYXQgdGhlIGRl
dmljZSB0cmVlIG1heSBuZWVkIHR3ZWFraW5nIG9yIGF0CnRoZSB2ZXJ5IGxlYXN0IHNvbWUgY2hl
Y2tzLiAgSXQgc2VlbXMgdGhhdCB0aGUgYmxhbWUgd2Fzbid0IHByaW1hcmlseSBvbgpYZW4sIGFs
dGhvdWdoIGl0IGRpZG4ndCBkbyBhbnlvbmUgYW55IGZhdm9ycy4KCi0tIApCcmlhbiBXb29kcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
