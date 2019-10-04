Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C736CB2C8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 02:29:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGBPT-00057n-7D; Fri, 04 Oct 2019 00:25:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=23nd=X5=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iGBPS-00057i-7T
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 00:25:26 +0000
X-Inumbo-ID: 73bf5270-e63d-11e9-973b-12813bfff9fa
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.79.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73bf5270-e63d-11e9-973b-12813bfff9fa;
 Fri, 04 Oct 2019 00:25:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1mC6i1IP6P/K/A877jPJUXbj3mNICFpWPDZqqZdIdk5MZe9lVO6WwbYufKKkXQXdJuhJYFFDoNgTFL0uGu6J81gEym41kmYnw0ckj//MsRQS/P+R2LJVWjwkTJhBM+lls0XUFFmQUpo4gVC2H62kc4dXNRILme7+NdahPRgseqziT7lYU3Eq4sHfBnF9iOiaFhWpN/ojx0VJYu8ls9+YiIAF3SaA1PRnXVM55X7R29ov8BF4mqXYCqd8kYBtQf+NhhIwrZkXQb0V/FCuujBx3FlKyo2yPKf8qx6zDzrnazqSkl8FDG6fKrb00CZsrpQfaYODea6orHS6uMXuBJAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5PV4sHFnQeXr26+tZiTehTznpdG9ubWdS4yzUvtBSo=;
 b=YQVauFLFJIO7QbVIpE3EjNXguTwg2aHGBEcPEPDdeRMjVHKjlZfSyeHitiDuYN50vv5TCGqA/79PRMqa0uOyR3TbUFKbz49pS+UZKn7LVBtQJxh9es5PH97soG2a1O/RrpuXRxNX9V61P8csLmpSj6n6drk7avx4taTH09oITxFWmxfF0KNVBuC/dEPQG/by250aaeTOaMpSw5BsCpsZxOpF1Ro/8+Y/m8NH/N1/fJ2f/EqvHjBW5KaBsNngOgeQY8x391pFiCvh4NY0+1mQ9tl3380XUARGMwyxG2wabPwYnSz6cBnwVsqqGJ9CxrHYfE60Az+M6/B+RYOwWEtwLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5PV4sHFnQeXr26+tZiTehTznpdG9ubWdS4yzUvtBSo=;
 b=W3BgbHIgjZ4JKwmGlXPCKiHBdf80V97FampOiNqUx/ni/nuKQMGNukKVPDVL70K7+U2/VokpXLrblOlNSh6X0pyevCRoWZERy1Bwz6HqAO+nFpUPUyX7P5sl4GLS2TA0l3/8xCoh+TGdCCLkg4SQbKzg/W+GepXL3lpkx1m1g1Y=
Received: from MWHPR02CA0054.namprd02.prod.outlook.com (2603:10b6:301:60::43)
 by MWHPR0201MB3403.namprd02.prod.outlook.com (2603:10b6:301:76::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Fri, 4 Oct
 2019 00:25:19 +0000
Received: from SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::207) by MWHPR02CA0054.outlook.office365.com
 (2603:10b6:301:60::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Fri, 4 Oct 2019 00:25:18 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT035.mail.protection.outlook.com (10.152.72.145) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2327.21
 via Frontend Transport; Fri, 4 Oct 2019 00:25:18 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iGBPK-0005a9-3g; Thu, 03 Oct 2019 17:25:18 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iGBPF-00028H-0a; Thu, 03 Oct 2019 17:25:13 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x940P27Z010059; 
 Thu, 3 Oct 2019 17:25:02 -0700
Received: from [172.19.2.62] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iGBP4-0001yp-I0; Thu, 03 Oct 2019 17:25:02 -0700
Date: Thu, 3 Oct 2019 17:25:02 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20191004002502.GA9033@xilinx.com>
References: <b02aeec5-b90f-d330-a504-0ab0e6ff86c9@arm.com>
 <20191002185617.GA2644@xilinx.com>
 <75d64b52-7bea-3349-e45f-44c8bce86d6e@arm.com>
 <20191002212249.GB2644@xilinx.com>
 <20191002232017.GC2644@xilinx.com>
 <ade177bc-003f-edcc-47fe-d1014d638990@arm.com>
 <20191003181547.GA13953@xilinx.com>
 <c2ea24d9-6bd0-a5b2-9ea1-b3bfe5e30a02@arm.com>
 <20191003202457.GA4040@xilinx.com>
 <3764ed03-e2a8-31e4-0e73-0bd3d88434ca@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3764ed03-e2a8-31e4-0e73-0bd3d88434ca@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(189003)(199004)(478600001)(6246003)(23726003)(126002)(70206006)(476003)(70586007)(486006)(336012)(2616005)(44832011)(54906003)(58126008)(106002)(9786002)(50466002)(36756003)(36386004)(16586007)(86362001)(186003)(11346002)(76176011)(26005)(8676002)(305945005)(8936002)(47776003)(316002)(7696005)(6916009)(229853002)(426003)(2906002)(356004)(446003)(81166006)(81156014)(33656002)(1076003)(4326008)(5660300002)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0201MB3403; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c194bea4-e921-4272-489f-08d7486155ea
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3403:
X-Microsoft-Antispam-PRVS: <MWHPR0201MB3403FAD953BD98ABDF25D9B5D79E0@MWHPR0201MB3403.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 018093A9B5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wW/ue0HJVpffdtqrOtOSlhB4ck24fUACMKKIq/2+P80bb9I+eMsO7Jn2VeAQKJ/nU3VA0C0QimRgC7xFsvdgl5EyA3If/+mgC3hzyHjIkYbhltYEsmpVkV07wUbOm4fAnmbSkQbn7Mu+Vhh4PV8LpR5oxNE3ME5LHdY44XlUTSgmWfaO8IPcDehfg8jfsHJ7LVCfFULonPvi+M3TsMqTpc5S3XxfGxK709DkaecA7qWJbbmaFDOLJ54B+TRSpTLRd8nzQofAGw+X//5xr1iYB7m3o2njh6iStMHIQpAJK844Bkm7/M8r+RV9z7iGU7c/zWboUa27/p1sCYb6kUwxx1NFBvPy1k1lDJhm32kQ1IC74BPnw22P525VpwfLLzDRna/RpNZfo1dQZYP3jpKOLIMVYXC+x/gNMHCPxdzLqQQ=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2019 00:25:18.5178 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c194bea4-e921-4272-489f-08d7486155ea
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3403
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

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMTA6MjA6MzZQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIEJyaWFuLAo+IAo+IE9uIDEwLzMvMTkgOToyNCBQTSwgQnJpYW4gV29vZHMgd3Jv
dGU6Cj4gPk9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDA3OjIzOjIzUE0gKzAwMDAsIEp1bGllbiBH
cmFsbCB3cm90ZToKPiA+VGhlcmUncyBhIFdBUk5fT04oKSBiZXR3ZWVuIHRoZSB0d28gZGVidWcg
cHJpbnRrcyBjYWxscyBJIHNoYXJlZCBhYm92ZS4KPiAKPiBMb29raW5nIGF0IHRoZSBsb2csIHRo
ZSBNRk4gc2VlbXMgdG8gY29ycmVzcG9uZCB0byB0aGUgb25lIHJpZ2h0IGFmdGVyIFhlbgo+ICgw
MDAwMDAwMDAxNDAwMDAwIC0gMDAwMDAwMDAwMTUzMjhmMSkgaW4gbWVtb3J5Lgo+IAo+IFNvIGl0
IGlzIG5vcm1hbCB0byBoYXZlIHRoZSBwYWdlIGdpdmVuIHRvIHRoZSBib290IGFsbG9jYXRvci4g
SG93ZXZlciwgSSBhbQo+IG5vdCBlbnRpcmVseSBzdXJlIHdoaWNoIGJpdCBvZiBpbml0X2RvbmUo
KSBpcyBnaXZpbmcgdGhlIHBhZ2UgYWdhaW4gdG8KPiB4ZW5oZWFwLgo+IAo+IEl0IGlzIHVubGlr
ZWx5IHRvIGJlIGZyZWVfaW5pdF9tZW1vcnkoKSBiZWNhdXNlIGl0IGRlYWwgd2l0aCB0aGUgaW5p
dAo+IHNlY3Rpb24gdGhhdCBpcyBub3QgYXQgdGhlIGVuZCBvZiB0aGUgYmluYXJ5Lgo+IAo+IFRo
aXMgd291bGQgbGVhdmUgZGlzY2FyZF9pbml0aWFsX21vZHVsZXMoKSBidXQgdGhlcmUgYXJlIGEg
Y2hlY2sgdG8gc2tpcCBYZW4KPiBtb2R1bGUuCj4gCj4gVGhlIGNhbGwgc3RhY2sgb25seSBwcmlu
dCB0aGUgYWRkcmVzcyBhbmQgbm90IHRoZSBzeW1ib2wgYmVjYXVzZSBpdAo+IHVucmVnaXN0ZXJl
ZCB0aGUgc3ltYm9scyBmb3IgaW5pdC4gU2VlIHVucmVnaXN0ZXJfaW5pdF92aXJ0dWFsX21lbW9y
eSgpLgo+IAo+IChYRU4pIFhlbiBjYWxsIHRyYWNlOgo+IChYRU4pICAgIFs8MDAwMDAwMDAwMDIx
YzFhOD5dIHBhZ2VfYWxsb2MuYyNmcmVlX2hlYXBfcGFnZXMrMHgxYTgvMHg2MTQgKFBDKQo+IChY
RU4pICAgIFs8MDAwMDAwMDAwMDIxYzFhOD5dIHBhZ2VfYWxsb2MuYyNmcmVlX2hlYXBfcGFnZXMr
MHgxYTgvMHg2MTQgKExSKQo+IChYRU4pICAgIFs8MDAwMDAwMDAwMDIxZTkwMD5dIHBhZ2VfYWxs
b2MuYyNpbml0X2hlYXBfcGFnZXMrMHgzZDQvMHg1NjQKPiAoWEVOKSAgICBbPDAwMDAwMDAwMDAy
MWViMjQ+XSBpbml0X2RvbWhlYXBfcGFnZXMrMHg5NC8weDljCj4gKFhFTikgICAgWzwwMDAwMDAw
MDAwMmI4M2VjPl0gMDAwMDAwMDAwMDJiODNlYwo+IChYRU4pICAgIFs8MDAwMDAwMDAwMDJiODkw
ND5dIDAwMDAwMDAwMDAyYjg5MDQKPiAoWEVOKSAgICBbPDAwMDAwMDAwMDAyNjBhM2M+XSBzZXR1
cC5jI2luaXRfZG9uZSsweDEwLzB4MjAKPiAoWEVOKSAgICBbPDAwMDAwMDAwMDAyYjk5YWM+XSAw
MDAwMDAwMDAwMmI5OWFjCj4gCj4gWW91IHNob3VsZCBiZSBhYmxlIHRvIHVzZSBhZGRyMmxpbmUg
b24gdGhlIGFkZHJlc3Mgd2l0aCBYZW4gYmluYXJ5Lgo+IEkgaGF2ZSB0aGUgZmVlbGluZyB0aGlz
IHdpbGwgcG9pbnQgdG8gZGlzY2FyZF9pbml0aWFsX21vZHVsZXMoKSBhcyB0aGlzIGlzCj4gYW4g
aW5pdCBmdW5jdGlvbiBhbmQgdGhlIHN5bWJvbCBzaG91bGQgbm90IGJlIHByaW50ZWQuCj4gCj4g
QnV0LCBJIGNhbid0IHNlZSBhbnl0aGluZyBvYnZpb3VzbHkgd3JvbmcgaW4gdGhlIGZ1bmN0aW9u
Li4uIFNvIEkgYW0gbm90Cj4gZW50aXJlbHkgc3VyZSB3aGF0IGNvdWxkIGJlIHRoZSBuZXh0IHN0
ZXBzLgo+IAo+IENoZWVycywKPiAKPiAtLSAKPiBKdWxpZW4gR3JhbGwKCkluIHRoZSBsb2csIHRo
ZXJlJ3M6CihYRU4pIE1PRFVMRVswXTogMDAwMDAwMDAwMTQwMDAwMCAtIDAwMDAwMDAwMDE1MzI4
ZjEgWGVuCihYRU4pIE1PRFVMRVsxXTogMDAwMDAwMDAwNzZkMjAwMCAtIDAwMDAwMDAwMDc2ZGMw
ODAgRGV2aWNlIFRyZWUKKFhFTikgTU9EVUxFWzJdOiAwMDAwMDAwMDA3NmRmMDAwIC0gMDAwMDAw
MDAwN2ZmZjM2NCBSYW1kaXNrCihYRU4pIE1PRFVMRVszXTogMDAwMDAwMDAwMDA4MDAwMCAtIDAw
MDAwMDAwMDMxODAwMDAgS2VybmVsCihYRU4pICBSRVNWRFswXTogMDAwMDAwMDAwNzZkMjAwMCAt
IDAwMDAwMDAwMDc2ZGMwMDAKKFhFTikgIFJFU1ZEWzFdOiAwMDAwMDAwMDA3NmRmMDAwIC0gMDAw
MDAwMDAwN2ZmZjM2NAoKTGludXgga2VybmVsCS0+ICAgOF8wMDAwIC0gMzE4XzAwMDAKWGVuCQkt
PiAxNDBfMDAwMCAtIDE1M18yOGYxCgpUaGVyZSdzIHNvbWV0aGluZyBub3QgcXVpdGUgcmlnaHQg
aGVyZS4uLiBJJ20gZ3Vlc3NpbmcgWGVuIHdhcyB3b3JraW5nCmF0IHRoZSBhZGRyZXNzIGJlZm9y
ZSBiZWNhdXNlIGl0IHdhcyBvdXQgb2YgdGhlICJyYW5nZSIgb2YgdGhlIExpbnV4Cmtlcm5lbC4g
IE5vdyBJIGd1ZXNzIEkgbmVlZCB0byBsb29rIGludG8gaWYgaXQncyBhIFhlbiBvciB1LWJvb3Qg
aXNzdWUuCgotLSAKQnJpYW4gV29vZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
