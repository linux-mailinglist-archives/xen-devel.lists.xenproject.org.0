Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC96174A601
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 23:39:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560076.875681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHWhD-0006q6-16; Thu, 06 Jul 2023 21:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560076.875681; Thu, 06 Jul 2023 21:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHWhC-0006n2-U3; Thu, 06 Jul 2023 21:39:26 +0000
Received: by outflank-mailman (input) for mailman id 560076;
 Thu, 06 Jul 2023 21:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v06Q=CY=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1qHWhB-0006me-Cz
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 21:39:25 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe59::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 900ee93c-1c45-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 23:39:21 +0200 (CEST)
Received: from MW3PR05CA0011.namprd05.prod.outlook.com (2603:10b6:303:2b::16)
 by MW4PR12MB7381.namprd12.prod.outlook.com (2603:10b6:303:219::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Thu, 6 Jul
 2023 21:39:10 +0000
Received: from CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::f6) by MW3PR05CA0011.outlook.office365.com
 (2603:10b6:303:2b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.12 via Frontend
 Transport; Thu, 6 Jul 2023 21:39:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT008.mail.protection.outlook.com (10.13.175.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Thu, 6 Jul 2023 21:39:10 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Jul
 2023 16:39:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Jul
 2023 14:39:09 -0700
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 6 Jul 2023 16:39:08 -0500
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
X-Inumbo-ID: 900ee93c-1c45-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Me8fKvXe5W0oJwBbro+CEeE08+VTxBJgz8g9mwsqcfALRXlwZJZ9+bLkIQ/i9F3O4LuDfFz492OFkp9lo2ILUzDa607Htjy7MK29no2WsHF3xvwRRHi+ngneblFRqcdf+uvGrwOPNicsSQCx5tsvmFzbg1ixCNWt6S+oUnKPQjplnk6G/PnEGi0DW4kn5QT+cgVV3SqfmAuNBkWn19sjDFEJ2KsSDmwbCmqe479Fk9STYCltmilyX2g4FrRip0jcb87RPz0/M+K1uGo/hUVKYsdCppcTqVhX58jp0GYAzoxqNC05RgK1YvsyKrQ3sXrf7eFRDoFCMEhiBat4HIP45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l644wlFuQviuTt5zK+sx8fbek8CBGpm8B/UjQ2SWsts=;
 b=B9b0sWujK4f8it/znPD2TYoyVfIxqSLxDBR3HoQl9pdQhnqqcmVUPUXCs1t0j3in4gWISaeMhwG6mVoe3KfPPzdfdaqrNz2L3dY7/A8Zlbg4RxFl7f1B7tLgdez+ub0l5Lvnux47+B7ANMF2gEM8rGTlhLq8Y+RjjFWl2VURv/vAG8kGiPGeKlQxA9hdf6yqNWd+9ErgX509nR5sroVWexd/u8JoybjujuAeFIEO2VuRIP41gSxpYgTs1QFP2JusbSq6WP6pepZs1TuSRXAmrVIa2LlgVIsojQbuu2HKy9IsvxA0LWItma9bJw2XPen9L4amL0OaUQ8oGUGG6OAz7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l644wlFuQviuTt5zK+sx8fbek8CBGpm8B/UjQ2SWsts=;
 b=C88IdGWAtucCvOY4vqrZXYbFlqck+Pkor22YHXhFi/Y8IGnDgmlUxXWzNxxh4Z/Z1IuBCcFApDOW3WKcstYfuWKZy+5M2KYn1iaHyeQHMrSAnUwVkI6GJOG7yybXGBRf074Iludi4kfiYCVv5EgYzety1iDl91b/ewq9hfSu/Y4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Thu, 6 Jul 2023 14:39:01 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <george.dunlap@cloud.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, P S
	<pairspace@gmail.com>, Luca Fancellu <luca.fancellu@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Henry Wang
	<Henry.Wang@arm.com>, Community Manager <community.manager@xenproject.org>,
	Doug Goldstein <cardoe@cardoe.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
In-Reply-To: <CA+zSX=ashTi590+cVss_3zyLESC8S=zVSMLjTKD00s6xfjZbJA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307061328540.761183@ubuntu-linux-20-04-desktop>
References: <8601CDD7-87F7-4FD0-A6E6-BAEAB12E7956@arm.com> <234199F8-DBB1-42B6-9A4C-8800EEF60997@gmail.com> <CA+zSX=Y3_g_aq4+sDK7CuZajywVqQ4xOrq7hKZ80eUT3uSxzuQ@mail.gmail.com> <alpine.DEB.2.22.394.2307051436120.761183@ubuntu-linux-20-04-desktop>
 <CA+zSX=ashTi590+cVss_3zyLESC8S=zVSMLjTKD00s6xfjZbJA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-1226463232-1688675744=:761183"
Content-ID: <alpine.DEB.2.22.394.2307061335480.761183@ubuntu-linux-20-04-desktop>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT008:EE_|MW4PR12MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cbc4504-53b1-4fb6-e715-08db7e696f5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0YEBRSfFLhtGXbAwaMIaEXiL8WDYFsBsUBo76AH10iQo6hipwn7QemyNk6c+bGwlZktoVBML9DJtgLBfV5f4giFch1Y7W/6hWRPjy0Fx6oRLSfonmCUgBAS3yNXPCPe62a2M0t+EMYlBR+iH8amdlbB2Q8zdf/zgFCOAKQ349hl4jb6rOvilaRazx7j82FDQpCuBxWmSb/HO//OoVKAyQcMoF4If7RdpopQg9DW8nM6pZJLG4xeqEI9AudUmF2bUc++xRKE8n6AZiinvMuCzf2D7N4+FHY6QV6W3wRNFij9a2RAOGzhgSYAdEiXjS8ghS/3wOAAcNtWTHEhZ41yvZgW/MKrI7vNnEHIP/3lqnFxfURnz8mCnCHJ8V14m8y8WbrV/+aMgcXpDXTSmeAlfiFemYvudlal/z+y5zDEl3Lkjv4sFz5ToRcTBUbbVu1apOYsnilj2QwlvsMvpDnlhb24lCX6fGYI2F+8YvM/4yBJve80uamy9dhuZa/6FWSd9r5xO2znlv8DAiP/dWi0Rp63OY5GLqvVUknIcXc7jwHlKWP7GJiAf9bEHdQDZ7b8LVyx4VEZKs7zdvfnYOoqx5EWVctYC95nC1JnlzzABVAVfpE+4sC8OMu/T5vtmqH9n0MQpfCMFl2E8DiwrOqWFI4kgscr9qB9y7j6eSUq3b/TTjSM+/YosM5abOeYY4mFqQlJltjhDteyHFQpBHF0nqW62DCD8siMuxHtD04EuD2DeuU7528Ruue/9mqZqxLVnza9EfC60L7SYlcMwpWh2KNkiPcFC6toZeQ/iuxJHo80=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199021)(46966006)(40470700004)(36840700001)(70206006)(5660300002)(7416002)(6916009)(4326008)(44832011)(70586007)(41300700001)(316002)(8936002)(8676002)(40460700003)(86362001)(33716001)(82310400005)(40480700001)(30864003)(2906002)(33964004)(426003)(6666004)(83380400001)(26005)(53546011)(336012)(186003)(9686003)(36860700001)(82740400003)(356005)(81166007)(54906003)(47076005)(478600001)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 21:39:10.6560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbc4504-53b1-4fb6-e715-08db7e696f5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7381

--8323329-1226463232-1688675744=:761183
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2307061335481.761183@ubuntu-linux-20-04-desktop>

On Thu, 6 Jul 2023, George Dunlap wrote:
> On Wed, Jul 5, 2023 at 11:14 PM Stefano Stabellini <stefano.stabellini@amd.com> wrote:
>       On Wed, 5 Jul 2023, George Dunlap wrote:
>       > On Mon, Jul 3, 2023 at 9:55 PM P S <pairspace@gmail.com> wrote:
>       >       > On Jul 3, 2023, at 15:45, Luca Fancellu <luca.fancellu@arm.com> wrote:
>       >       ﻿>
>       >       >> On 3 Jul 2023, at 18:48, Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >       >>
>       >       >>> On Mon, 3 Jul 2023, Daniel P. Smith wrote:
>       >       >>> On 7/1/23 11:13, Luca Fancellu wrote:
>       >       >>>>> On 1 Jul 2023, at 08:53, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>       >       >>>>>
>       >       >>>>> On 30/06/2023 10:12 am, Luca Fancellu wrote:
>       >       >>>>>> The "dom0less" feature was intended to be the feature where a domU
>       >       >>>>>> domain could be launched without the control domain (Dom0)
>       >       >>>>>> intervention, however the name seems to suggest that Dom0 cannot
>       >       >>>>>> be part of the configuration, while instead it's a possible use case.
>       >       >>>>>>
>       >       >>>>>> To avoid that, rename the "dom0less" configuration with the name
>       >       >>>>>> "hyperlaunch", that is less misleading.
>       >       >>>>>>
>       >       >>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>       >       >>>>>> ---
>       >       >>>>>> This is an RFC to get the feeling of the community about the name
>       >       >>>>>> change, for now it's everything in one patch just to see how it
>       >       >>>>>> will look like, if there is interest on proceeding into it, I can
>       >       >>>>>> split in more commit.
>       >       >>>>>
>       >       >>>>> Have you discussed this with Dan and Chris at all?  You haven't even
>       >       >>>>> CC'd them.
>       >       >>>>
>       >       >>>> No, this rename idea started from a chat during the summit, anyway Julien
>       >       >>>> promptly add them to the CC, because I forgot.
>       >       >>>
>       >       >>> No worries and thank you for considering and taking the time to do this RFC.
>       >       >>> It is greatly appreciated that there is a strong willingness to have dom0less
>       >       >>> and hyperlaunch merged.
>       >       >>>
>       >       >>>>>
>       >       >>>>> While there is a lot of end-goal in common between the dom0less and
>       >       >>>>> hyperlaunch, and that the name dom0less is deeply misleading,
>       >       >>>>> hyperlaunch is specifically not this.
>       >       >>>>
>       >       >>>> Yes Hyperlaunch is more than this, however as I said, with this RFC I would
>       >       >>>> like
>       >       >>>> to ear opinions, @Daniel @Christopher could it be a proper name for the
>       >       >>>> dom0less
>       >       >>>> feature?
>       >       >>>
>       >       >>> As Andy has alluded, hyperlaunch is meant to provide a flexible means to
>       >       >>> handle domain construction at boot to meet a wide range of possible use cases.
>       >       >>> One of those use cases is dom0less, so yes, ultimately what dom0less does
>       >       >>> today will be achievable under hyperlaunch. Our intended approach to align the
>       >       >>> two implementations is one that is meant to be minimally disruptive, since
>       >       >>> dom0less is considered a supported (SUPPORT.md) capability. As mentioned, we
>       >       >>> are greatly appreciative to the openness to adopt the name,
>       >       >>
>       >       >> Thanks Daniel!
>       >       >>
>       >       >>
>       >       >>> but a big concern
>       >       >>> I personally have is the confusion it could cause a general user. A blanket
>       >       >>> rename would end up with two documents in the docs tree that provide two
>       >       >>> different explanations of hyperlaunch and two different device tree
>       >       >>> definitions. So I think a more measured approach should be considered here.
>       >       >>>
>       >       >>>> If this patch makes things more difficult for the Hyperlunch serie, I’m ok
>       >       >>>> to drop it,
>       >       >>>> my only aim was just to find a less misleading name for the feature.
>       >       >>>
>       >       >>> What I would like to suggest as a good first step would be an update to the
>       >       >>> dom0less document. Provide a note at the beginning that points to the
>       >       >>> hyperlaunch design doc as a more general approach that will eventually subsume
>       >       >>> dom0less. This would provide a gentler transition for exist users of dom0less.
>       >       >>>
>       >       >>> If it is not too much, I would also ask, please have a look at the design for
>       >       >>> boot modules in the series Christopher just posted. The design pulls from the
>       >       >>> work done by dom0less and expanded upon it. I major step into merging the two
>       >       >>> capabilities will be to have a common set of structures. Once those are in
>       >       >>> place, we can move to a common device tree representation, and at that point
>       >       >>> we would be fairly close, if not at the point of a formal merger of between
>       >       >>> the two.
>       >       >>
>       >       >> At the moment we have a concrete problem with explaining dom0less and
>       >       >> hyperlaunch to potential new users. Using two different names for a
>       >       >> similar feature on arm and x86 causes confusion. It is hurting Xen as a
>       >       >> solution. Personally I already had to switch to use the word
>       >       >> "hyperlaunch" for everything in my users-facing presentations.
>       >       >>
>       >       >> At the summit, we discussed that it would be a good idea to use a single
>       >       >> name to refer to both features on arm and x86. Given that "dom0less"
>       >       >> causes additional issues because it makes people think that there is no
>       >       >> Dom0, the suggestion was to use "hyperlaunch" to refer to both features.
>       >       >>
>       >       >> We don't need to 100% align the two implementations and data structures.
>       >       >> This is not for engineers that are going to look at the specifications
>       >       >> and improve them. This is for users/customers of Xen that are trying to
>       >       >> understand what the hypervisor enables them to do. We need to be able to
>       >       >> show users architecture slides with the same name and explanation on
>       >       >> both ARM and x86.
>       >       >>
>       >       >> I am sure that Daniel and Christopher remember, but for the others on
>       >       >> this email thread, the name "hyperlaunch" was born exactly to be that:
>       >       >> the one name to cover both features on ARM and x86 even if they have a
>       >       >> different implementation. Appended an old email for reference.
>       >       >>
>       >       >> Also I agree with Daniel that we need to be careful about the two docs
>       >       >> under docs/. I think he is right we need to add a paragraph explaining
>       >       >> the history and a pointer to the other document. Something like:
>       >       >>
>       >       >> "Dom0less is the name that was used when initially introducing the
>       >       >> feature on ARM. Then, the "dom0less" name was retired in favor of
>       >       >> "hyperlaunch" to avoid confusion (a Dom0 might still be present) and to
>       >       >> align with x86 (where a similar feature was called hyperlaunch from the
>       >       >> start)."
>       >       >
>       >       > I’m fully ok to add a section like this pointing to the Hyperlaunch design.
>       >
>       >       _If_ this text is added, please include links/references to the Hyperlaunch wiki page and Hyperlaunch design docs.
>       >
>       >       > @Daniel and @Christopher would it be ok for you or the changes in the serie
>       >       > are going to be problematic for your future work? In the end it’s just a mechanical
>       >       > rename, so I guess we just need to agree on naming conventions.
>       >
>       >       Please see the history of trademark litigation about the use of symbolic names to reference similar-but-different
>       artifacts. 
>       >       It is much easier to use the same name to refer to entirely different objects. Historically, confusion arises when a
>       name is
>       >       used in similar contexts.
>       >
>       >       There is also versioning.  Could we refer to dom0less as "Hyperlaunch Version -1"?
>       >
>       >       How about renaming dom0less to "Hyperlaunch Lite"?
>       >
>       >
>       > Perhaps it would be helpful if you could explain more clearly your concerns.  I take it that you want a name which can be
>       used specifically
>       > to indicate the full "domB measured boot" functionality that was Daniel and Christopher's original goal, and that you're
>       afraid that using
>       > plain "Hyperlaunch" for only the "start VMs from Xen on boot" functionality will dilute that?
>       >
>       > The "start VMs from Xen on boot" functionality is the *only* thing that a big chunk of the users of this functionality want; 
>       referring to
>       > it as "Hyperlaunch Lite" or "Hyperlaunch -1" will undermine the value of the functionality.
>       >
>       > What if we use "Measured Hyperlaunch", or "Hyperlaunch Measured Boot" to refer to the full measured boot functionality?
> 
>       I think this is the best way.
> 
> 
>       > Or, "Hyperlaunch DT" for "Booting VMs from Xen using Device Tree" (without the involvement of a domB), "Hyperlaunch Boot
>       Domain /
>       > Hyperlaunch domB" for a more general "domB" functionality, and "Hyperlaunch Measured Boot" for the full functionality
>       (assuming there's
>       > more to this than simply having a domB involved)?
> 
> 
>       We need an overarching name to cover the feature "start VMs from Xen on
>       boot" on both ARM and x86. From my understanding and from the original
>       emails on the subject, the name "hyperlaunch" was it.
> 
> 
> Sure; but think "guitar" vs "acoustic guitar" vs "electric guitar".  "Electric guitar" is new, "guitar" covers them both, but you sometimes
> need a way to specify "acoustic".  Right now target configurations we're talking about include:
> 
> 1. Booting all your domains directly from Xen using DT configurations
> 2. Booting a domB, which then executes some more complicated programmatic configuration to launch VMs before disappearing
> 3. Doing full measured boot on the whole system using a domB.
> 
> If "Hyperlaunch" means 1-3, we not only need a way to specify that you're talking about 3, but *also* a way to specify that you're talking
> about 1.  In the vast majority of cases for the foreseeable future are going to be 1.  Additionally, we want to make sure that
> "Hyperlaunch" *actually* turns out to mean 1-3, and not just 1.
> 
> The thing I like about "Hyperlaunch DT" is that to me it sounds pretty cool but also is very descriptive: I haven't talked to people
> building these systems, but it seems like saying, "The hypervisor launches VMs based on a Device Tree passed to it at boot" will be
> immediately understood, and stick in people's minds.
> 
> So maybe informally, or in "short usage" use "Hyperlaunch", but in documentation or reference systems, when talking specifically about #1,
> try to use "Hyperlaunch DT", just to reinforce the idea that there's more to Hyperlaunch that's coming down the road?

"Hyperlaunch DT" would refer to both the x86 and ARM implementations
because they are both based on DT.

I think it is better than "Hyperlaunch Lite" but I am not a fan of
either of these two names because "DT" and "Lite" get easily lost in
presentations and discussions. For the next few years many will talk
about HyperLaunch just to refer to what is Dom0less today. So if the
goal when we say "HyperLaunch" is to bring Measure Boot or XSM to
people's minds, I don't think this will work well.

If we want to keep "Hyperlaunch" to mean 1-3 above, highlighting Measure
Boot or XSM, then I think we should consider using "Dom0less" for 1.
Yes, it is misleding, but at least it is unique, and a google search for
"dom0less" leads the user to the right results.

If we do that, we should rename "Hyperlaunch" with "Dom0less" in
docs/designs/launch/hyperlaunch.rst. That's because "Hyperlaunch" is
defined as "the ability of a hypervisor to construct and start one or
more virtual machines at system launch in a specific way", which falls
under Dom0less in this discussion.

In my opinion, it is better to have specific names for specific
features. So I would use "HyperLaunch" to mean "the ability of a
hypervisor to construct and start one or more virtual machines at system
launch in a specific way" as it is defined today.

When we add Measure Boot or XSM or other security/safety features, I
would call them out specifically. For instance, "HyperLaunch with XSM".
It is more descriptive and highlights each feature.

Note that at AMD we'll need HyperLaunch without an all-powerful Dom0,
probably with XSM. So I am not writing this because I don't think the
other features 2-3 are not important. They definitely are important.
--8323329-1226463232-1688675744=:761183--

