Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B38D483B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 21:10:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJ0Gp-0003Wp-6c; Fri, 11 Oct 2019 19:08:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SPxS=YE=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1iJ0Gn-0003WI-Id
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 19:08:09 +0000
X-Inumbo-ID: 7625a172-ec5a-11e9-bbab-bc764e2007e4
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe46::622])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7625a172-ec5a-11e9-bbab-bc764e2007e4;
 Fri, 11 Oct 2019 19:08:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSI4/wVf4wHpyrY309ZyBZHfakPQ2jxlLGXsOaLP3pKwVFfG9RdEvUHg6zGv87C2AoBZWCkWBItWX9ZSJmt1HZ9A46JyXS9rPRJmCSTt/oL7/N8T12L2kdmDUDEplvzrE5jj+M3vqClUP0trXSVaKUVFso3Sr1A2GCszdZG5rTqG42WA1BcUR2FscFJFRdPMeuLpM0BvAv289KDXWlCM7+dbmGi6+VidXMuSUjT5uTA88YtORT/lpVjOvc91Dia/lfWE2uiNhpj4FPV7XIuSpTAT3CWeqQ0j3ZE/3MGxR8Ax5IA1czRWmZbtbW5hTbbzo+I1b2XO6itf1+mVo43AgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jssaC8UNWujNf4OhP//p2Djuoh4ACmda1Syd08fk8Jo=;
 b=EDhEyH5d6GIMsYpcckXFmM+7JD2qvzeg3/SUR0J31tgT0sbhWmdlGkJa4BH8smAe6iHoXboEO0bkPIe5IHbjE+oKROpjjSanIReliOhU8f0nG/oJXK1BQthIVAF6aO0OX4xa+pd9Wwp6qeVwdbLT/lbqmkLS9LnewIPNT4YbcSP65mpzvRJoCm0QQtF4DUWHNStKthH3GMztgKiFgtVrABdkH741m+vRF4XXk+GtvEhENgM5AgUeWnvD3Fb5lw6ziW7OIPFuBXtjMe993RYRh9sBmw0DJBC3tA0C3FuvzqQUPxLffNUMfuzlARu3NJBBjEQVI/2nowl99cY4HMpNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jssaC8UNWujNf4OhP//p2Djuoh4ACmda1Syd08fk8Jo=;
 b=ahD/ztVa3Fkf7bAzKpeLjPGeGFBlyWU+8SGj5ETHHNL7cYGM9LN8Jx+u1F4DQQyrJB1PoNo3aj0lIGrazy5b+e49xLlZuJmPp/ow1idtgvMk+cgsUU6gKdiMSBQDqanHjJlIhW0LJvUEXQoUgpHjPiKVR59nFIYQFioHJszk+Qk=
Received: from BN6PR02CA0091.namprd02.prod.outlook.com (2603:10b6:405:60::32)
 by CY4PR02MB3287.namprd02.prod.outlook.com (2603:10b6:910:75::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 11 Oct
 2019 19:08:06 +0000
Received: from CY1NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::209) by BN6PR02CA0091.outlook.office365.com
 (2603:10b6:405:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 19:08:05 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT064.mail.protection.outlook.com (10.152.74.64) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2347.16
 via Frontend Transport; Fri, 11 Oct 2019 19:08:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iJ0Gi-0007Mo-SY; Fri, 11 Oct 2019 12:08:04 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iJ0Gd-0001Yk-PH; Fri, 11 Oct 2019 12:07:59 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x9BJ7pPQ011696; 
 Fri, 11 Oct 2019 12:07:51 -0700
Received: from [172.19.2.62] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1iJ0GV-0001Y7-N6; Fri, 11 Oct 2019 12:07:51 -0700
Date: Fri, 11 Oct 2019 12:07:51 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20191011190751.GB19987@xilinx.com>
References: <1570650447-3225-1-git-send-email-brian.woods@xilinx.com>
 <4da9c328-3968-5d46-6000-73e824b26962@arm.com>
 <20191011164325.GA18594@xilinx.com>
 <b623fddb-9ab6-d9ef-0d66-93e465ee64c6@arm.com>
 <20191011180612.GA19987@xilinx.com>
 <a3cf5b20-9a67-f3db-5a0d-1fb672b2bbe3@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3cf5b20-9a67-f3db-5a0d-1fb672b2bbe3@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(376002)(189003)(199004)(50466002)(1076003)(478600001)(8936002)(81166006)(81156014)(4326008)(476003)(336012)(426003)(126002)(5660300002)(44832011)(2616005)(486006)(356004)(446003)(11346002)(47776003)(6246003)(86362001)(16586007)(316002)(26005)(9786002)(36756003)(53546011)(186003)(58126008)(23726003)(76176011)(7696005)(106002)(14444005)(8676002)(6916009)(229853002)(54906003)(36386004)(2906002)(33656002)(70586007)(70206006)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3287; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fab15f4c-3495-4629-f140-08d74e7e5895
X-MS-TrafficTypeDiagnostic: CY4PR02MB3287:
X-Microsoft-Antispam-PRVS: <CY4PR02MB32870B4A86CDAC4B13A577D2D7970@CY4PR02MB3287.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UZQN+7k65ALTUiQP01NuOm32Mklu6cXP8CfSP6ZK5JgvvuaZjLrZQ41p6MTxY6ANoXOeOROZFjdDVTBEsvg45354/Y2qdws8LYChGntiFk0rBRXw5YWk2yyIsqypTZFaihXEwSNIcJpwyUiKxyRNpF8+PHZafEE62Zrsb7wz4IlrH8zk3WcD/eHTJ+nUFM5u6u7Pex6/Kh6grtC0EB9Fz3LpTlCgnAKS6Z1JNpPM02KFtd9J/I8ekaNHTgWj7r/HVywKK4nkHGoR+w4LS5SCBxv6Q87JyH/oXRVK95WJ2M5GCbvAstJ3m60FK/Dfv1K5i+c700QhquV8HLZ0Lxp5Jwi+nNtZDvGnTlofloV/Z+EPV5aW626yCdCDkyRYDWjsTPM2AG5osBQ3Nw2+hc2DIndF2fYeC0ZQf0621BeI+9s=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:08:05.3870 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fab15f4c-3495-4629-f140-08d74e7e5895
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3287
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

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDc6MTc6MjlQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDEwLzExLzE5IDc6MDYgUE0sIEJyaWFuIFdvb2RzIHdyb3RlOgo+
ID5PbiBGcmksIE9jdCAxMSwgMjAxOSBhdCAwNTo1ODozNVBNICswMTAwLCBKdWxpZW4gR3JhbGwg
d3JvdGU6Cj4gPkZvciB0aGF0LCB5b3UnZCBuZWVkIHRvIGVpdGhlciBjaGVjayB0aGUgc3RhcnQg
YW5kIGVuZCBvZiB0aGUgYWRkZWQKPiA+bW9kdWxlIG9yIHRoZSBzdGFydCBvZiBib3RoLiAgU28g
c29tZXRoaW5nIGxpa2U6Cj4gPgo+ID5pZiAoICgobW9kLT5zdGFydCA+PSBzdGFydCkgJiYgKG1v
ZC0+c3RhcnQgPCAoc3RhcnQgKyBzaXplKSkpIHx8Cj4gPiAgICAgICgoc3RhcnQgPj0gbW9kLT5z
dGFydCkgJiYgKHN0YXJ0IDwgKG1vZC0+c3RhcnQgKyBtb2QtPnNpemUpKSkgKQo+ID4gICAgIHBy
aW50aygiV0FSTklORzogLi4uIik7Cj4gPgo+ID5JZiB5b3UgZG9uJ3QgeW91IHJ1biB0aGUgcmlz
ayBvZiBoYXZpbmcgYSBtb2R1bGUgb3ZlcmxhcCBidXQgbm90IGF0IHRoZQo+ID5zdGFydCBvZiB0
aGUgYWRkZWQgbW9kdWxlICh1bmxlc3MgdGhlcmUncyBhIGd1YXJhbnRlZWQgb3JkZXIpLiAgWW91
J3JlCj4gPnN0aWxsIHJ1bm5pbmcgYWxsIG9mIHRoZSBjaGVja3MgZnJvbSB3aGF0IEkgY2FuIHRl
bGwsIGp1c3Qgbm90IGluIG5lc3RlZAo+ID5mb3IgbG9vcCBzby4gUGx1cyBJJ20gbm90IHN1cmUg
aG93IG1hbnkgdGltZXMgYWRkX2Jvb3RfbW9kdWxlIGdldHMgcnVuCj4gPmFuZCB0aGUgIm1vZC0+
a2luZCA9PSBraW5kIC4uIiBpZiBzdGF0ZW1lbnQgZ2V0cyBydW4gYW5kIGlzIHRydWUuCj4gPklm
IHRoZSBhYm92ZSBpcyB0cnVlLCB3b3VsZG4ndCB0aGF0IGNhdXNlIGV4dHJhIGNoZWNrcyBmb3Ig
dGhlIGZvciBsb29wCj4gPml0ZXJhdGlvbnMgYmVmb3JlIGl0IHdhcyB0cnVlPwo+IAo+IEZvciBu
b24tZG9tMGxlc3MgY2FzZSwgd2UgYXJlIHRhbGtpbmcgYWJvdXQgNCBtb2R1bGVzIG1heCAoWGVu
LCBLZXJuZWwsCj4gSW5pdHJhbWZzLCBmbGFzayBwb2xpY3kpLiBNb2R1bGVzIGNhbm5vdCBiZSB0
aGUgc2hhcmVkIGhlcmUuCj4gCj4gRm9yIGRvbTBsZXNzLCB5b3UgYXJlIHVubGlrZWx5IHRvIGhh
dmUgdGhhdCBtYW55IGRvbWFpbnMgc3RhcnRlZCBmcm9tIFhlbi4KPiBTbyB0aGUgbnVtYmVyIG9m
IG1vZHVsZXMgd2lsbCBzdGlsbCBiZSBsaW1pdGVkIChldmVuIG1vcmUgaWYgeW91IHNoYXJlIGl0
KS4KCk5vdCBhcmd1aW5nIHRoYXQuICBXaXRoIHRoZSBzZWNvbmQgbG9vcCAoY2hlY2tpbmcgdHdv
IHN0YXJ0IGFkZHJlc3NlcykKaXQncyBvbmx5IG4obi0xKS8yIGl0ZXJhdGlvbnMuIEV2ZW4gaWYg
eW91IGhhZCAxMiBtZW1vcnkgbW9kdWxlcywgaXQncwpvbmx5IDY2IGl0ZXJhdGlvbnMuICBJbiB0
aGUgbGFyZ2Ugc2NoZW1lIG9mIHRoaW5ncywgdGhhdCBpc24ndCBUSEFUCm1hbnkuCgo+IFRoaXMg
Y29kZSBpcyBhbHNvIG9ubHkgY2FsbGVkIGF0IGJvb3Qgd2hlcmUgdGhlcmUgYXJlIGJpZ2dlciB0
aW1lIGNvbnN1bWluZwo+IHBhcnQgKHN1Y2ggYXMgZG9taGVhcCBpbml0aWFsaXphdGlvbikuIFNv
IEkgd291bGQgYmUgc3VycHJpc2VkIGlmIHlvdSBzZWUKPiBhbnkgaW1wcm92ZW1lbnQgKG90aGVy
IHRoYW4gYSBjb3VwbGUgb2YgY3ljbGVzKSBpbiBib290IHRpbWUgaGVyZS4KPiAKPiBUaGVyZWZv
cmUsIEkgd291bGQgZmF2b3IgYSByZWFkYWJsZSBzb2x1dGlvbiBvdmVyIGEgbWljcm8tb3B0aW1p
emVkIHNvbHV0aW9uCj4gaGVyZS4KCldoaWNoIGlzIHdoeSBJIHdhbnRlZCB0byBwdXQgaXQgd2hl
cmUgaXQgd2FzIGluIHRoZSBwYXRjaC4gIFdoZXJlIHRoZQp1c2VyIHdvdWxkIHNlZSB0aGUgd2Fy
bmluZyBhZnRlciB0aGUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIG1lbW9yeQptb2R1bGVzIHdlcmUg
cHJpbnRlZCAoYW5kIGZhaXIgZWFybHkpLgoKRWl0aGVyIHdheSwgdGFrZSB5b3VyIHBpY2sgb2Yg
bG9jYXRpb24gYW5kIGlmIGl0J3Mgb25seSBkZWJ1ZyBvciBub3QgYW5kCkkgY2FuIHdyaXRlIGl0
IHVwIGFuZCB0ZXN0IGl0LgoKQnJpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
