Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F6AD4739
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 20:11:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIzJ6-0005o6-Ed; Fri, 11 Oct 2019 18:06:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SPxS=YE=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iIzJ5-0005o1-1E
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 18:06:27 +0000
X-Inumbo-ID: d6b36014-ec51-11e9-933e-12813bfff9fa
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (unknown
 [40.107.82.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6b36014-ec51-11e9-933e-12813bfff9fa;
 Fri, 11 Oct 2019 18:06:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a92NlEkMOBN8UC4ui1Q4HavkmG3wkXCDpaftYINogt4BPD4v7DHtT7aOZUsANToDoJqmuKjrILBiAjIm6J/gbbQhpNTJKU21z3eLzfxD6FOwctk8w5izX6ETM6LQvNpYr7DW237Gl6L90LeQ1jDv4ulXjthCJQGYaSa2c7gEXE4i27Cqm/dePziW1dLBRuz1nCkuB2bF3WY4JU//8nqsFfu40pWayL4ZcoE5LDeTWtC052MM78QW7IueaqsVMmzFiN4jcZgREzvOt6ubuYiQSTekU3Mb7IoMYDiR6e17xbUgIOLD+ex9e42UaJQE4Be/Ciocycz8M7nxgqgcs9wMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ro/IXZNeJk7uEKsnIrx4BOeN59o+Yyh/93GJ9j/XiMI=;
 b=Q9Q25xYVbudkvM0rCyV5GOFdrtmbNVs4tfaM/FxrnNUkKapqD+qaFZ3xJUZHL3AGDM/4evN1HB3jJfO1WFhVBg/+6pE3d2w1nC/NcvtTWWYpaxHpguSGM8GJ28TG4llUBIJ1KBQvxzEAtVM0LH1iZyBOQbi/GRaAUk7/zjY2oSu37T6F5SG8i/orgi7BWYNIN4l6Y7wwHmMqDKs0fDrdq26iaRGKPqIp9yWhzc4OVXb1l0+nBvnNUoNBhgEhXZ97TyZsdCDulIbL+5USGAOP/idaFaKMp47Y5q3Zu50FRHigPwoi/oFaVxYPs5iJhNzKNyl03OhyCsvI0M7EkFPVmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ro/IXZNeJk7uEKsnIrx4BOeN59o+Yyh/93GJ9j/XiMI=;
 b=kDi2vfQylAlBm/R3flF/lkuyrg6RCM5sO9PaM6atytKv5Wql2td/CssVtlBoNPLICvKdrkyHZBvdcww4ybYQN49qS4DiYAA5GHyOBdHE8ZtNAYaoOAu2YYJ7AoohNZx8PFOkOgMat+rYYcz+Ez38LciPrcNDVqMNAYiqd0YaqNw=
Received: from BN7PR02CA0002.namprd02.prod.outlook.com (2603:10b6:408:20::15)
 by BYAPR02MB5320.namprd02.prod.outlook.com (2603:10b6:a03:61::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Fri, 11 Oct
 2019 18:06:23 +0000
Received: from BL2NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::202) by BN7PR02CA0002.outlook.office365.com
 (2603:10b6:408:20::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.19 via Frontend
 Transport; Fri, 11 Oct 2019 18:06:22 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT035.mail.protection.outlook.com (10.152.77.157) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2347.16
 via Frontend Transport; Fri, 11 Oct 2019 18:06:22 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iIzIz-0004rz-Jc; Fri, 11 Oct 2019 11:06:21 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iIzIu-0001L7-GG; Fri, 11 Oct 2019 11:06:16 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x9BI6D2G029996; 
 Fri, 11 Oct 2019 11:06:13 -0700
Received: from [172.19.2.62] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iIzIr-0001KZ-1v; Fri, 11 Oct 2019 11:06:13 -0700
Date: Fri, 11 Oct 2019 11:06:13 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20191011180612.GA19987@xilinx.com>
References: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
 <4da9c328-3968-5d46-6000-73e824b26962@arm.com>
 <20191011164325.GA18594@xilinx.com>
 <b623fddb-9ab6-d9ef-0d66-93e465ee64c6@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b623fddb-9ab6-d9ef-0d66-93e465ee64c6@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(189003)(199004)(58126008)(54906003)(336012)(4326008)(6246003)(6916009)(486006)(305945005)(2906002)(16586007)(2616005)(11346002)(446003)(476003)(126002)(316002)(356004)(44832011)(33656002)(426003)(36386004)(1076003)(5660300002)(47776003)(86362001)(8676002)(81156014)(81166006)(23726003)(8936002)(229853002)(106002)(186003)(9786002)(76176011)(478600001)(7696005)(26005)(36756003)(70206006)(70586007)(14444005)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5320; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 536e45a7-101e-4c4b-ae35-08d74e75b961
X-MS-TrafficTypeDiagnostic: BYAPR02MB5320:
X-Microsoft-Antispam-PRVS: <BYAPR02MB53206577DFA79A48035EBEA3D7970@BYAPR02MB5320.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dGulJd+OFycNgkDI0w5wf2r6sUHTIHVTpzR0uwnxR/tFkMXkX7/9Pxtuw3jtPohg9NvI6Cp9+Z6+7df/a7qzhHlcvnniumTBCE8LI0EXxKGX67cnR7yMioMd7sYLv2sanNeNKC8PVzgY07kmqg0QgpzNOV+KkrQ2he6eeqIGEFKvjrOyIRW2Ukx7jvj7a5sC1FTT/umyCPxYU3Xpsy4V0Dk6jLzl4LLgmJSzc7MZ+owwI/LM+Lsh8i7o7xRdeKS2cP7cZk6pTxBVBm8MBrTXY6GIAY9cxo0tr1ig1KV8l3zoxpWA9AHZgDWO1CxTB1Mt+Z9xC+4wnh3tImREi4g+v5oj0xUB9GSxzORtI/kYubqJeZVHuFCszxcaODZuJzUvS0zvUimyZDJPIdR+v0zFi1otmGTeEkgbi/fEGhWojvc=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 18:06:22.1989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 536e45a7-101e-4c4b-ae35-08d74e75b961
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5320
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

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDU6NTg6MzVQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IFBsZWFzZSBhdCBsZWFzdCByZW1vdmUgdGhlIHNpZ25hdHVyZSBpbiB0
aGUgZS1tYWlsIHlvdSByZXBseSB0by4gVGhlIGJlc3QKPiB3b3VsZCBiZSB0byB0cmltIHRoZSBl
LW1haWwgYW5kIGFuc3dlciByaWdodCBiZWxvdyB0aGUgc3BlY2lmaWMgcGFyYWdyYXBoLgo+IAo+
ID4KPiA+VG8gbWFrZSBzdXJlIHRoZSBtb2R1bGUgaXMgZ29pbmcgdG8gZ2V0IGFkZGVkLCB5b3Un
ZCBuZWVkIHRvIGRvIHRoZQo+ID5jaGVjayBhZnRlciB0aGUgZm9yIGxvb3AuICBUaGlzIG1lYW5z
IHRoZXJlJ3MgZ29pbmcgdG8gYmUgbXVsdGlwbGUgZm9yCj4gPmxvb3BzIGp1c3Qgc3ByZWFkIG92
ZXIgdGhlIGNvdXJzZSBvZiBhZGRpbmcgdGhlIGJvb3QgbW9kdWxlcyByYXRoZXIgdGhhbgo+ID5v
bmUgcGxhY2UuCj4gCj4gSSBkb24ndCB0aGluayB5b3UgbmVlZCB0byBkbyB0aGUgY2hlY2sgYWZ0
ZXIgdGhlIGxvb3AuIFRoZSBvbmx5IHdheSB0byBnbwo+IG91dCBvZiB0aGUgbG9vcCBpbiBhZGRf
Ym9vdF9tb2R1bGUoKSBpcyB3aGVuIGkgcmVhY2hlZCBtb2RzLT5ucl9tb2RzLgoKU2VlIGJlbG93
LgoKPiA+Cj4gPkkgaGFkIHRoaXMgYmVmb3JlIGJ1dCBkZWNpZGVkIGFnYWluc3QgaXQgYnV0IGFm
dGVyIGNoYW5naW5nIGl0IHRvIGJvdGgKPiA+c3RhcnRzIHJhdGhlciB0aGFuIHRoZSBzdGFuZCBh
bmQgZW5kIChlbmRzIGxvb2sgbXVjaCB1Z2xpZXIpLCBpdCBsb29rcwo+ID5jbGVhbmVyLgo+ID4K
PiA+ICAgICBmb3IgKCBpID0gMCA7IGkgPCBtb2RzLT5ucl9tb2RzLTE7IGkrKyApCj4gPiAgICAg
ICAgIGZvciAoIGogPSBpKzEgOyBqIDwgbW9kcy0+bnJfbW9kczsgaisrICkKPiA+ICAgICAgICAg
ICAgIGlmICggKChtb2RzLT5tb2R1bGVbaV0uc3RhcnQgPj0gbW9kcy0+bW9kdWxlW2pdLnN0YXJ0
KSAmJgo+ID4gICAgICAgICAgICAgICAgICAgKG1vZHMtPm1vZHVsZVtpXS5zdGFydCA8PQo+ID4g
ICAgICAgICAgICAgICAgICAgIG1vZHMtPm1vZHVsZVtqXS5zdGFydCArIG1vZHMtPm1vZHVsZVtq
XS5zaXplKSkgfHwKPiA+ICAgICAgICAgICAgICAgICAgKChtb2RzLT5tb2R1bGVbal0uc3RhcnQg
Pj0gbW9kcy0+bW9kdWxlW2ldLnN0YXJ0KSAmJgo+ID4gICAgICAgICAgICAgICAgICAgKG1vZHMt
Pm1vZHVsZVtqXS5zdGFydCA8PQo+ID4gICAgICAgICAgICAgICAgICAgIG1vZHMtPm1vZHVsZVtp
XS5zdGFydCArIG1vZHMtPm1vZHVsZVtpXS5zaXplKSkgKQo+ID4gICAgICAgICAgICAgICAgIHBy
aW50aygiV0FSTklORzogbW9kdWxlcyAlLTEycyBhbmQgJS0xMnMgb3ZlcmxhcFxuIiwKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgYm9vdF9tb2R1bGVfa2luZF9hc19zdHJpbmcobW9kcy0+bW9k
dWxlW2ldLmtpbmQpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICBib290X21vZHVsZV9raW5k
X2FzX3N0cmluZyhtb2RzLT5tb2R1bGVbal0ua2luZCkpOwo+ID4KPiA+VGhhdCdzIGFsc28gYSBw
b3NzaWJpbGl0eS4KPiA+Cj4gPkkganVzdCBkb24ndCBzZWUgYSB3YXkgYXJvdW5kIGl0LCBjb21w
dXRhdGlvbmFsbHkuICBZb3UgY2FuIHNwbGl0IHdoZXJlCj4gPnRoZSBsb29wcyBhcmUgZXhlY3V0
ZWQgYnV0IGluIHRoZSBlbmQgdGhlIHNhbWUgYW1vdW50IG9mIGNoZWNrcy90b3RhbAo+ID5pdGVy
YXRpb25zIGhhdmUgdG8gYmUgcnVuLgo+ID4KPiA+SSB3YXMgdGFsa2luZyB0byBzb21lb25lIGFu
ZCBoZSBzdWdnZXN0ZWQgeW91IGNvdWxkIGp1c3QgY2hlY2sgWGVuIGF0Cj4gPmVhcmx5IGJvb3Qg
YW5kIHRoZW4gY2hlY2sgb3RoZXIgbW9kdWxlcyBsYXRlci4KPiAKPiBXaGF0J3Mgd3Jvbmcgd2l0
aDoKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0v
c2V0dXAuYwo+IGluZGV4IDcwNWE5MTdhYmYuLmVjZDA5ZWM2OTggMTAwNjQ0Cj4gLS0tIGEveGVu
L2FyY2gvYXJtL3NldHVwLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+IEBAIC0yNTQs
NiArMjU0LDEwIEBAIHN0cnVjdCBib290bW9kdWxlIF9faW5pdAo+ICphZGRfYm9vdF9tb2R1bGUo
Ym9vdG1vZHVsZV9raW5kIGtpbmQsCj4gICAgICAgICAgICAgICAgICBtb2QtPmRvbVUgPSBmYWxz
ZTsKPiAgICAgICAgICAgICAgcmV0dXJuIG1vZDsKPiAgICAgICAgICB9Cj4gKwo+ICsgICAgICAg
IGlmICgobW9kLT5zdGFydCA+PSBzdGFydCkgJiYKPiArICAgICAgICAgICAgKG1vZC0+c3RhcnQg
PCAoc3RhcnQgKyBzaXplKSkpCj4gKyAgICAgICAgICAgIHByaW50aygiV0FSTklORzogbW9kdWxl
cy4uLlxuIik7Cj4gICAgICB9Cj4gCj4gICAgICBtb2QgPSAmbW9kcy0+bW9kdWxlW21vZHMtPm5y
X21vZHMrK107Cj4gCj4gQ2hlZXJzLAo+IAo+IC0tIAo+IEp1bGllbiBHcmFsbAoKRm9yIHRoYXQs
IHlvdSdkIG5lZWQgdG8gZWl0aGVyIGNoZWNrIHRoZSBzdGFydCBhbmQgZW5kIG9mIHRoZSBhZGRl
ZAptb2R1bGUgb3IgdGhlIHN0YXJ0IG9mIGJvdGguICBTbyBzb21ldGhpbmcgbGlrZToKCmlmICgg
KChtb2QtPnN0YXJ0ID49IHN0YXJ0KSAmJiAobW9kLT5zdGFydCA8IChzdGFydCArIHNpemUpKSkg
fHwKICAgICAoKHN0YXJ0ID49IG1vZC0+c3RhcnQpICYmIChzdGFydCA8IChtb2QtPnN0YXJ0ICsg
bW9kLT5zaXplKSkpICkKICAgIHByaW50aygiV0FSTklORzogLi4uIik7CgpJZiB5b3UgZG9uJ3Qg
eW91IHJ1biB0aGUgcmlzayBvZiBoYXZpbmcgYSBtb2R1bGUgb3ZlcmxhcCBidXQgbm90IGF0IHRo
ZQpzdGFydCBvZiB0aGUgYWRkZWQgbW9kdWxlICh1bmxlc3MgdGhlcmUncyBhIGd1YXJhbnRlZWQg
b3JkZXIpLiAgWW91J3JlCnN0aWxsIHJ1bm5pbmcgYWxsIG9mIHRoZSBjaGVja3MgZnJvbSB3aGF0
IEkgY2FuIHRlbGwsIGp1c3Qgbm90IGluIG5lc3RlZApmb3IgbG9vcCBzby4gUGx1cyBJJ20gbm90
IHN1cmUgaG93IG1hbnkgdGltZXMgYWRkX2Jvb3RfbW9kdWxlIGdldHMgcnVuCmFuZCB0aGUgIm1v
ZC0+a2luZCA9PSBraW5kIC4uIiBpZiBzdGF0ZW1lbnQgZ2V0cyBydW4gYW5kIGlzIHRydWUuCklm
IHRoZSBhYm92ZSBpcyB0cnVlLCB3b3VsZG4ndCB0aGF0IGNhdXNlIGV4dHJhIGNoZWNrcyBmb3Ig
dGhlIGZvciBsb29wCml0ZXJhdGlvbnMgYmVmb3JlIGl0IHdhcyB0cnVlPwoKQnJpYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
