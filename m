Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE66D74BAF9
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jul 2023 03:18:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560640.876717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHwZb-0003l0-Us; Sat, 08 Jul 2023 01:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560640.876717; Sat, 08 Jul 2023 01:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHwZb-0003iP-QM; Sat, 08 Jul 2023 01:17:19 +0000
Received: by outflank-mailman (input) for mailman id 560640;
 Sat, 08 Jul 2023 01:17:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t/Rp=C2=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1qHwZa-0003iJ-JF
 for xen-devel@lists.xenproject.org; Sat, 08 Jul 2023 01:17:18 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29c42f1b-1d2d-11ee-8611-37d641c3527e;
 Sat, 08 Jul 2023 03:17:12 +0200 (CEST)
Received: from DS7PR03CA0121.namprd03.prod.outlook.com (2603:10b6:5:3b4::6) by
 DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.26; Sat, 8 Jul 2023 01:17:06 +0000
Received: from DM6NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::e4) by DS7PR03CA0121.outlook.office365.com
 (2603:10b6:5:3b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25 via Frontend
 Transport; Sat, 8 Jul 2023 01:17:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT105.mail.protection.outlook.com (10.13.173.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Sat, 8 Jul 2023 01:17:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 7 Jul
 2023 20:17:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 7 Jul
 2023 20:17:05 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 7 Jul 2023 20:17:03 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 29c42f1b-1d2d-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpWoCWrjiZXt12eK8VSIS/kahYT5WX08TmisrmSMUppJ/nXIMfR5+gOp8ayqwQiZwK+7MLRX3Uk9p3ZB8bHQGL5PwLhWTkczV1ONe9RBUrc8i3dqJ8ySJnFMSCLCJP9V2w5sqkn16g/V9FymXl1yT5rTvIA+d420WeScTHm+8cltwYAns1jnzpdiarK+jWkbOOkIDtKNbKZMPYz2Tymwt3aMaTMovoC4WghajF4ATs8FAErtezUwGwDefV2yA7FTF2Qfm09olKIPHzq2FA7SBmNAb0F2DpPElJ63ZI6EJcFFTpr0g1c8siMa3i5/t4/noNZa4EcGxxLEmc7XXp6MpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLR9Q4mQs9KL8Xrz/4djMQJidsGyBOU6DXhcGqvsxhk=;
 b=K+z9V312udb7Ey0vPPwnKxuMWGOvjerJi2Pz6D+MGNJbE2KTkOKv+5XYnHtvYEdTBdeTyfthWNBdOOsJJ8fv+49sfOsU90l7tK1QQtcViFj/h2vvHJnBlcE3iSa3AlprR0X+5BtpiAQ9INUJrs4x9ZOEUCUi+s6bMfojUL/bVaLJvGjE8OU3h8IahHt4H5uGe6e768qFRPkYG/RmVhWQADmepPbgG8OAsluloa3+GzUTOc5i7TI6nQoeCneUI/4sxQFUs5vYFM8iuErVUTsfMykWVJ2MSKWCmsVKKMr0n1wks78mQvwgFPunjMpszd12ZtKQIN30ZJ2j02W7VIqJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLR9Q4mQs9KL8Xrz/4djMQJidsGyBOU6DXhcGqvsxhk=;
 b=BsmCm5qsPfl7fS/lA9VUDa7AX73XTvOCvpaob5l7kqlL2YPYURsHqKiGJ2ljLYWsTG7fGBUeiM416RM4feUBY0MLkNSEKyjyHc7NEcx4+8CDNGBvyFNriSaP7OktNzigdbOYKp4IPxdd6+F6jbwujGYlXePQYCdDeECQnTtdEbM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Fri, 7 Jul 2023 18:17:02 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, George Dunlap
	<george.dunlap@cloud.com>, P S <pairspace@gmail.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, "Wei
 Chen" <Wei.Chen@arm.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Henry Wang <Henry.Wang@arm.com>, Community Manager
	<community.manager@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Rian Quinn <rianquinn@gmail.com>, Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Scott Davis
	<scott.davis@starlab.io>, Adam Fraser <adam@starlab.io>, Paul Durrant
	<paul@xen.org>, <rsmith@riversideresearch.org>, "m.a.young@durham.ac.uk"
	<m.a.young@durham.ac.uk>, Elliott Mitchell <ehem+xen@m5p.com>, openxt
	<openxt@googlegroups.com>, Jason Andryuk <jandryuk@gmail.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
In-Reply-To: <CACMJ4GZSRp9R7EUVy4hp__uzy0E-L=X1Qt_ud-2VmcyXT3b6hg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307071814070.761183@ubuntu-linux-20-04-desktop>
References: <8601CDD7-87F7-4FD0-A6E6-BAEAB12E7956@arm.com> <234199F8-DBB1-42B6-9A4C-8800EEF60997@gmail.com> <CA+zSX=Y3_g_aq4+sDK7CuZajywVqQ4xOrq7hKZ80eUT3uSxzuQ@mail.gmail.com> <alpine.DEB.2.22.394.2307051436120.761183@ubuntu-linux-20-04-desktop>
 <CA+zSX=ashTi590+cVss_3zyLESC8S=zVSMLjTKD00s6xfjZbJA@mail.gmail.com> <alpine.DEB.2.22.394.2307061328540.761183@ubuntu-linux-20-04-desktop> <CACMJ4GYWoyCQMWX8VtpwChk7hHxL-u0Mo-kKX8Qmr1oKf91Hyg@mail.gmail.com>
 <CACMJ4GZSRp9R7EUVy4hp__uzy0E-L=X1Qt_ud-2VmcyXT3b6hg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-1124996708-1688779020=:761183"
Content-ID: <alpine.DEB.2.22.394.2307071817010.761183@ubuntu-linux-20-04-desktop>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT105:EE_|DM4PR12MB5165:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a2e68cd-ccc8-4152-ca86-08db7f510b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aspPf9sFM+YkUwLUAWwrATON3+fUox0E3LQT9OiFXiYc06GPaUqH2BBMis6UxkENLd11T91/W/8T0awH5pS+QcDD1ZfB+scmZxvYvjjCWXChepIaxUY/kAwvQ5mlpFma4WynMBwk9h9galuM+/CfLTggIIHWmCRXMS5REdrgKHTpU6cGEjDuQc/YqIFeD15/lgcXOgUC4mpkoy69BpucGAuyxLlFmk3F1M8OLLE6IKrqvdPRfD+nFioi6YIqO+0FswSUdA13D+hR0Q1U/MzKBYJ8o6CdLainX+0xmr848CaP/7yR3TWziqR6P8UfPb7C2ybrII83mDlTC3+ZL58nvUI2zHMLXfgMv18//iu1izE1OgXUFmJwdwIW5A4Jval3QFG+b8jRkxPuqINJdUauGkuOTyVyuQbqs3W2ZYUM2HuUck1ysBvgRkZyFlzQmxaF9NYJNKSbVSq/J5zRyWo947VCyKt4MNi455Qe1VVRRxEE9fOQYB2PiikjPA2bC8S8T1IQCwIqIRBk1a0av0k6dZoZiWXFkRw1tMAjPLckZ06bAfZ5DpIwetVhnau0sHaoKj9mSXqyZXJeIXBw4rW1/333IXc9QN/QiQCeBAKe++TtqwNPh90+Gopvo1oIDnwwCjf08OG3Ax8Z/k5KEd6mfZ9X4mnl8AL7nAzYyZKPDWKP5Kbc07nsA9RrhGsnRE9ROiMCMQBvEbRJAI/7+SFMbDT7Rux2SoOfStoIrF3M8czIh+Scr6lI4L820PDu+O0ycQp0pbxDP7T/RSpoaOAkSEQ7I/VUdoFsDR3uAXA76LY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(478600001)(33964004)(70586007)(54906003)(70206006)(53546011)(26005)(336012)(9686003)(966005)(186003)(30864003)(2906002)(33716001)(82310400005)(41300700001)(6916009)(4326008)(316002)(44832011)(7406005)(7416002)(5660300002)(8936002)(8676002)(81166007)(82740400003)(356005)(86362001)(47076005)(36860700001)(83380400001)(426003)(40460700003)(40480700001)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2023 01:17:06.4278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2e68cd-ccc8-4152-ca86-08db7f510b7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5165

--8323329-1124996708-1688779020=:761183
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2307071817011.761183@ubuntu-linux-20-04-desktop>

On Fri, 7 Jul 2023, Christopher Clark wrote:
> +CC openxt, Jason, Marek
> 
> On Fri, Jul 7, 2023 at 2:06 PM Christopher Clark <christopher.w.clark@gmail.com> wrote:
>       +CC members of the Hyperlaunch Working Group + participants on earlier Hyperlaunch threads
> 
> On Thu, Jul 6, 2023 at 2:39 PM Stefano Stabellini <stefano.stabellini@amd.com> wrote:
>       On Thu, 6 Jul 2023, George Dunlap wrote:
>       > On Wed, Jul 5, 2023 at 11:14 PM Stefano Stabellini <stefano.stabellini@amd.com> wrote:
>       >       On Wed, 5 Jul 2023, George Dunlap wrote:
>       >       > On Mon, Jul 3, 2023 at 9:55 PM P S <pairspace@gmail.com> wrote:
>       >       >       > On Jul 3, 2023, at 15:45, Luca Fancellu <luca.fancellu@arm.com> wrote:
>       >       >       ﻿>
>       >       >       >> On 3 Jul 2023, at 18:48, Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >       >       >>
>       >       >       >>> On Mon, 3 Jul 2023, Daniel P. Smith wrote:
>       >       >       >>> On 7/1/23 11:13, Luca Fancellu wrote:
>       >       >       >>>>> On 1 Jul 2023, at 08:53, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>       >       >       >>>>>
>       >       >       >>>>> On 30/06/2023 10:12 am, Luca Fancellu wrote:
>       >       >       >>>>>> The "dom0less" feature was intended to be the feature where a domU
>       >       >       >>>>>> domain could be launched without the control domain (Dom0)
>       >       >       >>>>>> intervention, however the name seems to suggest that Dom0 cannot
>       >       >       >>>>>> be part of the configuration, while instead it's a possible use case.
>       >       >       >>>>>>
>       >       >       >>>>>> To avoid that, rename the "dom0less" configuration with the name
>       >       >       >>>>>> "hyperlaunch", that is less misleading.
>       >       >       >>>>>>
>       >       >       >>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>       >       >       >>>>>> ---
>       >       >       >>>>>> This is an RFC to get the feeling of the community about the name
>       >       >       >>>>>> change, for now it's everything in one patch just to see how it
>       >       >       >>>>>> will look like, if there is interest on proceeding into it, I can
>       >       >       >>>>>> split in more commit.
>       >       >       >>>>>
>       >       >       >>>>> Have you discussed this with Dan and Chris at all?  You haven't even
>       >       >       >>>>> CC'd them.
>       >       >       >>>>
>       >       >       >>>> No, this rename idea started from a chat during the summit, anyway Julien
>       >       >       >>>> promptly add them to the CC, because I forgot.
>       >       >       >>>
>       >       >       >>> No worries and thank you for considering and taking the time to do this RFC.
>       >       >       >>> It is greatly appreciated that there is a strong willingness to have dom0less
>       >       >       >>> and hyperlaunch merged.
>       >       >       >>>
>       >       >       >>>>>
>       >       >       >>>>> While there is a lot of end-goal in common between the dom0less and
>       >       >       >>>>> hyperlaunch, and that the name dom0less is deeply misleading,
>       >       >       >>>>> hyperlaunch is specifically not this.
>       >       >       >>>>
>       >       >       >>>> Yes Hyperlaunch is more than this, however as I said, with this RFC I would
>       >       >       >>>> like
>       >       >       >>>> to ear opinions, @Daniel @Christopher could it be a proper name for the
>       >       >       >>>> dom0less
>       >       >       >>>> feature?
>       >       >       >>>
>       >       >       >>> As Andy has alluded, hyperlaunch is meant to provide a flexible means to
>       >       >       >>> handle domain construction at boot to meet a wide range of possible use cases.
>       >       >       >>> One of those use cases is dom0less, so yes, ultimately what dom0less does
>       >       >       >>> today will be achievable under hyperlaunch. Our intended approach to align the
>       >       >       >>> two implementations is one that is meant to be minimally disruptive, since
>       >       >       >>> dom0less is considered a supported (SUPPORT.md) capability. As mentioned, we
>       >       >       >>> are greatly appreciative to the openness to adopt the name,
>       >       >       >>
>       >       >       >> Thanks Daniel!
>       >       >       >>
>       >       >       >>
>       >       >       >>> but a big concern
>       >       >       >>> I personally have is the confusion it could cause a general user. A blanket
>       >       >       >>> rename would end up with two documents in the docs tree that provide two
>       >       >       >>> different explanations of hyperlaunch and two different device tree
>       >       >       >>> definitions. So I think a more measured approach should be considered here.
>       >       >       >>>
>       >       >       >>>> If this patch makes things more difficult for the Hyperlunch serie, I’m ok
>       >       >       >>>> to drop it,
>       >       >       >>>> my only aim was just to find a less misleading name for the feature.
>       >       >       >>>
>       >       >       >>> What I would like to suggest as a good first step would be an update to the
>       >       >       >>> dom0less document. Provide a note at the beginning that points to the
>       >       >       >>> hyperlaunch design doc as a more general approach that will eventually subsume
>       >       >       >>> dom0less. This would provide a gentler transition for exist users of dom0less.
>       >       >       >>>
>       >       >       >>> If it is not too much, I would also ask, please have a look at the design for
>       >       >       >>> boot modules in the series Christopher just posted. The design pulls from the
>       >       >       >>> work done by dom0less and expanded upon it. I major step into merging the two
>       >       >       >>> capabilities will be to have a common set of structures. Once those are in
>       >       >       >>> place, we can move to a common device tree representation, and at that point
>       >       >       >>> we would be fairly close, if not at the point of a formal merger of between
>       >       >       >>> the two.
>       >       >       >>
>       >       >       >> At the moment we have a concrete problem with explaining dom0less and
>       >       >       >> hyperlaunch to potential new users. Using two different names for a
>       >       >       >> similar feature on arm and x86 causes confusion. It is hurting Xen as a
>       >       >       >> solution. Personally I already had to switch to use the word
>       >       >       >> "hyperlaunch" for everything in my users-facing presentations.
>       >       >       >>
>       >       >       >> At the summit, we discussed that it would be a good idea to use a single
>       >       >       >> name to refer to both features on arm and x86. Given that "dom0less"
>       >       >       >> causes additional issues because it makes people think that there is no
>       >       >       >> Dom0, the suggestion was to use "hyperlaunch" to refer to both features.
>       >       >       >>
>       >       >       >> We don't need to 100% align the two implementations and data structures.
>       >       >       >> This is not for engineers that are going to look at the specifications
>       >       >       >> and improve them. This is for users/customers of Xen that are trying to
>       >       >       >> understand what the hypervisor enables them to do. We need to be able to
>       >       >       >> show users architecture slides with the same name and explanation on
>       >       >       >> both ARM and x86.
>       >       >       >>
>       >       >       >> I am sure that Daniel and Christopher remember, but for the others on
>       >       >       >> this email thread, the name "hyperlaunch" was born exactly to be that:
>       >       >       >> the one name to cover both features on ARM and x86 even if they have a
>       >       >       >> different implementation. Appended an old email for reference.
>       >       >       >>
>       >       >       >> Also I agree with Daniel that we need to be careful about the two docs
>       >       >       >> under docs/. I think he is right we need to add a paragraph explaining
>       >       >       >> the history and a pointer to the other document. Something like:
>       >       >       >>
>       >       >       >> "Dom0less is the name that was used when initially introducing the
>       >       >       >> feature on ARM. Then, the "dom0less" name was retired in favor of
>       >       >       >> "hyperlaunch" to avoid confusion (a Dom0 might still be present) and to
>       >       >       >> align with x86 (where a similar feature was called hyperlaunch from the
>       >       >       >> start)."
>       >       >       >
>       >       >       > I’m fully ok to add a section like this pointing to the Hyperlaunch design.
>       >       >
>       >       >       _If_ this text is added, please include links/references to the Hyperlaunch wiki page and Hyperlaunch
>       design docs.
>       >       >
>       >       >       > @Daniel and @Christopher would it be ok for you or the changes in the serie
>       >       >       > are going to be problematic for your future work? In the end it’s just a mechanical
>       >       >       > rename, so I guess we just need to agree on naming conventions.
>       >       >
>       >       >       Please see the history of trademark litigation about the use of symbolic names to reference
>       similar-but-different
>       >       artifacts. 
>       >       >       It is much easier to use the same name to refer to entirely different objects. Historically, confusion
>       arises when a
>       >       name is
>       >       >       used in similar contexts.
>       >       >
>       >       >       There is also versioning.  Could we refer to dom0less as "Hyperlaunch Version -1"?
>       >       >
>       >       >       How about renaming dom0less to "Hyperlaunch Lite"?
>       >       >
>       >       >
>       >       > Perhaps it would be helpful if you could explain more clearly your concerns.  I take it that you want a name
>       which can be
>       >       used specifically
>       >       > to indicate the full "domB measured boot" functionality that was Daniel and Christopher's original goal, and
>       that you're
>       >       afraid that using
>       >       > plain "Hyperlaunch" for only the "start VMs from Xen on boot" functionality will dilute that?
>       >       >
>       >       > The "start VMs from Xen on boot" functionality is the *only* thing that a big chunk of the users of this
>       functionality want; 
>       >       referring to
>       >       > it as "Hyperlaunch Lite" or "Hyperlaunch -1" will undermine the value of the functionality.
>       >       >
>       >       > What if we use "Measured Hyperlaunch", or "Hyperlaunch Measured Boot" to refer to the full measured boot
>       functionality?
>       >
>       >       I think this is the best way.
>       >
>       >
>       >       > Or, "Hyperlaunch DT" for "Booting VMs from Xen using Device Tree" (without the involvement of a domB),
>       "Hyperlaunch Boot
>       >       Domain /
>       >       > Hyperlaunch domB" for a more general "domB" functionality, and "Hyperlaunch Measured Boot" for the full
>       functionality
>       >       (assuming there's
>       >       > more to this than simply having a domB involved)?
>       >
>       >
>       >       We need an overarching name to cover the feature "start VMs from Xen on
>       >       boot" on both ARM and x86. From my understanding and from the original
>       >       emails on the subject, the name "hyperlaunch" was it.
>       >
>       >
>       > Sure; but think "guitar" vs "acoustic guitar" vs "electric guitar".  "Electric guitar" is new, "guitar" covers them
>       both, but you sometimes
>       > need a way to specify "acoustic".  Right now target configurations we're talking about include:
>       >
>       > 1. Booting all your domains directly from Xen using DT configurations
>       > 2. Booting a domB, which then executes some more complicated programmatic configuration to launch VMs before
>       disappearing
>       > 3. Doing full measured boot on the whole system using a domB.
>       >
>       > If "Hyperlaunch" means 1-3, we not only need a way to specify that you're talking about 3, but *also* a way to specify
>       that you're talking
>       > about 1.  In the vast majority of cases for the foreseeable future are going to be 1.  Additionally, we want to make
>       sure that
>       > "Hyperlaunch" *actually* turns out to mean 1-3, and not just 1.
>       >
>       > The thing I like about "Hyperlaunch DT" is that to me it sounds pretty cool but also is very descriptive: I haven't
>       talked to people
>       > building these systems, but it seems like saying, "The hypervisor launches VMs based on a Device Tree passed to it at
>       boot" will be
>       > immediately understood, and stick in people's minds.
>       >
>       > So maybe informally, or in "short usage" use "Hyperlaunch", but in documentation or reference systems, when talking
>       specifically about #1,
>       > try to use "Hyperlaunch DT", just to reinforce the idea that there's more to Hyperlaunch that's coming down the road?
> 
>       "Hyperlaunch DT" would refer to both the x86 and ARM implementations
>       because they are both based on DT.
> 
>       I think it is better than "Hyperlaunch Lite" but I am not a fan of
>       either of these two names because "DT" and "Lite" get easily lost in
>       presentations and discussions. For the next few years many will talk
>       about HyperLaunch just to refer to what is Dom0less today. So if the
>       goal when we say "HyperLaunch" is to bring Measure Boot or XSM to
>       people's minds, I don't think this will work well.
> 
>       If we want to keep "Hyperlaunch" to mean 1-3 above, highlighting Measure
>       Boot or XSM, then I think we should consider using "Dom0less" for 1.
>       Yes, it is misleding, but at least it is unique, and a google search for
>       "dom0less" leads the user to the right results.
> 
>       If we do that, we should rename "Hyperlaunch" with "Dom0less" in
>       docs/designs/launch/hyperlaunch.rst. That's because "Hyperlaunch" is
>       defined as "the ability of a hypervisor to construct and start one or
>       more virtual machines at system launch in a specific way", which falls
>       under Dom0less in this discussion.
> 
>       In my opinion, it is better to have specific names for specific
>       features. So I would use "HyperLaunch" to mean "the ability of a
>       hypervisor to construct and start one or more virtual machines at system
>       launch in a specific way" as it is defined today.
> 
>       When we add Measure Boot or XSM or other security/safety features, I
>       would call them out specifically. For instance, "HyperLaunch with XSM".
>       It is more descriptive and highlights each feature.
> 
>       Note that at AMD we'll need HyperLaunch without an all-powerful Dom0,
>       probably with XSM. So I am not writing this because I don't think the
>       other features 2-3 are not important. They definitely are important.
> 
> 
> 
> Thanks to all the participants in this thread for the interest in Hyperlaunch and
> the support for enabling common advanced boot functionality for Xen across
> architectures.
> 
> I'm aiming to provide here a hopefully-fairly-objective overview of the issues
> being raised so that we can ensure that these are covered, and then I will also
> give my views afterwards.
> 
> ------------------------------------------------------------
> = Naming and communication
> 
> - Ensuring expectations are set correctly for the Hyperlaunch name
>     - communicating the value of it, differentiation for Xen
>     - avoiding sub-branding it for feature subsets, use cases, technologies
> 
> - Retiring the term 'dom0less'
> 
> - How to describe the "starting multiple VMs at host boot" functionality
> 
>     - How to describe further Hyperlaunch functionality beyond this
>         - eg. isolation properties and relevance to critical systems
>         - eg. running without a classic dom0
> 
>     - How Hyperlaunch relates to other boot functionalities and technologies,
>       including:
>         - architecture-specific aspects and architecture-neutral aspects
>         - Device Tree
>         - boot domain
>         - control domain, hardware domain, dom0
>         - domain builder
>         - system measurement
>         - XSM
>         - DRTM
>         - etc.
> 
> 
> = Migration
> 
> - Providing a forward path for existing users of dom0less functionality
> across the technical changes for Hyperlaunch cross-architecture implementation
>     - document compatibility
>     - support a "dom0less mode" with existing Device Tree structure
>     - documentation updates to be paired with progress on code implementation
> 
> 
> = Community resourcing
> 
> - Supporting code review and merge of Hyperlaunch changes into Xen
>     - transitioning existing Arm logic into common, including FDT
> 
> - Provision of accurate, consistent documentation materials to support
> effective communication to existing and prospective users, developers and other
> stakeholders
>      - Ensuring that the document structure supports ongoing maintenance:
>         - Multiple use cases, structure docs accordingly: eg.
>             - use case: static partitioning, critical + non-critical VMs
>             - use case: measured launch with a boot domain
>             - use case: fast VM start for embedded systems
>         - Architecture of Hyperlaunch, relevance to other hypervisors
>             - nested systems
> 
> - Design, review and agreement for common cross-architecture and
>   arch-extensible interfaces, including:
>     - common boot data structures
>     - Device Tree structure
>     - hypfs entries
>     - introspection to determine hyperlaunched system status
> 
> - Development of test cases
> 
> - CI of Hyperlaunch interfaces, to ensure that it stays working
>  
> ------------------------------------------------------------
> 
> Views arrived at in discussion with Rich and Daniel, and after reading the
> thread contributions, follow this point.
> 
> "Hyperlaunch" is to be the common name across architectures for a flexible,
> configurable boot system for coordinating the launch of multiple VMs by the
> hypervisor, with a common implementation, pooling resources and development
> risk across the Xen community. The interfaces are core to it.
> 
> From the Hyperlaunch design document (reviewed + committed to the tree):
> 
> "The design enables seamless transition for existing systems that require a dom0, and provides a new general capability to build and
> launch alternative configurations of virtual machines, including support for static partitioning and accelerated start of VMs during
> host boot, while adhering to the principles of least privilege. It incorporates the existing dom0less functionality, extended to fold
> in the new developments from the Hyperlaunch project, with support for both x86 and Arm platform architectures, building upon and
> replacing the earlier 'late hardware domain' feature for disaggregation of dom0.
> 
> Hyperlaunch is designed to be flexible and reusable across multiple use cases, and our aim is to ensure that it is capable, widely
> exercised, comprehensively tested, and well understood by the Xen community."
> 
> https://xenbits.xen.org/docs/4.17-testing/designs/launch/hyperlaunch.html
> 
> ie.  Hyperlaunch was created to move away from point solutions that hard-code
> specific launch configurations, isolation properties and threat models. It
> isn't just about starting domains -- it is about enabling the construction of
> complex use cases runtimes for Xen. It is the result of iterative design
> starting with the disaggregation for the late hardware domain, through
> dom0less development and then with the comprehensive hyperlaunch design and
> implementation that builds upon them both.
> 
> The current interest and investment in Hyperlaunch is driven by its relevance
> to Safety Critical systems due to the isolation properties and improvement
> in the ability to certify the software -- this is closely related to but
> slightly different from starting multiple VMs at host boot.
> 
> To encourage commonality and allow for future development, we should not
> use architecture-specific or vendor-specific name variations, and also avoid
> technology-specific name variations (eg. Device Tree or "DT").
> 
> Instead, the use case configurations should themselves be describable.

Thanks Christopher, Daniel and all!

So if I understand correctly, you are in favor if renaming Dom0less to
Hyperlaunch throughout the Xen codebase? And we need a clarification of
the docs/, especially docs/features/dom0less.pandoc?
--8323329-1124996708-1688779020=:761183--

