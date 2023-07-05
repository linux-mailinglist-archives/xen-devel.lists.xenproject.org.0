Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD22E7490E1
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 00:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559513.874538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHAlV-0002ea-3g; Wed, 05 Jul 2023 22:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559513.874538; Wed, 05 Jul 2023 22:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHAlU-0002cv-WB; Wed, 05 Jul 2023 22:14:25 +0000
Received: by outflank-mailman (input) for mailman id 559513;
 Wed, 05 Jul 2023 22:14:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NcX8=CX=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1qHAlS-0002cp-Hg
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 22:14:22 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4834a5f2-1b81-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 00:14:18 +0200 (CEST)
Received: from BN6PR17CA0028.namprd17.prod.outlook.com (2603:10b6:405:75::17)
 by DS7PR12MB8276.namprd12.prod.outlook.com (2603:10b6:8:da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 22:14:14 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::c6) by BN6PR17CA0028.outlook.office365.com
 (2603:10b6:405:75::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 22:14:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Wed, 5 Jul 2023 22:14:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 5 Jul
 2023 17:14:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 5 Jul
 2023 17:14:13 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 5 Jul 2023 17:14:12 -0500
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
X-Inumbo-ID: 4834a5f2-1b81-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+W0Kb2ficp/VBipOmN4sUeTKOgaPr4WhKKW524UbdO3IM4u1QBIl9KcrPpH5Q7xzC+lCR33xGFKxUm65QgdAABuKC+g+ujiWKh563O+FHtPFDn70/b4sSOpBawcGEW4ooKILmF92d2KT/xjwhJDbms7TIUZploU8HOPrpUwxPoAk2yCo+5utnR0KZ6BukYBegAg8SlHosDwmsu2o0r4l9Qnt4J5KbDPiXkBC4eAc3/RSLRC5J35y0ptBgpwnOXCBmowZ2DzofPrWQWmweYyLn8v31jSneEpw9dewCBFoKaefgmL3M/2cDMZkKirJmoZ0eaA+rb07S4m2o8IsimI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGs2kJ4CAC7LFFl5DmSHfm2IFp4VYEn02qim9W/36LA=;
 b=P824jKKAscIcWNHSDcc18Ha3/w3bHtbPg/xNjJOksRq9y2V7Dp+L6LtS0E0UuCBP6nMiCsAln4yfe1KelaoDiq5COa+3RZxAOFebx7QHKsK5Rm1FZwYq2isPbl7k0HD2s0LQZXTEyfhoK7PHPij1d6Ya1sRrQ0aactmYZV1xGUbEBj47lqy/I11dCRmXI2GDwX4s20gMBUR+l9qf4UGsnrrEBnIw6Ad7LIc/eR5czmZxf8LQuKj2+sbWIKizrzYt+6cBFVrDCS/uUCkWsQ03l7MWrkpoH6HYN8iplO6oAPSiI4CtTA45eiVtpXIs8E+CtngmMCNs/LUHqmnA/khedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGs2kJ4CAC7LFFl5DmSHfm2IFp4VYEn02qim9W/36LA=;
 b=A1TbHy91Hf3iTEl9NPnvJDF3W3gQWU6uelYYzpvbcCTVAayCcnD0u23bpXGNla3miu84YB83WzvfBRmm8Kwvr60esDmce8ep+lhWwur2vSzF8zPYDd1JgSCqZXUftolDq67p62WzmwJFOKebcgARHSOCDMtpppPYF4DDXE7XSpc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Wed, 5 Jul 2023 15:14:11 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <george.dunlap@cloud.com>
CC: P S <pairspace@gmail.com>, Luca Fancellu <luca.fancellu@arm.com>, "Stefano
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
In-Reply-To: <CA+zSX=Y3_g_aq4+sDK7CuZajywVqQ4xOrq7hKZ80eUT3uSxzuQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307051436120.761183@ubuntu-linux-20-04-desktop>
References: <8601CDD7-87F7-4FD0-A6E6-BAEAB12E7956@arm.com> <234199F8-DBB1-42B6-9A4C-8800EEF60997@gmail.com> <CA+zSX=Y3_g_aq4+sDK7CuZajywVqQ4xOrq7hKZ80eUT3uSxzuQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-1866474564-1688593430=:761183"
Content-ID: <alpine.DEB.2.22.394.2307051444270.761183@ubuntu-linux-20-04-desktop>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT011:EE_|DS7PR12MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: 14bda639-a9cf-4c10-328a-08db7da52ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	odXU4HITXQVuy54+wCvIfWnDkoUuriICk4vtZmDX/ViIkjsBPs+/e09ShOLZNhlebD07pvZ/8n3hIprvZUKkjnT5bCsoHNeb9Z2dGdK9AUvO52NX81RVX5xL1EpHvr3ne2LrBTAYb25XkvgzvRavCFImzRoyx16HG63nnMoCoYc6OPpVv23+dPBAd346klQTfb/gLpxKWGrO3ponlsdxmO4KiBB94KNACd84IuSS7k7ee2C9JXOfYComptGkYuQd8nrpOnIhKzRlZTVgnsdrDlDEoQu1gDPtg/2ejbxioB12kDLHslWF1NwJx3IHpZEP3YgwM082NaVUrdRsjKt0qFstQauY+E/pbCiBnoxTfW2TUXsBLhY//9/40WTyd08Q2d/ehRXuudK+J7vpkTm8eC0Q4qtEyqgE85+CE7qwIvvEZO4RB4JuNVJ93oaJ3enTkVIdF+A7aqzXukN1zIbg8JxWOGnbdrZCe16ZOa3MApvuIJJRlNxmgFwiNeTOJwmVXxWw48F+qytOctffs9CZJS0zKqjcSEWFC0NyMSXNDzHPkJuXdf+6jszuwh/Hw/DOYsTmlaRvebxu7JT/xG+rdOIkAqeZnh0lPDDJyyOnhoP/LS81zdUJYixZ5TCQKGLGBYlY2E3zBttSTH16qgBjC5ImaSznivQ/svPWxMKVG+BqJsyQmauwGm/STm7EgJaFYd0vbXf0gY3MAPBrH76FUbidhNGqzdTpU6CrdIzk25ZGZq6zxDDDSaP/rrolCPZjxiHAIu6kzRl6zrCwxi4HKiasc9NvU3MHr2N1KRtgCY4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(40480700001)(8676002)(2906002)(70206006)(8936002)(5660300002)(53546011)(44832011)(26005)(336012)(7416002)(186003)(70586007)(41300700001)(40460700003)(356005)(81166007)(82740400003)(4326008)(426003)(6916009)(83380400001)(316002)(47076005)(36860700001)(54906003)(478600001)(9686003)(82310400005)(86362001)(33964004)(33716001)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 22:14:14.3493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14bda639-a9cf-4c10-328a-08db7da52ac9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8276

--8323329-1866474564-1688593430=:761183
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2307051444271.761183@ubuntu-linux-20-04-desktop>

On Wed, 5 Jul 2023, George Dunlap wrote:
> On Mon, Jul 3, 2023 at 9:55 PM P S <pairspace@gmail.com> wrote:
>       > On Jul 3, 2023, at 15:45, Luca Fancellu <luca.fancellu@arm.com> wrote:
>       ﻿>
>       >> On 3 Jul 2023, at 18:48, Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >>
>       >>> On Mon, 3 Jul 2023, Daniel P. Smith wrote:
>       >>> On 7/1/23 11:13, Luca Fancellu wrote:
>       >>>>> On 1 Jul 2023, at 08:53, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>       >>>>>
>       >>>>> On 30/06/2023 10:12 am, Luca Fancellu wrote:
>       >>>>>> The "dom0less" feature was intended to be the feature where a domU
>       >>>>>> domain could be launched without the control domain (Dom0)
>       >>>>>> intervention, however the name seems to suggest that Dom0 cannot
>       >>>>>> be part of the configuration, while instead it's a possible use case.
>       >>>>>>
>       >>>>>> To avoid that, rename the "dom0less" configuration with the name
>       >>>>>> "hyperlaunch", that is less misleading.
>       >>>>>>
>       >>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>       >>>>>> ---
>       >>>>>> This is an RFC to get the feeling of the community about the name
>       >>>>>> change, for now it's everything in one patch just to see how it
>       >>>>>> will look like, if there is interest on proceeding into it, I can
>       >>>>>> split in more commit.
>       >>>>>
>       >>>>> Have you discussed this with Dan and Chris at all?  You haven't even
>       >>>>> CC'd them.
>       >>>>
>       >>>> No, this rename idea started from a chat during the summit, anyway Julien
>       >>>> promptly add them to the CC, because I forgot.
>       >>>
>       >>> No worries and thank you for considering and taking the time to do this RFC.
>       >>> It is greatly appreciated that there is a strong willingness to have dom0less
>       >>> and hyperlaunch merged.
>       >>>
>       >>>>>
>       >>>>> While there is a lot of end-goal in common between the dom0less and
>       >>>>> hyperlaunch, and that the name dom0less is deeply misleading,
>       >>>>> hyperlaunch is specifically not this.
>       >>>>
>       >>>> Yes Hyperlaunch is more than this, however as I said, with this RFC I would
>       >>>> like
>       >>>> to ear opinions, @Daniel @Christopher could it be a proper name for the
>       >>>> dom0less
>       >>>> feature?
>       >>>
>       >>> As Andy has alluded, hyperlaunch is meant to provide a flexible means to
>       >>> handle domain construction at boot to meet a wide range of possible use cases.
>       >>> One of those use cases is dom0less, so yes, ultimately what dom0less does
>       >>> today will be achievable under hyperlaunch. Our intended approach to align the
>       >>> two implementations is one that is meant to be minimally disruptive, since
>       >>> dom0less is considered a supported (SUPPORT.md) capability. As mentioned, we
>       >>> are greatly appreciative to the openness to adopt the name,
>       >>
>       >> Thanks Daniel!
>       >>
>       >>
>       >>> but a big concern
>       >>> I personally have is the confusion it could cause a general user. A blanket
>       >>> rename would end up with two documents in the docs tree that provide two
>       >>> different explanations of hyperlaunch and two different device tree
>       >>> definitions. So I think a more measured approach should be considered here.
>       >>>
>       >>>> If this patch makes things more difficult for the Hyperlunch serie, I’m ok
>       >>>> to drop it,
>       >>>> my only aim was just to find a less misleading name for the feature.
>       >>>
>       >>> What I would like to suggest as a good first step would be an update to the
>       >>> dom0less document. Provide a note at the beginning that points to the
>       >>> hyperlaunch design doc as a more general approach that will eventually subsume
>       >>> dom0less. This would provide a gentler transition for exist users of dom0less.
>       >>>
>       >>> If it is not too much, I would also ask, please have a look at the design for
>       >>> boot modules in the series Christopher just posted. The design pulls from the
>       >>> work done by dom0less and expanded upon it. I major step into merging the two
>       >>> capabilities will be to have a common set of structures. Once those are in
>       >>> place, we can move to a common device tree representation, and at that point
>       >>> we would be fairly close, if not at the point of a formal merger of between
>       >>> the two.
>       >>
>       >> At the moment we have a concrete problem with explaining dom0less and
>       >> hyperlaunch to potential new users. Using two different names for a
>       >> similar feature on arm and x86 causes confusion. It is hurting Xen as a
>       >> solution. Personally I already had to switch to use the word
>       >> "hyperlaunch" for everything in my users-facing presentations.
>       >>
>       >> At the summit, we discussed that it would be a good idea to use a single
>       >> name to refer to both features on arm and x86. Given that "dom0less"
>       >> causes additional issues because it makes people think that there is no
>       >> Dom0, the suggestion was to use "hyperlaunch" to refer to both features.
>       >>
>       >> We don't need to 100% align the two implementations and data structures.
>       >> This is not for engineers that are going to look at the specifications
>       >> and improve them. This is for users/customers of Xen that are trying to
>       >> understand what the hypervisor enables them to do. We need to be able to
>       >> show users architecture slides with the same name and explanation on
>       >> both ARM and x86.
>       >>
>       >> I am sure that Daniel and Christopher remember, but for the others on
>       >> this email thread, the name "hyperlaunch" was born exactly to be that:
>       >> the one name to cover both features on ARM and x86 even if they have a
>       >> different implementation. Appended an old email for reference.
>       >>
>       >> Also I agree with Daniel that we need to be careful about the two docs
>       >> under docs/. I think he is right we need to add a paragraph explaining
>       >> the history and a pointer to the other document. Something like:
>       >>
>       >> "Dom0less is the name that was used when initially introducing the
>       >> feature on ARM. Then, the "dom0less" name was retired in favor of
>       >> "hyperlaunch" to avoid confusion (a Dom0 might still be present) and to
>       >> align with x86 (where a similar feature was called hyperlaunch from the
>       >> start)."
>       >
>       > I’m fully ok to add a section like this pointing to the Hyperlaunch design.
> 
>       _If_ this text is added, please include links/references to the Hyperlaunch wiki page and Hyperlaunch design docs.
> 
>       > @Daniel and @Christopher would it be ok for you or the changes in the serie
>       > are going to be problematic for your future work? In the end it’s just a mechanical
>       > rename, so I guess we just need to agree on naming conventions.
> 
>       Please see the history of trademark litigation about the use of symbolic names to reference similar-but-different artifacts. 
>       It is much easier to use the same name to refer to entirely different objects. Historically, confusion arises when a name is
>       used in similar contexts.
> 
>       There is also versioning.  Could we refer to dom0less as "Hyperlaunch Version -1"?
> 
>       How about renaming dom0less to "Hyperlaunch Lite"?
> 
> 
> Perhaps it would be helpful if you could explain more clearly your concerns.  I take it that you want a name which can be used specifically
> to indicate the full "domB measured boot" functionality that was Daniel and Christopher's original goal, and that you're afraid that using
> plain "Hyperlaunch" for only the "start VMs from Xen on boot" functionality will dilute that?
> 
> The "start VMs from Xen on boot" functionality is the *only* thing that a big chunk of the users of this functionality want;  referring to
> it as "Hyperlaunch Lite" or "Hyperlaunch -1" will undermine the value of the functionality.
> 
> What if we use "Measured Hyperlaunch", or "Hyperlaunch Measured Boot" to refer to the full measured boot functionality?

I think this is the best way.


> Or, "Hyperlaunch DT" for "Booting VMs from Xen using Device Tree" (without the involvement of a domB), "Hyperlaunch Boot Domain /
> Hyperlaunch domB" for a more general "domB" functionality, and "Hyperlaunch Measured Boot" for the full functionality (assuming there's
> more to this than simply having a domB involved)?


We need an overarching name to cover the feature "start VMs from Xen on
boot" on both ARM and x86. From my understanding and from the original
emails on the subject, the name "hyperlaunch" was it.

If we want to add extra things on top of "start VMs from Xen on
boot", such as TPM/SecureBoot/etc., I would suggest to call it "Measured
Hyperlaunch" or "Hyperlaunch with Measured Boot".

If you guys feel that we should reserve "Hyperlaunch" for something
else, then we need a new name for the cross-arch feature "start VMs
from Xen on boot".

That is OK, we can come up with another name that has no baggage. Not a
problem. But I don't suggest to go down this route because I think it
will cause confusion as HyperLaunch has both "hyper" and "launch" in its
name that strongly point to "start VMs from Xen on boot". Whatever other
name we could come up for "start VMs from Xen on boot", hyperlaunch will
end up getting confused with it.


We also need a way to distinguish the x86 implementation from the ARM
implementations because there are going to be differences. We'll strive
to align them as much as possible but still we are going to have some
differences in configuration options.

I think we should use "hyperlaunch" as it was intended: the overarching
name to refer to "start VMs from Xen on boot". And we should use
"hyperlaunch x86" and "hyperlaunch ARM" to distiguish between the two
implementations.
--8323329-1866474564-1688593430=:761183--

