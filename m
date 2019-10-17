Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6B0DB804
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 21:51:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLBlo-0000fI-Dn; Thu, 17 Oct 2019 19:49:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6xiX=YK=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iLBln-0000fD-EC
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 19:49:11 +0000
X-Inumbo-ID: 2efab73a-f117-11e9-bbab-bc764e2007e4
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (unknown
 [40.107.80.45]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2efab73a-f117-11e9-bbab-bc764e2007e4;
 Thu, 17 Oct 2019 19:49:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiSZpN7JaAW94VrBRf5xK91U2m/BRyClNgHyJWKQ+/e7PeTf+4uAh68fCLloPWI89egBIHxb17jkHsYaGpx84BffuitCet4qE429aFu64JWRQIxTgzRwyG6MN65dS12xHj9ip2mqmbvnUSZXQePmcOlJUSDF83MYkyGREjO8MBplwjYyXhjLfCWFTgHpRt7+NxmTG8HcmYwJ02LFBWBA484nNFMTqeaKTehQLi7dl89l4jYu6PbHs1P0lTtVoyPPtbz1Wu6PVvn6FEwBXGYvvHUNaK83Qnvuy3vgi0zlanv48uBmt3sVToOGJElbSaY16+scSFxW+2Kro/8zDkfzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3gN7ufGxmiBUVfC+hEWWQMn226exnnVhyGcuNGYN7k=;
 b=DA5MbmWfrQlODVPRfG9yU24SS6qBMXl6tBOLrEN50dDdFvsMh0fwvkdlIirbv7lVa+YmkLxPMRffpqT5h93gV7SnDQAW8cycUOprHi0BBOIwbDMPgSQAGjdVtfmc8SwWwMeDRf+slgUkPUMbO46JZ0SFbm2kX+ivdGihDqXeQ/GLGyrt2IY5HuRmlezH3xpClTEjalLjmCe9TFPch9sQniyEEzeUPGrJ7rspVq4C0Jx/30HMTNiC8OPHgOX5nws5kyz5qg+OYdVVd4pBC6Hse32ExbOioL9jKvogahbG4CemLf59fyvN0fy3MvUAxqe9c+aL4nC5SClDXjTDjstAfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3gN7ufGxmiBUVfC+hEWWQMn226exnnVhyGcuNGYN7k=;
 b=CbWXUf9DVklV7FrX32WdN/AT8c+yOO5sKiaXxXhdLfs6iy6X85y0wBKcyCd9fPkd6AAR8ZkpXvlQsGjTrgbZNQG2gE5YqX1OSTylzMe23fFUVnbELySs/SRxYxIzAyNdHtev81v7RgDl44xn6ER+8aYmyktLhHVWBy4MiCWjXdQ=
Received: from BN7PR02CA0007.namprd02.prod.outlook.com (2603:10b6:408:20::20)
 by SN6PR02MB4333.namprd02.prod.outlook.com (2603:10b6:805:a4::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:49:06 +0000
Received: from SN1NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::207) by BN7PR02CA0007.outlook.office365.com
 (2603:10b6:408:20::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:49:06 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT064.mail.protection.outlook.com (10.152.72.143) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2347.16
 via Frontend Transport; Thu, 17 Oct 2019 19:49:06 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iLBlh-0001Tg-Uh; Thu, 17 Oct 2019 12:49:05 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iLBlc-0005Gl-Ra; Thu, 17 Oct 2019 12:49:00 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x9HJmrBw026975; 
 Thu, 17 Oct 2019 12:48:53 -0700
Received: from [172.19.2.62] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iLBlV-0005FX-OD; Thu, 17 Oct 2019 12:48:53 -0700
Date: Thu, 17 Oct 2019 12:48:53 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20191017194853.GB6184@xilinx.com>
References: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
 <4da9c328-3968-5d46-6000-73e824b26962@arm.com>
 <20191011164325.GA18594@xilinx.com>
 <b623fddb-9ab6-d9ef-0d66-93e465ee64c6@arm.com>
 <20191011180612.GA19987@xilinx.com>
 <a3cf5b20-9a67-f3db-5a0d-1fb672b2bbe3@arm.com>
 <20191011190751.GB19987@xilinx.com>
 <729fbca8-9a9c-8764-9f9d-c24140d9bb68@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <729fbca8-9a9c-8764-9f9d-c24140d9bb68@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(199004)(189003)(186003)(7696005)(6916009)(47776003)(76176011)(81156014)(81166006)(229853002)(33656002)(1076003)(8936002)(4326008)(426003)(26005)(70586007)(6246003)(53546011)(486006)(126002)(44832011)(446003)(5660300002)(2616005)(356004)(11346002)(476003)(8676002)(336012)(70206006)(23726003)(305945005)(478600001)(36756003)(86362001)(58126008)(36386004)(2906002)(50466002)(106002)(54906003)(9786002)(316002)(14444005)(16586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4333; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c678f788-07a9-426e-d3b9-08d7533b11ec
X-MS-TrafficTypeDiagnostic: SN6PR02MB4333:
X-Microsoft-Antispam-PRVS: <SN6PR02MB43335B2D3C3734879EE17998D76D0@SN6PR02MB4333.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cdxr/psR5v4vg8kuvmXzpqhibBifMlU0cJIvxzNLJ90KXJ+kqF4FVyXI/XRyvWXBXhOznccLOf4ukq7PoEbsVw4CcaFCeDsuvYjwkP17nX5veJXkpOxX/pmhDLxEJEBfNbCVJuoavnbcTOvjFJEMidsxGW8nrWD4mSXI8OAswA/IGl8MA1sZpajL0ATIuvOrDsQ/+iQ0fvvsc6AUhG/qmgRh1wIOl9r189BtrAbGu9vm1WgaSj47SLerhj3Fvd/O4l+c2H5pVvH8V0QyYpbYBrbayRyyFyMtbCATB1UJqn7kmUvbTeIHqvbKDULcAfjOOTHnrcH7tWsOi+vDeruU8f9PuzIJtCyUkYwopbi5WmwKXR47T/q9UYm8/heiMpGrp7vCwl1xQSffUBzlYcdBFqReOb14YB4J1QBJso6VcI8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:49:06.3652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c678f788-07a9-426e-d3b9-08d7533b11ec
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4333
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

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTA6MjA6MTFBTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IFNvcnJ5IGZvciB0aGUgbGF0ZSBhbnN3ZXIuCj4gCj4gT24gMTEvMTAv
MjAxOSAyMDowNywgQnJpYW4gV29vZHMgd3JvdGU6Cj4gPldoaWNoIGlzIHdoeSBJIHdhbnRlZCB0
byBwdXQgaXQgd2hlcmUgaXQgd2FzIGluIHRoZSBwYXRjaC4gIFdoZXJlIHRoZQo+ID51c2VyIHdv
dWxkIHNlZSB0aGUgd2FybmluZyBhZnRlciB0aGUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIG1lbW9y
eQo+ID5tb2R1bGVzIHdlcmUgcHJpbnRlZCAoYW5kIGZhaXIgZWFybHkpLgo+IAo+IEkgaGFkIGEg
dGhpbmsgYWJvdXQgaXQsIGR1bXBpbmcgdGhlIG1vZHVsZXMgaW5mb3JtYXRpb25zIGJlZm9yZSBp
cyB1c2VmdWwgaWYKPiB5b3Uga25vdyB0aGF0IHlvdSBoYXZlIG9uZSBtb2R1bGUgbWF4IHBlciBr
aW5kLiBTbyB5b3UgYXZvaWQgdG8gcHJpbnQgdGhlCj4gbW9kdWxlcyBhZGRyZXNzL3NpemUgaW4g
dGhlIHdhcm5pbmcuCj4gCj4gSG93ZXZlciwgaXQgaXMgcG9zc2libGUgdG8gaGF2ZSBtdWx0aXBs
ZSBrZXJuZWwgbW9kdWxlIChhcyBsb25nIGFzIHRoZXkKPiBkb24ndCBoYXZlIHRoZSBzYW1lIHN0
YXJ0IGFkZHJlc3MpLCB5b3UgY291bGQgZW5kIHVwIHdpdGggdGhlIGZvbGxvd2luZwo+IG1lc3Nh
Z2U6Cj4gCj4gIldBUk5JTkc6IG1vZHVsZXMgS2VybmVsIGFuZCBLZXJuZWwgb3ZlcmxhcCIKPiAK
PiBUbyBtYWtlIHRoZSBtZXNzYWdlIG1vcmUgbWVhbmluZ2Z1bCwgd2Ugd291bGQgbmVlZCB0byBw
cmludCB0aGUgbW9kdWxlcwo+IGFkZHJlc3Mvc2l6ZS4gVGhlcmVmb3JlLCBJIGRvbid0IHZpZXcg
dGhhdCBpdCBpcyBpbXBvcnRhbnQgdG8gY2hlY2sKPiBvdmVybGFwcGluZyBpbiBlYXJseV9wcmlu
dF9pbmZvKCkuIEluIHRoaXMgY2FzZSBJIHdvdWxkIGZhdm9yIGFueSBjb2RlIHRoYXQKPiBkb24n
dCBhZGQgYSBkb3VibGUgZm9yIGxvb3AuCgpXZWxsLCBhZGRpbmcgdGhhdCBpbmZvcm1hdGlvbiB3
b3VsZCBiZSBlYXN5IGVub3VnaCBhbmQgY2hlYXAuICBJdCB3b3VsZAptYWtlIGl0IG11bHRpbGlu
ZSBwcmlua3RrIHRob3VnaDoKV0FSTklORzogbWVtb3J5IG1vZHVsZXMgb3ZlciBsYXA6CglzdGFy
dF9hZGRyLWVuZF9hZGRyOiBtb2R1bGVuYW1lCglzdGFydF9hZGRyLWVuZF9hZGRyOiBtb2R1bGVu
YW1lCgpJZiB3ZSdyZSBub3QgZG9pbmcgdGhhdCB0aG91Z2gsIHdvdWxkIGl0IG1ha2Ugc2Vuc2Ug
dG8gaGF2ZSBhIGluaXRkYXRhCmJvb2wgdGhhdCBjaGVja3MgaXQgaW4gYWRkX2Jvb3RfbW9kdWxl
KCkgYW5kIHRoZW4gcHJpbnRzIGEgc2ltcGxlCndhcm5pbmcgdGhhdCB0aGVyZSdzIGEgbWVtb3J5
IG1vZHVsZSBvdmVybGFwIGluIGVhcmx5X3ByaW50X2luZm8oKT8KVGhhdCB3YXkgdGhlcmUncyBu
byBuZXN0ZWQgZm9yIGxvb3AgYW5kIGl0IGdldHMgcHJpbnRlZCB3aGVyZSBhbGwgdGhlCmFkZHJl
c3NlcyBnZXQgcHJpbnRlZCAoc28geW91IGNhbiBhY3R1YWxseSBmaWd1cmUgb3V0IHdoZXJlIHRo
ZSBvdmVybGFwCmlzKS4KCj4gV2hpbGUgdGhpbmtpbmcgYWJvdXQgdGhpcyBjYXNlLCBpdCBtYWRl
IG1lIHJlYWxpemUgdGhhdCB3ZSBvbmx5IGNoZWNrIHRoZQo+IHN0YXJ0IGFkZHJlc3MgdG8gY29u
c2lkZXIgYSBtYXRjaC4gVGhpcyBtZWFucyBpZiB0aGUgc2l6ZSBpcyBkaWZmZXJlbnQsIHRoZW4K
PiBpdCB3aWxsIGJlIGlnbm9yZWQuIEkgdGhpbmsgd2Ugb3VnaHQgdG8gdGhyb3cgYXQgbGVhc3Qg
d2FybmluZyBmb3IgdGhpcyBjYXNlCj4gYXMgd2VsbC4KPiAKPiBXb3VsZCB5b3UgbWluZCB0byBo
YXZlIGEgbG9vaz8KCldoZW4geW91IHNheSBzdGFydGluZyBhZGRyZXNzLCBkbyB5b3UgbWVhbiBs
aWtlIGluIHRoZSBvcmdpbmFsIHBhdGNoPwpJZiBzbywgdGhlcmUncyBubyBmdW5jdGlvbmFsIGNo
YW5nZSBpbiBjaGVja2luZyB0aGUgc3RhcnRzIG9mIG4gb24gbSBhbmQKbSBvbiBuIHRoZW4gY2hl
Y2tpbmcgdGhlIHN0YXJ0IGFuZCBlbmQgb2YgbiBvbiBtLgoKPiA+Cj4gPkVpdGhlciB3YXksIHRh
a2UgeW91ciBwaWNrIG9mIGxvY2F0aW9uIGFuZCBpZiBpdCdzIG9ubHkgZGVidWcgb3Igbm90IGFu
ZAo+ID5JIGNhbiB3cml0ZSBpdCB1cCBhbmQgdGVzdCBpdC4KPiAKPiBJIHdvdWxkIHN0aWxsIHBy
ZWZlciBpbiBhZGRfYm9vdF9tb2R1bGUoKS4gU2VlIHdoeSBhYm92ZS4KCkkgd3JvdGUgSSBzdWdn
ZXN0ZWQgYWJvdmUgYW5kIHRlc3RlZCBpdCBzbyB0aGF0J2xsIGJlIHNlbnQgb3V0IHNvb24uCgpC
cmlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
