Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763D8CAE03
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 20:19:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG5e0-00014I-FL; Thu, 03 Oct 2019 18:16:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/SG=X4=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iG5dz-000146-2n
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 18:16:03 +0000
X-Inumbo-ID: db3ac01c-e609-11e9-80e3-bc764e2007e4
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe49::61d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db3ac01c-e609-11e9-80e3-bc764e2007e4;
 Thu, 03 Oct 2019 18:16:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehMbGBfX7otqqRMKglHBo/itOvx9fcSPWJSRcjLz54yeOLyFSgZ1KcO4Xkt2LShiug9ZwqdH8oz3Bso6FrPAAddXcJqvwstS+KUHxiqtRttpcEbEuoilKqfLT6YQaIDSyYN21420O3fGtTehdMGbVG4B22j+5BzoAgmxvL/nPG1Zm5vCcvt7WybgOHkJYvY7eJyL2bGSgQMumlwFwDPr7XbZL+/P54fLthow2Y1wQUmB/xLBLEVtSdLQLeOHpCJfy+CUgheeVSUNkuFW38Ts31L43BAiP5fmhbKPz6LS3DxW9maRCEnJAKQ4fu6FVXLTLVTCXMJRbj17pZuJuBYXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjNrCo6APnXEypqk/vkp8nEoxR0EcktmW0IDj3bh3+8=;
 b=PslYx30CPueof8rCcFeuOt0Sc2NsQ5jXQ5l6vQJMBLgieLDsRUVcbcPmZevHtpMiF593+8EU89ghjAjxv6l2diJE3D36CuwBcJ1OotYHOkhw0zRz06wKel4obg1I9Io/87OI6+vEy88Uu71Hi0KsBfi3wJs30fys7GY+SXCnTiiZfQotdWSR5upoTL7goD5Izcln41gVFuBqe1zL0lejL1zQmyZ7dyY3+RHIaJQx0jj0tjvUil4l18G0WwRMNyhPkj5JS0nX4qNP+0Rauj00t4WiMfC+bQeob+8QClwfQXdrbCR3bdl/YX6pGSUsfqFq7FMc9DMJBQ3R8zscj62hLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjNrCo6APnXEypqk/vkp8nEoxR0EcktmW0IDj3bh3+8=;
 b=eg0ZCDhz4iomZB9/+PSAJLWrBkPX8rvAZ6v56Qd38ubrfn20YkLp52hI0/gD89LywQv4ycGdYviyCtaq51YINy2EsAZyAn55rLgqr8K9gs9AFSmXq7317CUQqHBrF12gWrazkr3ViVTqTP8y7bXilbKnP1bclXCnaEQQ3AOsiDs=
Received: from BYAPR02CA0013.namprd02.prod.outlook.com (2603:10b6:a02:ee::26)
 by SN6PR02MB5342.namprd02.prod.outlook.com (2603:10b6:805:71::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Thu, 3 Oct
 2019 18:15:59 +0000
Received: from BL2NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::202) by BYAPR02CA0013.outlook.office365.com
 (2603:10b6:a02:ee::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2263.21 via Frontend
 Transport; Thu, 3 Oct 2019 18:15:58 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT042.mail.protection.outlook.com (10.152.76.193) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2305.20
 via Frontend Transport; Thu, 3 Oct 2019 18:15:56 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iG5dr-0002NZ-9v; Thu, 03 Oct 2019 11:15:55 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iG5dm-0002Xw-6O; Thu, 03 Oct 2019 11:15:50 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x93IFlLr007830; 
 Thu, 3 Oct 2019 11:15:48 -0700
Received: from [172.19.2.62] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iG5dj-0002XX-RM; Thu, 03 Oct 2019 11:15:47 -0700
Date: Thu, 3 Oct 2019 11:15:47 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20191003181547.GA13953@xilinx.com>
References: <20191002003228.GA3940@xilinx.com>
 <48c9fc54-553e-3b6b-bad2-dbad35991df0@arm.com>
 <b02aeec5-b90f-d330-a504-0ab0e6ff86c9@arm.com>
 <20191002185617.GA2644@xilinx.com>
 <75d64b52-7bea-3349-e45f-44c8bce86d6e@arm.com>
 <20191002212249.GB2644@xilinx.com>
 <20191002232017.GC2644@xilinx.com>
 <ade177bc-003f-edcc-47fe-d1014d638990@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ade177bc-003f-edcc-47fe-d1014d638990@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(136003)(199004)(189003)(1076003)(36386004)(33656002)(23726003)(9786002)(47776003)(16586007)(356004)(44832011)(6916009)(76176011)(7696005)(53546011)(26005)(8936002)(8676002)(2906002)(86362001)(106002)(305945005)(36756003)(70206006)(58126008)(70586007)(54906003)(4326008)(126002)(476003)(486006)(2616005)(446003)(11346002)(186003)(426003)(81156014)(81166006)(336012)(229853002)(50466002)(316002)(6246003)(478600001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5342; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de6c657d-d8a1-4365-20cc-08d7482dbc35
X-MS-TrafficTypeDiagnostic: SN6PR02MB5342:
X-Microsoft-Antispam-PRVS: <SN6PR02MB53426E84B7E62D8CB7896249D79F0@SN6PR02MB5342.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01792087B6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HoLR1U4ZZtbd2Hv4CFAZVPA1bxx4Zumq+yHJFji204/KEV33QL2YF3cs6WFk7oAVVpfHlaHs+Q5ScgrFNhAUk7XJPDiMqqTvWixOv1ODIyTgctS4vJ3b+3TjvvqcOFkHUai4pmD4h2WDVENYxcp2XPstihLL+dDEOdu6ExA3DjUHE5W9m+AzzF6+DTRd/UKWSjInmpZW5IcM5/NjobAXDDo9FQJgfKF8g6kutxPRO10gXISgVgXb7Sxgw9AiasxX0oFBWnNq5WRSGhYZMHyZlIF4JmAzuThz8IMmPZrKlBJuQ9qLmg/R2eis2nU4sMUo1EfbVqbohJ58zkpQETXPuRRXTG51idYrfQwaH40n+DUkVKdM7VCxRxky+Fnfov1zqVfLK1t1bkT7xwvdw+3bv1NcCVIYWnep+SNz4NGXka4=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2019 18:15:56.2699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de6c657d-d8a1-4365-20cc-08d7482dbc35
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5342
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

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDY6MDg6NDVQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDAzLzEwLzIwMTkgMDA6MjAsIEJyaWFuIFdvb2RzIHdyb3RlOgo+
ID5PbiBXZWQsIE9jdCAwMiwgMjAxOSBhdCAwMjoyMjo0OVBNIC0wNzAwLCBCcmlhbiBXb29kcyB3
cm90ZToKPiA+PlRoYXQncyBvZGQuICBJIGtub3cgSSBjb3BpZWQgeW91ciBhbmQgU3RlZmFubydz
IGVtYWlsIGFkZHJlc3NlcyBmcm9tIHRoZQo+ID4+TUFJTlRBSU5FUlMgZmlsZSBidXQgdW5kZXIg
bXkgc2VudCBlbWFpbHMgaXQgc2hvd3MgaXQgaGFzIGhhdmluZyBubwo+ID4+Q0NzLi4uICBQRUJD
QUsgSSBndWVzcy4gIE15IGFwb2xvZ2llcy4KPiA+Pgo+ID4+SSdsbCBnbyBhaGVhZCBhZGQgdGhv
c2UgYW5kIHNlZSBpZiB0aGF0IGxlYWRzIHRvIGFueXRoaW5nLgo+ID4+Cj4gPj4tLSAKPiA+PkJy
aWFuIFdvb2RzCj4gPgo+ID5PaywgSSBhZGRlZDoKPiA+CXByaW50aygiQldfREVCVUc6IDAxIGNv
dW50X2luZm89MHglMDE2bHhcbiIsCj4gPgkgICAgbWZuX3RvX3BhZ2UoX21mbigweDAxNTMzKSkt
PmNvdW50X2luZm8pOwo+ID5JbiBzb21lIHBsYWNlcy4gIEknbSBub3Qgc3VyZSBhYm91dCBzb21l
IG9mIHRoZSBlYXJsaWVyIG9uZXMgKHRoZSBvbmVzCj4gPmJlZm9yZSB0aGUgVUFSVCBpcyBzZXQg
dXApLCAgYnV0IGFsbCBvZiB0aGUgb25lcyBhZnRlcndhcmRzIHRoYXQKPiA+YWN0dWFsbHkgZ2V0
IG91dHB1dCBhcmU6Cj4gPglCV19ERUJVRzogMTEgY291bnRfaW5mbz0weDAxODAwMDAwMDAwMDAw
MDAKPiA+Cj4gPklzIGl0IHdvcnRoIHRyeWluZyB0byBmaWd1cmUgb3V0IHdoZXJlIHRoZSBwcmlu
dGsgYnVmZmVyIGlzIGFuZCByZWFkaW5nCj4gPml0IHJlYWxseSBlYXJseSBvbj8KPiA+Cj4gCj4g
SWYgeW91IGhhdmVuJ3QgZW5hYmxlIEVBUkxZX1BSSU5USyBpbiBYZW4sIHRoZW4geW91IG1heSB3
YW50IHRvIGRvIGl0LiBUaGlzCj4gd291bGQgaGVscCB5b3UgdG8gdW5kZXJzdGFuZCB3aGVyZSB0
aGUgcGFnZS0+Y291bnRfaW5mbyBpcyBub3QgemVyb2VkLgo+IAo+IAo+IENoZWVycywKPiAKPiAt
LSAKPiBKdWxpZW4gR3JhbGwKCkFoLCBJJ20gbm90IHVzZWQgdG8gc29tZSBvZiB0aGUgQXJtLWlz
bXMgaW4gWGVuIHlldC4KCihYRU4pIEJXX0RFQlVHOiAuNiBjb3VudF9pbmZvPTB4MDAwMDAwMDAw
MDAwMDAwMAooWEVOKSBEb21haW4gaGVhcCBpbml0aWFsaXNlZAooWEVOKSBCV19ERUJVRzogMDEg
Y291bnRfaW5mbz0weDAxODAwMDAwMDAwMDAwMDAKClRob3NlIGRlYnVnIG1lc3NhZ2VzIHNhbmR3
aWNoIGVuZF9ib290X2FsbG9jYXRvcigpIGluIHN0YXJ0X3hlbigpLgoKLS0gCkJyaWFuIFdvb2Rz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
