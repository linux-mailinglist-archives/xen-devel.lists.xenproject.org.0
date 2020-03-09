Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0712E17E268
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 15:19:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBJCl-0006wG-2c; Mon, 09 Mar 2020 14:16:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=krcH=42=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1jBJCj-0006wB-7K
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 14:16:25 +0000
X-Inumbo-ID: 8e98f2b4-6210-11ea-90c4-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.90]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e98f2b4-6210-11ea-90c4-bc764e2007e4;
 Mon, 09 Mar 2020 14:16:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bs2PmpC32JQdmPj10CAk+keJRGITzyX4JD/fVLrdmm79J8vBHaUM6TOxfrO/08ooUj6zAlxq0/GIEeOeUuD2mdSuMyjTSalm+36fqogyJoRazolMa8UeRq1XFbFNdeBIZVdYbGfyyemO2z7LFgHJS3rJh7MzfwEXz/dAH+LaqGJhFLjbGFetSV3m0i50pSGzf9chBVftxxoUA/85hnwEfDIcTL8WSMLqo6wyuqEJCo5/iaR4SeTSkFl3S55SaNI8e1DhBgs5QmCP7uw8/2oOFwRcF6JWk4lTRFHUzh1s7c/igd8S3xi4GD1WATOhCzle0VpvTEl1jot4DLa5P0TM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbZ0NxpMHX8yA2eZ9NXXdTFmNL3/OCNE81H+L4UgO9U=;
 b=F4wGxHHktOVkcRfbMSXy6/D62w7fK+XpYOQX+RbIdXnijtqRKo7RJ72qJdBsIzghQDdEpJj+CL7jKQ38nsCnUQhwhhP/J8EgXdvJiys/fZVr3bFcBJPo84j7gbDxDdgXreuyxutoLofhBLBDCc4omKxUwCT1T6XdLrO2ckagIzERqdI2nwlZJ2H5HyUeThGfHnfAFuWdFxPo1dXJ0nn7N+4V+029cauKm2RVICrXAv5jDYubG5uDo/oRB8g0ciKR6W7CFHybpVTcjunBdYGKdjPV5hnC6geuuYUDdMIxH18o6lIztXdNtWsBiAf8EoxMa8bvACx8HcKUdVBl8mXh8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbZ0NxpMHX8yA2eZ9NXXdTFmNL3/OCNE81H+L4UgO9U=;
 b=mVpDPCogl30waGbTL1HR45968kwZJiy41HTFeZBErBm63B9K3jq3XCQHHHuqjYJOhTiaHTQW0SZHJIndbRXzi9fVMPxPplQSKqlxqqHMw0VhXW9nhf9+QAX86WHQjqQVTXOhz873m8lJhh+p1ffH7akfHvaaVJ03fAgkYfNVA7c=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3030.eurprd02.prod.outlook.com (10.175.234.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.14; Mon, 9 Mar 2020 14:16:22 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::2909:cd92:d422:c4c]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::2909:cd92:d422:c4c%6]) with mapi id 15.20.2793.013; Mon, 9 Mar 2020
 14:16:21 +0000
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dbf7d4d5-8df7-b391-30a8-b98bb53bbcb4@suse.com>
From: Isaila Alexandru <aisaila@bitdefender.com>
Organization: BD
Message-ID: <83285e0e-61ce-3b2b-ff2b-eda86556456c@bitdefender.com>
Date: Mon, 9 Mar 2020 16:16:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <dbf7d4d5-8df7-b391-30a8-b98bb53bbcb4@suse.com>
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0042.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::11) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.10.195.54] (91.199.104.6) by
 ZR0P278CA0042.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16 via Frontend Transport; Mon, 9 Mar 2020 14:16:20 +0000
X-Originating-IP: [91.199.104.6]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57af94de-62c8-4b9e-1887-08d7c4347160
X-MS-TrafficTypeDiagnostic: DB6PR02MB3030:|DB6PR02MB3030:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR02MB30305BCE7AC360772989023EABFE0@DB6PR02MB3030.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0337AFFE9A
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(346002)(366004)(39850400004)(396003)(189003)(199004)(316002)(16576012)(5660300002)(478600001)(8936002)(2906002)(36916002)(6486002)(66946007)(4744005)(53546011)(31686004)(52116002)(66556008)(66476007)(36756003)(2616005)(110136005)(4326008)(956004)(186003)(54906003)(16526019)(81156014)(7416002)(8676002)(86362001)(26005)(31696002)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3030;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2PUzi8KFQ4XuflEOFHFj2+gICvu/MGBYN869faqKQd8rBmFVcDMpIKqueTOlUKnyzTxyPlmJyTDu4OduoV4xaelvpGSeB5Jk0UqlhM+S1vGqRLzpo0tQc1IrOML0uoyijGd5BJlbVrlFel7J02SWO3yz4mtYORdrxScA2RA5lVk2wZvqg6sYo/+/lp59XVRDYvNE69o0QAEyjbSDfIZM2vqvbNlVw1wDOogDMraVGrpPifk36yrTUOFkPAOpnrDn0gAaRel70xCAp0GAq+AXk8Lx+fT7XfQaxpWpX/WB3sFX67TatmhrJ6rQzMF09pxnzoTOozyOEa6VdWITHauLpUVTqSCRSKpgCbpzvmApUerDbom7w+RSm3daklrSX4KrxBE1eY2XXpsw5PIlUXsC7Uiw9t1nZGnPrCB5qcIPyZtjd5H2FYZVvanYCFfmuLr5
X-MS-Exchange-AntiSpam-MessageData: 726te0T8IU2WV30Wm746BOuysvx/CM5bAsH74Sybk+lRBHZUzGpFQVWxkKNmC17g3BT8BzV6Hha2xkKs1TSSoHoMJaSGbRnyVT00BeCv9pDRioYu/oUmdEcXs/Jn6gUm531cXqo1X/kup3RNuvnKfg==
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57af94de-62c8-4b9e-1887-08d7c4347160
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2020 14:16:21.8799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XmQHDT4tCkx04WEIP/xiPJLLhM7txWxHGss3TwoPFy8F8riLtYILbysu4NNco9cFtvgBFpPx/D4qvPkHObuQY/w8zQsbhXC4ltzuwbSjDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3030
Subject: Re: [Xen-devel] [PATCH] vmevent: reduce include dependencies
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwOS4wMy4yMDIwIDEzOjUxLCBKYW4gQmV1bGljaCB3cm90ZToKPiBUaGVyZSdzIG5vIG5l
ZWQgZm9yIHZpcnR1YWxseSBldmVyeXRoaW5nIHRvIGluY2x1ZGUgcHVibGljL3ZtX2V2ZW50Lmgu
Cj4gTW92ZSBpdHMgaW5jbHVzaW9uIG91dCBvZiBzY2hlZC5oLiBUaGlzIHJlcXVpcmVzIHVzaW5n
IHRoZSBub24tdHlwZWRlZgo+IG5hbWUgaW4gcDJtX21lbV9wYWdpbmdfcmVzdW1lKCkncyBwcm90
b3R5cGU7IGJ5IG5vdCBjaGFuZ2luZyB0aGUKPiBmdW5jdGlvbiBkZWZpbml0aW9uIGF0IHRoZSBz
YW1lIHRpbWUgaXQnbGwgcmVtYWluIGNlcnRhaW4gdGhhdCB0aGUgYnVpbGQKPiB3b3VsZCBmYWls
IGlmIHRoZSB0eXBlZGVmIGl0c2VsZiB3YXMgY2hhbmdlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQWxleGFuZHJ1IElz
YWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
