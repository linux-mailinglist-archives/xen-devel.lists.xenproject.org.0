Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEA174A888
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 03:42:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560125.875770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHaTt-0000NK-5e; Fri, 07 Jul 2023 01:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560125.875770; Fri, 07 Jul 2023 01:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHaTt-0000L3-14; Fri, 07 Jul 2023 01:41:57 +0000
Received: by outflank-mailman (input) for mailman id 560125;
 Fri, 07 Jul 2023 01:41:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=40UB=CZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qHaTr-0000Kx-9U
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 01:41:55 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72453590-1c67-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 03:41:53 +0200 (CEST)
Received: from MW4PR03CA0314.namprd03.prod.outlook.com (2603:10b6:303:dd::19)
 by SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Fri, 7 Jul
 2023 01:41:49 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::16) by MW4PR03CA0314.outlook.office365.com
 (2603:10b6:303:dd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24 via Frontend
 Transport; Fri, 7 Jul 2023 01:41:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Fri, 7 Jul 2023 01:41:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Jul
 2023 20:41:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Jul
 2023 20:41:47 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 6 Jul 2023 20:41:46 -0500
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
X-Inumbo-ID: 72453590-1c67-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HP937TCENkxaD7CXTedAu74VM0GzWObrFJWFkNesG+t0SiivCRRZ2zeVbycDIHZc7cTKoiobKjfqSFVf/lSBTuulQFTcYSzbgZQGPhhOJ3d6qiBGXlmCoXwjF/UisykbyvgmCZ+22QpxMPRHlYwgTIEZ1LutiTCkIQv2Gk72uU+xPd2hwbEIK7Y1OU0yRVIwEaMV7872wwhzzd0ZB8SDXxrY1Thuw0089yPIhz5fVNp5zlEGFMIkyQ5N9dO7tKkxhXaV1uJjJnq871Sk9yrqDpWjrWwMhQY73aHgGtf31GMcfI1/dqMaJwh35LqRcmWEUpIyY8VWIj0GZh4gILwgsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRVFESTWrB4pDmbWOURdcCtibQWmV9LAbZT42t5XQZ0=;
 b=gp4qy8eKzHzjSV4SFuiTDaqneb2M/etdcGXnBDYFkiCdOGVnwzCd72oLwilpY85ZlNuvRzEL3+iZl5u74i9VDUphv5KzQRtObf+9dgOKIx2pBg262TaoUMSUrdX8jjX7D4l9rygcjAJUbCogoHkgT96/3VzV1tM8IjuNTCpZsmquBrhBGt3aAIHzEYZ6wX/x+L41ZlGftoj2HpZDjJ1FOOHKxtUpmVRFErDxr9j1YPjT31IUyKVBTy1UNaac0+DfIo3rIVGYJJPM2yoV68BBAxR6+WpJrZ5cft/441/CAs7xVf5XL3svPwwLlXfyUEFiR64UGbX+uNtRRvpVjvZKmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRVFESTWrB4pDmbWOURdcCtibQWmV9LAbZT42t5XQZ0=;
 b=AwDPPrkMEVvAx0ihc+p88ZbaaF9hqWXmsCwAo6oaWZXHohBaPWRWPFO5rAETZX/PKJUBddzxcXCa01JqzA6k22VerixLG9ywjjXWWzzz9hFkfJ4hvCxuUGzJGnY00TWvxgWj+4KAgQCbKo+t2GUOzBV4SqzM7pwznfpXY9bQBFE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d166447c-46af-79f6-87d9-7e8e922e5218@amd.com>
Date: Thu, 6 Jul 2023 21:41:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 1/2] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig
 option
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Artem Mygaiev <artem_mygaiev@epam.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
References: <20230620152924.23622-1-stewart.hildebrand@amd.com>
 <a5ef5d8d-5dd1-a535-77ec-458e1559a083@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <a5ef5d8d-5dd1-a535-77ec-458e1559a083@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|SJ2PR12MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ec5903-0118-4e0e-15ac-08db7e8b547c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vwnjd2D2fX4KxrNneIVm2+FwrlXF36bzF5c8ri7FQoxmPld6I5L+yTaLnTbmd8cWbjN8QbhvlWowZer5cecLe1Ksw3uPu3saRaeuakwIgjl0Vg5QLNw5y5zvrgXkYziLXRdQf+L7SLJxn+lfRYfiXBHm81J0Fs+4VxWwGcC2TR/1QtEIhqpxbJcDWql5gNrgSTDGGEX3HjAlHJ+9KvBk/mantA1WwZtUjJLpEael1yUn3uIub4m4NKR+NP+vtVE1q6+6lLv3AusEmO+cb4EZiCJ45/tcpJoNHJoUGLs94MqEgHbOhCA2SES/jfiiy+eOKXF7H73+V/XgCmFhbtbIUrvT0qS1Fjk7Q7maYB6gsi763MAy2d6vOU4jFO7+F4caH5QLrZ5P96Bkgz58/pmZnV0QqGj+Nb+d7+EC8SXSJTtTc0cbvwypouwGCvGmqRqZ+3fTMHiPBIR/KLcQROpnuEm3SyVJzP9GF94JI8p5D/UBRM9QzDrR1H6tOjjvSNJogs7U+QW0hwVqsI9ztFnqdCuMaNFeLCq65CYLG2+c23BdADxd7I1AcSQLEdOU3fv1r2Zvp4MwebLxK7PLdlhq2zF9hqVjFVT56z+cjvhtInIrnGWjFRo3R1PJwpL2SNgi7oUvLdLvg+TkYFOrFRWfDGVAkm8XwRs/KK5jaoafsps8vJrc4aMW0GaEjvfDE2g/rWAyVwAdaaYQParvU97gdiRPKaroxB3TVzb0xreFMFCQSAxWMRI+SiWrK8AnA/K7ym8nAcIgpWZhNvOblHXQEbqsHqAX3mw7Cs5qYrneOYwI3+sVFJdA2/5zq91amVjHXqCaH/fAV3VHtt9fzd0G6w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(356005)(31686004)(478600001)(16576012)(54906003)(110136005)(36860700001)(47076005)(336012)(2616005)(426003)(86362001)(40460700003)(36756003)(31696002)(40480700001)(2906002)(70206006)(82310400005)(53546011)(26005)(186003)(70586007)(966005)(82740400003)(316002)(81166007)(41300700001)(4326008)(8676002)(8936002)(5660300002)(44832011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 01:41:48.4310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ec5903-0118-4e0e-15ac-08db7e8b547c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8690

On 6/25/23 08:51, Julien Grall wrote:
> Hi,
> 
> On 20/06/2023 16:29, Stewart Hildebrand wrote:
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> Setting CONFIG_PCI_PASSTHROUGH=y will enable PCI passthrough on ARM, even though
>> the feature is not yet complete in the current upstream codebase. The purpose of
>> this is to make it easier to enable the necessary configs (HAS_PCI, HAS_VPCI) for
>> testing and development of PCI passthrough on ARM.
>>
>> Since PCI passthrough on ARM is still work in progress at this time, make it
>> depend on UNSUPPORTED.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>> (cherry picked from commit 9a08f1f7ce28ec619640ba9ce11018bf443e9a0e from the
>>   downstream branch [1])
>>
>> Changes from downstream to v1:
>> * depends on ARM_64 (Stefano)
>> * Don't select HAS_VPCI_GUEST_SUPPORT since this config option is not currently
>>    used in the upstream codebase. This will want to be re-added here once the
>>    vpci series [2] is merged.
>> * Don't select ARM_SMMU_V3 since this option can already be selected
>>    independently. While PCI passthrough on ARM depends on an SMMU, it does not
>>    depend on a particular version or variant of an SMMU.
>> * Don't select HAS_ITS since this option can already be selected independently.
>>    HAS_ITS may want to be added here once the MSI series [1] is merged.
>> * Don't select LATE_HWDOM since this option is unrelated to PCI passthrough.
>>
>> [1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commits/poc/pci-passthrough
>> [2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00863.html
>> ---
>>   xen/arch/arm/Kconfig | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 61e581b8c2b0..3d22cd26a68c 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -184,6 +184,15 @@ config STATIC_SHM
>>       help
>>         This option enables statically shared memory on a dom0less system.
>>
>> +config PCI_PASSTHROUGH
>> +     bool "PCI passthrough on ARM (UNSUPPORTED)" if UNSUPPORTED
> 
> The series is already under an Arm category. So I would drop "ARM" here.

OK

> NIT: Also, I think it should be EXPERT rather than UNSUPPORTED. I view
> the former as in more "experimental" than the latter.

OK

>> +     depends on ARM_64
>> +     select HAS_PCI
>> +     select HAS_VPCI
>> +     default n
>> +     help
>> +       PCI device passthrough on ARM (UNSUPPORTED)
> 
> Same.

OK

