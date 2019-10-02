Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42058C94C9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 01:24:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFnvg-00072Z-3v; Wed, 02 Oct 2019 23:21:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VXk2=X3=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iFnve-00072U-3i
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 23:21:06 +0000
X-Inumbo-ID: 4e1979a6-e56b-11e9-bf31-bc764e2007e4
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (unknown
 [40.107.74.71]) by localhost (Halon) with ESMTPS
 id 4e1979a6-e56b-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 23:21:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d74wuksHzydgP5J9SIXwkq3MHfh4H6urFONjTivJiP6+yYU2VyMSPPct/47GrxV6/3+cg3UumhQXYYSlD4bH2Zk9Gimiga3MfergSaht7hPDKCwUl9tY8flWa8WAOJoCgG9HEnqjTnMzj0xpl6e4CXFwAOPFuuElItzyMIPsSCXRgkxBPTMBt0J6akQBeHtzb9Wdu4smGs2YUZaBPZlvlDHd+ksxZK/ouh6wjN+T808XUpprgtrQk9MSaHmI5XFVe7h42wzyXcS6U1Hl3Je56sI4sJ4xCgv+X3DtQIfUaseLGzrmnndRbAh5Di7z+U0YuLXQBLSt3SnPwEXvtp8iuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yipiZRJ5tdE4vqJoaO6lQ/6ji3rs5NCToE0a3wXfnKc=;
 b=Don4+WVERRPxbrtoCW7CY5ygdr6FvneOmu9RnHhA84MRtC1dVlhWc2db6HmXDFFO58jbf4C2frHize+pnqLUdt6vpfaKxFuE9ZkTAAr3XVC9TVF5VwLlPgaAD14VrdDyd6QqEk5ETXgKTk5x9zhGN50S7A6+7ePosyu3jTa41MhvmMZ4S8H6dJeRqA6jpr+8iAWSa3eLLVpj0XyIsMsLNZU/3Phv2bJEXosVnX4GUpjM+gNjzxXd1QD9g0hKmNmOGh2uKxGPlmnESIAk+3b1MmFSfJziTzZ6Z0o9HwzOgmdsqoT/km/TWp3yIlJtNN/x6KyfE2/EOmd5ioWsYbMydQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yipiZRJ5tdE4vqJoaO6lQ/6ji3rs5NCToE0a3wXfnKc=;
 b=g+mUrvqxPHBjEZ1NyHsZjHIb/ORNi4mvc8JXsPNLF4iuJI9d5cY8Sf2VzLwucBQX8WCVPKPcWF7zhSkmubktVhS71GLYru7HpKSjRSY+NY48jg2ey7rdxNramhL8r9kHDKatTfWP5xB/2eLdYJ48vilKQuv6yps6+peoEyHWwec=
Received: from DM6PR02CA0081.namprd02.prod.outlook.com (2603:10b6:5:1f4::22)
 by BN7PR02MB5313.namprd02.prod.outlook.com (2603:10b6:408:32::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.22; Wed, 2 Oct
 2019 23:20:34 +0000
Received: from SN1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::203) by DM6PR02CA0081.outlook.office365.com
 (2603:10b6:5:1f4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.19 via Frontend
 Transport; Wed, 2 Oct 2019 23:20:33 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT019.mail.protection.outlook.com (10.152.72.130) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2305.20
 via Frontend Transport; Wed, 2 Oct 2019 23:20:33 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iFnv6-0006NN-Nz; Wed, 02 Oct 2019 16:20:32 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iFnv1-0006dS-LU; Wed, 02 Oct 2019 16:20:27 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x92NKINi013939; 
 Wed, 2 Oct 2019 16:20:18 -0700
Received: from [172.19.2.62] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iFnus-0006cj-AI; Wed, 02 Oct 2019 16:20:18 -0700
Date: Wed, 2 Oct 2019 16:20:18 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20191002232017.GC2644@xilinx.com>
References: <20191002003228.GA3940@xilinx.com>
 <48c9fc54-553e-3b6b-bad2-dbad35991df0@arm.com>
 <b02aeec5-b90f-d330-a504-0ab0e6ff86c9@arm.com>
 <20191002185617.GA2644@xilinx.com>
 <75d64b52-7bea-3349-e45f-44c8bce86d6e@arm.com>
 <20191002212249.GB2644@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002212249.GB2644@xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(86362001)(8936002)(23726003)(11346002)(7696005)(446003)(47776003)(126002)(2616005)(106002)(476003)(70206006)(70586007)(426003)(336012)(76176011)(186003)(16586007)(2906002)(53546011)(8676002)(81166006)(81156014)(26005)(316002)(54906003)(6246003)(33656002)(50466002)(58126008)(36756003)(14444005)(5024004)(4326008)(36386004)(5660300002)(1076003)(305945005)(356004)(478600001)(229853002)(44832011)(6916009)(9786002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR02MB5313; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c13144b-e934-442f-79cd-08d7478f1f95
X-MS-TrafficTypeDiagnostic: BN7PR02MB5313:|BN7PR02MB5313:|BN7PR02MB5313:
X-Microsoft-Antispam-PRVS: <BN7PR02MB5313DB154BDB2DEC051308D2D79C0@BN7PR02MB5313.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vVuxnJ/d794jif7b83Ctg8r2oRyhGELBzPT3KFAycjBNWs8cshK1fKGrjTG0UpSUAzrqFcvkF7znRdyQaWvu0bFCfvSr5Wry8GmUF4A5UA5D7BOEWbUJF8G3xpJcGWc81lCBmWHZF77qPyobxOwCyGCoy6zE4Qm27whMLmXOVAE9pSV1L9J9YzGyI0MBkrk91c7GWeSZl0Omz5N3+l6tGvl4VZattZRR0IDANZvRRt9mUnugo3o34NP07eD0OezfP7siiV9QM4q1FWzImG4a0gc4Ys1IISjDhKNCDUOlk/sDwyLT1qTd5gi3ZMTmVtpPIVqpGQN0gig2mNgKhUJmhQGkyDXSTNG4PkkIJRUCuvNveaMmdlWw/hQIw8l51n3qOm4Ic++RpnGrtQRouP7b4l5M2TvqZFIRM/uXB0zLw1U=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 23:20:33.0881 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c13144b-e934-442f-79cd-08d7478f1f95
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5313
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
Cc: Brian Woods <brian.woods@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDI6MjI6NDlQTSAtMDcwMCwgQnJpYW4gV29vZHMgd3Jv
dGU6Cj4gT24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDg6NTk6MjhQTSArMDEwMCwgSnVsaWVuIEdy
YWxsIHdyb3RlOgo+ID4gSGksCj4gPiAKPiA+IE9uIDEwLzIvMTkgNzo1NiBQTSwgQnJpYW4gV29v
ZHMgd3JvdGU6Cj4gPiAKPiA+IEhtbW0sIHRoZSBmaXJzdCBlLW1haWwgZGlkbid0IGxhbmQgaW4g
bXkgaW5ib3ggZGlyZWN0bHkgKEkgaGF2ZSBhIGZpbHRlcgo+ID4gc2VuZCB0byBhIHNlcGFyYXRl
IGRpcmVjdG9yeSBhbnkgZS1tYWlsIEkgbm90IENDZWQgb24pLiBEaWQgeW91IEJDQyBtZSBieQo+
ID4gYW55IGNoYW5nZT8KPiBUaGF0J3Mgb2RkLiAgSSBrbm93IEkgY29waWVkIHlvdXIgYW5kIFN0
ZWZhbm8ncyBlbWFpbCBhZGRyZXNzZXMgZnJvbSB0aGUKPiBNQUlOVEFJTkVSUyBmaWxlIGJ1dCB1
bmRlciBteSBzZW50IGVtYWlscyBpdCBzaG93cyBpdCBoYXMgaGF2aW5nIG5vCj4gQ0NzLi4uICBQ
RUJDQUsgSSBndWVzcy4gIE15IGFwb2xvZ2llcy4KPiA+IAo+ID4gTGV0IHNlZSB0cnkgdG8gdHJv
dWJsZXNob290IGl0IGZpcnN0IDopLgo+ID4gCj4gPiBXZWxsLCBhbnkgYXR0YWNobWVudCB5b3Ug
c2VuZCBvbiB0aGUgTUwgd2lsbCBzdG9yZSB0byBlYWNoIHN1YnNjcmliZXJzCj4gPiBtYWlsYm94
LiBJIGxldCB5b3UgZG8gdGhlIG1hdGggaGVyZSA7KQo+ID4gCj4gPiBTbyB5ZWFoLCBwYXN0ZWJp
biBpcyBhbHdheXMgdGhlIHByZWZlcnJlZCB3YXkgd2hlbiB5b3UgaGF2ZSB0byBzZW5kIHRoZSBm
dWxsCj4gPiBsb2cuCj4gPiAKPiA+IFRoYW5rIHlvdSBmb3IgdGhlIGxvZy4gU28gdGhhdCdzIHBy
b2JhYmx5IG5vdCBhIGRvdWJsZS1pbml0IHRoZW4uCj4gPiAKPiA+IExvb2tpbmcgYmFjayBhdCB0
aGUgbG9nLCB0aGUgdmFsdWVzIGxvb2sgcXVpdGUgc2FuZS4gU28gSSBhbSBub3QgZW50aXJlbHkK
PiA+IHN1cmUgd2hhdCBpcyBoYXBwZW5pbmcuCj4gPiAKPiA+IEkgd291bGQgY2hlY2sgdGhhdCB0
aGUgZnJhbWV0YWJsZSBpcyBjb3JyZWN0bHkgemVyb2VkLiBZb3UgY291bGQgYWRkIGEgcHJpbnQK
PiA+IGF0IHRoZSBlbmQgb2Ygc2V0dXBfZnJhbWV0YWJsZV9tYXBwaW5ncyguLi4pIHRvIGR1bXAg
dGhlIGNvdW50X2luZm8gZm9yIHRoZQo+ID4gcGFnZS4gU29tZXRoaW5nIGxpa2U6Cj4gPiAgICAg
IG1mbl90b19wYWdlKF9tZm4oMHgwMTUzMykpLT5jb3VudF9pbmZvOwo+ID4gCj4gPiBJZiBpdCBp
cyBjb3JyZWN0bHkgaW5pdGlhbGl6ZWQsIGl0IHNob3VsZCBiZSB6ZXJvLgo+ID4gCj4gPiBUaGUg
bmV4dCBzdGVwIHdvdWxkIGJlIHRvIGFkZCBhIHNpbWlsYXIgcHJpbnQgaW4gc3RhcnRfeGVuKCkK
PiA+ICh4ZW4vYXJjaC9hcm0vc2V0dXAuYykgYW5kIHNlZSB3aGVyZSB0aGUgdmFsdWUgaXMgbm90
IDAgYW55bW9yZS4KPiA+IAo+ID4gQ2hlZXJzLAo+ID4gCj4gPiAtLSAKPiA+IEp1bGllbiBHcmFs
bAo+IAo+IEknbGwgZ28gYWhlYWQgYWRkIHRob3NlIGFuZCBzZWUgaWYgdGhhdCBsZWFkcyB0byBh
bnl0aGluZy4KPiAKPiAtLSAKPiBCcmlhbiBXb29kcwoKT2ssIEkgYWRkZWQ6CglwcmludGsoIkJX
X0RFQlVHOiAwMSBjb3VudF9pbmZvPTB4JTAxNmx4XG4iLAoJICAgIG1mbl90b19wYWdlKF9tZm4o
MHgwMTUzMykpLT5jb3VudF9pbmZvKTsKSW4gc29tZSBwbGFjZXMuICBJJ20gbm90IHN1cmUgYWJv
dXQgc29tZSBvZiB0aGUgZWFybGllciBvbmVzICh0aGUgb25lcwpiZWZvcmUgdGhlIFVBUlQgaXMg
c2V0IHVwKSwgIGJ1dCBhbGwgb2YgdGhlIG9uZXMgYWZ0ZXJ3YXJkcyB0aGF0CmFjdHVhbGx5IGdl
dCBvdXRwdXQgYXJlOgoJQldfREVCVUc6IDExIGNvdW50X2luZm89MHgwMTgwMDAwMDAwMDAwMDAw
CgpJcyBpdCB3b3J0aCB0cnlpbmcgdG8gZmlndXJlIG91dCB3aGVyZSB0aGUgcHJpbnRrIGJ1ZmZl
ciBpcyBhbmQgcmVhZGluZwppdCByZWFsbHkgZWFybHkgb24/CgotLSAKQnJpYW4gV29vZHMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
