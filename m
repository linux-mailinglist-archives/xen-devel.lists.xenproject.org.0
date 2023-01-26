Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EF567D4C0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 19:55:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485196.752234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL7Oi-0004N3-VZ; Thu, 26 Jan 2023 18:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485196.752234; Thu, 26 Jan 2023 18:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL7Oi-0004Ke-SN; Thu, 26 Jan 2023 18:54:56 +0000
Received: by outflank-mailman (input) for mailman id 485196;
 Thu, 26 Jan 2023 18:54:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wwAt=5X=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1pL7Oh-0004KY-EA
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 18:54:55 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9d06e1c-9daa-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 19:54:51 +0100 (CET)
Received: from BN9PR03CA0289.namprd03.prod.outlook.com (2603:10b6:408:f5::24)
 by CH3PR12MB7524.namprd12.prod.outlook.com (2603:10b6:610:146::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 18:54:46 +0000
Received: from BL02EPF000108EB.namprd05.prod.outlook.com
 (2603:10b6:408:f5:cafe::65) by BN9PR03CA0289.outlook.office365.com
 (2603:10b6:408:f5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:54:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108EB.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.12 via Frontend Transport; Thu, 26 Jan 2023 18:54:44 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 26 Jan
 2023 12:54:43 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 26 Jan
 2023 10:54:43 -0800
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34 via Frontend Transport; Thu, 26 Jan 2023 12:54:42 -0600
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
X-Inumbo-ID: e9d06e1c-9daa-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbNrToVVlYJj+3qov2aM8Y6IRBnjJdbGDc2QVEGT5DRpx4uij/qkFC/MCUB8yFQk8awTTBDDh/eI23JlkHE/ypsabPBV1BmhU180i6qZE/4r6gL9CLMmNQoCeOH2YBsjyeR8kN1ZsHU+lgGqGcbcIxpOOpjNzQwK45gEkrVNXcJvoi0MFxuqnyv5ZDetqzfbMC09K1srl5gR/bwp6cTYXie8m/7j8IGb8LxFDKXYIujP38AVF4UdUn+dmHdgy4B3lISzp/FXXbXYNF1gfnMOqT3SG8mvsXb9EZFKPOVdV0tcyf+BykMFEEXT4SJIxCY5AoPB/+KMYEEop/DEVzSlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnhVOI7/C6P07l70YzzpuToHV64j2v2n4IaKG41cFJQ=;
 b=CHYNrjyWs40cG2fj9hSKhZmUp/T4BqPyIFUJ86AUIDGjg1z9HrQyUzRGnCuQss6tOwQ5gaqdrV2cVyX6kH+/eW0/AnR5yn8KhbCMaK8o+93daEr4dR8e8mtp62oeywkykfEh79wzAIpy0qfJMfVPPe5on7pn1gK5hLLv2WLAZX8p9E4NAhfmJqxWz5cc4Wj8/yIazaZGHM/4u5MKS6eByXMPlZNt+NFzebkVNCZ88H4F+kNu3Q5sA9yY2h8nSwOAaqNTX9UTDgEbsxPHWuQsB4h615PsejyOahECFWJQGBjRwTOclt9Epdm83iys9q6V/3cF96wcNuotU3/2pCvtAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnhVOI7/C6P07l70YzzpuToHV64j2v2n4IaKG41cFJQ=;
 b=1wPgeLYe3NsgO2WaN4viyvTs0ZgTFg4L5iAFPZDamyr4pxeQBMahpjqkAVbEjmijaousoMWtjap7wSQLIyp3H6bhFC+pWBSeN+e578oSN5i6zAdifr8nB5SM+tVcrupBAuTX3JvCRmrPUEjc1QeBzdlEWmkQTIbUoKQOChfWE1A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Thu, 26 Jan 2023 10:54:42 -0800
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <george.dunlap@citrix.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<Bertrand.Marquis@arm.com>, <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Add more rules to docs/misra/rules.rst
In-Reply-To: <5a3ef92e-281f-e337-1a3e-aa4c6825d964@suse.com>
Message-ID: <alpine.DEB.2.22.394.2301261041440.1978264@ubuntu-linux-20-04-desktop>
References: <20230125205735.2662514-1-sstabellini@kernel.org> <9d536cec-726d-4a39-da36-ecc19d35d420@suse.com> <alpine.DEB.2.22.394.2301260749150.1978264@ubuntu-linux-20-04-desktop> <5a3ef92e-281f-e337-1a3e-aa4c6825d964@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108EB:EE_|CH3PR12MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: e8543448-d0bd-45c0-a264-08daffcec9f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KbvNoquGxB/zqqRGnocSVGhkQaaujDHO25tFpkUHRenZ2s7vENBnN2BYTg3qHyKPaSshECEuSprtwkQlAWJ4x5EgSaPiLdBB+bkRZJJ6CFeqqFvMjlasOY7uQMySdcfUzLQ/U+NWgI+9Cu6qWMv1W3dU/y0ugj+omaS8npVLnnCX8UClFa0PzwX0URANz3I2LmNoaQaSPPJbNf0QvsD6oF0NzYx3Ni+gZSyuBCSLvZPDRsxfc0xOiuimT9QU7CR/0M1zrifX88w21osjJ9h2Jew+gB11DKWMocegMlpOr+I61HOohBOUPQ5tzBgo0IeelGlKd8bBRpTPqXvpiMQXP0POciecfTLnGyLmaQ/hZClDPOhO/tTCGlOE0/gKU7imCyaEtTpryljORkrW6WVz+NKnHl+KaLcXMoWZJpWNBeSVSrK8GPCYB6BaeR1d/c1GU8iioTu1CZk5+a96OBr5qjEo71zfVzxotm3cMiyntdtSpNPTreY1S/ntuZIadDWCVIamyxJzd7fOyNaE6zJpYc+DyBCgC7iEk8SPr0TgfsTT6nHUpSuSZgq5PeAD7cYH7F9wujIK8bTBSfAQ57mlM76eduT9/ea7z76AOZP9Kwp5BDIlBzjSEDuNl2NVjxM3iFsXlU+RGei1e95823+EOMQQC7mEMTSQcx9hyC8UOPgiPPeCma+GbvbwZ7zeL52gDW+ILOc5LDl3DF5TfJrq7FtG8Avl9cFVKI6ns9J/ZNQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(7916004)(39860400002)(396003)(376002)(136003)(346002)(451199018)(46966006)(36840700001)(40470700004)(6916009)(41300700001)(8936002)(5660300002)(44832011)(2906002)(33716001)(82310400005)(66899018)(40460700003)(40480700001)(356005)(8676002)(4326008)(54906003)(70586007)(478600001)(36860700001)(47076005)(81166007)(82740400003)(86362001)(70206006)(83380400001)(316002)(186003)(426003)(53546011)(336012)(26005)(9686003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:54:44.2541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8543448-d0bd-45c0-a264-08daffcec9f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000108EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7524

On Thu, 26 Jan 2023, Jan Beulich wrote:
> On 26.01.2023 16:59, Stefano Stabellini wrote:
> > On Thu, 26 Jan 2023, Jan Beulich wrote:
> >> On 25.01.2023 21:57, Stefano Stabellini wrote:
> >>> From: Stefano Stabellini <stefano.stabellini@amd.com>
> >>>
> >>> As agreed during the last MISRA C discussion, I am adding the following
> >>> MISRA C rules: 7.1, 7.3, 18.3.
> >>>
> >>> I am also adding 13.1 and 18.2 that were "agreed pending an analysis on
> >>> the amount of violations".
> >>>
> >>> In the case of 13.1 there are zero violations reported by cppcheck.
> >>>
> >>> In the case of 18.2, there are zero violations reported by cppcheck
> >>> after deviating the linker symbols, as discussed.
> >>
> >> I find this suspicious.
> > 
> > Hi Jan, you are right to be suspicious about 18.2 :-)  cppcheck is
> > clearly not doing a great job at finding violations. Here is the full
> > picture:
> > 
> > - cppcheck finds 3 violations, obviously related to linker symbols
> > specifically common/version.c:xen_build_init and
> > xen/lib/ctors.c:init_constructors
> > 
> > - Coverity finds 9 violations, not sure which ones
> > 
> > - Eclair finds 56 total on x86. Eclair is always the strictest of the
> >   three tools and is flagging:
> >   - the usage of the guest_mode macro in x86/traps.c and other places
> >   - the usage of the NEED_OP/NEED_IP macros in common/lzo.c
> >   the remaining violations should be less than 10
> > 
> > 
> >> See e.g. ((pg) - frame_table) expressions both Arm
> >> and x86 have. frame_table is neither a linker generated symbol, nor does
> >> it represent something that the compiler (or static analysis tools) would
> >> recognized as an "object". Still, the entire frame table of course
> >> effectively is an object (array), yet there's no way for any tool to
> >> actually recognize the array dimension.
> > 
> > I used cppcheck in my original email because it is the only tool today
> > where I can add a deviation as an in-code comment, re-run the scan,
> > and what happens (see the number of violations go down.)
> > 
> > However also considering that Coverity reports less than 10, and Eclair
> > reports more but due to only 2-3 macros, I think 18.2 should be
> > manageable.
> 
> That's not the conclusion I would draw. If none of the three finds what
> ought to be found, I'm not convinced this can be considered "manageable".
> Subsequent tool improvements may change the picture quite unexpectedly.

Keep in mind that there is always the possibility that a new version of
the tool will detect more violations. In that case, we'll have the
choice whether:
- to fix/deviate them
- not to upgrade the tool
- to skip checking this specific rule with the specific tool in question


So let me make a concrete example based on cppcheck, given that is the
one we understand better from an integration point of view. Let's say
that tomorrow we introduce a gitlab-ci job that automatically scans
xen.git using cppcheck and docs/misra/rules.rst. The job fails when it
detects *new* violations. All is good for now.

Then one day we upgrade cppcheck to a new version. The new cppcheck
version detects way more violations. We have a few options:
- hold back the upgrade in gitlab-ci until we fix more violations or
  deviate them
- keep the rule in docs/misra/rules.rst but skip checking for the rule
  in gitlab-ci using the mechanism introduced by Luca, and upgrade
  cppcheck
- remove the rule from docs/misra/rules.rst, and upgrade cppcheck


We have ways to deal with this situation well. I think the decision
whether to add a rule to docs/misra/rules.rst should be primarily based
on whether the rule makes sense for Xen. And of course it also makes
sense to have a look at the number of violations because having a rule
in docs/misra/rules.rst that no tool can scan properly, or with
thousands of violations, is not useful.

Coming back to 18.2: it makes sense for Xen and the scanners today work
well with this rule, so I think we are fine.

(In retrospect we should have thought twice before adding 20.7 given all
the troubles that the rule is giving us with the scanners. We are
learning. There is still the option of removing 20.7, we can discuss in
the next meeting.)

