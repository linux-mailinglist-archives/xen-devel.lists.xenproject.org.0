Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E309609D7F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 11:08:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428771.679252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omtQw-00047E-9z; Mon, 24 Oct 2022 09:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428771.679252; Mon, 24 Oct 2022 09:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omtQw-00045R-5n; Mon, 24 Oct 2022 09:07:46 +0000
Received: by outflank-mailman (input) for mailman id 428771;
 Mon, 24 Oct 2022 09:07:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdD1=2Z=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1omtQv-00045L-Ds
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 09:07:45 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50ff264c-537b-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 11:07:43 +0200 (CEST)
Received: from DS7P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::30) by
 DM4PR12MB5167.namprd12.prod.outlook.com (2603:10b6:5:396::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.21; Mon, 24 Oct 2022 09:07:40 +0000
Received: from DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::bc) by DS7P222CA0002.outlook.office365.com
 (2603:10b6:8:2e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Mon, 24 Oct 2022 09:07:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT096.mail.protection.outlook.com (10.13.173.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 09:07:39 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 04:07:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 02:07:38 -0700
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 24 Oct 2022 04:07:37 -0500
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
X-Inumbo-ID: 50ff264c-537b-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmZOscGbt+jv7+pEHaJV3IbGvIHSYmTLIfQT23tLK3+gNDT1+wDUMfhXoKOdQTaRTzwLe20xNLH3EEVQGH6ZAZ+kA/bk8Tmsruv4nVql+Y1x7sBZJ81sKf/IveXGBaACkaBHvb1ZTc1Ylji+QPC1MfG36J/5/A1P4xhiM3mABc1GCxbIcmX5I6nMg8f1W5bqxIb6r0Q4yMTeXoTDduzQ24kTKQgivdWol13tlv9QwGBeLjzpQf3kx6sL+PowtyHwXHGdgYzpJno9ynjdeKVm4DhMJuJSYsc3Hlo4P6jh6zV8K17kIjTBSVXRCz0Oxz/iCOLedo2hpj6xorRot32spg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yccG669GhBoAImAUDk8VGKK0cfD0e+yrcyvnxEv50Dg=;
 b=WkRMBY1f7YPqbZQ/LddcjzcoDrHGBFqGKq/kIcZcKj6FP4Sy9bm90R5poKdF1A+cy54YyabIsEujEJX4Zd720JsRpwHPWfdVZ/K1kVU6lqgQQXMOLpvR2vQlBbhx9/wV3CSvI4SeVcAClp3iM8E1UTEr3Axh1fbUgwLqMVMRWHM/67HncNCOMe9dI8PFVGUQwXedKAb7uDIsaM8NMZKJieoDmPFT5AOgDajnCau7MQ3r3N0RDJjY6oWUH9nED34GILZI46zqsQvLGo6f++qwn2+WgoC1My9WJSBMTuDgwx0lJ65ieBJvGbXKV5g1PB0CnsWjJCXZrilLhhv/wnKEzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yccG669GhBoAImAUDk8VGKK0cfD0e+yrcyvnxEv50Dg=;
 b=XudA72pLwTb5BONcISPGQtumTnieTmTUsnNgYNC7mDULyL6GJKuxoWdKzjqbv5arEaJKQbj6mzRjJC2KpacW4W8w4RbJZZdg4eusQPPAyCl6vrdvxLNoMfu3TpnrYKnAlIhnAUopDavEnYF4PD6ipRyDd5CapFaYqXhamdbU6iI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com>
Date: Mon, 24 Oct 2022 11:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
Subject: Deadcode discussion based on Arm NS phys timer
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT096:EE_|DM4PR12MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: c24b9fc0-f9ec-4b53-6071-08dab59f33c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AbU228Xwl0Usw1ZCnJqyjFdbpAUEUkLU4coe6POShLESrXJSQmwP0/yfua78HEMLecjgtScQ0jhsa4BsM3WOlF6GQjzbuIbthi7SF+W1QUFT76ZQehCAHW55dvss7qc+3WCaIxpgdrCkvEIkvoFUpZH/0tBWr1WyBOV3jsN/C5EVEjMMobYS7bJbbJxcigclwnJwxmZnqK6qBnsBn/bsIltYJKR1842Zy58LyV3ScdyvK4NGLccxNq/g1DilQO2lspkYEQSQ8NAdyOJtttbXEz4rqaApYj/+R3fF9k7IdlCqLjc/w/AFchvc9M43QksOgyqBZtsz3RZBiRxABc4Q7huKI6eV72Dmb5WZ5YJ2IUrqFPLBIqY4UU2hXICJKTd/8aeYDZkpFO88MWAJeDYyRGO4exsvqD3GByOyyReFkQIEXYboBX9SRVUgOCj8ae6tXCNavRXSHQjLlG2UrjC/OrKlu4fi9nAgKLmH+CHbfWblLXwfG3+36188zJnsivPV598U/JSYnvjco/suoTO9qukwr9UKfrfnsuzahl5UQSaoplL5RPr4ciSyLupYRWQ1+LeLiNu45rfzhVAO0aTZXiJxDlUhnfmGlQcTMxsu/f528v4nJuALVWYIRwjpqWmTLVardSZqpGOEVWu+Sb2H+y27sxTKWqa4aPGhuu9YhAupbjDBXqv36wcaOc28K3CJrjSxXnqf56y7Jb5qiocNPZCqUVQtl+4gwyFwKuPHQez/flqrSH50a3SvxO+5GwfWQmuA6pR9JUQcuJvp3tugzqYwJhU4k/EK4iWLQ/r5+6bvhbCtlFDbrH5F1XTdxPX/LJRt2ajLS6FuGuz9gPW6kA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(8936002)(16576012)(316002)(54906003)(36860700001)(426003)(6916009)(47076005)(40480700001)(70206006)(2616005)(186003)(2906002)(5660300002)(44832011)(8676002)(4326008)(40460700003)(336012)(70586007)(86362001)(31696002)(83380400001)(36756003)(26005)(41300700001)(478600001)(82740400003)(81166007)(66899015)(82310400005)(31686004)(356005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 09:07:39.8525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c24b9fc0-f9ec-4b53-6071-08dab59f33c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5167

Hello,

Recently I came across a deadcode in Xen Arm arch timer code. Briefly speaking, we are routing
the NS phys timer (CNTP) IRQ to Xen, even though Xen does not make use of it (as it uses the hypervisor timer CNTHP).
This timer is fully emulated, which means that there is nothing that can trigger such IRQ. This code is
a left over from early days, where the CNTHP was buggy on some models and we had to use the CNTP instead.

As far as the problem itself is not really interesting, it raises a question of what to do with a deadcode,
as there might be/are other deadcode places in Xen. One may say that it is useful to keep it, because one day,
someone might need it when dealing with yet another broken HW. Such person would still need to modify the other
part of the code (e.g. reprogram_timer), but there would be less work required overall. Personally, I'm not in favor of
such approach, because we should not really support possible scenarios with broken HW (except for erratas listing known issues).
Also, as part of the certification/FUSA process, there should be no deadcode and we should have explanation for every block of code.

There are different ways to deal with a deadcode:
1. Get rid of it completely
2. Leave it as it is
3. Admit that it can be useful one day and:
  3.1. protect it with #if 0
  3.2. protect it with a new Kconfig option (disabled by default) using #ifdef
  3.3. protect it with a new Kconfig option (disabled by default) using IS_ENABLED (to make sure code always compile)
  3.4. protect it with a command line option (allowing to choose the timer to be used by Xen)
...

Let me know what you think.

~Michal

