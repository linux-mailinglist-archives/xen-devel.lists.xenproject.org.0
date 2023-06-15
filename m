Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA33E730CFF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 04:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549383.857879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9cJK-0006zH-V9; Thu, 15 Jun 2023 02:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549383.857879; Thu, 15 Jun 2023 02:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9cJK-0006wy-Rv; Thu, 15 Jun 2023 02:02:06 +0000
Received: by outflank-mailman (input) for mailman id 549383;
 Thu, 15 Jun 2023 02:02:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lj72=CD=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q9cJJ-0006ws-Ik
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 02:02:05 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e023d02-0b20-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 04:02:02 +0200 (CEST)
Received: from BN9PR03CA0631.namprd03.prod.outlook.com (2603:10b6:408:13b::6)
 by DM6PR12MB4481.namprd12.prod.outlook.com (2603:10b6:5:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 02:01:58 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::cf) by BN9PR03CA0631.outlook.office365.com
 (2603:10b6:408:13b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37 via Frontend
 Transport; Thu, 15 Jun 2023 02:01:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.25 via Frontend Transport; Thu, 15 Jun 2023 02:01:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 21:01:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 21:01:56 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Wed, 14 Jun 2023 21:01:54 -0500
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
X-Inumbo-ID: 9e023d02-0b20-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2rBWYYjK+FOxaQsrPMdlWvXbrqqxmFk7vnAEN4W9epbAfioT9H0CpZeRxYEMJ+jyvxYOhnNSiJHC6UzmINY4GaWvdi0ithFZFzVgwV8neSHZc1yP3Cr79+SHoAYMA/QsQhN3YNEfyLoL2YBVTzaWQUaZyesy1NTlSS3CPICIH55oItK1BgLPJ3MUS0V/YTfxq2x857TsAYTEgXZpLMVc9TVPOvbCSmhD9zz2zUUythl3xAT7OCtCjAugcRZj76qXn4NPoq3YD0RBIL6CsjuwZOaXaR4FZ4hOo1I07QIZaTJ6KjjT5cpfRME+RYAiYXLr6KZstAcZNNGcmbtVK0UZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQQWy7sJmF9RXCsAbdqLi3mUeB6gRol/H/7B7f/gaTk=;
 b=OgKaye5wV2vtkooXnEpKnraPyt14vfvTck2yxtIfb4yedMgOIuUkrN73dmFI0U3s/fXzl3AfXH2ZaguPI9mLozoqXUb+fB9NuT1KgwCh+6/V2lTdtwxVr3Ccf8Hpmw5/3DQErrluh7Q5HpM1vCE8OaD9x4sNo1vEQkYznqdptlfdEtISthNBSC9lqI14HIM1XUyd7k4lKDkKWEIM6WjDmtmpnItUmL5edfUjfz0XxkhN2LQuPY576CBKGxpHY44tbM7m9J8SYPWNCJvs3ohb2h49/V8uy2MAPmcBO3j+BAbmlrMrDp8zxJ6zFjF9/Mr+mZuLefJVce5s/AJv+WuHkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQQWy7sJmF9RXCsAbdqLi3mUeB6gRol/H/7B7f/gaTk=;
 b=VPJZouB+DhPxV8W4U2fbmw4YqZSoVl6lsjqHN7EXJOAd7BL7uZ2uJ3ekAN8Y9m/D/TE19svb+g85nbtBX/mazm4Kft6t6+Yed+KmYxT2KCpg8n6ilE+1Nl2HhBxZIIprfs3nQ/M2SkaGitBGUMH9Bf8ok20KRJ7bm47IQq7pM2s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <fcde45a6-9da8-4dfd-83cc-cd03e05a68bd@amd.com>
Date: Wed, 14 Jun 2023 22:01:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 00/12] PCI devices passthrough on Arm, part 3
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT011:EE_|DM6PR12MB4481:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b2f29f-6fec-4d76-00d8-08db6d447fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ogfg/n22qhpHCkXfy9OKn8tnPVsViAThBH+ubdgiLRsHV3B5I9h4IXG0ujSaqCsGQwY+fMxHX046WCjX6og/uMUmhVCT4oJZhGlgmizLvBuS0Doq84e7LdLoRwZkJw6xfXpp5euO7S0OEazPF737ue+aDp85fyq1UuuAJ9slFJz8UtJuJRoKbzf4kt5kgQf8HU1pV7lTDPk2OFI00niPuf0PVANhwLaPxnhbg2VlvjuGiKQCEc4yZYWotx7zNiGw463+QF2D3PhpIK/PqJBNX2IzMtmObpfg9XP65dcLJYRc+uOCm2rIgnb+Qy0T8QjvN8wHj+kCP4eSR/iyE9OHFvd80NPeiTKnJgo3wamxiTBMVBdlGXcxi6Ol9f9iVHrgp39Txl2KKUzJ+uIgSyOifNxrPGLU/B3a/lAJmpEl+LXnv/3yBPSGlQbcL7MTWN3eTsGf16RcXl+mnf31vIfVtglhLNT/AzwYFEYU8YykQWK7tmSAjECKO+6bNrdWJCJN2WQtJCAZOf8JcyTMrfI5SIHEDCfwjNpcBIvzPw0uy+K1KCRag6sKyLgQC7jOjZ2PlN47es2gFImBBwLjp72PO0PZx+r6qFxH6EqZ3zwWptgC4BkWXQyAajTUycBB1Vh5ekm5CcrxetKY06FIaZIhBqAvDe6tk9CUdGcHQ1Vf+DNWMrvz4fmASdJtFbO3F/RzMhHEHH/omtlRbeqNq2RAQpXcpmUaFU030wK2p38ecXTvxCwG7FXDXaLSriviu0upaITxuEEnYCY0LVX00Mx/iyPOfwWR29jefOen2t/94+vNDVW67Qq0WenKPUP8RiqfaUdqJK/2/s7L/9ZpaFsrHQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199021)(36840700001)(46966006)(40470700004)(5660300002)(83380400001)(426003)(336012)(186003)(40480700001)(44832011)(2906002)(31686004)(4744005)(47076005)(2616005)(7416002)(966005)(36860700001)(41300700001)(8936002)(26005)(40460700003)(8676002)(31696002)(316002)(110136005)(54906003)(53546011)(6666004)(82740400003)(36756003)(478600001)(81166007)(356005)(82310400005)(4326008)(86362001)(70586007)(70206006)(16576012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 02:01:57.3335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b2f29f-6fec-4d76-00d8-08db6d447fe0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4481

On 6/13/23 06:32, Volodymyr Babchuk wrote:
> Hello,
> 
> This is another another version of vPCI rework (previous one can be
> found at [1]). The biggest change is how vPCI locking is done. This
> series uses per-domain vPCI rwlock.
> 
> Note that this series does not include my work on reference counting
> for PCI devices because this counting does not resolve isses we are
> having for vPCI. While it is (maybe) nice to have PCI refcounting, it
> does not moves us towards PCI on ARM.
> 
> 
> [1] https://lore.kernel.org/all/20220204063459.680961-1-andr2000@gmail.com/

Thanks for sending this!

Should this be v8? I see v7 at [2].

I had to rewind my xen.git back to 67c28bfc5245 for this series to apply cleanly (just before ee045f3a4a6d "vpci/header: cope with devices not having vpci allocated").

[2] https://lists.xenproject.org/archives/html/xen-devel/2022-07/msg01127.html

