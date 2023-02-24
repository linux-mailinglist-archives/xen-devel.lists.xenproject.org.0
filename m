Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9D76A193A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 10:56:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500879.772410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVUoI-0004uK-II; Fri, 24 Feb 2023 09:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500879.772410; Fri, 24 Feb 2023 09:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVUoI-0004ri-Fd; Fri, 24 Feb 2023 09:56:14 +0000
Received: by outflank-mailman (input) for mailman id 500879;
 Fri, 24 Feb 2023 09:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gf2v=6U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pVUoH-0004rc-4z
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 09:56:13 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7739d927-b429-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 10:56:10 +0100 (CET)
Received: from BN9PR03CA0371.namprd03.prod.outlook.com (2603:10b6:408:f7::16)
 by PH8PR12MB7303.namprd12.prod.outlook.com (2603:10b6:510:220::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 09:56:07 +0000
Received: from BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::39) by BN9PR03CA0371.outlook.office365.com
 (2603:10b6:408:f7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24 via Frontend
 Transport; Fri, 24 Feb 2023 09:56:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT115.mail.protection.outlook.com (10.13.177.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6134.24 via Frontend Transport; Fri, 24 Feb 2023 09:56:07 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 24 Feb
 2023 03:56:07 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 24 Feb
 2023 01:56:06 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 24 Feb 2023 03:56:06 -0600
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
X-Inumbo-ID: 7739d927-b429-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvvpUla/Pd9RkuDofcTs2iX6qZNwARIoG0C4v6k2FItQKzBwv04GZR/MsHU9v71G1ytbAj/sIjJc2nZ8euLoI0uA8WWZE2lhsJZ3tqgeNdVP7OglQYtB2VlWnP+Krqe92L1LJl6fnUBBxfz2RdcjGRjGgGgfq2npFWQCSBcJ2CIHZOYAvYQBKETR99VLWL7vlAi97Jc8lhDaL/8pyG2/oZH/Lf9OKhswzQOTdUtwajiiQFTM3ShI440yFh4zoTlV4NMU+NPzYkMrNIybBFITYwyGfuz3i2AqCvvHl4BiDOnyUqo7+tQ9wmLm3Hu6cLQ7ckiXpnhnleKMxn7lJqXhtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JreF+hEZyg+r91C3CKlwJUx0ARm3Xgak1UcofWDJZYE=;
 b=Fw5x/+MTL1n1Bfael1JFPb2hLBnZ316GgDn1vyMIcUEvOH+S0ut1Y27jA0aK24V6Lxv+mU90z9faIsrBwvwmRaAYtcg4ney+PYTf8nFnCSjJcfr7iyD7kC40zn3KFUZoZPADPGmxkPxlgTYfQt1/gAAOfsUyZkaV1zm3kVp1w48ZraDHRUxHEdudF2o3lZJ4iYMCAnWqu9LGZsIFov94XYE+tg8IojJeX4TSFDly+/BfOPDzRbDds9LWjjBRQzDXrwP0BZ4EB/1fWChZ4f3ErKLEZ4EVvtPdPIPv+m7uL2t+oIJkZn/A1Q+4MTv1KRJNmFK3gjVVYBLmLIUEW1Ke5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JreF+hEZyg+r91C3CKlwJUx0ARm3Xgak1UcofWDJZYE=;
 b=rCn3Dl6onqvtXE/D5Pg5M3Z4/2Ht2XRMphTkjWHYSg1t6T57D0o4IjbOxl1gK3e3r9z8fXRF+6tPniw0vejXSXlElHtrTcOiFgSm/L2ntJX3FhLtIf8OAq3jCWNW8w7HJYvJAhYcKAFyHAgaakr17Z+e1tXFaiOX9ASRj4+EvX4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e2bc2d42-7e64-4cb1-dc18-7392dd7d7b3d@amd.com>
Date: Fri, 24 Feb 2023 10:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/3] automation: add binaries/ to artifacts for Yocto
 arm32 job
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <cardoe@cardoe.com>, Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2302171606480.2127160@ubuntu-linux-20-04-desktop>
 <20230218000747.2965719-2-sstabellini@kernel.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230218000747.2965719-2-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT115:EE_|PH8PR12MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f06183-1e66-4723-196a-08db164d59b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yfOsJg0m1mDuD6gqQtpLc3H70IG2/oROE2qOjo0rUza9R2P0ibVltnGgLWYmg5SgOs2A+0iz0j4r+ueoCTsWpWuhn6JTJz4T3avCQKwkqBEEslCjbQrkt0ynu+LkwxzotN27kWiS7phrlC9Lq2Uzuwez5G43UlH7QI6JX+iNYw+o31bbpX7hL78BI0sPP2OoyJ6Fbdj4+Q5iT4bUwrd+/6cCF/f2dsk0UwzopAJqBaaQO9EMh3DHTSNEnr6SjmL1WJynH+mQ4gmIYeUEZL+hpdBmEmF5Y9dVJdV1P5AOBXmBYVWwIYo5PbjNdhyqhsv4TigHqIsNC3p7BJDsgYIuq/Js9TQ3MNmrgzSRf+Ms6iJWGuHhSKkFo7MIPAb4TAd9I3bOuLl+kzUT8KMMrjKVlVT+/1U3CHiDcE29gxJqhfkHimZxnccNFl/IaoSfTYiSfa3u1BG/kC4B5QLO1fC0k6/J8116rZgL4W5zGXaiS1fGaKvLzBGCYEs8BgSTUPXx+gu4OKvbYiKudLduYG9GqKXcuW401BAA8SGymgUwdTLbD0p/QozAsQ5AHA9DR97TQNiaj4pN1UGILyHtAz1oddumKzUdeMcDQQpi2Duv+uLuC9Dz6gYLBP1M/H96St2KrglqAeiatVDmRcG7UxQTTYR7FMHA/a6xNkzLNHHhTJw5O2DHHBHt5VX8uLciwKxTrcaqpIUxxXnq6AK0LJy5WkfEvOapWoDHyYfRd2VeahPMtdP9R8mM2+4L+XN0AcfbLv/B6OJE5pgGdkiz3iDy8w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199018)(36840700001)(40470700004)(46966006)(4744005)(2906002)(5660300002)(44832011)(36756003)(478600001)(426003)(47076005)(186003)(40480700001)(2616005)(86362001)(316002)(54906003)(26005)(356005)(36860700001)(336012)(4326008)(40460700003)(70206006)(70586007)(82740400003)(8676002)(81166007)(16576012)(8936002)(41300700001)(31696002)(82310400005)(53546011)(110136005)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 09:56:07.5659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f06183-1e66-4723-196a-08db164d59b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7303

Hi Stefano,

On 18/02/2023 01:07, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Copy the build output of Yocto builds to binaries/ for the arm32 target,
> and export binaries/ among the jobs artifacts so that they can be reused
> by other jobs.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


