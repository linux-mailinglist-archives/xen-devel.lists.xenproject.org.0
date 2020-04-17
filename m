Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDBC1AE251
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 18:32:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPTuW-0003JC-NV; Fri, 17 Apr 2020 16:32:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4I3R=6B=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1jPTuV-0003J7-NT
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 16:32:11 +0000
X-Inumbo-ID: fc7f3ece-80c8-11ea-8d49-12813bfff9fa
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.93.62]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc7f3ece-80c8-11ea-8d49-12813bfff9fa;
 Fri, 17 Apr 2020 16:32:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jc69E2zzooSJ5NNUFHfKRga0w26jQSod0NMW7MEehq2c4NSwg6RTrMxS/ITpafRw9pTHdpPORMdhqWUEUjLs506TlJKJmLSbYB/F/0+QWJK+TIekciiHQJowXSTZW2QiwzNjhOGrEAyGj4cCMF34fMqgUj7zXtW1L+CtO6YoQwpaGZViBpJ1XW7Qbnucr13Nddbf7AIqJwC5OMiKJJdD2WcjOT8g5Lu7KTRI2lsEpM/f+WzNLnOG1Az5ncICubIJn9BexWeBCaSHJ5i0igluJGg1lDSY8ZotbVsu6kuFTG78d8dNu+hDc/3Rg0pPYMZxF3SZ9zpdSKybaE/IOu+OLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdIcjiLhfWOL6ylvSHUwMphztwroU6PYI+7VkROH3aU=;
 b=cp1ouxUNMPmeRYcOaZxDVSfJNhCICIiSjNvCEXh7WZ4u+EVGOO6mk72wxWa/fOSUDXKrp4zyeo+t7yB5QSTm65l5cF9B4lhV8536gk4PhxNd+4nIukeOUoYDv6VE4fewkmxSRl92f/DCVXUtZmLAevt2MzNU6kDiAfgNheBiIsfS+hUYS/5V04A/edpeuhdF8b9iFq60FrgTycq8yx1mEhrZGm1WhzVCbzvN2JPqFXyspp6nIE6h6HnXnUbgRhSDSgth/j1b6AlZHhc9fsQyeRbwRVeobgOcE1hYdokfJDGUwTym9Aeu7shlH5qmMA+PAu5AWYxHdUAP77MIRNe7iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdIcjiLhfWOL6ylvSHUwMphztwroU6PYI+7VkROH3aU=;
 b=GFO4D2GKABsAto317wOC9UkyE9Mvhh+BRjEPQfISGFlnkUYYz7Tc1Z8HNfRbslQhTGviULprYQ2oaBXpJP37kwuj/a8C1KZwffpclBRB2Njc9tvyKWi5IwPVXmXHn6SBc3MP84H2ZTewNSjezYbUbh2yhP/TeMVi8XhA+4KhU/Q=
Received: from DM3PR03CA0016.namprd03.prod.outlook.com (2603:10b6:0:50::26) by
 MWHPR02MB2720.namprd02.prod.outlook.com (2603:10b6:300:10a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 17 Apr
 2020 16:32:08 +0000
Received: from CY1NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:50:cafe::87) by DM3PR03CA0016.outlook.office365.com
 (2603:10b6:0:50::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Fri, 17 Apr 2020 16:32:08 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT021.mail.protection.outlook.com (10.152.75.187) with Microsoft SMTP
 Server id 15.20.2921.25 via Frontend Transport; Fri, 17 Apr 2020 16:32:07
 +0000
Received: from [149.199.38.66] (port=50018 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jPTtd-0003jW-E0; Fri, 17 Apr 2020 09:31:17 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jPTuQ-0003fD-VD; Fri, 17 Apr 2020 09:32:07 -0700
Received: from [172.19.2.220] (helo=localhost)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <stefanos@xilinx.com>)
 id 1jPTuI-0003cy-08; Fri, 17 Apr 2020 09:31:58 -0700
Date: Fri, 17 Apr 2020 09:31:57 -0700 (PDT)
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
In-Reply-To: <1b91aeb3-589b-ac68-8f92-a1e06fa9640d@xen.org>
Message-ID: <alpine.DEB.2.21.2004170930420.13631@sstabellini-ThinkPad-T480s>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <alpine.DEB.2.21.2004031234010.23034@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2LdC-nSMUEjLhGp_4PAkcRkp4wJKXiAy0ftt34T8LAVg@mail.gmail.com>
 <D048CA76-8C9F-4F44-B05C-D834A6D0D37D@citrix.com>
 <9de763c9-19f2-2163-d5db-95176dbce3cc@xen.org>
 <082584BF-3837-48A7-A0C2-9582BA3379C0@citrix.com>
 <a29cb044-7e78-a47b-f842-327373e0ec9f@xen.org>
 <4FBF62BA-5844-4506-8C01-FE1A6F4A7ED2@citrix.com>
 <057f48b7-84be-0bc5-773d-d01a79181b20@xen.org>
 <alpine.DEB.2.21.2004081642070.28673@sstabellini-ThinkPad-T480s>
 <914c421a-02cf-375b-a3fa-1c5e934cdeb3@xen.org>
 <3b002deb-5a80-3dc4-9462-649135cfbd29@xen.org>
 <C39B873E-F40C-4549-9D5E-953E88F94E43@arm.com>
 <1b91aeb3-589b-ac68-8f92-a1e06fa9640d@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(7916004)(136003)(376002)(396003)(346002)(39860400002)(46966005)(426003)(44832011)(5660300002)(478600001)(966005)(336012)(186003)(9686003)(4326008)(47076004)(356005)(82740400003)(33716001)(6916009)(81166007)(54906003)(316002)(2906002)(8676002)(81156014)(8936002)(9786002)(7416002)(26005)(53546011)(70206006)(70586007);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7934679-6b0f-485a-adf1-08d7e2ecded3
X-MS-TrafficTypeDiagnostic: MWHPR02MB2720:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2720710C3FAC57115548913EA0D90@MWHPR02MB2720.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0376ECF4DD
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8C0xUwAu0wU/YtLujPbV15IjnAFO74EH8rK+6utwfYW/aZj3D/WegwF4Ymeb5KIBRMgEUoIRldKwMuRZfVSQUrs/XapUJWiZ3gZo6HfuowGQXzR0np8PW/Z0RrIjtqz+c/CHI86jnA55rWv8lLA58gntiyoDr11IXTH8g/IXDWUz8c/W+J2OW0PmcpjxXjTW5/qomWZBHZdAFVV0pVBZVK3JRrj3fCiUiWRox7oJcuDPXoHTZnUfAdtiZqA8eF6VFJXR7GSItyhhj2u/gjXK0UG+fBdFWDvTl7PUBjznDYuMQsqRHczz6JZB+ux6SgAnadovXFY2p9P3CZtqxJphV7ATuwsp3LVl2O3T5XiNThnXnWqg7qO4GEuDxuosMgBPZD0H4FKO+XgsXc8Eg4lfRQXBG5ZvqGOUfal6CtfFxijzPS8VOfK7YzVAWATUE+U1gtj5ILUbfu3HcVmcmvq4WiYsn4EBSz5BsCNRm8sdYpAjI10Oi6pLOgahiGlzcb5bIbT4nlWZgSCVdoV+3F9WBNCKjK+/qC/GdTO0Kg3l8pBvO7WpnrAlwstLHObyci8Sq8knr9NAoANnQkiAr8uCaU3ey7KRFHg1rClNlGsuq6A=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2020 16:32:07.4488 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7934679-6b0f-485a-adf1-08d7e2ecded3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2720
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
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "maz@kernel.org" <maz@kernel.org>, George Dunlap <George.Dunlap@citrix.com>,
 Wei Xu <xuwei5@hisilicon.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 nd <nd@arm.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 17 Apr 2020, Julien Grall wrote:
> Hi Bertrand,
> 
> On 17/04/2020 16:16, Bertrand Marquis wrote:
> > It seems that the problem is a bit bigger then expected and will need more
> > discussion and thinking.
> > I did some research on my side and there are several design possible
> > depending on what should be the goal performance or real-time behaviour
> > (going from just give the status we have to fire a service interrupts when
> > any interrupts is acked by a guest to refresh our internal status).
> > 
> > In the short term, could we not agree to fix the typo by returning always 0
> > and start a discussion on the vgic implementation ?
> 
> I have already pointed out multiple time now ([1], [2]) that I would not
> oppose the temporary solution. I think this is a matter of someone (Stefano?)
> to submit it :).
> 
> Cheers,
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2019-11/msg01642.html
> [2] https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg00459.html

I can submit it. Julien, would you prefer the plain always return 0
patch, or would you prefer if I tried to get the latest ISACTIVER
information (like this patch does) but only for the local processor?

