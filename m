Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F18067D0C1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 17:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485104.752083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL4ep-0001J8-GW; Thu, 26 Jan 2023 15:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485104.752083; Thu, 26 Jan 2023 15:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL4ep-0001Et-Cy; Thu, 26 Jan 2023 15:59:23 +0000
Received: by outflank-mailman (input) for mailman id 485104;
 Thu, 26 Jan 2023 15:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wwAt=5X=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1pL4en-0001En-Vs
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 15:59:22 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63e0e897-9d92-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 16:59:19 +0100 (CET)
Received: from MW4PR03CA0238.namprd03.prod.outlook.com (2603:10b6:303:b9::33)
 by DM4PR12MB6398.namprd12.prod.outlook.com (2603:10b6:8:b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 15:59:16 +0000
Received: from CO1NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::e5) by MW4PR03CA0238.outlook.office365.com
 (2603:10b6:303:b9::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 15:59:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT071.mail.protection.outlook.com (10.13.175.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Thu, 26 Jan 2023 15:59:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 26 Jan
 2023 09:59:14 -0600
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34 via Frontend Transport; Thu, 26 Jan 2023 09:59:13 -0600
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
X-Inumbo-ID: 63e0e897-9d92-11ed-a5d9-ddcf98b90cbd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJAy8u549xO7FSbiHmtv6cGSNfE40BzoVH8yZb3gqVHO/ZKyocfQEr7iXYeJjt4h/HUJmZwYuCvz/l51qjRqpgk3/MZD3EG/zcPTOAXr7wd3b6sXsIPbZyz/DNvN0fG2nemBfYNogMwkPvgVS7/XXMFzIBVzMX0yTiIKm57gXj17R/qu9QX36KPCs7Ikm2fPumM/Dnhk//cjqh9XsfyHEfpakO7J46BOXsmBQSlEq6EVGmsDDPFxTxNpirMzJ381Mt/9kQoMxH/lPV3n5V/qQjQ376uKXQjwl8K2TnEZ7bsst3C9I5pUtkL0yPKpNtB4s9Py1gWELJh/j8RL+IDYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khjpEyDzuKs0srj1SOymkxfPi+62LoBUiSGbPAT6KQI=;
 b=lW2OlqXCJ7EArNoEcsRx8D0chrvDTPODK6+A6JFK/Qb2C598yr9FolJ51kKvZg2wJivZKfdeVV31M22boyXFI7fzfpwm8jrIc4KiS6su+rGTXXD2suZ0yezEnkMDe7N98ojbVN9k7G4lsrtGwTPZjXaNwB0qCm6XdfuinCeqnolPI4zs6CaZtOxTikrEvh8zqrFC5zoLF5AJtb9GwVt+1WALcP6HOHRxVGHIpAW5YWzxKfN7m9x1xdPqnJ5/li/Ro3IuOmkou9KtwHYfadDFxExWyomvGcrZTTf619d5JaAwDpHurGoihFXP/jM9MbXvIfg0sS9D4KnRbiX61eajCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khjpEyDzuKs0srj1SOymkxfPi+62LoBUiSGbPAT6KQI=;
 b=uBlhObuBp9F2zTi5hUty2J8LFx37/ShwVbCavTIxzW5a/1RcxNwBFJAlNdJyMKyqs0uvUcj2/RYSpfY8ALm8XBoAK2Ephs0+WYVpAUVTVbXoowbURG9FpTkpeKQ0NLSbHzFeZHKsYDocd8mSplRUGY8hcHY6pSzDv8oWH6ppy8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Thu, 26 Jan 2023 07:59:08 -0800
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, <george.dunlap@citrix.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<Bertrand.Marquis@arm.com>, <julien@xen.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Add more rules to docs/misra/rules.rst
In-Reply-To: <9d536cec-726d-4a39-da36-ecc19d35d420@suse.com>
Message-ID: <alpine.DEB.2.22.394.2301260749150.1978264@ubuntu-linux-20-04-desktop>
References: <20230125205735.2662514-1-sstabellini@kernel.org> <9d536cec-726d-4a39-da36-ecc19d35d420@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT071:EE_|DM4PR12MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: c01d5663-9fa2-4427-b02d-08daffb64657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1SewCxArtfHH8VvxTuh6pP47ffIUk7XYQye3VJqC4wKDgb56HNG77jDTA9NdcYjV4C4QpgdYVnacMSBZayoQMnM+KG3JtV9LA8pRuDySd/yu7mAOX/8z8qGyzu16RFtJXL5wSWZdDEtzJRVp5RhQjwtMXluwVG8Be09XFa6sgrKisaCpr08mq3LWOcMvOeD+N87J2+5B5wkhwIqsyoAHiMj9/X+Y/1IveIDevZYV78pI+qmnURqDZULU7wRx5oP3PwYLng3WWHNQrliucAqPTWVOrv+aU9wkcV7VP0XBT0xRzWelYHn2e2a0J9jmu65ehSXdl+o5u1Ogp1G3UNbcLsfCzZUf0UUMXJ+9DerwmF5t1lXzmMHY2yI4FRkIkDCkVtOcFCehWit8LY87XR2fii427n31oEVnQWU9NweTuT/Sc7RQj2TrFPYT8YoFPkGnz3C/g6/6wTVZVOQoA31KZPiGhaXwlhVBgFtkB9rp3gOndYwmxnss/4FJE14JtTgfribZR9jfb84XsVOPRodpuCaqJYud0TQHQVLwmG59mHobqcXy5Lft0aoStM0ww2AwcvtoCEl8pEBWJvYP/99nsw+2LijfGJM1S+zBEO3HaLKXbErSc10QE392xJvf/RImddv1OBLNylIoIoyn2c7aGe/jVFNNbS7j+XA1SvX/nYOLpu/eOD/pnjjDwCwnw+FwlUTvVuEcrs4/DIwyh8AhHW/viQmU0bz6Iga0GzQL35s=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(7916004)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(86362001)(426003)(336012)(316002)(47076005)(33716001)(54906003)(9686003)(82310400005)(6666004)(186003)(81166007)(53546011)(83380400001)(478600001)(26005)(44832011)(2906002)(70586007)(70206006)(8676002)(5660300002)(40460700003)(40480700001)(6916009)(356005)(82740400003)(8936002)(41300700001)(36860700001)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 15:59:15.3910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c01d5663-9fa2-4427-b02d-08daffb64657
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6398

On Thu, 26 Jan 2023, Jan Beulich wrote:
> On 25.01.2023 21:57, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > As agreed during the last MISRA C discussion, I am adding the following
> > MISRA C rules: 7.1, 7.3, 18.3.
> > 
> > I am also adding 13.1 and 18.2 that were "agreed pending an analysis on
> > the amount of violations".
> > 
> > In the case of 13.1 there are zero violations reported by cppcheck.
> > 
> > In the case of 18.2, there are zero violations reported by cppcheck
> > after deviating the linker symbols, as discussed.
> 
> I find this suspicious.

Hi Jan, you are right to be suspicious about 18.2 :-)  cppcheck is
clearly not doing a great job at finding violations. Here is the full
picture:

- cppcheck finds 3 violations, obviously related to linker symbols
specifically common/version.c:xen_build_init and
xen/lib/ctors.c:init_constructors

- Coverity finds 9 violations, not sure which ones

- Eclair finds 56 total on x86. Eclair is always the strictest of the
  three tools and is flagging:
  - the usage of the guest_mode macro in x86/traps.c and other places
  - the usage of the NEED_OP/NEED_IP macros in common/lzo.c
  the remaining violations should be less than 10


> See e.g. ((pg) - frame_table) expressions both Arm
> and x86 have. frame_table is neither a linker generated symbol, nor does
> it represent something that the compiler (or static analysis tools) would
> recognized as an "object". Still, the entire frame table of course
> effectively is an object (array), yet there's no way for any tool to
> actually recognize the array dimension.

I used cppcheck in my original email because it is the only tool today
where I can add a deviation as an in-code comment, re-run the scan,
and what happens (see the number of violations go down.)

However also considering that Coverity reports less than 10, and Eclair
reports more but due to only 2-3 macros, I think 18.2 should be
manageable.

