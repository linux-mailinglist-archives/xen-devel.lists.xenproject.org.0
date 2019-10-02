Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A06C937B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 23:26:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFm5U-0005Hl-4D; Wed, 02 Oct 2019 21:23:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VXk2=X3=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iFm5S-0005Hg-Iz
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 21:23:06 +0000
X-Inumbo-ID: d1e7479c-e55a-11e9-971d-12813bfff9fa
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.79.71]) by localhost (Halon) with ESMTPS
 id d1e7479c-e55a-11e9-971d-12813bfff9fa;
 Wed, 02 Oct 2019 21:23:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxCKI1jok+R7BdtSTDYn/PV5rF8a8FrdiVtxz9eEzgv22HksdOGF6neakNnB/s20jCLOt2MJiUBXLQ3tzqvuxQZ9VaLsCJ5jNS4ePJWBr6NmwrMikdZLgwXsX6OlncazVWDEpsTMXlxtsKqIV6Qz4EJQGV6ARdBqZCa6Knsdg5cPMt30Hmj3KDoxwVlrYzViSINRXe/53gkfzzv8s3T0d82+ja+j9aS6WsTOT69u+7980N7iVAfR1hSH1eoFNeCy0b9shyzZh0cAevTIQaTq3mp0YZzuUbc0FimT7FEV4cOULhnxZDllixRzxaovw2ghF78BwbueA9F3U1/6g/aXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9yOMKi6P2MY8Y1ijyKa71B/o9vI/cRphdF5FmNfYMk=;
 b=e3T8YhIMyzsBQdAdidCYP9EKx1CBLFQ6PpJZHX1TYuKZ/TZNw8F1Isr/R6PA6DvookwvanBvFZ1ZzxExLcz7opGUvoRU8xIzfmVJP4r7uHZAKuLyACOdp8pC9p+dQArfw4PotPZtjCK90Gc27DORUqzjegXbeA4ebedhaKsksBDYTF/YrfNPiuWZpQqnn0riCCwqTzwa26d+ASlK+oLWpvBt4vMQEZjuxepY/zWvM1Qp5Q+Y3FnmchxZ2PEqruKAdoH8T6MwNGSgMYHDHtAeI5kGra8eEqWqsZqU1AQXRCShm2b4/o0horKubBsPajLO+GzzF/4qXrURybZPuFrNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9yOMKi6P2MY8Y1ijyKa71B/o9vI/cRphdF5FmNfYMk=;
 b=KU1ponAyqJovwcGBDWx/6le7dKhvsF4u1Q22KL/T+jpBXUEvfR8E5vooyaACXC0LiFLP+gnpyo1NuvFXUpIFaXzXj+uHqsNdI8Mi1/VLkTJT3TLK/yKRyU+3YiLAPGAKrkezevEHIiaOp5V89JJhuqUgT4SOvcQzpgfHwj67qxI=
Received: from MWHPR0201CA0025.namprd02.prod.outlook.com
 (2603:10b6:301:74::38) by DM6PR02MB5324.namprd02.prod.outlook.com
 (2603:10b6:5:47::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Wed, 2 Oct
 2019 21:23:03 +0000
Received: from CY1NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::205) by MWHPR0201CA0025.outlook.office365.com
 (2603:10b6:301:74::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17 via Frontend
 Transport; Wed, 2 Oct 2019 21:23:02 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT056.mail.protection.outlook.com (10.152.74.160) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2305.20
 via Frontend Transport; Wed, 2 Oct 2019 21:23:02 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iFm5M-0003bA-LF; Wed, 02 Oct 2019 14:23:00 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iFm5H-000192-Ik; Wed, 02 Oct 2019 14:22:55 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x92LMnbr002777; 
 Wed, 2 Oct 2019 14:22:49 -0700
Received: from [172.19.2.62] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iFm5B-00018M-Mg; Wed, 02 Oct 2019 14:22:49 -0700
Date: Wed, 2 Oct 2019 14:22:49 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20191002212249.GB2644@xilinx.com>
References: <20191002003228.GA3940@xilinx.com>
 <48c9fc54-553e-3b6b-bad2-dbad35991df0@arm.com>
 <b02aeec5-b90f-d330-a504-0ab0e6ff86c9@arm.com>
 <20191002185617.GA2644@xilinx.com>
 <75d64b52-7bea-3349-e45f-44c8bce86d6e@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75d64b52-7bea-3349-e45f-44c8bce86d6e@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(199004)(189003)(54906003)(6246003)(70206006)(50466002)(26005)(229853002)(36386004)(486006)(7696005)(356004)(426003)(36756003)(44832011)(2616005)(478600001)(4326008)(86362001)(70586007)(476003)(186003)(446003)(23726003)(11346002)(305945005)(8676002)(316002)(126002)(76176011)(47776003)(33656002)(6916009)(58126008)(81156014)(81166006)(9786002)(16586007)(2906002)(53546011)(336012)(5024004)(14444005)(5660300002)(1076003)(8936002)(106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB5324; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 766d0b27-2b69-406a-5334-08d7477eb504
X-MS-TrafficTypeDiagnostic: DM6PR02MB5324:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5324BE60F92D0136A4B2669FD79C0@DM6PR02MB5324.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B7Rn6MlOsA3J8ssIYkp8sYqcb9QzJ9TOfRefzxyxbcLSMbTLx9j8iujzYXCEr5a+calFZdfUw4RXq+q//NG6poxMTnnXJUeLKCFM8hXL0ix+PqKtuZB/1YOMV3uxzSPOYpGkjb0TYJslr0vWAi+U8n/1I0tVdhG/YqRn3s2JGBbR3piR+rENUZvlft1F5GYm6AiEB8oIzqfC4owLTGBAuXD7H9VvNJxlngbDl7FiMnZ4fSeJf3nPz1IdgVxQ8KcYPi5crhUoTJ3YdZOM3yxAKdjQWdCJ2ISrbNv3/7HTVg19ZqshRPp7hBCIHNW3R2Ge6Z6NX2oHxjcvrJyEaGOFd/xm89yKEGPTF3l63KThKI3t5EBLA5vV+o6H53kQrmmZuVluGzDvOp2k7P3TZetPwBiQhbRDC0EDoQADaM+AlkE=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 21:23:02.2243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 766d0b27-2b69-406a-5334-08d7477eb504
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5324
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

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDg6NTk6MjhQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDEwLzIvMTkgNzo1NiBQTSwgQnJpYW4gV29vZHMgd3JvdGU6Cj4g
Pk9uIDEwLzIvMTkgNTo1MiBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4+T24gMTAvMi8xOSAx
OjMyIEFNLCBCcmlhbiBXb29kcyB3cm90ZToKPiA+Pj5IZWxsbywKPiA+Pgo+ID4+SGkgQnJpYW4s
Cj4gPj4KPiA+PlRoYW5rIHlvdSBmb3IgcmVwb3J0Lgo+ID4+Cj4gPj5JIGd1ZXNzIHRoaXMgQXJt
IHNwZWNpZmljLCByaWdodD8gSWYgc28sIHBsZWFzZSB0cnkgdG8gQ0MKPiA+PnRoZSByZWxldmFu
dCBtYWludGFpbmVycyBhbmQgcG9zc2libHkgYWRkICJhcm0iIGluIHRoZQo+ID4+c3ViamVjdCB0
byBhdm9pZCBhbnkgZGVsYXkgKFhlbi1EZXZlbCBoYXMgcXVpdGUgYW4gaGlnaAo+ID4+dm9sdW1l
IG9mIGUtbWFpbCEpLgo+ID4+Cj4gPj5NYXkgSSBhbHNvIGFzayB0byBhdm9pZGluZyBzZW5kaW5n
IGF0dGFjaG1lbnQgb24gdGhlIG1haWxpbmcKPiA+Pmxpc3QgYW5kICBpbnN0ZWFkIHVwbG9hZCB0
aGUgbG9nIHNvbWV3aGVyZSAoZS5nLiBwYXN0ZWJpbiwKPiA+PnlvdXIgb3duIHdlYnNlcnZlci4u
Lik/Cj4gPj4KPiA+Cj4gPkkgZGlkIGluY2x1ZGUgYWxsIHRoZSBBUk0gbWFpbnRhaW5lcnMsIGFs
dGhvdWdoIEkgZm9yZ290IHRvIENDCj4gPlZvbG9keW15ci4gIFNvcnJ5IGFib3V0IHRoYXQuCj4g
Cj4gSG1tbSwgdGhlIGZpcnN0IGUtbWFpbCBkaWRuJ3QgbGFuZCBpbiBteSBpbmJveCBkaXJlY3Rs
eSAoSSBoYXZlIGEgZmlsdGVyCj4gc2VuZCB0byBhIHNlcGFyYXRlIGRpcmVjdG9yeSBhbnkgZS1t
YWlsIEkgbm90IENDZWQgb24pLiBEaWQgeW91IEJDQyBtZSBieQo+IGFueSBjaGFuZ2U/CgpUaGF0
J3Mgb2RkLiAgSSBrbm93IEkgY29waWVkIHlvdXIgYW5kIFN0ZWZhbm8ncyBlbWFpbCBhZGRyZXNz
ZXMgZnJvbSB0aGUKTUFJTlRBSU5FUlMgZmlsZSBidXQgdW5kZXIgbXkgc2VudCBlbWFpbHMgaXQg
c2hvd3MgaXQgaGFzIGhhdmluZyBubwpDQ3MuLi4gIFBFQkNBSyBJIGd1ZXNzLiAgTXkgYXBvbG9n
aWVzLgoKPiA+IEFsc28sIEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIHN0cmljdGx5IGFuCj4gPkFS
TSBvciBnZW5lcmFsIFhlbiBidWcgc28gSSBsZWZ0IEFSTS4gIEkgZ3Vlc3MgSSBzaG91bGQgaGF2
ZSBtZW50aW9uZWQKPiA+dGhhdCBpbiB0aGUgZW1haWwgdGhvdWdoLgo+IAo+IExldCBzZWUgdHJ5
IHRvIHRyb3VibGVzaG9vdCBpdCBmaXJzdCA6KS4KPiAKPiA+Cj4gPkkgcHJlZmVyIGhhdmluZyB0
aGVtIGFzIGF0dGFjaG1lbnRzIGR1ZSB0byB0aGUgZmFjdCBJIGNhbiBzZWUgZXZlcnl0aGluZwo+
ID5pbiBtdXR0LiBBbHRob3VnaCBpZiB0aGVyZSdzIGEgc3Ryb25nIGNvbW11bml0eSBjb25zZW5z
dXMgdGhhdCBsb2dzCj4gPnNob3VsZG4ndCBiZSBlbWFpbGVkIGFzIGF0dGFjaG1lbnRzLCBJIHdp
bGwgc3RhcnQgdXNpbmcgYSBwYXN0ZWJpbiBsaWtlCj4gPnNlcnZpY2UgdG8gcG9zdCB0aGVtLgo+
IAo+IFdlbGwsIGFueSBhdHRhY2htZW50IHlvdSBzZW5kIG9uIHRoZSBNTCB3aWxsIHN0b3JlIHRv
IGVhY2ggc3Vic2NyaWJlcnMKPiBtYWlsYm94LiBJIGxldCB5b3UgZG8gdGhlIG1hdGggaGVyZSA7
KQo+IAo+IFNvIHllYWgsIHBhc3RlYmluIGlzIGFsd2F5cyB0aGUgcHJlZmVycmVkIHdheSB3aGVu
IHlvdSBoYXZlIHRvIHNlbmQgdGhlIGZ1bGwKPiBsb2cuCj4gCj4gPgo+ID4+Pgo+ID4+PldoaWxl
IHRlc3Rpbmcgc29tZSB0aGluZ3Mgb3V0LCBJIGZvdW5kIGEgcG9zc2libGUgYnVnIGluIFhlbi4g
IFhlbiB3b3VsZAo+ID4+PnN1Y2Nlc3NmdWxseSBydW4gd2hlbiBsb2FkZWQgKGZyb20gdS1ib290
KSBhdCBzb21lIGFkZHJlc3NlcyBidXQgbm90Cj4gPj4+b3RoZXJzLiAgSSBkaWRuJ3Qgb2JzZXJ2
ZSB0aGlzIGlzc3VlIGluIDQuMTEgc3RhYmxlLCBzbyBJIGRpZCBhIGJpc2VjdAo+ID4+PmFuZCBm
b3VuZCB0aGF0Ogo+ID4+PmNvbW1pdCBmNjA2NThjNmFlNDdlNzQ3OTJlNmNjNDhlYTJlZmZhYzhi
YjUyODI2Cj4gPj4+QXV0aG9yOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+
ID4+PkRhdGU6ICAgVHVlIERlYyAxOCAxMzowNzozOSAyMDE4ICswMDAwCj4gPj4+Cj4gPj4+ICAg
ICAgeGVuL2FybTogU3RvcCByZWxvY2F0aW5nIFhlbgo+ID4+Pgo+ID4+PndhcyB3aGF0IHdhcyBj
YXVzaW5nIGl0IHRvIGZhaWwgd2hlbiBpdCB3YXMgbG9hZGVkIHRvIHRoYXQgY2VydGFpbgo+ID4+
PmFkZHJlc3MuCj4gPj4KPiA+PlRoaXMgcGF0Y2ggaXMgYmFzaWNhbGx5IGNoYW5naW5nIGhvdyBY
ZW4gaXMgdXNpbmcgdGhlCj4gPj5waHlzaWNhbCBhZGRyZXNzIHNwYWNlLiBTbyBpdCBleGVyY2lz
ZSBtb3JlIHBhcnQgb2YgWGVuCj4gPj5jb2RlIGFuZCBtb3N0IGxpa2VseSBhIHJlZC1oZXJyaW5n
IDopLgo+ID4+Cj4gPj5Ib3dldmVyLCB0aGUgbG9ncyBhcmUgcXVpdGUgaW50ZXJlc3Rpbmc6Cj4g
Pj4KPiA+PihYRU4pIHBnWzBdIE1GTiAwMTUzMyBjPTB4MTgwMDAwMDAwMDAwMDAwIG89MCB2PTB4
N2ZmZmYgdD0wCj4gPj4KPiA+PklmIEkgYW0gbm90IG1pc3Rha2VuLCB0aGUgcGFnZSBzdGF0ZSBp
cyBQR0Nfc3RhdGVfZnJlZS4KPiA+PlNvIHRoaXMgc2VlbXMgdG8gc3VnZ2VzdCB0aGF0IHRoZSBw
YWdlIHdlcmUgYWxyZWFkeQo+ID4+aGFuZGVkIG92ZXIgdG8gdGhlIGFsbG9jYXRvci4KPiA+Pgo+
ID4+V291bGQgeW91IG1pbmQgdG8gYXBwbHkgdGhlIHBhdGNoIGJlbG93IGFuZCBwYXN0ZSB0aGUg
bG9nPwo+ID4+Cj4gPj5Ib3BlZnVsbHksIHlvdSBzZWUgc2VlIHR3byBXQVJOX09OKCkgYmVmb3Jl
IFhlbiBpcyBjcmFzaGluZy4KPiA+Pgo+ID4+Tm90ZSB0aGUgcGF0Y2ggaXMgYXNzdW1pbmcgdGhl
IE1GTiB3aWxsIHN0YXkgdGhlIHNhbWUgYWZ0ZXIKPiA+PnRoZSBwYXRjaCBoYXMgYmVlbiBhcHBs
aWVkLiBJZiBub3QsIHlvdSBtYXkgbmVlZCB0byBzbGlnaHRseQo+ID4+dHdlYWsgaXQuCj4gPj4K
PiA+PmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFn
ZV9hbGxvYy5jCj4gPj5pbmRleCA3Y2IxYmQzNjhiLi40YmYwZGJjNzI3IDEwMDY0NAo+ID4+LS0t
IGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiA+PisrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxv
Yy5jCj4gPj5AQCAtMTM4OSw2ICsxMzg5LDkgQEAgc3RhdGljIHZvaWQgZnJlZV9oZWFwX3BhZ2Vz
KAo+ID4+ICAgICAgZm9yICggaSA9IDA7IGkgPCAoMSA8PCBvcmRlcik7IGkrKyApCj4gPj4gICAg
ICB7Cj4gPj4rCj4gPj4rICAgICAgICBXQVJOX09OKG1mbl94KHBhZ2VfdG9fbWZuKHBnICsgMSkp
ID09IDB4MDE1MzMpOwo+ID4+Kwo+ID4+ICAgICAgICAgIC8qCj4gPj4gICAgICAgICAgICogQ2Fu
bm90IGFzc3VtZSB0aGF0IGNvdW50X2luZm8gPT0gMCwgYXMgdGhlcmUgYXJlIHNvbWUgY29ybmVy
IGNhc2VzCj4gPj4gICAgICAgICAgICogd2hlcmUgaXQgaXNuJ3QgdGhlIGNhc2UgYW5kIHlldCBp
dCBpc24ndCBhIGJ1ZzoKPiA+Pgo+ID4+Q2hlZXJzLAo+ID4+Cj4gPj4tLSAKPiA+Pkp1bGllbiBH
cmFsbAo+ID4KPiA+QXR0YWNoZWQgYXJlIHRoZSBsb2dzIG9mIGxvYWRpbmcgcGF0Y2hlZCBYZW4g
YXQgdGhlIGdvb2QgYW5kIGJhZAo+ID5hZGRyZXNzLiAgSXQgYXBwZWFycyB0aGUgTUZOIGhhcyBz
dGF5ZWQgdGhlIHNhbWUsIGFsdGhvdWdoIHRoZXJlJ3Mgb25seQo+ID5vbmUgV0FSTiBtZXNzYWdl
IGZvciBib3RoIHRoZSBnb29kIGFuZCBiYWQgYWRkcmVzcy4KPiAKPiBUaGFuayB5b3UgZm9yIHRo
ZSBsb2cuIFNvIHRoYXQncyBwcm9iYWJseSBub3QgYSBkb3VibGUtaW5pdCB0aGVuLgo+IAo+IExv
b2tpbmcgYmFjayBhdCB0aGUgbG9nLCB0aGUgdmFsdWVzIGxvb2sgcXVpdGUgc2FuZS4gU28gSSBh
bSBub3QgZW50aXJlbHkKPiBzdXJlIHdoYXQgaXMgaGFwcGVuaW5nLgo+IAo+IEkgd291bGQgY2hl
Y2sgdGhhdCB0aGUgZnJhbWV0YWJsZSBpcyBjb3JyZWN0bHkgemVyb2VkLiBZb3UgY291bGQgYWRk
IGEgcHJpbnQKPiBhdCB0aGUgZW5kIG9mIHNldHVwX2ZyYW1ldGFibGVfbWFwcGluZ3MoLi4uKSB0
byBkdW1wIHRoZSBjb3VudF9pbmZvIGZvciB0aGUKPiBwYWdlLiBTb21ldGhpbmcgbGlrZToKPiAg
ICAgIG1mbl90b19wYWdlKF9tZm4oMHgwMTUzMykpLT5jb3VudF9pbmZvOwo+IAo+IElmIGl0IGlz
IGNvcnJlY3RseSBpbml0aWFsaXplZCwgaXQgc2hvdWxkIGJlIHplcm8uCj4gCj4gVGhlIG5leHQg
c3RlcCB3b3VsZCBiZSB0byBhZGQgYSBzaW1pbGFyIHByaW50IGluIHN0YXJ0X3hlbigpCj4gKHhl
bi9hcmNoL2FybS9zZXR1cC5jKSBhbmQgc2VlIHdoZXJlIHRoZSB2YWx1ZSBpcyBub3QgMCBhbnlt
b3JlLgo+IAo+IENoZWVycywKPiAKPiAtLSAKPiBKdWxpZW4gR3JhbGwKCkknbGwgZ28gYWhlYWQg
YWRkIHRob3NlIGFuZCBzZWUgaWYgdGhhdCBsZWFkcyB0byBhbnl0aGluZy4KCi0tIApCcmlhbiBX
b29kcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
