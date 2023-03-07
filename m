Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6FE6AD865
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 08:46:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507225.780502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZS0P-0004VO-Rh; Tue, 07 Mar 2023 07:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507225.780502; Tue, 07 Mar 2023 07:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZS0P-0004Tg-OJ; Tue, 07 Mar 2023 07:45:05 +0000
Received: by outflank-mailman (input) for mailman id 507225;
 Tue, 07 Mar 2023 07:45:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qpp6=67=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pZS0O-0004Ta-1L
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 07:45:04 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eab::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4741325-bcbb-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 08:44:57 +0100 (CET)
Received: from MW4P223CA0027.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::32)
 by MN6PR12MB8516.namprd12.prod.outlook.com (2603:10b6:208:46f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 07:44:52 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::a8) by MW4P223CA0027.outlook.office365.com
 (2603:10b6:303:80::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Tue, 7 Mar 2023 07:44:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.16 via Frontend Transport; Tue, 7 Mar 2023 07:44:51 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 01:44:50 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Mar
 2023 23:44:50 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 01:44:49 -0600
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
X-Inumbo-ID: f4741325-bcbb-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jpgr+5OcLgl49FuFu18aMj1F/RfalqRnjgzCc3QX3NKbKOiw9BMURV34npGPX7lfo+vhOELFmySAjNerxdQnXii6UrsdDq45I0jpapTHAwSALp/AQrhcLj7HcMgREilL132SdpDByt00wbpSiM1UPdRYMehFB5AKin8PgfyOYch+5J4qgX4VE6JUbs9sqDp+ip7n7QxHw02px+azkzACJCa2HtF1GuIe83KOfW0pGA7UwzLBjhJttqK1R5b10962S3QAsmecmwM0SqInH+ECOMtB1IQNk/MPE6Kn/hZPU898n/qucmrcrW2eNdOPCe7116FQDxr0QEnW2hAm9GkELQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztUOjWmGbhgJmeyq1igx4loYPycHIc4P3v6JKMlyfso=;
 b=BbZMe7BOOwAn3P62pU3H7pNu+dIhN5u6T+eOfK/qfEXFA5TdE1hrbjhPjERF7HoklAqaOR+t3UarCAmB/kPGVpSo0nDOJr+AV571skH3KOcQ74r606qqlws1ww6TAZcUSyi5WUNnvDuPkFycaMeIfmLKOiu/TdvSups/9Edk+H0rA6zhyTOrbEOtWMkuE1h6Mm/KLni8h3YR5J1BuBnqStKL3ANF0YAw1iH0JxH47pjus2XYOrUVdHKt2UQ5YxWEBE6KooMcxnXScd0714cR5jEibtAXvFnmrLF/et8r4GpOcT2F7ZTUk0zXIuQZ0OCEVv3DwuWSYNG1j7ao/w+DOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztUOjWmGbhgJmeyq1igx4loYPycHIc4P3v6JKMlyfso=;
 b=CCRxyFrlwSHCamrsxHD0wvFqg4c/9oQemoJh7Eo6JEtTmRMP+C3w4UBWb5vIzmPPh6dpRPwqBC6nmJ99iH/NwLleH4dJ0AgX/tKOHOZS7CRSkW2szToSRTVMoRbTee2/GXM/VSSJpEnyIum/EpVSRfnulOC2xdtJ4KNe6sgmNuk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <805be02d-54ec-62e4-02ab-144b9be56880@amd.com>
Date: Tue, 7 Mar 2023 08:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] automation: introduce a dom0less test run on
 Xilinx hardware
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <cardoe@cardoe.com>, Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2303061531240.863724@ubuntu-linux-20-04-desktop>
 <20230306233310.1993693-2-sstabellini@kernel.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230306233310.1993693-2-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT031:EE_|MN6PR12MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d8a84d-d8db-40a2-88b6-08db1edfd5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vYMeursgIblYr1f05giBeil8rCk1StTIuQRhDSBwfpdcg+1yq5H61RCu2sHzs8DEFjCmr6QJs/ekQ/1EDMDfJbcIiam3lgb6fccqmMP889H/lAM4F9qf7caXkIStfGHutMhEhfnVnhsKUPqnw45rqrMKrFq68nS3kovV4i80cesJ/w1k5jiN54OSM90ntWgSSoPwYLe+KTSP1uvkysNDZmmh+x9ge1XWYBWAeGkVUbwQ6FYipiQz4rLKjO00MrpeElcFO9SCqamNxv+29FlVpHGZ4KB4SPmsMnCwhq2OuRYit9WKPhHOV/0i4vtNWpTxc5f61XUH7wphzHTrFMe9v13rIAB09/QtdPMB1Gpyl5RX1zbAzIHk2O0AZY1jE9MzqZ4b+ALWO3mKDTlSF+j7hsnyuKmoeVUSGC5SvQ6X8yj6zL2nW0nhClV1jZdkWt/VYxXPqaaaM8uiOJDFXxSX5C3FjGnm4uZuMZTmAj7FPuhzEltsavNpgqNW5sZKHFvJgam8WunP7IkvycMF8MPhG39uMNl/mJXDVg9UJ4GeFDWrupuJbM+V93LPXJblkGhvi/pEUJynBicyJgYxKUppRnmvvxKqUK2/37wHjWAvtVeQelZJyRhIy7ZxBmKBrQK6vvsvlpNk5uUvMhvxxcmo/K4ysnpA7UQpLIr33/kLwPw2X9S8PfsZHyKnevtiIZa/lGxnkXM/LK+BkdgWSIFyXku+eoq9/6ZaVWbDKFFGVjYautRY36I+tyIc7FHXG0oe57fZpcOA4IHo8kBkrq/P74i36NkUMVmq4Nr3QuIESnc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199018)(46966006)(36840700001)(40470700004)(36756003)(40460700003)(40480700001)(82740400003)(53546011)(336012)(2616005)(26005)(186003)(110136005)(16576012)(54906003)(41300700001)(8676002)(4326008)(4744005)(70206006)(70586007)(44832011)(316002)(8936002)(81166007)(478600001)(2906002)(5660300002)(31696002)(86362001)(82310400005)(356005)(426003)(47076005)(36860700001)(83380400001)(84970400001)(31686004)(32563001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 07:44:51.6952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d8a84d-d8db-40a2-88b6-08db1edfd5ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8516

Hi Stefano,

On 07/03/2023 00:33, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> The test prepares dom0 and domU binaries and boot artifacts, similarly
> to the existing QEMU test. (TBD: share preparation steps with the
> regular QEMU tests.)
> 
> However, instead of running the test inside QEMU as usual, it copies
> the binaries to the tftp server root, triggers a Xilinx ZCU102 board
> reboot, and connects to the real serial of the board.
> 
> For now and due to its novelty, allow_failure on the Xilinx hardware
> test, and only run the job on protected branches with XILINX_JOBS set to
> true (the "master" and "staging" on gitlab.com/xen-project/xen qualify).
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


