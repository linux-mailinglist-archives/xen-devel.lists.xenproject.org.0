Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5DA97729F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 22:16:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797790.1207849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soqDw-00069e-AM; Thu, 12 Sep 2024 20:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797790.1207849; Thu, 12 Sep 2024 20:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soqDw-000689-7d; Thu, 12 Sep 2024 20:15:28 +0000
Received: by outflank-mailman (input) for mailman id 797790;
 Thu, 12 Sep 2024 20:15:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GE2t=QK=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1soqDu-000680-IP
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 20:15:26 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:200a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd69f410-7143-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 22:15:24 +0200 (CEST)
Received: from BL1PR13CA0420.namprd13.prod.outlook.com (2603:10b6:208:2c2::35)
 by SN7PR12MB8003.namprd12.prod.outlook.com (2603:10b6:806:32a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Thu, 12 Sep
 2024 20:15:17 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::ce) by BL1PR13CA0420.outlook.office365.com
 (2603:10b6:208:2c2::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Thu, 12 Sep 2024 20:15:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 12 Sep 2024 20:15:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Sep
 2024 15:15:16 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 15:15:16 -0500
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
X-Inumbo-ID: bd69f410-7143-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnAyN1KZxDLWMrQ/HyvKOT2MPz/+PswiJUIv+jtZCycoOygL0RreCegpKswiWzRM5B9eGeq9ocDqzAcjUwEI6EeNYWZi1jyPTfR1orJpNvJ6FVS+8k3XRhnkNvByDeXpujjH1VuKYNDZEM6woSc0qYTZBWwIvPcjF+eY3FL/sbj3GmgI0hQlLqyEFSgb+UbMa0tLutXegUPfnhRX2YyAOHgDmxlGSohCvzifxHrM2j5tyKGWWSiW7RQGmYE/uVIu7en6Av2heWOJu5DkMG9a9ztZiWyumbOruqr3W/0yyBql1fEWF9s2LGarmp252d1bnY7gD0+qAY0pltGj68sh1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6d05fpu+dkJUAkdhnq2atw/LNc5N3Pfwm3YxamG1k78=;
 b=m/0M71hrka7rRoe1O3YzuWDbshcM/OWcd1YybKHVtovbRmaYWIVc8mlaUdY7ecw2NCW1gmv1ZZ6VmodbiZcsvaCPOMuSVs29kA7GH1AkYk/OajW1CfFWEOWyB3JnaaRBmcvumSMYf+fAWWN+mNQ862c0TiG8SlOFE5WttUIlOfVKI53yikzYmj91OCn8vhJBFSmHntX9GdsnJk+sjehoVyBx7cd3ajVVL6wUHRqtwiqThdp1gl/g6hQCmSmXGMIcaAYQtlkMlj8GSK4ujDrshcKZPe7VBkPJOtbD+g34KgSYt90YYUvOcumqoA/42ZZf2xlOf3uup5NgAY+CFzKHig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6d05fpu+dkJUAkdhnq2atw/LNc5N3Pfwm3YxamG1k78=;
 b=JMyi7aOz/Kq6dAUIhFvhM4cK73JXCcqy2O5lee+r7hdWPD3OaupC8pwPdWV6fCdhixwyJgWDG2ZsoK1ubkOCdUT7TUTHK71ug7YEHmLFT9xB7rguDQEc2uB7TlOe2EvpIcjSzbp0QJlcKE1ZPNeCYjkSkZ6NJRbLemGhzSOucgU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Thu, 12 Sep 2024 13:15:15 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] x86/hvm: make stdvga support optional
In-Reply-To: <86bced04-41ce-4ad4-8af6-48cdd3745908@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409121313490.611587@ubuntu-linux-20-04-desktop>
References: <20240912085709.858052-1-Sergiy_Kibrik@epam.com> <86bced04-41ce-4ad4-8af6-48cdd3745908@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|SN7PR12MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: c28954cb-2891-43f0-5eac-08dcd3679e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yAGGrs3Yt5CJaIPNXR9ikZqVVmSFSSN60D/2QPLlQABqjhqf7J+xZI4bJK11?=
 =?us-ascii?Q?uG/1/D0NxdCxXwcqX5N6aDukhDMN5sFeZ/pr0HmnioK9aDGmUr7OWNwuHwYY?=
 =?us-ascii?Q?eY5VnbwbdtiAkra+wSNz1+m8XfUgfBUDW/yys0XkNLJimOauh0K6umilFyff?=
 =?us-ascii?Q?HL+SIcEzZ2vI9G/v5BOjfNusEqwqi01BTAM4gVds9moDuaQ6Bh8TPkvfARmm?=
 =?us-ascii?Q?eqOoIQXmkNwb66oc8Xhjr/xef+96fwwmMntfg8eNKXwnxO7nwmJ5L7Ai401l?=
 =?us-ascii?Q?wg/ZiMujYiuF+UTwMG/7wV7QFN5dgpQMQOK3qMjiA5/2M+sqW4vLX/6h7vPD?=
 =?us-ascii?Q?KWwe1mRI56fK1KZtIIqZU2jbl/B7v2OBfu/UHRgokCGBFi8oWg5uq2uMA1PR?=
 =?us-ascii?Q?yXPEtKwuB3XB0OuJIlsvMWSGw5/hTVfk1TTfhr9wtGh5bSRDJtQ02lWctfax?=
 =?us-ascii?Q?Ltn2O0GFyDdeWGUP81yUUs+bOktMjWIXGBdeSfTFEQEff9n8sO/zZ8muoJvQ?=
 =?us-ascii?Q?CEFKsiY+ienWbjWEwT4PB+xeJtPw2u7NfplXnnNXMKpnzAMl4kinwybXn7PL?=
 =?us-ascii?Q?ZyHhBsRbg80hcMC0YlloyS/8VCCHX0vRtHQW/SPRbiDdLLKJ+vurzeURHncT?=
 =?us-ascii?Q?ZKE22r9O4jf4YimmES2sF1rAlqr0i3RYMLXqgviW6LenldmV+8opfWepd8Ol?=
 =?us-ascii?Q?c5724P/9JSQZzwmZ9nrhec1XkORO4pA7GtcdGfSxth99qYf/LRcQnfp2lanW?=
 =?us-ascii?Q?f/Ac17hFYOz3ItnabeB40cELeeWv8prSPLYxnTdgW3Ss2bTdNDaxorAWH+R8?=
 =?us-ascii?Q?lpDjvSNiJd4wMllo9jCQyWwGfTnRLM6C45nJ7oJu2kGELYfAuFWEFqJi2vtd?=
 =?us-ascii?Q?YIoxVzXctyR1GpGs0Nc3IH83FDIFI73Wr3ALQBKYmlwmdWXWLR3gOWXVtlSn?=
 =?us-ascii?Q?KzByrY9LfQqPJxjqlI6UEyWifwXGD/mTshJM65V41P6aRqi7Y7wbr4G2vnZx?=
 =?us-ascii?Q?VWVZy281+cfidQTTYxWmDlSiIKWAM8RcutRKMgvQ9Yw8PILkhdlO/AkIy6Rf?=
 =?us-ascii?Q?nTuQEIfruIJ517eyWEN05w3mjeIaqEemFDXQupSMauBA7Y3gTwQPeYdTtaEe?=
 =?us-ascii?Q?xvZuAzf1cpfjHuBCR6cRf1dbciSdwWniAnLtXwL+k/rc/WWDkYsM+Sj85XgK?=
 =?us-ascii?Q?z5Uxm0GOVTEdJmLiCDqULTK8xy8odn22oNnmtba0UlMkDSr0u4N7BZ5AUyIz?=
 =?us-ascii?Q?4kPlqAvlL5KnR82jfaOgDEckJidQCVLDKMQoXQjeGv7uKuMZ4vuDAlVaYu5J?=
 =?us-ascii?Q?ZnCpNx4aUTABslXUxdQ2OAHHE/XIDVyxucYV7u8v3VBlK+clbETI70xwchgb?=
 =?us-ascii?Q?Ynv4ge72+q64hmAjirDFtSKOuDJv5yPIfDx5+IKMUWt8UjGDDdCy8NN/An3J?=
 =?us-ascii?Q?yD+zw2pMiBl6nBOz+qEPv37k+QZf69hY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 20:15:17.0841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c28954cb-2891-43f0-5eac-08dcd3679e5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8003

On Thu, 12 Sep 2024, Jan Beulich wrote:
> On 12.09.2024 10:57, Sergiy Kibrik wrote:
> > Introduce config option X86_STDVGA so that stdvga driver can be disabled on
> > systems that don't need it.
> > 
> > Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Considering what was committed earlier in the day (and what you would have
> seen on the list already before that) - is this really a worthwhile saving
> anymore?

Although it is smaller than before, and it can certainly be said that
there are other bigger areas of concern in terms of code size, it is
still good to make stdvga selectable so that it can be removed when not
needed.

