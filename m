Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D039819C7D4
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 19:20:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK3Vh-0005M3-30; Thu, 02 Apr 2020 17:20:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dnjT=5S=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1jK3Vf-0005Lu-20
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 17:20:07 +0000
X-Inumbo-ID: 32045a13-7506-11ea-bc15-12813bfff9fa
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (unknown
 [40.107.77.42]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32045a13-7506-11ea-bc15-12813bfff9fa;
 Thu, 02 Apr 2020 17:20:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffObcS5vqR1wkFl6VHJdZlBGOTc0yaEwxJF21GoEhkmMN1beEmUAOpZq68Py3yIPnFhCZxmhJblQAXtQeivKndjHxfjN5n+SIbsvD1E++q2eG8ojNeuG71e3l7VYYReuuC06Go5bN5gH7j/8+oep6Px5rmv5OXpcosh+dJGgapbSRJ8msdM1Mdq2zybG+a4xbg46sQzEtmO4byoZnnOyjGbtgmwonj0oLZ0GGhjDNkLh0zFfutyNDk3kyki3OTqbpNMP0DrVEExpcLtHMEN/MOrJgiEWd6FT/7Z2kUS4gplojsYEfqCkCCcMI6Iqks3qQWA5A/OcO817o3mopMStcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcpzF3l6cBRhzFd2948ZXb8FfCjTNb6+Y7pZbkr2fwc=;
 b=C8rsgp4k+b5/0vnYM3+ylR7ud8dv9kJJTc6hzSN5EfhJGQx3lAOu08PdA0MLUmDD+0cRvzJ3JRIaC4XLqn+3cj09MHAdk9q2zAWq7fSSDWtIbLy5gl99kTc2bROzTOmbHL/IrHr1s9MzFg+CwpI1TghAjlGyX0tMQ1X1tHoG2po4RckGXLCb/sfps8AQ+rMu9OmciAXrbr26zxpnodfgNeaJruZqccr0Nf6JHzYcU9uHjn3MaGr5ruy0AYUI3R18GXAy9Ul8ovPR3X9J3cbgRNKQtgR9zJ78bKgH68et8WrKwxnnFH7SUVWYT5yvksucucmHC+d++rWPlvabSvteFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcpzF3l6cBRhzFd2948ZXb8FfCjTNb6+Y7pZbkr2fwc=;
 b=ba71uuk7Ge5bz96xO0KcTSc2qbpvpvxm6XQQmQSzvT69BNi8atSubBN7PBhcaqyzNmraI+e8zpbb5Hh1Nhp1hkdgFTnPzx7HCtUGUpWBlJJ/flUTg+iga6GKXvXtm+QhmXd4Ztjn6EICGuaO5zvGbGP/Nh2TOmoHH/n8fXupV30=
Received: from DM6PR07CA0043.namprd07.prod.outlook.com (2603:10b6:5:74::20) by
 DM5PR02MB2377.namprd02.prod.outlook.com (2603:10b6:3:52::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15; Thu, 2 Apr 2020 17:20:04 +0000
Received: from SN1NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::54) by DM6PR07CA0043.outlook.office365.com
 (2603:10b6:5:74::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend
 Transport; Thu, 2 Apr 2020 17:20:04 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT006.mail.protection.outlook.com (10.152.72.68) with Microsoft SMTP
 Server id 15.20.2878.15 via Frontend Transport; Thu, 2 Apr 2020 17:20:04
 +0000
Received: from [149.199.38.66] (port=50614 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jK3VW-0002gf-5l; Thu, 02 Apr 2020 10:19:58 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jK3Vc-0006TT-4h; Thu, 02 Apr 2020 10:20:04 -0700
Received: from [172.19.2.220] (helo=localhost)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <stefanos@xilinx.com>)
 id 1jK3VV-0006Je-FC; Thu, 02 Apr 2020 10:19:57 -0700
Date: Thu, 2 Apr 2020 10:19:57 -0700 (PDT)
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
In-Reply-To: <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
Message-ID: <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
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
 SFS:(10009020)(7916004)(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966005)(81166006)(356004)(70586007)(81156014)(70206006)(82740400003)(54906003)(478600001)(9686003)(5660300002)(316002)(336012)(33716001)(8936002)(8676002)(186003)(47076004)(2906002)(9786002)(426003)(26005)(6916009)(44832011)(53546011)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac95e07a-7faf-4256-dbc6-08d7d72a1576
X-MS-TrafficTypeDiagnostic: DM5PR02MB2377:
X-Microsoft-Antispam-PRVS: <DM5PR02MB23771C5916723181CDF52904A0C60@DM5PR02MB2377.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0361212EA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E+M5blTf9jD1uA6rXJdjqlDDaTDKKZOkSfKCVnjnVKZ+9Gav36aXNISqkFhk2m1Gp8YdIXefySeRBnseKDd0AQMqCPLaXLOp0epXr1W86r9s0EttZmVLOnwtCqQN3lWNENxNBwjUkJOCb/sCJ+GMruU8Rv+falKU2dc2IUoEaYS3XniSK1qrpWxTkfaZKIG4up9N0y+6ggriPAtz6HxFjecIbC1sR0CGe0WBFU90ptv7BmA/GeJtYLYhlrzlFtZzwvB01xBk4T2vMUVQO0ght/sIOWO1NLNrk+KNCmss2fnRciKkpyJNddgMzIu7yGhAQjkAaNxTITRm9bl0BLryIDPnahBJpcG1TNbATvPt5DuYA8LgIfWztcfgYbGfBPwEZqtCMakZ3T0bXN9CES2ihebPlXO2Vkrsd5U9GNj0R5HvT0NMCOSoNHV4wkWTFOBRu5+YAFjqYtl/YGY33IDxJVXqfzterkIIKu3TdlN07chaciAMIHhQi6P9JiEoGFCztb91Lf8nBSJ6jQrPZUhx0A==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 17:20:04.4814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac95e07a-7faf-4256-dbc6-08d7d72a1576
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2377
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
 George.Dunlap@citrix.com, Wei Xu <xuwei5@hisilicon.com>,
 Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 1 Apr 2020, Julien Grall wrote:
> On 01/04/2020 01:57, Stefano Stabellini wrote:
> > On Mon, 30 Mar 2020, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 30/03/2020 17:35, Stefano Stabellini wrote:
> > > > On Sat, 28 Mar 2020, Julien Grall wrote:
> > > > > qHi Stefano,
> > > > > 
> > > > > On 27/03/2020 02:34, Stefano Stabellini wrote:
> > > > > > This is a simple implementation of GICD_ICACTIVER / GICD_ISACTIVER
> > > > > > reads. It doesn't take into account the latest state of interrupts
> > > > > > on
> > > > > > other vCPUs. Only the current vCPU is up-to-date. A full solution is
> > > > > > not possible because it would require synchronization among all
> > > > > > vCPUs,
> > > > > > which would be very expensive in terms or latency.
> > > > > 
> > > > > Your sentence suggests you have number showing that correctly
> > > > > emulating
> > > > > the
> > > > > registers would be too slow. Mind sharing them?
> > > > 
> > > > No, I don't have any numbers. Would you prefer a different wording or a
> > > > better explanation? I also realized there is a typo in there (or/of).
> > > Let me start with I think correctness is more important than speed.
> > > So I would have expected your commit message to contain some fact why
> > > synchronization is going to be slow and why this is a problem.
> > > 
> > > To give you a concrete example, the implementation of set/way instructions
> > > are
> > > really slow (it could take a few seconds depending on the setup). However,
> > > this was fine because not implementing them correctly would have a greater
> > > impact on the guest (corruption) and they are not used often.
> > > 
> > > I don't think the performance in our case will be in same order magnitude.
> > > It
> > > is most likely to be in the range of milliseconds (if not less) which I
> > > think
> > > is acceptable for emulation (particularly for the vGIC) and the current
> > > uses.
> > 
> > Writing on the mailing list some of our discussions today.
> > 
> > Correctness is not just in terms of compliance to a specification but it
> > is also about not breaking guests. Introducing latency in the range of
> > milliseconds, or hundreds of microseconds, would break any latency
> > sensitive workloads. We don't have numbers so we don't know for certain
> > the effect that your suggestion would have.
> 
> You missed part of the discussion. I don't disagree that latency is important.
> However, if an implementation is only 95% reliable, then it means 5% of the
> time your guest may break (corruption, crash, deadlock...). At which point the
> latency is the last of your concern.

Yeah I missed to highlight it, also because I look at it from a slightly
different perspective: I think IRQ latency is part of correctness.

If we have a solution that is not 100% faithful to the specification we
are going to break guests that rely on a faithful implementation of
ISACTIVER.

If we have a solution that is 100% faithful to the specification but
causes latency spikes it breaks RT guests.

But they are different sets of guests, it is not like one is necessarily
a subset of the other: there are guests that cannot tolerate any latency
spikes but they are OK with an imprecise implementation of ISACTIVER.

My preference is a solution that is both spec-faithful and also doesn't
cause any latency spikes. If that is not possible then we'll have to
compromise or come up with "creative" ideas.


> > It would be interesting to have those numbers, and I'll add to my TODO
> > list to run the experiments you suggested, but I'll put it on the
> > back-burner (from a Xilinx perspective it is low priority as no
> > customers are affected.)
> 
> How about we get a correct implementation merge first and then discuss about
> optimization? This would allow the community to check whether there are
> actually noticeable latency in their workload.

A correct implementation to me means that it is correct from both the
specification point of view as well as from a latency point of view. A
patch that potentially introduces latency spikes could cause guest
breakage and I don't think it should be considered correct. The
tests would have to be done beforehand.



In terms of other "creative" ideas, here are some:

One idea, as George suggested, would be to document the interface
deviation. The intention is still to remove any deviation but at least
we would be clear about what we have. Ideally in a single place together
with other hypervisors. This is my preference.

Another idea is that we could crash the guest if GICD_ISACTIVER is read
from a multi-vcpu guest. It is similar to what we already do today but
better because we would do it purposely (not because of a typo) and
because it will work for single vcpu guests at least.

We could also leave it as is (crash all the time) but it implies that
vendors that are seeing issues with Linux today will have to keep
maintaining patches in their private trees until a better solution is
found. This would also be the case if we crash multi-vcpus guests as
previously suggested.

