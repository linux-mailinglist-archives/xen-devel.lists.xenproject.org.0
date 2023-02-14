Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8056962A2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 12:46:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495161.765441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRtks-0006TR-PA; Tue, 14 Feb 2023 11:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495161.765441; Tue, 14 Feb 2023 11:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRtks-0006RC-M2; Tue, 14 Feb 2023 11:45:50 +0000
Received: by outflank-mailman (input) for mailman id 495161;
 Tue, 14 Feb 2023 11:45:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrib=6K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRtkq-0006R6-Tc
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 11:45:49 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e89::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bce4362-ac5d-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 12:45:43 +0100 (CET)
Received: from BN8PR03CA0023.namprd03.prod.outlook.com (2603:10b6:408:94::36)
 by SA1PR12MB6704.namprd12.prod.outlook.com (2603:10b6:806:254::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Tue, 14 Feb
 2023 11:45:38 +0000
Received: from BL02EPF0000EE3C.namprd05.prod.outlook.com
 (2603:10b6:408:94:cafe::73) by BN8PR03CA0023.outlook.office365.com
 (2603:10b6:408:94::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26 via Frontend
 Transport; Tue, 14 Feb 2023 11:45:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000EE3C.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.8 via Frontend Transport; Tue, 14 Feb 2023 11:45:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 05:45:37 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 14 Feb 2023 05:45:36 -0600
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
X-Inumbo-ID: 1bce4362-ac5d-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtYbk6SKuPuNRGFYr3Eww207IX4Bx8LDR0lESJdO4BLpw3wkLwELjP31BWKDE969RM6RH/Xxh8G9n/fG1b9AzLhOenm4jHpJe2Fn2PA+iKd7lFKBH1vHqU4kbZA7uF2a23Bue7QMk2p1Wr1hjvKvhnZB24sGPW/qer5SCnNVcL9W62PUTRzXL+cRavhSMlC845KYmY3xLRsFHv+QW9c+RuugwLbHUYU+LW0D6Ulu4PaXcPrktty5ZEv9XnlvpZ6hYFvVG33LLSMcVj7o3sLwuOcIWTsAz6ct0ITV51obKnRQ1FsscN4hhto/M8iSVBsdVMpejDUsvpe3wp9zYKKWZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYDc+mUefrW5wVVo1lGmP39AeBi87Kp9+9ZCKAA3JnM=;
 b=E5kYEutvtDjAyIMwqIB3FlHmlich9NCDQ6G3E+0X3Q4GiJMjS+H1OB7PaG4JheB2TLL9P31UQlWP7GZlsLeyeEDNGxVa/9Ce0q1UQ4CDTH5jdBa8721dBtI28Lh82mBTgmN1f5yYKAqyKZ9O/Y2PcGLB9I3gfy8uxbI7jR2eoJV878Vxhn/MzCkRtYQWAfoFoVSb/1eJVNBMmgvkwXD3VA4PzmCZrMkBMGO8uOVFuLSdWOX/UY2HsVjIig1tHBCYG381ZdWuGQo5BqsxZlAFu2IEC1tk8t5MnZAe7SgrL5U4RIs1TYp6Gz0kNaTubwaW7Rrp31Nn/jDqYGX7Guef9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYDc+mUefrW5wVVo1lGmP39AeBi87Kp9+9ZCKAA3JnM=;
 b=12xxZlsMd+Rm53KOWDVwfXE7q1J+r069K94etKTqbXeq4D/UpS6nXgSnPYq92ZsjczybVwURxIZfT05wTKYTQWt50BLs494Yhew6w3bBgfSzv29vutGQ4VUkFPktH5eQqcRpplz4kO6bGbam3wUcwxqwcqZUFgGzPZIAEoXgWDE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a9102f8a-2bb9-48fc-ffa2-96d86610a002@amd.com>
Date: Tue, 14 Feb 2023 12:45:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] automation: Add container and build jobs to run cppcheck
 analysis
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20230213142312.11806-1-michal.orzel@amd.com>
 <a4ec0f27-4f66-def7-bf76-74d9777671a2@citrix.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <a4ec0f27-4f66-def7-bf76-74d9777671a2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3C:EE_|SA1PR12MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e146086-975c-4c52-dd71-08db0e80fdc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WApPMhugPnbn+Yw94iLDx4DBjZ/yN6ECMqZgdKTs6Nfx2rGULepnk+0dsQP52SV1rnXRLDvxuwhIMhm5eVEpn9+f/11itLMrTMEqBDicZMyDWTkVbhGmOz+ir30mX95ItsCujreoYi00PEkJYdTopjfBVVTA2TAVx5FRl329Equ2Ae6bpbQyg11ZLfaMNdNAobJ4TJgRp37uPZVdXy041r8/MGvJqU8EPkkbiRSLjve45M6p7QzAeH699/oC5rwSUltEzxNRbDznkSFxmkXWWHmpJXlNNdxoy/T51FoMjPQXK1YmhpPlk4cgNSlH8BRACQWIBYCgF6xI0U0FKkNz0jqqgAyPoRXvtwd8JnQiB5e8tnyvzDZYbBIfPKnulttZThwW06m0w3ooUiLG5vkRVv+OSdkHPLV2zs1lnESg9Bh2B1bdt4DInYjbWaHgtcMdUyddqKgzWPoJ9eM8USzluW7n1N9pZvauLgchpSDaA5boS7367RNz4+OYAwbe8pXYR72w7dZHc96YtDNC0bmw+ZBBJcULvOb+YVMpeDWLuIVGuBIYNQNSnw5GtGWFTn4YOdwZteTrZv1hqLwfn9loyR8hJjxq+vgXyVrexC1jQppVYeR5Fz38Kkwlmfp3NcAGQVPGerjGGQsNG+inhxOP6DKcPXxoBWHgMl6+bmQ49Npndqz5ZqZPdq0eKfVmvwALauZbNihcWSs3BBSJOTwl1PslfDH0EHGQ0zu3OP2HoXOxOF5GWOOtg1BFV2v0VG3+
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(5660300002)(41300700001)(44832011)(31686004)(2906002)(70586007)(4326008)(70206006)(8676002)(8936002)(54906003)(16576012)(110136005)(40480700001)(316002)(53546011)(26005)(966005)(36756003)(478600001)(186003)(40460700003)(2616005)(336012)(426003)(47076005)(36860700001)(82740400003)(81166007)(31696002)(356005)(86362001)(82310400005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 11:45:37.9056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e146086-975c-4c52-dd71-08db0e80fdc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000EE3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6704

Hi Andrew,

On 14/02/2023 12:00, Andrew Cooper wrote:
> 
> 
> On 13/02/2023 2:23 pm, Michal Orzel wrote:
>> Add a debian container with cppcheck installation routine inside,
>> capable of performing cppcheck analysis on Xen-only build including
>> cross-builds for arm32 and arm64.
>>
>> Populate build jobs making use of that container to run cppcheck
>> analysis to produce a text report (xen-cppcheck.txt) containing the list
>> of all the findings.
>>
>> This patch does not aim at performing any sort of bisection. Cppcheck is
>> imperfect and for now, our goal is to at least be aware of its reports,
>> so that we can compare them with the ones produced by better tools and
>> to be able to see how these reports change as a result of further
>> infrastructure improvements (e.g. exception list, rules exclusion).
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> For those interested in, here is a sample pipeline:
>> https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/775769167
>> ---
>>  .../build/debian/unstable-cppcheck.dockerfile | 37 +++++++++++++++++
>>  automation/gitlab-ci/build.yaml               | 40 +++++++++++++++++++
>>  automation/scripts/build                      | 11 ++++-
> 
> I'm afraid that I'm going to start pushing back on any more x86 jobs.
> 
> We're already at several hours to get a run out of Gitlab CI, and that's
> assuming none of them hit networking issues, and outside of the typical
> European working day, when patchew is busy churning and not reporting
> the status back.
> 
> Right now, there is vastly more ARM test resource than x86 resource, as
> evidence by the fact that you're never waiting more than a few minutes
> for the actually-ARM tests to complete, so adding more x86 cross
> compiles is compounding the problem.
> 
> We need less x86 testing, or more x86 resource.  Probably both, because
> its now so long that even I'm not using it as a pre-push gate on all
> changes.

I'm aware of the problem you described. AFAICT there is nothing stopping us
from switching completely the arm32 cross builds from x86 to arm64 container.
It is just a matter of creating identical container to unstable-arm32-gcc
e.g. unstable-arm64v8-arm32-gcc and using FROM arm64v8/debian:unstable.
We need to keep the old container for backwards compatibility.

This way, x86 runners will only do x86 stuff + riscv64.

Are you aware of anything preventing us to do so?
If not, I will push a prereq patch to switch the arm32 cross build to arm64.

> 
> ~Andrew

~Michal

