Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409FB67ED92
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 19:33:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485853.753276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLTXY-0002IG-4c; Fri, 27 Jan 2023 18:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485853.753276; Fri, 27 Jan 2023 18:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLTXY-0002Ev-1R; Fri, 27 Jan 2023 18:33:32 +0000
Received: by outflank-mailman (input) for mailman id 485853;
 Fri, 27 Jan 2023 18:33:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/4q=5Y=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1pLTXW-0002Ef-Fs
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 18:33:30 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2071.outbound.protection.outlook.com [40.107.95.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16aa28f3-9e71-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 19:33:28 +0100 (CET)
Received: from BN9PR03CA0583.namprd03.prod.outlook.com (2603:10b6:408:10d::18)
 by DM6PR12MB4138.namprd12.prod.outlook.com (2603:10b6:5:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Fri, 27 Jan
 2023 18:33:25 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::ce) by BN9PR03CA0583.outlook.office365.com
 (2603:10b6:408:10d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Fri, 27 Jan 2023 18:33:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.25 via Frontend Transport; Fri, 27 Jan 2023 18:33:24 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 12:33:24 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 10:33:23 -0800
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34 via Frontend Transport; Fri, 27 Jan 2023 12:33:23 -0600
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
X-Inumbo-ID: 16aa28f3-9e71-11ed-a5d9-ddcf98b90cbd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDpTCARloKEXYb1a1fNoeDgoyBwc2SLNXt5VgNHvEAx9oL0MOx1Gw55Qgcy57zbTP/thOu3Z38D4gfPTsR2wyTjI6l6sTmzpuxBSYoERHL0LV4qJ7Kq66BlZx8olK6guaOgMiCdOzYWh/E7bCPTNY7JMMafT12jNor12Lix0HuRZN9lVqKcvSFKBFsDeqLGX9BpxoBaQdqr20S2rQXr1PSmZih7yOe7s8Hq7SPHqbNfs8jSpBohsREVP6TrxfNpV0xfJjglqVPewo0IWnrApYRdedfsZHkna90a0i12fYaGmimodOXSJSnNp2Flp6CjmFsi9/dXipcpH6NYQISbXww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUeS2AzeEXhqUIkTnSCzDW1sKcFG5DEArAfKABQ9hws=;
 b=MqwGRqLkJNXdmlUS/ryWYQJhTx4uuKSnU6Hb2gqmCcS+24WTYaj/iRUqn4A+hThkBJMZAs7p57qIYG4bwjvkWjLMdXtlF+/hSmfLPVajYsAPSbTCw3RAUz7+9ttaannEPAyBeeEadPW66f1xAV5piQqP+PVvSuLuMm03YZ3LhPq8fqEzpxwKDF392MejEok3ofncd7TT7ldQ87E3d5WJ+sqsb3vZAiMQiuF3FAb1yI+mpWC+BQ5QrQ51GdqOQS0+aYxg7ExClQt69Zegz1cTBdJfdUudAVg68gCZoyy1Bp10NPAolOIkuCAQldOYKxQ0BAnVs92pOHaCLxW7einXpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUeS2AzeEXhqUIkTnSCzDW1sKcFG5DEArAfKABQ9hws=;
 b=IJRZ8Y+TT60chdr/ti9uL3hX5BG9j/f/zwAbFBxNc1SfI1eunnWGAt6BXk/3luPXTZvUtYQmzwnt8tppuxZXWJHjaoiXfLQg7tirp8Qt867JbFiOlHtfRQ8ALgb/35m9R75rr6NxVlWVpxEQFbDPOe1p+fPUS8MCUDgWx6itwDU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Fri, 27 Jan 2023 10:33:22 -0800
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <george.dunlap@citrix.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<Bertrand.Marquis@arm.com>, <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Add more rules to docs/misra/rules.rst
In-Reply-To: <db97da84-5f23-e7ed-119b-74aed02fb573@suse.com>
Message-ID: <alpine.DEB.2.22.394.2301271016360.1978264@ubuntu-linux-20-04-desktop>
References: <20230125205735.2662514-1-sstabellini@kernel.org> <9d536cec-726d-4a39-da36-ecc19d35d420@suse.com> <alpine.DEB.2.22.394.2301260749150.1978264@ubuntu-linux-20-04-desktop> <5a3ef92e-281f-e337-1a3e-aa4c6825d964@suse.com>
 <alpine.DEB.2.22.394.2301261041440.1978264@ubuntu-linux-20-04-desktop> <db97da84-5f23-e7ed-119b-74aed02fb573@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|DM6PR12MB4138:EE_
X-MS-Office365-Filtering-Correlation-Id: 09be02f5-a381-4cef-bbe6-08db0094f99c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+H4ASlV/jbPqETH5kqgAHRzcDUStq5v2kqwk/FO8m/4H1+xWt1pPQpp7kSXvNS2z5kgrF11kXzGXV4ETI9CKnV8bCUgqhA0IeN040+49DdHqaVTTwaWZixu9UDuE/5E3iWP0MXZL4M1F2OhchMJiMEvFtKXab6FXzd+pUZHaG56neSlb09M9+H3txX51zzDMolW235PxlWGAIAe9/TnHDPtRwAt7U8tPho9VD/lIa0/nfTOjydF9YZFn0lAjgpkLNrrv7XV935Q87UaK39BC0ekwUHLRRjiJQrpGMLajVasEue21J1OYy38bH1+72V82oF+rkP+TW7pAPXtbbex7IpMzkuIWZjkPWs4l4d+Y2tGW2zInLS1sf0XWdKYRMpJDuXud3PfPYypad2gGQdhQHPX0WwXdySVopURd/qnMEnJu4EkLxM2RCkswp870y7KhJ/NlbTzXGm8EzTVmC1qqWb+IdRliebmeIMLO/DomoVYDNjCEmpeGoYiaSMkEHxb09DTyDqoQyoznHyIMSV4cs4DF+nnRpszmKL+dl9KkfQaXhpGoIrlfh6j4Pb8R5sRdlgJnKEBgFpLgrB/bHTbuZxdRHosXTnQbcJxyOAByXCIKGRU31VAlF9hcwzIdJRkoUmr6HDmgidFtWJs7zDrOTrMajLZdR8mAlIsceyzJH+AtDeYuixZZqdWKleyNx9Tj1nn/UcOVX8RotzCMeQDbEFmVgwuPTaIRWA04Jo+5SIY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(7916004)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199018)(46966006)(40470700004)(36840700001)(336012)(426003)(83380400001)(356005)(186003)(81166007)(53546011)(82740400003)(36860700001)(9686003)(33716001)(82310400005)(2906002)(47076005)(26005)(40480700001)(40460700003)(54906003)(316002)(8676002)(478600001)(4326008)(5660300002)(44832011)(6916009)(41300700001)(70206006)(70586007)(8936002)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 18:33:24.5702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09be02f5-a381-4cef-bbe6-08db0094f99c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4138

On Fri, 27 Jan 2023, Jan Beulich wrote:
> On 26.01.2023 19:54, Stefano Stabellini wrote:
> > Coming back to 18.2: it makes sense for Xen and the scanners today work
> > well with this rule, so I think we are fine.
> 
> I disagree. 

OK. I'll resend this patch, removing 18.2. I'll mark it appropriately in
the sheet as well.


> Looking back at the sheet, it says "rule already followed by
> the community in most cases" which I assume was based on there being
> only very few violations that are presently reported. Now we've found
> the frame_table[] issue, I'm inclined to say that the statement was put
> there by mistake (due to that oversight).

cppcheck is unable to find violations; we know cppcheck has limitations
and that's OK.

Eclair is excellent and finds violations (including the frame_table[]
issue you mentioned), but currently it doesn't read configs from xen.git
and we cannot run a test to see if adding a couple of deviations for 2
macros removes most of the violations. If we want to use Eclair as a
reference (could be a good idea) then I think we need a better
integration. I'll talk to Roberto and see if we can arrange something
better.

I am writing this with the assumption that if I could show that, as an
example, adding 2 deviations reduces the Eclair violations down to less
than 10, then we could adopt the rule. Do you think that would be
acceptable in your opinion, as a process?

